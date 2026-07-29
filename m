Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B424C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:38:30 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7646.1785317906607731683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=GapA9dyS;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3878; q=dns/txt;
  s=NAESA-Selector1; t=1785317907; x=1816853907;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V5DK5ruoN7BznilX/T4UKWP/kOERYAhd0BF8vgobldk=;
  b=GapA9dySsEYOZQdvWrexnt5S+AG5NLcx86I0F7nHJo/JGwuDpus1nM4K
   fgiMLrem/fIXCdbeZjV3lNtF9NUGVJYJuR/rDMKizveIk8gGDHb/UJobA
   VwP2uqCOCHjEgirI4ddrcxsFYgs3GVZ457fR3jiKYbdMf4iX3shRUe6vQ
   sieKMYvYB7B8GrOiRYevzqNbQrkfBiZLMvEyaBvjQa7tcOwqiZr9n+XHJ
   wAnB+dpvRDF6dvmlH4BK83xSYDRhpolQJN9/CdhAlIyrdhZR/YJmPOXdh
   D11IWqba10VoyJ66g4lDvkzqsU94q4uZZVjUZbLb81uUG9aFAbGrvEFGa
   Q==;
X-CSE-ConnectionGUID: +ebETTEMRdaIN3Gr33Z36w==
X-CSE-MsgGUID: MXNXzLYqQCuk/3KZGIWI7w==
X-IronPort-AV: E=Sophos;i="6.25,192,1779170400"; 
   d="scan'208";a="118670178"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 29 Jul 2026 03:38:25 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][wrynose][PATCH] vim: Fix for CVE-2026-57455
Date: Wed, 29 Jul 2026 15:08:18 +0530
Message-ID: <20260729093822.1269853-1-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 09:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242267

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/vim/vim/commit/497f931f85339d175d7f69588dd249e8ccfed41b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57455

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-57455.patch            | 77 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57455.patch b/meta/recipes-support/vim/files/CVE-2026-57455.patch
new file mode 100644
index 0000000000..c87b069173
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57455.patch
@@ -0,0 +1,77 @@
+From b4ed0eb9ed412eb769a13d50932978593b062623 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-57455
+Upstream-Status: Backport [https://github.com/vim/vim/commit/497f931f85339d175d7f69588dd249e8ccfed41b]
+
+Backport Changes:
+- Discarded the changes from src/version.c file as it includes patch
+number
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/spell.c                    |  2 +-
+ src/testdir/test_spellfile.vim | 21 +++++++++++++++++++++
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 01eb57e3a..060a2251a 100644
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
+index 8f3ef4907..b0b152b8c 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1197,4 +1197,25 @@ func Test_mkspell_no_buffer_overflow()
+ endfunc
+ 
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
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e34cc17fe5..402e39acff 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52858.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
+           file://CVE-2026-57455.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


