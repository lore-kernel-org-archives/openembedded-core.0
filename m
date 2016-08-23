Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id D513076E5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 7F2591EE0820;
	Tue, 23 Aug 2016 09:25:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Rmmakpm654ti; Tue, 23 Aug 2016 09:25:42 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id 358211EE07F6;
	Tue, 23 Aug 2016 09:25:42 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:25:29 +0200
Message-Id: <206bf819f402d94d3261b1f4590330ef41449e4d.1471936926.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH 8/8] [glibc] remove hard-coded reference to gcc -E
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
X-List-Received-Date: Tue, 23 Aug 2016 07:25:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch | 23 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb                                             |  6 ++----
 2 files changed, 25 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
new file mode 100644
index 0000000..8fe681f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
@@ -0,0 +1,23 @@
+From 2c0ab83eb54c0e0fccbf261726dc03803b236079 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
+Date: Mon, 22 Aug 2016 16:09:25 +0200
+Subject: [PATCH] locale: fix hard-coded reference to gcc -E
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
++open F, 'cat C-translit.h.in | $CPP - |' || die "Cannot preprocess input file";
+ 
+ 
+ sub cstrlen {
+-- 
+2.9.3
+
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index e446e7a..a15c323 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -36,12 +36,10 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-"
-
-SRC_URI += "\
            file://etc/ld.so.conf \
            file://generate-supported.mk \
-"
+           file://0001-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           "
 
 SRC_URI_append_class-nativesdk = "\
            file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
-- 
git-series 0.8.9

