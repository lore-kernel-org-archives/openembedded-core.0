Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD1EC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:45 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.51620.1658306710937743847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oX+MErDn;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id oy13so31719223ejb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jy3q1ZS5m+jIiejWKettkqwf8qG3JZcOTYq2V9sYV4s=;
        b=oX+MErDnK0DynatayoHaS7A0/8E9ACx0yIK1cv9GyMtTx+kjeCL3Th1euxHauGCdHP
         l+1dH+slJYw/BzWY9VFj5/Q5FttA9pRfHTEtAx4jo/pTOG1qBRAFWtfG6vXqzFefep0h
         l+sFoSIbV8MsOvAJp3mkhw4J6AdB8H6lWZgTR4+/CM9zXcBaDqQB+SHkLdAzdQ6AKuxm
         h/PDk63U9Ef1KuiTUNqKyWganXgwDWcBnVnrUjqAbX+lY9ynLuuApbWamZsfpnNkIMx/
         k4vW+z5602LxpeP0C+OKiL/dSvlpirMbFW53XRlzJR7I2kpAmvBvIBRhzw45v+jrYwI8
         PTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jy3q1ZS5m+jIiejWKettkqwf8qG3JZcOTYq2V9sYV4s=;
        b=5xxzGwhbb+w4nC8M5md8qcnvgDPOGrpzZ7t8WKNTDT3dOTjXzS3bm86sb2evQ8weUo
         RdFaqFM0wru9Cm6R2RxkJmdeBX12lPaLauafz3wlaVV36NOKXAax9fql+AL3mfkBIHJn
         tii+7t9QccTGgCGeCZEnISkU1vUB+aViHU48QehlJLjfYVr7CRijTV9v5bLnUAOxiqHe
         1hNPDe7BI/+C42hSmjXbDebPqCWae8lwZB7sISOGZ/6JkAFYpycuWcatLFfq7q3egd8z
         cG7xvrZi4Mu+eF2zgn/m2O1Qgi/8p/4zrps2WMqL7v0ESQmX6lbhEWqS1iAPCWRwD+zp
         HAHQ==
X-Gm-Message-State: AJIora/XLZpj2b0Rlv1/WDgkoAMS65sBRNiUtMtRQ0Ql+wb6U3pbut2P
	7YQZA9I0uJHdVE8O9gWWsE9nam1/8i0=
X-Google-Smtp-Source: 
 AGRyM1vzEuYDwEQ0z8ARwsGVJq0jCEQFy4/uP+iy9W+o7TQIw/ICH2vGkM5cQRyRgcWFjBVtGP2Tww==
X-Received: by 2002:a17:907:a05c:b0:72b:347b:4f59 with SMTP id
 gz28-20020a170907a05c00b0072b347b4f59mr33036648ejc.764.1658306737314;
        Wed, 20 Jul 2022 01:45:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 48/51] wayland-protocols: upgrade 1.25 -> 1.26
Date: Wed, 20 Jul 2022 10:44:39 +0200
Message-Id: <20220720084442.2940187-48-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168342

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{wayland-protocols_1.25.bb => wayland-protocols_1.26.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.25.bb => wayland-protocols_1.26.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.26.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.26.bb
index 92ba296165..322f55dc71 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.26.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460"
+SRC_URI[sha256sum] = "c553384c1c68afd762fa537a2569cc9074fe7600da12d3472761e77a2ba56f13"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.30.2


