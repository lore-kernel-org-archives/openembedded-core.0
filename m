Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A572C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 12:53:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21641.1636980812294269306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 04:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 050416D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 04:53:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FAC13F766
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 04:53:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: fix CVE-2021-3927 and CVE-2021-3928
Date: Mon, 15 Nov 2021 12:53:28 +0000
Message-Id: <20211115125328.2663570-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 12:53:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158283

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-reading-character-past-end-of-line.patch | 62 ++++++++++++++++++
 ...eading-uninitialized-memory-when-giv.patch | 63 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 3 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581-re=
ading-character-past-end-of-line.patch
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582-re=
ading-uninitialized-memory-when-giv.patch

diff --git a/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-c=
haracter-past-end-of-line.patch b/meta/recipes-support/vim/files/0001-pat=
ch-8.2.3581-reading-character-past-end-of-line.patch
new file mode 100644
index 0000000000..28c61cd782
--- /dev/null
+++ b/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-characte=
r-past-end-of-line.patch
@@ -0,0 +1,62 @@
+CVE: CVE-2021-3927
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 93b427c6e729260d0700c3b2804ec153bc8284fa Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Thu, 4 Nov 2021 15:10:11 +0000
+Subject: [PATCH] patch 8.2.3581: reading character past end of line
+
+Problem:    Reading character past end of line.
+Solution:   Correct the cursor column.
+---
+ src/ex_docmd.c           |  1 +
+ src/testdir/test_put.vim | 12 ++++++++++++
+ src/version.c            |  2 ++
+ 3 files changed, 15 insertions(+)
+
+diff --git a/src/ex_docmd.c b/src/ex_docmd.c
+index fde726477..59e245bee 100644
+--- a/src/ex_docmd.c
++++ b/src/ex_docmd.c
+@@ -6905,6 +6905,7 @@ ex_put(exarg_T *eap)
+ 	eap->forceit =3D TRUE;
+     }
+     curwin->w_cursor.lnum =3D eap->line2;
++    check_cursor_col();
+     do_put(eap->regname, eap->forceit ? BACKWARD : FORWARD, 1L,
+ 						       PUT_LINE|PUT_CURSLINE);
+ }
+diff --git a/src/testdir/test_put.vim b/src/testdir/test_put.vim
+index 225ebd1f3..922e5b269 100644
+--- a/src/testdir/test_put.vim
++++ b/src/testdir/test_put.vim
+@@ -113,3 +113,15 @@ func Test_put_p_indent_visual()
+   call assert_equal('select that text', getline(2))
+   bwipe!
+ endfunc
++
++func Test_put_above_first_line()
++  new
++  let @" =3D 'text'
++  silent! normal 0o00
++  0put
++  call assert_equal('text', getline(1))
++  bwipe!
++endfunc
++
++
++" vim: shiftwidth=3D2 sts=3D2 expandtab
+diff --git a/src/version.c b/src/version.c
+index a9e8be0e7..df4ec9a47 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =3D
+=20
+ static int included_patches[] =3D
+ {   /* Add new patch number below this line */
++/**/
++    3581,
+ /**/
+     3564,
+ /**/
diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-u=
ninitialized-memory-when-giv.patch b/meta/recipes-support/vim/files/0002-=
patch-8.2.3582-reading-uninitialized-memory-when-giv.patch
new file mode 100644
index 0000000000..d117a98893
--- /dev/null
+++ b/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitia=
lized-memory-when-giv.patch
@@ -0,0 +1,63 @@
+CVE: CVE-2021-3928
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ade0f0481969f1453c60e7c8354b00dfe4238739 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Thu, 4 Nov 2021 15:46:05 +0000
+Subject: [PATCH] patch 8.2.3582: reading uninitialized memory when givin=
g
+ spell suggestions
+
+Problem:    Reading uninitialized memory when giving spell suggestions.
+Solution:   Check that preword is not empty.
+---
+ src/spellsuggest.c         | 2 +-
+ src/testdir/test_spell.vim | 8 ++++++++
+ src/version.c              | 2 ++
+ 3 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/spellsuggest.c b/src/spellsuggest.c
+index 9d6df7930..8615d5280 100644
+--- a/src/spellsuggest.c
++++ b/src/spellsuggest.c
+@@ -1600,7 +1600,7 @@ suggest_trie_walk(
+ 		    // char, e.g., "thes," -> "these".
+ 		    p =3D fword + sp->ts_fidx;
+ 		    MB_PTR_BACK(fword, p);
+-		    if (!spell_iswordp(p, curwin))
++		    if (!spell_iswordp(p, curwin) && *preword !=3D NUL)
+ 		    {
+ 			p =3D preword + STRLEN(preword);
+ 			MB_PTR_BACK(preword, p);
+diff --git a/src/testdir/test_spell.vim b/src/testdir/test_spell.vim
+index 79fb8927c..e435e9172 100644
+--- a/src/testdir/test_spell.vim
++++ b/src/testdir/test_spell.vim
+@@ -498,6 +498,14 @@ func Test_spell_screendump()
+   call delete('XtestSpell')
+ endfunc
+=20
++func Test_spell_single_word()
++  new
++  silent! norm 0R00
++  spell! =C3=9F=C3=82
++  silent 0norm 0r$ Dvz=3D
++  bwipe!
++endfunc
++
+ let g:test_data_aff1 =3D [
+       \"SET ISO8859-1",
+       \"TRY esianrtolcdugmphbyfvkwjkqxz-\xEB\xE9\xE8\xEA\xEF\xEE\xE4\xE=
0\xE2\xF6\xFC\xFB'ESIANRTOLCDUGMPHBYFVKWJKQXZ",
+diff --git a/src/version.c b/src/version.c
+index df4ec9a47..e1bc0d09b 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =3D
+=20
+ static int included_patches[] =3D
+ {   /* Add new patch number below this line */
++/**/
++    3582,
+ /**/
+     3581,
+ /**/
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index 943856e07c..d0957bfeae 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
            file://0003-patch-8.2.3487-illegal-memory-access-if-buffer-na=
me-.patch \
            file://0004-patch-8.2.3489-ml_get-error-after-search-with-ran=
ge.patch \
            file://0005-patch-8.2.3564-invalid-memory-access-when-scrolli=
ng-.patch \
+           file://0001-patch-8.2.3581-reading-character-past-end-of-line=
.patch \
+           file://0002-patch-8.2.3582-reading-uninitialized-memory-when-=
giv.patch \
            "
=20
 SRCREV =3D "98056533b96b6b5d8849641de93185dd7bcadc44"
--=20
2.25.1


