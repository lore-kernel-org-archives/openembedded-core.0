Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4571FCAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:58:45 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.26361.1757919522690740752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=C1yuaYX7;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-26763bb9a92so2998765ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 23:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1757919521; x=1758524321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUdf5Gmd3K7EjAOWKuW7IGDkOrMo9LIwEc8vFxIkmMI=;
        b=C1yuaYX7QZwnbIUtn1Lb0zNrhOwXq52+XtBPKVJixqLsjRG+zSgjlUdDDYizx8LFls
         bd46R7WrzEE3yWkO9zUkIoe4e1MF6L3s4nj9ORhJnRwDCsRuquFXEtlKC30x/Qm0HLN0
         ov0rYy/mQwkxb5+lQVIi99PyowC0zWmp+ADSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757919521; x=1758524321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUdf5Gmd3K7EjAOWKuW7IGDkOrMo9LIwEc8vFxIkmMI=;
        b=aLbOWsE1p+h5VlIjmQ0JkpVI7qf3He8tJG17jQlrK4cPdaPuo8bW9VjHatTnK8kvDT
         r/HUtgNU8OrjdFaEca+IjJoioK2AEzBbYz+n53Q23MhjqxTqBzzY9qYxa1WnbC5+6Uxf
         mSsJvchjopntXeYMmr3hpx8FZ8i+eymcT1yZN1Dg/N0BAW7ke8zjbbNkGdFTLjMsrNaj
         k1HXOO2Fqp+7niO5UzB9GIcPyJyso+onn96egClErF041nQOViamy0qjYB8W48KFoSlr
         f21clXDUxYUY/v9a5CIhygZFoyOc3filnms8mAVyeccIOda81nHqsaJdb0ft3fLs4eof
         In5A==
X-Gm-Message-State: AOJu0YxzIQStUF4VsRTUzq4rTGCgr96MIR4ushb/yHl5FZfqi2kKaGFR
	cmCr0bLJ0LK2QYi1omTQyKCBuH7ksLP5gvi7yNK4LMMqdEJ/572zUKMjz0k+HgbPNkoSl13FwU/
	9hveRxNc=
X-Gm-Gg: ASbGncv7AvxaMfOu66kU1U/lr9QOTOtV9JmeR6xV53KOR/kAYA8YoqR0qzSdmux2W7l
	3LsirPtNx+r0cx+BPFaWhI9G2RpEaWVsgq2SD2dlS/7vbfaiTOMXWoJEa00esSUSHQL7XJnfv4T
	WMM7RBgNa5ggisvcY0rCq7z3IhgTnWjGLzKKDblzLxHh5kaBc81TvYWmXeY339cTk53Xvmcj7n9
	OLsdk3wUhewvB+mhlEgyuIzo/KDiGpJu0ycqPhnMr1eNmUM4ADkEk6SAChmoz3C/Cc/Z3ZBd8AU
	r5CglBIuzHvT9UtEWqUoAIr3TQX9VbYbkS3gIbFFXA69+dghUqP5B/CprxuyLfGEtho/9p/XiJg
	c1InLJW6Ni5gcTJB+7pLPzD84lJ8RzgUBYPek4IBE64Y=
X-Google-Smtp-Source: AGHT+IHgFJ+HsySudfNzk4Pv/m2v1h4ki3N9bWUi6WK8MNJqRYpbIcHHLNxySReeyxiDkn6kzHX3lw==
X-Received: by 2002:a17:903:286:b0:24b:1d30:5b09 with SMTP id d9443c01a7336-25d24bb2603mr107788005ad.13.1757919521321;
        Sun, 14 Sep 2025 23:58:41 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.200.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37293edasm116191705ad.37.2025.09.14.23.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 23:58:40 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH] cups: upgrade 2.4.12 -> 2.4.14
Date: Mon, 15 Sep 2025 12:28:20 +0530
Message-Id: <20250915065820.1563543-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223387

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog:
===========
v2.4.14

The hotfix release brings fix for installation process of localized templates and CUPS web UI home pages.

v2.4.13

The release 2.4.13 brings two CVE fixes - fix for important CVE-2025-58060 and fix for moderate CVE-2025-58364, together with several bug fixes.

The release includes a new feature - new attribute for printer and job objects - print-as-raster - which allows enforce rasterization of the file for IPP Everywhere/AirPrint printers, which supports PDF and raster document formats. The feature is useful for working around internal PDF issues in the printer firmware, for example missing diacritic when printing a PDF.

The detailed list of changes is available in CHANGES.md.

Ref: https://github.com/openprinting/cups/releases

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/cups/{cups_2.4.12.bb => cups_2.4.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.12.bb => cups_2.4.14.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.12.bb b/meta/recipes-extended/cups/cups_2.4.14.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.12.bb
rename to meta/recipes-extended/cups/cups_2.4.14.bb
index ac73c2780f..5d5a1dc97f 100644
--- a/meta/recipes-extended/cups/cups_2.4.12.bb
+++ b/meta/recipes-extended/cups/cups_2.4.14.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59"
+SRC_URI[sha256sum] = "660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699"
-- 
2.25.1


