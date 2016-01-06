Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9498731EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06Mumkc023325 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 22:57:41 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gjwc6WL9In0k
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:57:41 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u06MvYGJ023359
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 22:57:36 GMT
Message-ID: <1452121054.7598.94.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jan 2016 22:57:34 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 1/4] image.bbclass: Separate out image generation into a new task, do_image
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

I've heard complaints from people trying to create more interesting image
types about how hard it is to understand the rootfs/image generation code
and that its a pain to develop/test/debug.

Having looked at it myself, the internal construction of shell functions which
then gets passed into a multiprocessing pool is rather convoluted and it places
rather odd constraints on when variables are expanded. Its therefore no wonder
people find it confusing/complex.

This patch starts the process of splitting this up by separating out image
generation from the do_rootfs task into a new do_image task.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 81971fe..77a8548 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -207,7 +207,6 @@ PACKAGE_EXCLUDE[type] = "list"
 
 fakeroot python do_rootfs () {
     from oe.rootfs import create_rootfs
-    from oe.image import create_image
     from oe.manifest import create_manifest
 
     # Handle package exclusions
@@ -244,9 +243,6 @@ fakeroot python do_rootfs () {
 
     # Generate rootfs
     create_rootfs(d)
-
-    # generate final images
-    create_image(d)
 }
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
@@ -254,6 +250,16 @@ do_rootfs[cleandirs] += "${S}"
 do_rootfs[umask] = "022"
 addtask rootfs before do_build
 
+fakeroot python do_image () {
+    from oe.image import create_image
+
+    # generate final images
+    create_image(d)
+}
+do_image[dirs] = "${TOPDIR}"
+do_image[umask] = "022"
+addtask do_image after do_rootfs before do_build
+
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"



