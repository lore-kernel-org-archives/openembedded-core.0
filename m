Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBADC4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 19:18:12 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.127861.1669663088437181180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 11:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H6F5/P0x;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id j12so11135179plj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aM5EcCYjvpF28cv7n96epGWimEo47ZEP6UTUC1VPYKE=;
        b=H6F5/P0xPdkziERHZByl3epDJ4lZFdHdZOKplLhmkmWFvBZG7CnSOOaPBhHSaffw6p
         PZ7dB9UfeJwBEsZsYonGPYVgX42o54vuXH1++fJ7PjF+DB3n7GNNJLqWscNJCmn2z+Yj
         X66gazDEHgFgchg0GT9bJ92eVd0xmBOQiPDEKsTOBw4Uc5EPib6qCSWJbSG6Hj+LHhK4
         OWD6r5y1ZSAe51rG9ax5WrRCF+qmHeYkuJY22Bw5FeSDKQ5DZCTxp+8Qh/xbUiiESerT
         D9Qpxf9UjKGTSD94Ib14trLCs0IXvQWkPI1VTGJPrmQo5CU6ozvSYSVzady8EkYg5ahN
         bamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aM5EcCYjvpF28cv7n96epGWimEo47ZEP6UTUC1VPYKE=;
        b=7fK3IbpTPcuaFrNAaygPC44CmnpfUJeN2WlBEpSipsCQkvDVed7cFRtgyZniy5YUdf
         lm6AsB/n8JZ+x43I4TfDApeW2+t1T9CTvCzAIlZoN+cIaB51ByUyjyxuQ2SrHQaGISn4
         L8+SEZgP3kI4KJhe+zLU+JcTMAHqmZiMdyP/MGWbg0eh0xM8mtJdRIQxqzQRQWjfiddu
         riSbvZHVah5AhJICCFgcjR6flpO4kuA5gI3n43rMLiO7gYDJr00xO+xh7p9xYqKzc4xs
         blW+FTI5rcqm06OUJsQqRkX8X7eFZbGW9cx60Ij1wMsAcrJ9wAvV7XGlDNIh/JtKtLwN
         TRww==
X-Gm-Message-State: ANoB5pmZEhHwqPPVbrrAdiqjN9jJrF/Bi12nEssH4LZAOCP3hp9L3vwQ
	4RUQlXX2pEl6XX1fUhy0ioRCXJSHFA8=
X-Google-Smtp-Source: AA0mqf7Btmc1cbRywwPTNUzmzicUcJtEo+iqUid8UCRuMVl0uSuDOSnr6txlvpbTFA23zjI8tkonJg==
X-Received: by 2002:a17:90a:ff14:b0:219:1927:27bc with SMTP id ce20-20020a17090aff1400b00219192727bcmr14469149pjb.229.1669663087443;
        Mon, 28 Nov 2022 11:18:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id m14-20020a17090a34ce00b00218b47be793sm7863636pjf.3.2022.11.28.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 11:18:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest on tip of trunk
Date: Mon, 28 Nov 2022 11:18:04 -0800
Message-Id: <20221128191804.51591-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 19:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173942

Brings following changes

* 8f925945 fix return value of gethostby{name[2],addr} with no result but no error
* 63402be2 clean up dns_parse_callback
* 0a7b4323 dns response handling: don't treat too many addresses as an error
* 41603c77 dns response handling: ignore presence of wrong-type RRs
* cf76df0e fix missing synchronization of pthread TSD keys with MT-fork
* 5ff3eea9 fgets: avoid arithmetic overflow when n==INT_MIN is passed
* d8f35e29 fix AS-safety of close when aio is in use and fd map is expanded
* 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
* aebd6a36 fix potential deadlock between multithreaded fork and aio
* d64148a8 fix potential unsynchronized access to killlock state at thread exit
* 36b72cd6 fix potential deadlock in dlerror buffer handling at thread exit
* 833a4691 configure: disable TBAA optimization because most compilers are buggy
* e6e82132 disable MADV_FREE usage in mallocng
* 25e6fee2 remove LFS64 programming interfaces (macro-only) from _GNU_SOURCE
* 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker remapping
* dec8f0a4 dns query core: detect udp truncation at recv time
* 8c408937 getaddrinfo dns lookup: use larger answer buffer to handle long CNAMEs
* 759bf785 arpa/nameser.h: update RR types list
* 51d4669f dns: implement tcp fallback in __res_msend query core
* e2e95176 res_send: use a temp buffer if caller's buffer is under 512 bytes
* c87d75f2 adapt res_msend DNS query core for working with multiple sockets
* 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish NODATA vs NxDomain

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a72d87ea6f..29abd17771 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "dc9285ad1dc19349c407072cc48ba70dab86de45"
+SRCREV = "8f9259450aa43a6fd539e428e61e2961b725fbae"
 
 BASEVER = "1.2.3"
 
-- 
2.38.1


