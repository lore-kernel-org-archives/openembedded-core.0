Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E942AD13C32
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:24:07 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22093.1769441044131734016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PUnez7r7;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c07bc2ad13so308866385a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441043; x=1770045843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT7wOQRE77lJm4m8EAA3XNlops+KR4IHjz6TEVvAQaU=;
        b=PUnez7r74/a+VQVn5ZJ6RcKEbwJti0Ii56zfNqfFvohGSbQy4iXt9vZmGzMwema6zH
         tOigyFvWo/w1FROmyLXGHZ/Gj/74rpHG8bzSjIqnJ5jZKrNReey2iuYN4yb4IvSX/LuU
         qdqQqldNuOfQJl4nrXijTSL88V8gTxz4YWQrSfB0QLcwG2rKxk8HV+AAuiIrlXnZ9z81
         +BJpE70WSVogW+GSyqtj4lTYHitj8nsLB34KcGHPY7bswmWgYb6bLSFmjxjGbyH3uLZ3
         iB8M06fBiTPJ3uv8mce3PNAuffwFM7HkiShjW5w8xPyPwkeuiYa7sVZmXG/6zkMinZqH
         wFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441043; x=1770045843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wT7wOQRE77lJm4m8EAA3XNlops+KR4IHjz6TEVvAQaU=;
        b=ppveTWKi8w8ap9N+h49k0jz65Qj8YRG5M7ZP2KceuIXqnHsQ98eX3pIKwdPr2ptwM+
         qcu7QN8ZN9XhNyNz7SkTJT2ipPiRvlVaZWZKbIcoLlMqVUefpuv8pQ8CiPJGowpVet5Z
         dr+Fl4uKlcmIyIDzeHRerYx8X8SCPPyCqrgEGf+9wETRdeBTTQwuNThrFXnosIVF2gPS
         YnjzGHnxVE9PLCZl9e2O8QBtSNsvAemVi8xQY/gZwTe86bFTSEzO0JKGq3APzqHfH3ET
         yoZXIdyJxOhu91y5iLti6/GtUB3RZtFIXsydZKwN1JJog/H69TMeDvh/ry8UFUd15FSq
         /dtg==
X-Gm-Message-State: AOJu0Yyf6EUUPW//9kE0tNOAkdOGU03GdQNr/VUeya5zGkwTSadugdjW
	hmnrbtAVkmK+aqV0mtT8kujK3rzZ0sEkYnP9iT0eol3Sh5pfCI8n9/30Z8VQW4ZSlVU=
X-Gm-Gg: AZuq6aJ4Nf5vMSuGlr6pUftM7sbf6mcdtGddx16+6nc/Qb1kty1QqPM/c6itnspm0oL
	8dn+VI/kFzdn+bGvQU5EYYPObTL2S0IAJHek97MB4DltY+UlSdM9onad8p+iomKxQRhAYkcDlL4
	oksf5S75eW+9HHZklhnQqOegXxggfvedm+K5vLW/yWWd8yTQZEv+smAgVR3IUME3FUtnticwf98
	bbP+n4nkWmcYzAm8OT56Pez3LNpThLU/GEhbKTHfOWKjOAOpthyNXzzBKqw7VRHGbZmHpJGf58y
	5tNp6Yykl22wfkJgO605sscV4R3IFx2SH4Y+5oSk2oNuLid+NybKgB8FkSPxNHEmSmo6Jx89xnp
	qB2eDNl0e6HumMGHxwt9ujkQ9mZ5Q/vdwabzlfjDxrFfDqCnDTjudS68xRW1VMPj4LxaDakYSp5
	CVJR3cLu/j01tS3XVdfkP1KNRRGrYKH2elsRoTZErG1kobJ2ygUgLM6YHQpFzOGElOOjkxI1Yun
	RHtMzC5H4nH9kXsmN2j4JCzTg==
X-Received: by 2002:a05:620a:7001:b0:8c6:adfc:48fe with SMTP id af79cd13be357-8c6f9584da5mr480085685a.23.1769441042926;
        Mon, 26 Jan 2026 07:24:02 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm1044157185a.51.2026.01.26.07.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:24:02 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 06/07] linux-yocto/6.18: update CVE exclusions (6.18.6)
Date: Mon, 26 Jan 2026 10:23:52 -0500
Message-ID: <20260126152353.2328046-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
References: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230017

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 14 changes (0 new | 14 updated): - 0 new CVEs: - 14 updated CVEs: CVE-2024-23147, CVE-2024-23148, CVE-2024-23156, CVE-2024-23157, CVE-2024-37000, CVE-2024-37006, CVE-2025-13335, CVE-2025-63896, CVE-2025-9452, CVE-2025-9456, CVE-2025-9457, CVE-2025-9458, CVE-2026-1225, CVE-2026-1332
        Date: Thu, 22 Jan 2026 14:20:53 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 286 +++++++++++++++++-
 1 file changed, 283 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 708c5a8506..38f260d231 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-01-12 16:52:57.037978+00:00 for kernel version 6.18.5
-# From linux_kernel_cves cve_2026-01-12_1600Z-2-g6b70380b71e
+# Generated at 2026-01-22 14:32:14.186712+00:00 for kernel version 6.18.6
+# From linux_kernel_cves cve_2026-01-22_1400Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.5"
+    this_version = "6.18.6"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20024,3 +20024,283 @@ CVE_STATUS[CVE-2025-68765] = "cpe-stable-backport: Backported in 6.18.2"
 
 CVE_STATUS[CVE-2025-68766] = "cpe-stable-backport: Backported in 6.18.2"
 
+CVE_STATUS[CVE-2025-68767] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68768] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68769] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68770] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68771] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68772] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68773] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68774] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68775] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68776] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68777] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68778] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68779] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68780] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68781] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68782] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68783] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68784] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68785] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68786] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68787] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68788] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68789] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68790] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68791] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68792] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68793] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68794] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68795] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68796] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68797] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68798] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68799] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68800] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68801] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68802] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68803] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68804] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68805] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68806] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68807] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68808] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68809] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68810] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68811] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68812] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68813] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68814] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68815] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68816] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68817] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68818] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68819] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68820] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68821] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68822] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-68823] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71064] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71065] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71066] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71067] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71068] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71069] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71070] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71071] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71072] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71073] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71074] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71075] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71076] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71077] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71078] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71079] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71080] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71081] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71082] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71083] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71084] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71085] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71086] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71087] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71088] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71089] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71090] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71091] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71092] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71093] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71094] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71095] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71096] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71097] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71098] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71099] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71100] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71101] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71102] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71103] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71104] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71105] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71106] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71107] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71108] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71109] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71110] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71111] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71112] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71113] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71114] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71115] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71116] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71117] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71118] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71119] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71120] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71121] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71122] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71123] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71124] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71125] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71126] = "cpe-stable-backport: Backported in 6.18.3"
+
+CVE_STATUS[CVE-2025-71127] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71128] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71129] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71130] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71131] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71132] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71133] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71134] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71135] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71136] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71137] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71138] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71139] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71140] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71141] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71142] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71143] = "cpe-stable-backport: Backported in 6.18.4"
+
+CVE_STATUS[CVE-2025-71144] = "cpe-stable-backport: Backported in 6.18.5"
+
+CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.18.6"
+
+CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.18.6"
+
-- 
2.43.0


