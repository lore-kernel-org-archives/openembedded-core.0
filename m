Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86600C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:03:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.41008.1698951787380601434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMgcWhKs;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso1061048b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698951786; x=1699556586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS0+w4nb5CHj+G1UUVkaz29qs0F1TXIsz2hH+vvxFps=;
        b=mMgcWhKsMpTWN5IXwdE8eFbJ9Xj/Fv3G/bL5dv7YuBAHv4n9wUPufyDBEhLQG3VHxT
         1GZKnddacZqp8EN8sMKik3iaIjseqrP2msYgHf1B6RGUpWJicDII0EPSGqqed5qGb6PU
         UewZDVAhH7ZwQrQelNotNJsgT4YuSeHsXfIRBBY9G25VmfA/eNnIu1TKtCp5l2UbI5lo
         4xZPeB7CFsKWdJx+wOcK+aBmTeXq9vB++gsGMmVKMDqUWZyhwk3HJ+SqN0Gxw86feInx
         PmS4IX052rkhE+YhmTSAwI5b1iFmDnEIkJrYmWipLh2W0dlZ251tFj3A0quEXkje/LDG
         PmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951786; x=1699556586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eS0+w4nb5CHj+G1UUVkaz29qs0F1TXIsz2hH+vvxFps=;
        b=mHPTXDteRAMGp1nx+GQdOaS4/e5yJGyu1NiQ87B3EB+BkI5VM5YdjkFmWn0oW0LrWf
         gIBIQFldwivZHtTp0/W5X09Z4+cdQgkDIwXfHpKyycZ4X8mQw0bP8eINyqZADZVkJiOf
         1UGnMJdvnx5JTLq+GlazMb4NgYm4Mzhb45db/nlUi1tTYitV7RptoeA9TjW66PsSBsx2
         DMFdtjJ2oF5ZwGKmaJrmchlizGEqjzPjeKzOJW5auKLCoM/2FuG92GD7E3K3ShKS7DVR
         9WrxYCFuzEvdTR9HX2f+1o5IH95BgCWGSco3wGMIyyvm8TaHf20VpiJfHu3WRBh5Zu7e
         FDnQ==
X-Gm-Message-State: AOJu0YyCZUadU6H73Ch3CKvJrIw70Tt64EekGlaMfBbwUuD6XBcl1QGW
	0QYPuId7TgvhBwFtcpLbLqjGRNejfAJzjA==
X-Google-Smtp-Source: AGHT+IE2wzZvDJl5GSkmgvW8wdsdE9l9M5ZKSZTfQtuVW7Fm5TPhR7ZE3ANdjtgp2r3Nz5N7UxM1JA==
X-Received: by 2002:a05:6a00:9398:b0:68c:44ed:fb6 with SMTP id ka24-20020a056a00939800b0068c44ed0fb6mr783633pfb.16.1698951786483;
        Thu, 02 Nov 2023 12:03:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id m5-20020a62f205000000b006c0678eab2csm100636pfh.90.2023.11.02.12.03.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:03:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] uninative.bbclass: Add ldso information for riscv64
Date: Thu,  2 Nov 2023 12:02:55 -0700
Message-ID: <716100023f91b0abac6ae4e4499392c9d575ba59.1698951553.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1698951553.git.raj.khem@gmail.com>
References: <cover.1698951553.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190095

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 9630726f330..9b8b4565dd4 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('BUILD_ARCH', 'ppc64le', 'ld64.so.2', '', d)}"
+UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('BUILD_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('BUILD_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}"
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-- 
2.42.0


