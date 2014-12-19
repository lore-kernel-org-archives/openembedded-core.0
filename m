Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE8577292A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJHkci3022939 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:46:38 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id plz_hajk9Bkf
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:46:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJHkN4Z022934
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:46:34 GMT
Message-ID: <1419011219.13316.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 17:46:59 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] bootimg: Use deploy artefacts, not STAGING_KERNEL_DIR
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
X-List-Received-Date: Fri, 19 Dec 2014 17:47:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

bzImage is no longer in STAGING_KERNEL_DIR. Rather than add it back,
depend on the kernel deploy task and find it in DEPLOY_DIR_IMAGE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 8a305af..003816b 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -30,6 +30,7 @@ NONGLOBALBBCLASS += "bootimg"
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         mtools-native:do_populate_sysroot \
                         cdrtools-native:do_populate_sysroot \
+                        virtual/kernel:do_deploy \
                         ${@oe.utils.ifelse(d.getVar('COMPRESSISO'),'zisofs-tools-native:do_populate_sysroot','')}"
 
 PACKAGES = " "
@@ -68,7 +69,7 @@ populate() {
 	install -d ${DEST}
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage ${DEST}/vmlinuz
 	
 	# initrd is made of concatenation of multiple filesystem images
 	if [ -n "${INITRD}" ]; then



