Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6618C4829B
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 16:02:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.24859.1707235333086145931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 08:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+IsSEzo;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40ff812442aso1855555e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707235330; x=1707840130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra0zK/B4Ce7t9y9APAT3ZTKQbqZb/yLJkA08ezCIJ3E=;
        b=h+IsSEzobvZH46khTeP7KZLC1Z02W+RYtdkm0e+RWmRRbyS9Pe8nMzLh0YuizrD26a
         ny6siQ32jtF1oI3dsU4uI9CRnKSoZMoGJXSExXdZ2lPFqF7ITK7zRCVaD3Kq4xYS/8kY
         xpggRK5bGKJviYsniM+Y46qVU0XMLiTSVVaOKKix2ZPUUCJ/cipBs8muVUmzGFOdh0G5
         odAaptpzE1IVRIhqSSb+uLY+1Tmr5ak89fijNM4kdpZf/GFNVlCRW9JgJWhOaYoZV9hy
         99jJ4zvrLHSG4RwdyIbqPLpggX79PJ6fvEyY591rOBqDG9QS+G+ssU9vjhK5l5qeTnCX
         Cq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707235330; x=1707840130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ra0zK/B4Ce7t9y9APAT3ZTKQbqZb/yLJkA08ezCIJ3E=;
        b=ni7Y/naWeB4BNH7xmWO6ATHRHtfmkKXv3siiYqzPmWkvg94PKUWni8y/hTktFmCWMx
         RgS9yI3DIoEpVijxCGkFSRZliWiIfRs25zYH+IHKg+v9d+W8w+x2jrCKo0f4n0rcOKUg
         TA2c98113CxOALvTZWuIUrwpEsOS9KqpeTNdIs0DYjHiaG/yFXEm1p7+0pXRbCG8NfHN
         raSNKa2dUN2M1JfwYLS8BtgKrbFgJdmzFSOxl6ff7LH+XhbbjNutWUCG12U9pbn/B+8Y
         irjooV0mt1A1iC57y3ZX2GX4Mj32RW9A3I5cPyO1cuqcwkwhKjvZ4145lSOoBG0J3HWn
         bf5A==
X-Gm-Message-State: AOJu0YwWCO593JcFH1a0LhAiuLDVbnwGfwAOTUJx/43qCvp0PAKkdqOw
	nwKmqxrtxBEaYdPyS/EqTXmOkDdUhPpPmpWKxE/+EnwopcwAoyVX4qmlBqZO
X-Google-Smtp-Source: AGHT+IEPBB1apTF0P/yLoqnhsSVJV9e6OpiHXboxLGUsyvyZbzXdtOdPP8SuX0nx930I6RAeWoF+Iw==
X-Received: by 2002:adf:e487:0:b0:33b:3820:e72c with SMTP id i7-20020adfe487000000b0033b3820e72cmr1636250wrm.41.1707235330062;
        Tue, 06 Feb 2024 08:02:10 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600001cd00b0033b4341eb78sm2469712wrx.1.2024.02.06.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 08:02:09 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] libpcap: extend with nativesdk
Date: Tue,  6 Feb 2024 17:02:08 +0100
Message-ID: <20240206160208.725799-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 16:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195008

libpcap is requirements to other recipes that could be integrated in
a SDK.

Add nativesdk to BBCLASSEXTEND.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index 27b167c21f..166654e280 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -40,4 +40,4 @@ do_configure:prepend () {
     sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/configure.ac
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


