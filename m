Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9CA65CA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 14:41:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9VEfolr029356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 07:41:50 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 31 Oct 2014 07:41:50 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Oct 2014 10:41:49 -0400
Message-ID: <1414766509-3221-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH v2] gcc: backport tow patches to fix ICE in dwarf2out_var_location
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
X-List-Received-Date: Fri, 31 Oct 2014 14:41:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The first patch fixes the ICE in dwarf2out_var_location, at
dwarf2out.c.

r212171:
    * except.c (emit_note_eh_region_end): New helper function.
    (convert_to_eh_region_ranges): Use emit_note_eh_region_end to
    emit EH_REGION_END note.
    * jump.c (cleanup_barriers): Do not split a call and its
    corresponding CALL_ARG_LOCATION note.

But it introduced a regression issue:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63348

so backport the fix for the regression as well:

r215613:
    PR rtl-optimization/63348
    * emit-rtl.c (try_split): Do not emit extra barrier.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   2 +
 .../gcc/gcc-4.9/0058-gcc-r212171.patch             | 113 +++++++++++++++++++++
 .../0059-gcc-PR-rtl-optimization-63348.patch       |  59 +++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 9a66cd2..8769128 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -71,6 +71,8 @@ SRC_URI = "\
     file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
     file://0055-PR-rtl-optimization-61801.patch \
     file://0056-top-level-reorder_gcc-bug-61144.patch \
