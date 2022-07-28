Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A16C19F21
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 11:41:27 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.31540.1659008483121901694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 04:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BpIEs7d1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id fy29so2639254ejc.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpIoaZx0ttgvPAeYf2Yo8jkXpaKTmzAvl/V7U+DRW4U=;
        b=BpIEs7d1UJDZo9ov691Xd2GkShoxTtF4PCo/2Qq5PBITeHbTplJKx2sYCoEyLROUFA
         r9Y0/iT4nTw1cm66CVbXc3FYmz3A6Bb10+Mvx3uTz7jf/QrI5MBP+WOtIzw8jaIKf0iE
         xM+vsWa9W9sgT1BeYN1pDDwxJ9l9Az8Dfw1ngOqDNc86FCVUqBbjsqJpFPFbRII4/E1r
         j3zjx4dP5MvB0DKCSrUwYLA4KWTha3qSFxjKGhFcAG77P5JTWylrPmaBYt33v2N+edwr
         x/n0x0g+VASTiEy68G7C1n1/x78pXKmp0fJDrhDYejvgl9BNJ1R8/4Mj0KdqzDvHimEH
         0DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpIoaZx0ttgvPAeYf2Yo8jkXpaKTmzAvl/V7U+DRW4U=;
        b=dzbxN2RR+m20epjiK8bVgG8ll+y5QMgT3qnwguFSKBN/EArApSxAbrTNWOAjU0rA+f
         pzFUm+0aFf+gHAAGInLmDbzhnAJKUo4SIdd7B9KeRWTAMHKiSU4uWvgfUaD2VJdy3kgu
         FsOkczYCjsLAkxW6X8M6j9DWw1SxK3p5OpWfQ2X9PD0QrCmGBI96pjWAMJYRvlsnRUhP
         Zv7T8NAjXxTH6H4PrQKPOVNVoz0Z3PT6RCEVqHhIddOopTCup/yiE+y6jkN7KmEl+ppn
         kHJLiiPSQA2XKBL7xIlzWEDlMDIMr6djq+NEnLDVO2nHHnqzrFAYOQcpgHMx2OMSJb+B
         aRhQ==
X-Gm-Message-State: AJIora/P2IODCwg2HWff1k2kLZzA/sW1ZAfr9ZPDPnAdVg7pr1DDylhq
	M/SUgGKcNVFrQ+RjnwJI4bRNuz+VUZ4=
X-Google-Smtp-Source: 
 AGRyM1sKnFO+koTZdWjVw0KwTvyZWr5yQ2xcntKa+FKD2179Ny37pNAXJpZUmDYxeTKnty/V6olXKA==
X-Received: by 2002:a17:906:974d:b0:72f:2835:f664 with SMTP id
 o13-20020a170906974d00b0072f2835f664mr21686362ejy.543.1659008481648;
        Thu, 28 Jul 2022 04:41:21 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a056402014b00b0043cc66d7accsm529809edu.36.2022.07.28.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:41:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: petr.vorel@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] bitbake.conf: introduce LINKER/BUILD_LINKER variables
Date: Thu, 28 Jul 2022 13:40:45 +0200
Message-Id: <20220728114046.3529197-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220728114046.3529197-1-Martin.Jansa@gmail.com>
References: <20220728114046.3529197-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 11:41:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168601

* makes it a bit easier to replace ld with ld.bfd or some other implementation
  in LD/BUILD_LD variables without changing this whole variable and without
  depending on ld-is-gold to set ld symlink to preferred implementation (or
  when we want to force different one for specific recipe, e.g. forcing bfd
  where gold fails, like in ltp)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d36aae8b3..1c2ebf333e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -553,7 +553,8 @@ export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
-export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
+LINKER = "ld"
+export LD = "${HOST_PREFIX}${LINKER}${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
 export CCLD = "${CC}"
 export AR = "${HOST_PREFIX}gcc-ar"
 export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
@@ -570,7 +571,8 @@ export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
 export BUILD_FC = "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
 export BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
-export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+BUILD_LINKER = "ld"
+export BUILD_LD = "${BUILD_PREFIX}${BUILD_LINKER} ${BUILD_LD_ARCH}"
 export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 export BUILD_AR = "${BUILD_PREFIX}ar"
 export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"

