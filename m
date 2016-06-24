Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D29070100
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:59:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a66so4014651wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TzlmAUEKBYhHEAj5QqYGg1BIdBIuZ6Onl7vdDUUlNtg=;
	b=C7gMKYUDI9k447NIQcxm4CwjsVuos78Bmk2chbajgenmVEQfFrynGZGKJAjaA+AmQv
	itnoRKR5wjrinVU2yOpBghMmV40lGIn1d4LXwBgrdJptJGTdnpS+nuj3LoS8Ly9peYPD
	wI0eCjLE8Yores/btq55hqdbbMt7Dm73zcXabyPP0XDVYI5u+IgOg2snoNhO+dw1gq/+
	PQgijFlSZEGBF75E6xx0Hl0tVxstKlfCKUfYML1vjKMGCr/qSNFoFfH5HTOQRbdrhT4q
	+zE6uWJIM/jeTVHk7+KK3r4NbE806aRKoz15V7qePSHggPgUKblvao5hNwDYsViVJpn4
	oQWg==
X-Gm-Message-State: ALyK8tJYG3D/D5K1lyxipWl/k9i5g6iRkQxEimPoohRIGoNVKL9SnM6p5RqRzAk8bOFFTw==
X-Received: by 10.194.203.233 with SMTP id kt9mr3200500wjc.75.1466765982378;
	Fri, 24 Jun 2016 03:59:42 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id
	el4sm4584869wjd.23.2016.06.24.03.59.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:59:41 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:59:40 +0100
Message-Id: <1466765980-23338-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] binutils: backport patch to fix mipsel (malta) kernel compile
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
X-List-Received-Date: Fri, 24 Jun 2016 10:59:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This fixes the following compilation error when building a mipsel
yocto kernel for qemu:

|   CC      arch/mips/mm/sc-ip22.o
| {standard input}: Assembler messages:
| {standard input}:128: Error: number (0x9000000080000000) larger than 32 bits
| {standard input}:151: Error: number (0x9000000080000000) larger than 32 bits
| {standard input}:186: Error: number (0x9000000080000000) larger than 32 bits

We leave out the testsuite bits and the changelog in this
backport.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   1 +
 ...ISA-override-not-lifting-ABI-restrictions.patch | 273 +++++++++++++++++++++
 2 files changed, 274 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
index 6d77452..04e0102 100644
--- a/meta/recipes-devtools/binutils/binutils-2.26.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -35,6 +35,7 @@ SRC_URI = "\
      file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
      file://0014-Correct-nios2-_gp-address-computation.patch \
      file://0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
