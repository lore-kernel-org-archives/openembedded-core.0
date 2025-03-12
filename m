Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCE1C35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.4651.1741809164100575516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KxqR/IAw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so451086a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809163; x=1742413963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3Fbmq8z4ONlvbOoLvOi9K1g6U3nxdcgoN+clZp3cgM=;
        b=KxqR/IAwYDBHfnmDm1xxIERLYMOlu+9u4lqnzg7UumzAR7lWmytOFGtg6E+oSsghoV
         FcCpTsP/x4z5gd9dqey8AifBLk9xnYwbD/6pGHSghZdsZ/KZhlPCu7rnCQOGcYynZnSy
         gL7LJtCoNF2MFJrpMHmonBVekfA3AR84Rr2JvRMUq9fzyE7QGDpVAXOZUudNWuGk4wuJ
         a65iFwDkFbxikSJM8TGT6LQwnqzB0t1fzGHd+lrZ6l/Oweey3QlCOAzMpewsvoYyfGEz
         fvl6vFbOpD90hMAZ2QJiZjclKGJBX0E9+QwQcN30M+X/Xz5hi7mo8+LtpX+YRsGzjFia
         Vd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809163; x=1742413963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3Fbmq8z4ONlvbOoLvOi9K1g6U3nxdcgoN+clZp3cgM=;
        b=OsF3rD2jauUXryk+WwJqXXEbdULPJa63wdqpi3oLbMniddF+wsG+UKDWHOtyXGoMTN
         SKTg/5h+2Z4UEK/6kvoXQcIdpiSNyneWi7juLQ/yo60oZNAYXC7XLQl6L3fMInJdwYO5
         No+3T+OIxfkGZTBoo+LW3hpgOlcGzr5XAk1Zur8a161RILO/fTXYQrztJeI75SxYwxTY
         ynRq7bVnj4ZLl/o0PKB9DK/3B23636M1v8xe0yXgrHsOjaojRx81U8lj0D4pmxCcrACp
         iox5pJURVHF9pYI1O6MMBsovgIDImm1LAmecZeGHXwA98CKQl3nqoqiAE5PIbiIdFIWm
         jDRw==
X-Gm-Message-State: AOJu0YzMo+J1WlaqiewlHlu6QRUaXVfO33yJG+7StcrmaPXRJyoQbPir
	4XKLhbZN1VP/t7A9pn4Fv6LtsJXaaan3MGHBZFr4QhfAKqyTp89BrZSH84R7xzNeMxxai604uGZ
	b
X-Gm-Gg: ASbGncs4tdq0YHowv+4oFP9b5RlKja234Dh5uEyQ/j0Oz2Ya2iMbrfk4meA8/b8VsL+
	3XKKrniVPV207cCfbHueeKwO+1bxUO+tKdjpqKKO10sv/fq0Ue2rYXp01Nd4wJgEk0QxJ9g0owe
	BennP/7RwhnAFkHHh2M+rnpWi10pZK2tKO1yBNKciqOOCrldJV/YPkzUywY5pz7+cXYx5Zg5le7
	jG63D3sKKEoQuywPYKAdsRFJ3R4md0fLAfIg+TV9Y6d5NXt8/l8nsh2ZAgBBAGy1fvxAsGZZNFt
	68+R0qB7T/P2TZQhHPdN9g8dJCkCK7Uxzvj7zamn8mVn3Q==
X-Google-Smtp-Source: AGHT+IHL6jnInKcra42tMY34a/M5ku//TyyjfT1t9NSrMPl8CMcLIwKGWIWoSX3jXUROpz9Nxemocw==
X-Received: by 2002:a05:6a20:9c91:b0:1f5:8e33:c417 with SMTP id adf61e73a8af0-1f58e33c5ecmr13997147637.2.1741809163320;
        Wed, 12 Mar 2025 12:52:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 02/25] binutils: patch CVE-2025-0840
Date: Wed, 12 Mar 2025 12:52:10 -0700
Message-ID: <059b6bb3058fadbeee2626ab241de315ed1b0baa.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212669

From: Peter Marko <peter.marko@siemens.com>

Backport [1] as listed in [2].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-0840

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


