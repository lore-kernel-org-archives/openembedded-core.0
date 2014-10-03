Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1F7708B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 14:51:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s93EpR3C015170
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Oct 2014 07:51:28 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 3 Oct 2014 07:51:27 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Oct 2014 09:51:25 -0500
Message-ID: <1412347885-57716-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1412347885-57716-1-git-send-email-mark.hatle@windriver.com>
References: <1412347885-57716-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] bash: Upgrade bash to latest patch level to fix CVEs
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
X-List-Received-Date: Fri, 03 Oct 2014 14:51:27 -0000
Content-Type: text/plain

We upgrade bash_4.3 to patch revision 29, and bash_3.2.48 to 56.

There are numerous community bug fixes included with this set, but the key
items are:

bash32-052      CVE-2014-6271                           9/24/2014
bash32-053      CVE-2014-7169                           9/26/2014
bash32-054      exported function namespace change      9/27/2014
bash32-055      CVE-2014-7186/CVE-2014-7187             10/1/2014
bash32-056      CVE-2014-6277                           10/2/2014

bash43-025      CVE-2014-6271                           9/24/2014
bash43-026      CVE-2014-7169                           9/26/2014
bash43-027      exported function namespace change      9/27/2014
bash43-028      CVE-2014-7186/CVE-2014-7187             10/1/2014
bash43-029      CVE-2014-6277                           10/2/2014

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../bash/bash-3.2.48/cve-2014-6271.patch           |  77 --------------
 .../bash/bash-3.2.48/cve-2014-7169.patch           |  16 ---
 .../recipes-extended/bash/bash/cve-2014-6271.patch | 114 ---------------------
 .../recipes-extended/bash/bash/cve-2014-7169.patch |  16 ---
 meta/recipes-extended/bash/bash_3.2.48.bb          |  38 ++++---
 meta/recipes-extended/bash/bash_4.3.bb             |  90 +++++++++++++++-
 6 files changed, 112 insertions(+), 239 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
 delete mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
 delete mode 100644 meta/recipes-extended/bash/bash/cve-2014-6271.patch
 delete mode 100644 meta/recipes-extended/bash/bash/cve-2014-7169.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
