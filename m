Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D62DC87FD2
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 14:06:47 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.132.1754143601954946603
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 07:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=EImG00HU;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.160.177, mailfrom: anakin@childerhose.ca)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4af027d966eso15759351cf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754143601; x=1754748401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oaumjbzoORKJqC5agFzOdgYklHcTdyeQ0gAYrXoq0ow=;
        b=EImG00HUjXLJ/7ZQ8zi2prr78uSk/Nam9mNWHAXuot6NtUD64M/sjqQQH/ky74WJEB
         C2aXlQbEHxF93s5v6nlnH4fCSwrgadIOrDpyn1zmmn3QVqfANXrJyiqKTDDsdwk9ylSD
         FseX+iycj3CkeTlMnECvs0Pph0D8GgiOhLC0m0UPgkFOB/93HBOL/y9yw2pkoJR340W8
         bbddKTlbVgjFx9xlx7iD4wO0g34zWsm60QMmApWiebenZRLyvUJ0+Ict6fsWtbBnEzqs
         CR1kXuo16DC1dBDpic5c4Czt/GR9akgsi6Ao4KLZPbdNGTKxP6o5ZTXrauVEbCU1eCCg
         xY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754143601; x=1754748401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaumjbzoORKJqC5agFzOdgYklHcTdyeQ0gAYrXoq0ow=;
        b=cTua6y5YdeCStpUSH+Gv/4KSKiF0sMJakCF/kzfKewDSlhiftvjzmlOHB0TF6zErZt
         Ua0h+VhvSkEobegQO0SayhohaHC+7Y+ZtNZpepjH1V1kkNODdxRBtwPQa98LaWoEbHUV
         ZIYgYn89Ljt0VeRt8FS1+XW3L9RqgLiFlHA69E/BEJRccMmoD1D1NKr5bwZLox6l61DF
         Fn0iHgkiiEhND7aKIG7/pq0h0WfeY5/ney6wP9/zG+Ncz5saR+NrMuLvmstldfvTuFQx
         DPXI9v2DClQX+kb/tupiC35KCfB6dlCi6U9QAQPDCETzwiiPjt/V1ERzU5G7QnEv8EZg
         lkKw==
X-Gm-Message-State: AOJu0YwWG5RPd5OlyxPeKt1jg9oEHKkYRY614iD5HIytQWJTzwKE/DRE
	1lWrHyKfYY/Tr8/xGYNnExohfUvj/OoEOK1sj54voTH+pS4DlGw0aN77W5wgU9VggjmAHeDp29D
	0sZOlP06NTA==
X-Gm-Gg: ASbGnctF31mD7+Y/7bdKUg9LCHMteTR1nZJaKZEhuEfc2bV9Z44W7ThqJ39MIa8+83Z
	2ex3Q1FVIJaaP7v4eH/wI/RvuDWW98NQVV6LZ0g9rOiyQXmEIISJjZyxukcPBZ5J35KFa2jtmii
	NsFBfzAHpAr0ZpPs96c5HoeffXfATTaNBwGODZN+BMZWelM9S6n4SOZXGgEeYl7i/8qHARjbK0t
	zFzK2vWg42jG+eALjyfyMaBjWBDWa/QrhsX9KZKKnjaLCTwMq1Hf2X23o/llcDVPgSsXI40Eaq/
	Uuj0nMlhKHo5X11lIHi1g236PkqUInbP4o/1G5zaof9sOogGxY7RAhbSogq2ZQQNA4tgoDt50N7
	oFg7wzXtXs8vDMbLUYEkJeDogJ98=
X-Google-Smtp-Source: AGHT+IGVbosqzivk25/q+ugSfz1d+UHE3pGeE7hI+OwxN0kcN2nyTRWBW+pPvaVGhfYhMzqsX+eacg==
X-Received: by 2002:a05:622a:4f0b:b0:4af:1d64:b073 with SMTP id d75a77b69052e-4af1d64b3c6mr14668671cf.10.1754143600534;
        Sat, 02 Aug 2025 07:06:40 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aeeebdcac6sm31226591cf.7.2025.08.02.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 07:06:39 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH] kernel.bbclass: generate compile_commands.json
Date: Sat,  2 Aug 2025 10:06:49 -0400
Message-ID: <20250802140649.18734-1-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 14:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221383

Add do_generate_compile_commands() task after compiling to have the
clangd language server be configured correctly for the kernel by
default.

Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>

Upstream-Status: Pending
---
 meta/classes-recipe/kernel.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index eb03424dfc..ef7f00e6dc 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -464,6 +464,20 @@ do_compile_kernelmodules() {
 }
 addtask compile_kernelmodules after do_compile before do_strip

+do_generate_compile_commands[doc] = "Generate compile_commands.json for the clangd language server"
+do_generate_compile_commands() {
+	if ! [ -f "${S}/scripts/clang-tools/gen_compile_commands.py" ]; then
+		bbwarn "no gen_compile_commands.py script, cannot generate compile_commands.json"
+		return
+	fi
+
+	cd ${B} && ${S}/scripts/clang-tools/gen_compile_commands.py \
+		--output "${S}/compile_commands.json" || {
+			bbwarn "failed to generate compile_commands.json"
+	}
+}
+addtask generate_compile_commands after do_compile_kernelmodules
+
 kernel_do_install() {
 	#
 	# First install the modules
--
2.50.1


