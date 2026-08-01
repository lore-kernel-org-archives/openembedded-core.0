Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A102C55174
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:12 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=UpPXQw01;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=5880; q=dns/txt;
  s=NAESA-Selector1; t=1785575530; x=1817111530;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=e+FXMB7LZiC5Sy+yfgEhm+N8ahgiw4icNNZwaUP0VDk=;
  b=UpPXQw01GcFtPPPcyzYpbNzbkWI/M34SoqV5JzjbW991r/8I2Bf0jMgq
   xbIcXPiY9+IxYQ02/iB2neTgxNr0810ghe6tT+AsTwxwzBFDUGwh5j/Qv
   8bHjJBVzSRyXOrMoPgTcqRg0Sk5BktQWyrnZXma/60O+hTmRdFwtytt3p
   5YnqX7ydvXAYPN930p5h1FKe5A5/0FYRJ38WrKaqWMRNVOjZehsGSGzze
   G2hNv+fgrkgIyoXQuOdAeFDQA8iwmPcoHDhqu2kxKsnwxmPKskrwa81Nq
   H4OHGHynvT2Cs1xFbLzFNElrFqTlIdWaZa/crE20vY/Qoh+UOHlHr+YUd
   A==;
X-CSE-ConnectionGUID: mcwflKMMSsCSC0CFJ0U2Hg==
X-CSE-MsgGUID: Bx4lo9qSSne2Jl8YIU4Ufw==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911528"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:12:09 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 09/10] vim: Fix for CVE-2026-59857
Date: Sat,  1 Aug 2026 14:40:26 +0530
Message-ID: <20260801091145.2788751-9-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
References: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242487

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/d22ff1c955ff87e8273210eae125aab0e85b6c30
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59857

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-59857.patch            | 125 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59857.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59857.patch b/meta/recipes-support/vim/files/CVE-2026-59857.patch
new file mode 100644
index 0000000000..656a5be888
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59857.patch
@@ -0,0 +1,125 @@
+From 0665e4c6f2723757814da2114a3bc7c85c6e1271 Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Mon, 22 Jun 2026 13:00:36 +0900
+Subject: [PATCH] patch 9.2.0725: [security]: Stack out-of-bounds write in
+ spell_soundfold_sal()
+
+Problem:  [security]: A crafted spell file with non-collapsing SAL rules
+          can make soundfold() write one byte past the end of the
+          MAXWLEN result buffer.  This is the same class of
+          out-of-bounds write as GHSA-q8mh-6qm3-25g4 (fixed in 9.2.0698
+          for the SOFO branch), found while auditing the surrounding
+          code.
+Solution: Bound the single-byte SAL result writes and the terminating
+          NUL to MAXWLEN - 1, matching the SOFO branch.
+
+The single-byte branch of spell_soundfold_sal() guarded its writes with
+"reslen < MAXWLEN", allowing reslen to reach MAXWLEN (254).  The trailing
+"res[reslen] = NUL" then wrote at index 254 of the 254-byte stack buffer
+res[MAXWLEN], an off-by-one out-of-bounds write.  Input is case-folded to
+about 253 characters, so a 253-character argument together with a SAL map
+that does not collapse (collapse_result false) reaches the boundary.
+
+Related to previous issue
+[GHSA-q8mh-6qm3-25g4](https://github.com/vim/vim/security/advisories/GHSA-q8mh-6qm3-25g4)
+(9.2.0698)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-m3hf-xcm3-xhm2
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
+Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/d22ff1c955ff87e8273210eae125aab0e85b6c30]
+CVE: CVE-2026-59857
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/spell.c                    |  6 +++---
+ src/testdir/test_spellfile.vim | 24 ++++++++++++++++++++++++
+ src/version.c                  |  2 ++
+ 3 files changed, 29 insertions(+), 3 deletions(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index e0fc17bfb..34f5edb55 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -3513,7 +3513,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 			// no '<' rule used
+ 			i += k - 1;
+ 			z = 0;
+-			while (*s != NUL && s[1] != NUL && reslen < MAXWLEN)
++			while (*s != NUL && s[1] != NUL && reslen < MAXWLEN - 1)
+ 			{
+ 			    if (reslen == 0 || res[reslen - 1] != *s)
+ 				res[reslen++] = *s;
+@@ -3523,7 +3523,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 			c = *s;
+ 			if (strstr((char *)pf, "^^") != NULL)
+ 			{
+-			    if (c != NUL)
++			    if (c != NUL && reslen < MAXWLEN - 1)
+ 				res[reslen++] = c;
+ 			    STRMOVE(word, word + i + 1);
+ 			    i = 0;
+@@ -3542,7 +3542,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 
+ 	if (z0 == 0)
+ 	{
+-	    if (k && !p0 && reslen < MAXWLEN && c != NUL
++	    if (k && !p0 && reslen < MAXWLEN - 1 && c != NUL
+ 		    && (!slang->sl_collapse || reslen == 0
+ 						     || res[reslen - 1] != c))
+ 		// condense only double letters
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 50afe3dfa..3a93883b4 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -387,6 +387,30 @@ func Test_spellfile_format_error()
+   let &rtp = save_rtp
+ endfunc
+ 
++" An over-length soundfold() argument must not overflow the MAXWLEN result
++" buffer in the single-byte branch of spell_soundfold_sal().
++func Test_spellfile_soundfold_sal_overflow()
++  let save_enc = &encoding
++  set encoding=latin1
++  " A SAL map that appends without collapsing, so the result is not shorter
++  " than the input.
++  call writefile(['SET ISO8859-1', 'SAL collapse_result false',
++	\ 'SAL a aaaa', 'SAL b bbbb'], 'Xsal.aff')
++  call writefile(['2', 'hello', 'world'], 'Xsal.dic')
++  mkspell! Xsal Xsal
++  set spl=Xsal.latin1.spl spell
++
++  " 253 input characters hit the buffer boundary; the result must not exceed
++  " MAXWLEN - 1.
++  call assert_true(strlen(soundfold(repeat('a', 253))) <= 253)
++
++  set nospell spl& spelllang&
++  call delete('Xsal.aff')
++  call delete('Xsal.dic')
++  call delete('Xsal.latin1.spl')
++  let &encoding = save_enc
++endfunc
++
+ " Test for format errors in suggest file
+ func Test_sugfile_format_error()
+   let save_rtp = &rtp
+diff --git a/src/version.c b/src/version.c
+index fbc2c8b15..ceea0d5e7 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -736,6 +736,8 @@ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
+     736,
++/**/
++    725,
+ /**/
+     699,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f0e54d71e0..9e2338fcb0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57455.patch \
            file://CVE-2026-57456.patch \
            file://CVE-2026-59856.patch \
+           file://CVE-2026-59857.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


