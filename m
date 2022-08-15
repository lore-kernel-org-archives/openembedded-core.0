Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9300C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 03:48:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.12687.1660535331277892669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 20:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h0kTVg96;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id o3so5439617ple.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 20:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+CvdW3kVj8BTHFBWJ83Y6HpxdUmjMnIFwfHJRrzHL04=;
        b=h0kTVg96Wdtyj53c81ClQGGo4fpeo7j+RXJ666bFs0Anj5/x9gWrKdNz8cvOKaTGxn
         enVjV5nth8jlYHs3AqGfFTxeV1jKNRbsuhj0y2eB7jU9GfR1OKAp/48HyAHGIxx3D7A7
         tK5g9h9VxxGNlpJfcvynMsSIoH9s7YtW4SkjlgGqK6YNXofo3qf03Urzj361AKk31W7P
         5FzJ2mq3WURd8n0o4bHmYtfh9KyGeHQZGYA4UvLubhBihdt8wa4WZsr4Nd2v+PAaZIos
         xZvaiYpKo291fyaDClBsgFyv29Kdzmzwcpxf6gn/KcCNWIKq/GhtiHMC6lowOPjWTfTI
         euaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=+CvdW3kVj8BTHFBWJ83Y6HpxdUmjMnIFwfHJRrzHL04=;
        b=st3ZpHLqkOdGvZidG2p4b2v2JfxCJJ8NybrKApql8SLau1FqKrKgwViHcHGIMrpX9J
         5cNhrH46RzuGt7g8lLted79RIJDgBZkXygAATH7CQ+bZtFHX+pEw/Xs+JzFoOQ2Cb9g3
         dL98nUoxD++0fcpuf0Ba4JQQOpi6tJKgFMmjK4fBTQHUPtG7DmVqlYRTSMffblAajxne
         3xr+pACJLPXcUbPBRxzcHcEkwdfT2464izQ+CjbS8XRoOnb/heYLW6xU/8Tvef3zHmN/
         ih7Ky9jwlKsEkYzmpwXdl+LsFd6t4XxQxk614GIrlasbGMBVdk7X++3mJHweaqIWTtHX
         BjVA==
X-Gm-Message-State: ACgBeo1ht9wmy6NYCPPVqYHOyBXn11RgyBqVhvqZ9mKIld/9Ns5gtCRo
	zCSZSNwu1GvN6jClYHANGlnEUmuk+5uBsw==
X-Google-Smtp-Source: 
 AA6agR6C0WWdlhXiUqHqeq3eadTCQTukS3LuvtoT7CoEjyIaLR11v4RdJ2cUYjnzqhbEuiEfZftkEA==
X-Received: by 2002:a17:90b:3141:b0:1f7:75cf:a449 with SMTP id
 ip1-20020a17090b314100b001f775cfa449mr16109170pjb.18.1660535330021;
        Sun, 14 Aug 2022 20:48:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 b8-20020a170902650800b0016ed5266a5csm6102986plk.170.2022.08.14.20.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 20:48:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] perf: Add packageconfig for libbfd support and use disabled
 as default
Date: Sun, 14 Aug 2022 20:48:46 -0700
Message-Id: <20220815034846.3459068-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 03:48:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169349

Disable it by default, libbfd changes with binutils major releases and
sometimes it creates a dependency to fix it. See [1]

This will help building with binutils 2.39

[1] https://lore.kernel.org/lkml/20210910225756.729087-1-irogers@google.com/T/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 95b4362958b..9f7c300a40e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -20,6 +20,7 @@ PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
 PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
 PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
 PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
+PACKAGECONFIG[bfd] = ",NO_LIBBFD=1"
 PACKAGECONFIG[systemtap] = ",NO_SDT=1,systemtap"
 PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 # libaudit support would need scripting to be enabled
-- 
2.37.2


