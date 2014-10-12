Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 333FB718CC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:27:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2014 13:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,705,1406617200"; d="scan'208";a="613318013"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga002.fm.intel.com with ESMTP; 12 Oct 2014 13:27:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 21:27:14 +0100
Message-Id: <1e155330f6cf132997b91a7cfdfe7de319410566.1413145539.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1413145539.git.paul.eggleton@linux.intel.com>
References: <cover.1413145539.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1413145539.git.paul.eggleton@linux.intel.com>
References: <cover.1413145539.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 4/4] bash: Fix-for-CVE-2014-6278
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
X-List-Received-Date: Sun, 12 Oct 2014 20:27:47 -0000

From: Catalin Popeanga <Catalin.Popeanga@enea.com>

This vulnerability exists because of an incomplete fix for CVE-2014-6271, CVE-2014-7169, and CVE-2014-6277

See: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6278

(From OE-Core daisy rev: de596b5f31e837dcd2ce991245eb5548f12d72ae)

Signed-off-by: Catalin Popeanga <Catalin.Popeanga@enea.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../bash/bash-3.2.48/cve-2014-6278.patch           |  99 ++++++++++++++++
 .../bash/bash-4.2/cve-2014-6278.patch              | 127 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   1 +
 meta/recipes-extended/bash/bash_4.2.bb             |   1 +
 4 files changed, 228 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6278.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6278.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6278.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6278.patch
