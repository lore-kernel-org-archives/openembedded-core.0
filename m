Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVx63-0002A1-S7
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 04:14:04 +0100
Received: by iahk25 with SMTP id k25so1768874iah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 19:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uV2MXhUTBWeMmacU8pP5TAx1S5xyl4AN2tqDfqRxUI8=;
	b=AvWzXgCD7zrY8t6pc/WH/8HD8B9V+kS2ov6w2UMpmNwK9nRVuuZ8C3ZhoBoh2EXHxu
	Wn8ibAFpnP2jd+wdD51jEdVtka1+ct0DWk3US9MOaQIRgj6kHzBq+2Ge+lTmfln4JwDc
	5CON72o1U6uX/a0s1UjKseWidbx0GLz8OhlOo=
Received: by 10.42.176.8 with SMTP id bc8mr6047374icb.12.1322708842088;
	Wed, 30 Nov 2011 19:07:22 -0800 (PST)
Received: from localhost.localdomain (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id wo4sm8367749igc.5.2011.11.30.19.07.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 19:07:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 19:07:07 -0800
Message-Id: <1322708827-27449-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] classes, conf: Exclude native and nativesdk recipes from libc specific override
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
X-List-Received-Date: Thu, 01 Dec 2011 03:14:04 -0000

Based on suggestions from RP

libc-uclibc and libc-glibc overrides are for denoting
system C library in use on the target and not for the
host therefore we make sure that the override only takes
effect for target recipes only.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/native.bbclass                |    3 +++
 meta/classes/nativesdk.bbclass             |    3 +++
 meta/conf/distro/include/tclibc-eglibc.inc |    3 ++-
 meta/conf/distro/include/tclibc-uclibc.inc |    3 ++-
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 8f7cc1f..49823d6 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -92,6 +92,9 @@ EXTRA_NATIVE_PKGCONFIG_PATH ?= ""
 PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
 PKG_CONFIG_SYSROOT_DIR = ""
 
+# we dont want libc-uclibc or libc-glibc to kick in for native recipes
+LIBCOVERRIDE = ""
+
 PATH =. "${COREBASE}/scripts/native-intercept:"
 
 python native_virtclass_handler () {
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index e6204c0..b8abc9f 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -6,6 +6,9 @@ EXCLUDE_FROM_WORLD = "1"
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"
 
+# we dont want libc-uclibc or libc-glibc to kick in for nativesdk recipes
+LIBCOVERRIDE = ""
+
 #
 # Update PACKAGE_ARCH and PACKAGE_ARCHS
 #
diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 8ef3ceb..8b8a214 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -5,7 +5,8 @@
 LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
 
 # Add glibc overrides to the overrides for eglibc.
-OVERRIDES .= ":libc-glibc"
+LIBCOVERRIDE = ":libc-glibc"
+OVERRIDES .= "${LIBCOVERRIDE}"
 
 PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "eglibc-nativesdk"
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index e0f50a0..3984235 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -5,7 +5,8 @@
 LIBCEXTENSION = "-uclibc"
 
 # Add uclibc overrides to the overrides.
-OVERRIDES =. "libc-uclibc:"
+LIBCOVERRIDE = ":libc-uclibc"
+OVERRIDES .= "${LIBCOVERRIDE}"
 
 PREFERRED_PROVIDER_virtual/libc = "uclibc"
 PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
-- 
1.7.5.4



