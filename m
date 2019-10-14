Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2ABD67E648
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 06:43:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9E6hIR8011588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 23:43:19 -0700 (PDT)
Received: from localhost (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 13 Oct 2019 23:43:17 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Oct 2019 14:43:15 +0800
Message-ID: <20191014064315.11654-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.158.164]
Subject: [PATCH] libsdl2: fix CVE-2019-13616
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
X-List-Received-Date: Mon, 14 Oct 2019 06:43:18 -0000
Content-Type: text/plain

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2019-13616

Patch from:
https://hg.libsdl.org/SDL/rev/e7ba650a643a

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...538-validate-image-size-when-loading-BMP-.patch | 34 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch
new file mode 100644
index 0000000..674decc
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch
@@ -0,0 +1,34 @@
+From 85138c1ec673e05263ae666baf61f79384daf7e0 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Tue, 30 Jul 2019 11:00:00 -0700
+Subject: [PATCH] Fixed bug 4538 - validate image size when loading BMP files
+
+Upstream-Status: Backport
+[https://hg.libsdl.org/SDL/rev/e7ba650a643a]
+
+CVE: CVE-2019-13616
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/video/SDL_bmp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/video/SDL_bmp.c b/src/video/SDL_bmp.c
+index 0b68918..a06b0c9 100644
+--- a/src/video/SDL_bmp.c
++++ b/src/video/SDL_bmp.c
+@@ -226,6 +226,11 @@ SDL_LoadBMP_RW(SDL_RWops * src, int freesrc)
+             SDL_RWseek(src, (biSize - headerSize), RW_SEEK_CUR);
+         }
+     }
++    if (biWidth <= 0 || biHeight == 0) {
++        SDL_SetError("BMP file with bad dimensions (%dx%d)", biWidth, biHeight);
++        was_error = SDL_TRUE;
++        goto done;
++    }
+     if (biHeight < 0) {
+         topDown = SDL_TRUE;
+         biHeight = -biHeight;
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index 3a0654b..cdc8650 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -14,6 +14,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.7.4


