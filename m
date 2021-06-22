Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.158.1624400302543340523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 15:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UhT5RVC9;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id gt18so734252ejc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 15:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IFDKp2+FgCvO49x89SSqBnhtv6fcIKQiGcsBdF6tfIY=;
        b=UhT5RVC9KUMOc8e6RxgexT0vDsNk85+EK9igEqi36pj4gFPbileQotTLtAJwaUBAaT
         t89ZRu0FaD+8uXWHQCLs5MCT2SsJ2M+av9SR9W9Ila8kJejrFCSmSmROLUbe7+xhs6Cy
         NrYqlOQTJmFpaNzGbb007Lt/9BruTNJw3+1usfgZaW/eCe+JHzK2jJYEqEqDD8oW7D2g
         bvXddWN1Nyye7jfoz1L54DNR/8AwS+mMF01QOTRisOVYQ76TTRMEbmVxDQ8lw6CsUIhb
         tsRv7hBluXBC8eqf1EvSy9T/xHFh+dEPqRJKbAJfrGgfQbyJBgH+7bldISag9SUM37eS
         p8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IFDKp2+FgCvO49x89SSqBnhtv6fcIKQiGcsBdF6tfIY=;
        b=KCOQlPyslH5039L9wEOI/jD5zkMDzaJDKGO4IFAch6LRdtFG80F2gWAkx/Sg1jWt1i
         2v/Y2Qavn9Mg25GU7k6ufAifLHSywDt+usCRl1SmPmo4JGMHELX3TP71rnCKYr7N7+1+
         pyCQPC8AmaG/egK9L4Yvwxd9Mk388woZjZT3K6DZ8Ri1rnwrftC1CFGMW/ROyFe3cbl4
         0d8wDDeVHctGchKVyZiv2a04osedGbPELMxs1o1VlRSr6YMUwBAwzxNPCPS2KFsa+agN
         E0M9kPodxNsNMpoJOfmNUi1d8l9UnwaF1SCJ6THR2t3CbwaZXuBi7ETJ2JifnbG5wLiU
         3gvQ==
X-Gm-Message-State: AOAM5318MDIPk+gwWxeNHuvCwiDZq9l0ZgBWFhS2/gRzxOxMKrxVDdKZ
	h4t6ptAdFQKkbSkPNHY7sGqauN/OTWgSgtAF
X-Google-Smtp-Source: ABdhPJwyASs9oey8vM9sfrZqrR+tOBgVuE0Ntl36cgfhlldKN+ImBsqwALaraRbhNax8OlngZrPa/g==
X-Received: by 2002:a17:906:39d7:: with SMTP id i23mr6395275eje.121.1624400301134;
        Tue, 22 Jun 2021 15:18:21 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.googlemail.com with ESMTPSA id j22sm6644476ejt.11.2021.06.22.15.18.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 15:18:21 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree only if KERNEL_DEVICETREE is set
Date: Wed, 23 Jun 2021 00:18:18 +0200
Message-Id: <20210622221818.4613-2-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210622221818.4613-1-andrea.adami@gmail.com>
References: <20210622221818.4613-1-andrea.adami@gmail.com>

Now it unconditionally tries to create package kernel-devicetre even for
legacy devices w/out DT.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 06e6446a08..68369e3791 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -779,4 +779,4 @@ addtask deploy after do_populate_sysroot do_packagedata
 EXPORT_FUNCTIONS do_deploy
 
 # Add using Device Tree support
-inherit kernel-devicetree
+inherit ${@ "" if d.getVar("KERNEL_DEVICETREE" == "") else "kernel-devicetree" }
-- 
2.17.1

