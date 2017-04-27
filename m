Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A2A766AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 20:53:17 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z129so7169661wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 13:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3dJhmr/Zlmga/0ZW8DCEa+gj44hwyxM5klgOf4DYaR8=;
	b=pGWQQge6zlfeSujCMW5tBl2pHDWBrK4/jiDnymp/1mgCow9F5NQK8Jmf7+f875COhg
	TDH09mLMglIWQZfWD6OeRqKwd8QclT3PB3QZwv3qJor0wQ7nZpgnSf2gDXw9mHyLg0KX
	ZYhoRe1zPtEdCwVfxd0JVFWRXRRGnevdj0GKw0udn11DGR4hFpErf68kefj87VqOwrvD
	Dv7VsiE+/tkgHKWQJxxnm7OKMHsJwAGer45uRd3BmX2dXrMO0m8IfC7HeuTMYmHW28O+
	J6HZWDhRhQOd9nSyC1pXYG9hmgIBAYWo/0f3YumjyRtldERKGfg53P4aC3FBJrxqfcuY
	Grig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3dJhmr/Zlmga/0ZW8DCEa+gj44hwyxM5klgOf4DYaR8=;
	b=ts5AGsunDwquPMPcZ6q81IaFOY4xvN3b+3FUewkEt5h0duvUFdc1CXEBDVC8/PkPRo
	v2hi1/0cCYJgN3FFQbLgItnvOL3y7KmPbHgv1qSYKG+ZPix2pmEIwLedxBXR+sHM9Cuy
	ATs3rplfIVEx1Z2atecyopiE/OkvsrbIXx3nghDECcU+2qmjY5b6vHxHjzCRNeq8z9Bl
	8twWswzkFobSGglHJmk+7+J1rATjSMndtQ9FUUPCfdS83/B6fp3atMDQwasAwmKlnfsX
	oVkfZKL4o+rPplMSb8zBB9ILHVasPA4Go1VXTUV1OHN2PiAN7deSB0Rg8orXvuq8SnN6
	QPXg==
X-Gm-Message-State: AN3rC/6LfaqepO09OZCJNyfo+QYkCj8xFmNIYOg7+dcYJlY/YOaBVrbn
	6l9QuFyAvBtJ5g==
X-Received: by 10.28.125.195 with SMTP id y186mr3508383wmc.32.1493326397899;
	Thu, 27 Apr 2017 13:53:17 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id z84sm555847wmh.27.2017.04.27.13.53.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Apr 2017 13:53:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 22:53:35 +0200
Message-Id: <20170427205335.26679-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <CA+chaQck0sU7Bcz5Hnr_34=PGsx4ngyQO+5w3dEu+xMm=G48BQ@mail.gmail.com>
References: <CA+chaQck0sU7Bcz5Hnr_34=PGsx4ngyQO+5w3dEu+xMm=G48BQ@mail.gmail.com>
Subject: [PATCH] runqemu-gen-tapdevs: fix runqemu-ifup script call
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
X-List-Received-Date: Thu, 27 Apr 2017 20:53:18 -0000

The tunctl binary is here:

OE @ /OE/openembedded-core # find /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/sysroot-providers
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/sysroot-providers/qemu-helper-native
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin/tunctl

But the script still complains that it cannot find tunctl:

OE @ /OE/openembedded-core # ./scripts/runqemu-gen-tapdevs 1026 1026 4 /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/
Note: Destroying pre-existing tap interface tap0...
TUNSETIFF: Device or resource busy
Creating 4 tap devices for UID: 1026 GID: 1026...
Creating tap0
Error running tunctl: Error: Unable to find tunctl binary in '/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/', please bitbake qemu-helper-native

The message is actually from runqemu-ifup, which is called from runqemu-gen-tapdevs as:
++ ./scripts/runqemu-ifup 1026 1026 /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/

But runqemu-ifup expects 3rd parameter to be STAGING_BINDIR_NATIVE directly not just SYSROOT dir
STAGING_BINDIR_NATIVE=$3
because tunctl is then used as:
TUNCTL=$STAGING_BINDIR_NATIVE/tunctl

