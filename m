Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B44CC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.1223.1716311088489893194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=f+P/ORTT;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7948b50225bso29916885a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311087; x=1716915887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfeKzwvGkhZkV/ZkDyRs6UWq7LxfmADQJ/7joks3qFY=;
        b=f+P/ORTT+ze8+mM9YDBxTkhO974q1RMe4Z7S830SFxSLcGx8savtQIBjxEXUPdBTFw
         vskc/bBpVGVG32wntvry0QCouKL//fPHzRyO27bmN4K2JC7pnwN8gSjUr7oHq+iMT5il
         cvooJ8PK1bbZcYiAbdJpTcGJ4N3/t7Kw+uUcBmLp2ZKLeJmiTv39cGUjP1dmYtzxaCaz
         ZQeZd+DbCGEYYyv5nHRvm/ur1ywd6TCWdifXk/3uy7E20mvHGmxCp7tHdI/UlTcROXpw
         bTS8EvI3FWskl7U1RHcP/aSR67TZPh5fDY+QExbiy7XxXhmwe4VeEsOMC4Ae3tw5G1Iu
         P6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311087; x=1716915887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfeKzwvGkhZkV/ZkDyRs6UWq7LxfmADQJ/7joks3qFY=;
        b=PYFDiT2cw7omlDYsS2cz56OXOXMUZaNfp95i60Q6b6FTkIcjlNzM3iYxmk3KzU4xrR
         GDJaRnQ+phkwavxuMHHMNSAtlSN43J93/kKFLSK/EDG2vNj5KHChdWT64c3wYU0F2+zO
         RhpOVzPtDX8mwJ0siQvB7P0XBeQFtwZAsuHahoqrDGB4Xi8syDPeKWWdk1VPDX0bCB7q
         TfA5kdEfXswruyTrqpnRRfmUf145E9IqnLs2oPZ13U9V4sApECMbz6GlRj2kRji6kR5R
         S+p13BJeASZX5oGQE77Sq6q/pxnW5u4v/X2cUMw1fOExmblNmeopAlavnN3CB4A+ERlX
         P7NA==
X-Gm-Message-State: AOJu0YwNxLB11ec7+G1OZJAExsCjjdOpSmEC6YmoTmr+k7p2rZ6VdtMj
	gMZJA0CBFv88RXGpTS/d6SblYsxEf08G2CP7+bkoBToUvfK0AzR0b+yvt/BJnwYYglXjxDvBEox
	M
X-Google-Smtp-Source: AGHT+IF0r8xlHcQs6xcYqr46WKE7YSHtufVGWKdrNGby96kR5bJ3Uq1QGANDt0N0HDi+QviIOQLhBw==
X-Received: by 2002:ae9:ea16:0:b0:792:71d7:f4f5 with SMTP id af79cd13be357-792c757734cmr3329702685a.13.1716311087346;
        Tue, 21 May 2024 10:04:47 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 01/10] python3-hypothesis: upgrade 6.100.1 -> 6.102.4
Date: Tue, 21 May 2024 13:04:36 -0400
Message-ID: <20240521170445.1892398-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199657

Changelog: https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-hypothesis_6.100.1.bb => python3-hypothesis_6.102.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.100.1.bb => python3-hypothesis_6.102.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb
index a689be9a1aa..ec43514d41a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.102.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ebff09d7fa4f1fb6a855a812baf17e578b4481b7b70ec6d96496210d1a4c6c35"
+SRC_URI[sha256sum] = "59b4d144346d5cffb482cc1bafbd21b13ff31608e8c4b3e4630339aee3e87763"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.45.1


