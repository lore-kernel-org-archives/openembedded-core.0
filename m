Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD24BD1D868
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:52 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35386.1764822648060328008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FK8nYdUU;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-880503ab181so4965186d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822647; x=1765427447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN9RqZrgHLQPcgPNMbCCYRGLWNdLZZgholZulcFOsso=;
        b=FK8nYdUUdy6lmq08JjPowskg7D8ucsjzs4k1ucC3lYkL1CtYIebPKJWSIFJNrDPmKV
         hMdBQS7XOZ3mweWHDKDp5pJdmOhoVbE6FFI+6TQAxnC0JlWu6G+JTyc+P1SIs+z5w3YO
         19HCJxS48SEWx//LsphQor8mvcPdFokV61Ci57FZKDU25+QQ5KA7KTz6ezn5ybgZ5fwa
         QJTPmKBeUFxJPCJLBRmzGhWPTQRuQ/js0+DfwZ4cPsT/hTIlaZMx5juseaep+juJN5sR
         tyW6rP4R1arkz3g6oOUvSfrLGn+8fcmDbGsA/y2lzQq48ACzpO7BfyvbGvErznENTtqN
         Z45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822647; x=1765427447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RN9RqZrgHLQPcgPNMbCCYRGLWNdLZZgholZulcFOsso=;
        b=PleXFQiC/WYOejIXI9P+meI7YMEIWe85uQKzOXT+xS4QshEF4ZwMIrIW0RqduWwiLy
         2ZVCpkDv2T1RGrSYHzNeVz+tadvr7BwCw+puCnu8xny3zqVUWGeXRlrTEc3yFROxkd/o
         amG/HGXup3y7J/FAGgElyolgd44Etel8kWZjzSIQSDgXjPU/iXolSW+nynTgU13AVifs
         zBvTerUSTMwG3TbloCA+2SYdqPesV9hFGFRUb52x3ho4s7PIMv9nKW/S+x47oEIzeIF3
         4eo/kHWEfLoeZ5/fG93fY6M4wa2krSTyyXpNKsqP2mqTJ+/GZhq+e1P8d6Whiap+A2yu
         Ey+g==
X-Gm-Message-State: AOJu0YxxoYUsDD4ORSeXZbUuFcN2pDAbqdCZvgD3qvjQqAMrGqF5yxtI
	d9EqiF3wQoIZbHSUtkCJG79E0zI8BnzA5urtHKUL3yvM8+IjTBrYyEFuQladV9kL5Tc=
X-Gm-Gg: ASbGncuBQDdkMftMsHrzo2HCFMpmKJrvNF5pLuVA1F10kHrpJcjXD7py5H+C4DCoAy/
	vT9H9oDujEUr8sw8CTMeUdxBQjyWg/jxupK6mD2b0fG3c5i5Idqy2Wi2xNbXFD7dMGP8YyF7swf
	rcTZDrDp+49i1r7M/0mVwLqOpEfV4P8S2o3VtNtRlP/JD87bxg5eNDvmbU8Vjfa58k6yfTivBcR
	TdkdSBM5kcUt4PUu+qyItgZWmQBLKkS03IpqwKyE5SFDfHgKyo8TxiwyS/q3My00d9FToSioDKk
	/hxadEuzPzqjxa9akv/We4z3MBPwOtfLkEImPzeE0yxFrGEFq5tByh1PkX92MS/Hi/L4Cqtt178
	er4jiox1u5IQ1qU6Na/sxim/IYVCZOS1E8U/cgB/Ib5zEN6NQfVGHcMSua2bx5EzSYroBtAJiek
	DnDjQa8ubNS8oLqo4SUwt/tXLfnZeZKGN+B4IWgcgPFjVuJU3yQdiw3NNeWQoXbRQYN/yyDcMk7
	La3RBh0SW6PHf8=
X-Google-Smtp-Source: AGHT+IGuisG1Ps8Fko6A1NrVuB+ChDVpN7BKEHYzTJLHOdbSM04XIfl9vLKySbgkBwXOeq/Vw838VA==
X-Received: by 2002:a05:6214:212a:b0:880:626a:b129 with SMTP id 6a1803df08f44-888194e5370mr82246396d6.24.1764822646852;
        Wed, 03 Dec 2025 20:30:46 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:46 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/16] linux-yocto/6.12: update CVE exclusions (6.12.58)
Date: Wed,  3 Dec 2025 23:30:24 -0500
Message-Id: <f5d9554c03561cfac7d5204cb3219fa53dab229e.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227263

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (0 new | 4 updated): - 0 new CVEs: - 4 updated CVEs: CVE-2025-60674, CVE-2025-60676, CVE-2025-7195, CVE-2025-8870
        Date: Fri, 14 Nov 2025 16:39:11 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 204 +++++++++++++++++-
 1 file changed, 201 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index b35fb07d314..b66f36a2023 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-11-03 18:50:12.770797+00:00 for kernel version 6.12.57
-# From linux_kernel_cves cve_2025-11-03_1800Z-3-g832f00439f0
+# Generated at 2025-11-14 16:49:37.841595+00:00 for kernel version 6.12.58
+# From linux_kernel_cves cve_2025-11-14_1600Z-2-g7d42ca6d8de
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.57"
+    this_version = "6.12.58"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -17692,8 +17692,206 @@ CVE_STATUS[CVE-2025-40106] = "cpe-stable-backport: Backported in 6.12.56"
 
 CVE_STATUS[CVE-2025-40107] = "cpe-stable-backport: Backported in 6.12.52"
 
+CVE_STATUS[CVE-2025-40108] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40109] = "cpe-stable-backport: Backported in 6.12.52"
+
+CVE_STATUS[CVE-2025-40110] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40111] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40112] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40113 needs backporting (fixed from 6.18rc1)
+
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-40115] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40116] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40117] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40118] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40119] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40120] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40121] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40122] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40123] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40124] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40125] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40126] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40127] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40129] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40130 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40131] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40132] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40133] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40134] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40135 needs backporting (fixed from 6.18rc1)
+
+# CVE-2025-40136 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40137] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40138] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2025-40139 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40140] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40141] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40142] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40143] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40144] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40145] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2025-40146 needs backporting (fixed from 6.18rc1)
+
+# CVE-2025-40147 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40148] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-40149 needs backporting (fixed from 6.18rc1)
+
+# CVE-2025-40150 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40151] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40152] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40153] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40154] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40155] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40156] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40157] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40158 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40159] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40160] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40161] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40162] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40163] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2025-40164 needs backporting (fixed from 6.18rc2)
+
+CVE_STATUS[CVE-2025-40165] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40166] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40167] = "cpe-stable-backport: Backported in 6.12.55"
+
+# CVE-2025-40168 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40169] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40170 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40171] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40172] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40173] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40174] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40175] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40176] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40177] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40178] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40179] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40180] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40181] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40182] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40183] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40184] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40185] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40186] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40187] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40188] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40189] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40190] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40191] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40192] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40193] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40194] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40195] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40196] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40197] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40198] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40199] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40200] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40201] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40202] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40203] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40204] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40205] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40206] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40207] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40208] = "fixed-version: only affects 6.15 onwards"
+
 CVE_STATUS[CVE-2025-40300] = "cpe-stable-backport: Backported in 6.12.47"
 
 # CVE-2025-40325 needs backporting (fixed from 6.15)
-- 
2.39.2


