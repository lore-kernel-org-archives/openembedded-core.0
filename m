Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 501696F55C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 07:17:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s237H96J013577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Mar 2014 23:17:10 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 2 Mar 2014 23:17:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 15:16:51 +0800
Message-ID: <728eaa09cc024c571c42e44b68f5bb5173bf87e1.1393830830.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393830830.git.hongxu.jia@windriver.com>
References: <cover.1393830830.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/3] readline: drop readline-only-enable-meta-key-for-a-single-call-read.patch
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
X-List-Received-Date: Mon, 03 Mar 2014 07:17:09 -0000
Content-Type: text/plain

The 6.3 has fixed this issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ly-enable-meta-key-for-a-single-call-read.patch | 114 ---------------------
 1 file changed, 114 deletions(-)
 delete mode 100644 meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch

diff --git a/meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch b/meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch
deleted file mode 100644
index ccfdb9f..0000000
--- a/meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-readline: only enable meta key for a single call readline().
-
-terminal.c
-  - change _rl_enable_meta_key to set a flag indicating that it sent the
-    enable-meta sequence
-  - _rl_disable_meta_key: new function to turn off meta mode after we
-    turned it on with _rl_enable_meta_key
-
-rlprivate.h
-  - extern declaration for _rl_disable_meta_key
-
-readline.c
-- _rl_internal_teardown: add call to _rl_disable_meta_key to make the
-  meta key active only for the duration of the call to readline()
-- _rl_internal_setup: move call to _rl_enable_meta_key here from
-  readline_initialize_everything so the meta key is active only for
-  the duration of the call to readline().  Suggestion from Miroslav
-  Lichvar <mlichvar@redhat.com>
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: backport
-Imported patch from: http://git.savannah.gnu.org/cgit/bash.git/tag/?id=bash-4.3-alpha
----
- readline.c  | 12 ++++++++----
- rlprivate.h |  1 +
- terminal.c  | 19 ++++++++++++++++++-
- 3 files changed, 27 insertions(+), 5 deletions(-)
-
-diff --git a/readline.c b/readline.c
---- a/readline.c
-+++ b/readline.c
-@@ -369,6 +369,11 @@ readline_internal_setup ()
-   _rl_in_stream = rl_instream;
-   _rl_out_stream = rl_outstream;
- 
-+  /* Enable the meta key only for the duration of readline(), if this
-+     terminal has one. */
-+  if (_rl_enable_meta)
-+    _rl_enable_meta_key ();
-+
-   if (rl_startup_hook)
-     (*rl_startup_hook) ();
- 
-@@ -437,6 +442,9 @@ readline_internal_teardown (eof)
-   if (rl_undo_list)
-     rl_free_undo_list ();
- 
-+  /* Disable the meta key, if this terminal has one. */
-+  _rl_disable_meta_key ();
-+
-   /* Restore normal cursor, if available. */
-   _rl_set_insert_mode (RL_IM_INSERT, 0);
- 
-@@ -1091,10 +1099,6 @@ readline_initialize_everything ()
-   /* Try to bind a common arrow key prefix, if not already bound. */
-   bind_arrow_keys ();
- 
--  /* Enable the meta key, if this terminal has one. */
--  if (_rl_enable_meta)
--    _rl_enable_meta_key ();
--
-   /* If the completion parser's default word break characters haven't
-      been set yet, then do so now. */
-   if (rl_completer_word_break_characters == (char *)NULL)
-diff --git a/rlprivate.h b/rlprivate.h
-index 384ff67..be2c2c6 100644
---- a/rlprivate.h
-+++ b/rlprivate.h
-@@ -339,6 +339,7 @@ extern int _rl_output_character_function PARAMS((int));
- extern void _rl_output_some_chars PARAMS((const char *, int));
- extern int _rl_backspace PARAMS((int));
- extern void _rl_enable_meta_key PARAMS((void));
-+extern void _rl_disable_meta_key PARAMS((void));
- extern void _rl_control_keypad PARAMS((int));
- extern void _rl_set_cursor PARAMS((int, int));
- 
-diff --git a/terminal.c b/terminal.c
-index f8c2f6e..21ee031 100644
---- a/terminal.c
-+++ b/terminal.c
-@@ -683,12 +683,29 @@ rl_ding ()
- /*								    */
- /* **************************************************************** */
- 
-+static int enabled_meta = 0;   /* flag indicating we enabled meta mode */
-+
- void
- _rl_enable_meta_key ()
- {
- #if !defined (__DJGPP__)
-   if (term_has_meta && _rl_term_mm)
--    tputs (_rl_term_mm, 1, _rl_output_character_function);
-+    {
-+      tputs (_rl_term_mm, 1, _rl_output_character_function);
-+      enabled_meta = 1;
-+    }
-+#endif
-+}
-+
-+void
-+_rl_disable_meta_key ()
-+{
-+#if !defined (__DJGPP__)
-+  if (term_has_meta && _rl_term_mo && enabled_meta)
-+    {
-+      tputs (_rl_term_mo, 1, _rl_output_character_function);
-+      enabled_meta = 0;
-+    }
- #endif
- }
- 
--- 
-1.8.1.2
-
-- 
1.8.1.2


