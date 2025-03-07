Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FF8C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 20:28:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.20926.1741379321594521784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 12:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZYxR7od+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250307202838588dbe6b0dec24662c-aa9pd7@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250307202838588dbe6b0dec24662c
        for <openembedded-core@lists.openembedded.org>;
        Fri, 07 Mar 2025 21:28:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nZY/ZHqsE4xOs912qOycQ7mBAoX/Gu4ZLUo4Rkcl6b4=;
 b=ZYxR7od+jE2scacw5M4p3kEs1pseQi5PG6fz5dUGklOVtEcCYbaRRv5adrXRcPLdvribY2
 BgsvTwvoLiavBjcNTycMP/lcuV6zQ6cCXiLUC44wXSQSK40QGrlxujgpgkWyL6QP8ACWumwa
 q34u9S8sY79asHo+P7Ian9Jo6jQTxAh1ZZ1HOsNbBFotuX9ImtsLWGLPw9KOo9qmHS30N9Ug
 SCkR5Fn0HneaHdNhBHjET+06NcU8TXp7OYTYqsWJj4R5RRnzmYeZOpjk9kItbZx938lNkP0D
 OJ0qz4isPeIYb9k0zCJ4Qsj2t0w+n6HNGUMHXzY3RaOiXgKxg2L7dqiQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH] binutils: patch CVE-2025-0840
Date: Fri,  7 Mar 2025 21:27:50 +0100
Message-Id: <20250307202750.1207310-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 20:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212466

From: Peter Marko <peter.marko@siemens.com>

Backport [1] as listed in [2].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-0840

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../binutils/binutils-2.43.1.inc              |  1 +
 .../binutils/0016-CVE-2025-0840.patch         | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-0840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.43.1.inc b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
index 4a8666b433..091fa61cc6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
@@ -36,5 +36,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-CVE-2024-53589.patch \
+     file://0016-CVE-2025-0840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-0840.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-0840.patch
new file mode 100644
index 0000000000..2f60a7a0f1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-0840.patch
@@ -0,0 +1,55 @@
+From baac6c221e9d69335bf41366a1c7d87d8ab2f893 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 15 Jan 2025 19:13:43 +1030
+Subject: [PATCH] PR32560 stack-buffer-overflow at objdump disassemble_bytes
+
+There's always someone pushing the boundaries.
+
+	PR 32560
+	* objdump.c (MAX_INSN_WIDTH): Define.
+	(insn_width): Make it an unsigned long.
+	(disassemble_bytes): Use MAX_INSN_WIDTH to size buffer.
+	(main <OPTION_INSN_WIDTH>): Restrict size of insn_width.
+
+CVE: CVE-2025-0840
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ binutils/objdump.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index ecbe39e942e..80044dea580 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -117,7 +117,8 @@ static bool disassemble_all;		/* -D */
+ static int disassemble_zeroes;		/* --disassemble-zeroes */
+ static bool formats_info;		/* -i */
+ int wide_output;			/* -w */
+-static int insn_width;			/* --insn-width */
++#define MAX_INSN_WIDTH 49
++static unsigned long insn_width;	/* --insn-width */
+ static bfd_vma start_address = (bfd_vma) -1; /* --start-address */
+ static bfd_vma stop_address = (bfd_vma) -1;  /* --stop-address */
+ static int dump_debugging;		/* --debugging */
+@@ -3391,7 +3392,7 @@ disassemble_bytes (struct disassemble_info *inf,
+ 	}
+       else
+ 	{
+-	  char buf[50];
++	  char buf[MAX_INSN_WIDTH + 1];
+ 	  unsigned int bpc = 0;
+ 	  unsigned int pb = 0;
+ 
+@@ -6091,8 +6092,9 @@ main (int argc, char **argv)
+ 	  break;
+ 	case OPTION_INSN_WIDTH:
+ 	  insn_width = strtoul (optarg, NULL, 0);
+-	  if (insn_width <= 0)
+-	    fatal (_("error: instruction width must be positive"));
++	  if (insn_width - 1 >= MAX_INSN_WIDTH)
++	    fatal (_("error: instruction width must be in the range 1 to "
++		     XSTRING (MAX_INSN_WIDTH)));
+ 	  break;
+ 	case OPTION_INLINES:
+ 	  unwind_inlines = true;

