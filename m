Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15E7C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 20:28:03 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.47625.1660854481508714919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 13:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G0xpCfs7;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id p125so2565560pfp.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 13:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=fTTQ8u834yHYPqHrGoC9Uu33KmvNtYZOd5rESa0hE0Y=;
        b=G0xpCfs7jObicTPj9iuqrEuNcP0Br1yddpI7NcssvnpDb3EO+7tLxsoYOyara2vi0L
         nmG5uudeyUFgLLRcaIFx1aT/yYJirEuXDBT/r87/upgXrI8Ne1W+7luIQOcP68xMdYRw
         J4Sh8u3FxwXqT8+3UiIp9Y0raFZPoDdFlarAgajQx8IMBzdMmBmpcU3hfDbNn7IDoSze
         HzA99zodMEeXoSXwyJAeOB3bttxAy/4w8end2TuktaLDCLmrBpzbpQ8AAENBIVkMCu5H
         dcmpFthZPHjJBOhTNPL0Uu0i2idlCoBSVHf91r+KsY5m51a5iZiql/9uMzB4a7JKXQJv
         TxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=fTTQ8u834yHYPqHrGoC9Uu33KmvNtYZOd5rESa0hE0Y=;
        b=CCjGQjqDvuZmBgKRJz+qf17HSL/BaSbZuqbd/+XVGZ9LRGZVSEtth3+7jr/jFfZvw1
         ZyByAwKks0mN2Y3aCbyYPwWuGos6P9CPUMWB+upt8X3jkig8RwPifrXwnTlM5DRTRri4
         tSxiMTaGeZoBgnccG2iL+LiB2347nfbx2vltdX8bnNCe/EDf5GXprgxjXm2L0TrHUjnF
         eFYx1CR3teXFn6XzeNM9GLLoU/UKhpPRdZuQKIYBpUfOIrGpYRqsEa2u3jKaINTuMjJV
         XpVhjFDd5pinkEnEDdMpCRSSseiud591sd9jFQ1q6MMN42K7dqJls6Ulzme/y/UG4zEn
         70tA==
X-Gm-Message-State: ACgBeo1KRjlRrDZy4nnMNAD4hLc7NdH+f2SuszI31Qrrzruuhzg7jw86
	zHuaEX+v8vh3IOod6RruxUAtcQD//ij0og==
X-Google-Smtp-Source: 
 AA6agR7R7QhjJ2eVGGjsgra5jWXnCR2ppqnh5mKLjeQnhJ+gJ1Ag7T6AW5GPXVfFGE9j6Z+pVKNePQ==
X-Received: by 2002:a05:6a00:88f:b0:52c:6962:274f with SMTP id
 q15-20020a056a00088f00b0052c6962274fmr4615945pfj.12.1660854480631;
        Thu, 18 Aug 2022 13:28:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 d15-20020a170902b70f00b0016ef7235e09sm1767439pls.168.2022.08.18.13.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 13:28:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Disable gprofng on musl systems
Date: Thu, 18 Aug 2022 13:27:57 -0700
Message-Id: <20220818202757.2102383-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 20:28:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169541

disable gprofng, as it depends on few glibc apis

| ../../../gprofng/libcollector/../src/collector_module.h:78:13: error: duplicate member 'pwrite'
|    78 |   ssize_t (*pwrite64)();
|       |             ^~~~~~~~
| ../../../gprofng/libcollector/dispatcher.c: In function 'collector_timer_create':
| ../../../gprofng/libcollector/dispatcher.c:578:8: error: 'struct sigevent' has no member named '_sigev_un'
|   578 |   sigev._sigev_un._tid = __collector_gettid ();
|       |        ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.39.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.39.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
index 863eedbcbd..67240383f7 100644
--- a/meta/recipes-devtools/binutils/binutils_2.39.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.39.bb
@@ -16,6 +16,9 @@ EXTRA_OEMAKE:append:libc-musl = "\
                                 "
 # libcollector/collector.c:547:15: error: no member named '__fprintf_chk' in 'struct CollectorUtilFuncs'
 EXTRA_OECONF:append:toolchain-clang = " --disable-gprofng"
+# | ../../../gprofng/libcollector/../src/collector_module.h:78:13: error: duplicate member 'pwrite'
+# | ../../../gprofng/libcollector/dispatcher.c:578:8: error: 'struct sigevent' has no member named '_sigev_un'
+EXTRA_OECONF:append:libc-musl = " --disable-gprofng"
 
 EXTRA_OECONF:class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
-- 
2.37.2


