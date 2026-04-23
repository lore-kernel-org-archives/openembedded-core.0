Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D576FC036C
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:23 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.758.1776959115103682485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tK4s32S0;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506a7bbe9d0so57358361cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959114; x=1777563914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwAPokX0WIMnzGCRD4QVnd0tdfZyul39/vNJscsgxXE=;
        b=tK4s32S04uIhuNZTxcxHhFBFalnpZGYCH1VI5rjozKNaWb+NBFhnXrPLqKQVGMHNVR
         RS1EkTsGp3+gGLGVywZaQd4O+DRC2Hv9o3lzV5KIgGjO6KD2ikrthe8Ri31OnlvTxChz
         1XocpHf07R+0LwySIzoYTM7CxdELAsvLV2MBFzjvx/BHzGJT5HxybbU5yWwd+6PLZv+K
         wxs94/JZLcUjBiiNS09SoEBUk2zJv/exDAco+0Z3CWDq2BDmXpVaFK97sTdHaXgh+it9
         2ra5zB9ke8liDQUglGABTrUizf0zekgcxv5vY84Ktpwe11iXZOMDRYfW6ruIdV/FskTc
         h3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959114; x=1777563914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwAPokX0WIMnzGCRD4QVnd0tdfZyul39/vNJscsgxXE=;
        b=TTtnTxAvUTu3aVoYWNs36BLKY9oHvxTK+z0rFxOeeXJ78xwK5sfWCUwQMLHPBaX6fY
         fE72HT6ZrSSLC1SromXoog0SCE46IMXpUelnJQsFIrS7hMGizpWjk2HmLskpcNuhKDJ/
         qOF1tmadn1tpEIZr+ypw3tHcFq9j1OXbJ8BcFtLDYuvmz5q863ux76tCc6BQa8BF2deh
         aYDemrThixdxZkLRQUmtgQANR5l42Vf6/uD2QgFomqUIvm67MpMQe3PDjRmN6YzgeZkL
         zpXqO9oCtCLH+h27VjAEJWtIHDJn2hrTyWWHbB5XZnE+j9zmMSgQ+bXyQodZ70/Dojn1
         Ir3w==
X-Gm-Message-State: AOJu0YxUZctxWUN3uTvsxx/ghOHUcMN06YG1mfLdD0wPuAdDzuXoSS0k
	ex6POfws1Tsr6oBMe40v/O/ByBtzBGwcLPIgDSe9npAmcT17JhgO9ul8Bd+X2yJm
X-Gm-Gg: AeBDiesuouR90T3L2M29yFWULxh2oRtsScubKbG6vSvjrpcutFVeFkxhdGjhr8jAa82
	gyN3KE9Q05Ipv8C/dZyxDqjDNnxUWRgzXPvauTYdBwRXscN7k/qTNsobsP13SwXVdBLueG168OU
	lShAXdz0rpf4PaFsrp3R5WgYtTAMZuEajZwb6c2M9p1/JPTp5XFhT3u3S5V2Dyc6Z4Yh+MjIyZo
	OORlaTIbSMmwCrzEs+NWg6A8E2wMkv21v3wXijr9j4phfiL3mhVMtk67+d/xXTILxcM2S0uYrzH
	9EMZ/szYUi43NzcKuemJlBd0Wa0jZ5UOLFJiV1Z45XvV73G52O7qkaZxEiuce+/u2Wgh7Aas2YQ
	/rAu20tX+RJ14O7BrGAOZx6xCFBUAfmh5h2vfF2gEtIHwPih0Oh7YFjOGy3Yav9SPUhbg0O4JoF
	s5LNmPB2c2sNRqIv5B4/bnAwx79C7S8/e/XH+wY4v7RS+4/iHoNFKdW7gAdkDb5DMm6qnnvrJqn
	HUV24FlLAd/Ygf1N8eZSRyJM023Mq4mahSWTPpi3bx+TVTzOyXSuDj5sRs37zFLWYMmAw==
X-Received: by 2002:a05:622a:d19:b0:50d:b164:5e40 with SMTP id d75a77b69052e-50e42a2fe3cmr276449151cf.37.1776959113702;
        Thu, 23 Apr 2026 08:45:13 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 02/18] linux-yocto/6.12: update CVE exclusions (6.12.72)
Date: Thu, 23 Apr 2026 11:44:53 -0400
Message-ID: <20260423154509.1933646-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235802

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (0 new | 1 updated): - 0 new CVEs: - 1 updated CVEs: CVE-2025-7195
        Date: Mon, 16 Feb 2026 17:05:40 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 232 +++++++++++++++++-
 1 file changed, 225 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 64477c364e..089446fe87 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-02-10 02:33:33.917945+00:00 for kernel version 6.12.69
