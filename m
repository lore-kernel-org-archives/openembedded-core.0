Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42B5C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 14:49:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.52411.1638802198919812295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 06:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 772051FB
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 06:49:57 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E02D63F5A1
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 06:49:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] vim: upgrade to 8.2 patch 3752
Date: Mon,  6 Dec 2021 14:49:53 +0000
Message-Id: <20211206144953.360894-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 14:49:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159232

There's a fairly constant flow of CVEs being fixed in Vim, which are
getting increasing non-trivial to backport.

Instead of trying to backport (and potentially introduce more bugs), or
just ignoring them entirely, upgrade vim to the latest patch in the hope
that vim 8.3 will be released before we release Kirkstone.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-reading-character-past-end-of-line.patch |  62 ------
 ...28-using-freed-memory-when-replacing.patch |  83 -------
 ...eading-uninitialized-memory-when-giv.patch |  63 ------
 ...rash-when-using-CTRL-W-f-without-fin.patch |  92 --------
 ...llegal-memory-access-if-buffer-name-.patch |  86 --------
 ...ml_get-error-after-search-with-range.patch |  72 ------
 ...nvalid-memory-access-when-scrolling-.patch |  97 --------
 .../vim/files/CVE-2021-3778.patch             |  61 ------
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ------------------
 meta/recipes-support/vim/vim.inc              |  15 +-
 10 files changed, 4 insertions(+), 834 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581-re=
ading-character-past-end-of-line.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428-us=
ing-freed-memory-when-replacing.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582-re=
ading-uninitialized-memory-when-giv.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-cr=
ash-when-using-CTRL-W-f-without-fin.patch
 delete mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487-il=
legal-memory-access-if-buffer-name-.patch
 delete mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489-ml=
_get-error-after-search-with-range.patch
 delete mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564-in=
valid-memory-access-when-scrolling-.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 delete mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5=
f7525a5c58fb7ca9f9.patch

