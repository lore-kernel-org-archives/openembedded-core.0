Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F9FC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:17:53 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.3153.1657181866463915962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AWdfLVBh;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id z41so22193055ede.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZB+2y5Xp0Mjt21AaqJ8LdYXzYnEp6TmksesmIIoOhI=;
        b=AWdfLVBhcqzkj44Wqojbmny3A7lgq2+IDzUsjwoswWADNoAQ1/eMpE57SqJeDrvYWh
         IN4jt93zE17GaFEE0PT/JaZor09HWy3P/RoJ7UYG6m/OOCW8KnGS9dnAh6hG/CyQ64lx
         yA3Y6skDM+EhZizGsFvRJe8fyEROD8ODAkLSAUtmjjcVC+a7xiSSkZGyMwXsMsQSTDcN
         wtMIb6RrJD8rFnty5vDf7eswF08OuyUFwljbild9gkEFxyFBi1sdFKPT15ZWKUkpEWbf
         uROAUyFSTGzOz5nBL282Bnxo1fo1xhw2GoJ74HTnQZwlCT3xZlW8yHZm1kRIdO+/a6FC
         4pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZB+2y5Xp0Mjt21AaqJ8LdYXzYnEp6TmksesmIIoOhI=;
        b=V7yyzkV5TaP/Tus0xJocfOzS9E6JWA9VLnVTdDZfWGSqDq8OGK39dD/kxvd+U/EmPY
         wt491s81ueJJ/t1NvzEm5eVdfWpLFkED+nLJ2x3RITEmwLPoIsKyhOmEYSulO42WB0cD
         Ol7Tf8SUB5vkjxhb1eVAaeZJkFojgax0z75Uxf7Md9E/RJEyKua7t7T7XCDR/bNLMyZV
         RmlHeTpZUEL489HZylNbw0qMdMZi/e5gQUjl5+25mX5lZoUD2NAIxdWGdSzsLcYv3OL0
         Ri0QeHRIk/iDOKXmCp/ujt4vu3blT03SJ0mGeMed3bgQrMr6omgUCvGD/eVPicETGk7H
         TnBA==
X-Gm-Message-State: AJIora9GxrQXh91RBRHaVLYMNA015xEvxcnWXHLNH25lL7qniGu4GhGU
	t4URz9p2bfNBLQKUv/72aGfdNSD9fiHZ9BKk
X-Google-Smtp-Source: 
 AGRyM1s33vlWAvgF3YWAf3Nn/YGvlPnglc/8Bqfl3J9naSRRAX98/Bx9CI58qsSIMObRpfxpBZeHFg==
X-Received: by 2002:a50:fc9a:0:b0:43a:5475:8916 with SMTP id
 f26-20020a50fc9a000000b0043a54758916mr27963913edq.155.1657181864768;
        Thu, 07 Jul 2022 01:17:44 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 r6-20020aa7cb86000000b0043a734c7393sm6771961edt.31.2022.07.07.01.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:17:44 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 1/2] libqmi: upgrade 1.30.4 -> 1.30.8
Date: Thu,  7 Jul 2022 10:17:03 +0200
Message-Id: <20220707081704.2494733-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220707081704.2494733-1-adrian.freihofer@siemens.com>
References: <20220707081704.2494733-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 08:17:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167759

Update to latest stable version:

1.30.8
* New request/response/indications:
  ** dms: new 'Foxconn FCC authentication v2' request/response.

1.30.6
* build:
  ** meson: fix 'export_packages' in GIR setup.
* libqmi-glib:
  ** net-port-manager: use unaligned netlink attribute length.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
index 4807244a5..a1cfe29cc 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 
 inherit meson pkgconfig bash-completion gobject-introspection
 
-SRCREV ?= "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"
+SRCREV ?= "95108b6eebfefa6621a1c34565f562eeca9308b9"
 # patch 0001 is on main branch upstream
 SRC_URI = "\
     git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-30 \
-- 
2.35.3


