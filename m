Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAD9C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 15:58:38 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.17609.1699459110257895124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 07:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=azXnTFwa;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc3bb32b5dso63596485ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699459109; x=1700063909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEaU/PUvb+u+qrW68z4jX/R0+afzSSZqV+DWU5fzpr8=;
        b=azXnTFwaGh6YEbyQoznYSKGF3ZQgTuvWRG/MqCnVOFF/7VJdushV2gxq/hvuQAlY8r
         iN9f9iv5KoS6jsEFZXxG+wHRsTTJl6sEqOObKXYNe3wJWpJvjzERJQUODqXqUTV3xjqg
         +OyoZG0bfkZCnUgpHCvwcbJdcBn+0ifS1+FKRobfkEGg6AQvuqxoO/C+CKKM696uhAG8
         emTDmLc+ivlI/F9xrTHeN/uCvpEQYJKthq+w3tDAdcxBm36z/8Z+cGR398fgzmvawXRz
         z7w3fE5m8wzq/AaNRgiLB3mwzzF4ySl9tLsOMOv4Tjf1SpS1+kNJtSl6bEaiLF8acA3l
         tq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699459109; x=1700063909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEaU/PUvb+u+qrW68z4jX/R0+afzSSZqV+DWU5fzpr8=;
        b=Nn75rBbPOoj/1Eg2vRjjnk62FGRKcIa0P7Fs7qvdNqGdAC3waJ8L8+gP4oHYV16zxe
         ah4oZaf+OIUXPcj0kPgfuaL3S/D67MlNi6eNMxDSeDOcvqITQmpD/c9G/fWnH39cF9Q/
         f3oohK2l8ZATkq0P3kMEKCNbfPqWe1Emk6vImrG76fP8sidvoTFDz4KFLrJPt3KGjyam
         6mW/2YlVXhUaVqUqa2TIxcijWlrWvObRGlwZepCpHAVGiLTBASfTk1NCm9ebIyPeww5L
         SDJZEIhaQewZNioYAfmUxOBrX3BZZWNC7Rk2MI5inp6Rlgs8BkeGfAOLEojZ6hK1Gpv2
         4i7A==
X-Gm-Message-State: AOJu0Yz0Gu3+rJcnEmPhdHrHDRqyNv3COCbUJVhIBxNRfSH++Bx/Vo7z
	uiN8YFd2PyOJyCWEwFstZIY0d8fhopSv5w==
X-Google-Smtp-Source: AGHT+IEGjiOL3NleXWNcW7m64zhASQkf38L9Wf2IZGle/z155OF4y8RNSqc1jy7fkN1SbNjbAa6Aiw==
X-Received: by 2002:a17:902:c103:b0:1b8:954c:1f6 with SMTP id 3-20020a170902c10300b001b8954c01f6mr2138967pli.36.1699459109220;
        Wed, 08 Nov 2023 07:58:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71b7])
        by smtp.gmail.com with ESMTPSA id q13-20020a17090311cd00b001b016313b1dsm1930105plh.86.2023.11.08.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 07:58:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ptest-packagelists: Remove strace/valgrind/lttng-tools on riscv32
Date: Wed,  8 Nov 2023 07:58:25 -0800
Message-ID: <20231108155825.543798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 15:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190355

These packages are not yet ported to riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index fc42f95de2d..7ca23cb4f0b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -121,6 +121,8 @@ PTESTS_SLOW = "\
 
 PTESTS_SLOW:remove:riscv64 = "valgrind"
 PTESTS_PROBLEMS:append:riscv64 = " valgrind"
+PTESTS_SLOW:remove:riscv32 = "lttng-tools strace valgrind"
+PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace valgrind"
 PTESTS_SLOW:append:libc-musl = " libc-test"
 PTESTS_SLOW:remove:x86 = "valgrind"
 PTESTS_PROBLEMS:append:x86 = " valgrind"
-- 
2.42.1


