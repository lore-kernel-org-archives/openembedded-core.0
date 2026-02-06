Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216CFEE6B53
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:27:41 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18.1770409659108402095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VrAl8XOz;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50145d27b4cso28878921cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409658; x=1771014458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fzNKbiJ2i8rAcGkg2C7Sj3Qoic3ehnQdXGeDwPHFWo=;
        b=VrAl8XOzscAjYf6VBVFumyKxMoOBeS5d6gxPhqEEuJKnhrxanDF5OhnYqWd8hWOCmL
         JfCIYwSBQ13nL/l5091NvQ9lnE5A9/o+FTSTpfve0idPOXBptaU1RdhHEqlDQJvC0/ki
         YGGJ40gWpg1wUw3VS73IWxNl3+LWINabi5MLg+HETHYA75Ic6aBePkdc4SmwbMe1mi2v
         ce9oxD9aUP3p2RlkLClZ9fiG1qHDQ8EUv3Om1/jo476gN9MM136PQT9algU2e+e9+mmx
         lm6DX4J5UI84Fdi4yaC+Wns4Z2uwcCqAPCfprSeY4sqloLyDmKU5dHYL+Tsl/pkGsUNU
         Q49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409658; x=1771014458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fzNKbiJ2i8rAcGkg2C7Sj3Qoic3ehnQdXGeDwPHFWo=;
        b=QU/nqTKEKVKuVibJOuq4P1moLxq0GJmSO/Jtk1dVf7Vk/av/SfnGOvj6WTgm9ng4IU
         aCLEvxAoL+ltWp00JHSqYI5NPuMHZ+FLBdzRiwIgzfFTIUGvKktW/LlVVL1bb53E6QG6
         PGGTp29EYeoNyEdGpkbGt5VLSe/J8ZA/jvxVsNyZlyZsVV2WcrQCek2CjR+z8k4K8mto
         4annMS891xPe8mBfXu3zqMoy+ZDMVfkg8O5r4VTPrs+hdg3m/mSd6FXxhHs9Mt4lmRD9
         B/2H6J85DgcDgCN8lHr27uiU0myilSV5bPP1pqJTsgs2cimDZ76B/6ez+2uOwoJRe25U
         G7jQ==
X-Gm-Message-State: AOJu0Yw0aJaLltukP7YFkND5eFFYAa5EtHhwbs859r0+Ur++IL571267
	1rS8MKSAZ+PogTvHlBxRDXH/K8DX+O2NwAXXYYzYZww5dexUuCTJu8Wgv8ciMK7u
X-Gm-Gg: AZuq6aLe1mJZxbag+hjd/PG28xRXJuiroKWfyN20sQRNoRMXT2gwy2wdBjbkQKUu7SB
	nrHFCt7DMOshHh+AHhXNcicM6ErzHIIDMIHfEbxNMWAFdF3yedMohyjEgqqbajP6jexnnuXrUkp
	Ra3Oj89/ac10+cZBpgVnM0WdzXGzOOy+oK5svqMika56Bywn0HH+E02VLxzr0eQV4htadvCkj0Q
	cT7VPZHBE3DdrYTXBXw1XRT2x9LU6KXKKKZIYw3BBhgdJsu5GFTzlbh3tFVzp3uyM/gzz8qRbYe
	16Ab7DttTodGuUxllrtTFparzwXMoK6PJscSP0kI/v898tiyWItuFX7pU7vVtdYWeMDkvXgxRSA
	XyUqJvOh86wxqivmCD1VA540olqP9GPY0CIyKbyWdG67mQFU/d/vL6/X6VuIidmYUaUf9t7s2JC
	ehd3JSXRLDXkDwewSyy+dqtQdIu+FvSkcu0qhCQYPz9K2t2ELDsRk6LnQv1HVEF4DQd6hoyJdtn
	QIwBiGk4AIiXNYGRpy4R8vGj3+S26wzbtATI0gjLw1ALNc=
X-Received: by 2002:ac8:5f0d:0:b0:4ee:18e7:c4de with SMTP id d75a77b69052e-506399e27e8mr58484761cf.78.1770409657993;
        Fri, 06 Feb 2026 12:27:37 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/09] linux-yocto/6.12: update CVE exclusions (6.12.67)
Date: Fri,  6 Feb 2026 15:27:20 -0500
Message-ID: <20260206202732.1080699-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230646

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (0 new | 4 updated): - 0 new CVEs: - 4 updated CVEs: CVE-2025-71178, CVE-2026-0925, CVE-2026-24435, CVE-2026-24439
        Date: Mon, 26 Jan 2026 19:55:24 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 126 ++++++++++++++++--
 1 file changed, 118 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 52ab4eb807..9dcbf53ae1 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-01-22 16:37:18.329435+00:00 for kernel version 6.12.66
