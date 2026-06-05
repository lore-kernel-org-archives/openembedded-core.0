Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F619CD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 11:36:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6343.1780659404152070923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 04:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LrRlVRjp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490be03d47bso14873015e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 04:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780659402; x=1781264202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LaXnvZMT4rWnkqS0pfC6kR8jqdycM+0G3PIoNbqjLrg=;
        b=LrRlVRjph2RD6Ux9SROprNybWP0RbBGfwhe6d1L/LSHibSwJ7eZj6eeSXCnL0Yo7xJ
         APef2NrH835edfJdvAzzXPqKPYpN4l84NmoTeWaC+uwFXS5ynsdMPE6vhkyBhuE3dV9K
         WGQDlkuLcz5nB6hm5WPnHdO4s5xhBRBDkmqz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659402; x=1781264202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LaXnvZMT4rWnkqS0pfC6kR8jqdycM+0G3PIoNbqjLrg=;
        b=Dd4qDe0t+lTf7ksxhRG5rOuZVz5LG2eOPSnUkOTGUsLKspFam2/LrCrho1bvus37rn
         HGYah/B+lsC9CmzXRB1hrP3jTrY99p3gSFho4EQDY5pD2OEYfY80VIwzU0RTtJRj6D9L
         ox7+fcn06dnuMO9oiB2LgnGQMaWZE8prYajCiFVtgKZzSrT5/zuzDLzJ5euTVT3rn4uP
         zp7lML9eQDZprZKM7IncWBRHATtJDYh1/0FI+4QZhSpciSSCkG1zmGET3dNbV8dJKIlr
         5EH5eHOP5NxdR3OYJtiDS0SbX3Wc92emQfu3+p3ibKhTa8giP9rHG4tuKPNsZaDej/4u
         gIwg==
X-Gm-Message-State: AOJu0Yz4sHWJEVqWTDkfPS2Y4mbEz8K5Uv8aM7svVKAFt2ukOJP2457p
	LwxNXg/qKe/mC6TWNokCqAYcBjX0c8Yt7AmO3uVrLc4dlywaE00jeXF1fyO7xwn/Yp9yvmF+PCs
	1lt2w
X-Gm-Gg: Acq92OEg3MaENM6+Ua5jlmkq6+GR3cbyuGSzOIA5zlTx8jJ7xY5ycEyq6+My5HVVf9s
	ztN71S2RmAoGIUSvpYEIvR1RU1q16GL3C3IidXRQOoKzISFWfzUG0IASLId6fqrzBLwyti5g0Eh
	HwTlJkWQRwVcjlS+EhkPpcgZ9B5nMMuFiFY/bGxTStoR/4O1U4PR4MazBpBBQvzMrZ/T5UgSrRm
	iYWhFbnCnkEqVDM49wa3W2xXJwV3DAXF01zI++689NwYyvK7Tx6ZXCOb9ZGe8ZLXuUhvPZBW+E5
	LzXTLicoGy+KpZn6BCFCBEl9gf4XO9Pbdcgo7pRVQxfS18+fLs602VZPmkpnGdEkm7wAUVZ8lfT
	Kty4V9iHHB8QtKaDH2Io+vILyJMje5IzAYt/P30qTTZsiUfZeP5ne7IBXh+7CklsCD+LmZfiv0n
	IEj80glI2r58028lz7dIE26rK7vl/8qSO9aBHEhluDE2npt6N5zDp3NHRPsnXSMvc=
X-Received: by 2002:a05:600c:81c9:b0:490:bd66:db49 with SMTP id 5b1f17b1804b1-490c25a1e20mr42096275e9.12.1780659402489;
        Fri, 05 Jun 2026 04:36:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:176b:6db2:d527:85f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm139448205e9.10.2026.06.05.04.36.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:36:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: Allow zstd and xz decompression from the host tools
Date: Fri,  5 Jun 2026 12:36:41 +0100
Message-ID: <20260605113641.3595753-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 11:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238163

We have xz and zstd in HOSTTOOLS but not ASSUME_PROVIDED. In most cases where
we have a dependency on xz-native or zstd-native, we need to compress files
or we need the libraries those recipes provide. In some cases we just need
decompression though.

Compression output is version dependent so we need those dependencies. Libraries
need headers so those are needed too. THe main place we could benefit are the
unpack dependencies from base.bbclass.

Therefore add "XXX-decompress" PROVIDES to those recipes, then change the
dependency in base.bbclass to indicate decompression only. We can then
ASSUME_PROVIDED the decompression side of things to optimise builds whilst
still keeping the other dependencies functional.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass         | 8 ++++----
 meta/conf/bitbake.conf                   | 2 ++
 meta/recipes-extended/xz/xz_5.8.3.bb     | 2 ++
 meta/recipes-extended/zstd/zstd_1.5.7.bb | 2 ++
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index d462593c4e0..4684dbd60c8 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -663,7 +663,7 @@ python () {
 
         # *.zst should DEPEND on zstd-native for unpacking
         elif path.endswith('.zst'):
-            d.appendVarFlag('do_unpack', 'depends', ' zstd-native:do_populate_sysroot')
+            d.appendVarFlag('do_unpack', 'depends', ' zstd-decompress-native:do_populate_sysroot')
 
         # *.lz should DEPEND on lzip-native for unpacking
         elif path.endswith('.lz'):
@@ -671,7 +671,7 @@ python () {
 
         # *.xz should DEPEND on xz-native for unpacking
         elif path.endswith('.xz') or path.endswith('.txz'):
-            d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
+            d.appendVarFlag('do_unpack', 'depends', ' xz-decompress-native:do_populate_sysroot')
 
         # .zip should DEPEND on unzip-native for unpacking
         elif path.endswith('.zip') or path.endswith('.jar'):
@@ -679,11 +679,11 @@ python () {
 
         # Some rpm files may be compressed internally using xz (for example, rpms from Fedora)
         elif path.endswith('.rpm'):
-            d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
+            d.appendVarFlag('do_unpack', 'depends', ' xz-decompress-native:do_populate_sysroot')
 
         # *.deb should DEPEND on xz-native for unpacking
         elif path.endswith('.deb'):
-            d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
+            d.appendVarFlag('do_unpack', 'depends', ' xz-decompress-native:do_populate_sysroot')
 
         # *.7z should DEPEND on 7zip-native for unpacking
         elif path.endswith('.7z'):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4eb235da60a..27d747536e4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -234,6 +234,8 @@ ASSUME_PROVIDED = "\
     virtual/libiconv-native \
     virtual/libintl-native \
     wget-native \
+    xz-decompress-native \
+    zstd-decompress-native \
     "
 # gzip-native should be listed above?
 
diff --git a/meta/recipes-extended/xz/xz_5.8.3.bb b/meta/recipes-extended/xz/xz_5.8.3.bb
index 74efe561c6b..0c0886fa7aa 100644
--- a/meta/recipes-extended/xz/xz_5.8.3.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://tukaani.org/xz/"
 DESCRIPTION = "XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils."
 SECTION = "base"
 
+PROVIDES += "xz-decompress"
+
 # The source includes bits of 0BSD, GPL-2.0, GPL-3.0, LGPL-2.1-or-later, but the
 # only file which is GPL-3.0 is an m4 macro which isn't shipped in any of our
 # packages, and the LGPL bits are under lib/, which appears to be used for
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extended/zstd/zstd_1.5.7.bb
index 66e326f386e..8d147dbeed9 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -5,6 +5,8 @@ It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
 HOMEPAGE = "http://www.zstd.net/"
 SECTION = "console/utils"
 
+PROVIDES += "zstd-decompress"
+
 LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \

