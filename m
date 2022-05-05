Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E127C3527C
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7357.1651727160845892830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ogu7Zt2Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id j6so6517393ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wODh3HDRHbrHoq2Zft6xVBh9UW1gGd2VxVm3y/jydx8=;
        b=Ogu7Zt2YiFPaJtU5D7oZ4fAvyDFiViAGiY6E3drFe6k4zBdYlJTCD1pyRo1bCMUVhJ
         gUoT90IX+rYRP+lNXSQ8/GjC2RxSTvuUZKT96afSHVoYLYfhx2dIh0VPqNz4WszqsvAF
         WB1mOszU9IFw1t2qZkexC356j2NTVsveNAB9qBNlh/FERzHoJHRkbiIDmSsxshEYhRxu
         vRgu92zSexry52s2HmDTxrBCdXfGlWQSWUZsPPM6eTGHm0knmsMiARrh7qokRrEE9zng
         kOaGUcgPfTGPAhJ+c1lhbELnioNTaZdg57f6Hw32rL9LxdjV+RBFbnYW5qHsdo+BFY1D
         fF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wODh3HDRHbrHoq2Zft6xVBh9UW1gGd2VxVm3y/jydx8=;
        b=uwWd01WcSaX9YShsU+gpvTpjbOdxi4hcZcOBugX0iBoscV636F6Z3yOylEfaimLYTc
         g+VEsdNOkcZ9dZIiEZAgXaJHV+ycUHX3pKzdNYZh6+bK/CTngTG6KcjfcmMh/9JALgUL
         r0Qwb69Hm+LYQYheBgOgkLSkEp5CZ/kgMlIugAGmtF5KCpvgCxZTX+C1bqBApo0pz0q2
         Q0yDFLCbdtatRZMT7MkwtS+bPPmfGhI+1vuS86HmmHGfBgqXB0BEXy1MHCocURfFoG7l
         b3ZwoLY8YGirb9M5W96WLzzjXhJc843FyF8WpKwhgEn58L6QbmyHYEWrIXk4qO41A/WV
         f3bA==
X-Gm-Message-State: AOAM532a3XHw0tJXcLwiBqAaeugdOsddgTIlRXkN1Vz3dk3w3CNY2wwd
	ZpSWk7Q/pHLUs3pX8ufh9P6WKVIUTmA=
X-Google-Smtp-Source: 
 ABdhPJz8Zfa9KPlwSNEBfDIEYEUzJ2fHb9ccCd36AQeeOp0acuv2qUThsQ/ZRmJ/6t4bVBbOWyi6iQ==
X-Received: by 2002:a17:906:cb09:b0:6f3:87ca:1351 with SMTP id
 lk9-20020a170906cb0900b006f387ca1351mr23776967ejb.674.1651727159408;
        Wed, 04 May 2022 22:05:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/61] diffoscope: upgrade 208 -> 211
Date: Thu,  5 May 2022 07:04:59 +0200
Message-Id: <20220505050544.651895-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165245

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_208.bb => diffoscope_211.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_208.bb => diffoscope_211.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_208.bb b/meta/recipes-support/diffoscope/diffoscope_211.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_208.bb
rename to meta/recipes-support/diffoscope/diffoscope_211.bb
index 3c3b007d60..c634ab44cb 100644
--- a/meta/recipes-support/diffoscope/diffoscope_208.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_211.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2c5c0ac1159eefce158154849fe67f0f527dffc5295bfd3ca1aef14962ffcbcb"
+SRC_URI[sha256sum] = "8e75f3acb181096632e43935ba7a85304703ac54739810b4523919188367ec03"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


