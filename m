Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4612C369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 11:10:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.12424.1745493023884214662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 04:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gBraXW0t;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so6014445e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745493022; x=1746097822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmDRo+OZlG877o/mbyYc/opZ+1bQjZpzqv9fBPHLr3g=;
        b=gBraXW0tGSMWwUNK7bsKQQcoXhXBPD3GsBuDkAqlpJWlRJGrhpPwUFwD9/XZkxbKH+
         PxkEZOBTNTjFUp2Ntyl9J1C/CQr1kIQI2RvD+le1nFHCSEAA4HuZrQyT5oHrXrTrbrrp
         pIB1FhfdKTDTseV2WM/WF8j6560HctKuy/5RyxvpZsyJ3VuyQapeX268aqZ32qo/p6Ma
         F+NAYy0mWWovB5llQjyVd8l5e37R+/ZH9yVITM3GU4ua+a2311kT96rtCD0GO7H+o8Zc
         qLuynPN7qjqLgUk1Oz2FnYSGyxnGnXNexVdfGlo+dXZuMJOsULFfkQfAERxwNTuVHlKW
         ti/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493022; x=1746097822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmDRo+OZlG877o/mbyYc/opZ+1bQjZpzqv9fBPHLr3g=;
        b=YN3s7CtPlqiGilO0YKHo8jzYobkqRmTP0AiMAfCi8Q86VlyalqtEYeJbJVqk9C98kD
         /OOccEpjdLJxbBCbXARg0SgiTi6wa+Y/ZSg63Gh36CnPg1vfENoHALVIr9Rnoea8RiSM
         IvajGfcAarMWJZJO5nVmIh6uJdW3TNNYGZNlnonkJMSqKxu5Muh5gn4C8j08hA0OEWCa
         RuX15Hw/F7lCFENqH2aKJYwLrIR3NPydvWRkESP/afptktr2fNgYoGg9tHQwCh7PfVOg
         MbuKfsj6sZTCiMz5IYwCIdtPO1iE93xVytQSSfrUdlmgw5FXbsoy5QU3nqeW9TSay7M0
         jVeQ==
X-Gm-Message-State: AOJu0YxxBpbDmw+2aP8j11nnvHyexGxTyTqEZwv8YzBXiCh9WgH8XT9G
	+KgMk/QEAdABrmmJncWgzNy8Rwx7FxmoxX/6XVhNesDQHwofQOgq29SdEA==
X-Gm-Gg: ASbGncsfqe5MnXwI9SRzkMEo3fz9zgaGqSb9SGhO7+aReN7lUXzDOV4lADmCRGm4PHO
	gLVEBothOXPjnNRk7j7rePHt1YpmCNviUyoySs2bMur4vGETvXXhJNa/ihXZb+LDTokShsEFhKA
	m6jyW0baLLVF4njnsdXez/QaCq4Ys2Q64Ao43XMqAz0CmMThSuXghLfxrDDv+RBBqAKAjdVEMmw
	KQ+18PWg9FiQteBmLBbOOM3j6NSTimmlQZhp+vD5lcgfgc5klXQT5VOxxhFI/UyphkcDxTeHxOx
	+7/ge2gfZtLn86uSzf/17SfpZX+AChXphwg5zXALalcqC1OoNf6b2jU11qtMPygNqjERTMB6v3B
	8qg==
X-Google-Smtp-Source: AGHT+IFy6aXV4FS7C+FWjgz+zoikDve5hmuhHCxLnmkDW/6xmEVC6Ova/YLw3BCh3uAun7t3ilekpA==
X-Received: by 2002:a05:600c:3487:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-4409bd05295mr20379285e9.4.1745493022087;
        Thu, 24 Apr 2025 04:10:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d5323b4sm1753499f8f.66.2025.04.24.04.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:10:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] libunwind: use github-releases class to determine latest versions
Date: Thu, 24 Apr 2025 13:10:14 +0200
Message-Id: <20250424111014.905507-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424111014.905507-1-alex.kanavin@gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215363

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libunwind/libunwind_1.8.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
index 1885da4d09f..ee4a8401ba6 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d80c8ed4062b8339b715f90fa68cc9f"
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI = "https://github.com/libunwind/libunwind/releases/download/v${PV}/${BP}.tar.gz \
+GITHUB_BASE_URI = "https://github.com/libunwind/libunwind/releases"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://mips-byte-order.patch \
            file://0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch \
            file://0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch \
@@ -16,7 +17,7 @@ SRC_URI = "https://github.com/libunwind/libunwind/releases/download/v${PV}/${BP}
 
 SRC_URI[sha256sum] = "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157"
 
-inherit autotools multilib_header
+inherit autotools multilib_header github-releases
 
 COMPATIBLE_HOST:riscv32 = "null"
 
-- 
2.39.5