+     file://MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch b/meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch
new file mode 100644
index 0000000..b8c65be
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch
@@ -0,0 +1,273 @@
+From 22522f880a8e17a17c4f195796ec89caece7652b Mon Sep 17 00:00:00 2001
+From: Maciej W. Rozycki <macro@imgtec.com>
+Date: Fri, 22 Apr 2016 01:04:52 +0100
+Subject: [PATCH] MIPS/GAS: Fix an ISA override not lifting ABI restrictions
+
+Correct a regression introduced with commit 919731affbef ("Add MIPS
+.module directive") causing code like:
+
+	.set	mips3
+	dli	$2, 0x9000000080000000
+
+to fail assembly with the following error message produced:
+
+Error: number (0x9000000080000000) larger than 32 bits
+
+if built with `mips3' selected as the global ISA (e.g. `-march=mips3').
+This is because a `.set' directive doing an ISA override does not lift
+the ABI restriction on register sizes if the ISA remains unchanged.
+Previously the directive always set register sizes from the ISA chosen,
+which is what some code expects.  Restore the old semantics then.
+
+	gas/
+	* config/tc-mips.c (code_option_type): New enum.
+	(parse_code_option): Return status indicating option type.
+	(s_mipsset): Update `parse_code_option' call site accordingly.
+	Always set register sizes from the ISA with ISA overrides.
+	(s_module): Update `parse_code_option' call site.
+	* testsuite/gas/mips/isa-override-1.d: New test.
+	* testsuite/gas/mips/micromips@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips1@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips2@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips32@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips32r2@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips32r3@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips32r5@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips32r6@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips64r2@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips64r3@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips64r5@isa-override-1.d: New test.
+	* testsuite/gas/mips/mips64r6@isa-override-1.d: New test.
+	* testsuite/gas/mips/r3000@isa-override-1.d: New test.
+	* testsuite/gas/mips/r3900@isa-override-1.d: New test.
+	* testsuite/gas/mips/r5900@isa-override-1.d: New test.
+	* testsuite/gas/mips/octeon@isa-override-1.d: New test.
+	* testsuite/gas/mips/octeon3@isa-override-1.d: New test.
+	* testsuite/gas/mips/isa-override-2.l: New list test.
+	* testsuite/gas/mips/mips1@isa-override-2.l: New list test.
+	* testsuite/gas/mips/mips2@isa-override-2.l: New list test.
+	* testsuite/gas/mips/mips32@isa-override-2.l: New list test.
+	* testsuite/gas/mips/mips32r2@isa-override-2.l: New list test.
+	* testsuite/gas/mips/mips32r3@isa-override-2.l: New list test.
+	* testsuite/gas/mips/mips32r5@isa-override-2.l: New list test.
+	* testsuite/gas/mips/mips32r6@isa-override-2.l: New list test.
+	* testsuite/gas/mips/r3000@isa-override-2.l: New list test.
+	* testsuite/gas/mips/r3900@isa-override-2.l: New list test.
+	* testsuite/gas/mips/octeon3@isa-override-2.l: New list test.
+	* testsuite/gas/mips/octeon3@isa-override-1.l: New stderr
+	output.
+	* testsuite/gas/mips/isa-override-1.s: New test source.
+	* testsuite/gas/mips/r5900@isa-override-1.s: New test source.
+	* testsuite/gas/mips/isa-override-2.s: New test source.
+	* testsuite/gas/mips/mips1@isa-override-2.s: New test source.
+	* testsuite/gas/mips/mips2@isa-override-2.s: New test source.
+	* testsuite/gas/mips/mips32@isa-override-2.s: New test source.
+	* testsuite/gas/mips/mips32r2@isa-override-2.s: New test source.
+	* testsuite/gas/mips/mips32r3@isa-override-2.s: New test source.
+	* testsuite/gas/mips/mips32r5@isa-override-2.s: New test source.
+	* testsuite/gas/mips/mips32r6@isa-override-2.s: New test source.
+	* testsuite/gas/mips/r3000@isa-override-2.s: New test source.
+	* testsuite/gas/mips/r3900@isa-override-2.s: New test source.
+	* testsuite/gas/mips/octeon3@isa-override-2.s: New test source.
+	* testsuite/gas/mips/mips.exp: Run the new tests.
+---
+Upstream-Status: Backport
+http://www.serverphorums.com/read.php?12,1466357
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=22522f880a8e17a17c4f195796ec89caece7652b
+
+ gas/ChangeLog                                     |   53 +++++++++++++++++++++
+ gas/config/tc-mips.c                              |   42 +++++++++++++---
+ gas/testsuite/gas/mips/isa-override-1.d           |   49 +++++++++++++++++++
+ gas/testsuite/gas/mips/isa-override-1.s           |   31 ++++++++++++
+ gas/testsuite/gas/mips/isa-override-2.l           |    4 ++
+ gas/testsuite/gas/mips/isa-override-2.s           |   18 +++++++
+ gas/testsuite/gas/mips/micromips@isa-override-1.d |   50 +++++++++++++++++++
+ gas/testsuite/gas/mips/mips.exp                   |    3 +
+ gas/testsuite/gas/mips/mips1@isa-override-1.d     |   53 +++++++++++++++++++++
+ gas/testsuite/gas/mips/mips1@isa-override-2.l     |    4 ++
+ gas/testsuite/gas/mips/mips1@isa-override-2.s     |   18 +++++++
+ gas/testsuite/gas/mips/mips2@isa-override-1.d     |   50 +++++++++++++++++++
+ gas/testsuite/gas/mips/mips2@isa-override-2.l     |    4 ++
+ gas/testsuite/gas/mips/mips2@isa-override-2.s     |   18 +++++++
+ gas/testsuite/gas/mips/mips32@isa-override-1.d    |    5 ++
+ gas/testsuite/gas/mips/mips32@isa-override-2.l    |    4 ++
+ gas/testsuite/gas/mips/mips32@isa-override-2.s    |   18 +++++++
+ gas/testsuite/gas/mips/mips32r2@isa-override-1.d  |   50 +++++++++++++++++++
+ gas/testsuite/gas/mips/mips32r2@isa-override-2.l  |    4 ++
+ gas/testsuite/gas/mips/mips32r2@isa-override-2.s  |   18 +++++++
+ gas/testsuite/gas/mips/mips32r3@isa-override-1.d  |    5 ++
+ gas/testsuite/gas/mips/mips32r3@isa-override-2.l  |    4 ++
+ gas/testsuite/gas/mips/mips32r3@isa-override-2.s  |   18 +++++++
+ gas/testsuite/gas/mips/mips32r5@isa-override-1.d  |    5 ++
+ gas/testsuite/gas/mips/mips32r5@isa-override-2.l  |    4 ++
+ gas/testsuite/gas/mips/mips32r5@isa-override-2.s  |   18 +++++++
+ gas/testsuite/gas/mips/mips32r6@isa-override-1.d  |    5 ++
+ gas/testsuite/gas/mips/mips32r6@isa-override-2.l  |    4 ++
+ gas/testsuite/gas/mips/mips32r6@isa-override-2.s  |   18 +++++++
+ gas/testsuite/gas/mips/mips64r2@isa-override-1.d  |   50 +++++++++++++++++++
+ gas/testsuite/gas/mips/mips64r3@isa-override-1.d  |    5 ++
+ gas/testsuite/gas/mips/mips64r5@isa-override-1.d  |    5 ++
+ gas/testsuite/gas/mips/mips64r6@isa-override-1.d  |    5 ++
+ gas/testsuite/gas/mips/octeon3@isa-override-1.d   |    6 ++
+ gas/testsuite/gas/mips/octeon3@isa-override-1.l   |    2 +
+ gas/testsuite/gas/mips/octeon3@isa-override-2.l   |    5 ++
+ gas/testsuite/gas/mips/octeon3@isa-override-2.s   |   18 +++++++
+ gas/testsuite/gas/mips/octeon@isa-override-1.d    |    5 ++
+ gas/testsuite/gas/mips/r3000@isa-override-1.d     |    5 ++
+ gas/testsuite/gas/mips/r3000@isa-override-2.l     |    4 ++
+ gas/testsuite/gas/mips/r3000@isa-override-2.s     |   18 +++++++
+ gas/testsuite/gas/mips/r3900@isa-override-1.d     |    5 ++
+ gas/testsuite/gas/mips/r3900@isa-override-2.l     |    4 ++
+ gas/testsuite/gas/mips/r3900@isa-override-2.s     |   18 +++++++
+ gas/testsuite/gas/mips/r5900@isa-override-1.d     |   28 +++++++++++
+ gas/testsuite/gas/mips/r5900@isa-override-1.s     |   23 +++++++++
+ 46 files changed, 775 insertions(+), 8 deletions(-)
+ create mode 100644 gas/testsuite/gas/mips/isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/isa-override-1.s
+ create mode 100644 gas/testsuite/gas/mips/isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/micromips@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips1@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips1@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/mips1@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/mips2@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips2@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/mips2@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/mips32@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips32@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/mips32@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/mips32r2@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips32r2@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/mips32r2@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/mips32r3@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips32r3@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/mips32r3@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/mips32r5@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips32r5@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/mips32r5@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/mips32r6@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips32r6@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/mips32r6@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/mips64r2@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips64r3@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips64r5@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/mips64r6@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/octeon3@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/octeon3@isa-override-1.l
+ create mode 100644 gas/testsuite/gas/mips/octeon3@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/octeon3@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/octeon@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/r3000@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/r3000@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/r3000@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/r3900@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/r3900@isa-override-2.l
+ create mode 100644 gas/testsuite/gas/mips/r3900@isa-override-2.s
+ create mode 100644 gas/testsuite/gas/mips/r5900@isa-override-1.d
+ create mode 100644 gas/testsuite/gas/mips/r5900@isa-override-1.s
+
+diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
+index bfc639e..daceef1 100644
+--- a/gas/config/tc-mips.c
++++ b/gas/config/tc-mips.c
+@@ -15513,10 +15513,29 @@ struct mips_option_stack
+ 
+ static struct mips_option_stack *mips_opts_stack;
+ 
+-static bfd_boolean
++/* Return status for .set/.module option handling.  */
++
++enum code_option_type
++{
++  /* Unrecognized option.  */
++  OPTION_TYPE_BAD = -1,
++
++  /* Ordinary option.  */
++  OPTION_TYPE_NORMAL,
++
++  /* ISA changing option.  */
++  OPTION_TYPE_ISA
++};
++
++/* Handle common .set/.module options.  Return status indicating option
++   type.  */
++
++static enum code_option_type
+ parse_code_option (char * name)
+ {
++  bfd_boolean isa_set = FALSE;
+   const struct mips_ase *ase;
++
+   if (strncmp (name, "at=", 3) == 0)
+     {
+       char *s = name + 3;
+@@ -15589,6 +15608,7 @@ parse_code_option (char * name)
+ 	    {
+ 	      mips_opts.arch = p->cpu;
+ 	      mips_opts.isa = p->isa;
++	      isa_set = TRUE;
+ 	    }
+ 	}
+       else if (strncmp (name, "mips", 4) == 0)
+@@ -15602,6 +15622,7 @@ parse_code_option (char * name)
+ 	    {
+ 	      mips_opts.arch = p->cpu;
+ 	      mips_opts.isa = p->isa;
++	      isa_set = TRUE;
+ 	    }
+ 	}
+       else
+@@ -15620,8 +15641,9 @@ parse_code_option (char * name)
+   else if (strcmp (name, "nosym32") == 0)
+     mips_opts.sym32 = FALSE;
+   else
+-    return FALSE;
+-  return TRUE;
++    return OPTION_TYPE_BAD;
++
++  return isa_set ? OPTION_TYPE_ISA : OPTION_TYPE_NORMAL;
+ }
+ 
+ /* Handle the .set pseudo-op.  */
+@@ -15629,8 +15651,8 @@ parse_code_option (char * name)
+ static void
+ s_mipsset (int x ATTRIBUTE_UNUSED)
+ {
++  enum code_option_type type = OPTION_TYPE_NORMAL;
+   char *name = input_line_pointer, ch;
+-  int prev_isa = mips_opts.isa;
+ 
+   file_mips_check_options ();
+ 
+@@ -15707,12 +15729,16 @@ s_mipsset (int x ATTRIBUTE_UNUSED)
+ 	  free (s);
+ 	}
+     }
+-  else if (!parse_code_option (name))
+-    as_warn (_("tried to set unrecognized symbol: %s\n"), name);
++  else
++    {
++      type = parse_code_option (name);
++      if (type == OPTION_TYPE_BAD)
++	as_warn (_("tried to set unrecognized symbol: %s\n"), name);
++    }
+ 
+   /* The use of .set [arch|cpu]= historically 'fixes' the width of gp and fp
+      registers based on what is supported by the arch/cpu.  */
+-  if (mips_opts.isa != prev_isa)
++  if (type == OPTION_TYPE_ISA)
+     {
+       switch (mips_opts.isa)
+ 	{
+@@ -15779,7 +15805,7 @@ s_module (int ignore ATTRIBUTE_UNUSED)
+ 
+   if (!file_mips_opts_checked)
+     {
+-      if (!parse_code_option (name))
++      if (parse_code_option (name) == OPTION_TYPE_BAD)
+ 	as_bad (_(".module used with unrecognized symbol: %s\n"), name);
+ 
+       /* Update module level settings from mips_opts.  */
+-- 
+1.7.1
+
-- 
2.8.1


