Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8790CC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3412.1637741318225777798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qNjJGvox;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso4561873wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sFNBZgz9mJOjnLEwcZm9FBV0HKR2G59sqqyIWXGZSx0=;
        b=qNjJGvox/lofGiu8PjWJWCYjuJFDvRsiBQgqCERII3BSqRKyUhyILRZMb25hN4aWs2
         e7d4qUtq7V7D0DiuaUbdHLJ8CSbv3FXwvVq+4QHIEziTVXLnqEWmjjTqH6lejJLdhprG
         uTq2TVQ+VGwv8rLbsTPMkjmjVdElUldIRzJ1lgECARytHoTIKrY6ydoM7eWFU/HHtxD+
         YbjzBa54w8k2D0mMruVGMmKMPQr63LZt3nqAFEn6JRNH/ZwDdDtRKO75xfMWpQoDXcuY
         QtrCwxUIMZQKOuSdIBX00CidyV4fgJJMU1TTVB9Xjz4zzMrsCcefY486NnKnPkKOOKWj
         2ssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sFNBZgz9mJOjnLEwcZm9FBV0HKR2G59sqqyIWXGZSx0=;
        b=Sd361TyizZcTQOWvxz+57umwUeGjLGiw6iJ6Mg2mg+2GeU0zvKs8VVCbAP8uWez/9q
         ARniSDpZIIIVxGDERDJOvYJXZJkniAnWxj+7iZPMuhbHCrdd2CuYjEvKhmXj9v/rOKDE
         lzSluDDHx1VvPdAkqWFHH1NQAqCMrU9DEJEwm38itbDQEQgyOBYoAK8wzvd6e9VKgbgZ
         UiQ/WniSTWbeHHMRTJyAKrlbTmxoMtU0tUK/NqbMCV3/Yq3C2qqCNj/XpFtoEKOypuGS
         st9naOhLbyh/lCyMVnP3oJ3h44oBeaU82kss3zbQdxladlxYnnEeZ8mT40KnYKrATUsV
         JJEQ==
X-Gm-Message-State: AOAM530ezfH510Krqg+09IqYQmRBrhqlvyScY2p8YLQyTjvfuM5/d30g
	MLw01GgwOneDUvvFNaOPmJXg1isx78vuZA==
X-Google-Smtp-Source: 
 ABdhPJxz+xDQkaLtmiIKQoD5LtmWLJAoJagZTNNkVFurkQNl4U/uI+7NW02rgR4VkoJsXi0OMhh5AQ==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr12366531wmq.175.1637741316791;
        Wed, 24 Nov 2021 00:08:36 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/21] groff: include references to corresponding upstream
 commits in a patch
Date: Wed, 24 Nov 2021 09:08:14 +0100
Message-Id: <20211124080828.530981-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158663

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../groff/files/0001-Include-config.h.patch                 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/files/0001-Include-config.h.patch b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
index 34fca1eb2f..99f590bef3 100644
--- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
+++ b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
@@ -20,7 +20,11 @@ In file included from TOPDIR/build/tmp/work/aarch64-yoe-linux-musl/groff/1.22.4-
 We delete eqn.cpp and qen.hpp in do_configure
 to ensure they're regenerated and deterministic.
 
-Upstream-Status: Inappropriate [issue fixed upstream with a similar patch]
+Issue is fixed upstream with similar patches:
+https://git.savannah.gnu.org/cgit/groff.git/commit/?id=979f3f4266151c7681a68a40d2c4913842a7271d
+https://git.savannah.gnu.org/cgit/groff.git/commit/?id=fe121eeacd53c96105f23209b2c205f436f97359
+
+Upstream-Status: Backport [see links above]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/libs/libgroff/assert.cpp  |   4 +
-- 
2.20.1


