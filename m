Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0768CC0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 03:27:17 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.5006.1690860428276674734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 20:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KF7T/4LE;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-56cbea15415so1242340eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 20:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690860427; x=1691465227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxfFuSr3SMyQJq8aqyk03E6XEO9e7+hRCUfRxGAMGAA=;
        b=KF7T/4LEt0T9Kr3ivP8Kt1hel3sSKw/kalWMEtZ6e5Bx+eYQ0qvPjaLDxPjTf2Fp3r
         QTjuFb/Zq/FNk3X7oqZ+Eh6Tf7nuUshGnYy92lWxf6UQ6cyjnvAaaz2Yfv9myCTVjw36
         k9C+ewVHN3g5KLd0L7HMOKkh3Ypr7W4F0jruyg1n6w3oEmW5wSRr8PaktTrl6C00MHIU
         W3i+x2AE2oz6jisZddvKi6vzP/ftG/UcQ2vDM2Y5+UKdFUXI4/Mx1ik3cb8Tkp67FTnx
         GGKT+Nk1udJQegrl/YPPLZBORqKyoaiFZcpZUhsX925SeLNm2rYQiwRTASPQARjrugHh
         bsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690860427; x=1691465227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxfFuSr3SMyQJq8aqyk03E6XEO9e7+hRCUfRxGAMGAA=;
        b=gLCchXhmWCP+ubxIaJnSESS6daP0gX0XgdLz63htSKGw6JpDSBXKkKCc7+FC6QXvGJ
         wsVFr2ZEKDSgzHPSqaRkrpSTO+AUcsnL/Xjz4F0m0d/SIx0rRFcL2zzNZ4oBIwCFXBLV
         Sn500u5JpviH8uMj6oMcwn8OoeiyDaw/04wL8IsNS9Oal+V+Ky3exBrZi2J6X1kv5EEX
         xgJYcNDU5sQmgNDnRhpH8USoM59pRtpZE9X2oGmSrO9WqlGd7QOHue3sV/zP+EP8AR6L
         lg8EggICST8PZgpWR5u4mSGKCvJJI2yL+d1iDhiYZ5nIK6ADDLhnAA28HacaELQ+Lq0f
         puhw==
X-Gm-Message-State: ABy/qLb1Sj5umCZuk8kv1vlBsY5o/dUrj9ze32btqRJX3opyMopR7U3N
	yTAWISjjEDClS2ADy83viC9s+Eqj7kY2KQ==
X-Google-Smtp-Source: APBJJlF0aMtazu8QPEZ6o5F4xOmGshw3duFCs741X/Sh3nRCP5ldwna+dWGtkg8+co9NkbYEbOhPlg==
X-Received: by 2002:a05:6808:3093:b0:3a4:894a:9f3d with SMTP id bl19-20020a056808309300b003a4894a9f3dmr14368691oib.41.1690860427338;
        Mon, 31 Jul 2023 20:27:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a4d8800b0026822cb85casm6753601pjh.18.2023.07.31.20.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 20:27:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] glibc: Drop --enable-tunables
Date: Mon, 31 Jul 2023 20:27:02 -0700
Message-ID: <20230801032702.1475825-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801032702.1475825-1-raj.khem@gmail.com>
References: <20230801032702.1475825-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185187

Its removed and is implicit default in 2.38+ [1]

[1] https://mail.gnu.org/archive/html/info-gnu/2023-07/msg00010.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.38.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 2021991eb4a..0ebd4c65304 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -70,7 +70,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-clocale=gnu \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
-                --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
                 --disable-crypt \
-- 
2.41.0


