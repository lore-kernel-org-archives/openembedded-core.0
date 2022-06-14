Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBB4C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 15:11:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7330.1655219473327778773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oZlGPkjA;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso6395944wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=oZlGPkjAHCVY6utEH6BFRteDdorSEBHLPf/eKKlDl7srcQMvD5RmBpvQvmoPDyGeMG
         wNOkKyTt2SemJ98CmxLDsIapbAc8g/nuHIG57en8GLLfD56iXDOg19hJ/obe0UdR6Hyd
         33Ge6Mfp+S+IqTdYrHHHbUbFWknftKacCgxtZLAFJ00zPiDYDiOoq50+kKYchWuR52Zg
         lrF4d/b9Fn8PcInJPVemt2wG09j9tGHxPFEPGrxXYQCKXotI7j6LZj6t2qUsjPFJFYAz
         unGn37cdu06/uAkSh0gqNPgXkWBFobf21ac9AfBSeZ8HpNxMPygNdilJT6bR3F0bbJh5
         e2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=YNWG3FZE42aXTx7IPro/qoy1dMuGeD9rv1MsYnjy6RKT3C9st3vXWIW8nqNwvFfHlT
         F2Khe4TK8bG0ooQuaXdV1kEdgQGr5elYlEG9iKokZqY32ua1LWzEyMlw1g+AQ+S3V356
         WdXU4dx6UjGTHnC/btiDaLt9VaKim5E34hjPVIuPhq1UkwTwXG1tfax1qP3QaIrqj+JV
         3+YlWPQMX4dZ0ZgxSVfWaFX464plHMznyyUTOJtDFEYxNgt/dpmr8El3oHj/LTFa8hrb
         PaClRxX7LagXAba8+Aiu+cNGne1jL5VjrO006AwzC9VFZbkuPqj9QoNoSqGfEPOBcPDq
         HtWQ==
X-Gm-Message-State: AOAM533GfbNILVzv9qg92Nn7P69+ghJnwraEToqMklg6GmwR1H9JzWOy
	l7ZgddjeNUDwICQE1kXFZqnJqXfLpw==
X-Google-Smtp-Source: 
 ABdhPJy1pzW7b6ccEtVQtyf1gbKgt3gtsdhOsT2hYWHDI+tSqoH0kuy6GFn91lIPI3X5lIzi+PxMeA==
X-Received: by 2002:a7b:ce98:0:b0:39c:4dc7:6707 with SMTP id
 q24-20020a7bce98000000b0039c4dc76707mr4688189wmj.51.1655219471925;
        Tue, 14 Jun 2022 08:11:11 -0700 (PDT)
Received: from localhost.localdomain
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 h62-20020a1c2141000000b0039c151298b7sm18114522wmh.10.2022.06.14.08.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:11:11 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v5 2/7] gtk-doc: Fix potential shebang overflow on
 gtkdoc-mkhtml2
Date: Tue, 14 Jun 2022 17:11:00 +0200
Message-Id: <20220614151105.1890454-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614151105.1890454-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 15:11:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166896

A native path can cause a shebang overflow on gtkdoc-mkhtml.
Replace it with /usr/bin/env.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 150d2c0b23..392913fcc6 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -43,6 +43,7 @@ do_install:append () {
         ${datadir}/gtk-doc/python/gtkdoc/config.py; do
         sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
+            -e '1s|^#!.*|#!/usr/bin/env python3|' \
             -i ${D}$fn
     done
 }
-- 
2.25.1


