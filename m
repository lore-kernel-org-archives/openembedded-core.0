Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DC8C54EBC
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.182564.1672241025954530333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p+H62wbK;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso8269968wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YlgVUmiYjg1J/GEX49qH/hsjBd0WI8g61dopNy/aw0=;
        b=p+H62wbKls5m9DcXuBghWTppVZd1+B4PV6yagl24gy2xcWAvt2aep6mdrV47b/i3Qo
         JaspEcuRAt6wqSqOhyp8Ewkjgv5SlqJ9iKa8qmeQOtDiFHiYoWxeSXKsgMr9j5Cv1RyY
         xOHkV33dJY5RxIOukMztSqiUjgIWy8PIvLe9Tp+Z4uFHLEF4GFDfUD9Zi1Vc5nWJhCX9
         mYf9HkwIHTWiLGadU322sqTUZhVUU1qf0vIsaBWTd9/FyJrBENj493/bWETQQRdXS4tC
         tFHaVXPnD88c6ww8RnPA+gglJJX1b3ocySKlga4TdivmcJ2LqPX02NsCpbT1NEG9PHDD
         dYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YlgVUmiYjg1J/GEX49qH/hsjBd0WI8g61dopNy/aw0=;
        b=HpElt+xdJfjpV73Jctk4j3eDsWfs5aSZW0i/Tso+dd5vKi+qAirPkL65go3CZQroef
         DYSLcFDKyu68qrEwceP4av9nnMDQ04S0MfPoDz8/X2gQhDD4GUOpT/j3lHuBuQEkfvTH
         yKek0cydC31A18wu/egQcPRgYsnEAimzxn4hCpbmxwymS5ZqHLCn5ZSAJPcg7125HLum
         2Vk+BCW+d0wqPsTUn081H5gbfRCdaMd2LJw9qC0uwbYA8kZjmIFl3Q3XFJ01Pe3EJIY8
         +IV3gcxPa3ke5wNY0zVSjnFZuwDJ6VHFhfT8XS4MrBCDYVlJa7GNwfH10yh12ciYBmG8
         hSRA==
X-Gm-Message-State: AFqh2krY/An1rnzNBfK2RYu8oIjafBQfbBm3jI5O2m32TuZYu07qIvyR
	H3HoMKcblzePceN1efFlyIqRH2Of3Gw=
X-Google-Smtp-Source: AMrXdXuDYTeCbH2Hw6zgQqmN/LT8s3NtZH0e/RTBfUdcUAXEqieJ6AbmqYwqDr0WNzO1zEButV3+fg==
X-Received: by 2002:a05:600c:3ac3:b0:3d1:cfcb:7d19 with SMTP id d3-20020a05600c3ac300b003d1cfcb7d19mr22864495wms.32.1672241024173;
        Wed, 28 Dec 2022 07:23:44 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:43 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 03/12] packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
Date: Wed, 28 Dec 2022 15:23:25 +0000
Message-Id: <20221228152334.25449-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175074

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 .../packagegroups/packagegroup-rust-sdk-target.bb   | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
new file mode 100644
index 000000000000..334b24900b4b
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
@@ -0,0 +1,13 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Target packages for the Rust SDK"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = " \
+    rust \
+"
-- 
2.39.0


