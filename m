Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE83C61DE2
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3042.1787945893223081953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WjGfH2gZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499840a2575so8818255e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945891; x=1788550691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f59hMrO0MDyd9UXyry0PFInTEcN6l3bZfB/2vt3l9YI=;
        b=WjGfH2gZlX0uysBZmRWcqfdFN8hW3C7x+SPhLpSEPMVxkjaB3UDjHQWBu7HQJWjDFX
         oD2GsmwnQSgD+RbobqtUCz8WZJKG7hcXaD7y0nBY/CiDhXs3bBYsWe6pD7YCyxZs2e+D
         g7JbBxr46sf4dKB+PjvdSnSI4tPhDOOdg9FGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945891; x=1788550691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f59hMrO0MDyd9UXyry0PFInTEcN6l3bZfB/2vt3l9YI=;
        b=L7XPHUXqqv8f8+TchYtwXRunnplfQVXMHUSovdCb2V19/kKaR/c+vi3GMlGmfllb/v
         K2k3VXSf1Iuh0evILBtgAAG0jS3xjbB2N+gHCaB2NJmsi/dV35lqpUm3O1npOePjFUjG
         4uGMRnBEiRYVAEwkjOp7RTTutp9iz2HNR61gDNGWNCjpAoZ2n23ZNcHJgpBnvCIyfPxy
         GrE/35hjojW1o2xAG7pg5Z7MXkCmR3eUHM2hpgQE2jNjrKWa2rL2mxZqHbY5Y/BAs8DF
         /rsd+bsIppDYXVL9CCclQIwTX6NUPFra52kPN5UXQzg6i2VrAi/4vY2nYlgwl3YF2o1K
         0v3g==
X-Gm-Message-State: AFuF++ntPyDtRSXzFO4VuxipvHUNDkCAceCiCZ69Z4ldMskuS7PShFb6
	wCSrEQRnFStlde6mb7BZa8ItMFtZskDk/cQ/JS4XLnn5dF1JOQeM3P20/aoZDIgPUrqtDguwk+b
	MaO1Gksg=
X-Gm-Gg: AR+sD11sn7L0V2/4xZlDC6CmRBImWHiDI9C8g8cLPBrFGvB2KEtbNoaH6PH3Q3i6CP4
	FQvvGF+KWqEn1X16uoY3O8bjL09IXz4GjtRmww8cvM6WQlZ+nan9JSey0aM6QrLR0XOf6Ovgb8g
	q/PlP30mM8uMc0UlAPTsyDPXxveouUJZBv9ZQg96MM6teNbCYuQGyPhvlQ9/vXJkmh+z6VWAXBc
	mbQ6hOZl2GWQxJM6YlaWWkNCK8iJVayhioJld+npxXaIKDokWYClkYUwvKrfVyJpF3mgezGycU8
	eflvmZB2hduA9DXdnxe6GOFzwhqnt5h2v40Nb+nLWFS8DY0CM9fPLgzlaivPNlVrGuLmRQpZGgG
	KFd+D7Hs/x9+KJShlumnINlWVTq/4Vzj1yR1r92GeH6z8FyzBh0vlYg3NtrWa/wZQ0+kUWxukl6
	rsve1GeRophoaUSTmrwq8GWIbt5ydaEpZUaWWb5wGHWFgjoBGYxtVXeFbtxHqmBTyAy9R1ps8/o
	YzHzk/A862C5wpWNGb/zjXOy8rWOL1oAsdfSiYiGN6GupEf6aoaIK8w7X5Y3uuU
X-Received: by 2002:a05:600c:8b42:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-49b91c57d64mr149961385e9.15.1787945891381;
        Fri, 28 Aug 2026 12:38:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/56] vim: Fix for CVE-2026-55693
Date: Fri, 28 Aug 2026 21:35:23 +0200
Message-ID: <b871b38262575225b03303ad98f607f81e0b7fd1.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244574

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/a80874d9b84a01040e3d1aef2d4a59e1934dafb7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-55693

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-55693.patch            | 103 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55693.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55693.patch b/meta/recipes-support/vim/files/CVE-2026-55693.patch
new file mode 100644
index 00000000000..cc302d2a18a
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
index 20a5f7a0546..4189817a8d7 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-47167.patch \
            file://CVE-2026-55892.patch \
            file://CVE-2026-57452.patch \
+           file://CVE-2026-55693.patch \
            "
 
 PV .= ".0340"

