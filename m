Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6ECC02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.22654.1736951890008210464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tchtU6Vv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21a7ed0155cso118602145ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951889; x=1737556689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaLw3wryidAVrtpD6LP5C6hAhHM+kFdI4e+qUkVeRLI=;
        b=tchtU6Vv+I07hlihWNx7HrLKdRLgyHLq50rsCMaBNPEYwg5tj00mNq8P2UrB6eoXkd
         FAwB/Om1ZBrB4ea4+7vvSqIj963bDbEQMW6etIx1OYQBvhhXVcbzm4NQT7Dl6CEnXD14
         yKCRc3aavgasVg2A22zFUr9orvguLLZ8UWFy2jGSl7oRdycrkXbM+Y4VO4mycOX9eI58
         AdgVN29ZHBPqQ1XVqNfA5gNdkOyqvViYROpARZni+q1No61A1wt3i/MD3BjXo5KNdxYr
         0VV3RDozHsvV/T0dYIPucb3Rut3TX/8X4n95kTiyH5swhgmqpFC0+gYheoZFaF6d+cLD
         Ifog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951889; x=1737556689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaLw3wryidAVrtpD6LP5C6hAhHM+kFdI4e+qUkVeRLI=;
        b=MQ6byW/DPVuUHgPcPf4Wyci4eQEfsZt4O5QOIVafc75DCqv0THEK89jV8eJ/MhSy+B
         hMng6PqqMPXso7zqnDu/8Uaq0TmFkBFDgUPp41qw2sVUVYDuIeANTdnhO6K2HhtCDtuT
         BYB8j2Vx4ff2dNE9a3bdaIku6NH8lAgC+8CdjLQEfruiIdlRh5USQjUslDL52yi9p8pz
         6FZw3ZR6fVaM6TGmJ/3WCkhZyW0+3PwmOZ+xfT6VpTeiz8Uoo5Sa4WUGvzytmIvAKddO
         NRRNUf4nx66EDA93jTTXrwzkD3YqiwbEBrUIWQJ00Z0/jzmvps+0mRP6Xtv20n9xiaUA
         VbLw==
X-Gm-Message-State: AOJu0Yw4TEk4DSUz0OO/zQz14MnvizctfPZ9+Z/15xCcFrhQX+Q4JAP4
	JhXtHMlyN2ZOvBcnQBzZU9HqO5ME0H4qsn+AR064WAeJhb2fNMIt20UwBWvmrL8ZMBSjvbPiDGD
	MB/k=
X-Gm-Gg: ASbGncsF3h27a9S3NeBPei4kGxsp0+0WfWdKG38VxAoZVbop0KDdNmE1t5kETArMKHE
	BA3O0ry8uSNGRU9gceShZw8PH2HxAjue/bJQY+zqMVSrghIiL4+n1eMiHsfHGsd9lEw2YMTdJTZ
	27GVMvoIoHVjm9Q0X0nzqctc7+1ahmYeAsPo3aBCcf4dx9RYsL0yCsCGRjOoaF+hZgcq2EW2x/f
	y3sGR1Xn61JXnbZ7o19DwRKvZnTZBTZXT1RS/t0RYRcwQ==
X-Google-Smtp-Source: AGHT+IF++iG5MRNcq2HG2NFoO5OkprPWOBDl/dMR75bYSZDy6jPU3jYNwZZOhaOVIoPm68byXnO2eQ==
X-Received: by 2002:a17:902:e5ce:b0:216:386e:dd8 with SMTP id d9443c01a7336-21a83f54a51mr362345875ad.17.1736951889227;
        Wed, 15 Jan 2025 06:38:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/11] ofono: fix CVE-2024-7543
Date: Wed, 15 Jan 2025 06:37:45 -0800
Message-ID: <31ba25646b78d60923b1d897a43e37ef6f9edd51.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209912

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
context of the service account. Was ZDI-CAN-23456.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-7543

Upstream patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=90e60ada012de42964214d8155260f5749d0dcc7

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2024-7543.patch           | 30 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch
new file mode 100644
index 0000000000..d71d00b832
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch
@@ -0,0 +1,30 @@
+From 90e60ada012de42964214d8155260f5749d0dcc7 Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:50 +0200
+Subject: [PATCH] stkutil: Fix CVE-2024-7543
+
+CVE: CVE-2024-7543
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=90e60ada012de42964214d8155260f5749d0dcc7]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index 4f31af4..fdd11ad 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1876,6 +1876,10 @@ static bool parse_dataobj_mms_reference(struct comprehension_tlv_iter *iter,
+
+	data = comprehension_tlv_iter_get_data(iter);
+	mr->len = len;
++
++	if (len > sizeof(mr->ref))
++		return false;
++
+	memcpy(mr->ref, data, len);
+
+	return true;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index a7c3a9085d..731b186b12 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -19,6 +19,7 @@ SRC_URI = "\
     file://CVE-2023-2794-0003.patch \
     file://CVE-2023-2794-0004.patch \
     file://CVE-2024-7539.patch \
+    file://CVE-2024-7543.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


