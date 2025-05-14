Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B156C3ABDD
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:31 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.106297.1747238306888207620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HrSm4TvL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e4d235811so99710675ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238306; x=1747843106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3P6XzwZoidiax8VzjB8empEDdM2jQntdDmXF9RJOTPA=;
        b=HrSm4TvLc9gDV4rcMeT9SWVepFSK/p+b7CkYf2icVw8Lf1RprWD2nzxS3Lz1yZsIHC
         nYj9JaIH/VvbqvldGxxZdg3HNw1WFyStwG8NrEkbSfDHFie9AtbRSHyQ40UN7iUVGflC
         rzLsksKWia9txiEp3FTCVQxAR6y2qoIXAZH/gEDYRZJabXWV+uyPikYK6LnrS3KCQCmc
         0J4lRAvWUB+2tM/RrTFF9UER3i5otrmq2+y2alxz+R11x3j963ZlNFnZHDHPQtqkmms5
         GyNCQ0cjlzrQkhqSgwUwbvB3KTZaztbvggf+QFzwIxSvRf0paRZp1iByF8F3hTKz/CBJ
         en0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238306; x=1747843106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P6XzwZoidiax8VzjB8empEDdM2jQntdDmXF9RJOTPA=;
        b=SICW6OGiEghhgyIZJxNaPHR4mm91b6jRrBgr612zz+L+B08hZhcdq2B6azDJJaaiAe
         tsB/nVip4hctS9MMS/aj7kv3hDcpsFGHYS5Rd6ZTFDnKo2HZNqLbgVQvwsGG+86TKLLW
         xaQwByoTEJfvItwFOvU3YMqTURMmOgf6/K7x8MIYuExde2omtkEb1ANZMIYoC2e7ivcG
         9jQgaBFM70q9IlOlXkg6B03VU2j6lOTEQknX3wOjl4B8jSD4xnFNFcZlUr8D4IFiVCCD
         LWCumHI/B+3hTPhfTdEwWNKnXBCPaWeIegh9FmJC/QdzMv/0ifAt3WhBBxz+lnnQRyjD
         5afg==
X-Gm-Message-State: AOJu0Yyfl9rlPKtEnDWWqAODCN5KierWZ9GfEjKhyGLB7lcRy/VC27YD
	+WgRB1MMyKlfPvntPTUbyhOjkdVmxUkx8hVq7p3CfZJDkmec7aSAGZ1WX64XxGzM2CHaEx8y0se
	o
X-Gm-Gg: ASbGncvOBTIV4Cay5j5u68/CSRBM10jSLWhYq8SYHHW5lWrObxVTaB1decicH+OhFJ2
	YvpiewleFNfaxVnDSD8f2zvrPYi5tm5hH3fSVogO4o60JV3yy7+pTXrsAWukFJujEHCkKvF6z+d
	6m8e6rjaiaYbWXiUJwPKdFYEsDVod2Cnzm/KHSUwJwStNUed5ZlZpe1dOVugV1wDD0oiGvkRyO1
	NV4tsNG806WvZ9gY1Co7ePHivxPstRDlh2LjsAfkJx78HO71zqzOCO23LEQ0EwFkXgRN2VG3GCO
	337BvCTF+gMS2Ge6N0S7RJxTRSP8VgCAavFscS53
X-Google-Smtp-Source: AGHT+IEyDkfI92xVLc8iM0Fi0jzOuCpzxPevYFsnpzroQ1rJ2/vsEK06PWe8wajA931p0LOEB7PmUw==
X-Received: by 2002:a17:903:1b26:b0:224:1074:63a2 with SMTP id d9443c01a7336-231981befb6mr65917865ad.43.1747238306068;
        Wed, 14 May 2025 08:58:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/12] icu: set ac_cv_path_install to ensure install tool reproducibility
Date: Wed, 14 May 2025 08:57:59 -0700
Message-ID: <60a38959a5b740b16044bf8644046b3ed4816ae7.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216515

From: Changqing Li <changqing.li@windriver.com>

icu will check program install path during do_configure, eg:
checking for a BSD-compatible install... /path/to/install -c

And this path will be writen into pkgdata.inc:
INSTALL_CMD=$(INSTALL-L)

Decided by if install is installed into recipe-sysroot-native during
do_configure stage, the INSTALL_CMD could be
/build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install
or /build/tmp/hosttools/install if the build is rerun after the sysroot was
extended.

set ac_cv_path_install to install under hosttools to make a deterministic
result of INSTALL_CMD, avoid vary caused by the execute sequence of
another task which DEPENDS on coreutils-native and independent with
do_configure

[RP: Removed paths from ac_cv_path_install to simplify and avoid QA error too]
(From OE-Core rev: 208143e060cda6e22ae1e8c618e033fa9144b323)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/icu/icu_76-1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_76-1.bb
index f0890fc890..f11e72d356 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -20,9 +20,9 @@ inherit autotools pkgconfig github-releases
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
 # into consideration, the native build directory needs to be staged.
-EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
-EXTRA_OECONF:class-native = "--disable-icu-config"
-EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
+EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
+EXTRA_OECONF:class-native = "--disable-icu-config ac_cv_path_install='install -c'"
+EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
 
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
 TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
-- 
2.43.0


