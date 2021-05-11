Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.12253.1620738853964415306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 06:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fj3ts06n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so1212912wmn.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bN25EJfMlRU51wyzInxNf/5ZclIc+2irk0U0nAsuRe4=;
        b=Fj3ts06nrjPl39BTdjHzJ43iW02dK2pQBDPDcEMN+PLwZwyvHVulFCxRRN75BUM2cN
         IwTIhZhj4Mf3RgKxOcxuPtaCR3226fDTMtQx1qf10dtMB2OTFDXSRoKVJU9D8c3wWThu
         /F3UFfDkP0YL/G2yOnQQzeEDApXBBP8G2Ob+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bN25EJfMlRU51wyzInxNf/5ZclIc+2irk0U0nAsuRe4=;
        b=s24TH4k/YK39dgwS0RwZ1qGPjcqYFxfjQcamPaoO0bf4RiIYjKFEX2Pbk+q/SQsYkl
         3FPYp7fW4t5XD/zuGATigE+/F4Tqk95m8VFBS94cK+Wct2rkPxVs94dL/Trq3CZ+aruh
         U019WbRvXeE//U8fqyV8KTdhuVMsCBkelZ2pnPcrYJl167kzXFAtNddxBVxxgw86IE/0
         Q8wWyyrJSDDadKn3hcX4I0HVGaMeDbZuUYWkmkaCrKq8u/16gQ1vg0sLiDDc7qOU8tjd
         SYW9Pz3OEToT1o+qRMBf2RIl8IQ/nyFM/x+hfJdP7xThootE6XlFDj5OQs2GogOx+jV+
         V50Q==
X-Gm-Message-State: AOAM533vUt3EVtVp6Q/6Bi3BwJBdvV9ihdU3tXD/x2dhsKPAU2ge+CFg
	zJ3NgPjKcgJr5r+i3FX5Tj2BJNZb5lBKdQ==
X-Google-Smtp-Source: ABdhPJzpDGIDhpAoFe5hg8qmAmTcjQ93UVTX3R7nrDmB7o6CemaZSA1kTuy7Jmwjstd3NIsIOfSgUg==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr5487102wmh.185.1620738852177;
        Tue, 11 May 2021 06:14:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id l22sm3379735wmq.28.2021.05.11.06.14.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 06:14:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tiff: Exclude CVE-2015-7313 from cve-check
Date: Tue, 11 May 2021 14:14:11 +0100
Message-Id: <20210511131411.2234095-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some fix upstream addresses the issue, it isn't clear which change this was. Our
current version doesn't have issues with the test image though so we can exclude.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index abf0a67740b..8f929ffb55d 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -15,6 +15,10 @@ SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 
+# Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313
+# and 4.3.0 doesn't have the issue
+CVE_CHECK_WHITELIST += "CVE-2015-7313"
+
 inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
-- 
2.30.2

