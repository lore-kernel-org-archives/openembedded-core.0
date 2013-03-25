Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKAa1-0005Y0-2F for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 17:49:05 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PGfgBv021987; Mon, 25 Mar 2013 16:41:42 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VtHKYVCha6c7; Mon, 25 Mar 2013 16:41:42 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PGfaCI021979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Mar 2013 16:41:39 GMT
Message-ID: <1364229105.3097.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Jochen.Trumpf@anu.edu.au
Date: Mon, 25 Mar 2013 16:31:45 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] conf/machine: Clean up MACHINEOVERRIDES handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 16:49:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

OVERRIDES reads from left to right, least to most specific. We were
appending to MACHINEOVERRIDES when we should have been prepending so
the ordering of qemuall verses qemuxxx was incorrect, as was the x86
override and several of the arm overrides. This patch is a batch cleanup
of the various issues to correct the order from least to most specific.
The include order does matter and we needed to tweak some of that in this
patch too.

[YOCTO #4090]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index fcd56d7..5940467 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -9,7 +9,7 @@ FIX_V4BX_ARMV4 = "${@bb.utils.contains("TUNE_FEATURES", "armv4", "--fix-v4bx", "
 FIX_V4BX_ARMV5 = "${@bb.utils.contains("TUNE_FEATURES", "armv5", "", "${FIX_V4BX_ARMV4}", d)}"
 FIX_V4BX = "${@bb.utils.contains("TUNE_FEATURES", "thumb", "", "${FIX_V4BX_ARMV5}", d)}"
 TARGET_LD_KERNEL_ARCH += "${FIX_V4BX}"
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv4", "armv4:", "" ,d)}"
 
 require conf/machine/include/arm/arch-arm.inc
 require conf/machine/include/arm/feature-arm-thumb.inc
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 5fdfa23..33fe401 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5"
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv5", "armv5:", "" ,d)}"
 
 ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
 
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index ea6d73d..882400e 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6"
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv6", "armv6:", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index a8ebd82..e876f33 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a"
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a", "", d)}"
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "armv7a:", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index 15f67d7..a817bfd 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -14,7 +14,7 @@ TUNEVALID[m32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[m32] = "m64 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "m32", ":x86", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86:", "" ,d)}"
 
 # x32 ABI
 TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 29caec9..637f4ef 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -12,7 +12,7 @@ XSERVER ?= "xserver-xorg \
 
 MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
-MACHINEOVERRIDES .= ":qemuall"
+MACHINEOVERRIDES =. "qemuall:"
 
 IMAGE_FSTYPES += "tar.bz2 ext3"
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 23a7108..90007fb 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -7,6 +7,7 @@ PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
+require conf/machine/include/qemu.inc
 require conf/machine/include/tune-x86_64.inc
 
 KERNEL_IMAGETYPE = "bzImage"
@@ -20,8 +21,6 @@ XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
            xf86-video-vmware"
 
-require conf/machine/include/qemu.inc
-
 MACHINE_FEATURES += "x86"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index d13dc84..7a7cbfd 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -7,6 +7,7 @@ PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
+require conf/machine/include/qemu.inc
 require conf/machine/include/tune-i586.inc
 
 KERNEL_IMAGETYPE = "bzImage"
@@ -20,8 +21,6 @@ XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
            xf86-video-vmware"
 
-require conf/machine/include/qemu.inc
-
 MACHINE_FEATURES += "x86"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"




