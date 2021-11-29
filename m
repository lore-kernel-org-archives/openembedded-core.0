Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A00C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:10:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.62203.1638198607999497684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75B801042
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:10:07 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D9A13F766
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:10:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: fix CVE-2021-3968 and CVE-2021-3973
Date: Mon, 29 Nov 2021 15:10:05 +0000
Message-Id: <20211129151005.276453-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:10:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158950

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...rash-when-ModeChanged-triggered-too-.patch | 41 +++++++++
 ...rash-when-using-CTRL-W-f-without-fin.patch | 92 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 3 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3610-cr=
ash-when-ModeChanged-triggered-too-.patch
 create mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-cr=
ash-when-using-CTRL-W-f-without-fin.patch

diff --git a/meta/recipes-support/vim/files/0001-patch-8.2.3610-crash-whe=
n-ModeChanged-triggered-too-.patch b/meta/recipes-support/vim/files/0001-=
patch-8.2.3610-crash-when-ModeChanged-triggered-too-.patch
new file mode 100644
index 0000000000..0f774df251
--- /dev/null
+++ b/meta/recipes-support/vim/files/0001-patch-8.2.3610-crash-when-ModeC=
hanged-triggered-too-.patch
@@ -0,0 +1,41 @@
+CVE: CVE-2021-3968
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 54a16b2da3a0f664ca7fd182c16d2c2b8ea8131f Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Wed, 17 Nov 2021 16:52:40 +0000
+Subject: [PATCH] patch 8.2.3610: crash when ModeChanged triggered too ea=
rly
+
+Problem:    Crash when ModeChanged triggered too early.
+Solution:   Trigger ModeChanged after setting VIsual.
+---
+ src/normal.c  | 1 +
+ src/version.c | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/src/normal.c b/src/normal.c
+index d6333b948..7cb959257 100644
+--- a/src/normal.c
++++ b/src/normal.c
+@@ -5675,6 +5675,7 @@ n_start_visual_mode(int c)
+     foldAdjustVisual();
+ #endif
+=20
++    trigger_modechanged();
+     setmouse();
+ #ifdef FEAT_CONCEAL
+     // Check for redraw after changing the state.
+diff --git a/src/version.c b/src/version.c
+index e1bc0d09b..52be3c39d 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =3D
+=20
+ static int included_patches[] =3D
+ {   /* Add new patch number below this line */
++/**/
++    3610,
+ /**/
+     3582,
+ /**/
diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-whe=
n-using-CTRL-W-f-without-fin.patch b/meta/recipes-support/vim/files/0002-=
patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch
new file mode 100644
index 0000000000..0ab472189b
--- /dev/null
+++ b/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using=
-CTRL-W-f-without-fin.patch
@@ -0,0 +1,92 @@
+CVE: CVE-2021-3973
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b6154e9f530544ddc3130d981caae0dabc053757 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Wed, 17 Nov 2021 18:00:31 +0000
+Subject: [PATCH] patch 8.2.3611: crash when using CTRL-W f without findi=
ng a
+ file name  Problem:    Crash when using CTRL-W f without finding
+ a file name. Solution:   Bail out when the file name length is zero.
+
+---
+ src/findfile.c              | 8 ++++++++
+ src/normal.c                | 6 ++++--
+ src/testdir/test_visual.vim | 8 ++++++++
+ src/version.c               | 2 ++
+ 4 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/src/findfile.c b/src/findfile.c
+index dba547da1..5764fd7b8 100644
+--- a/src/findfile.c
++++ b/src/findfile.c
+@@ -1727,6 +1727,9 @@ find_file_in_path_option(
+     proc->pr_WindowPtr =3D (APTR)-1L;
+ # endif
+=20
++    if (len =3D=3D 0)
++	return NULL;
++
+     if (first =3D=3D TRUE)
+     {
+ 	// copy file name into NameBuff, expanding environment variables
+@@ -2094,7 +2097,12 @@ find_file_name_in_path(
+     int		c;
+ # if defined(FEAT_FIND_ID) && defined(FEAT_EVAL)
+     char_u	*tofree =3D NULL;
++# endif
+=20
++    if (len =3D=3D 0)
++	return NULL;
++
++# if defined(FEAT_FIND_ID) && defined(FEAT_EVAL)
+     if ((options & FNAME_INCL) && *curbuf->b_p_inex !=3D NUL)
+     {
+ 	tofree =3D eval_includeexpr(ptr, len);
+diff --git a/src/normal.c b/src/normal.c
+index 7cb959257..f0084f2ac 100644
+--- a/src/normal.c
++++ b/src/normal.c
+@@ -3778,8 +3778,10 @@ get_visual_text(
+ 	    *pp =3D ml_get_pos(&VIsual);
+ 	    *lenp =3D curwin->w_cursor.col - VIsual.col + 1;
+ 	}
+-	if (has_mbyte)
+-	    // Correct the length to include the whole last character.
++	if (**pp =3D=3D NUL)
++	    *lenp =3D 0;
++	if (has_mbyte && *lenp > 0)
++	    // Correct the length to include all bytes of the last character.
+ 	    *lenp +=3D (*mb_ptr2len)(*pp + (*lenp - 1)) - 1;
+     }
+     reset_VIsual_and_resel();
+diff --git a/src/testdir/test_visual.vim b/src/testdir/test_visual.vim
+index ae281238e..0705fdb57 100644
+--- a/src/testdir/test_visual.vim
++++ b/src/testdir/test_visual.vim
+@@ -894,4 +894,12 @@ func Test_block_insert_replace_tabs()
+   bwipe!
+ endfunc
+=20
++func Test_visual_block_ctrl_w_f()
++  " Emtpy block selected in new buffer should not result in an error.
++  au! BufNew foo sil norm =16=17f
++  edit foo
++
++  au! BufNew
++endfunc
++
+ " vim: shiftwidth=3D2 sts=3D2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 52be3c39d..59a314b3a 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =3D
+=20
+ static int included_patches[] =3D
+ {   /* Add new patch number below this line */
++/**/
++    3611,
+ /**/
+     3610,
+ /**/
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
index d0957bfeae..7b2928675d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -25,6 +25,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
            file://0005-patch-8.2.3564-invalid-memory-access-when-scrolli=
ng-.patch \
            file://0001-patch-8.2.3581-reading-character-past-end-of-line=
.patch \
            file://0002-patch-8.2.3582-reading-uninitialized-memory-when-=
giv.patch \
+           file://0001-patch-8.2.3610-crash-when-ModeChanged-triggered-t=
oo-.patch \
+           file://0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-=
fin.patch \
            "
=20
 SRCREV =3D "98056533b96b6b5d8849641de93185dd7bcadc44"
--=20
2.25.1


