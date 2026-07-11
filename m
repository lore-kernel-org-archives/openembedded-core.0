Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE46C44508
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 12:36:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4210.1783773397700580471
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 05:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aCjP5hD1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1678735f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783773396; x=1784378196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5kma4Beqws6KfXnTX/1P/UOUkXmS+6sqsg5aUSss67I=;
        b=aCjP5hD1SMGkD7rccrW0XMk0eg8RHHa28C3MiQVfHvqN+GpMObzNcFRtC9vKzRxCvX
         GeCgMo9ZMeDTszCGwfsnFT5HU0gLSQbqqhebZPadYvRHvVtV5K8U0T5RbktC0q73tL8p
         NcKMt72Q5adJLdN3boiJtIdhgvcNaA6e7Hrew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773396; x=1784378196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5kma4Beqws6KfXnTX/1P/UOUkXmS+6sqsg5aUSss67I=;
        b=UTNS24GU/l91NZn520T/b44lxA7kcb5Sivxx9fUTejys1aiqUB3dXFkKPFUIyoo2Le
         kXxdwsUpA6224lUPKgUqBOcFhoLigjSnJfTch/MwzqUZHp68/Sl5Sz1oMztH6lqpUv16
         j1bytKXLEahV/0Xk5FAcXlYa478nq5JIAFaeIrZhTMfOCseP5O5E4NHw/5hGksEJ76gX
         s29+Vsz7zHEm0z7Mcr1phq4LaKjOw2b3NdDEkNYzl8qDbc6hTbbYmiSLBM/8FE02BodU
         ts33h5DczMITW9MHNlJqFeDPkDZftbmUDR/wHu90gEGuzJwH6B3rg6BLqWycOxIp9bmL
         iOvg==
X-Gm-Message-State: AOJu0YzTuv16qbkoJKsTYs+7TSo2n8sRs4CLaHE1J9dc7VDO+IE0gJR8
	hRxL8Rkv31Sj7fXqneaiLj6FOGLSuDrUHpk1a8eELlOYMZJKEHJ/43LVfyNayeZ/p8FxpIWcFKZ
	PSkYd3jI=
X-Gm-Gg: AfdE7clcAcx++C0TUge6d0S5sj9S07XQ7/I9pk/V+aREN1AXDvgRO9KYK2Fz51L2b0z
	nrT7PJN47OORpnN62Gmuak/T9AOXTrK5ZrZydOkvR0K4fSmCBhluK7hGSUxmHBGNfS5eqQln4Wu
	kbk9JUvWLpwAT5Hvu362O9FvM1Iph7GIu9EaszBwHQBTHew7jCpE9q1z0aeevYYl1AqAPt3LogU
	DAFxOcFUVGacrlV/H3HwKPTbdMwmRB3EFlaOOZDK/nh1r/eYBZD687sZ3SIvbAr08wj4qW2XqpC
	3IH+1f2srA+cY8VYMaFfKaXzuRxpa5u03GxL5eDLljoe5NC+uPbdxdCfLLYsrMIgoSoiLa7U1Rc
	Lgg8knvbjTKMGHVlSPeshWIugBDzCc5XDkqstkgfvxDgtsmgIHRQbP97SiFrwF6yaTA2v5/lwC8
	xZf0bNxQxyU8gRXafX23puoGXOO/n/i1eplCc1xsyWCQ==
X-Received: by 2002:a05:6000:41fb:b0:47d:e5b7:8f2b with SMTP id ffacd0b85a97d-47f2dd428a1mr2687230f8f.53.1783773395826;
        Sat, 11 Jul 2026 05:36:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm77172097f8f.17.2026.07.11.05.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:36:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] xset: upgrade 1.2.5 -> 1.2.6
Date: Sat, 11 Jul 2026 13:36:26 +0100
Message-ID: <20260711123626.1583730-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
References: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 12:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240717

License-update: Upstream added a license identifier, clarify the MIT variant of
the license to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-app/xset/disable-xkb.patch       | 5 ++---
 .../xorg-app/{xset_1.2.5.bb => xset_1.2.6.bb}               | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.5.bb => xset_1.2.6.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
index 0bb05a3b886..e099623688c 100644
--- a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
@@ -1,4 +1,4 @@
-From 3090dcafac7c8080091b5e3e3720209c65251a1a Mon Sep 17 00:00:00 2001
+From a9a90a95047a0a08bb0fd0823961ed9707f451d4 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Mon, 22 May 2006 22:15:57 +0000
 Subject: [PATCH] add "-disable-xkb" option
@@ -6,13 +6,12 @@ Subject: [PATCH] add "-disable-xkb" option
 Upstream-Status: Pending
 
 Rebase for 1.2.1 by: Yu Ke <ke.yu@intel.com>
-
 ---
  configure.ac | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e7c2bdf..8e1ed5e 100644
+index e578bfe..1847258 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -52,11 +52,15 @@ PKG_CHECK_MODULES(SET_XEXT, xext,
diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.5.bb b/meta/recipes-graphics/xorg-app/xset_1.2.6.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-app/xset_1.2.5.bb
rename to meta/recipes-graphics/xorg-app/xset_1.2.6.bb
index 398530f342a..300aec9ebc8 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.6.bb
@@ -5,8 +5,8 @@ SUMMARY = "Utility for setting various user preference options of the display"
 DESCRIPTION = "xset is a utility that is used to set various user \
 preference options of the display."
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bea81cc9827cdf1af0e12c2b8228cf8d"
+LICENSE = "MIT-open-group"
+LIC_FILES_CHKSUM = "file://COPYING;md5=373a2cff5a5e58e7ccff069e0ce9fe74"
 DEPENDS += "libxext libxmu libxau"
 PE = "1"
 
@@ -14,7 +14,7 @@ SRC_URI += "file://disable-xkb.patch"
 
 SRC_URI_EXT = "xz"
 
-SRC_URI[sha256sum] = "9f692d55635b3862cd63633b1222a87680ec283c7a8e8ed6dd698a3147f75e2f"
+SRC_URI[sha256sum] = "623837349ea887bc003f01ee2e4b6b8ddd9c2774f632c6d70eead1b56306b695"
 
 CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--disable-xkb --without-fontcache"

