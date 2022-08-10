Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB05C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 06:29:03 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.2744.1660112940882786042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 23:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=blIfkKFO;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id l64so13561494pge.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 23:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=g8RrzD9tSv+zQ2VgA1mgT6CLVeZqA6tLE4kJZEo+kyE=;
        b=blIfkKFO+RQ7jFPGxCUXxnkfzSh2EYAz4HJTN7GaZrmAZR7E0X+W8tBP+evX/513zj
         ZTW7BZm9IMwjgpBjhuZ9/qCAjLTOixl6iV82NGiOdImZx0Evs+mFNn6EnNJVcnHhwAeU
         aJlTp7F7oebV2tNlOzKLLJyU5wG658wtXPFyEzY4/DKt04H/4oOjG6ovIUuJgO8obCtP
         VbIHPz4Wd0mPJ1xdEOEeK3ll+wKJcmqdNPR3hZrN68hDYjPMm11tZ5FbwzgADB1+1WSy
         tSVUf9CJcKWHcN1rsPjAYaayV9YWkcXUm7jB8Dr9LlxGSkX3TlZ2b4al0J9/EvgIndkk
         6efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=g8RrzD9tSv+zQ2VgA1mgT6CLVeZqA6tLE4kJZEo+kyE=;
        b=XcXzhA9pWbkgUYTR9QlSabauD4djNMdSR6SVPaHpuPmmUm3xaj7NpXX5CCy281ghTQ
         YklCkkDI6/igq31mPWydHDT1u9j6GCdds3VXl/SgvkbudKE8bsnEvTGZOpNmQ443DEQ8
         XoqVod2vTrDQSwMtnxdC7q3RzYW/6TyqRVxbIvRm/M1lIUPOYdZ0hQ5jNHq2rJdjjACW
         8q/vFcY0a805bv4edRLFQaxt5YC0nx96/r2gaBZe7ksB1qtzhUDA0KkwfNpBWqwoES1U
         ldGrz5pqfgKYRyap+1AraNpa8TQVUUrZWER1J2B1YlfoU2A53ingx9KqLvylx/HfOfXk
         lUiw==
X-Gm-Message-State: ACgBeo377hzvSM8AE5SE5UHJcUwCIhkV+ckgfhkpXY+rIoeWxii3hnTZ
	1d9FMS5vN679ix+d3luFhwKkc+GvKRc=
X-Google-Smtp-Source: 
 AA6agR4sqxoRlZZjd1UP/BYJp4i0KC4PiqzbIxau9HSsUcCtY5vzdrW2uybHvtI2j8V2Jgn2gvm34A==
X-Received: by 2002:a63:c1f:0:b0:41a:9b73:a89e with SMTP id
 b31-20020a630c1f000000b0041a9b73a89emr21746368pgl.342.1660112939807;
        Tue, 09 Aug 2022 23:28:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 g1-20020a17090a290100b001f3126b104fsm713278pjd.31.2022.08.09.23.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 23:28:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Disable gprofng when using clang
Date: Tue,  9 Aug 2022 23:28:56 -0700
Message-Id: <20220810062856.2857106-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 06:29:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169183

It does not yet compile with clang it comes with __ builtin___snprintf_chk Not Supported
formatted output of built-in functions check is failing with clang
somehow it seems to be compiler limitation. Therefore disable building
this component with clang for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.39.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.39.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
index 8eab78c3301..52d1447793c 100644
--- a/meta/recipes-devtools/binutils/binutils_2.39.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.39.bb
@@ -14,6 +14,9 @@ EXTRA_OEMAKE:append:libc-musl = "\
                                  gt_cv_func_gnugettext1_libc=yes \
                                  gt_cv_func_gnugettext2_libc=yes \
                                 "
+# libcollector/collector.c:547:15: error: no member named '__fprintf_chk' in 'struct CollectorUtilFuncs'
+EXTRA_OEMAKE:append:toolchain-clang = " --disable-gprofng"
+
 EXTRA_OECONF:class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
-- 
2.37.1


