Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76035ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 00:30:12 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.31604.1661473804819141516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 17:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B+3+l00E;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id s206so1633pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 17:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=mnWLKUQ0K9ls7+ABJt8FE88c9zP9rsgzrzHGyncWP8E=;
        b=B+3+l00E5t/c3vVff4dvnnUYuBAYZNulFRQ9IClsu0t5BLU6gRBPeIUxD/X2qSSLyP
         OuO+xEzqF6CFG/7ZCe6LopN+TGdzn+l58MYeeucBMWVFTWKupjeAiT3uaJdNHNI8z5/b
         llBLTUqU1ADyQRDnhtgzfk0Vne2czfvXeriPHq9lwbR8FrwHG0KrdRHTj3G6xzLqy/v/
         IpOHPHMzziSX9eryggwbdqk4M4trG9OPzCPuEv2KCsLuap0nDXOaAGwQMCwWGi2zupJ7
         cEKgxGkzLwijLfnR21qG/jZ5sa2FfcBB027gCkgdBZmt0m7r6HSct5N4aSvPNulYAn1s
         DuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=mnWLKUQ0K9ls7+ABJt8FE88c9zP9rsgzrzHGyncWP8E=;
        b=IauWhLEslTEq6UNhkw1RqEWmD8p7hBzPawQtxL+rDlbyrDdQ+UBHwHDqFua5hB2Ta7
         RNMqegdCDfchVkIh4FnzhA5dkY0qLbIjWmbRW+aMZuyuG1zawsU3nft9TvhfphHQeLkI
         0K/g402Qgv4tksRl45OjEv5f9WNWeatmiWFkJfjBbfaFuGsPOIFOSjyo2lOqqwph+t2a
         /baKBNaU5yeaZBaEPKEC15y+OilnZX2SiLVs2LILdtIQEV9Z25CZG2G37BteTgocnkm7
         AeKvdX4BKVmku6qlkIUdzfMm5z4a3if7KhQANQR3UVif/Y1cq7fmeXF57r9WjNDjrbY5
         UKNA==
X-Gm-Message-State: ACgBeo0NRRMFoOKjd+iwG+lDVGMjGqj8wQrKW/sJS1LDsxBV/w3GgeAe
	67pYx0g9Ae2ZenvJYHOm4f78Hy/+vfYRPw==
X-Google-Smtp-Source: 
 AA6agR5z9jVU5RryAX5fGPKtCrefxFfQvaRcmiNsizIOlffA446KGyfHD/150D6FCBQ4opHyhLYXmw==
X-Received: by 2002:a05:6a00:2185:b0:520:7276:6570 with SMTP id
 h5-20020a056a00218500b0052072766570mr1536086pfi.84.1661473803952;
        Thu, 25 Aug 2022 17:30:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a634e45000000b004161e62a3a5sm166065pgl.78.2022.08.25.17.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 17:30:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ltp: Remove -mfpmath=sse on x86-64 too
Date: Thu, 25 Aug 2022 17:30:00 -0700
Message-Id: <20220826003000.3766766-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 00:30:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169898

Fixes build errors seen with clang/musl like on x86
error: the 'sse' unit is not supported with this instruction set

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20220527.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index 09c7250608..00ff906ded 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -20,6 +20,7 @@ EXTRA_OECONF:append:libc-musl = " LIBS=-lfts "
 # earlier in CFLAGS, etc.
 CFLAGS:append:x86-64 = " -fomit-frame-pointer"
 TUNE_CCARGS:remove:x86 = "-mfpmath=sse"
+TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-- 
2.37.2


