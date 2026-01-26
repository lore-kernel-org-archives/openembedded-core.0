Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06923D13C3C
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:24:08 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22089.1769441041633094487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UsD3GO2g;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88a3d2f3299so50599976d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441041; x=1770045841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxWwkxiiaG1A/qA1KniTckI+8LwcF57R+MdRdOOr93E=;
        b=UsD3GO2gL/kRg3SKegkEJehfUtYYpo5ehPdeqiFaS8eenXBEU700PBcg3IL7U0tBVk
         1l4xKcirhQG+Tr0TNVpTVNzhHSlycT/Kt8byOyjQgU69sYM3Imm1knza+jqm0V3OFYK6
         /XoyQkdpGL3xoUof+v6QGFtQec8bTP4ONg1NjDWULMGTxSXSQAD+p9oIqz1WlFMSf+78
         +aDaXojeZKjgAWFwP6pY+gLEwuIcYhDVS0CPueRsflHtp2vN7rnpnbMHagK3eRz2Myrs
         A7+fY4HzjNTEi7C9cWO9kGcfm1HiNGwE4YyQysFQHeknFq15qY+ubSeByQhyWyOjJxbv
         nDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441041; x=1770045841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bxWwkxiiaG1A/qA1KniTckI+8LwcF57R+MdRdOOr93E=;
        b=G9gHCqUtPNQ3Wo6JYQqrpFP08iUYCnUIHHkaSE9eCcyoGmNJMPRDAijfc0U5WLNJ59
         iSnjzzgigsnFQitkNBa6HkEMKTNf1bCLShGRjFsQpzrgxUwVskWo2kBvezekgFfK7Y8D
         8L77qkKE7T7cTUnqfIYijfW8ZonfLui7lNay+3OjoDC/UTK5LwIqMgEPVROKBFzWbkW8
         CSr0DwaBX/etqY1UFEEMjNF9f5weqD9k90v856ze+1q1geFVVi25UtlqSu3Fs5jUIZ2/
         2Mr6p8H67J821BuuGmuzVjIiBPbjDACRPzg5eLzXOol+/rMfTH4+D1We+7vEKuZJHXWk
         lSnQ==
X-Gm-Message-State: AOJu0YxzMERQ1Ub2m3ydaSmquxf6/4WJeE+VlZIxGAqUv1SFvV4SQf4r
	qgSn0EgzZNYkLO3JnuaiV+u3V6uuIcA4BmSnGAZRZ1c/XfEjFlSp1j9BLTB7abkiwHo=
X-Gm-Gg: AZuq6aLqb1p1f5WHqIupF/zhABX3kX1+r3XWUvaHwtGiNdKqcMorYoxNYcGXo1+a+sq
	3xKj12A+jAz6hHn/fg38RWBu8/bKb5u22fONKTmA+jrMV7vLsoPwt34irNcRlVZzUMH69IHx+IS
	+frC7Jl4xD0oTtFMRJALkP2YOoRV4VqWssXYIuBfgo0GyZuwY5XGHpOHdIOgrUW9O/BrDQlx0QU
	PfQdXrtm6p3NYYnODANq2ZupCRePI03IBpJzd5NTjnhu+KpFUXpfipN2sc0UkY7dtkfvLJqsjk7
	kOegj4YKwIkH5UUdfzr7mLjSTDjECf2d+OAZMNWUsKXrRRRps9f8JmnCCU1eizMm4QzJirkxKPV
	j/Nfafn8mYVNINpOMFoNic7rC2eJQul15nFLEir3l+n8rN7fWeM9V5b0Vvx2TZ1iE0nnOBwQWn5
	lVY0pVEt0pnlHIHmMVqoT25cmCpykpaXWkjfnzr6t3nF5cv8vTyr1nb98I2RNx9IxZn4u/5L3Vm
	i4It0mGwu6UW1l0QR/1+MU8mQ==
X-Received: by 2002:a05:620a:372a:b0:8b2:e704:5626 with SMTP id af79cd13be357-8c6f95e0ea5mr591127585a.38.1769441040535;
        Mon, 26 Jan 2026 07:24:00 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3870c48sm1044157185a.51.2026.01.26.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:24:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 04/07] linux-yocto/6.12: update CVE exclusions (6.12.66)
Date: Mon, 26 Jan 2026 10:23:50 -0500
Message-ID: <20260126152353.2328046-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
References: <20260126152353.2328046-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230014

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 10 changes (5 new | 5 updated): - 5 new CVEs: CVE-2026-22278, CVE-2026-23761, CVE-2026-23762, CVE-2026-23763, CVE-2026-23764 - 5 updated CVEs: CVE-2021-47746, CVE-2021-47748, CVE-2025-64097, CVE-2025-69821, CVE-2026-1328
        Date: Thu, 22 Jan 2026 16:23:30 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc               | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 6ab3bd2bb3..52ab4eb807 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-01-16 00:43:33.551663+00:00 for kernel version 6.12.65
-# From linux_kernel_cves 2026-01-16_baseline-1-gc984786b0cf
+# Generated at 2026-01-22 16:37:18.329435+00:00 for kernel version 6.12.66
+# From linux_kernel_cves cve_2026-01-22_1600Z-1-g55b49f6e4ba
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.65"
+    this_version = "6.12.66"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -18466,7 +18466,7 @@ CVE_STATUS[CVE-2025-39820] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-39821] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-39822 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39822] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-39823] = "cpe-stable-backport: Backported in 6.12.45"
 
@@ -19112,7 +19112,7 @@ CVE_STATUS[CVE-2025-40145] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-40148] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-40149 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40149] = "cpe-stable-backport: Backported in 6.12.66"
 
 # CVE-2025-40150 needs backporting (fixed from 6.18)
 
@@ -19630,7 +19630,7 @@ CVE_STATUS[CVE-2025-68210] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-68211] = "cpe-stable-backport: Backported in 6.12.59"
 
-CVE_STATUS[CVE-2025-68212] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-68212] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-68213] = "cpe-stable-backport: Backported in 6.12.60"
 
@@ -20074,7 +20074,7 @@ CVE_STATUS[CVE-2025-68790] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2025-68791] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-68792 needs backporting (fixed from 6.19rc1)
+CVE_STATUS[CVE-2025-68792] = "cpe-stable-backport: Backported in 6.12.66"
 
 CVE_STATUS[CVE-2025-68793] = "fixed-version: only affects 6.17 onwards"
 
@@ -20300,3 +20300,7 @@ CVE_STATUS[CVE-2025-71143] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-71144] = "cpe-stable-backport: Backported in 6.12.65"
 
+CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.12.66"
+
+CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.12.66"
+
-- 
2.43.0


