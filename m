Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CE9E4715EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:28:12 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2014 07:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,638,1406617200"; d="scan'208";a="481510075"
Received: from cpariyar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.78])
	by azsmga001.ch.intel.com with ESMTP; 02 Oct 2014 07:28:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Oct 2014 15:27:26 +0100
Message-Id: <542177ddccf0c010e02b3dd25097cd24337efd40.1412259899.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1412259899.git.paul.eggleton@linux.intel.com>
References: <cover.1412259899.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1412259899.git.paul.eggleton@linux.intel.com>
References: <cover.1412259899.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 1/2] bash: add missing patch for CVE-2014-6271 to 4.2 recipe
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
X-List-Received-Date: Thu, 02 Oct 2014 14:28:15 -0000

The bash_4.2 recipe was missed when the fix was backported to the dora
branch.

Patch based on the one from OE-Core master rev
798d833c9d4bd9ab287fa86b85b4d5f128170ed3 by Ross Burton
<ross.burton@intel.com>, with the content replaced from the
appropriate upstream patch.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../bash/bash-4.2/cve-2014-6271.patch              | 95 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.2.bb             |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-6271.patch

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
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index fefe7b7..cb95445 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
+           file://cve-2014-6271.patch;striplevel=0 \
            file://run-ptest \
            "
 
-- 
1.9.3


