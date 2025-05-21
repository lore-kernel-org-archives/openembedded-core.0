Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A974CC54EE3
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:59:42 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.1116.1747839578877335942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iT6EJRt4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23274dbcbc2so21636275ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747839578; x=1748444378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhdsoDtVZnMMVd8V+GKZ7bgnMjUJAZt3Mgq2nzMorWI=;
        b=iT6EJRt4YmdxpPIcLVspvVPiVRNZY4W4BhXdXOC16FJZ/QjBA4sEYBNTLAOZss5/av
         RICXa0bMVIzaoxHYfDcv8ZjgQwb9OQlsJvPsI2tahg/xV/T0VWsadN57YpPZhjz+OSNV
         hcjVUY0a8L0FCKxBIRiEAYtYbIWinUQuMqloI6rQdFk7fau5p1VFQz8Vm8xgqr25i29f
         dfjkK57VPcVGe7UnB4bU/L15yy6LfXTQl2WDZyKkT51MtWsIgLQ9NuurvJ9OO7Is8TfT
         xBQYLOgS3q87rbfIesMwh2+KQxpVaJAtSaeR+UJIsOED1mnDmKjoOCd2glOCyLxbTLWo
         H0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839578; x=1748444378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhdsoDtVZnMMVd8V+GKZ7bgnMjUJAZt3Mgq2nzMorWI=;
        b=qxwHCfuDtt/WmVxxYSf8kMQ1hhpVfqmbmYjjmsXaXBAcyNTKT1w4Dimhqwv0LmtoDX
         X6meqaR7H3CU8cKrnweNzgcGJ3TwE7tGkoICmk88UuJ3h4AhIeuJSmH35/GqYRiDb7WP
         nO1t/uYoH35QbgOHGf6qWWPoNtlKgD68vrgfuE2a3ZDTYUT3N0i2mCTv5nzeYbquu/Cz
         q0DOaracGL9G6F69PV3tVln3bWyz/X5psGSivdVZQ6bsVjcp58kjmcXNBsb2zc2nU3tE
         15to1m3JtCQBWLJztJ5VeUCLW1vpEeAGqka+NpW6rJTsu1zDAm0RfH23nbcfPvhr3ym1
         fXwQ==
X-Gm-Message-State: AOJu0YxrNM64ASk0NqcEeSO2KIWC/Mn+j4kWFajMy2xbV3m1qq9cICvR
	bTHx2LGXGRPJOXTQVnlQwUhkCQtcPXaeWcRzKoSJz6rT/3EB3NlAq+pMd1Rjx8thAHas1TH8CCm
	asTnJ
X-Gm-Gg: ASbGnctpt/tmmJtvR/gREUDrsH+yxihfm0nUoXwXMuG+kFhw1JhrqCoiiihyd5gmRNS
	n4+oaKhJfM5xbBi2F0iEl+TM21sbi/kTBX8icAsEAmdciwLd2lz12ejx1mHvfj0MYJtpL7MLytt
	0wy0VGZx64g62KJSeyeIrhAyHLYCeDmZNb6ed6GNTnyZgumj/AY+NMBFyni1Tm4uhuNX/JRWWmV
	+A8l970GXFGgYIH2lFA2KcmEFJ0zN2t2k+AkX5kfdgD07X26+OmGOhNH1CG0w5W/PMFQnutGGhM
	9acs+JnqiXnyMXB6KenI1ml5IY2DdyKqDxp6HfFhXFQ=
X-Google-Smtp-Source: AGHT+IHVRNgtRcr6tVKdlCQ7PsoTdcU6qzDztyxNUg7hgj27zGOM9yr/496V2QKlMswguAFS8p/o1A==
X-Received: by 2002:a17:903:22ca:b0:22f:c530:102 with SMTP id d9443c01a7336-231de376f89mr285989515ad.31.1747839576807;
        Wed, 21 May 2025 07:59:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89d4:3586:e576:3ce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm94189645ad.53.2025.05.21.07.59.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:59:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/7] binutils: Fix CVE-2025-1153
Date: Wed, 21 May 2025 07:59:18 -0700
Message-ID: <c8cb463ccee514935fe14544173c85001d66e60b.1747839445.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747839445.git.steve@sakoman.com>
References: <cover.1747839445.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217041

From: Sunil Dora <sunilkumar.dora@windriver.com>

PR 32603 [https://sourceware.org/bugzilla/show_bug.cgi?id=32603]

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=0b7f992b78fe0984fc7d84cc748d0794e4a400e3
&& https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31e9e2e8d1090da0c1da97a70005d8841fff8ddd
&& https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=fe459e33c676883b5f28cc96c00e242973d906a9]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |    3 +
 .../binutils/0019-CVE-2025-1153-1.patch       | 3207 ++++++++++++++
 .../binutils/0020-CVE-2025-1153-2.patch       |  840 ++++
 .../binutils/0021-CVE-2025-1153-3.patch       | 3756 +++++++++++++++++
 4 files changed, 7806 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-1153-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-CVE-2025-1153-3.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index e103e712a4..bc826753cf 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -45,5 +45,8 @@ SRC_URI = "\
      file://CVE-2025-1181-pre.patch \
      file://CVE-2025-1181.patch \
      file://CVE-2025-1182.patch \
+     file://0019-CVE-2025-1153-1.patch \
+     file://0020-CVE-2025-1153-2.patch \
+     file://0021-CVE-2025-1153-3.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-1153-1.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-1153-1.patch
new file mode 100644
index 0000000000..fa26961447
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-1153-1.patch
@@ -0,0 +1,3207 @@
+From 0b7f992b78fe0984fc7d84cc748d0794e4a400e3 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 6 Feb 2025 21:46:22 +1030
+Subject: [PATCH] PR 32603, ld -w misbehaviorur
+
+ld -w currently causes segmentation faults and other misbehaviour
+since it changes einfo with %F in the format string (fatal error) to
+not exit.  This patch fixes that by introducing a new variant of einfo
+called "fatal" that always exits, and replaces all einfo calls using
+%F with a call to fatal without the %F.  I considered modifying einfo
+to inspect the first 2 or 4 chars in the format string, looking for
+%F, but decided that was probably a bad idea given that translators
+might have moved the %F.  It's also a little nicer to inform the
+compiler of a function that doesn't return.
+
+The patch also fixes some formatting nits, and makes use of %pA
+to print section names in a couple of places in aix.em.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=0b7f992b78fe0984fc7d84cc748d0794e4a400e3]
+CVE: CVE-2025-1153
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ ld/emulparams/call_nop.sh     |  6 +--
+ ld/emulparams/cet.sh          |  2 +-
+ ld/emulparams/elf32mcore.sh   |  2 +-
+ ld/emulparams/x86-64-lam.sh   |  6 +--
+ ld/emulparams/x86-64-level.sh |  2 +-
+ ld/emultempl/aarch64elf.em    |  6 +--
+ ld/emultempl/aix.em           | 41 ++++++++-------
+ ld/emultempl/armelf.em        | 10 ++--
+ ld/emultempl/avrelf.em        |  2 +-
+ ld/emultempl/beos.em          | 24 ++++-----
+ ld/emultempl/cr16elf.em       |  4 +-
+ ld/emultempl/cskyelf.em       |  4 +-
+ ld/emultempl/elf.em           | 18 +++----
+ ld/emultempl/hppaelf.em       |  4 +-
+ ld/emultempl/kvxelf.em        |  7 ++-
+ ld/emultempl/loongarchelf.em  |  4 +-
+ ld/emultempl/m68hc1xelf.em    |  2 +-
+ ld/emultempl/m68kelf.em       |  4 +-
+ ld/emultempl/metagelf.em      |  4 +-
+ ld/emultempl/mipself.em       |  2 +-
+ ld/emultempl/mmix-elfnmmo.em  |  5 +-
+ ld/emultempl/nds32elf.em      |  6 +--
+ ld/emultempl/nto.em           | 28 +++++------
+ ld/emultempl/pe.em            | 20 ++++----
+ ld/emultempl/pep.em           | 16 +++---
+ ld/emultempl/ppc32elf.em      |  4 +-
+ ld/emultempl/ppc64elf.em      | 10 ++--
+ ld/emultempl/riscvelf.em      |  2 +-
+ ld/emultempl/s390.em          |  2 +-
+ ld/emultempl/scoreelf.em      |  2 +-
+ ld/emultempl/spuelf.em        | 20 ++++----
+ ld/emultempl/tic6xdsbt.em     | 10 ++--
+ ld/emultempl/ticoff.em        |  4 +-
+ ld/emultempl/v850elf.em       |  2 +-
+ ld/emultempl/vms.em           |  2 +-
+ ld/emultempl/xtensaelf.em     | 12 ++---
+ ld/emultempl/z80.em           |  2 +-
+ ld/ldcref.c                   |  8 +--
+ ld/ldelf.c                    | 34 ++++++-------
+ ld/ldelfgen.c                 | 17 +++----
+ ld/ldemul.c                   |  2 +-
+ ld/ldexp.c                    | 42 ++++++++--------
+ ld/ldfile.c                   | 14 +++---
+ ld/ldgram.y                   |  6 +--
+ ld/ldlang.c                   | 95 +++++++++++++++++------------------
+ ld/ldlex.l                    | 14 ++----
+ ld/ldmain.c                   | 44 ++++++++--------
+ ld/ldmisc.c                   | 28 ++++++++---
+ ld/ldmisc.h                   |  1 +
+ ld/ldwrite.c                  | 20 ++++----
+ ld/lexsup.c                   | 72 +++++++++++++-------------
+ ld/mri.c                      |  2 +-
+ ld/pe-dll.c                   | 12 ++---
+ ld/plugin.c                   | 27 +++++-----
+ 54 files changed, 363 insertions(+), 376 deletions(-)
+
+diff --git a/ld/emulparams/call_nop.sh b/ld/emulparams/call_nop.sh
+index 2c3c305f..7dd6dfb1 100644
+--- a/ld/emulparams/call_nop.sh
++++ b/ld/emulparams/call_nop.sh
+@@ -20,7 +20,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_CALL_NOP='
+ 	      char *end;
+ 	      params.call_nop_byte = strtoul (optarg + 16 , &end, 0);
+ 	      if (*end)
+-		einfo (_("%F%P: invalid number for -z call-nop=prefix-: %s\n"),
++		fatal (_("%P: invalid number for -z call-nop=prefix-: %s\n"),
+ 		       optarg + 16);
+ 	      params.call_nop_as_suffix = false;
+ 	    }
+@@ -29,12 +29,12 @@ PARSE_AND_LIST_ARGS_CASE_Z_CALL_NOP='
+ 	      char *end;
+ 	      params.call_nop_byte = strtoul (optarg + 16, &end, 0);
+ 	      if (*end)
+-		einfo (_("%F%P: invalid number for -z call-nop=suffix-: %s\n"),
++		fatal (_("%P: invalid number for -z call-nop=suffix-: %s\n"),
+ 		       optarg + 16);
+ 	      params.call_nop_as_suffix = true;
+ 	    }
+ 	  else
+-	    einfo (_("%F%P: unsupported option: -z %s\n"), optarg);
++	    fatal (_("%P: unsupported option: -z %s\n"), optarg);
+ 	}
+ '
+ 
+diff --git a/ld/emulparams/cet.sh b/ld/emulparams/cet.sh
+index 2c627994..e463441d 100644
+--- a/ld/emulparams/cet.sh
++++ b/ld/emulparams/cet.sh
+@@ -29,7 +29,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_CET='
+ 				 | prop_report_ibt
+ 				 | prop_report_shstk);
+ 	  else
+-	    einfo (_("%F%P: invalid option for -z cet-report=: %s\n"),
++	    fatal (_("%P: invalid option for -z cet-report=: %s\n"),
+ 		   optarg + 11);
+ 	}
+ '
+diff --git a/ld/emulparams/elf32mcore.sh b/ld/emulparams/elf32mcore.sh
+index 88a8cb6e..275a796f 100644
+--- a/ld/emulparams/elf32mcore.sh
++++ b/ld/emulparams/elf32mcore.sh
+@@ -46,6 +46,6 @@ PARSE_AND_LIST_ARGS_CASES='
+     case OPTION_BASE_FILE:
+       link_info.base_file = fopen (optarg, FOPEN_WB);
+       if (link_info.base_file == NULL)
+-	einfo (_("%F%P: cannot open base file %s\n"), optarg);
++	fatal (_("%P: cannot open base file %s\n"), optarg);
+       break;
+ '
+diff --git a/ld/emulparams/x86-64-lam.sh b/ld/emulparams/x86-64-lam.sh
+index fab42ff1..6e629ebb 100644
+--- a/ld/emulparams/x86-64-lam.sh
++++ b/ld/emulparams/x86-64-lam.sh
+@@ -25,7 +25,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_LAM='
+ 	  else if (strcmp (optarg + 15, "error") == 0)
+ 	    params.lam_u48_report = prop_report_error;
+ 	  else
+-	    einfo (_("%F%P: invalid option for -z lam-u48-report=: %s\n"),
++	    fatal (_("%P: invalid option for -z lam-u48-report=: %s\n"),
+ 		   optarg + 15);
+ 	}
+       else if (strcmp (optarg, "lam-u57") == 0)
+@@ -39,7 +39,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_LAM='
+ 	  else if (strcmp (optarg + 15, "error") == 0)
+ 	    params.lam_u57_report = prop_report_error;
+ 	  else
+-	    einfo (_("%F%P: invalid option for -z lam-u57-report=: %s\n"),
++	    fatal (_("%P: invalid option for -z lam-u57-report=: %s\n"),
+ 		   optarg + 15);
+ 	}
+       else if (strncmp (optarg, "lam-report=", 11) == 0)
+@@ -60,7 +60,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_LAM='
+ 	      params.lam_u57_report = prop_report_error;
+ 	    }
+ 	  else
+-	    einfo (_("%F%P: invalid option for -z lam-report=: %s\n"),
++	    fatal (_("%P: invalid option for -z lam-report=: %s\n"),
+ 		   optarg + 11);
+ 	}
+ '
+diff --git a/ld/emulparams/x86-64-level.sh b/ld/emulparams/x86-64-level.sh
+index c46aacf3..7e27cf1e 100644
+--- a/ld/emulparams/x86-64-level.sh
++++ b/ld/emulparams/x86-64-level.sh
+@@ -10,7 +10,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_X86_64_LEVEL='
+ 	  char *end;
+ 	  unsigned int level = strtoul (optarg + 8 , &end, 10);
+ 	  if (*end != '\0' || level < 2 || level > 4)
+-	    einfo (_("%F%P: invalid x86-64 ISA level: %s\n"), optarg);
++	    fatal (_("%P: invalid x86-64 ISA level: %s\n"), optarg);
+ 	  params.isa_level = level;
+ 	}
+ '
+diff --git a/ld/emultempl/aarch64elf.em b/ld/emultempl/aarch64elf.em
+index b647909a..a6637718 100644
+--- a/ld/emultempl/aarch64elf.em
++++ b/ld/emultempl/aarch64elf.em
+@@ -316,7 +316,7 @@ aarch64_elf_create_output_section_statements (void)
+ 	 These will only be created if the output format is an arm format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      einfo (_("%F%P: error: cannot change output format "
++      fatal (_("%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "AArch64");
+       return;
+     }
+@@ -342,7 +342,7 @@ aarch64_elf_create_output_section_statements (void)
+ 			      bfd_get_arch (link_info.output_bfd),
+ 			      bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create BFD: %E\n"));
++      fatal (_("%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -468,7 +468,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 
+ 	group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  einfo (_("%F%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ '
+diff --git a/ld/emultempl/aix.em b/ld/emultempl/aix.em
+index a445c329..29acdbc9 100644
+--- a/ld/emultempl/aix.em
++++ b/ld/emultempl/aix.em
+@@ -335,7 +335,7 @@ read_file_list (const char *filename)
+   f = fopen (filename, FOPEN_RT);
+   if (f == NULL)
+     {
+-      einfo (_("%F%P: cannot open %s\n"), filename);
++      fatal (_("%P: cannot open %s\n"), filename);
+       return;
+     }
+   if (fseek (f, 0L, SEEK_END) == -1)
+@@ -382,8 +382,8 @@ read_file_list (const char *filename)
+   return;
+ 
+  error:
+-  einfo (_("%F%P: cannot read %s\n"), optarg);
+   fclose (f);
++  fatal (_("%P: cannot read %s\n"), optarg);
+ }
+ 
+ static bool
+@@ -734,7 +734,7 @@ gld${EMULATION_NAME}_after_open (void)
+       size = (p->count + 2) * 4;
+       if (!bfd_xcoff_link_record_set (link_info.output_bfd, &link_info,
+ 				      p->h, size))
+-	einfo (_("%F%P: bfd_xcoff_link_record_set failed: %E\n"));
++	fatal (_("%P: bfd_xcoff_link_record_set failed: %E\n"));
+     }
+ }
+ 
+@@ -764,9 +764,9 @@ gld${EMULATION_NAME}_before_allocation (void)
+ 
+       h = bfd_link_hash_lookup (link_info.hash, el->name, false, false, false);
+       if (h == NULL)
+-	einfo (_("%F%P: bfd_link_hash_lookup of export symbol failed: %E\n"));
++	fatal (_("%P: bfd_link_hash_lookup of export symbol failed: %E\n"));
+       if (!bfd_xcoff_export_symbol (link_info.output_bfd, &link_info, h))
+-	einfo (_("%F%P: bfd_xcoff_export_symbol failed: %E\n"));
++	fatal (_("%P: bfd_xcoff_export_symbol failed: %E\n"));
+     }
+ 
+   /* Track down all relocations called for by the linker script (these
+@@ -849,7 +849,7 @@ gld${EMULATION_NAME}_before_allocation (void)
+       (link_info.output_bfd, &link_info, libpath, entry_symbol.name,
+        file_align, maxstack, maxdata, gc && !unix_ld,
+        modtype, textro, flags, special_sections, rtld))
+-    einfo (_("%F%P: failed to set dynamic section sizes: %E\n"));
++    fatal (_("%P: failed to set dynamic section sizes: %E\n"));
+ 
+   /* Look through the special sections, and put them in the right
+      place in the link ordering.  This is especially magic.  */
+@@ -871,8 +871,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+       is = NULL;
+       os = lang_output_section_get (sec->output_section);
+       if (os == NULL)
+-	einfo (_("%F%P: can't find output section %s\n"),
+-	       sec->output_section->name);
++	fatal (_("%P: can't find output section %pA\n"),
++	       sec->output_section);
+ 
+       for (pls = &os->children.head; *pls != NULL; pls = &(*pls)->header.next)
+ 	{
+@@ -908,8 +908,7 @@ gld${EMULATION_NAME}_before_allocation (void)
+ 
+       if (is == NULL)
+ 	{
+-	  einfo (_("%F%P: can't find %s in output section\n"),
+-		 bfd_section_name (sec));
++	  fatal (_("%P: can't find %pA in output section\n"), sec);
+ 	}
+ 
+       /* Now figure out where the section should go.  */
+@@ -1162,7 +1161,7 @@ gld${EMULATION_NAME}_after_allocation (void)
+ 
+   /* Now that everything is in place, finalize the dynamic sections.  */
+   if (!bfd_xcoff_build_dynamic_sections (link_info.output_bfd, &link_info))
+-    einfo (_("%F%P: failed to layout dynamic sections: %E\n"));
++    fatal (_("%P: failed to layout dynamic sections: %E\n"));
+ 
+   if (!bfd_link_relocatable (&link_info))
+     {
+@@ -1313,7 +1312,7 @@ gld${EMULATION_NAME}_read_file (const char *filename, bool import)
+   if (f == NULL)
+     {
+       bfd_set_error (bfd_error_system_call);
+-      einfo ("%F%P: %s: %E\n", filename);
++      fatal ("%P: %s: %E\n", filename);
+       return;
+     }
+ 
+@@ -1375,7 +1374,7 @@ gld${EMULATION_NAME}_read_file (const char *filename, bool import)
+ 	      obstack_free (o, obstack_base (o));
+ 	    }
+ 	  else if (*s == '(')
+-	    einfo (_("%F%P:%s:%d: #! ([member]) is not supported "
++	    fatal (_("%P:%s:%d: #! ([member]) is not supported "
+ 		     "in import files\n"),
+ 		   filename, lineno);
+ 	  else
+@@ -1392,7 +1391,7 @@ gld${EMULATION_NAME}_read_file (const char *filename, bool import)
+ 	      *s = '\0';
+ 	      if (!bfd_xcoff_split_import_path (link_info.output_bfd,
+ 						start, &imppath, &impfile))
+-		einfo (_("%F%P: could not parse import path: %E\n"));
++		fatal (_("%P: could not parse import path: %E\n"));
+ 	      while (ISSPACE (cs))
+ 		{
+ 		  ++s;
+@@ -1547,10 +1546,10 @@ gld${EMULATION_NAME}_find_relocs (lang_statement_union_type *s)
+ 
+       rs = &s->reloc_statement;
+       if (rs->name == NULL)
+-	einfo (_("%F%P: only relocations against symbols are permitted\n"));
++	fatal (_("%P: only relocations against symbols are permitted\n"));
+       if (!bfd_xcoff_link_count_reloc (link_info.output_bfd, &link_info,
+ 				       rs->name))
+-	einfo (_("%F%P: bfd_xcoff_link_count_reloc failed: %E\n"));
++	fatal (_("%P: bfd_xcoff_link_count_reloc failed: %E\n"));
+     }
+ 
+   if (s->header.type == lang_assignment_statement_enum)
+@@ -1579,7 +1578,7 @@ gld${EMULATION_NAME}_find_exp_assignment (etree_type *exp)
+ 	  if (!bfd_xcoff_record_link_assignment (link_info.output_bfd,
+ 						 &link_info,
+ 						 exp->assign.dst))
+-	    einfo (_("%F%P: failed to record assignment to %s: %E\n"),
++	    fatal (_("%P: failed to record assignment to %s: %E\n"),
+ 		   exp->assign.dst);
+ 	}
+       gld${EMULATION_NAME}_find_exp_assignment (exp->assign.src);
+@@ -1674,7 +1673,7 @@ gld${EMULATION_NAME}_create_output_section_statements (void)
+ 			     bfd_get_arch (link_info.output_bfd),
+ 			     bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create stub BFD: %E\n"));
++      fatal (_("%P: can not create stub BFD: %E\n"));
+       return;
+     }
+ 
+@@ -1684,7 +1683,7 @@ gld${EMULATION_NAME}_create_output_section_statements (void)
+ 
+   /* Pass linker params to the back-end. */
+   if (!bfd_xcoff_link_init (&link_info, &params))
+-    einfo (_("%F%P: can not init BFD: %E\n"));
++    fatal (_("%P: can not init BFD: %E\n"));
+ 
+   /* __rtinit */
+   if (link_info.init_function != NULL
+@@ -1701,7 +1700,7 @@ gld${EMULATION_NAME}_create_output_section_statements (void)
+ 				  bfd_get_arch (link_info.output_bfd),
+ 				  bfd_get_mach (link_info.output_bfd)))
+ 	{
+-	  einfo (_("%F%P: can not create BFD: %E\n"));
++	  fatal (_("%P: can not create BFD: %E\n"));
+ 	  return;
+ 	}
+ 
+@@ -1711,7 +1710,7 @@ gld${EMULATION_NAME}_create_output_section_statements (void)
+ 					    link_info.fini_function,
+ 					    rtld))
+ 	{
+-	  einfo (_("%F%P: can not create BFD: %E\n"));
++	  fatal (_("%P: can not create BFD: %E\n"));
+ 	  return;
+ 	}
+ 
+diff --git a/ld/emultempl/armelf.em b/ld/emultempl/armelf.em
+index 7fb1826e..504fb0cd 100644
+--- a/ld/emultempl/armelf.em
++++ b/ld/emultempl/armelf.em
+@@ -521,7 +521,7 @@ arm_elf_create_output_section_statements (void)
+ 	 These will only be created if the output format is an arm format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      einfo (_("%F%P: error: cannot change output format "
++      fatal (_("%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "ARM");
+       return;
+     }
+@@ -532,10 +532,10 @@ arm_elf_create_output_section_statements (void)
+ 					bfd_get_target (link_info.output_bfd));
+ 
+       if (params.in_implib_bfd == NULL)
+-	einfo (_("%F%P: %s: can't open: %E\n"), in_implib_filename);
++	fatal (_("%P: %s: can't open: %E\n"), in_implib_filename);
+ 
+       if (!bfd_check_format (params.in_implib_bfd, bfd_object))
+-	einfo (_("%F%P: %s: not a relocatable file: %E\n"), in_implib_filename);
++	fatal (_("%P: %s: not a relocatable file: %E\n"), in_implib_filename);
+     }
+ 
+   bfd_elf32_arm_set_target_params (link_info.output_bfd, &link_info, &params);
+@@ -549,7 +549,7 @@ arm_elf_create_output_section_statements (void)
+ 			      bfd_get_arch (link_info.output_bfd),
+ 			      bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create BFD: %E\n"));
++      fatal (_("%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -734,7 +734,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 
+ 	group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  einfo (_("%F%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ 
+diff --git a/ld/emultempl/avrelf.em b/ld/emultempl/avrelf.em
+index 3fe81004..dd5b57d1 100644
+--- a/ld/emultempl/avrelf.em
++++ b/ld/emultempl/avrelf.em
+@@ -116,7 +116,7 @@ avr_elf_create_output_section_statements (void)
+ 
+   if (bfd_get_flavour (link_info.output_bfd) != bfd_target_elf_flavour)
+     {
+-      einfo (_("%F%P: error: cannot change output format "
++      fatal (_("%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "AVR");
+       return;
+     }
+diff --git a/ld/emultempl/beos.em b/ld/emultempl/beos.em
+index 844d4986..81878b02 100644
+--- a/ld/emultempl/beos.em
++++ b/ld/emultempl/beos.em
+@@ -227,7 +227,7 @@ set_pe_subsystem (void)
+ 	  return;
+ 	}
+     }
+-  einfo (_("%F%P: invalid subsystem type %s\n"), optarg);
++  fatal (_("%P: invalid subsystem type %s\n"), optarg);
+ }
+ 
+ 
+@@ -237,9 +237,7 @@ set_pe_value (char *name)
+   char *end;
+   set_pe_name (name,  strtoul (optarg, &end, 0));
+   if (end == optarg)
+-    {
+-      einfo (_("%F%P: invalid hex number for PE parameter '%s'\n"), optarg);
+-    }
++    fatal (_("%P: invalid hex number for PE parameter '%s'\n"), optarg);
+ 
+   optarg = end;
+ }
+@@ -254,9 +252,7 @@ set_pe_stack_heap (char *resname, char *comname)
+       set_pe_value (comname);
+     }
+   else if (*optarg)
+-    {
+-      einfo (_("%F%P: strange hex info for PE parameter '%s'\n"), optarg);
+-    }
++    fatal (_("%P: strange hex info for PE parameter '%s'\n"), optarg);
+ }
+ 
+ 
+@@ -271,7 +267,7 @@ gld${EMULATION_NAME}_handle_option (int optc)
+     case OPTION_BASE_FILE:
+       link_info.base_file = fopen (optarg, FOPEN_WB);
+       if (link_info.base_file == NULL)
+-	einfo (_("%F%P: cannot open base file %s\n"), optarg);
++	fatal (_("%P: cannot open base file %s\n"), optarg);
+       break;
+ 
+       /* PE options */
+@@ -380,9 +376,7 @@ gld${EMULATION_NAME}_after_open (void)
+      FIXME: This should be done via a function, rather than by
+      including an internal BFD header.  */
+   if (!obj_pe (link_info.output_bfd))
+-    {
+-      einfo (_("%F%P: PE operations on non PE file\n"));
+-    }
++    fatal (_("%P: PE operations on non PE file\n"));
+ 
+   pe_data(link_info.output_bfd)->pe_opthdr = pe;
+   pe_data(link_info.output_bfd)->dll = init[DLLOFF].value;
+@@ -431,12 +425,12 @@ sort_by_file_name (const void *a, const void *b)
+ 
+       if (!bfd_get_section_contents (sa->owner, sa, &a_sec, (file_ptr) 0,
+ 				     (bfd_size_type) sizeof (a_sec)))
+-	einfo (_("%F%P: %pB: can't read contents of section .idata: %E\n"),
++	fatal (_("%P: %pB: can't read contents of section .idata: %E\n"),
+ 	       sa->owner);
+ 
+       if (!bfd_get_section_contents (sb->owner, sb, &b_sec, (file_ptr) 0,
+ 				     (bfd_size_type) sizeof (b_sec)))
+-	einfo (_("%F%P: %pB: can't read contents of section .idata: %E\n"),
++	fatal (_("%P: %pB: can't read contents of section .idata: %E\n"),
+ 	       sb->owner);
+ 
+       i = a_sec < b_sec ? -1 : 0;
+@@ -668,7 +662,7 @@ gld${EMULATION_NAME}_place_orphan (asection *s,
+   /* Everything from the '\$' on gets deleted so don't allow '\$' as the
+      first character.  */
+   if (*secname == '\$')
+-    einfo (_("%F%P: section %s has '\$' as first character\n"), secname);
++    fatal (_("%P: section %s has '\$' as first character\n"), secname);
+   if (strchr (secname + 1, '\$') == NULL)
+     return NULL;
+ 
+@@ -698,7 +692,7 @@ gld${EMULATION_NAME}_place_orphan (asection *s,
+       }
+   ps[0] = 0;
+   if (l == NULL)
+-    einfo (_("%F%P: *(%s\$) missing from linker script\n"), output_secname);
++    fatal (_("%P: *(%s\$) missing from linker script\n"), output_secname);
+ 
+   /* Link the input section in and we're done for now.
+      The sections still have to be sorted, but that has to wait until
+diff --git a/ld/emultempl/cr16elf.em b/ld/emultempl/cr16elf.em
+index 7d4f9507..5464edf1 100644
+--- a/ld/emultempl/cr16elf.em
++++ b/ld/emultempl/cr16elf.em
+@@ -58,7 +58,7 @@ cr16_elf_after_open (void)
+ 	     COFF and ELF.  */
+ 	  if (bfd_get_flavour (abfd) != bfd_target_coff_flavour
+ 	      && bfd_get_flavour (abfd) != bfd_target_elf_flavour)
+-	    einfo (_("%F%P: %pB: all input objects must be COFF or ELF "
++	    fatal (_("%P: %pB: all input objects must be COFF or ELF "
+ 		     "for --embedded-relocs\n"));
+ 
+ 	  datasec = bfd_get_section_by_name (abfd, ".data.rel");
+@@ -82,7 +82,7 @@ cr16_elf_after_open (void)
+ 						      | SEC_IN_MEMORY))
+ 		  || !bfd_set_section_alignment (relsec, 2)
+ 		  || !bfd_set_section_size (relsec, datasec->reloc_count * 8))
+-		einfo (_("%F%P: %pB: can not create .emreloc section: %E\n"));
++		fatal (_("%P: %pB: can not create .emreloc section: %E\n"));
+ 	    }
+ 
+ 	  /* Double check that all other data sections are empty, as is
+diff --git a/ld/emultempl/cskyelf.em b/ld/emultempl/cskyelf.em
+index 82815e5e..9c91d7ac 100644
+--- a/ld/emultempl/cskyelf.em
++++ b/ld/emultempl/cskyelf.em
+@@ -151,7 +151,7 @@ csky_elf_create_output_section_statements (void)
+ 	  bfd_get_arch (link_info.output_bfd),
+ 	  bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create BFD: %E\n"));
++      fatal (_("%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -324,7 +324,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 
+       group_size = bfd_scan_vma (optarg, &end, 0);
+       if (*end)
+-	einfo (_("%F%P: invalid number `%s'\''\n"), optarg);
++	fatal (_("%P: invalid number `%s'\''\n"), optarg);
+     }
+     break;
+ '
+diff --git a/ld/emultempl/elf.em b/ld/emultempl/elf.em
+index 71cec19f..5cc38194 100644
+--- a/ld/emultempl/elf.em
++++ b/ld/emultempl/elf.em
+@@ -667,13 +667,13 @@ gld${EMULATION_NAME}_handle_option (int optc)
+ 	{
+ #ifndef HAVE_ZSTD
+ 	  if (config.compress_debug == COMPRESS_DEBUG_ZSTD)
+-	    einfo (_ ("%F%P: --compress-debug-sections=zstd: ld is not built "
+-		  "with zstd support\n"));
++           fatal (_("%P: --compress-debug-sections=zstd: ld is not built "
++                    "with zstd support\n"));
+ #endif
+ 	}
+       if (config.compress_debug == COMPRESS_UNKNOWN)
+-	einfo (_("%F%P: invalid --compress-debug-sections option: \`%s'\n"),
+-	       optarg);
++       fatal (_("%P: invalid --compress-debug-sections option: \`%s'\n"),
++               optarg);
+       break;
+ EOF
+ 
+@@ -727,7 +727,7 @@ fragment <<EOF
+ 	  link_info.emit_gnu_hash = true;
+ 	}
+       else
+-	einfo (_("%F%P: invalid hash style \`%s'\n"), optarg);
++	fatal (_("%P: invalid hash style \`%s'\n"), optarg);
+       break;
+ 
+ EOF
+@@ -747,7 +747,7 @@ fragment <<EOF
+ 	  link_info.maxpagesize = strtoul (optarg + 14, &end, 0);
+ 	  if (*end
+ 	      || (link_info.maxpagesize & (link_info.maxpagesize - 1)) != 0)
+-	    einfo (_("%F%P: invalid maximum page size \`%s'\n"),
++	    fatal (_("%P: invalid maximum page size \`%s'\n"),
+ 		   optarg + 14);
+ 	  link_info.maxpagesize_is_set = true;
+ 	}
+@@ -757,7 +757,7 @@ fragment <<EOF
+ 	  link_info.commonpagesize = strtoul (optarg + 17, &end, 0);
+ 	  if (*end
+ 	      || (link_info.commonpagesize & (link_info.commonpagesize - 1)) != 0)
+-	    einfo (_("%F%P: invalid common page size \`%s'\n"),
++	    fatal (_("%P: invalid common page size \`%s'\n"),
+ 		   optarg + 17);
+ 	  link_info.commonpagesize_is_set = true;
+ 	}
+@@ -766,7 +766,7 @@ fragment <<EOF
+ 	  char *end;
+ 	  link_info.stacksize = strtoul (optarg + 11, &end, 0);
+ 	  if (*end || link_info.stacksize < 0)
+-	    einfo (_("%F%P: invalid stack size \`%s'\n"), optarg + 11);
++	    fatal (_("%P: invalid stack size \`%s'\n"), optarg + 11);
+ 	  if (!link_info.stacksize)
+ 	    /* Use -1 for explicit no-stack, because zero means
+ 	       'default'.   */
+@@ -805,7 +805,7 @@ fragment <<EOF
+ 	  else if (strcmp (optarg, "start-stop-visibility=protected") == 0)
+ 	    link_info.start_stop_visibility = STV_PROTECTED;
+ 	  else
+-	    einfo (_("%F%P: invalid visibility in \`-z %s'; "
++	    fatal (_("%P: invalid visibility in \`-z %s'; "
+ 		     "must be default, internal, hidden, or protected"),
+ 		   optarg);
+ 	}
+diff --git a/ld/emultempl/hppaelf.em b/ld/emultempl/hppaelf.em
+index 09db0cb0..f0284ea3 100644
+--- a/ld/emultempl/hppaelf.em
++++ b/ld/emultempl/hppaelf.em
+@@ -82,7 +82,7 @@ hppaelf_create_output_section_statements (void)
+ 			      bfd_get_arch (link_info.output_bfd),
+ 			      bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create BFD: %E\n"));
++      fatal (_("%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -351,7 +351,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	const char *end;
+ 	group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  einfo (_("%F%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ '
+diff --git a/ld/emultempl/kvxelf.em b/ld/emultempl/kvxelf.em
+index 2076c5b6..1ffbd1db 100644
+--- a/ld/emultempl/kvxelf.em
++++ b/ld/emultempl/kvxelf.em
+@@ -35,9 +35,8 @@ elf${ELFSIZE}_kvx_before_allocation (void)
+ EOF
+ if test x"${EMULATION_NAME}" != x"elf64kvx_linux"; then
+ fragment <<EOF
+-  if (bfd_link_pie (&link_info)) {
+-          einfo (_("%F:%P: -pie not supported\n"));
+-  }
++  if (bfd_link_pie (&link_info))
++    fatal (_(":%P: -pie not supported\n"));
+ EOF
+ fi
+ fragment <<EOF
+@@ -300,7 +299,7 @@ kvx_elf_create_output_section_statements (void)
+   ldlang_add_file (stub_file);
+ 
+   if (!kvx_elf${ELFSIZE}_init_stub_bfd (&link_info, stub_file->the_bfd))
+-    einfo ("%F%P: can not init BFD: %E\n");
++    einfo ("%P: can not init BFD: %E\n");
+ }
+ 
+ 
+diff --git a/ld/emultempl/loongarchelf.em b/ld/emultempl/loongarchelf.em
+index 3bb5ddf0..5a3d7b79 100644
+--- a/ld/emultempl/loongarchelf.em
++++ b/ld/emultempl/loongarchelf.em
+@@ -67,11 +67,11 @@ gld${EMULATION_NAME}_after_allocation (void)
+       && !bfd_link_relocatable (&link_info))
+     {
+       if (lang_phdr_list == NULL)
+-        elf_seg_map (link_info.output_bfd) = NULL;
++	elf_seg_map (link_info.output_bfd) = NULL;
+       if (!_bfd_elf_map_sections_to_segments (link_info.output_bfd,
+ 					      &link_info,
+ 					      NULL))
+-        einfo (_("%F%P: map sections to segments failed: %E\n"));
++	fatal (_("%P: map sections to segments failed: %E\n"));
+     }
+ 
+   /* Adjust program header size and .eh_frame_hdr size before
+diff --git a/ld/emultempl/m68hc1xelf.em b/ld/emultempl/m68hc1xelf.em
+index 5355b0fc..36f5f068 100644
+--- a/ld/emultempl/m68hc1xelf.em
++++ b/ld/emultempl/m68hc1xelf.em
+@@ -159,7 +159,7 @@ m68hc11elf_create_output_section_statements (void)
+ 			     bfd_get_arch (link_info.output_bfd),
+ 			     bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create BFD: %E\n"));
++      fatal (_("%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+diff --git a/ld/emultempl/m68kelf.em b/ld/emultempl/m68kelf.em
+index 0477f1eb..f9a5bec2 100644
+--- a/ld/emultempl/m68kelf.em
++++ b/ld/emultempl/m68kelf.em
+@@ -82,7 +82,7 @@ m68k_elf_after_open (void)
+ 	  asection *datasec;
+ 
+ 	  if (bfd_get_flavour (abfd) != bfd_target_elf_flavour)
+-	    einfo (_("%F%P: %pB: all input objects must be ELF "
++	    fatal (_("%P: %pB: all input objects must be ELF "
+ 		     "for --embedded-relocs\n"));
+ 
+ 	  datasec = bfd_get_section_by_name (abfd, ".data");
+@@ -106,7 +106,7 @@ m68k_elf_after_open (void)
+ 	      if (relsec == NULL
+ 		  || !bfd_set_section_alignment (relsec, 2)
+ 		  || !bfd_set_section_size (relsec, datasec->reloc_count * 12))
+-		einfo (_("%F%P: %pB: can not create .emreloc section: %E\n"));
++		fatal (_("%P: %pB: can not create .emreloc section: %E\n"));
+ 	    }
+ 
+ 	  /* Double check that all other data sections are empty, as is
+diff --git a/ld/emultempl/metagelf.em b/ld/emultempl/metagelf.em
+index 81ab64c1..313d7ed5 100644
+--- a/ld/emultempl/metagelf.em
++++ b/ld/emultempl/metagelf.em
+@@ -59,7 +59,7 @@ metagelf_create_output_section_statements (void)
+ 			      bfd_get_arch (link_info.output_bfd),
+ 			      bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create BFD: %E\n"));
++      fatal (_("%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -309,7 +309,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	const char *end;
+ 	group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  einfo (_("%F%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ '
+diff --git a/ld/emultempl/mipself.em b/ld/emultempl/mipself.em
+index f8fe4b97..2a22ba49 100644
+--- a/ld/emultempl/mipself.em
++++ b/ld/emultempl/mipself.em
+@@ -152,7 +152,7 @@ mips_add_stub_section (const char *stub_sec_name, asection *input_section,
+ 				 bfd_get_arch (link_info.output_bfd),
+ 				 bfd_get_mach (link_info.output_bfd)))
+ 	{
+-	  einfo (_("%F%P: can not create BFD: %E\n"));
++	  fatal (_("%P: can not create BFD: %E\n"));
+ 	  return NULL;
+ 	}
+       stub_bfd->flags |= BFD_LINKER_CREATED;
+diff --git a/ld/emultempl/mmix-elfnmmo.em b/ld/emultempl/mmix-elfnmmo.em
+index f2ecbba3..03186363 100644
+--- a/ld/emultempl/mmix-elfnmmo.em
++++ b/ld/emultempl/mmix-elfnmmo.em
+@@ -113,10 +113,7 @@ mmix_after_allocation (void)
+     bfd_set_section_vma (sec, 0);
+ 
+   if (!_bfd_mmix_after_linker_allocation (link_info.output_bfd, &link_info))
+-    {
+-      /* This is a fatal error; make einfo call not return.  */
+-      einfo (_("%F%P: can't finalize linker-allocated global registers\n"));
+-    }
++    fatal (_("%P: can't finalize linker-allocated global registers\n"));
+ }
+ EOF
+ 
+diff --git a/ld/emultempl/nds32elf.em b/ld/emultempl/nds32elf.em
+index bde9e35d..36260573 100644
+--- a/ld/emultempl/nds32elf.em
++++ b/ld/emultempl/nds32elf.em
+@@ -44,7 +44,7 @@ nds32_elf_create_output_section_statements (void)
+   if (strstr (bfd_get_target (link_info.output_bfd), "nds32") == NULL)
+     {
+       /* Check the output target is nds32.  */
+-      einfo (_("%F%P: error: cannot change output format whilst "
++      fatal (_("%P: error: cannot change output format whilst "
+ 	       "linking %s binaries\n"), "NDS32");
+       return;
+     }
+@@ -96,7 +96,7 @@ nds32_elf_after_open (void)
+ 	       && abi_ver != (elf_elfheader (abfd)->e_flags & EF_NDS_ABI))
+ 	{
+ 	  /* Incompatible objects.  */
+-	  einfo (_("%F%P: %pB: ABI version of object files mismatched\n"),
++	  fatal (_("%P: %pB: ABI version of object files mismatched\n"),
+ 		 abfd);
+ 	}
+     }
+@@ -195,7 +195,7 @@ PARSE_AND_LIST_ARGS_CASES='
+       {
+ 	sym_ld_script = fopen (optarg, FOPEN_WT);
+ 	if(sym_ld_script == NULL)
+-	  einfo (_("%F%P: cannot open map file %s: %E\n"), optarg);
++	  fatal (_("%P: cannot open map file %s: %E\n"), optarg);
+       }
+     break;
+   case OPTION_HYPER_RELAX:
+diff --git a/ld/emultempl/nto.em b/ld/emultempl/nto.em
+index de69e132..609d0217 100644
+--- a/ld/emultempl/nto.em
++++ b/ld/emultempl/nto.em
+@@ -51,7 +51,7 @@ nto_create_QNX_note_section(int type)
+      is called before this function, stub_file should already be defined.  */
+   if (!stub_file)
+     {
+-      einfo (_("%F%P: cannot create .note section in stub BFD.\n"));
++      fatal (_("%P: cannot create .note section in stub BFD.\n"));
+       return NULL;
+     }
+ 
+@@ -60,7 +60,7 @@ nto_create_QNX_note_section(int type)
+   note_sec = bfd_make_section_anyway_with_flags (stub_file->the_bfd, ".note", flags);
+   if (! note_sec)
+     {
+-      einfo (_("%F%P: failed to create .note section\n"));
++      fatal (_("%P: failed to create .note section\n"));
+       return NULL;
+     }
+ 
+@@ -101,7 +101,7 @@ nto_lookup_QNX_note_section(int type)
+       sec->contents = xmalloc(sec->size);
+       if (!bfd_get_section_contents (sec->owner, sec, sec->contents, (file_ptr) 0,
+ 				     sec->size))
+-	einfo (_("%F%P: %pB: can't read contents of section .note: %E\n"),
++	fatal (_("%P: %pB: can't read contents of section .note: %E\n"),
+ 	       sec->owner);
+ 
+       e_note = (Elf_External_Note *) sec->contents;
+@@ -144,7 +144,7 @@ nto_add_note_section (void) {
+ 
+   if (nto_lazy_stack && !link_info.stacksize)
+     {
+-      einfo (_("%F%P: error: --lazy-stack must follow -zstack-size=<size>\n"));
++      fatal (_("%P: error: --lazy-stack must follow -zstack-size=<size>\n"));
+       return;
+     }
+ 
+@@ -206,22 +206,22 @@ PARSE_AND_LIST_LONGOPTS=${PARSE_AND_LIST_LONGOPTS}'
+ PARSE_AND_LIST_OPTIONS=${PARSE_AND_LIST_OPTIONS}'
+   fprintf (file, _("\
+   --stack <size>              Set size of the initial stack\n\
+-  --lazy-stack		      Set lazy allocation of stack\n\
++  --lazy-stack                Set lazy allocation of stack\n\
+ "));
+ '
+ 
+ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+     case OPTION_STACK:
+       {
+-        char *end;
+-        link_info.stacksize = strtoul (optarg, &end, 0);
+-        if (*end || link_info.stacksize < 0)
+-          einfo (_("%F%P: invalid stack size `%s'\''\n"), optarg + 11);
+-        if (!link_info.stacksize)
+-          /* Use -1 for explicit no-stack, because zero means
+-             'default'.   */
+-          link_info.stacksize = -1;
+-        break;
++	char *end;
++	link_info.stacksize = strtoul (optarg, &end, 0);
++	if (*end || link_info.stacksize < 0)
++	  fatal (_("%P: invalid stack size `%s'\''\n"), optarg + 11);
++	if (!link_info.stacksize)
++	  /* Use -1 for explicit no-stack, because zero means
++	     'default'.   */
++	  link_info.stacksize = -1;
++	break;
+       }
+     case OPTION_LAZY_STACK:
+       nto_lazy_stack = true;
+diff --git a/ld/emultempl/pe.em b/ld/emultempl/pe.em
+index c6ed1110..4cb1488e 100644
+--- a/ld/emultempl/pe.em
++++ b/ld/emultempl/pe.em
+@@ -726,7 +726,7 @@ set_pe_subsystem (void)
+ 
+       if (v[i].name == NULL)
+ 	{
+-	  einfo (_("%F%P: invalid subsystem type %s\n"), optarg);
++	  fatal (_("%P: invalid subsystem type %s\n"), optarg);
+ 	  return;
+ 	}
+ 
+@@ -747,7 +747,7 @@ set_pe_value (char *name)
+   set_pe_name (name,  strtoul (optarg, &end, 0));
+ 
+   if (end == optarg)
+-    einfo (_("%F%P: invalid hex number for PE parameter '%s'\n"), optarg);
++    fatal (_("%P: invalid hex number for PE parameter '%s'\n"), optarg);
+ 
+   optarg = end;
+ }
+@@ -764,7 +764,7 @@ set_pe_stack_heap (char *resname, char *comname)
+       set_pe_value (comname);
+     }
+   else if (*optarg)
+-    einfo (_("%F%P: strange hex info for PE parameter '%s'\n"), optarg);
++    fatal (_("%P: strange hex info for PE parameter '%s'\n"), optarg);
+ }
+ 
+ #define DEFAULT_BUILD_ID_STYLE	"md5"
+@@ -780,7 +780,7 @@ gld${EMULATION_NAME}_handle_option (int optc)
+     case OPTION_BASE_FILE:
+       link_info.base_file = fopen (optarg, FOPEN_WB);
+       if (link_info.base_file == NULL)
+-	einfo (_("%F%P: cannot open base file %s\n"), optarg);
++	fatal (_("%P: cannot open base file %s\n"), optarg);
+       break;
+ 
+       /* PE options.  */
+@@ -1309,7 +1309,7 @@ make_runtime_ref (void)
+     = bfd_wrapped_link_hash_lookup (link_info.output_bfd, &link_info,
+ 				    rr, true, false, true);
+   if (!h)
+-    einfo (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
++    fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
+   else
+     {
+       if (h->type == bfd_link_hash_new)
+@@ -1607,7 +1607,7 @@ gld${EMULATION_NAME}_after_open (void)
+   if (bfd_get_flavour (link_info.output_bfd) != bfd_target_coff_flavour
+       || coff_data (link_info.output_bfd) == NULL
+       || !obj_pe (link_info.output_bfd))
+-    einfo (_("%F%P: cannot perform PE operations on non PE output file '%pB'\n"),
++    fatal (_("%P: cannot perform PE operations on non PE output file '%pB'\n"),
+ 	   link_info.output_bfd);
+ 
+   pe_data (link_info.output_bfd)->pe_opthdr = pe;
+@@ -1680,7 +1680,7 @@ gld${EMULATION_NAME}_after_open (void)
+ 	 These will only be created if the output format is an arm format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      einfo (_("%F%P: error: cannot change output format "
++      fatal (_("%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "ARM");
+       return;
+     }
+@@ -1740,7 +1740,7 @@ gld${EMULATION_NAME}_after_open (void)
+ 
+ 		    if (!bfd_generic_link_read_symbols (is->the_bfd))
+ 		      {
+-			einfo (_("%F%P: %pB: could not read symbols: %E\n"),
++			fatal (_("%P: %pB: could not read symbols: %E\n"),
+ 			       is->the_bfd);
+ 			return;
+ 		      }
+@@ -1912,7 +1912,7 @@ gld${EMULATION_NAME}_after_open (void)
+ 
+ 		if (!bfd_generic_link_read_symbols (is->the_bfd))
+ 		  {
+-		    einfo (_("%F%P: %pB: could not read symbols: %E\n"),
++		    fatal (_("%P: %pB: could not read symbols: %E\n"),
+ 			   is->the_bfd);
+ 		    return;
+ 		  }
+@@ -2023,7 +2023,7 @@ gld${EMULATION_NAME}_unrecognized_file (lang_input_statement_type *entry ATTRIBU
+ 
+ 	      h = bfd_link_hash_lookup (link_info.hash, buf, true, true, true);
+ 	      if (h == (struct bfd_link_hash_entry *) NULL)
+-		einfo (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
++		fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
+ 	      if (h->type == bfd_link_hash_new)
+ 		{
+ 		  h->type = bfd_link_hash_undefined;
+diff --git a/ld/emultempl/pep.em b/ld/emultempl/pep.em
+index bd2ee2ed..2d033dd3 100644
+--- a/ld/emultempl/pep.em
++++ b/ld/emultempl/pep.em
+@@ -698,7 +698,7 @@ set_pep_subsystem (void)
+ 
+       if (v[i].name == NULL)
+ 	{
+-	  einfo (_("%F%P: invalid subsystem type %s\n"), optarg);
++	  fatal (_("%P: invalid subsystem type %s\n"), optarg);
+ 	  return;
+ 	}
+ 
+@@ -719,7 +719,7 @@ set_pep_value (char *name)
+   set_pep_name (name,  (bfd_vma) strtoull (optarg, &end, 0));
+ 
+   if (end == optarg)
+-    einfo (_("%F%P: invalid hex number for PE parameter '%s'\n"), optarg);
++    fatal (_("%P: invalid hex number for PE parameter '%s'\n"), optarg);
+ 
+   optarg = end;
+ }
+@@ -736,7 +736,7 @@ set_pep_stack_heap (char *resname, char *comname)
+       set_pep_value (comname);
+     }
+   else if (*optarg)
+-    einfo (_("%F%P: strange hex info for PE parameter '%s'\n"), optarg);
++    fatal (_("%P: strange hex info for PE parameter '%s'\n"), optarg);
+ }
+ 
+ #define DEFAULT_BUILD_ID_STYLE	"md5"
+@@ -753,7 +753,7 @@ gld${EMULATION_NAME}_handle_option (int optc)
+     case OPTION_BASE_FILE:
+       link_info.base_file = fopen (optarg, FOPEN_WB);
+       if (link_info.base_file == NULL)
+-	einfo (_("%F%P: cannot open base file %s\n"), optarg);
++	fatal (_("%P: cannot open base file %s\n"), optarg);
+       break;
+ 
+       /* PE options.  */
+@@ -1306,7 +1306,7 @@ make_runtime_ref (void)
+     = bfd_wrapped_link_hash_lookup (link_info.output_bfd, &link_info,
+ 				    rr, true, false, true);
+   if (!h)
+-    einfo (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
++    fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
+   else
+     {
+       if (h->type == bfd_link_hash_new)
+@@ -1606,7 +1606,7 @@ gld${EMULATION_NAME}_after_open (void)
+   if (bfd_get_flavour (link_info.output_bfd) != bfd_target_coff_flavour
+       || coff_data (link_info.output_bfd) == NULL
+       || !obj_pe (link_info.output_bfd))
+-    einfo (_("%F%P: cannot perform PE operations on non PE output file '%pB'\n"),
++    fatal (_("%P: cannot perform PE operations on non PE output file '%pB'\n"),
+ 	   link_info.output_bfd);
+ 
+   pe_data (link_info.output_bfd)->pe_opthdr = pep;
+@@ -1718,7 +1718,7 @@ gld${EMULATION_NAME}_after_open (void)
+ 
+ 		    if (!bfd_generic_link_read_symbols (is->the_bfd))
+ 		      {
+-			einfo (_("%F%P: %pB: could not read symbols: %E\n"),
++			fatal (_("%P: %pB: could not read symbols: %E\n"),
+ 			       is->the_bfd);
+ 			return;
+ 		      }
+@@ -1907,7 +1907,7 @@ gld${EMULATION_NAME}_unrecognized_file (lang_input_statement_type *entry ATTRIBU
+ 
+ 	      h = bfd_link_hash_lookup (link_info.hash, buf, true, true, true);
+ 	      if (h == (struct bfd_link_hash_entry *) NULL)
+-		einfo (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
++		fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
+ 	      if (h->type == bfd_link_hash_new)
+ 		{
+ 		  h->type = bfd_link_hash_undefined;
+diff --git a/ld/emultempl/ppc32elf.em b/ld/emultempl/ppc32elf.em
+index 0730a05e..ffacadc6 100644
+--- a/ld/emultempl/ppc32elf.em
++++ b/ld/emultempl/ppc32elf.em
+@@ -386,7 +386,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	  char *end;
+ 	  unsigned long val = strtoul (optarg, &end, 0);
+ 	  if (*end || val > 5)
+-	    einfo (_("%F%P: invalid --plt-align `%s'\''\n"), optarg);
++	    fatal (_("%P: invalid --plt-align `%s'\''\n"), optarg);
+ 	  params.plt_stub_align = val;
+ 	}
+       else
+@@ -419,7 +419,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	  if (*end
+ 	      || (params.pagesize < 4096 && params.pagesize != 0)
+ 	      || params.pagesize != (params.pagesize & -params.pagesize))
+-	    einfo (_("%F%P: invalid pagesize `%s'\''\n"), optarg);
++	    fatal (_("%P: invalid pagesize `%s'\''\n"), optarg);
+ 	}
+       break;
+ 
+diff --git a/ld/emultempl/ppc64elf.em b/ld/emultempl/ppc64elf.em
+index 533caed2..92bf4f58 100644
+--- a/ld/emultempl/ppc64elf.em
++++ b/ld/emultempl/ppc64elf.em
+@@ -91,7 +91,7 @@ ppc_create_output_section_statements (void)
+ 			     bfd_get_arch (link_info.output_bfd),
+ 			     bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create BFD: %E\n"));
++      fatal (_("%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -101,7 +101,7 @@ ppc_create_output_section_statements (void)
+   if (params.save_restore_funcs < 0)
+     params.save_restore_funcs = !bfd_link_relocatable (&link_info);
+   if (!ppc64_elf_init_stub_bfd (&link_info, &params))
+-    einfo (_("%F%P: can not init BFD: %E\n"));
++    fatal (_("%P: can not init BFD: %E\n"));
+ }
+ 
+ /* Called after opening files but before mapping sections.  */
+@@ -860,7 +860,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	const char *end;
+ 	params.group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  einfo (_("%F%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -886,7 +886,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	  char *end;
+ 	  long val = strtol (optarg, &end, 0);
+ 	  if (*end || (unsigned long) val + 8 > 16)
+-	    einfo (_("%F%P: invalid --plt-align `%s'\''\n"), optarg);
++	    fatal (_("%P: invalid --plt-align `%s'\''\n"), optarg);
+ 	  params.plt_stub_align = val;
+ 	}
+       else
+@@ -915,7 +915,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	  else if (strcasecmp (optarg, "no") == 0)
+ 	    params.power10_stubs = 0;
+ 	  else
+-	    einfo (_("%F%P: invalid --power10-stubs argument `%s'\''\n"),
++	    fatal (_("%P: invalid --power10-stubs argument `%s'\''\n"),
+ 		   optarg);
+ 	}
+       else
+diff --git a/ld/emultempl/riscvelf.em b/ld/emultempl/riscvelf.em
+index fe53b2a7..006e4edb 100644
+--- a/ld/emultempl/riscvelf.em
++++ b/ld/emultempl/riscvelf.em
+@@ -141,7 +141,7 @@ riscv_create_output_section_statements (void)
+ 	 These will only be created if the output format is a RISC-V format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      einfo (_("%F%P: error: cannot change output format"
++      fatal (_("%P: error: cannot change output format"
+ 	       " whilst linking %s binaries\n"), "RISC-V");
+       return;
+     }
+diff --git a/ld/emultempl/s390.em b/ld/emultempl/s390.em
+index 11e7f19b..0a93d76b 100644
+--- a/ld/emultempl/s390.em
++++ b/ld/emultempl/s390.em
+@@ -34,7 +34,7 @@ static void
+ s390_elf_create_output_section_statements (void)
+ {
+   if (!bfd_elf_s390_set_options (&link_info, &params))
+-    einfo (_("%F%P: can not init BFD: %E\n"));
++    fatal (_("%P: can not init BFD: %E\n"));
+ }
+ 
+ EOF
+diff --git a/ld/emultempl/scoreelf.em b/ld/emultempl/scoreelf.em
+index 6238b5e2..6413f330 100644
+--- a/ld/emultempl/scoreelf.em
++++ b/ld/emultempl/scoreelf.em
+@@ -62,7 +62,7 @@ score_elf_after_open (void)
+ 	 These will only be created if the output format is an score format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      einfo (_("%F%P: error: cannot change output format "
++      fatal (_("%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "S+core");
+       return;
+     }
+diff --git a/ld/emultempl/spuelf.em b/ld/emultempl/spuelf.em
+index cc39435c..c694b828 100644
+--- a/ld/emultempl/spuelf.em
++++ b/ld/emultempl/spuelf.em
+@@ -202,7 +202,7 @@ spu_elf_load_ovl_mgr (void)
+       /* User supplied __ovly_load.  */
+     }
+   else if (mgr_stream->start == mgr_stream->end)
+-    einfo (_("%F%P: no built-in overlay manager\n"));
++    fatal (_("%P: no built-in overlay manager\n"));
+   else
+     {
+       lang_input_statement_type *ovl_is;
+@@ -379,7 +379,7 @@ spu_elf_open_overlay_script (void)
+   if (script == NULL)
+     {
+     file_err:
+-      einfo (_("%F%P: can not open script: %E\n"));
++      fatal (_("%P: can not open script: %E\n"));
+     }
+   return script;
+ }
+@@ -719,7 +719,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	    if (*end == 0)
+ 	      break;
+ 	  }
+-	einfo (_("%F%P: invalid --local-store address range `%s'\''\n"), optarg);
++	fatal (_("%P: invalid --local-store address range `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -755,12 +755,12 @@ PARSE_AND_LIST_ARGS_CASES='
+       if (!num_lines_set)
+ 	params.num_lines = 32;
+       else if ((params.num_lines & -params.num_lines) != params.num_lines)
+-	einfo (_("%F%P: invalid --num-lines/--num-regions `%u'\''\n"),
++	fatal (_("%P: invalid --num-lines/--num-regions `%u'\''\n"),
+ 	       params.num_lines);
+       if (!line_size_set)
+ 	params.line_size = 1024;
+       else if ((params.line_size & -params.line_size) != params.line_size)
+-	einfo (_("%F%P: invalid --line-size/--region-size `%u'\''\n"),
++	fatal (_("%P: invalid --line-size/--region-size `%u'\''\n"),
+ 	       params.line_size);
+       break;
+ 
+@@ -781,7 +781,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	    && (params.ovly_flavour != ovly_soft_icache
+ 		|| (params.num_lines & -params.num_lines) == params.num_lines))
+ 	  break;
+-	einfo (_("%F%P: invalid --num-lines/--num-regions `%s'\''\n"), optarg);
++	fatal (_("%P: invalid --num-lines/--num-regions `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -794,7 +794,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	    && (params.ovly_flavour != ovly_soft_icache
+ 		|| (params.line_size & -params.line_size) == params.line_size))
+ 	  break;
+-	einfo (_("%F%P: invalid --line-size/--region-size `%s'\''\n"), optarg);
++	fatal (_("%P: invalid --line-size/--region-size `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -803,7 +803,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	char *end;
+ 	params.auto_overlay_fixed = strtoul (optarg, &end, 0);
+ 	if (*end != 0)
+-	  einfo (_("%F%P: invalid --fixed-space value `%s'\''\n"), optarg);
++	  fatal (_("%P: invalid --fixed-space value `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -812,7 +812,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	char *end;
+ 	params.auto_overlay_reserved = strtoul (optarg, &end, 0);
+ 	if (*end != 0)
+-	  einfo (_("%F%P: invalid --reserved-space value `%s'\''\n"), optarg);
++	  fatal (_("%P: invalid --reserved-space value `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -821,7 +821,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	char *end;
+ 	params.extra_stack_space = strtol (optarg, &end, 0);
+ 	if (*end != 0)
+-	  einfo (_("%F%P: invalid --extra-stack-space value `%s'\''\n"), optarg);
++	  fatal (_("%P: invalid --extra-stack-space value `%s'\''\n"), optarg);
+       }
+       break;
+ 
+diff --git a/ld/emultempl/tic6xdsbt.em b/ld/emultempl/tic6xdsbt.em
+index 524e3f73..a830be7e 100644
+--- a/ld/emultempl/tic6xdsbt.em
++++ b/ld/emultempl/tic6xdsbt.em
+@@ -59,10 +59,8 @@ tic6x_after_open (void)
+   if (is_tic6x_target ())
+     {
+       if (params.dsbt_index >= params.dsbt_size)
+-	{
+-	  einfo (_("%F%P: invalid --dsbt-index %d, outside DSBT size\n"),
+-		 params.dsbt_index);
+-	}
++	fatal (_("%P: invalid --dsbt-index %d, outside DSBT size\n"),
++	       params.dsbt_index);
+       elf32_tic6x_setup (&link_info, &params);
+     }
+ 
+@@ -192,7 +190,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	if (*end == 0
+ 	    && params.dsbt_index >= 0 && params.dsbt_index < 0x7fff)
+ 	  break;
+-	einfo (_("%F%P: invalid --dsbt-index %s\n"), optarg);
++	fatal (_("%P: invalid --dsbt-index %s\n"), optarg);
+       }
+       break;
+     case OPTION_DSBT_SIZE:
+@@ -202,7 +200,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	if (*end == 0
+ 	    && params.dsbt_size >= 0 && params.dsbt_size < 0x7fff)
+ 	  break;
+-	einfo (_("%F%P: invalid --dsbt-size %s\n"), optarg);
++	fatal (_("%P: invalid --dsbt-size %s\n"), optarg);
+       }
+       break;
+    case OPTION_NO_MERGE_EXIDX_ENTRIES:
+diff --git a/ld/emultempl/ticoff.em b/ld/emultempl/ticoff.em
+index 4b048bef..bbf30f4a 100644
+--- a/ld/emultempl/ticoff.em
++++ b/ld/emultempl/ticoff.em
+@@ -88,9 +88,7 @@ gld${EMULATION_NAME}_handle_option (int optc)
+ 	  lang_add_output_format (buf, NULL, NULL, 0);
+ 	}
+       else
+-	{
+-	  einfo (_("%F%P: invalid COFF format version %s\n"), optarg);
+-	}
++	fatal (_("%P: invalid COFF format version %s\n"), optarg);
+       break;
+     }
+   return false;
+diff --git a/ld/emultempl/v850elf.em b/ld/emultempl/v850elf.em
+index 7bcd45f3..49ad2cc8 100644
+--- a/ld/emultempl/v850elf.em
++++ b/ld/emultempl/v850elf.em
+@@ -63,7 +63,7 @@ v850_create_output_section_statements (void)
+ 	 These will only be created if the output format is an arm format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      einfo (_("%F%P: error: cannot change output format"
++      fatal (_("%P: error: cannot change output format"
+ 	       " whilst linking %s binaries\n"), "V850");
+       return;
+     }
+diff --git a/ld/emultempl/vms.em b/ld/emultempl/vms.em
+index 67e9ea64..4ca2c942 100644
+--- a/ld/emultempl/vms.em
++++ b/ld/emultempl/vms.em
+@@ -201,7 +201,7 @@ gld${EMULATION_NAME}_before_allocation (void)
+       && bed->elf_backend_size_dynamic_sections
+       && ! (*bed->elf_backend_size_dynamic_sections) (link_info.output_bfd,
+ 						      &link_info))
+-    einfo (_("%F%P: failed to set dynamic section sizes: %E\n"));
++    fatal (_("%P: failed to set dynamic section sizes: %E\n"));
+ 
+   before_allocation_default ();
+ }
+diff --git a/ld/emultempl/xtensaelf.em b/ld/emultempl/xtensaelf.em
+index 51293539..208f730d 100644
+--- a/ld/emultempl/xtensaelf.em
++++ b/ld/emultempl/xtensaelf.em
+@@ -388,7 +388,7 @@ check_xtensa_info (bfd *abfd, asection *info_sec)
+ 
+   data = xmalloc (info_sec->size);
+   if (! bfd_get_section_contents (abfd, info_sec, data, 0, info_sec->size))
+-    einfo (_("%F%P: %pB: cannot read contents of section %pA\n"), abfd, info_sec);
++    fatal (_("%P: %pB: cannot read contents of section %pA\n"), abfd, info_sec);
+ 
+   if (info_sec->size > 24
+       && info_sec->size >= 24 + bfd_get_32 (abfd, data + 4)
+@@ -429,13 +429,13 @@ elf_xtensa_before_allocation (void)
+   if (is_big_endian
+       && link_info.output_bfd->xvec->byteorder == BFD_ENDIAN_LITTLE)
+     {
+-      einfo (_("%F%P: little endian output does not match "
++      fatal (_("%P: little endian output does not match "
+ 	       "Xtensa configuration\n"));
+     }
+   if (!is_big_endian
+       && link_info.output_bfd->xvec->byteorder == BFD_ENDIAN_BIG)
+     {
+-      einfo (_("%F%P: big endian output does not match "
++      fatal (_("%P: big endian output does not match "
+ 	       "Xtensa configuration\n"));
+     }
+ 
+@@ -454,7 +454,7 @@ elf_xtensa_before_allocation (void)
+ 	 cannot go any further if there are any mismatches.  */
+       if ((is_big_endian && f->the_bfd->xvec->byteorder == BFD_ENDIAN_LITTLE)
+ 	  || (!is_big_endian && f->the_bfd->xvec->byteorder == BFD_ENDIAN_BIG))
+-	einfo (_("%F%P: cross-endian linking for %pB not supported\n"),
++	fatal (_("%P: cross-endian linking for %pB not supported\n"),
+ 	       f->the_bfd);
+ 
+       if (! first_bfd)
+@@ -485,7 +485,7 @@ elf_xtensa_before_allocation (void)
+       info_sec = bfd_make_section_with_flags (first_bfd, ".xtensa.info",
+ 					      SEC_HAS_CONTENTS | SEC_READONLY);
+       if (! info_sec)
+-	einfo (_("%F%P: failed to create .xtensa.info section\n"));
++	fatal (_("%P: failed to create .xtensa.info section\n"));
+     }
+   if (info_sec)
+     {
+@@ -1224,7 +1224,7 @@ ld_build_required_section_dependence (lang_statement_union_type *s)
+       lang_statement_union_type *l = iter_stack_current (&stack);
+ 
+       if (l == NULL && link_info.non_contiguous_regions)
+-	einfo (_("%F%P: Relaxation not supported with "
++	fatal (_("%P: Relaxation not supported with "
+ 		 "--enable-non-contiguous-regions.\n"));
+ 
+       if (l->header.type == lang_input_section_enum)
+diff --git a/ld/emultempl/z80.em b/ld/emultempl/z80.em
+index ded04136..555f6024 100644
+--- a/ld/emultempl/z80.em
++++ b/ld/emultempl/z80.em
+@@ -48,7 +48,7 @@ z80_after_open (void)
+       const bfd_arch_info_type *info;
+       info = bfd_arch_get_compatible (link_info.output_bfd, abfd, false);
+       if (info == NULL)
+-	einfo (_("%F%P: %pB: Instruction sets of object files incompatible\n"),
++	fatal (_("%P: %pB: Instruction sets of object files incompatible\n"),
+ 	       abfd);
+       else
+         bfd_set_arch_info (link_info.output_bfd, info);
+diff --git a/ld/ldcref.c b/ld/ldcref.c
+index 632506a4..572d4f4d 100644
+--- a/ld/ldcref.c
++++ b/ld/ldcref.c
+@@ -514,7 +514,7 @@ check_local_sym_xref (lang_input_statement_type *statement)
+     return;
+ 
+   if (!bfd_generic_link_read_symbols (abfd))
+-    einfo (_("%F%P: %pB: could not read symbols: %E\n"), abfd);
++    fatal (_("%P: %pB: could not read symbols: %E\n"), abfd);
+ 
+   for (syms = bfd_get_outsymbols (abfd); *syms; ++syms)
+     {
+@@ -625,7 +625,7 @@ check_refs (const char *name,
+      BFD might contain a prohibited cross reference.  */
+ 
+   if (!bfd_generic_link_read_symbols (abfd))
+-    einfo (_("%F%P: %pB: could not read symbols: %E\n"), abfd);
++    fatal (_("%P: %pB: could not read symbols: %E\n"), abfd);
+ 
+   info.sym_name = name;
+   info.global = global;
+@@ -687,14 +687,14 @@ check_reloc_refs (bfd *abfd, asection *sec, void *iarg)
+ 
+   relsize = bfd_get_reloc_upper_bound (abfd, sec);
+   if (relsize < 0)
+-    einfo (_("%F%P: %pB: could not read relocs: %E\n"), abfd);
++    fatal (_("%P: %pB: could not read relocs: %E\n"), abfd);
+   if (relsize == 0)
+     return;
+ 
+   relpp = (arelent **) xmalloc (relsize);
+   relcount = bfd_canonicalize_reloc (abfd, sec, relpp, info->asymbols);
+   if (relcount < 0)
+-    einfo (_("%F%P: %pB: could not read relocs: %E\n"), abfd);
++    fatal (_("%P: %pB: could not read relocs: %E\n"), abfd);
+ 
+   p = relpp;
+   pend = p + relcount;
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index d66e08dd..fb95b7a9 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -94,7 +94,7 @@ ldelf_after_parse (void)
+       else if (!link_info.maxpagesize_is_set)
+ 	link_info.maxpagesize = link_info.commonpagesize;
+       else
+-	einfo (_("%F%P: common page size (0x%v) > maximum page size (0x%v)\n"),
++	fatal (_("%P: common page size (0x%v) > maximum page size (0x%v)\n"),
+ 	       link_info.commonpagesize, link_info.maxpagesize);
+     }
+ }
+@@ -120,7 +120,7 @@ ldelf_load_symbols (lang_input_statement_type *entry)
+ 
+   if (entry->flags.just_syms
+       && (bfd_get_file_flags (entry->the_bfd) & DYNAMIC) != 0)
+-    einfo (_("%F%P: %pB: --just-symbols may not be used on DSO\n"),
++    fatal (_("%P: %pB: --just-symbols may not be used on DSO\n"),
+ 	   entry->the_bfd);
+ 
+   if (link_class == 0
+@@ -320,7 +320,7 @@ ldelf_try_needed (struct dt_needed *needed, int force, int is_linux)
+       struct bfd_link_needed_list *needs;
+ 
+       if (! bfd_elf_get_bfd_needed_list (abfd, &needs))
+-	einfo (_("%F%P: %pB: bfd_elf_get_bfd_needed_list failed: %E\n"), abfd);
++	fatal (_("%P: %pB: bfd_elf_get_bfd_needed_list failed: %E\n"), abfd);
+ 
+       if (needs != NULL)
+ 	{
+@@ -368,7 +368,7 @@ ldelf_try_needed (struct dt_needed *needed, int force, int is_linux)
+      can only check that using stat.  */
+ 
+   if (bfd_stat (abfd, &global_stat) != 0)
+-    einfo (_("%F%P: %pB: bfd_stat failed: %E\n"), abfd);
++    fatal (_("%P: %pB: bfd_stat failed: %E\n"), abfd);
+ 
+   /* First strip off everything before the last '/'.  */
+   soname = lbasename (bfd_get_filename (abfd));
+@@ -407,7 +407,7 @@ ldelf_try_needed (struct dt_needed *needed, int force, int is_linux)
+ 
+   /* Add this file into the symbol table.  */
+   if (! bfd_link_add_symbols (abfd, &link_info))
+-    einfo (_("%F%P: %pB: error adding symbols: %E\n"), abfd);
++    fatal (_("%P: %pB: error adding symbols: %E\n"), abfd);
+ 
+   return true;
+ }
+@@ -1205,7 +1205,7 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
+ 	  && elf_dt_name (abfd) != NULL)
+ 	{
+ 	  if (bfd_elf_add_dt_needed_tag (abfd, &link_info) < 0)
+-	    einfo (_("%F%P: failed to add DT_NEEDED dynamic tag\n"));
++	    fatal (_("%P: failed to add DT_NEEDED dynamic tag\n"));
+ 	}
+ 
+   link_info.input_bfds_tail = save_input_bfd_tail;
+@@ -1256,10 +1256,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 		     bfd_get_target (link_info.output_bfd));
+ 
+       if (link_info.out_implib_bfd == NULL)
+-	{
+-	  einfo (_("%F%P: %s: can't open for writing: %E\n"),
+-		 command_line.out_implib_filename);
+-	}
++	fatal (_("%P: %s: can't open for writing: %E\n"),
++	       command_line.out_implib_filename);
+     }
+ 
+   if (ldelf_emit_note_gnu_build_id != NULL
+@@ -1313,7 +1311,7 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 	  && (elf_tdata (abfd)->elf_header->e_type == ET_EXEC
+ 	      || (elf_tdata (abfd)->elf_header->e_type == ET_DYN
+ 		  && elf_tdata (abfd)->is_pie)))
+-	einfo (_("%F%P: cannot use executable file '%pB' as input to a link\n"),
++	fatal (_("%P: cannot use executable file '%pB' as input to a link\n"),
+ 	       abfd);
+     }
+ 
+@@ -1367,7 +1365,7 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 		}
+ 	      else if (seen_type != type)
+ 		{
+-		  einfo (_("%F%P: compact frame descriptions incompatible with"
++		  fatal (_("%P: compact frame descriptions incompatible with"
+ 			   " DWARF2 .eh_frame from %pB\n"),
+ 			 type == DWARF2_EH_HDR ? abfd : elfbfd);
+ 		  break;
+@@ -1409,7 +1407,7 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 
+   if (link_info.eh_frame_hdr_type == COMPACT_EH_HDR)
+     if (!bfd_elf_parse_eh_frame_entries (NULL, &link_info))
+-      einfo (_("%F%P: failed to parse EH frame entries\n"));
++      fatal (_("%P: failed to parse EH frame entries\n"));
+ 
+   ldelf_handle_dt_needed (htab, use_libpath, native, is_linux,
+ 			  is_freebsd, elfsize, prefix);
+@@ -1666,7 +1664,7 @@ ldelf_find_exp_assignment (etree_type *exp)
+ 					       &link_info,
+ 					       exp->assign.dst, provide,
+ 					       exp->assign.hidden))
+-	    einfo (_("%F%P: failed to record assignment to %s: %E\n"),
++	    fatal (_("%P: failed to record assignment to %s: %E\n"),
+ 		   exp->assign.dst);
+ 	}
+       ldelf_find_exp_assignment (exp->assign.src);
+@@ -1846,7 +1844,7 @@ ldelf_before_allocation (char *audit, char *depaudit,
+ 	  command_line.filter_shlib, audit, depaudit,
+ 	  (const char * const *) command_line.auxiliary_filters,
+ 	  &link_info, &sinterp)))
+-    einfo (_("%F%P: failed to set dynamic section sizes: %E\n"));
++    fatal (_("%P: failed to set dynamic section sizes: %E\n"));
+ 
+   if (sinterp != NULL)
+     {
+@@ -1883,8 +1881,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
+ 	msg = (char *) xmalloc ((size_t) (sz + 1));
+ 	if (! bfd_get_section_contents (is->the_bfd, s,	msg,
+ 					(file_ptr) 0, sz))
+-	  einfo (_("%F%P: %pB: can't read contents of section .gnu.warning: %E\n"),
+-		 is->the_bfd);
++	  fatal (_("%P: %pB: can't read contents of section %pA: %E\n"),
++		 is->the_bfd, s);
+ 	msg[sz] = '\0';
+ 	(*link_info.callbacks->warning) (&link_info, msg,
+ 					 (const char *) NULL, is->the_bfd,
+@@ -1911,7 +1909,7 @@ ldelf_before_allocation (char *audit, char *depaudit,
+   before_allocation_default ();
+ 
+   if (!bfd_elf_size_dynsym_hash_dynstr (link_info.output_bfd, &link_info))
+-    einfo (_("%F%P: failed to set dynamic section sizes: %E\n"));
++    fatal (_("%P: failed to set dynamic section sizes: %E\n"));
+ 
+   if (ehdr_start != NULL)
+     {
+diff --git a/ld/ldelfgen.c b/ld/ldelfgen.c
+index d3448546..1b1e49ce 100644
+--- a/ld/ldelfgen.c
++++ b/ld/ldelfgen.c
+@@ -282,7 +282,7 @@ ldelf_map_segments (bool need_layout)
+ 		  if (os_info->ordered != os_info->count
+ 		      && bfd_link_relocatable (&link_info))
+ 		    {
+-		      einfo (_("%F%P: "
++		      fatal (_("%P: "
+ 			       "%pA has both ordered and unordered sections\n"),
+ 			     os->bfd_section);
+ 		      return;
+@@ -307,7 +307,7 @@ ldelf_map_segments (bool need_layout)
+ 	  if (!_bfd_elf_map_sections_to_segments (link_info.output_bfd,
+ 						  &link_info,
+ 						  &need_layout))
+-	    einfo (_("%F%P: map sections to segments failed: %E\n"));
++	    fatal (_("%P: map sections to segments failed: %E\n"));
+ 
+ 	  if (phdr_size != elf_program_header_size (link_info.output_bfd))
+ 	    {
+@@ -327,7 +327,7 @@ ldelf_map_segments (bool need_layout)
+   while (need_layout && --tries);
+ 
+   if (tries == 0)
+-    einfo (_("%F%P: looping in map_segments\n"));
++    fatal (_("%P: looping in map_segments\n"));
+ 
+   if (bfd_get_flavour (link_info.output_bfd) == bfd_target_elf_flavour
+       && lang_phdr_list == NULL)
+@@ -337,9 +337,8 @@ ldelf_map_segments (bool need_layout)
+       const struct elf_backend_data *bed
+ 	= get_elf_backend_data (link_info.output_bfd);
+       if (bed->elf_backend_strip_zero_sized_dynamic_sections
+-	  && !bed->elf_backend_strip_zero_sized_dynamic_sections
+-		(&link_info))
+-	  einfo (_("%F%P: failed to strip zero-sized dynamic sections\n"));
++	  && !bed->elf_backend_strip_zero_sized_dynamic_sections (&link_info))
++	fatal (_("%P: failed to strip zero-sized dynamic sections\n"));
+     }
+ }
+ 
+@@ -417,7 +416,7 @@ ldelf_acquire_strings_for_ctf
+     {
+       if (ctf_link_add_strtab (ctf_output, ldelf_ctf_strtab_iter_cb,
+ 			       &args) < 0)
+-	einfo (_("%F%P: warning: CTF strtab association failed; strings will "
++	fatal (_("%P: warning: CTF strtab association failed; strings will "
+ 		 "not be shared: %s\n"),
+ 	       ctf_errmsg (ctf_errno (ctf_output)));
+     }
+@@ -444,7 +443,7 @@ ldelf_new_dynsym_for_ctf (struct ctf_dict *ctf_output, int symidx,
+       lsym.st_value = sym->st_value;
+       if (ctf_link_add_linker_symbol (ctf_output, &lsym) < 0)
+ 	{
+-	  einfo (_("%F%P: warning: CTF symbol addition failed; CTF will "
++	  fatal (_("%P: warning: CTF symbol addition failed; CTF will "
+ 		   "not be tied to symbols: %s\n"),
+ 		 ctf_errmsg (ctf_errno (ctf_output)));
+ 	}
+@@ -454,7 +453,7 @@ ldelf_new_dynsym_for_ctf (struct ctf_dict *ctf_output, int symidx,
+       /* Shuffle all the symbols.  */
+ 
+       if (ctf_link_shuffle_syms (ctf_output) < 0)
+-	einfo (_("%F%P: warning: CTF symbol shuffling failed; CTF will "
++	fatal (_("%P: warning: CTF symbol shuffling failed; CTF will "
+ 		 "not be tied to symbols: %s\n"),
+ 	       ctf_errmsg (ctf_errno (ctf_output)));
+     }
+diff --git a/ld/ldemul.c b/ld/ldemul.c
+index 218abb84..b56b0492 100644
+--- a/ld/ldemul.c
++++ b/ld/ldemul.c
+@@ -343,7 +343,7 @@ ldemul_choose_mode (char *target)
+   einfo (_("%P: unrecognised emulation mode: %s\n"), target);
+   einfo (_("Supported emulations: "));
+   ldemul_list_emulations (stderr);
+-  einfo ("%F\n");
++  fatal ("\n");
+ }
+ 
+ void
+diff --git a/ld/ldexp.c b/ld/ldexp.c
+index 3c8ab2d3..45dffbc6 100644
+--- a/ld/ldexp.c
++++ b/ld/ldexp.c
+@@ -282,7 +282,7 @@ definedness_newfunc (struct bfd_hash_entry *entry,
+       bfd_hash_allocate (table, sizeof (struct definedness_hash_entry));
+ 
+   if (ret == NULL)
+-    einfo (_("%F%P: bfd_hash_allocate failed creating symbol %s\n"), name);
++    fatal (_("%P: bfd_hash_allocate failed creating symbol %s\n"), name);
+ 
+   ret->by_object = 0;
+   ret->iteration = 0;
+@@ -313,7 +313,7 @@ update_definedness (const char *name, struct bfd_link_hash_entry *h)
+     bfd_hash_lookup (&definedness_table, name, true, false);
+ 
+   if (defentry == NULL)
+-    einfo (_("%F%P: bfd_hash_lookup failed creating symbol %s\n"), name);
++    fatal (_("%P: bfd_hash_lookup failed creating symbol %s\n"), name);
+ 
+   /* If the symbol was already defined, and not by a script, then it
+      must be defined by an object file or by the linker target code.  */
+@@ -638,7 +638,7 @@ fold_binary (etree_type *tree)
+ 	    expld.result.value = ((bfd_signed_vma) lhs.value
+ 				  % (bfd_signed_vma) expld.result.value);
+ 	  else if (expld.phase != lang_mark_phase_enum)
+-	    einfo (_("%F%P:%pS %% by zero\n"), tree->binary.rhs);
++	    fatal (_("%P:%pS %% by zero\n"), tree->binary.rhs);
+ 	  arith_result_section (&lhs);
+ 	  break;
+ 
+@@ -647,7 +647,7 @@ fold_binary (etree_type *tree)
+ 	    expld.result.value = ((bfd_signed_vma) lhs.value
+ 				  / (bfd_signed_vma) expld.result.value);
+ 	  else if (expld.phase != lang_mark_phase_enum)
+-	    einfo (_("%F%P:%pS / by zero\n"), tree->binary.rhs);
++	    fatal (_("%P:%pS / by zero\n"), tree->binary.rhs);
+ 	  arith_result_section (&lhs);
+ 	  break;
+ 
+@@ -761,7 +761,7 @@ fold_name (etree_type *tree)
+ 	  if (!h)
+ 	    {
+ 	      if (expld.phase != lang_first_phase_enum)
+-		einfo (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
++		fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
+ 	    }
+ 	  else if (h->type == bfd_link_hash_defined
+ 		   || h->type == bfd_link_hash_defweak)
+@@ -789,7 +789,7 @@ fold_name (etree_type *tree)
+ 	  else if (expld.phase == lang_final_phase_enum
+ 		   || (expld.phase != lang_mark_phase_enum
+ 		       && expld.assigning_to_dot))
+-	    einfo (_("%F%P:%pS: undefined symbol `%s'"
++	    fatal (_("%P:%pS: undefined symbol `%s'"
+ 		     " referenced in expression\n"),
+ 		   tree, tree->name.name);
+ 	  else if (h->type == bfd_link_hash_new)
+@@ -827,7 +827,7 @@ fold_name (etree_type *tree)
+ 	  if (os == NULL)
+ 	    {
+ 	      if (expld.phase == lang_final_phase_enum)
+-		einfo (_("%F%P:%pS: undefined section `%s'"
++		fatal (_("%P:%pS: undefined section `%s'"
+ 			 " referenced in expression\n"),
+ 		       tree, tree->name.name);
+ 	    }
+@@ -845,7 +845,7 @@ fold_name (etree_type *tree)
+ 	  if (os == NULL)
+ 	    {
+ 	      if (expld.phase == lang_final_phase_enum)
+-		einfo (_("%F%P:%pS: undefined section `%s'"
++		fatal (_("%P:%pS: undefined section `%s'"
+ 			 " referenced in expression\n"),
+ 		       tree, tree->name.name);
+ 	    }
+@@ -873,7 +873,7 @@ fold_name (etree_type *tree)
+ 	  if (os == NULL)
+ 	    {
+ 	      if (expld.phase == lang_final_phase_enum)
+-		einfo (_("%F%P:%pS: undefined section `%s'"
++		fatal (_("%P:%pS: undefined section `%s'"
+ 			 " referenced in expression\n"),
+ 		       tree, tree->name.name);
+ 	      new_number (0);
+@@ -912,7 +912,7 @@ fold_name (etree_type *tree)
+ 	if (mem != NULL)
+ 	  new_number (mem->length);
+ 	else
+-	  einfo (_("%F%P:%pS: undefined MEMORY region `%s'"
++	  fatal (_("%P:%pS: undefined MEMORY region `%s'"
+ 		   " referenced in expression\n"),
+ 		 tree, tree->name.name);
+       }
+@@ -926,7 +926,7 @@ fold_name (etree_type *tree)
+ 	if (mem != NULL)
+ 	  new_rel_from_abs (mem->origin);
+ 	else
+-	  einfo (_("%F%P:%pS: undefined MEMORY region `%s'"
++	  fatal (_("%P:%pS: undefined MEMORY region `%s'"
+ 		   " referenced in expression\n"),
+ 		 tree, tree->name.name);
+       }
+@@ -938,7 +938,7 @@ fold_name (etree_type *tree)
+       else if (strcmp (tree->name.name, "COMMONPAGESIZE") == 0)
+ 	new_number (link_info.commonpagesize);
+       else
+-	einfo (_("%F%P:%pS: unknown constant `%s' referenced in expression\n"),
++	fatal (_("%P:%pS: unknown constant `%s' referenced in expression\n"),
+ 	       tree, tree->name.name);
+       break;
+ 
+@@ -1086,7 +1086,7 @@ exp_fold_tree_1 (etree_type *tree)
+       if (tree->assign.dst[0] == '.' && tree->assign.dst[1] == 0)
+ 	{
+ 	  if (tree->type.node_class != etree_assign)
+-	    einfo (_("%F%P:%pS can not PROVIDE assignment to"
++	    fatal (_("%P:%pS can not PROVIDE assignment to"
+ 		     " location counter\n"), tree);
+ 	  if (expld.phase != lang_first_phase_enum)
+ 	    {
+@@ -1119,11 +1119,11 @@ exp_fold_tree_1 (etree_type *tree)
+ 		  || expld.section == bfd_und_section_ptr)
+ 		{
+ 		  if (expld.phase != lang_mark_phase_enum)
+-		    einfo (_("%F%P:%pS invalid assignment to"
++		    fatal (_("%P:%pS invalid assignment to"
+ 			     " location counter\n"), tree);
+ 		}
+ 	      else if (expld.dotp == NULL)
+-		einfo (_("%F%P:%pS assignment to location counter"
++		fatal (_("%P:%pS assignment to location counter"
+ 			 " invalid outside of SECTIONS\n"), tree);
+ 
+ 	      /* After allocation, assignment to dot should not be
+@@ -1142,7 +1142,7 @@ exp_fold_tree_1 (etree_type *tree)
+ 		    nextdot += expld.section->vma;
+ 		  if (nextdot < expld.dot
+ 		      && expld.section != bfd_abs_section_ptr)
+-		    einfo (_("%F%P:%pS cannot move location counter backwards"
++		    fatal (_("%P:%pS cannot move location counter backwards"
+ 			     " (from %V to %V)\n"),
+ 			   tree, expld.dot, nextdot);
+ 		  else
+@@ -1202,7 +1202,7 @@ exp_fold_tree_1 (etree_type *tree)
+ 		  h = bfd_link_hash_lookup (link_info.hash, tree->assign.dst,
+ 					    true, false, true);
+ 		  if (h == NULL)
+-		    einfo (_("%F%P:%s: hash creation failed\n"),
++		    fatal (_("%P:%s: hash creation failed\n"),
+ 			   tree->assign.dst);
+ 		}
+ 
+@@ -1578,7 +1578,7 @@ exp_get_vma (etree_type *tree, lang_output_section_statement_type *os,
+       if (expld.result.valid_p)
+ 	return expld.result.value;
+       else if (name != NULL && expld.phase != lang_mark_phase_enum)
+-	einfo (_("%F%P:%pS: nonconstant expression for %s\n"),
++	fatal (_("%P:%pS: nonconstant expression for %s\n"),
+ 	       tree, name);
+     }
+   return def;
+@@ -1621,7 +1621,7 @@ exp_get_fill (etree_type *tree, fill_type *def, char *name)
+   if (!expld.result.valid_p)
+     {
+       if (name != NULL && expld.phase != lang_mark_phase_enum)
+-	einfo (_("%F%P:%pS: nonconstant expression for %s\n"),
++	fatal (_("%P:%pS: nonconstant expression for %s\n"),
+ 	       tree, name);
+       return def;
+     }
+@@ -1681,7 +1681,7 @@ exp_get_abs_int (etree_type *tree, int def, char *name)
+ 	}
+       else if (name != NULL && expld.phase != lang_mark_phase_enum)
+ 	{
+-	  einfo (_("%F%P:%pS: nonconstant expression for %s\n"),
++	  fatal (_("%P:%pS: nonconstant expression for %s\n"),
+ 		 tree, name);
+ 	}
+     }
+@@ -1707,7 +1707,7 @@ ldexp_init (void)
+ 			      definedness_newfunc,
+ 			      sizeof (struct definedness_hash_entry),
+ 			      13))
+-    einfo (_("%F%P: can not create hash table: %E\n"));
++    fatal (_("%P: can not create hash table: %E\n"));
+ }
+ 
+ /* Convert absolute symbols defined by a script from "dot" (also
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 49d899ee..ddab0d37 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -183,7 +183,7 @@ ldfile_add_remap_file (const char * file)
+ 
+       if (*p == '\0')
+ 	{
+-	  einfo ("%F%P: malformed remap file entry: %s\n", line);
++	  fatal ("%P: malformed remap file entry: %s\n", line);
+ 	  continue;
+ 	}
+ 
+@@ -195,7 +195,7 @@ ldfile_add_remap_file (const char * file)
+ 
+       if (*p == '\0')
+ 	{
+-	  einfo ("%F%P: malformed remap file entry: %s\n", line);
++	  fatal ("%P: malformed remap file entry: %s\n", line);
+ 	  continue;
+ 	}
+ 
+@@ -365,7 +365,7 @@ ldfile_try_open_bfd (const char *attempt,
+   if (entry->the_bfd == NULL)
+     {
+       if (bfd_get_error () == bfd_error_invalid_target)
+-	einfo (_("%F%P: invalid BFD target `%s'\n"), entry->target);
++	fatal (_("%P: invalid BFD target `%s'\n"), entry->target);
+       return false;
+     }
+ 
+@@ -508,7 +508,7 @@ ldfile_try_open_bfd (const char *attempt,
+ 
+ 	  if (!entry->flags.dynamic && (entry->the_bfd->flags & DYNAMIC) != 0)
+ 	    {
+-	      einfo (_("%F%P: attempted static link of dynamic object `%s'\n"),
++	      fatal (_("%P: attempted static link of dynamic object `%s'\n"),
+ 		     attempt);
+ 	      bfd_close (entry->the_bfd);
+ 	      entry->the_bfd = NULL;
+@@ -919,7 +919,7 @@ ldfile_open_command_file_1 (const char *name, enum script_open_style open_how)
+       if ((open_how != script_nonT || script->open_how != script_nonT)
+ 	  && strcmp (name, script->name) == 0)
+ 	{
+-	  einfo (_("%F%P: error: linker script file '%s'"
++	  fatal (_("%P: error: linker script file '%s'"
+ 		   " appears multiple times\n"), name);
+ 	  return;
+ 	}
+@@ -941,7 +941,7 @@ ldfile_open_command_file_1 (const char *name, enum script_open_style open_how)
+   if (ldlex_input_stack == NULL)
+     {
+       bfd_set_error (bfd_error_system_call);
+-      einfo (_("%F%P: cannot open linker script file %s: %E\n"), name);
++      fatal (_("%P: cannot open linker script file %s: %E\n"), name);
+       return;
+     }
+ 
+@@ -1012,5 +1012,5 @@ ldfile_set_output_arch (const char *string, enum bfd_architecture defarch)
+   else if (defarch != bfd_arch_unknown)
+     ldfile_output_architecture = defarch;
+   else
+-    einfo (_("%F%P: cannot represent machine `%s'\n"), string);
++    fatal (_("%P: cannot represent machine `%s'\n"), string);
+ }
+diff --git a/ld/ldgram.y b/ld/ldgram.y
+index 0d531fdd..c2f1e298 100644
+--- a/ld/ldgram.y
++++ b/ld/ldgram.y
+@@ -209,7 +209,7 @@ mri_script_command:
+ 		CHIP  exp
+ 	|	CHIP  exp ',' exp
+ 	|	NAME	{
+-			einfo(_("%F%P: unrecognised keyword in MRI style script '%s'\n"),$1);
++			fatal (_("%P: unrecognised keyword in MRI style script '%s'\n"), $1);
+ 			}
+ 	|	LIST	{
+ 			config.map_filename = "-";
+@@ -1547,7 +1547,7 @@ yyerror (const char *arg)
+     einfo (_("%P:%s: file format not recognized; treating as linker script\n"),
+ 	   ldlex_filename ());
+   if (error_index > 0 && error_index < ERROR_NAME_MAX)
+-    einfo (_("%F%P:%pS: %s in %s\n"), NULL, arg, error_names[error_index - 1]);
++    fatal (_("%P:%pS: %s in %s\n"), NULL, arg, error_names[error_index - 1]);
+   else
+-    einfo ("%F%P:%pS: %s\n", NULL, arg);
++    fatal ("%P:%pS: %s\n", NULL, arg);
+ }
+diff --git a/ld/ldlang.c b/ld/ldlang.c
+index 229401c8..9bf5fcbe 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -1325,7 +1325,7 @@ output_section_statement_table_init (void)
+ 			      output_section_statement_newfunc,
+ 			      sizeof (struct out_section_hash_entry),
+ 			      61))
+-    einfo (_("%F%P: can not create hash table: %E\n"));
++    fatal (_("%P: can not create hash table: %E\n"));
+ }
+ 
+ static void
+@@ -1453,7 +1453,7 @@ lang_memory_region_alias (const char *alias, const char *region_name)
+      the default memory region.  */
+   if (strcmp (region_name, DEFAULT_MEMORY_REGION) == 0
+       || strcmp (alias, DEFAULT_MEMORY_REGION) == 0)
+-    einfo (_("%F%P:%pS: error: alias for default memory region\n"), NULL);
++    fatal (_("%P:%pS: error: alias for default memory region\n"), NULL);
+ 
+   /* Look for the target region and check if the alias is not already
+      in use.  */
+@@ -1464,14 +1464,14 @@ lang_memory_region_alias (const char *alias, const char *region_name)
+ 	if (region == NULL && strcmp (n->name, region_name) == 0)
+ 	  region = r;
+ 	if (strcmp (n->name, alias) == 0)
+-	  einfo (_("%F%P:%pS: error: redefinition of memory region "
++	  fatal (_("%P:%pS: error: redefinition of memory region "
+ 		   "alias `%s'\n"),
+ 		 NULL, alias);
+       }
+ 
+   /* Check if the target region exists.  */
+   if (region == NULL)
+-    einfo (_("%F%P:%pS: error: memory region `%s' "
++    fatal (_("%P:%pS: error: memory region `%s' "
+ 	     "for alias `%s' does not exist\n"),
+ 	   NULL, region_name, alias);
+ 
+@@ -1532,7 +1532,7 @@ lang_output_section_statement_lookup (const char *name,
+   if (entry == NULL)
+     {
+       if (create)
+-	einfo (_("%F%P: failed creating section `%s': %E\n"), name);
++	fatal (_("%P: failed creating section `%s': %E\n"), name);
+       return NULL;
+     }
+ 
+@@ -1567,7 +1567,7 @@ lang_output_section_statement_lookup (const char *name,
+ 					     name));
+       if (entry == NULL)
+ 	{
+-	  einfo (_("%F%P: failed creating section `%s': %E\n"), name);
++	  fatal (_("%P: failed creating section `%s': %E\n"), name);
+ 	  return NULL;
+ 	}
+       entry->root = last_ent->root;
+@@ -2426,7 +2426,7 @@ static void
+ init_os (lang_output_section_statement_type *s, flagword flags)
+ {
+   if (strcmp (s->name, DISCARD_SECTION_NAME) == 0)
+-    einfo (_("%F%P: illegal use of `%s' section\n"), DISCARD_SECTION_NAME);
++    fatal (_("%P: illegal use of `%s' section\n"), DISCARD_SECTION_NAME);
+ 
+   if (!s->dup_output)
+     s->bfd_section = bfd_get_section_by_name (link_info.output_bfd, s->name);
+@@ -2435,7 +2435,7 @@ init_os (lang_output_section_statement_type *s, flagword flags)
+ 							 s->name, flags);
+   if (s->bfd_section == NULL)
+     {
+-      einfo (_("%F%P: output format %s cannot represent section"
++      fatal (_("%P: output format %s cannot represent section"
+ 	       " called %s: %E\n"),
+ 	     link_info.output_bfd->xvec->name, s->name);
+     }
+@@ -3023,11 +3023,11 @@ load_symbols (lang_input_statement_type *entry,
+ 	  for (p = matching; *p != NULL; p++)
+ 	    einfo (" %s", *p);
+ 	  free (matching);
+-	  einfo ("%F\n");
++	  fatal ("\n");
+ 	}
+       else if (err != bfd_error_file_not_recognized
+ 	       || place == NULL)
+-	einfo (_("%F%P: %pB: file not recognized: %E\n"), entry->the_bfd);
++	fatal (_("%P: %pB: file not recognized: %E\n"), entry->the_bfd);
+ 
+       bfd_close (entry->the_bfd);
+       entry->the_bfd = NULL;
+@@ -3100,7 +3100,7 @@ load_symbols (lang_input_statement_type *entry,
+ 
+ 	      if (!bfd_check_format (member, bfd_object))
+ 		{
+-		  einfo (_("%F%P: %pB: member %pB in archive is not an object\n"),
++		  fatal (_("%P: %pB: member %pB in archive is not an object\n"),
+ 			 entry->the_bfd, member);
+ 		  loaded = false;
+ 		}
+@@ -3115,7 +3115,7 @@ load_symbols (lang_input_statement_type *entry,
+ 		 substitute BFD for us.  */
+ 	      if (!bfd_link_add_symbols (subsbfd, &link_info))
+ 		{
+-		  einfo (_("%F%P: %pB: error adding symbols: %E\n"), member);
++		  fatal (_("%P: %pB: error adding symbols: %E\n"), member);
+ 		  loaded = false;
+ 		}
+ 	    }
+@@ -3129,7 +3129,7 @@ load_symbols (lang_input_statement_type *entry,
+   if (bfd_link_add_symbols (entry->the_bfd, &link_info))
+     entry->flags.loaded = true;
+   else
+-    einfo (_("%F%P: %pB: error adding symbols: %E\n"), entry->the_bfd);
++    fatal (_("%P: %pB: error adding symbols: %E\n"), entry->the_bfd);
+ 
+   return entry->flags.loaded;
+ }
+@@ -3370,7 +3370,7 @@ open_output (const char *name)
+       {
+ 	char *in = lrealpath (f->local_sym_name);
+ 	if (filename_cmp (in, out) == 0)
+-	  einfo (_("%F%P: input file '%s' is the same as output file\n"),
++	  fatal (_("%P: input file '%s' is the same as output file\n"),
+ 		 f->filename);
+ 	free (in);
+       }
+@@ -3432,23 +3432,23 @@ open_output (const char *name)
+   if (link_info.output_bfd == NULL)
+     {
+       if (bfd_get_error () == bfd_error_invalid_target)
+-	einfo (_("%F%P: target %s not found\n"), output_target);
++	fatal (_("%P: target %s not found\n"), output_target);
+ 
+-      einfo (_("%F%P: cannot open output file %s: %E\n"), name);
++      fatal (_("%P: cannot open output file %s: %E\n"), name);
+     }
+ 
+   delete_output_file_on_failure = true;
+ 
+   if (!bfd_set_format (link_info.output_bfd, bfd_object))
+-    einfo (_("%F%P: %s: can not make object file: %E\n"), name);
++    fatal (_("%P: %s: can not make object file: %E\n"), name);
+   if (!bfd_set_arch_mach (link_info.output_bfd,
+-			   ldfile_output_architecture,
+-			   ldfile_output_machine))
+-    einfo (_("%F%P: %s: can not set architecture: %E\n"), name);
++			  ldfile_output_architecture,
++			  ldfile_output_machine))
++    fatal (_("%P: %s: can not set architecture: %E\n"), name);
+ 
+   link_info.hash = bfd_link_hash_table_create (link_info.output_bfd);
+   if (link_info.hash == NULL)
+-    einfo (_("%F%P: can not create hash table: %E\n"));
++    fatal (_("%P: can not create hash table: %E\n"));
+ 
+   bfd_set_gp_size (link_info.output_bfd, g_switch_value);
+ }
+@@ -3662,7 +3662,7 @@ open_input_bfds (lang_statement_union_type *s,
+ 
+   /* Exit if any of the files were missing.  */
+   if (input_flags.missing_file)
+-    einfo ("%F");
++    fatal ("");
+ }
+ 
+ #ifdef ENABLE_LIBCTF
+@@ -3973,7 +3973,7 @@ insert_undefined (const char *name)
+ 
+   h = bfd_link_hash_lookup (link_info.hash, name, true, false, true);
+   if (h == NULL)
+-    einfo (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
++    fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
+   if (h->type == bfd_link_hash_new)
+     {
+       h->type = bfd_link_hash_undefined;
+@@ -4259,7 +4259,7 @@ map_input_to_output_sections
+ 		  else if (strcmp (name, "SHT_PREINIT_ARRAY") == 0)
+ 		    type = SHT_PREINIT_ARRAY;
+ 		  else
+-		    einfo (_ ("%F%P: invalid type for output section `%s'\n"),
++		    fatal (_ ("%P: invalid type for output section `%s'\n"),
+ 			   os->name);
+ 		}
+ 	     else
+@@ -4268,7 +4268,7 @@ map_input_to_output_sections
+ 		 if (expld.result.valid_p)
+ 		   type = expld.result.value;
+ 		 else
+-		   einfo (_ ("%F%P: invalid type for output section `%s'\n"),
++		   fatal (_ ("%P: invalid type for output section `%s'\n"),
+ 			  os->name);
+ 	       }
+ 	      break;
+@@ -4417,7 +4417,7 @@ process_insert_statements (lang_statement_union_type **start)
+ 	    }
+ 	  if (where == NULL)
+ 	    {
+-	      einfo (_("%F%P: %s not found for insert\n"), i->where);
++	      fatal (_("%P: %s not found for insert\n"), i->where);
+ 	      return;
+ 	    }
+ 
+@@ -5499,12 +5499,12 @@ size_input_section
+ 	      if (dot + TO_ADDR (i->size) > end)
+ 		{
+ 		  if (i->flags & SEC_LINKER_CREATED)
+-		    einfo (_("%F%P: Output section `%pA' not large enough for "
++		    fatal (_("%P: Output section `%pA' not large enough for "
+ 			     "the linker-created stubs section `%pA'.\n"),
+ 			   i->output_section, i);
+ 
+ 		  if (i->rawsize && i->rawsize != i->size)
+-		    einfo (_("%F%P: Relaxation not supported with "
++		    fatal (_("%P: Relaxation not supported with "
+ 			     "--enable-non-contiguous-regions (section `%pA' "
+ 			     "would overflow `%pA' after it changed size).\n"),
+ 			   i, i->output_section);
+@@ -5860,7 +5860,7 @@ lang_size_sections_1
+ 		      dot += expld.result.section->vma;
+ 		  }
+ 		else if (expld.phase != lang_mark_phase_enum)
+-		  einfo (_("%F%P:%pS: non constant or forward reference"
++		  fatal (_("%P:%pS: non constant or forward reference"
+ 			   " address expression for section %s\n"),
+ 			 os->addr_tree, os->name);
+ 	      }
+@@ -5943,7 +5943,7 @@ lang_size_sections_1
+ 			   overridden by the using the --no-check-sections
+ 			   switch.  */
+ 			if (command_line.check_section_addresses)
+-			  einfo (_("%F%P: error: no memory region specified"
++			  fatal (_("%P: error: no memory region specified"
+ 				   " for loadable section `%s'\n"),
+ 				 bfd_section_name (os->bfd_section));
+ 			else
+@@ -6250,7 +6250,7 @@ lang_size_sections_1
+ 		bool again;
+ 
+ 		if (!bfd_relax_section (i->owner, i, &link_info, &again))
+-		  einfo (_("%F%P: can't relax section: %E\n"));
++		  fatal (_("%P: can't relax section: %E\n"));
+ 		if (again)
+ 		  *relax = true;
+ 	      }
+@@ -6659,7 +6659,7 @@ lang_do_assignments_1 (lang_statement_union_type *s,
+ 		s->data_statement.value += expld.result.section->vma;
+ 	    }
+ 	  else if (expld.phase == lang_final_phase_enum)
+-	    einfo (_("%F%P: invalid data statement\n"));
++	    fatal (_("%P: invalid data statement\n"));
+ 	  {
+ 	    unsigned int size;
+ 	    switch (s->data_statement.type)
+@@ -6692,7 +6692,7 @@ lang_do_assignments_1 (lang_statement_union_type *s,
+ 	  if (expld.result.valid_p)
+ 	    s->reloc_statement.addend_value = expld.result.value;
+ 	  else if (expld.phase == lang_final_phase_enum)
+-	    einfo (_("%F%P: invalid reloc statement\n"));
++	    fatal (_("%P: invalid reloc statement\n"));
+ 	  dot += TO_ADDR (bfd_get_reloc_size (s->reloc_statement.howto));
+ 	  break;
+ 
+@@ -7110,7 +7110,7 @@ lang_end (void)
+ 	    break;
+ 	}
+       if (!sym)
+-	einfo (_("%F%P: --gc-sections requires a defined symbol root "
++	fatal (_("%P: --gc-sections requires a defined symbol root "
+ 		 "specified by -e or -u\n"));
+     }
+ 
+@@ -7135,7 +7135,7 @@ lang_end (void)
+ 	     + bfd_section_vma (h->u.def.section->output_section)
+ 	     + h->u.def.section->output_offset);
+       if (!bfd_set_start_address (link_info.output_bfd, val))
+-	einfo (_("%F%P: %s: can't set start address\n"), entry_symbol.name);
++	fatal (_("%P: %s: can't set start address\n"), entry_symbol.name);
+     }
+   else
+     {
+@@ -7148,7 +7148,7 @@ lang_end (void)
+       if (*send == '\0')
+ 	{
+ 	  if (!bfd_set_start_address (link_info.output_bfd, val))
+-	    einfo (_("%F%P: can't set start address\n"));
++	    fatal (_("%P: can't set start address\n"));
+ 	}
+       /* BZ 2004952: Only use the start of the entry section for executables.  */
+       else if bfd_link_executable (&link_info)
+@@ -7167,7 +7167,7 @@ lang_end (void)
+ 		       bfd_section_vma (ts));
+ 	      if (!bfd_set_start_address (link_info.output_bfd,
+ 					  bfd_section_vma (ts)))
+-		einfo (_("%F%P: can't set start address\n"));
++		fatal (_("%P: can't set start address\n"));
+ 	    }
+ 	  else
+ 	    {
+@@ -7236,11 +7236,10 @@ lang_check (void)
+ 		  != bfd_get_flavour (link_info.output_bfd)))
+ 	  && (bfd_get_file_flags (input_bfd) & HAS_RELOC) != 0)
+ 	{
+-	  einfo (_("%F%P: relocatable linking with relocations from"
++	  fatal (_("%P: relocatable linking with relocations from"
+ 		   " format %s (%pB) to format %s (%pB) is not supported\n"),
+ 		 bfd_get_target (input_bfd), input_bfd,
+ 		 bfd_get_target (link_info.output_bfd), link_info.output_bfd);
+-	  /* einfo with %F exits.  */
+ 	}
+ 
+       if (compatible == NULL)
+@@ -7341,7 +7340,7 @@ lang_one_common (struct bfd_link_hash_entry *h, void *info)
+ 
+   section = h->u.c.p->section;
+   if (!bfd_define_common_symbol (link_info.output_bfd, &link_info, h))
+-    einfo (_("%F%P: could not define common symbol `%pT': %E\n"),
++    fatal (_("%P: could not define common symbol `%pT': %E\n"),
+ 	   h->root.string);
+ 
+   if (config.map_file != NULL)
+@@ -7519,7 +7518,7 @@ lang_set_flags (lang_memory_region_type *ptr, const char *flags, int invert)
+ 	  break;
+ 
+ 	default:
+-	  einfo (_("%F%P: invalid character %c (%d) in flags\n"),
++	  fatal (_("%P: invalid character %c (%d) in flags\n"),
+ 		 *flags, *flags);
+ 	  break;
+ 	}
+@@ -7631,7 +7630,7 @@ lang_enter_output_section_statement (const char *output_section_statement_name,
+ 
+   os->align_lma_with_input = align_with_input == ALIGN_WITH_INPUT;
+   if (os->align_lma_with_input && align != NULL)
+-    einfo (_("%F%P:%pS: error: align with input and explicit align specified\n"),
++    fatal (_("%P:%pS: error: align with input and explicit align specified\n"),
+ 	   NULL);
+ 
+   os->subsection_alignment = subalign;
+@@ -8143,7 +8142,7 @@ lang_process (void)
+   lang_place_undefineds ();
+ 
+   if (!bfd_section_already_linked_table_init ())
+-    einfo (_("%F%P: can not create hash table: %E\n"));
++    fatal (_("%P: can not create hash table: %E\n"));
+ 
+   /* A first pass through the memory regions ensures that if any region
+      references a symbol for its origin or length then this symbol will be
+@@ -8181,7 +8180,7 @@ lang_process (void)
+       files = file_chain;
+       inputfiles = input_file_chain;
+       if (plugin_call_all_symbols_read ())
+-	einfo (_("%F%P: %s: plugin reported error after all symbols read\n"),
++	fatal (_("%P: %s: plugin reported error after all symbols read\n"),
+ 	       plugin_error_plugin ());
+       link_info.lto_all_symbols_read = true;
+       /* Open any newly added files, updating the file chains.  */
+@@ -8758,9 +8757,7 @@ void
+ lang_startup (const char *name)
+ {
+   if (first_file->filename != NULL)
+-    {
+-      einfo (_("%F%P: multiple STARTUP files\n"));
+-    }
++    fatal (_("%P: multiple STARTUP files\n"));
+   first_file->filename = name;
+   first_file->local_sym_name = name;
+   first_file->flags.real = true;
+@@ -8984,7 +8981,7 @@ lang_record_phdrs (void)
+ 			break;
+ 		      }
+ 		  if (last == NULL)
+-		    einfo (_("%F%P: no sections assigned to phdrs\n"));
++		    fatal (_("%P: no sections assigned to phdrs\n"));
+ 		}
+ 	      pl = last;
+ 	    }
+@@ -9022,7 +9019,7 @@ lang_record_phdrs (void)
+       if (!bfd_record_phdr (link_info.output_bfd, l->type,
+ 			    l->flags != NULL, flags, l->at != NULL,
+ 			    at, l->filehdr, l->phdrs, c, secs))
+-	einfo (_("%F%P: bfd_record_phdr failed: %E\n"));
++	fatal (_("%P: bfd_record_phdr failed: %E\n"));
+     }
+ 
+   free (secs);
+diff --git a/ld/ldlex.l b/ld/ldlex.l
+index e113c908..7cbade08 100644
+--- a/ld/ldlex.l
++++ b/ld/ldlex.l
+@@ -504,9 +504,7 @@ void
+ lex_push_file (FILE *file, const char *name, unsigned int sysrooted)
+ {
+   if (include_stack_ptr >= MAX_INCLUDE_DEPTH)
+-    {
+-      einfo (_("%F:includes nested too deeply\n"));
+-    }
++    fatal (_("%P: includes nested too deeply\n"));
+   file_name_stack[include_stack_ptr] = name;
+   lineno_stack[include_stack_ptr] = lineno;
+   sysrooted_stack[include_stack_ptr] = input_flags.sysrooted;
+@@ -568,9 +566,7 @@ lex_redirect (const char *string, const char *fake_filename, unsigned int count)
+ 
+   yy_init = 0;
+   if (include_stack_ptr >= MAX_INCLUDE_DEPTH)
+-    {
+-      einfo (_("%F: macros nested too deeply\n"));
+-    }
++    fatal (_("%P: macros nested too deeply\n"));
+   file_name_stack[include_stack_ptr] = fake_filename;
+   lineno_stack[include_stack_ptr] = lineno;
+   include_stack[include_stack_ptr] = YY_CURRENT_BUFFER;
+@@ -674,7 +670,7 @@ yy_input (char *buf, int max_size)
+ 	{
+ 	  result = fread (buf, 1, max_size, yyin);
+ 	  if (result < max_size && ferror (yyin))
+-	    einfo (_("%F%P: read in flex scanner failed\n"));
++	    fatal (_("%P: read in flex scanner failed\n"));
+ 	}
+     }
+   return result;
+@@ -711,7 +707,7 @@ comment (void)
+ 
+       if (c == 0)
+ 	{
+-	  einfo (_("%F%P: EOF in comment\n"));
++	  fatal (_("%P: EOF in comment\n"));
+ 	  break;
+ 	}
+     }
+@@ -732,7 +728,7 @@ lex_warn_invalid (char *where, char *what)
+   if (ldfile_assumed_script)
+     {
+       bfd_set_error (bfd_error_file_not_recognized);
+-      einfo (_("%F%s: file not recognized: %E\n"), ldlex_filename ());
++      fatal (_("%s: file not recognized: %E\n"), ldlex_filename ());
+     }
+ 
+   if (! ISPRINT (*what))
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 3cd5516c..878d9536 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -192,7 +192,7 @@ write_dependency_file (void)
+   out = fopen (config.dependency_file, FOPEN_WT);
+   if (out == NULL)
+     {
+-      einfo (_("%F%P: cannot open dependency file %s: %E\n"),
++      fatal (_("%P: cannot open dependency file %s: %E\n"),
+ 	     config.dependency_file);
+     }
+ 
+@@ -265,7 +265,7 @@ main (int argc, char **argv)
+   expandargv (&argc, &argv);
+ 
+   if (bfd_init () != BFD_INIT_MAGIC)
+-    einfo (_("%F%P: fatal error: libbfd ABI mismatch\n"));
++    fatal (_("%P: fatal error: libbfd ABI mismatch\n"));
+ 
+   bfd_set_error_program_name (program_name);
+ 
+@@ -467,13 +467,13 @@ main (int argc, char **argv)
+     xexit (0);
+ 
+   if (link_info.inhibit_common_definition && !bfd_link_dll (&link_info))
+-    einfo (_("%F%P: --no-define-common may not be used without -shared\n"));
++    fatal (_("%P: --no-define-common may not be used without -shared\n"));
+ 
+   if (!lang_has_input_file)
+     {
+       if (version_printed || command_line.print_output_format)
+ 	xexit (0);
+-      einfo (_("%F%P: no input files\n"));
++      fatal (_("%P: no input files\n"));
+     }
+ 
+   if (verbose)
+@@ -493,7 +493,7 @@ main (int argc, char **argv)
+ 	  if (config.map_file == (FILE *) NULL)
+ 	    {
+ 	      bfd_set_error (bfd_error_system_call);
+-	      einfo (_("%F%P: cannot open map file %s: %E\n"),
++	      einfo (_("%P: cannot open map file %s: %E\n"),
+ 		     config.map_filename);
+ 	    }
+ 	}
+@@ -568,7 +568,7 @@ main (int argc, char **argv)
+       bfd *obfd = link_info.output_bfd;
+       link_info.output_bfd = NULL;
+       if (!bfd_close (obfd))
+-	einfo (_("%F%P: %s: final close failed: %E\n"), output_filename);
++       fatal (_("%P: %s: final close failed: %E\n"), output_filename);
+ 
+       /* If the --force-exe-suffix is enabled, and we're making an
+ 	 executable file and it doesn't end in .exe, copy it to one
+@@ -595,10 +595,10 @@ main (int argc, char **argv)
+ 	      dst = fopen (dst_name, FOPEN_WB);
+ 
+ 	      if (!src)
+-		einfo (_("%F%P: unable to open for source of copy `%s'\n"),
++		fatal (_("%P: unable to open for source of copy `%s'\n"),
+ 		       output_filename);
+ 	      if (!dst)
+-		einfo (_("%F%P: unable to open for destination of copy `%s'\n"),
++		fatal (_("%P: unable to open for destination of copy `%s'\n"),
+ 		       dst_name);
+ 	      while ((l = fread (buf, 1, bsize, src)) > 0)
+ 		{
+@@ -709,7 +709,7 @@ get_emulation (int argc, char **argv)
+ 		  i++;
+ 		}
+ 	      else
+-		einfo (_("%F%P: missing argument to -m\n"));
++		fatal (_("%P: missing argument to -m\n"));
+ 	    }
+ 	  else if (strcmp (argv[i], "-mips1") == 0
+ 		   || strcmp (argv[i], "-mips2") == 0
+@@ -763,11 +763,11 @@ add_ysym (const char *name)
+ 				  bfd_hash_newfunc,
+ 				  sizeof (struct bfd_hash_entry),
+ 				  61))
+-	einfo (_("%F%P: bfd_hash_table_init failed: %E\n"));
++	fatal (_("%P: bfd_hash_table_init failed: %E\n"));
+     }
+ 
+   if (bfd_hash_lookup (link_info.notice_hash, name, true, true) == NULL)
+-    einfo (_("%F%P: bfd_hash_lookup failed: %E\n"));
++    fatal (_("%P: bfd_hash_lookup failed: %E\n"));
+ }
+ 
+ void
+@@ -780,11 +780,11 @@ add_ignoresym (struct bfd_link_info *info, const char *name)
+ 				  bfd_hash_newfunc,
+ 				  sizeof (struct bfd_hash_entry),
+ 				  61))
+-	einfo (_("%F%P: bfd_hash_table_init failed: %E\n"));
++	fatal (_("%P: bfd_hash_table_init failed: %E\n"));
+     }
+ 
+   if (bfd_hash_lookup (info->ignore_hash, name, true, true) == NULL)
+-    einfo (_("%F%P: bfd_hash_lookup failed: %E\n"));
++    fatal (_("%P: bfd_hash_lookup failed: %E\n"));
+ }
+ 
+ /* Record a symbol to be wrapped, from the --wrap option.  */
+@@ -800,11 +800,11 @@ add_wrap (const char *name)
+ 				  bfd_hash_newfunc,
+ 				  sizeof (struct bfd_hash_entry),
+ 				  61))
+-	einfo (_("%F%P: bfd_hash_table_init failed: %E\n"));
++	fatal (_("%P: bfd_hash_table_init failed: %E\n"));
+     }
+ 
+   if (bfd_hash_lookup (link_info.wrap_hash, name, true, true) == NULL)
+-    einfo (_("%F%P: bfd_hash_lookup failed: %E\n"));
++    fatal (_("%P: bfd_hash_lookup failed: %E\n"));
+ }
+ 
+ /* Handle the -retain-symbols-file option.  */
+@@ -832,7 +832,7 @@ add_keepsyms_file (const char *filename)
+       xmalloc (sizeof (struct bfd_hash_table));
+   if (!bfd_hash_table_init (link_info.keep_hash, bfd_hash_newfunc,
+ 			    sizeof (struct bfd_hash_entry)))
+-    einfo (_("%F%P: bfd_hash_table_init failed: %E\n"));
++    fatal (_("%P: bfd_hash_table_init failed: %E\n"));
+ 
+   bufsize = 100;
+   buf = (char *) xmalloc (bufsize);
+@@ -862,7 +862,7 @@ add_keepsyms_file (const char *filename)
+ 	  buf[len] = '\0';
+ 
+ 	  if (bfd_hash_lookup (link_info.keep_hash, buf, true, true) == NULL)
+-	    einfo (_("%F%P: bfd_hash_lookup for insertion failed: %E\n"));
++	    fatal (_("%P: bfd_hash_lookup for insertion failed: %E\n"));
+ 	}
+     }
+ 
+@@ -1269,7 +1269,7 @@ constructor_callback (struct bfd_link_info *info,
+   if (bfd_reloc_type_lookup (info->output_bfd, BFD_RELOC_CTOR) == NULL
+       && (bfd_link_relocatable (info)
+ 	  || bfd_reloc_type_lookup (abfd, BFD_RELOC_CTOR) == NULL))
+-    einfo (_("%F%P: BFD backend error: BFD_RELOC_CTOR unsupported\n"));
++    fatal (_("%P: BFD backend error: BFD_RELOC_CTOR unsupported\n"));
+ 
+   s = set_name;
+   if (bfd_get_symbol_leading_char (abfd) != '\0')
+@@ -1281,7 +1281,7 @@ constructor_callback (struct bfd_link_info *info,
+ 
+   h = bfd_link_hash_lookup (info->hash, set_name, true, true, true);
+   if (h == (struct bfd_link_hash_entry *) NULL)
+-    einfo (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
++    fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
+   if (h->type == bfd_link_hash_new)
+     {
+       h->type = bfd_link_hash_undefined;
+@@ -1314,7 +1314,7 @@ symbol_warning (const char *warning, const char *symbol, bfd *abfd)
+   struct warning_callback_info cinfo;
+ 
+   if (!bfd_generic_link_read_symbols (abfd))
+-    einfo (_("%F%P: %pB: could not read symbols: %E\n"), abfd);
++    fatal (_("%P: %pB: could not read symbols: %E\n"), abfd);
+ 
+   cinfo.found = false;
+   cinfo.warning = warning;
+@@ -1376,14 +1376,14 @@ warning_find_reloc (bfd *abfd, asection *sec, void *iarg)
+ 
+   relsize = bfd_get_reloc_upper_bound (abfd, sec);
+   if (relsize < 0)
+-    einfo (_("%F%P: %pB: could not read relocs: %E\n"), abfd);
++    fatal (_("%P: %pB: could not read relocs: %E\n"), abfd);
+   if (relsize == 0)
+     return;
+ 
+   relpp = (arelent **) xmalloc (relsize);
+   relcount = bfd_canonicalize_reloc (abfd, sec, relpp, info->asymbols);
+   if (relcount < 0)
+-    einfo (_("%F%P: %pB: could not read relocs: %E\n"), abfd);
++    fatal (_("%P: %pB: could not read relocs: %E\n"), abfd);
+ 
+   p = relpp;
+   pend = p + relcount;
+diff --git a/ld/ldmisc.c b/ld/ldmisc.c
+index 3c862ea4..d1257214 100644
+--- a/ld/ldmisc.c
++++ b/ld/ldmisc.c
+@@ -70,7 +70,7 @@
+ void
+ vfinfo (FILE *fp, const char *fmt, va_list ap, bool is_warning)
+ {
+-  bool fatal = false;
++  bool isfatal = false;
+   const char *scan;
+   int arg_type;
+   unsigned int arg_count = 0;
+@@ -282,7 +282,7 @@ vfinfo (FILE *fp, const char *fmt, va_list ap, bool is_warning)
+ 
+ 	    case 'F':
+ 	      /* Error is fatal.  */
+-	      fatal = true;
++	      isfatal = true;
+ 	      break;
+ 
+ 	    case 'P':
+@@ -324,7 +324,7 @@ vfinfo (FILE *fp, const char *fmt, va_list ap, bool is_warning)
+ 		if (abfd != NULL)
+ 		  {
+ 		    if (!bfd_generic_link_read_symbols (abfd))
+-		      einfo (_("%F%P: %pB: could not read symbols: %E\n"), abfd);
++		      fatal (_("%P: %pB: could not read symbols: %E\n"), abfd);
+ 
+ 		    asymbols = bfd_get_outsymbols (abfd);
+ 		  }
+@@ -587,7 +587,7 @@ vfinfo (FILE *fp, const char *fmt, va_list ap, bool is_warning)
+   if (is_warning && config.fatal_warnings)
+     config.make_executable = false;
+ 
+-  if (fatal)
++  if (isfatal)
+     xexit (1);
+ }
+ 
+@@ -620,10 +620,25 @@ einfo (const char *fmt, ...)
+   fflush (stderr);
+ }
+ 
++/* Fatal error.  */
++
++void
++fatal (const char *fmt, ...)
++{
++  va_list arg;
++
++  fflush (stdout);
++  va_start (arg, fmt);
++  vfinfo (stderr, fmt, arg, true);
++  va_end (arg);
++  fflush (stderr);
++  xexit (1);
++}
++
+ void
+ info_assert (const char *file, unsigned int line)
+ {
+-  einfo (_("%F%P: internal error %s %d\n"), file, line);
++  fatal (_("%P: internal error %s %d\n"), file, line);
+ }
+ 
+ /* ('m' for map) Format info message and print on map.  */
+@@ -692,6 +707,5 @@ ld_abort (const char *file, int line, const char *fn)
+   else
+     einfo (_("%P: internal error: aborting at %s:%d\n"),
+ 	   file, line);
+-  einfo (_("%F%P: please report this bug\n"));
+-  xexit (1);
++  fatal (_("%P: please report this bug\n"));
+ }
+diff --git a/ld/ldmisc.h b/ld/ldmisc.h
+index e8b982fe..f763ab8f 100644
+--- a/ld/ldmisc.h
++++ b/ld/ldmisc.h
+@@ -23,6 +23,7 @@
+ 
+ extern void vfinfo (FILE *fp, const char *fmt, va_list arg, bool is_warning);
+ extern void einfo (const char *, ...);
++extern void fatal (const char *, ...) ATTRIBUTE_NORETURN;
+ extern void minfo (const char *, ...);
+ extern void info_msg (const char *, ...);
+ extern void lfinfo (FILE *, const char *, ...);
+diff --git a/ld/ldwrite.c b/ld/ldwrite.c
+index 46fb33c8..ace5e564 100644
+--- a/ld/ldwrite.c
++++ b/ld/ldwrite.c
+@@ -57,14 +57,14 @@ build_link_order (lang_statement_union_type *statement)
+ 
+ 	link_order = bfd_new_link_order (link_info.output_bfd, output_section);
+ 	if (link_order == NULL)
+-	  einfo (_("%F%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	link_order->type = bfd_data_link_order;
+ 	link_order->offset = statement->data_statement.output_offset;
+ 	link_order->u.data.contents = bfd_alloc (link_info.output_bfd,
+ 						 QUAD_SIZE);
+ 	if (link_order->u.data.contents == NULL)
+-	  einfo (_("%F%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	value = statement->data_statement.value;
+ 
+@@ -170,7 +170,7 @@ build_link_order (lang_statement_union_type *statement)
+ 
+ 	link_order = bfd_new_link_order (link_info.output_bfd, output_section);
+ 	if (link_order == NULL)
+-	  einfo (_("%F%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	link_order->offset = rs->output_offset;
+ 	link_order->size = bfd_get_reloc_size (rs->howto);
+@@ -178,7 +178,7 @@ build_link_order (lang_statement_union_type *statement)
+ 	link_order->u.reloc.p = (struct bfd_link_order_reloc *)
+ 	  bfd_alloc (link_info.output_bfd, sizeof (struct bfd_link_order_reloc));
+ 	if (link_order->u.reloc.p == NULL)
+-	  einfo (_("%F%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	link_order->u.reloc.p->reloc = rs->reloc;
+ 	link_order->u.reloc.p->addend = rs->addend_value;
+@@ -224,7 +224,7 @@ build_link_order (lang_statement_union_type *statement)
+ 	    link_order = bfd_new_link_order (link_info.output_bfd,
+ 					     output_section);
+ 	    if (link_order == NULL)
+-	      einfo (_("%F%P: bfd_new_link_order failed: %E\n"));
++	      fatal (_("%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	    if ((i->flags & SEC_NEVER_LOAD) != 0
+ 		&& (i->flags & SEC_DEBUGGING) == 0)
+@@ -265,7 +265,7 @@ build_link_order (lang_statement_union_type *statement)
+ 	link_order = bfd_new_link_order (link_info.output_bfd,
+ 					 output_section);
+ 	if (link_order == NULL)
+-	  einfo (_("%F%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
+ 	link_order->type = bfd_data_link_order;
+ 	link_order->size = statement->padding_statement.size;
+ 	link_order->offset = statement->padding_statement.output_offset;
+@@ -334,8 +334,7 @@ clone_section (bfd *abfd, asection *s, const char *name, int *count)
+       if (startswith (name, ".stab")
+ 	  || strcmp (name, "$GDB_SYMBOLS$") == 0)
+ 	{
+-	  einfo (_ ("%F%P: cannot create split section name for %s\n"), name);
+-	  /* Silence gcc warnings.  einfo exits, so we never reach here.  */
++	  fatal (_ ("%P: cannot create split section name for %s\n"), name);
+ 	  return NULL;
+ 	}
+       tname[5] = 0;
+@@ -346,8 +345,7 @@ clone_section (bfd *abfd, asection *s, const char *name, int *count)
+       || (h = bfd_link_hash_lookup (link_info.hash,
+ 				    sname, true, true, false)) == NULL)
+     {
+-      einfo (_("%F%P: clone section failed: %E\n"));
+-      /* Silence gcc warnings.  einfo exits, so we never reach here.  */
++      fatal (_("%P: clone section failed: %E\n"));
+       return NULL;
+     }
+   free (tname);
+@@ -554,7 +552,7 @@ ldwrite (void)
+ 	 out.  */
+ 
+       if (bfd_get_error () != bfd_error_no_error)
+-	einfo (_("%F%P: final link failed: %E\n"));
++       fatal (_("%P: final link failed: %E\n"));
+       else
+ 	xexit (1);
+     }
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index e9939000..00346348 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -810,7 +810,8 @@ parse_args (unsigned argc, char **argv)
+ 	       && optc != argv[last_optind][1])
+ 	{
+ 	  if (optarg)
+-	    einfo (_("%F%P: Error: unable to disambiguate: %s (did you mean -%s ?)\n"),
++	    fatal (_("%P: Error: unable to disambiguate: "
++		     "%s (did you mean -%s ?)\n"),
+ 		   argv[last_optind], argv[last_optind]);
+ 	  else
+ 	    einfo (_("%P: Warning: grouped short command line options are deprecated: %s\n"), argv[last_optind]);
+@@ -850,7 +851,7 @@ parse_args (unsigned argc, char **argv)
+ 	  /* Fall through.  */
+ 
+ 	default:
+-	  einfo (_("%F%P: use the --help option for usage information\n"));
++	  fatal (_("%P: use the --help option for usage information\n"));
+ 	  break;
+ 
+ 	case 1:			/* File name.  */
+@@ -869,7 +870,7 @@ parse_args (unsigned argc, char **argv)
+ 		   || strcmp (optarg, "default") == 0)
+ 	    input_flags.dynamic = true;
+ 	  else
+-	    einfo (_("%F%P: unrecognized -a option `%s'\n"), optarg);
++	    fatal (_("%P: unrecognized -a option `%s'\n"), optarg);
+ 	  break;
+ 	case OPTION_ASSERT:
+ 	  /* FIXME: We just ignore these, but we should handle them.  */
+@@ -882,7 +883,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcmp (optarg, "pure-text") == 0)
+ 	    ;
+ 	  else
+-	    einfo (_("%F%P: unrecognized -assert option `%s'\n"), optarg);
++	    fatal (_("%P: unrecognized -assert option `%s'\n"), optarg);
+ 	  break;
+ 	case 'A':
+ 	  ldfile_add_arch (optarg);
+@@ -926,8 +927,7 @@ parse_args (unsigned argc, char **argv)
+ 
+ 	      style = cplus_demangle_name_to_style (optarg);
+ 	      if (style == unknown_demangling)
+-		einfo (_("%F%P: unknown demangling style `%s'\n"),
+-		       optarg);
++		fatal (_("%P: unknown demangling style `%s'\n"), optarg);
+ 
+ 	      cplus_demangle_set_style (style);
+ 	    }
+@@ -1034,7 +1034,7 @@ parse_args (unsigned argc, char **argv)
+ 	    char *end;
+ 	    g_switch_value = strtoul (optarg, &end, 0);
+ 	    if (*end)
+-	      einfo (_("%F%P: invalid number `%s'\n"), optarg);
++	      fatal (_("%P: invalid number `%s'\n"), optarg);
+ 	  }
+ 	  break;
+ 	case 'g':
+@@ -1130,7 +1130,7 @@ parse_args (unsigned argc, char **argv)
+ 	      link_info.unresolved_syms_in_shared_libs = RM_IGNORE;
+ 	    }
+ 	  else
+-	    einfo (_("%F%P: bad --unresolved-symbols option: %s\n"), optarg);
++	    fatal (_("%P: bad --unresolved-symbols option: %s\n"), optarg);
+ 	  break;
+ 	case OPTION_WARN_UNRESOLVED_SYMBOLS:
+ 	  link_info.warn_unresolved_syms = true;
+@@ -1217,7 +1217,7 @@ parse_args (unsigned argc, char **argv)
+ 	  break;
+ 	case OPTION_PLUGIN_OPT:
+ 	  if (plugin_opt_plugin_arg (optarg))
+-	    einfo (_("%F%P: bad -plugin-opt option\n"));
++	    fatal (_("%P: bad -plugin-opt option\n"));
+ 	  break;
+ #endif /* BFD_SUPPORTS_PLUGINS */
+ 	case 'q':
+@@ -1234,11 +1234,11 @@ parse_args (unsigned argc, char **argv)
+ 	       an error message here.  We cannot just make this a warning,
+ 	       increment optind, and continue because getopt is too confused
+ 	       and will seg-fault the next time around.  */
+-	    einfo(_("%F%P: unrecognised option: %s\n"), argv[optind]);
++	    fatal(_("%P: unrecognised option: %s\n"), argv[optind]);
+ 
+ 	  if (bfd_link_pic (&link_info))
+-	    einfo (_("%F%P: -r and %s may not be used together\n"),
+-		     bfd_link_dll (&link_info) ? "-shared" : "-pie");
++	    fatal (_("%P: -r and %s may not be used together\n"),
++		   bfd_link_dll (&link_info) ? "-shared" : "-pie");
+ 
+ 	  link_info.type = type_relocatable;
+ 	  config.build_constructors = false;
+@@ -1347,7 +1347,7 @@ parse_args (unsigned argc, char **argv)
+ 	  if (config.has_shared)
+ 	    {
+ 	      if (bfd_link_relocatable (&link_info))
+-		einfo (_("%F%P: -r and %s may not be used together\n"),
++		fatal (_("%P: -r and %s may not be used together\n"),
+ 		       "-shared");
+ 
+ 	      link_info.type = type_dll;
+@@ -1359,7 +1359,7 @@ parse_args (unsigned argc, char **argv)
+ 		link_info.unresolved_syms_in_shared_libs = RM_IGNORE;
+ 	    }
+ 	  else
+-	    einfo (_("%F%P: -shared not supported\n"));
++	    fatal (_("%P: -shared not supported\n"));
+ 	  break;
+ 	case OPTION_NO_PIE:
+ 	  link_info.type = type_pde;
+@@ -1368,12 +1368,12 @@ parse_args (unsigned argc, char **argv)
+ 	  if (config.has_shared)
+ 	    {
+ 	      if (bfd_link_relocatable (&link_info))
+-		einfo (_("%F%P: -r and %s may not be used together\n"), "-pie");
++		fatal (_("%P: -r and %s may not be used together\n"), "-pie");
+ 
+ 	      link_info.type = type_pie;
+ 	    }
+ 	  else
+-	    einfo (_("%F%P: -pie not supported\n"));
++	    fatal (_("%P: -pie not supported\n"));
+ 	  break;
+ 	case 'h':		/* Used on Solaris.  */
+ 	case OPTION_SONAME:
+@@ -1390,7 +1390,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcmp (optarg, N_("ascending")) == 0)
+ 	    config.sort_common = sort_ascending;
+ 	  else
+-	    einfo (_("%F%P: invalid common section sorting option: %s\n"),
++	    fatal (_("%P: invalid common section sorting option: %s\n"),
+ 		   optarg);
+ 	  break;
+ 	case OPTION_SORT_SECTION:
+@@ -1399,8 +1399,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcmp (optarg, N_("alignment")) == 0)
+ 	    sort_section = by_alignment;
+ 	  else
+-	    einfo (_("%F%P: invalid section sorting option: %s\n"),
+-		   optarg);
++	    fatal (_("%P: invalid section sorting option: %s\n"), optarg);
+ 	  break;
+ 	case OPTION_STATS:
+ 	  config.stats = true;
+@@ -1436,14 +1435,14 @@ parse_args (unsigned argc, char **argv)
+ 	    /* Check for <something>=<somthing>...  */
+ 	    optarg2 = strchr (optarg, '=');
+ 	    if (optarg2 == NULL)
+-	      einfo (_("%F%P: invalid argument to option"
++	      fatal (_("%P: invalid argument to option"
+ 		       " \"--section-start\"\n"));
+ 
+ 	    optarg2++;
+ 
+ 	    /* So far so good.  Are all the args present?  */
+ 	    if ((*optarg == '\0') || (*optarg2 == '\0'))
+-	      einfo (_("%F%P: missing argument(s) to option"
++	      fatal (_("%P: missing argument(s) to option"
+ 		       " \"--section-start\"\n"));
+ 
+ 	    /* We must copy the section name as set_section_start
+@@ -1487,8 +1486,8 @@ parse_args (unsigned argc, char **argv)
+ 	  /* Fall through.  */
+ 	case OPTION_UR:
+ 	  if (bfd_link_pic (&link_info))
+-	    einfo (_("%F%P: -r and %s may not be used together\n"),
+-		     bfd_link_dll (&link_info) ? "-shared" : "-pie");
++	    fatal (_("%P: -r and %s may not be used together\n"),
++		   bfd_link_dll (&link_info) ? "-shared" : "-pie");
+ 
+ 	  link_info.type = type_relocatable;
+ 	  config.build_constructors = true;
+@@ -1518,7 +1517,7 @@ parse_args (unsigned argc, char **argv)
+ 	      char *end;
+ 	      int level ATTRIBUTE_UNUSED = strtoul (optarg, &end, 0);
+ 	      if (*end)
+-		einfo (_("%F%P: invalid number `%s'\n"), optarg);
++		fatal (_("%P: invalid number `%s'\n"), optarg);
+ #if BFD_SUPPORTS_PLUGINS
+ 	      report_plugin_symbols = level > 1;
+ #endif /* BFD_SUPPORTS_PLUGINS */
+@@ -1713,7 +1712,7 @@ parse_args (unsigned argc, char **argv)
+ 	  break;
+ 	case ')':
+ 	  if (! ingroup)
+-	    einfo (_("%F%P: group ended before it began (--help for usage)\n"));
++	    fatal (_("%P: group ended before it began (--help for usage)\n"));
+ 
+ 	  lang_leave_group ();
+ 	  ingroup--;
+@@ -1729,7 +1728,7 @@ parse_args (unsigned argc, char **argv)
+ 
+ 	case OPTION_REMAP_INPUTS_FILE:
+ 	  if (! ldfile_add_remap_file (optarg))
+-	    einfo (_("%F%P: failed to add remap file %s\n"), optarg);
++	    fatal (_("%P: failed to add remap file %s\n"), optarg);
+ 	  break;
+ 
+ 	case OPTION_REMAP_INPUTS:
+@@ -1738,7 +1737,7 @@ parse_args (unsigned argc, char **argv)
+ 	    if (optarg2 == NULL)
+ 	      /* FIXME: Should we allow --remap-inputs=@myfile as a synonym
+ 		 for --remap-inputs-file=myfile ?  */
+-	      einfo (_("%F%P: invalid argument to option --remap-inputs\n"));
++	      fatal (_("%P: invalid argument to option --remap-inputs\n"));
+ 	    size_t len = optarg2 - optarg;
+ 	    char * pattern = xmalloc (len + 1);
+ 	    memcpy (pattern, optarg, len);
+@@ -1759,8 +1758,7 @@ parse_args (unsigned argc, char **argv)
+ 	    char *end;
+ 	    bfd_size_type cache_size = strtoul (optarg, &end, 0);
+ 	    if (*end != '\0')
+-	      einfo (_("%F%P: invalid cache memory size: %s\n"),
+-		     optarg);
++	      fatal (_("%P: invalid cache memory size: %s\n"), optarg);
+ 	    link_info.max_cache_size = cache_size;
+ 	  }
+ 	  break;
+@@ -1785,7 +1783,7 @@ parse_args (unsigned argc, char **argv)
+ 
+ 	case OPTION_POP_STATE:
+ 	  if (input_flags.pushed == NULL)
+-	    einfo (_("%F%P: no state pushed before popping\n"));
++	    fatal (_("%P: no state pushed before popping\n"));
+ 	  else
+ 	    {
+ 	      struct lang_input_statement_flags *oldp = input_flags.pushed;
+@@ -1808,7 +1806,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcasecmp (optarg, "discard") == 0)
+ 	    config.orphan_handling = orphan_handling_discard;
+ 	  else
+-	    einfo (_("%F%P: invalid argument to option"
++	    fatal (_("%P: invalid argument to option"
+ 		     " \"--orphan-handling\"\n"));
+ 	  break;
+ 
+@@ -1853,7 +1851,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcmp (optarg, "share-duplicated") == 0)
+ 	    config.ctf_share_duplicated = true;
+ 	  else
+-	    einfo (_("%F%P: bad --ctf-share-types option: %s\n"), optarg);
++	    fatal (_("%P: bad --ctf-share-types option: %s\n"), optarg);
+ 	  break;
+ 	}
+     }
+@@ -2048,7 +2046,7 @@ parse_args (unsigned argc, char **argv)
+   if (config.no_section_header)
+     {
+       if (bfd_link_relocatable (&link_info))
+-	einfo (_("%F%P: -r and -z nosectionheader may not be used together\n"));
++	fatal (_("%P: -r and -z nosectionheader may not be used together\n"));
+ 
+       link_info.strip = strip_all;
+     }
+@@ -2056,9 +2054,9 @@ parse_args (unsigned argc, char **argv)
+   if (!bfd_link_dll (&link_info))
+     {
+       if (command_line.filter_shlib)
+-	einfo (_("%F%P: -F may not be used without -shared\n"));
++	fatal (_("%P: -F may not be used without -shared\n"));
+       if (command_line.auxiliary_filters)
+-	einfo (_("%F%P: -f may not be used without -shared\n"));
++	fatal (_("%P: -f may not be used without -shared\n"));
+     }
+ 
+   /* Treat ld -r -s as ld -r -S -x (i.e., strip all local symbols).  I
+@@ -2099,7 +2097,7 @@ set_section_start (char *sect, char *valstr)
+   const char *end;
+   bfd_vma val = bfd_scan_vma (valstr, &end, 16);
+   if (*end)
+-    einfo (_("%F%P: invalid hex number `%s'\n"), valstr);
++    fatal (_("%P: invalid hex number `%s'\n"), valstr);
+   lang_section_start (sect, exp_intop (val), NULL);
+ }
+ 
+@@ -2112,7 +2110,7 @@ set_segment_start (const char *section, char *valstr)
+ 
+   bfd_vma val = bfd_scan_vma (valstr, &end, 16);
+   if (*end)
+-    einfo (_("%F%P: invalid hex number `%s'\n"), valstr);
++    fatal (_("%P: invalid hex number `%s'\n"), valstr);
+   /* If we already have an entry for this segment, update the existing
+      value.  */
+   name = section + 1;
+diff --git a/ld/mri.c b/ld/mri.c
+index 766f3174..7c8e59fa 100644
+--- a/ld/mri.c
++++ b/ld/mri.c
+@@ -288,7 +288,7 @@ mri_format (const char *name)
+     lang_add_output_format ("srec", NULL, NULL, 1);
+ 
+   else
+-    einfo (_("%F%P: unknown format type %s\n"), name);
++    fatal (_("%P: unknown format type %s\n"), name);
+ }
+ 
+ void
+diff --git a/ld/pe-dll.c b/ld/pe-dll.c
+index 95eef84f..800d00c8 100644
+--- a/ld/pe-dll.c
++++ b/ld/pe-dll.c
+@@ -756,7 +756,7 @@ process_def_file_and_drectve (bfd *abfd ATTRIBUTE_UNUSED, struct bfd_link_info *
+ 
+ 	  if (!bfd_generic_link_read_symbols (b))
+ 	    {
+-	      einfo (_("%F%P: %pB: could not read symbols: %E\n"), b);
++	      fatal (_("%P: %pB: could not read symbols: %E\n"), b);
+ 	      return;
+ 	    }
+ 
+@@ -1048,7 +1048,7 @@ build_filler_bfd (bool include_edata)
+ 			     bfd_get_arch (link_info.output_bfd),
+ 			     bfd_get_mach (link_info.output_bfd)))
+     {
+-      einfo (_("%F%P: can not create BFD: %E\n"));
++      fatal (_("%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -1326,7 +1326,7 @@ pe_walk_relocs (struct bfd_link_info *info,
+ 
+       if (!bfd_generic_link_read_symbols (b))
+ 	{
+-	  einfo (_("%F%P: %pB: could not read symbols: %E\n"), b);
++	  fatal (_("%P: %pB: could not read symbols: %E\n"), b);
+ 	  return;
+ 	}
+ 
+@@ -1407,7 +1407,7 @@ pe_find_data_imports (const char *symhead,
+       if (!bfd_hash_table_init (import_hash,
+ 				bfd_hash_newfunc,
+ 				sizeof (struct bfd_hash_entry)))
+-	einfo (_("%F%P: bfd_hash_table_init failed: %E\n"));
++	fatal (_("%P: bfd_hash_table_init failed: %E\n"));
+     }
+   else
+     import_hash = NULL;
+@@ -1447,7 +1447,7 @@ pe_find_data_imports (const char *symhead,
+ 
+ 		if (!bfd_generic_link_read_symbols (b))
+ 		  {
+-		    einfo (_("%F%P: %pB: could not read symbols: %E\n"), b);
++		    fatal (_("%P: %pB: could not read symbols: %E\n"), b);
+ 		    return;
+ 		  }
+ 
+@@ -1549,7 +1549,7 @@ generate_reloc (bfd *abfd, struct bfd_link_info *info)
+ 
+       if (!bfd_generic_link_read_symbols (b))
+ 	{
+-	  einfo (_("%F%P: %pB: could not read symbols: %E\n"), b);
++	  fatal (_("%P: %pB: could not read symbols: %E\n"), b);
+ 	  return;
+ 	}
+ 
+diff --git a/ld/plugin.c b/ld/plugin.c
+index e9828690..0a99d406 100644
+--- a/ld/plugin.c
++++ b/ld/plugin.c
+@@ -252,7 +252,7 @@ plugin_opt_plugin (const char *plugin)
+   newplug->name = plugin;
+   newplug->dlhandle = dlopen (plugin, RTLD_NOW);
+   if (!newplug->dlhandle)
+-    einfo (_("%F%P: %s: error loading plugin: %s\n"), plugin, dlerror ());
++    fatal (_("%P: %s: error loading plugin: %s\n"), plugin, dlerror ());
+ 
+   /* Check if plugin has been loaded already.  */
+   while (curplug)
+@@ -345,7 +345,7 @@ plugin_get_ir_dummy_bfd (const char *name, bfd *srctemplate)
+ 	}
+     }
+  report_error:
+-  einfo (_("%F%P: could not create dummy IR bfd: %E\n"));
++  fatal (_("%P: could not create dummy IR bfd: %E\n"));
+   return NULL;
+ }
+ 
+@@ -426,7 +426,7 @@ asymbol_from_plugin_symbol (bfd *abfd, asymbol *asym,
+       unsigned char visibility;
+ 
+       if (!elfsym)
+-	einfo (_("%F%P: %s: non-ELF symbol in ELF BFD!\n"), asym->name);
++	fatal (_("%P: %s: non-ELF symbol in ELF BFD!\n"), asym->name);
+ 
+       if (ldsym->def == LDPK_COMMON)
+ 	{
+@@ -437,7 +437,7 @@ asymbol_from_plugin_symbol (bfd *abfd, asymbol *asym,
+       switch (ldsym->visibility)
+ 	{
+ 	default:
+-	  einfo (_("%F%P: unknown ELF symbol visibility: %d!\n"),
++	  fatal (_("%P: unknown ELF symbol visibility: %d!\n"),
+ 		 ldsym->visibility);
+ 	  return LDPS_ERR;
+ 
+@@ -555,7 +555,7 @@ get_view (const void *handle, const void **viewp)
+ 
+   /* FIXME: einfo should support %lld.  */
+   if ((off_t) size != input->filesize)
+-    einfo (_("%F%P: unsupported input file size: %s (%ld bytes)\n"),
++    fatal (_("%P: unsupported input file size: %s (%ld bytes)\n"),
+ 	   input->name, (long) input->filesize);
+ 
+   /* Check the cached view buffer.  */
+@@ -826,7 +826,7 @@ get_symbols (const void *handle, int nsyms, struct ld_plugin_symbol *syms,
+ 	  && blhe->type != bfd_link_hash_common)
+ 	{
+ 	  /* We should not have a new, indirect or warning symbol here.  */
+-	  einfo (_("%F%P: %s: plugin symbol table corrupt (sym type %d)\n"),
++	  fatal (_("%P: %s: plugin symbol table corrupt (sym type %d)\n"),
+ 		 called_plugin->name, blhe->type);
+ 	}
+ 
+@@ -978,13 +978,14 @@ message (int level, const char *format, ...)
+     case LDPL_ERROR:
+     default:
+       {
+-	char *newfmt = concat (level == LDPL_FATAL ? "%F" : "%X",
+-			       _("%P: error: "), format, "\n",
++	char *newfmt = concat (_("%X%P: error: "), format, "\n",
+ 			       (const char *) NULL);
+ 	fflush (stdout);
+ 	vfinfo (stderr, newfmt, args, true);
+ 	fflush (stderr);
+ 	free (newfmt);
++	if (level == LDPL_FATAL)
++	  fatal ("");
+       }
+       break;
+     }
+@@ -1127,14 +1128,14 @@ plugin_load_plugins (void)
+       if (!onloadfn)
+ 	onloadfn = (ld_plugin_onload) dlsym (curplug->dlhandle, "_onload");
+       if (!onloadfn)
+-	einfo (_("%F%P: %s: error loading plugin: %s\n"),
++	fatal (_("%P: %s: error loading plugin: %s\n"),
+ 	       curplug->name, dlerror ());
+       set_tv_plugin_args (curplug, &my_tv[tv_header_size]);
+       called_plugin = curplug;
+       rv = (*onloadfn) (my_tv);
+       called_plugin = NULL;
+       if (rv != LDPS_OK)
+-	einfo (_("%F%P: %s: plugin error: %d\n"), curplug->name, rv);
++	fatal (_("%P: %s: plugin error: %d\n"), curplug->name, rv);
+       curplug = curplug->next;
+     }
+ 
+@@ -1193,7 +1194,7 @@ plugin_strdup (bfd *abfd, const char *str)
+   strlength = strlen (str) + 1;
+   copy = bfd_alloc (abfd, strlength);
+   if (copy == NULL)
+-    einfo (_("%F%P: plugin_strdup failed to allocate memory: %s\n"),
++    fatal (_("%P: plugin_strdup failed to allocate memory: %s\n"),
+ 	   bfd_get_error ());
+   memcpy (copy, str, strlength);
+   return copy;
+@@ -1230,7 +1231,7 @@ plugin_object_p (bfd *ibfd, bool known_used)
+ 
+   input = bfd_alloc (abfd, sizeof (*input));
+   if (input == NULL)
+-    einfo (_("%F%P: plugin failed to allocate memory for input: %s\n"),
++    fatal (_("%P: plugin failed to allocate memory for input: %s\n"),
+ 	   bfd_get_error ());
+ 
+   if (!bfd_plugin_open_input (ibfd, &file))
+@@ -1258,7 +1259,7 @@ plugin_object_p (bfd *ibfd, bool known_used)
+   claimed = 0;
+ 
+   if (plugin_call_claim_file (&file, &claimed, known_used))
+-    einfo (_("%F%P: %s: plugin reported error claiming file\n"),
++    fatal (_("%P: %s: plugin reported error claiming file\n"),
+ 	   plugin_error_plugin ());
+ 
+   if (input->fd != -1
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch
new file mode 100644
index 0000000000..2b473914b7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch
@@ -0,0 +1,840 @@
+From 31e9e2e8d1090da0c1da97a70005d8841fff8ddd Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 16 Feb 2025 23:34:55 +1030
+Subject: [PATCH] PR 32603, more ld -w misbehaviour
+
+Commit 8d97c1a53f3d claimed to replace all einfo calls using %F with
+a call to fatal.  It did so only for the ld/ directory.  This patch
+adds a "fatal" to linker callbacks, and replaces those calls in bfd/
+too.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31e9e2e8d1090da0c1da97a70005d8841fff8ddd]
+CVE: CVE-2025-1153
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ bfd/archive.c         |  4 ++--
+ bfd/coff-aarch64.c    |  4 +---
+ bfd/coffgen.c         |  2 +-
+ bfd/elf-ifunc.c       |  4 ++--
+ bfd/elf-m10300.c      |  4 ++--
+ bfd/elf-properties.c  |  4 ++--
+ bfd/elf.c             |  4 ++--
+ bfd/elf32-arm.c       |  2 +-
+ bfd/elf32-avr.c       |  4 ++--
+ bfd/elf32-csky.c      |  2 +-
+ bfd/elf32-frv.c       |  4 ++--
+ bfd/elf32-hppa.c      |  6 ++---
+ bfd/elf32-i386.c      |  4 ++--
+ bfd/elf32-m68hc11.c   |  2 +-
+ bfd/elf32-m68hc12.c   |  2 +-
+ bfd/elf32-metag.c     |  2 +-
+ bfd/elf32-spu.c       |  5 ++--
+ bfd/elf64-ia64-vms.c  |  4 ++--
+ bfd/elf64-ppc.c       |  4 ++--
+ bfd/elf64-x86-64.c    | 14 +++++------
+ bfd/elflink.c         |  8 +++----
+ bfd/elfnn-aarch64.c   |  6 ++---
+ bfd/elfnn-ia64.c      |  4 ++--
+ bfd/elfnn-kvx.c       |  2 +-
+ bfd/elfnn-loongarch.c |  4 ++--
+ bfd/elfxx-aarch64.c   |  6 ++---
+ bfd/elfxx-sparc.c     |  4 ++--
+ bfd/elfxx-x86.c       | 56 +++++++++++++++++++++----------------------
+ bfd/linker.c          |  2 +-
+ bfd/reloc.c           |  4 ++--
+ bfd/reloc16.c         |  4 ++--
+ bfd/xcofflink.c       |  2 +-
+ include/bfdlink.h     |  3 +++
+ ld/ldmain.c           |  1 +
+ 34 files changed, 94 insertions(+), 93 deletions(-)
+
+diff --git a/bfd/archive.c b/bfd/archive.c
+index 9f3fbce9..0f617276 100644
+--- a/bfd/archive.c
++++ b/bfd/archive.c
+@@ -749,8 +749,8 @@ _bfd_get_elt_at_filepos (bfd *archive, file_ptr filepos,
+ 	    case bfd_error_system_call:
+ 	      if (info != NULL)
+ 		{
+-		  info->callbacks->einfo
+-		    (_("%F%P: %pB(%s): error opening thin archive member: %E\n"),
++		  info->callbacks->fatal
++		    (_("%P: %pB(%s): error opening thin archive member: %E\n"),
+ 		     archive, filename);
+ 		  break;
+ 		}
+diff --git a/bfd/coff-aarch64.c b/bfd/coff-aarch64.c
+index 825963c0..53f539e0 100644
+--- a/bfd/coff-aarch64.c
++++ b/bfd/coff-aarch64.c
+@@ -876,10 +876,8 @@ coff_pe_aarch64_relocate_section (bfd *output_bfd,
+ 	  }
+ 
+ 	default:
+-	  info->callbacks->einfo (_("%F%P: Unhandled relocation type %u\n"),
++	  info->callbacks->fatal (_("%P: Unhandled relocation type %u\n"),
+ 				  rel->r_type);
+-	  BFD_FAIL ();
+-	  return false;
+ 	}
+     }
+ 
+diff --git a/bfd/coffgen.c b/bfd/coffgen.c
+index cc1c6557..3270cd2f 100644
+--- a/bfd/coffgen.c
++++ b/bfd/coffgen.c
+@@ -2793,7 +2793,7 @@ _bfd_coff_section_already_linked (bfd *abfd,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->einfo (_("%F%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
+   return false;
+ }
+ 
+diff --git a/bfd/elf-ifunc.c b/bfd/elf-ifunc.c
+index 42a3bcdf..58a1ca5e 100644
+--- a/bfd/elf-ifunc.c
++++ b/bfd/elf-ifunc.c
+@@ -139,9 +139,9 @@ _bfd_elf_allocate_ifunc_dyn_relocs (struct bfd_link_info *info,
+ 	  || info->export_dynamic)
+       && h->pointer_equality_needed)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%F%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
++	(_("%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
+ 	   "equality in `%pB' can not be used when making an "
+ 	   "executable; recompile with -fPIE and relink with -pie\n"),
+ 	 h->root.root.string,
+diff --git a/bfd/elf-m10300.c b/bfd/elf-m10300.c
+index 24ea43a7..cf6bb13b 100644
+--- a/bfd/elf-m10300.c
++++ b/bfd/elf-m10300.c
+@@ -2646,8 +2646,8 @@ mn10300_elf_relax_section (bfd *abfd,
+   bfd_vma align_gap_adjustment;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* Assume nothing changes.  */
+   *again = false;
+diff --git a/bfd/elf-properties.c b/bfd/elf-properties.c
+index ee8bd37f..a4591472 100644
+--- a/bfd/elf-properties.c
++++ b/bfd/elf-properties.c
+@@ -665,11 +665,11 @@ _bfd_elf_link_setup_gnu_properties (struct bfd_link_info *info)
+ 					      | SEC_HAS_CONTENTS
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create GNU property section\n"));
++	    info->callbacks->fatal (_("%P: failed to create GNU property section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec,
+ 					  elfclass == ELFCLASS64 ? 3 : 2))
+-	    info->callbacks->einfo (_("%F%pA: failed to align section\n"),
++	    info->callbacks->fatal (_("%pA: failed to align section\n"),
+ 				    sec);
+ 
+ 	  elf_section_type (sec) = SHT_NOTE;
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 8bffd3c5..8e4e1e7f 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -5188,8 +5188,8 @@ _bfd_elf_map_sections_to_segments (bfd *abfd,
+ 	  && need_layout != NULL
+ 	  && bed->size_relative_relocs
+ 	  && !bed->size_relative_relocs (info, need_layout))
+-	info->callbacks->einfo
+-	  (_("%F%P: failed to size relative relocations\n"));
++	info->callbacks->fatal
++	  (_("%P: failed to size relative relocations\n"));
+     }
+ 
+   if (no_user_phdrs && bfd_count_sections (abfd) != 0)
+diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
+index 4ad7c354..b4a822f1 100644
+--- a/bfd/elf32-arm.c
++++ b/bfd/elf32-arm.c
+@@ -5053,7 +5053,7 @@ arm_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-avr.c b/bfd/elf32-avr.c
+index 20e03bd7..912f7533 100644
+--- a/bfd/elf32-avr.c
++++ b/bfd/elf32-avr.c
+@@ -2484,8 +2484,8 @@ elf32_avr_relax_section (bfd *abfd,
+     shrinkable = false;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   htab = avr_link_hash_table (link_info);
+   if (htab == NULL)
+diff --git a/bfd/elf32-csky.c b/bfd/elf32-csky.c
+index 9479705d..edff65a9 100644
+--- a/bfd/elf32-csky.c
++++ b/bfd/elf32-csky.c
+@@ -3728,7 +3728,7 @@ csky_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-frv.c b/bfd/elf32-frv.c
+index 5b66b074..245db7c2 100644
+--- a/bfd/elf32-frv.c
++++ b/bfd/elf32-frv.c
+@@ -5617,8 +5617,8 @@ elf32_frvfdpic_relax_section (bfd *abfd ATTRIBUTE_UNUSED, asection *sec,
+   struct _frvfdpic_dynamic_got_plt_info gpinfo;
+ 
+   if (bfd_link_relocatable (info))
+-    (*info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* If we return early, we didn't change anything.  */
+   *again = false;
+diff --git a/bfd/elf32-hppa.c b/bfd/elf32-hppa.c
+index c2a7ad98..f1e67a06 100644
+--- a/bfd/elf32-hppa.c
++++ b/bfd/elf32-hppa.c
+@@ -729,7 +729,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+@@ -758,7 +758,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+@@ -839,7 +839,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index e2f88a11..1637e39f 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -4092,8 +4092,8 @@ elf_i386_finish_dynamic_sections (bfd *output_bfd,
+     {
+       if (bfd_is_abs_section (htab->elf.splt->output_section))
+ 	{
+-	  info->callbacks->einfo
+-	    (_("%F%P: discarded output section: `%pA'\n"),
++	  info->callbacks->fatal
++	    (_("%P: discarded output section: `%pA'\n"),
+ 	     htab->elf.splt);
+ 	  return false;
+ 	}
+diff --git a/bfd/elf32-m68hc11.c b/bfd/elf32-m68hc11.c
+index 5fc611f5..6f705718 100644
+--- a/bfd/elf32-m68hc11.c
++++ b/bfd/elf32-m68hc11.c
+@@ -419,7 +419,7 @@ m68hc11_elf_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-m68hc12.c b/bfd/elf32-m68hc12.c
+index 1be174c0..bdfb9ca5 100644
+--- a/bfd/elf32-m68hc12.c
++++ b/bfd/elf32-m68hc12.c
+@@ -539,7 +539,7 @@ m68hc12_elf_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-metag.c b/bfd/elf32-metag.c
+index de14dfe5..49f93cc7 100644
+--- a/bfd/elf32-metag.c
++++ b/bfd/elf32-metag.c
+@@ -3342,7 +3342,7 @@ metag_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (hsh->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    hsh->target_section);
+ 
+diff --git a/bfd/elf32-spu.c b/bfd/elf32-spu.c
+index 881d4d8e..dd5d5fbe 100644
+--- a/bfd/elf32-spu.c
++++ b/bfd/elf32-spu.c
+@@ -4689,8 +4689,7 @@ spu_elf_auto_overlay (struct bfd_link_info *info)
+  file_err:
+   bfd_set_error (bfd_error_system_call);
+  err_exit:
+-  info->callbacks->einfo (_("%F%P: auto overlay error: %E\n"));
+-  xexit (1);
++  info->callbacks->fatal (_("%P: auto overlay error: %E\n"));
+ }
+ 
+ /* Provide an estimate of total stack required.  */
+@@ -4743,7 +4742,7 @@ spu_elf_final_link (bfd *output_bfd, struct bfd_link_info *info)
+     info->callbacks->einfo (_("%X%P: stack/lrlive analysis error: %E\n"));
+ 
+   if (!spu_elf_build_stubs (info))
+-    info->callbacks->einfo (_("%F%P: can not build overlay stubs: %E\n"));
++    info->callbacks->fatal (_("%P: can not build overlay stubs: %E\n"));
+ 
+   return bfd_elf_final_link (output_bfd, info);
+ }
+diff --git a/bfd/elf64-ia64-vms.c b/bfd/elf64-ia64-vms.c
+index 2f37e90c..b1eaaac0 100644
+--- a/bfd/elf64-ia64-vms.c
++++ b/bfd/elf64-ia64-vms.c
+@@ -361,8 +361,8 @@ elf64_ia64_relax_section (bfd *abfd, asection *sec,
+   *again = false;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* Don't even try to relax for non-ELF outputs.  */
+   if (!is_elf_hash_table (link_info->hash))
+diff --git a/bfd/elf64-ppc.c b/bfd/elf64-ppc.c
+index 720d6ac9..7b798732 100644
+--- a/bfd/elf64-ppc.c
++++ b/bfd/elf64-ppc.c
+@@ -12289,7 +12289,7 @@ ppc_size_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (stub_entry->target_section != NULL
+       && stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+@@ -12297,7 +12297,7 @@ ppc_size_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (stub_entry->group->stub_sec != NULL
+       && stub_entry->group->stub_sec->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->group->stub_sec);
+ 
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index c3fb375c..a22d57d7 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -3706,8 +3706,8 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 			      || (roff - 3 + 22) > input_section->size)
+ 			    {
+ 			    corrupt_input:
+-			      info->callbacks->einfo
+-				(_("%F%P: corrupt input: %pB\n"),
++			      info->callbacks->fatal
++				(_("%P: corrupt input: %pB\n"),
+ 				 input_bfd);
+ 			      return false;
+ 			    }
+@@ -4679,7 +4679,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+       /* Check PC-relative offset overflow in PLT entry.  */
+       if ((plt_got_pcrel_offset + 0x80000000) > 0xffffffff)
+ 	/* xgettext:c-format */
+-	info->callbacks->einfo (_("%F%pB: PC-relative offset overflow in PLT entry for `%s'\n"),
++	info->callbacks->fatal (_("%pB: PC-relative offset overflow in PLT entry for `%s'\n"),
+ 				output_bfd, h->root.root.string);
+ 
+       bfd_put_32 (output_bfd, plt_got_pcrel_offset,
+@@ -4752,7 +4752,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 		 will overflow first.  */
+ 	      if (plt0_offset > 0x80000000)
+ 		/* xgettext:c-format */
+-		info->callbacks->einfo (_("%F%pB: branch displacement overflow in PLT entry for `%s'\n"),
++		info->callbacks->fatal (_("%pB: branch displacement overflow in PLT entry for `%s'\n"),
+ 					output_bfd, h->root.root.string);
+ 	      bfd_put_32 (output_bfd, - plt0_offset,
+ 			  (plt->contents + h->plt.offset
+@@ -4805,7 +4805,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+       if ((got_after_plt && got_pcrel_offset < 0)
+ 	  || (!got_after_plt && got_pcrel_offset > 0))
+ 	/* xgettext:c-format */
+-	info->callbacks->einfo (_("%F%pB: PC-relative offset overflow in GOT PLT entry for `%s'\n"),
++	info->callbacks->fatal (_("%pB: PC-relative offset overflow in GOT PLT entry for `%s'\n"),
+ 				output_bfd, h->root.root.string);
+ 
+       bfd_put_32 (output_bfd, got_pcrel_offset,
+@@ -5092,8 +5092,8 @@ elf_x86_64_finish_dynamic_sections (bfd *output_bfd,
+     {
+       if (bfd_is_abs_section (htab->elf.splt->output_section))
+ 	{
+-	  info->callbacks->einfo
+-	    (_("%F%P: discarded output section: `%pA'\n"),
++	  info->callbacks->fatal
++	    (_("%P: discarded output section: `%pA'\n"),
+ 	     htab->elf.splt);
+ 	  return false;
+ 	}
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 8af6898a..dba176cc 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -12891,8 +12891,8 @@ bfd_elf_final_link (bfd *abfd, struct bfd_link_info *info)
+   if (info->enable_dt_relr
+       && bed->finish_relative_relocs
+       && !bed->finish_relative_relocs (info))
+-    info->callbacks->einfo
+-      (_("%F%P: %pB: failed to finish relative relocations\n"), abfd);
++    info->callbacks->fatal
++      (_("%P: %pB: failed to finish relative relocations\n"), abfd);
+ 
+   /* Since ELF permits relocations to be against local symbols, we
+      must have the local symbols available when we do the relocations.
+@@ -14087,7 +14087,7 @@ _bfd_elf_gc_mark_extra_sections (struct bfd_link_info *info,
+ 	  else if (strcmp (bfd_section_name (isec),
+ 			   "__patchable_function_entries") == 0
+ 		   && elf_linked_to_section (isec) == NULL)
+-	      info->callbacks->einfo (_("%F%P: %pB(%pA): error: "
++	      info->callbacks->fatal (_("%P: %pB(%pA): error: "
+ 					"need linked-to section "
+ 					"for --gc-sections\n"),
+ 				      isec->owner, isec);
+@@ -15264,7 +15264,7 @@ _bfd_elf_section_already_linked (bfd *abfd,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->einfo (_("%F%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
+   return sec->output_section == bfd_abs_section_ptr;
+ }
+ 
+diff --git a/bfd/elfnn-aarch64.c b/bfd/elfnn-aarch64.c
+index 109517db..0f454d23 100644
+--- a/bfd/elfnn-aarch64.c
++++ b/bfd/elfnn-aarch64.c
+@@ -3272,7 +3272,7 @@ aarch64_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without "
+ 			      "--enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+@@ -9008,9 +9008,9 @@ elfNN_aarch64_allocate_dynrelocs (struct elf_link_hash_entry *h, void *inf)
+ 	asection *s = p->sec->output_section;
+ 	if (s != NULL && (s->flags & SEC_READONLY) != 0)
+ 	  {
+-	    info->callbacks->einfo
++	    info->callbacks->fatal
+ 		/* xgettext:c-format */
+-		(_ ("%F%P: %pB: copy relocation against non-copyable "
++		(_ ("%P: %pB: copy relocation against non-copyable "
+ 		    "protected symbol `%s'\n"),
+ 		 p->sec->owner, h->root.root.string);
+ 	    return false;
+diff --git a/bfd/elfnn-ia64.c b/bfd/elfnn-ia64.c
+index 7081ba1b..41d9e6fe 100644
+--- a/bfd/elfnn-ia64.c
++++ b/bfd/elfnn-ia64.c
+@@ -361,8 +361,8 @@ elfNN_ia64_relax_section (bfd *abfd, asection *sec,
+   *again = false;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* Don't even try to relax for non-ELF outputs.  */
+   if (!is_elf_hash_table (link_info->hash))
+diff --git a/bfd/elfnn-kvx.c b/bfd/elfnn-kvx.c
+index ae5ed6bf..b752891b 100644
+--- a/bfd/elfnn-kvx.c
++++ b/bfd/elfnn-kvx.c
+@@ -927,7 +927,7 @@ kvx_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign '%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign '%pA' to an output section. "
+ 			      "Retry without "
+ 			      "--enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+diff --git a/bfd/elfnn-loongarch.c b/bfd/elfnn-loongarch.c
+index a7daea67..a8c4226d 100644
+--- a/bfd/elfnn-loongarch.c
++++ b/bfd/elfnn-loongarch.c
+@@ -1445,9 +1445,9 @@ local_allocate_ifunc_dyn_relocs (struct bfd_link_info *info,
+ 	  || info->export_dynamic)
+       && h->pointer_equality_needed)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format.  */
+-	(_("%F%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
++	(_("%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
+ 	   "equality in `%pB' can not be used when making an "
+ 	   "executable; recompile with -fPIE and relink with -pie\n"),
+ 	 h->root.root.string,
+diff --git a/bfd/elfxx-aarch64.c b/bfd/elfxx-aarch64.c
+index d1279adc..161c8a52 100644
+--- a/bfd/elfxx-aarch64.c
++++ b/bfd/elfxx-aarch64.c
+@@ -754,12 +754,12 @@ _bfd_aarch64_elf_link_setup_gnu_properties (struct bfd_link_info *info,
+ 					      | SEC_HAS_CONTENTS
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (
+-	      _("%F%P: failed to create GNU property section\n"));
++	    info->callbacks->fatal (
++	      _("%P: failed to create GNU property section\n"));
+ 
+           align = (bfd_get_mach (ebfd) & bfd_mach_aarch64_ilp32) ? 2 : 3;
+ 	  if (!bfd_set_section_alignment (sec, align))
+-	    info->callbacks->einfo (_("%F%pA: failed to align section\n"),
++	    info->callbacks->fatal (_("%pA: failed to align section\n"),
+ 				    sec);
+ 
+ 	  elf_section_type (sec) = SHT_NOTE;
+diff --git a/bfd/elfxx-sparc.c b/bfd/elfxx-sparc.c
+index 6f5062bb..95b1928d 100644
+--- a/bfd/elfxx-sparc.c
++++ b/bfd/elfxx-sparc.c
+@@ -2680,8 +2680,8 @@ _bfd_sparc_elf_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
+ 			      bool *again)
+ {
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   *again = false;
+   sec_do_relax (section) = 1;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 8c261cf8..606c8905 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -531,9 +531,9 @@ elf_x86_allocate_dynrelocs (struct elf_link_hash_entry *h, void *inf)
+ 	  asection *s = p->sec->output_section;
+ 	  if (s != NULL && (s->flags & SEC_READONLY) != 0)
+ 	    {
+-	      info->callbacks->einfo
++	      info->callbacks->fatal
+ 		/* xgettext:c-format */
+-		(_("%F%P: %pB: copy relocation against non-copyable "
++		(_("%P: %pB: copy relocation against non-copyable "
+ 		   "protected symbol `%s' in %pB\n"),
+ 		 p->sec->owner, h->root.root.string,
+ 		 h->root.u.def.section->owner);
+@@ -1030,9 +1030,9 @@ elf_x86_relative_reloc_record_add
+ 
+   if (relative_reloc->data == NULL)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%F%P: %pB: failed to allocate relative reloc record\n"),
++	(_("%P: %pB: failed to allocate relative reloc record\n"),
+ 	 info->output_bfd);
+       return false;
+     }
+@@ -1388,9 +1388,9 @@ elf64_dt_relr_bitmap_add
+ 
+   if (bitmap->u.elf64 == NULL)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%F%P: %pB: failed to allocate 64-bit DT_RELR bitmap\n"),
++	(_("%P: %pB: failed to allocate 64-bit DT_RELR bitmap\n"),
+ 	 info->output_bfd);
+     }
+ 
+@@ -1424,9 +1424,9 @@ elf32_dt_relr_bitmap_add
+ 
+   if (bitmap->u.elf32 == NULL)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%F%P: %pB: failed to allocate 32-bit DT_RELR bitmap\n"),
++	(_("%P: %pB: failed to allocate 32-bit DT_RELR bitmap\n"),
+ 	 info->output_bfd);
+     }
+ 
+@@ -1750,9 +1750,9 @@ elf_x86_compute_dl_relr_bitmap
+ 	  *need_layout = true;
+ 	}
+       else
+-	info->callbacks->einfo
++	info->callbacks->fatal
+ 	  /* xgettext:c-format */
+-	  (_("%F%P: %pB: size of compact relative reloc section is "
++	  (_("%P: %pB: size of compact relative reloc section is "
+ 	     "changed: new (%lu) != old (%lu)\n"),
+ 	   info->output_bfd, htab->dt_relr_bitmap.count,
+ 	   dt_relr_bitmap_count);
+@@ -1772,9 +1772,9 @@ elf_x86_write_dl_relr_bitmap (struct bfd_link_info *info,
+ 
+   contents = (unsigned char *) bfd_alloc (sec->owner, size);
+   if (contents == NULL)
+-    info->callbacks->einfo
++    info->callbacks->fatal
+       /* xgettext:c-format */
+-      (_("%F%P: %pB: failed to allocate compact relative reloc section\n"),
++      (_("%P: %pB: failed to allocate compact relative reloc section\n"),
+        info->output_bfd);
+ 
+   /* Cache the section contents for elf_link_input_bfd.  */
+@@ -2219,9 +2219,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+ 	  else
+ 	    name = bfd_elf_sym_name (input_section->owner, symtab_hdr,
+ 				     sym, NULL);
+-	  info->callbacks->einfo
++	  info->callbacks->fatal
+ 	    /* xgettext:c-format */
+-	    (_("%F%P: %pB: relocation %s against absolute symbol "
++	    (_("%P: %pB: relocation %s against absolute symbol "
+ 	       "`%s' in section `%pA' is disallowed\n"),
+ 	     input_section->owner, internal_reloc.howto->name, name,
+ 	     input_section);
+@@ -3429,9 +3429,9 @@ _bfd_x86_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+ 	    s = p->sec->output_section;
+ 	    if (s != NULL && (s->flags & SEC_READONLY) != 0)
+ 	      {
+-		info->callbacks->einfo
++		info->callbacks->fatal
+ 		  /* xgettext:c-format */
+-		  (_("%F%P: %pB: copy relocation against non-copyable "
++		  (_("%P: %pB: copy relocation against non-copyable "
+ 		     "protected symbol `%s' in %pB\n"),
+ 		   p->sec->owner, h->root.root.string,
+ 		   h->root.u.def.section->owner);
+@@ -4138,12 +4138,12 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 					      | SEC_HAS_CONTENTS
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create GNU property section\n"));
++	    info->callbacks->fatal (_("%P: failed to create GNU property section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, class_align))
+ 	    {
+ 	    error_alignment:
+-	      info->callbacks->einfo (_("%F%pA: failed to align section\n"),
++	      info->callbacks->fatal (_("%pA: failed to align section\n"),
+ 				      sec);
+ 	    }
+ 
+@@ -4404,7 +4404,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+       && !elf_vxworks_create_dynamic_sections (dynobj, info,
+ 					       &htab->srelplt2))
+     {
+-      info->callbacks->einfo (_("%F%P: failed to create VxWorks dynamic sections\n"));
++      info->callbacks->fatal (_("%P: failed to create VxWorks dynamic sections\n"));
+       return pbfd;
+     }
+ 
+@@ -4413,7 +4413,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+      don't need to do it in check_relocs.  */
+   if (htab->elf.sgot == NULL
+       && !_bfd_elf_create_got_section (dynobj, info))
+-    info->callbacks->einfo (_("%F%P: failed to create GOT sections\n"));
++    info->callbacks->fatal (_("%P: failed to create GOT sections\n"));
+ 
+   got_align = (bed->target_id == X86_64_ELF_DATA) ? 3 : 2;
+ 
+@@ -4431,7 +4431,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+   /* Create the ifunc sections here so that check_relocs can be
+      simplified.  */
+   if (!_bfd_elf_create_ifunc_sections (dynobj, info))
+-    info->callbacks->einfo (_("%F%P: failed to create ifunc sections\n"));
++    info->callbacks->fatal (_("%P: failed to create ifunc sections\n"));
+ 
+   plt_alignment = bfd_log2 (htab->plt.plt_entry_size);
+ 
+@@ -4468,7 +4468,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".plt.got",
+ 						    pltflags);
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create GOT PLT section\n"));
++	    info->callbacks->fatal (_("%P: failed to create GOT PLT section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, non_lazy_plt_alignment))
+ 	    goto error_alignment;
+@@ -4487,7 +4487,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							    ".plt.sec",
+ 							    pltflags);
+ 		  if (sec == NULL)
+-		    info->callbacks->einfo (_("%F%P: failed to create IBT-enabled PLT section\n"));
++		    info->callbacks->fatal (_("%P: failed to create IBT-enabled PLT section\n"));
+ 
+ 		  if (!bfd_set_section_alignment (sec, plt_alignment))
+ 		    goto error_alignment;
+@@ -4507,7 +4507,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".eh_frame",
+ 						    flags);
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create PLT .eh_frame section\n"));
++	    info->callbacks->fatal (_("%P: failed to create PLT .eh_frame section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, class_align))
+ 	    goto error_alignment;
+@@ -4520,7 +4520,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".eh_frame",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->einfo (_("%F%P: failed to create GOT PLT .eh_frame section\n"));
++		info->callbacks->fatal (_("%P: failed to create GOT PLT .eh_frame section\n"));
+ 
+ 	      if (!bfd_set_section_alignment (sec, class_align))
+ 		goto error_alignment;
+@@ -4534,7 +4534,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".eh_frame",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->einfo (_("%F%P: failed to create the second PLT .eh_frame section\n"));
++		info->callbacks->fatal (_("%P: failed to create the second PLT .eh_frame section\n"));
+ 
+ 	      if (!bfd_set_section_alignment (sec, class_align))
+ 		goto error_alignment;
+@@ -4554,7 +4554,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".sframe",
+ 						    flags);
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create PLT .sframe section\n"));
++	    info->callbacks->fatal (_("%P: failed to create PLT .sframe section\n"));
+ 
+ 	  // FIXME check this
+ 	  // if (!bfd_set_section_alignment (sec, class_align))
+@@ -4569,7 +4569,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".sframe",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->einfo (_("%F%P: failed to create second PLT .sframe section\n"));
++		info->callbacks->fatal (_("%P: failed to create second PLT .sframe section\n"));
+ 
+ 	      htab->plt_second_sframe = sec;
+ 	    }
+diff --git a/bfd/linker.c b/bfd/linker.c
+index 0821db55..5b912221 100644
+--- a/bfd/linker.c
++++ b/bfd/linker.c
+@@ -2982,7 +2982,7 @@ _bfd_generic_section_already_linked (bfd *abfd ATTRIBUTE_UNUSED,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->einfo (_("%F%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
+   return false;
+ }
+ 
+diff --git a/bfd/reloc.c b/bfd/reloc.c
+index 7583b7fd..1fee86f1 100644
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -8465,8 +8465,8 @@ bfd_generic_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
+ 			   bool *again)
+ {
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   *again = false;
+   return true;
+diff --git a/bfd/reloc16.c b/bfd/reloc16.c
+index ff5412dc..a16d6b20 100644
+--- a/bfd/reloc16.c
++++ b/bfd/reloc16.c
+@@ -151,8 +151,8 @@ bfd_coff_reloc16_relax_section (bfd *abfd,
+   long reloc_count;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* We only do global relaxation once.  It is not safe to do it multiple
+      times (see discussion of the "shrinks" array below).  */
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 6ef9abcd..9b01cc37 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -4681,7 +4681,7 @@ xcoff_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (hstub->target_section != NULL
+       && hstub->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    hstub->target_section);
+ 
+diff --git a/include/bfdlink.h b/include/bfdlink.h
+index eac07d78..0d03fa70 100644
+--- a/include/bfdlink.h
++++ b/include/bfdlink.h
+@@ -868,6 +868,9 @@ struct bfd_link_callbacks
+     (struct bfd_link_info *, struct bfd_link_hash_entry *h,
+      struct bfd_link_hash_entry *inh,
+      bfd *abfd, asection *section, bfd_vma address, flagword flags);
++  /* Fatal error.  */
++  void (*fatal)
++    (const char *fmt, ...) ATTRIBUTE_NORETURN;
+   /* Error or warning link info message.  */
+   void (*einfo)
+     (const char *fmt, ...);
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 878d9536..a61086c3 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -146,6 +146,7 @@ static struct bfd_link_callbacks link_callbacks =
+   reloc_dangerous,
+   unattached_reloc,
+   notice,
++  fatal,
+   einfo,
+   info_msg,
+   minfo,
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/0021-CVE-2025-1153-3.patch b/meta/recipes-devtools/binutils/binutils/0021-CVE-2025-1153-3.patch
new file mode 100644
index 0000000000..8aef77d2f8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0021-CVE-2025-1153-3.patch
@@ -0,0 +1,3756 @@
+From fe459e33c676883b5f28cc96c00e242973d906a9 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 24 Apr 2025 10:01:29 +0930
+Subject: [PATCH] PR 32603, revert message changes
+
+This puts back %F into translated fatal error messages
+(and reverts a few other small changes), to not disturb
+translation work
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=fe459e33c676883b5f28cc96c00e242973d906a9]
+CVE: CVE-2025-1153
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ bfd/archive.c                 |  2 +-
+ bfd/coff-aarch64.c            |  2 +-
+ bfd/coffgen.c                 |  2 +-
+ bfd/elf-ifunc.c               |  2 +-
+ bfd/elf-m10300.c              |  2 +-
+ bfd/elf-properties.c          |  4 +-
+ bfd/elf.c                     |  2 +-
+ bfd/elf32-arm.c               |  2 +-
+ bfd/elf32-avr.c               |  2 +-
+ bfd/elf32-csky.c              |  2 +-
+ bfd/elf32-frv.c               |  2 +-
+ bfd/elf32-hppa.c              |  6 +--
+ bfd/elf32-i386.c              |  2 +-
+ bfd/elf32-m68hc11.c           |  2 +-
+ bfd/elf32-m68hc12.c           |  2 +-
+ bfd/elf32-metag.c             |  2 +-
+ bfd/elf32-spu.c               |  4 +-
+ bfd/elf64-ia64-vms.c          |  2 +-
+ bfd/elf64-ppc.c               |  4 +-
+ bfd/elf64-x86-64.c            | 10 ++---
+ bfd/elflink.c                 |  6 +--
+ bfd/elfnn-aarch64.c           |  4 +-
+ bfd/elfnn-ia64.c              |  2 +-
+ bfd/elfnn-kvx.c               |  2 +-
+ bfd/elfnn-loongarch.c         |  2 +-
+ bfd/elfxx-aarch64.c           |  4 +-
+ bfd/elfxx-sparc.c             |  2 +-
+ bfd/elfxx-x86.c               | 42 +++++++++---------
+ bfd/linker.c                  |  2 +-
+ bfd/reloc.c                   |  2 +-
+ bfd/reloc16.c                 |  2 +-
+ bfd/xcofflink.c               |  2 +-
+ ld/emulparams/call_nop.sh     |  6 +--
+ ld/emulparams/cet.sh          |  2 +-
+ ld/emulparams/elf32mcore.sh   |  2 +-
+ ld/emulparams/x86-64-lam.sh   |  6 +--
+ ld/emulparams/x86-64-level.sh |  2 +-
+ ld/emultempl/aarch64elf.em    |  6 +--
+ ld/emultempl/aix.em           | 41 +++++++++---------
+ ld/emultempl/armelf.em        | 10 ++---
+ ld/emultempl/avrelf.em        |  2 +-
+ ld/emultempl/beos.em          | 18 ++++----
+ ld/emultempl/cr16elf.em       |  4 +-
+ ld/emultempl/cskyelf.em       |  4 +-
+ ld/emultempl/elf.em           | 14 +++---
+ ld/emultempl/hppaelf.em       |  4 +-
+ ld/emultempl/kvxelf.em        |  4 +-
+ ld/emultempl/loongarchelf.em  |  2 +-
+ ld/emultempl/m68hc1xelf.em    |  2 +-
+ ld/emultempl/m68kelf.em       |  4 +-
+ ld/emultempl/metagelf.em      |  4 +-
+ ld/emultempl/mipself.em       |  2 +-
+ ld/emultempl/mmix-elfnmmo.em  |  2 +-
+ ld/emultempl/nds32elf.em      |  6 +--
+ ld/emultempl/nto.em           | 10 ++---
+ ld/emultempl/pe.em            | 20 ++++-----
+ ld/emultempl/pep.em           | 16 +++----
+ ld/emultempl/ppc32elf.em      |  4 +-
+ ld/emultempl/ppc64elf.em      | 10 ++---
+ ld/emultempl/riscvelf.em      |  2 +-
+ ld/emultempl/s390.em          |  2 +-
+ ld/emultempl/scoreelf.em      |  2 +-
+ ld/emultempl/spuelf.em        | 20 ++++-----
+ ld/emultempl/tic6xdsbt.em     |  6 +--
+ ld/emultempl/ticoff.em        |  2 +-
+ ld/emultempl/v850elf.em       |  2 +-
+ ld/emultempl/vms.em           |  2 +-
+ ld/emultempl/xtensaelf.em     | 12 ++---
+ ld/emultempl/z80.em           |  2 +-
+ ld/ldcref.c                   |  8 ++--
+ ld/ldelf.c                    | 30 ++++++-------
+ ld/ldelfgen.c                 | 14 +++---
+ ld/ldexp.c                    | 42 +++++++++---------
+ ld/ldfile.c                   | 14 +++---
+ ld/ldgram.y                   |  6 +--
+ ld/ldlang.c                   | 82 +++++++++++++++++------------------
+ ld/ldlex.l                    | 10 ++---
+ ld/ldmain.c                   | 44 +++++++++----------
+ ld/ldmisc.c                   |  6 +--
+ ld/ldwrite.c                  | 18 ++++----
+ ld/lexsup.c                   | 64 +++++++++++++--------------
+ ld/mri.c                      |  2 +-
+ ld/pe-dll.c                   | 12 ++---
+ ld/plugin.c                   | 27 ++++++------
+ 84 files changed, 384 insertions(+), 384 deletions(-)
+
+diff --git a/bfd/archive.c b/bfd/archive.c
+index 0f617276..0596a304 100644
+--- a/bfd/archive.c
++++ b/bfd/archive.c
+@@ -750,7 +750,7 @@ _bfd_get_elt_at_filepos (bfd *archive, file_ptr filepos,
+ 	      if (info != NULL)
+ 		{
+ 		  info->callbacks->fatal
+-		    (_("%P: %pB(%s): error opening thin archive member: %E\n"),
++		    (_("%F%P: %pB(%s): error opening thin archive member: %E\n"),
+ 		     archive, filename);
+ 		  break;
+ 		}
+diff --git a/bfd/coff-aarch64.c b/bfd/coff-aarch64.c
+index 53f539e0..06007e6d 100644
+--- a/bfd/coff-aarch64.c
++++ b/bfd/coff-aarch64.c
+@@ -876,7 +876,7 @@ coff_pe_aarch64_relocate_section (bfd *output_bfd,
+ 	  }
+ 
+ 	default:
+-	  info->callbacks->fatal (_("%P: Unhandled relocation type %u\n"),
++	  info->callbacks->fatal (_("%F%P: Unhandled relocation type %u\n"),
+ 				  rel->r_type);
+ 	}
+     }
+diff --git a/bfd/coffgen.c b/bfd/coffgen.c
+index 3270cd2f..5e24210d 100644
+--- a/bfd/coffgen.c
++++ b/bfd/coffgen.c
+@@ -2793,7 +2793,7 @@ _bfd_coff_section_already_linked (bfd *abfd,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%F%P: already_linked_table: %E\n"));
+   return false;
+ }
+ 
+diff --git a/bfd/elf-ifunc.c b/bfd/elf-ifunc.c
+index 58a1ca5e..cb623563 100644
+--- a/bfd/elf-ifunc.c
++++ b/bfd/elf-ifunc.c
+@@ -141,7 +141,7 @@ _bfd_elf_allocate_ifunc_dyn_relocs (struct bfd_link_info *info,
+     {
+       info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
++	(_("%F%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
+ 	   "equality in `%pB' can not be used when making an "
+ 	   "executable; recompile with -fPIE and relink with -pie\n"),
+ 	 h->root.root.string,
+diff --git a/bfd/elf-m10300.c b/bfd/elf-m10300.c
+index cf6bb13b..129485fa 100644
+--- a/bfd/elf-m10300.c
++++ b/bfd/elf-m10300.c
+@@ -2647,7 +2647,7 @@ mn10300_elf_relax_section (bfd *abfd,
+ 
+   if (bfd_link_relocatable (link_info))
+     link_info->callbacks->fatal
+-      (_("%P: --relax and -r may not be used together\n"));
++      (_("%P%F: --relax and -r may not be used together\n"));
+ 
+   /* Assume nothing changes.  */
+   *again = false;
+diff --git a/bfd/elf-properties.c b/bfd/elf-properties.c
+index a4591472..2e8cc8af 100644
+--- a/bfd/elf-properties.c
++++ b/bfd/elf-properties.c
+@@ -665,11 +665,11 @@ _bfd_elf_link_setup_gnu_properties (struct bfd_link_info *info)
+ 					      | SEC_HAS_CONTENTS
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+-	    info->callbacks->fatal (_("%P: failed to create GNU property section\n"));
++	    info->callbacks->fatal (_("%F%P: failed to create GNU property section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec,
+ 					  elfclass == ELFCLASS64 ? 3 : 2))
+-	    info->callbacks->fatal (_("%pA: failed to align section\n"),
++	    info->callbacks->fatal (_("%F%pA: failed to align section\n"),
+ 				    sec);
+ 
+ 	  elf_section_type (sec) = SHT_NOTE;
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 8e4e1e7f..883aef5e 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -5189,7 +5189,7 @@ _bfd_elf_map_sections_to_segments (bfd *abfd,
+ 	  && bed->size_relative_relocs
+ 	  && !bed->size_relative_relocs (info, need_layout))
+ 	info->callbacks->fatal
+-	  (_("%P: failed to size relative relocations\n"));
++	  (_("%F%P: failed to size relative relocations\n"));
+     }
+ 
+   if (no_user_phdrs && bfd_count_sections (abfd) != 0)
+diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
+index b4a822f1..bb413bb9 100644
+--- a/bfd/elf32-arm.c
++++ b/bfd/elf32-arm.c
+@@ -5053,7 +5053,7 @@ arm_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-avr.c b/bfd/elf32-avr.c
+index 912f7533..fd9f18dd 100644
+--- a/bfd/elf32-avr.c
++++ b/bfd/elf32-avr.c
+@@ -2485,7 +2485,7 @@ elf32_avr_relax_section (bfd *abfd,
+ 
+   if (bfd_link_relocatable (link_info))
+     link_info->callbacks->fatal
+-      (_("%P: --relax and -r may not be used together\n"));
++      (_("%P%F: --relax and -r may not be used together\n"));
+ 
+   htab = avr_link_hash_table (link_info);
+   if (htab == NULL)
+diff --git a/bfd/elf32-csky.c b/bfd/elf32-csky.c
+index edff65a9..3ec0622e 100644
+--- a/bfd/elf32-csky.c
++++ b/bfd/elf32-csky.c
+@@ -3728,7 +3728,7 @@ csky_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-frv.c b/bfd/elf32-frv.c
+index 245db7c2..cac2663e 100644
+--- a/bfd/elf32-frv.c
++++ b/bfd/elf32-frv.c
+@@ -5618,7 +5618,7 @@ elf32_frvfdpic_relax_section (bfd *abfd ATTRIBUTE_UNUSED, asection *sec,
+ 
+   if (bfd_link_relocatable (info))
+     info->callbacks->fatal
+-      (_("%P: --relax and -r may not be used together\n"));
++      (_("%P%F: --relax and -r may not be used together\n"));
+ 
+   /* If we return early, we didn't change anything.  */
+   *again = false;
+diff --git a/bfd/elf32-hppa.c b/bfd/elf32-hppa.c
+index f1e67a06..0d0682de 100644
+--- a/bfd/elf32-hppa.c
++++ b/bfd/elf32-hppa.c
+@@ -729,7 +729,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+@@ -758,7 +758,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+@@ -839,7 +839,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index 1637e39f..42b96134 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -4093,7 +4093,7 @@ elf_i386_finish_dynamic_sections (bfd *output_bfd,
+       if (bfd_is_abs_section (htab->elf.splt->output_section))
+ 	{
+ 	  info->callbacks->fatal
+-	    (_("%P: discarded output section: `%pA'\n"),
++	    (_("%F%P: discarded output section: `%pA'\n"),
+ 	     htab->elf.splt);
+ 	  return false;
+ 	}
+diff --git a/bfd/elf32-m68hc11.c b/bfd/elf32-m68hc11.c
+index 6f705718..4b127ac7 100644
+--- a/bfd/elf32-m68hc11.c
++++ b/bfd/elf32-m68hc11.c
+@@ -419,7 +419,7 @@ m68hc11_elf_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-m68hc12.c b/bfd/elf32-m68hc12.c
+index bdfb9ca5..9a2f4638 100644
+--- a/bfd/elf32-m68hc12.c
++++ b/bfd/elf32-m68hc12.c
+@@ -539,7 +539,7 @@ m68hc12_elf_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-metag.c b/bfd/elf32-metag.c
+index 49f93cc7..94be520e 100644
+--- a/bfd/elf32-metag.c
++++ b/bfd/elf32-metag.c
+@@ -3342,7 +3342,7 @@ metag_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (hsh->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    hsh->target_section);
+ 
+diff --git a/bfd/elf32-spu.c b/bfd/elf32-spu.c
+index dd5d5fbe..c535b1f1 100644
+--- a/bfd/elf32-spu.c
++++ b/bfd/elf32-spu.c
+@@ -4689,7 +4689,7 @@ spu_elf_auto_overlay (struct bfd_link_info *info)
+  file_err:
+   bfd_set_error (bfd_error_system_call);
+  err_exit:
+-  info->callbacks->fatal (_("%P: auto overlay error: %E\n"));
++  info->callbacks->fatal (_("%F%P: auto overlay error: %E\n"));
+ }
+ 
+ /* Provide an estimate of total stack required.  */
+@@ -4742,7 +4742,7 @@ spu_elf_final_link (bfd *output_bfd, struct bfd_link_info *info)
+     info->callbacks->einfo (_("%X%P: stack/lrlive analysis error: %E\n"));
+ 
+   if (!spu_elf_build_stubs (info))
+-    info->callbacks->fatal (_("%P: can not build overlay stubs: %E\n"));
++    info->callbacks->fatal (_("%F%P: can not build overlay stubs: %E\n"));
+ 
+   return bfd_elf_final_link (output_bfd, info);
+ }
+diff --git a/bfd/elf64-ia64-vms.c b/bfd/elf64-ia64-vms.c
+index b1eaaac0..3c29e0d6 100644
+--- a/bfd/elf64-ia64-vms.c
++++ b/bfd/elf64-ia64-vms.c
+@@ -362,7 +362,7 @@ elf64_ia64_relax_section (bfd *abfd, asection *sec,
+ 
+   if (bfd_link_relocatable (link_info))
+     link_info->callbacks->fatal
+-      (_("%P: --relax and -r may not be used together\n"));
++      (_("%P%F: --relax and -r may not be used together\n"));
+ 
+   /* Don't even try to relax for non-ELF outputs.  */
+   if (!is_elf_hash_table (link_info->hash))
+diff --git a/bfd/elf64-ppc.c b/bfd/elf64-ppc.c
+index 7b798732..68d681a5 100644
+--- a/bfd/elf64-ppc.c
++++ b/bfd/elf64-ppc.c
+@@ -12289,7 +12289,7 @@ ppc_size_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (stub_entry->target_section != NULL
+       && stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+@@ -12297,7 +12297,7 @@ ppc_size_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (stub_entry->group->stub_sec != NULL
+       && stub_entry->group->stub_sec->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->group->stub_sec);
+ 
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index a22d57d7..41341cd8 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -3707,7 +3707,7 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 			    {
+ 			    corrupt_input:
+ 			      info->callbacks->fatal
+-				(_("%P: corrupt input: %pB\n"),
++				(_("%F%P: corrupt input: %pB\n"),
+ 				 input_bfd);
+ 			      return false;
+ 			    }
+@@ -4679,7 +4679,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+       /* Check PC-relative offset overflow in PLT entry.  */
+       if ((plt_got_pcrel_offset + 0x80000000) > 0xffffffff)
+ 	/* xgettext:c-format */
+-	info->callbacks->fatal (_("%pB: PC-relative offset overflow in PLT entry for `%s'\n"),
++	info->callbacks->fatal (_("%F%pB: PC-relative offset overflow in PLT entry for `%s'\n"),
+ 				output_bfd, h->root.root.string);
+ 
+       bfd_put_32 (output_bfd, plt_got_pcrel_offset,
+@@ -4752,7 +4752,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 		 will overflow first.  */
+ 	      if (plt0_offset > 0x80000000)
+ 		/* xgettext:c-format */
+-		info->callbacks->fatal (_("%pB: branch displacement overflow in PLT entry for `%s'\n"),
++		info->callbacks->fatal (_("%F%pB: branch displacement overflow in PLT entry for `%s'\n"),
+ 					output_bfd, h->root.root.string);
+ 	      bfd_put_32 (output_bfd, - plt0_offset,
+ 			  (plt->contents + h->plt.offset
+@@ -4805,7 +4805,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+       if ((got_after_plt && got_pcrel_offset < 0)
+ 	  || (!got_after_plt && got_pcrel_offset > 0))
+ 	/* xgettext:c-format */
+-	info->callbacks->fatal (_("%pB: PC-relative offset overflow in GOT PLT entry for `%s'\n"),
++	info->callbacks->fatal (_("%F%pB: PC-relative offset overflow in GOT PLT entry for `%s'\n"),
+ 				output_bfd, h->root.root.string);
+ 
+       bfd_put_32 (output_bfd, got_pcrel_offset,
+@@ -5093,7 +5093,7 @@ elf_x86_64_finish_dynamic_sections (bfd *output_bfd,
+       if (bfd_is_abs_section (htab->elf.splt->output_section))
+ 	{
+ 	  info->callbacks->fatal
+-	    (_("%P: discarded output section: `%pA'\n"),
++	    (_("%F%P: discarded output section: `%pA'\n"),
+ 	     htab->elf.splt);
+ 	  return false;
+ 	}
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index dba176cc..0c3ea0a3 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -12892,7 +12892,7 @@ bfd_elf_final_link (bfd *abfd, struct bfd_link_info *info)
+       && bed->finish_relative_relocs
+       && !bed->finish_relative_relocs (info))
+     info->callbacks->fatal
+-      (_("%P: %pB: failed to finish relative relocations\n"), abfd);
++      (_("%F%P: %pB: failed to finish relative relocations\n"), abfd);
+ 
+   /* Since ELF permits relocations to be against local symbols, we
+      must have the local symbols available when we do the relocations.
+@@ -14087,7 +14087,7 @@ _bfd_elf_gc_mark_extra_sections (struct bfd_link_info *info,
+ 	  else if (strcmp (bfd_section_name (isec),
+ 			   "__patchable_function_entries") == 0
+ 		   && elf_linked_to_section (isec) == NULL)
+-	      info->callbacks->fatal (_("%P: %pB(%pA): error: "
++	      info->callbacks->fatal (_("%F%P: %pB(%pA): error: "
+ 					"need linked-to section "
+ 					"for --gc-sections\n"),
+ 				      isec->owner, isec);
+@@ -15264,7 +15264,7 @@ _bfd_elf_section_already_linked (bfd *abfd,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%F%P: already_linked_table: %E\n"));
+   return sec->output_section == bfd_abs_section_ptr;
+ }
+ 
+diff --git a/bfd/elfnn-aarch64.c b/bfd/elfnn-aarch64.c
+index 0f454d23..d7a85ef0 100644
+--- a/bfd/elfnn-aarch64.c
++++ b/bfd/elfnn-aarch64.c
+@@ -3272,7 +3272,7 @@ aarch64_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without "
+ 			      "--enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+@@ -9010,7 +9010,7 @@ elfNN_aarch64_allocate_dynrelocs (struct elf_link_hash_entry *h, void *inf)
+ 	  {
+ 	    info->callbacks->fatal
+ 		/* xgettext:c-format */
+-		(_ ("%P: %pB: copy relocation against non-copyable "
++		(_ ("%F%P: %pB: copy relocation against non-copyable "
+ 		    "protected symbol `%s'\n"),
+ 		 p->sec->owner, h->root.root.string);
+ 	    return false;
+diff --git a/bfd/elfnn-ia64.c b/bfd/elfnn-ia64.c
+index 41d9e6fe..8d576c81 100644
+--- a/bfd/elfnn-ia64.c
++++ b/bfd/elfnn-ia64.c
+@@ -362,7 +362,7 @@ elfNN_ia64_relax_section (bfd *abfd, asection *sec,
+ 
+   if (bfd_link_relocatable (link_info))
+     link_info->callbacks->fatal
+-      (_("%P: --relax and -r may not be used together\n"));
++      (_("%P%F: --relax and -r may not be used together\n"));
+ 
+   /* Don't even try to relax for non-ELF outputs.  */
+   if (!is_elf_hash_table (link_info->hash))
+diff --git a/bfd/elfnn-kvx.c b/bfd/elfnn-kvx.c
+index b752891b..9bbbc929 100644
+--- a/bfd/elfnn-kvx.c
++++ b/bfd/elfnn-kvx.c
+@@ -927,7 +927,7 @@ kvx_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign '%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign '%pA' to an output section. "
+ 			      "Retry without "
+ 			      "--enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+diff --git a/bfd/elfnn-loongarch.c b/bfd/elfnn-loongarch.c
+index a8c4226d..12ee56a9 100644
+--- a/bfd/elfnn-loongarch.c
++++ b/bfd/elfnn-loongarch.c
+@@ -1447,7 +1447,7 @@ local_allocate_ifunc_dyn_relocs (struct bfd_link_info *info,
+     {
+       info->callbacks->fatal
+ 	/* xgettext:c-format.  */
+-	(_("%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
++	(_("%F%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
+ 	   "equality in `%pB' can not be used when making an "
+ 	   "executable; recompile with -fPIE and relink with -pie\n"),
+ 	 h->root.root.string,
+diff --git a/bfd/elfxx-aarch64.c b/bfd/elfxx-aarch64.c
+index 161c8a52..2aa7dd54 100644
+--- a/bfd/elfxx-aarch64.c
++++ b/bfd/elfxx-aarch64.c
+@@ -755,11 +755,11 @@ _bfd_aarch64_elf_link_setup_gnu_properties (struct bfd_link_info *info,
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+ 	    info->callbacks->fatal (
+-	      _("%P: failed to create GNU property section\n"));
++	      _("%F%P: failed to create GNU property section\n"));
+ 
+           align = (bfd_get_mach (ebfd) & bfd_mach_aarch64_ilp32) ? 2 : 3;
+ 	  if (!bfd_set_section_alignment (sec, align))
+-	    info->callbacks->fatal (_("%pA: failed to align section\n"),
++	    info->callbacks->fatal (_("%F%pA: failed to align section\n"),
+ 				    sec);
+ 
+ 	  elf_section_type (sec) = SHT_NOTE;
+diff --git a/bfd/elfxx-sparc.c b/bfd/elfxx-sparc.c
+index 95b1928d..76057d3b 100644
+--- a/bfd/elfxx-sparc.c
++++ b/bfd/elfxx-sparc.c
+@@ -2681,7 +2681,7 @@ _bfd_sparc_elf_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
+ {
+   if (bfd_link_relocatable (link_info))
+     link_info->callbacks->fatal
+-      (_("%P: --relax and -r may not be used together\n"));
++      (_("%P%F: --relax and -r may not be used together\n"));
+ 
+   *again = false;
+   sec_do_relax (section) = 1;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 606c8905..803d6a54 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -533,7 +533,7 @@ elf_x86_allocate_dynrelocs (struct elf_link_hash_entry *h, void *inf)
+ 	    {
+ 	      info->callbacks->fatal
+ 		/* xgettext:c-format */
+-		(_("%P: %pB: copy relocation against non-copyable "
++		(_("%F%P: %pB: copy relocation against non-copyable "
+ 		   "protected symbol `%s' in %pB\n"),
+ 		 p->sec->owner, h->root.root.string,
+ 		 h->root.u.def.section->owner);
+@@ -1032,7 +1032,7 @@ elf_x86_relative_reloc_record_add
+     {
+       info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%P: %pB: failed to allocate relative reloc record\n"),
++	(_("%F%P: %pB: failed to allocate relative reloc record\n"),
+ 	 info->output_bfd);
+       return false;
+     }
+@@ -1390,7 +1390,7 @@ elf64_dt_relr_bitmap_add
+     {
+       info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%P: %pB: failed to allocate 64-bit DT_RELR bitmap\n"),
++	(_("%F%P: %pB: failed to allocate 64-bit DT_RELR bitmap\n"),
+ 	 info->output_bfd);
+     }
+ 
+@@ -1426,7 +1426,7 @@ elf32_dt_relr_bitmap_add
+     {
+       info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%P: %pB: failed to allocate 32-bit DT_RELR bitmap\n"),
++	(_("%F%P: %pB: failed to allocate 32-bit DT_RELR bitmap\n"),
+ 	 info->output_bfd);
+     }
+ 
+@@ -1563,7 +1563,7 @@ elf_x86_size_or_finish_relative_reloc
+ 			  if (!bfd_malloc_and_get_section (sec->owner,
+ 							   sec,
+ 							   &contents))
+-			    info->callbacks->einfo
++			    info->callbacks->fatal
+ 			      /* xgettext:c-format */
+ 			      (_("%F%P: %pB: failed to allocate memory for section `%pA'\n"),
+ 			       info->output_bfd, sec);
+@@ -1752,7 +1752,7 @@ elf_x86_compute_dl_relr_bitmap
+       else
+ 	info->callbacks->fatal
+ 	  /* xgettext:c-format */
+-	  (_("%P: %pB: size of compact relative reloc section is "
++	  (_("%F%P: %pB: size of compact relative reloc section is "
+ 	     "changed: new (%lu) != old (%lu)\n"),
+ 	   info->output_bfd, htab->dt_relr_bitmap.count,
+ 	   dt_relr_bitmap_count);
+@@ -1774,7 +1774,7 @@ elf_x86_write_dl_relr_bitmap (struct bfd_link_info *info,
+   if (contents == NULL)
+     info->callbacks->fatal
+       /* xgettext:c-format */
+-      (_("%P: %pB: failed to allocate compact relative reloc section\n"),
++      (_("%F%P: %pB: failed to allocate compact relative reloc section\n"),
+        info->output_bfd);
+ 
+   /* Cache the section contents for elf_link_input_bfd.  */
+@@ -2221,7 +2221,7 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+ 				     sym, NULL);
+ 	  info->callbacks->fatal
+ 	    /* xgettext:c-format */
+-	    (_("%P: %pB: relocation %s against absolute symbol "
++	    (_("%F%P: %pB: relocation %s against absolute symbol "
+ 	       "`%s' in section `%pA' is disallowed\n"),
+ 	     input_section->owner, internal_reloc.howto->name, name,
+ 	     input_section);
+@@ -3431,7 +3431,7 @@ _bfd_x86_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+ 	      {
+ 		info->callbacks->fatal
+ 		  /* xgettext:c-format */
+-		  (_("%P: %pB: copy relocation against non-copyable "
++		  (_("%F%P: %pB: copy relocation against non-copyable "
+ 		     "protected symbol `%s' in %pB\n"),
+ 		   p->sec->owner, h->root.root.string,
+ 		   h->root.u.def.section->owner);
+@@ -4138,12 +4138,12 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 					      | SEC_HAS_CONTENTS
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+-	    info->callbacks->fatal (_("%P: failed to create GNU property section\n"));
++	    info->callbacks->fatal (_("%F%P: failed to create GNU property section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, class_align))
+ 	    {
+ 	    error_alignment:
+-	      info->callbacks->fatal (_("%pA: failed to align section\n"),
++	      info->callbacks->fatal (_("%F%pA: failed to align section\n"),
+ 				      sec);
+ 	    }
+ 
+@@ -4404,7 +4404,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+       && !elf_vxworks_create_dynamic_sections (dynobj, info,
+ 					       &htab->srelplt2))
+     {
+-      info->callbacks->fatal (_("%P: failed to create VxWorks dynamic sections\n"));
++      info->callbacks->fatal (_("%F%P: failed to create VxWorks dynamic sections\n"));
+       return pbfd;
+     }
+ 
+@@ -4413,7 +4413,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+      don't need to do it in check_relocs.  */
+   if (htab->elf.sgot == NULL
+       && !_bfd_elf_create_got_section (dynobj, info))
+-    info->callbacks->fatal (_("%P: failed to create GOT sections\n"));
++    info->callbacks->fatal (_("%F%P: failed to create GOT sections\n"));
+ 
+   got_align = (bed->target_id == X86_64_ELF_DATA) ? 3 : 2;
+ 
+@@ -4431,7 +4431,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+   /* Create the ifunc sections here so that check_relocs can be
+      simplified.  */
+   if (!_bfd_elf_create_ifunc_sections (dynobj, info))
+-    info->callbacks->fatal (_("%P: failed to create ifunc sections\n"));
++    info->callbacks->fatal (_("%F%P: failed to create ifunc sections\n"));
+ 
+   plt_alignment = bfd_log2 (htab->plt.plt_entry_size);
+ 
+@@ -4468,7 +4468,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".plt.got",
+ 						    pltflags);
+ 	  if (sec == NULL)
+-	    info->callbacks->fatal (_("%P: failed to create GOT PLT section\n"));
++	    info->callbacks->fatal (_("%F%P: failed to create GOT PLT section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, non_lazy_plt_alignment))
+ 	    goto error_alignment;
+@@ -4487,7 +4487,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							    ".plt.sec",
+ 							    pltflags);
+ 		  if (sec == NULL)
+-		    info->callbacks->fatal (_("%P: failed to create IBT-enabled PLT section\n"));
++		    info->callbacks->fatal (_("%F%P: failed to create IBT-enabled PLT section\n"));
+ 
+ 		  if (!bfd_set_section_alignment (sec, plt_alignment))
+ 		    goto error_alignment;
+@@ -4507,7 +4507,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".eh_frame",
+ 						    flags);
+ 	  if (sec == NULL)
+-	    info->callbacks->fatal (_("%P: failed to create PLT .eh_frame section\n"));
++	    info->callbacks->fatal (_("%F%P: failed to create PLT .eh_frame section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, class_align))
+ 	    goto error_alignment;
+@@ -4520,7 +4520,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".eh_frame",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->fatal (_("%P: failed to create GOT PLT .eh_frame section\n"));
++		info->callbacks->fatal (_("%F%P: failed to create GOT PLT .eh_frame section\n"));
+ 
+ 	      if (!bfd_set_section_alignment (sec, class_align))
+ 		goto error_alignment;
+@@ -4534,7 +4534,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".eh_frame",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->fatal (_("%P: failed to create the second PLT .eh_frame section\n"));
++		info->callbacks->fatal (_("%F%P: failed to create the second PLT .eh_frame section\n"));
+ 
+ 	      if (!bfd_set_section_alignment (sec, class_align))
+ 		goto error_alignment;
+@@ -4554,7 +4554,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".sframe",
+ 						    flags);
+ 	  if (sec == NULL)
+-	    info->callbacks->fatal (_("%P: failed to create PLT .sframe section\n"));
++	    info->callbacks->fatal (_("%F%P: failed to create PLT .sframe section\n"));
+ 
+ 	  // FIXME check this
+ 	  // if (!bfd_set_section_alignment (sec, class_align))
+@@ -4569,7 +4569,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".sframe",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->fatal (_("%P: failed to create second PLT .sframe section\n"));
++		info->callbacks->fatal (_("%F%P: failed to create second PLT .sframe section\n"));
+ 
+ 	      htab->plt_second_sframe = sec;
+ 	    }
+diff --git a/bfd/linker.c b/bfd/linker.c
+index 5b912221..7940e587 100644
+--- a/bfd/linker.c
++++ b/bfd/linker.c
+@@ -2982,7 +2982,7 @@ _bfd_generic_section_already_linked (bfd *abfd ATTRIBUTE_UNUSED,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%F%P: already_linked_table: %E\n"));
+   return false;
+ }
+ 
+diff --git a/bfd/reloc.c b/bfd/reloc.c
+index 1fee86f1..433f8e74 100644
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -8466,7 +8466,7 @@ bfd_generic_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
+ {
+   if (bfd_link_relocatable (link_info))
+     link_info->callbacks->fatal
+-      (_("%P: --relax and -r may not be used together\n"));
++      (_("%P%F: --relax and -r may not be used together\n"));
+ 
+   *again = false;
+   return true;
+diff --git a/bfd/reloc16.c b/bfd/reloc16.c
+index a16d6b20..b45ac263 100644
+--- a/bfd/reloc16.c
++++ b/bfd/reloc16.c
+@@ -152,7 +152,7 @@ bfd_coff_reloc16_relax_section (bfd *abfd,
+ 
+   if (bfd_link_relocatable (link_info))
+     link_info->callbacks->fatal
+-      (_("%P: --relax and -r may not be used together\n"));
++      (_("%P%F: --relax and -r may not be used together\n"));
+ 
+   /* We only do global relaxation once.  It is not safe to do it multiple
+      times (see discussion of the "shrinks" array below).  */
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 9b01cc37..e0165d20 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -4681,7 +4681,7 @@ xcoff_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (hstub->target_section != NULL
+       && hstub->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%F%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    hstub->target_section);
+ 
+diff --git a/ld/emulparams/call_nop.sh b/ld/emulparams/call_nop.sh
+index 7dd6dfb1..450d05ab 100644
+--- a/ld/emulparams/call_nop.sh
++++ b/ld/emulparams/call_nop.sh
+@@ -20,7 +20,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_CALL_NOP='
+ 	      char *end;
+ 	      params.call_nop_byte = strtoul (optarg + 16 , &end, 0);
+ 	      if (*end)
+-		fatal (_("%P: invalid number for -z call-nop=prefix-: %s\n"),
++		fatal (_("%F%P: invalid number for -z call-nop=prefix-: %s\n"),
+ 		       optarg + 16);
+ 	      params.call_nop_as_suffix = false;
+ 	    }
+@@ -29,12 +29,12 @@ PARSE_AND_LIST_ARGS_CASE_Z_CALL_NOP='
+ 	      char *end;
+ 	      params.call_nop_byte = strtoul (optarg + 16, &end, 0);
+ 	      if (*end)
+-		fatal (_("%P: invalid number for -z call-nop=suffix-: %s\n"),
++		fatal (_("%F%P: invalid number for -z call-nop=suffix-: %s\n"),
+ 		       optarg + 16);
+ 	      params.call_nop_as_suffix = true;
+ 	    }
+ 	  else
+-	    fatal (_("%P: unsupported option: -z %s\n"), optarg);
++	    fatal (_("%F%P: unsupported option: -z %s\n"), optarg);
+ 	}
+ '
+ 
+diff --git a/ld/emulparams/cet.sh b/ld/emulparams/cet.sh
+index e463441d..824bcf0e 100644
+--- a/ld/emulparams/cet.sh
++++ b/ld/emulparams/cet.sh
+@@ -29,7 +29,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_CET='
+ 				 | prop_report_ibt
+ 				 | prop_report_shstk);
+ 	  else
+-	    fatal (_("%P: invalid option for -z cet-report=: %s\n"),
++	    fatal (_("%F%P: invalid option for -z cet-report=: %s\n"),
+ 		   optarg + 11);
+ 	}
+ '
+diff --git a/ld/emulparams/elf32mcore.sh b/ld/emulparams/elf32mcore.sh
+index 275a796f..99261ca8 100644
+--- a/ld/emulparams/elf32mcore.sh
++++ b/ld/emulparams/elf32mcore.sh
+@@ -46,6 +46,6 @@ PARSE_AND_LIST_ARGS_CASES='
+     case OPTION_BASE_FILE:
+       link_info.base_file = fopen (optarg, FOPEN_WB);
+       if (link_info.base_file == NULL)
+-	fatal (_("%P: cannot open base file %s\n"), optarg);
++	fatal (_("%F%P: cannot open base file %s\n"), optarg);
+       break;
+ '
+diff --git a/ld/emulparams/x86-64-lam.sh b/ld/emulparams/x86-64-lam.sh
+index 6e629ebb..8675a01f 100644
+--- a/ld/emulparams/x86-64-lam.sh
++++ b/ld/emulparams/x86-64-lam.sh
+@@ -25,7 +25,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_LAM='
+ 	  else if (strcmp (optarg + 15, "error") == 0)
+ 	    params.lam_u48_report = prop_report_error;
+ 	  else
+-	    fatal (_("%P: invalid option for -z lam-u48-report=: %s\n"),
++	    fatal (_("%F%P: invalid option for -z lam-u48-report=: %s\n"),
+ 		   optarg + 15);
+ 	}
+       else if (strcmp (optarg, "lam-u57") == 0)
+@@ -39,7 +39,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_LAM='
+ 	  else if (strcmp (optarg + 15, "error") == 0)
+ 	    params.lam_u57_report = prop_report_error;
+ 	  else
+-	    fatal (_("%P: invalid option for -z lam-u57-report=: %s\n"),
++	    fatal (_("%F%P: invalid option for -z lam-u57-report=: %s\n"),
+ 		   optarg + 15);
+ 	}
+       else if (strncmp (optarg, "lam-report=", 11) == 0)
+@@ -60,7 +60,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_LAM='
+ 	      params.lam_u57_report = prop_report_error;
+ 	    }
+ 	  else
+-	    fatal (_("%P: invalid option for -z lam-report=: %s\n"),
++	    fatal (_("%F%P: invalid option for -z lam-report=: %s\n"),
+ 		   optarg + 11);
+ 	}
+ '
+diff --git a/ld/emulparams/x86-64-level.sh b/ld/emulparams/x86-64-level.sh
+index 7e27cf1e..3002a1f7 100644
+--- a/ld/emulparams/x86-64-level.sh
++++ b/ld/emulparams/x86-64-level.sh
+@@ -10,7 +10,7 @@ PARSE_AND_LIST_ARGS_CASE_Z_X86_64_LEVEL='
+ 	  char *end;
+ 	  unsigned int level = strtoul (optarg + 8 , &end, 10);
+ 	  if (*end != '\0' || level < 2 || level > 4)
+-	    fatal (_("%P: invalid x86-64 ISA level: %s\n"), optarg);
++	    fatal (_("%F%P: invalid x86-64 ISA level: %s\n"), optarg);
+ 	  params.isa_level = level;
+ 	}
+ '
+diff --git a/ld/emultempl/aarch64elf.em b/ld/emultempl/aarch64elf.em
+index a6637718..1cdd433d 100644
+--- a/ld/emultempl/aarch64elf.em
++++ b/ld/emultempl/aarch64elf.em
+@@ -316,7 +316,7 @@ aarch64_elf_create_output_section_statements (void)
+ 	 These will only be created if the output format is an arm format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      fatal (_("%P: error: cannot change output format "
++      fatal (_("%F%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "AArch64");
+       return;
+     }
+@@ -342,7 +342,7 @@ aarch64_elf_create_output_section_statements (void)
+ 			      bfd_get_arch (link_info.output_bfd),
+ 			      bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create BFD: %E\n"));
++      fatal (_("%F%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -468,7 +468,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 
+ 	group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%F%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ '
+diff --git a/ld/emultempl/aix.em b/ld/emultempl/aix.em
+index 29acdbc9..85bd45fa 100644
+--- a/ld/emultempl/aix.em
++++ b/ld/emultempl/aix.em
+@@ -335,7 +335,7 @@ read_file_list (const char *filename)
+   f = fopen (filename, FOPEN_RT);
+   if (f == NULL)
+     {
+-      fatal (_("%P: cannot open %s\n"), filename);
++      fatal (_("%F%P: cannot open %s\n"), filename);
+       return;
+     }
+   if (fseek (f, 0L, SEEK_END) == -1)
+@@ -383,7 +383,7 @@ read_file_list (const char *filename)
+ 
+  error:
+   fclose (f);
+-  fatal (_("%P: cannot read %s\n"), optarg);
++  fatal (_("%F%P: cannot read %s\n"), optarg);
+ }
+ 
+ static bool
+@@ -734,7 +734,7 @@ gld${EMULATION_NAME}_after_open (void)
+       size = (p->count + 2) * 4;
+       if (!bfd_xcoff_link_record_set (link_info.output_bfd, &link_info,
+ 				      p->h, size))
+-	fatal (_("%P: bfd_xcoff_link_record_set failed: %E\n"));
++	fatal (_("%F%P: bfd_xcoff_link_record_set failed: %E\n"));
+     }
+ }
+ 
+@@ -764,9 +764,9 @@ gld${EMULATION_NAME}_before_allocation (void)
+ 
+       h = bfd_link_hash_lookup (link_info.hash, el->name, false, false, false);
+       if (h == NULL)
+-	fatal (_("%P: bfd_link_hash_lookup of export symbol failed: %E\n"));
++	fatal (_("%F%P: bfd_link_hash_lookup of export symbol failed: %E\n"));
+       if (!bfd_xcoff_export_symbol (link_info.output_bfd, &link_info, h))
+-	fatal (_("%P: bfd_xcoff_export_symbol failed: %E\n"));
++	fatal (_("%F%P: bfd_xcoff_export_symbol failed: %E\n"));
+     }
+ 
+   /* Track down all relocations called for by the linker script (these
+@@ -849,7 +849,7 @@ gld${EMULATION_NAME}_before_allocation (void)
+       (link_info.output_bfd, &link_info, libpath, entry_symbol.name,
+        file_align, maxstack, maxdata, gc && !unix_ld,
+        modtype, textro, flags, special_sections, rtld))
+-    fatal (_("%P: failed to set dynamic section sizes: %E\n"));
++    fatal (_("%F%P: failed to set dynamic section sizes: %E\n"));
+ 
+   /* Look through the special sections, and put them in the right
+      place in the link ordering.  This is especially magic.  */
+@@ -871,8 +871,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+       is = NULL;
+       os = lang_output_section_get (sec->output_section);
+       if (os == NULL)
+-	fatal (_("%P: can't find output section %pA\n"),
+-	       sec->output_section);
++	fatal (_("%F%P: can't find output section %s\n"),
++	       sec->output_section->name);
+ 
+       for (pls = &os->children.head; *pls != NULL; pls = &(*pls)->header.next)
+ 	{
+@@ -908,7 +908,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+ 
+       if (is == NULL)
+ 	{
+-	  fatal (_("%P: can't find %pA in output section\n"), sec);
++	  fatal (_("%F%P: can't find %s in output section\n"),
++		 bfd_section_name (sec));
+ 	}
+ 
+       /* Now figure out where the section should go.  */
+@@ -1161,7 +1162,7 @@ gld${EMULATION_NAME}_after_allocation (void)
+ 
+   /* Now that everything is in place, finalize the dynamic sections.  */
+   if (!bfd_xcoff_build_dynamic_sections (link_info.output_bfd, &link_info))
+-    fatal (_("%P: failed to layout dynamic sections: %E\n"));
++    fatal (_("%F%P: failed to layout dynamic sections: %E\n"));
+ 
+   if (!bfd_link_relocatable (&link_info))
+     {
+@@ -1312,7 +1313,7 @@ gld${EMULATION_NAME}_read_file (const char *filename, bool import)
+   if (f == NULL)
+     {
+       bfd_set_error (bfd_error_system_call);
+-      fatal ("%P: %s: %E\n", filename);
++      fatal ("%F%P: %s: %E\n", filename);
+       return;
+     }
+ 
+@@ -1374,7 +1375,7 @@ gld${EMULATION_NAME}_read_file (const char *filename, bool import)
+ 	      obstack_free (o, obstack_base (o));
+ 	    }
+ 	  else if (*s == '(')
+-	    fatal (_("%P:%s:%d: #! ([member]) is not supported "
++	    fatal (_("%F%P:%s:%d: #! ([member]) is not supported "
+ 		     "in import files\n"),
+ 		   filename, lineno);
+ 	  else
+@@ -1391,7 +1392,7 @@ gld${EMULATION_NAME}_read_file (const char *filename, bool import)
+ 	      *s = '\0';
+ 	      if (!bfd_xcoff_split_import_path (link_info.output_bfd,
+ 						start, &imppath, &impfile))
+-		fatal (_("%P: could not parse import path: %E\n"));
++		fatal (_("%F%P: could not parse import path: %E\n"));
+ 	      while (ISSPACE (cs))
+ 		{
+ 		  ++s;
+@@ -1546,10 +1547,10 @@ gld${EMULATION_NAME}_find_relocs (lang_statement_union_type *s)
+ 
+       rs = &s->reloc_statement;
+       if (rs->name == NULL)
+-	fatal (_("%P: only relocations against symbols are permitted\n"));
++	fatal (_("%F%P: only relocations against symbols are permitted\n"));
+       if (!bfd_xcoff_link_count_reloc (link_info.output_bfd, &link_info,
+ 				       rs->name))
+-	fatal (_("%P: bfd_xcoff_link_count_reloc failed: %E\n"));
++	fatal (_("%F%P: bfd_xcoff_link_count_reloc failed: %E\n"));
+     }
+ 
+   if (s->header.type == lang_assignment_statement_enum)
+@@ -1578,7 +1579,7 @@ gld${EMULATION_NAME}_find_exp_assignment (etree_type *exp)
+ 	  if (!bfd_xcoff_record_link_assignment (link_info.output_bfd,
+ 						 &link_info,
+ 						 exp->assign.dst))
+-	    fatal (_("%P: failed to record assignment to %s: %E\n"),
++	    fatal (_("%F%P: failed to record assignment to %s: %E\n"),
+ 		   exp->assign.dst);
+ 	}
+       gld${EMULATION_NAME}_find_exp_assignment (exp->assign.src);
+@@ -1673,7 +1674,7 @@ gld${EMULATION_NAME}_create_output_section_statements (void)
+ 			     bfd_get_arch (link_info.output_bfd),
+ 			     bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create stub BFD: %E\n"));
++      fatal (_("%F%P: can not create stub BFD: %E\n"));
+       return;
+     }
+ 
+@@ -1683,7 +1684,7 @@ gld${EMULATION_NAME}_create_output_section_statements (void)
+ 
+   /* Pass linker params to the back-end. */
+   if (!bfd_xcoff_link_init (&link_info, &params))
+-    fatal (_("%P: can not init BFD: %E\n"));
++    fatal (_("%F%P: can not init BFD: %E\n"));
+ 
+   /* __rtinit */
+   if (link_info.init_function != NULL
+@@ -1700,7 +1701,7 @@ gld${EMULATION_NAME}_create_output_section_statements (void)
+ 				  bfd_get_arch (link_info.output_bfd),
+ 				  bfd_get_mach (link_info.output_bfd)))
+ 	{
+-	  fatal (_("%P: can not create BFD: %E\n"));
++	  fatal (_("%F%P: can not create BFD: %E\n"));
+ 	  return;
+ 	}
+ 
+@@ -1710,7 +1711,7 @@ gld${EMULATION_NAME}_create_output_section_statements (void)
+ 					    link_info.fini_function,
+ 					    rtld))
+ 	{
+-	  fatal (_("%P: can not create BFD: %E\n"));
++	  fatal (_("%F%P: can not create BFD: %E\n"));
+ 	  return;
+ 	}
+ 
+diff --git a/ld/emultempl/armelf.em b/ld/emultempl/armelf.em
+index 504fb0cd..4240f4e7 100644
+--- a/ld/emultempl/armelf.em
++++ b/ld/emultempl/armelf.em
+@@ -521,7 +521,7 @@ arm_elf_create_output_section_statements (void)
+ 	 These will only be created if the output format is an arm format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      fatal (_("%P: error: cannot change output format "
++      fatal (_("%F%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "ARM");
+       return;
+     }
+@@ -532,10 +532,10 @@ arm_elf_create_output_section_statements (void)
+ 					bfd_get_target (link_info.output_bfd));
+ 
+       if (params.in_implib_bfd == NULL)
+-	fatal (_("%P: %s: can't open: %E\n"), in_implib_filename);
++	fatal (_("%F%P: %s: can't open: %E\n"), in_implib_filename);
+ 
+       if (!bfd_check_format (params.in_implib_bfd, bfd_object))
+-	fatal (_("%P: %s: not a relocatable file: %E\n"), in_implib_filename);
++	fatal (_("%F%P: %s: not a relocatable file: %E\n"), in_implib_filename);
+     }
+ 
+   bfd_elf32_arm_set_target_params (link_info.output_bfd, &link_info, &params);
+@@ -549,7 +549,7 @@ arm_elf_create_output_section_statements (void)
+ 			      bfd_get_arch (link_info.output_bfd),
+ 			      bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create BFD: %E\n"));
++      fatal (_("%F%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -734,7 +734,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 
+ 	group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%F%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ 
+diff --git a/ld/emultempl/avrelf.em b/ld/emultempl/avrelf.em
+index dd5b57d1..854c57bb 100644
+--- a/ld/emultempl/avrelf.em
++++ b/ld/emultempl/avrelf.em
+@@ -116,7 +116,7 @@ avr_elf_create_output_section_statements (void)
+ 
+   if (bfd_get_flavour (link_info.output_bfd) != bfd_target_elf_flavour)
+     {
+-      fatal (_("%P: error: cannot change output format "
++      fatal (_("%F%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "AVR");
+       return;
+     }
+diff --git a/ld/emultempl/beos.em b/ld/emultempl/beos.em
+index 81878b02..e936b4f5 100644
+--- a/ld/emultempl/beos.em
++++ b/ld/emultempl/beos.em
+@@ -227,7 +227,7 @@ set_pe_subsystem (void)
+ 	  return;
+ 	}
+     }
+-  fatal (_("%P: invalid subsystem type %s\n"), optarg);
++  fatal (_("%F%P: invalid subsystem type %s\n"), optarg);
+ }
+ 
+ 
+@@ -237,7 +237,7 @@ set_pe_value (char *name)
+   char *end;
+   set_pe_name (name,  strtoul (optarg, &end, 0));
+   if (end == optarg)
+-    fatal (_("%P: invalid hex number for PE parameter '%s'\n"), optarg);
++    fatal (_("%F%P: invalid hex number for PE parameter '%s'\n"), optarg);
+ 
+   optarg = end;
+ }
+@@ -252,7 +252,7 @@ set_pe_stack_heap (char *resname, char *comname)
+       set_pe_value (comname);
+     }
+   else if (*optarg)
+-    fatal (_("%P: strange hex info for PE parameter '%s'\n"), optarg);
++    fatal (_("%F%P: strange hex info for PE parameter '%s'\n"), optarg);
+ }
+ 
+ 
+@@ -267,7 +267,7 @@ gld${EMULATION_NAME}_handle_option (int optc)
+     case OPTION_BASE_FILE:
+       link_info.base_file = fopen (optarg, FOPEN_WB);
+       if (link_info.base_file == NULL)
+-	fatal (_("%P: cannot open base file %s\n"), optarg);
++	fatal (_("%F%P: cannot open base file %s\n"), optarg);
+       break;
+ 
+       /* PE options */
+@@ -376,7 +376,7 @@ gld${EMULATION_NAME}_after_open (void)
+      FIXME: This should be done via a function, rather than by
+      including an internal BFD header.  */
+   if (!obj_pe (link_info.output_bfd))
+-    fatal (_("%P: PE operations on non PE file\n"));
++    fatal (_("%F%P: PE operations on non PE file\n"));
+ 
+   pe_data(link_info.output_bfd)->pe_opthdr = pe;
+   pe_data(link_info.output_bfd)->dll = init[DLLOFF].value;
+@@ -425,12 +425,12 @@ sort_by_file_name (const void *a, const void *b)
+ 
+       if (!bfd_get_section_contents (sa->owner, sa, &a_sec, (file_ptr) 0,
+ 				     (bfd_size_type) sizeof (a_sec)))
+-	fatal (_("%P: %pB: can't read contents of section .idata: %E\n"),
++	fatal (_("%F%P: %pB: can't read contents of section .idata: %E\n"),
+ 	       sa->owner);
+ 
+       if (!bfd_get_section_contents (sb->owner, sb, &b_sec, (file_ptr) 0,
+ 				     (bfd_size_type) sizeof (b_sec)))
+-	fatal (_("%P: %pB: can't read contents of section .idata: %E\n"),
++	fatal (_("%F%P: %pB: can't read contents of section .idata: %E\n"),
+ 	       sb->owner);
+ 
+       i = a_sec < b_sec ? -1 : 0;
+@@ -662,7 +662,7 @@ gld${EMULATION_NAME}_place_orphan (asection *s,
+   /* Everything from the '\$' on gets deleted so don't allow '\$' as the
+      first character.  */
+   if (*secname == '\$')
+-    fatal (_("%P: section %s has '\$' as first character\n"), secname);
++    fatal (_("%F%P: section %s has '\$' as first character\n"), secname);
+   if (strchr (secname + 1, '\$') == NULL)
+     return NULL;
+ 
+@@ -692,7 +692,7 @@ gld${EMULATION_NAME}_place_orphan (asection *s,
+       }
+   ps[0] = 0;
+   if (l == NULL)
+-    fatal (_("%P: *(%s\$) missing from linker script\n"), output_secname);
++    fatal (_("%F%P: *(%s\$) missing from linker script\n"), output_secname);
+ 
+   /* Link the input section in and we're done for now.
+      The sections still have to be sorted, but that has to wait until
+diff --git a/ld/emultempl/cr16elf.em b/ld/emultempl/cr16elf.em
+index 5464edf1..cd24728c 100644
+--- a/ld/emultempl/cr16elf.em
++++ b/ld/emultempl/cr16elf.em
+@@ -58,7 +58,7 @@ cr16_elf_after_open (void)
+ 	     COFF and ELF.  */
+ 	  if (bfd_get_flavour (abfd) != bfd_target_coff_flavour
+ 	      && bfd_get_flavour (abfd) != bfd_target_elf_flavour)
+-	    fatal (_("%P: %pB: all input objects must be COFF or ELF "
++	    fatal (_("%F%P: %pB: all input objects must be COFF or ELF "
+ 		     "for --embedded-relocs\n"));
+ 
+ 	  datasec = bfd_get_section_by_name (abfd, ".data.rel");
+@@ -82,7 +82,7 @@ cr16_elf_after_open (void)
+ 						      | SEC_IN_MEMORY))
+ 		  || !bfd_set_section_alignment (relsec, 2)
+ 		  || !bfd_set_section_size (relsec, datasec->reloc_count * 8))
+-		fatal (_("%P: %pB: can not create .emreloc section: %E\n"));
++		fatal (_("%F%P: %pB: can not create .emreloc section: %E\n"));
+ 	    }
+ 
+ 	  /* Double check that all other data sections are empty, as is
+diff --git a/ld/emultempl/cskyelf.em b/ld/emultempl/cskyelf.em
+index 9c91d7ac..b4896c45 100644
+--- a/ld/emultempl/cskyelf.em
++++ b/ld/emultempl/cskyelf.em
+@@ -151,7 +151,7 @@ csky_elf_create_output_section_statements (void)
+ 	  bfd_get_arch (link_info.output_bfd),
+ 	  bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create BFD: %E\n"));
++      fatal (_("%F%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -324,7 +324,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 
+       group_size = bfd_scan_vma (optarg, &end, 0);
+       if (*end)
+-	fatal (_("%P: invalid number `%s'\''\n"), optarg);
++	fatal (_("%F%P: invalid number `%s'\''\n"), optarg);
+     }
+     break;
+ '
+diff --git a/ld/emultempl/elf.em b/ld/emultempl/elf.em
+index 5cc38194..fbbff87f 100644
+--- a/ld/emultempl/elf.em
++++ b/ld/emultempl/elf.em
+@@ -667,12 +667,12 @@ gld${EMULATION_NAME}_handle_option (int optc)
+ 	{
+ #ifndef HAVE_ZSTD
+ 	  if (config.compress_debug == COMPRESS_DEBUG_ZSTD)
+-           fatal (_("%P: --compress-debug-sections=zstd: ld is not built "
++           fatal (_("%F%P: --compress-debug-sections=zstd: ld is not built "
+                     "with zstd support\n"));
+ #endif
+ 	}
+       if (config.compress_debug == COMPRESS_UNKNOWN)
+-       fatal (_("%P: invalid --compress-debug-sections option: \`%s'\n"),
++       fatal (_("%F%P: invalid --compress-debug-sections option: \`%s'\n"),
+                optarg);
+       break;
+ EOF
+@@ -727,7 +727,7 @@ fragment <<EOF
+ 	  link_info.emit_gnu_hash = true;
+ 	}
+       else
+-	fatal (_("%P: invalid hash style \`%s'\n"), optarg);
++	fatal (_("%F%P: invalid hash style \`%s'\n"), optarg);
+       break;
+ 
+ EOF
+@@ -747,7 +747,7 @@ fragment <<EOF
+ 	  link_info.maxpagesize = strtoul (optarg + 14, &end, 0);
+ 	  if (*end
+ 	      || (link_info.maxpagesize & (link_info.maxpagesize - 1)) != 0)
+-	    fatal (_("%P: invalid maximum page size \`%s'\n"),
++	    fatal (_("%F%P: invalid maximum page size \`%s'\n"),
+ 		   optarg + 14);
+ 	  link_info.maxpagesize_is_set = true;
+ 	}
+@@ -757,7 +757,7 @@ fragment <<EOF
+ 	  link_info.commonpagesize = strtoul (optarg + 17, &end, 0);
+ 	  if (*end
+ 	      || (link_info.commonpagesize & (link_info.commonpagesize - 1)) != 0)
+-	    fatal (_("%P: invalid common page size \`%s'\n"),
++	    fatal (_("%F%P: invalid common page size \`%s'\n"),
+ 		   optarg + 17);
+ 	  link_info.commonpagesize_is_set = true;
+ 	}
+@@ -766,7 +766,7 @@ fragment <<EOF
+ 	  char *end;
+ 	  link_info.stacksize = strtoul (optarg + 11, &end, 0);
+ 	  if (*end || link_info.stacksize < 0)
+-	    fatal (_("%P: invalid stack size \`%s'\n"), optarg + 11);
++	    fatal (_("%F%P: invalid stack size \`%s'\n"), optarg + 11);
+ 	  if (!link_info.stacksize)
+ 	    /* Use -1 for explicit no-stack, because zero means
+ 	       'default'.   */
+@@ -805,7 +805,7 @@ fragment <<EOF
+ 	  else if (strcmp (optarg, "start-stop-visibility=protected") == 0)
+ 	    link_info.start_stop_visibility = STV_PROTECTED;
+ 	  else
+-	    fatal (_("%P: invalid visibility in \`-z %s'; "
++	    fatal (_("%F%P: invalid visibility in \`-z %s'; "
+ 		     "must be default, internal, hidden, or protected"),
+ 		   optarg);
+ 	}
+diff --git a/ld/emultempl/hppaelf.em b/ld/emultempl/hppaelf.em
+index f0284ea3..e8e98a49 100644
+--- a/ld/emultempl/hppaelf.em
++++ b/ld/emultempl/hppaelf.em
+@@ -82,7 +82,7 @@ hppaelf_create_output_section_statements (void)
+ 			      bfd_get_arch (link_info.output_bfd),
+ 			      bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create BFD: %E\n"));
++      fatal (_("%F%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -351,7 +351,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	const char *end;
+ 	group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%F%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ '
+diff --git a/ld/emultempl/kvxelf.em b/ld/emultempl/kvxelf.em
+index 1ffbd1db..81713678 100644
+--- a/ld/emultempl/kvxelf.em
++++ b/ld/emultempl/kvxelf.em
+@@ -36,7 +36,7 @@ EOF
+ if test x"${EMULATION_NAME}" != x"elf64kvx_linux"; then
+ fragment <<EOF
+   if (bfd_link_pie (&link_info))
+-    fatal (_(":%P: -pie not supported\n"));
++    fatal (_("%F:%P: -pie not supported\n"));
+ EOF
+ fi
+ fragment <<EOF
+@@ -299,7 +299,7 @@ kvx_elf_create_output_section_statements (void)
+   ldlang_add_file (stub_file);
+ 
+   if (!kvx_elf${ELFSIZE}_init_stub_bfd (&link_info, stub_file->the_bfd))
+-    einfo ("%P: can not init BFD: %E\n");
++    fatal ("%F%P: can not init BFD: %E\n");
+ }
+ 
+ 
+diff --git a/ld/emultempl/loongarchelf.em b/ld/emultempl/loongarchelf.em
+index 5a3d7b79..153094b0 100644
+--- a/ld/emultempl/loongarchelf.em
++++ b/ld/emultempl/loongarchelf.em
+@@ -71,7 +71,7 @@ gld${EMULATION_NAME}_after_allocation (void)
+       if (!_bfd_elf_map_sections_to_segments (link_info.output_bfd,
+ 					      &link_info,
+ 					      NULL))
+-	fatal (_("%P: map sections to segments failed: %E\n"));
++        fatal (_("%F%P: map sections to segments failed: %E\n"));
+     }
+ 
+   /* Adjust program header size and .eh_frame_hdr size before
+diff --git a/ld/emultempl/m68hc1xelf.em b/ld/emultempl/m68hc1xelf.em
+index 36f5f068..fe6dd85b 100644
+--- a/ld/emultempl/m68hc1xelf.em
++++ b/ld/emultempl/m68hc1xelf.em
+@@ -159,7 +159,7 @@ m68hc11elf_create_output_section_statements (void)
+ 			     bfd_get_arch (link_info.output_bfd),
+ 			     bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create BFD: %E\n"));
++      fatal (_("%F%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+diff --git a/ld/emultempl/m68kelf.em b/ld/emultempl/m68kelf.em
+index f9a5bec2..e6eed5cc 100644
+--- a/ld/emultempl/m68kelf.em
++++ b/ld/emultempl/m68kelf.em
+@@ -82,7 +82,7 @@ m68k_elf_after_open (void)
+ 	  asection *datasec;
+ 
+ 	  if (bfd_get_flavour (abfd) != bfd_target_elf_flavour)
+-	    fatal (_("%P: %pB: all input objects must be ELF "
++	    fatal (_("%F%P: %pB: all input objects must be ELF "
+ 		     "for --embedded-relocs\n"));
+ 
+ 	  datasec = bfd_get_section_by_name (abfd, ".data");
+@@ -106,7 +106,7 @@ m68k_elf_after_open (void)
+ 	      if (relsec == NULL
+ 		  || !bfd_set_section_alignment (relsec, 2)
+ 		  || !bfd_set_section_size (relsec, datasec->reloc_count * 12))
+-		fatal (_("%P: %pB: can not create .emreloc section: %E\n"));
++		fatal (_("%F%P: %pB: can not create .emreloc section: %E\n"));
+ 	    }
+ 
+ 	  /* Double check that all other data sections are empty, as is
+diff --git a/ld/emultempl/metagelf.em b/ld/emultempl/metagelf.em
+index 313d7ed5..95655ad0 100644
+--- a/ld/emultempl/metagelf.em
++++ b/ld/emultempl/metagelf.em
+@@ -59,7 +59,7 @@ metagelf_create_output_section_statements (void)
+ 			      bfd_get_arch (link_info.output_bfd),
+ 			      bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create BFD: %E\n"));
++      fatal (_("%F%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -309,7 +309,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	const char *end;
+ 	group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%F%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ '
+diff --git a/ld/emultempl/mipself.em b/ld/emultempl/mipself.em
+index 2a22ba49..a4f158b7 100644
+--- a/ld/emultempl/mipself.em
++++ b/ld/emultempl/mipself.em
+@@ -152,7 +152,7 @@ mips_add_stub_section (const char *stub_sec_name, asection *input_section,
+ 				 bfd_get_arch (link_info.output_bfd),
+ 				 bfd_get_mach (link_info.output_bfd)))
+ 	{
+-	  fatal (_("%P: can not create BFD: %E\n"));
++	  fatal (_("%F%P: can not create BFD: %E\n"));
+ 	  return NULL;
+ 	}
+       stub_bfd->flags |= BFD_LINKER_CREATED;
+diff --git a/ld/emultempl/mmix-elfnmmo.em b/ld/emultempl/mmix-elfnmmo.em
+index 03186363..c4288d82 100644
+--- a/ld/emultempl/mmix-elfnmmo.em
++++ b/ld/emultempl/mmix-elfnmmo.em
+@@ -113,7 +113,7 @@ mmix_after_allocation (void)
+     bfd_set_section_vma (sec, 0);
+ 
+   if (!_bfd_mmix_after_linker_allocation (link_info.output_bfd, &link_info))
+-    fatal (_("%P: can't finalize linker-allocated global registers\n"));
++    fatal (_("%F%P: can't finalize linker-allocated global registers\n"));
+ }
+ EOF
+ 
+diff --git a/ld/emultempl/nds32elf.em b/ld/emultempl/nds32elf.em
+index 36260573..8598d0a8 100644
+--- a/ld/emultempl/nds32elf.em
++++ b/ld/emultempl/nds32elf.em
+@@ -44,7 +44,7 @@ nds32_elf_create_output_section_statements (void)
+   if (strstr (bfd_get_target (link_info.output_bfd), "nds32") == NULL)
+     {
+       /* Check the output target is nds32.  */
+-      fatal (_("%P: error: cannot change output format whilst "
++      fatal (_("%F%P: error: cannot change output format whilst "
+ 	       "linking %s binaries\n"), "NDS32");
+       return;
+     }
+@@ -96,7 +96,7 @@ nds32_elf_after_open (void)
+ 	       && abi_ver != (elf_elfheader (abfd)->e_flags & EF_NDS_ABI))
+ 	{
+ 	  /* Incompatible objects.  */
+-	  fatal (_("%P: %pB: ABI version of object files mismatched\n"),
++	  fatal (_("%F%P: %pB: ABI version of object files mismatched\n"),
+ 		 abfd);
+ 	}
+     }
+@@ -195,7 +195,7 @@ PARSE_AND_LIST_ARGS_CASES='
+       {
+ 	sym_ld_script = fopen (optarg, FOPEN_WT);
+ 	if(sym_ld_script == NULL)
+-	  fatal (_("%P: cannot open map file %s: %E\n"), optarg);
++	  fatal (_("%F%P: cannot open map file %s: %E\n"), optarg);
+       }
+     break;
+   case OPTION_HYPER_RELAX:
+diff --git a/ld/emultempl/nto.em b/ld/emultempl/nto.em
+index 609d0217..bed2d374 100644
+--- a/ld/emultempl/nto.em
++++ b/ld/emultempl/nto.em
+@@ -51,7 +51,7 @@ nto_create_QNX_note_section(int type)
+      is called before this function, stub_file should already be defined.  */
+   if (!stub_file)
+     {
+-      fatal (_("%P: cannot create .note section in stub BFD.\n"));
++      fatal (_("%F%P: cannot create .note section in stub BFD.\n"));
+       return NULL;
+     }
+ 
+@@ -60,7 +60,7 @@ nto_create_QNX_note_section(int type)
+   note_sec = bfd_make_section_anyway_with_flags (stub_file->the_bfd, ".note", flags);
+   if (! note_sec)
+     {
+-      fatal (_("%P: failed to create .note section\n"));
++      fatal (_("%F%P: failed to create .note section\n"));
+       return NULL;
+     }
+ 
+@@ -101,7 +101,7 @@ nto_lookup_QNX_note_section(int type)
+       sec->contents = xmalloc(sec->size);
+       if (!bfd_get_section_contents (sec->owner, sec, sec->contents, (file_ptr) 0,
+ 				     sec->size))
+-	fatal (_("%P: %pB: can't read contents of section .note: %E\n"),
++	fatal (_("%F%P: %pB: can't read contents of section .note: %E\n"),
+ 	       sec->owner);
+ 
+       e_note = (Elf_External_Note *) sec->contents;
+@@ -144,7 +144,7 @@ nto_add_note_section (void) {
+ 
+   if (nto_lazy_stack && !link_info.stacksize)
+     {
+-      fatal (_("%P: error: --lazy-stack must follow -zstack-size=<size>\n"));
++      fatal (_("%F%P: error: --lazy-stack must follow -zstack-size=<size>\n"));
+       return;
+     }
+ 
+@@ -216,7 +216,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	char *end;
+ 	link_info.stacksize = strtoul (optarg, &end, 0);
+ 	if (*end || link_info.stacksize < 0)
+-	  fatal (_("%P: invalid stack size `%s'\''\n"), optarg + 11);
++	  fatal (_("%F%P: invalid stack size `%s'\''\n"), optarg + 11);
+ 	if (!link_info.stacksize)
+ 	  /* Use -1 for explicit no-stack, because zero means
+ 	     'default'.   */
+diff --git a/ld/emultempl/pe.em b/ld/emultempl/pe.em
+index 4cb1488e..3eeaffec 100644
+--- a/ld/emultempl/pe.em
++++ b/ld/emultempl/pe.em
+@@ -726,7 +726,7 @@ set_pe_subsystem (void)
+ 
+       if (v[i].name == NULL)
+ 	{
+-	  fatal (_("%P: invalid subsystem type %s\n"), optarg);
++	  fatal (_("%F%P: invalid subsystem type %s\n"), optarg);
+ 	  return;
+ 	}
+ 
+@@ -747,7 +747,7 @@ set_pe_value (char *name)
+   set_pe_name (name,  strtoul (optarg, &end, 0));
+ 
+   if (end == optarg)
+-    fatal (_("%P: invalid hex number for PE parameter '%s'\n"), optarg);
++    fatal (_("%F%P: invalid hex number for PE parameter '%s'\n"), optarg);
+ 
+   optarg = end;
+ }
+@@ -764,7 +764,7 @@ set_pe_stack_heap (char *resname, char *comname)
+       set_pe_value (comname);
+     }
+   else if (*optarg)
+-    fatal (_("%P: strange hex info for PE parameter '%s'\n"), optarg);
++    fatal (_("%F%P: strange hex info for PE parameter '%s'\n"), optarg);
+ }
+ 
+ #define DEFAULT_BUILD_ID_STYLE	"md5"
+@@ -780,7 +780,7 @@ gld${EMULATION_NAME}_handle_option (int optc)
+     case OPTION_BASE_FILE:
+       link_info.base_file = fopen (optarg, FOPEN_WB);
+       if (link_info.base_file == NULL)
+-	fatal (_("%P: cannot open base file %s\n"), optarg);
++	fatal (_("%F%P: cannot open base file %s\n"), optarg);
+       break;
+ 
+       /* PE options.  */
+@@ -1309,7 +1309,7 @@ make_runtime_ref (void)
+     = bfd_wrapped_link_hash_lookup (link_info.output_bfd, &link_info,
+ 				    rr, true, false, true);
+   if (!h)
+-    fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
++    fatal (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
+   else
+     {
+       if (h->type == bfd_link_hash_new)
+@@ -1607,7 +1607,7 @@ gld${EMULATION_NAME}_after_open (void)
+   if (bfd_get_flavour (link_info.output_bfd) != bfd_target_coff_flavour
+       || coff_data (link_info.output_bfd) == NULL
+       || !obj_pe (link_info.output_bfd))
+-    fatal (_("%P: cannot perform PE operations on non PE output file '%pB'\n"),
++    fatal (_("%F%P: cannot perform PE operations on non PE output file '%pB'\n"),
+ 	   link_info.output_bfd);
+ 
+   pe_data (link_info.output_bfd)->pe_opthdr = pe;
+@@ -1680,7 +1680,7 @@ gld${EMULATION_NAME}_after_open (void)
+ 	 These will only be created if the output format is an arm format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      fatal (_("%P: error: cannot change output format "
++      fatal (_("%F%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "ARM");
+       return;
+     }
+@@ -1740,7 +1740,7 @@ gld${EMULATION_NAME}_after_open (void)
+ 
+ 		    if (!bfd_generic_link_read_symbols (is->the_bfd))
+ 		      {
+-			fatal (_("%P: %pB: could not read symbols: %E\n"),
++			fatal (_("%F%P: %pB: could not read symbols: %E\n"),
+ 			       is->the_bfd);
+ 			return;
+ 		      }
+@@ -1912,7 +1912,7 @@ gld${EMULATION_NAME}_after_open (void)
+ 
+ 		if (!bfd_generic_link_read_symbols (is->the_bfd))
+ 		  {
+-		    fatal (_("%P: %pB: could not read symbols: %E\n"),
++		    fatal (_("%F%P: %pB: could not read symbols: %E\n"),
+ 			   is->the_bfd);
+ 		    return;
+ 		  }
+@@ -2023,7 +2023,7 @@ gld${EMULATION_NAME}_unrecognized_file (lang_input_statement_type *entry ATTRIBU
+ 
+ 	      h = bfd_link_hash_lookup (link_info.hash, buf, true, true, true);
+ 	      if (h == (struct bfd_link_hash_entry *) NULL)
+-		fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
++		fatal (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
+ 	      if (h->type == bfd_link_hash_new)
+ 		{
+ 		  h->type = bfd_link_hash_undefined;
+diff --git a/ld/emultempl/pep.em b/ld/emultempl/pep.em
+index 2d033dd3..ac0e192f 100644
+--- a/ld/emultempl/pep.em
++++ b/ld/emultempl/pep.em
+@@ -698,7 +698,7 @@ set_pep_subsystem (void)
+ 
+       if (v[i].name == NULL)
+ 	{
+-	  fatal (_("%P: invalid subsystem type %s\n"), optarg);
++	  fatal (_("%F%P: invalid subsystem type %s\n"), optarg);
+ 	  return;
+ 	}
+ 
+@@ -719,7 +719,7 @@ set_pep_value (char *name)
+   set_pep_name (name,  (bfd_vma) strtoull (optarg, &end, 0));
+ 
+   if (end == optarg)
+-    fatal (_("%P: invalid hex number for PE parameter '%s'\n"), optarg);
++    fatal (_("%F%P: invalid hex number for PE parameter '%s'\n"), optarg);
+ 
+   optarg = end;
+ }
+@@ -736,7 +736,7 @@ set_pep_stack_heap (char *resname, char *comname)
+       set_pep_value (comname);
+     }
+   else if (*optarg)
+-    fatal (_("%P: strange hex info for PE parameter '%s'\n"), optarg);
++    fatal (_("%F%P: strange hex info for PE parameter '%s'\n"), optarg);
+ }
+ 
+ #define DEFAULT_BUILD_ID_STYLE	"md5"
+@@ -753,7 +753,7 @@ gld${EMULATION_NAME}_handle_option (int optc)
+     case OPTION_BASE_FILE:
+       link_info.base_file = fopen (optarg, FOPEN_WB);
+       if (link_info.base_file == NULL)
+-	fatal (_("%P: cannot open base file %s\n"), optarg);
++	fatal (_("%F%P: cannot open base file %s\n"), optarg);
+       break;
+ 
+       /* PE options.  */
+@@ -1306,7 +1306,7 @@ make_runtime_ref (void)
+     = bfd_wrapped_link_hash_lookup (link_info.output_bfd, &link_info,
+ 				    rr, true, false, true);
+   if (!h)
+-    fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
++    fatal (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
+   else
+     {
+       if (h->type == bfd_link_hash_new)
+@@ -1606,7 +1606,7 @@ gld${EMULATION_NAME}_after_open (void)
+   if (bfd_get_flavour (link_info.output_bfd) != bfd_target_coff_flavour
+       || coff_data (link_info.output_bfd) == NULL
+       || !obj_pe (link_info.output_bfd))
+-    fatal (_("%P: cannot perform PE operations on non PE output file '%pB'\n"),
++    fatal (_("%F%P: cannot perform PE operations on non PE output file '%pB'\n"),
+ 	   link_info.output_bfd);
+ 
+   pe_data (link_info.output_bfd)->pe_opthdr = pep;
+@@ -1718,7 +1718,7 @@ gld${EMULATION_NAME}_after_open (void)
+ 
+ 		    if (!bfd_generic_link_read_symbols (is->the_bfd))
+ 		      {
+-			fatal (_("%P: %pB: could not read symbols: %E\n"),
++			fatal (_("%F%P: %pB: could not read symbols: %E\n"),
+ 			       is->the_bfd);
+ 			return;
+ 		      }
+@@ -1907,7 +1907,7 @@ gld${EMULATION_NAME}_unrecognized_file (lang_input_statement_type *entry ATTRIBU
+ 
+ 	      h = bfd_link_hash_lookup (link_info.hash, buf, true, true, true);
+ 	      if (h == (struct bfd_link_hash_entry *) NULL)
+-		fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
++		fatal (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
+ 	      if (h->type == bfd_link_hash_new)
+ 		{
+ 		  h->type = bfd_link_hash_undefined;
+diff --git a/ld/emultempl/ppc32elf.em b/ld/emultempl/ppc32elf.em
+index ffacadc6..73bad022 100644
+--- a/ld/emultempl/ppc32elf.em
++++ b/ld/emultempl/ppc32elf.em
+@@ -386,7 +386,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	  char *end;
+ 	  unsigned long val = strtoul (optarg, &end, 0);
+ 	  if (*end || val > 5)
+-	    fatal (_("%P: invalid --plt-align `%s'\''\n"), optarg);
++	    fatal (_("%F%P: invalid --plt-align `%s'\''\n"), optarg);
+ 	  params.plt_stub_align = val;
+ 	}
+       else
+@@ -419,7 +419,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	  if (*end
+ 	      || (params.pagesize < 4096 && params.pagesize != 0)
+ 	      || params.pagesize != (params.pagesize & -params.pagesize))
+-	    fatal (_("%P: invalid pagesize `%s'\''\n"), optarg);
++	    fatal (_("%F%P: invalid pagesize `%s'\''\n"), optarg);
+ 	}
+       break;
+ 
+diff --git a/ld/emultempl/ppc64elf.em b/ld/emultempl/ppc64elf.em
+index 92bf4f58..a884f6b5 100644
+--- a/ld/emultempl/ppc64elf.em
++++ b/ld/emultempl/ppc64elf.em
+@@ -91,7 +91,7 @@ ppc_create_output_section_statements (void)
+ 			     bfd_get_arch (link_info.output_bfd),
+ 			     bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create BFD: %E\n"));
++      fatal (_("%F%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -101,7 +101,7 @@ ppc_create_output_section_statements (void)
+   if (params.save_restore_funcs < 0)
+     params.save_restore_funcs = !bfd_link_relocatable (&link_info);
+   if (!ppc64_elf_init_stub_bfd (&link_info, &params))
+-    fatal (_("%P: can not init BFD: %E\n"));
++    fatal (_("%F%P: can not init BFD: %E\n"));
+ }
+ 
+ /* Called after opening files but before mapping sections.  */
+@@ -860,7 +860,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	const char *end;
+ 	params.group_size = bfd_scan_vma (optarg, &end, 0);
+ 	if (*end)
+-	  fatal (_("%P: invalid number `%s'\''\n"), optarg);
++	  fatal (_("%F%P: invalid number `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -886,7 +886,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	  char *end;
+ 	  long val = strtol (optarg, &end, 0);
+ 	  if (*end || (unsigned long) val + 8 > 16)
+-	    fatal (_("%P: invalid --plt-align `%s'\''\n"), optarg);
++	    fatal (_("%F%P: invalid --plt-align `%s'\''\n"), optarg);
+ 	  params.plt_stub_align = val;
+ 	}
+       else
+@@ -915,7 +915,7 @@ PARSE_AND_LIST_ARGS_CASES=${PARSE_AND_LIST_ARGS_CASES}'
+ 	  else if (strcasecmp (optarg, "no") == 0)
+ 	    params.power10_stubs = 0;
+ 	  else
+-	    fatal (_("%P: invalid --power10-stubs argument `%s'\''\n"),
++	    fatal (_("%F%P: invalid --power10-stubs argument `%s'\''\n"),
+ 		   optarg);
+ 	}
+       else
+diff --git a/ld/emultempl/riscvelf.em b/ld/emultempl/riscvelf.em
+index 006e4edb..d5012b33 100644
+--- a/ld/emultempl/riscvelf.em
++++ b/ld/emultempl/riscvelf.em
+@@ -141,7 +141,7 @@ riscv_create_output_section_statements (void)
+ 	 These will only be created if the output format is a RISC-V format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      fatal (_("%P: error: cannot change output format"
++      fatal (_("%F%P: error: cannot change output format"
+ 	       " whilst linking %s binaries\n"), "RISC-V");
+       return;
+     }
+diff --git a/ld/emultempl/s390.em b/ld/emultempl/s390.em
+index 0a93d76b..bb589069 100644
+--- a/ld/emultempl/s390.em
++++ b/ld/emultempl/s390.em
+@@ -34,7 +34,7 @@ static void
+ s390_elf_create_output_section_statements (void)
+ {
+   if (!bfd_elf_s390_set_options (&link_info, &params))
+-    fatal (_("%P: can not init BFD: %E\n"));
++    fatal (_("%F%P: can not init BFD: %E\n"));
+ }
+ 
+ EOF
+diff --git a/ld/emultempl/scoreelf.em b/ld/emultempl/scoreelf.em
+index 6413f330..e420a7bd 100644
+--- a/ld/emultempl/scoreelf.em
++++ b/ld/emultempl/scoreelf.em
+@@ -62,7 +62,7 @@ score_elf_after_open (void)
+ 	 These will only be created if the output format is an score format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      fatal (_("%P: error: cannot change output format "
++      fatal (_("%F%P: error: cannot change output format "
+ 	       "whilst linking %s binaries\n"), "S+core");
+       return;
+     }
+diff --git a/ld/emultempl/spuelf.em b/ld/emultempl/spuelf.em
+index c694b828..800cca30 100644
+--- a/ld/emultempl/spuelf.em
++++ b/ld/emultempl/spuelf.em
+@@ -202,7 +202,7 @@ spu_elf_load_ovl_mgr (void)
+       /* User supplied __ovly_load.  */
+     }
+   else if (mgr_stream->start == mgr_stream->end)
+-    fatal (_("%P: no built-in overlay manager\n"));
++    fatal (_("%F%P: no built-in overlay manager\n"));
+   else
+     {
+       lang_input_statement_type *ovl_is;
+@@ -379,7 +379,7 @@ spu_elf_open_overlay_script (void)
+   if (script == NULL)
+     {
+     file_err:
+-      fatal (_("%P: can not open script: %E\n"));
++      fatal (_("%F%P: can not open script: %E\n"));
+     }
+   return script;
+ }
+@@ -719,7 +719,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	    if (*end == 0)
+ 	      break;
+ 	  }
+-	fatal (_("%P: invalid --local-store address range `%s'\''\n"), optarg);
++	fatal (_("%F%P: invalid --local-store address range `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -755,12 +755,12 @@ PARSE_AND_LIST_ARGS_CASES='
+       if (!num_lines_set)
+ 	params.num_lines = 32;
+       else if ((params.num_lines & -params.num_lines) != params.num_lines)
+-	fatal (_("%P: invalid --num-lines/--num-regions `%u'\''\n"),
++	fatal (_("%F%P: invalid --num-lines/--num-regions `%u'\''\n"),
+ 	       params.num_lines);
+       if (!line_size_set)
+ 	params.line_size = 1024;
+       else if ((params.line_size & -params.line_size) != params.line_size)
+-	fatal (_("%P: invalid --line-size/--region-size `%u'\''\n"),
++	fatal (_("%F%P: invalid --line-size/--region-size `%u'\''\n"),
+ 	       params.line_size);
+       break;
+ 
+@@ -781,7 +781,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	    && (params.ovly_flavour != ovly_soft_icache
+ 		|| (params.num_lines & -params.num_lines) == params.num_lines))
+ 	  break;
+-	fatal (_("%P: invalid --num-lines/--num-regions `%s'\''\n"), optarg);
++	fatal (_("%F%P: invalid --num-lines/--num-regions `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -794,7 +794,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	    && (params.ovly_flavour != ovly_soft_icache
+ 		|| (params.line_size & -params.line_size) == params.line_size))
+ 	  break;
+-	fatal (_("%P: invalid --line-size/--region-size `%s'\''\n"), optarg);
++	fatal (_("%F%P: invalid --line-size/--region-size `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -803,7 +803,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	char *end;
+ 	params.auto_overlay_fixed = strtoul (optarg, &end, 0);
+ 	if (*end != 0)
+-	  fatal (_("%P: invalid --fixed-space value `%s'\''\n"), optarg);
++	  fatal (_("%F%P: invalid --fixed-space value `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -812,7 +812,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	char *end;
+ 	params.auto_overlay_reserved = strtoul (optarg, &end, 0);
+ 	if (*end != 0)
+-	  fatal (_("%P: invalid --reserved-space value `%s'\''\n"), optarg);
++	  fatal (_("%F%P: invalid --reserved-space value `%s'\''\n"), optarg);
+       }
+       break;
+ 
+@@ -821,7 +821,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	char *end;
+ 	params.extra_stack_space = strtol (optarg, &end, 0);
+ 	if (*end != 0)
+-	  fatal (_("%P: invalid --extra-stack-space value `%s'\''\n"), optarg);
++	  fatal (_("%F%P: invalid --extra-stack-space value `%s'\''\n"), optarg);
+       }
+       break;
+ 
+diff --git a/ld/emultempl/tic6xdsbt.em b/ld/emultempl/tic6xdsbt.em
+index a830be7e..7d3b97cc 100644
+--- a/ld/emultempl/tic6xdsbt.em
++++ b/ld/emultempl/tic6xdsbt.em
+@@ -59,7 +59,7 @@ tic6x_after_open (void)
+   if (is_tic6x_target ())
+     {
+       if (params.dsbt_index >= params.dsbt_size)
+-	fatal (_("%P: invalid --dsbt-index %d, outside DSBT size\n"),
++	fatal (_("%F%P: invalid --dsbt-index %d, outside DSBT size\n"),
+ 	       params.dsbt_index);
+       elf32_tic6x_setup (&link_info, &params);
+     }
+@@ -190,7 +190,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	if (*end == 0
+ 	    && params.dsbt_index >= 0 && params.dsbt_index < 0x7fff)
+ 	  break;
+-	fatal (_("%P: invalid --dsbt-index %s\n"), optarg);
++	fatal (_("%F%P: invalid --dsbt-index %s\n"), optarg);
+       }
+       break;
+     case OPTION_DSBT_SIZE:
+@@ -200,7 +200,7 @@ PARSE_AND_LIST_ARGS_CASES='
+ 	if (*end == 0
+ 	    && params.dsbt_size >= 0 && params.dsbt_size < 0x7fff)
+ 	  break;
+-	fatal (_("%P: invalid --dsbt-size %s\n"), optarg);
++	fatal (_("%F%P: invalid --dsbt-size %s\n"), optarg);
+       }
+       break;
+    case OPTION_NO_MERGE_EXIDX_ENTRIES:
+diff --git a/ld/emultempl/ticoff.em b/ld/emultempl/ticoff.em
+index bbf30f4a..5d0feede 100644
+--- a/ld/emultempl/ticoff.em
++++ b/ld/emultempl/ticoff.em
+@@ -88,7 +88,7 @@ gld${EMULATION_NAME}_handle_option (int optc)
+ 	  lang_add_output_format (buf, NULL, NULL, 0);
+ 	}
+       else
+-	fatal (_("%P: invalid COFF format version %s\n"), optarg);
++	fatal (_("%F%P: invalid COFF format version %s\n"), optarg);
+       break;
+     }
+   return false;
+diff --git a/ld/emultempl/v850elf.em b/ld/emultempl/v850elf.em
+index 49ad2cc8..925e3994 100644
+--- a/ld/emultempl/v850elf.em
++++ b/ld/emultempl/v850elf.em
+@@ -63,7 +63,7 @@ v850_create_output_section_statements (void)
+ 	 These will only be created if the output format is an arm format,
+ 	 hence we do not support linking and changing output formats at the
+ 	 same time.  Use a link followed by objcopy to change output formats.  */
+-      fatal (_("%P: error: cannot change output format"
++      fatal (_("%F%P: error: cannot change output format"
+ 	       " whilst linking %s binaries\n"), "V850");
+       return;
+     }
+diff --git a/ld/emultempl/vms.em b/ld/emultempl/vms.em
+index 4ca2c942..1c7b426c 100644
+--- a/ld/emultempl/vms.em
++++ b/ld/emultempl/vms.em
+@@ -201,7 +201,7 @@ gld${EMULATION_NAME}_before_allocation (void)
+       && bed->elf_backend_size_dynamic_sections
+       && ! (*bed->elf_backend_size_dynamic_sections) (link_info.output_bfd,
+ 						      &link_info))
+-    fatal (_("%P: failed to set dynamic section sizes: %E\n"));
++    fatal (_("%F%P: failed to set dynamic section sizes: %E\n"));
+ 
+   before_allocation_default ();
+ }
+diff --git a/ld/emultempl/xtensaelf.em b/ld/emultempl/xtensaelf.em
+index 208f730d..751e7762 100644
+--- a/ld/emultempl/xtensaelf.em
++++ b/ld/emultempl/xtensaelf.em
+@@ -388,7 +388,7 @@ check_xtensa_info (bfd *abfd, asection *info_sec)
+ 
+   data = xmalloc (info_sec->size);
+   if (! bfd_get_section_contents (abfd, info_sec, data, 0, info_sec->size))
+-    fatal (_("%P: %pB: cannot read contents of section %pA\n"), abfd, info_sec);
++    fatal (_("%F%P: %pB: cannot read contents of section %pA\n"), abfd, info_sec);
+ 
+   if (info_sec->size > 24
+       && info_sec->size >= 24 + bfd_get_32 (abfd, data + 4)
+@@ -429,13 +429,13 @@ elf_xtensa_before_allocation (void)
+   if (is_big_endian
+       && link_info.output_bfd->xvec->byteorder == BFD_ENDIAN_LITTLE)
+     {
+-      fatal (_("%P: little endian output does not match "
++      fatal (_("%F%P: little endian output does not match "
+ 	       "Xtensa configuration\n"));
+     }
+   if (!is_big_endian
+       && link_info.output_bfd->xvec->byteorder == BFD_ENDIAN_BIG)
+     {
+-      fatal (_("%P: big endian output does not match "
++      fatal (_("%F%P: big endian output does not match "
+ 	       "Xtensa configuration\n"));
+     }
+ 
+@@ -454,7 +454,7 @@ elf_xtensa_before_allocation (void)
+ 	 cannot go any further if there are any mismatches.  */
+       if ((is_big_endian && f->the_bfd->xvec->byteorder == BFD_ENDIAN_LITTLE)
+ 	  || (!is_big_endian && f->the_bfd->xvec->byteorder == BFD_ENDIAN_BIG))
+-	fatal (_("%P: cross-endian linking for %pB not supported\n"),
++	fatal (_("%F%P: cross-endian linking for %pB not supported\n"),
+ 	       f->the_bfd);
+ 
+       if (! first_bfd)
+@@ -485,7 +485,7 @@ elf_xtensa_before_allocation (void)
+       info_sec = bfd_make_section_with_flags (first_bfd, ".xtensa.info",
+ 					      SEC_HAS_CONTENTS | SEC_READONLY);
+       if (! info_sec)
+-	fatal (_("%P: failed to create .xtensa.info section\n"));
++	fatal (_("%F%P: failed to create .xtensa.info section\n"));
+     }
+   if (info_sec)
+     {
+@@ -1224,7 +1224,7 @@ ld_build_required_section_dependence (lang_statement_union_type *s)
+       lang_statement_union_type *l = iter_stack_current (&stack);
+ 
+       if (l == NULL && link_info.non_contiguous_regions)
+-	fatal (_("%P: Relaxation not supported with "
++	fatal (_("%F%P: Relaxation not supported with "
+ 		 "--enable-non-contiguous-regions.\n"));
+ 
+       if (l->header.type == lang_input_section_enum)
+diff --git a/ld/emultempl/z80.em b/ld/emultempl/z80.em
+index 555f6024..06cfa72e 100644
+--- a/ld/emultempl/z80.em
++++ b/ld/emultempl/z80.em
+@@ -48,7 +48,7 @@ z80_after_open (void)
+       const bfd_arch_info_type *info;
+       info = bfd_arch_get_compatible (link_info.output_bfd, abfd, false);
+       if (info == NULL)
+-	fatal (_("%P: %pB: Instruction sets of object files incompatible\n"),
++	fatal (_("%F%P: %pB: Instruction sets of object files incompatible\n"),
+ 	       abfd);
+       else
+         bfd_set_arch_info (link_info.output_bfd, info);
+diff --git a/ld/ldcref.c b/ld/ldcref.c
+index 572d4f4d..68dd2a5f 100644
+--- a/ld/ldcref.c
++++ b/ld/ldcref.c
+@@ -514,7 +514,7 @@ check_local_sym_xref (lang_input_statement_type *statement)
+     return;
+ 
+   if (!bfd_generic_link_read_symbols (abfd))
+-    fatal (_("%P: %pB: could not read symbols: %E\n"), abfd);
++    fatal (_("%F%P: %pB: could not read symbols: %E\n"), abfd);
+ 
+   for (syms = bfd_get_outsymbols (abfd); *syms; ++syms)
+     {
+@@ -625,7 +625,7 @@ check_refs (const char *name,
+      BFD might contain a prohibited cross reference.  */
+ 
+   if (!bfd_generic_link_read_symbols (abfd))
+-    fatal (_("%P: %pB: could not read symbols: %E\n"), abfd);
++    fatal (_("%F%P: %pB: could not read symbols: %E\n"), abfd);
+ 
+   info.sym_name = name;
+   info.global = global;
+@@ -687,14 +687,14 @@ check_reloc_refs (bfd *abfd, asection *sec, void *iarg)
+ 
+   relsize = bfd_get_reloc_upper_bound (abfd, sec);
+   if (relsize < 0)
+-    fatal (_("%P: %pB: could not read relocs: %E\n"), abfd);
++    fatal (_("%F%P: %pB: could not read relocs: %E\n"), abfd);
+   if (relsize == 0)
+     return;
+ 
+   relpp = (arelent **) xmalloc (relsize);
+   relcount = bfd_canonicalize_reloc (abfd, sec, relpp, info->asymbols);
+   if (relcount < 0)
+-    fatal (_("%P: %pB: could not read relocs: %E\n"), abfd);
++    fatal (_("%F%P: %pB: could not read relocs: %E\n"), abfd);
+ 
+   p = relpp;
+   pend = p + relcount;
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index fb95b7a9..d8c0817b 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -94,7 +94,7 @@ ldelf_after_parse (void)
+       else if (!link_info.maxpagesize_is_set)
+ 	link_info.maxpagesize = link_info.commonpagesize;
+       else
+-	fatal (_("%P: common page size (0x%v) > maximum page size (0x%v)\n"),
++	fatal (_("%F%P: common page size (0x%v) > maximum page size (0x%v)\n"),
+ 	       link_info.commonpagesize, link_info.maxpagesize);
+     }
+ }
+@@ -120,7 +120,7 @@ ldelf_load_symbols (lang_input_statement_type *entry)
+ 
+   if (entry->flags.just_syms
+       && (bfd_get_file_flags (entry->the_bfd) & DYNAMIC) != 0)
+-    fatal (_("%P: %pB: --just-symbols may not be used on DSO\n"),
++    fatal (_("%F%P: %pB: --just-symbols may not be used on DSO\n"),
+ 	   entry->the_bfd);
+ 
+   if (link_class == 0
+@@ -320,7 +320,7 @@ ldelf_try_needed (struct dt_needed *needed, int force, int is_linux)
+       struct bfd_link_needed_list *needs;
+ 
+       if (! bfd_elf_get_bfd_needed_list (abfd, &needs))
+-	fatal (_("%P: %pB: bfd_elf_get_bfd_needed_list failed: %E\n"), abfd);
++	fatal (_("%F%P: %pB: bfd_elf_get_bfd_needed_list failed: %E\n"), abfd);
+ 
+       if (needs != NULL)
+ 	{
+@@ -368,7 +368,7 @@ ldelf_try_needed (struct dt_needed *needed, int force, int is_linux)
+      can only check that using stat.  */
+ 
+   if (bfd_stat (abfd, &global_stat) != 0)
+-    fatal (_("%P: %pB: bfd_stat failed: %E\n"), abfd);
++    fatal (_("%F%P: %pB: bfd_stat failed: %E\n"), abfd);
+ 
+   /* First strip off everything before the last '/'.  */
+   soname = lbasename (bfd_get_filename (abfd));
+@@ -407,7 +407,7 @@ ldelf_try_needed (struct dt_needed *needed, int force, int is_linux)
+ 
+   /* Add this file into the symbol table.  */
+   if (! bfd_link_add_symbols (abfd, &link_info))
+-    fatal (_("%P: %pB: error adding symbols: %E\n"), abfd);
++    fatal (_("%F%P: %pB: error adding symbols: %E\n"), abfd);
+ 
+   return true;
+ }
+@@ -1205,7 +1205,7 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
+ 	  && elf_dt_name (abfd) != NULL)
+ 	{
+ 	  if (bfd_elf_add_dt_needed_tag (abfd, &link_info) < 0)
+-	    fatal (_("%P: failed to add DT_NEEDED dynamic tag\n"));
++	    fatal (_("%F%P: failed to add DT_NEEDED dynamic tag\n"));
+ 	}
+ 
+   link_info.input_bfds_tail = save_input_bfd_tail;
+@@ -1256,7 +1256,7 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 		     bfd_get_target (link_info.output_bfd));
+ 
+       if (link_info.out_implib_bfd == NULL)
+-	fatal (_("%P: %s: can't open for writing: %E\n"),
++	fatal (_("%F%P: %s: can't open for writing: %E\n"),
+ 	       command_line.out_implib_filename);
+     }
+ 
+@@ -1311,7 +1311,7 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 	  && (elf_tdata (abfd)->elf_header->e_type == ET_EXEC
+ 	      || (elf_tdata (abfd)->elf_header->e_type == ET_DYN
+ 		  && elf_tdata (abfd)->is_pie)))
+-	fatal (_("%P: cannot use executable file '%pB' as input to a link\n"),
++	fatal (_("%F%P: cannot use executable file '%pB' as input to a link\n"),
+ 	       abfd);
+     }
+ 
+@@ -1365,7 +1365,7 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 		}
+ 	      else if (seen_type != type)
+ 		{
+-		  fatal (_("%P: compact frame descriptions incompatible with"
++		  fatal (_("%F%P: compact frame descriptions incompatible with"
+ 			   " DWARF2 .eh_frame from %pB\n"),
+ 			 type == DWARF2_EH_HDR ? abfd : elfbfd);
+ 		  break;
+@@ -1407,7 +1407,7 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 
+   if (link_info.eh_frame_hdr_type == COMPACT_EH_HDR)
+     if (!bfd_elf_parse_eh_frame_entries (NULL, &link_info))
+-      fatal (_("%P: failed to parse EH frame entries\n"));
++      fatal (_("%F%P: failed to parse EH frame entries\n"));
+ 
+   ldelf_handle_dt_needed (htab, use_libpath, native, is_linux,
+ 			  is_freebsd, elfsize, prefix);
+@@ -1664,7 +1664,7 @@ ldelf_find_exp_assignment (etree_type *exp)
+ 					       &link_info,
+ 					       exp->assign.dst, provide,
+ 					       exp->assign.hidden))
+-	    fatal (_("%P: failed to record assignment to %s: %E\n"),
++	    fatal (_("%F%P: failed to record assignment to %s: %E\n"),
+ 		   exp->assign.dst);
+ 	}
+       ldelf_find_exp_assignment (exp->assign.src);
+@@ -1844,7 +1844,7 @@ ldelf_before_allocation (char *audit, char *depaudit,
+ 	  command_line.filter_shlib, audit, depaudit,
+ 	  (const char * const *) command_line.auxiliary_filters,
+ 	  &link_info, &sinterp)))
+-    fatal (_("%P: failed to set dynamic section sizes: %E\n"));
++    fatal (_("%F%P: failed to set dynamic section sizes: %E\n"));
+ 
+   if (sinterp != NULL)
+     {
+@@ -1881,8 +1881,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
+ 	msg = (char *) xmalloc ((size_t) (sz + 1));
+ 	if (! bfd_get_section_contents (is->the_bfd, s,	msg,
+ 					(file_ptr) 0, sz))
+-	  fatal (_("%P: %pB: can't read contents of section %pA: %E\n"),
+-		 is->the_bfd, s);
++	  fatal (_("%F%P: %pB: can't read contents of section .gnu.warning: %E\n"),
++		 is->the_bfd);
+ 	msg[sz] = '\0';
+ 	(*link_info.callbacks->warning) (&link_info, msg,
+ 					 (const char *) NULL, is->the_bfd,
+@@ -1909,7 +1909,7 @@ ldelf_before_allocation (char *audit, char *depaudit,
+   before_allocation_default ();
+ 
+   if (!bfd_elf_size_dynsym_hash_dynstr (link_info.output_bfd, &link_info))
+-    fatal (_("%P: failed to set dynamic section sizes: %E\n"));
++    fatal (_("%F%P: failed to set dynamic section sizes: %E\n"));
+ 
+   if (ehdr_start != NULL)
+     {
+diff --git a/ld/ldelfgen.c b/ld/ldelfgen.c
+index 1b1e49ce..cceefc6d 100644
+--- a/ld/ldelfgen.c
++++ b/ld/ldelfgen.c
+@@ -282,7 +282,7 @@ ldelf_map_segments (bool need_layout)
+ 		  if (os_info->ordered != os_info->count
+ 		      && bfd_link_relocatable (&link_info))
+ 		    {
+-		      fatal (_("%P: "
++		      fatal (_("%F%P: "
+ 			       "%pA has both ordered and unordered sections\n"),
+ 			     os->bfd_section);
+ 		      return;
+@@ -307,7 +307,7 @@ ldelf_map_segments (bool need_layout)
+ 	  if (!_bfd_elf_map_sections_to_segments (link_info.output_bfd,
+ 						  &link_info,
+ 						  &need_layout))
+-	    fatal (_("%P: map sections to segments failed: %E\n"));
++	    fatal (_("%F%P: map sections to segments failed: %E\n"));
+ 
+ 	  if (phdr_size != elf_program_header_size (link_info.output_bfd))
+ 	    {
+@@ -327,7 +327,7 @@ ldelf_map_segments (bool need_layout)
+   while (need_layout && --tries);
+ 
+   if (tries == 0)
+-    fatal (_("%P: looping in map_segments\n"));
++    fatal (_("%F%P: looping in map_segments\n"));
+ 
+   if (bfd_get_flavour (link_info.output_bfd) == bfd_target_elf_flavour
+       && lang_phdr_list == NULL)
+@@ -338,7 +338,7 @@ ldelf_map_segments (bool need_layout)
+ 	= get_elf_backend_data (link_info.output_bfd);
+       if (bed->elf_backend_strip_zero_sized_dynamic_sections
+ 	  && !bed->elf_backend_strip_zero_sized_dynamic_sections (&link_info))
+-	fatal (_("%P: failed to strip zero-sized dynamic sections\n"));
++	  fatal (_("%F%P: failed to strip zero-sized dynamic sections\n"));
+     }
+ }
+ 
+@@ -416,7 +416,7 @@ ldelf_acquire_strings_for_ctf
+     {
+       if (ctf_link_add_strtab (ctf_output, ldelf_ctf_strtab_iter_cb,
+ 			       &args) < 0)
+-	fatal (_("%P: warning: CTF strtab association failed; strings will "
++	fatal (_("%F%P: warning: CTF strtab association failed; strings will "
+ 		 "not be shared: %s\n"),
+ 	       ctf_errmsg (ctf_errno (ctf_output)));
+     }
+@@ -443,7 +443,7 @@ ldelf_new_dynsym_for_ctf (struct ctf_dict *ctf_output, int symidx,
+       lsym.st_value = sym->st_value;
+       if (ctf_link_add_linker_symbol (ctf_output, &lsym) < 0)
+ 	{
+-	  fatal (_("%P: warning: CTF symbol addition failed; CTF will "
++	  fatal (_("%F%P: warning: CTF symbol addition failed; CTF will "
+ 		   "not be tied to symbols: %s\n"),
+ 		 ctf_errmsg (ctf_errno (ctf_output)));
+ 	}
+@@ -453,7 +453,7 @@ ldelf_new_dynsym_for_ctf (struct ctf_dict *ctf_output, int symidx,
+       /* Shuffle all the symbols.  */
+ 
+       if (ctf_link_shuffle_syms (ctf_output) < 0)
+-	fatal (_("%P: warning: CTF symbol shuffling failed; CTF will "
++	fatal (_("%F%P: warning: CTF symbol shuffling failed; CTF will "
+ 		 "not be tied to symbols: %s\n"),
+ 	       ctf_errmsg (ctf_errno (ctf_output)));
+     }
+diff --git a/ld/ldexp.c b/ld/ldexp.c
+index 45dffbc6..86f82a09 100644
+--- a/ld/ldexp.c
++++ b/ld/ldexp.c
+@@ -282,7 +282,7 @@ definedness_newfunc (struct bfd_hash_entry *entry,
+       bfd_hash_allocate (table, sizeof (struct definedness_hash_entry));
+ 
+   if (ret == NULL)
+-    fatal (_("%P: bfd_hash_allocate failed creating symbol %s\n"), name);
++    fatal (_("%F%P: bfd_hash_allocate failed creating symbol %s\n"), name);
+ 
+   ret->by_object = 0;
+   ret->iteration = 0;
+@@ -313,7 +313,7 @@ update_definedness (const char *name, struct bfd_link_hash_entry *h)
+     bfd_hash_lookup (&definedness_table, name, true, false);
+ 
+   if (defentry == NULL)
+-    fatal (_("%P: bfd_hash_lookup failed creating symbol %s\n"), name);
++    fatal (_("%F%P: bfd_hash_lookup failed creating symbol %s\n"), name);
+ 
+   /* If the symbol was already defined, and not by a script, then it
+      must be defined by an object file or by the linker target code.  */
+@@ -638,7 +638,7 @@ fold_binary (etree_type *tree)
+ 	    expld.result.value = ((bfd_signed_vma) lhs.value
+ 				  % (bfd_signed_vma) expld.result.value);
+ 	  else if (expld.phase != lang_mark_phase_enum)
+-	    fatal (_("%P:%pS %% by zero\n"), tree->binary.rhs);
++	    fatal (_("%F%P:%pS %% by zero\n"), tree->binary.rhs);
+ 	  arith_result_section (&lhs);
+ 	  break;
+ 
+@@ -647,7 +647,7 @@ fold_binary (etree_type *tree)
+ 	    expld.result.value = ((bfd_signed_vma) lhs.value
+ 				  / (bfd_signed_vma) expld.result.value);
+ 	  else if (expld.phase != lang_mark_phase_enum)
+-	    fatal (_("%P:%pS / by zero\n"), tree->binary.rhs);
++	    fatal (_("%F%P:%pS / by zero\n"), tree->binary.rhs);
+ 	  arith_result_section (&lhs);
+ 	  break;
+ 
+@@ -761,7 +761,7 @@ fold_name (etree_type *tree)
+ 	  if (!h)
+ 	    {
+ 	      if (expld.phase != lang_first_phase_enum)
+-		fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
++		fatal (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
+ 	    }
+ 	  else if (h->type == bfd_link_hash_defined
+ 		   || h->type == bfd_link_hash_defweak)
+@@ -789,7 +789,7 @@ fold_name (etree_type *tree)
+ 	  else if (expld.phase == lang_final_phase_enum
+ 		   || (expld.phase != lang_mark_phase_enum
+ 		       && expld.assigning_to_dot))
+-	    fatal (_("%P:%pS: undefined symbol `%s'"
++	    fatal (_("%F%P:%pS: undefined symbol `%s'"
+ 		     " referenced in expression\n"),
+ 		   tree, tree->name.name);
+ 	  else if (h->type == bfd_link_hash_new)
+@@ -827,7 +827,7 @@ fold_name (etree_type *tree)
+ 	  if (os == NULL)
+ 	    {
+ 	      if (expld.phase == lang_final_phase_enum)
+-		fatal (_("%P:%pS: undefined section `%s'"
++		fatal (_("%F%P:%pS: undefined section `%s'"
+ 			 " referenced in expression\n"),
+ 		       tree, tree->name.name);
+ 	    }
+@@ -845,7 +845,7 @@ fold_name (etree_type *tree)
+ 	  if (os == NULL)
+ 	    {
+ 	      if (expld.phase == lang_final_phase_enum)
+-		fatal (_("%P:%pS: undefined section `%s'"
++		fatal (_("%F%P:%pS: undefined section `%s'"
+ 			 " referenced in expression\n"),
+ 		       tree, tree->name.name);
+ 	    }
+@@ -873,7 +873,7 @@ fold_name (etree_type *tree)
+ 	  if (os == NULL)
+ 	    {
+ 	      if (expld.phase == lang_final_phase_enum)
+-		fatal (_("%P:%pS: undefined section `%s'"
++		fatal (_("%F%P:%pS: undefined section `%s'"
+ 			 " referenced in expression\n"),
+ 		       tree, tree->name.name);
+ 	      new_number (0);
+@@ -912,7 +912,7 @@ fold_name (etree_type *tree)
+ 	if (mem != NULL)
+ 	  new_number (mem->length);
+ 	else
+-	  fatal (_("%P:%pS: undefined MEMORY region `%s'"
++	  fatal (_("%F%P:%pS: undefined MEMORY region `%s'"
+ 		   " referenced in expression\n"),
+ 		 tree, tree->name.name);
+       }
+@@ -926,7 +926,7 @@ fold_name (etree_type *tree)
+ 	if (mem != NULL)
+ 	  new_rel_from_abs (mem->origin);
+ 	else
+-	  fatal (_("%P:%pS: undefined MEMORY region `%s'"
++	  fatal (_("%F%P:%pS: undefined MEMORY region `%s'"
+ 		   " referenced in expression\n"),
+ 		 tree, tree->name.name);
+       }
+@@ -938,7 +938,7 @@ fold_name (etree_type *tree)
+       else if (strcmp (tree->name.name, "COMMONPAGESIZE") == 0)
+ 	new_number (link_info.commonpagesize);
+       else
+-	fatal (_("%P:%pS: unknown constant `%s' referenced in expression\n"),
++	fatal (_("%F%P:%pS: unknown constant `%s' referenced in expression\n"),
+ 	       tree, tree->name.name);
+       break;
+ 
+@@ -1086,7 +1086,7 @@ exp_fold_tree_1 (etree_type *tree)
+       if (tree->assign.dst[0] == '.' && tree->assign.dst[1] == 0)
+ 	{
+ 	  if (tree->type.node_class != etree_assign)
+-	    fatal (_("%P:%pS can not PROVIDE assignment to"
++	    fatal (_("%F%P:%pS can not PROVIDE assignment to"
+ 		     " location counter\n"), tree);
+ 	  if (expld.phase != lang_first_phase_enum)
+ 	    {
+@@ -1119,11 +1119,11 @@ exp_fold_tree_1 (etree_type *tree)
+ 		  || expld.section == bfd_und_section_ptr)
+ 		{
+ 		  if (expld.phase != lang_mark_phase_enum)
+-		    fatal (_("%P:%pS invalid assignment to"
++		    fatal (_("%F%P:%pS invalid assignment to"
+ 			     " location counter\n"), tree);
+ 		}
+ 	      else if (expld.dotp == NULL)
+-		fatal (_("%P:%pS assignment to location counter"
++		fatal (_("%F%P:%pS assignment to location counter"
+ 			 " invalid outside of SECTIONS\n"), tree);
+ 
+ 	      /* After allocation, assignment to dot should not be
+@@ -1142,7 +1142,7 @@ exp_fold_tree_1 (etree_type *tree)
+ 		    nextdot += expld.section->vma;
+ 		  if (nextdot < expld.dot
+ 		      && expld.section != bfd_abs_section_ptr)
+-		    fatal (_("%P:%pS cannot move location counter backwards"
++		    fatal (_("%F%P:%pS cannot move location counter backwards"
+ 			     " (from %V to %V)\n"),
+ 			   tree, expld.dot, nextdot);
+ 		  else
+@@ -1202,7 +1202,7 @@ exp_fold_tree_1 (etree_type *tree)
+ 		  h = bfd_link_hash_lookup (link_info.hash, tree->assign.dst,
+ 					    true, false, true);
+ 		  if (h == NULL)
+-		    fatal (_("%P:%s: hash creation failed\n"),
++		    fatal (_("%F%P:%s: hash creation failed\n"),
+ 			   tree->assign.dst);
+ 		}
+ 
+@@ -1578,7 +1578,7 @@ exp_get_vma (etree_type *tree, lang_output_section_statement_type *os,
+       if (expld.result.valid_p)
+ 	return expld.result.value;
+       else if (name != NULL && expld.phase != lang_mark_phase_enum)
+-	fatal (_("%P:%pS: nonconstant expression for %s\n"),
++	fatal (_("%F%P:%pS: nonconstant expression for %s\n"),
+ 	       tree, name);
+     }
+   return def;
+@@ -1621,7 +1621,7 @@ exp_get_fill (etree_type *tree, fill_type *def, char *name)
+   if (!expld.result.valid_p)
+     {
+       if (name != NULL && expld.phase != lang_mark_phase_enum)
+-	fatal (_("%P:%pS: nonconstant expression for %s\n"),
++	fatal (_("%F%P:%pS: nonconstant expression for %s\n"),
+ 	       tree, name);
+       return def;
+     }
+@@ -1681,7 +1681,7 @@ exp_get_abs_int (etree_type *tree, int def, char *name)
+ 	}
+       else if (name != NULL && expld.phase != lang_mark_phase_enum)
+ 	{
+-	  fatal (_("%P:%pS: nonconstant expression for %s\n"),
++	  fatal (_("%F%P:%pS: nonconstant expression for %s\n"),
+ 		 tree, name);
+ 	}
+     }
+@@ -1707,7 +1707,7 @@ ldexp_init (void)
+ 			      definedness_newfunc,
+ 			      sizeof (struct definedness_hash_entry),
+ 			      13))
+-    fatal (_("%P: can not create hash table: %E\n"));
++    fatal (_("%F%P: can not create hash table: %E\n"));
+ }
+ 
+ /* Convert absolute symbols defined by a script from "dot" (also
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index ddab0d37..040a8886 100644
+--- a/ld/ldfile.c
++++ b/ld/ldfile.c
+@@ -183,7 +183,7 @@ ldfile_add_remap_file (const char * file)
+ 
+       if (*p == '\0')
+ 	{
+-	  fatal ("%P: malformed remap file entry: %s\n", line);
++	  fatal ("%F%P: malformed remap file entry: %s\n", line);
+ 	  continue;
+ 	}
+ 
+@@ -195,7 +195,7 @@ ldfile_add_remap_file (const char * file)
+ 
+       if (*p == '\0')
+ 	{
+-	  fatal ("%P: malformed remap file entry: %s\n", line);
++	  fatal ("%F%P: malformed remap file entry: %s\n", line);
+ 	  continue;
+ 	}
+ 
+@@ -365,7 +365,7 @@ ldfile_try_open_bfd (const char *attempt,
+   if (entry->the_bfd == NULL)
+     {
+       if (bfd_get_error () == bfd_error_invalid_target)
+-	fatal (_("%P: invalid BFD target `%s'\n"), entry->target);
++	fatal (_("%F%P: invalid BFD target `%s'\n"), entry->target);
+       return false;
+     }
+ 
+@@ -508,7 +508,7 @@ ldfile_try_open_bfd (const char *attempt,
+ 
+ 	  if (!entry->flags.dynamic && (entry->the_bfd->flags & DYNAMIC) != 0)
+ 	    {
+-	      fatal (_("%P: attempted static link of dynamic object `%s'\n"),
++	      fatal (_("%F%P: attempted static link of dynamic object `%s'\n"),
+ 		     attempt);
+ 	      bfd_close (entry->the_bfd);
+ 	      entry->the_bfd = NULL;
+@@ -919,7 +919,7 @@ ldfile_open_command_file_1 (const char *name, enum script_open_style open_how)
+       if ((open_how != script_nonT || script->open_how != script_nonT)
+ 	  && strcmp (name, script->name) == 0)
+ 	{
+-	  fatal (_("%P: error: linker script file '%s'"
++	  fatal (_("%F%P: error: linker script file '%s'"
+ 		   " appears multiple times\n"), name);
+ 	  return;
+ 	}
+@@ -941,7 +941,7 @@ ldfile_open_command_file_1 (const char *name, enum script_open_style open_how)
+   if (ldlex_input_stack == NULL)
+     {
+       bfd_set_error (bfd_error_system_call);
+-      fatal (_("%P: cannot open linker script file %s: %E\n"), name);
++      fatal (_("%F%P: cannot open linker script file %s: %E\n"), name);
+       return;
+     }
+ 
+@@ -1012,5 +1012,5 @@ ldfile_set_output_arch (const char *string, enum bfd_architecture defarch)
+   else if (defarch != bfd_arch_unknown)
+     ldfile_output_architecture = defarch;
+   else
+-    fatal (_("%P: cannot represent machine `%s'\n"), string);
++    fatal (_("%F%P: cannot represent machine `%s'\n"), string);
+ }
+diff --git a/ld/ldgram.y b/ld/ldgram.y
+index c2f1e298..81bb8fd8 100644
+--- a/ld/ldgram.y
++++ b/ld/ldgram.y
+@@ -209,7 +209,7 @@ mri_script_command:
+ 		CHIP  exp
+ 	|	CHIP  exp ',' exp
+ 	|	NAME	{
+-			fatal (_("%P: unrecognised keyword in MRI style script '%s'\n"), $1);
++			fatal(_("%F%P: unrecognised keyword in MRI style script '%s'\n"),$1);
+ 			}
+ 	|	LIST	{
+ 			config.map_filename = "-";
+@@ -1547,7 +1547,7 @@ yyerror (const char *arg)
+     einfo (_("%P:%s: file format not recognized; treating as linker script\n"),
+ 	   ldlex_filename ());
+   if (error_index > 0 && error_index < ERROR_NAME_MAX)
+-    fatal (_("%P:%pS: %s in %s\n"), NULL, arg, error_names[error_index - 1]);
++    fatal (_("%F%P:%pS: %s in %s\n"), NULL, arg, error_names[error_index - 1]);
+   else
+-    fatal ("%P:%pS: %s\n", NULL, arg);
++    fatal ("%F%P:%pS: %s\n", NULL, arg);
+ }
+diff --git a/ld/ldlang.c b/ld/ldlang.c
+index 9bf5fcbe..57d9a777 100644
+--- a/ld/ldlang.c
++++ b/ld/ldlang.c
+@@ -1325,7 +1325,7 @@ output_section_statement_table_init (void)
+ 			      output_section_statement_newfunc,
+ 			      sizeof (struct out_section_hash_entry),
+ 			      61))
+-    fatal (_("%P: can not create hash table: %E\n"));
++    fatal (_("%F%P: can not create hash table: %E\n"));
+ }
+ 
+ static void
+@@ -1453,7 +1453,7 @@ lang_memory_region_alias (const char *alias, const char *region_name)
+      the default memory region.  */
+   if (strcmp (region_name, DEFAULT_MEMORY_REGION) == 0
+       || strcmp (alias, DEFAULT_MEMORY_REGION) == 0)
+-    fatal (_("%P:%pS: error: alias for default memory region\n"), NULL);
++    fatal (_("%F%P:%pS: error: alias for default memory region\n"), NULL);
+ 
+   /* Look for the target region and check if the alias is not already
+      in use.  */
+@@ -1464,14 +1464,14 @@ lang_memory_region_alias (const char *alias, const char *region_name)
+ 	if (region == NULL && strcmp (n->name, region_name) == 0)
+ 	  region = r;
+ 	if (strcmp (n->name, alias) == 0)
+-	  fatal (_("%P:%pS: error: redefinition of memory region "
++	  fatal (_("%F%P:%pS: error: redefinition of memory region "
+ 		   "alias `%s'\n"),
+ 		 NULL, alias);
+       }
+ 
+   /* Check if the target region exists.  */
+   if (region == NULL)
+-    fatal (_("%P:%pS: error: memory region `%s' "
++    fatal (_("%F%P:%pS: error: memory region `%s' "
+ 	     "for alias `%s' does not exist\n"),
+ 	   NULL, region_name, alias);
+ 
+@@ -1532,7 +1532,7 @@ lang_output_section_statement_lookup (const char *name,
+   if (entry == NULL)
+     {
+       if (create)
+-	fatal (_("%P: failed creating section `%s': %E\n"), name);
++	fatal (_("%F%P: failed creating section `%s': %E\n"), name);
+       return NULL;
+     }
+ 
+@@ -2426,7 +2426,7 @@ static void
+ init_os (lang_output_section_statement_type *s, flagword flags)
+ {
+   if (strcmp (s->name, DISCARD_SECTION_NAME) == 0)
+-    fatal (_("%P: illegal use of `%s' section\n"), DISCARD_SECTION_NAME);
++    fatal (_("%F%P: illegal use of `%s' section\n"), DISCARD_SECTION_NAME);
+ 
+   if (!s->dup_output)
+     s->bfd_section = bfd_get_section_by_name (link_info.output_bfd, s->name);
+@@ -2435,7 +2435,7 @@ init_os (lang_output_section_statement_type *s, flagword flags)
+ 							 s->name, flags);
+   if (s->bfd_section == NULL)
+     {
+-      fatal (_("%P: output format %s cannot represent section"
++      fatal (_("%F%P: output format %s cannot represent section"
+ 	       " called %s: %E\n"),
+ 	     link_info.output_bfd->xvec->name, s->name);
+     }
+@@ -3027,7 +3027,7 @@ load_symbols (lang_input_statement_type *entry,
+ 	}
+       else if (err != bfd_error_file_not_recognized
+ 	       || place == NULL)
+-	fatal (_("%P: %pB: file not recognized: %E\n"), entry->the_bfd);
++	fatal (_("%F%P: %pB: file not recognized: %E\n"), entry->the_bfd);
+ 
+       bfd_close (entry->the_bfd);
+       entry->the_bfd = NULL;
+@@ -3100,7 +3100,7 @@ load_symbols (lang_input_statement_type *entry,
+ 
+ 	      if (!bfd_check_format (member, bfd_object))
+ 		{
+-		  fatal (_("%P: %pB: member %pB in archive is not an object\n"),
++		  fatal (_("%F%P: %pB: member %pB in archive is not an object\n"),
+ 			 entry->the_bfd, member);
+ 		  loaded = false;
+ 		}
+@@ -3115,7 +3115,7 @@ load_symbols (lang_input_statement_type *entry,
+ 		 substitute BFD for us.  */
+ 	      if (!bfd_link_add_symbols (subsbfd, &link_info))
+ 		{
+-		  fatal (_("%P: %pB: error adding symbols: %E\n"), member);
++		  fatal (_("%F%P: %pB: error adding symbols: %E\n"), member);
+ 		  loaded = false;
+ 		}
+ 	    }
+@@ -3129,7 +3129,7 @@ load_symbols (lang_input_statement_type *entry,
+   if (bfd_link_add_symbols (entry->the_bfd, &link_info))
+     entry->flags.loaded = true;
+   else
+-    fatal (_("%P: %pB: error adding symbols: %E\n"), entry->the_bfd);
++    fatal (_("%F%P: %pB: error adding symbols: %E\n"), entry->the_bfd);
+ 
+   return entry->flags.loaded;
+ }
+@@ -3370,7 +3370,7 @@ open_output (const char *name)
+       {
+ 	char *in = lrealpath (f->local_sym_name);
+ 	if (filename_cmp (in, out) == 0)
+-	  fatal (_("%P: input file '%s' is the same as output file\n"),
++	  fatal (_("%F%P: input file '%s' is the same as output file\n"),
+ 		 f->filename);
+ 	free (in);
+       }
+@@ -3432,23 +3432,23 @@ open_output (const char *name)
+   if (link_info.output_bfd == NULL)
+     {
+       if (bfd_get_error () == bfd_error_invalid_target)
+-	fatal (_("%P: target %s not found\n"), output_target);
++	fatal (_("%F%P: target %s not found\n"), output_target);
+ 
+-      fatal (_("%P: cannot open output file %s: %E\n"), name);
++      fatal (_("%F%P: cannot open output file %s: %E\n"), name);
+     }
+ 
+   delete_output_file_on_failure = true;
+ 
+   if (!bfd_set_format (link_info.output_bfd, bfd_object))
+-    fatal (_("%P: %s: can not make object file: %E\n"), name);
++    fatal (_("%F%P: %s: can not make object file: %E\n"), name);
+   if (!bfd_set_arch_mach (link_info.output_bfd,
+ 			  ldfile_output_architecture,
+ 			  ldfile_output_machine))
+-    fatal (_("%P: %s: can not set architecture: %E\n"), name);
++    fatal (_("%F%P: %s: can not set architecture: %E\n"), name);
+ 
+   link_info.hash = bfd_link_hash_table_create (link_info.output_bfd);
+   if (link_info.hash == NULL)
+-    fatal (_("%P: can not create hash table: %E\n"));
++    fatal (_("%F%P: can not create hash table: %E\n"));
+ 
+   bfd_set_gp_size (link_info.output_bfd, g_switch_value);
+ }
+@@ -3973,7 +3973,7 @@ insert_undefined (const char *name)
+ 
+   h = bfd_link_hash_lookup (link_info.hash, name, true, false, true);
+   if (h == NULL)
+-    fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
++    fatal (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
+   if (h->type == bfd_link_hash_new)
+     {
+       h->type = bfd_link_hash_undefined;
+@@ -4259,7 +4259,7 @@ map_input_to_output_sections
+ 		  else if (strcmp (name, "SHT_PREINIT_ARRAY") == 0)
+ 		    type = SHT_PREINIT_ARRAY;
+ 		  else
+-		    fatal (_ ("%P: invalid type for output section `%s'\n"),
++		    fatal (_ ("%F%P: invalid type for output section `%s'\n"),
+ 			   os->name);
+ 		}
+ 	     else
+@@ -4268,7 +4268,7 @@ map_input_to_output_sections
+ 		 if (expld.result.valid_p)
+ 		   type = expld.result.value;
+ 		 else
+-		   fatal (_ ("%P: invalid type for output section `%s'\n"),
++		   fatal (_ ("%F%P: invalid type for output section `%s'\n"),
+ 			  os->name);
+ 	       }
+ 	      break;
+@@ -4417,7 +4417,7 @@ process_insert_statements (lang_statement_union_type **start)
+ 	    }
+ 	  if (where == NULL)
+ 	    {
+-	      fatal (_("%P: %s not found for insert\n"), i->where);
++	      fatal (_("%F%P: %s not found for insert\n"), i->where);
+ 	      return;
+ 	    }
+ 
+@@ -5499,12 +5499,12 @@ size_input_section
+ 	      if (dot + TO_ADDR (i->size) > end)
+ 		{
+ 		  if (i->flags & SEC_LINKER_CREATED)
+-		    fatal (_("%P: Output section `%pA' not large enough for "
++		    fatal (_("%F%P: Output section `%pA' not large enough for "
+ 			     "the linker-created stubs section `%pA'.\n"),
+ 			   i->output_section, i);
+ 
+ 		  if (i->rawsize && i->rawsize != i->size)
+-		    fatal (_("%P: Relaxation not supported with "
++		    fatal (_("%F%P: Relaxation not supported with "
+ 			     "--enable-non-contiguous-regions (section `%pA' "
+ 			     "would overflow `%pA' after it changed size).\n"),
+ 			   i, i->output_section);
+@@ -5860,7 +5860,7 @@ lang_size_sections_1
+ 		      dot += expld.result.section->vma;
+ 		  }
+ 		else if (expld.phase != lang_mark_phase_enum)
+-		  fatal (_("%P:%pS: non constant or forward reference"
++		  fatal (_("%F%P:%pS: non constant or forward reference"
+ 			   " address expression for section %s\n"),
+ 			 os->addr_tree, os->name);
+ 	      }
+@@ -5943,7 +5943,7 @@ lang_size_sections_1
+ 			   overridden by the using the --no-check-sections
+ 			   switch.  */
+ 			if (command_line.check_section_addresses)
+-			  fatal (_("%P: error: no memory region specified"
++			  fatal (_("%F%P: error: no memory region specified"
+ 				   " for loadable section `%s'\n"),
+ 				 bfd_section_name (os->bfd_section));
+ 			else
+@@ -6250,7 +6250,7 @@ lang_size_sections_1
+ 		bool again;
+ 
+ 		if (!bfd_relax_section (i->owner, i, &link_info, &again))
+-		  fatal (_("%P: can't relax section: %E\n"));
++		  fatal (_("%F%P: can't relax section: %E\n"));
+ 		if (again)
+ 		  *relax = true;
+ 	      }
+@@ -6659,7 +6659,7 @@ lang_do_assignments_1 (lang_statement_union_type *s,
+ 		s->data_statement.value += expld.result.section->vma;
+ 	    }
+ 	  else if (expld.phase == lang_final_phase_enum)
+-	    fatal (_("%P: invalid data statement\n"));
++	    fatal (_("%F%P: invalid data statement\n"));
+ 	  {
+ 	    unsigned int size;
+ 	    switch (s->data_statement.type)
+@@ -6692,7 +6692,7 @@ lang_do_assignments_1 (lang_statement_union_type *s,
+ 	  if (expld.result.valid_p)
+ 	    s->reloc_statement.addend_value = expld.result.value;
+ 	  else if (expld.phase == lang_final_phase_enum)
+-	    fatal (_("%P: invalid reloc statement\n"));
++	    fatal (_("%F%P: invalid reloc statement\n"));
+ 	  dot += TO_ADDR (bfd_get_reloc_size (s->reloc_statement.howto));
+ 	  break;
+ 
+@@ -7110,7 +7110,7 @@ lang_end (void)
+ 	    break;
+ 	}
+       if (!sym)
+-	fatal (_("%P: --gc-sections requires a defined symbol root "
++	fatal (_("%F%P: --gc-sections requires a defined symbol root "
+ 		 "specified by -e or -u\n"));
+     }
+ 
+@@ -7135,7 +7135,7 @@ lang_end (void)
+ 	     + bfd_section_vma (h->u.def.section->output_section)
+ 	     + h->u.def.section->output_offset);
+       if (!bfd_set_start_address (link_info.output_bfd, val))
+-	fatal (_("%P: %s: can't set start address\n"), entry_symbol.name);
++	fatal (_("%F%P: %s: can't set start address\n"), entry_symbol.name);
+     }
+   else
+     {
+@@ -7148,7 +7148,7 @@ lang_end (void)
+       if (*send == '\0')
+ 	{
+ 	  if (!bfd_set_start_address (link_info.output_bfd, val))
+-	    fatal (_("%P: can't set start address\n"));
++	    fatal (_("%F%P: can't set start address\n"));
+ 	}
+       /* BZ 2004952: Only use the start of the entry section for executables.  */
+       else if bfd_link_executable (&link_info)
+@@ -7167,7 +7167,7 @@ lang_end (void)
+ 		       bfd_section_vma (ts));
+ 	      if (!bfd_set_start_address (link_info.output_bfd,
+ 					  bfd_section_vma (ts)))
+-		fatal (_("%P: can't set start address\n"));
++		fatal (_("%F%P: can't set start address\n"));
+ 	    }
+ 	  else
+ 	    {
+@@ -7236,7 +7236,7 @@ lang_check (void)
+ 		  != bfd_get_flavour (link_info.output_bfd)))
+ 	  && (bfd_get_file_flags (input_bfd) & HAS_RELOC) != 0)
+ 	{
+-	  fatal (_("%P: relocatable linking with relocations from"
++	  fatal (_("%F%P: relocatable linking with relocations from"
+ 		   " format %s (%pB) to format %s (%pB) is not supported\n"),
+ 		 bfd_get_target (input_bfd), input_bfd,
+ 		 bfd_get_target (link_info.output_bfd), link_info.output_bfd);
+@@ -7340,7 +7340,7 @@ lang_one_common (struct bfd_link_hash_entry *h, void *info)
+ 
+   section = h->u.c.p->section;
+   if (!bfd_define_common_symbol (link_info.output_bfd, &link_info, h))
+-    fatal (_("%P: could not define common symbol `%pT': %E\n"),
++    fatal (_("%F%P: could not define common symbol `%pT': %E\n"),
+ 	   h->root.string);
+ 
+   if (config.map_file != NULL)
+@@ -7518,7 +7518,7 @@ lang_set_flags (lang_memory_region_type *ptr, const char *flags, int invert)
+ 	  break;
+ 
+ 	default:
+-	  fatal (_("%P: invalid character %c (%d) in flags\n"),
++	  fatal (_("%F%P: invalid character %c (%d) in flags\n"),
+ 		 *flags, *flags);
+ 	  break;
+ 	}
+@@ -7630,7 +7630,7 @@ lang_enter_output_section_statement (const char *output_section_statement_name,
+ 
+   os->align_lma_with_input = align_with_input == ALIGN_WITH_INPUT;
+   if (os->align_lma_with_input && align != NULL)
+-    fatal (_("%P:%pS: error: align with input and explicit align specified\n"),
++    fatal (_("%F%P:%pS: error: align with input and explicit align specified\n"),
+ 	   NULL);
+ 
+   os->subsection_alignment = subalign;
+@@ -8142,7 +8142,7 @@ lang_process (void)
+   lang_place_undefineds ();
+ 
+   if (!bfd_section_already_linked_table_init ())
+-    fatal (_("%P: can not create hash table: %E\n"));
++    fatal (_("%F%P: can not create hash table: %E\n"));
+ 
+   /* A first pass through the memory regions ensures that if any region
+      references a symbol for its origin or length then this symbol will be
+@@ -8180,7 +8180,7 @@ lang_process (void)
+       files = file_chain;
+       inputfiles = input_file_chain;
+       if (plugin_call_all_symbols_read ())
+-	fatal (_("%P: %s: plugin reported error after all symbols read\n"),
++	fatal (_("%F%P: %s: plugin reported error after all symbols read\n"),
+ 	       plugin_error_plugin ());
+       link_info.lto_all_symbols_read = true;
+       /* Open any newly added files, updating the file chains.  */
+@@ -8757,7 +8757,7 @@ void
+ lang_startup (const char *name)
+ {
+   if (first_file->filename != NULL)
+-    fatal (_("%P: multiple STARTUP files\n"));
++    fatal (_("%F%P: multiple STARTUP files\n"));
+   first_file->filename = name;
+   first_file->local_sym_name = name;
+   first_file->flags.real = true;
+@@ -8981,7 +8981,7 @@ lang_record_phdrs (void)
+ 			break;
+ 		      }
+ 		  if (last == NULL)
+-		    fatal (_("%P: no sections assigned to phdrs\n"));
++		    fatal (_("%F%P: no sections assigned to phdrs\n"));
+ 		}
+ 	      pl = last;
+ 	    }
+@@ -9019,7 +9019,7 @@ lang_record_phdrs (void)
+       if (!bfd_record_phdr (link_info.output_bfd, l->type,
+ 			    l->flags != NULL, flags, l->at != NULL,
+ 			    at, l->filehdr, l->phdrs, c, secs))
+-	fatal (_("%P: bfd_record_phdr failed: %E\n"));
++	fatal (_("%F%P: bfd_record_phdr failed: %E\n"));
+     }
+ 
+   free (secs);
+diff --git a/ld/ldlex.l b/ld/ldlex.l
+index 7cbade08..0a7d63e6 100644
+--- a/ld/ldlex.l
++++ b/ld/ldlex.l
+@@ -504,7 +504,7 @@ void
+ lex_push_file (FILE *file, const char *name, unsigned int sysrooted)
+ {
+   if (include_stack_ptr >= MAX_INCLUDE_DEPTH)
+-    fatal (_("%P: includes nested too deeply\n"));
++    fatal (_("%F:includes nested too deeply\n"));
+   file_name_stack[include_stack_ptr] = name;
+   lineno_stack[include_stack_ptr] = lineno;
+   sysrooted_stack[include_stack_ptr] = input_flags.sysrooted;
+@@ -566,7 +566,7 @@ lex_redirect (const char *string, const char *fake_filename, unsigned int count)
+ 
+   yy_init = 0;
+   if (include_stack_ptr >= MAX_INCLUDE_DEPTH)
+-    fatal (_("%P: macros nested too deeply\n"));
++    fatal (_("%F: macros nested too deeply\n"));
+   file_name_stack[include_stack_ptr] = fake_filename;
+   lineno_stack[include_stack_ptr] = lineno;
+   include_stack[include_stack_ptr] = YY_CURRENT_BUFFER;
+@@ -670,7 +670,7 @@ yy_input (char *buf, int max_size)
+ 	{
+ 	  result = fread (buf, 1, max_size, yyin);
+ 	  if (result < max_size && ferror (yyin))
+-	    fatal (_("%P: read in flex scanner failed\n"));
++	    fatal (_("%F%P: read in flex scanner failed\n"));
+ 	}
+     }
+   return result;
+@@ -707,7 +707,7 @@ comment (void)
+ 
+       if (c == 0)
+ 	{
+-	  fatal (_("%P: EOF in comment\n"));
++	  fatal (_("%F%P: EOF in comment\n"));
+ 	  break;
+ 	}
+     }
+@@ -728,7 +728,7 @@ lex_warn_invalid (char *where, char *what)
+   if (ldfile_assumed_script)
+     {
+       bfd_set_error (bfd_error_file_not_recognized);
+-      fatal (_("%s: file not recognized: %E\n"), ldlex_filename ());
++      fatal (_("%F%s: file not recognized: %E\n"), ldlex_filename ());
+     }
+ 
+   if (! ISPRINT (*what))
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index a61086c3..8250ae08 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -193,7 +193,7 @@ write_dependency_file (void)
+   out = fopen (config.dependency_file, FOPEN_WT);
+   if (out == NULL)
+     {
+-      fatal (_("%P: cannot open dependency file %s: %E\n"),
++      fatal (_("%F%P: cannot open dependency file %s: %E\n"),
+ 	     config.dependency_file);
+     }
+ 
+@@ -266,7 +266,7 @@ main (int argc, char **argv)
+   expandargv (&argc, &argv);
+ 
+   if (bfd_init () != BFD_INIT_MAGIC)
+-    fatal (_("%P: fatal error: libbfd ABI mismatch\n"));
++    fatal (_("%F%P: fatal error: libbfd ABI mismatch\n"));
+ 
+   bfd_set_error_program_name (program_name);
+ 
+@@ -468,13 +468,13 @@ main (int argc, char **argv)
+     xexit (0);
+ 
+   if (link_info.inhibit_common_definition && !bfd_link_dll (&link_info))
+-    fatal (_("%P: --no-define-common may not be used without -shared\n"));
++    fatal (_("%F%P: --no-define-common may not be used without -shared\n"));
+ 
+   if (!lang_has_input_file)
+     {
+       if (version_printed || command_line.print_output_format)
+ 	xexit (0);
+-      fatal (_("%P: no input files\n"));
++      fatal (_("%F%P: no input files\n"));
+     }
+ 
+   if (verbose)
+@@ -494,7 +494,7 @@ main (int argc, char **argv)
+ 	  if (config.map_file == (FILE *) NULL)
+ 	    {
+ 	      bfd_set_error (bfd_error_system_call);
+-	      einfo (_("%P: cannot open map file %s: %E\n"),
++	      fatal (_("%F%P: cannot open map file %s: %E\n"),
+ 		     config.map_filename);
+ 	    }
+ 	}
+@@ -569,7 +569,7 @@ main (int argc, char **argv)
+       bfd *obfd = link_info.output_bfd;
+       link_info.output_bfd = NULL;
+       if (!bfd_close (obfd))
+-       fatal (_("%P: %s: final close failed: %E\n"), output_filename);
++       fatal (_("%F%P: %s: final close failed: %E\n"), output_filename);
+ 
+       /* If the --force-exe-suffix is enabled, and we're making an
+ 	 executable file and it doesn't end in .exe, copy it to one
+@@ -596,10 +596,10 @@ main (int argc, char **argv)
+ 	      dst = fopen (dst_name, FOPEN_WB);
+ 
+ 	      if (!src)
+-		fatal (_("%P: unable to open for source of copy `%s'\n"),
++		fatal (_("%F%P: unable to open for source of copy `%s'\n"),
+ 		       output_filename);
+ 	      if (!dst)
+-		fatal (_("%P: unable to open for destination of copy `%s'\n"),
++		fatal (_("%F%P: unable to open for destination of copy `%s'\n"),
+ 		       dst_name);
+ 	      while ((l = fread (buf, 1, bsize, src)) > 0)
+ 		{
+@@ -710,7 +710,7 @@ get_emulation (int argc, char **argv)
+ 		  i++;
+ 		}
+ 	      else
+-		fatal (_("%P: missing argument to -m\n"));
++		fatal (_("%F%P: missing argument to -m\n"));
+ 	    }
+ 	  else if (strcmp (argv[i], "-mips1") == 0
+ 		   || strcmp (argv[i], "-mips2") == 0
+@@ -764,11 +764,11 @@ add_ysym (const char *name)
+ 				  bfd_hash_newfunc,
+ 				  sizeof (struct bfd_hash_entry),
+ 				  61))
+-	fatal (_("%P: bfd_hash_table_init failed: %E\n"));
++	fatal (_("%F%P: bfd_hash_table_init failed: %E\n"));
+     }
+ 
+   if (bfd_hash_lookup (link_info.notice_hash, name, true, true) == NULL)
+-    fatal (_("%P: bfd_hash_lookup failed: %E\n"));
++    fatal (_("%F%P: bfd_hash_lookup failed: %E\n"));
+ }
+ 
+ void
+@@ -781,11 +781,11 @@ add_ignoresym (struct bfd_link_info *info, const char *name)
+ 				  bfd_hash_newfunc,
+ 				  sizeof (struct bfd_hash_entry),
+ 				  61))
+-	fatal (_("%P: bfd_hash_table_init failed: %E\n"));
++	fatal (_("%F%P: bfd_hash_table_init failed: %E\n"));
+     }
+ 
+   if (bfd_hash_lookup (info->ignore_hash, name, true, true) == NULL)
+-    fatal (_("%P: bfd_hash_lookup failed: %E\n"));
++    fatal (_("%F%P: bfd_hash_lookup failed: %E\n"));
+ }
+ 
+ /* Record a symbol to be wrapped, from the --wrap option.  */
+@@ -801,11 +801,11 @@ add_wrap (const char *name)
+ 				  bfd_hash_newfunc,
+ 				  sizeof (struct bfd_hash_entry),
+ 				  61))
+-	fatal (_("%P: bfd_hash_table_init failed: %E\n"));
++	fatal (_("%F%P: bfd_hash_table_init failed: %E\n"));
+     }
+ 
+   if (bfd_hash_lookup (link_info.wrap_hash, name, true, true) == NULL)
+-    fatal (_("%P: bfd_hash_lookup failed: %E\n"));
++    fatal (_("%F%P: bfd_hash_lookup failed: %E\n"));
+ }
+ 
+ /* Handle the -retain-symbols-file option.  */
+@@ -833,7 +833,7 @@ add_keepsyms_file (const char *filename)
+       xmalloc (sizeof (struct bfd_hash_table));
+   if (!bfd_hash_table_init (link_info.keep_hash, bfd_hash_newfunc,
+ 			    sizeof (struct bfd_hash_entry)))
+-    fatal (_("%P: bfd_hash_table_init failed: %E\n"));
++    fatal (_("%F%P: bfd_hash_table_init failed: %E\n"));
+ 
+   bufsize = 100;
+   buf = (char *) xmalloc (bufsize);
+@@ -863,7 +863,7 @@ add_keepsyms_file (const char *filename)
+ 	  buf[len] = '\0';
+ 
+ 	  if (bfd_hash_lookup (link_info.keep_hash, buf, true, true) == NULL)
+-	    fatal (_("%P: bfd_hash_lookup for insertion failed: %E\n"));
++	    fatal (_("%F%P: bfd_hash_lookup for insertion failed: %E\n"));
+ 	}
+     }
+ 
+@@ -1270,7 +1270,7 @@ constructor_callback (struct bfd_link_info *info,
+   if (bfd_reloc_type_lookup (info->output_bfd, BFD_RELOC_CTOR) == NULL
+       && (bfd_link_relocatable (info)
+ 	  || bfd_reloc_type_lookup (abfd, BFD_RELOC_CTOR) == NULL))
+-    fatal (_("%P: BFD backend error: BFD_RELOC_CTOR unsupported\n"));
++    fatal (_("%F%P: BFD backend error: BFD_RELOC_CTOR unsupported\n"));
+ 
+   s = set_name;
+   if (bfd_get_symbol_leading_char (abfd) != '\0')
+@@ -1282,7 +1282,7 @@ constructor_callback (struct bfd_link_info *info,
+ 
+   h = bfd_link_hash_lookup (info->hash, set_name, true, true, true);
+   if (h == (struct bfd_link_hash_entry *) NULL)
+-    fatal (_("%P: bfd_link_hash_lookup failed: %E\n"));
++    fatal (_("%F%P: bfd_link_hash_lookup failed: %E\n"));
+   if (h->type == bfd_link_hash_new)
+     {
+       h->type = bfd_link_hash_undefined;
+@@ -1315,7 +1315,7 @@ symbol_warning (const char *warning, const char *symbol, bfd *abfd)
+   struct warning_callback_info cinfo;
+ 
+   if (!bfd_generic_link_read_symbols (abfd))
+-    fatal (_("%P: %pB: could not read symbols: %E\n"), abfd);
++    fatal (_("%F%P: %pB: could not read symbols: %E\n"), abfd);
+ 
+   cinfo.found = false;
+   cinfo.warning = warning;
+@@ -1377,14 +1377,14 @@ warning_find_reloc (bfd *abfd, asection *sec, void *iarg)
+ 
+   relsize = bfd_get_reloc_upper_bound (abfd, sec);
+   if (relsize < 0)
+-    fatal (_("%P: %pB: could not read relocs: %E\n"), abfd);
++    fatal (_("%F%P: %pB: could not read relocs: %E\n"), abfd);
+   if (relsize == 0)
+     return;
+ 
+   relpp = (arelent **) xmalloc (relsize);
+   relcount = bfd_canonicalize_reloc (abfd, sec, relpp, info->asymbols);
+   if (relcount < 0)
+-    fatal (_("%P: %pB: could not read relocs: %E\n"), abfd);
++    fatal (_("%F%P: %pB: could not read relocs: %E\n"), abfd);
+ 
+   p = relpp;
+   pend = p + relcount;
+diff --git a/ld/ldmisc.c b/ld/ldmisc.c
+index d1257214..1d9d0cf2 100644
+--- a/ld/ldmisc.c
++++ b/ld/ldmisc.c
+@@ -324,7 +324,7 @@ vfinfo (FILE *fp, const char *fmt, va_list ap, bool is_warning)
+ 		if (abfd != NULL)
+ 		  {
+ 		    if (!bfd_generic_link_read_symbols (abfd))
+-		      fatal (_("%P: %pB: could not read symbols: %E\n"), abfd);
++		      fatal (_("%F%P: %pB: could not read symbols: %E\n"), abfd);
+ 
+ 		    asymbols = bfd_get_outsymbols (abfd);
+ 		  }
+@@ -638,7 +638,7 @@ fatal (const char *fmt, ...)
+ void
+ info_assert (const char *file, unsigned int line)
+ {
+-  fatal (_("%P: internal error %s %d\n"), file, line);
++  fatal (_("%F%P: internal error %s %d\n"), file, line);
+ }
+ 
+ /* ('m' for map) Format info message and print on map.  */
+@@ -707,5 +707,5 @@ ld_abort (const char *file, int line, const char *fn)
+   else
+     einfo (_("%P: internal error: aborting at %s:%d\n"),
+ 	   file, line);
+-  fatal (_("%P: please report this bug\n"));
++  fatal (_("%F%P: please report this bug\n"));
+ }
+diff --git a/ld/ldwrite.c b/ld/ldwrite.c
+index ace5e564..216d3583 100644
+--- a/ld/ldwrite.c
++++ b/ld/ldwrite.c
+@@ -57,14 +57,14 @@ build_link_order (lang_statement_union_type *statement)
+ 
+ 	link_order = bfd_new_link_order (link_info.output_bfd, output_section);
+ 	if (link_order == NULL)
+-	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%F%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	link_order->type = bfd_data_link_order;
+ 	link_order->offset = statement->data_statement.output_offset;
+ 	link_order->u.data.contents = bfd_alloc (link_info.output_bfd,
+ 						 QUAD_SIZE);
+ 	if (link_order->u.data.contents == NULL)
+-	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%F%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	value = statement->data_statement.value;
+ 
+@@ -170,7 +170,7 @@ build_link_order (lang_statement_union_type *statement)
+ 
+ 	link_order = bfd_new_link_order (link_info.output_bfd, output_section);
+ 	if (link_order == NULL)
+-	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%F%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	link_order->offset = rs->output_offset;
+ 	link_order->size = bfd_get_reloc_size (rs->howto);
+@@ -178,7 +178,7 @@ build_link_order (lang_statement_union_type *statement)
+ 	link_order->u.reloc.p = (struct bfd_link_order_reloc *)
+ 	  bfd_alloc (link_info.output_bfd, sizeof (struct bfd_link_order_reloc));
+ 	if (link_order->u.reloc.p == NULL)
+-	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%F%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	link_order->u.reloc.p->reloc = rs->reloc;
+ 	link_order->u.reloc.p->addend = rs->addend_value;
+@@ -224,7 +224,7 @@ build_link_order (lang_statement_union_type *statement)
+ 	    link_order = bfd_new_link_order (link_info.output_bfd,
+ 					     output_section);
+ 	    if (link_order == NULL)
+-	      fatal (_("%P: bfd_new_link_order failed: %E\n"));
++	      fatal (_("%F%P: bfd_new_link_order failed: %E\n"));
+ 
+ 	    if ((i->flags & SEC_NEVER_LOAD) != 0
+ 		&& (i->flags & SEC_DEBUGGING) == 0)
+@@ -265,7 +265,7 @@ build_link_order (lang_statement_union_type *statement)
+ 	link_order = bfd_new_link_order (link_info.output_bfd,
+ 					 output_section);
+ 	if (link_order == NULL)
+-	  fatal (_("%P: bfd_new_link_order failed: %E\n"));
++	  fatal (_("%F%P: bfd_new_link_order failed: %E\n"));
+ 	link_order->type = bfd_data_link_order;
+ 	link_order->size = statement->padding_statement.size;
+ 	link_order->offset = statement->padding_statement.output_offset;
+@@ -334,7 +334,7 @@ clone_section (bfd *abfd, asection *s, const char *name, int *count)
+       if (startswith (name, ".stab")
+ 	  || strcmp (name, "$GDB_SYMBOLS$") == 0)
+ 	{
+-	  fatal (_ ("%P: cannot create split section name for %s\n"), name);
++	  fatal (_ ("%F%P: cannot create split section name for %s\n"), name);
+ 	  return NULL;
+ 	}
+       tname[5] = 0;
+@@ -345,7 +345,7 @@ clone_section (bfd *abfd, asection *s, const char *name, int *count)
+       || (h = bfd_link_hash_lookup (link_info.hash,
+ 				    sname, true, true, false)) == NULL)
+     {
+-      fatal (_("%P: clone section failed: %E\n"));
++      fatal (_("%F%P: clone section failed: %E\n"));
+       return NULL;
+     }
+   free (tname);
+@@ -552,7 +552,7 @@ ldwrite (void)
+ 	 out.  */
+ 
+       if (bfd_get_error () != bfd_error_no_error)
+-       fatal (_("%P: final link failed: %E\n"));
++       fatal (_("%F%P: final link failed: %E\n"));
+       else
+ 	xexit (1);
+     }
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 00346348..2b17499c 100644
+--- a/ld/lexsup.c
++++ b/ld/lexsup.c
+@@ -810,7 +810,7 @@ parse_args (unsigned argc, char **argv)
+ 	       && optc != argv[last_optind][1])
+ 	{
+ 	  if (optarg)
+-	    fatal (_("%P: Error: unable to disambiguate: "
++	    fatal (_("%F%P: Error: unable to disambiguate: "
+ 		     "%s (did you mean -%s ?)\n"),
+ 		   argv[last_optind], argv[last_optind]);
+ 	  else
+@@ -851,7 +851,7 @@ parse_args (unsigned argc, char **argv)
+ 	  /* Fall through.  */
+ 
+ 	default:
+-	  fatal (_("%P: use the --help option for usage information\n"));
++	  fatal (_("%F%P: use the --help option for usage information\n"));
+ 	  break;
+ 
+ 	case 1:			/* File name.  */
+@@ -870,7 +870,7 @@ parse_args (unsigned argc, char **argv)
+ 		   || strcmp (optarg, "default") == 0)
+ 	    input_flags.dynamic = true;
+ 	  else
+-	    fatal (_("%P: unrecognized -a option `%s'\n"), optarg);
++	    fatal (_("%F%P: unrecognized -a option `%s'\n"), optarg);
+ 	  break;
+ 	case OPTION_ASSERT:
+ 	  /* FIXME: We just ignore these, but we should handle them.  */
+@@ -883,7 +883,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcmp (optarg, "pure-text") == 0)
+ 	    ;
+ 	  else
+-	    fatal (_("%P: unrecognized -assert option `%s'\n"), optarg);
++	    fatal (_("%F%P: unrecognized -assert option `%s'\n"), optarg);
+ 	  break;
+ 	case 'A':
+ 	  ldfile_add_arch (optarg);
+@@ -927,7 +927,7 @@ parse_args (unsigned argc, char **argv)
+ 
+ 	      style = cplus_demangle_name_to_style (optarg);
+ 	      if (style == unknown_demangling)
+-		fatal (_("%P: unknown demangling style `%s'\n"), optarg);
++		fatal (_("%F%P: unknown demangling style `%s'\n"), optarg);
+ 
+ 	      cplus_demangle_set_style (style);
+ 	    }
+@@ -1034,7 +1034,7 @@ parse_args (unsigned argc, char **argv)
+ 	    char *end;
+ 	    g_switch_value = strtoul (optarg, &end, 0);
+ 	    if (*end)
+-	      fatal (_("%P: invalid number `%s'\n"), optarg);
++	      fatal (_("%F%P: invalid number `%s'\n"), optarg);
+ 	  }
+ 	  break;
+ 	case 'g':
+@@ -1130,7 +1130,7 @@ parse_args (unsigned argc, char **argv)
+ 	      link_info.unresolved_syms_in_shared_libs = RM_IGNORE;
+ 	    }
+ 	  else
+-	    fatal (_("%P: bad --unresolved-symbols option: %s\n"), optarg);
++	    fatal (_("%F%P: bad --unresolved-symbols option: %s\n"), optarg);
+ 	  break;
+ 	case OPTION_WARN_UNRESOLVED_SYMBOLS:
+ 	  link_info.warn_unresolved_syms = true;
+@@ -1217,7 +1217,7 @@ parse_args (unsigned argc, char **argv)
+ 	  break;
+ 	case OPTION_PLUGIN_OPT:
+ 	  if (plugin_opt_plugin_arg (optarg))
+-	    fatal (_("%P: bad -plugin-opt option\n"));
++	    fatal (_("%F%P: bad -plugin-opt option\n"));
+ 	  break;
+ #endif /* BFD_SUPPORTS_PLUGINS */
+ 	case 'q':
+@@ -1234,10 +1234,10 @@ parse_args (unsigned argc, char **argv)
+ 	       an error message here.  We cannot just make this a warning,
+ 	       increment optind, and continue because getopt is too confused
+ 	       and will seg-fault the next time around.  */
+-	    fatal(_("%P: unrecognised option: %s\n"), argv[optind]);
++	    fatal(_("%F%P: unrecognised option: %s\n"), argv[optind]);
+ 
+ 	  if (bfd_link_pic (&link_info))
+-	    fatal (_("%P: -r and %s may not be used together\n"),
++	    fatal (_("%F%P: -r and %s may not be used together\n"),
+ 		   bfd_link_dll (&link_info) ? "-shared" : "-pie");
+ 
+ 	  link_info.type = type_relocatable;
+@@ -1347,7 +1347,7 @@ parse_args (unsigned argc, char **argv)
+ 	  if (config.has_shared)
+ 	    {
+ 	      if (bfd_link_relocatable (&link_info))
+-		fatal (_("%P: -r and %s may not be used together\n"),
++		fatal (_("%F%P: -r and %s may not be used together\n"),
+ 		       "-shared");
+ 
+ 	      link_info.type = type_dll;
+@@ -1359,7 +1359,7 @@ parse_args (unsigned argc, char **argv)
+ 		link_info.unresolved_syms_in_shared_libs = RM_IGNORE;
+ 	    }
+ 	  else
+-	    fatal (_("%P: -shared not supported\n"));
++	    fatal (_("%F%P: -shared not supported\n"));
+ 	  break;
+ 	case OPTION_NO_PIE:
+ 	  link_info.type = type_pde;
+@@ -1368,12 +1368,12 @@ parse_args (unsigned argc, char **argv)
+ 	  if (config.has_shared)
+ 	    {
+ 	      if (bfd_link_relocatable (&link_info))
+-		fatal (_("%P: -r and %s may not be used together\n"), "-pie");
++		fatal (_("%F%P: -r and %s may not be used together\n"), "-pie");
+ 
+ 	      link_info.type = type_pie;
+ 	    }
+ 	  else
+-	    fatal (_("%P: -pie not supported\n"));
++	    fatal (_("%F%P: -pie not supported\n"));
+ 	  break;
+ 	case 'h':		/* Used on Solaris.  */
+ 	case OPTION_SONAME:
+@@ -1390,7 +1390,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcmp (optarg, N_("ascending")) == 0)
+ 	    config.sort_common = sort_ascending;
+ 	  else
+-	    fatal (_("%P: invalid common section sorting option: %s\n"),
++	    fatal (_("%F%P: invalid common section sorting option: %s\n"),
+ 		   optarg);
+ 	  break;
+ 	case OPTION_SORT_SECTION:
+@@ -1399,7 +1399,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcmp (optarg, N_("alignment")) == 0)
+ 	    sort_section = by_alignment;
+ 	  else
+-	    fatal (_("%P: invalid section sorting option: %s\n"), optarg);
++	    fatal (_("%F%P: invalid section sorting option: %s\n"), optarg);
+ 	  break;
+ 	case OPTION_STATS:
+ 	  config.stats = true;
+@@ -1435,14 +1435,14 @@ parse_args (unsigned argc, char **argv)
+ 	    /* Check for <something>=<somthing>...  */
+ 	    optarg2 = strchr (optarg, '=');
+ 	    if (optarg2 == NULL)
+-	      fatal (_("%P: invalid argument to option"
++	      fatal (_("%F%P: invalid argument to option"
+ 		       " \"--section-start\"\n"));
+ 
+ 	    optarg2++;
+ 
+ 	    /* So far so good.  Are all the args present?  */
+ 	    if ((*optarg == '\0') || (*optarg2 == '\0'))
+-	      fatal (_("%P: missing argument(s) to option"
++	      fatal (_("%F%P: missing argument(s) to option"
+ 		       " \"--section-start\"\n"));
+ 
+ 	    /* We must copy the section name as set_section_start
+@@ -1486,7 +1486,7 @@ parse_args (unsigned argc, char **argv)
+ 	  /* Fall through.  */
+ 	case OPTION_UR:
+ 	  if (bfd_link_pic (&link_info))
+-	    fatal (_("%P: -r and %s may not be used together\n"),
++	    fatal (_("%F%P: -r and %s may not be used together\n"),
+ 		   bfd_link_dll (&link_info) ? "-shared" : "-pie");
+ 
+ 	  link_info.type = type_relocatable;
+@@ -1517,7 +1517,7 @@ parse_args (unsigned argc, char **argv)
+ 	      char *end;
+ 	      int level ATTRIBUTE_UNUSED = strtoul (optarg, &end, 0);
+ 	      if (*end)
+-		fatal (_("%P: invalid number `%s'\n"), optarg);
++		fatal (_("%F%P: invalid number `%s'\n"), optarg);
+ #if BFD_SUPPORTS_PLUGINS
+ 	      report_plugin_symbols = level > 1;
+ #endif /* BFD_SUPPORTS_PLUGINS */
+@@ -1712,7 +1712,7 @@ parse_args (unsigned argc, char **argv)
+ 	  break;
+ 	case ')':
+ 	  if (! ingroup)
+-	    fatal (_("%P: group ended before it began (--help for usage)\n"));
++	    fatal (_("%F%P: group ended before it began (--help for usage)\n"));
+ 
+ 	  lang_leave_group ();
+ 	  ingroup--;
+@@ -1728,7 +1728,7 @@ parse_args (unsigned argc, char **argv)
+ 
+ 	case OPTION_REMAP_INPUTS_FILE:
+ 	  if (! ldfile_add_remap_file (optarg))
+-	    fatal (_("%P: failed to add remap file %s\n"), optarg);
++	    fatal (_("%F%P: failed to add remap file %s\n"), optarg);
+ 	  break;
+ 
+ 	case OPTION_REMAP_INPUTS:
+@@ -1737,7 +1737,7 @@ parse_args (unsigned argc, char **argv)
+ 	    if (optarg2 == NULL)
+ 	      /* FIXME: Should we allow --remap-inputs=@myfile as a synonym
+ 		 for --remap-inputs-file=myfile ?  */
+-	      fatal (_("%P: invalid argument to option --remap-inputs\n"));
++	      fatal (_("%F%P: invalid argument to option --remap-inputs\n"));
+ 	    size_t len = optarg2 - optarg;
+ 	    char * pattern = xmalloc (len + 1);
+ 	    memcpy (pattern, optarg, len);
+@@ -1758,7 +1758,7 @@ parse_args (unsigned argc, char **argv)
+ 	    char *end;
+ 	    bfd_size_type cache_size = strtoul (optarg, &end, 0);
+ 	    if (*end != '\0')
+-	      fatal (_("%P: invalid cache memory size: %s\n"), optarg);
++	      fatal (_("%F%P: invalid cache memory size: %s\n"), optarg);
+ 	    link_info.max_cache_size = cache_size;
+ 	  }
+ 	  break;
+@@ -1783,7 +1783,7 @@ parse_args (unsigned argc, char **argv)
+ 
+ 	case OPTION_POP_STATE:
+ 	  if (input_flags.pushed == NULL)
+-	    fatal (_("%P: no state pushed before popping\n"));
++	    fatal (_("%F%P: no state pushed before popping\n"));
+ 	  else
+ 	    {
+ 	      struct lang_input_statement_flags *oldp = input_flags.pushed;
+@@ -1806,7 +1806,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcasecmp (optarg, "discard") == 0)
+ 	    config.orphan_handling = orphan_handling_discard;
+ 	  else
+-	    fatal (_("%P: invalid argument to option"
++	    fatal (_("%F%P: invalid argument to option"
+ 		     " \"--orphan-handling\"\n"));
+ 	  break;
+ 
+@@ -1851,7 +1851,7 @@ parse_args (unsigned argc, char **argv)
+ 	  else if (strcmp (optarg, "share-duplicated") == 0)
+ 	    config.ctf_share_duplicated = true;
+ 	  else
+-	    fatal (_("%P: bad --ctf-share-types option: %s\n"), optarg);
++	    fatal (_("%F%P: bad --ctf-share-types option: %s\n"), optarg);
+ 	  break;
+ 	}
+     }
+@@ -2046,7 +2046,7 @@ parse_args (unsigned argc, char **argv)
+   if (config.no_section_header)
+     {
+       if (bfd_link_relocatable (&link_info))
+-	fatal (_("%P: -r and -z nosectionheader may not be used together\n"));
++	fatal (_("%F%P: -r and -z nosectionheader may not be used together\n"));
+ 
+       link_info.strip = strip_all;
+     }
+@@ -2054,9 +2054,9 @@ parse_args (unsigned argc, char **argv)
+   if (!bfd_link_dll (&link_info))
+     {
+       if (command_line.filter_shlib)
+-	fatal (_("%P: -F may not be used without -shared\n"));
++	fatal (_("%F%P: -F may not be used without -shared\n"));
+       if (command_line.auxiliary_filters)
+-	fatal (_("%P: -f may not be used without -shared\n"));
++	fatal (_("%F%P: -f may not be used without -shared\n"));
+     }
+ 
+   /* Treat ld -r -s as ld -r -S -x (i.e., strip all local symbols).  I
+@@ -2097,7 +2097,7 @@ set_section_start (char *sect, char *valstr)
+   const char *end;
+   bfd_vma val = bfd_scan_vma (valstr, &end, 16);
+   if (*end)
+-    fatal (_("%P: invalid hex number `%s'\n"), valstr);
++    fatal (_("%F%P: invalid hex number `%s'\n"), valstr);
+   lang_section_start (sect, exp_intop (val), NULL);
+ }
+ 
+@@ -2110,7 +2110,7 @@ set_segment_start (const char *section, char *valstr)
+ 
+   bfd_vma val = bfd_scan_vma (valstr, &end, 16);
+   if (*end)
+-    fatal (_("%P: invalid hex number `%s'\n"), valstr);
++    fatal (_("%F%P: invalid hex number `%s'\n"), valstr);
+   /* If we already have an entry for this segment, update the existing
+      value.  */
+   name = section + 1;
+diff --git a/ld/mri.c b/ld/mri.c
+index 7c8e59fa..aea2bd44 100644
+--- a/ld/mri.c
++++ b/ld/mri.c
+@@ -288,7 +288,7 @@ mri_format (const char *name)
+     lang_add_output_format ("srec", NULL, NULL, 1);
+ 
+   else
+-    fatal (_("%P: unknown format type %s\n"), name);
++    fatal (_("%F%P: unknown format type %s\n"), name);
+ }
+ 
+ void
+diff --git a/ld/pe-dll.c b/ld/pe-dll.c
+index 800d00c8..ae294986 100644
+--- a/ld/pe-dll.c
++++ b/ld/pe-dll.c
+@@ -756,7 +756,7 @@ process_def_file_and_drectve (bfd *abfd ATTRIBUTE_UNUSED, struct bfd_link_info *
+ 
+ 	  if (!bfd_generic_link_read_symbols (b))
+ 	    {
+-	      fatal (_("%P: %pB: could not read symbols: %E\n"), b);
++	      fatal (_("%F%P: %pB: could not read symbols: %E\n"), b);
+ 	      return;
+ 	    }
+ 
+@@ -1048,7 +1048,7 @@ build_filler_bfd (bool include_edata)
+ 			     bfd_get_arch (link_info.output_bfd),
+ 			     bfd_get_mach (link_info.output_bfd)))
+     {
+-      fatal (_("%P: can not create BFD: %E\n"));
++      fatal (_("%F%P: can not create BFD: %E\n"));
+       return;
+     }
+ 
+@@ -1326,7 +1326,7 @@ pe_walk_relocs (struct bfd_link_info *info,
+ 
+       if (!bfd_generic_link_read_symbols (b))
+ 	{
+-	  fatal (_("%P: %pB: could not read symbols: %E\n"), b);
++	  fatal (_("%F%P: %pB: could not read symbols: %E\n"), b);
+ 	  return;
+ 	}
+ 
+@@ -1407,7 +1407,7 @@ pe_find_data_imports (const char *symhead,
+       if (!bfd_hash_table_init (import_hash,
+ 				bfd_hash_newfunc,
+ 				sizeof (struct bfd_hash_entry)))
+-	fatal (_("%P: bfd_hash_table_init failed: %E\n"));
++	fatal (_("%F%P: bfd_hash_table_init failed: %E\n"));
+     }
+   else
+     import_hash = NULL;
+@@ -1447,7 +1447,7 @@ pe_find_data_imports (const char *symhead,
+ 
+ 		if (!bfd_generic_link_read_symbols (b))
+ 		  {
+-		    fatal (_("%P: %pB: could not read symbols: %E\n"), b);
++		    fatal (_("%F%P: %pB: could not read symbols: %E\n"), b);
+ 		    return;
+ 		  }
+ 
+@@ -1549,7 +1549,7 @@ generate_reloc (bfd *abfd, struct bfd_link_info *info)
+ 
+       if (!bfd_generic_link_read_symbols (b))
+ 	{
+-	  fatal (_("%P: %pB: could not read symbols: %E\n"), b);
++	  fatal (_("%F%P: %pB: could not read symbols: %E\n"), b);
+ 	  return;
+ 	}
+ 
+diff --git a/ld/plugin.c b/ld/plugin.c
+index 0a99d406..27f69b97 100644
+--- a/ld/plugin.c
++++ b/ld/plugin.c
+@@ -252,7 +252,7 @@ plugin_opt_plugin (const char *plugin)
+   newplug->name = plugin;
+   newplug->dlhandle = dlopen (plugin, RTLD_NOW);
+   if (!newplug->dlhandle)
+-    fatal (_("%P: %s: error loading plugin: %s\n"), plugin, dlerror ());
++    fatal (_("%F%P: %s: error loading plugin: %s\n"), plugin, dlerror ());
+ 
+   /* Check if plugin has been loaded already.  */
+   while (curplug)
+@@ -345,7 +345,7 @@ plugin_get_ir_dummy_bfd (const char *name, bfd *srctemplate)
+ 	}
+     }
+  report_error:
+-  fatal (_("%P: could not create dummy IR bfd: %E\n"));
++  fatal (_("%F%P: could not create dummy IR bfd: %E\n"));
+   return NULL;
+ }
+ 
+@@ -426,7 +426,7 @@ asymbol_from_plugin_symbol (bfd *abfd, asymbol *asym,
+       unsigned char visibility;
+ 
+       if (!elfsym)
+-	fatal (_("%P: %s: non-ELF symbol in ELF BFD!\n"), asym->name);
++	fatal (_("%F%P: %s: non-ELF symbol in ELF BFD!\n"), asym->name);
+ 
+       if (ldsym->def == LDPK_COMMON)
+ 	{
+@@ -437,7 +437,7 @@ asymbol_from_plugin_symbol (bfd *abfd, asymbol *asym,
+       switch (ldsym->visibility)
+ 	{
+ 	default:
+-	  fatal (_("%P: unknown ELF symbol visibility: %d!\n"),
++	  fatal (_("%F%P: unknown ELF symbol visibility: %d!\n"),
+ 		 ldsym->visibility);
+ 	  return LDPS_ERR;
+ 
+@@ -555,7 +555,7 @@ get_view (const void *handle, const void **viewp)
+ 
+   /* FIXME: einfo should support %lld.  */
+   if ((off_t) size != input->filesize)
+-    fatal (_("%P: unsupported input file size: %s (%ld bytes)\n"),
++    fatal (_("%F%P: unsupported input file size: %s (%ld bytes)\n"),
+ 	   input->name, (long) input->filesize);
+ 
+   /* Check the cached view buffer.  */
+@@ -826,7 +826,7 @@ get_symbols (const void *handle, int nsyms, struct ld_plugin_symbol *syms,
+ 	  && blhe->type != bfd_link_hash_common)
+ 	{
+ 	  /* We should not have a new, indirect or warning symbol here.  */
+-	  fatal (_("%P: %s: plugin symbol table corrupt (sym type %d)\n"),
++	  fatal (_("%F%P: %s: plugin symbol table corrupt (sym type %d)\n"),
+ 		 called_plugin->name, blhe->type);
+ 	}
+ 
+@@ -978,14 +978,13 @@ message (int level, const char *format, ...)
+     case LDPL_ERROR:
+     default:
+       {
+-	char *newfmt = concat (_("%X%P: error: "), format, "\n",
++	char *newfmt = concat (level == LDPL_FATAL ? "%F" : "%X",
++			       _("%P: error: "), format, "\n",
+ 			       (const char *) NULL);
+ 	fflush (stdout);
+ 	vfinfo (stderr, newfmt, args, true);
+ 	fflush (stderr);
+ 	free (newfmt);
+-	if (level == LDPL_FATAL)
+-	  fatal ("");
+       }
+       break;
+     }
+@@ -1128,14 +1127,14 @@ plugin_load_plugins (void)
+       if (!onloadfn)
+ 	onloadfn = (ld_plugin_onload) dlsym (curplug->dlhandle, "_onload");
+       if (!onloadfn)
+-	fatal (_("%P: %s: error loading plugin: %s\n"),
++	fatal (_("%F%P: %s: error loading plugin: %s\n"),
+ 	       curplug->name, dlerror ());
+       set_tv_plugin_args (curplug, &my_tv[tv_header_size]);
+       called_plugin = curplug;
+       rv = (*onloadfn) (my_tv);
+       called_plugin = NULL;
+       if (rv != LDPS_OK)
+-	fatal (_("%P: %s: plugin error: %d\n"), curplug->name, rv);
++	fatal (_("%F%P: %s: plugin error: %d\n"), curplug->name, rv);
+       curplug = curplug->next;
+     }
+ 
+@@ -1194,7 +1193,7 @@ plugin_strdup (bfd *abfd, const char *str)
+   strlength = strlen (str) + 1;
+   copy = bfd_alloc (abfd, strlength);
+   if (copy == NULL)
+-    fatal (_("%P: plugin_strdup failed to allocate memory: %s\n"),
++    fatal (_("%F%P: plugin_strdup failed to allocate memory: %s\n"),
+ 	   bfd_get_error ());
+   memcpy (copy, str, strlength);
+   return copy;
+@@ -1231,7 +1230,7 @@ plugin_object_p (bfd *ibfd, bool known_used)
+ 
+   input = bfd_alloc (abfd, sizeof (*input));
+   if (input == NULL)
+-    fatal (_("%P: plugin failed to allocate memory for input: %s\n"),
++    fatal (_("%F%P: plugin failed to allocate memory for input: %s\n"),
+ 	   bfd_get_error ());
+ 
+   if (!bfd_plugin_open_input (ibfd, &file))
+@@ -1259,7 +1258,7 @@ plugin_object_p (bfd *ibfd, bool known_used)
+   claimed = 0;
+ 
+   if (plugin_call_claim_file (&file, &claimed, known_used))
+-    fatal (_("%P: %s: plugin reported error claiming file\n"),
++    fatal (_("%F%P: %s: plugin reported error claiming file\n"),
+ 	   plugin_error_plugin ());
+ 
+   if (input->fd != -1
+-- 
+2.43.0
+
-- 
2.43.0