deleted file mode 100644
index 7226ffb..0000000
--- a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-Fix CVE-2014-6271, aka ShellShock.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-*** ../bash-3.2.51/builtins/common.h	2006-03-06 09:38:44.000000000 -0500
---- builtins/common.h	2014-09-16 19:08:02.000000000 -0400
-***************
-*** 34,37 ****
---- 34,39 ----
-  
-  /* Flags for describe_command, shared between type.def and command.def */
-+ #define SEVAL_FUNCDEF	0x080		/* only allow function definitions */
-+ #define SEVAL_ONECMD	0x100		/* only allow a single command */
-  #define CDESC_ALL		0x001	/* type -a */
-  #define CDESC_SHORTDESC		0x002	/* command -V */
-*** ../bash-3.2.51/builtins/evalstring.c	2008-11-15 17:47:04.000000000 -0500
---- builtins/evalstring.c	2014-09-16 19:08:02.000000000 -0400
-***************
-*** 235,238 ****
---- 235,246 ----
-  	      struct fd_bitmap *bitmap;
-  
-+ 	      if ((flags & SEVAL_FUNCDEF) && command->type != cm_function_def)
-+ 		{
-+ 		  internal_warning ("%s: ignoring function definition attempt", from_file);
-+ 		  should_jump_to_top_level = 0;
-+ 		  last_result = last_command_exit_value = EX_BADUSAGE;
-+ 		  break;
-+ 		}
-+ 
-  	      bitmap = new_fd_bitmap (FD_BITMAP_SIZE);
-  	      begin_unwind_frame ("pe_dispose");
-***************
-*** 292,295 ****
---- 300,306 ----
-  	      dispose_fd_bitmap (bitmap);
-  	      discard_unwind_frame ("pe_dispose");
-+ 
-+ 	      if (flags & SEVAL_ONECMD)
-+ 		break;
-  	    }
-  	}
-*** ../bash-3.2.51/variables.c	2008-11-15 17:15:06.000000000 -0500
---- variables.c	2014-09-16 19:10:39.000000000 -0400
-***************
-*** 319,328 ****
-  	  strcpy (temp_string + char_index + 1, string);
-  
-! 	  parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST);
-! 
-! 	  /* Ancient backwards compatibility.  Old versions of bash exported
-! 	     functions like name()=() {...} */
-! 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '(')
-! 	    name[char_index - 2] = '\0';
-  
-  	  if (temp_var = find_function (name))
---- 319,326 ----
-  	  strcpy (temp_string + char_index + 1, string);
-  
-! 	  /* Don't import function names that are invalid identifiers from the
-! 	     environment. */
-! 	  if (legal_identifier (name))
-! 	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
-  
-  	  if (temp_var = find_function (name))
-***************
-*** 333,340 ****
-  	  else
-  	    report_error (_("error importing function definition for `%s'"), name);
-- 
-- 	  /* ( */
-- 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '\0')
-- 	    name[char_index - 2] = '(';		/* ) */
-  	}
-  #if defined (ARRAY_VARS)
---- 331,334 ----
diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
deleted file mode 100644
index 2e734de..0000000
--- a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
-
-Upstream-Status: Backport
-Index: bash-3.2.48/parse.y
-===================================================================
---- bash-3.2.48.orig/parse.y	2008-04-29 18:24:55.000000000 -0700
-+++ bash-3.2.48/parse.y	2014-09-26 13:07:31.956080056 -0700
-@@ -2503,6 +2503,8 @@
-   FREE (word_desc_to_read);
-   word_desc_to_read = (WORD_DESC *)NULL;
- 
-+  eol_ungetc_lookahead = 0;
-+
-   last_read_token = '\n';
-   token_to_read = '\n';
- }
diff --git a/meta/recipes-extended/bash/bash/cve-2014-6271.patch b/meta/recipes-extended/bash/bash/cve-2014-6271.patch
deleted file mode 100644
index d33a5c8..0000000
--- a/meta/recipes-extended/bash/bash/cve-2014-6271.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-Fix CVE-2014-6271, aka ShellShock.  This is the upstream 4.3 patchlevel 25, minus the hunk to
-set the patch level.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-			     BASH PATCH REPORT
-			     =================
-
-Bash-Release:	4.3
-Patch-ID:	bash43-025
-
-Bug-Reported-by:	Stephane Chazelas <stephane.chazelas@gmail.com>
-Bug-Reference-ID:
-Bug-Reference-URL:
-
-Bug-Description:
-
-Under certain circumstances, bash will execute user code while processing the
-environment for exported function definitions.
-
-Patch (apply with `patch -p0'):
-
-*** ../bash-4.3-patched/builtins/common.h	2013-07-08 16:54:47.000000000 -0400
---- builtins/common.h	2014-09-12 14:25:47.000000000 -0400
-***************
-*** 34,37 ****
---- 49,54 ----
-  #define SEVAL_PARSEONLY	0x020
-  #define SEVAL_NOLONGJMP 0x040
-+ #define SEVAL_FUNCDEF	0x080		/* only allow function definitions */
-+ #define SEVAL_ONECMD	0x100		/* only allow a single command */
-  
-  /* Flags for describe_command, shared between type.def and command.def */
-*** ../bash-4.3-patched/builtins/evalstring.c	2014-02-11 09:42:10.000000000 -0500
---- builtins/evalstring.c	2014-09-14 14:15:13.000000000 -0400
-***************
-*** 309,312 ****
---- 313,324 ----
-  	      struct fd_bitmap *bitmap;
-  
-+ 	      if ((flags & SEVAL_FUNCDEF) && command->type != cm_function_def)
-+ 		{
-+ 		  internal_warning ("%s: ignoring function definition attempt", from_file);
-+ 		  should_jump_to_top_level = 0;
-+ 		  last_result = last_command_exit_value = EX_BADUSAGE;
-+ 		  break;
-+ 		}
-+ 
-  	      bitmap = new_fd_bitmap (FD_BITMAP_SIZE);
-  	      begin_unwind_frame ("pe_dispose");
-***************
-*** 369,372 ****
---- 381,387 ----
-  	      dispose_fd_bitmap (bitmap);
-  	      discard_unwind_frame ("pe_dispose");
-+ 
-+ 	      if (flags & SEVAL_ONECMD)
-+ 		break;
-  	    }
-  	}
-*** ../bash-4.3-patched/variables.c	2014-05-15 08:26:50.000000000 -0400
---- variables.c	2014-09-14 14:23:35.000000000 -0400
-***************
-*** 359,369 ****
-  	  strcpy (temp_string + char_index + 1, string);
-  
-! 	  if (posixly_correct == 0 || legal_identifier (name))
-! 	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST);
-! 
-! 	  /* Ancient backwards compatibility.  Old versions of bash exported
-! 	     functions like name()=() {...} */
-! 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '(')
-! 	    name[char_index - 2] = '\0';
-  
-  	  if (temp_var = find_function (name))
---- 364,372 ----
-  	  strcpy (temp_string + char_index + 1, string);
-  
-! 	  /* Don't import function names that are invalid identifiers from the
-! 	     environment, though we still allow them to be defined as shell
-! 	     variables. */
-! 	  if (legal_identifier (name))
-! 	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
-  
-  	  if (temp_var = find_function (name))
-***************
-*** 382,389 ****
-  	      report_error (_("error importing function definition for `%s'"), name);
-  	    }
-- 
-- 	  /* ( */
-- 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '\0')
-- 	    name[char_index - 2] = '(';		/* ) */
-  	}
-  #if defined (ARRAY_VARS)
---- 385,388 ----
-*** ../bash-4.3-patched/subst.c	2014-08-11 11:16:35.000000000 -0400
---- subst.c	2014-09-12 15:31:04.000000000 -0400
-***************
-*** 8048,8052 ****
-  	  goto return0;
-  	}
-!       else if (var = find_variable_last_nameref (temp1))
-  	{
-  	  temp = nameref_cell (var);
---- 8118,8124 ----
-  	  goto return0;
-  	}
-!       else if (var && (invisible_p (var) || var_isset (var) == 0))
-! 	temp = (char *)NULL;
-!       else if ((var = find_variable_last_nameref (temp1)) && var_isset (var) && invisible_p (var) == 0)
-  	{
-  	  temp = nameref_cell (var);
diff --git a/meta/recipes-extended/bash/bash/cve-2014-7169.patch b/meta/recipes-extended/bash/bash/cve-2014-7169.patch
deleted file mode 100644
index 3c69121..0000000
--- a/meta/recipes-extended/bash/bash/cve-2014-7169.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
-
-Upstream-Status: Backport
-Index: bash-4.3/parse.y
-===================================================================
---- bash-4.3.orig/parse.y	2014-09-26 13:10:44.340080056 -0700
-+++ bash-4.3/parse.y	2014-09-26 13:11:44.764080056 -0700
-@@ -2953,6 +2953,8 @@
-   FREE (word_desc_to_read);
-   word_desc_to_read = (WORD_DESC *)NULL;
- 
-+  eol_ungetc_lookahead = 0;
-+
-   current_token = '\n';		/* XXX */
-   last_read_token = '\n';
-   token_to_read = '\n';
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index e6a04cd..77f2514 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -6,25 +6,35 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
 PR = "r11"
 
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch002 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch049 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch050 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch051 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-052;apply=yes;striplevel=0;name=patch052 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-053;apply=yes;striplevel=0;name=patch053 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-054;apply=yes;striplevel=0;name=patch054 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-055;apply=yes;striplevel=0;name=patch055 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-056;apply=yes;striplevel=0;name=patch056 \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
-           file://cve-2014-6271.patch;striplevel=0 \
-           file://cve-2014-7169.patch \
            file://run-ptest \
           "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
 SRC_URI[tarball.sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
-SRC_URI[patch001.md5sum] = "af571a2d164d5abdcae4499e94e8892c"
-SRC_URI[patch001.sha256sum] = "b1217ed94bdb95dc878fa5cabbf8a164435eb0d9da23a392198f48566ee34a2f"
-SRC_URI[patch002.md5sum] = "8443d4385d73ec835abe401d90591377"
-SRC_URI[patch002.sha256sum] = "081bb03c580ecee63ba03b40beb3caf509eca29515b2e8dd3c078503609a1642"
-SRC_URI[patch003.md5sum] = "15c6653042e9814aa87120098fc7a849"
-SRC_URI[patch003.sha256sum] = "354886097cd95b4def77028f32ee01e2e088d58a98184fede9d3ce9320e218ef"
-
-SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
-SRC_URI[sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
+SRC_URI[patch049.md5sum] = "af571a2d164d5abdcae4499e94e8892c"
+SRC_URI[patch049.sha256sum] = "b1217ed94bdb95dc878fa5cabbf8a164435eb0d9da23a392198f48566ee34a2f"
+SRC_URI[patch050.md5sum] = "8443d4385d73ec835abe401d90591377"
+SRC_URI[patch050.sha256sum] = "081bb03c580ecee63ba03b40beb3caf509eca29515b2e8dd3c078503609a1642"
+SRC_URI[patch051.md5sum] = "15c6653042e9814aa87120098fc7a849"
+SRC_URI[patch051.sha256sum] = "354886097cd95b4def77028f32ee01e2e088d58a98184fede9d3ce9320e218ef"
+SRC_URI[patch052.md5sum] = "691023a944bbb9003cc92ad462d91fa1"
+SRC_URI[patch052.sha256sum] = "a0eccf9ceda50871db10d21efdd74b99e35efbd55c970c400eeade012816bb61"
+SRC_URI[patch053.md5sum] = "eb97d1c9230a55283d9dac69d3de2e46"
+SRC_URI[patch053.sha256sum] = "fe6f0e96e0b966eaed9fb5e930ca12891f4380f30f9e0a773d200ff2063a864e"
+SRC_URI[patch054.md5sum] = "1107744058c43b247f597584b88ba0a6"
+SRC_URI[patch054.sha256sum] = "c6dab911e85688c542ce75afc175dbb4e5011de5102758e19a4a80dac1e79359"
+SRC_URI[patch055.md5sum] = "05d201176d3499e2dfa4a73d09d42f05"
+SRC_URI[patch055.sha256sum] = "c0e816700837942ed548da74e5917f74b70cbbbb10c9f2caf73e8e06a0713d0a"
+SRC_URI[patch056.md5sum] = "222eaa3a2c26f54a15aa5e08817a534a"
+SRC_URI[patch056.sha256sum] = "063a8d8d74e4407bf07a32b965b8ef6d213a66abdb6af26cc3584a437a56bbb4"
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 69ddecc..9e5b3de 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -5,16 +5,102 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-001;apply=yes;striplevel=0;name=patch001 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-002;apply=yes;striplevel=0;name=patch002 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-003;apply=yes;striplevel=0;name=patch003 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-004;apply=yes;striplevel=0;name=patch004 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-005;apply=yes;striplevel=0;name=patch005 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-006;apply=yes;striplevel=0;name=patch006 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-007;apply=yes;striplevel=0;name=patch007 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-008;apply=yes;striplevel=0;name=patch008 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-009;apply=yes;striplevel=0;name=patch009 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-010;apply=yes;striplevel=0;name=patch010 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-011;apply=yes;striplevel=0;name=patch011 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-012;apply=yes;striplevel=0;name=patch012 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-013;apply=yes;striplevel=0;name=patch013 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-014;apply=yes;striplevel=0;name=patch014 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-015;apply=yes;striplevel=0;name=patch015 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-016;apply=yes;striplevel=0;name=patch016 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-017;apply=yes;striplevel=0;name=patch017 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-018;apply=yes;striplevel=0;name=patch018 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-019;apply=yes;striplevel=0;name=patch019 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-020;apply=yes;striplevel=0;name=patch020 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-021;apply=yes;striplevel=0;name=patch021 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-022;apply=yes;striplevel=0;name=patch022 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-023;apply=yes;striplevel=0;name=patch023 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-024;apply=yes;striplevel=0;name=patch024 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-025;apply=yes;striplevel=0;name=patch025 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-026;apply=yes;striplevel=0;name=patch026 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-027;apply=yes;striplevel=0;name=patch027 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-028;apply=yes;striplevel=0;name=patch028 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-029;apply=yes;striplevel=0;name=patch029 \
            file://execute_cmd.patch;striplevel=0 \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
-           file://cve-2014-6271.patch;striplevel=0 \
-           file://cve-2014-7169.patch \
            file://run-ptest \
            "
 
 SRC_URI[tarball.md5sum] = "81348932d5da294953e15d4814c74dd1"
 SRC_URI[tarball.sha256sum] = "afc687a28e0e24dc21b988fa159ff9dbcf6b7caa92ade8645cc6d5605cd024d4"
 
+SRC_URI[patch001.md5sum] = "1ab682b4e36afa4cf1b426aa7ac81c0d"
+SRC_URI[patch001.sha256sum] = "ecb3dff2648667513e31554b3ad054ccd89fce38e33367c9459ac3a285153742"
+SRC_URI[patch002.md5sum] = "8fc22cf50ec85da00f6af3d66f7ddc1b"
+SRC_URI[patch002.sha256sum] = "eee7cd7062ab29a9e4f02924d9c367264dcb8b162703f74ff6eb8f175a91502b"
+SRC_URI[patch003.md5sum] = "a41728eca78858758e26b5dea64ae506"
+SRC_URI[patch003.sha256sum] = "000e6eac50cd9053ce0630db01239dcdead04a2c2c351c47e2b51dac1ac1087d"
+SRC_URI[patch004.md5sum] = "bf8d53d227829d67235927689a03cc7a"
+SRC_URI[patch004.sha256sum] = "5ea0a42c6506720d26e6d3c5c358e9a0d49f6f189d69a8ed34d5935964821338"
+SRC_URI[patch005.md5sum] = "c0c00935c8b8ffff76e8ab77e7be7d15"
+SRC_URI[patch005.sha256sum] = "1ac83044032b9f5f11aeca8a344ae3c524ec2156185d3adbb8ad3e7a165aa3fa"
+SRC_URI[patch006.md5sum] = "6f01e364cd092faa28dd7119f47ddb5f"
+SRC_URI[patch006.sha256sum] = "a0648ee72d15e4a90c8b77a5c6b19f8d89e28c1bc881657d22fe26825f040213"
+SRC_URI[patch007.md5sum] = "dcf471d222bcd83283d3094e6ceeb6f8"
+SRC_URI[patch007.sha256sum] = "1113e321c59cf6a8648a36245bbe4217cf8acf948d71e67886dad7d486f8f3a3"
+SRC_URI[patch008.md5sum] = "f7553416646dc26c266454c78a916d36"
+SRC_URI[patch008.sha256sum] = "9941a98a4987192cc5ce3d45afe879983cad2f0bec96d441a4edd9033767f95e"
+SRC_URI[patch009.md5sum] = "7e73d2151f4064b484a4ba2c4b09960e"
+SRC_URI[patch009.sha256sum] = "c0226d6728946b2f53cdebf090bcd1c01627f01fee03295768605caa80bb40a5"
+SRC_URI[patch010.md5sum] = "a275463d21735bb6d7161f9fbd320d8f"
+SRC_URI[patch010.sha256sum] = "ce05799c0137314c70c7b6ea0477c90e1ac1d52e113344be8e32fa5a55c9f0b7"
+SRC_URI[patch011.md5sum] = "c17103ee20420d77e46b224c8d3fceda"
+SRC_URI[patch011.sha256sum] = "7c63402cdbc004a210f6c1c527b63b13d8bb9ec9c5a43d5c464a9010ff6f7f3b"
+SRC_URI[patch012.md5sum] = "3e2a057a19d02b3f92a3a09eacbc03ae"
+SRC_URI[patch012.sha256sum] = "3e1379030b35fbcf314e9e7954538cf4b43be1507142b29efae39eef997b8c12"
+SRC_URI[patch013.md5sum] = "fb377143a996d4ff087a2771bc8332f9"
+SRC_URI[patch013.sha256sum] = "bfa8ca5336ab1f5ef988434a4bdedf71604aa8a3659636afa2ce7c7446c42c79"
+SRC_URI[patch014.md5sum] = "1a1aaecc99a9d0cbc310e8e247dcc8b6"
+SRC_URI[patch014.sha256sum] = "5a4d6fa2365b6eb725a9d4966248b5edf7630a4aeb3fa8d526b877972658ac13"
+SRC_URI[patch015.md5sum] = "4f04387458a3c1b4d460d199f49991a8"
+SRC_URI[patch015.sha256sum] = "13293e8a24e003a44d7fe928c6b1e07b444511bed2d9406407e006df28355e8d"
+SRC_URI[patch016.md5sum] = "90e759709720c4f877525bebc9d5dc06"
+SRC_URI[patch016.sha256sum] = "92d60bcf49f61bd7f1ccb9602bead6f2c9946d79dea0e5ec0589bb3bfa5e0773"
+SRC_URI[patch017.md5sum] = "11e4046e1b86070f6adbb7ffc89641be"
+SRC_URI[patch017.sha256sum] = "1267c25c6b5ba57042a7bb6c569a6de02ffd0d29530489a16666c3b8a23e7780"
+SRC_URI[patch018.md5sum] = "cd5a9b46f5bea0dc0248c93c7dfac011"
+SRC_URI[patch018.sha256sum] = "7aa8b40a9e973931719d8cc72284a8fb3292b71b522db57a5a79052f021a3d58"
+SRC_URI[patch019.md5sum] = "cff4dc024d9d3456888aaaf8a36ca774"
+SRC_URI[patch019.sha256sum] = "a7a91475228015d676cafa86d2d7aa9c5d2139aa51485b6bbdebfdfbcf0d2d23"
+SRC_URI[patch020.md5sum] = "167839c5f147347f4a03d88ab97ff787"
+SRC_URI[patch020.sha256sum] = "ca5e86d87f178128641fe91f2f094875b8c1eb2de9e0d2e9154f5d5cc0336c98"
+SRC_URI[patch021.md5sum] = "1d350671c48dec30b34d8b81f09cd79d"
+SRC_URI[patch021.sha256sum] = "41439f06883e6bd11c591d9d5e9ae08afbc2abd4b935e1d244b08100076520a9"
+SRC_URI[patch022.md5sum] = "11c349af66a55481a3215ef2520bec36"
+SRC_URI[patch022.sha256sum] = "fd4d47bb95c65863f634c4706c65e1e3bae4ee8460c72045c0a0618689061a88"
+SRC_URI[patch023.md5sum] = "b3cb0d80fd0c47728264405cbb3b23c7"
+SRC_URI[patch023.sha256sum] = "9ac250c7397a8f53dbc84dfe790d2a418fbf1fe090bcece39b4a5c84a2d300d4"
+SRC_URI[patch024.md5sum] = "b5ea5600942acceb4b6f07313d2de74e"
+SRC_URI[patch024.sha256sum] = "3b505882a0a6090667d75824fc919524cd44cc3bd89dd08b7c4e622d3f960f6c"
+SRC_URI[patch025.md5sum] = "193c06f578d38ffdbaebae9c51a7551f"
+SRC_URI[patch025.sha256sum] = "1e5186f5c4a619bb134a1177d9e9de879f3bb85d9c5726832b03a762a2499251"
+SRC_URI[patch026.md5sum] = "922578e2be7ed03729454e92ee8d3f3a"
+SRC_URI[patch026.sha256sum] = "2ecc12201b3ba4273b63af4e9aad2305168cf9babf6d11152796db08724c214d"
+SRC_URI[patch027.md5sum] = "8ff6948b16f2db5c29b1b9ae1085bbe7"
+SRC_URI[patch027.sha256sum] = "1eb76ad28561d27f7403ff3c76a36e932928a4b58a01b868d663c165f076dabe"
+SRC_URI[patch028.md5sum] = "dd51fa67913b5dca45a702b672b3323f"
+SRC_URI[patch028.sha256sum] = "e8b0dbed4724fa7b9bd8ff77d12c7f03da0fbfc5f8251ef5cb8511eb082b469d"
+SRC_URI[patch029.md5sum] = "0729364c977ef4271e9f8dfafadacf67"
+SRC_URI[patch029.sha256sum] = "4cc4a397fe6bc63ecb97d030a4e44258ef2d4e076d0e90c77782968cc43d6292"
+
 BBCLASSEXTEND = "nativesdk"
-- 
1.9.3