-# From linux_kernel_cves cve_2026-02-10_0100Z
+# Generated at 2026-02-16 17:20:15.768713+00:00 for kernel version 6.12.72
+# From linux_kernel_cves cve_2026-02-16_1600Z-3-gf0e5d9ffdc0
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.69"
+    this_version = "6.12.72"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -18980,7 +18980,7 @@ CVE_STATUS[CVE-2025-40080] = "cpe-stable-backport: Backported in 6.12.53"
 
 CVE_STATUS[CVE-2025-40081] = "cpe-stable-backport: Backported in 6.12.53"
 
-CVE_STATUS[CVE-2025-40082] = "fixed-version: only affects 6.17 onwards"
+CVE_STATUS[CVE-2025-40082] = "cpe-stable-backport: Backported in 6.12.70"
 
 CVE_STATUS[CVE-2025-40083] = "cpe-stable-backport: Backported in 6.12.57"
 
@@ -20066,8 +20066,6 @@ CVE_STATUS[CVE-2025-68787] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-68788] = "cpe-stable-backport: Backported in 6.12.64"
 
-CVE_STATUS[CVE-2025-68789] = "cpe-stable-backport: Backported in 6.12.64"
-
 CVE_STATUS[CVE-2025-68790] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2025-68791] = "fixed-version: only affects 6.14 onwards"
@@ -20134,7 +20132,7 @@ CVE_STATUS[CVE-2025-68821] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-68822] = "cpe-stable-backport: Backported in 6.12.64"
 
-# CVE-2025-68823 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-68823] = "cpe-stable-backport: Backported in 6.12.70"
 
 CVE_STATUS[CVE-2025-71064] = "cpe-stable-backport: Backported in 6.12.64"
 
@@ -20376,6 +20374,26 @@ CVE_STATUS[CVE-2025-71198] = "cpe-stable-backport: Backported in 6.12.68"
 
 CVE_STATUS[CVE-2025-71199] = "cpe-stable-backport: Backported in 6.12.68"
 
+CVE_STATUS[CVE-2025-71200] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2025-71201] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2025-71202 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2025-71203] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2025-71204] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2025-71220] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2025-71221 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2025-71222] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2025-71223] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2025-71224] = "cpe-stable-backport: Backported in 6.12.70"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.12.66"
@@ -20646,3 +20664,203 @@ CVE_STATUS[CVE-2026-23109] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-23110] = "cpe-stable-backport: Backported in 6.12.68"
 
+CVE_STATUS[CVE-2026-23111] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23112] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23113] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23114] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23115] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-23116] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23117] = "fixed-version: only affects 6.18.2 onwards"
+
+CVE_STATUS[CVE-2026-23118] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23119] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23120] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23121] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23122] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23123] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23124] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23125] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23126] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23127] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23128] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23129] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23130] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23131] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23132] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23133] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23134] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23135] = "cpe-stable-backport: Backported in 6.12.68"
+
+CVE_STATUS[CVE-2026-23136] = "cpe-stable-backport: Backported in 6.12.66"
+
+# CVE-2026-23137 needs backporting (fixed from 6.19)
+
+# CVE-2026-23138 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2026-23139] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-23140] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-23141] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23142] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23143] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-23144] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23145] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23146] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23147] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-23148] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23149] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23150] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23151] = "cpe-stable-backport: Backported in 6.12.69"
+
+# CVE-2026-23152 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2026-23153] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23154] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23155] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23156] = "cpe-stable-backport: Backported in 6.12.69"
+
+# CVE-2026-23157 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2026-23158] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23159] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23160] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23161] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23162] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23163] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23164] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23165] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23166] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23167] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23168] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23169] = "cpe-stable-backport: Backported in 6.12.72"
+
+CVE_STATUS[CVE-2026-23170] = "cpe-stable-backport: Backported in 6.12.69"
+
+# CVE-2026-23171 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2026-23172] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23173] = "cpe-stable-backport: Backported in 6.12.69"
+
+CVE_STATUS[CVE-2026-23174] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23175] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23176] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23177] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23178] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23179] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23180] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23181] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-23182] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23183] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23184] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23185] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23186] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-23187] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23188] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23189] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23190] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23191] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23192] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-23193] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23194] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-23195] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23196] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-23197] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-23198] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23199] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23200] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23201] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23202] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23203] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23204] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23205] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23206] = "cpe-stable-backport: Backported in 6.12.70"
+
+CVE_STATUS[CVE-2026-23207] = "fixed-version: only affects 6.18.2 onwards"
+
+# CVE-2026-23208 needs backporting (fixed from 6.19)
+
+CVE_STATUS[CVE-2026-23209] = "cpe-stable-backport: Backported in 6.12.70"
+
+# CVE-2026-23210 needs backporting (fixed from 6.19)
+
-- 
2.43.0


