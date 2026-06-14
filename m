Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98A8CD98E1
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105050.1781424241050536414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GNQbD2tC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b3e03939so17532795e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424239; x=1782029039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIKWEUNwrdm9DKYihepPPMG3zGijSyC3QCK8h5hpN7U=;
        b=GNQbD2tCH/5vluch0L/YhPO58G1bxho+Ap9UPf5XxZw0dRLqYlc5Zk59Ll22deSLu/
         bijHjGIfOEId4Cqa4hd4Yhruou42YgBO+oH5XBzVDClHNKkAllxOavfTnGYZs7MGDbiB
         Bs2uDqe3mV/sAbzuCdD7sM85hzoZmWlN0gyAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424239; x=1782029039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DIKWEUNwrdm9DKYihepPPMG3zGijSyC3QCK8h5hpN7U=;
        b=L0gSXyUhhDHXY8FJhZ1uYihXe6luzDk0H96N/X0EV/LUxPbMKI6H8CavvYczorRW1e
         XUmULdDN1J8We7oGReOCwU6ggAz+B9Bcbu9H1E/eyxb+eONwckIfLOWgP20Ik314yLmw
         XfPGHIGA2yUviT0PFU+DH65h1H8CGpu8+sTAPorXyiorFunHTQ80j2K3Mu/gyDFN90U5
         GPTjpWvRT6j6Ks/u/PGoTbbusYMtC020uT85kjqlcGMfPHooXDN5AM8RNFWECnogKBRw
         w/oDoX08JHdEXVZqTmsgkxqu5TBZj7py6ANI+W8zbWZhJxboLKbdv0c5Oa9+G2oyuToz
         dCmw==
X-Gm-Message-State: AOJu0YxmCOPlo0B1g2yFARpY+RR8eiwYJck6P/FRCUkIIBnyKf/M+API
	6nILDNrvJB2I2ZHwnkvx/tNzLmh3D4daZL0vDeDjqJYzA0Epbfjb5CFmIrsV4dP9s4p5TF8SdWQ
	NEh/Q
X-Gm-Gg: Acq92OEmYFCIHFmein1MYtshj6zseUDf5zVmOyWR4KLhPIuzthWd1Rb90zdmQDqX+Cj
	psXtBUQB9Q5iG65/9Ia8DXVZW9l6pABWC1FOfLNZh/A/O0uLalqKdB5vZKYlSv1R9ivlrq2snjy
	NLl4qo80Q7Fej1P4gzCebMWGRYwFOi93FCTwCOQjZcIFVlgk6xbws0VvDHesGje1MB3zAwia/6f
	8B1aXJNZ84AkldKKc8SSqYcUBUh3jj4RVKAAQ29465kWdwTZKTySYSkY2LYHENxUPdBL/jaKe50
	KD/Fieb9hz0zK5005DEV+7C/J40JqFmwgHz2W1Bus74y0kCpH0lmP93OzdDQQB7GD/RMibAaRq1
	qASAAjNmKZJwztjGiaksqbe3nIp7fEVlIlVoBFSdeCD03uPG7IXU4/h82Y06gSQHVnQ1i95sUt1
	O7pAkETja47g1q7X0nKU5IPKiiwD6+9DwLlb6D9vbQetGZmb9H55sX
X-Received: by 2002:a05:600c:c171:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490ec4dfb03mr90304025e9.14.1781424239198;
        Sun, 14 Jun 2026 01:03:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 31/56] python3-idna: upgrade 3.17 -> 3.18
Date: Sun, 14 Jun 2026 09:02:42 +0100
Message-ID: <20260614080307.4017177-31-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238715

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-idna_3.17.bb => python3-idna_3.18.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.17.bb => python3-idna_3.18.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.17.bb b/meta/recipes-devtools/python/python3-idna_3.18.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-idna_3.17.bb
rename to meta/recipes-devtools/python/python3-idna_3.18.bb
index bf91b8627d0..3d5e79d0f7a 100644
--- a/meta/recipes-devtools/python/python3-idna_3.17.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "5eb0cb53bc467c12eadcf6de83163ad8527cec9416f44b9b61b19caedad2b87f"
+SRC_URI[sha256sum] = "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
 
 inherit pypi python_flit_core ptest-python-pytest
 

