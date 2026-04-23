Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E564FC0371
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:23 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.760.1776959117664892764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U3F6+6nV;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50d6ab4476eso66678431cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959117; x=1777563917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8PT5RIl3u0/DfOU8FQjySVM06upXMSsW7Hdcec0z0Q=;
        b=U3F6+6nV+ue7sezZy8HG5jTxPo2Muk9clgqk6ZOylobWwc61UfpVGcQh5M0uW/vfTR
         9XpWFhpmdPD64zrpxr9wX4ZXv22DebTdJKLExGyitYeuGFGM5IHFwMmM5vAc5b5VEiHZ
         ZUbXBINYkq2a5MzKCOrMYmhL5vJqewTrKmVEjZj/45JzXkrQBAbczofR5fOozN7bsgwF
         yvc3yprrZBVu1bP6mMcyLujfpWmwvxk3vfGyFeOU8mLc8ZTa1AC7ioHzukRd0YnXuej4
         7PVUqVCDKm4LH5hrwyBwQ82xvV9zI1Z+rStTd0g6F0MaMM7KXSAQA4lQWsxrxjaeoxtL
         mf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959117; x=1777563917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G8PT5RIl3u0/DfOU8FQjySVM06upXMSsW7Hdcec0z0Q=;
        b=D07C6qKZKM+5RXGG0LIa3xmdVcNIOn5gToRrKfgrq0AqD/0pLYYDwmOYLW17+GLm7f
         khsB/rpKENxpOcmBOHpjmsWUEKkhcdlGV2NEwoOZPOz7iR8RB7WKHswojWBtRBIgC/Dk
         Zm7JD4NFZuC68sD2BZtZH5beGXf0YIXDwpjZ1Q4u5LiS56bdePIpbXeGcMgLPIRreQrW
         MQKYHJeC49sSj/ld1gE9U3WdEqpiZxD29hqpQqVslgFww3CpA75oMhMV/VdkhsrCVbO8
         OmYSOyZ7Z8IOmUaG7TgJPAuXsuzPqc4ezbB9qN7UnkG6ickaoZlZVc1S7E9ydRm2LAvM
         q3Aw==
X-Gm-Message-State: AOJu0YzXmGpl99d1CcJznOWUOCfkwX5MHWInbdGdSlyRmzhVlpeUaCvP
	E+aDzlDVhFOne2iGtGb2677uELeYqb/x5Xy2hCOir4a1q1bqtMIaS4EPno3RcNNG
X-Gm-Gg: AeBDieuvSKByWvIyFSCbiP+4NsK2NbA/pC7NP+2lAtk4LTpug0XWpavYjXRG3yBiVd9
	HziaetmJeIQ4iC4HY9WfI8N5o3IIrE6khWCjlnDwcuc9uhc3LlFkaN2qBKTbiHqLLF/kpJLN5tS
	2GIbhA5kt8LagDIuC1NPZFt45hr/FFwk+POAzsLGCV9nCX6pDm2AgEsWKivhLfd7ApeAQY3Hb1S
	enA3ToyVnIaogBqBK1HDwUq1ZaNLwQbeqJurAPNWXKbboRgfh9VjMTbxpOJi9F5JvBYgCIa1r0W
	NrWZwcOML00v1ID3I9Xg0PViGIZhQ4rrwGnTWEhlarjXwsxO+jBVgLCywyyk9BwNpqz5V8En4J6
	q9hum2wVsiKijhf+hHfrL+j00Yy2zk82ex3/R8mnqeY0hJ+ldcCCKMDxRv8rLwf9K5ffa6d2suV
	h76dfUm8R9o4Ja2i78iWud4Jjp4UDILY2pYzBUWHfETRBg4LXNmYEHi8jslF4t55YMPDSOLoAeK
	K6kneU+QHUUsN62QYLcfZww+JA0ejaKhEXwoM9Q0yDnAVnYRRKMyBKbf7NC17IDCfnh1g==
X-Received: by 2002:ac8:5f4d:0:b0:50f:135e:d68 with SMTP id d75a77b69052e-50f135e1259mr237515961cf.58.1776959116198;
        Thu, 23 Apr 2026 08:45:16 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:15 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 04/18] linux-yocto/6.12: update CVE exclusions (6.12.73)
Date: Thu, 23 Apr 2026 11:44:55 -0400
Message-ID: <20260423154509.1933646-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235804

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 9 changes (3 new | 6 updated): - 3 new CVEs: CVE-2026-0874, CVE-2026-0875, CVE-2026-23491 - 6 updated CVEs: CVE-2025-13601, CVE-2025-70062, CVE-2025-70063, CVE-2025-7195, CVE-2026-25500, CVE-2026-2661
        Date: Wed, 18 Feb 2026 19:58:22 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 72 ++++++++++++++++++-
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 089446fe87..92a12f2c1f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-02-16 17:20:15.768713+00:00 for kernel version 6.12.72
-# From linux_kernel_cves cve_2026-02-16_1600Z-3-gf0e5d9ffdc0
+# Generated at 2026-02-18 20:12:59.836870+00:00 for kernel version 6.12.73
+# From linux_kernel_cves cve_2026-02-18_1900Z-2-ge0bc67e5ce4
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.72"
+    this_version = "6.12.73"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20394,6 +20394,32 @@ CVE_STATUS[CVE-2025-71223] = "cpe-stable-backport: Backported in 6.12.70"
 
 CVE_STATUS[CVE-2025-71224] = "cpe-stable-backport: Backported in 6.12.70"
 
+CVE_STATUS[CVE-2025-71225] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2025-71226 needs backporting (fixed from 6.19)
+
+# CVE-2025-71227 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2025-71228] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2025-71229 has no known resolution
+
+# CVE-2025-71230 has no known resolution
+
+# CVE-2025-71231 has no known resolution
+
+# CVE-2025-71232 has no known resolution
+
+# CVE-2025-71233 has no known resolution
+
+# CVE-2025-71234 has no known resolution
+
+# CVE-2025-71235 has no known resolution
+
+# CVE-2025-71236 has no known resolution
+
+# CVE-2025-71237 has no known resolution
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.12.66"
@@ -20864,3 +20890,43 @@ CVE_STATUS[CVE-2026-23209] = "cpe-stable-backport: Backported in 6.12.70"
 
 # CVE-2026-23210 needs backporting (fixed from 6.19)
 
+CVE_STATUS[CVE-2026-23211] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23212] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23213] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23214] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23215] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23216] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2026-23217 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2026-23218] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23219] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2026-23220 has no known resolution
+
+# CVE-2026-23221 has no known resolution
+
+# CVE-2026-23222 has no known resolution
+
+# CVE-2026-23223 has no known resolution
+
+# CVE-2026-23224 has no known resolution
+
+# CVE-2026-23225 has no known resolution
+
+# CVE-2026-23226 has no known resolution
+
+# CVE-2026-23227 has no known resolution
+
+# CVE-2026-23228 has no known resolution
+
+# CVE-2026-23229 has no known resolution
+
+# CVE-2026-23230 has no known resolution
+
-- 
2.43.0


