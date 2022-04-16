Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F05C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:57 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.16082.1650086576268787906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 22:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GamiCDH5;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id bx5so9015578pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 22:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=2c+t/0mE4X/J7Sq2Re3iz0enKqyIPrHqE2f2WbotN1Q=;
        b=GamiCDH5hcvriAVGCEO60MPdyitmEMFIpxBN8U44ZEZgdW1hm2/TzsfRigNXcPHyNd
         fYoXN6IFwow00DG+PCxcFhhuFw9VZFhZnJVFX2r7lZm0ZSTi5LVb00l9Kha56j2Ywbr2
         qRJICAl41Xzk0UcPjd/5+lVFE1hbAYpzTmDwG11DaiDW2eft51xBUCNVHensbUNW7BkX
         WCtuQ0Dk4LDb0wl/itmMTNAI9w2/Gy9BCsGHmSHalTLWW6Wtz3ucAT9ymEJcdMWvgKVM
         vRkrlwrjm5j9c94o8TA022eIwpbWZfsRfJEUz8bFu3F3c6DjvxGJA6NE8JvNoVnV0vR2
         cNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2c+t/0mE4X/J7Sq2Re3iz0enKqyIPrHqE2f2WbotN1Q=;
        b=eyVvPbWsaK7D7yPmCGxXXAlrr9vJb3kyBxiijvgoRsku6x8lg5g427Di9CqkyPsEz7
         F/ucU3tZQLJQ2v4aoc8nV5HYoRm/GWBNx2rZotEfre3oB6oK34Chbwl9/EhKoreljwu7
         49tFM4i6u+q9Y0VSvKRzZMwnSc0kv3ix0jZ/nFFZhl2F5zuRTKMMFhSzZUiTaYZ6Ad5k
         x7WIYEHXqzBXMs5/nNVNo1fDMtHyYYvRnJayVSlCN4e67Qn2wGyz90q3c0PPgc9ed2WK
         fTEiZc26SEhPjow+OaSOCbZe732Pbb9GEsbJqKAMLXJ0UGCIS4l9Q0nzK/vdR23zk6w6
         VHMA==
X-Gm-Message-State: AOAM531qaxnP+FRgzw7dfkf8vnm9ZCDhcXCZJDTtEuZK5CPrQht81hZJ
	0TqFEQnD0X9fhaUj80/Gl0cxkGuG8O5Cig==
X-Google-Smtp-Source: 
 ABdhPJxJm5vIPCPbJ2oyfCJ+bxt+9EnIaGQGe56wMHur36DVKgl61HMF03yYGJrGh+uiVv7KqTQe3A==
X-Received: by 2002:a17:90b:3508:b0:1cb:8e7d:a63 with SMTP id
 ls8-20020a17090b350800b001cb8e7d0a63mr7697706pjb.183.1650086575594;
        Fri, 15 Apr 2022 22:22:55 -0700 (PDT)
Received: from localhost.localdomain (66-7-227-88.static-ip.telepacific.net.
 [66.7.227.88])
        by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm6145402pjv.57.2022.04.15.22.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 22:22:55 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] ethtool: upgrade 5.16 -> 5.17
Date: Sat, 16 Apr 2022 05:22:51 +0000
Message-Id: <20220416052251.81814-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164523

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch | 2 +-
 .../ethtool/{ethtool_5.16.bb => ethtool_5.17.bb}                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.16.bb => ethtool_5.17.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 034dc92444..7f859f40ed 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index 8fc93c8..94ee28d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.16, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.17, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.16.bb b/meta/recipes-extended/ethtool/ethtool_5.17.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.16.bb
rename to meta/recipes-extended/ethtool/ethtool_5.17.bb
index 5dca03d082..61032d4836 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.16.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.17.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "4160fa127d75d5a6ebd5e871118486ac730dea2f28b2f1ad40fd1ed3d0d369e0"
+SRC_URI[sha256sum] = "3e32735d13aa19e2be32d3528ef8a135fc99782950ab3fa602198e72992e9450"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.17.1


