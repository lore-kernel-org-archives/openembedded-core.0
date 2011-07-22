Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkK6Q-0001v3-J6 for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 20:05:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MI1PLD030450
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:01:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29510-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:01:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MI1H4c030444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:01:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
Date: Fri, 22 Jul 2011 19:01:14 +0100
Message-ID: <1311357674.2344.155.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH 6/3] Move architecture specific TARGET_OS mangling into tune files
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
X-List-Received-Date: Fri, 22 Jul 2011 18:05:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 61312bc..6e109ec 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -85,9 +85,11 @@ TUNE_ARCH ??= "INVALID"
 TUNE_CCARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
 PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} ??= "${TARGET_ARCH}"
+LIBCEXTENSION ??= ""
+ABIEXTENSION ??= ""
 
 TARGET_ARCH = "${TUNE_ARCH}"
-TARGET_OS = "INVALID"
+TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
 TARGET_VENDOR = "-oe"
 TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 9fab4dc..8ef3ceb 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -2,10 +2,7 @@
 # eglibc specific configuration
 #
 
-TARGET_OS = "linux"
-TARGET_OS_arm = "linux-gnueabi"
-TARGET_OS_armeb = "linux-gnueabi"
-TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
+LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
 
 # Add glibc overrides to the overrides for eglibc.
 OVERRIDES .= ":libc-glibc"
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index 0370dfa..823195c 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -2,10 +2,7 @@
 # glibc specific configuration
 #
 
-TARGET_OS = "linux"
-TARGET_OS_arm = "linux-gnueabi"
-TARGET_OS_armeb = "linux-gnueabi"
-TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
+LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
 
 # Add glibc to the overrides.
 OVERRIDES =. "libc-glibc:"
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 7c06654..e0f50a0 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -2,10 +2,7 @@
 # uclibc specific configuration
 #
 
-TARGET_OS = "linux-uclibc"
-TARGET_OS_arm = "linux-uclibceabi"
-TARGET_OS_armeb = "linux-uclibceabi"
-TARGET_OS_powerpc = "linux-uclibc${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
+LIBCEXTENSION = "-uclibc"
 
 # Add uclibc overrides to the overrides.
 OVERRIDES =. "libc-uclibc:"
diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index e773d14..c517df6 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -1 +1,3 @@
 TUNE_ARCH = "arm"
+
+ABIEXTENSION = "eabi"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 5ab81d4..17ace32 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -1 +1,3 @@
 TUNE_ARCH = "powerpc"
+
+ABIEXTENSION = "${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"




