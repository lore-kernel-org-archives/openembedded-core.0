Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB487C71135
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:44:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.83224.1749548660056759972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JskUeG8x;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so32698765e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548658; x=1750153458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkk1kgXV+xMORdAJuOHhtC/K1ozSdEQd3Vn6cOrF848=;
        b=JskUeG8xmhTrEJ4VzmJYasnW6R1jlnhlUW50+GhmgOmJymEzvaAb0hIhvbBpd4tv3z
         KjIyBW66GqV6uv7RLQ/wjh6s3MruhNJKoytnVzdoLyGp105mlqCk9b+lxv//gkJSMaTS
         iIWmsaynupbvvfPuq/e12K6/GVJPTc+0H3+x/CyKRRzeUCTy0efRfaWdIDR38mCuDrB6
         9iqWkRSJM7UwF5tvcD42tGzwS/J9tcGyxQNMiyMzZ7AWK8F7U+BNi3nmsE0DSboTD3Y1
         P0rHpKR+0gAKyDPYunjwQiEc4J9Zvx5Ow0/wWV41zdJVU1Jq7a6H9cE6YI6WBV4JsKvH
         T01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548658; x=1750153458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rkk1kgXV+xMORdAJuOHhtC/K1ozSdEQd3Vn6cOrF848=;
        b=lhYQPp3ODS09nhIWtlgkjjVXrTnDqG3Icz2udta2ATO1yIdQ2TlSigncNJWXgenIdi
         4QVmzCqBIIceKPjVxw1NNverlKV7Ryh0uhgzGlrCjgcBhIWAYuj5A4eIHG+EISpPrX8T
         FetoNpreBlzv45r64j5iFzWz6HklIqsLWse7YAvVt9n+Fx+VwPBPKbWaCLClFzGHENg+
         PZ85KwMdUE5wmrwUiU0VbstN1IP+s4+ZeKQn07p2FEPelF4MSxj1Y9VEKFjxR+1z95EL
         2954XDtQ3P6i+NpP8rH5AefBzH4zrzumhRC3a38aYPAcV3AXQLyeuPgieJ8U/wlw5AQS
         c+4g==
X-Gm-Message-State: AOJu0Yy4z6shx85LZ2dmmxYWT0yitHDYP+47Q04lurfisELFLT+gMnjR
	PlhF/LWM8Haj0erNnd2YCzosgMn6oYpMpbU1c4Rd22wXgVCMwWUrHG4Ao0auBA==
X-Gm-Gg: ASbGnctFLfOHIONV+/jxDsLFNsYlXIOfUfCcRN5WLDtKaJa2+qmcOAOoOyaoVkZKV3E
	ZjR2K5xLr72Tow66c7DHtVHB31XXFbsUObT09dKcCgHHSmFPwYsUidTkn4eBpIzseTsIPZUtigj
	eirK8Hinb6WC1topEIJ2/j9ZD5OyVRYEyuCnckDIQdC4xhZsrGNE9S9OidiaZp4QjElN2x1M4fa
	N5rOuO3T7EAQdmmL7/Uc+XaNhSOJDmCWii1ZWrJOzVLVcBRTP09s0dpN1Tf3ZZ/E0EpTbzl0YLD
	qLtPj7sKJFx68mBOhswYJ96oZHHdSERLEvjLaRmM22Ma8SlXqU9sLismXuXgccER7oJU2Z3Q7ac
	q7d+2mbUbOPVBXUML60hHzV0=
X-Google-Smtp-Source: AGHT+IGWhef2+vKcR8Z4XaWMwNiKDfWpfdK+31QKSNSqvc0QNX8x8sdDaSeUkKG3e3isxzXtCAdtTA==
X-Received: by 2002:a05:600c:8716:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-4520139a4b8mr183476335e9.10.1749548658023;
        Tue, 10 Jun 2025 02:44:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm136569125e9.39.2025.06.10.02.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:44:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 4/9] gcc/clang: set S to be in UNPACKDIR
Date: Tue, 10 Jun 2025 11:43:55 +0200
Message-Id: <20250610094400.1653931-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610094400.1653931-1-alex.kanavin@gmail.com>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218329

From: Alexander Kanavin <alex@linutronix.de>

This and some further commits allows removing the 'backwards
compatibility magic' in do_unpack that moves unpacked sources
to where S is set to.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/clang/common.inc          | 3 ++-
 meta/recipes-devtools/gcc/gcc-15.1.inc          | 3 ++-
 meta/recipes-devtools/gcc/gcc-common.inc        | 3 ++-
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 4 ++--
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 5244298dfb1..0684e648ccc 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -63,7 +63,8 @@ SRC_URI = "\
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
 
-S = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}/${SOURCEDIR}"
+UNPACKDIR = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}/sources"
+S = "${UNPACKDIR}/${SOURCEDIR}"
 B ?= "${WORKDIR}/llvm-project-source-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # We need to ensure that for the shared work directory, the do_patch signatures match
diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools/gcc/gcc-15.1.inc
index 18f8cae5ca2..af29db8e5b8 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -75,7 +75,8 @@ SRC_URI = "${BASEURI} \
            file://0026-fix-incorrect-preprocessor-line-numbers.patch \
 "
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
+UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
+S = "${UNPACKDIR}/${SOURCEDIR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index de559eb9c3f..8d95698743b 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -104,7 +104,8 @@ MIRRORS =+ "\
 gcclibdir = "${libdir}/gcc"
 BINV = "${PV}"
 #S = "${WORKDIR}/gcc-${PV}"
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
+S = "${UNPACKDIR}/gcc-${PV}"
 
 B ?= "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index 03f520b0933..c01410b47ad 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -16,6 +16,6 @@ do_deploy_source_date_epoch () {
 	sde_file=${SDE_FILE}
 	sde_file=${sde_file#${WORKDIR}/}
 	mkdir -p ${SDE_DEPLOYDIR} $(dirname ${SDE_FILE})
-	cp -p $(dirname ${S})/$sde_file ${SDE_DEPLOYDIR}
-	cp -p $(dirname ${S})/$sde_file ${SDE_FILE}
+	cp -p $(dirname ${UNPACKDIR})/$sde_file ${SDE_DEPLOYDIR}
+	cp -p $(dirname ${UNPACKDIR})/$sde_file ${SDE_FILE}
 }
-- 
2.39.5


