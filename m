Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6307C10F04
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.11173.1702002835759874529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nlbHeJz0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-286fb44eb16so1317881a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002834; x=1702607634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqxpUumbwSNHKzpl4XXrPiaxxhuLgYRJhll3f4mTPIE=;
        b=nlbHeJz0DIzx04TTue2C2Ae+pQTBXyk1fTn2jrT5GOm9FlMwHu3A9HYjBS8VUbinxz
         pFxNSWORG57u5m0yDe4oGsnMVkUJYLMgwZPjHouZ9M0+8GElFjFe/5LaYjqPEa70XTJy
         blBzg92V3zIydtLVuDWDVA4TCBNfWmgVrRE6OS+cObklHVBK3MDsOGOtvMmOfRA3yUuU
         Km0u6GCZqzEmVVc4yjPJ9bjCRWjS8GYKKpUDQHDloa7Vlm4p2g+Juzx+La0CWeQc9GtQ
         7gv9M9j3FXoytu7DCGaDXORW4rG86FzR9tIxeCxmnc+zauubemK2aD82OJS+yhYISQhh
         q9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002834; x=1702607634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqxpUumbwSNHKzpl4XXrPiaxxhuLgYRJhll3f4mTPIE=;
        b=QmspUrimwfuzhm2+HmEDJQKmku8GVXZotJT2VsVy7N/xNFf8tKYz8nzcQPegENDnaK
         Gh1HiXCRjiFb6sgaqMk5vdZBolDyv/Vswrai+ZWWaBYsjRIajoduDEslIhNEApM8bkIS
         +SfPs/V72X9dg0jmK5gS+jDwZLNDpmv55G6EdAjl8i6dt81I0eIWqS8xSekdCkWIHRP3
         o5jOeot112h/4RKKvpQk/LF9WgyUcS94r2xwN+sjTIw2mRjyDjECVoL12ZNyGFCZUmVa
         e6kUv/mFUgAo8NWLOFxC+KtYMRv7l5nrLZ7G9HaUEUnjuKB6DYdNSiLDHAQf2FVejR/s
         3XbA==
X-Gm-Message-State: AOJu0YxlTBs9GsQneCd8JfGXuEnvfT1lFfns3524SFl9L52BJQq9hY/6
	UvjLB3Ky4s9746zYnV+sTiRSKlayANCkOTkNG8Q=
X-Google-Smtp-Source: AGHT+IExWJjVmuQ+cUrhrYVbhZlBnI6DkJ5ubOmj7iNUHCApU+hB2uAbbbGlDFTVfpeXdqswpBN2XQ==
X-Received: by 2002:a17:90b:3686:b0:286:6cc1:28d with SMTP id mj6-20020a17090b368600b002866cc1028dmr3253476pjb.88.1702002834489;
        Thu, 07 Dec 2023 18:33:54 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] rust-common: Set llvm-target correctly for cross SDK targets
Date: Thu,  7 Dec 2023 16:33:17 -1000
Message-Id: <cccbb8358be830b83a43fe1ff8a88932dee1c228.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192003

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When a 'BUILD' target is requested we shouldn't be looking at TARGET_SYS but
at BUILD_SYS. Due to the way rust mangles triplets, we need the HOST_SYS triplet
to work with existing code - fixing that issue is a separate patch.

Also drop the arch_abi argument, it doens't make any sense to a getVar() call
and was a copy and paste error.

Based on a patch from Otavio Salvador <otavio@ossystems.com.br> but separated out
and tweaked.

Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d554161a045d12411f288394e253c54aa4c1257c)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index db0bd8fc1b..ac00fd3d43 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -307,9 +307,13 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     features = features or d.getVarFlag('FEATURES', arch_abi) or ""
     features = features.strip()
 
+    llvm_target = d.getVar('RUST_TARGET_SYS')
+    if thing == "BUILD":
+        llvm_target = d.getVar('RUST_HOST_SYS')
+
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
+    tspec['llvm-target'] = llvm_target
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
-- 
2.34.1