It looks like it got broken by:
commit cc5513bf7a6114e14bb307acb88a44e9cf0aed8a
Author: Ed Bartosh <ed.bartosh@linux.intel.com>
Date:   Wed Apr 12 23:40:59 2017 +0300

    runqemu: use bindir_native property to run ifup/down scripts

    Used self.bindir_native to point out to the native sysroot
    when running runqemu-ifup and runqemu-ifdown scripts.

    [YOCTO #11266]
    [YOCTO #11193]

    Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Seemingly obvious fix would be to call runqemu-gen-tapdevs with path to STAGING_BINDIR_NATIVE in 4th parameter as well, but that won't work, because runqemu-gen-tapdevs checks for TUNCTL=$SYSROOT/usr/bin/tunctl

OE @ /OE/openembedded-core # ./scripts/runqemu-gen-tapdevs 1026 1026 4 /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin/
Error: /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin//usr/bin/tunctl is not an executable

I've tested that with this change it can call tunctl:
OE @ /OE/openembedded-core # ./scripts/runqemu-gen-tapdevs 1026 1026 4
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin
Note: Destroying pre-existing tap interface tap0...
TUNSETIFF: Device or resource busy
Creating 4 tap devices for UID: 1026 GID: 1026...
Creating tap0
Creating tap1
Creating tap2
Creating tap3
Note: For systems running NetworkManager, it's recommended
Note: that the tap devices be set as unmanaged in the
Note: NetworkManager.conf file. Add the following lines to
Note: /etc/NetworkManager/NetworkManager.conf
[keyfile]
unmanaged-devices=interface-name:tap*

but runqemu itself still doesn't work for me:
OE qemux86@ ~/build/oe-core $ runqemu
runqemu - INFO - Running MACHINE=qemux86 bitbake -e...
runqemu - INFO - Running ls -t /OE/build/oe-core/tmp-glibc/deploy/images/qemux86/*.qemuboot.conf...
runqemu - INFO - CONFFILE: /OE/build/oe-core/tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427174052.qemuboot.conf
runqemu - INFO - Overriding conf file setting of STAGING_DIR_NATIVE to /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/defaultpkgname/1.0-r0/recipe-sysroot-native from Bitbake environment
runqemu - INFO - Continuing with the following parameters:

KERNEL: [tmp-glibc/deploy/images/qemux86/bzImage--4.10.9+git0+ad2e885015_fe0fb8da3d-r0.2-qemux86-20170427085800.bin]
MACHINE: [qemux86]
FSTYPE: [ext4]
ROOTFS: [tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427174052.rootfs.ext4]
CONFFILE: [/OE/build/oe-core/tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427174052.qemuboot.conf]

runqemu - INFO - Running /bin/ip link...
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap0.lock...
runqemu - INFO - Using preconfigured tap device tap0
runqemu - INFO - If this is not intended, touch /tmp/qemu-tap-locks/tap0.skip to make runqemu skip tap0.
runqemu - INFO - Network configuration: 192.168.7.2::192.168.7.1:255.255.255.0
runqemu - INFO - Running ldd tmp-glibc/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin//qemu-system-i386...
runqemu - INFO - Running tmp-glibc/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin//qemu-system-i386 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -drive file=tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427174052.rootfs.ext4,if=virtio,format=raw -vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci   -cpu qemu32 -m 256 -serial mon:vc -serial null -kernel tmp-glibc/deploy/images/qemux86/bzImage--4.10.9+git0+ad2e885015_fe0fb8da3d-r0.2-qemux86-20170427085800.bin -append 'root=/dev/vda rw highres=off  mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1 '
qemu-system-i386: -netdev tap,id=net0,ifname=tap0,script=no,downscript=no: could not configure /dev/net/tun (tap0): Device or resource busy
runqemu - INFO - Releasing lockfile for tap device 'tap0'
Traceback (most recent call last):
  File "/OE/build/oe-core/openembedded-core/scripts/runqemu", line 1235, in <module>
    ret = main()
  File "/OE/build/oe-core/openembedded-core/scripts/runqemu", line 1228, in main
    config.start_qemu()
  File "/OE/build/oe-core/openembedded-core/scripts/runqemu", line 1139, in start_qemu
    raise Exception('Failed to run %s' % cmd)
Exception: Failed to run tmp-glibc/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin//qemu-system-i386 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -drive file=tmp-glibc/deploy/images/qemux86/core-image-sato-qemux86-20170427174052.rootfs.ext4,if=virtio,format=raw -vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci   -cpu qemu32 -m 256 -serial mon:vc -serial null -kernel tmp-glibc/deploy/images/qemux86/bzImage--4.10.9+git0+ad2e885015_fe0fb8da3d-r0.2-qemux86-20170427085800.bin -append 'root=/dev/vda rw highres=off  mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1 '

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/runqemu-gen-tapdevs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 49e1efce7c..11de318c1a 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -23,13 +23,13 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-	echo "Usage: sudo $0 <uid> <gid> <num> <native-sysroot-basedir>"
+	echo "Usage: sudo $0 <uid> <gid> <num> <staging_bindir_native>"
         echo "Where <uid> is the numeric user id the tap devices will be owned by"
 	echo "Where <gid> is the numeric group id the tap devices will be owned by"
 	echo "<num> is the number of tap devices to create (0 to remove all)"
 	echo "<native-sysroot-basedir> is the path to the build system's native sysroot"
 	echo "e.g. $ bitbake qemu-helper-native"
-	echo "$ sudo $0 1000 1000 4 tmp/sysroots-components/x86_64/qemu-helper-native/"
+	echo "$ sudo $0 1000 1000 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin"
 	exit 1
 }
 
@@ -46,9 +46,9 @@ fi
 TUID=$1
 GID=$2
 COUNT=$3
-SYSROOT=$4
+STAGING_BINDIR_NATIVE=$4
 
-TUNCTL=$SYSROOT/usr/bin/tunctl
+TUNCTL=$STAGING_BINDIR_NATIVE/tunctl
 if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
 	echo "Error: $TUNCTL is not an executable"
 	usage
@@ -87,7 +87,7 @@ if [ $COUNT -gt 0 ]; then
 	echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
 	for ((index=0; index < $COUNT; index++)); do
 		echo "Creating tap$index"
-		ifup=`$RUNQEMU_IFUP $TUID $GID $SYSROOT 2>&1`
+		ifup=`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`
 		if [ $? -ne 0 ]; then
 			echo "Error running tunctl: $ifup"
 			exit 1
-- 
2.12.2


