Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F4DCCD1A5
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 22:09:34 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.4814.1760998167891148917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 15:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ku9e14kA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251020220925eba7784bf2000207e7-d1uiy4@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251020220925eba7784bf2000207e7
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Oct 2025 00:09:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oAXfDdgfivKmXi/GTn8T/Qfl+qkO021EF0ifB27StvY=;
 b=Ku9e14kAY9N3nZZUtwTrvnAyg5Plbw2G+0SUg0/UxqFP9wkJERGf3sJlqaJRna9n5B25IH
 SOXOfefY8h2PcmVeF1ieEYtR9p9SBau5qNq6ijBM9BU4vc4/X3B9o0b/M5p8bQI+M1yPX02D
 3zG5Xgcrsuoks9bo8ghRF349OZx+hJHdKXcvONsZJJYJ2tvqPpT7AjlCbSv1TIUJ8RPtlvtG
 lidWQ3jYv0AdELt9WJNXRs9H/fEZF9kFaE3sNHe7egBIHDIJviBXkcERLSRAKKSDzVQPmQTH
 1e+2sw5Irgc5zPXzqokzhZX9mHoCT1JOTKB42XJQM04G+PLZ0qZP3AWA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/5] binutils: patch CVE-2025-11412
Date: Tue, 21 Oct 2025 00:09:09 +0200
Message-Id: <20251020220912.483748-2-peter.marko@siemens.com>
In-Reply-To: <20251020220912.483748-1-peter.marko@siemens.com>
References: <20251020220912.483748-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 22:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225136

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/binutils/CVE-2025-11412.patch    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 2adff3c4562..ffd6c3b2388 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -40,4 +40,5 @@ SRC_URI = "\
      file://0016-CVE-2025-11082.patch \
      file://0017-CVE-2025-11083.patch \
      file://CVE-2025-11414.patch \
+     file://CVE-2025-11412.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
new file mode 100644
index 00000000000..ab718f53542
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
@@ -0,0 +1,35 @@
+From 047435dd988a3975d40c6626a8f739a0b2e154bc Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 25 Sep 2025 08:22:24 +0930
+Subject: [PATCH] PR 33452 SEGV in bfd_elf_gc_record_vtentry
+
+Limit addends on vtentry relocs, otherwise ld might attempt to
+allocate a stupidly large array.  This also fixes the expression
+overflow leading to pr33452.  A vtable of 33M entries on a 64-bit
+host is surely large enough, especially considering that VTINHERIT
+and VTENTRY relocations are to support -fvtable-gc that disappeared
+from gcc over 20 years ago.
+
+	PR ld/33452
+	* elflink.c (bfd_elf_gc_record_vtentry): Sanity check addend.
+
+CVE: CVE-2025-11412
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=047435dd988a3975d40c6626a8f739a0b2e154bc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elflink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 54f0d6e957e..0a0456177c2 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14837,7 +14837,7 @@ bfd_elf_gc_record_vtentry (bfd *abfd, asection *sec,
+   const struct elf_backend_data *bed = get_elf_backend_data (abfd);
+   unsigned int log_file_align = bed->s->log_file_align;
+ 
+-  if (!h)
++  if (!h || addend > 1u << 28)
+     {
+       /* xgettext:c-format */
+       _bfd_error_handler (_("%pB: section '%pA': corrupt VTENTRY entry"),

