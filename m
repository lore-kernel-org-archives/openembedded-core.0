Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C74CCA483
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 15:11:52 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.13972.1654614703528100877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4kInTsC;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id a15so28794608lfb.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=q4kInTsCcOK1170Ff0C/n+yU6A61JN5ncF9por2XL/iq8Gn6hZdb8X31iR3z6iDVBA
         RFI0wY9x7gQ0G7YVXseUvOzfRozupsgTDg8gi5SK5Ry7jetjtvovmZVdJA6VoRyeRXOe
         zVMs4eLkiedZ04In3S/kZKtII7dmPIl+aWRNTiKtGy4eAbkOJGQSYPNUhTEDhF7MMUdT
         torzmz29ltNEtNWBKZiGRYXuG9Ta4C5cectlBolT7x6Od5hbgg8pvF/WjRsGwpi5TREC
         QJSX3CJV4cJnr/buhMkT1T5yuM1LnQ4W1CCh7MefxbEzUG+A97a/D9f424AtHVM/tTuX
         HF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=h74lYJ1UYKXrZcket1u+PY4xfzJx7nHE4V43MmtcMtVCYfVD7onHNcOPTyRmg7fdl3
         OTWSqTlNwSPEJreolpVacnuTiTea8sMN4vNz8RPcsozz0DopyPupUZYFve4I2jaGFXny
         dAxV31sMCZSD/oMwJSOl4hBz0zjtL+GOO2ARRC6BzVqxbNKXCqEtJtvDiQZUvNfJpv/l
         8/+YWFL7/pxYHqHTiHzjdvFQLykGLcHahwRAGeX8kuv1jsjUjhcbDxwRiF9Risviyjtu
         wJcRy/K/gc3XRLVUEFUstz2Lg8Q+oatm1cf+N6EHZCWv6mtZikGHCeAh2WKYQrFGS2mJ
         V0pw==
X-Gm-Message-State: AOAM5318GO4QqDVpqfb1QjLzlsrSsIoAD62cOoBcumn2n60XGIILpoRI
	ESidqrofrBshWPpouCFOUSW35+pEKA==
X-Google-Smtp-Source: 
 ABdhPJykKQCWdSjPvGX93y9BTIpkUhBPWPvi6iCNUKelRqU28bPKkegbiq1hSg0NU6AUMdSTgpXGEA==
X-Received: by 2002:a05:6512:3b26:b0:479:5610:5672 with SMTP id
 f38-20020a0565123b2600b0047956105672mr4943976lfv.464.1654614701884;
        Tue, 07 Jun 2022 08:11:41 -0700 (PDT)
Received: from pneves-XPS-15-9550.sigma.local
 (85-128-83-172.static.ip.netia.com.pl. [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 i8-20020a05651c120800b002556e0248dbsm2831089lja.124.2022.06.07.08.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 08:11:41 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 2/5] gtk-doc: Fix potential shebang overflow on
 gtkdoc-mkhtml2
Date: Tue,  7 Jun 2022 17:11:20 +0200
Message-Id: <20220607151123.3588947-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607151123.3588947-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 15:11:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166671

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


