Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62C8C25B08
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 07:22:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.3075.1660116137788549972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 00:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jf3cC7sC;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id j7so16750379wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 00:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=SgPkAMhm6V+BM/ieLRlMsDfZK/FviTfLb5eVAGicHk0=;
        b=jf3cC7sC7KtxGjq2sgu92jhu105eEdu7eIsJjTZIcAvTYNBEtlI4MEHPIJfEX/4uU5
         sotO17kJl3x88udh0RKkPHoMoSTGt+JVac8vveRPiMnlAM4xh9YKzOUCvwD++DvwZDjA
         RnHbz0FaPYlkrxfOPn2fRhKUJDI8Tznw7sObu8k0PspmPgxz1PTNCetxU6pJiwtH3KJT
         9986OZul//tVYIkxbJlYK9cON5rPY2k+yv7ZSHM17Z6FU39TRGat7qa6LIKte00XCKQN
         kCGO4+0fYZ4lxiXKSRMYtalD+UvNUEYEM7AiDjSbBMrZSTonYNjX+BFtyrijTsbP7Ehu
         BDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=SgPkAMhm6V+BM/ieLRlMsDfZK/FviTfLb5eVAGicHk0=;
        b=WiaEcUB6rLEbQSkt5nzdYDFU7bdwUr153sW1Uj21+i7afNw8+wc7UuwvwzyoFkd/VF
         Oq/bEDJyRTUcdt4NTvXXHhFmgZn/qHAhLdJqZ1pguslX6Ls+Xopz+qHh+LZtrzB+as9L
         mFzbtqCWCaBhJs2UOCKvozg5WH8N6Wib+xQz532eKUu5c355y+Bmy7yZSgg36hlG8uCp
         yUAhGxwTv7oph/BA0ZZKAoI6psVUeQ+u0Q+hNOxZkkCo7Tky3XQOJTqxM4sKXc5H5eU5
         NiG51DhFd9mHYONPATZQnFogbKS9HlGWeOquDlNJUu/O4uuBb74CcSdu6OHiUDiWdJdS
         TEcA==
X-Gm-Message-State: ACgBeo0+CzzBZs8n9YIc5ChQdezw7emUEeBT+bREzRDBPtXQaajeoRV4
	191a3/1pE8wfXlOfGKBcWp+2NX/q/G0=
X-Google-Smtp-Source: 
 AA6agR7odygb4m6v6nFG2Gjr1OeeXx8JkMYnVUYyBBnku0uy+gcTsEs8L3/LG8KVGnA3knP36FKsVg==
X-Received: by 2002:a05:6000:1861:b0:220:68e0:ac7e with SMTP id
 d1-20020a056000186100b0022068e0ac7emr17070700wri.376.1660116135692;
        Wed, 10 Aug 2022 00:22:15 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id
 ba21-20020a0560001c1500b0021e5bec14basm15315393wrb.5.2022.08.10.00.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 00:22:15 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch 1/1] perf: depend on setuptools if building
 python scripting
Date: Wed, 10 Aug 2022 09:21:38 +0200
Message-Id: <20220810072138.2440138-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 07:22:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169185

From: Max Krummenacher <max.krummenacher@toradex.com>

Starting with kernel 5.19-rc7 perf changed from using distutils
to setuptools.
Add this to the dependencies to be prepared.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/tools/perf?id=ee87a0841aa538ab7ad49cf5679ac5ea2682c909

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 95e7eae9fe..4b15b11462 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -13,7 +13,7 @@ PR = "r9"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
-PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
+PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3 python3-setuptools-native"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
-- 
2.35.3


