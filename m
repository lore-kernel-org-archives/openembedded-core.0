Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 73CB765CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 10:11:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 74A1F6002BA
Message-ID: <1435572664.3287.4.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 11:11:04 +0100
In-Reply-To: <1435353776-7886-1-git-send-email-sgw@linux.intel.com>
References: <1435353776-7886-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.16.3 (3.16.3-2.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH v2][Fido ONLY] binutils: Add -momit-lock-prefix support
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
X-List-Received-Date: Mon, 29 Jun 2015 10:11:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-06-26 at 14:22 -0700, Saul Wold wrote:
> This patch is needed for certain cpus and has been accepted into 
> upstream

Merged to my fido-next branch, thanks Saul.

Cheers,

Joshua

> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> v2: rebased patch against fido-next
> This patch is already in 2.25 which is  in master so this is Fido 
> ONLY
> 
>  meta/recipes-devtools/binutils/binutils-2.24.inc   |   1 +
>  .../0001-Add-momit_lock_prefix-no-yes-option.patch | 236 
> +++++++++++++++++++++
>  2 files changed, 237 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Add
> -momit_lock_prefix-no-yes-option.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc 
> b/meta/recipes-devtools/binutils/binutils-2.24.inc
> index 2fb56eb..e71a110 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.24.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
> @@ -41,6 +41,7 @@ SRC_URI = "\
>       file://binutils_CVE-2014-8504.patch \
>       file://binutils_CVE-2014-8737.patch \
>       file://Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch 
> \
> +     file://0001-Add-momit_lock_prefix-no-yes-option.patch \
>       "
>  
>  SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-Add
> -momit_lock_prefix-no-yes-option.patch b/meta/recipes
> -devtools/binutils/binutils/0001-Add-momit_lock_prefix-no-yes
> -option.patch
> new file mode 100644
> index 0000000..e56891f
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0001-Add
> -momit_lock_prefix-no-yes-option.patch
> @@ -0,0 +1,236 @@
> +From ee57d586166f36f4a6bddaa2305fd66a7752f967 Mon Sep 17 00:00:00 
> 2001
> +From: Ilya Tocar <ilya.tocar@intel.com>
> +Date: Fri, 1 Aug 2014 17:58:32 +0400
> +Subject: [PATCH] Add -momit_lock_prefix=[no|yes] option
> +
> +This option serves as a workaround for processors, which fail on 
> lock
> +prefix.
> +
> +gas/
> +	* config/tc-i386.c (omit_lock_prefix): New.
> +	(output_insn): Omit lock prefix if omit_lock_prefix is true.
> +	(OPTION_omit_lock_prefix): New.
> +	(md_longopts): Add momit-lock-prefix.
> +	(md_parse_option): Handle momit-lock-prefix.
> +	(md_show_usage): Add momit-lock-prefix=[no|yes].
> +	* doc/c-i386.texi (momit-lock-prefix): Document.
> +
> +gas/testsuite/
> +
> +	* gas/i386/i386.exp: Run new tests.
> +	* gas/i386/omit-lock-no.d: New.
> +	* gas/i386/omit-lock-yes.d: Ditto.
> +	* gas/i386/omit-lock.s: Ditto.
> +
> +Cherry-pick from git://sourceware.org/git/binutils-gdb.git
> +rev d022bddd4fd93428a7fa3cc7ad404c912ed20dbf
> +into binutils v2.24
> +
> +Upstream-Status: [Accepted]
> +Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +---
> + gas/ChangeLog                          |   10 ++++++++++
> + gas/config/tc-i386.c                   |   27 
> +++++++++++++++++++++++++++
> + gas/doc/c-i386.texi                    |   12 ++++++++++++
> + gas/testsuite/ChangeLog                |    7 +++++++
> + gas/testsuite/gas/i386/i386.exp        |    2 ++
> + gas/testsuite/gas/i386/omit-lock-no.d  |   12 ++++++++++++
> + gas/testsuite/gas/i386/omit-lock-yes.d |   12 ++++++++++++
> + gas/testsuite/gas/i386/omit-lock.s     |    6 ++++++
> + 8 files changed, 88 insertions(+)
> + create mode 100644 gas/testsuite/gas/i386/omit-lock-no.d
> + create mode 100644 gas/testsuite/gas/i386/omit-lock-yes.d
> + create mode 100644 gas/testsuite/gas/i386/omit-lock.s
> +
> +Index: binutils-2.24/gas/ChangeLog
> +===================================================================
> +--- binutils-2.24.orig/gas/ChangeLog
> ++++ binutils-2.24/gas/ChangeLog
> +@@ -4,6 +4,17 @@
> + 	single-bit bitfields.
> + 	(build_modrm_byte): Don't compare single-bit bitfields to 
> "1".
> + 
> ++2014-08-06  Ilya Tocar  <ilya.tocar@intel.com>
> ++
> ++       * config/tc-i386.c (omit_lock_prefix): New.
> ++       (output_insn): Omit lock prefix if omit_lock_prefix is true.
> ++       (OPTION_omit_lock_prefix): New.
> ++       (md_longopts): Add momit-lock-prefix.
> ++       (md_parse_option): Handle momit-lock-prefix.
> ++       (md_show_usage): Add momit-lock-prefix=[no|yes].
> ++       * doc/c-i386.texi (momit-lock-prefix): Document.
> ++
> ++
> + 2013-11-18  H.J. Lu  <hongjiu.lu@intel.com>
> + 
> + 	* config/tc-i386.c (lex_got): Add a dummy "int bnd_prefix"
> +Index: binutils-2.24/gas/config/tc-i386.c
> +===================================================================
> +--- binutils-2.24.orig/gas/config/tc-i386.c
> ++++ binutils-2.24/gas/config/tc-i386.c
> +@@ -541,6 +541,10 @@ static int add_bnd_prefix = 0;
> + /* 1 if pseudo index register, eiz/riz, is allowed .  */
> + static int allow_index_reg = 0;
> + 
> ++/* 1 if the assembler should ignore LOCK prefix, even if it was
> ++   specified explicitly.  */
> ++static int omit_lock_prefix = 0;
> ++
> + static enum check_kind
> +   {
> +     check_none = 0,
> +@@ -6910,6 +6914,15 @@ output_insn (void)
> +       unsigned int j;
> +       unsigned int prefix;
> + 
> ++      /* Some processors fail on LOCK prefix. This options makes
> ++	 assembler ignore LOCK prefix and serves as a workaround. 
>  */
> ++      if (omit_lock_prefix)
> ++	{
> ++	  if (i.tm.base_opcode == LOCK_PREFIX_OPCODE)
> ++	    return;
> ++	  i.prefix[LOCK_PREFIX] = 0;
> ++	}
> ++
> +       /* Since the VEX/EVEX prefix contains the implicit prefix, we
> + 	 don't need the explicit prefix.  */
> +       if (!i.tm.opcode_modifier.vex && !i.tm.opcode_modifier.evex)
> +@@ -9483,6 +9496,7 @@ const char *md_shortopts = "qn";
> + #define OPTION_MADD_BND_PREFIX (OPTION_MD_BASE + 15)
> + #define OPTION_MEVEXLIG (OPTION_MD_BASE + 16)
> + #define OPTION_MEVEXWIG (OPTION_MD_BASE + 17)
> ++#define OPTION_omit_lock_prefix (OPTION_MD_BASE + 18)
> + 
> + struct option md_longopts[] =
> + {
> +@@ -9509,6 +9523,7 @@ struct option md_longopts[] =
> +   {"madd-bnd-prefix", no_argument, NULL, OPTION_MADD_BND_PREFIX},
> +   {"mevexlig", required_argument, NULL, OPTION_MEVEXLIG},
> +   {"mevexwig", required_argument, NULL, OPTION_MEVEXWIG},
> ++  {"momit-lock-prefix", required_argument, NULL, 
> OPTION_omit_lock_prefix},
> +   {NULL, no_argument, NULL, 0}
> + };
> + size_t md_longopts_size = sizeof (md_longopts);
> +@@ -9790,6 +9805,15 @@ md_parse_option (int c, char *arg)
> + 	as_fatal (_("invalid -mevexwig= option: `%s'"), arg);
> +       break;
> + 
> ++    case OPTION_omit_lock_prefix:
> ++      if (strcasecmp (arg, "yes") == 0)
> ++        omit_lock_prefix = 1;
> ++      else if (strcasecmp (arg, "no") == 0)
> ++        omit_lock_prefix = 0;
> ++      else
> ++        as_fatal (_("invalid -momit-lock-prefix= option: `%s'"), 
> arg);
> ++      break;
> ++
> +     default:
> +       return 0;
> +     }
> +@@ -9942,6 +9966,9 @@ md_show_usage (FILE *stream)
> +   -mold-gcc               support old (<= 2.8.1) versions of 
> gcc\n"));
> +   fprintf (stream, _("\
> +   -madd-bnd-prefix        add BND prefix for all valid 
> branches\n"));
> ++  fprintf (stream, _("\
> ++  -momit-lock-prefix=[no|yes]\n\
> ++                          strip all lock prefixes\n"));
> + }
> + 
> + #if ((defined (OBJ_MAYBE_COFF) && defined (OBJ_MAYBE_AOUT)) \
> +Index: binutils-2.24/gas/doc/c-i386.texi
> +===================================================================
> +--- binutils-2.24.orig/gas/doc/c-i386.texi
> ++++ binutils-2.24/gas/doc/c-i386.texi
> +@@ -282,6 +282,18 @@ The @code{.att_syntax} and @code{.intel_
> + This option forces the assembler to add BND prefix to all branches, 
> even
> + if such prefix was not explicitly specified in the source code.
> + 
> ++@cindex @samp{-momit-lock-prefix=} option, i386
> ++@cindex @samp{-momit-lock-prefix=} option, x86-64
> ++@item -momit-lock-prefix=@var{no}
> ++@itemx -momit-lock-prefix=@var{yes}
> ++These options control how the assembler should encode lock prefix.
> ++This option is intended as a workaround for processors, that fail 
> on
> ++lock prefix. This option can only be safely used with single-core,
> ++single-thread computers
> ++@option{-momit-lock-prefix=@var{yes}} will omit all lock prefixes.
> ++@option{-momit-lock-prefix=@var{no}} will encode lock prefix as 
> usual,
> ++which is the default.
> ++
> + @end table
> + @c man end
> + 
> +Index: binutils-2.24/gas/testsuite/ChangeLog
> +===================================================================
> +--- binutils-2.24.orig/gas/testsuite/ChangeLog
> ++++ binutils-2.24/gas/testsuite/ChangeLog
> +@@ -1,3 +1,10 @@
> ++2014-08-06  Ilya Tocar  <ilya.tocar@intel.com>
> ++
> ++	* gas/i386/i386.exp: Run new tests.
> ++	* gas/i386/omit-lock-no.d: New.
> ++	* gas/i386/omit-lock-yes.d: Ditto.
> ++	* gas/i386/omit-lock.s: Ditto.+
> ++
> + 2013-11-20  Yufeng Zhang  <yufeng.zhang@arm.com>
> + 
> + 	* gas/aarch64/msr.s: Add tests.
> +Index: binutils-2.24/gas/testsuite/gas/i386/i386.exp
> +===================================================================
> +--- binutils-2.24.orig/gas/testsuite/gas/i386/i386.exp
> ++++ binutils-2.24/gas/testsuite/gas/i386/i386.exp
> +@@ -267,6 +267,8 @@ if [expr ([istarget "i*86-*-*"] ||  [ist
> +     run_list_test "mpx-inval-1" "-al"
> +     run_dump_test "mpx-add-bnd-prefix"
> +     run_dump_test "sha"
> ++    run_dump_test "omit-lock-yes"
> ++    run_dump_test "omit-lock-no"
> + 
> +     # These tests require support for 8 and 16 bit relocs,
> +     # so we only run them for ELF and COFF targets.
> +Index: binutils-2.24/gas/testsuite/gas/i386/omit-lock-no.d
> +===================================================================
> +--- /dev/null
> ++++ binutils-2.24/gas/testsuite/gas/i386/omit-lock-no.d
> +@@ -0,0 +1,12 @@
> ++#source: omit-lock.s
> ++#as: -momit-lock-prefix=yes  -momit-lock-prefix=no
> ++#objdump: -dw
> ++#name: i386  omit lock = no
> ++
> ++.*: +file format .*i386.*
> ++
> ++Disassembly of section .text:
> ++
> ++0+ <main>:
> ++   0:	f0 f0 83 00 01       	lock lock addl \$0x1,\(%eax\)
> ++#pass
> +Index: binutils-2.24/gas/testsuite/gas/i386/omit-lock-yes.d
> +===================================================================
> +--- /dev/null
> ++++ binutils-2.24/gas/testsuite/gas/i386/omit-lock-yes.d
> +@@ -0,0 +1,12 @@
> ++#source: omit-lock.s
> ++#as: -momit-lock-prefix=yes
> ++#objdump: -dw
> ++#name: i386  omit lock = yes
> ++
> ++.*: +file format .*i386.*
> ++
> ++Disassembly of section .text:
> ++
> ++0+ <main>:
> ++   0:	83 00 01             	addl   \$0x1,\(%eax\)
> ++#pass
> +Index: binutils-2.24/gas/testsuite/gas/i386/omit-lock.s
> +===================================================================
> +--- /dev/null
> ++++ binutils-2.24/gas/testsuite/gas/i386/omit-lock.s
> +@@ -0,0 +1,6 @@
> ++        .code32
> ++.globl main
> ++        .type   main, @function
> ++main:
> ++        lock
> ++        lock addl $0x1,(%eax)

