Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD18C2BB41
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 07:04:53 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.25907.1660719892134328643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WLDs5to4;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo1014731pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SqPiQwMNkNfr2V5BfVxdzhbbt82+MwWtp3tb7igeyhc=;
        b=WLDs5to4M9XOYR0P4bYSNPNqrKInUwlORins7ldIMgtDSKm8/21yKAeY1ManmFyoIs
         c6LTtvBOA+RVEQZLoee/Z+qOGJoccrhCYOUlWfAirKcm3dY+etCMwavnUvxWdkUl1roQ
         FNrKB4FnlDg9YUUwdteHuorHps3BKSwWvZRy2yoaWgSRHH7a3xw0Xp4YzoXG9fBe9tGS
         JSQ9+Wt97IjoGdPyHB1Z/Z1DKEcjMCeWJKzwA/52rzcaQb++chQk444RU6zAb78B2kOZ
         euAMrnPKLAlM8bcScIDNnkEdyIufPPpN2JsuETJtNdZJHHqDmC9nYABJ58NDmFY1yTQf
         LeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SqPiQwMNkNfr2V5BfVxdzhbbt82+MwWtp3tb7igeyhc=;
        b=y6rWts7zeUzvwI9G66PQ9oynYAhVNY6gp+JPNd2P7IYP6v3UAHjQOT4gHCIPVkgqD3
         uXgIiaegfmIyTFFag32meFD2SF7X0cxIj1VO+3Wu6uu9DDeB3Kls1X0/djxdb+B5OiO3
         u0H1H3mbsXvGF686jRJhm0u4jde5RcczXOWFWRaNMDe/t86V2Tmv0dZhizqHFKbU2Wyh
         9qqmuSHJIKNMMKOWXBgr67Mzlu4ieiE1T6wDtblawe31dpa0TuBGyKIOIfsdcM+Gz7sz
         tCafZ67hzPLKgaRkFfvvtcZjvi5ToatTrps+cUruvkIaUDLd0cqgU3mWdTD8wQjwaHG5
         uJgw==
X-Gm-Message-State: ACgBeo3wXCbF5MF/HZdwr60ZS7lum7N1bLO907yEkGs7geKJ59mBn0yN
	T3iPx75BxxQ0BYR/s9ZJ2xuIF7UMlbYHqQ==
X-Google-Smtp-Source: 
 AA6agR7Cm+EnWletwqYEXPwgiqE8nu0z+Wb8GZPNATLbYJEf3d9X8JEqanrIngGn1o9BZZCg+qu8VA==
X-Received: by 2002:a17:90b:1c0a:b0:1f3:1848:591c with SMTP id
 oc10-20020a17090b1c0a00b001f31848591cmr2370419pjb.24.1660719891137;
        Wed, 17 Aug 2022 00:04:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6218cd000000b0052b94e757ecsm9638546pfy.213.2022.08.17.00.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:04:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 4/7] binutils: Disable gprofng when using clang
Date: Wed, 17 Aug 2022 00:04:37 -0700
Message-Id: <20220817070440.537761-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220817070440.537761-1-raj.khem@gmail.com>
References: <20220817070440.537761-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 07:04:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169470

It does not yet compile with clang it comes with __ builtin___snprintf_chk Not Supported
formatted output of built-in functions check is failing with clang
somehow it seems to be compiler limitation. Therefore disable building
this component with clang for now

(From OE-Core rev: 5f4b6afb030fe75247cc2da09cdf0ec5259673df)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils_2.39.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.39.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
index 8eab78c330..863eedbcbd 100644
--- a/meta/recipes-devtools/binutils/binutils_2.39.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.39.bb
@@ -14,6 +14,9 @@ EXTRA_OEMAKE:append:libc-musl = "\
                                  gt_cv_func_gnugettext1_libc=yes \
                                  gt_cv_func_gnugettext2_libc=yes \
                                 "
+# libcollector/collector.c:547:15: error: no member named '__fprintf_chk' in 'struct CollectorUtilFuncs'
+EXTRA_OECONF:append:toolchain-clang = " --disable-gprofng"
+
 EXTRA_OECONF:class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
-- 
2.37.2


