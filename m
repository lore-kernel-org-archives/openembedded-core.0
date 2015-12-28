Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 987766013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBSD0o5c016914 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:00:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QUuHs6_U8REm
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:00:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBSD0lAm016910
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:00:48 GMT
Message-ID: <1451307647.4129.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Dec 2015 13:00:47 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [RFC PATCH 2/3] image: Move pre/post process commands to bbclass
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
X-List-Received-Date: Mon, 28 Dec 2015 13:00:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index bee7d63..fe14b86 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -345,16 +345,37 @@ fakeroot python do_rootfs () {
 
 fakeroot python do_image () {
     from oe.image import create_image
+    from oe.image import Image
+    from oe.utils import execute_pre_post_process
 
-    # generate final images
-    create_image(d)
+    i = Image(d)
+
+    pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND", True)
+
+    execute_pre_post_process(d, pre_process_cmds)
+
+    i._remove_old_symlinks()
+
+    i.create()
 }
 
-do_images[dirs] = "${TOPDIR}"
+do_image[dirs] = "${TOPDIR}"
 do_image[lockfiles] += "${IMAGE_ROOTFS}.lock"
 do_image[umask] = "022"
 addtask do_image after do_rootfs before do_build
 
+fakeroot python do_image_complete () {
+    from oe.utils import execute_pre_post_process
+
+    post_process_cmds = d.getVar("IMAGE_POSTPROCESS_COMMAND", True)
+
+    execute_pre_post_process(d, post_process_cmds)
+}
+do_image_complete[dirs] = "${TOPDIR}"
+do_image_complete[lockfiles] += "${IMAGE_ROOTFS}.lock"
+do_image_complete[umask] = "022"
+addtask do_image_complete after do_image before do_build
+
 insert_feed_uris () {
 	
 	echo "Building feeds for [${DISTRO}].."
diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 52ac1e75..b2b002b 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -351,12 +351,6 @@ class Image(ImageDepGraph):
 
     def create(self):
         bb.note("###### Generate images #######")
-        pre_process_cmds = self.d.getVar("IMAGE_PREPROCESS_COMMAND", True)
-        post_process_cmds = self.d.getVar("IMAGE_POSTPROCESS_COMMAND", True)
-
-        execute_pre_post_process(self.d, pre_process_cmds)
-
-        self._remove_old_symlinks()
 
         image_cmd_groups = self._get_imagecmds()
 
@@ -406,9 +400,6 @@ class Image(ImageDepGraph):
                     bb.note("Creating symlinks for %s image ..." % image_type)
                     self._create_symlinks(subimages)
 
-        execute_pre_post_process(self.d, post_process_cmds)
-
-
 def create_image(d):
     Image(d).create()
 



