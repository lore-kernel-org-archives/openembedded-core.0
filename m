Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9388C6B1C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 09:43:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6M9hLTm007411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 02:43:21 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 22 Jul 2013 02:43:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jul 2013 17:43:17 +0800
Message-ID: <e2869ccec92e995206a301e5379bbf07f2b789ff.1374484672.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374484672.git.hongxu.jia@windriver.com>
References: <cover.1374484672.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] readline: fix importing readline in python with probably escape sequence output
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
X-List-Received-Date: Mon, 22 Jul 2013 09:43:20 -0000
Content-Type: text/plain

While imports readline in python, if TERM in terminfo is available and
it contains the variable 'km' and 'smm', the readline initialization will
output the value of 'smm' which is the escape sequence '\E[?1034h'.

The issue is caused by gnu readline library which is used by python
readline module. The bash-4.3/readline-6.3 has fixed this but it is still
on test and not released, so we find the changes and back port to 6.2.

Import patch from: http://git.savannah.gnu.org/cgit/bash.git/tag/?id=bash-4.3-alpha

[YOCTO #4835]
[YOCTO #4732]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ly-enable-meta-key-for-a-single-call-read.patch | 114 +++++++++++++++++++++
 meta/recipes-core/readline/readline_6.2.bb         |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch

diff --git a/meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch b/meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch
new file mode 100644
index 0000000..ccfdb9f
--- /dev/null
+++ b/meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch
@@ -0,0 +1,114 @@
+readline: only enable meta key for a single call readline().
+
+terminal.c
+  - change _rl_enable_meta_key to set a flag indicating that it sent the
+    enable-meta sequence
+  - _rl_disable_meta_key: new function to turn off meta mode after we
+    turned it on with _rl_enable_meta_key
+
+rlprivate.h
+  - extern declaration for _rl_disable_meta_key
+
+readline.c
+- _rl_internal_teardown: add call to _rl_disable_meta_key to make the
+  meta key active only for the duration of the call to readline()
+- _rl_internal_setup: move call to _rl_enable_meta_key here from
+  readline_initialize_everything so the meta key is active only for
+  the duration of the call to readline().  Suggestion from Miroslav
+  Lichvar <mlichvar@redhat.com>
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Upstream-Status: backport
+Imported patch from: http://git.savannah.gnu.org/cgit/bash.git/tag/?id=bash-4.3-alpha
+---
+ readline.c  | 12 ++++++++----
+ rlprivate.h |  1 +
+ terminal.c  | 19 ++++++++++++++++++-
+ 3 files changed, 27 insertions(+), 5 deletions(-)
+
+diff --git a/readline.c b/readline.c
+--- a/readline.c
++++ b/readline.c
+@@ -369,6 +369,11 @@ readline_internal_setup ()
+   _rl_in_stream = rl_instream;
+   _rl_out_stream = rl_outstream;
+ 
++  /* Enable the meta key only for the duration of readline(), if this
++     terminal has one. */
++  if (_rl_enable_meta)
++    _rl_enable_meta_key ();
++
+   if (rl_startup_hook)
+     (*rl_startup_hook) ();
+ 
+@@ -437,6 +442,9 @@ readline_internal_teardown (eof)
+   if (rl_undo_list)
+     rl_free_undo_list ();
+ 
++  /* Disable the meta key, if this terminal has one. */
++  _rl_disable_meta_key ();
++
+   /* Restore normal cursor, if available. */
+   _rl_set_insert_mode (RL_IM_INSERT, 0);
+ 
+@@ -1091,10 +1099,6 @@ readline_initialize_everything ()
+   /* Try to bind a common arrow key prefix, if not already bound. */
+   bind_arrow_keys ();
+ 
+-  /* Enable the meta key, if this terminal has one. */
+-  if (_rl_enable_meta)
+-    _rl_enable_meta_key ();
+-
+   /* If the completion parser's default word break characters haven't
+      been set yet, then do so now. */
+   if (rl_completer_word_break_characters == (char *)NULL)
+diff --git a/rlprivate.h b/rlprivate.h
+index 384ff67..be2c2c6 100644
+--- a/rlprivate.h
++++ b/rlprivate.h
+@@ -339,6 +339,7 @@ extern int _rl_output_character_function PARAMS((int));
+ extern void _rl_output_some_chars PARAMS((const char *, int));
+ extern int _rl_backspace PARAMS((int));
+ extern void _rl_enable_meta_key PARAMS((void));
++extern void _rl_disable_meta_key PARAMS((void));
+ extern void _rl_control_keypad PARAMS((int));
+ extern void _rl_set_cursor PARAMS((int, int));
+ 
+diff --git a/terminal.c b/terminal.c
+index f8c2f6e..21ee031 100644
+--- a/terminal.c
++++ b/terminal.c
+@@ -683,12 +683,29 @@ rl_ding ()
+ /*								    */
+ /* **************************************************************** */
+ 
++static int enabled_meta = 0;   /* flag indicating we enabled meta mode */
++
+ void
+ _rl_enable_meta_key ()
+ {
+ #if !defined (__DJGPP__)
+   if (term_has_meta && _rl_term_mm)
+-    tputs (_rl_term_mm, 1, _rl_output_character_function);
++    {
++      tputs (_rl_term_mm, 1, _rl_output_character_function);
++      enabled_meta = 1;
++    }
++#endif
++}
++
++void
++_rl_disable_meta_key ()
++{
++#if !defined (__DJGPP__)
++  if (term_has_meta && _rl_term_mo && enabled_meta)
++    {
++      tputs (_rl_term_mo, 1, _rl_output_character_function);
++      enabled_meta = 0;
++    }
+ #endif
+ }
+ 
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-core/readline/readline_6.2.bb b/meta/recipes-core/readline/readline_6.2.bb
index 45fa4e7..87636da 100644
--- a/meta/recipes-core/readline/readline_6.2.bb
+++ b/meta/recipes-core/readline/readline_6.2.bb
@@ -6,6 +6,7 @@ SRC_URI += "${GNU_MIRROR}/readline/readline-6.2-patches/readline62-001;name=patc
 ${GNU_MIRROR}/readline/readline-6.2-patches/readline62-002;name=patch2;apply=yes;striplevel=0 \
 ${GNU_MIRROR}/readline/readline-6.2-patches/readline62-003;name=patch3;apply=yes;striplevel=0 \
 ${GNU_MIRROR}/readline/readline-6.2-patches/readline62-004;name=patch4;apply=yes;striplevel=0 \
+file://readline-only-enable-meta-key-for-a-single-call-read.patch \
 "
 
 SRC_URI[archive.md5sum] = "67948acb2ca081f23359d0256e9a271c"
-- 
1.8.1.2