-# From linux_kernel_cves cve_2026-01-22_1600Z-1-g55b49f6e4ba
+# Generated at 2026-01-26 19:56:55.495453+00:00 for kernel version 6.12.67
+# From linux_kernel_cves cve_2026-01-26_1900Z-4-gac26e21104f
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.66"
+    this_version = "6.12.67"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -17198,7 +17198,7 @@ CVE_STATUS[CVE-2025-38246] = "cpe-stable-backport: Backported in 6.12.36"
 
 CVE_STATUS[CVE-2025-38247] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-38248 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38248] = "cpe-stable-backport: Backported in 6.12.67"
 
 CVE_STATUS[CVE-2025-38249] = "cpe-stable-backport: Backported in 6.12.36"
 
@@ -17882,7 +17882,7 @@ CVE_STATUS[CVE-2025-38589] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-38590] = "cpe-stable-backport: Backported in 6.12.42"
 
-# CVE-2025-38591 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38591] = "cpe-stable-backport: Backported in 6.12.67"
 
 CVE_STATUS[CVE-2025-38592] = "fixed-version: only affects 6.15 onwards"
 
@@ -19482,9 +19482,9 @@ CVE_STATUS[CVE-2025-40332] = "cpe-stable-backport: Backported in 6.12.58"
 
 CVE_STATUS[CVE-2025-40333] = "cpe-stable-backport: Backported in 6.12.58"
 
-# CVE-2025-40334 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40334] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-40335 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40335] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-40336] = "fixed-version: only affects 6.15 onwards"
 
@@ -19600,7 +19600,7 @@ CVE_STATUS[CVE-2025-68194] = "cpe-stable-backport: Backported in 6.12.58"
 
 # CVE-2025-68195 has no known resolution
 
-# CVE-2025-68196 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68196] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2025-68197] = "fixed-version: only affects 6.13 onwards"
 
@@ -20300,7 +20300,117 @@ CVE_STATUS[CVE-2025-71143] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-71144] = "cpe-stable-backport: Backported in 6.12.65"
 
+# CVE-2025-71145 has no known resolution
+
+CVE_STATUS[CVE-2025-71146] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71147] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71148] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71149] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71150] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71151] = "cpe-stable-backport: Backported in 6.12.64"
+
+# CVE-2025-71152 needs backporting (fixed from 6.19rc4)
+
+CVE_STATUS[CVE-2025-71153] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71154] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71155] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-71156] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71157] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-71158] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-71159] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-71160] = "cpe-stable-backport: Backported in 6.12.66"
+
+# CVE-2025-71161 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-71162] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2025-71163] = "cpe-stable-backport: Backported in 6.12.67"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.12.66"
 
+CVE_STATUS[CVE-2026-22978] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22979] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22980] = "cpe-stable-backport: Backported in 6.12.66"
+
+# CVE-2026-22981 needs backporting (fixed from 6.19rc5)
+
+CVE_STATUS[CVE-2026-22982] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22983] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-22984] = "cpe-stable-backport: Backported in 6.12.66"
+
+# CVE-2026-22985 needs backporting (fixed from 6.19rc5)
+
+# CVE-2026-22986 needs backporting (fixed from 6.19rc5)
+
+CVE_STATUS[CVE-2026-22987] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-22988] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22989] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22990] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22991] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22992] = "cpe-stable-backport: Backported in 6.12.66"
+
+# CVE-2026-22993 needs backporting (fixed from 6.19rc5)
+
+CVE_STATUS[CVE-2026-22994] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22995] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-22996] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-22997] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-22998] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-22999] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23000] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23001] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23002] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23003] = "cpe-stable-backport: Backported in 6.12.67"
+
+# CVE-2026-23004 needs backporting (fixed from 6.19rc6)
+
+CVE_STATUS[CVE-2026-23005] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23006] = "cpe-stable-backport: Backported in 6.12.67"
+
+# CVE-2026-23007 needs backporting (fixed from 6.19rc6)
+
+CVE_STATUS[CVE-2026-23008] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23009] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-23010] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23011] = "cpe-stable-backport: Backported in 6.12.67"
+
+CVE_STATUS[CVE-2026-23012] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-23013] = "cpe-stable-backport: Backported in 6.12.67"
+
-- 
2.43.0


