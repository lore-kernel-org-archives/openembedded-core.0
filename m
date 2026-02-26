Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77450FD8FF6
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:39:42 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75829.1772127575437863482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sp6N3ROi;
 spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7d18f80b5c2so1101636a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127574; x=1772732374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=Sp6N3ROiMAqWQdQHrLRnj6V7kI0pDn0VXOo3frlmt43xQMVj11pcRGMVTuScEEKNPl
         IMm8gm6TwEcwoZJOJ8HpBVhByM+UwZooucbtVnCUkE7ZPTNgFCpiiFON3D6pKPL6SF/j
         cAoOYPrzsFDNbDAdu1jUaIkCvpUKwFhYPjx8ntmFRIaMZPT7P90b1JKw9lKrZmra/od0
         eD/SUmI54clIVu7l4AhuTUSUiNLxiwhSPwa6nr3W35iMA30ScRTxHxFzupxMFx1VWKiB
         Fs/yGbHPeJrOJDHugAV9Lm26mw6z56xk/3W3ycaYQ83PFu7z2aSBTRHTdUgI6wwN648D
         KBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127574; x=1772732374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=kyYh2heuGuzS74DjJvDrsZQ1abeHV+Elv9vs0TOHiMr/X457el0FzlS0hwzMQ36cCW
         B6nHt1Mu+upBHsQ4q2dl9Va6z0ulQTZshyVoReRco0rQB/IMVKgMgrmO7+XCD7GJcO/C
         eK7M3h93VR9kM6yezQWsSCOx/AyLApNYFfHKG7LorEbw68ql0GBmPeWSmNWJeqZnoXG9
         NPeFR0R+7Oz2JF7bdPKRrv8yFPaQenz/z7eZkd0JvNs3XQlAP9a6i2gIxVuPqp3iVARf
         ZrCiKGDma5nUI86ky0wTiiPWwIA/Jy1poiwxVUeL+HVjl92PggtAT3Peodr66Ihp6Qtd
         EsqQ==
X-Gm-Message-State: AOJu0YyKe7aHd2tDONGHOFy1EOr30OKwf9ofBWkKQu4ZKYvluk6KNOd9
	9GH5isBeadX35XdlofZhSYwS3sMY51WwSGbQtxX9iCDtwTgDxdxL6f/IzAGNWN7D
X-Gm-Gg: ATEYQzw24YP7axe3ZiUWxEwrlp4ZjPmw4A1Yn9ruOMrGWVJ5MRCCk1L9AkCTwiGKBSS
	DKBZm0q99hlO98QEwiDN0fAJDK6kFsBYEc+VYOytBJOtloPNm/I97J2bW20OboRTW/U1ZkY8hth
	3l4Df0SkIXN08KgAK4RSAf0M6NRQOMqjELNvBmyejzLwce6wv9E29sGec7U1y/qXpcMpyEK70py
	VOG2wqti51Yl8Tcr3jQws/DTlLyxJRjqlSOStW9L3OuOiXs4rqCxgiGeNemW4pHod9iHqT/1p5t
	i6OR7fPBaIl2eq6dQAGrt8zEz4dh4TIPsc2EtIPNbg2rxRxH0RuIyHrcGlqRA5uFguNsPokzgEu
	Lmk+EssrqlPeq03XenOKE5XwdT/DXLOpRvv2hWeDXVAV4Cp9LlC5UJ19fdc2a8+0+frRc7VzSvb
	+Idd1hw5sk6CvA7jHsxAtp
X-Received: by 2002:a05:6830:6a97:b0:7d4:5057:5ad1 with SMTP id 46e09a7af769-7d591b27bd8mr6270a34.13.1772127574481;
        Thu, 26 Feb 2026 09:39:34 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm2173027a34.23.2026.02.26.09.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:39:34 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 2/8] gcc-source: Use allarch.bbclass
Date: Thu, 26 Feb 2026 10:33:03 -0700
Message-ID: <20260226173930.2847872-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226173930.2847872-1-JPEWhacker@gmail.com>
References: <20260224230234.679049-1-JPEWhacker@gmail.com>
 <20260226173930.2847872-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232048

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 265bcf4bef..3ac679b1a6 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,11 +1,11 @@
-deltask do_configure 
-deltask do_compile 
-deltask do_install 
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
-deltask do_populate_lic 
+deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


