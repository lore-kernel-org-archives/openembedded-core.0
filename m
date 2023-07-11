Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA93EB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 20:10:48 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.6431.1689106246286911841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 13:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IXbCYfwJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso2270034a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689106245; x=1691698245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVt7PoVNeT68yWei5sXnxLy7lmJ+r6xLCmBEdj27/PU=;
        b=IXbCYfwJLWt+4aW2xF9IhXp67OG1usjaz4mXcDUVeHAfUMu+rzO5CqkLsBJbp/XXWP
         KVuEB+3XkMEeN5nXcgbC8a5J9APhJUIoMBRlLnSqSub6tNYQQG1OnrLmudngPC88TEu4
         24d+wAISxzWG4PNTYDejBUGVGD1Nwfr5Buflr0Resu1yL124lrYadD36HrQU+z1vnZ85
         yVhlt0hLwOwYd+7JjF8mLmzUMsvvbQC5l4ydwggB925dTvwh14jxdrelunTp4wede5Nd
         v04a1l3T4EJpWwTtuQ1VALK6Gq6JVYmcVKYxxuF7HjZ0hfripAOqzIGaSszQlYNrXHfK
         Li0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689106245; x=1691698245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVt7PoVNeT68yWei5sXnxLy7lmJ+r6xLCmBEdj27/PU=;
        b=FPwaIx27NLOX36CaOVkE6NRwEbjmidK//x5ov98Qrof39GAim5FJe68FNDpGfsOyB/
         ARj4NMPKhnSTHKQZCN+wr5BXJ+aFnGDv0tIalP4kPKg7/eMxT0wxHkDNWbmaanMksMRk
         n5j+HjBu9tMEyg9PuzOmxlnyViqdmW1TaW9DN5+oK0IJPOYg9fGJDpxUrM5Gw3Mc2+AJ
         U9oHrCXBZlkNSW+21as0rGD+3bEIezHzyd0KEkKKf2djpeoZb8OFc7v+xH6OVkhZaBOX
         Psa+bCyWw7hn6D0C00y5KiR8q1dEA4Pw+K9ildb4EcBf1k+UCfXF2ZQndWmaL49LYWF7
         vxCw==
X-Gm-Message-State: ABy/qLYWFShksjz/M2ElywkATWTt0BZC0phtNzrse9rOitfFQugnwfzg
	H2RPZlnglEPZNR3YDbS7PRvCcMOe/js=
X-Google-Smtp-Source: APBJJlG8hphJVjSjvRo6NqNFbDty1GbxknOqsR7FEKu1jm6clmxHjaGjdHVHwTuUqi5KFZrkUbKeFA==
X-Received: by 2002:a17:903:110c:b0:1b8:83a3:7db9 with SMTP id n12-20020a170903110c00b001b883a37db9mr16357864plh.23.1689106245148;
        Tue, 11 Jul 2023 13:10:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::b82d])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902789100b001b9da7b6bc3sm2318795pll.184.2023.07.11.13.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:10:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] tunes: Add support for sve instructions on armv8/armv9
Date: Tue, 11 Jul 2023 13:10:41 -0700
Message-ID: <20230711201042.38285-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 20:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184153

This helps in defining correct compiler options and configure options
for glibc and overall ABI for toolchain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-sve.inc | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/feature-arm-sve.inc

diff --git a/meta/conf/machine/include/arm/feature-arm-sve.inc b/meta/conf/machine/include/arm/feature-arm-sve.inc
new file mode 100644
index 00000000000..279bf8c4862
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-sve.inc
@@ -0,0 +1,5 @@
+# Scalable Vector Extension (SVE) for:
+# armv8.2-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, armv8-r, armv9a
+
+TUNEVALID[sve] = "Enable SVE instructions for ARMv8 and ARMv9"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'sve', '+sve', '', d)}"
-- 
2.41.0


