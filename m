Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EE9FC72DF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 23:08:46 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10701.1774393723508938205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 16:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tMVQ3rkj;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c156c4a9efso949255eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 16:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774393723; x=1774998523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xXZKnjQRFwk+RJX2E5iJoDwK+trjnTKE906W/Dmj9w=;
        b=tMVQ3rkjrGi15TSNTJEyWeWObdzL62Kqhiv4d5UxQ2vYIeYl1P/pJUBQgME10XsaXA
         GiFZU7JLvulkZ1OEVAhJPHOnaaXCX9yP+7hs3AdZcF/GmVAEoVmAg/ecqhdFdXMhmnw7
         kYGoAuzDaCks4I7luX1ykSM2PCOa+dog/vKNu725B2WOm9etDML4jZkOZ0t77VhPGdrK
         75PcTEzGWDSQ8chSDFEsseOw/yUTfOvp8hHqpO9RoxsRDCK6XigV3fPeTSKrZCppKgA5
         Usu1UI6vFh8t7hOKzqPAlxbxDZQ+ouEFcyb16losbjezFUVyoiT9TNPdYKC7f5qKv4u9
         /k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774393723; x=1774998523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xXZKnjQRFwk+RJX2E5iJoDwK+trjnTKE906W/Dmj9w=;
        b=bRdChK/b9cXyL8mN4G3VdBe/2afJ7ICMWZSTw1SUIJkCL1NRo8iEgGmXUvMN5HzFsW
         JgyY/WwY4MogiqRje6wwG26HF4ORykSIjGkQCw4KZVTrAFLfS9jhN9eHvBQ7/NtJHDT2
         SrHZbUjrLxevwsA5ZTBEkw+Zh/KBCgJ55MEP4h/MhlRLFXCABuT5qQJtqdypkMalUD7U
         z/+ito3P8oRLVD1rFkNIjW9Q/wrofZ9SYHWv9TwQoYMpyDQAJmTwhi4pP1LPBzQIxW1Q
         cl66MglISqFtORuBZ+/7oYq1IeucV2CJCEYDvtJcYyyIk509eO+lSCl91nelLI9UEbhV
         hoYQ==
X-Gm-Message-State: AOJu0YyRsBRqjO9WsN3hW2+PQcUkqIRqWJ8oSIaoyipYvN2Af1gNKG2l
	5qXee/WFFpb3CK1xzPQ/D6HEcbCMe4pwEFB1Bl1dWBlj+hbkAZ71PIaZDR5mUV9pMn0=
X-Gm-Gg: ATEYQzx2jB9D9iWjBJTD8nqexO5BDCaQWsF3bi+y3/bdVvoUAZMqjfTOLu8aZxBrXrL
	OA/9tZd13v57haaQxcnT2ZvxSB8iC51U7u31q5zS6/fFkhut+d0MKC+IRLJeaV9Pqc51JfU54Sh
	W/8+AKfPk/flTGUBXvypJyVQPaqoGCTbVpA/t/20gpB+Al5ihVnFcP66KqRUm1U3tFHUW5g0aWO
	oa5hvQ3eawJaghM+Q36Aig1l55sSQjeOJ6Ue3FmjNk2L0bKI3Y/LERxGjIX54bPBlUWVHbuKnyn
	XIuwlMFmePpD7n/10tlMpfQMsVU+2uCPoOxeyRrHlGsqRYjfPtSJOwOLgRPQqw+7XUd63qwujdo
	ZaQkrzfJz3oK+EcN7k5wFg/Ctq4FgvbF8dsJGfFDBKN7hW45irM60cdq0ZDiGCN3VEmxbUjecy9
	JS7d1JngLGkY4et3pT6cLYiRnKAOHEpLp5hPGhUSQlZvfbgkn5liF8bObuCrfs6TGgZH7HnHEAK
	pjUllh9bIMaNzJxmkdjaKUK6Fy8ZxTha+3KmDMdvBkL4KXZwoPFPboL20Gy
X-Received: by 2002:a05:7301:9f04:b0:2be:8216:57cb with SMTP id 5a478bee46e88-2c15d44fec6mr732904eec.29.1774393722507;
        Tue, 24 Mar 2026 16:08:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17d1ddsm16235874eec.11.2026.03.24.16.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:08:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] libclc: Do not use spir libclc targets
Date: Tue, 24 Mar 2026 16:08:35 -0700
Message-ID: <20260324230835.2363568-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
References: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 23:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233833

From: Khem Raj <raj.khem@gmail.com>

These targets do not exist in llvm22 onwards we should use
spirv targets spirv-mesa3d- and/or spirv64-mesa3d-

Fixes
 WARNING: failed to create target machine for 'spir64-unknown-unknown': unable to get target for 'spir64-unknown-unknown', see --version and --triple.

Disable all targets except spirv, they do not build
ends up error like

| cd /mnt/b/yoe/master/sources/openembedded-core/build/tmp/work/x86_64-nativesdk-oesdk-linux/nativesdk-libclc/22.0.0/build && -o /mnt/b/yoe/master/sources/openembedded-core/build/tmp/work/x86_64-nativesdk-oesdk-linux/nativesdk-libclc/22.0.0/build/tahiti-amdgcn-mesa-mesa3d.bc /mnt/b/yoe/master/sources/openembedded-core/build/tmp/work/x86_64-nativesdk-oesdk-linux/nativesdk-libclc/22.0.0/build/obj.libclc.dir/tahiti-amdgcn-mesa-mesa3d/builtins.opt.tahiti-amdgcn-mesa-mesa3d.bc
| /bin/sh: line 1: -o: command not found
| ninja: build stopped: subcommand failed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libclc_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index db846d59a8..89262cf314 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -19,7 +19,10 @@ OECMAKE_SOURCEPATH = "${S}/libclc"
 B_NATIVE = "${B}-native"
 
 # Semicolon-separated list of targets to build
-LIBCLC_TARGETS ?= "all"
+LIBCLC_TARGETS ?= "spirv-mesa3d-;spirv64-mesa3d-"
+# opt tool does not support all targets
+LIBCLC_TARGETS:class-nativesdk = "spirv-mesa3d-;spirv64-mesa3d-"
+LIBCLC_TARGETS:class-target = "spirv-mesa3d-;spirv64-mesa3d-"
 
 EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
 EXTRA_OECMAKE:append:class-target = " -DPREPARE_BUILTINS=${B_NATIVE}/utils/prepare_builtins"

