Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2378AC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 11:41:22 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.16334.1713872480625027986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 04:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bFTmLeex;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so96453641fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 04:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713872478; x=1714477278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+VPLBpZCUJ4H/ZoozjvpYSjvn8FR98CZZVD3g1Rc3M=;
        b=bFTmLeexLiN4wYGOuYd9q6gfteJcV1kmhevp0syHxLv0LvIp04JttR91WLWy6rkCSP
         811D19KB1nW3e7ri17L+FWaq6X4koJxev6PrelHBhB6m2lGs6Frrz8FPFFDA4516C7C5
         jXNw8iKgl3fEvmqFzN/0E4EzPb2unHSoNPGqoxESnoI4ZOVj2f7SIy2qnpXbO1efRR13
         MxkLE9cHY4huKQ7zEJrmtCklRrawGoJpcjpRz6d1+oz3zvOSV4PfkVj8dIgAbThL97I1
         fUqfapzCWgj09TKUBYxYuv60AXa5sGUuPA8vak6/vQZrPl1CAKa4ErLGM0cZd1wdv4sf
         +lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713872478; x=1714477278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+VPLBpZCUJ4H/ZoozjvpYSjvn8FR98CZZVD3g1Rc3M=;
        b=STvUI0TwfEkM62tt+6loULpcXLFyPKRw6YTGbRYuGffQRBIB1XHNUdAKs6977B9rc+
         2c3docZ8c0ZuusjIGjv2/cJmasFYn8iJl+uVvLwzJ5GMrkvc+d3HMGGiNSSuhSiyCDbt
         JskUpLZiOuB6rbg44YUNx9obC2Qa6wRckBVATXUDuTHWFM/150uLx3Bu6ejQIwMs+K7e
         T/jED03V1XzTIynKzKxviOgfosENE4f1q+lO6Kh6oYCMz4fotO6aRmEeYEuYy8xCf8QV
         C4ay/G1DZuFInmfsND+70ty5aluG7LYAXq9YIVWaFD9cVnId4SOXa6JOxWPkGJRpYS0l
         18cA==
X-Gm-Message-State: AOJu0Yxu0kjUx9a4tVOMhgtNSh8c5xZl5zd3eYU/4DZWwv4j7vr8Hv28
	hl+IsvdTjnBqKo8mlwQ2JT+lweNOkWPsVLzj7RlLM69iCDX6wZ6vGs2dVA==
X-Google-Smtp-Source: AGHT+IGR+tAD6BN4yC23259tGtRz2DksTUBZlGuDiF5HE21mTWbryva9dEtYjEaqxs+5Ro9Q0PZydA==
X-Received: by 2002:a2e:9d47:0:b0:2d8:8fb6:a53d with SMTP id y7-20020a2e9d47000000b002d88fb6a53dmr10000545ljj.42.1713872478154;
        Tue, 23 Apr 2024 04:41:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a7-20020a170906670700b00a522bef9f06sm6934567ejp.181.2024.04.23.04.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 04:41:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] libical: disable introspection in -native
Date: Tue, 23 Apr 2024 13:41:14 +0200
Message-Id: <20240423114115.932621-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 11:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198615

From: Alexander Kanavin <alex@linutronix.de>

libical has a custom cmake introspection support,
and so native provisions by g-i class aren't effective
(it has only standard autoconf/meson options).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libical/libical_3.0.18.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libical/libical_3.0.18.bb b/meta/recipes-support/libical/libical_3.0.18.bb
index 040d23b69d0..052ca57cfb0 100644
--- a/meta/recipes-support/libical/libical_3.0.18.bb
+++ b/meta/recipes-support/libical/libical_3.0.18.bb
@@ -37,7 +37,8 @@ EXTRA_OECMAKE += "-DICAL_BUILD_DOCS=false"
 EXTRA_OECMAKE:append:class-target = " -DGObjectIntrospection_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper"
 EXTRA_OECMAKE:append:class-target = " -DGObjectIntrospection_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper"
 EXTRA_OECMAKE += "-DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen"
-EXTRA_OECMAKE += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DGOBJECT_INTROSPECTION=ON -DICAL_GLIB_VAPI=ON', '-DGOBJECT_INTROSPECTION=OFF', d)}"
+EXTRA_OECMAKE += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DGOBJECT_INTROSPECTION=ON -DICAL_GLIB_VAPI=ON', '-DGOBJECT_INTROSPECTION=OFF -DICAL_GLIB_VAPI=OFF', d)}"
+EXTRA_OECMAKE:append:class-native = " -DGOBJECT_INTROSPECTION=OFF -DICAL_GLIB_VAPI=OFF"
 
 # Tell the cross-libical where the tool it needs to build is
 EXTRA_OECMAKE:append:class-target = " -DIMPORT_ICAL_GLIB_SRC_GENERATOR=${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"
-- 
2.39.2


