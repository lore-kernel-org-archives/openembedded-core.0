Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 828D165D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 16:22:01 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lj1so1416593pab.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DLlC/iGfosOHceKqKgHjoVVHyQvhVuiqfNmDZPoN3hU=;
	b=qkYy0TcItKWJk1SeO4ivTBuLGaCtFKESRKj5fU5b/Jbz3HmUlVBtfHt28F4Rd8HPGc
	r2JnYUO8yDjH07GHPaLFWsV5ZNnWtVMxzzIUIlMZXhcGco4tgV8xSNOiYKMh6fntMp/V
	lW2c6OWNoFsUcXBUeRVVypwbb8DUgxzXYAevFZR//6fjO/otdj9xlMdeZxbNf5N7ytee
	QNrUGPkG3EVsKCDZHit4Y6Ymag208QtlRX4tsh8NMxF0OceO1A1xkQYoxEOAgEVuLO59
	hf9gUzBKdt0Jxrd9hJBPbMC4C435d4phwaOUOfddCKg2Kr/SaK3wNn7sdrYZkl+QcHoi
	FSJw==
X-Received: by 10.67.30.232 with SMTP id kh8mr2404155pad.149.1414167721908;
	Fri, 24 Oct 2014 09:22:01 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id r9sm4251379pdl.60.2014.10.24.09.22.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Oct 2014 09:22:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Oct 2014 09:24:58 -0700
Message-Id: <1414167898-9441-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <1414167898-9441-1-git-send-email-raj.khem@gmail.com>
References: <1414167898-9441-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] mklibs: Fix loader for mipsel
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
X-List-Received-Date: Fri, 24 Oct 2014 16:22:07 -0000

Additionally treat ld.so to be searched in sysroot

Change-Id: I8b4acb821d9855a1163c7149bc8e369c7c438856
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image-mklibs.bbclass                      |  2 +-
 .../recipes-devtools/mklibs/files/sysrooted-ldso.patch | 18 ++++++++++++++++++
 meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb   |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 11f082b..c455a8e 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -16,7 +16,7 @@ mklibs_optimize_image_doit() {
 		> ${WORKDIR}/mklibs/executables.list
 
 	case ${TARGET_ARCH} in
-		powerpc | mips | microblaze )
+		powerpc | mips | mipsel | microblaze )
 			dynamic_loader="${base_libdir}/ld.so.1"
 			;;
 		powerpc64)
diff --git a/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch b/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
new file mode 100644
index 0000000..75500a0
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/files/sysrooted-ldso.patch
@@ -0,0 +1,18 @@
+In cross builds we will have to respect sysroot
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: mklibs-0.1.39/src/mklibs
+===================================================================
+--- mklibs-0.1.39.orig/src/mklibs	2014-03-01 18:25:36.000000000 +0000
++++ mklibs-0.1.39/src/mklibs	2014-10-19 00:51:46.813534596 +0000
+@@ -495,7 +495,7 @@
+     present_symbols = {}
+     checked_libs = small_libs
+     checked_libs.extend(available_libs)
+-    checked_libs.append(ldlib)
++    checked_libs.append(sysroot + ldlib)
+     for lib in checked_libs:
+         for symbol in provided_symbols(lib):
+             debug(DEBUG_SPAM, "present_symbols adding %s" % symbol)
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb
index ff8d500..9885561 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.39.bb
@@ -9,6 +9,7 @@ DEPENDS = "python-native dpkg-native"
 SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
+	file://sysrooted-ldso.patch \
 "
 
 SRC_URI[md5sum] = "38a579a531401eb76f4bab4ccfb774a2"
-- 
1.9.1


