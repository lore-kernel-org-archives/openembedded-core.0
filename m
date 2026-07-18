Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0046AC4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2529.1784364812687551393
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HtaLci/g;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f6609c657so426621f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364811; x=1784969611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xjEZWzhxLnVW9iiNhf3zO3JZWS8PVrTJfpQCs5hLnM8=;
        b=HtaLci/g0M8ApXaYEmhv6sN/acFetTRcElNpW2QZijuQHyGrH3Vz0onfJSaWRRksrp
         UTEMTSC0qEIJFN4HQzR0Gqs0qydOAzDZVOTWRUSbcrn8Jx1vgB9XuDwpApemr2KB+x+9
         ooCJQygubBG24jNTT1MvYL3Fq1L06zu+UV4ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364811; x=1784969611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xjEZWzhxLnVW9iiNhf3zO3JZWS8PVrTJfpQCs5hLnM8=;
        b=Ot/j20kEh33bsB2e+kaKzjstcK1TqxL9kVvcusY3kbCvPvTI/755IBs7NzNoPOglEr
         O59zwU6ay18Hspq8q6HwM9/UGBc8+m2qZDKOtlZm2lw3XVqCXdNtpsabmgUTgUbTmSAM
         5FxdIOzXV7KcR4HlQZ24cu4uNzTTiO5xPsNUggWUA85DjjVi3rrhx0/3UyRLjYzoaLqn
         8Hr2+BbNibcvvWIGHBkBP6wn7tTwHSvKvFcPbbsigbie7H6ospboBAZ/P16cZH3ziSad
         wKlg3GyJ38l7L1Yta4qDuuqfWIHsXUPEk/WkNwn+NjpXLfkK8TvDhcXan3t7e+cvxHO5
         ceAQ==
X-Gm-Message-State: AOJu0YyjLxRCAIEALNzNqGJnnhfNxBhKDpOwgghKPWLE335isR8UxPAi
	cekxz8cErqNztcWS9/GpN7qCCIoec11bjB43tsQpJl/8JGTa1NVZHXG6U1Grmmpd4vhDxcqidy4
	U61CTKZ8=
X-Gm-Gg: AfdE7cknIz2kKyzlSmEsOI83cjUnxUZA9GGK/OdMZz+3U/gVkAgZAYi2fRKsjn8fC22
	MvoEup+ZcSRPBp/Z0J08MD1tZV39tilpFxNMmJI7UH9d9PbHUqrif6OJjMps3J+wT1ZswC2n8cy
	kLT6i/c3HvgS/3XzfQcCChLOn2fDmFOEE323NDXq0ftI1VAOxcGjx5FX+FsONpwS597rrhC6LdB
	O2MRlw0vQ5Rtk3yGPajCODAPLaFnR/jJ8fG3r9eI7M+2Wu3yUJHFqNH6qFSpuCu+biaFCTTp+XF
	baezIR6WqEiC+EFOmwzZ5dr+rNRlqqleNlcJY+RBR8iULsT/Jw2khBNbh87HYP/MXjj1CUHIKK9
	F8W+zSSzaNnWNT7rqfLx2Y4aJ8igf2Ggc4zfxYYSImVzpyL1opJ0IpADzDrHMr9ML2pCJ+SoZSk
	Fw6/pPl3rlWGhvD5BnmejjHDUNK/8+hYDrJeT2CRsATjpAX1U9tkYb8/RCiw0xq/v5VxDrzyZNq
	6FP2RE=
X-Received: by 2002:a05:600c:4753:b0:493:bc4b:b8c with SMTP id 5b1f17b1804b1-4954a413024mr64781905e9.38.1784364810890;
        Sat, 18 Jul 2026 01:53:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/17] wic: upgrade 0.3.0 -> 0.3.1
Date: Sat, 18 Jul 2026 10:52:55 +0200
Message-ID: <8b904d063685b8122cffaef11fde2439480cf41e.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241253

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b24c4f46bccba16eb6fb2b494d351644704b5371)
[YC: Changelog URL: https://git.yoctoproject.org/wic/log/?h=v0.3.1]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} (90%)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.1.bb
similarity index 90%
rename from meta/recipes-support/wic/wic_0.3.0.bb
rename to meta/recipes-support/wic/wic_0.3.1.bb
index 7dbf84b039a..d9b4cc05c4b 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
 
 SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "5974ade11032f218841d9f449ef0efeee3f9a2ca"
+SRCREV = "6c66da65bf2aac618092811c13792dcbd453d140"
 
 CVE_PRODUCT = "yoctoproject:wic"
 

