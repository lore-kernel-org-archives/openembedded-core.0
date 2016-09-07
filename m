Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7173777748
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 5D9401EEA614;
	Wed,  7 Sep 2016 11:09:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ZluUaclFANoy; Wed,  7 Sep 2016 11:09:03 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id DB1171EECBAC;
	Wed,  7 Sep 2016 11:09:02 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 11:08:47 +0200
Message-Id: <51ea676ebac6732b59bd0ea485a54594f5b946e5.1473239261.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH v2 6/8] glibc: remove hard-coded reference to gcc -E
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
X-List-Received-Date: Wed, 07 Sep 2016 09:09:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch | 39 +++++++++++++++++++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb                                             |  3 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
new file mode 100644
index 0000000..d5fce73
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
@@ -0,0 +1,39 @@
+From 2c0ab83eb54c0e0fccbf261726dc03803b236079 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
+Date: Mon, 22 Aug 2016 16:09:25 +0200
+Subject: [PATCH] locale: fix hard-coded reference to gcc -E
+
+When new version of compilers are published, they may not be compatible with 
+older versions of software. This is particularly common when software is built
+with -Werror.
+
+Autotools provides a way for a user to specify the name of his compiler using a
+set of variables ($CC $CXX $CPP etc.). Those variables are used correctly when
+compiling glibc but the script used to generate transliterations in the locale/
+subdirectory directly calls the gcc binary to get the output of the 
+preprocessor instead of using the $CPP variable provided by the build 
+environment. 
+
+This patch replaces the hard-coded reference to the gcc binary with the proper
+environment variable, thus allowing a user to override it.
+
+Upstream-Status : Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
+
+---
+ locale/gen-translit.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/locale/gen-translit.pl b/locale/gen-translit.pl
+index 30d3f2f..7b287fa 100644
+--- a/locale/gen-translit.pl
++++ b/locale/gen-translit.pl
+@@ -1,5 +1,5 @@
+ #!/usr/bin/perl -w
+-open F, "cat C-translit.h.in | gcc -E - |" || die "Cannot preprocess input file";
++open F, 'cat C-translit.h.in | ${CPP:-gcc -E} - |' || die "Cannot preprocess input file";
+ 
+ 
+ sub cstrlen {
+-- 
+2.9.3
+
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index a3ac738..f5a21b2 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -42,7 +42,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
 SRC_URI += "\
            file://etc/ld.so.conf \
            file://generate-supported.mk \
-"
+           file://0001-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           "
 
 SRC_URI_append_class-nativesdk = "\
            file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
-- 
git-series 0.8.9

