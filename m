Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E80BF31E23
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:29 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144828.1775776279870288534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Dyd2uUX1;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488c2690057so14344365e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776278; x=1776381078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBTX+qTNavn6kWq18ryoO1tzu8j0c9iwV7PD4ZfpRZY=;
        b=Dyd2uUX13J/YcqnibByYcTlgQEmlR6JkFw+/lpuD96DbDTePQFHbU6yLhG63SIx+Wx
         dcHZ4YedODD1DZN6Ho2fCH85XfWu82E/XKPDx2OMVq26wKowCzTZITo1XU77jXJaQTON
         RYj0s9QZCT30zaUSsuyXH6zVCexqQFL+fKQhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776278; x=1776381078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBTX+qTNavn6kWq18ryoO1tzu8j0c9iwV7PD4ZfpRZY=;
        b=AHu0YRDSut63CYKD7raHcVe/qDn1isanqQsSS16+SmMY/ccM1TrxNwBrtByIhzu4vV
         co+Us30JAnkNoUim/xAZIBsyk6fufAd5ElAnsNC2AOUTmIMLWJkQeFkwKV9Aih7RqtLA
         XE3kmZB4yXSnADz2mbzwiD3a6HmhbKSABfo4TatTMZaBBNElHl+2H7YMzjRmw7Tv0N18
         36H1aGLDHb9IryDtuM02ZozwS2caeAxnjNzms2+Jh0dIX+NkLmjZsta89HNMoZwi0a2w
         5JzU9PLXZJUiBo4qIdQxUO3lDQ0KXGZ3OmkwT3dP0AM9jprMnl/JbvvkSepAI8wDjvHH
         FESQ==
X-Gm-Message-State: AOJu0Yxldlw0vLoKuCTX6BellY6foZMapJUnM0q+IAQWgBT1vjAqA6+T
	hge61V9HWN1zcvaNKejjyNbq2Xnl727Nszn/WtbO5rOtZ5Lep2cNm9IfD4320tp969E8uVi6ihg
	mRNRdIpJIYMuh
X-Gm-Gg: AeBDietLQ8/w0a6ROwKpk/rG8S06jhm5JkcmAmLwzX0MF6BTjUSke0P10eKeWED0Pjx
	fYlkzTgc9/19trr1hDGJzVBA5Xiqe+VSiRbIdUaQ+iGmD8tieyPmFDQuT1xS0Wm4CTMPTslvmjk
	bz6ovw86aa4UfU7FcJOgy25//cuaTucNbIZ3JOcoD42f7FZCifGcYESB1yjn3R+AhKhsGp1EMue
	zvp4P1mM72sjsAc5iDzXeF41fMv6kMkrCdle7Zru9HvZtDxtL+J926bFFVxmND8R1gA83MLJbrQ
	4TudkwyEaPUNHlaBJ6XvtlSKb5LZtewSn79ADvTlUl60siyescKtPdlmaf0tlxRixK6sW11UXkU
	zLHlWwnvIWyStFV5aD8BEmhrCegeNeFg6+32/R361O1hs6Hp44d6JEr81Hl2OMuRQ6kBeTR3NZM
	/bQ/yGEUy1Z9cJN7yLJ8WpyVajNRa2c1MlKkEBbouQsfWbQd4zSNIpbm5MVxzSFiItUT0d+qlVZ
	F7Z08iK97u+7SxT3vrTaNb43Cl4
X-Received: by 2002:a05:600c:a105:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-488d681f281mr5423975e9.7.1775776278038;
        Thu, 09 Apr 2026 16:11:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 06/30] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Fri, 10 Apr 2026 01:10:06 +0200
Message-ID: <d40198e70a3b548e5dc7b95dee4fd4b9cb0358bb.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234965

From: Vijay Anusuri <vanusuri@mvista.com>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index bb81d77ccc5..1c08d4b1023 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

