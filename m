Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B222CA0FE9
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 21:16:01 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.50283.1756156552248382649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 14:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=D2ONZeGV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250825211548bddb9de179c0cc67da-k7iend@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250825211548bddb9de179c0cc67da
        for <openembedded-core@lists.openembedded.org>;
        Mon, 25 Aug 2025 23:15:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qiEqxYoD5rJNbIYaU8NZ7UYxCOsD8xJNyIxM0WR0vbs=;
 b=D2ONZeGVzJLo+Ha7ZkXTJD134SHRTCkUpn0IPDCDStMMBMBCzcHjdLQwONRPqQslMaDcq1
 TuhsX2bkdYfxH17VNyPQZZOHxCbcLBuLvg/O5bn+LvqnhHVs0fo3TIdMp1tTNVSsNyxN0Y2T
 RhFke9YKSbmIDykTmv+vBqfr4JzyGsdxymg8ByewMoHPhbqJ52hjTVgtqszXK1nFL9fToxpU
 TNjJ7cQ/edx1dwXEJA46pQ98h/Pg0B6odJ8QFrAvHRJlR114gkv7LHbfP9MlOvmS4UqQ8iCA
 XEl3U7N/b3iZCOVqA3Y6fyjYJEVLTxAfTsVtcnuZa7mGcHj/BJjxoAVw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] binutils: patch CVE-2025-8225
Date: Mon, 25 Aug 2025 23:15:00 +0200
Message-Id: <20250825211500.814727-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 21:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222425

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

