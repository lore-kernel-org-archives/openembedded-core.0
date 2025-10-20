Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6476BCCD1A2
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 22:09:54 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.4822.1760998184582937760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 15:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BS8t/vL1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251020220941e10ffe342500020791-unzvh6@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251020220941e10ffe342500020791
        for <openembedded-core@lists.openembedded.org>;
        Tue, 21 Oct 2025 00:09:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Vfsv0HHFTFdmluBz37A/MNDJdewIDyICSrZmMf3Eqi8=;
 b=BS8t/vL1xMsOD79NBCopVbKLK7lwrAFO1xswBgQTv3gHlSkur+Lldg1UmrS8yFFiBn3C4s
 iquG+j56k51nNoPnvoCj3Qx4voXafb5YgM4v1hhknjhUNX6H+OOME2A8bpZXczDKnqgOJhYO
 Xc7+lHyxy8LqAQLanj7lzmQY4m4WJxNtjhhBXs6vYZxv5tEgUJMc0kqr3fvPnStLETISp3gk
 hL7HIvNB3LWHAQyRsjvfFmCwaA8iiR8AOK2yJivZsWzZCYdjbHfBXw8faIN4P2mxE+5amZQP
 8MlfnMFY+f5sHr37kjLoy89Lug6UwbIYg8AUZ3Xf/WBQ1UjGKh3R9uMw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 5/5] binutils: patch CVE-2025-11494
Date: Tue, 21 Oct 2025 00:09:12 +0200
Message-Id: <20251020220912.483748-5-peter.marko@siemens.com>
In-Reply-To: <20251020220912.483748-1-peter.marko@siemens.com>
References: <20251020220912.483748-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 22:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225139

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/binutils/CVE-2025-11494.patch    | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 288475ac390..72ed156a945 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -43,4 +43,5 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://CVE-2025-11495.patch \
+     file://CVE-2025-11494.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-11494.patch
new file mode 100644
index 00000000000..91ca74fb485
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-11494.patch
@@ -0,0 +1,49 @@
+From b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:13:56 +0800
+Subject: [PATCH] x86: Keep _GLOBAL_OFFSET_TABLE_ for .eh_frame
+
+Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
+_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
+.eh_frame section is non-empty.
+
+	PR ld/33499
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
+	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
+	output .eh_frame section is non-empty.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+CVE: CVE-2025-11494
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ bfd/elfxx-x86.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index d8c653a9ad2..140e86888a6 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2445,6 +2445,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 
+   if (htab->elf.sgotplt)
+     {
++      asection *eh_frame;
++
+       /* Don't allocate .got.plt section if there are no GOT nor PLT
+ 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
+       if ((htab->elf.hgot == NULL
+@@ -2457,7 +2459,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 	  && (htab->elf.iplt == NULL
+ 	      || htab->elf.iplt->size == 0)
+ 	  && (htab->elf.igotplt == NULL
+-	      || htab->elf.igotplt->size == 0))
++	      || htab->elf.igotplt->size == 0)
++	  && (!htab->elf.dynamic_sections_created
++	      || (eh_frame = bfd_get_section_by_name (output_bfd,
++						      ".eh_frame")) == NULL
++	      || eh_frame->rawsize == 0))
+ 	{
+ 	  htab->elf.sgotplt->size = 0;
+ 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it

