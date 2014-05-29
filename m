Return-Path: <trevor.woerner@linaro.org>
X-Greylist: delayed 52669 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 May 2014 04:06:07 UTC
Received: from mail-ig0-f172.google.com (unknown [209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 72C486FBD1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 04:06:07 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id uy17so3329416igb.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 21:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5c/PLpgf0Lkl/OpSNTMYA0i1pBcklKbfRJtumd9NV7Q=;
	b=Xmp03zviDLm5lr34YDlHruM8WtrdAvFeNBbFzwukngbgJsQt5uIQf3kPCVkvIxL46O
	kymwMd66Epeow61bi9qcDHcYHOYRvBbIIM7d4byt5NxIrsevHlZ8UuxyitJHW8s7Kaue
	h85b9S8MBO3FvmVPKe5q0bp0U6kc2YmPGaY2UOpAWDqUIPUf3vb4hLqbqEBtDCzsUxMi
	kqpCRNTAt+KMmqyZ0oeBb/1i2cwLEiKPozRP3EaCrVoNhZHEIi4qwx/3IcfkfiT666Ev
	0iwoXA2wFGBB5VRN4exHxrQrHfP+eSzFGUw4xwuCLMR0fMUgoYyIX2kZlj/QhxXNL0D2
	1Vhw==
X-Gm-Message-State: ALoCoQnhFDNcygh9u09l5PhFqH28HuNzZt56w5oXhNVVS/scDtiNpl8nIVaUefAosSGbYUSdMeE3
X-Received: by 10.50.18.80 with SMTP id u16mr6864431igd.30.1401336368794;
	Wed, 28 May 2014 21:06:08 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	ql7sm20911956igc.19.2014.05.28.21.06.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 21:06:08 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:05:54 -0400
Message-Id: <1401336354-19745-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [PATCH v2] grub_git: fix build warning->error
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
X-List-Received-Date: Thu, 29 May 2014 04:06:11 -0000

This patch fixes a build warning which is promoted to an error via -Werror.

changes from v1:
 * put "Upstream-Status" in patch itself, not in OE patch header
 * fix commit wording

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 .../grub/grub/asciih-fix-build-warning-error.patch | 34 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub_git.bb                  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch

diff --git a/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch b/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch
new file mode 100644
index 0000000..48ace56
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch
@@ -0,0 +1,34 @@
+util/grub-gen-asciih.c: fix build warning->error
+
+A potential problem is flagged by the compiler and generates a warning. This
+warning is promoted to an error via -Werror. This patch fixes the original
+issue, avoids the warning, and therefore avoids the build error.
+
+Upstream-Status: Pending
+
+Index: git/util/grub-gen-asciih.c
+===================================================================
+--- git.orig/util/grub-gen-asciih.c
++++ git/util/grub-gen-asciih.c
+@@ -131,6 +131,8 @@ write_font_ascii_bitmap (FILE *file, FT_
+   struct grub_glyph_info glyph;
+   int char_code;
+ 
++  memset (&glyph, 0, sizeof(glyph));
++
+   fprintf (file, "/* THIS CHUNK OF BYTES IS AUTOMATICALLY GENERATED */\n");
+   fprintf (file, "unsigned char ascii_bitmaps[] =\n");
+   fprintf (file, "{\n");
+@@ -144,6 +146,12 @@ write_font_ascii_bitmap (FILE *file, FT_
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
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 1b9497c..3edc20a 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://40_custom \
            file://autogen.sh-exclude-pc.patch \
            file://grub-2.00-add-oe-kernel.patch \
+           file://asciih-fix-build-warning-error.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.9.0


