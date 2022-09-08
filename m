Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5E1C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 18:43:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.413.1662662583160602098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cbCV8TRH;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 202so17556611pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fXp7VNOPAj9iXpLHtCGfrauBt0ycK4glLqTio9trx6Q=;
        b=cbCV8TRHGrLc3a8Vs8+3Hr75ZI/CNBRds0T6wf19NwtOZMcaOLBu7Pvkt7oIh6t2Il
         U9tjofumNWqsGKgXIACtXZZ/oiM5yR0z2xGBqaaELyxW3pTrSXBFe1a8v8Ykb7uBZ3Nr
         e9Jmt8LhtkAXh8XHMHniFzNfN1I96+PX/RRCQw4MiubtmeCK2rUwTS5P9Mrr/uzGy9qF
         mv8snFXLepLEQGLoqVDtY36FVJ46tXdBnHnfLiaEi+EWG+J89z5g/ugHkP8zwUpo9dH4
         RGSCigHcGeEtCMKJyFI3tdBlesKf58VejLCZtunRaCRg8ZAVmFSL6UKEy7Jst3oO7ckv
         Odvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fXp7VNOPAj9iXpLHtCGfrauBt0ycK4glLqTio9trx6Q=;
        b=KEHzbQbvnwXS897aoPhr+S1pgCbvOHUPDxWLCAuvDPBhta+Jaa2oILh0heWiQTMNDM
         SxMVG5k6xFktvdK/wRbWFhcOO2DGRBHoLX8l2MQ6vxxsJ+VCLNCzu16ufwJpm8XgXdUL
         MsS2npIEGD4vo/5kuyc2xU+dLk4ieAwwb3RkESBHXNuFeBhNoEjo6YbwesRn1seMqFag
         8uucQ6Dp/wOtSPTQa0Omiad1ML48mXSsdnHhHl1Zyk8jTihSSpd9RV/KTn3jL4NVTzq/
         SGaq3B9i4/1SKHNpD6h9hkzlhVnKfx73XAKtSEeN8IARNuD20PH+bd2tYiNEEN5C702p
         Wr2w==
X-Gm-Message-State: ACgBeo1QRbCtF5FY+Dgpot6w+VZ8YUhZ3q5UJ1gDjl3t9X9SDDVomyT+
	8gLKBpG4OFUvTGX5tALhVZ8gJQmb6Nf4sg==
X-Google-Smtp-Source: 
 AA6agR7mf2Oi8vuPAj0uEDbMqLcuuDW3tvlZV9hl69v9ePaN6gACeJYoWlJScOMHsgxKpy+mVSY7uA==
X-Received: by 2002:a05:6a02:104:b0:430:93ec:776f with SMTP id
 bg4-20020a056a02010400b0043093ec776fmr8579161pgb.544.1662662582264;
        Thu, 08 Sep 2022 11:43:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 d62-20020a623641000000b0052d98fbf8f3sm15337897pfa.56.2022.09.08.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 11:43:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] boost: Refrain bjam from poking into host includes
Date: Thu,  8 Sep 2022 11:42:59 -0700
Message-Id: <20220908184259.3578197-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 18:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170467

bjam's logic to find icu during build time tries to poke at /usr/ for
various files and it succeeds for 32bit target build on my host and it adds
-I/usr/inclue to search paths because I do have icu installed on build
host in /usr/lib and /usr/include but does not succeed
for 64-bit target builds because its searching for same in /usr/lib64

on 32-bit log_dompile shows

    - icu                      : yes [5]
on 64 bit

    - icu                      : no [2]

On 64bit its getting lucky because the test is failing due to mismatches
in size of 'uintptr_t' since its reading half the headers from build
host and remaining from target C++ library.

In file included from /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/boost/1.80.0-r0/boost_1_80_0/libs/locale/build/has_icu_test.cpp:7:
In file included from /usr/include/unicode/locid.h:38:
In file included from /usr/include/unicode/bytestream.h:45:
In file included from /usr/include/unicode/std_string.h:37:
In file included from /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/boost/1.80.0-r0/recipe-sysroot/usr/include/c++/v1/string:549:
In file included from /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/boost/1.80.0-r0/recipe-sysroot/usr/include/c++/v1/memory:853:
In file included from /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/boost/1.80.0-r0/recipe-sysroot/usr/include/c++/v1/__memory/compressed_pair.h:16:
In file included from /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/boost/1.80.0-r0/recipe-sysroot/usr/include/c++/v1/tuple:226:
/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/boost/1.80.0-r0/recipe-sysroot/usr/include/c++/v1/typeinfo:247:14: error: cast from pointer to smaller type 'std::__type_info_implementations::__non_unique_arm_rtti_bit_impl::__type_name_t' (aka 'unsigned int') loses information
      return reinterpret_cast<__type_name_t>(__v);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Therefore, help bjam avoid peeking into build system includes entirely.
now if ICU is staged in sysroot it will look there for all headers.

Look into libs/locale/build/Jamfile.v2 after 'Xlocale' section if
you seek further information

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 402f1592cf..4263e645de 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -151,6 +151,7 @@ BOOST_PARALLEL_MAKE = "${@oe.utils.parallel_make_argument(d, '-j%d')}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
+		-sICU_PATH=${STAGING_EXECPREFIXDIR} \
 		--build-dir=${B} \
 		--disable-icu \
 		${BJAM_EXTRA}'
-- 
2.37.3


