Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F5CC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:36:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.37884.1741613795271186646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 06:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lzM5rI6K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22355618fd9so75411885ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741613794; x=1742218594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+V1zJKKFt2OfuzNtZ5l+9Vkg47wJcnAgRElGI37ADs=;
        b=lzM5rI6KXnS+mTYOO0EE3AStu8cg00k+WYftASMljwFt3l++wewGdYFFE/k6aztHfu
         Zq0aLZAnEKMx0+9fkNw+PEhhSeyDeEDO3mOS/SIN89G0lHLZ1+loXmi5MloueCxgXOOG
         kSJrUfRad2rBuhtIiLmOtbH2Xs4jWWOvGc+F6JIxuk/7eGSst7cpllfQqtaGNUbAuaSv
         1EAKYrD5LdmjXiPsiieBOfX0yffVQhDskyS/gzaN8dIxQn3WwDN06zLuALMyKZwrtLDR
         s/UxN/Pb5OS9S9q5bp/ygVoqkd6rI981h2eCby6KQsJgR8CU9uLtbgAxTOse99vlfttG
         PftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613794; x=1742218594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+V1zJKKFt2OfuzNtZ5l+9Vkg47wJcnAgRElGI37ADs=;
        b=e9RI6U9763w1hvSXP+d5ruaJ0Q/GWO6v9uuDrBaLhc82nxL8HiTtcVxlSmIjtWt9Wc
         5f5S/ZrSmlEQu+owMhHJeSRXJBMgf7h/Vd78o5HXX5q0XKwP6OGQAdAQ2Y2nqnRKZ8SA
         xvoBZb8iY6qOtNywbylCIC0oycIMfO7ZKw4z0D7TWorw1HfVIq+PVIN9MQ5vrrfM8Cph
         HULAj1quKTQrqqJIJH3It9doBony+DgO3sNI3RIzEEM+bD+D5W8ly74MSNL2dYQijxVR
         o7TvoGeaKxxm4mfVwP6SaL0V4Rd7C795qxaPtUUpGIdf1q2uTPYltpwTxKPjZk7w0Bfd
         qLYA==
X-Gm-Message-State: AOJu0Yy4/ROigQ6yhS+1P/q2oBGqLMgd/ZWMO7lTDq8iCTRci+Xh230q
	J7sh8lnVtgnG4edGv4Yn/O4SpxW2haMVcPXBu6igo1fNRmwnV+xJ3WujSF6bWrF7nR1tqpyROkn
	J
X-Gm-Gg: ASbGncv2GIRwP6VzOFlS782QYbfdbvk5QcAFtxXssbPE5wWE/z3R7n9tR456UfFIWXb
	zUUhB1bczR94J41eLGTnoOGEG1mizRO9W6n44SI3W2J2PMSH5H6j79MSK2pM237VHP+lc56n71r
	juyNQMn0imJtsGDnW6wlWFwoOvJKm1jY8Fzc+QLJb2SoMYx5/GIvYZeJA9up/GXStKVVavPjfAB
	JZmkEzwwubPCB0OEvq9oSlZy3NG+uWLdoi2NZxWVRzZBa+J+qIE43M+kArBfsbdrBRXWXBcSj57
	ECesRcBOAGPRBlz8lnf9Xa7J6g+SO/0PECoFWPYESkhI+Fo=
X-Google-Smtp-Source: AGHT+IE30DGhEO8TpRjwfZaxruBbY0L8Lz5jSEQhHYHXsVeBUOdCIJTC36HJS+JAfcSZd3q2XtWFWA==
X-Received: by 2002:a17:902:e74e:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22428a89074mr215017675ad.19.1741613794482;
        Mon, 10 Mar 2025 06:36:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2ea8:96c2:9f70:5c1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfbcsm77820095ad.21.2025.03.10.06.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:36:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] binutils: Fix CVE-2025-0840
Date: Mon, 10 Mar 2025 06:36:20 -0700
Message-ID: <e12ee4b1713aa25465aa3f866d345d84e9eb948a.1741613667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741613667.git.steve@sakoman.com>
References: <cover.1741613667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 13:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212522

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32560 stack-buffer-overflow at objdump disassemble_bytes

Backport a patch from upstream to fix CVE-2025-0840
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0038-CVE-2025-0840.patch         | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index e577a10cb8..26d0b570f3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -72,5 +72,6 @@ SRC_URI = "\
      file://0035-CVE-2023-39129.patch \
      file://0036-CVE-2023-39130.patch \
      file://0037-CVE-2024-53589.patch \
+     file://0038-CVE-2025-0840.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch b/meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch
new file mode 100644
index 0000000000..b04e750690
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0038-CVE-2025-0840.patch
@@ -0,0 +1,53 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Wed, 15 Jan 2025 19:13:43 +1030
+
+PR32560 stack-buffer-overflow at objdump disassemble_bytes
+
+There's always someone pushing the boundaries.
+
+	PR 32560
+	* objdump.c (MAX_INSN_WIDTH): Define.
+	(insn_width): Make it an unsigned long.
+	(disassemble_bytes): Use MAX_INSN_WIDTH to size buffer.
+	(main <OPTION_INSN_WIDTH>): Restrict size of insn_width.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=baac6c221e9d69335bf41366a1c7d87d8ab2f893]
+CVE: CVE-2025-0840
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 59f454b0..bd6180be 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -110,7 +110,8 @@ static bool disassemble_all;		/* -D */
+ static int disassemble_zeroes;		/* --disassemble-zeroes */
+ static bool formats_info;		/* -i */
+ static int wide_output;			/* -w */
+-static int insn_width;			/* --insn-width */
++#define MAX_INSN_WIDTH 49
++static unsigned long insn_width;        /* --insn-width */
+ static bfd_vma start_address = (bfd_vma) -1; /* --start-address */
+ static bfd_vma stop_address = (bfd_vma) -1;  /* --stop-address */
+ static int dump_debugging;		/* --debugging */
+@@ -2897,7 +2898,7 @@ disassemble_bytes (struct disassemble_info *inf,
+ 	}
+       else
+ 	{
+-	  char buf[50];
++	  char buf[MAX_INSN_WIDTH + 1];
+ 	  unsigned int bpc = 0;
+ 	  unsigned int pb = 0;
+ 
+@@ -5457,8 +5458,9 @@ main (int argc, char **argv)
+ 	  break;
+ 	case OPTION_INSN_WIDTH:
+ 	  insn_width = strtoul (optarg, NULL, 0);
+-	  if (insn_width <= 0)
+-	    fatal (_("error: instruction width must be positive"));
++	  if (insn_width - 1 >= MAX_INSN_WIDTH)
++	    fatal (_("error: instruction width must be in the range 1 to "
++                     XSTRING (MAX_INSN_WIDTH)));
+ 	  break;
+ 	case OPTION_INLINES:
+ 	  unwind_inlines = true;
-- 
2.43.0


