Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1FDCAC597
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.41413.1757580704711451107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIbJRDOZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso3441355e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580703; x=1758185503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHmx2kLG5AqEg6+eHj4Fvk7v6qh3zBTvQdePMvLcxzc=;
        b=lIbJRDOZYxDwe9Rk6JDRJ3Kn4PKjklnb1i1k71BAhmK9QqAGezMIga38s26fxPFF6X
         EWs+KelFsWrupaC3JOgTuJHiHSL47b27dBYghgzXOM6M5PzxOu146Rdw+GJawfJ3pO5L
         H43jc1p4xEOSH8a/CsRWsntI7wexy87qrNvzagbedGdrg2c6cXiDra37mwi6EgG+Utv1
         BAcNDCVLTBO1NIXAwS5t+0vTK8ci35HkT10c2SfGgPAp1hDD9btrNXAOXCdYAkihtGCJ
         Dz0of6rRO0cJMaGsOJS2kHY+FA4EoB1BeYWJtc3GEjavg6u9ywwTv5dj65mZU+V0gRdG
         mMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580703; x=1758185503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHmx2kLG5AqEg6+eHj4Fvk7v6qh3zBTvQdePMvLcxzc=;
        b=phCZ7r0Kar+HkaDSVRwH2PVJRDzELZnDN6bLipiQboZPR+cBgTXt4VQ+Tx4Kuif4Ej
         POpoPLqtD4s8ZlXCjfQDQPI69r7HWlgMvxp1Nh6nRUIQrpTGfWgxw3NT0hIl2SLLJ46o
         tkuaBhMquutdZNu9L0TkIa3eOpxd5catLJbFUNIyB9GyaC5psQHfhN5SIujsTOSQZQ0M
         YEzLGKWqcLTbxQD1LLnfASUp5Ty9ptkqrfRkV0YmhaA0KJvy08bv5UjizuXjKI8fcSBM
         cgqteoW28hnWjJT2DxZEb2xGZsWoVcm9lEW2nj8jc3afbrUBsYDeCbq8REMG1YnfP+q4
         nRcg==
X-Gm-Message-State: AOJu0YwmuPA0dUhXZP93e6S8bCkX9sS84CUXvhT7CRk5TehnHbgk0Mle
	vCcX9m5OlUywAxBhRXw+9s8NKa0bQ8IvZYjqiFBsyoC8HMvUh7tLKMkjZmgwaw==
X-Gm-Gg: ASbGncviDdQeF6LDyrTCpPBKtMflj5oosJTGhYwX0ow0GK9CNW8Faw9RDXHoZgzsGof
	GUVctB6NfkFWPJ6gAomi1LetLDTlBZHCpLXS8WfcbxCyJxs5PHu7s6XTrUUfABuvBMpyBXK0bn0
	158OZJ280AicI8Ut5u1E4U5yHPvIzbJhqZ1xKQjKR6tWsH56O3M+h6/8ADWPMf7DNSUxLZ/pgG7
	iK7bhFfRXvL0UJBiAEFALqt/5nXJEusCwOI2RCG4QHkUHmRGL/23uIK8U8gn6b1oOSoPxf+2GwO
	aAcExBoYyPNQ6VM3/qEZrMFAKJdiMyc6Be3FGuKjM6IKtL627aCPHTqS6Uthx28oQJa/2iB0sfG
	Yc9vEbT7ohLtzTuPvNDF6NjrSdAd/1gCEC1EleTpnxMRyUCjT3J8gvXzreLho6jXhphGpjv53LK
	rOyVg1YZiWCbzsaQp/IqniItIFZB2QP/s3SQDdgm/rN9IQNY26ba6/6rx4hw==
X-Google-Smtp-Source: AGHT+IF0SWBi8BgDtPYxS2tV8J5bJa0hTLLb28PlL0DzwuIE3R2VPXxEit7/y8Bbfb4BqKZ7HBaw3w==
X-Received: by 2002:a5d:64e7:0:b0:3de:b99d:d43 with SMTP id ffacd0b85a97d-3e6428d7c2dmr15219678f8f.19.1757580702950;
        Thu, 11 Sep 2025 01:51:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/16] igt-gpu-tools: update 1.30 -> 2.1
Date: Thu, 11 Sep 2025 10:51:20 +0200
Message-Id: <20250911085123.1551425-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223260

From: Alexander Kanavin <alex@linutronix.de>

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...c-address-procps-4.0.5-compatibility.patch | 30 -------------------
 ...gpu-tools_1.30.bb => igt-gpu-tools_2.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_1.30.bb => igt-gpu-tools_2.1.bb} (91%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch
deleted file mode 100644
index 7db773fe0db..00000000000
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 173cdf607bf39c13eb4d4b0dadcb9dc6add76014 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 7 Jan 2025 09:54:07 +0100
-Subject: [PATCH] lib/igt_aux.c: address procps 4.0.5 compatibility
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/164]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/igt_aux.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/igt_aux.c b/lib/igt_aux.c
-index 3407cc4f2..7028d3f57 100644
---- a/lib/igt_aux.c
-+++ b/lib/igt_aux.c
-@@ -1358,10 +1358,10 @@ static bool get_process_ids(struct igt_process *prcs)
- 	prcs->comm = NULL;
- 	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
- 	if (prcs->stack) {
--		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
--		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
--		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
--		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
-+		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack);
-+		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack);
-+		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack);
-+		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack);
- 	}
- #endif
- 	return prcs->tid != 0;
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
similarity index 91%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
index 1eae416c014..96f3530436c 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "edf352a96646c8d793f0c1eb11795112f9bde725"
+SRCREV = "4871829d8b7117553eb2dc1bdb9a0d18de428a98"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master \
-           file://0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch \
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            "
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
-- 
2.39.5


