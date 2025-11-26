Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EFFD10379
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 03:48:22 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5404.1764128892623642665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 19:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJaCRcTs;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso4174529a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 19:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764128892; x=1764733692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHvfH3tJxKpfSZwu4jLWoab0bY8ih35E2tpS/IwCpSo=;
        b=BJaCRcTsp8faPH4Zjx9uvS0UxZWb5M9J2hboOrPRcp3U7empc/CFoOt52xkCoRqr7d
         iJurC0itRAtoCLed/dF3MMqSjRHzmHL2BjsyjA7IlLZp14z5dmWLlu6T/7O8nITiHjDQ
         smISQfpoerR2wW3ejnZsfzBqVkS0r6f63tETTR+8Iy9E30yknzr1odA4v50AxHSy8iJg
         HHZKrZofbL37DJe/2mwLM8BEtaUokCQ0PoP//+fbFqM8aRUEXENS5CCOlnxaP3/Xd37w
         iT0ueRuK1W1J2MCkYtbxQRmkWhR8WOMYswYnUJLoz8EjFPu7bA8dS5uMSIvjrjqHe00a
         1eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764128892; x=1764733692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHvfH3tJxKpfSZwu4jLWoab0bY8ih35E2tpS/IwCpSo=;
        b=Vt5vRBNwjIqieHl26C9BJeG1nqr1m3oaCDM2GIDYbvrCsZQVxNVi7FXxJAxKalSdV8
         18Og5j4QotmJceScf/ALGtxf4db+bhmeGlx/VBrawfeaYLkPM+PS6NOLKfipshqx4CLd
         vpe7JfL6je0dqEdrjlskXHs7JPu1Mrd6sKnPkt6nXWru1W5NXV1gwvAL+LUGgYZRMVUu
         b5qfbUZgqqAfMmWQRfrtgFFOFeka6x0p7wx/Xawe6ytv1c+GXodblwmYHBmZ9VxVxj7d
         9D1W5KjlkqWM/4r34nuUYXz7RJf+Uh1kCdEhKMMQJazsB1U6DRD+owYl3ails6tcOkKe
         D9UA==
X-Gm-Message-State: AOJu0YwNsEGs30g6p51FSvdH+3tmsD7XIsS1Q8i4RHosCX9qIC5HASLp
	a+s4ZuypR7C3KMKy9QVVreTeHu1+4UvzoGaUl29y+jhYO4Sr2iy/DIDDJnVRsQ==
X-Gm-Gg: ASbGnct8vuFafdm2faMqp5w36iUbgLjSE1jbgSkCpEjmHtnoB403sXIVCZ0hc/NDDR7
	tFGTd8c/bWT6zmuU7OFydKBHWZtkv7ILOfVooH2KCaN1V3j3vh3JlpCeyndML8/y0M7wqa524zo
	Ex46fNdoFbrmj/ObgZ2Gh/CNWV+k55RmP8zmdgK6Gh5CIjJuwIPq9U/b8O3HMGczMEjJS+GzGSv
	DYQmxZ5sG5D3wzSV0Caxd9t5GYz8xvPcYmXwRwfacsu3R2JiSaekGLktcx2pqVytoSixiF86D3A
	NA0Jo7sdF6cUaJUDcR8eMKPWHmeO/g492AXIVrAry8cHnhO5zGWBvll7VxfVunMJx24keT+5OHN
	O1K+LrrTGv3nfX2nBWe4KFTLUW5kWVev5ky3SHm+NvJaTzrM18m/zVB6O3e++PO3T6UuJjLaPWG
	Psb8Ll/cLg1gioJU1z73xSRA==
X-Google-Smtp-Source: AGHT+IH5V/0WqW51qzjJotW8h2ryEUExSOhkq5U5o73Bt86LLXhRwB1QRS2ZoQmySDTcV5FmG9++lg==
X-Received: by 2002:a17:90b:4b52:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-3475ebe7422mr5969607a91.7.1764128891681;
        Tue, 25 Nov 2025 19:48:11 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a547abcsm887725a91.3.2025.11.25.19.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:48:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v3 2/2] ovmf: fix build error with Nasm 3.0
Date: Wed, 26 Nov 2025 16:48:01 +1300
Message-ID: <20251126034801.1997488-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126034801.1997488-1-ankur.tyagi85@gmail.com>
References: <20251126034801.1997488-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 03:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226799

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
Changes in v3:
- fix ovmf build error
Changes in v2:
- not applicable
---
 ...ceptionHandlerLib-fix-push-instructi.patch | 43 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch
new file mode 100644
index 0000000000..43c402b91a
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch
@@ -0,0 +1,43 @@
+From 7dcf5ed06b5a256436521f892d2579421c163902 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 3 Nov 2025 09:56:52 +0100
+Subject: [PATCH] UefiCpuPkg/CpuExceptionHandlerLib: fix push instructions
+
+Nasm 3.0 complains about 'dword' being invalid.  The comment talks about
+a '8-byte value' so 'qword' should be correct here.
+
+With this change the extra comment explaining that the instruction
+actually pushes an 8-byte value despite the 'dword' keyword is not
+needed any more.  Drop it.
+
+Fixes: https://github.com/tianocore/edk2/issues/11635
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/9ccf8751a74f26142e584c7b7c7572a182b67997]
+(cherry picked from commit 9ccf8751a74f26142e584c7b7c7572a182b67997)
+Signed-off-by: Ankur Tyagi <ankur.tyagi@navicogroup.com>
+---
+ .../CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm       | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm b/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm
+index 3d64ac9080..671ed98f85 100644
+--- a/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm
++++ b/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm
+@@ -57,7 +57,7 @@ ALIGN   8
+ AsmIdtVectorBegin:
+ %assign Vector 0
+ %rep  256
+-    push    strict dword %[Vector] ; This instruction pushes sign-extended 8-byte value on stack
++    push    strict qword %[Vector]
+     push    rax
+ %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT
+     mov     rax, strict qword 0    ; mov     rax, ASM_PFX(CommonInterruptEntry)
+@@ -70,7 +70,7 @@ AsmIdtVectorBegin:
+ AsmIdtVectorEnd:
+ 
+ HookAfterStubHeaderBegin:
+-    push    strict dword 0      ; 0 will be fixed
++    push    strict qword 0      ; 0 will be fixed
+ VectorNum:
+     push    rax
+ %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 577310a678..6b42041ac7 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,6 +25,7 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https;ta
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
+           file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch \
            "
 
 PV = "edk2-stable202508"

