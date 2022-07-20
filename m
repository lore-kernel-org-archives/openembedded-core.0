Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523E3CCA488
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.51626.1658306728533697715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oO7kbC1T;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id v12so22858290edc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OSPm2xWy5y/IzoYS57o3qCHqAWBChwxgoVDogAvcDR4=;
        b=oO7kbC1T/U1L7JsZEEPzSBmpsNk50tdQEUw3xoeELPYPS2WVgMtnBmhZTbkca+T0X6
         LMxMnPu1IR4X6owYlfNgc03CAHMVmHO6+Q4AWwXcV6suQF7ukZ5vhf03ArfZOQTSCBqA
         b4a7R/iaELRmeVj+OWZeUEa1ChjCFFlWTqxXFPrP5J/mrlShwl60oTyeXM+Kwsr2mKH5
         U6Myc1mOPow1L+g25Y3eoF93yx0GvUSCXVVzqI1It1utlkmp84JbAaTeGbbaoZwbDT0S
         rf//OyQebSfUGVLWPCGEGCvhqPXtTKD3c02mxbtmPNnMMtFMbBs8Md8xr5O0/rvgDhgD
         gtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OSPm2xWy5y/IzoYS57o3qCHqAWBChwxgoVDogAvcDR4=;
        b=Xk5opRNjqCVQyXVFvSziOVdyDLGyJ4N8VOg3JOcxUpa3gH7vDVEzug6Gp3mXuP03bk
         01WH122ABZX+DRByx6/x+uLwmgU5vU8xs8FSlMNlD02JaHQU1oHizAWJRSPQHWYxW1hA
         su7v1TNFpzwutp3nn9ArrcINTb4irPH99o+1ZzPUZMGpWuAqLr9n+vtO48/fuREbVTvk
         jsgpd2CCnIDZj2dKk6Pzid+XTTX7ZlTdu/gPYl9jW3wYbiDdgmkia8RAXommd/aHMe/Q
         RvJLoKMBw9aDMU9GHbnv+6eQGyjpxZR1s/DCE0V6nLUgymnwin7VxjarQ/khDxsLA5r5
         bPtA==
X-Gm-Message-State: AJIora/gFQk2j04hivIcEhjGssHpjZCONxXLGsmqn/XOGmJZ684T5O4x
	bkfNcNEL9vDKi00X7s96N4LCDOSb1PQ=
X-Google-Smtp-Source: 
 AGRyM1vVt+PiL4oqDXsYY1ymwoaE1PtPU9qKMPE5Ey3jmM/Q4B9tcVhTKC2OxCKq2qCPa9WVKXk5Zw==
X-Received: by 2002:a05:6402:529a:b0:43b:b8e4:fca5 with SMTP id
 en26-20020a056402529a00b0043bb8e4fca5mr1809964edb.344.1658306727140;
        Wed, 20 Jul 2022 01:45:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/51] pango: upgrade 1.50.7 -> 1.50.8
Date: Wed, 20 Jul 2022 10:44:29 +0200
Message-Id: <20220720084442.2940187-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168332

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-graphics/pango/{pango_1.50.7.bb => pango_1.50.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.7.bb => pango_1.50.8.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.7.bb b/meta/recipes-graphics/pango/pango_1.50.8.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.7.bb
rename to meta/recipes-graphics/pango/pango_1.50.8.bb
index 01a11a1dac..936526799f 100644
--- a/meta/recipes-graphics/pango/pango_1.50.7.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.8.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Skip-running-test-layout-test.patch \
 "
 
-SRC_URI[archive.sha256sum] = "0477f369a3d4c695df7299a6989dc004756a7f4de27eecac405c6790b7e3ad33"
+SRC_URI[archive.sha256sum] = "cf626f59dd146c023174c4034920e9667f1d25ac2c1569516d63136c311255fa"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.30.2


