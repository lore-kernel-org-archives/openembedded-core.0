Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 62CDF609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 23:13:28 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id fb4so69030wid.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 16:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ywhpf/92vQgAR5oTZVhBYsjep/LZ9xvMdbBZ6i94e24=;
	b=JsrcfAIYHNZIJs98GOV5WWDDHDjNj9OSHbLjIwB4VDiSIE9g/gIZqvTeOKszEAV8Pw
	IiEqPN6nmNc//LPLtjO8R/hcPYAdtj7/aKR1jy2IjcXasrPn677qZ0bEULXlwA/T7y45
	+QYeWUSdcd9DmsHOCxIwYSKwq6SCl/4W0hGBouzwhkYyNb3FFrlsWC3ajvQh62jPfLHz
	nYbIWX/Etbba4TvaSrKgLiYIo50s/bP+u24kbCS6hEPJ9Ln9tpoCX9hF+cY/m8CtkRu8
	b2S8OkYV5J6YhWj3nGBXQJFvaOVAC1gWEjQESBEhYPmCCg0AZhh3cWz0E0lHJgkiyVRN
	rXxA==
X-Gm-Message-State: ALoCoQmNE4iyHQ1Rtz84j7GnjbrmmOZQYksBvt6WeKjtcjtAN+1Q9V+ibFQq0GKQB3h14xBp/bbR
X-Received: by 10.180.102.233 with SMTP id fr9mr41364116wib.80.1411686809328; 
	Thu, 25 Sep 2014 16:13:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id kx2sm4231828wjb.6.2014.09.25.16.13.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Sep 2014 16:13:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Sep 2014 00:13:23 +0100
Message-Id: <1411686803-13274-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411686803-13274-1-git-send-email-ross.burton@intel.com>
References: <1411686803-13274-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] bash: fix CVE-2014-6271
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
X-List-Received-Date: Thu, 25 Sep 2014 23:13:33 -0000

CVE-2014-6271 aka ShellShock.

"GNU Bash through 4.3 processes trailing strings after function definitions in
the values of environment variables, which allows remote attackers to execute
arbitrary code via a crafted environment."

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../bash/bash-3.2.48/cve-2014-6271.patch           |   77 +++++++++++++
 .../recipes-extended/bash/bash/cve-2014-6271.patch |  114 ++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |    1 +
 meta/recipes-extended/bash/bash_4.3.bb             |    1 +
 4 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/bash/bash/cve-2014-6271.patch

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
diff --git a/meta/recipes-extended/bash/bash/cve-2014-6271.patch b/meta/recipes-extended/bash/bash/cve-2014-6271.patch
new file mode 100644
index 0000000..d33a5c8
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/cve-2014-6271.patch
@@ -0,0 +1,114 @@
+Fix CVE-2014-6271, aka ShellShock.  This is the upstream 4.3 patchlevel 25, minus the hunk to
+set the patch level.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.3
+Patch-ID:	bash43-025
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
+*** ../bash-4.3-patched/builtins/common.h	2013-07-08 16:54:47.000000000 -0400
+--- builtins/common.h	2014-09-12 14:25:47.000000000 -0400
+***************
+*** 34,37 ****
+--- 49,54 ----
+  #define SEVAL_PARSEONLY	0x020
+  #define SEVAL_NOLONGJMP 0x040
++ #define SEVAL_FUNCDEF	0x080		/* only allow function definitions */
++ #define SEVAL_ONECMD	0x100		/* only allow a single command */
+  
+  /* Flags for describe_command, shared between type.def and command.def */
+*** ../bash-4.3-patched/builtins/evalstring.c	2014-02-11 09:42:10.000000000 -0500
+--- builtins/evalstring.c	2014-09-14 14:15:13.000000000 -0400
+***************
+*** 309,312 ****
+--- 313,324 ----
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
+*** 369,372 ****
+--- 381,387 ----
+  	      dispose_fd_bitmap (bitmap);
+  	      discard_unwind_frame ("pe_dispose");
++ 
++ 	      if (flags & SEVAL_ONECMD)
++ 		break;
+  	    }
+  	}
+*** ../bash-4.3-patched/variables.c	2014-05-15 08:26:50.000000000 -0400
+--- variables.c	2014-09-14 14:23:35.000000000 -0400
+***************
+*** 359,369 ****
+  	  strcpy (temp_string + char_index + 1, string);
+  
+! 	  if (posixly_correct == 0 || legal_identifier (name))
+! 	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST);
+! 
+! 	  /* Ancient backwards compatibility.  Old versions of bash exported
+! 	     functions like name()=() {...} */
+! 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '(')
+! 	    name[char_index - 2] = '\0';
+  
+  	  if (temp_var = find_function (name))
+--- 364,372 ----
+  	  strcpy (temp_string + char_index + 1, string);
+  
+! 	  /* Don't import function names that are invalid identifiers from the
+! 	     environment, though we still allow them to be defined as shell
+! 	     variables. */
+! 	  if (legal_identifier (name))
+! 	    parse_and_execute (temp_string, name, SEVAL_NONINT|SEVAL_NOHIST|SEVAL_FUNCDEF|SEVAL_ONECMD);
+  
+  	  if (temp_var = find_function (name))
+***************
+*** 382,389 ****
+  	      report_error (_("error importing function definition for `%s'"), name);
+  	    }
+- 
+- 	  /* ( */
+- 	  if (name[char_index - 1] == ')' && name[char_index - 2] == '\0')
+- 	    name[char_index - 2] = '(';		/* ) */
+  	}
+  #if defined (ARRAY_VARS)
+--- 385,388 ----
+*** ../bash-4.3-patched/subst.c	2014-08-11 11:16:35.000000000 -0400
+--- subst.c	2014-09-12 15:31:04.000000000 -0400
+***************
+*** 8048,8052 ****
+  	  goto return0;
+  	}
+!       else if (var = find_variable_last_nameref (temp1))
+  	{
+  	  temp = nameref_cell (var);
+--- 8118,8124 ----
+  	  goto return0;
+  	}
+!       else if (var && (invisible_p (var) || var_isset (var) == 0))
+! 	temp = (char *)NULL;
+!       else if ((var = find_variable_last_nameref (temp1)) && var_isset (var) && invisible_p (var) == 0)
+  	{
+  	  temp = nameref_cell (var);
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index fe04b28..5849ed0 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
+           file://cve-2014-6271.patch;striplevel=0 \
            file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 25b7410..febaf33 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
+           file://cve-2014-6271.patch;striplevel=0 \
            file://run-ptest \
            "
 
-- 
1.7.10.4


