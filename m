Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83886C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:28:50 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.100705.1701786526609770977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f8JMCvbn;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: jhatnedap@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50bef9b7a67so3474279e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701786525; x=1702391325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iqD+05fDDF8h/8Rgh1OXmOVczzWr3DM9jKd7zs8LVLg=;
        b=f8JMCvbns2nRgdxea6PYu02PHHpLxt0qZs2wlfGFTRD7Krhr/U6EHSM4epKtUEfYbX
         KJRxzP011dVlxqXkp6n9cz5K+cWcrOhR5hNamxwDKeh2seD8ccl0K/RbJ+VqEzT6tksq
         Zm/n7O4OVtxkWO+ha7svtw8JFIfPtI1n1m0NRRg2NkhYAAsMr9k71YswDZYs+/5ZPCLi
         4RPLf8Co0G/4mUEbDKImBQZyruzvwsRR6n6FdiqsxfxTwc6hzH2DvZb2lcsYIid2yCo2
         OmEGKlrWjURmoyVutcdJjqWtSFhCtzjYGN1hkKsRG9MBkrn2lvmYJX3cTXu9+Aogm8cp
         Zi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786525; x=1702391325;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqD+05fDDF8h/8Rgh1OXmOVczzWr3DM9jKd7zs8LVLg=;
        b=S1jZZqmP4f3RmlwILLwQhaK8bIVgdGlK/DiS5mGrDpYN+RazNxSW4dnk/fCKdW2FmF
         N++4W7fVAmIf8/BmvYVOS/EvrjEMVf+iORxnDFGm4PhKPHhg1jn42K8ZfCYp4dnqH4za
         zrfO6gLIlbCxcelW+CmhfnnzEFmK2wIobtNsvFEwNUuNafmQkH1MGMHVbmzlpBAQCKdA
         s3/gnYZqhvObUPDSaXwJeDI8/cIYXyTTUpG9Dp85OtGDHvYMTy/M6DQKelM8EeLYbh8Z
         yKlrImtGdOviiTQtV6WL4fRYnoFKcdAkpjpkD72ACO4H3oXMAcICBX+ThyOtDPUseiZS
         otmg==
X-Gm-Message-State: AOJu0YwB00WpAk+kNnF6Kbo54tSRZbg80qx/LNY6hFrsH5mo69aERAaN
	amW9m2PJXZWeq23ulxUWz0+8jTeiCbY=
X-Google-Smtp-Source: AGHT+IHzIiHIGNSgKioj5Ddcu65kqMoqYltSJKge4E9abMRF8jVaXGroHfaD32kCEtIG247Twnew6Q==
X-Received: by 2002:a05:6512:3b9b:b0:50b:fcdb:8df5 with SMTP id g27-20020a0565123b9b00b0050bfcdb8df5mr1594350lfv.24.1701786524555;
        Tue, 05 Dec 2023 06:28:44 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id v12-20020aa7cd4c000000b0054c52a78f56sm1174043edw.56.2023.12.05.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:28:44 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH v2 1/5] rust-common: Set llvm-target correctly for cross SDK targets
Date: Tue,  5 Dec 2023 15:27:16 +0100
Message-ID: <20231205142810.826-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231205142810.826-1-jermain.horsman@nedap.com>
References: <20231205142810.826-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191823

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
2.42.0.windows.2


