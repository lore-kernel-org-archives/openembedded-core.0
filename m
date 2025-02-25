Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193EBC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 12:08:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6495.1740485330013557915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 04:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ldBd7Wvp;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3084593f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 04:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740485328; x=1741090128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcnvmtLmZd9g3NpYml9dxv+NmVaZGtpKzcf9znh1jfw=;
        b=ldBd7WvpbcC+SrVhE77dhqqpVXXtujIfPyCtY2qNm82Yp9s4GBKX7swj9P0JDXkdvc
         VL1mF5M4gs7NT9E+ZH2mfBjeVChoY5JxZbmboh/lCyx7WfqxaWdUc5F8q0KXsOilbFiB
         79XlFIYq+pOkKNQoavlVsRQkf1MFu0SedTySnHMbYFXfqnMcJWmsifQd7c1oCUOvpx3C
         Ex4JVV7DTv485Yq6PpkuOLfMF0MTC6H7nAtLVAQe21qCCzYLxoajgggv4adGabABJkYE
         rXq+dc/8h6whnfgCXriIzNUQwd6ypeLSG5HdmZ7WSl64ZlZeKv6dMxZSNMnqhhiXk/ZU
         9UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485328; x=1741090128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcnvmtLmZd9g3NpYml9dxv+NmVaZGtpKzcf9znh1jfw=;
        b=qC39kSpjfHcpAL0iaxAJ4KRHx6ibgNfERXJt2LtHpyrXnTHrzTtiLqlrt8yT1rNbnQ
         BiMV5RmwRI0tDoxNCtDbiMHmJIzIsuKzzMtr8raNMN6kCY8nL9Sfvqu8eRY+3NwfOmKh
         q/qUc0aEnvFxbdEHSJb6DPUWVMrwKiqjmYMq3THv2mwpjp3zKEuHh3TOiuFJm/alO1tj
         468lrpyxcUraBGPnyp78/5F5+gdyensKFxTWHh9/X+Bdzzyb1zL9ejS0/ailIYY6n3NG
         +8VNWPRtbYV2VdyRFtpxBNEYIZXcY6p8TG1j/ODkuwiacd7cBuE0UfAeb0//O2H5cUTV
         xRTg==
X-Gm-Message-State: AOJu0YyfoWc10kZd4ipNQ4lT/CjJKFvz0tGgxdujncfkqmzrw2TQ1VzP
	awU8kp2zdEWnNkAlxc+DXIf48hXsxIlbTF388ZyGar7TQocMgc1fuTBEpw==
X-Gm-Gg: ASbGnctnbLZgVtAOmjFqmDyOhCrIVDJc+Ab9UMXmp24xHaUtNqBt1ygtIRrHIqTPWet
	SbbbyI+Rqjn4XeUxp6GL+82f2mSxFrrdmZAhb1ZMgnN1xhGzpa05qTga8MFBg7NJj6FiF8GXT4X
	ObljWCuC64YBJPZyZJlNOWZ/+MMexNBwvULqfmetAjKgBFJBhOKXrbx3QTuwbMuHpwIiCmyzIlS
	Pu2aPxn+jKtjGv5khuQGK4hbMgHJ11BunokKaTR4Jt3DZJeQd2sz3SAfxmdyMTt7F8+9rGoA4j+
	8axX6ccTeaQYhVhohKET/KLOsRfimEib6yhFNcFScjnBRzAjHvzjZ3iDlhzp5h0=
X-Google-Smtp-Source: AGHT+IG56dblT/m4CDQn3js/47FtyJktduV3LlTR85kF5QbhPIZOq8TvZjJcmr3qzqHr3Ldmm5MRYw==
X-Received: by 2002:a05:6000:4014:b0:38f:452f:9fa9 with SMTP id ffacd0b85a97d-38f7d1ff2b0mr8998368f8f.2.1740485328274;
        Tue, 25 Feb 2025 04:08:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc31fsm2018305f8f.87.2025.02.25.04.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 04:08:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] conf/fragments: add fragments for qemux86-64 and qemuarm64
Date: Tue, 25 Feb 2025 13:08:34 +0100
Message-Id: <20250225120836.171976-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250225120836.171976-1-alex.kanavin@gmail.com>
References: <20250225120836.171976-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211874

From: Alexander Kanavin <alex@linutronix.de>

These will be used by official bitbake-setup configurations,
and so let's start with them :) Plenty more fragments can
be added over time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/fragments/machines/qemuarm64.conf  | 5 +++++
 meta/conf/fragments/machines/qemux86-64.conf | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta/conf/fragments/machines/qemuarm64.conf
 create mode 100644 meta/conf/fragments/machines/qemux86-64.conf

diff --git a/meta/conf/fragments/machines/qemuarm64.conf b/meta/conf/fragments/machines/qemuarm64.conf
new file mode 100644
index 00000000000..0fc164541d5
--- /dev/null
+++ b/meta/conf/fragments/machines/qemuarm64.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Use qemuarm64 as a target MACHINE, suitable for running in QEMU system emulator."
+BB_CONF_FRAGMENT_DESCRIPTION = "Select qemuarm64 as the target machine. This is the best option for running the target system inside QEMU emulator on arm64 build hosts, \
+as it allows near-native performance with kvm acceleration. Also useful for testing arm64 specific assembly code or compiler output."
+
+MACHINE ?= "qemuarm64"
diff --git a/meta/conf/fragments/machines/qemux86-64.conf b/meta/conf/fragments/machines/qemux86-64.conf
new file mode 100644
index 00000000000..0fce37c4e2e
--- /dev/null
+++ b/meta/conf/fragments/machines/qemux86-64.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Use qemux86-64 as a target MACHINE, suitable for running in QEMU system emulator."
+BB_CONF_FRAGMENT_DESCRIPTION = "Select qemux86-64 as the target machine. This is the best option for running the target system inside QEMU emulator on x86-64 build hosts, \
+as it allows near-native performance with kvm acceleration. Also useful for testing x86-64 specific assembly code or compiler output."
+
+MACHINE ?= "qemux86-64"
-- 
2.39.5


