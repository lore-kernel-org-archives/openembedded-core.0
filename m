Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C8573605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06Mvght023402 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 22:57:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zGahV1Gi0yjN
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:57:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06MveVQ023393
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 22:57:41 GMT
Message-ID: <1452121060.7598.96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jan 2016 22:57:40 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 2/4] image: Move pre/post process commands to bbclass
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
X-List-Received-Date: Wed, 06 Jan 2016 22:57:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As the next step in splitting up do_image, move the pre and post processing
commands to separate tasks. This also creates the do_image_complete task
which acts as the end marker task for image generation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 77a8548..60c2c60 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -252,14 +252,35 @@ addtask rootfs before do_build
 
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
 do_image[dirs] = "${TOPDIR}"
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
+do_image_complete[umask] = "022"
+addtask do_image_complete after do_image before do_build
+
+
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
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
 



