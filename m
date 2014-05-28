Return-Path: <trevor.woerner@linaro.org>
X-Greylist: delayed 1031 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 13:51:00 UTC
Received: from mail-ie0-f179.google.com (unknown [209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 013136FBFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 13:51:00 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id rd18so10403990iec.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 06:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1ODrgOhB4KGwfjw3UrbTWheLYqro+NSXHv7/5Kf4A+U=;
	b=IFAqWLvsQd+WXOQRjO1ScYDg7b87a8VnCzek3ZtqpeAwOIDit4l+5rQobnPwfn7qv8
	Jx5ZtL1vvrB532eRwjXXODSdG328g2u1fxRNEAyHtO06B7pV8ZiY0dtNZ3VVbdQWK8/v
	43MWSvs5XbGYLSaY3bDglIDKN4p9mUC01yHB70ZRUvQAB+Ki9XIG9gpBtklgweOXQyCV
	GYrHFO4TKs1B+H8f+0pUfQiRlp8EMPWivckFSnPsENeLOEDMgI3+rVwLZturQjvBWfmd
	NvOaE35aBB59FWfkWIfZSFhW4eGaWQPKccRu7p7h+NDFD6OTBg0PQrbcFt6OgTIQErol
	dghQ==
X-Gm-Message-State: ALoCoQkzceNWOTl0Q+AqNOOhVOk/BRFJsUdw3/wLrXut7zbgVd7DaaFcoW6Tm92mzfz1vf+UGjbN
X-Received: by 10.50.127.146 with SMTP id ng18mr42556031igb.10.1401283699761; 
	Wed, 28 May 2014 06:28:19 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id w5sm15833864igk.9.2014.05.28.06.28.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 06:28:19 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 09:26:38 -0400
Message-Id: <1401283598-9136-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [PATCH] grub_git: fix warning->error
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
X-List-Received-Date: Wed, 28 May 2014 13:51:03 -0000

This patch fixes a grub build error which is promoted to an error via -Werror.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
Upstream-status: submitted
---
 ...l-grub-gen-asciih-fix-build-warning-error.patch | 44 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub_git.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub/0001-util-grub-gen-asciih-fix-build-warning-error.patch

diff --git a/meta/recipes-bsp/grub/grub/0001-util-grub-gen-asciih-fix-build-warning-error.patch b/meta/recipes-bsp/grub/grub/0001-util-grub-gen-asciih-fix-build-warning-error.patch
new file mode 100644
index 0000000..cb46cad
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub/0001-util-grub-gen-asciih-fix-build-warning-error.patch
@@ -0,0 +1,44 @@
+From 9b8a9aafae67848cadb5961e5edbb34bea8987e1 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <trevor.woerner@linaro.org>
+Date: Mon, 26 May 2014 12:58:50 -0400
+Subject: [PATCH] util/grub-gen-asciih: fix build warning->error
+
+Using a GCC 4.8.1 cross-compiler for ARM a "may be used uninitialized in this
+function" warning is generated which is converted to an error via -Werror.
+This patch eliminates the warning by initializing the structure then checking
+it has been filled in correctly after calling add_glyph().
+
+Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
+---
+ util/grub-gen-asciih.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/util/grub-gen-asciih.c b/util/grub-gen-asciih.c
+index e01447a..c143afd 100644
+--- a/util/grub-gen-asciih.c
++++ b/util/grub-gen-asciih.c
+@@ -131,6 +131,8 @@ write_font_ascii_bitmap (FILE *file, FT_Face face)
+   struct grub_glyph_info glyph;
+   int char_code;
+ 
++  memset (&glyph, 0, sizeof(glyph));
++
+   fprintf (file, "/* THIS CHUNK OF BYTES IS AUTOMATICALLY GENERATED */\n");
+   fprintf (file, "unsigned char ascii_bitmaps[] =\n");
+   fprintf (file, "{\n");
+@@ -144,6 +146,12 @@ write_font_ascii_bitmap (FILE *file, FT_Face face)
+ 	return;
+       add_glyph (glyph_idx, face, char_code, &glyph);
+ 
++      if (glyph.bitmap == 0)
++        {
++          fprintf (stderr, "grub-gen-asciih: add_glyph not successful");
++          exit (1);
++        }
++
+       if (glyph.width == 8 && glyph.height == 16
+ 	  && glyph.x_ofs == 0 && glyph.y_ofs == 0)
+ 	{
+-- 
+1.9.0
+
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 1b9497c..e2e0bf0 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://40_custom \
            file://autogen.sh-exclude-pc.patch \
            file://grub-2.00-add-oe-kernel.patch \
+           file://0001-util-grub-gen-asciih-fix-build-warning-error.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.9.0


