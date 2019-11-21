Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8641F7F9B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:58:27 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id 1so4271574iou.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ovFR5kxKkS7KyhOVKeQ+p/qIKCaqy8dVxXkOCCaW+jk=;
	b=igsnvFwc9hvU5zhDgrCqph7mOz4+cwOzAvCwhMG7sqXBzxF6q1t8lUb3gH/hakIvp/
	4YB1g3R1Sv67MWNBunkpywmTbRGHc/g0D/+uB4vMggv/shhcclLs1D9kI/BfvSqMPtgQ
	Go1vpBayQL5Ncf9+5QjrpECJpNS+8bhepHnkQD5azXRbhTf4vVa547HVuT6hfN5Ap1Xj
	0rGSFWQEtbcVVoHHaHJwVEpUEJDosa/nmKxmTjz0+IeB6uKMYR5Xa4cIKM4ROVAw0b0X
	WB42FK30/PfeqXp1ovt17p1uRzS1j0QkCnpzBDL6u9aO0JE907gUa+5vkoXFRnlWEG5E
	5N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ovFR5kxKkS7KyhOVKeQ+p/qIKCaqy8dVxXkOCCaW+jk=;
	b=ENf8v8zMFeDgkDp1g+A9l+WootQuEnKZn6Jaty2yACqo0HvH55ME+DEtC+NHtK/NOC
	dDbUx2YibBPJ6OKeq2iZecdno6vO478K1ruxAyMxnh7wzVMtvGQackacSlzQQOGEhkKC
	B3RdFWksVJCZZNehUit61Vur3sIXBUn32zcjfgKj1Ha1qgJWKelObbcTynkSbRZQ+TTw
	NMtO1SRjKBYllzPS6O41O3SixHFu+F9+HF3nKvBak/z5Hpv/3gd5F70XspXEDUu3+U87
	3ZUo9xxgvsomvT6zJYb6Bw8Tr76LmqxUNCjTUVhz5LDXA+ibm02vhumJ+R795/bhtbtS
	Odhg==
X-Gm-Message-State: APjAAAXCuNDZLzU/f+GeZkzGWZAJYM1fMQ6W1GtsXBn/eGyUtV5btFNY
	81ndbzRYPO5zVviRkKEBbbHFafHgB/4=
X-Google-Smtp-Source: APXvYqxd1J9kWYpbhUylzluZFZEuoH36G6g/55Hl5w+0MqcYSyq9PHB7m6OLMrE1D7pHnuJQLYa/og==
X-Received: by 2002:a02:b792:: with SMTP id f18mr9790340jam.32.1574355508384; 
	Thu, 21 Nov 2019 08:58:28 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	i15sm1430038ilj.27.2019.11.21.08.58.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 08:58:27 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 10:58:24 -0600
Message-Id: <20191121165824.1220075-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] librsvg: Fix build reproducibility
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
X-List-Received-Date: Thu, 21 Nov 2019 16:58:27 -0000
Content-Transfer-Encoding: 8bit

librsvg was encoding the path to the build directory in order to find a
font file for testing. This wouldn't work in OE anyway since the build
directory isn't present at that exact location on the target, so remove
the offending path to make the build reproducible.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../0001-Remove-non-reproducible-SRCDIR.patch | 30 +++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.20.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDIR.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDIR.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDIR.patch
new file mode 100644
index 00000000000..75fc7f9d0b9
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-reproducible-SRCDIR.patch
@@ -0,0 +1,30 @@
+From bea5156cd7e7122715b26c769c35928141a1da2c Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Mon, 18 Nov 2019 14:46:34 -0600
+Subject: [PATCH] Remove non-reproducible SRCDIR
+
+Removes SRCDIR as the prefix for finding the test font. This wouldn't
+work anyway, since that path is not present on the target.
+
+This patch is specific to OE, since it appears that this entire method
+of testing was removed when upstream was re-written in rust
+
+Upstream-Status: Inappropriate [OE-specific, no longer present upstream]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ rsvg-cairo-draw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rsvg-cairo-draw.c b/rsvg-cairo-draw.c
+index caa9104..cfb7ed2 100644
+--- a/rsvg-cairo-draw.c
++++ b/rsvg-cairo-draw.c
+@@ -398,7 +398,7 @@ set_font_options_for_testing (PangoContext *context)
+ static void
+ create_font_config_for_testing (RsvgCairoRender *render)
+ {
+-    const char *font_path = SRCDIR "/tests/resources/LiberationSans-Regular.ttf";
++    const char *font_path = "/tests/resources/LiberationSans-Regular.ttf";
+ 
+     if (render->font_config_for_testing != NULL)
+         return;
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
index 7f98127fd01..6dd0533a5de 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
@@ -20,6 +20,7 @@ inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspec
 
 SRC_URI += "file://gtk-option.patch \
             file://0001-Auto-detect-Bsymbolic-fixes-configure-on-macOS.patch \
+            file://0001-Remove-non-reproducible-SRCDIR.patch \
 "
 
 SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
-- 
2.23.0


