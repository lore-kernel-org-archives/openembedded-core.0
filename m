Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0ED70260
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 16:11:04 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id x19so1041722ier.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 09:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qPeAstq03I1gnbehJbaKujJLgzOEl4cIYJmXj6B0zuc=;
	b=CNwc4LUVcnyKwJ56HhyZuAGGud8rzUo7iUaSuL6qJVp8hMWxSR6UhHtG5QavwyF1zT
	YWRMbfAawoV721zNUM7wBo1g1j+AXXaKIHt/oHsXXtPtAfGIyYJr4TgB3mSshl21s4hp
	3bcEteqE+AiZJmQbNb2JCpbmVJOiwSLuGM0rxYditbmHBahfAs0bflskg5h7KxZvvHu5
	08C4LidCMpN9eAKp8HVj9TZ/Bhb6EUiyNmvHgZqXwcLRCQtW0obXbaEYdZGNdjSQuVLf
	BCkjpNHr0vgyg8XWPB8z9dmpJRoLvJTy8oTbk3ln6OZHtc9xM66O1cNmuKVnrh94xlTN
	J24w==
X-Gm-Message-State: ALoCoQlW9JUj6vRMccwu7eRThc/SdDERWL6sK/5hjfzQ4qVfgs4z4FoaGuuy/CiVgPm1aZHNGG0a
X-Received: by 10.50.141.170 with SMTP id rp10mr5777493igb.6.1405095065136;
	Fri, 11 Jul 2014 09:11:05 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id aw9sm7142923igc.9.2014.07.11.09.11.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jul 2014 09:11:04 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jul 2014 12:11:01 -0400
Message-Id: <1405095061-29714-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 2.0.1.563.g66f467c
Cc: Koen Kooi <koen.kooi@linaro.org>, patches@linaro.org
Subject: [PATCH] grub_git: bump version, remove patch
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
X-List-Received-Date: Fri, 11 Jul 2014 16:11:07 -0000

A previously upstreamed patch has been applied. Bump the version to
incorporate this upstream update.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 .../grub/grub/asciih-fix-build-warning-error.patch | 34 ----------------------
 meta/recipes-bsp/grub/grub_git.bb                  |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch

diff --git a/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch b/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch
deleted file mode 100644
index 48ace56..0000000
--- a/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-util/grub-gen-asciih.c: fix build warning->error
-
-A potential problem is flagged by the compiler and generates a warning. This
-warning is promoted to an error via -Werror. This patch fixes the original
-issue, avoids the warning, and therefore avoids the build error.
-
-Upstream-Status: Pending
-
-Index: git/util/grub-gen-asciih.c
-===================================================================
---- git.orig/util/grub-gen-asciih.c
-+++ git/util/grub-gen-asciih.c
-@@ -131,6 +131,8 @@ write_font_ascii_bitmap (FILE *file, FT_
-   struct grub_glyph_info glyph;
-   int char_code;
- 
-+  memset (&glyph, 0, sizeof(glyph));
-+
-   fprintf (file, "/* THIS CHUNK OF BYTES IS AUTOMATICALLY GENERATED */\n");
-   fprintf (file, "unsigned char ascii_bitmaps[] =\n");
-   fprintf (file, "{\n");
-@@ -144,6 +146,12 @@ write_font_ascii_bitmap (FILE *file, FT_
- 	return;
-       add_glyph (glyph_idx, face, char_code, &glyph);
- 
-+      if (glyph.bitmap == 0)
-+        {
-+          fprintf (stderr, "grub-gen-asciih: add_glyph not successful");
-+          exit (1);
-+        }
-+
-       if (glyph.width == 8 && glyph.height == 16
- 	  && glyph.x_ofs == 0 && glyph.y_ofs == 0)
- 	{
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 7f89739..f74bae8 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -17,11 +17,10 @@ DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_arm = "1"
 
 PV = "2.00+${SRCPV}"
-SRCREV = "4b8b9135f1676924a8458da528d264bbc7bbb301"
+SRCREV = "87de66d9d83446ecddb29cfbdf7369102c8e209e"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://autogen.sh-exclude-pc.patch \
            file://grub-2.00-add-oe-kernel.patch \
-           file://asciih-fix-build-warning-error.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.0.1.563.g66f467c


