Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B1EFD6072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 10:38:59 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aDVCe-0006fm-G5 from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Dec 2015 02:39:00 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.44]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Mon, 28 Dec 2015 10:38:59 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [fido][PATCH] bitbake: toaster: Rework mimetype
	guessing	to fix artifact downloads
Thread-Index: AQHRQVvEa8okHNfHRUCEp+SrReEfZ57gNO3s
Date: Mon, 28 Dec 2015 10:38:58 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FB6E1F7@EU-MBX-02.mgc.mentorg.com>
References: <1451298996-4688-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1451298996-4688-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [fido][PATCH] bitbake: toaster: Rework mimetype guessing	to fix artifact downloads
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
X-List-Received-Date: Mon, 28 Dec 2015 10:38:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please disregard this. I forgot to commit mistakenly before generating the =
patch.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Monday, December 28, 2015 3:36 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [fido][PATCH] bitbake: toaster: Rework mimetype guessing=
     to fix artifact downloads=0A=
=0A=
From: Elliot Smith <elliot.smith@intel.com>=0A=
=0A=
Artifact download links were broken because the function to=0A=
get the mimetype for the artifact was incorrectly using the=0A=
underlying mimetype library. The function was also attached=0A=
to the build environment controller, which was unnecessary, as=0A=
we only support local controllers anyway.=0A=
=0A=
Remove the mimetype getter on the build environment and=0A=
use the one in the view code instead. This prevents the download error=0A=
from occurring.=0A=
=0A=
(Backport of dd957fe0f261db6481882fee0413f459425000c2 and=0A=
dd957fe0f261db6481882fee0413f459425000c2 from master to Yocto 1.8)=0A=
=0A=
[YOCTO #8472]=0A=
=0A=
(Bitbake rev: b09966906ef054834f0b465f0c5a2a937b4c4a4c)=0A=
=0A=
Signed-off-by: Elliot Smith <elliot.smith@intel.com>=0A=
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>=0A=
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
---=0A=
 bitbake/lib/toaster/bldcontrol/models.py | 34 ----------------------------=
----=0A=
 bitbake/lib/toaster/toastergui/views.py  | 18 ++++++++++++++++-=0A=
 2 files changed, 17 insertions(+), 35 deletions(-)=0A=
=0A=
diff --git a/bitbake/lib/toaster/bldcontrol/models.py b/bitbake/lib/toaster=
/bldcontrol/models.py=0A=
index 02cfaf7..770ce40 100644=0A=
--- a/bitbake/lib/toaster/bldcontrol/models.py=0A=
+++ b/bitbake/lib/toaster/bldcontrol/models.py=0A=
@@ -39,40 +39,6 @@ class BuildEnvironment(models.Model):=0A=
     created     =3D models.DateTimeField(auto_now_add =3D True)=0A=
     updated     =3D models.DateTimeField(auto_now =3D True)=0A=
=0A=
-=0A=
-    def get_artifact_type(self, path):=0A=
-        if self.betype =3D=3D BuildEnvironment.TYPE_LOCAL:=0A=
-            try:=0A=
-                import magic=0A=
-=0A=
-                # fair warning: this is a mess; there are multiple compete=
ing and incompatible=0A=
-                # magic modules floating around, so we try some of the mos=
t common combinations=0A=
-=0A=
-                try:    # we try ubuntu's python-magic 5.4=0A=
-                    m =3D magic.open(magic.MAGIC_MIME_TYPE)=0A=
-                    m.load()=0A=
-                    return m.file(path)=0A=
-                except AttributeError:=0A=
-                    pass=0A=
-=0A=
-                try:    # we try python-magic 0.4.6=0A=
-                    m =3D magic.Magic(magic.MAGIC_MIME)=0A=
-                    return m.from_file(path)=0A=
-                except AttributeError:=0A=
-                    pass=0A=
-=0A=
-                try:    # we try pip filemagic 1.6=0A=
-                    m =3D magic.Magic(flags=3Dmagic.MAGIC_MIME_TYPE)=0A=
-                    return m.id_filename(path)=0A=
-                except AttributeError:=0A=
-                    pass=0A=
-=0A=
-                return "binary/octet-stream"=0A=
-            except ImportError:=0A=
-                return "binary/octet-stream"=0A=
-        raise Exception("FIXME: artifact type not implemented for build en=
vironment type %s" % be.get_betype_display())=0A=
-=0A=
-=0A=
     def get_artifact(self, path):=0A=
         if self.betype =3D=3D BuildEnvironment.TYPE_LOCAL:=0A=
             return open(path, "r")=0A=
diff --git a/bitbake/lib/toaster/toastergui/views.py b/bitbake/lib/toaster/=
toastergui/views.py=0A=
index be59c83..98b040e 100755=0A=
--- a/bitbake/lib/toaster/toastergui/views.py=0A=
+++ b/bitbake/lib/toaster/toastergui/views.py=0A=
@@ -39,6 +39,22 @@ from datetime import timedelta, datetime, date=0A=
 from django.utils import formats=0A=
 from toastergui.templatetags.projecttags import json as jsonfilter=0A=
 import json=0A=
+import mimetypes=0A=
+=0A=
+class MimeTypeFinder(object):=0A=
+    # setting this to False enables additional non-standard mimetypes=0A=
+    # to be included in the guess=0A=
+    _strict =3D False=0A=
+=0A=
+    # returns the mimetype for a file path as a string,=0A=
+    # or 'application/octet-stream' if the type couldn't be guessed=0A=
+    @classmethod=0A=
+    def get_mimetype(self, path):=0A=
+        guess =3D mimetypes.guess_type(path, self._strict)=0A=
+        guessed_type =3D guess[0]=0A=
+        if guessed_type =3D=3D None:=0A=
+            guessed_type =3D 'application/octet-stream'=0A=
+        return guessed_type=0A=
=0A=
 # all new sessions should come through the landing page;=0A=
 # determine in which mode we are running in, and redirect appropriately=0A=
@@ -3209,7 +3225,7 @@ if toastermain.settings.MANAGED:=0A=
             if file_name is None:=0A=
                 raise Exception("Could not handle artifact %s id %s" % (ar=
tifact_type, artifact_id))=0A=
             else:=0A=
-                content_type =3D b.buildrequest.environment.get_artifact_t=
ype(file_name)=0A=
+                content_type =3D MimeTypeFinder.get_mimetype(file_name)=0A=
                 fsock =3D b.buildrequest.environment.get_artifact(file_nam=
e)=0A=
                 file_name =3D os.path.basename(file_name) # we assume that=
 the build environment system has the same path conventions as host=0A=
=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

