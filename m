Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B683109E53A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 02:09:37 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38903.1774490968890351274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 19:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m96Q6sUP;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128ebee22caso484041c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774490968; x=1775095768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04MwTpaN8ybMRuZeA6wlSd3XCSxszXVcg7pEbfHYCpI=;
        b=m96Q6sUPyVJgkB1ut5RM9z1v4TOnCey4aiE/g5ymLW65I/xKUpmQvIHXu+9eEzPTej
         V2umYvRXmG/HDeneMA4w9MhPvS25QARb5lOe+DdrWi5czzCv12SDT2TKKEfLRSUmYkHt
         x90lneVIRIZ+ZvakWa5RVe0OYzNFOYUtBCoZZzGK1rl88RrNv8QzC1Pk/D/NzKG7bGPL
         bCGID4Bvdu88TTUBEzIdsZpvTQZILAnvWpq51aUSDx7FhMp9GRUN0Yw3gxK7yqDxGFet
         o9XfE00Y5klMAp+XQPLSJ08jNzroXps8LjoNPucIaWXZ2/4JErgk29HWLt0AjzYP9ys9
         vGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490968; x=1775095768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04MwTpaN8ybMRuZeA6wlSd3XCSxszXVcg7pEbfHYCpI=;
        b=CC6cE3MjR9qqVKoa8CWEI+mYl1o8BBIacqrrjAKUjFW2u2a6tBUJfheJK+KRRWKBho
         msyV2DecYa6pm6dKdEvxMMd/Wytdko1Nq+ji0ENFSp/hBgtcJXOxo+Mz9Ny9LF5z+J7Z
         jH07QQVFFGSi9RUEorFBGYgdSu02xaLPzRQTqtbmVLZGcGPrb0m4XZsFqKVsBWzT9gCY
         1p8D0D2qFLF02dSelngp4PpGazyQfdfj7tOy+nekeR9mLm4ZWvGIzSK7pOTOQN70u/j/
         fWUKPNe/EQkKuLpA0aZDmE8h2uQm96plWMVn/f9GQqCs3fyWjzTDdTCwXAW50ry0U1ok
         1khA==
X-Gm-Message-State: AOJu0YwYPWTp7q200ZqYa5B0Uf9HPaf4exlD+Dh4JG1+uQW3r2EVLkHv
	6rst60hbnIg2Yw5Mue2B9pjCdyU+tjEnLJKYlfT2zKRoDfOXaC8kfUsnyMxWEjryfqk=
X-Gm-Gg: ATEYQzyobW9oHkCqBtpPcElWUMFGsJTTcNE+z7zb1Yu/yxsZd5jZtxebJbsk6QAQIba
	fHvNwt7aZ3/6/sL9rT6GJouR1RP2CdVWkeeBC0qPA4LlmqkSma/b8KzTp8kapih7QTtS6csAxlW
	pbcdrce8t7ab5ow0lqkYTStQw1WifX1FoRFCKLdCUZa5Te3WEN5UnCLjuwOtqvLpqiRfUWrsEnT
	o8zpI+qhWjYnbuigBy6xmka+mSXwyiiNIshRjxcmvQe9pHpF3G4KuVhptkzxl4imX83lXbDk/fz
	Vrbl9aQ+6kfh3xEydkC1XGp079loWIlru6iKRxVwuJL68YQmTxbHqJTKPfnR9VUKIQBQbmcwsEJ
	oNrSYxWsw+u5KO9jTvGQjBXrUPeW6tDZrDkiMg8SAtlDEomU3gC5/66Ur0DV42N4XzO7RhvX5sq
	UancVzlzTIz2tIoBG6sCKamnprnyDs/6ne6xcPAcWKQoKNoCFz9XjPrUMl6oNkrj/ABZ1HDZsId
	s/bogGqVqMqLqvkvCyQE85h8Il4a+YkiyivCWsIIDbn9z0Zn7OJubf4fZqsnyJae8bhS5k=
X-Received: by 2002:a05:7022:fa09:b0:11b:b179:6e17 with SMTP id a92af1059eb24-12a96eeaf79mr2856482c88.34.1774490967885;
        Wed, 25 Mar 2026 19:09:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5b38csm2359060c88.2.2026.03.25.19.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:09:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/4] clang: Do not package clang-offload-packager
Date: Wed, 25 Mar 2026 19:09:20 -0700
Message-ID: <20260326020923.297511-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
References: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 02:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233942

From: Khem Raj <raj.khem@gmail.com>

It has been renamed to llvm-offload-binary and is built
as part of llvm package, in OE we build llvm via its own
recipe and its packaging uses greedy enough regexp to package
it already

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 meta/recipes-devtools/clang/clang_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..662cda1b2e 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -150,7 +150,6 @@ FILES:${PN}-tools = "${bindir}/analyze-build \
   ${bindir}/clang-move \
   ${bindir}/clang-nvlink-wrapper \
   ${bindir}/clang-offload-bundler \
-  ${bindir}/clang-offload-packager \
   ${bindir}/clang-pseudo* \
   ${bindir}/clang-query \
   ${bindir}/clang-refactor \
@@ -229,7 +228,7 @@ clang_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir}/

 	# clang and clang-tools
-	binaries="diagtool clang-${MAJOR_VER} clang-format clang-offload-packager
+	binaries="diagtool clang-${MAJOR_VER} clang-format
 	          clang-offload-bundler clang-scan-deps clang-repl
 	          clang-refactor clang-check clang-extdef-mapping"


