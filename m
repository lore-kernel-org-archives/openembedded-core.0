Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C1CCFD31C
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 17:46:59 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22840.1764006410485845751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 09:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hilfDOH1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c7869704so3862383f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 09:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764006408; x=1764611208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j28SIOpY33eU0CCFYtiqjCYX4iwubW984omLypon7to=;
        b=hilfDOH1Y5VSO16W9LPIOCDGIpbQyO1/RE5rmN7Qsv1F3Y6kbsEvKtbS/Ri32vCpC9
         6aYud2FUNc9Fcgpo7XBwiTlCZ8UUXR/Kvrn6JRsf9LuTCmFnbLw0r53TEJeF3xCQ5H86
         sQZ4vXUMxGNz/L/c7t2EvrY5ttuiFgbOD1Mdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764006408; x=1764611208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j28SIOpY33eU0CCFYtiqjCYX4iwubW984omLypon7to=;
        b=FZ6Kbar7QUJukKGfYNFl6886Os+V0lEkRKOLKj8TO/heDiggM1eRLBSlX5mnX/MZmw
         Y52d+5I0QuGDIGxQd/uaycPh4twfHKJO/AeykkqpTPXPBpsPQv4cWYzILVUzqiZqo7SB
         OK6P2nMpGi4BAx0/FaYa4zC6RhoxhQzySWGkQ/d97/Q+2faUUTPyUr8he/V4SKitiXhn
         8hk73/WsCbbu/Hbt0MqG2uqqfzDUQZJCOgyfbX2OO0kY113OnJkQCI55irwIPPo5FUbN
         YJ5JtoQ/MCHjd6iZPt/G3bBLXC1liR32YxarYsClWAtTG/j971z4Ow87f+naALFXk0OL
         hWQQ==
X-Gm-Message-State: AOJu0Yx8vmvljdbeS1NbsNK9UUlhErVJgLSzMrfyQZ6KTiKLM/kVcrwZ
	SY4GW8YUHvpjFBnxMV4Q1xuUtS0dJnjZcLAfTarEIAP/d1ICH2fyy2fQbMVj3qyyr58muFPAU3s
	iNcmY
X-Gm-Gg: ASbGnctB2NueJ4/eWLP0yIV87Tfou/DLuYLeBvkhBM66tfgvqJ7e1Clk+MyxK9eI0/b
	JK4kYf4d4YI9Rb65DwyZ6g2rZLVOq725jQ9FvMKK5Gz1cNl12tIpX4S3Royz8slnOgvZ1b8Qfrv
	5/9CwKfd9xOJNbIGOuzOSDgGHQ7NTKywJa1/BO9o/m9vRBZzqN27BEIElLwWnJg24yV2GKSMOFY
	s3yNPMpvRqnfvDaotHnxmV0hXgjb8whbvX3to9BgOPfr9w1hjaoBFGZC90vLScsqIRen//IoosA
	11cCMue0O+F8WKosIdkv+oIXR4EJURN49KtvSe+iZK3TAL4Dnmv8FnztvLiHaKBs/luzeGajQQ3
	/bDnxwEWa/9jZPjyCvIkFCaYnzgKbwL0Hu4sIr0hHuLuJQBYHe/CpjG1LGPDTRz+qgCR23kB+lz
	yJzkvqT3M+ogSqiYZdn7NJ2c46HnMfZcN6+3PpvVxXRL5a1kPY
X-Google-Smtp-Source: AGHT+IF9r51k5rG32rVxwHx2Yo1Fs32ukkmvlPTLKK2tbAoIdSAbOwRlgAUqqPFKmKoryIXEtO+gIQ==
X-Received: by 2002:a5d:5f91:0:b0:429:cd3f:f45f with SMTP id ffacd0b85a97d-42cc1cd5d8bmr11930599f8f.7.1764006408268;
        Mon, 24 Nov 2025 09:46:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:acc4:4249:84a:cb80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm29474469f8f.33.2025.11.24.09.46.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:46:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf/rust-common: Fix DEBUG_PREFIX_MAP_EXTRA handling
Date: Mon, 24 Nov 2025 17:46:46 +0000
Message-ID: <20251124174646.299415-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 17:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226745

To avoid errors we need to set a weak default for DEBUG_PREFIX_MAP_EXTRA
as it is not always set by toolchain include files.

Also, bug YOCTO #15976 mixes flags to the llvm compiler in rust and
we need to avoid the canon-prefix-map option in DEBUG_PREFIX_MAP_EXTRA.
For now, just remove this until we can properly fix the rust flags handling.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/rust-common.bbclass | 2 ++
 meta/conf/bitbake.conf                  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 31331c7a268..34bb2377cf4 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -18,6 +18,8 @@ RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ??= "libstd-rs"
 RUST_PANIC_STRATEGY ??= "unwind"
+# See https://bugzilla.yoctoproject.org/show_bug.cgi?id=15976
+DEBUG_PREFIX_MAP_EXTRA:toolchain-gcc = ""
 
 def target_is_armv7(d):
     '''Determine if target is armv7'''
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 600d4baffb7..729f92fcdb9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -649,6 +649,7 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
+DEBUG_PREFIX_MAP_EXTRA ??= ""
 # Beware: applied last to first
 DEBUG_PREFIX_MAP ?= "${DEBUG_PREFIX_MAP_EXTRA} \
  -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \

