Return-Path: <dev@codyps.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id A94CF6FF80
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 20:36:52 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x58so3765987qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=nlKHEHgfb1i2/1ZqjDC3TSBCzvEvgZZ7LPDFJo+d4Sk=;
	b=MRIYjNwL+biZr/lbDreS6FqWP6wb0EqZ/1/cWqScdgMzK1W4FT4fzOvf1KgGJ4hGRM
	CxBx6vT2+e8mZxyJgXvde3LqwLaoPakqvE4jJYGDtZtbCJFS/lOjY1ivKG/7Yf+hkvSR
	jc5pgO7zb0KFI6yJCsBFP5taFVwbDYYl+ceSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nlKHEHgfb1i2/1ZqjDC3TSBCzvEvgZZ7LPDFJo+d4Sk=;
	b=JPtkWSqesHsScfIh8NotM2mox+yY0hHD6G3yWE2wMjp15vYEWJgl/F6SILRpiR3FI5
	9TKebU9+pGEGx4xuezf0jjt1HCOGibqLRpTnoxpSmKVHEs02TIlKCVVIUyV2sM4/iiyP
	yAYXASU/gcTY6ANIo69E/3WZK08FJsZKXRtUH18JDYPBgT312DJH14qTwKtcrx7TiPMi
	GJ/aGtyU5ixBmo5F5zcNUJ5eHCd71B1tX5q04OKImkemb8wfSjCis9AsCpQ0PNLECjHX
	6vAWbHYuJsXAZlQoGMFi1KOCx3EQOB4+coM8nrhBrPAwtzQpVqxM0wGH8YhF7EvLSO0T
	P9Wg==
X-Gm-Message-State: AKS2vOy+mkQ33PdHz6rtCHPy5RR/srZTUA7iRFgbAeOlFGvX2kfm2YVJ
	NM+qJzm0sWvZ8UMO59g=
X-Received: by 10.237.57.99 with SMTP id l90mr27223217qte.152.1496867813238;
	Wed, 07 Jun 2017 13:36:53 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52]) by smtp.gmail.com with ESMTPSA id
	x31sm1763330qtx.12.2017.06.07.13.36.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Jun 2017 13:36:52 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 16:36:44 -0400
Message-Id: <20170607203644.1960-1-dev@codyps.com>
X-Mailer: git-send-email 2.13.0
Subject: [morty][PATCH] elfutils: fix building elfutils-native with GCC7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jun 2017 20:36:54 -0000

This is heavily based on the oe-core master commit with the same
subject, but includes a backport of upstream's fix for the fallthrough
warnings rebased to 0.166 (the oe-core patch which targeted 0.168 did
not apply), a rebase of the format-truncation patch, and a backport of
the upstream format-length patch.

Info from OE-Core master patch follows:

	From OE-Core rev: aaf4c4f3d09ac3897205417eb15e19d54e0c0d05
	From: Joshua Lock <joshua.g.lock@intel.com>

	Backport a fix from upstream for a -Wformat-truncation=2 warning
	and implement a simple fix for a -Wimplicit-fallthrough warning.

	Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
	Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 ...-GCC7-Wimplicit-fallthrough-support-fixes.patch | 318 +++++++++++++++++++++
 .../0001-ar-Fix-GCC7-Wformat-length-issues.patch   | 125 ++++++++
 .../elfutils-0.166/Fix_one_GCC7_warning.patch      |  45 +++
 .../elfutils/elfutils-0.166/fallthrough.patch      |  36 +++
 meta/recipes-devtools/elfutils/elfutils_0.166.bb   |   5 +
 5 files changed, 529 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/0001-Add-GCC7-Wimplicit-fallthrough-support-fixes.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/0001-ar-Fix-GCC7-Wformat-length-issues.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/Fix_one_GCC7_warning.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/fallthrough.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-Add-GCC7-Wimplicit-fallthrough-support-fixes.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-Add-GCC7-Wimplicit-fallthrough-support-fixes.patch
new file mode 100644
index 0000000000..a240323f33
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-Add-GCC7-Wimplicit-fallthrough-support-fixes.patch
@@ -0,0 +1,318 @@
+From 09949994e76eea3c1230a5c88ffa8fdf588b120f Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mjw@redhat.com>
+Date: Wed, 2 Nov 2016 13:29:26 +0100
+Subject: [PATCH] Add GCC7 -Wimplicit-fallthrough support/fixes.
+
+GCC7 will have a new -Wimplicit-fallthrough warning. It did catch one
+small buglet in elflint option procession. So it seems useful to enable
+to make sure all swatch case fallthroughs are deliberate.
+
+Add configure check to detect whether gcc support -Wimplicit-fallthrough
+and enable it. Add fixes and explicit fallthrough comments where necessary.
+
+Signed-off-by: Mark Wielaard <mjw@redhat.com>
+
+Upstream-Status: Backport
+Upstream-Commit: a3cc8182b2ae05290b0eafa74b70746d7befc0e4
+---
+ backends/alpha_retval.c    |  4 +---
+ backends/i386_regs.c       |  1 +
+ backends/i386_retval.c     |  3 +--
+ backends/linux-core-note.c |  4 ++--
+ backends/ppc_regs.c        |  2 +-
+ backends/x86_64_regs.c     |  1 +
+ config/eu.am               |  8 +++++++-
+ configure.ac               | 10 ++++++++++
+ libcpu/i386_disasm.c       |  2 +-
+ libdw/cfi.c                |  2 ++
+ libdw/encoded-value.h      |  1 +
+ libdwfl/dwfl_report_elf.c  |  2 +-
+ src/addr2line.c            |  1 +
+ src/elfcompress.c          |  3 ++-
+ src/elflint.c              |  4 +++-
+ src/objdump.c              |  4 +++-
+ tests/backtrace-data.c     |  1 +
+ tests/backtrace.c          |  2 +-
+ 18 files changed, 40 insertions(+), 15 deletions(-)
+
+diff --git a/backends/alpha_retval.c b/backends/alpha_retval.c
+index 53dbfa45..7232b462 100644
+--- a/backends/alpha_retval.c
++++ b/backends/alpha_retval.c
+@@ -130,9 +130,7 @@ alpha_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ 	    return nloc_intreg;
+ 	  }
+       }
+-
+-      /* Else fall through.  */
+-
++      /* Fallthrough */
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+     case DW_TAG_union_type:
+diff --git a/backends/i386_regs.c b/backends/i386_regs.c
+index fb8ded33..fd963a62 100644
+--- a/backends/i386_regs.c
++++ b/backends/i386_regs.c
+@@ -92,6 +92,7 @@ i386_register_info (Ebl *ebl __attribute__ ((unused)),
+     case 5:
+     case 8:
+       *type = DW_ATE_address;
++      /* Fallthrough */
+     case 0 ... 3:
+     case 6 ... 7:
+       name[0] = 'e';
+diff --git a/backends/i386_retval.c b/backends/i386_retval.c
+index 9da797d5..4aa646fe 100644
+--- a/backends/i386_retval.c
++++ b/backends/i386_retval.c
+@@ -122,9 +122,8 @@ i386_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ 	  return nloc_intreg;
+ 	if (size <= 8)
+ 	  return nloc_intregpair;
+-
+-	/* Else fall through.  */
+       }
++    /* Fallthrough */
+ 
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+diff --git a/backends/linux-core-note.c b/backends/linux-core-note.c
+index ff2b226f..321721f3 100644
+--- a/backends/linux-core-note.c
++++ b/backends/linux-core-note.c
+@@ -219,8 +219,8 @@ EBLHOOK(core_note) (const GElf_Nhdr *nhdr, const char *name,
+     case sizeof "CORE":
+       if (memcmp (name, "CORE", nhdr->n_namesz) == 0)
+ 	break;
+-      /* Buggy old Linux kernels didn't terminate "LINUX".
+-         Fall through.  */
++      /* Buggy old Linux kernels didn't terminate "LINUX".  */
++      /* Fall through. */
+ 
+     case sizeof "LINUX":
+       if (memcmp (name, "LINUX", nhdr->n_namesz) == 0)
+diff --git a/backends/ppc_regs.c b/backends/ppc_regs.c
+index 4b92a9aa..bcf4f7a3 100644
+--- a/backends/ppc_regs.c
++++ b/backends/ppc_regs.c
+@@ -140,7 +140,7 @@ ppc_register_info (Ebl *ebl __attribute__ ((unused)),
+     case 100:
+       if (*bits == 32)
+ 	return stpcpy (name, "mq") + 1 - name;
+-
++      /* Fallthrough */
+     case 102 ... 107:
+       name[0] = 's';
+       name[1] = 'p';
+diff --git a/backends/x86_64_regs.c b/backends/x86_64_regs.c
+index 2172d9f1..84304407 100644
+--- a/backends/x86_64_regs.c
++++ b/backends/x86_64_regs.c
+@@ -87,6 +87,7 @@ x86_64_register_info (Ebl *ebl __attribute__ ((unused)),
+ 
+     case 6 ... 7:
+       *type = DW_ATE_address;
++      /* Fallthrough */
+     case 0 ... 5:
+       name[0] = 'r';
+       name[1] = baseregs[regno][0];
+diff --git a/config/eu.am b/config/eu.am
+index 4998771d..8fe1e259 100644
+--- a/config/eu.am
++++ b/config/eu.am
+@@ -61,10 +61,16 @@ else
+ NULL_DEREFERENCE_WARNING=
+ endif
+ 
++if HAVE_IMPLICIT_FALLTHROUGH_WARNING
++IMPLICIT_FALLTHROUGH_WARNING=-Wimplicit-fallthrough
++else
++IMPLICIT_FALLTHROUGH_WARNING=
++endif
++
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+ 	    -Wold-style-definition -Wstrict-prototypes \
+ 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+-	    $(NULL_DEREFERENCE_WARNING) \
++	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+ 	    $(if $($(*F)_no_Werror),,-Werror) \
+ 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+diff --git a/configure.ac b/configure.ac
+index 86a69c66..35850c64 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -336,6 +336,16 @@ CFLAGS="$old_CFLAGS"])
+ AM_CONDITIONAL(HAVE_NULL_DEREFERENCE_WARNING,
+ 	       [test "x$ac_cv_null_dereference" != "xno"])
+ 
++# -Wimplicit-fallthrough was added by GCC7
++AC_CACHE_CHECK([whether gcc accepts -Wimplicit-fallthrough], ac_cv_implicit_fallthrough, [dnl
++old_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -Wimplicit-fallthrough -Werror"
++AC_COMPILE_IFELSE([AC_LANG_SOURCE([])],
++		  ac_cv_implicit_fallthrough=yes, ac_cv_implicit_fallthrough=no)
++CFLAGS="$old_CFLAGS"])
++AM_CONDITIONAL(HAVE_IMPLICIT_FALLTHROUGH_WARNING,
++	       [test "x$ac_cv_implicit_fallthrough" != "xno"])
++
+ dnl Check if we have argp available from our libc
+ AC_LINK_IFELSE(
+ 	[AC_LANG_PROGRAM(
+diff --git a/libcpu/i386_disasm.c b/libcpu/i386_disasm.c
+index 832241f2..1a584635 100644
+--- a/libcpu/i386_disasm.c
++++ b/libcpu/i386_disasm.c
+@@ -819,7 +819,7 @@ i386_disasm (const uint8_t **startp, const uint8_t *end, GElf_Addr addr,
+ 			      ++param_start;
+ 			      break;
+ 			    }
+-
++			  /* Fallthrough */
+ 			default:
+ 			  assert (! "INVALID not handled");
+ 			}
+diff --git a/libdw/cfi.c b/libdw/cfi.c
+index 1fd668d7..daa845f3 100644
+--- a/libdw/cfi.c
++++ b/libdw/cfi.c
+@@ -138,6 +138,7 @@ execute_cfi (Dwarf_CFI *cache,
+ 
+ 	case DW_CFA_advance_loc1:
+ 	  operand = *program++;
++	  /* Fallthrough */
+ 	case DW_CFA_advance_loc + 0 ... DW_CFA_advance_loc + CFI_PRIMARY_MAX:
+ 	advance_loc:
+ 	  loc += operand * cie->code_alignment_factor;
+@@ -300,6 +301,7 @@ execute_cfi (Dwarf_CFI *cache,
+ 
+ 	case DW_CFA_restore_extended:
+ 	  get_uleb128 (operand, program, end);
++	  /* Fallthrough */
+ 	case DW_CFA_restore + 0 ... DW_CFA_restore + CFI_PRIMARY_MAX:
+ 
+ 	  if (unlikely (abi_cfi) && likely (opcode == DW_CFA_restore))
+diff --git a/libdw/encoded-value.h b/libdw/encoded-value.h
+index 48d868fb..f0df4cec 100644
+--- a/libdw/encoded-value.h
++++ b/libdw/encoded-value.h
+@@ -64,6 +64,7 @@ encoded_value_size (const Elf_Data *data, const unsigned char e_ident[],
+ 	    if (*end++ & 0x80u)
+ 	      return end - p;
+ 	}
++      return 0;
+ 
+     default:
+       return 0;
+diff --git a/libdwfl/dwfl_report_elf.c b/libdwfl/dwfl_report_elf.c
+index 1c6e401d..73a5511a 100644
+--- a/libdwfl/dwfl_report_elf.c
++++ b/libdwfl/dwfl_report_elf.c
+@@ -170,7 +170,7 @@ __libdwfl_elf_address_range (Elf *elf, GElf_Addr base, bool add_p_vaddr,
+       /* An assigned base address is meaningless for these.  */
+       base = 0;
+       add_p_vaddr = true;
+-
++      /* Fallthrough. */
+     case ET_DYN:
+     default:;
+       size_t phnum;
+diff --git a/src/addr2line.c b/src/addr2line.c
+index 0ce854f6..bea24aea 100644
+--- a/src/addr2line.c
++++ b/src/addr2line.c
+@@ -632,6 +632,7 @@ handle_address (const char *string, Dwfl *dwfl)
+ 	case 1:
+ 	  addr = 0;
+ 	  j = i;
++	  /* Fallthrough */
+ 	case 2:
+ 	  if (string[j] != '\0')
+ 	    break;
+diff --git a/src/elfcompress.c b/src/elfcompress.c
+index d0ca469c..57afa116 100644
+--- a/src/elfcompress.c
++++ b/src/elfcompress.c
+@@ -153,7 +153,8 @@ parse_opt (int key, char *arg __attribute__ ((unused)),
+ 	argp_error (state,
+ 		    N_("Only one input file allowed together with '-o'"));
+       /* We only use this for checking the number of arguments, we don't
+-	 actually want to consume them, so fallthrough.  */
++	 actually want to consume them.  */
++      /* Fallthrough */
+     default:
+       return ARGP_ERR_UNKNOWN;
+     }
+diff --git a/src/elflint.c b/src/elflint.c
+index 15b12f6f..2c45fcb8 100644
+--- a/src/elflint.c
++++ b/src/elflint.c
+@@ -210,6 +210,7 @@ parse_opt (int key, char *arg __attribute__ ((unused)),
+ 
+     case 'd':
+       is_debuginfo = true;
++      break;
+ 
+     case ARGP_gnuld:
+       gnuld = true;
+@@ -3963,6 +3964,7 @@ section [%2zu] '%s': merge flag set but entry size is zero\n"),
+ 	    case SHT_NOBITS:
+ 	      if (is_debuginfo)
+ 		break;
++	      /* Fallthrough */
+ 	    default:
+ 	      ERROR (gettext ("\
+ section [%2zu] '%s' has unexpected type %d for an executable section\n"),
+@@ -4305,7 +4307,7 @@ section [%2d] '%s': unknown core file note type %" PRIu32
+ 	    if (nhdr.n_namesz == sizeof "Linux"
+ 		&& !memcmp (data->d_buf + name_offset, "Linux", sizeof "Linux"))
+ 	      break;
+-
++	    /* Fallthrough */
+ 	  default:
+ 	    if (shndx == 0)
+ 	      ERROR (gettext ("\
+diff --git a/src/objdump.c b/src/objdump.c
+index 0aa41e89..94e9e021 100644
+--- a/src/objdump.c
++++ b/src/objdump.c
+@@ -234,7 +234,9 @@ parse_opt (int key, char *arg,
+ 		     program_invocation_short_name);
+ 	  exit (EXIT_FAILURE);
+ 	}
+-
++      /* We only use this for checking the number of arguments, we don't
++	 actually want to consume them.  */
++      /* Fallthrough */
+     default:
+       return ARGP_ERR_UNKNOWN;
+     }
+diff --git a/tests/backtrace-data.c b/tests/backtrace-data.c
+index bc5ceba0..b7158dae 100644
+--- a/tests/backtrace-data.c
++++ b/tests/backtrace-data.c
+@@ -250,6 +250,7 @@ thread_callback (Dwfl_Thread *thread, void *thread_arg __attribute__ ((unused)))
+       break;
+     case -1:
+       error (1, 0, "dwfl_thread_getframes: %s", dwfl_errmsg (-1));
++      break;
+     default:
+       abort ();
+     }
+diff --git a/tests/backtrace.c b/tests/backtrace.c
+index 12476430..bf5995b4 100644
+--- a/tests/backtrace.c
++++ b/tests/backtrace.c
+@@ -123,7 +123,7 @@ callback_verify (pid_t tid, unsigned frameno, Dwarf_Addr pc,
+ 	  assert (symname2 == NULL || strcmp (symname2, "jmp") != 0);
+ 	  break;
+ 	}
+-      /* PASSTHRU */
++      /* FALLTHRU */
+     case 4:
+       assert (symname != NULL && strcmp (symname, "stdarg") == 0);
+       break;
+-- 
+2.13.0
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-ar-Fix-GCC7-Wformat-length-issues.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-ar-Fix-GCC7-Wformat-length-issues.patch
new file mode 100644
index 0000000000..3465476784
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-ar-Fix-GCC7-Wformat-length-issues.patch
@@ -0,0 +1,125 @@
+From f090883ca61f0bf0f979c5b26d4e1a69e805156e Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mjw@redhat.com>
+Date: Thu, 10 Nov 2016 18:45:02 +0100
+Subject: [PATCH] ar: Fix GCC7 -Wformat-length issues.
+
+GCC7 adds warnings for snprintf formatting into too small buffers.
+Fix the two issues pointed out by the new warning. The ar header
+fields are fixed length containing left-justified strings without
+zero terminator. snprintf always adds a '\0' char at the end (which
+we then don't copy into the ar header field) and numbers are decimal
+strings of fixed 10 chars  (-Wformat-length thinks formatting
+them as size_t might overflow the buffer on 64bit arches).
+
+Signed-off-by: Mark Wielaard <mjw@redhat.com>
+
+Upstream-Status: Backport
+Upstream-Commit: d5afff85e22b38949f3e7936231c67de16e180e8
+---
+ src/ar.c    | 15 +++++++++++----
+ src/arlib.c | 16 ++++++++++------
+ 2 files changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/src/ar.c b/src/ar.c
+index 1320d07b..f2160d35 100644
+--- a/src/ar.c
++++ b/src/ar.c
+@@ -1,5 +1,5 @@
+ /* Create, modify, and extract from archives.
+-   Copyright (C) 2005-2012 Red Hat, Inc.
++   Copyright (C) 2005-2012, 2016 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2005.
+ 
+@@ -853,7 +853,10 @@ write_member (struct armem *memb, off_t *startp, off_t *lenp, Elf *elf,
+ 	      off_t end_off, int newfd)
+ {
+   struct ar_hdr arhdr;
+-  char tmpbuf[sizeof (arhdr.ar_name) + 1];
++  /* The ar_name is not actually zero teminated, but we need that for
++     snprintf.  Also if the name is too long, then the string starts
++     with '/' plus an index off number (decimal).  */
++  char tmpbuf[sizeof (arhdr.ar_name) + 2];
+ 
+   bool changed_header = memb->long_name_off != -1;
+   if (changed_header)
+@@ -1455,7 +1458,11 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
+ 
+ 	      /* Create the header.  */
+ 	      struct ar_hdr arhdr;
+-	      char tmpbuf[sizeof (arhdr.ar_name) + 1];
++	      /* The ar_name is not actually zero teminated, but we
++		 need that for snprintf.  Also if the name is too
++		 long, then the string starts with '/' plus an index
++		 off number (decimal).  */
++	      char tmpbuf[sizeof (arhdr.ar_name) + 2];
+ 	      if (all->long_name_off == -1)
+ 		{
+ 		  size_t namelen = strlen (all->name);
+@@ -1465,7 +1472,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
+ 		}
+ 	      else
+ 		{
+-		  snprintf (tmpbuf, sizeof (arhdr.ar_name) + 1, "/%-*ld",
++		  snprintf (tmpbuf, sizeof (tmpbuf), "/%-*ld",
+ 			    (int) sizeof (arhdr.ar_name), all->long_name_off);
+ 		  memcpy (arhdr.ar_name, tmpbuf, sizeof (arhdr.ar_name));
+ 		}
+diff --git a/src/arlib.c b/src/arlib.c
+index 43a9145b..0c2e4cde 100644
+--- a/src/arlib.c
++++ b/src/arlib.c
+@@ -1,5 +1,5 @@
+ /* Functions to handle creation of Linux archives.
+-   Copyright (C) 2007-2012 Red Hat, Inc.
++   Copyright (C) 2007-2012, 2016 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2007.
+ 
+@@ -23,6 +23,7 @@
+ #include <assert.h>
+ #include <error.h>
+ #include <gelf.h>
++#include <inttypes.h>
+ #include <libintl.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -107,6 +108,9 @@ arlib_init (void)
+ void
+ arlib_finalize (void)
+ {
++  /* Note that the size is stored as decimal string in 10 chars,
++     without zero terminator (we add + 1 here only so snprintf can
++     put it at the end, we then don't use it when we memcpy it).  */
+   char tmpbuf[sizeof (((struct ar_hdr *) NULL)->ar_size) + 1];
+ 
+   symtab.longnameslen = obstack_object_size (&symtab.longnamesob);
+@@ -121,9 +125,9 @@ arlib_finalize (void)
+ 
+       symtab.longnames = obstack_finish (&symtab.longnamesob);
+ 
+-      int s = snprintf (tmpbuf, sizeof (tmpbuf), "%-*zu",
++      int s = snprintf (tmpbuf, sizeof (tmpbuf), "%-*" PRIu32 "",
+ 			(int) sizeof (((struct ar_hdr *) NULL)->ar_size),
+-			symtab.longnameslen - sizeof (struct ar_hdr));
++			(uint32_t) (symtab.longnameslen - sizeof (struct ar_hdr)));
+       memcpy (&((struct ar_hdr *) symtab.longnames)->ar_size, tmpbuf, s);
+     }
+ 
+@@ -169,10 +173,10 @@ arlib_finalize (void)
+ 
+   /* See comment for ar_date above.  */
+   memcpy (&((struct ar_hdr *) symtab.symsoff)->ar_size, tmpbuf,
+-	  snprintf (tmpbuf, sizeof (tmpbuf), "%-*zu",
++	  snprintf (tmpbuf, sizeof (tmpbuf), "%-*" PRIu32 "",
+ 		    (int) sizeof (((struct ar_hdr *) NULL)->ar_size),
+-		    symtab.symsofflen + symtab.symsnamelen
+-		    - sizeof (struct ar_hdr)));
++		    (uint32_t) (symtab.symsofflen + symtab.symsnamelen
++				- sizeof (struct ar_hdr))));
+ }
+ 
+ 
+-- 
+2.13.0
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/Fix_one_GCC7_warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/Fix_one_GCC7_warning.patch
new file mode 100644
index 0000000000..25f5e14821
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/Fix_one_GCC7_warning.patch
@@ -0,0 +1,45 @@
+From 8e2ab18b874d1fda06243ad00209d44e2992928a Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 12 Feb 2017 21:51:34 +0100
+Subject: [PATCH 1/2] libasm: Fix one GCC7 -Wformat-truncation=2 warning.
+
+Make sure that if we have really lots of labels the tempsym doesn't get
+truncated because it is too small to hold the whole name.
+
+This doesn't enable -Wformat-truncation=2 or fix other "issues" pointed
+out by enabling this warning because there are currently some issues
+with it. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79448
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport (https://sourceware.org/git/?p=elfutils.git;a=commit;h=93c51144c3f664d4e9709da75a1d0fa00ea0fe95)
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+---
+ libasm/asm_newsym.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libasm/asm_newsym.c b/libasm/asm_newsym.c
+index 7f522910..76482bb2 100644
+--- a/libasm/asm_newsym.c
++++ b/libasm/asm_newsym.c
+@@ -1,5 +1,5 @@
+ /* Define new symbol for current position in given section.
+-   Copyright (C) 2002, 2005 Red Hat, Inc.
++   Copyright (C) 2002, 2005, 2017 Red Hat, Inc.
+    This file is part of elfutils.
+    Written by Ulrich Drepper <drepper@redhat.com>, 2002.
+ 
+@@ -44,7 +44,9 @@ AsmSym_t *
+ asm_newsym (AsmScn_t *asmscn, const char *name, GElf_Xword size,
+ 	    int type, int binding)
+ {
+-#define TEMPSYMLEN 10
++/* We don't really expect labels with many digits, but in theory it could
++   be 10 digits (plus ".L" and a zero terminator).  */
++#define TEMPSYMLEN 13
+   char tempsym[TEMPSYMLEN];
+   AsmSym_t *result;
+ 
+-- 
+2.13.0
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/fallthrough.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/fallthrough.patch
new file mode 100644
index 0000000000..b2623f9d2e
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.166/fallthrough.patch
@@ -0,0 +1,36 @@
+GCC7 adds -Wimplicit-fallthrough to warn when a switch case falls through,
+however this causes warnings (which are promoted to errors) with the elfutils
+patches from Debian for mips and parisc, which use fallthrough's by design.
+
+Explicitly mark the intentional fallthrough switch cases with a comment to
+disable the warnings where the fallthrough behaviour is desired.
+
+Upstream-Status: Pending [debian]
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+Index: elfutils-0.168/backends/parisc_retval.c
+===================================================================
+--- elfutils-0.168.orig/backends/parisc_retval.c
++++ elfutils-0.168/backends/parisc_retval.c
+@@ -166,7 +166,7 @@ parisc_return_value_location_ (Dwarf_Die
+ 	  return nloc_intregpair;
+ 
+ 	/* Else fall through.  */
+-      }
++      } // fallthrough
+ 
+     case DW_TAG_structure_type:
+     case DW_TAG_class_type:
+Index: elfutils-0.168/backends/mips_retval.c
+===================================================================
+--- elfutils-0.168.orig/backends/mips_retval.c
++++ elfutils-0.168/backends/mips_retval.c
+@@ -387,7 +387,7 @@ mips_return_value_location (Dwarf_Die *f
+               else
+                 return nloc_intregpair;
+             }
+-        }
++        } // fallthrough
+ 
+       /* Fallthrough to handle large types */
+ 
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.166.bb b/meta/recipes-devtools/elfutils/elfutils_0.166.bb
index 5d934281b3..3593c1c1d3 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.166.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.166.bb
@@ -18,7 +18,10 @@ SRC_URI += "\
         file://0001-remove-the-unneed-checking.patch \
         file://0001-fix-a-stack-usage-warning.patch \
         file://aarch64_uio.patch \
+        file://Fix_one_GCC7_warning.patch \
+        file://0001-Add-GCC7-Wimplicit-fallthrough-support-fixes.patch \
         file://shadow.patch \
+        file://0001-ar-Fix-GCC7-Wformat-length-issues.patch \
 "
 
 # pick the patch from debian
@@ -37,6 +40,8 @@ SRC_URI += "\
         file://uclibc-support.patch \
         file://elfcmp-fix-self-comparision.patch \
 "
+# Fix the patches from Debian with GCC7
+SRC_URI += "file://fallthrough.patch"
 SRC_URI_append_libc-musl = " file://0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch "
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
-- 
2.13.0


