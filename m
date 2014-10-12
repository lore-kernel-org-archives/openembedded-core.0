Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 720BD718D4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:27:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2014 13:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,705,1406617200"; d="scan'208";a="613318008"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga002.fm.intel.com with ESMTP; 12 Oct 2014 13:27:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 21:27:12 +0100
Message-Id: <bdfe1e3770aeee9a1a7c65d4834f1a99820d3140.1413145539.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1413145539.git.paul.eggleton@linux.intel.com>
References: <cover.1413145539.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1413145539.git.paul.eggleton@linux.intel.com>
References: <cover.1413145539.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 2/4] bash: Fix for CVE-2014-7186 and CVE-2014-7187
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
X-List-Received-Date: Sun, 12 Oct 2014 20:27:44 -0000

From: Catalin Popeanga <Catalin.Popeanga@enea.com>

This is a followup patch to incomplete CVE-2014-6271 fix code execution via
specially-crafted environment

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-7186
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-7187

(From OE-Core daisy rev: 153d1125659df9e5c09e35a58bd51be184cb13c1)

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../bash-3.2.48/cve-2014-7186_cve-2014-7187.patch  |  99 ++++++++++++
 .../bash-4.2/cve-2014-7186_cve-2014-7187.patch     | 167 +++++++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   1 +
 meta/recipes-extended/bash/bash_4.2.bb             |   1 +
 4 files changed, 268 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7186_cve-2014-7187.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-7186_cve-2014-7187.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7186_cve-2014-7187.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7186_cve-2014-7187.patch
