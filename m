Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06F8C54ED1
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 04:00:11 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.1473.1748059202012427503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 21:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a7PCoeSa;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2301ac32320so4313155ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 21:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748059201; x=1748664001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+f2G/hHGN0Co2riuW0lZZHwj1J19L83fA8BdB8kVbg=;
        b=a7PCoeSabqBxm/ggLM0rknKpz+uX3rySgelD+Dm3e1PfTbnf0egYcTFaRcrpfJ3VGp
         TWhKr5kg3D/dvpk+gnPrDypAlBzCey/sDlhv+OZb3m1j7jvn0Me622KAbCAV1cHFOFNa
         wgMVKe45Ad4z5ZkxRILCLiPN1emgKq+JdZV9U08DThac/MFPz+jSsuM/4dxafksNRKZr
         CC4UP4Hr14s0nWHd+K06sF3eyXlw9q+6M6k4nI2A+8nsjwx7cgWg7NbSRTk9cjZSJ65N
         wPcU4IgzK6/7qs0T9Tfw6Zw3W1vriLOLAs1XAYf7r4EF4IvYhKuD4neqMhPow0LEBeRX
         T7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748059201; x=1748664001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+f2G/hHGN0Co2riuW0lZZHwj1J19L83fA8BdB8kVbg=;
        b=FORmPy0yTE8c/XwHN8HykSaMA2uHzIVfipps8aS2tJkls1QF9ighgHQCqemlcTeQzD
         M7sW3S3ZFmzs8umH1BOh5zX+mH3r3RNVY3YiUdK5D9BbpubCEftB5z/lLgid4QhYsdhx
         k68yZjto4iNm9F/q0+4B3hZxv/p380oIzdqwIx614bOpjHn7x7W7beoJ27UiBpgIuMbo
         HnWCtbLjBw7BpCxEelYgKP4vB28ZlySMZWfa5/fjwm3Fpkd6hUdAIGfTUaUsGdaDXfDa
         vZoesEfWB5Pb9HdVS4+kh5otPEiUcIuLv9qeRpinTompegIo7d0pK7lvbyoNm114pEgN
         YZIA==
X-Gm-Message-State: AOJu0YzVzGD0xZZ94PAmCvjNqtU3H7yTEPM7lfdcA1ehHLqiIonGY5Jr
	9Dnlp3IdUE5Ccww770OjgiKqH7RxymVixB9BViwjfWWCs3ThlAL8ha0uDNa4SSKo
X-Gm-Gg: ASbGncvS13MfLlFmODxAajuUuxQdC6TP1XJiRk7YvnAuGFlfGUfAMSleB+bd6udJ1cH
	SeuBiwBCJcZpO1n2XNKHPm81GSa5DI6O6hZclk5gWIJS48ItYSRDCjFeGBUYwz3UIzUatBX2QrN
	ckKbh7LcwTBEtyhKXg/Mz2LGMbd+ZwKx92Ja5BksagrLR3ef8PT7G31hPO2B7v0JYxTeTtAv+kh
	DIcwFtHVoVDoMBXC4cscE9gYvgjWOj7ymi+koQ6j2eHYHlmRru30VJXzey+uK//XGneV8gf8K+z
	rir1uJm+3CcKZ9h9QIzo5NQwUfmZUmHQUsG36c1UDvc=
X-Google-Smtp-Source: AGHT+IHm6KUTs2260tuC/ySWC8xHrXZpH2H3kknwQ1Rh5u9wLnJzBFt10RJFsZudQ6MoYMOMRfZIeg==
X-Received: by 2002:a17:902:f54c:b0:231:b456:b97 with SMTP id d9443c01a7336-23414fd3b39mr26111525ad.36.1748059200818;
        Fri, 23 May 2025 21:00:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e2118bb2sm127450655ad.41.2025.05.23.20.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 21:00:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] linux-yocto: Remove debug-kernel.scc for riscv32 kernels
Date: Fri, 23 May 2025 20:59:58 -0700
Message-ID: <20250524035958.3809327-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 04:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217220

modpost fails to process the debug location lists for riscv32

| ERROR: modpost: vmlinux: local symbol '__asm_copy_to_user' was exported
| ERROR: modpost: vmlinux: local symbol '__asm_copy_from_user' was exported
| ERROR: modpost: vmlinux: local symbol '__clear_user' was exported
| ERROR: modpost: vmlinux: local symbol 'xor_regs_2_' was exported
| ERROR: modpost: vmlinux: local symbol 'xor_regs_3_' was exported
| ERROR: modpost: vmlinux: local symbol 'xor_regs_4_' was exported
| ERROR: modpost: vmlinux: local symbol 'xor_regs_5_' was exported
| WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> .LASF464 (section: .debug_str)
| ERROR: modpost: __ex_table+0x1560 references non-executable section '.debug_str'

poky adds features/debug/debug-kernel.scc via distro policy and hence
the builds are failing for qemuriscv32 on AB. While this should be
fixed in kernel build system or tools, this makes us proceed until
then

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index fefed8c9c53..83be9fed428 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -72,5 +72,8 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " cg
 KERNEL_FEATURES:append:powerpc = " arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 = " arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
-
+# Do not add debug info for riscv32, it fails during depmod
+# ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_loclists'
+# Check again during next major version upgrade
+KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"

