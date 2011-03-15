Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Pzavj-0006la-3a for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 21:33:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FKVfZm024071
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 20:31:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23652-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 20:31:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FKVZR0024065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 20:31:35 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Mar 2011 20:31:26 +0000
Message-ID: <1300221086.30423.1839.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH RFC] bitbake.conf/tune files: Adjust PACKAGE_EXTEA_ARCHS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2011 20:33:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a problem with the current PACKAGE_EXTRA_ARCHS implementation
since its impossible to control which extra architectures sort higher
than TARGET_ARCH and which sort lower. In the x86 case for example,
TARGET_ARCH might be "i586", i486 should be lower than this and i686 should
be higher. There are also complications where its easy to inject duplicate
entries into the variable.
    
I tried various versions of this patch and concluded that it was simplest
just to force the tune files to include TARGET_ARCH in the list in the
right place if they're planning to customise it themselves. Other approaches
with appends and prepends just complicated the code for no good reason.
    
The TARGET_ARCH definitions should also move to the tune files but I'll
leave this for a separate patch.
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 42b9825..e51df7a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -94,7 +94,8 @@ BASE_PACKAGE_ARCH = "${HOST_ARCH}"
 PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('BASE_PACKAGE_ARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))]}"
 MACHINE_ARCH_qemux86-64 = "qemux86_64"
-PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
+PACKAGE_EXTRA_ARCHS ??= "${TARGET_ARCH}"
+PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE shouldn't be included here as a variable dependency since machine specific 
 # packages are handled using multimachine
 PACKAGE_ARCHS[vardepsexclude] = "MACHINE"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index a771751..2ea3c9d 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -4,6 +4,6 @@ FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
 
 ARM_INSTRUCTION_SET = "${@['thumb','arm'][bb.data.getVar('CPU_FEATURES', d, 1).find('thumb') == -1]}"
-PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6"
 
 require conf/machine/include/tune-thumb.inc
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index fee5c58..564b557 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -1,4 +1,4 @@
 FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t" 
 TARGET_CC_ARCH = "-march=armv4t -mtune=arm920t"
-PACKAGE_EXTRA_ARCHS += "armv4 armv4t"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index f41e460..9d546c9 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,5 +1,5 @@
 FEED_ARCH = "armv5te"
-PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te"
 # For gcc 3.x you need:
 #TARGET_CC_ARCH = "-march=armv5te -mtune=arm926ejs"
 # For gcc 4.x you need:
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index d788b53..5446ce8 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -1,4 +1,4 @@
 FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t"
-PACKAGE_EXTRA_ARCHS += "armv4 armv4t"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t"
 TARGET_CC_ARCH = "-mcpu=arm9tdmi -mtune=arm9tdmi"
diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
index 379a3eb..979d6fe 100644
--- a/meta/conf/machine/include/tune-armv7.inc
+++ b/meta/conf/machine/include/tune-armv7.inc
@@ -3,5 +3,5 @@
 # This will NOT compile programs in 'ARM' mode, which is what you really want
 TARGET_CC_ARCH = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
-PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7"
 BASE_PACKAGE_ARCH = "armv7"
diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
index 66d960a..399ea54 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/tune-atom.inc
@@ -2,4 +2,4 @@ BASE_PACKAGE_ARCH = "core2"
 TARGET_CC_ARCH = "-m32 -march=core2 -msse3 -mtune=generic -mfpmath=sse"
 #MOBLIN_CFLAGS = "-Os -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables"
 
-PACKAGE_EXTRA_ARCHS += "x86 i386 i486 core2"
+PACKAGE_EXTRA_ARCHS = "x86 i386 i486 i586 i686 core2"
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index 1d636e8..d33df5f 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -1,4 +1,4 @@
 TARGET_CC_ARCH = "-march=c3 -mtune=c3"
-PACKAGE_EXTRA_ARCHS += "i386 i486 i586"
+PACKAGE_EXTRA_ARCHS = "i386 i486 i586"
 BASE_PACKAGE_ARCH = "i586"
 FEED_ARCH = "i586"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 3ec1c03..a5b982a 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -10,4 +10,4 @@ TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
 
 FEED_ARCH = "armv7a"
 BASE_PACKAGE_ARCH = "armv7a"
-PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7 armv7a"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index d0c5bb2..e1515a0 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -2,7 +2,7 @@ TARGET_CC_ARCH = "-march=ep9312 -mtune=ep9312 -mcpu=ep9312"
 # add "-mfp=maverick" for newer gcc versions > 4.0
 
 #set arch to ep9312 for all generated packages
-PACKAGE_EXTRA_ARCHS += "armv4t ep9312"
+PACKAGE_EXTRA_ARCHS = "arm armv4t ep9312"
 BASE_PACKAGE_ARCH = "ep9312"
 FEED_ARCH = "ep9312"
 
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index f7291be..7191ab0 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -2,6 +2,6 @@
 # Please use tune-xscale for PXA255/PXA26x based processors.
 TARGET_CC_ARCH = "-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt"
 BASE_PACKAGE_ARCH = "iwmmxt"
-PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te iwmmxt"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te iwmmxt"
 FEED_ARCH = "iwmmxt"
 
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 15a72d1..dc95d0d 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -1,4 +1,4 @@
 TARGET_CC_ARCH = "-mcpu=603e  -mhard-float"
 BASE_PACKAGE_ARCH = "ppc603e"
 FEED_ARCH = "ppc603e"
-PACKAGE_EXTRA_ARCHS += "ppc603e"
+PACKAGE_EXTRA_ARCHS = "powerpc ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index 2956875..3e552e6 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -1,3 +1,3 @@
 TARGET_CC_ARCH = "-mcpu=e300c2 -msoft-float"
 BASE_PACKAGE_ARCH = "ppce300"
-PACKAGE_EXTRA_ARCHS += "ppce300"
+PACKAGE_EXTRA_ARCHS = "powerpc ppce300"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 44f8742..45e1f0d 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -1,4 +1,4 @@
 TARGET_CC_ARCH = "-mcpu=8540"
 BASE_PACKAGE_ARCH = "ppce500"
 FEED_ARCH = "ppce500"
-PACKAGE_EXTRA_ARCHS += "ppce500"
+PACKAGE_EXTRA_ARCHS = "powerpc ppce500"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index f1ef3d4..cfdcc99 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -5,7 +5,7 @@ INHERIT += "siteinfo"
 TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
 BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
-PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
+PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here



