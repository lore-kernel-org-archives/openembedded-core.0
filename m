Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EBACA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:17:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.842.1756999072372105311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h//0QiAY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24b1596b1beso12245935ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999071; x=1757603871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yO0HKTnLozORUsvGTsIx4Zw40hROIbD4rJ0Ku3LnuLM=;
        b=h//0QiAYpBNr1QKstZb1dp9242HmFoLX1qQSCplDZMKtX7as5e4wjlx/YFNm9p0v7C
         AlB/qMkGFkegs68PKBqj77/ttLNPrI5Zq5eNMk9aIkA2uBxycLaWQecXwXtUv2oNtISh
         ZyNBmFehUWGHoz6LBK8j3udoQoXTIRfFaSoNH04Zs8bhRkI4yUky4ak2Iigg54ZrNf3K
         o9/9HRAdsEDfiDqJJd1zfZOEaGXQpn0sBWS4tW7QltCUW0GyA0KTk5DkC0uWnHXahB40
         MeDc5bv1l+NdUaTEg6dC3a+yEOan2FxMlF8ufPbmq30WdzYJyu3G69bnqb6DpdYFHZzf
         C4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999071; x=1757603871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO0HKTnLozORUsvGTsIx4Zw40hROIbD4rJ0Ku3LnuLM=;
        b=ScEJYaY3Ci1Q54I/ZufVfoUAa66JUI6vmWcHShz2dZdpLg0e6o5qv/2AORP5it49zC
         ph8+ecNDgKnj+CAu07zeKPlEdmFliK7WiWPbnDmfm8Cbd/liOfZjOdjyiRFjFsZ0Gt8T
         LnFFSyKeef3rfCMAfcrWImtImEGvwqmVcMXsiSSgcqOUkiPcnrxXwwbCQSEtxjuJ+154
         i4Z9mMWqEhNUGISiCUS5L4UUIEG0VclPK3h3q8gBi6OPlONAv2kDDJYYWhDZblSi882X
         feqpG0P63t67fxC+IjhpSpUX55yemmVP6vQztJe138/dkZSsV9MEGLJv4LWqIbTL97UQ
         poog==
X-Gm-Message-State: AOJu0YzKKwlZgUvdzzg5PMgy7Y8aS6YBxHYmx+gwCct0RhMUXGopUqFI
	GDD9QDxF01M2Hha5qP5yaV0E+UIhd2wEeuHHNYZ3KASVa4F9JYFXLhSipW1JuE4zUkGXTa8yImX
	BAYYd
X-Gm-Gg: ASbGncuX7NCpyCilcOxxUZKJudc0oq3kC3ecupzYlWk4xjVvfY3FGdBFLhv8EX4weQI
	GSIkqQpPhsp1JhfnwIwixqaPyBtDtqqITXbwHqP8oCu1nZNv0ow6xjE9HXkxjGgoIHJpS12kk2k
	dONYLgIjvNl1BmAw3hNImgDfhrNoKAUcO7qQAVSkdo7Zq6ImscG2AkB7Pbu71E95cVt6ZlxuZeB
	+BZ7pXbB3nrKxI8f5znddvOR5tiG9DYHZNkHgRhIlXksWd0dMxwf4bg6kD8dtLZSyJprwRAhp6o
	J7sjwB3NdgGSc6smbHnrlsNSLIwbNAhQQ1dO+DVycdpexJYhlSdREIJLP8N6m4dfDTH4Ou9wO7J
	3a00Agwdvo9Kr87tbZeSwJl4D
X-Google-Smtp-Source: AGHT+IG+D9KmF2Br1rIXdtCNfpk1Cn+88k4/hHnjCNIjhQOBYugbToM7lryCG9N4PG2viDk0HzStAQ==
X-Received: by 2002:a17:903:28c:b0:245:f2c2:64ed with SMTP id d9443c01a7336-24944a742f8mr246651795ad.24.1756999071370;
        Thu, 04 Sep 2025 08:17:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0637d948sm84720845ad.30.2025.09.04.08.17.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:17:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 1/6] binutils: patch CVE-2025-8225
Date: Thu,  4 Sep 2025 08:17:39 -0700
Message-ID: <3d79514f90a6f731a5333417641500b8e52e410a.1756998900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756998900.git.steve@sakoman.com>
References: <cover.1756998900.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222949

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2].

[1] https://gitlab.com/gnutools/binutils-gdb/-/commit/e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-8225

Testsuite did not show any changes in results:

 === binutils Summary ===

 # of expected passes           310
 # of unexpected failures       1
 # of untested testcases        1
 # of unsupported tests         9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0019-CVE-2025-8225.patch         | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-8225.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 5ee82fa0e5..a217d07e8c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -46,6 +46,7 @@ SRC_URI = "\
      file://0018-CVE-2025-5245.patch \
      file://0019-CVE-2025-7545.patch \
      file://0018-CVE-2025-7546.patch \
+     file://0019-CVE-2025-8225.patch \
      file://0020-Fix-for-borken-symlinks.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-8225.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-8225.patch
new file mode 100644
index 0000000000..43bc4c56d8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-8225.patch
@@ -0,0 +1,41 @@
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
+	
+CVE: CVE-2025-8225
+Upstream-Status: Backport [https://gitlab.com/gnutools/binutils-gdb/-/commit/e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ binutils/dwarf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
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
-- 
2.43.0


