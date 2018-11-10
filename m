Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 557AE6C252
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Nov 2018 01:52:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAA1qfji014741
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 17:52:41 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 17:52:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sat, 10 Nov 2018 10:03:19 +0800
Message-ID: <1541815399-29097-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] rng-tools: fix typo of unrecognised options: --disable-jitterntropy
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
X-List-Received-Date: Sat, 10 Nov 2018 01:52:42 -0000
Content-Type: text/plain

- Fix typo of `--disable-jitterntropy' in both of PACKAGECONFIG and configure --help

- Enable jitterntropy for musl

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../rng-tools/0001-configure.ac-fix-typo.patch     | 27 ++++++++++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_6.6.bb    |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-typo.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-typo.patch b/meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-typo.patch
new file mode 100644
index 0000000..d4d28a0
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-configure.ac-fix-typo.patch
@@ -0,0 +1,27 @@
+From 99b0efebd765803203686d89bc4f995bcb103e78 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 10 Nov 2018 09:53:19 +0800
+Subject: [PATCH] configure.ac: fix typo
+
+Upstream-Status: Submitted [https://github.com/nhorman/rng-tools.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4e799dc..0251928 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -62,7 +62,7 @@ AS_IF([test $target_cpu = powerpc64le], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])]
+ AM_CONDITIONAL([JITTER], [false])
+ 
+ AC_ARG_ENABLE(jitterentropy,
+-	AS_HELP_STRING([--disable-jitterntropy | --enable-jitterentropy=<path>],
++	AS_HELP_STRING([--disable-jitterentropy | --enable-jitterentropy=<path>],
+ 	[Disable jitterentropy source, or specify its location]),
+ 	[if [ test -d $enable_jitterentropy ]; then
+ 		export LDFLAGS+=-L$enable_jitterentropy;
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.6.bb b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
index 033af99..4d91216 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.6.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git \
            file://0002-Add-argument-to-control-the-libargp-dependency.patch \
            file://underquote.patch \
            file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
+           file://0001-configure.ac-fix-typo.patch \
            file://init \
            file://default \
            file://rngd.service \
@@ -24,10 +25,10 @@ DEPENDS = "curl \
           "
 
 PACKAGECONFIG ??= "libgcrypt libjitterentropy"
-PACKAGECONFIG_libc-musl = "libargp"
+PACKAGECONFIG_libc-musl = "libargp libjitterentropy"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
 PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
-PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterntropy,libjitterentropy"
+PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
 
 # Refer autogen.sh in rng-tools
 do_configure_prepend() {
-- 
2.7.4


