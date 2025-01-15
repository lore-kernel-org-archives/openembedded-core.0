Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478CFC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.22658.1736951894295088577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pa8SrGk1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215770613dbso83531345ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951893; x=1737556693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwaLYtX/0+kDhM1qb0x7aoslHr6jQPs/zlcLeN68G9M=;
        b=pa8SrGk1h+QbrQ2BueDHDsNxx0GDBpZmlwW+VfjxAsyc6zvEabHvvgZbIksfu6C/f7
         bq/cRAz7UVARZVWX521fsl/O+fW0zrrCn1kO9a1EJreYNtVjoNGb9ZhTy8+jEibEk+wi
         uC/waIpCVnljQLR2/su7izmPLj3UPoQ+YJWf6t755o8jtqLMcNrkIXnjm8PMgGgI/PJS
         cqcZrGtjttOwoYty+G5TV4O4/lS7IXNeonKotEJr89xwBDMmfsX0/Z6iOmhbV+PcNjfu
         fx9wBEyprIntZe6IKmDbmNjp1tvlfhPJ57QgGicZr/onMIv93v7svTCgkGg/9fi3AnkE
         IQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951893; x=1737556693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwaLYtX/0+kDhM1qb0x7aoslHr6jQPs/zlcLeN68G9M=;
        b=T69qS4ZQbV7zEKq6urZCJkPiivPCCYb32l3dIPWkz3N13wZyFJyI+Vbwd44Ypp5FeZ
         QNI4NPM3k6qgUOr2dxGTOwecWG1zklvWOIMv6d/GbUVjDOj3zH70p2vJSpfGzUgLhNoY
         KEh/tOHpxPjJGHXme7YfTPvm4pPdruHmTumVPiGlFyTJgZJ2OndV/BX+BIj76h6r0HkD
         lrkMYL3wuaYoCIll8q3bEMFIn7MUEfjwStFUCKye8kn5lbCBjbEuWCWEs0778BfDiEum
         1jTNwc05M2c846wltbW5ttEejI5b1K+ZNUzcbSNR/+b2jhoqgzJGYdYQBYiNL/ShoVGI
         38Lg==
X-Gm-Message-State: AOJu0YxN6PKbhuaC5eTIWDb/n9tKrs2Xca5Hb1/wjyxbR0ClRF5PkLyp
	kZXRDOrTgvCuR47TatzeHQJz/ueaxCjjI4L4AA0xTbuVoCJuUaGLvf+ADVurHUv/vsdMz20Tncq
	9ir0=
X-Gm-Gg: ASbGncuTSb0XGNVMjpi08qQSXapNhvEPgMoAdAylv9N7zAIwMPbkrfZGpWmYzkyXHMz
	oVicj/13/OjKyWvmQL7aLgcEFfbTsvTfYZhNce5upvk79H0dAEbq5NhsoYqbRMLaY/gjx84ygya
	LxqILT5t41ZSL+Cyx7mkWQAXXb1lrrOhioEfdHv/H8TdZYDOkpfZ5TwBa6tpvmVKKfZn9Ua5WM9
	Qgjli8m69EjARhyO/boZaDWGb2kVnCMAo/bFqky25Q1RQ==
X-Google-Smtp-Source: AGHT+IGTZVNqw/rldHlwN4KhZWtHjnUPNHCVw1nqlebRTUlVVka10K5rhEkEZxrv2nYdHkIyGe4YOw==
X-Received: by 2002:a17:903:2b10:b0:216:2dc5:233c with SMTP id d9443c01a7336-21a83fd34b5mr462465975ad.41.1736951893603;
        Wed, 15 Jan 2025 06:38:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/11] ofono: fix CVE-2024-7546
Date: Wed, 15 Jan 2025 06:37:48 -0800
Message-ID: <33b2a67b3134498e8c4845efddc7854b4d2315cd.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209915

From: Yogita Urade <yogita.urade@windriver.com>

oFono SimToolKit Heap-based Buffer Overflow Privilege Escalation
Vulnerability. This vulnerability allows local attackers to execute
arbitrary code on affected installations of oFono. An attacker must
first obtain the ability to execute code on the target modem in
order to exploit this vulnerability.

The specific flaw exists within the parsing of STK command PDUs.
The issue results from the lack of proper validation of the length
of user-supplied data prior to copying it to a heap-based buffer.
An attacker can leverage this vulnerability to execute code in the
context of the service account. Was ZDI-CAN-23459.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-7546

Upstream patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=79ea6677669e50b0bb9c231765adb4f81c375f63

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2024-7546.patch           | 30 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch
new file mode 100644
index 0000000000..aac6751625
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch
@@ -0,0 +1,30 @@
+From 79ea6677669e50b0bb9c231765adb4f81c375f63 Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:52 +0200
+Subject: [PATCH] Fix CVE-2024-7546
+
+CVE: CVE-2024-7546
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=79ea6677669e50b0bb9c231765adb4f81c375f63]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index e1fd75c..88a715d 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1783,6 +1783,10 @@ static bool parse_dataobj_frame_layout(struct comprehension_tlv_iter *iter,
+
+	fl->layout = data[0];
+	fl->len = len - 1;
++
++	if (fl->len > sizeof(fl->size))
++		return false;
++
+	memcpy(fl->size, data + 1, fl->len);
+
+	return true;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 0597caff3c..0c1e0ea6f8 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -22,6 +22,7 @@ SRC_URI = "\
     file://CVE-2024-7543.patch \
     file://CVE-2024-7544.patch \
     file://CVE-2024-7545.patch \
+    file://CVE-2024-7546.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


