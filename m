Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3603BC761AE
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.26718.1750067408126568859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EGpetaM1;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45348bff79fso12295645e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067406; x=1750672206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkk1kgXV+xMORdAJuOHhtC/K1ozSdEQd3Vn6cOrF848=;
        b=EGpetaM1AZnOJlY4G0YB1m+UANelRlqnU9bJIde9nFxUKMvYYQ5b2OJIXGQzLHZzHz
         gVFACVtMEWstUA7CY8207btybIR8BJbtqAVwaraYON0Ho0ZETo+Ag0NSPSyjJ3r5N2Ch
         38W0YvMfXEafyWtQ0D92d+6zcqThEzQz5Mdwb5uPceDSIfINa7MtBHd+PKULcpd3MYwN
         wZccdqeJP9NNX75QDEFRNLcPEv6N8pSOo/dC427VHxwwheJCgHHkt1gNfC8zMTDgc40i
         dtPyYGOFENY8pASahFek8ojKaynauuWEQEUomjh8xM0dUwzjal2qbrSJ2KDdtd9W9asm
         SzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067406; x=1750672206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rkk1kgXV+xMORdAJuOHhtC/K1ozSdEQd3Vn6cOrF848=;
        b=vmjxaaHR+kvl+2yUXTq1thvf4z0aEORvtKLjF3A8kigsGaLZoKHVW0+Kk2Q52rqgCi
         +YREtnPtBw/ZRIBqTA0ZHvDxbnXCNhxV7B8ZnmqyHFpa6xGTzuByCJrsfqH5KPIGUnl3
         NKvEycn89Vwcu9an1mLpQHndj8cbpWtRf3cZtW04FG91B8pVVnPneM0O5okH20VA+W5g
         cn/NXV0eO0nFpjEqZNnnVzb1jfNRFJrw4Ak9Rtd1b1Bxotbcyzl78fcJeCO/bEHmz48L
         W9GwZwh9vbPLU7ZYFk7ZmvbA9EJ3F1ryYMgf25K36TIJ9qT5yHgDmUc8Sz2yNRL1s5ci
         SbHg==
X-Gm-Message-State: AOJu0Yy1ySO4NJSYOrjlzsCvBrUw62lQNDB5I0fPZU07R10avUda2wsD
	V6/2uWKDOG1v8BzzHhYg2RtgeY3D/ha9+1PuYO03+UdDDKPTphm/wD3T5TPnOQ==
X-Gm-Gg: ASbGnctqwpMPvgYl4ykCRNWiHcNtE9lIxA3zRcGpXshUInf8zTOb4VuzbpZ8iiVSG5O
	8+uzQ+tl/0BqjEtyD6lrvVrGGKdDFx6/H3g6+iYf+ND9zPJ30gXRGdf8HQBK8I0h9YWMh+sC1yw
	zOCrQ8mKjeObYOXWkPMcBmojCEexD4EftGFundOa5g9ZSHUWXxC+J59UNsFKPNr+iTv1issHXft
	BSlT+S8yCGK8J8oLzQZmMTtpF/85qf3HP/7zsG4XgMHUMbI8Gsu+6obDhzLBc//40ZyPRHjR/xU
	5PkJSawGFV2dqpVmmoXkXVk1Uuy5onITm/wP8WleB1/fj0cWAH+KKRzlkeDX/xpqv0B92fa6Sba
	eI6eT6ZYX7OWKitSWo5bCcHM=
X-Google-Smtp-Source: AGHT+IFWSmSvHsFponDZIHy1IkxkoplthfA/5sR7a/pmQXHjgzVTopXK1VijIMr6CZTB5cceNOxNbQ==
X-Received: by 2002:a05:600c:8288:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4533ca946e2mr90162475e9.4.1750067406160;
        Mon, 16 Jun 2025 02:50:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/10] gcc/clang: set S to be in UNPACKDIR
Date: Mon, 16 Jun 2025 11:49:54 +0200
Message-Id: <20250616095000.2918921-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218802

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


