Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2017E19D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 11:44:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457YpD5mTyz6p
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 13:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558439077;
	bh=2HyML9XGBzj4BTqPqF13jpLvCr16MSjeoFWuDRHJFrg=;
	h=From:To:Subject:Date:From;
	b=Q2zkxOvWlgZOa5P2Ew9zqDssDkNETdYkZ9s1AnVxzGp+H0P8uM3c8tYPlDYW8VpWs
	ylouMFifGdLcjIvCUCXEOyAm6JgaeRad1KMv8IrErxDDIaMZy6SMgWXXfJg0MiDwtN
	YifnmSDb0qw7LKiceOF8p96kqegXYyt4YtCNnv8rAlWVpkBlskNFvvgKhbdr7J3XlT
	NlyZzCw+zXODxZMeYKJSsOn7bdzhg4vSsM0PMtt2yzCooUh2rwtZ7Xr5mzBzuQgt6v
	i7YolSEAq3uehBQ03EgyWvEPAoBO2iKxYxfgJQHUAANa4QbAUddw4h3o36F+RCZ56z
	hK2fda+8S/zZLLC8mVc3WWGT6o7oD+lbDLBqm8Fe+vOks48R30jhG37nIf5HFcc4nn
	OnnKChWOJMaK/2Ag/2EapzM8/Xv42LE1NuJv2EVm0EJu6aBRpAukBq/jqCCHeVqFZr
	beoJw5sQO2aEI+K0UUCt3zmA94hbzS54k97k1md9CHdUqrb3bM8kQo04LDuvh6OLmh
	zoOKetvG6iHY3im81bxEgCMGB4o/aUrTqbsa50EHIUoh802anLXkwn4p0Kfc1vrf9L
	PqXXKPui5TdM9yJUMAUa5TVkna/Frtw/Jx+qw7t1iRONLuz8012leyerctLmSxiZFt
	MmdePTqBMbdVWOhRjQ/0h47U=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 14:44:35 +0300
Message-Id: <20190521114435.25991-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ofono: Fix another race condition during the build
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
X-List-Received-Date: Tue, 21 May 2019 11:44:38 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-t-overwrite-src_ofonod_DEPENDENCIES.patch | 50 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.29.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch b/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch
new file mode 100644
index 0000000000..77073ddb1c
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch
@@ -0,0 +1,50 @@
+From eeaf8dac80f15a2b7c18d1d4ee63106973a6a873 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@kernel.org>
+Date: Tue, 21 May 2019 14:13:35 +0300
+Subject: Makefile.am: Don't overwrite src_ofonod_DEPENDENCIES
+
+src_ofonod_DEPENDENCIES did overwrite the dependencies
+automatically generated from src_ofonod_LDADD with
+incomplete dependencies.
+
+This fixes the following build error:
+...
+  CCLD     src/ofonod
+libtool:   error: cannot find the library 'gdbus/libgdbus-internal.la' or unhandled argument 'gdbus/libgdbus-internal.la'
+make: *** [Makefile:3448: src/ofonod] Error 1
+
+Upstream-Status: Submitted
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ Makefile.am | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d2e310d5..5edc4488 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -6,12 +6,10 @@ noinst_LTLIBRARIES =
+ if EXTERNAL_ELL
+ ell_cflags = @ELL_CFLAGS@
+ ell_ldadd = @ELL_LIBS@
+-ell_dependencies =
+ ell_built_sources =
+ else
+ ell_cflags =
+ ell_ldadd = ell/libell-internal.la
+-ell_dependencies = $(ell_ldadd)
+ ell_built_sources = ell/internal ell/ell.h
+ 
+ noinst_LTLIBRARIES += ell/libell-internal.la
+@@ -729,8 +727,6 @@ src_ofonod_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) $(ell_ldadd) \
+ src_ofonod_LDFLAGS = -Wl,--export-dynamic \
+ 				-Wl,--version-script=$(srcdir)/src/ofono.ver
+ 
+-src_ofonod_DEPENDENCIES = $(ell_dependencies)
+-
+ BUILT_SOURCES = $(local_headers) $(ell_built_sources) src/builtin.h
+ 
+ CLEANFILES = $(BUILT_SOURCES) $(rules_DATA)
+-- 
+2.20.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono_1.29.bb b/meta/recipes-connectivity/ofono/ofono_1.29.bb
index a22b99a728..4c8633c8ad 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.29.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.29.bb
@@ -5,6 +5,7 @@ SRC_URI  = "\
   file://ofono \
   file://0001-build-Fix-a-race-condition.patch \
   file://0001-build-Add-check-for-explicit_bzero-support.patch \
+  file://0001-Makefile.am-Don-t-overwrite-src_ofonod_DEPENDENCIES.patch \
 "
 SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
 SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
-- 
2.17.1


