Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E402F46123
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:16 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18033.1774273868144884578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l/FzooF+;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50335b926c2so1297441cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273867; x=1774878667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85GlGDTaVdGs7KRfRfaBQTyAL/ykJpzr8NZfgQtBGMI=;
        b=l/FzooF+OBEumegpY8l4WRy+oiqBobrLEGe6qZTiTBZ4ilo/NJRV9neTj0CYG3z8Or
         EOoXFxwGwPh/chp6U39z8HKUxg9s571BRBfQwXKl+CsJ6Zc1BBjuEPk/NeICkvMCxOcc
         MQeQvMZmApDEIUa6+UK05VjUjxw5eHQSrocRupbXgjXGO76/Uo36r+qDwI71D9iTnsd6
         gXJlsyiV7l5NXr0PKP2CzWgjEJFhW3SIbZDaR6PMLUXbzkhkpcgL9IBN5CWlw66uA5qz
         SmCyk0aRXnYb3W2V5vhNw5JXdHuhqq4CrF2d20ygtqiy4RIm84fZnqEauSa/glBr//d2
         XGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273867; x=1774878667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85GlGDTaVdGs7KRfRfaBQTyAL/ykJpzr8NZfgQtBGMI=;
        b=f6rktSVkq2F5ruFY7BZ3XVppoPQpdwPu27Z/oP9R2Lmlvcgrs2hgaDCg/Diw3iHrqQ
         QBUE17fgygjCjughgCca5axee+oMYm+iUf3tkz6ahP6LvuhvMTGQWKHRpdPTzA4zEC7l
         cQg0eft78rYH0xNWY9G4uiNTDZBco0k+ea0YIlY1r10wYsypJsq/IIndmBAOeovFc9Nm
         CsLqi75GXmIs9aujFymycRjo/1I+8lfbyiiPSUkbKDHXLY5VjnyC8Aa2JZDzp4ebfQcR
         Bi8nE+T3EbIURPqIHcBVKjU94xrQ0mRAv5FdKmO7m7oXN1idMTYFZAqvHobfgn/uA/45
         W0JQ==
X-Gm-Message-State: AOJu0YzLTEUVBr0TsUrJBSxXGRg25F41DZ6XkihyoRQ+EdbQCGQUSQSF
	cMFlRkF9VM4U3+MDjDvBSyU/eCmFxP6sCvKsLPzoub5Z5Tv1a4V+Qawz
X-Gm-Gg: ATEYQzyOSn51cxRdbtpd2nHtkU7zY21arq16V/54vKHFLA/cSRFzZdDxDXeCg5hPCGl
	O7tOnQRYwaLXfx0b/kKeEfikNAfZrsLYlWJXPyOLrIHtu/lTiytt57sdB2xI9BRE32rMDbSVLdJ
	qKYK4YKH+obIRWVyYted7i1e0tYHX/ViOgbxo67BMDWz486hilrbylZfE7vCJ4dVnLuPCoOD7GD
	Wmtr3c4yjI67K5EdzRQ/G0q4yzPro7/rRmvAgFDzHd2u74CrIeV7saeRZqdj6IUN/mwO1k/0CeC
	EKgQVGzU9zLWxX9Cc0JxGEE52ojZbOfVxhXB/QYT4unI68tZNjjWQr7+U+EWBVNqv91IhYztj8L
	XPHRMvrjLWidpuK9Z8LVH1V8bgp6J4ygiv0CebxJOsLgq8xPKomzCKw8boJyfEwbzzKs6sN6KZ6
	Zwm0kowbmfcssZNdqEQcTWmsdYl/X9sOdWMzGkIGtUTgTvnrSJcgq1UnPtxacoF3Q72Bs+LWOkX
	X8vrrvonWaxhSa2SseqZbAZPpicDQ8IXLAYcwKoKOzsdscr7wpvkjlwghs=
X-Received: by 2002:a05:622a:1249:b0:509:1b76:e9b2 with SMTP id d75a77b69052e-50b37503075mr188345001cf.55.1774273867040;
        Mon, 23 Mar 2026 06:51:07 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:51:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 06/11] linux-yocto/6.18: update CVE exclusions (6.18.18)
Date: Mon, 23 Mar 2026 09:50:52 -0400
Message-ID: <20260323135057.1605923-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233725

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 9 changes (3 new | 6 updated): - 3 new CVEs: CVE-2026-21570, CVE-2026-25769, CVE-2026-25770 - 6 updated CVEs: CVE-2025-0665, CVE-2025-61662, CVE-2026-25534, CVE-2026-32290, CVE-2026-32292, CVE-2026-32293
        Date: Tue, 17 Mar 2026 18:05:17 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index e8173c4c9f..e6df676ae7 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-03-09 16:24:50.284184+00:00 for kernel version 6.18.16
-# From linux_kernel_cves cve_2026-03-09_1500Z-2-g02517aa779f
+# Generated at 2026-03-17 18:38:31.921355+00:00 for kernel version 6.18.18
+# From linux_kernel_cves cve_2026-03-17_1700Z-2-g05851354eaa
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.16"
+    this_version = "6.18.18"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20420,6 +20420,8 @@ CVE_STATUS[CVE-2025-71237] = "cpe-stable-backport: Backported in 6.18.11"
 
 CVE_STATUS[CVE-2025-71238] = "cpe-stable-backport: Backported in 6.18.13"
 
+CVE_STATUS[CVE-2025-71239] = "cpe-stable-backport: Backported in 6.18.16"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.18.6"
@@ -20946,3 +20948,9 @@ CVE_STATUS[CVE-2026-23237] = "cpe-stable-backport: Backported in 6.18.13"
 
 CVE_STATUS[CVE-2026-23238] = "cpe-stable-backport: Backported in 6.18.13"
 
+CVE_STATUS[CVE-2026-23239] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2026-23240] = "cpe-stable-backport: Backported in 6.18.16"
+
+CVE_STATUS[CVE-2026-23241] = "cpe-stable-backport: Backported in 6.18.16"
+
-- 
2.43.0


