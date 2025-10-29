Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4452BCCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 02:54:54 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web01.39.1761706493078130060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 19:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YRFWQXqy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6a73db16efso6396249a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 19:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761706492; x=1762311292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6EPhT9pEEaVQx4XeMTQ6W8BN62mWex8hjyMxacKhd0=;
        b=YRFWQXqyQGoANzLXKXTQbKMarxIpS3suxDMir2jQbJ9n9FkjU9NW2d3ni51bj3OoqN
         bfII1Gfso0kKWqsPJc5pvT1i+W7RUtKD6/mg7QzbodxKRdouDZgsHXMsSIE3mfG2lO6n
         qK4bjLrpisEEAk8qTKm+XmVEQv3ahWp0kYNVeX0fhKmoabkN+Vc7nU8l0vnCJttGNVJj
         iT5PtUMnuqWJdH9x2m28kXGQsVE/VuZNc4HsQ8n75pP/fsqdaNimY9/HUHNrY4whiZAU
         wtqdzH4TtvFhZylZZnp1jhxkbAqS8hq0zavymPVc56cG00QiawTQarvp8X6YojqUVJh8
         RTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706492; x=1762311292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6EPhT9pEEaVQx4XeMTQ6W8BN62mWex8hjyMxacKhd0=;
        b=UotIMUttetnv8Lb9kSYxhLZGPK+cdfHtK6eiymw2EHBI/WMmfTz8MdDs+h0lbpFNVy
         +tKkzJC4i1Y9xI+EpMlu1NKVstL/U473Z5LM8qU5nG6MBaRHiutHoOjQl2a8m1eGJSEe
         WvHXT3906GMLuuH7GkKcd0dfrRtNvCw5dOSjo3dqmFaiCyWOBAYG82c6zp7hEd6h76Z0
         +hLpZf+bDgxcFTzpBC7jeS2N8gKOUPrD1IsUWBduNiolgXipynJ8kSdHzqjME56YeX3F
         fRRfYYRnPavNuVI0+hOmuy4PII3uf/T9lQSqHQgXjOiGDaBc2zTDnD8nuF0ieMUU/6SM
         vOpw==
X-Gm-Message-State: AOJu0YzdB+D9nUk4Q7FOj/x6TzF0pl4dKWcXBWA+4hND29OlniJTO7vQ
	E4Tb9EbMIMCpIYQh0Ayq3qxLPDJ845Z+fmd3gzKwbXG3BZ7EBDM6crQFLD1zxBzzES0eg6DEMNJ
	kP1oThf4=
X-Gm-Gg: ASbGnctYTkiYaQ7Jj3J3hcQluZhtL630iKe5RD8OiNZV2NDvvp3VJinff4jGbLqUayF
	4bjD/nOoTui3rC8bTsgIZ6tONa7EKW5Fyxeudff3ePbmT6Oxu2PmEdrMUixOP2Oe22PvdqGEwdB
	9GqZh2GG6TT2BjW9eujLgPNAqsDAjmw+0XSjlp13x9dKHgvgteOr1ebqhD82t28fR13Ex4gRu2U
	uxymyOE/FieDFZOjiN3wvLUYQAGhx49FiuCwo9K4+pWWfAaO8gArVO5A3GzTHVDceZjERR8lHNt
	4ktGyLHIswwP1o3xTgIK54CiuB5Nzx3tD2tweXHAC88PAVTd7PNJoSgwOq3eL+YbQFkMk+wlWXH
	6fv9wqOzqnAxpAKQtCpgycj1fkGcpmit1gMqjcMchAxg2UhAQ+D0GtgLTJJsvR/dZ5Qw=
X-Google-Smtp-Source: AGHT+IHXMxr4mLXt3lP18lmgEKqKkIDA3r4DEJeR2SjSI3+gZqOrvHXU8r4NwmANdlkdfL11al8wcA==
X-Received: by 2002:a17:902:e94d:b0:290:c5c8:941c with SMTP id d9443c01a7336-294deed4217mr17380805ad.29.1761706492194;
        Tue, 28 Oct 2025 19:54:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d27345sm131058945ad.54.2025.10.28.19.54.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:54:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] binutils: fix CVE-2025-8225
Date: Tue, 28 Oct 2025 19:54:28 -0700
Message-ID: <9b5bb098b542a43a7aa97cc376c358f0a38778e3.1761692326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761692326.git.steve@sakoman.com>
References: <cover.1761692326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225424

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
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0047-CVE-2025-8225.patch         | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 2444a304be..ade69881a1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -83,5 +83,6 @@ SRC_URI = "\
      file://0044-CVE-2025-11082.patch \
      file://0045-CVE-2025-11083.patch \
      file://0046-CVE-2025-11081.patch \
+     file://0047-CVE-2025-8225.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch b/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch
new file mode 100644
index 0000000000..410ba64143
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch
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


