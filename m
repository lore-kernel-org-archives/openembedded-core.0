Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D9D027277F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKBJKch012037 for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:19:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fUXjH99fH2sl
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:19:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBKBJE8N012020
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 11:19:25 GMT
Message-ID: <1419074391.13316.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Dec 2014 11:19:51 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] boot-directdisk: Use kernel from DEPLOY_DIR_IMAGE, not sysroot
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
X-List-Received-Date: Sat, 20 Dec 2014 11:20:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

After the recent kernel changes, this avoids failures like:

DEBUG: Executing shell function build_boot_dd
install: cannot stat '/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/sysroots/qemux86-64/usr/src/kernel/bzImage': No such file or directory
WARNING: exit code 1 from a shell command.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 09da032..44f738b 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -20,6 +20,7 @@
 # ${ROOTFS} - the rootfs image to incorporate
 
 do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
+                               virtual/kernel:do_deploy \
                                syslinux:do_populate_sysroot \
                                syslinux-native:do_populate_sysroot \
                                parted-native:do_populate_sysroot \
@@ -69,7 +70,7 @@ boot_direct_populate() {
 	install -d $dest
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage $dest/vmlinuz
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage $dest/vmlinuz
 
 	# initrd is made of concatenation of multiple filesystem images
 	if [ -n "${INITRD}" ]; then



