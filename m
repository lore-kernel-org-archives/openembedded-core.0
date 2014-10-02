Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83855716F7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:07:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9277ggp019269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 00:07:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 2 Oct 2014 00:07:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Oct 2014 00:07:40 -0700
Message-ID: <05eecceb4d2a5821cd0ca0164610e9e6d68bb22c.1412233591.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412233591.git.liezhi.yang@windriver.com>
References: <cover.1412233591.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] bash: fix CVE-2014-6271
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
X-List-Received-Date: Thu, 02 Oct 2014 07:07:46 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

CVE-2014-6271 aka ShellShock.

"GNU Bash through 4.3 processes trailing strings after function definitions in
the values of environment variables, which allows remote attackers to execute
arbitrary code via a crafted environment."

(From OE-Core master rev: 798d833c9d4bd9ab287fa86b85b4d5f128170ed3)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../bash/bash-3.2.48/cve-2014-6271.patch           |   77 ++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |    1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch

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
 
-- 
1.7.9.5


