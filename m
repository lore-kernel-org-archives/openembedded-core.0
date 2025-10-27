Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F1CCCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 23:39:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.5763.1761608373708447625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 16:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mjao3mHi;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29490944023so35001595ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 16:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761608372; x=1762213172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wgjlLR1z6G1CX+bp58BnVbpqiX2/BwRUY7fjgzMmCc=;
        b=Mjao3mHi/B92urwwOpWN/Cz4UHumDcd69PSE54yJGIEOCPw/39iAMF+1DXckKu7Pbh
         etz7KMSZsQJ1OOyCtscSrkpMNHVabspVmX2RS/w/2BrTNUu3dA9IaoAF0GiaQ542Cqdn
         T/VWxWoqtqcwx680/4rDqKfdc2yMm9/Pe48PLT5EmYcnjdeZ6ya+jwQ1JEDpv1L8wgyl
         8dW2Bb3y8SMeVQcmILsxePIW94bQra/quV6GYaDvyktAqZaaF80xcV7oOQD6MB5e92JY
         BYlnxl7Q8t0NjTBzLeDkXKIdFGfAYq6W2fWZue3NS6x9Xs2UxqEpyXqKg23PiNcNL63t
         PhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761608372; x=1762213172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wgjlLR1z6G1CX+bp58BnVbpqiX2/BwRUY7fjgzMmCc=;
        b=R+Ot96WKJiH0AfHUS80O5id/rXXAc6NcQaErV4Bq8rvjtLkfTx0zgboy634NkYbZWG
         qnfFBVSeROQAEJpX5FnqerwQWCVBItf0NVVHuuch7jPGKnvebBGJsnOAULokdrnodXPt
         CsK79O8kzFwhVpq+mC9vevs5wJrD4SsZn7mfoopN/k0dzTlqJr2il9v5A92LuiuKVEBk
         zyBnukQPRnayPunvBy2kglIcV4l2maev1gSumjHWl8RfDoJXX3rF83bpgrTvMzHFrOlk
         TgGcrhSYQHAp5mPwWe4eW3a3IOXchbPQEcvioQ7A+nr9BhiINHCy5p46wUlXTCXexrSp
         vDlA==
X-Gm-Message-State: AOJu0YykCqSQKiZ2byIioQPntz7tU7VkM6fsabD/aMVGtJrhl0VWfHVT
	HzzGSvQq0+hSN6SWFP1r2D+W+exbjbg5rp10J/WTQPF1Az+IWxpa/t3E4IxuacMR
X-Gm-Gg: ASbGncvZyZYy+nbEMhO5pnfUXQXaBlH7T3qKRBTpjNU93ISEUoXpPQ+GRmtzXsjeuKa
	mT//WzioCLQ764wI3tTv/+E7Z34mP7KlpeACElPMOhlMJJFlve5iUqbpA7RxjUs18szsFrgFliY
	9MRwIuo+2aFWKQBJdW2v8ORj8nTPBAhHfMvnPs2dCgMKYlJ5AFV2OexwoU5hcuw+Ez5ZcFxBPTH
	/IuxBYE0MyAN+zBL94A3hB7C2++qc0N1exbQJZzo6vzzPILLvjTFO/sNupq972M8bQiA7fDZ8rt
	2gd3QMOtt+UuSv/YZ/pk+7XZfs8D9/qouBZ6m/QhxFWV36Iuwz8gkC4t236qLwO2Y8GeVChzfXI
	knVBLFFiSNj5lnttWEmii0alpz3EbZY5dVH3585EgfxnvlTNUTK2zPvxdghS6dPaxTVNyfv6y32
	N54G8fLkLIUx6dg/QMERxzBCOTLOXJ+aNmwEobWgkDaB3e2MQkJX9h37TOFvQJBgvT1a3i0Hey
X-Google-Smtp-Source: AGHT+IFivY//4Ch20OveXniVeOvvtW9zNnueoDFO6cEpSsD2j8ogr4yAMwggE9Z8cqFLjwZn6NXw7A==
X-Received: by 2002:a17:902:ea01:b0:252:a80c:3cc5 with SMTP id d9443c01a7336-294cb3d6169mr18935755ad.22.1761608371941;
        Mon, 27 Oct 2025 16:39:31 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e4349fsm93983645ad.107.2025.10.27.16.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 16:39:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] classes/toolchain/clang: Add placeholder for dynamic linker in cross-canadian packages
Date: Mon, 27 Oct 2025 16:39:28 -0700
Message-ID: <20251027233929.2454193-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 23:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225370

clang-cross-canadian is just symlinking into nativesdk-clang unlike gcc which
has separate binaries and they have inbuilt dynamic linker specs. To help clang
built cross-canadian binaries add it via cmdline option here, cross-canadian
binaries are only usable on installed SDKs, and these paths get re-written with
correct SDK specific linker during SDK install relocation process.

This helps clang built cross-canadian tools e.g. from binutils-cross-canadian
be relocated correctly on SDK install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use a placeholder that is not confusing with real ldso

 meta/classes/toolchain/clang.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index b4a1c180f6a..9a3cd0e5849 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -32,6 +32,7 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre

 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
+LDFLAGS:append:class-cross-canadian = " -Wl,-dynamic-linker,${base_libdir}/placeholder/to/be/rewritten/by/sdk/installer"

 # do_populate_sysroot needs STRIP, do_package_qa needs OBJDUMP
 POPULATESYSROOTDEPS:append:class-target = " llvm-native:do_populate_sysroot"

