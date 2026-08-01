Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18340C55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:12 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=im9//+Br;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=4125; q=dns/txt;
  s=NAESA-Selector1; t=1785575525; x=1817111525;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6LdUiqI5gVA+r6+4hbaAMkdyXLs+jqLKf1QJzcX1Lt8=;
  b=im9//+Brzoa12Xbkb0F0KduLDQlvMzyf1agJpW86eA9A/xtztL9mXcVr
   VrFrm0GQKkKipWwNxQkeS20eaRYZ8UcqLGHixs2wqmnAYbsDcwe+6WCZe
   REXJdfXBszdN74VDUOzuMJiVi/tBVFyXjR2SsIQUD6YzDe92X6sujmonr
   kqQof6AP+BYzH8cf9G/fIBoVXCawFJMqDCN2O/lzav6zxPrSW5itX/z5x
   /fZ5+oEwpSXdHTUKo19ORo93OV7dMuxs5yf8sNOa3CDtjtS5yCcvkidTb
   yonIkxfezrmmelDLceodHfWzmVmiqdGJ1aZC3RCCfxHoFGbpouHZomQXE
   w==;
X-CSE-ConnectionGUID: O3Y94HLgQpuHOKojegB70Q==
X-CSE-MsgGUID: bdnc4AlFS2COubWdSiAgcw==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911524"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:12:04 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 06/10] vim: Fix for CVE-2026-57455
Date: Sat,  1 Aug 2026 14:40:23 +0530
Message-ID: <20260801091145.2788751-6-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
References: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242484

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/497f931f85339d175d7f69588dd249e8ccfed41b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57455

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-57455.patch            | 87 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57455.patch b/meta/recipes-support/vim/files/CVE-2026-57455.patch
new file mode 100644
index 0000000000..8b5bd0e0e8
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57455.patch
@@ -0,0 +1,87 @@
+From f2744f3810cee1c63850e58f85cda299a2c20ce3 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 21 Jun 2026 19:20:03 +0000
+Subject: [PATCH] patch 9.2.0698: [security]: Out-of-bounds write with
+ soundfold()
+
+Problem:  [security]: Out-of-bounds write with soundfold()
+          (cipher-creator)
+Solution: Add an abort condition to the for loop to validate the buffer
+          size.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-q8mh-6qm3-25g4
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/497f931f85339d175d7f69588dd249e8ccfed41b]
+CVE: CVE-2026-57455
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/spell.c                    |  2 +-
+ src/testdir/test_spellfile.vim | 21 +++++++++++++++++++++
+ src/version.c                  |  2 ++
+ 3 files changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 72d1f0b52..e0fc17bfb 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -3270,7 +3270,7 @@ spell_soundfold_sofo(slang_T *slang, char_u *inword, char_u *res)
+     else
+     {
+ 	// The sl_sal_first[] table contains the translation.
+-	for (s = inword; (c = *s) != NUL; ++s)
++	for (s = inword; (c = *s) != NUL && ri < MAXWLEN - 1; ++s)
+ 	{
+ 	    if (VIM_ISWHITE(c))
+ 		c = ' ';
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 5b2ed4efd..50afe3dfa 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1224,4 +1224,25 @@ func Test_spell_sug_tree_count_words_overflow()
+   bwipe!
+ endfunc
+ 
++" A word longer than MAXWLEN must not overflow the soundfold result buffer in
++" the single-byte SOFO branch of spell_soundfold_sofo().
++func Test_soundfold_overflow()
++  let _enc=&enc
++  set enc=latin1
++  call writefile(['SOFOFROM ab', 'SOFOTO xy'], 'Xtest.aff', 'D')
++  call writefile(['1', 'foo'], 'Xtest.dic', 'D')
++  mkspell! Xtest Xtest
++  defer delete('Xtest.latin1.spl')
++  defer delete('Xtest.latin1.sug')
++  setl spelllang=Xtest.latin1.spl spell
++
++  " Before the fix the copy loop wrote one byte per input byte into a
++  " MAXWLEN (254) stack buffer with no upper bound, smashing the stack.
++  let sound = soundfold(repeat('ab', 300))
++  call assert_true(strlen(sound) < 254, 'soundfold result exceeds MAXWLEN')
++
++  set spell& spelllang&
++  let &enc = _enc
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 80d3cc7f5..d3b72595f 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    698,
+ /**/
+     679,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 93b8ba3970..8c5a5e88a9 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57451.patch \
            file://CVE-2026-57453.patch \
            file://CVE-2026-57454.patch \
+           file://CVE-2026-57455.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


