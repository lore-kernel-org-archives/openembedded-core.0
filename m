Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB36C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 00:51:40 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.3717.1663030296308603353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 17:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ptLzHfuV;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso9778799pjm.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 17:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=raNKY+qkG/JSpq1GR5BnJgNXuPbgthRMqJqIHTiEF/Q=;
        b=ptLzHfuVLTycGjHP5W6DzFmZVE/bozE73ZJKTYn681nuIcCywtKoa907xXhdChPMan
         oZ7FJUiihnsBGbHxwi1lEUC6NRKgDZemTG58sm3Q2g9zUnqTIAXJdT0dwPiVeC2I9Hyj
         6auzO2BEYFVXd+cscA4qFr0Id3z/XP1loPPCeucwASyqEnMTj1ZLdK1ApS1dH6CGU58U
         phKlwNBqdblN5gnPck2qOIbbhNI5zAPDKzgLz+nQFokw0vBTf+YregseIrP8IlnyhQ3y
         ux0SpFBhkxGY3dBv7F+V9TawZublwlDq9toCdEDUHMFzwNUj9qk+c2Kie50UckgvsJNl
         5gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=raNKY+qkG/JSpq1GR5BnJgNXuPbgthRMqJqIHTiEF/Q=;
        b=dzJTOtDqftdgCZNW9RGPu7chGx0xzFVQXtJC88YSV3gdqavqAUttlLOMjnS0D2cNTP
         6Edf4xggnAmKsu6TrHLCmNFx+sX8yb0ebUv/RrxcIqYuDiAP+6uUsFPTB20tM4jilEtG
         lJ0KYd4IrJ7hZOHLGj3wrsvcpplVWr17Gl/YYn/pB1ElkDyeipWgIXlRhyTWb2hvEiY1
         8CUiCTu3LjIbPe5wLFk53ym3CiYm276A/jDeC8BZSyXaV2cJH7GdN0pGSm085LnCprat
         88Y9Xp5DfaYi3HuNcsqrJsogtMuHYBCcScy3GXoUV5OfJ8TAZpmvRvtTJ1k3/4YmL1Vu
         NzuA==
X-Gm-Message-State: ACgBeo0TX8y2MDCec8ip4ay1cbY/0oOdoZHA6nuUFjdBg6N0XdoIZOA+
	28diK3hoUIxr6D9Jui0NuBU83wRNZKFg9w==
X-Google-Smtp-Source: 
 AA6agR6AwOOIaCWBaZ4EfdO1iJgvjJWMxv1708etqPbq8DlxBqcjZR3vBaQFaSVtQhOQ4mFEQb3AiQ==
X-Received: by 2002:a17:90b:1894:b0:200:b12e:9db0 with SMTP id
 mn20-20020a17090b189400b00200b12e9db0mr1108177pjb.219.1663030295568;
        Mon, 12 Sep 2022 17:51:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 g6-20020aa79f06000000b00537eb00850asm6186246pfr.130.2022.09.12.17.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 17:51:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] glibc: Upgrade to tip of 2.36 branch
Date: Mon, 12 Sep 2022 17:51:31 -0700
Message-Id: <20220913005132.2218132-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 00:51:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170553

Adresses CVE-2022-39046

Brings in following changeset

* c399271c10 nscd: Fix netlink cache invalidation if epoll is used [BZ #29415]
* b46412fb17 Add NEWS entry for CVE-2022-39046
* 645d94808a syslog: Remove extra whitespace between timestamp and message (BZ#29544)
* b3736d1a3c elf: Restore how vDSO dependency is printed with LD_TRACE_LOADED_OBJECTS (BZ #29539)
* 3c791f2031 Apply asm redirections in wchar.h before first use
* 924e4f3eaa elf: Call __libc_early_init for reused namespaces (bug 29528)
* b0e7888d1f syslog: Fix large messages (BZ#29536)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a078eb6377..bd125ec401 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.36/master"
 PV = "2.36"
-SRCREV_glibc ?= "3bd3c612e98a53ce60ed972f5cd2b90628b3cba5"
+SRCREV_glibc ?= "c399271c10bd00714504e8d4dfbec8aebf996dd4"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.37.3


