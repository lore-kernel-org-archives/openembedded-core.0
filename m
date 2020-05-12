Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.6561.1589292861990050840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Rcf1o+DT;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M0DD1ypLz4y
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 16:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589292860;
	bh=XJTZlEW+PWNfPoPlcpUriHBuHCZykQ+3Otk1rRjPV3g=;
	h=From:To:Subject:Date:From;
	b=Rcf1o+DTM047ZD8oWSrzai/K1bqQG+LcAXIbfJfm1cbkogHoJ+9Qu25aWNDevcuFM
	 7LCp1WHiozxKco04apqX1cPIe5fKEE7NG8l5Gn0q8Xox/N63PbAnqqJA2o1+WkN5LP
	 RaWMc+AnDNfWqwwIUyIM96y6jsWaIcwgoKH9reGDciUJpQroFMdfFPA6qxxkWxvSlM
	 PS5FnWHsJf6hGJ5qqOCRPbSr9j8R65+lhrC+1UuUhK5Q3pYRNCMTvd6l0U/7CjtJj1
	 w8qlBO+rrYBIHwD6iclkrbAdF6wJg0BpbNXaYVxzpno1PBFXOEszEL+Q2dAsr1eYGt
	 f98sF4GKX5y8KR7KsVWL7KvpIbehe+wE41bSoKuwRy9o+hEoUR2bfsigPFB6tbbP4c
	 7jid8YSJNX/GtXBULnTj8v7FL4RqXcsFVP/GBdemVxC+RZVpnQN8IU4+vvXNxpdPax
	 CKy9oiSO/73OCvU6oniy4GFeMAS7YZCyaCs6NqFqqh9GNCCQIzFolb+maxWjqXos7S
	 I+enFq6FcSLwWVWbo+TVjU9sZrYmrA/nzVUt/rkAnKTHgnOwhqlUwTCrydUuUH9WeU
	 Fllyz99v0s13imBOCkbvxVQd8uK6gPuor7DvFVNKbx42ULvB8oNkrwMZSxg5Tz0jzF
	 lMky6f2eGNOFSFqgZDy9xhVc=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] matchbox-wm: Replace -fcommon with fix
Date: Tue, 12 May 2020 17:14:15 +0300
Message-Id: <20200512141416.5327-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-Fix-build-with-gcc-10.patch          | 41 +++++++++++++++++++
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |  3 +-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..541b5c9c84
--- /dev/null
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
@@ -0,0 +1,41 @@
+From 8a8f8446e803cad04d7bbceaab78ee45d9778c3c Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Tue, 12 May 2020 09:44:05 +0300
+Subject: Fix build with gcc 10
+
+Upstream-Status: Pending
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ src/mbtheme.h | 2 +-
+ src/structs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mbtheme.h b/src/mbtheme.h
+index aa9a7c5..ad03bde 100644
+--- a/src/mbtheme.h
++++ b/src/mbtheme.h
+@@ -46,7 +46,7 @@ typedef struct _mb_theme_param
+ 
+ } MBThemeParam;
+ 
+-enum {
++typedef enum {
+   LAYER_GRADIENT_HORIZ = 1,
+   LAYER_GRADIENT_VERT,
+   LAYER_LABEL,
+diff --git a/src/structs.h b/src/structs.h
+index 24985e7..8f53e72 100644
+--- a/src/structs.h
++++ b/src/structs.h
+@@ -148,7 +148,7 @@
+ 
+ /* Atoms, if you change these check ewmh_init() first */
+ 
+-enum {
++typedef enum {
+   WM_STATE = 0,
+   WM_CHANGE_STATE,
+   WM_PROTOCOLS,
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index 675ee40fa4..a08eb252ce 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -13,6 +13,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
+           file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
@@ -21,8 +22,6 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-CFLAGS += "-fcommon"
-
 FILES_${PN} = "${bindir}/* \
                ${datadir}/matchbox \
                ${sysconfdir}/matchbox \
-- 
2.17.1

