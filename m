Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C91E87317D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBSD0pBw016919 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:00:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c3uAzsESn10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:00:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBSD0nW9016911
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 13:00:50 GMT
Message-ID: <1451307649.4129.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Dec 2015 13:00:49 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [RFC PATCH 1/3] image.bbclass: Separate out image generation into a new task, do_image
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
index d2f8105..bee7d63 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -334,7 +334,6 @@ do_rootfs[prefuncs] += "rootfs_runtime_mapping"
 
 fakeroot python do_rootfs () {
     from oe.rootfs import create_rootfs
-    from oe.image import create_image
     from oe.manifest import create_manifest
 
     # generate the initial manifest
@@ -342,11 +341,20 @@ fakeroot python do_rootfs () {
 
     # generate rootfs
     create_rootfs(d)
+}
+
+fakeroot python do_image () {
+    from oe.image import create_image
 
     # generate final images
     create_image(d)
 }
 
+do_images[dirs] = "${TOPDIR}"
+do_image[lockfiles] += "${IMAGE_ROOTFS}.lock"
+do_image[umask] = "022"
+addtask do_image after do_rootfs before do_build
+
 insert_feed_uris () {
 	
 	echo "Building feeds for [${DISTRO}].."



