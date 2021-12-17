Return-Path: <loic.poulain@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D2DC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 13:37:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.6219.1639748270961400566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 05:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZNUz5Snj;
 spf=pass (domain: linaro.org, ip: 209.85.128.50,
 mailfrom: loic.poulain@linaro.org)
Received: by mail-wm1-f50.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so1601196wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 05:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=K93yHeEhTRehXjvsnkbtV8gK9y/yNpuqmo6i3DzfE1k=;
        b=ZNUz5SnjDDtpQIPW+LALREtP1ntt/nqsvAhMKAt/+Gk9wzti+tzDsWHyWnDjNn/3I3
         7jMNtT4A6z3tVfOVXVoZV3hB8glF1wJDThpbsFLPQF9TmYwgw3caIsL5rXCWgCnUnmWb
         BZXw+5N/djV7cwfbN7Wg4cbywqgtpNbP5uVVumsFl9mpKGQI0+BvFcSaQl8xsUVs3z+c
         c/nhTWPn4vB3JLaLdJp6FADbEGAOFwDo+NvetBwsBvdWMQsEyjsjOG+MXf0gnWY61xa3
         l+8crAj42/eJmnN5wcEEWbKnkzuHh5bKbfbwYbX91kH1G+xH3WL24h6bKbNe52dwF4TB
         ggBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=K93yHeEhTRehXjvsnkbtV8gK9y/yNpuqmo6i3DzfE1k=;
        b=QdtxnMiudlx1/fO7i1thAVUPli1K7WysHH1T5t35wvfhm3elLxRWan6tXz48d/D6W8
         /XJ1iDnZVTnpQyp/Esr1j2b6fGtTZOY1f6ImnlwtVZOdZiR7+ed9BS0sdZqVBwYZIBWo
         L4BfOo2y+6SQrX4P7VCrbSFZ2orwvy1FYd0DgdOZXzUSGz3i/HQFfUjQbfKdtIc5eKn5
         6xWkrQ/DhtCx+s3/8MCJYsWz2/GT9vMOOrMgCMtHEjf9jDIZlYsOiZS+4c1zZjxtaLNU
         lAFrZ9/nIsXfD2h3dkmVqVFlJneu393ZKmVk0EHb1hz/nPFIwNs9MF/AMWJiBxYYWIuk
         5Nog==
X-Gm-Message-State: AOAM531c1qsAPZ70zCxiwxtskOiQzxzQoHoi1sGS3xsLAWMiRQcYFWA7
	PFgKRDk+sZmhJzyC4/B7ltfT/tKCAR3mpozF
X-Google-Smtp-Source: 
 ABdhPJykOyJEX38hgRjZHITV0OtZt+/8DAKby03VxFMvz1O7mdVtrB+voWXhsPK6Vyq63luFhcBaww==
X-Received: by 2002:a1c:1b8c:: with SMTP id b134mr2750620wmb.44.1639748268853;
        Fri, 17 Dec 2021 05:37:48 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:9c6e:200e:26e7:6955])
        by smtp.gmail.com with ESMTPSA id
 k33sm4178752wms.21.2021.12.17.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 05:37:48 -0800 (PST)
From: Loic Poulain <loic.poulain@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Loic Poulain <loic.poulain@linaro.org>
Subject: [meta-oe][PATCH 1/2] libqrtr-glib: Initial recipe for libqrtr-glib
 1.0.0
Date: Fri, 17 Dec 2021 14:37:43 +0100
Message-Id: <20211217133744.10922-1-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 13:37:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159825

libqrtr-glib is a glib-based library to use and manage the
QRTR (Qualcomm IPC Router) bus. This bus is in turn a way
to reach remote services via QMI messages. It is especially
used by libqmi, for talking to integrated or PCIe Qualcomm
WWAN modems.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 .../libqrtr-glib/libqrtr-glib_1.0.0.bb              | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_1.0.0.bb

diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_1.0.0.bb b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_1.0.0.bb
new file mode 100644
index 000000000..29f0e2214
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_1.0.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "libqrtr-glib is a glib-based library to use and manage the QRTR bus."
+HOMEPAGE = "https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+DEPENDS = "glib-2.0 glib-2.0-native"
+
+inherit autotools pkgconfig bash-completion gobject-introspection
+
+SRC_URI = "http://www.freedesktop.org/software/libqmi/${BPN}-${PV}.tar.xz"
+
+SRC_URI[sha256sum] = "30d879b2ade6f8f461def3a677755db5c0238babf688d5c83c03b3e6abe35cee"
-- 
2.17.1


