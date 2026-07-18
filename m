Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0472C44521
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 05:05:13 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.798.1784351111175581961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 22:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QQO5dz2o;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47df440fcd5so4594315f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784351109; x=1784955909; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=450r/B9qx7wA9XDXs0TxZJpd01lL5MbzSQT2iUevacU=;
        b=QQO5dz2oq2u+aOH5M4L1hrmdA0zBREP6rLEjvLRDDIWC5pjo6iV9yzAFdRGxj0G+a/
         3U+shgfwABgvPsJyhWcfe+aA59wJt+kMH2NpPRDrk714RnfYqr/DpkAe8QrOqLutCFXf
         RUPQsaAngsGnnwta/AcdcuQAR24z6lRarDuxRQtE0TGRpegh48rmHbydNoFLb2iKegOk
         IVlk7yQSzPfFeylYfG2ayQCbJ+OJ1BCRdpEOK3bwkihYw23H0cbC2XpBwV0r4WNTZerT
         gU1nlSRclbX2MbR6pf3SiSKs9nifDFk+3z216WBaU/CD3SXpFTBLdEHnQOqLFub4iRUN
         NiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784351109; x=1784955909;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=450r/B9qx7wA9XDXs0TxZJpd01lL5MbzSQT2iUevacU=;
        b=NJTmsdbrp2llIGsHNy8Uq73HK5uWZAlMROzFYc+qhQyW02s8IkxMXKjZA+E5Z7yZo3
         vrFxylHTAh4ZTbLLtoH0c7k4a1330UvQ1cNjBB0LDwvXnE0Y2cYQIAaHZVgp3Ti/5Kue
         YpjpERqfMryukaZEXRDSxOri1Kcq7vICpw5pwF0c6iOBdYihsV68iEB79KJ35IOznI/F
         j4VWfW9bO4N9HfiiBGxaz9In2mzIFLa9qP8dI7S7PGdQf7kJUIdnENWUa+gdNFQHJL2P
         xggdMVcNgCoHv1uDpgisVqh37T9ph65vTSxolv4kCml50Jhw7Ea4C1gcNCWoDrVMTqBL
         2n5g==
X-Gm-Message-State: AOJu0YxNnX2VjpWMWxhwL7Alm12yizgVaVdZimOx2guRekrwAb3JEzFi
	VnJvjOlNXiUsIZHxeeZWE5XMjEPPRSxcHpU66RsIwSdOrbxFXKoHimXxC5l2Tw==
X-Gm-Gg: AfdE7cm8+TiTUOWbIlpnAQmrf5ZbWrgOFie8T5Fnq9NujmBMk/7O0ZfezlYMA61oJBX
	5zDopjJSJuZBrGfXXCc4eSpXlW1ceJOaFhinlBU1GSqFjUnjFBDAnE2S3XcAHxn1bM9X2+c5BOc
	7LtqCYisIo3eyro8RSrbDlvvwgSH+NBMek/QK3zA3Wdby30HkhfgMWs1Ou+OQZ7Fbqzsv07OPQ+
	5vGZtX1sAgUQIdfn/RzrKiIJfBBs/NUWASczlauVdImwikJueAMQkYz5wL4JUMH8toh08Mtmeen
	rQg0N2U1pfrWSM+bc5c1WU1DykwzAEZYGDEh7Wy2VOdXGRIYcy7CnANzdDKLQ7MmPa2phVDJ2tU
	u6rAziSsITDhj35PX2+ABQcoQAfakTUaidxQjODJavPV+aBALEitNijdI9Vnx7xZz5A==
X-Received: by 2002:a5d:5e07:0:b0:475:f100:360d with SMTP id ffacd0b85a97d-47f62340311mr6075425f8f.60.1784351109140;
        Fri, 17 Jul 2026 22:05:09 -0700 (PDT)
Received: from term011.lan (BC24411C.dsl.pool.telekom.hu. [188.36.65.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f66df025csm7781005f8f.0.2026.07.17.22.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 22:05:08 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 1/3] mesa: Upgrade to 26.1.5
Date: Sat, 18 Jul 2026 07:05:00 +0200
Message-ID: <20260718050502.62359-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 05:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241229

See the announcement:
https://lists.freedesktop.org/archives/mesa-dev/2026-July/226671.html

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index bb071e2411..15d56c804d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,8 +23,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            "
 
-SRC_URI[sha256sum] = "072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6"
-PV = "26.1.4"
+SRC_URI[sha256sum] = "79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122"
+PV = "26.1.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.55.0


