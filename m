Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D597CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 19:07:51 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.53241.1760382461772593397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 12:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EVPTUi8v;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025101319073819c07ab6060002076b-wl8m7p@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025101319073819c07ab6060002076b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Oct 2025 21:07:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XUsYB1yEoG9WNBQ6h5NjspYKnq7A2KdD60Cgkz8mLpw=;
 b=EVPTUi8vIsZljT4Nld+5WbeFliua9iuqf4PpzkPrZWpCwlVuqyp9IH13RZPFDoFoy+h3ns
 0YkIrUs3wsj8zYoeaW/qNEj5a4mCjGkAOIHND9VF6RRYQS5UVA61EjoP2/tuZDGlD8EBzPDn
 zxMbY1VAIkfQETrdwlQf3ZvwroXsVhNes/wtRXrJyLkEfoU/v1Hrh4futIKdZPVtv2C+ZN6K
 fuJFNJa4iZMF48306NPH4LOTzffjyZtBAQmYAFVOv8qsYtJD5ysjTcuoTX4IQxQs8DmR+ruL
 lUY1kA2rt6EMxpa+qXYSPrQljHiSomArckWljVchWTQr5SXItUd3lA+g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][scarthgap][PATCH 1/2] binutils: patch CVE-2025-11082
Date: Mon, 13 Oct 2025 21:07:30 +0200
Message-Id: <20251013190731.172232-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 19:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224796

From: Peter Marko <peter.marko@siemens.com>

Pick patch per link in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0024-CVE-2025-11082.patch        | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e791cd2b136..a879a1b501b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -59,5 +59,6 @@ SRC_URI = "\
      file://0022-CVE-2025-5244.patch \
      file://0023-CVE-2025-7546.patch \
      file://0023-CVE-2025-7545.patch \
+     file://0024-CVE-2025-11082.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch b/meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch
new file mode 100644
index 00000000000..d712a62bd53
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0024-CVE-2025-11082.patch
@@ -0,0 +1,46 @@
+From ea1a0737c7692737a644af0486b71e4a392cbca8 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 22 Sep 2025 15:20:34 +0800
+Subject: [PATCH] elf: Don't read beyond .eh_frame section size
+
+	PR ld/33464
+	* elf-eh-frame.c (_bfd_elf_parse_eh_frame): Don't read beyond
+	.eh_frame section size.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11082
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ea1a0737c7692737a644af0486b71e4a392cbca8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elf-eh-frame.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf-eh-frame.c b/bfd/elf-eh-frame.c
+index dc0d2e097f5..30bb313489c 100644
+--- a/bfd/elf-eh-frame.c
++++ b/bfd/elf-eh-frame.c
+@@ -734,6 +734,7 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+       if (hdr_id == 0)
+ 	{
+ 	  unsigned int initial_insn_length;
++	  char *null_byte;
+ 
+ 	  /* CIE  */
+ 	  this_inf->cie = 1;
+@@ -750,10 +751,13 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+ 	  REQUIRE (cie->version == 1
+ 		   || cie->version == 3
+ 		   || cie->version == 4);
+-	  REQUIRE (strlen ((char *) buf) < sizeof (cie->augmentation));
++	  null_byte = memchr ((char *) buf, 0, end - buf);
++	  REQUIRE (null_byte != NULL);
++	  REQUIRE ((size_t) (null_byte - (char *) buf)
++		   < sizeof (cie->augmentation));
+ 
+ 	  strcpy (cie->augmentation, (char *) buf);
+-	  buf = (bfd_byte *) strchr ((char *) buf, '\0') + 1;
++	  buf = (bfd_byte *) null_byte + 1;
+ 	  this_inf->u.cie.aug_str_len = buf - start - 1;
+ 	  ENSURE_NO_RELOCS (buf);
+ 	  if (buf[0] == 'e' && buf[1] == 'h')

