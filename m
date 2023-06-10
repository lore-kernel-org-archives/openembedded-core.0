Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE780C7EE43
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 15:50:30 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.19988.1686412225140419379
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jun 2023 08:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SGJqx7qD;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6549df4321aso2940917b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jun 2023 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686412224; x=1689004224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H3eNj/+xKWbYRv0Hs2p9NJc6nQhuhzv6z4lGpQvfyaE=;
        b=SGJqx7qDDHDekhw1/C5aB8tAcpeCVtqApJkDo9zVhHwO7M6OfYz6okRQA0cWdR+1c6
         2R7g4KjvFpuEZp2bhWkvG5IJMPYCjxn1n6if+WTPnV/sUI+7pN+wwCCNosP0r14WwU5I
         tntCzEF9tCVv9FZhWynmZztqsnzAPXZqqNvd9UpqzNnqqX/VlkRAgzCECx98/U/tDOri
         xWB+AoLGnOFJFeYvoCqtIa1aoWpWSkQJTAg7BTQtnPqlXjrWw32NSQHx5DSYdaTBV0kk
         syHXKKnUYp87bexUMwKUNIeuGIk04gLHzEbjXgx6vkj+J7R3uPQXjsU3/lRd8DwoCe4y
         ioBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686412224; x=1689004224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3eNj/+xKWbYRv0Hs2p9NJc6nQhuhzv6z4lGpQvfyaE=;
        b=VIuYgHJMo0lTyUJi1SYm39aKUs/3ypoiZmBEynwz84TByqxQoT7tN1WQoMhOUSVOZG
         PxnHzop4HzjfRwUXeMsox32E7vqb1Y9r7VyK+r7f3PgaAw4dN4vRX+wgwz8QFMnTVN7g
         yVGkHVXB/M2D2RZFboDyp7MY/6w0ejOyAxLILzzYlEKt64DDGw29o5iXsblt2huG59FO
         6Ov7Sa/XOj9pXkDoD0BVU8TiXYaKgS4N2JFT8QZnHSzu1Zh5E8+ih4E1PKTc0nhZoRqS
         pRc4ImdX3Ssw9l+drctstBiRtlTsMWi+ihLdw2lfgDUHcy/6NtsNY6k+t+ATzP1844sw
         6PZg==
X-Gm-Message-State: AC+VfDxWmyMOp8gY31T+IbQdMhG25m3/HtBQa1n/yIqPizTbENHSZBDL
	wEuan3di1pT8cgo13z+4TUZ9rnfAb90=
X-Google-Smtp-Source: ACHHUZ7cMsOcTlMYRpw6LPwJa58+01xjjvmW3qKYpsb+E6R9Rj2LnCZkBazUNLkVNYa7n8nZGuFDJw==
X-Received: by 2002:a05:6a00:14c6:b0:64d:f5a:3fd2 with SMTP id w6-20020a056a0014c600b0064d0f5a3fd2mr6105015pfu.28.1686412224289;
        Sat, 10 Jun 2023 08:50:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id c8-20020aa781c8000000b0063aa1763146sm4467227pfn.17.2023.06.10.08.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 08:50:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] glibc: Pass linker choice via compiler flags
Date: Sat, 10 Jun 2023 08:50:21 -0700
Message-ID: <20230610155022.3999498-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jun 2023 15:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182610

glibc configury tries to detect ld version and assumes BFD or gold
linker but when system ld is pointing to lld or mold it might fail the
linker check, therefore pass LD variable to explicitly point at ld.bfd
we are using BFD linker only to link glibc after all.

Second problem in such a case is that some partial objects are linked
with CC -r which will fail if we do not inform the compiler to use BFD
linker thusly pass it via appending to CC variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.37.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index b27f98fb199..3387441cad9 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -103,10 +103,12 @@ do_configure () {
 # version check and doesn't really help with anything
         (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
         find ${S} -name "configure" | xargs touch
-        CPPFLAGS="" oe_runconf
+        CPPFLAGS="" LD="${HOST_PREFIX}ld.bfd ${TOOLCHAIN_OPTIONS}" oe_runconf
 }
 
 LDFLAGS += "-fuse-ld=bfd"
+CC += "-fuse-ld=bfd"
+
 do_compile () {
 	base_do_compile
 	echo "Adjust ldd script"
-- 
2.41.0


