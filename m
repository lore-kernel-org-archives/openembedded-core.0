Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A02C352AA
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.14026.1650770019720608928
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23O3Da6f028877
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:13:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23O3DaLr019989
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:13:36 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 23 Apr 2022 20:13:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 23 Apr 2022 20:13:35 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sat, 23 Apr 2022 20:13:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH V2] libsdl2: fix CVE-2021-33657
Date: Sun, 24 Apr 2022 11:13:34 +0800
Message-ID: <20220424031334.2089603-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164802

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsdl2/libsdl2/CVE-2021-33657.patch      | 39 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.14.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch
new file mode 100644
index 0000000000..4f744794f2
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch
@@ -0,0 +1,39 @@
+From e39a9a81ab7bbccef1de40d1bc5041c73299c9ce Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 13 Apr 2022 08:53:34 +0800
+Subject: [PATCH] Always create a full 256-entry map in case color values are
+ out of range Fixes #5042
+
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/8c91cf7dba5193f5ce12d06db1336515851c9ee9]
+CVE: CVE-2021-33657
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/video/SDL_pixels.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/video/SDL_pixels.c b/src/video/SDL_pixels.c
+index 84b6932..c27dc6f 100644
+--- a/src/video/SDL_pixels.c
++++ b/src/video/SDL_pixels.c
+@@ -947,7 +947,7 @@ Map1to1(SDL_Palette * src, SDL_Palette * dst, int *identical)
+         }
+         *identical = 0;
+     }
+-    map = (Uint8 *) SDL_malloc(src->ncolors);
++    map = (Uint8 *) SDL_calloc(256, sizeof(Uint8));
+     if (map == NULL) {
+         SDL_OutOfMemory();
+         return (NULL);
+@@ -971,7 +971,7 @@ Map1toN(SDL_PixelFormat * src, Uint8 Rmod, Uint8 Gmod, Uint8 Bmod, Uint8 Amod,
+     SDL_Palette *pal = src->palette;
+ 
+     bpp = ((dst->BytesPerPixel == 3) ? 4 : dst->BytesPerPixel);
+-    map = (Uint8 *) SDL_malloc(pal->ncolors * bpp);
++    map = (Uint8 *) SDL_calloc(256, bpp);
+     if (map == NULL) {
+         SDL_OutOfMemory();
+         return (NULL);
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
index 54556abb27..28b3b20beb 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
@@ -18,6 +18,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://CVE-2021-33657.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.25.1


