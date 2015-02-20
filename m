Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1C773632
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KHdYpA028327 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:39:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RInaWJOFPRhs
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:39:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KHdL0t028321
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:39:32 GMT
Message-ID: <1424453961.11836.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Feb 2015 17:39:21 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] machine/qemu: Switch from ext3 to ext4
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
X-List-Received-Date: Fri, 20 Feb 2015 17:39:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is no good reason not to use ext4 at this point, it has advantages
and few drawbacks. Therefore switch the qemu machines over (and the default
runqemu script options).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index a5fc88a..d5c0b37 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -15,7 +15,7 @@ MACHINE_FEATURES = "alsa bluetooth usbgadget screen"
 
 MACHINEOVERRIDES =. "qemuall:"
 
-IMAGE_FSTYPES += "tar.bz2 ext3"
+IMAGE_FSTYPES += "tar.bz2 ext4"
 
 # Don't include kernels in standard images
 RDEPENDS_kernel-base = ""
diff --git a/scripts/runqemu b/scripts/runqemu
index 3d75319..4fe2de5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -39,7 +39,7 @@ usage() {
     echo ""
     echo "Examples:"
     echo "  $MYNAME qemuarm"
-    echo "  $MYNAME qemux86-64 core-image-sato ext3"
+    echo "  $MYNAME qemux86-64 core-image-sato ext4"
     echo "  $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial"
     echo "  $MYNAME qemux86 ramfs"
     echo "  $MYNAME qemux86 iso"
@@ -296,31 +296,31 @@ machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
 
 # Defaults used when these vars need to be inferred
 QEMUX86_DEFAULT_KERNEL=bzImage-qemux86.bin
-QEMUX86_DEFAULT_FSTYPE=ext3
+QEMUX86_DEFAULT_FSTYPE=ext4
 
 QEMUX86_64_DEFAULT_KERNEL=bzImage-qemux86-64.bin
-QEMUX86_64_DEFAULT_FSTYPE=ext3
+QEMUX86_64_DEFAULT_FSTYPE=ext4
 
 QEMUARM_DEFAULT_KERNEL=zImage-qemuarm.bin
-QEMUARM_DEFAULT_FSTYPE=ext3
+QEMUARM_DEFAULT_FSTYPE=ext4
 
 QEMUARM64_DEFAULT_KERNEL=Image-qemuarm64.bin
-QEMUARM64_DEFAULT_FSTYPE=ext3
+QEMUARM64_DEFAULT_FSTYPE=ext4
 
 QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
-QEMUMIPS_DEFAULT_FSTYPE=ext3
+QEMUMIPS_DEFAULT_FSTYPE=ext4
 
 QEMUMIPSEL_DEFAULT_KERNEL=vmlinux-qemumipsel.bin
-QEMUMIPSEL_DEFAULT_FSTYPE=ext3
+QEMUMIPSEL_DEFAULT_FSTYPE=ext4
 
 QEMUMIPS64_DEFAULT_KERNEL=vmlinux-qemumips64.bin
-QEMUMIPS64_DEFAULT_FSTYPE=ext3
+QEMUMIPS64_DEFAULT_FSTYPE=ext4
 
 QEMUSH4_DEFAULT_KERNEL=vmlinux-qemumips.bin
-QEMUSH4_DEFAULT_FSTYPE=ext3
+QEMUSH4_DEFAULT_FSTYPE=ext4
 
 QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
-QEMUPPC_DEFAULT_FSTYPE=ext3
+QEMUPPC_DEFAULT_FSTYPE=ext4
 
 QEMUMICROBLAZE_DEFAULT_KERNEL=linux.bin.ub
 QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio



