Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C530FCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.13456.1761768734728293624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cZcRz6G2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a26b9a936aso265222b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761768734; x=1762373534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukzwMGphRpz1fESHqJ5QVuzndrcJHwMsv/PQtoFg8FY=;
        b=cZcRz6G28lpwpVJd98d1R2XlttrljwwFN1wUCg2F7t4sege/GqoMU6nMI0YLvnRZqg
         pTXLMpCmohHScuTqLxOytvN11EW88DMxddi4zJof08Rc82aTgSo9BxHg4TgVmoa+ZPSc
         YIaUbgdgTUwYNzU68d0cMsU1YpDJ2lB7hwzyyIfm5lcR063LmYvFHrNA724msJlSCD5M
         cTUpcNabORMWcrVHTlB8kF396YR64nr+HwgoFhcVJXJOu2Se29EHsSrvkRtTXwyra7o+
         3FhLhUDP8VWBXFYmhouo+UF82Lv/ytH0ht9Py6CBW58firnzTmzrkKycNV9umpIIfYTW
         +7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768734; x=1762373534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukzwMGphRpz1fESHqJ5QVuzndrcJHwMsv/PQtoFg8FY=;
        b=RyiUSpjbdekUtR6vU85e6pt7d0R6okTsxgyS+DldIk6UCzlQbhH0Xb4q9zcNXmjU3k
         atNrIxl4hpDzoJchTmnArdY2xeU+fgng+wDA3KN+p94OyRT9oytzhTf7YTxo50XnLZ+3
         /2EhhdQ2VxnUuREjH7wSrp7AOrC+YqtPHL2jNbR6lZD1FKcARAlZOK6yEOHvvtDiQKic
         pmd0s/iRsAUcXbhjgSLzEg3Rn6L6FbPPp2ELe+InhH/YQ1uEKJCIThH5DQSNj/VR9rjF
         MZ5uj+N8jFmyWU1k/NJB3dAnQG5AtMDJQjZwSOetBtTrQaGnu71WILkgCrJs540r/JZF
         ALZw==
X-Gm-Message-State: AOJu0YzD0jJ07Ba9j4DFtQO9Prn2pL72EpWqvunSLccyVqPSFS4LcTQh
	1XRch/o4dBzswxFX2I+9uzl+cB8SnItPtEGe7klIP9jtpJVGL2f4E3F12ts864cNQP58p92POFi
	Ivh0kYnY=
X-Gm-Gg: ASbGncuNQwB2C5ZaesjEap8dfymz3r5DcKNx5e+2C0Pc7ublljOEKfpKZHbZoOGird7
	+ToQRvfPJQG1+UwH3vGHP62vptI1pav/KNOmUOOKxz3AxMu4BWTdQKEVfu//gjTIr8Wd7pz95lI
	SfB1nSMbOs07rQhcX0pU6lwnY0Zq0lk4vIZsMiUTqFuNmZpPPesDIME1vfW9xzJJ6HqVuDJeAQ1
	86LULcE0XQljCOW5XT0+4v9BRFMO2sCnAYzE8A3Q3j24YKRTHzw3VFMTssk0v0Be9zfCPNRfGb0
	r/jIsSDi5TDg1jRy19F5+O8JSWoMg5bLVAeFCszy5xeoNzlTeK2l7U8VGmDH5O4/pfR6nnIREhC
	OYW5uF6RnSH/EEuCrQzPeIYlHOvvgdsyn7lveSkk9uKmBudNNqjL4f5UM4c/UJ5bXZZo=
X-Google-Smtp-Source: AGHT+IEZep8phg9hsjaFX31HJy7vzHZRgMbmUlx2ehkjlSMFoC/g9nx50JNgnWLDoBmam/ZWFPR1iw==
X-Received: by 2002:a05:6a00:92a5:b0:7a4:c1c4:3959 with SMTP id d2e1a72fcca58-7a626b0b65emr643682b3a.22.1761768733893;
        Wed, 29 Oct 2025 13:12:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm16522100b3a.63.2025.10.29.13.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:12:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/6] binutils: fix CVE-2025-8225
Date: Wed, 29 Oct 2025 13:11:52 -0700
Message-ID: <7feed679262025b8405488d064e2c546a3ed7a0c.1761768602.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761768602.git.steve@sakoman.com>
References: <cover.1761768602.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 20:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225467

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-8225

It is possible with fuzzed files to have num_debug_info_entries zero
after allocating space for debug_information, leading to multiple
allocations.

* dwarf.c (process_debug_info): Don't test num_debug_info_entries
to determine whether debug_information has been allocated,
test alloc_num_debug_info_entries.

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0027-CVE-2025-8225.patch         | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 5447ab0da4..dcd3325ecc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -62,5 +62,6 @@ SRC_URI = "\
      file://0024-CVE-2025-11082.patch \
      file://0025-CVE-2025-11083.patch \
      file://0026-CVE-2025-11081.patch \
+     file://0027-CVE-2025-8225.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch
new file mode 100644
index 0000000000..410ba64143
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch
@@ -0,0 +1,47 @@
+From e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 22:45:29 +1030
+Subject: [PATCH] binutils/dwarf.c debug_information leak
+
+It is possible with fuzzed files to have num_debug_info_entries zero
+after allocating space for debug_information, leading to multiple
+allocations.
+
+	* dwarf.c (process_debug_info): Don't test num_debug_info_entries
+	to determine whether debug_information has been allocated,
+	test alloc_num_debug_info_entries.
+---
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]
+CVE: CVE-2025-8225
+
+ binutils/dwarf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 8e004cea839..bfbf83ec9f4 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -3807,13 +3807,11 @@ process_debug_info (struct dwarf_section * section,
+     }
+ 
+   if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+-      && num_debug_info_entries == 0
+-      && ! do_types)
++      && alloc_num_debug_info_entries == 0
++      && !do_types)
+     {
+-
+       /* Then allocate an array to hold the information.  */
+-      debug_information = (debug_info *) cmalloc (num_units,
+-						  sizeof (* debug_information));
++      debug_information = cmalloc (num_units, sizeof (*debug_information));
+       if (debug_information == NULL)
+ 	{
+ 	  error (_("Not enough memory for a debug info array of %u entries\n"),
+-- 
+2.43.7
+
-- 
2.43.0


