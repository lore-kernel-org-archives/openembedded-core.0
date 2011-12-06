Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXnZx-0003ov-FG
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 06:28:33 +0100
Received: by ggnh1 with SMTP id h1so5843899ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 21:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/lqrSzkoEMIG2tntsoAcdmjwi7+gdTEdyZlWwWORt1k=;
	b=ryiWyTzW2SOoZnuFsAEenUD6RYOlx6PSSDHXetrl3L5IDQrTjdhTM22bJ/qu/3l6Dz
	y1n2QLLZm1zNxixzEI5qPjZMLEbNSE51dO4K7lz6/bsmKkK6lCLuerDBDqa7eqNz3qDy
	JM9CdcnCUcO17Q8Nido3gUMfoO3JhrgH7/nD0=
Received: by 10.236.185.133 with SMTP id u5mr16351641yhm.106.1323148905929;
	Mon, 05 Dec 2011 21:21:45 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l19sm57929084anc.14.2011.12.05.21.21.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 21:21:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 21:21:21 -0800
Message-Id: <96718054547fb9a87b0782b682e13f18a3b9d0b2.1323148566.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
References: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
In-Reply-To: <cover.1323148566.git.raj.khem@gmail.com>
References: <cover.1323148566.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] gcc: Backport patch from trunk to fix ICE seen on armv7 with mesa-xlib
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
X-List-Received-Date: Tue, 06 Dec 2011 05:28:33 -0000

This patch is a backport of http://patchwork.ozlabs.org/patch/110517/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    4 --
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |   34 ++++++++++++++++++++
 3 files changed, 36 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 997400c..5bb253e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,10 +23,6 @@ EGLIBCVERSION ?= "2.13"
 UCLIBCVERSION ?= "0.9.32"
 LINUXLIBCVERSION ?= "3.1"
 
-# Temporary workaround for gcc 4.6.0 ICE with beagleboard
-# gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47719
-TARGET_CC_ARCH_arm_pn-mesa-xlib := "${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"
-
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-initial ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index bc655fe..c163a46 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r19"
+PR = "r20"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -72,6 +72,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://pr46934.patch \
 	   file://pr32219.patch \
 	   file://pr47551.patch \
+	   file://gcc-arm-set-cost.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
new file mode 100644
index 0000000..04dabaf
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
@@ -0,0 +1,34 @@
+2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
+
+ 	gcc/
+ 	Backport from mainline:
+ 
+	2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* config/arm/arm.c (arm_rtx_costs_1): Don't modify the costs of SET.
+	(arm_size_rtx_costs): Likewise.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-08-12 08:08:31 +0000
++++ new/gcc/config/arm/arm.c	2011-08-18 13:53:37 +0000
+@@ -7464,6 +7464,9 @@
+ 	*total = COSTS_N_INSNS (4);
+       return true;
+ 
++    case SET:
++      return false;
++
+     default:
+       *total = COSTS_N_INSNS (4);
+       return false;
+@@ -7811,6 +7814,9 @@
+       *total = COSTS_N_INSNS (1) + 1;
+       return true;
+ 
++    case SET:
++      return false;
++
+     default:
+       if (mode != VOIDmode)
+ 	*total = COSTS_N_INSNS (ARM_NUM_REGS (mode));
+
-- 
1.7.5.4