new file mode 100644
index 0000000..dcb8ea4
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7186_cve-2014-7187.patch
@@ -0,0 +1,99 @@
+bash: Fix for CVE-2014-7186 and CVE-2014-7187
+
+Upstream-Status: Backport {GNU Patch-ID: bash32-055}
+
+Downloaded from: http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-055 
+
+Author: Chet Ramey <chet.ramey@case.edu>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release: 3.2
+Patch-ID: bash32-055
+
+Bug-Reported-by:	Florian Weimer <fweimer@redhat.com>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+There are two local buffer overflows in parse.y that can cause the shell
+to dump core when given many here-documents attached to a single command
+or many nested loops.
+---
+--- a/parse.y	2014-09-27 12:17:16.000000000 -0400
++++ b/parse.y	2014-09-30 19:43:22.000000000 -0400
+@@ -166,4 +166,7 @@
+ static int reserved_word_acceptable __P((int));
+ static int yylex __P((void));
++
++static void push_heredoc __P((REDIRECT *));
++static char *mk_alexpansion __P((char *));
+ static int alias_expand_token __P((char *));
+ static int time_command_acceptable __P((void));
+@@ -254,5 +257,7 @@
+ /* Variables to manage the task of reading here documents, because we need to
+    defer the reading until after a complete command has been collected. */
+-static REDIRECT *redir_stack[10];
++#define HEREDOC_MAX 16
++
++static REDIRECT *redir_stack[HEREDOC_MAX];
+ int need_here_doc;
+ 
+@@ -280,5 +285,5 @@
+    index is decremented after a case, select, or for command is parsed. */
+ #define MAX_CASE_NEST	128
+-static int word_lineno[MAX_CASE_NEST];
++static int word_lineno[MAX_CASE_NEST+1];
+ static int word_top = -1;
+ 
+@@ -425,5 +430,5 @@
+ 			  redir.filename = $2;
+ 			  $$ = make_redirection (0, r_reading_until, redir);
+-			  redir_stack[need_here_doc++] = $$;
++			  push_heredoc ($$);
+ 			}
+ 	|	NUMBER LESS_LESS WORD
+@@ -431,5 +436,5 @@
+ 			  redir.filename = $3;
+ 			  $$ = make_redirection ($1, r_reading_until, redir);
+-			  redir_stack[need_here_doc++] = $$;
++			  push_heredoc ($$);
+ 			}
+ 	|	LESS_LESS_LESS WORD
+@@ -488,5 +493,5 @@
+ 			  $$ = make_redirection
+ 			    (0, r_deblank_reading_until, redir);
+-			  redir_stack[need_here_doc++] = $$;
++			  push_heredoc ($$);
+ 			}
+ 	|	NUMBER LESS_LESS_MINUS WORD
+@@ -495,5 +500,5 @@
+ 			  $$ = make_redirection
+ 			    ($1, r_deblank_reading_until, redir);
+-			  redir_stack[need_here_doc++] = $$;
++			  push_heredoc ($$);
+ 			}
+ 	|	GREATER_AND '-'
+@@ -2214,4 +2219,19 @@
+ static int esacs_needed_count;
+ 
++static void
++push_heredoc (r)
++     REDIRECT *r;
++{
++  if (need_here_doc >= HEREDOC_MAX)
++    {
++      last_command_exit_value = EX_BADUSAGE;
++      need_here_doc = 0;
++      report_syntax_error (_("maximum here-document count exceeded"));
++      reset_parser ();
++      exit_shell (last_command_exit_value);
++    }
++  redir_stack[need_here_doc++] = r;
++}
++
+ void
+ gather_here_documents ()
diff --git a/meta/recipes-extended/bash/bash-4.2/cve-2014-7186_cve-2014-7187.patch b/meta/recipes-extended/bash/bash-4.2/cve-2014-7186_cve-2014-7187.patch
new file mode 100644
index 0000000..b51ce5f
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/cve-2014-7186_cve-2014-7187.patch
@@ -0,0 +1,167 @@
+bash: Fix for CVE-2014-7186 and CVE-2014-7187
+
+Upstream-Status: Backport {GNU Patch-ID: bash42-051}
+
+Downloaded from: http://ftp.gnu.org/gnu/bash/bash-4.2-patches/bash42-051
+
+Author: Chet Ramey <chet.ramey@case.edu>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+			     BASH PATCH REPORT
+			     =================
+
+Bash-Release:	4.2
+Patch-ID:	bash42-051
+
+Bug-Reported-by:	Florian Weimer <fweimer@redhat.com>
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+There are two local buffer overflows in parse.y that can cause the shell
+to dump core when given many here-documents attached to a single command
+or many nested loops.
+
+Patch (apply with `patch -p0'):
+
+*** ../bash-4.2.50/parse.y	2014-09-27 12:18:53.000000000 -0400
+--- parse.y	2014-09-30 19:24:19.000000000 -0400
+***************
+*** 168,171 ****
+--- 168,174 ----
+  static int reserved_word_acceptable __P((int));
+  static int yylex __P((void));
++ 
++ static void push_heredoc __P((REDIRECT *));
++ static char *mk_alexpansion __P((char *));
+  static int alias_expand_token __P((char *));
+  static int time_command_acceptable __P((void));
+***************
+*** 265,269 ****
+  /* Variables to manage the task of reading here documents, because we need to
+     defer the reading until after a complete command has been collected. */
+! static REDIRECT *redir_stack[10];
+  int need_here_doc;
+  
+--- 268,274 ----
+  /* Variables to manage the task of reading here documents, because we need to
+     defer the reading until after a complete command has been collected. */
+! #define HEREDOC_MAX 16
+! 
+! static REDIRECT *redir_stack[HEREDOC_MAX];
+  int need_here_doc;
+  
+***************
+*** 307,311 ****
+     index is decremented after a case, select, or for command is parsed. */
+  #define MAX_CASE_NEST	128
+! static int word_lineno[MAX_CASE_NEST];
+  static int word_top = -1;
+  
+--- 312,316 ----
+     index is decremented after a case, select, or for command is parsed. */
+  #define MAX_CASE_NEST	128
+! static int word_lineno[MAX_CASE_NEST+1];
+  static int word_top = -1;
+  
+***************
+*** 520,524 ****
+  			  redir.filename = $2;
+  			  $$ = make_redirection (source, r_reading_until, redir, 0);
+! 			  redir_stack[need_here_doc++] = $$;
+  			}
+  	|	NUMBER LESS_LESS WORD
+--- 525,529 ----
+  			  redir.filename = $2;
+  			  $$ = make_redirection (source, r_reading_until, redir, 0);
+! 			  push_heredoc ($$);
+  			}
+  	|	NUMBER LESS_LESS WORD
+***************
+*** 527,531 ****
+  			  redir.filename = $3;
+  			  $$ = make_redirection (source, r_reading_until, redir, 0);
+! 			  redir_stack[need_here_doc++] = $$;
+  			}
+  	|	REDIR_WORD LESS_LESS WORD
+--- 532,536 ----
+  			  redir.filename = $3;
+  			  $$ = make_redirection (source, r_reading_until, redir, 0);
+! 			  push_heredoc ($$);
+  			}
+  	|	REDIR_WORD LESS_LESS WORD
+***************
+*** 534,538 ****
+  			  redir.filename = $3;
+  			  $$ = make_redirection (source, r_reading_until, redir, REDIR_VARASSIGN);
+! 			  redir_stack[need_here_doc++] = $$;
+  			}
+  	|	LESS_LESS_MINUS WORD
+--- 539,543 ----
+  			  redir.filename = $3;
+  			  $$ = make_redirection (source, r_reading_until, redir, REDIR_VARASSIGN);
+! 			  push_heredoc ($$);
+  			}
+  	|	LESS_LESS_MINUS WORD
+***************
+*** 541,545 ****
+  			  redir.filename = $2;
+  			  $$ = make_redirection (source, r_deblank_reading_until, redir, 0);
+! 			  redir_stack[need_here_doc++] = $$;
+  			}
+  	|	NUMBER LESS_LESS_MINUS WORD
+--- 546,550 ----
+  			  redir.filename = $2;
+  			  $$ = make_redirection (source, r_deblank_reading_until, redir, 0);
+! 			  push_heredoc ($$);
+  			}
+  	|	NUMBER LESS_LESS_MINUS WORD
+***************
+*** 548,552 ****
+  			  redir.filename = $3;
+  			  $$ = make_redirection (source, r_deblank_reading_until, redir, 0);
+! 			  redir_stack[need_here_doc++] = $$;
+  			}
+  	|	REDIR_WORD  LESS_LESS_MINUS WORD
+--- 553,557 ----
+  			  redir.filename = $3;
+  			  $$ = make_redirection (source, r_deblank_reading_until, redir, 0);
+! 			  push_heredoc ($$);
+  			}
+  	|	REDIR_WORD  LESS_LESS_MINUS WORD
+***************
+*** 555,559 ****
+  			  redir.filename = $3;
+  			  $$ = make_redirection (source, r_deblank_reading_until, redir, REDIR_VARASSIGN);
+! 			  redir_stack[need_here_doc++] = $$;
+  			}
+  	|	LESS_LESS_LESS WORD
+--- 560,564 ----
+  			  redir.filename = $3;
+  			  $$ = make_redirection (source, r_deblank_reading_until, redir, REDIR_VARASSIGN);
+! 			  push_heredoc ($$);
+  			}
+  	|	LESS_LESS_LESS WORD
+***************
+*** 2534,2537 ****
+--- 2539,2557 ----
+  static int esacs_needed_count;
+  
++ static void
++ push_heredoc (r)
++      REDIRECT *r;
++ {
++   if (need_here_doc >= HEREDOC_MAX)
++     {
++       last_command_exit_value = EX_BADUSAGE;
++       need_here_doc = 0;
++       report_syntax_error (_("maximum here-document count exceeded"));
++       reset_parser ();
++       exit_shell (last_command_exit_value);
++     }
++   redir_stack[need_here_doc++] = r;
++ }
++ 
+  void
+  gather_here_documents ()
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index a5417f1..2b26ae7 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://cve-2014-6271.patch;striplevel=0 \
            file://cve-2014-7169.patch \
            file://Fix-for-bash-exported-function-namespace-change.patch \
+           file://cve-2014-7186_cve-2014-7187.patch \
            file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 7222259..ae63ad3 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://cve-2014-6271.patch;striplevel=0 \
            file://cve-2014-7169.patch \
            file://Fix-for-bash-exported-function-namespace-change.patch;striplevel=0 \
+           file://cve-2014-7186_cve-2014-7187.patch;striplevel=0 \
            file://run-ptest \
            "
 
-- 
1.9.3


