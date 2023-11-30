Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478F1C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:12:40 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.4123.1701375158733655551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k5Q9mjP/;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cf98ffc257so13181035ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701375158; x=1701979958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzgGcht6WyBFi9Mlmeko+w4O1YMVo3B5tKlCb83zqx0=;
        b=k5Q9mjP/U+zVE9sNMPChMIxrbVuDLfRu4epSxQVLGo5kge7zIEbIpeGap7AGO3UCwO
         xIpK2Ob7z9a0oCLe+QEbXnh4rjImb477bLKomBvR6mKRN/k7tJuQppRkhlXhPLrJC4Kx
         aDrHbD/d/Tz4ls5sWiyhEKGK92tEJ0f5RJbqkXItM3vU0QfaxXH9RN3X/b/9P6I1uLy8
         +0S1gjBcq91e1+q6N4xdtjs7IGq3GQIx93F1NEcxrjSCF7c/+o41ysqur2YfGl0tPoc4
         COZs4IuZgIIUG2mx3zHiK7ebIcPAPtwY/S/dg33snexYPbjoq5Edb1nFSTEksinzjgrz
         5i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701375158; x=1701979958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzgGcht6WyBFi9Mlmeko+w4O1YMVo3B5tKlCb83zqx0=;
        b=SKdSd6YyI77+gx8Q8/dhBRxunbb1rwvytvg1kfodLUYhuanVOz4HT5olVjKd5YmGK/
         a/zancTjM7lwJi4q47yU8WdLj0J/tLEXH7UdbT0og8P8EwUlnYjvCl3VvGmeoXIaslJP
         Y5FVbb6flnSGxDHdiSF1W5nHhK7WNZwN4QMq1eUuUbklQMo14OepWNhGttUqOjux6s+s
         UrHr0tBUU2hL87sZ4lH2CrYdfNEo6RaYboWY8xzDqivqe1lBcDPGubQwSlJRX2VPEtb1
         B8pA0i0itC2Jf4xF41o2nr0RnpxiRc2YY0Hgm2oJeoTenEuoL9K2CPqxIHc2eIW3S3fc
         2kZw==
X-Gm-Message-State: AOJu0YwUM7Fo2tO4iJYNri/jGqvTV1C6V+8GrquyagDE8gxeXXmFWfKU
	tuwVOR9uyiRdukmBCbAiCrKymeVmAovfhQ==
X-Google-Smtp-Source: AGHT+IEmSt8OQdJzN/F6/3SVur5OEyzALeVphSfTjt2vXrPlTLUlqpgcOehAeBcbA7cZrm7PsjMgJA==
X-Received: by 2002:a17:902:a384:b0:1d0:18b4:92d with SMTP id x4-20020a170902a38400b001d018b4092dmr5385428pla.25.1701375157634;
        Thu, 30 Nov 2023 12:12:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001c61901ed2esm1789177pli.219.2023.11.30.12.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:12:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 17.0.6
Date: Thu, 30 Nov 2023 12:12:35 -0800
Message-ID: <20231130201235.13057-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191517

Bring in these changes

* 6009708b4367 Revert "[runtimes] Add missing test dependencies to check-all (#72955)"
* 04caadc61fa2 [Driver] Enable __float128 support on X86 on FreeBSD / NetBSD (#72788)
* e919a83f96fe eliminate python SyntaxWarnings from check-all output.
* f6c231c15ec8 [clang-format] Fix crashes in AlignArrayOfStructures (#72520)
* f74f3e6f58d3 [clang] Fix sorting module headers (#73146)
* 7e30ce9528d9 [JITLink][aarch32] Change writeRegister's return type to void.
* 03373fd9cb6c [CMake] Support building shared library for NetBSD
* 21af3b62b632 workflows/release-binaries: Do a preliminary build to fill ccache (#72576)
* 201faeca595e Add RV64 constraint to SRLIW (#69416)
* e957e6dcb29d [runtimes] Add missing test dependencies to check-all (#72955)
* f8575ff46f89 [clang-format] Fix a bug in aligning comments above PPDirective (#72791)
* a71237b9f67f [clangd] Avoid null result in FindRecordTypeAt()
* 308c816de5a4 Bump version to 17.0.6
* 442401f7c0ca remove tests from bad merge
* 76c7e0e1e2d1 Use the correct namespace for looking up matching operator!= (#68922)
* b5cbb35408a3 [libc++] Use correct size for deallocation of arrays in shared_ptr (#68233)
* e6de86cb9ef8 Revert "Reland [clang] Canonicalize system headers in dependency file when -canonical-prefixes" (#71697)
* bb66d8f8f73b [clang][WebAssembly] Link crt1 even in case of -shared

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index de8d4116868..9a88549260a 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.5"
+PV = "17.0.6"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "98bfdac5ce82d1679f8af9a57501471812ab68d7"
+SRCREV = "6009708b4367171ccdbf4b5905cb6a803753fe18"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.43.0


