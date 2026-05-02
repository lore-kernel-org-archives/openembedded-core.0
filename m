Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9362ACD342F
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9399.1777739460460513781
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DF5jkhjT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so21067755e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739458; x=1778344258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=be1Dfh4bgU0vEbVNr63qv3j+C8lrEMIL9EjYxPzfryk=;
        b=DF5jkhjT9U1bgvc9eeOHWKVTVsNl4gwZuA0qML1QqTE1NVzvQ+VwtHiSuFXYSGGPKr
         fxkzTs2LUjNqpPCQH1Fa2fjZr3kzHcMbhzFmzuvdWfhFPoIwnutJQ6+7DmqL5EK0LZuj
         RBvXTG2rj1ec1mtDbLJtwsZwdoaz5VoDkY0kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739458; x=1778344258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=be1Dfh4bgU0vEbVNr63qv3j+C8lrEMIL9EjYxPzfryk=;
        b=dyLCD7isW+tX6XC4NpQuweS/aur+3cMa5CnejPPsbI/PEQubV++lP0vrPOrcCoenyA
         V/gLGnao3mie6rLL4vQj5usPdS+Ie7AzzrXQ3qk6/hWj7701zQQD6Bq4LB0jjSt4BsgC
         +PRt09utPZppEyMdWrE7BJ3UE7d9cXgh3xtVqfj4+7/IFb9GZ+NJhzMIRt+dzz57wxQ1
         Il49AfvA+rfi5QApmpCXVBNZ0Vbr9o4sqZggF1tNjGse0MyzEJGMMiRx3wPuvnrCelHj
         E9HC6PqJ7RFR4i+Idw9lMzzeqoZEz6KxXHrqu+VzqZQYTZaR2ulRMJpMtT7jOjQGV7b8
         qd1Q==
X-Gm-Message-State: AOJu0YzseTaHxrD8SaluuqQ1WWjVZeAq6ep6h3K/WiKoFt7l7te5e6OE
	gi75KAWfFNkRqBfVaydYlnQm5vi6zTpxNgdp2fdN0xYY+zHsBEyLCo8epp7/UltwDspVpKttOIe
	SupwrqrGS0Oh/GistqQxnlDPJy0Hf3fkW0pbG9QEdv9Q2TPwYdatH+SL+jd/BoxDtPCqI+d1jaQ
	/yKIDaejqrcYBGWHA=
X-Gm-Gg: AeBDievpMbXR4FDQIaHkgtVpHeAEHZk4iOx4ifeCEIrPtJBSPfTdHYxCdHeR6Fb9OxA
	6igfArdn7AGzrS6LAe/N5Y84agyRkG9DEUYi7RF4KLWZvIno46uzbayv6bpryHilUzm/6ONPGtQ
	XXDWnm+6lkAIiD+ii2Wn4gzR5FkWfPjTxMmMI+qmRNm5pr2A9qf4EN1RHTnbzfQl+j91aIOuvAs
	peKhfOSVJ49UvwlfnqosoihkOHnh6Y/M9T0y2MX42DGuf2HSYyhxmiSO4T0B/7HzMsRp0UjEQ6H
	6kQzxu3Xq4yKLgYw/HrHtjaqAREyG5Wtp9UCGdR4Z/0fcNZl1r6BXSJTcRf/CEM7AILBVe4r5y/
	pD0lY4NvMgcUkqnjikvCSbgqx7nDiq2qPaUK1g0kWLujehHlifUOUsGq1aTtJgJDzufbFwz8vZp
	f/7XUSyCVeyOYuMisOOFKkGe20Y7fUAXHzuDpTIISAVrM2TYQmWyTAGHYqUX+yOZk=
X-Received: by 2002:a05:600c:c093:b0:488:a9c3:44a3 with SMTP id 5b1f17b1804b1-48a93d94566mr73051055e9.2.1777739458500;
        Sat, 02 May 2026 09:30:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 42/62] python3-pdm: upgrade 2.26.7 -> 2.26.8
Date: Sat,  2 May 2026 17:29:02 +0100
Message-ID: <20260502162929.1377831-42-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236351

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pdm_2.26.7.bb => python3-pdm_2.26.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.7.bb => python3-pdm_2.26.8.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.7.bb b/meta/recipes-devtools/python/python3-pdm_2.26.8.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.7.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.8.bb
index 5e6cdcb4cf1..91fcc6a5af8 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.8.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "0a96a6fb4d60dfeacc1f68bf77efda39503833f6c01866cc8700ea403f0183b7"
+SRC_URI[sha256sum] = "f53a20b4b6beaa88da577a7413ebbb51bee534441339b006dba2260edbc81757"
 
 inherit pypi python_pdm
 

