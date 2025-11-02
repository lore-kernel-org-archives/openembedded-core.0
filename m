Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FC0CCF9E3
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 11:59:14 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8517.1762084746129796452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 03:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jqyGI0TH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251102115903f5e46af05e00020779-mrlfl7@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251102115903f5e46af05e00020779
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Nov 2025 12:59:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=GXiyZocKgKBSOgjSu991LPSDlkSRZH2iUIHlvRKFhgU=;
 b=jqyGI0TH0Kok0YnVX7wLqR843U5tKt0/0gsgBE/RWn6BiFM/soANIDRG5rAfUdDNK7FaIE
 7GBq4orHhvdW53AaMnY634CRxZYbShzAnYBYOCzW6qXhhiIlXe8KRAOZwp9JlIRWmUSx2bHO
 Jr14hmkbrkXYFMLHMICdLFtR4ET+xUYIov/k7wtWSyTAGyYqap/OKMrBKlWYSGaEalnvfIQw
 V4zoP48OMVyIfru8xR39Cmwpl5AgnR66wcpsEHkNEjzNw4h22pqDz7vWq6tdLVGjjQaRwgyh
 3/dMvD/2oERirDegFuF9h3iaKXNFO+YeHb4fFyItO2V52GgviTkcTylQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 1/2] binutils: patch CVE-2025-11412
Date: Sun,  2 Nov 2025 12:59:02 +0100
Message-Id: <20251102115903.1374482-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 11:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225580

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

(From OE-Core rev: 6b94ff6c584a31d2b1e06d1e1dc19392d759b4b7)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/binutils/CVE-2025-11412.patch    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index ade69881a1..39f2827f78 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -84,5 +84,6 @@ SRC_URI = "\
      file://0045-CVE-2025-11083.patch \
      file://0046-CVE-2025-11081.patch \
      file://0047-CVE-2025-8225.patch \
+     file://CVE-2025-11412.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
new file mode 100644
index 0000000000..19a630b863
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
+@@ -14407,7 +14407,7 @@ bfd_elf_gc_record_vtentry (bfd *abfd, asection *sec,
+   const struct elf_backend_data *bed = get_elf_backend_data (abfd);
+   unsigned int log_file_align = bed->s->log_file_align;
+ 
+-  if (!h)
++  if (!h || addend > 1u << 28)
+     {
+       /* xgettext:c-format */
+       _bfd_error_handler (_("%pB: section '%pA': corrupt VTENTRY entry"),

