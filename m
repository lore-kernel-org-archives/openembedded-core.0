Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id D07BB610F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:48:15 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id y10so1127939pdj.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=otANkRqSpdk6y86OibWOzbOeICNV9dh6S9xjkSG0XMw=;
	b=ctirs9c1jVDn0nNEWYJa3EEuNSXA+BtL9iehtIaobFZri3oyJopAkf6uegj0eXo67K
	kpP1OoyAZNABgqTZdyKjVE/PTbdBcPMcmJfHMtyIdEhGTUH5EEU0dbe67JFg9WeEwos5
	GaTVOs+hBhWO/GfjWGecy2c2mKRAtEgZGhWrHOSW1rL4H70ZA5qrEz4y2Dhd+7QtgNzX
	O/GlByUL0FOv6osT99uBVVuyYWCvnGUBp7rRZnbYKQLqJbmitb52YB6Ip8xwmNtynvid
	tIEOvutoLTlQTrCeaRS4hM6nvYfleN32souIwceqjmvZAwILJ+W797QmVupYkbSMdamK
	PRGQ==
X-Received: by 10.68.65.101 with SMTP id w5mr2706741pbs.5.1408002496671;
	Thu, 14 Aug 2014 00:48:16 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id ha4sm4335221pbb.78.2014.08.14.00.48.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 00:48:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 00:51:24 -0700
Message-Id: <1408002686-5641-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] gcc: Abstract long double configuration into python function
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
X-List-Received-Date: Thu, 14 Aug 2014 07:48:19 -0000

musl does not support IBM 128 long double for ppc, instead of
doing complex overrides move it into a pythong snippet which
is easier to read and more compact.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc           |    5 +++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 66a18d9..e06b6ee 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -25,6 +25,11 @@ def get_gcc_mips_plt_setting(bb, d):
         return "--with-mips-plt"
     return ""
 
+def get_long_double_setting(bb, d):
+    if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC', True) in [ 'uclibc', 'eglibc' ]:
+        return "--with-long-double-128"
+    return ""
+
 def get_gcc_multiarch_setting(bb, d):
     target_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
     multiarch_options = {
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 75fb379..3934bcb 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -46,6 +46,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) !=
                 ${EXTRA_OECONF_FPU} \
                 ${EXTRA_OECONF_PATHS} \
                 ${@get_gcc_mips_plt_setting(bb, d)} \
+                ${@get_long_double_setting(bb, d)} \
                 ${@get_gcc_multiarch_setting(bb, d)}"
 
 export ac_cv_path_SED = 'sed'
@@ -64,10 +65,6 @@ EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-t
 EXTRA_OECONF_FPU ??= ""
 CPPFLAGS = ""
 
-# powerpc needs this to comply with the ABI
-EXTRA_OECONF_append_powerpc = " --with-long-double-128"
-EXTRA_OECONF_append_powerpc64 = " --with-long-double-128"
-
 SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
-- 
1.7.10.4


