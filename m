Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CA9C25B0D
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:36:05 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.11752.1660620958661103055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N8VTC8uv;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so8451019pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=6xdK65wdBhsgiysg6maW7w5dQ0gRCTsO+qOG3nw1BlA=;
        b=N8VTC8uvOccVLqZUzBiB1KYORkLLEpDOheXsZhLAePIk8yQmypYvSQE+5zffPVb8zd
         ClJQBI3cBld65B7duzs2F2gXRPXfnduDuYOpOHoVtql+8lrjww9SCKdsLjrfvlc26Ao3
         +HPmD4eeD0HPX2fOXU0j3/Cx+Whe7oyidDZL+XCjI+vnyFlFaogas/iCjr6Re9SEQ5yt
         8TsM9AG0jqPIgYtU+e4y9wbFExMHgHBBdJ1GvuK0kTtS7eKRb0ZIYu9YkB4c/1iWLyLm
         F9K+vxxvd2g0Fn7mWSkSLqcEuAGCRvUo0bPV/LhPVTf9fSQrIk9mcfui7femIU/88ToR
         cGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=6xdK65wdBhsgiysg6maW7w5dQ0gRCTsO+qOG3nw1BlA=;
        b=MrfWqv80UOfU9C3Xca0T/xv4YqS3yIQ+R7dCIorKMJMTefFu88ncWpjf5TOWGTw+ck
         T2BtNDA50exOsFbfo/u6rBH86wFDEOMtSuuNNhnvdHppkNcpuNIaBSBWqmphLM9ORKrx
         GEvTA+EybxvHKVznOZR1aBtEVpJep7S+pLWlMvcFP+k7QR8JWDjitDoB7Q9o0eRNnbBS
         v97qL/WY/oBWtN6DWfWllCBREJUbjXIJ8eXkjG1xY/IPFfBTsycry5Wule5TIc7L+jQB
         sDEZHeG/Zpw84Z/Zd1+F7qhLnLW5c72sMs6AWEZpgceMZFCYb7Q3jzCj2m9hqRJZaBl3
         oA5g==
X-Gm-Message-State: ACgBeo1QHkh4/qY8MI30099gJaq42/VSwlv0SGxrHuGLtFHhI1i/q+92
	y+mfnwAK8qGaHyTAYfO0DA9YhviUVlknWA==
X-Google-Smtp-Source: 
 AA6agR4+v8Kb63zyTsYRBG76WdWCh+lwLBwR7oNQq/Qx8tQIWneQoL2wtCyLd+jvtDNYjlkbwZi94w==
X-Received: by 2002:a17:902:c40e:b0:16e:cdf5:fd95 with SMTP id
 k14-20020a170902c40e00b0016ecdf5fd95mr19602791plk.86.1660620957782;
        Mon, 15 Aug 2022 20:35:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a170902ce8800b001714853e503sm7821428plg.36.2022.08.15.20.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:35:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/5] binutils: Package up gprofng
Date: Mon, 15 Aug 2022 20:35:49 -0700
Message-Id: <20220816033551.2701240-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033551.2701240-1-raj.khem@gmail.com>
References: <20220816033551.2701240-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:36:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169423

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.39.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.39.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
index 12a6fb55776..8eab78c3301 100644
--- a/meta/recipes-devtools/binutils/binutils_2.39.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.39.bb
@@ -56,14 +56,14 @@ PARALLEL_MAKEINST:class-nativesdk = ""
 
 # Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
 # extra stuff
-PACKAGE_BEFORE_PN += "libbfd libopcodes"
+PACKAGE_BEFORE_PN += "libbfd libopcodes gprofng"
 FILES:libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
 FILES:libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
-
+FILES:gprofng = "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
+FILES:${PN}-dev += "${libdir}/gprofng/libgprofng.so"
 SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.37.2


