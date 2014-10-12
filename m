Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 85021718D4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:31:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2014 13:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,705,1406617200"; d="scan'208";a="604214968"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2014 13:31:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 21:31:26 +0100
Message-Id: <d57b9ce8bb97f88c329da973c3567d04d8eb07d2.1413145831.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1413145831.git.paul.eggleton@linux.intel.com>
References: <cover.1413145831.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1413145831.git.paul.eggleton@linux.intel.com>
References: <cover.1413145831.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/6] bash: fix CVE-2014-6271
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
X-List-Received-Date: Sun, 12 Oct 2014 20:31:54 -0000

From: Ross Burton <ross.burton@intel.com>

CVE-2014-6271 aka ShellShock.

"GNU Bash through 4.3 processes trailing strings after function definitions in
the values of environment variables, which allows remote attackers to execute
arbitrary code via a crafted environment."

(From OE-Core master rev: 798d833c9d4bd9ab287fa86b85b4d5f128170ed3)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../bash/bash-3.2.48/cve-2014-6271.patch           | 77 ++++++++++++++++++
 .../bash/bash-4.2/cve-2014-6271.patch              | 95 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |  1 +
 meta/recipes-extended/bash/bash_4.2.bb             |  1 +
 4 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6271.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
new file mode 100644
index 0000000..7226ffb
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
@@ -0,0 +1,77 @@
+Fix CVE-2014-6271, aka ShellShock.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+*** ../bash-3.2.51/builtins/common.h	2006-03-06 09:38:44.000000000 -0500
+--- builtins/common.h	2014-09-16 19:08:02.000000000 -0400
+***************
+*** 34,37 ****
+--- 34,39 ----
+  
+  /* Flags for describe_command, shared between type.def and command.def */
++ #define SEVAL_FUNCDEF	0x080		/* only allow function definitions */
++ #define SEVAL_ONECMD	0x100		/* only allow a single command */
+  #define CDESC_ALL		0x001	/* type -a */
+  #define CDESC_SHORTDESC		0x002	/* command -V */
+*** ../bash-3.2.51/builtins/evalstring.c	2008-11-15 17:47:04.000000000 -0500
+--- builtins/evalstring.c	2014-09-16 19:08:02.000000000 -0400
+***************
+*** 235,238 ****
+--- 235,246 ----
+  	      struct fd_bitmap *bitmap;
+  
++ 	      if ((flags & SEVAL_FUNCDEF) && command->type != cm_function_def)
++ 		{
++ 		  internal_warning ("%s: ignoring function definition attempt", from_file);
++ 		  should_jump_to_top_level = 0;
++ 		  last_result = last_command_exit_value = EX_BADUSAGE;
++ 		  break;
++ 		}
++ 
+  	      bitmap = new_fd_bitmap (FD_BITMAP_SIZE);
+  	      begin_unwind_frame ("pe_dispose");
+***************
+*** 292,295 ****
+--- 300,306 ----
+  	      dispose_fd_bitmap (bitmap);
+  	      discard_unwind_frame ("pe_dispose");
++ 
++ 	      if (flags & SEVAL_ONECMD)
++ 		break;
+  	    }
+  	}
+*** ../bash-3.2.51/variables.c	2008-11-15 17:15:06.000000000 -0500
+--- variables.c	2014-09-16 19:10:39.000000000 -0400
+***************
+*** 319,328 ****
+  	  strcpy (temp_string + char_index + 1, string);
+  
+! 	  parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST);
+! 
+! 	  /* Ancient backwards compatibility.  Old versions of bash exported
+! 	     functions like name()=() {...} */
+! 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '(')
+! 	    name[char_index - 2] = '\0';
+  
+  	  if (temp_var = find_function (name))
+--- 319,326 ----
+  	  strcpy (temp_string + char_index + 1, string);
+  
+! 	  /* Don't import function names that are invalid identifiers from the
+! 	     environment. */
+! 	  if (legal_identifier (name))
+! 	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+  
+  	  if (temp_var = find_function (name))
+***************
+*** 333,340 ****
+  	  else
+  	    report_error (_("error importing function definition for `%s'"), name);
+- 
+- 	  /* ( */
+- 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '\0')
+- 	    name[char_index - 2] = '(';		/* ) */
+  	}
+  #if defined (ARRAY_VARS)
+--- 331,334 ----
diff --git a/meta/recipes-extended/bash/bash-4.2/cve-2014-6271.patch b/meta/recipes-extended/bash/bash-4.2/cve-2014-6271.patch
new file mode 100644
index 0000000..20530ad
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/cve-2014-6271.patch
@@ -0,0 +1,95 @@
+Fix CVE-2014-6271, aka ShellShock.  This is the upstream 4.2 patchlevel 48, minus the hunk to
+set the patch level.
+
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-048
+
+Bug-Reported-by:	Stephane Chazelas <stephane.chazelas@gmail.com>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+Under certain circumstances, bash will execute user code while processing the
+environment for exported function definitions.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2.47/builtins/common.h	2010-05-30 18:31:51.000000000 -0400
+--- builtins/common.h	2014-09-16 19:35:45.000000000 -0400
+***************
+*** 36,39 ****
+--- 36,41 ----
+  
+  /* Flags for describe_command, shared between type.def and command.def */
++ #define SEVAL_FUNCDEF	0x080		/* only allow function definitions */
++ #define SEVAL_ONECMD	0x100		/* only allow a single command */
+  #define CDESC_ALL		0x001	/* type -a */
+  #define CDESC_SHORTDESC		0x002	/* command -V */
+*** ../bash-4.2.47/builtins/evalstring.c	2010-11-23 08:22:15.000000000 -0500
+--- builtins/evalstring.c	2014-09-16 19:35:45.000000000 -0400
+***************
+*** 262,265 ****
+--- 262,273 ----
+  	      struct fd_bitmap *bitmap;
+  
++ 	      if ((flags & SEVAL_FUNCDEF) && command->type != cm_function_def)
++ 		{
++ 		  internal_warning ("%s: ignoring function definition attempt", from_file);
++ 		  should_jump_to_top_level = 0;
++ 		  last_result = last_command_exit_value = EX_BADUSAGE;
++ 		  break;
++ 		}
++ 
+  	      bitmap = new_fd_bitmap (FD_BITMAP_SIZE);
+  	      begin_unwind_frame ("pe_dispose");
+***************
+*** 322,325 ****
+--- 330,336 ----
+  	      dispose_fd_bitmap (bitmap);
+  	      discard_unwind_frame ("pe_dispose");
++ 
++ 	      if (flags & SEVAL_ONECMD)
++ 		break;
+  	    }
+  	}
+*** ../bash-4.2.47/variables.c	2011-03-01 16:15:20.000000000 -0500
+--- variables.c	2014-09-16 19:35:45.000000000 -0400
+***************
+*** 348,357 ****
+  	  strcpy (temp_string + char_index + 1, string);
+  
+! 	  parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST);
+! 
+! 	  /* Ancient backwards compatibility.  Old versions of bash exported
+! 	     functions like name()=() {...} */
+! 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '(')
+! 	    name[char_index - 2] = '\0';
+  
+  	  if (temp_var = find_function (name))
+--- 348,355 ----
+  	  strcpy (temp_string + char_index + 1, string);
+  
+! 	  /* Don't import function names that are invalid identifiers from the
+! 	     environment. */
+! 	  if (legal_identifier (name))
+! 	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+  
+  	  if (temp_var = find_function (name))
+***************
+*** 362,369 ****
+  	  else
+  	    report_error (_("error importing function definition for `%s'"), name);
+- 
+- 	  /* ( */
+- 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '\0')
+- 	    name[char_index - 2] = '(';		/* ) */
+  	}
+  #if defined (ARRAY_VARS)
+--- 360,363 ----
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 4e6f0f3..cbe1ee6 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch002 \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003 \
            file://mkbuiltins_have_stringize.patch \
+           file://cve-2014-6271.patch;striplevel=0 \
           "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index fefe7b7..83294b0 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-010;apply=yes;striplevel=0;name=patch010 \
            file://execute_cmd.patch;striplevel=0 \
            file://mkbuiltins_have_stringize.patch \
+           file://cve-2014-6271.patch;striplevel=0 \
            file://build-tests.patch \
            file://test-output.patch \
            file://run-ptest \
-- 
1.9.3