+    file://0058-gcc-r212171.patch \
+    file://0059-gcc-PR-rtl-optimization-63348.patch \
 "
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
new file mode 100644
index 0000000..4b312d4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
@@ -0,0 +1,113 @@
+From ca03cf1b133d66eb978c68f6dbc345e9aabcba88 Mon Sep 17 00:00:00 2001
+From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 30 Jun 2014 19:30:52 +0000
+Subject: [PATCH] r212171
+
+* except.c (emit_note_eh_region_end): New helper
+ function. 	(convert_to_eh_region_ranges): Use
+ emit_note_eh_region_end to 	emit EH_REGION_END note. 
+ * jump.c (cleanup_barriers): Do not split a call and its 
+ corresponding CALL_ARG_LOCATION note.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212171 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=212171]
+Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
+---
+ gcc/except.c |   23 ++++++++++++++++++-----
+ gcc/jump.c   |   19 +++++++++++++++----
+ 2 files changed, 33 insertions(+), 9 deletions(-)
+
+diff --git a/gcc/except.c b/gcc/except.c
+index dc5c1d2..7ac114f 100644
+--- a/gcc/except.c
++++ b/gcc/except.c
+@@ -2466,6 +2466,20 @@ add_call_site (rtx landing_pad, int action, int section)
+   return call_site_base + crtl->eh.call_site_record_v[section]->length () - 1;
+ }
+ 
++static rtx
++emit_note_eh_region_end (rtx insn)
++{
++  rtx next = NEXT_INSN (insn);
++
++  /* Make sure we do not split a call and its corresponding
++     CALL_ARG_LOCATION note.  */
++  if (next && NOTE_P (next)
++      && NOTE_KIND (next) == NOTE_INSN_CALL_ARG_LOCATION)
++    insn = next;
++
++  return emit_note_after (NOTE_INSN_EH_REGION_END, insn);
++}
++
+ /* Turn REG_EH_REGION notes back into NOTE_INSN_EH_REGION notes.
+    The new note numbers will not refer to region numbers, but
+    instead to call site entries.  */
+@@ -2544,8 +2558,8 @@ convert_to_eh_region_ranges (void)
+ 		note = emit_note_before (NOTE_INSN_EH_REGION_BEG,
+ 					 first_no_action_insn_before_switch);
+ 		NOTE_EH_HANDLER (note) = call_site;
+-		note = emit_note_after (NOTE_INSN_EH_REGION_END,
+-					last_no_action_insn_before_switch);
++		note
++		  = emit_note_eh_region_end (last_no_action_insn_before_switch);
+ 		NOTE_EH_HANDLER (note) = call_site;
+ 		gcc_assert (last_action != -3
+ 			    || (last_action_insn
+@@ -2569,8 +2583,7 @@ convert_to_eh_region_ranges (void)
+ 		    first_no_action_insn = NULL_RTX;
+ 		  }
+ 
+-		note = emit_note_after (NOTE_INSN_EH_REGION_END,
+-					last_action_insn);
++		note = emit_note_eh_region_end (last_action_insn);
+ 		NOTE_EH_HANDLER (note) = call_site;
+ 	      }
+ 
+@@ -2617,7 +2630,7 @@ convert_to_eh_region_ranges (void)
+ 
+   if (last_action >= -1 && ! first_no_action_insn)
+     {
+-      note = emit_note_after (NOTE_INSN_EH_REGION_END, last_action_insn);
++      note = emit_note_eh_region_end (last_action_insn);
+       NOTE_EH_HANDLER (note) = call_site;
+     }
+ 
+diff --git a/gcc/jump.c b/gcc/jump.c
+index 9418f65..a5e5f52 100644
+--- a/gcc/jump.c
++++ b/gcc/jump.c
+@@ -121,15 +121,26 @@ rebuild_jump_labels_chain (rtx chain)
+ static unsigned int
+ cleanup_barriers (void)
+ {
+-  rtx insn, next, prev;
+-  for (insn = get_insns (); insn; insn = next)
++  rtx insn;
++  for (insn = get_insns (); insn; insn = NEXT_INSN (insn))
+     {
+-      next = NEXT_INSN (insn);
+       if (BARRIER_P (insn))
+ 	{
+-	  prev = prev_nonnote_insn (insn);
++	  rtx prev = prev_nonnote_insn (insn);
+ 	  if (!prev)
+ 	    continue;
++
++	  if (CALL_P (prev))
++	    {
++	      /* Make sure we do not split a call and its corresponding
++		 CALL_ARG_LOCATION note.  */
++	      rtx next = NEXT_INSN (prev);
++
++	      if (NOTE_P (next)
++		  && NOTE_KIND (next) == NOTE_INSN_CALL_ARG_LOCATION)
++		prev = next;
++	    }
++
+ 	  if (BARRIER_P (prev))
+ 	    delete_insn (insn);
+ 	  else if (prev != PREV_INSN (insn))
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch b/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch
new file mode 100644
index 0000000..6d24aa4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch
@@ -0,0 +1,59 @@
+From 6eae3e637fcc22d21b51d44d61e3a9cb4825e776 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 30 Oct 2014 20:37:14 -0700
+Subject: [PATCH]PR rtl-optimization/63348
+ 
+PR rtl-optimization/63348
+* emit-rtl.c (try_split): Do not emit extra barrier.
+
+Note: this patch is to fix the side effect introduced by r212171 which was reported at:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63348
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@215613 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=215613]
+Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ gcc/emit-rtl.c |   11 -----------
+ 1 files changed, 0 insertions(+), 11 deletions(-)
+
+diff --git a/gcc/emit-rtl.c b/gcc/emit-rtl.c
+index 4736f8d..ae69dbd 100644
+--- a/gcc/emit-rtl.c
++++ b/gcc/emit-rtl.c
+@@ -3422,7 +3422,6 @@ try_split (rtx pat, rtx trial, int last)
+ {
+   rtx before = PREV_INSN (trial);
+   rtx after = NEXT_INSN (trial);
+-  int has_barrier = 0;
+   rtx note, seq, tem;
+   int probability;
+   rtx insn_last, insn;
+@@ -3441,14 +3440,6 @@ try_split (rtx pat, rtx trial, int last)
+ 
+   split_branch_probability = -1;
+ 
+-  /* If we are splitting a JUMP_INSN, it might be followed by a BARRIER.
+-     We may need to handle this specially.  */
+-  if (after && BARRIER_P (after))
+-    {
+-      has_barrier = 1;
+-      after = NEXT_INSN (after);
+-    }
+-
+   if (!seq)
+     return trial;
+ 
+@@ -3594,8 +3585,6 @@ try_split (rtx pat, rtx trial, int last)
+   tem = emit_insn_after_setloc (seq, trial, INSN_LOCATION (trial));
+ 
+   delete_insn (trial);
+-  if (has_barrier)
+-    emit_barrier_after (tem);
+ 
+   /* Recursively call try_split for each new insn created; by the
+      time control returns here that insn will be fully split, so
+-- 
+1.7.1
+
-- 
2.0.0


