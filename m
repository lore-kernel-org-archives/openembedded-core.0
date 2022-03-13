Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110ABC433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 19:52:09 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.18798.1647201127968899168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 12:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AqnLAsZI;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id t14so12028312pgr.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 12:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FySaacTS5AknH0wp0vhLNWdFLSRzdw6ZnozwoQebdcs=;
        b=AqnLAsZIv7nRJrzU8ltEb/RWMGEGrKRv98FNLsNsTtdxgWKF+SUDTVopSnxBELqDgw
         oBM4TJCZgEegjdsKD4fSi/VXiPvsKd6M9sqrMSzCJ+t0OHPAd79yS5xn8xRa5PgjKNTN
         rwuHPsfPTvtmVvOYe3kH33yTQCNPKjYzztkNyyIDDZBQGr4uhXpSHNUIiaEQ+XGjbpEg
         x+Vi5CHIFRLxYS+hAwK8125pBB29yWcQvvPkvdyM+KEqXioLoROkkKSqWbI8lI0/TCuY
         +f4p7CZnUWlzQDt89406B3c9J1Kn3kwHRDJEi377xbTKBpeOaqeeWrfdbFEeWw9BnXTF
         tw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FySaacTS5AknH0wp0vhLNWdFLSRzdw6ZnozwoQebdcs=;
        b=4ybRqCk3OI/H/Lb3tKYRuCTbMf/GsbiK6sDeroU6iyLMWOP7SatmLjpn4aFDRVdHF0
         4mbylv7LOAY255RjoEqOkHdDM2l+k69qzQLwr7SDWia/PoGSDyGNXLIdHOuENZjoJnO5
         93XBYyLc9/XtYzC+U3JbYZ8E7N6WpdvSKFiDolxwNvKoaUCpcgWfHkvzTF0XFNegRJ6p
         EdpOwYb8dsDTyjQ8HmO5M1cgUD3HV9Vci8v6WmlGgYdYN6UHaIpDzjFg3tIxSV5vO32F
         P8ZpfHtU6B6frHcra49r930cfZJJl+Q6x/s+v2wl2alwsbAmoGTuWDeEQo/9K5RhmgSj
         +Hvw==
X-Gm-Message-State: AOAM532Eb45D/PeMfcy7eeLj6elbpI7DvVyhCqaI7Gu598CV2TWiXX6Y
	XM+A3GV8E0AOVVEb+DGlRDipQxcVThYYxg==
X-Google-Smtp-Source: 
 ABdhPJw9uNZfV8h+TYoDN7YryUKTkfwI8ykSD48rC8RIOgY79bNrbxpMvs73RePxcbPRsaN5mQts/Q==
X-Received: by 2002:a63:d0e:0:b0:380:3fbd:d456 with SMTP id
 c14-20020a630d0e000000b003803fbdd456mr17352517pgl.343.1647201127001;
        Sun, 13 Mar 2022 12:52:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 t11-20020a056a00138b00b004f7664328a0sm15108280pfg.162.2022.03.13.12.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 12:52:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] erofs-utils: Use __SANE_USERSPACE_TYPES__ on ppc64
Date: Sun, 13 Mar 2022 12:52:04 -0700
Message-Id: <20220313195204.3828846-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 19:52:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163114

ppc64 historically has used l64 for defining u64 types in kernel
asm/types.h defaults to use l64 by default but kernel uses ll64 now a
days, therefore lets use same int-ll64.h to provide these defines like
other architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
index 16014d5b208..e5e19e75b43 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
@@ -22,4 +22,6 @@ PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 
 EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
 
+CFLAGS:append:powerpc64le = " -D__SANE_USERSPACE_TYPES__"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


