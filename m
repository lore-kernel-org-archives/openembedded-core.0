Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E4CC3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.2224.1743577823027368742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B4hGCBj2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so45914325e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577820; x=1744182620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5DifKEIop6wRUzYc+gCWAqay6RPVS1iHoavi4UK3mEY=;
        b=B4hGCBj2N8txC1dPPPQuyc8LCYAizw3XgwrCnwerrNCDf+p5TuarmGeYno8nwh5pnq
         4yy3rRM1bP3ia9IPsanrUhU5UBrYcGm8F1DP8MP3xM3bA4qgoUqMLrkfXoO05jl1J5HE
         AOqKrmLRqPoSL/sfHPKIMHWEp+lLdyIDXTCU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577820; x=1744182620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DifKEIop6wRUzYc+gCWAqay6RPVS1iHoavi4UK3mEY=;
        b=fIAXEJje2dRYCxp0ZyxmxKcvn1BWzNdLCMzPP/0Fuz/MDUZJWeMo1fG5NSsT3hDmaM
         5jpA2P3GbyeiN+U7P6KSQ1dTnR+Z95CdH9/djDdqRa1J+dC9u77PSLU30He/tSE66NXK
         BtEfPrF+mtiWX17FLNglmpM/fW80RwgfyIlkj+KXTV7TLtIbk5oQk42BrnpiztEu2BdN
         fgprZTzH84NpzOpQydUBTT3lkMC4u/kpdlalQKT0uw1/XZitVBBB65U2JZBgtDBEOcZ6
         /mYPmhmS1+HbP8dZ1b7GLawYWNpUhK7ESM8xV+RG08kjOIFZKyRdpII0Cl0CPnafBcoI
         3i5A==
X-Gm-Message-State: AOJu0YwO80Tpjmdn8wQ0597Ujd3mES+Eqc72gSkaqr/xNmg9pC0x9hjQ
	vBvsi4Q3lB1+3SN2OTcuGhuRQB3QJxFvVjjRkNaJWSPSDhkoe3z8lVsDG0QQ3vvP7+ZBuVS5ole
	V
X-Gm-Gg: ASbGncu3wAIkTxmoQ1a4zaEjAxcaVU6O9DY762R6RDRmC3oHN2lmJr7Bb3orcVG3/Ow
	N6wngufWUHmUI3mtVe2zUxeoFFBoaOWwEY8JmsmkOPWI3lPBPr5MEO9Cq299S08rxdXjZTP4iSz
	ux2TyJOxNnzjCOjP8Lne9Cb81CMZFEjd5XOGIx15SuxPfp0ibzj1A16V8hXsjizkiHR4RzD+nAK
	YCPYviS4XnW0H+VtgKCMnNkWZ2GHWO4wvX8AZFZ5MGD7gmn9eqYi/fe6p+BgE7Do+/zDb0BcfIv
	AL9bi+YG+E9LwEeXjo1TvbIAHiac//xEOHeELGeZ4ivBLPUv5DGd266GTx5Qtmvh6Ev6n1klSw=
	=
X-Google-Smtp-Source: AGHT+IGmLoPv64xIxbfhCqI0UIIeQWcuQyhHWJEpCuVWnXIpParoDnpZWeyMXAK4iAtaI7sOIwNEOw==
X-Received: by 2002:a05:600c:45cd:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-43e94a3bccdmr141606695e9.18.1743577820088;
        Wed, 02 Apr 2025 00:10:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/48] at-spi2-core: upgrade 2.56.0 -> 2.56.1
Date: Wed,  2 Apr 2025 08:09:30 +0100
Message-ID: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214174

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../atk/{at-spi2-core_2.56.0.bb => at-spi2-core_2.56.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.0.bb => at-spi2-core_2.56.1.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.0.bb b/meta/recipes-support/atk/at-spi2-core_2.56.1.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.56.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.56.1.bb
index e897a129138..c806779ca8c 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.56.1.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "80d7e8ea0be924e045525367f909d6668dfdd3e87cd40792c6cfd08e6b58e95c"
+SRC_URI[sha256sum] = "fd177fecd8c95006ff0a355eafd7066fe110a2e17eb5eb5fe17ff70e49a4eace"
 
 DEPENDS = " \
 	dbus \

