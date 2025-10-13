Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88378CCD18C
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 19:08:01 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.53264.1760382472721277710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 12:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XQsyK5/g;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025101319075077a1baa8a30002074e-8hkp3h@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025101319075077a1baa8a30002074e
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Oct 2025 21:07:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=seFsR3SX6bfNJVCXvuFnc8Ss31GTyPRAd9fbbRD26rM=;
 b=XQsyK5/gxG8Mx0hI7wE090wPI9zfh3BQP8H5oC6hCk6IDxd6jeUwRgPKv6eFTnOumsgNTj
 N5H3KSrI00AlJwINDVN+4F0ndS5I/aVfbtGZ8nRy2HhECmkBBaf/jdhEUmFmM6j+yx0Eha5s
 UemXQq7YlO1o0N4KQqvlCX48ei5QXuHVnd/nifr0d3JMiYLShiGjwkFIgwZJh1EwTZODyT3s
 n1ongIv0AFvuDKwGuOZUGM5sMdU7urPHJvZKJTkSp/vLEQhUvjmlkcNm9s2VSzY+ZjXV3MeB
 pP/UD3JQurpjdqBIqrEQX/6kdpd72A9MtHn/fV2tl5P1L+kTGpeUpExg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][kirkstone][PATCH 1/2] binutils: patch CVE-2025-11082
Date: Mon, 13 Oct 2025 21:07:45 +0200
Message-Id: <20251013190746.172255-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 19:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224798

From: Peter Marko <peter.marko@siemens.com>

Pick patch per link in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0044-CVE-2025-11082.patch        | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 527334ccec..0fd950e694 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -80,5 +80,6 @@ SRC_URI = "\
      file://0042-CVE-2025-5245.patch \
      file://0043-CVE-2025-7546.patch \
      file://0043-CVE-2025-7545.patch \
+     file://0044-CVE-2025-11082.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch b/meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch
new file mode 100644
index 0000000000..83747d4e8b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch
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
+@@ -733,6 +733,7 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+       if (hdr_id == 0)
+ 	{
+ 	  unsigned int initial_insn_length;
++	  char *null_byte;
+ 
+ 	  /* CIE  */
+ 	  this_inf->cie = 1;
+@@ -749,10 +750,13 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
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

