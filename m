Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C22C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 23:56:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.93.1665014156954736961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 16:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EWrQhCTL;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id c24so203546pls.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 16:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YmtYz10p5Y2nCBvX5mluLa/6rdeGK09puyJCTfhbc8A=;
        b=EWrQhCTL5DEFwBT0DcuG2mUZawt+nQD9ncTb7Yo/ZoMtz32+sdq7xBWawL1F45QCvi
         qfyEZTLRsmuti3NMD0ILY18sekfD8QtzeuSEWsX2f/vMlKOnkatekQCdZpethwQ+Pq+4
         FW2mDXsSRDFOlgY/4lJrmW11Wv9AR06h2GYdj6X/qqRdY+ptnqyuH9LgLduiHpjQ3Xui
         3YSRiUMyRrH/cKElft3QOmXzftH9cHTS/1x9fb5TMmYf5amt01nuV79M7HO5UGXiaZ61
         s/srqIMZVLEfjKKTKz7Oi2g8wFBWbsA+WAX6/A81ZAtmQz1OjjZ1WXuDpxWQZxA1v6Aa
         g4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YmtYz10p5Y2nCBvX5mluLa/6rdeGK09puyJCTfhbc8A=;
        b=HlA5Nx78TLGecKrZxvtAEHYvL4N5bAiTB0Pbl4tO5JvSeIuSPlyxr5zQ9m6etTftwL
         y9ZUxNZEUjPboBVMOLCniVJfRJM3GA4EnIJhjoOTDDhJq+KZaKT7RIqluDJFM4yTV7VB
         Df2ZXHzxLzdl4mSgTh6F33R9R3vNMcG9b3BEyteyF4aGZazdyQjnt1xa3kWna7gntzRB
         rnhK04RbdARApTuUHWG/8HPt156GoDrLEqPb00K6njXfKoSvEtKclc09y9INSmvKUxGh
         O5FsdePrh7leQcckWzE/DqaEJleLdwc1a8Zqj58gnHo1i2MRHmwJ1aS7cCS/euLtkiUI
         pUCA==
X-Gm-Message-State: ACrzQf2MOH0QKa49RpDVVhKfvohdASKhlRFeAosYFwrpEwRzkAQp0ISj
	XK+hecGVwOkcPgdxcFY7xAQv10UvpjMT7A==
X-Google-Smtp-Source: 
 AMsMyM7HzuJid5Yhw1FMFcEI9eUdoRThXZ0j6dQHXi90P2BF3JIQPehWDa9KEWaIuxb4r1/uQqXQ+A==
X-Received: by 2002:a17:903:20d3:b0:17c:8197:c4db with SMTP id
 i19-20020a17090320d300b0017c8197c4dbmr1828305plb.43.1665014156067;
        Wed, 05 Oct 2022 16:55:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::32cd])
        by smtp.gmail.com with ESMTPSA id
 c13-20020a170902d48d00b0016c0eb202a5sm11065786plg.225.2022.10.05.16.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 16:55:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Upgrade to latest master
Date: Wed,  5 Oct 2022 16:55:52 -0700
Message-Id: <20221005235552.3380260-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 23:56:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171478

Following changes are part of this SRCREV uprev

* dc9285ad fix error cases in gethostbyaddr_r
* f9827fc7 remove impossible error case from gethostbyname2_r
* f081d533 fix return value of gethostnbyname[2]_r on result not found
* 1e7fb12f dns: treat names rejected by res_mkquery as nonexistent rather than error
* 001c1afb res_mkquery: error out on consecutive final dots in name
* 3ad3fa96 fix thread leak on timer_create(SIGEV_THREAD) failure
* bf14ef19 re-enable vdso clock_gettime on arm (32-bit) with workaround
* 6f3ead0a process DT_RELR relocations in ldso-startup/static-pie
* 25085c85 fix fwprintf missing output to open_wmemstream FILEs
* a636fd63 dns: fail if ipv6 is disabled and resolv.conf has only v6 nameserves
* 996b6154 use kernel-provided AT_MINSIGSTKSZ for sysconf(_SC_[MIN]SIGSTKSZ)
* 25340a93 add sysconf keys/values for signal stack size
* d8fddb96 fix fallback when ipv6 is disabled but resolv.conf has v6 nameserves
* d4f987e4 epoll_create: fail with EINVAL if size is non-positive
* 2e5fff43 use alt signal stack when present for implementation-internal signals
* 379b1821 ldso: make exit condition clearer in fixup_rpath

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 97c27eba4a..a72d87ea6f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "37e18b7bf307fa4a8c745feebfcba54a0ba74f30"
+SRCREV = "dc9285ad1dc19349c407072cc48ba70dab86de45"
 
 BASEVER = "1.2.3"
 
-- 
2.38.0


