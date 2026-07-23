Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C481C531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:41:11 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23710.1784814065094240075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 06:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O92vF9FZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475417f010dso504536f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784814063; x=1785418863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZSY3ZnyGn3rznN+gRCNksA3hkpRwvNoRp6hKm+l2Iw=;
        b=O92vF9FZwUHSFWjndG7NOeFu+6Rta5W8nMaix3/HlMD6LvElKhkai7sWO7Ho1vCoOz
         OSrsEZehSDo/wtJBU1rAOuWEmG6MyaFrc1YJD4wusoBzFTonIpBS8hlwoLI5285j4Qsq
         16Or9F14hktuDm36izzMIe0RL+XuiULMK+19A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784814063; x=1785418863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZSY3ZnyGn3rznN+gRCNksA3hkpRwvNoRp6hKm+l2Iw=;
        b=QdpLt6bsEj6tTNSBnBP+QTNPnBDF4r0cWGFOAutlIkqEhq2u6EA/qMrX1fYty0nl/X
         UCNMHLJSt5UjNvduSZF73qn5ycTYxx4bfZl7SlgdUb0BPmRmj/GOxCAJPchKGn/7Jmed
         +2tNq9+ZZp/RvS8JMLLve7HsAg9F5yzFse1aq4wERLjsxyZrYuc/1hzyJ42JaJ5bw9cQ
         JV09pJGY1eMX8qFx6Bkzb089/ed2db8YVpvjYys5L5pgz0XmB5ZX0pyyzPgVCbB1xH+U
         SBJxzuG4pdW2SYiH5EGJ8iSLMyyLkl1ICdfQqSFuE9RcvJ5ri/OS4M/+TJMJMDFWlZTK
         +hHg==
X-Gm-Message-State: AOJu0YwTQPFfoo4V01I7QKZkA9DtnSuVyt5C33AyQglrhkFTnyKqBtXK
	Ffx7iQvsFc4Zkn6PXsXBYcuhuOsNLS4B0NBEU7t06vzuLd2VEGl25QXV0sNYYRiBJWHB8Eew/Th
	R/aafJVk=
X-Gm-Gg: AR+sD11n5OqnixhuO2k3j8eAWaJrl5pWOo8Z7KwRBzLaHlJ7wQ8mxq5MfxWJn1ONT1y
	l14TYdKDxA3+FghgrUGBGt3pLgKnhe6csPcObYJuPcINiU7k3DKGgkjHkLqPxjFmRuejLSVI9+x
	aeTEioe6nVsqxiOrO4IplECehrqh3kRwqicZjczr9QqzZiLCQ+oWn0ye2WQ9dVLisfXySYr20MM
	gUBpZZl/daAM+Oa//gSbDtl0SeU+2rKmgOVwKAqLGUlz4WBSuMS13um1d8hA4PD6kJ6MK1tJmA3
	D6s893sJI4IKic3zBLFc+l93CqreAZj189JTJbVcvGF5okJmbPJLWuSUJ+DqzeLWOrZnCIpoqhQ
	sfwHPQ/NiZhE6oreiuvkgeQPtQxLigobVvwCnSZ7ImMh3KY7l8PqNMhdYd81Qrb2HNk1B0ashep
	j1+Mlww6bZA6him9ez2bO1PrpAzziL2Gk=
X-Received: by 2002:a5d:64c5:0:b0:47f:853d:476d with SMTP id ffacd0b85a97d-47f8d76de3fmr4065825f8f.10.1784814063149;
        Thu, 23 Jul 2026 06:41:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2205:d253:2df6:b9d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bc62basm15688239f8f.13.2026.07.23.06.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:41:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH] default-distrovars: Enable minidebuginfo DISTRO_FEATURE by default
Date: Thu, 23 Jul 2026 14:41:01 +0100
Message-ID: <20260723134101.864910-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241840

Enable the "minidebuginfo" DISTRO_FEATURE in builds so that all
binaries have just enough debuginfo in them to get a useful stack trace.

This aids with debugging occasional failures that hit the autobuilder,
at minimal cost.  For example, core-image-sato with systemd:

   core-image-sato: IMAGESIZE changed from 481532 to 486044 (+1%)
   glibc: PKGSIZE changed from 3715743 to 3805871 (+2%)
   sqlite3: PKGSIZE changed from 462840 to 469056 (+1%)

[Idea taken from a poky patch from Ross Burton]
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/default-distrovars.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 69c6db589b7..aea458d28c4 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?= " \
     acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
     wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
     gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
+    minidebuginfo \
     "
 IMAGE_FEATURES ?= ""
 