new file mode 100644
index 0000000..e51ce05
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-6278.patch
@@ -0,0 +1,99 @@
+bash: Fix CVE-2014-6278 (shellshock)
+ 
+Upstream-status: backport
+ 
+Downloaded from: 
+ftp://ftp.gnu.org/pub/bash/bash-3.2-patches/bash32-057
+
+Author: Chet Ramey <chet.ramey@case.edu>
+Signed-off-by: Catalin Popeanga <catalin.popeanga@enea.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-057
+
+Bug-Reported-by:	Michal Zalewski <lcamtuf@coredump.cx>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+A combination of nested command substitutions and function importing from
+the environment can cause bash to execute code appearing in the environment
+variable value following the function definition.
+
+--- a/builtins/evalstring.c	2014-09-16 19:08:02.000000000 -0400
++++ b/builtins/evalstring.c	2014-10-04 15:58:35.000000000 -0400
+@@ -44,4 +44,5 @@
+ #include "../redir.h"
+ #include "../trap.h"
++#include "../bashintl.h"
+ 
+ #if defined (HISTORY)
+@@ -235,10 +236,23 @@
+ 	      struct fd_bitmap *bitmap;
+ 
+-	      if ((flags & SEVAL_FUNCDEF) && command->type != cm_function_def)
++	      if (flags & SEVAL_FUNCDEF)
+ 		{
+-		  internal_warning ("%s: ignoring function definition attempt", from_file);
+-		  should_jump_to_top_level = 0;
+-		  last_result = last_command_exit_value = EX_BADUSAGE;
+-		  break;
++		  char *x;
++
++		  /* If the command parses to something other than a straight
++		     function definition, or if we have not consumed the entire
++		     string, or if the parser has transformed the function
++		     name (as parsing will if it begins or ends with shell
++		     whitespace, for example), reject the attempt */
++		  if (command->type != cm_function_def ||
++		      ((x = parser_remaining_input ()) && *x) ||
++		      (STREQ (from_file, command->value.Function_def->name->word) == 0))
++		    {
++		      internal_warning (_("%s: ignoring function definition attempt"), from_file);
++		      should_jump_to_top_level = 0;
++		      last_result = last_command_exit_value = EX_BADUSAGE;
++		      reset_parser ();
++		      break;
++		    }
+ 		}
+ 
+@@ -302,5 +316,8 @@
+ 
+ 	      if (flags & SEVAL_ONECMD)
+-		break;
++		{
++		  reset_parser ();
++		  break;
++		}
+ 	    }
+ 	}
+--- a/parse.y	2014-09-30 19:43:22.000000000 -0400
++++ b/parse.y	2014-10-04 15:58:35.000000000 -0400
+@@ -2125,4 +2125,14 @@
+ }
+ 
++char *
++parser_remaining_input ()
++{
++  if (shell_input_line == 0)
++    return 0;
++  if (shell_input_line_index < 0 || shell_input_line_index >= shell_input_line_len)
++    return '\0';	/* XXX */
++  return (shell_input_line + shell_input_line_index);
++}
++
+ #ifdef INCLUDE_UNUSED
+ /* Back the input pointer up by one, effectively `ungetting' a character. */
+--- a/shell.h	2008-04-28 22:00:24.000000000 -0400
++++ b/shell.h	2014-10-04 15:58:35.000000000 -0400
+@@ -161,4 +161,6 @@
+ 
+ /* Let's try declaring these here. */
++extern char *parser_remaining_input __P((void));
++
+ extern sh_parser_state_t *save_parser_state __P((sh_parser_state_t *));
+ extern void restore_parser_state __P((sh_parser_state_t *));
diff --git a/meta/recipes-extended/bash/bash-4.2/cve-2014-6278.patch b/meta/recipes-extended/bash/bash-4.2/cve-2014-6278.patch
new file mode 100644
index 0000000..b25314f
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/cve-2014-6278.patch
@@ -0,0 +1,127 @@
+bash: Fix CVE-2014-6278 (shellshock)
+ 
+Upstream-status: backport
+ 
+Downloaded from: 
+http://ftp.gnu.org/gnu/bash/bash-4.2-patches/bash42-053
+
+Author: Chet Ramey <chet.ramey@case.edu>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-053
+
+Bug-Reported-by:	Michal Zalewski <lcamtuf@coredump.cx>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+A combination of nested command substitutions and function importing from
+the environment can cause bash to execute code appearing in the environment
+variable value following the function definition.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2.52/builtins/evalstring.c	2014-09-16 19:35:45.000000000 -0400
+--- builtins/evalstring.c	2014-10-04 15:00:26.000000000 -0400
+***************
+*** 262,271 ****
+  	      struct fd_bitmap *bitmap;
+  
+! 	      if ((flags & SEVAL_FUNCDEF) && command->type != cm_function_def)
+  		{
+! 		  internal_warning ("%s: ignoring function definition attempt", from_file);
+! 		  should_jump_to_top_level = 0;
+! 		  last_result = last_command_exit_value = EX_BADUSAGE;
+! 		  break;
+  		}
+  
+--- 262,284 ----
+  	      struct fd_bitmap *bitmap;
+  
+! 	      if (flags & SEVAL_FUNCDEF)
+  		{
+! 		  char *x;
+! 
+! 		  /* If the command parses to something other than a straight
+! 		     function definition, or if we have not consumed the entire
+! 		     string, or if the parser has transformed the function
+! 		     name (as parsing will if it begins or ends with shell
+! 		     whitespace, for example), reject the attempt */
+! 		  if (command->type != cm_function_def ||
+! 		      ((x = parser_remaining_input ()) && *x) ||
+! 		      (STREQ (from_file, command->value.Function_def->name->word) == 0))
+! 		    {
+! 		      internal_warning (_("%s: ignoring function definition attempt"), from_file);
+! 		      should_jump_to_top_level = 0;
+! 		      last_result = last_command_exit_value = EX_BADUSAGE;
+! 		      reset_parser ();
+! 		      break;
+! 		    }
+  		}
+  
+***************
+*** 332,336 ****
+  
+  	      if (flags & SEVAL_ONECMD)
+! 		break;
+  	    }
+  	}
+--- 345,352 ----
+  
+  	      if (flags & SEVAL_ONECMD)
+! 		{
+! 		  reset_parser ();
+! 		  break;
+! 		}
+  	    }
+  	}
+*** ../bash-4.2.52/parse.y	2014-09-30 19:24:19.000000000 -0400
+--- parse.y	2014-10-04 15:00:26.000000000 -0400
+***************
+*** 2436,2439 ****
+--- 2436,2449 ----
+  }
+  
++ char *
++ parser_remaining_input ()
++ {
++   if (shell_input_line == 0)
++     return 0;
++   if (shell_input_line_index < 0 || shell_input_line_index >= shell_input_line_len)
++     return '\0';	/* XXX */
++   return (shell_input_line + shell_input_line_index);
++ }
++ 
+  #ifdef INCLUDE_UNUSED
+  /* Back the input pointer up by one, effectively `ungetting' a character. */
+***************
+*** 3891,3896 ****
+    /* reset_parser clears shell_input_line and associated variables */
+    restore_input_line_state (&ls);
+!   if (interactive)
+!     token_to_read = 0;
+  
+    /* Need to find how many characters parse_and_execute consumed, update
+--- 3901,3906 ----
+    /* reset_parser clears shell_input_line and associated variables */
+    restore_input_line_state (&ls);
+! 
+!   token_to_read = 0;
+  
+    /* Need to find how many characters parse_and_execute consumed, update
+*** ../bash-4.2.52/shell.h	2011-11-21 18:03:32.000000000 -0500
+--- shell.h	2014-10-04 15:00:26.000000000 -0400
+***************
+*** 178,181 ****
+--- 178,183 ----
+  
+  /* Let's try declaring these here. */
++ extern char *parser_remaining_input __P((void));
++ 
+  extern sh_parser_state_t *save_parser_state __P((sh_parser_state_t *));
+  extern void restore_parser_state __P((sh_parser_state_t *));
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 4bd97e7..d642abd 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://Fix-for-bash-exported-function-namespace-change.patch \
            file://cve-2014-7186_cve-2014-7187.patch \
            file://cve-2014-6277.patch \
+           file://cve-2014-6278.patch \
            file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 35af812..e2d391d 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://Fix-for-bash-exported-function-namespace-change.patch;striplevel=0 \
            file://cve-2014-7186_cve-2014-7187.patch;striplevel=0 \
            file://cve-2014-6277.patch \
+           file://cve-2014-6278.patch;striplevel=0 \
            file://run-ptest \
            "
 
-- 
1.9.3


