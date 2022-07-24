Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F7CC433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 15:35:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.17757.1658676949543604994
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 08:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QHAyRZZl;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id p8so8321412plq.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HgK87Vz47fhACV7n8UFvXGGPrWYlCpuzhyyuBkJ0tPQ=;
        b=QHAyRZZlHbtFFLHb+IyK417iY2qdWMNMKr9uiYv8kbkjE7o44b+ImKrVz17r+ukL0v
         mEIvh9Sdn5MppnMz0Dila8ajHZu6LRAEyExKGSuebQbI7OQZ3vfXGv2WpxbGI5mpnDL8
         dOjQJaDCG+IRePvpdaVNWqAo6avOcZfdrRNTxTwowN1X2Okxzs1ks+4Llpf5vGIFbk7v
         FkayUtLMtakh8kWNIMzCSWfSqIpmoidfzCSafe6KfH5ib2N+J247KxehAMA5BR7/Usam
         fJUfEqlnbJSYC0WoVk31ol+CJVv2fRD0Bze7DxelgI6UKP2gHbgSL1Kop3GG2CSw5m/5
         rx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HgK87Vz47fhACV7n8UFvXGGPrWYlCpuzhyyuBkJ0tPQ=;
        b=4QKyUY7e5Y4CchVD+Zw+pgm7RHLkEo7O+op2kYTdSzIXi2tYFJjLRYbjMyocTOTTnL
         mMcUdoCIpqXIC6Ddoh/Tu3a/EEt3q+wTl0q4u31/Kn2rKzDTIHk5zLrAMe7fy5EyBMhI
         2p0O8Or86yxva7x6FZpS+06/7+PBNJvF48tr86b+riAIWRaaHQWWZ6BJ3/pbdn6XLZdQ
         eJk//7dflVeoKKBIyQdOFpZY2tZbpCUTm+F9bcm4weURSTJKjnw5XEVPPb1VMLFsTs/0
         s9Lf5GNTiSwx6u9tGgZM1i68FcGMe7WjAFAwIxdbFo9zYtJ/XLZAFGqTl98pteQkMDfj
         X4NQ==
X-Gm-Message-State: AJIora9vPI+/zgp+NWLt562A+EVutzWtYQeOEoO/uG6wboTj+tY6h9zx
	u87lXgk+JRTdLDZj6Rep1EU3wgFp4VsYyQ==
X-Google-Smtp-Source: 
 AGRyM1tAYDTr9msTxPjcoaW50puF4mWwu9roPyMhV8ygQdjOsKq9nRUGIBPWnev0QX2HHifSNKz+JA==
X-Received: by 2002:a17:90b:3b86:b0:1f2:bbf5:e1f9 with SMTP id
 pc6-20020a17090b3b8600b001f2bbf5e1f9mr363207pjb.56.1658676948421;
        Sun, 24 Jul 2022 08:35:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a78c])
        by smtp.gmail.com with ESMTPSA id
 z14-20020aa7958e000000b0052a75004c51sm7875247pfj.146.2022.07.24.08.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 08:35:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] libgcc: Fix standalone target builds with usrmerge distro
 feature
Date: Sun, 24 Jul 2022 08:35:45 -0700
Message-Id: <20220724153545.3987335-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 15:35:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168459

Ignore the rmdir cmd if using usrmerge distro feature since the
intention is to delete /lib or /lib64 but not libdir under /usr and
base_libdir = libdir when usrmerge is enabled in distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use base_libdir != libdir to compare instead of usrmerge distro
    feature

 meta/recipes-devtools/gcc/libgcc-common.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index fbeb43d7186..cf8d6b7ed6e 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -45,10 +45,14 @@ do_install () {
 }
 
 do_install:append:libc-baremetal () {
-	rmdir ${D}${base_libdir}
+	if [ "${base_libdir}" != "${libdir}" ]; then
+		rmdir ${D}${base_libdir}
+	fi
 }
 do_install:append:libc-newlib () {
-	rmdir ${D}${base_libdir}
+	if [ "${base_libdir}" != "${libdir}" ]; then
+		rmdir ${D}${base_libdir}
+	fi
 }
 
 # No rpm package is actually created but -dev depends on it, avoid dnf error
-- 
2.37.1


