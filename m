Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3966067D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 10:37:09 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aDVAr-00063H-F3 from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Dec 2015 02:37:09 -0800
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Mon, 28 Dec 2015 10:36:45 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Dec 2015 15:36:36 +0500
Message-ID: <1451298996-4688-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [fido][PATCH] bitbake: toaster: Rework mimetype guessing to fix artifact downloads
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Dec 2015 10:37:10 -0000
Content-Type: text/plain

From: Elliot Smith <elliot.smith@intel.com>

Artifact download links were broken because the function to
get the mimetype for the artifact was incorrectly using the
underlying mimetype library. The function was also attached
to the build environment controller, which was unnecessary, as
we only support local controllers anyway.

Remove the mimetype getter on the build environment and
use the one in the view code instead. This prevents the download error
from occurring.

(Backport of dd957fe0f261db6481882fee0413f459425000c2 and
dd957fe0f261db6481882fee0413f459425000c2 from master to Yocto 1.8)

[YOCTO #8472]

(Bitbake rev: b09966906ef054834f0b465f0c5a2a937b4c4a4c)

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/toaster/bldcontrol/models.py | 34 --------------------------------
 bitbake/lib/toaster/toastergui/views.py  | 18 ++++++++++++++++-
 2 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/bitbake/lib/toaster/bldcontrol/models.py b/bitbake/lib/toaster/bldcontrol/models.py
index 02cfaf7..770ce40 100644
--- a/bitbake/lib/toaster/bldcontrol/models.py
+++ b/bitbake/lib/toaster/bldcontrol/models.py
@@ -39,40 +39,6 @@ class BuildEnvironment(models.Model):
     created     = models.DateTimeField(auto_now_add = True)
     updated     = models.DateTimeField(auto_now = True)
 
-
-    def get_artifact_type(self, path):
-        if self.betype == BuildEnvironment.TYPE_LOCAL:
-            try:
-                import magic
-
-                # fair warning: this is a mess; there are multiple competeing and incompatible
-                # magic modules floating around, so we try some of the most common combinations
-
-                try:    # we try ubuntu's python-magic 5.4
-                    m = magic.open(magic.MAGIC_MIME_TYPE)
-                    m.load()
-                    return m.file(path)
-                except AttributeError:
-                    pass
-
-                try:    # we try python-magic 0.4.6
-                    m = magic.Magic(magic.MAGIC_MIME)
-                    return m.from_file(path)
-                except AttributeError:
-                    pass
-
-                try:    # we try pip filemagic 1.6
-                    m = magic.Magic(flags=magic.MAGIC_MIME_TYPE)
-                    return m.id_filename(path)
-                except AttributeError:
-                    pass
-
-                return "binary/octet-stream"
-            except ImportError:
-                return "binary/octet-stream"
-        raise Exception("FIXME: artifact type not implemented for build environment type %s" % be.get_betype_display())
-
-
     def get_artifact(self, path):
         if self.betype == BuildEnvironment.TYPE_LOCAL:
             return open(path, "r")
diff --git a/bitbake/lib/toaster/toastergui/views.py b/bitbake/lib/toaster/toastergui/views.py
index be59c83..98b040e 100755
--- a/bitbake/lib/toaster/toastergui/views.py
+++ b/bitbake/lib/toaster/toastergui/views.py
@@ -39,6 +39,22 @@ from datetime import timedelta, datetime, date
 from django.utils import formats
 from toastergui.templatetags.projecttags import json as jsonfilter
 import json
+import mimetypes
+
+class MimeTypeFinder(object):
+    # setting this to False enables additional non-standard mimetypes
+    # to be included in the guess
+    _strict = False
+
+    # returns the mimetype for a file path as a string,
+    # or 'application/octet-stream' if the type couldn't be guessed
+    @classmethod
+    def get_mimetype(self, path):
+        guess = mimetypes.guess_type(path, self._strict)
+        guessed_type = guess[0]
+        if guessed_type == None:
+            guessed_type = 'application/octet-stream'
+        return guessed_type
 
 # all new sessions should come through the landing page;
 # determine in which mode we are running in, and redirect appropriately
@@ -3209,7 +3225,7 @@ if toastermain.settings.MANAGED:
             if file_name is None:
                 raise Exception("Could not handle artifact %s id %s" % (artifact_type, artifact_id))
             else:
-                content_type = b.buildrequest.environment.get_artifact_type(file_name)
+                content_type = MimeTypeFinder.get_mimetype(file_name)
                 fsock = b.buildrequest.environment.get_artifact(file_name)
                 file_name = os.path.basename(file_name) # we assume that the build environment system has the same path conventions as host
 
-- 
1.9.1


