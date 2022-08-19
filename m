Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0349AC32772
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.465.1660894084213324710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g1GAXBYp;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so3446359wmk.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Xxvk7uQ7VMTvM1XbFu30tkiw2tCrXcvlS/xWeNAgjdM=;
        b=g1GAXBYpUAuu36iQ9M6LleIG/cwpwiZ9VyJmgkhmpnxsTtwbdSNeFUun2Mw+W5Dr9n
         BTAhRxnECP+pOKv5bhry+sqmd8/7KcsIbHZkd9yhQo1jT1uoKdQzqdN+aTxFXIqC0S+3
         qjYyKqxsOit2YY8Rg61nWYWQ4tC/becbH7vBMAG30EbMFP8nX40D/3p7jnGUz+aFNGRJ
         ynSMJHAt1cZ9cEhkbl3jwXF2v1rUnleu6piJjel0kHuavZ5JfszIwSLm0cbnso6fvH2E
         YxcLhhFtHNpqZ7zM2MVlMCEDHr7uqym58/+GWJCaYau/ckMX5w7Ijip6LcFTQTqoSrl4
         ecvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Xxvk7uQ7VMTvM1XbFu30tkiw2tCrXcvlS/xWeNAgjdM=;
        b=eWh1hvTW/0gE6qEI+3wQ61Kyzmyuu88lqyiRf/1CIhbSVRxSdrDehk12D27Q8L/Fpv
         alfiGfOujIwN2cHg0jaDtyGRSkNfPOgettkcPRk99pMxrvPX5143SfbsCc+5OhnilF8v
         kwMh9dU+inV9W2mgf32Sn5GEw0j6NVncC2XZtYPcs+tT5dxb/YCwDuPnrHMOK3UYOeUJ
         C7KsDbiBiD92CGFKLELCkkg4SGBEd/CAsqxgBLUeI8QVWjMi5LwNn/5UFkDlu87hwmd3
         knX5maFmv0teNBmXo2yKKdtt6yIiqfOmajurHDGr3eYOpC+As1h6GYN4PGCEQOYYoFZK
         3JEQ==
X-Gm-Message-State: ACgBeo3P+kEEUg/vNQtIdW9MTGK5ModfEHIK+XBkUJ9QN1bkxpgyez0f
	VSSGUZ/ekTTofNIZLKYZCdOGJe7ebK8=
X-Google-Smtp-Source: 
 AA6agR4F+qoFPcMa/jtAiWZZOtvsKwt62H+XuS2XedgvxJqUHlbLnQ8wD9vVxf0gpV8pb9soEjQeLg==
X-Received: by 2002:a05:600c:a45:b0:3a4:d07e:112d with SMTP id
 c5-20020a05600c0a4500b003a4d07e112dmr3852918wmq.141.1660894100280;
        Fri, 19 Aug 2022 00:28:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/42] wireless-regdb: upgrade 2022.06.06 -> 2022.08.12
Date: Fri, 19 Aug 2022 09:27:22 +0200
Message-Id: <20220819072727.2236928-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169608

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
index 2eba4f873b..357e79d7e1 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ac00f97efecce5046ed069d1d93f3365fdf994c7c7854a8fc50831e959537230"
+SRC_URI[sha256sum] = "59c8f7d17966db71b27f90e735ee8f5b42ca3527694a8c5e6e9b56bd379c3b84"
 
 inherit bin_package allarch
 
-- 
2.30.2


