Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6781CC38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 15:13:16 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.334.1662649986859863446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 08:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eoq+qjGF;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id 9so14976991plj.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=GGNbtZBVesQTBNmHMbax/TBQag1M6d7L6JeAYtS/BEk=;
        b=eoq+qjGFZX8G4b04RkULumcJSO/RHrelT12KlVMQ6G4Kba7E2qx0aTVkv7F11Bbzx4
         wpcZZC45dvByibehHHjkYZJq/VDj4Y4oPS5pxUBcuuW0X6OF2xC10iWubacDYQguPfcl
         5SE2zJwRdUUOaktSGTrcOiJVMviurcsORbcEG4Xso7ogCO+L8ilqb9jXD8K0T8I16sSF
         eYzJmTjs4KwZ/bSmweo5B6VaJh0ej7CPJEL+eKwS2yTQiKogHA8cJ5zYkL+SgnTltTHF
         /wt4klWEEWll3MgDypT9CsX09RyAlNULid7JVLrwJdWpjM34lOHbUM7jmf5wy4JGcpjB
         Z7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=GGNbtZBVesQTBNmHMbax/TBQag1M6d7L6JeAYtS/BEk=;
        b=luSOdX1RauiiwdbBIIsxBqinU+kNC1lAfn7ZHzS/hbvJc1U+3uHpm3ngaepMgECsRx
         YPRbL+gfXK+L+lJN4rqkDjsuDNdw0FJAz5kBhU3FbygpLOUnE5n4sgszV/PLSVN0NrkX
         FIj+IyNk0O6HsPfWNBUAgh8nOf42dfruahoJSBazskiB7tponmmfFj36WHrftjG+4Fzv
         RxYeLUeMCIUfPNC4cfd3wFTLLrlhVqUMYnpMZuSn2QlYsFv0qbVY8YAVciVj6LLOgQ2g
         1Ext/WTGdKKK/BR7S+XsK6sOMXzDgwMHPmc42gWcyY01S3BWwEGTO6kvNn+sd9v2TYAI
         fjFg==
X-Gm-Message-State: ACgBeo01NrNmi9G2Vp05HAFhzc/is129dhn15dePcbMuX8rq+EFG8odE
	V8dIYaYpayU20/sx98JiscpLWMwHfl4MNQ==
X-Google-Smtp-Source: 
 AA6agR5mFc/hkgJF9c1Qu6pkdDOaCmH2lxJcqPoKs5GWIh7STjXCQvCLGty+8KuDJmqBa/NiXByfjQ==
X-Received: by 2002:a17:903:110f:b0:171:3afa:e688 with SMTP id
 n15-20020a170903110f00b001713afae688mr9565393plh.162.1662649986006;
        Thu, 08 Sep 2022 08:13:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 a5-20020aa795a5000000b0053e199aa99bsm6827524pfk.220.2022.09.08.08.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 08:13:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust: Use variable to specify extra tools to install
Date: Thu,  8 Sep 2022 08:13:03 -0700
Message-Id: <20220908151303.2592885-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 15:13:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170462

All architectures may not support same set of tools, therefore use a
variable to specify this. E.g. on riscv32 only cargo-clippy is buildable
right now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rust/rust_1.63.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-devtools/rust/rust_1.63.0.bb
index cf6468d212..2f70b33c29 100644
--- a/meta/recipes-devtools/rust/rust_1.63.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
@@ -62,13 +62,15 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/manifest*
 }
 
+EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
+EXTRA_TOOLS:remove:riscv32 = "cargo-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
     rust_runx install
     unset PSEUDO_UNLOAD
 
     install -d ${D}${bindir}
-    for i in cargo-clippy clippy-driver rustfmt; do
+    for i in ${EXTRA_TOOLS}; do
         cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i ${D}${bindir}
         chrpath -r "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
-- 
2.37.3


