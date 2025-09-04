Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1846CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 05:12:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.32203.1756962763869884158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 22:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WhCok9PH;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7722c88fc5fso623452b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 22:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756962763; x=1757567563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiRP4UIu6cu5sdrMfKllsU0NG4VJphS7ugbGb5Il0jM=;
        b=WhCok9PHMLSj8nnpIu9CaqAlQPp0E5qmVU3nII5LnsA9b9m4nB+UW0JAYBZmOZvtzR
         t9BkbzMKXHQ6WKXj68OY6vkYT99UtTnhJPbUOaqNfz95h7KSxXfXbn+V/djYWy37XobB
         JwkM2lPyS2DptuvfHNju3JfybcNMDLROG7bnub/ABfygo7Zd4blkgvh3FpPNISTyOFtD
         Av9UDevWh1Z+5nOWAmKD/kz082hHfvcmZiWSvW+gaDKtTW6YTBORGeF1oQqiBsLAz5qL
         7xlec72b3a//wRTSLoNx4EEfDhkJISOGa8Wdn1MHVJW52ltlxpGqMrdH8AFIbBls+91z
         XlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756962763; x=1757567563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiRP4UIu6cu5sdrMfKllsU0NG4VJphS7ugbGb5Il0jM=;
        b=AnrAi8dBOcI7pVj4pawh/RRUW/grrhfr7bToIDohi6/22LJfxWDkpZ15g8hta7gEvX
         vtWCjBL9gW5eXpoYk3DlRx7eg6BJkuJjXiGTsNQgRS0BKqomg+JBqPF0/9qCqqTBob3+
         gNPn3Az0XL9W7EiAie2Vk8TWEQcD2JT68mmO34Oyx+5Ohza3qdwX/v0MCSDU4y6+8JdX
         5S8Lw3iwsjgROq6w7QMOmDxtWFZyjtcenj0c8L6ZG7S/FoGLchio8yPO2Y3E53+To0eL
         CU3ejom5Sofl6vmIQ52GzczZFG5sUsc4t2Vv4aI1UCtXNxRAPytVucPk3TFa8ONX6EpI
         8oYw==
X-Gm-Message-State: AOJu0YyLG012YFqwmk336NIFyDf8gCLCfD4sne/VY/Qfpf2mVtKJcGqm
	12WRhf5YfuDlqHfE3mX3YHQMkNVSXSUkJqy/YNSaufgLdyUJpcXcTfsnZcTNwOLl
X-Gm-Gg: ASbGncuDDfSFpioGtXyfeYnlqXr/0QjUgAb1k40Br249C9UtICprvNKYpNQnp3tCyyT
	1MSt0pZYJcrBD8IrXPHxLJHRJTOXjy2jOv5z+umLC6w7S2FkFcRQzsewaue5SRZyFh+eRsJYhMn
	RvzAWZSqCYzUgbUfDc1RKLEqDYbjGXrEBtrlX6GJQNUUmQiU7NzZ67ezOJA0WwihvOHQ7DkQuqc
	USoNuWdqN6azR1WZLQBN44YrhebB8lfzhCX7lv0ZjncKKJMPmGM3XufvcsilM9Hq2c4QyAgmHbb
	eeklk9gTAnr3YYpkgkvuLstSz29UskvC2VJkjwdsdFAuTDwix4j5EIb0M3URhRHBeNkW3SX7PBc
	KYOIJVQZ1knl9OmB/G0O4DKgCEFK1PWNtCUpgDwqlb8McKcktiTfYSniI8/LE9lpumxTYZV/xuL
	b0XChKxu7CrFikbRtnCU7xyNf7RCmqoQbKioxDxnlS+2S1TZTuXcMs80QBtKPVtA==
X-Google-Smtp-Source: AGHT+IHj3Y6wIV5AUbLPEccL8UD0+/WQYXDoH5vveto6x4rPTg1NKXv1cK1SYk0AipMsM0eS/0Zodw==
X-Received: by 2002:a05:6a20:3948:b0:249:d4b0:5b2c with SMTP id adf61e73a8af0-249d4b06494mr4595621637.14.1756962762926;
        Wed, 03 Sep 2025 22:12:42 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ecee])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd0736ba7sm15731755a12.12.2025.09.03.22.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:12:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] kexec-tools: Fix build with LLD linker
Date: Wed,  3 Sep 2025 22:12:38 -0700
Message-ID: <20250904051239.796948-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904051239.796948-1-raj.khem@gmail.com>
References: <20250904051239.796948-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 05:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222895

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nt-base-match-pinned-section-address.patch | 36 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.31.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
new file mode 100644
index 00000000000..0ef305c1787
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
@@ -0,0 +1,36 @@
+From 0d8a9e12b6509cb2a79818f5f4062a0bee33edfc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Sep 2025 13:28:32 -0700
+Subject: [PATCH] Make the segment base match pinned section address
+
+ET_EXEC uses image base of 0x400000, but the build forces
+section VMAs like .text = 0x10000. LLD now errors when any
+section address is below the image base unless you explicitly
+set the base. (Older LLD tolerated it.)
+
+To fix this, set the image base to match forced section addresses
+
+Fixes
+| x86_64-yoe-linux-ld.lld: error: section '.text' address (0x10000) is smaller than image base (0x400000); specify --image-base
+| x86_64-yoe-linux-ld.lld: error: section '.bss' address (0x12000) is smaller than image base (0x400000); specify --image-base
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec_test/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec_test/Makefile b/kexec_test/Makefile
+index fec6210..f9fa92c 100644
+--- a/kexec_test/Makefile
++++ b/kexec_test/Makefile
+@@ -31,7 +31,7 @@ $(KEXEC_TEST): CPPFLAGS+=-DRELOC=$(RELOC)
+ $(KEXEC_TEST): ASFLAGS+=-m32
+ #$(KEXEC_TEST): LDFLAGS=-m32 -Wl,-e -Wl,_start -Wl,-Ttext -Wl,$(RELOC) \
+ #		       -nostartfiles
+-$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start -Ttext $(RELOC)
++$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start --image-base=$(RELOC) -Ttext $(RELOC)
+ 
+ $(KEXEC_TEST): $(KEXEC_TEST_OBJS)
+ 	mkdir -p $(@D)
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
index 7333aa73c17..b12f76a0bf4 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            file://0001-ppc-fs2dt-Match-function-signatures.patch \
+           file://0001-Make-the-segment-base-match-pinned-section-address.patch \
            "
 
 SRC_URI[sha256sum] = "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"

