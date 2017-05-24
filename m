Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 662 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 May 2017 05:53:04 UTC
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id A049477CCC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 05:53:03 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym02.jp.fujitsu.com with smtp
	id 6e62_8099_05dce24f_7929_4a31_91b6_776773215719;
	Wed, 24 May 2017 14:41:58 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 85C83AC0104
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 14:41:57 +0900 (JST)
Received: from G01JPEXCHYT15.g01.fujitsu.local
	(G01JPEXCHYT15.g01.fujitsu.local [10.128.194.54])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	70440584303 for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 14:41:56 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT15.g01.fujitsu.local (10.128.194.54) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 24 May 2017 14:41:56 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 May 2017 14:43:11 +0900
Message-ID: <1495604591-11295-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH v3] binutils: Fix CVE-2017-8392
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
X-List-Received-Date: Wed, 24 May 2017 05:53:06 -0000
Content-Type: text/plain

Backport upsream commit to fix CVE-2017-8392

CVE: CVE-2017-8392

[BZ 21409] -- https://sourceware.org/bugzilla/show_bug.cgi?id=21409

        PR 21409, segfault in _bfd_dwarf2_find_nearest_line

        PR 21409
        * dwarf2.c (_bfd_dwarf2_find_nearest_line): Don't segfault when
        no symbols.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  2 +
 ...-lookup-of-file-line-information-for-erro.patch | 75 ++++++++++++++++++++++
 ...segfault-in-_bfd_dwarf2_find_nearest_line.patch | 33 ++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 7585da1..5492505 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -37,6 +37,8 @@ SRC_URI = "\
      file://0016-Detect-64-bit-MIPS-targets.patch \
      file://CVE-2017-6965.patch \
      file://CVE-2017-6966.patch \
+     file://0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch \
+     file://0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch b/meta/recipes-devtools/binutils/binutils/0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch
new file mode 100644
index 0000000..23ad10a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch
@@ -0,0 +1,75 @@
+From 3239a4231ff79bf8b67b8faaf414b1667486167c Mon Sep 17 00:00:00 2001
+From: Andrew Burgess <andrew.burgess@embecosm.com>
+Date: Mon, 19 Dec 2016 15:27:59 +0000
+Subject: [PATCH] bfd: Improve lookup of file / line information for errors
+
+When looking up file and line information (used from the linker to
+report error messages) if no symbol is passed in, then use the symbol
+list to look for a matching symbol.
+
+If a matching symbol is found then use this to look up the file / line
+information.
+
+This should improve errors when looking up file / line information for
+data sections.  Hopefully we should find a matching data symbol, which
+should, in turn (we hope) match a DW_TAG_variable in the DWARF, this
+should allow us to give accurate file / line errors for data symbols.
+
+As the hope is to find a matching DW_TAG_variable in the DWARF then we
+ignore section symbols, and prefer global symbols to locals.
+
+CVE: CVE-2017-8392
+Upstream-Status: Accepted
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ bfd/dwarf2.c                   | 32 ++++++++++++++++++++++++++++++++
+ 1 files changed, 32 insertions(+)
+
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 03447a9..9bb8126 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -4155,6 +4155,38 @@ _bfd_dwarf2_find_nearest_line (bfd *abfd,
+     {
+       BFD_ASSERT (section != NULL && functionname_ptr != NULL);
+       addr = offset;
++
++      /* If we have no SYMBOL but the section we're looking at is not a
++         code section, then take a look through the list of symbols to see
++         if we have a symbol at the address we're looking for.  If we do
++         then use this to look up line information.  This will allow us to
++         give file and line results for data symbols.  We exclude code
++         symbols here, if we look up a function symbol and then look up the
++         line information we'll actually return the line number for the
++         opening '{' rather than the function definition line.  This is
++         because looking up by symbol uses the line table, in which the
++         first line for a function is usually the opening '{', while
++         looking up the function by section + offset uses the
++         DW_AT_decl_line from the function DW_TAG_subprogram for the line,
++         which will be the line of the function name.  */
++      if ((section->flags & SEC_CODE) == 0)
++	{
++	  asymbol **tmp;
++
++	  for (tmp = symbols; (*tmp) != NULL; ++tmp)
++	    if ((*tmp)->the_bfd == abfd
++		&& (*tmp)->section == section
++		&& (*tmp)->value == offset
++		&& ((*tmp)->flags & BSF_SECTION_SYM) == 0)
++	      {
++		symbol = *tmp;
++		do_line = TRUE;
++                /* For local symbols, keep going in the hope we find a
++                   global.  */
++                if ((symbol->flags & BSF_GLOBAL) != 0)
++                  break;
++	      }
++	}
+     }
+ 
+   if (section->output_section)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch b/meta/recipes-devtools/binutils/binutils/0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch
new file mode 100644
index 0000000..acb37df
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch
@@ -0,0 +1,33 @@
+From 97e83a100aa8250be783304bfe0429761c6e6b6b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 23 Apr 2017 13:55:49 +0930
+Subject: [PATCH] PR 21409, segfault in _bfd_dwarf2_find_nearest_line
+
+	PR 21409
+	* dwarf2.c (_bfd_dwarf2_find_nearest_line): Don't segfault when
+	no symbols.
+
+CVE: CVE-2017-8392
+Upstream-Status: Accepted
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ bfd/dwarf2.c  | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 132a674..0ef3e1f 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -4205,7 +4205,7 @@ _bfd_dwarf2_find_nearest_line (bfd *abfd,
+          looking up the function by section + offset uses the
+          DW_AT_decl_line from the function DW_TAG_subprogram for the line,
+          which will be the line of the function name.  */
+-      if ((section->flags & SEC_CODE) == 0)
++      if (symbols != NULL && (section->flags & SEC_CODE) == 0)
+ 	{
+ 	  asymbol **tmp;
+ 
+-- 
+1.9.1
+
-- 
1.9.1


