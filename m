Return-Path: <martyn.welch@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 653B278772
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:06:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: martyn) with ESMTPSA id 0897626F185
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 15:05:56 +0000
Message-Id: <1510844758-20290-1-git-send-email-martyn.welch@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v4 1/3] image.bbclass: add prohibited-paths QA test
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
X-List-Received-Date: Thu, 16 Nov 2017 15:06:22 -0000

Sometimes we wish to ensure that files or directories are not installed
somewhere that may prove detrimental to the operation of the system. For
example, this may be the case if files are placed in a directory that is
utilised as a mount point at run time, thus making them inaccessible once
when the mount point is being utilised.

Implement the prohibited paths QA test, which enables such locations to be
specified in a "IMAGE_QA_PROHIBITED_PATHS" variable. This implementation
allows for a colon separated list of paths to be provided. Shell style
wildcards can be used.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---
Changes since v1:
 - Correcting author and SOB.

Changes since v2:
 - Reimplemented as image rather than package level QA test.
 - Changed variable from PROHIBITED_PATH to PROHIBITED_PATHS to better
   reflect its use.

Changes since v3:
 - Rename variable to IMAGE_QA_PROHIBITED_PATHS.
 - Use str.startswith().
 - Simplify if statement.

 meta/classes/image.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d93de02..9053ce3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -296,6 +296,26 @@ python do_image_complete_setscene () {
 }
 addtask do_image_complete_setscene
 
+python image_check_prohibited_paths () {
+    import glob
+    from oe.utils import ImageQAFailed
+
+    rootfs = d.getVar('IMAGE_ROOTFS')
+
+    path = (d.getVar('IMAGE_QA_PROHIBITED_PATHS') or "")
+    if path != "":
+        for p in path.split(':'):
+            if not p.startswith('/'):
+                raise ImageQAFailed("IMAGE_QA_PROHIBITED_PATHS \"%s\" must be an absolute path" % p, image_check_prohibited_paths)
+
+            match = glob.glob("%s%s" % (rootfs, p))
+            if match:
+                loc = ", ".join(item.replace(rootfs, '') for item in match)
+                raise ImageQAFailed("Match(es) for IMAGE_QA_PROHIBITED_PATHS \"%s\": %s" % (p, loc), image_check_prohibited_paths)
+}
+
+IMAGE_QA_COMMANDS += "image_check_prohibited_paths"
+
 # Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
 #
 # IMAGE_QA_COMMANDS += " \
-- 
2.1.4


