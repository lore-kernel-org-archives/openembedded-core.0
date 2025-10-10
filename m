Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AC6CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 20:52:16 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.320.1760129534213538492
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 13:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kDWHQbxm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251010205212ea7a462ced00020773-4kqhkz@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251010205212ea7a462ced00020773
        for <openembedded-core@lists.openembedded.org>;
        Fri, 10 Oct 2025 22:52:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1lA0/PELz9DuqaquMNGZ4zLRDZEY/QcW5N2KZwN1XUU=;
 b=kDWHQbxmLAuATuyx/y4JKTuA1KTehQ0MicSPo1a3VptWl6N5dWzPeaF1t+2zG/oUuqMItS
 HZJ1eHHBtpMwF0jjRSb4xyy5Qa/Fe+K8cRleSz2cen60xc+POZHjr6SMXM+MAiujt0nE/xO/
 q26/hIERrawCiLJ7TFjV9/l8EI7uf7qco0WFrrCgkI6sTviHAOTBLKVV9iAsbCwCk7nbko6z
 9GF6SAEKE6T18t2HikI0VRsOvI417I9nq5dsDT2LDX/2M865KkFwS3O8wvamINAK3IA5ZDOR
 +/qkVGeblEWtWx/r7i44TUDx2mR4W+p5VKFQ3JsbVahllsYuAKURFvcA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] binutils: patch CVE-2025-11082
Date: Fri, 10 Oct 2025 22:51:59 +0200
Message-Id: <20251010205200.1301197-2-peter.marko@siemens.com>
In-Reply-To: <20251010205200.1301197-1-peter.marko@siemens.com>
References: <20251010205200.1301197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 20:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224707

From: Peter Marko <peter.marko@siemens.com>

Pick patch per link in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0016-CVE-2025-11082.patch        | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-11082.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index e419d829c2b..8ace34495d7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -37,4 +37,5 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-CVE-2025-11081.patch \
+     file://0016-CVE-2025-11082.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-11082.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-11082.patch
new file mode 100644
index 00000000000..d6d1216114e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-11082.patch
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
+@@ -737,6 +737,7 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
+       if (hdr_id == 0)
+ 	{
+ 	  unsigned int initial_insn_length;
++	  char *null_byte;
+ 
+ 	  /* CIE  */
+ 	  this_inf->cie = 1;
+@@ -753,10 +754,13 @@ _bfd_elf_parse_eh_frame (bfd *abfd, struct bfd_link_info *info,
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

