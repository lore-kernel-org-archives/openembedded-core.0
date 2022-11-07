Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A0AC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:51:41 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.1681.1667814693940782395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 01:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=eeAHQjoN;
 spf=pass (domain: snapchat.com, ip: 209.85.210.177, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pf1-f177.google.com with SMTP id i3so10079541pfc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 01:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUZ2v12N/XtqCMJG6gpC4+WwNcq/gUXRXl1GicQs42g=;
        b=eeAHQjoNY9kpAsdn3/84IvRu/ien34kiB0YKb9AUHGO+WRTzBx9iKGCYSeboav4isI
         ql5Mq7mhK/sneLRIOBRTx/qB+ZzwPDE2dneW5+WRqrwqnXaUkiIN3bR9FRBe2AGFjfq7
         iMWd6a7krpcWTwqtFS9UlgAlobfUPpajKNmnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUZ2v12N/XtqCMJG6gpC4+WwNcq/gUXRXl1GicQs42g=;
        b=GG/oS4l0tGmIOSfzTsyDb0We5Xw6Ri4dEeO5ZRnZa1CaPDvhj8JZapUJ7EubL3NswE
         B+r2DPtJOcYRuiSfSatM5xd+g7JjU+5lSklyLFTaamWGyeyCp4E3jtmzv5M5IPaEgdMw
         BLHyB4jia7e7Htty5qolhL/JGPYCtrXNiF3Pq6Jer/svKIXJ15ORZc7I7t70n3wuVyAP
         9fBdS0Hhj9ayujomz+WkR96y9WmkuMEGfDUj7MAAfQqX1tuFUA3/r/HADMFH6wZIUoVj
         evSGq37ua86RLTLmdCAY8b05In0LK7U69GabIIVzNSTcDWRpyFQcq0Fz5pNFi5jz8ysl
         I48A==
X-Gm-Message-State: ACrzQf1/c+SjDW8TAvsY5j44s7+Pi3hLaBgghF3TxHc6GzaDgoUbx5xW
	2JnhzHz3pq5TjBrgCBmVymlQT6xw56XUMyj4
X-Google-Smtp-Source: AMsMyM6EZVcjXQruwJuZ+6bHTenljbQ4refSDXDG9/6R5b70OXwrrtInI1L+cpgTrVqPwsl3AwFPLA==
X-Received: by 2002:a63:2155:0:b0:455:7b5b:c2d7 with SMTP id s21-20020a632155000000b004557b5bc2d7mr42032694pgm.309.1667814692909;
        Mon, 07 Nov 2022 01:51:32 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.26])
        by smtp.gmail.com with ESMTPSA id m21-20020a170902d19500b0018862bb3976sm4528984plb.308.2022.11.07.01.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:51:32 -0800 (PST)
From: Etienne Cordonnier <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] mirrors.bbclass: use shallow tarball for nativesdk-binutils
Date: Mon,  7 Nov 2022 10:51:19 +0100
Message-Id: <20221107095119.965403-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 09:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172829

This is useful e.g. when using meta-clang, which introduces a dependency to nativesdk-binutils when
populating the SDK, and then a full tarball of binutils is fetched additionally to a shallow tarball.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-global/mirrors.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 81fef7f660..8b984de3bf 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -91,6 +91,8 @@ BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
 BB_GIT_SHALLOW:pn-binutils-native = "1"
+BB_GIT_SHALLOW:pn-nativesdk-binutils = "1"
+
 BB_GIT_SHALLOW:pn-glibc = "1"
 PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
               git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
-- 
2.36.1.vfs.0.0


