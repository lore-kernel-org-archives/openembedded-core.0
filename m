Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AD3C54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 09:12:01 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2447.1785575515784141923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 02:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=eC4J+Hoz;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=4821; q=dns/txt;
  s=NAESA-Selector1; t=1785575516; x=1817111516;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IpSIPR/ZLXxYvJc4HRCilk7kZjZXGwFMe7B1BxxspEo=;
  b=eC4J+Hoze8sdn9t+KWcFKSjFs/RKQTIwI6AU8ZtRSGs348cqfMtIX8HD
   NHxKJ8LYFGs5TseEVxKs63qH2qJkstH0L6pQfFSniF4U1zSPj3IqZ+r5n
   E46rx82lIXsyINYWcxZ7Ej40C7v2//2w19YNOy5+WJnWgdVCTDlCJ4as+
   vbd1yATE6BuKfE7p1KuPqb8XLCF+zGBs+wmHdoUmqYn7pCI4oViDLwIag
   R0d1KztTFsN6jZw/XssLNwtqh5URb5BXOEbrr3jkk/xPG1aV94dTw9wVy
   PqRyZBaBORmvTIlh7eYm+K6ECZaW7xmCjacx0baCTIazu87EqnrysprbG
   A==;
X-CSE-ConnectionGUID: d4PI0Pz3RR+VyDZfEGskeA==
X-CSE-MsgGUID: 6SSOXVCHQ/KmRRySmGTWsA==
X-IronPort-AV: E=Sophos;i="6.25,198,1779170400"; 
   d="scan'208";a="118911515"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.22.168])
  by naesa03out.arrow.com with ESMTP; 01 Aug 2026 03:11:54 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 01/10] vim: Fix for CVE-2026-55693
Date: Sat,  1 Aug 2026 14:40:18 +0530
Message-ID: <20260801091145.2788751-1-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 09:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242479

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/a80874d9b84a01040e3d1aef2d4a59e1934dafb7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-55693

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../vim/files/CVE-2026-55693.patch            | 103 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55693.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55693.patch b/meta/recipes-support/vim/files/CVE-2026-55693.patch
new file mode 100644
index 0000000000..cc302d2a18
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55693.patch
@@ -0,0 +1,103 @@
+From d64909ac1939bc91784de7f9b8d7705623d59f64 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 15 Jun 2026 19:39:08 +0000
+Subject: [PATCH] patch 9.2.0653: [security]: out-of-bounds write in
+ tree_count_words()
+
+Problem:  [security]: a crafted spell file can drive tree_count_words()
+          past the end of its MAXWLEN-sized depth arrays; the descent
+          loop has no depth bound.
+Solution: only descend while depth < MAXWLEN - 1, as the sibling trie
+          walkers already do; apply the same guard to sug_filltree().
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-wgh4-64f7-q3jq
+
+Supported by AI.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/a80874d9b84a01040e3d1aef2d4a59e1934dafb7]
+CVE: CVE-2026-55693
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/spellfile.c                |  4 ++--
+ src/testdir/test_spellfile.vim | 27 +++++++++++++++++++++++++++
+ src/version.c                  |  2 ++
+ 3 files changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/src/spellfile.c b/src/spellfile.c
+index 5102dad5b..b3ee9c0d6 100644
+--- a/src/spellfile.c
++++ b/src/spellfile.c
+@@ -642,7 +642,7 @@ tree_count_words(char_u *byts, idx_T *idxs)
+ 		    ++curi[depth];
+ 		}
+ 	    }
+-	    else
++	    else if (depth < MAXWLEN - 1)
+ 	    {
+ 		// Normal char, go one level deeper to count the words.
+ 		++depth;
+@@ -5656,7 +5656,7 @@ sug_filltree(spellinfo_T *spin, slang_T *slang)
+ 		    ++curi[depth];
+ 		}
+ 	    }
+-	    else
++	    else if (depth < MAXWLEN - 1)
+ 	    {
+ 		// Normal char, go one level deeper.
+ 		tword[depth++] = c;
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 8f3ef4907..5b2ed4efd 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1197,4 +1197,31 @@ func Test_mkspell_no_buffer_overflow()
+ endfunc
+ 
+ 
++func Test_spell_sug_tree_count_words_overflow()
++  " A crafted .spl/.sug pair with a BY_INDEX self-cycle in the fold word tree
++  " parses cleanly (shared refs aren't recursed, so read_tree_node()'s depth
++  " cap never trips), but drove tree_count_words() past its MAXWLEN-sized depth
++  " arrays -> stack out-of-bounds write.  The walk only happens when
++  " spellsuggest() loads the matching .sug.  Reaching the assert == no OOB.
++  call mkdir('Xrtp/spell', 'pR')
++  " VIMspell + v50, SN_SUGFILE(ts), SN_END, LWORDTREE{node:1,BY_INDEX->0,'A'},
++  " empty KWORDTREE/PREFIXTREE
++  let spl = eval('0z56494D7370656C6C320B0000000008000000001234'
++        \ .. '5678FF000000020101000000410000000000000000')
++  " VIMsug + v1, matching ts, SUGWORDTREE word "a", empty SUGTABLE
++  let sug = 0z56494D737567010000000012345678000000040161010000000000
++  call writefile(spl, 'Xrtp/spell/xx.utf-8.spl', 'b')
++  call writefile(sug, 'Xrtp/spell/xx.utf-8.sug', 'b')
++
++  new
++  set runtimepath+=./Xrtp
++  set spelllang=xx
++  set spell
++  " Unpatched: OOB write here (ASan abort, or crash).  Patched: returns a list.
++  call assert_equal(v:t_list, type(spellsuggest('helloo')))
++
++  set spell& spelllang& runtimepath&
++  bwipe!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 6eac3fc92..e7f323854 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -736,6 +736,8 @@ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
+     671,
++/**/
++    653,
+ /**/
+     662,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 20a5f7a054..4189817a8d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-47167.patch \
            file://CVE-2026-55892.patch \
            file://CVE-2026-57452.patch \
+           file://CVE-2026-55693.patch \
            "
 
 PV .= ".0340"
-- 
2.53.0