diff --git a/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-c=
haracter-past-end-of-line.patch b/meta/recipes-support/vim/files/0001-pat=
ch-8.2.3581-reading-character-past-end-of-line.patch
deleted file mode 100644
index 28c61cd782..0000000000
--- a/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-characte=
r-past-end-of-line.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-CVE: CVE-2021-3927
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 93b427c6e729260d0700c3b2804ec153bc8284fa Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Thu, 4 Nov 2021 15:10:11 +0000
-Subject: [PATCH] patch 8.2.3581: reading character past end of line
-
-Problem:    Reading character past end of line.
-Solution:   Correct the cursor column.
----
- src/ex_docmd.c           |  1 +
- src/testdir/test_put.vim | 12 ++++++++++++
- src/version.c            |  2 ++
- 3 files changed, 15 insertions(+)
-
-diff --git a/src/ex_docmd.c b/src/ex_docmd.c
-index fde726477..59e245bee 100644
---- a/src/ex_docmd.c
-+++ b/src/ex_docmd.c
-@@ -6905,6 +6905,7 @@ ex_put(exarg_T *eap)
- 	eap->forceit =3D TRUE;
-     }
-     curwin->w_cursor.lnum =3D eap->line2;
-+    check_cursor_col();
-     do_put(eap->regname, eap->forceit ? BACKWARD : FORWARD, 1L,
- 						       PUT_LINE|PUT_CURSLINE);
- }
-diff --git a/src/testdir/test_put.vim b/src/testdir/test_put.vim
-index 225ebd1f3..922e5b269 100644
---- a/src/testdir/test_put.vim
-+++ b/src/testdir/test_put.vim
-@@ -113,3 +113,15 @@ func Test_put_p_indent_visual()
-   call assert_equal('select that text', getline(2))
-   bwipe!
- endfunc
-+
-+func Test_put_above_first_line()
-+  new
-+  let @" =3D 'text'
-+  silent! normal 0o00
-+  0put
-+  call assert_equal('text', getline(1))
-+  bwipe!
-+endfunc
-+
-+
-+" vim: shiftwidth=3D2 sts=3D2 expandtab
-diff --git a/src/version.c b/src/version.c
-index a9e8be0e7..df4ec9a47 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -742,6 +742,8 @@ static char *(features[]) =3D
-=20
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
-+/**/
-+    3581,
- /**/
-     3564,
- /**/
diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-fre=
ed-memory-when-replacing.patch b/meta/recipes-support/vim/files/0002-patc=
h-8.2.3428-using-freed-memory-when-replacing.patch
deleted file mode 100644
index ecfae0301e..0000000000
--- a/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memo=
ry-when-replacing.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-CVE: CVE-2021-3796
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 1160e5f74b229336502fc376416f21108d36cfc2 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Sat, 11 Sep 2021 21:14:20 +0200
-Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
-
-Problem:    Using freed memory when replacing. (Dhiraj Mishra)
-Solution:   Get the line pointer after calling ins_copychar().
----
- src/normal.c              | 10 +++++++---
- src/testdir/test_edit.vim | 14 ++++++++++++++
- src/version.c             |  2 ++
- 3 files changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/src/normal.c b/src/normal.c
-index c4963e621..d6333b948 100644
---- a/src/normal.c
-+++ b/src/normal.c
-@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
- 	    {
- 		/*
- 		 * Get ptr again, because u_save and/or showmatch() will have
--		 * released the line.  At the same time we let know that the
--		 * line will be changed.
-+		 * released the line.  This may also happen in ins_copychar().
-+		 * At the same time we let know that the line will be changed.
- 		 */
--		ptr =3D ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
- 		if (cap->nchar =3D=3D Ctrl_E || cap->nchar =3D=3D Ctrl_Y)
- 		{
- 		  int c =3D ins_copychar(curwin->w_cursor.lnum
- 					   + (cap->nchar =3D=3D Ctrl_Y ? -1 : 1));
-+
-+		  ptr =3D ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
- 		  if (c !=3D NUL)
- 		    ptr[curwin->w_cursor.col] =3D c;
- 		}
- 		else
-+		{
-+		    ptr =3D ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
- 		    ptr[curwin->w_cursor.col] =3D cap->nchar;
-+		}
- 		if (p_sm && msg_silent =3D=3D 0)
- 		    showmatch(cap->nchar);
- 		++curwin->w_cursor.col;
-diff --git a/src/testdir/test_edit.vim b/src/testdir/test_edit.vim
-index 4e29e7fe1..f94e6c181 100644
---- a/src/testdir/test_edit.vim
-+++ b/src/testdir/test_edit.vim
-@@ -1519,3 +1519,17 @@ func Test_edit_noesckeys()
-   bwipe!
-   set esckeys
- endfunc
-+
-+" Test for getting the character of the line below after "p"
-+func Test_edit_put_CTRL_E()
-+  set encoding=3Dlatin1
-+  new
-+  let @" =3D ''
-+  sil! norm or=03ggRx
-+  sil! norm pr=05
-+  call assert_equal(['r', 'r'], getline(1, 2))
-+  bwipe!
-+  set encoding=3Dutf-8
-+endfunc
-+
-+" vim: shiftwidth=3D2 sts=3D2 expandtab
-diff --git a/src/version.c b/src/version.c
-index 85bdfc601..1046993d6 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -742,6 +742,8 @@ static char *(features[]) =3D
-=20
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
-+/**/
-+    3428,
- /**/
-     3409,
- /**/
diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-u=
ninitialized-memory-when-giv.patch b/meta/recipes-support/vim/files/0002-=
patch-8.2.3582-reading-uninitialized-memory-when-giv.patch
deleted file mode 100644
index d117a98893..0000000000
--- a/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitia=
lized-memory-when-giv.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-CVE: CVE-2021-3928
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ade0f0481969f1453c60e7c8354b00dfe4238739 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Thu, 4 Nov 2021 15:46:05 +0000
-Subject: [PATCH] patch 8.2.3582: reading uninitialized memory when givin=
g
- spell suggestions
-
-Problem:    Reading uninitialized memory when giving spell suggestions.
-Solution:   Check that preword is not empty.
----
- src/spellsuggest.c         | 2 +-
- src/testdir/test_spell.vim | 8 ++++++++
- src/version.c              | 2 ++
- 3 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/spellsuggest.c b/src/spellsuggest.c
-index 9d6df7930..8615d5280 100644
---- a/src/spellsuggest.c
-+++ b/src/spellsuggest.c
-@@ -1600,7 +1600,7 @@ suggest_trie_walk(
- 		    // char, e.g., "thes," -> "these".
- 		    p =3D fword + sp->ts_fidx;
- 		    MB_PTR_BACK(fword, p);
--		    if (!spell_iswordp(p, curwin))
-+		    if (!spell_iswordp(p, curwin) && *preword !=3D NUL)
- 		    {
- 			p =3D preword + STRLEN(preword);
- 			MB_PTR_BACK(preword, p);
-diff --git a/src/testdir/test_spell.vim b/src/testdir/test_spell.vim
-index 79fb8927c..e435e9172 100644
---- a/src/testdir/test_spell.vim
-+++ b/src/testdir/test_spell.vim
-@@ -498,6 +498,14 @@ func Test_spell_screendump()
-   call delete('XtestSpell')
- endfunc
-=20
-+func Test_spell_single_word()
-+  new
-+  silent! norm 0R00
-+  spell! =C3=9F=C3=82
-+  silent 0norm 0r$ Dvz=3D
-+  bwipe!
-+endfunc
-+
- let g:test_data_aff1 =3D [
-       \"SET ISO8859-1",
-       \"TRY esianrtolcdugmphbyfvkwjkqxz-\xEB\xE9\xE8\xEA\xEF\xEE\xE4\xE=
0\xE2\xF6\xFC\xFB'ESIANRTOLCDUGMPHBYFVKWJKQXZ",
-diff --git a/src/version.c b/src/version.c
-index df4ec9a47..e1bc0d09b 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -742,6 +742,8 @@ static char *(features[]) =3D
-=20
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
-+/**/
-+    3582,
- /**/
-     3581,
- /**/
diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-whe=
n-using-CTRL-W-f-without-fin.patch b/meta/recipes-support/vim/files/0002-=
patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch
deleted file mode 100644
index 58d3442677..0000000000
--- a/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using=
-CTRL-W-f-without-fin.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-CVE: CVE-2021-3973
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b6154e9f530544ddc3130d981caae0dabc053757 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Wed, 17 Nov 2021 18:00:31 +0000
-Subject: [PATCH] patch 8.2.3611: crash when using CTRL-W f without findi=
ng a
- file name  Problem:    Crash when using CTRL-W f without finding
- a file name. Solution:   Bail out when the file name length is zero.
-
----
- src/findfile.c              | 8 ++++++++
- src/normal.c                | 6 ++++--
- src/testdir/test_visual.vim | 8 ++++++++
- src/version.c               | 2 ++
- 4 files changed, 22 insertions(+), 2 deletions(-)
-
-diff --git a/src/findfile.c b/src/findfile.c
-index dba547da1..5764fd7b8 100644
---- a/src/findfile.c
-+++ b/src/findfile.c
-@@ -1727,6 +1727,9 @@ find_file_in_path_option(
-     proc->pr_WindowPtr =3D (APTR)-1L;
- # endif
-=20
-+    if (len =3D=3D 0)
-+	return NULL;
-+
-     if (first =3D=3D TRUE)
-     {
- 	// copy file name into NameBuff, expanding environment variables
-@@ -2094,7 +2097,12 @@ find_file_name_in_path(
-     int		c;
- # if defined(FEAT_FIND_ID) && defined(FEAT_EVAL)
-     char_u	*tofree =3D NULL;
-+# endif
-=20
-+    if (len =3D=3D 0)
-+	return NULL;
-+
-+# if defined(FEAT_FIND_ID) && defined(FEAT_EVAL)
-     if ((options & FNAME_INCL) && *curbuf->b_p_inex !=3D NUL)
-     {
- 	tofree =3D eval_includeexpr(ptr, len);
-diff --git a/src/normal.c b/src/normal.c
-index 7cb959257..f0084f2ac 100644
---- a/src/normal.c
-+++ b/src/normal.c
-@@ -3778,8 +3778,10 @@ get_visual_text(
- 	    *pp =3D ml_get_pos(&VIsual);
- 	    *lenp =3D curwin->w_cursor.col - VIsual.col + 1;
- 	}
--	if (has_mbyte)
--	    // Correct the length to include the whole last character.
-+	if (**pp =3D=3D NUL)
-+	    *lenp =3D 0;
-+	if (has_mbyte && *lenp > 0)
-+	    // Correct the length to include all bytes of the last character.
- 	    *lenp +=3D (*mb_ptr2len)(*pp + (*lenp - 1)) - 1;
-     }
-     reset_VIsual_and_resel();
-diff --git a/src/testdir/test_visual.vim b/src/testdir/test_visual.vim
-index ae281238e..0705fdb57 100644
---- a/src/testdir/test_visual.vim
-+++ b/src/testdir/test_visual.vim
-@@ -894,4 +894,12 @@ func Test_block_insert_replace_tabs()
-   bwipe!
- endfunc
-=20
-+func Test_visual_block_ctrl_w_f()
-+  " Emtpy block selected in new buffer should not result in an error.
-+  au! BufNew foo sil norm =16=17f
-+  edit foo
-+
-+  au! BufNew
-+endfunc
-+
- " vim: shiftwidth=3D2 sts=3D2 expandtab
-diff --git a/src/version.c b/src/version.c
-index 52be3c39d..59a314b3a 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -742,6 +742,8 @@ static char *(features[]) =3D
-=20
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
-+/**/
-+    3611,
- /**/
-     3582,
- /**/
diff --git a/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-m=
emory-access-if-buffer-name-.patch b/meta/recipes-support/vim/files/0003-=
patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
deleted file mode 100644
index 576664f436..0000000000
--- a/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-a=
ccess-if-buffer-name-.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-CVE: CVE-2021-3872
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 61629ea24a2fff1f89c37479d3fb52f17c3480fc Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Fri, 8 Oct 2021 18:39:28 +0100
-Subject: [PATCH] patch 8.2.3487: illegal memory access if buffer name is=
 very
- long
-
-Problem:    Illegal memory access if buffer name is very long.
-Solution:   Make sure not to go over the end of the buffer.
----
- src/drawscreen.c                | 10 +++++-----
- src/testdir/test_statusline.vim | 11 +++++++++++
- src/version.c                   |  2 ++
- 3 files changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/src/drawscreen.c b/src/drawscreen.c
-index 3a88ee979..9acb70552 100644
---- a/src/drawscreen.c
-+++ b/src/drawscreen.c
-@@ -446,13 +446,13 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
- 	    *(p + len++) =3D ' ';
- 	if (bt_help(wp->w_buffer))
- 	{
--	    STRCPY(p + len, _("[Help]"));
-+	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Help]"));
- 	    len +=3D (int)STRLEN(p + len);
- 	}
- #ifdef FEAT_QUICKFIX
- 	if (wp->w_p_pvw)
- 	{
--	    STRCPY(p + len, _("[Preview]"));
-+	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[Preview]")=
);
- 	    len +=3D (int)STRLEN(p + len);
- 	}
- #endif
-@@ -462,12 +462,12 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
- #endif
- 		)
- 	{
--	    STRCPY(p + len, "[+]");
--	    len +=3D 3;
-+	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", "[+]");
-+	    len +=3D (int)STRLEN(p + len);
- 	}
- 	if (wp->w_buffer->b_p_ro)
- 	{
--	    STRCPY(p + len, _("[RO]"));
-+	    vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[RO]"));
- 	    len +=3D (int)STRLEN(p + len);
- 	}
-=20
-diff --git a/src/testdir/test_statusline.vim b/src/testdir/test_statusli=
ne.vim
-index 1f705b847..91bce1407 100644
---- a/src/testdir/test_statusline.vim
-+++ b/src/testdir/test_statusline.vim
-@@ -393,3 +393,14 @@ func Test_statusline_visual()
-   bwipe! x1
-   bwipe! x2
- endfunc
-+" Used to write beyond allocated memory.  This assumes MAXPATHL is 4096=
 bytes.
-+func Test_statusline_verylong_filename()
-+  let fname =3D repeat('x', 4090)
-+  exe "new " .. fname
-+  set buftype=3Dhelp
-+  set previewwindow
-+  redraw
-+  bwipe!
-+endfunc
-+
-+" vim: shiftwidth=3D2 sts=3D2 expandtab
-diff --git a/src/version.c b/src/version.c
-index 1046993d6..2b5de5ccf 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -742,6 +742,8 @@ static char *(features[]) =3D
-=20
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
-+/**/
-+    3487,
- /**/
-     3428,
- /**/
diff --git a/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-er=
ror-after-search-with-range.patch b/meta/recipes-support/vim/files/0004-p=
atch-8.2.3489-ml_get-error-after-search-with-range.patch
deleted file mode 100644
index 045081579c..0000000000
--- a/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-aft=
er-search-with-range.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-CVE: CVE-2021-3875
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b8968e26d7508e7d64bfc86808142818b0a9288c Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Sat, 9 Oct 2021 13:58:55 +0100
-Subject: [PATCH] patch 8.2.3489: ml_get error after search with range
-
-Problem:    ml_get error after search with range.
-Solution:   Limit the line number to the buffer line count.
----
- src/ex_docmd.c              |  6 ++++--
- src/testdir/test_search.vim | 17 +++++++++++++++++
- src/version.c               |  2 ++
- 3 files changed, 23 insertions(+), 2 deletions(-)
-
-diff --git a/src/ex_docmd.c b/src/ex_docmd.c
-index fb07450f8..fde726477 100644
---- a/src/ex_docmd.c
-+++ b/src/ex_docmd.c
-@@ -3586,8 +3586,10 @@ get_address(
-=20
- 		    // When '/' or '?' follows another address, start from
- 		    // there.
--		    if (lnum !=3D MAXLNUM)
--			curwin->w_cursor.lnum =3D lnum;
-+		    if (lnum > 0 && lnum !=3D MAXLNUM)
-+			curwin->w_cursor.lnum =3D
-+				lnum > curbuf->b_ml.ml_line_count
-+					   ? curbuf->b_ml.ml_line_count : lnum;
-=20
- 		    // Start a forward search at the end of the line (unless
- 		    // before the first line).
-diff --git a/src/testdir/test_search.vim b/src/testdir/test_search.vim
-index 187671305..e142c3547 100644
---- a/src/testdir/test_search.vim
-+++ b/src/testdir/test_search.vim
-@@ -1366,3 +1366,20 @@ func Test_searchdecl()
-=20
-   bwipe!
- endfunc
-+
-+func Test_search_with_invalid_range()
-+  new
-+  let lines =3D<< trim END
-+    /\%.v
-+    5/
-+    c
-+  END
-+  call writefile(lines, 'Xrangesearch')
-+  source Xrangesearch
-+
-+  bwipe!
-+  call delete('Xrangesearch')
-+endfunc
-+
-+
-+" vim: shiftwidth=3D2 sts=3D2 expandtab
-diff --git a/src/version.c b/src/version.c
-index 2b5de5ccf..092864bbb 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -742,6 +742,8 @@ static char *(features[]) =3D
-=20
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
-+/**/
-+    3489,
- /**/
-     3487,
- /**/
diff --git a/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-m=
emory-access-when-scrolling-.patch b/meta/recipes-support/vim/files/0005-=
patch-8.2.3564-invalid-memory-access-when-scrolling-.patch
deleted file mode 100644
index 7184b37cad..0000000000
--- a/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-a=
ccess-when-scrolling-.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-CVE: CVE-2021-3903
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b15919c1fe0f7fc3d98ff5207ed2feb43c59009d Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Mon, 25 Oct 2021 17:07:04 +0100
-Subject: [PATCH] patch 8.2.3564: invalid memory access when scrolling wi=
thout
- valid screen
-
-Problem:    Invalid memory access when scrolling without a valid screen.
-Solution:   Do not set VALID_BOTLINE in w_valid.
----
- src/move.c                  |  1 -
- src/testdir/test_normal.vim | 23 ++++++++++++++++++++---
- src/version.c               |  2 ++
- 3 files changed, 22 insertions(+), 4 deletions(-)
-
-diff --git a/src/move.c b/src/move.c
-index 8e53d8bcb..10165ef4d 100644
---- a/src/move.c
-+++ b/src/move.c
-@@ -198,7 +198,6 @@ update_topline(void)
-     {
- 	curwin->w_topline =3D curwin->w_cursor.lnum;
- 	curwin->w_botline =3D curwin->w_topline;
--	curwin->w_valid |=3D VALID_BOTLINE|VALID_BOTLINE_AP;
- 	curwin->w_scbind_pos =3D 1;
- 	return;
-     }
-diff --git a/src/testdir/test_normal.vim b/src/testdir/test_normal.vim
-index d45cf4159..ca87928f5 100644
---- a/src/testdir/test_normal.vim
-+++ b/src/testdir/test_normal.vim
-@@ -33,14 +33,14 @@ func CountSpaces(type, ...)
-   else
-     silent exe "normal! `[v`]y"
-   endif
--  let g:a=3Dstrlen(substitute(@@, '[^ ]', '', 'g'))
-+  let g:a =3D strlen(substitute(@@, '[^ ]', '', 'g'))
-   let &selection =3D sel_save
-   let @@ =3D reg_save
- endfunc
-=20
- func OpfuncDummy(type, ...)
-   " for testing operatorfunc
--  let g:opt=3D&linebreak
-+  let g:opt =3D &linebreak
-=20
-   if a:0  " Invoked from Visual mode, use gv command.
-     silent exe "normal! gvy"
-@@ -51,7 +51,7 @@ func OpfuncDummy(type, ...)
-   endif
-   " Create a new dummy window
-   new
--  let g:bufnr=3Dbufnr('%')
-+  let g:bufnr =3D bufnr('%')
- endfunc
-=20
- fun! Test_normal00_optrans()
-@@ -718,6 +718,23 @@ func Test_normal17_z_scroll_hor2()
-   bw!
- endfunc
-=20
-+
-+func Test_scroll_in_ex_mode()
-+  " This was using invalid memory because w_botline was invalid.
-+  let lines =3D<< trim END
-+      diffsplit
-+      norm os0=030(=04
-+      call writefile(['done'], 'Xdone')
-+      qa!
-+  END
-+  call writefile(lines, 'Xscript')
-+  call assert_equal(1, RunVim([], [], '--clean -X -Z -e -s -S Xscript')=
)
-+  call assert_equal(['done'], readfile('Xdone'))
-+
-+  call delete('Xscript')
-+  call delete('Xdone')
-+endfunc
-+
- func Test_normal18_z_fold()
-   " basic tests for foldopen/folddelete
-   if !has("folding")
-diff --git a/src/version.c b/src/version.c
-index 092864bbb..a9e8be0e7 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -742,6 +742,8 @@ static char *(features[]) =3D
-=20
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
-+/**/
-+    3564,
- /**/
-     3489,
- /**/
diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/re=
cipes-support/vim/files/CVE-2021-3778.patch
deleted file mode 100644
index 544af04458..0000000000
--- a/meta/recipes-support/vim/files/CVE-2021-3778.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 6d351cec5b97cb72b226d03bd727e453a235ed8d Mon Sep 17 00:00:00 2001
-From: Minjae Kim <flowergom@gmail.com>
-Date: Sun, 26 Sep 2021 23:48:00 +0000
-Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid=
 utf-8
- character
-
-Problem: Reading beyond end of line with invalid utf-8 character.
-Solution: Check for NUL when advancing.
-
-Upstream-Status: Accepted [https://github.com/vim/vim/commit/65b60566599=
7fad54ef39a93199e305af2fe4d7f]
-CVE: CVE-2021-3778
-Signed-off-by: Minjae Kim <flowergom@gmail.com>
-
----
- src/regexp_nfa.c                 | 3 ++-
- src/testdir/test_regexp_utf8.vim | 7 +++++++
- src/version.c                    | 2 ++
- 3 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
-index fb512f961..ace83a1a3 100644
---- a/src/regexp_nfa.c
-+++ b/src/regexp_nfa.c
-@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, ch=
ar_u *match_text)
- 		match =3D FALSE;
- 		break;
- 	    }
--	    len2 +=3D MB_CHAR2LEN(c2);
-+	    len2 +=3D enc_utf8 ? utf_ptr2len(rex.line + col + len2)
-+                                                           : MB_CHAR2LE=
N(c2);
- 	}
- 	if (match
- 		// check that no composing char follows
-diff --git a/src/testdir/test_regexp_utf8.vim b/src/testdir/test_regexp_=
utf8.vim
-index 19ff882be..e0665818b 100644
---- a/src/testdir/test_regexp_utf8.vim
-+++ b/src/testdir/test_regexp_utf8.vim
-@@ -215,3 +215,10 @@ func Test_optmatch_toolong()
-   set re=3D0
- endfunc
-=20
-+func Test_match_invalid_byte()
-+  call writefile(0z630a.765d30aa0a.2e0a.790a.4030, 'Xinvalid')
-+  new
-+  source Xinvalid
-+  bwipe!
-+  call delete('Xinvalid')
-+endfunc
-diff --git a/src/version.c b/src/version.c
-index 8912f6215..85bdfc601 100644
---- a/src/version.c
-+++ b/src/version.c
-@@ -742,6 +742,8 @@ static char *(features[]) =3D
-=20
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
-+/**/
-+    3409,
- /**/
-     3402,
- /**/
diff --git a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5=
c58fb7ca9f9.patch b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5=
f7525a5c58fb7ca9f9.patch
deleted file mode 100644
index 1cee759502..0000000000
--- a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7c=
a9f9.patch
+++ /dev/null
@@ -1,207 +0,0 @@
-From b7081e135a16091c93f6f5f7525a5c58fb7ca9f9 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Sat, 4 Sep 2021 18:47:28 +0200
-Subject: [PATCH] patch 8.2.3402: invalid memory access when using :retab=
 with
- large value
-
-Problem:    Invalid memory access when using :retab with large value.
-Solution:   Check the number is positive.
-
-CVE: CVE-2021-3770
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Backport [https://github.com/vim/vim/commit/b7081e135a1=
6091c93f6f5f7525a5c58fb7ca9f9]
----
- src/indent.c               | 34 +++++++++++++++++++++-------------
- src/option.c               | 12 ++++++------
- src/optionstr.c            |  4 ++--
- src/testdir/test_retab.vim |  3 +++
- src/version.c              |  2 ++
- 5 files changed, 34 insertions(+), 21 deletions(-)
-
-Index: git/src/indent.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/src/indent.c
-+++ git/src/indent.c
-@@ -18,18 +18,19 @@
- /*
-  * Set the integer values corresponding to the string setting of 'varta=
bstop'.
-  * "array" will be set, caller must free it if needed.
-+ * Return FAIL for an error.
-  */
-     int
- tabstop_set(char_u *var, int **array)
- {
--    int valcount =3D 1;
--    int t;
--    char_u *cp;
-+    int	    valcount =3D 1;
-+    int	    t;
-+    char_u  *cp;
-=20
-     if (var[0] =3D=3D NUL || (var[0] =3D=3D '0' && var[1] =3D=3D NUL))
-     {
- 	*array =3D NULL;
--	return TRUE;
-+	return OK;
-     }
-=20
-     for (cp =3D var; *cp !=3D NUL; ++cp)
-@@ -43,8 +44,8 @@ tabstop_set(char_u *var, int **array)
- 		if (cp !=3D end)
- 		    emsg(_(e_positive));
- 		else
--		    emsg(_(e_invarg));
--		return FALSE;
-+		    semsg(_(e_invarg2), cp);
-+		return FAIL;
- 	    }
- 	}
-=20
-@@ -55,26 +56,33 @@ tabstop_set(char_u *var, int **array)
- 	    ++valcount;
- 	    continue;
- 	}
--	emsg(_(e_invarg));
--	return FALSE;
-+	semsg(_(e_invarg2), var);
-+	return FAIL;
-     }
-=20
-     *array =3D ALLOC_MULT(int, valcount + 1);
-     if (*array =3D=3D NULL)
--	return FALSE;
-+	return FAIL;
-     (*array)[0] =3D valcount;
-=20
-     t =3D 1;
-     for (cp =3D var; *cp !=3D NUL;)
-     {
--	(*array)[t++] =3D atoi((char *)cp);
--	while (*cp  !=3D NUL && *cp !=3D ',')
-+	int n =3D atoi((char *)cp);
-+
-+	if (n < 0 || n > 9999)
-+	{
-+	    semsg(_(e_invarg2), cp);
-+	    return FAIL;
-+	}
-+	(*array)[t++] =3D n;
-+	while (*cp !=3D NUL && *cp !=3D ',')
- 	    ++cp;
- 	if (*cp !=3D NUL)
- 	    ++cp;
-     }
-=20
--    return TRUE;
-+    return OK;
- }
-=20
- /*
-@@ -1556,7 +1564,7 @@ ex_retab(exarg_T *eap)
-=20
- #ifdef FEAT_VARTABS
-     new_ts_str =3D eap->arg;
--    if (!tabstop_set(eap->arg, &new_vts_array))
-+    if (tabstop_set(eap->arg, &new_vts_array) =3D=3D FAIL)
- 	return;
-     while (vim_isdigit(*(eap->arg)) || *(eap->arg) =3D=3D ',')
- 	++(eap->arg);
-Index: git/src/option.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/src/option.c
-+++ git/src/option.c
-@@ -2292,9 +2292,9 @@ didset_options2(void)
- #endif
- #ifdef FEAT_VARTABS
-     vim_free(curbuf->b_p_vsts_array);
--    tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
-+    (void)tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
-     vim_free(curbuf->b_p_vts_array);
--    tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
-+    (void)tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
- #endif
- }
-=20
-@@ -5756,7 +5756,7 @@ buf_copy_options(buf_T *buf, int flags)
- 	    buf->b_p_vsts =3D vim_strsave(p_vsts);
- 	    COPY_OPT_SCTX(buf, BV_VSTS);
- 	    if (p_vsts && p_vsts !=3D empty_option)
--		tabstop_set(p_vsts, &buf->b_p_vsts_array);
-+		(void)tabstop_set(p_vsts, &buf->b_p_vsts_array);
- 	    else
- 		buf->b_p_vsts_array =3D 0;
- 	    buf->b_p_vsts_nopaste =3D p_vsts_nopaste
-@@ -5914,7 +5914,7 @@ buf_copy_options(buf_T *buf, int flags)
- 		buf->b_p_isk =3D save_p_isk;
- #ifdef FEAT_VARTABS
- 		if (p_vts && p_vts !=3D empty_option && !buf->b_p_vts_array)
--		    tabstop_set(p_vts, &buf->b_p_vts_array);
-+		    (void)tabstop_set(p_vts, &buf->b_p_vts_array);
- 		else
- 		    buf->b_p_vts_array =3D NULL;
- #endif
-@@ -5929,7 +5929,7 @@ buf_copy_options(buf_T *buf, int flags)
- 		buf->b_p_vts =3D vim_strsave(p_vts);
- 		COPY_OPT_SCTX(buf, BV_VTS);
- 		if (p_vts && p_vts !=3D empty_option && !buf->b_p_vts_array)
--		    tabstop_set(p_vts, &buf->b_p_vts_array);
-+		    (void)tabstop_set(p_vts, &buf->b_p_vts_array);
- 		else
- 		    buf->b_p_vts_array =3D NULL;
- #endif
-@@ -6634,7 +6634,7 @@ paste_option_changed(void)
- 	    if (buf->b_p_vsts_array)
- 		vim_free(buf->b_p_vsts_array);
- 	    if (buf->b_p_vsts && buf->b_p_vsts !=3D empty_option)
--		tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
-+		(void)tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
- 	    else
- 		buf->b_p_vsts_array =3D 0;
- #endif
-Index: git/src/optionstr.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/src/optionstr.c
-+++ git/src/optionstr.c
-@@ -2166,7 +2166,7 @@ did_set_string_option(
- 	    if (errmsg =3D=3D NULL)
- 	    {
- 		int *oldarray =3D curbuf->b_p_vsts_array;
--		if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)))
-+		if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)) =3D=3D OK)
- 		{
- 		    if (oldarray)
- 			vim_free(oldarray);
-@@ -2205,7 +2205,7 @@ did_set_string_option(
- 	    {
- 		int *oldarray =3D curbuf->b_p_vts_array;
-=20
--		if (tabstop_set(*varp, &(curbuf->b_p_vts_array)))
-+		if (tabstop_set(*varp, &(curbuf->b_p_vts_array)) =3D=3D OK)
- 		{
- 		    vim_free(oldarray);
- #ifdef FEAT_FOLDING
-Index: git/src/testdir/test_retab.vim
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/src/testdir/test_retab.vim
-+++ git/src/testdir/test_retab.vim
-@@ -74,4 +74,7 @@ endfunc
- func Test_retab_error()
-   call assert_fails('retab -1',  'E487:')
-   call assert_fails('retab! -1', 'E487:')
-+  call assert_fails('ret -1000', 'E487:')
-+  call assert_fails('ret 10000', 'E475:')
-+  call assert_fails('ret 80000000000000000000', 'E475:')
- endfunc
-Index: git/src/version.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/src/version.c
-+++ git/src/version.c
-@@ -743,6 +743,8 @@ static char *(features[]) =3D
- static int included_patches[] =3D
- {   /* Add new patch number below this line */
- /**/
-+    3402,
-+/**/
-     0
- };
-=20
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index a0692755b6..dc11a0aabb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -8,8 +8,9 @@ BUGTRACKER =3D "https://github.com/vim/vim/issues"
 DEPENDS =3D "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS:${PN} =3D "diffutils"
