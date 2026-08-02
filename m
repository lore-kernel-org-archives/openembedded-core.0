Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889DCC55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:56:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22976.1785675378341115779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DcfuS7ld;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so6144185e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 05:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785675376; x=1786280176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ocid6csZzcacZyRXRHtJyuVJc/biRGDktCUxB/VyDug=;
        b=DcfuS7ld69Z4xPD2eDXPTdFm/2AnNpugnCV4T2C8IvRHUvYpcb0/vW4SoWdnLDUXkS
         07pcod7IwuUGUv4YppGlHlYxXcDgRlgtW2BRtc40LmWZpviy26UT5K6upHIFFJKfQYGR
         PETAN73XRVGBhFfD+ufS9Eeh/zOxNdFSAMzs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785675376; x=1786280176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ocid6csZzcacZyRXRHtJyuVJc/biRGDktCUxB/VyDug=;
        b=H/J7qynadb21b13W6YWaZtO5vintiHoMb2bAzyzzcNeJAuVb3iBUMQtfnPxCVDaIe7
         ePfEt2MPVts3tYaSVaXFBPKgs2mKXNnyzNJ+gZYcEi1vAlCVpwbmxglh3bfeBxT//6xz
         0f1XV3KngxOVU8qr6kp5Y8BO7kKGdXOee2Cv2UEG8WVFTRXXmi/0gAJqjbG39RM9JpNC
         YYjl9snna/0NQO7sD5l4PqYQir1Ru7DQ9PaNLH6IgOWzjlK3IuAsuxpkVO+Xps0zHBvx
         wAGlurBALepXbIcXL0CA2woX9uDbdXL9EhKrhwL2D90iGzFHeBKPZMw5QT39pIusxExU
         BnPQ==
X-Gm-Message-State: AOJu0Yzqc/XG5YPwfn+rLB7tYOFzg0py1/rt9jriEf6BrAACf91S2OMj
	KoFLxr4rkg0uFQUUOBgJ8ChO3MBl2M5CfXtfd2sWcPtItorlVE59BMWUpPQWn6eQUcNXsoZO1wB
	RbSm1rek=
X-Gm-Gg: AR+sD1036OY4DGGZw/K+uPEejm08zrkJn7f5TKnJGes1s8UOd+30IhpqmDC7cPbD2lJ
	v76UuH3QNTHfgv69XiNpA/noT6uDYFlom+O1Fpgq3KCgZmL0TAxeXgal2jzCBNcmEr3W7Ghmvus
	UndRYzGf+z9tgX2Nm0q+JkXlq+SWqOAf+K4N3PHn2F0ZD4nkS5R9tybV/31S9HZG9txRuH/OCE2
	NpIdnInJ/sAYD9oAu0QBW1VTFzO/NXjEVuBMV4sVgWCnl2J3LYzZqoQfMnLws53Qq4rqvXOdItc
	sEn37xcTSYjNQS1+ek1oe+sRAjf9WMLT9VOyUjXbDEkETW+eKiel6lS+qrouhvXEc5dQocbp/FH
	1tJdSMuiR81fJhwx/QjWof6ANmJ1a5ePRlc3eoVFuoRai3qRGrCCU4N/lq24Dl2Vwbm6qqifD7e
	ql6aHLWu+xF9UHpSpxtj145esGFRa2ZFXHBni1p/+iovt+eKuB+lOw2DSCYqQvaPfv+NY66ldkj
	42WGXkG22J3/y6IQw==
X-Received: by 2002:a05:600c:4f84:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-4980c674e31mr128775505e9.18.1785675376583;
        Sun, 02 Aug 2026 05:56:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm21911934f8f.29.2026.08.02.05.56.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:56:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3-pyopenssl: upgrade 26.3.0 -> 26.4.0
Date: Sun,  2 Aug 2026 13:56:07 +0100
Message-ID: <20260802125609.4049666-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
References: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 12:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242559

26.4.0 (2026-08-01)
-------------------

Changes:
^^^^^^^^

- Maximum supported ``cryptography`` version is now 50.x.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-pyopenssl_26.3.0.bb => python3-pyopenssl_26.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_26.3.0.bb => python3-pyopenssl_26.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
index ca6754d4620..6246375afc5 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "589de7fae1c9ea670d18422ed00fc04da787bbde8e1454aea872aa57b49ad341"
+SRC_URI[sha256sum] = "28dfcce0162b9211413e26dfbfdf1d24317fbeba18fc93c12400a1856b2a0bc7"
 
 inherit pypi setuptools3
 

