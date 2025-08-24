Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C613CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 12:44:01 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.16158.1756039433729815582
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 05:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UHffiysk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250824124351cd739ddf45dcb366d5-zgb8oj@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250824124351cd739ddf45dcb366d5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 14:43:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=blIMG0WCrAWOulgvaN+jy18ehHMk1R9YPCKnHBV3o/Y=;
 b=UHffiyskE+7KifeVJKAXTjlnaDvgLdfmqNuuwDX2AchPmWb53gANlzQZDRVF4Eg7GUq16U
 l901ozjQmgTtg0IXtjLyEj9buSs23292UrgA3KZd222UmK1GpzPzyFLTvEmmGKHWSIr/R5hh
 xnGrkIvMdgN/84E39muUMcpaMWWSFDmiTF+wNGzueDSAZb6pftc447NU1RIVvpKpVXJTXBJG
 pCEPFqlzhQBfKfYqDE5+XaeY5fExl4lepp1P0/+PGfm0JEBRLdjanjMdnKiVJxay9yJumkV9
 8slMfT3RNmvYFxr6EbURByujLPlHImKt7My8xblCVPElj937mMrhOtuQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 2/2] binutils: patch CVE-2025-8225
Date: Sun, 24 Aug 2025 14:42:48 +0200
Message-Id: <20250824124248.1093100-2-peter.marko@siemens.com>
In-Reply-To: <20250824124248.1093100-1-peter.marko@siemens.com>
References: <20250824124248.1093100-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 12:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222371

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
index 67ced2863b..20d9c2a6f2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -46,5 +46,6 @@ SRC_URI = "\
      file://0018-CVE-2025-5245.patch \
      file://0019-CVE-2025-7545.patch \
      file://0018-CVE-2025-7546.patch \
+     file://0019-CVE-2025-8225.patch \
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