+
 LICENSE =3D "vim"
-LIC_FILES_CHKSUM =3D "file://runtime/doc/uganda.txt;endline=3D287;md5=3D=
a19edd7ec70d573a005d9e509375a99a"
+LIC_FILES_CHKSUM =3D "file://runtime/doc/uganda.txt;endline=3D287;md5=3D=
909f1394892b7e0f9c2a95306c0c552b"
=20
 SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhtt=
ps \
            file://disable_acl_header_check.patch \
@@ -17,18 +18,10 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dma=
ster;protocol=3Dhttps \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
-           file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
-           file://CVE-2021-3778.patch \
-           file://0002-patch-8.2.3428-using-freed-memory-when-replacing.=
patch \
-           file://0003-patch-8.2.3487-illegal-memory-access-if-buffer-na=
me-.patch \
-           file://0004-patch-8.2.3489-ml_get-error-after-search-with-ran=
ge.patch \
-           file://0005-patch-8.2.3564-invalid-memory-access-when-scrolli=
ng-.patch \
-           file://0001-patch-8.2.3581-reading-character-past-end-of-line=
.patch \
-           file://0002-patch-8.2.3582-reading-uninitialized-memory-when-=
giv.patch \
-           file://0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-=
fin.patch \
            "
=20
-SRCREV =3D "98056533b96b6b5d8849641de93185dd7bcadc44"
+PV .=3D ".3752"
+SRCREV =3D "8603be338ac810446f23c092f21bc6082f787519"
=20
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
--=20
2.25.1


