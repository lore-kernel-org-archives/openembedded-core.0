Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.786.1603381974492839236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=M+xw3ml+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id b6so966764pju.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kpbfYQEsYCDgtismYnlmDQIiZxVaUwv9RBqtXjoPQ20=;
        b=M+xw3ml+MgfN6DpoS2EYc6nlcrDrPOJJxK1Q0Tt54mOcFLV9e0OgfbOFza33Nh1yN5
         Y/NQN2bSz1K1b9c3Ju91jQdoLln3np2eo8qswMbQcUF2tpNdo5e5vyeiahKvLMOhMUQa
         6fx2HxtRyLEPU99+sd+l2FLfL9zhfGdfDHwnzU/ZC5ykO5NBzIsNhFrejmcAq5lqM8FM
         gPNZVAmvGf6eGIIB/HW8gBhNzkNgbzrRgJvFC6z1/CZgqGUm/4ziJzeRagl3XjePDZiG
         92rrHtRIXIbzkYMxs4BI5luQqPT/P94y7wU4rHvYK5ypBm4SIxX0a9yi4S+n1n1tp1Q6
         U1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kpbfYQEsYCDgtismYnlmDQIiZxVaUwv9RBqtXjoPQ20=;
        b=fgV9wN6E/SRE258WarmpJ7i41nbKGZX7LgBz9YBfNal88P3c+vo02c8RsA9mba5PZG
         agDynf13g0dAh2tQTLsMqk3Y27hg87BSISu5Dc/dYVNwXojn5SNCuH2RuCFyNBYYpPhV
         5u8RoukhOsHTv174WuEHta4Re95ta/vKzt9eJNwe06bM93zLHdHOqjTCxgvvWD4bpcwt
         KFGy/0gyszy17LR1dfTw9cV4Lpwj7GvTtpFqHLmvPTvOL4ppX9Q8ZAwQ5+A/3bncbCzt
         WnYzDdTi0EkPyBipSxFAHogGMl4b4v1BiMMb0iCdL2UdIkD5S9QlM9m2Zxbp3tuytjxD
         K38w==
X-Gm-Message-State: AOAM533K7h90rcSXleK352tlLjx9O0I2rVGpxb/Nb6F1rTis9pqygO6V
	IpQmvKjDsXPNtzDxLk89xhWs4Frefari/CGX
X-Google-Smtp-Source: ABdhPJzoPXyFKuEytGoKcNKSGCpfQkG/HI43xiXaJ93MotaUqHBI0TM8tLMexY5wIHyVTE24S91QXQ==
X-Received: by 2002:a17:902:501:b029:d2:628a:d59f with SMTP id 1-20020a1709020501b02900d2628ad59fmr3178322plf.43.1603381973530;
        Thu, 22 Oct 2020 08:52:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] siteinfo: Recognize 32bit PPC LE
Date: Thu, 22 Oct 2020 05:51:40 -1000
Message-Id: <8c602978de9fd57ab19019856ad6cee1065b5c01.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* since this commit, all powerpc little-endians (both 32bit and 64bit) use "le" suffix:
  commit b6ac40f1cbabb20896bf113568f7735a462ed1a6
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Sun Dec 29 10:44:03 2019 -0800

    powerpc, powerpc64: Append little-endianness to tune arch

* 64bit variants were already fixed in:
  commit e62cdb9b88b575b5cfcdd65ca558edc237c43b2a
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Sun Dec 29 10:44:02 2019 -0800

    siteinfo: Recognize 64bit PPC LE

* but 32bit are still failing:
  scripts/tune/log.fake-power5.powerpcle
  scripts/tune/log.fake-power5.powerpcle-nf
  scripts/tune/log.fake-power6.powerpcle
  scripts/tune/log.fake-power6.powerpcle-nf
  scripts/tune/log.fake-power7.powerpcle
  scripts/tune/log.fake-power7.powerpcle-nf
  scripts/tune/log.fake-power9.powerpcle
  scripts/tune/log.fake-power9.powerpcle-nf
  scripts/tune/log.fake-power9.ppcp9le
  scripts/tune/log.fake-ppc476.powerpcle
  scripts/tune/log.fake-ppc476.powerpcle-nf
  scripts/tune/log.fake-ppc603e.powerpcle
  scripts/tune/log.fake-ppc603e.powerpcle-nf
  scripts/tune/log.fake-ppc7400.powerpcle
  scripts/tune/log.fake-ppc7400.powerpcle-nf
  scripts/tune/log.fake-ppce300c2.powerpcle
  scripts/tune/log.fake-ppce300c2.powerpcle-nf
  scripts/tune/log.fake-ppce300c3.powerpcle
  scripts/tune/log.fake-ppce300c3.powerpcle-nf
  scripts/tune/log.fake-ppce500.powerpcle
  scripts/tune/log.fake-ppce500.powerpcle-nf
  scripts/tune/log.fake-ppce500mc.powerpcle
  scripts/tune/log.fake-ppce500mc.powerpcle-nf
  scripts/tune/log.fake-ppce500v2.powerpcle
  scripts/tune/log.fake-ppce500v2.powerpcle-nf
  scripts/tune/log.fake-ppce5500.powerpcle
  scripts/tune/log.fake-ppce5500.powerpcle-nf
  scripts/tune/log.fake-ppce6500.powerpcle
  scripts/tune/log.fake-ppce6500.powerpcle-nf

  Parsing recipes...
  ERROR: /OE/build/oe-core/openembedded-core/meta/recipes-support/debianutils/debianutils_4.11.1.bb: Unable to determine endianness for architecture 'powerpcle'
  ERROR: /OE/build/oe-core/openembedded-core/meta/recipes-support/debianutils/debianutils_4.11.1.bb: Please add your architecture to siteinfo.bbclass
  ...

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a31436f38da27883b42810adf3066ea498ca4a5d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/siteinfo.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 1a048c053f..1fe5eea717 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -45,6 +45,7 @@ def siteinfo_data_for_machine(arch, os, d):
         "mipsisa32r6": "endian-big bit-32 mips-common",
         "mipsisa32r6el": "endian-little bit-32 mips-common",
         "powerpc": "endian-big bit-32 powerpc-common",
+        "powerpcle": "endian-little bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
         "powerpc64": "endian-big bit-64 powerpc-common",
         "powerpc64le": "endian-little bit-64 powerpc-common",
@@ -100,6 +101,8 @@ def siteinfo_data_for_machine(arch, os, d):
         "mipsisa64r6el-linux-gnun32": "mipsisa32r6el-linux bit-32",
         "powerpc-linux": "powerpc32-linux",
         "powerpc-linux-musl": "powerpc-linux powerpc32-linux",
+        "powerpcle-linux": "powerpc32-linux",
+        "powerpcle-linux-musl": "powerpc-linux powerpc32-linux",
         "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
         "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
-- 
2.17.1

