Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 819946FDEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 13:09:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5DD9kxD013499 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 14:09:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nwuEKX3Rk9y5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 14:09:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5DD9hri013486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 14:09:44 +0100
Message-ID: <1402664977.12440.481.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 14:09:37 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf/qemu: Move QEMU_OPTIONS to qemu.bbclass
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
X-List-Received-Date: Fri, 13 Jun 2014 13:09:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The QEMU_OPTIONS variables belong in qemu.bbclass so move them there. The
only users of them inherit qemu.bbclass. There is no point in pushing
these into every recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 3d437b0..abee8aa 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -33,3 +33,15 @@ def qemu_run_binary(data, rootfs_path, binary):
     return "PSEUDO_UNLOAD=1 " + qemu_binary + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + libdir + ":" + base_libdir + " "\
             + rootfs_path + binary
+
+QEMU_OPTIONS = ""
+QEMU_OPTIONS_iwmmxt    = "-cpu pxa270-c5"
+QEMU_OPTIONS_armv6     = "-cpu arm1136"
+QEMU_OPTIONS_armv7a    = "-cpu cortex-a8"
+QEMU_OPTIONS_e500v2    = "-cpu e500v2"
+QEMU_OPTIONS_e500mc    = "-cpu e500mc"
+QEMU_OPTIONS_e5500     = "-cpu e5500"
+QEMU_OPTIONS_e5500-64b = "-cpu e5500"
+QEMU_OPTIONS_e6500     = "-cpu e6500"
+QEMU_OPTIONS_e6500-64b = "-cpu e6500"
+QEMU_OPTIONS_ppc7400   = "-cpu 7400"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d0e00c..6c1e097 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -144,19 +144,6 @@ PACKAGE_ARCHS[vardepsexclude] = "MACHINE_ARCH"
 MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 MULTIMACH_HOST_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
-# select proper CPU to get binary locales generated
-QEMU_OPTIONS = ""
-QEMU_OPTIONS_iwmmxt  = "-cpu pxa270-c5"
-QEMU_OPTIONS_armv6   = "-cpu arm1136"
-QEMU_OPTIONS_armv7a   = "-cpu cortex-a8"
-QEMU_OPTIONS_e500v2    = "-cpu e500v2"
-QEMU_OPTIONS_e500mc    = "-cpu e500mc"
-QEMU_OPTIONS_e5500     = "-cpu e5500"
-QEMU_OPTIONS_e5500-64b = "-cpu e5500"
-QEMU_OPTIONS_e6500     = "-cpu e6500"
-QEMU_OPTIONS_e6500-64b = "-cpu e6500"
-QEMU_OPTIONS_ppc7400 = "-cpu 7400"
-
 ##################################################################
 # Date/time variables.
 ##################################################################



