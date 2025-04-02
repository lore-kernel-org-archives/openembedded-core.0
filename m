Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F367C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:17:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.2247.1743578259991247745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g989uL0O;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30572effb26so381554a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743578259; x=1744183059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBcM7+5I8Mod97VHq0HZ8NvGPSJgb/YlXHYRp2mRuFk=;
        b=g989uL0O8UpI8Vizbu3knc1rz8PgsxED6JEuG3+m8ZKNjCCgesa9t+DH5FlMyigLFt
         6A24d0AeDUrytVvNXIPq8Tr3L9DjOlDXzEmgnz0LA9y1VQdP0hEm5VSfiLGH8Cgew/cK
         98YQXpdYklSlalgWK9ApZdp8MQX/kA4JQtyb9fPfunjTffS+RzI3YhMYmwo9HoCeDwef
         y+ag1pa1rni1LNFRoiSdwIRwLoJPhNaelb9kpyy9P5NaEBCuZZSYdZxPpEPYryYjr0nk
         KT17NBdMG1DXlkD/SBadUTSYAGFjXgcV3+j54PHShbPeMR4mOvnIjXhs5HBvE5+thVyT
         Lbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578259; x=1744183059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBcM7+5I8Mod97VHq0HZ8NvGPSJgb/YlXHYRp2mRuFk=;
        b=j7eJc7VRmKnFXK3wo7RymWQb9VKzKAhUm0a6/wejW2ehLX5pPQ9OxzhVnYEw+iIDk6
         zt1gIyYhzEtyVIcXPASMgGfzJrIDBiLWzIliqM//xkxXGewge00NtIBGRHhO2QgRfoTl
         tjUi8izquHF8aizRPF/4+LiQc6KZMwzqTnNFihTIY52zCELvtNNrUd0uydDI7jJ6Re0p
         ZLnG/Rkqs5lpNn4iX7u2WRQMzzmzwzK57k2NkxuBv9ER4mHUb1lGoM9TYgYmnwpWU0h5
         MsOSTdyw+EtF2HAPksL3kEF9TQ/P0ffMy3aaDL+Woq1ZWIQow2Xe3QygJyu/xickdJFa
         qN4g==
X-Gm-Message-State: AOJu0Yxr8+hkDM4CdeGNPhWKizCUViFo8nzFohjk3YWIMfm/V+3G6VSx
	/7B4x6RciamLxfWdWVu6uPSsDpzTVtb/hnBJIWdemfkwjZnmfR/RIhCi69Jy
X-Gm-Gg: ASbGnctKg4l17TInk4Bo1Fhh5lfThyDIrLSdLV1MSEi0od1EqCBSavbnB+KW/WobL3p
	iE5H8zADHlO/hGPz3ZIMGySO1A6yJr8ffzIbmJfRuc52jQ56JnmnNa2rpq/CC0xs3TZ1hgJjFMM
	IStoLE69a7/8ES6TZ+UGM3WwQcDkEdUsecItDeLX7jU442+H4j87Kl+a1nX+Colbv+3LzE1Xqba
	tPVzgzDYySwqJfY1SBCrPxjvHZedjEezALMzLmBkAKOTh/pebVnkADUYqO8u0a3ca40qTTGz1fK
	3C4n+QTpgD61c669BqA9K6jLcLIyW5ASTTufrXw3JCeUpq0=
X-Google-Smtp-Source: AGHT+IEyZTWU7nmS/KzyKvqtiQAt0Y/IBNF/J+tWn2uoh86RLX4IA739Teyo3CbfLivTy+3MgxXq5A==
X-Received: by 2002:a05:6a21:393:b0:1f5:6abb:7cbb with SMTP id adf61e73a8af0-200d140e2d8mr9537478637.23.1743578259066;
        Wed, 02 Apr 2025 00:17:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm10215845b3a.48.2025.04.02.00.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:17:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] llvm: upgrade 20.1.0 -> 20.1.1
Date: Wed,  2 Apr 2025 00:17:35 -0700
Message-ID: <20250402071736.1547418-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214223

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 2 +-
 .../llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 2 +-
 meta/recipes-devtools/llvm/{llvm_20.1.0.bb => llvm_20.1.1.bb} | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_20.1.0.bb => llvm_20.1.1.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index ae2c3baa8ce..f71c5d4bd47 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 9824c2ab5e7d37a5a18a409a512511f5f5cd408d Mon Sep 17 00:00:00 2001
+From 001d56983078842c5aa2a1786b84dc429bd46abd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index 29266013ecb..f1ab0054640 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 00e5ac68dad872b8490297fa6f0b67e6a3e48661 Mon Sep 17 00:00:00 2001
+From 3eb1eefed6fc654d19ab97bbc748454c22a29009 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_20.1.0.bb
rename to meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 7ffc6ec1cb8..3989d4845d5 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
+SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
@@ -180,3 +180,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "20.1.1"

