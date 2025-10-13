Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E988CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 19:07:51 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.53241.1760382461772593397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 12:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IWUO+pL4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025101319074204193cf00c000207d6-zfurwf@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025101319074204193cf00c000207d6
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Oct 2025 21:07:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=r8jxJDnR3ww0pCiXwZ8Twg0kspdO05xcpy79jGQNex8=;
 b=IWUO+pL48AX/Udiq+Ju4su9RD8+yvMzw41yAM2VypMXJJiwEiuWb8qROAMdORGuSqA3Uf1
 otQ8moITJNrsfIh9Mw+Y0ge4tUtz8SLrE42lpySdsXG4NwImb+SyRmbpZOZZqNLxCw4Nlwxu
 qy+o1gB8e+03WLlKtuarM+Pq+IsiMOmv5fL+EEzu/VW8Tr87CML6igdGP4uRQCVJnGT//ilP
 Y4DQZgqALU8eyeleSUhrYyRUPNy3iQRrJZUoKBORxTTWOBduSg/A2KpPXlsSHHBUqYoITnpF
 N72YCemULSIrqUzTmsu7Rn7Y0W6xXyloal/HL9ObTH8kN93MaJvH3cjg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][scarthgap][PATCH 2/2] binutils: patch CVE-2025-11083
Date: Mon, 13 Oct 2025 21:07:31 +0200
Message-Id: <20251013190731.172232-2-peter.marko@siemens.com>
In-Reply-To: <20251013190731.172232-1-peter.marko@siemens.com>
References: <20251013190731.172232-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 19:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224797

From: Peter Marko <peter.marko@siemens.com>

Pick patch per link in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0025-CVE-2025-11083.patch        | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index a879a1b501b..3e180b60181 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -60,5 +60,6 @@ SRC_URI = "\
      file://0023-CVE-2025-7546.patch \
      file://0023-CVE-2025-7545.patch \
      file://0024-CVE-2025-11082.patch \
+     file://0025-CVE-2025-11083.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch b/meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch
new file mode 100644
index 00000000000..b51bb5a19d2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0025-CVE-2025-11083.patch
@@ -0,0 +1,77 @@
+From 9ca499644a21ceb3f946d1c179c38a83be084490 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Thu, 18 Sep 2025 16:59:25 -0700
+Subject: [PATCH] elf: Don't match corrupt section header in linker input
+
+Don't swap in nor match corrupt section header in linker input to avoid
+linker crash later.
+
+	PR ld/33457
+	* elfcode.h (elf_swap_shdr_in): Changed to return bool.  Return
+	false for corrupt section header in linker input.
+	(elf_object_p): Reject if elf_swap_shdr_in returns false.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11083
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9ca499644a21ceb3f946d1c179c38a83be084490]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elfcode.h | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elfcode.h b/bfd/elfcode.h
+index 9c65852e103..5224a1abee6 100644
+--- a/bfd/elfcode.h
++++ b/bfd/elfcode.h
+@@ -311,7 +311,7 @@ elf_swap_ehdr_out (bfd *abfd,
+ /* Translate an ELF section header table entry in external format into an
+    ELF section header table entry in internal format.  */
+ 
+-static void
++static bool
+ elf_swap_shdr_in (bfd *abfd,
+ 		  const Elf_External_Shdr *src,
+ 		  Elf_Internal_Shdr *dst)
+@@ -341,6 +341,9 @@ elf_swap_shdr_in (bfd *abfd,
+ 	{
+ 	  _bfd_error_handler (_("warning: %pB has a section "
+ 				"extending past end of file"), abfd);
++	  /* PR ld/33457: Don't match corrupt section header.  */
++	  if (abfd->is_linker_input)
++	    return false;
+ 	  abfd->read_only = 1;
+ 	}
+     }
+@@ -350,6 +353,7 @@ elf_swap_shdr_in (bfd *abfd,
+   dst->sh_entsize = H_GET_WORD (abfd, src->sh_entsize);
+   dst->bfd_section = NULL;
+   dst->contents = NULL;
++  return true;
+ }
+ 
+ /* Translate an ELF section header table entry in internal format into an
+@@ -642,9 +646,9 @@ elf_object_p (bfd *abfd)
+ 
+       /* Read the first section header at index 0, and convert to internal
+ 	 form.  */
+-      if (bfd_read (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr))
++      if (bfd_read (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr)
++	  || !elf_swap_shdr_in (abfd, &x_shdr, &i_shdr))
+ 	goto got_no_match;
+-      elf_swap_shdr_in (abfd, &x_shdr, &i_shdr);
+ 
+       /* If the section count is zero, the actual count is in the first
+ 	 section header.  */
+@@ -730,9 +734,9 @@ elf_object_p (bfd *abfd)
+ 	 to internal form.  */
+       for (shindex = 1; shindex < i_ehdrp->e_shnum; shindex++)
+ 	{
+-	  if (bfd_read (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr))
++	  if (bfd_read (&x_shdr, sizeof x_shdr, abfd) != sizeof (x_shdr)
++	      || !elf_swap_shdr_in (abfd, &x_shdr, i_shdrp + shindex))
+ 	    goto got_no_match;
+-	  elf_swap_shdr_in (abfd, &x_shdr, i_shdrp + shindex);
+ 
+ 	  /* Sanity check sh_link and sh_info.  */
+ 	  if (i_shdrp[shindex].sh_link >= num_sec)

