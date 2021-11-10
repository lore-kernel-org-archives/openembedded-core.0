Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0B3C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 10:26:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10196.1636539996717891384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 02:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B3B101E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 02:26:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FBBF3F718
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 02:26:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: add patch number to CVE-2021-3778 patch
Date: Wed, 10 Nov 2021 10:26:27 +0000
Message-Id: <20211110102627.2124278-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 10:26:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158062

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../vim/files/CVE-2021-3778.patch             | 37 +++++++++++++------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/re=
cipes-support/vim/files/CVE-2021-3778.patch
index 769a7a07ac..544af04458 100644
--- a/meta/recipes-support/vim/files/CVE-2021-3778.patch
+++ b/meta/recipes-support/vim/files/CVE-2021-3778.patch
@@ -1,4 +1,4 @@
-From eb41373c8c88b0789e5cf04669d6116f9a199264 Mon Sep 17 00:00:00 2001
+From 6d351cec5b97cb72b226d03bd727e453a235ed8d Mon Sep 17 00:00:00 2001
 From: Minjae Kim <flowergom@gmail.com>
 Date: Sun, 26 Sep 2021 23:48:00 +0000
 Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid=
 utf-8
@@ -10,16 +10,18 @@ Solution: Check for NUL when advancing.
 Upstream-Status: Accepted [https://github.com/vim/vim/commit/65b60566599=
7fad54ef39a93199e305af2fe4d7f]
 CVE: CVE-2021-3778
 Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
 ---
  src/regexp_nfa.c                 | 3 ++-
  src/testdir/test_regexp_utf8.vim | 7 +++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
+ src/version.c                    | 2 ++
+ 3 files changed, 11 insertions(+), 1 deletion(-)
=20
-Index: git/src/regexp_nfa.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/src/regexp_nfa.c
-+++ git/src/regexp_nfa.c
-@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int re
+diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
+index fb512f961..ace83a1a3 100644
+--- a/src/regexp_nfa.c
++++ b/src/regexp_nfa.c
+@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, ch=
ar_u *match_text)
  		match =3D FALSE;
  		break;
  	    }
@@ -29,10 +31,10 @@ Index: git/src/regexp_nfa.c
  	}
  	if (match
  		// check that no composing char follows
-Index: git/src/testdir/test_regexp_utf8.vim
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- git.orig/src/testdir/test_regexp_utf8.vim
-+++ git/src/testdir/test_regexp_utf8.vim
+diff --git a/src/testdir/test_regexp_utf8.vim b/src/testdir/test_regexp_=
utf8.vim
+index 19ff882be..e0665818b 100644
+--- a/src/testdir/test_regexp_utf8.vim
++++ b/src/testdir/test_regexp_utf8.vim
 @@ -215,3 +215,10 @@ func Test_optmatch_toolong()
    set re=3D0
  endfunc
@@ -44,3 +46,16 @@ Index: git/src/testdir/test_regexp_utf8.vim
 +  bwipe!
 +  call delete('Xinvalid')
 +endfunc
+diff --git a/src/version.c b/src/version.c
+index 8912f6215..85bdfc601 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =3D
+=20
+ static int included_patches[] =3D
+ {   /* Add new patch number below this line */
++/**/
++    3409,
+ /**/
+     3402,
+ /**/
--=20
2.25.1


