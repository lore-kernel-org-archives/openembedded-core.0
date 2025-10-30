Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BA5CCFA03
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:48 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.3353.1761844363068438986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AgvI19tF;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-89ec7919c71so139374985a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844362; x=1762449162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orNUwwME9DLUSqywjP7dFHiUU5+uWiKeGw1DMVfxpzo=;
        b=AgvI19tFAs0mPQoz65JHzTXoCs3OwwLK5lDBZtLeEB6wI5X9bwYCBQhg2LWEYIPmLL
         SpIXs2tpcHfNhsVmPaNKyqrKaxeFkJqd60rICqrNdlLjqhbhoVhpd6B6RvE7Zm5pqG34
         IOcBJhN5SDSJESxnGDmJyGl6EorrRZgbKkjZKlkHy3FYZOX0J64G7YHTa86ntKt5ElBk
         /ecHO0yuZ7jhePZvseE9nA1Ad3FcISnVB8u13UKpAQ9LN650/JJPUMwyp4dGSsVeM9UQ
         RSoS8/Og7rfolGu2xQJN0efFR3xJlQMabu9OkZ/rWdS9bHhpfo9lsEIiGl8UgyxIazbH
         0Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844362; x=1762449162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orNUwwME9DLUSqywjP7dFHiUU5+uWiKeGw1DMVfxpzo=;
        b=HZUbQ3L78zt97H6/s3648VTy6b888FUc9Ocp6DgQ9DCqHCw03dqS16SQuwjX6+sm6k
         rekQMQAGWaV7lxQe20jNrjPcSYJOph3yT+inl6Q8KoavHFytD+Ls8UEUrthAKyKC3Mpe
         NPHFeS4C75zToz7Eflp+C48C6yFGAGjxoMgCKpVltsp6ghZWUe6pEJojEGlvDgsrRVjN
         ZMu2MzU810WJgoqD1XAXfPwugIseifD1YgxlPQ+doJhWgCyDXaH+7S72R9y/THOfo5k9
         lhRM90a9Qc5UvYafKcAhD3GBYtQxOxlWTcaqBB714OVqRfDpOJpyg1T0w2G2YvYJWgk+
         osnw==
X-Gm-Message-State: AOJu0YyKI7VVTsYDjfKRxzboUIDD9hC3unxDcITsEPDgNRmfqR5SDwvP
	rFJC+nh73WW32rT35em8BSaJP2KXLOxZKr1r3CEBGduPGCUgHhi6aS1G
X-Gm-Gg: ASbGncv7v5rR2vF5dXEgIAVxWtOOTIJDD1aPwdgJxOW3P9Jj1kW+kWJwaPehyJ4j2LX
	zQcmdrhYDTBEd8/HUbysinOJBKvCInZArqpePWJg7VhHUKdRZ9BW5D/29uV8rrI6TZSEqb6vWMt
	kiUiS2wXXLL9IJVgZNyIoAxbH3Qerj16anCYcxGX/H6vcvXfgBYddRPtIVVCQw7eRzSpoeFxZrG
	sTRpiuI+JOS9ymvLDLO2NG0kr43SDEJMjJ50U5P+YM0Uy0a5G1voc3ZMKAm03lgTn1DjqJV0a7l
	qc7AOKdixQaYYgWwnihv736EwFteT4w2gdc5A6BVvaEyTlXHWpM/SKZYeWSgIYSR+/+hgzVhCXF
	hOeuLZDixlPH86XoTLG2Xi0a0r1JVaOGcd19JRKQQQU04RlsrWtR7q7pErfWw97XCq0LYse1oRi
	NjNoL3cEq096nGcmv7m87YvgiPnhpBpRY7fx5V3mmgOBHG6i1yYQeiOSnIj7D4hSxDS+3BXsriu
	XxuSw58Km8KmQE=
X-Google-Smtp-Source: AGHT+IH3eBCMR68WppAhDp5/nLJq89pP2XVVlzkB4jb+vX9ytdLlrmYI7gGSn8fWsiVZw6MxVvH7KQ==
X-Received: by 2002:a05:620a:400a:b0:8a0:7561:93c3 with SMTP id af79cd13be357-8ab990b0837mr26147485a.10.1761844361697;
        Thu, 30 Oct 2025 10:12:41 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/14] linux-yocto/6.12: update CVE exclusions (6.12.53)
Date: Thu, 30 Oct 2025 13:12:22 -0400
Message-Id: <649beea63921d00383e8ed07d54140748761f091.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225511

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (0 new | 1 updated): - 0 new CVEs: - 1 updated CVEs: CVE-2025-9152
        Date: Thu, 16 Oct 2025 13:08:42 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 74 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index f84d42cfe1..48a7d59689 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-10-14 01:23:30.027767+00:00 for kernel version 6.12.52
-# From linux_kernel_cves 2025-10-14_baseline-1-gddc0a257837
+# Generated at 2025-10-16 13:21:03.993902+00:00 for kernel version 6.12.53
+# From linux_kernel_cves cve_2025-10-16_1200Z-2-g676292fb5cd
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.52"
+    this_version = "6.12.53"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -17274,8 +17274,76 @@ CVE_STATUS[CVE-2025-39964] = "cpe-stable-backport: Backported in 6.12.49"
 
 CVE_STATUS[CVE-2025-39965] = "cpe-stable-backport: Backported in 6.12.50"
 
+CVE_STATUS[CVE-2025-39966] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39967] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39968] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39969] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39970] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39971] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39972] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39973] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39974] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39975] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39976] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39977] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39978] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39979] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39980] = "cpe-stable-backport: Backported in 6.12.50"
+
+# CVE-2025-39981 needs backporting (fixed from 6.17)
+
+CVE_STATUS[CVE-2025-39982] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39983] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39984] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39985] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39986] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39987] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39988] = "cpe-stable-backport: Backported in 6.12.50"
+
 CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-39990] = "cpe-stable-backport: Backported in 6.12.50"
+
+CVE_STATUS[CVE-2025-39991] = "cpe-stable-backport: Backported in 6.12.51"
+
+CVE_STATUS[CVE-2025-39992] = "cpe-stable-backport: Backported in 6.12.51"
+
+CVE_STATUS[CVE-2025-39993] = "cpe-stable-backport: Backported in 6.12.51"
+
+CVE_STATUS[CVE-2025-39994] = "cpe-stable-backport: Backported in 6.12.51"
+
+CVE_STATUS[CVE-2025-39995] = "cpe-stable-backport: Backported in 6.12.52"
+
+CVE_STATUS[CVE-2025-39996] = "cpe-stable-backport: Backported in 6.12.51"
+
+CVE_STATUS[CVE-2025-39997] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39998] = "cpe-stable-backport: Backported in 6.12.51"
+
+CVE_STATUS[CVE-2025-39999] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40000] = "cpe-stable-backport: Backported in 6.12.52"
+
 # CVE-2025-40014 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.39.2


