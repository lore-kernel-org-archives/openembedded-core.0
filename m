Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03123C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 19:50:33 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3874.1691092222827846475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 12:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LtHN7Jx8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686b879f605so954237b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 12:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691092222; x=1691697022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aSemngLUj4GoBD5K9N1gd1vKN7yaGEnGeV6swCEAbs0=;
        b=LtHN7Jx8WxAVLcbbn9J8WEF8R0AHlswEgDfR+i1jE1CtEMn7VFCCj55ME0QNhTZrhf
         RbO+9cqLpQTCz33aWUfCa7sxU7WLBXr37qkiigvAH3mOyeNjamKVGxlMmLRnxnuRLkzL
         ug+j19oEhzniG2fRGcOMOM4SuDu9mz/KbZGzRZ8qSZw5ILcYB0Topi4eWr4vt9lMRW8v
         UK6HLtbtI1jAbvVE8vbSd2/GomDy6jaBoobhxIpAciT6j00Ff1zNfR4AkTXV0pe5TeTd
         uafqELQYh9MSlKjhSLXGI8OiEk70382X6HgX6p2nHoLIntUHcxZiW7f3sVFHJoZKp8HV
         GiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691092222; x=1691697022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSemngLUj4GoBD5K9N1gd1vKN7yaGEnGeV6swCEAbs0=;
        b=NbmutHp9bF2RdUryG40Ad6DI+n+GSMozJlmHm0DLtIOZZpCGzBgSYuQr4UjQiTrmlu
         TvyVuL6HUKRXx/VpxMlTrvrYLDiaF3jer0ZQTKozuDgXMYSwhXblayN0UNI63qTmUkbq
         Cg4XaGE9I13nJiYgVEwNze49t6ddV8iRWt9RT0ZmWlzeTHZfCuzHxFSE5WQAQINwKmYu
         yM2BP6KWm9s6r5kfsC6L0Bz5xhw/JNNvgyxvBhSU8qj5pZ18GRNtT0mtlt1UJiZbIsFO
         4UXOF1WSmGeUfrDBw5cjS9QCA+qpLQj/TP19WaiWAnXIJ8wziFoQGekgct3G4/mj85hz
         D+oA==
X-Gm-Message-State: ABy/qLY601JGKd32MoHP5BOvq1albJ8HqjAwjooE7VmCZpCjZarUreUC
	o1CXnykNInk5HIG5Qw3vteGVLhThxgTUNJZ5nPc=
X-Google-Smtp-Source: APBJJlEYN7TYjv8hTWpekJrsw5DCS4UV++ecebF6Sww29432RuUS8pauqDEmyGsbwiCs3wZUb4tHkw==
X-Received: by 2002:a05:6a00:1513:b0:687:3a7d:ad7a with SMTP id q19-20020a056a00151300b006873a7dad7amr14166780pfu.7.1691092221830;
        Thu, 03 Aug 2023 12:50:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7875a000000b00682a9325ffcsm226483pfo.5.2023.08.03.12.50.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 12:50:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone] gcc: fix runpath errors in cc1 binary
Date: Thu,  3 Aug 2023 09:50:13 -1000
Message-Id: <20230803195013.4105755-1-steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 19:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185501

The runpath in the cc1 binary is:

Library runpath: [$ORIGIN/../../../recipe-sysroot-native/usr/lib:$ORIGIN/../../../recipe-sysroot-native/lib]

This does not match the actual location of the libraries, which would require:

Library runpath: [$ORIGIN/../../recipe-sysroot-native/usr/lib:$ORIGIN/../../recipe-sysroot-native/lib]

Prior to gcc 9.1 the recipe set B explicity with:

B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"

and this build directory structure matches the runpath in cc1, so there is no issue.

This line was commented out in versions 9.1 through 11.3.  The upgrade to 12.1 once
again uncommented this line.

As a result the runpath is incorrect in version 9.1 through 11.3 and cc1 defaults
to using host libraries.

This patch restores setting B as done in master and versions prior to 9.1

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-11.4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-11.4.inc b/meta/recipes-devtools/gcc/gcc-11.4.inc
index a907661df4..3670f494a6 100644
--- a/meta/recipes-devtools/gcc/gcc-11.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.4.inc
@@ -76,7 +76,7 @@ S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
-#B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
 FORTRAN = ""
-- 
2.34.1


