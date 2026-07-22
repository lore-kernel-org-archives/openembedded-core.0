Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043C1C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:33:54 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47117.1784723630136236652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Hiny98lh;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso12504147a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723629; x=1785328429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYyJQepaT7qKUKFUV0/pg84mP0BfdfU8waC2EXVSmY8=;
        b=Hiny98lhfER2F08XiBnraTL8jOG5o/Ty7d8rOxcwzBIzmH6JKn40U+QY8MtZyRgYfU
         E3XWv5gXawYfv9GncNhrPrZyCL7Smt3Vv2qgzi5s0drX3ZgfHwp80B1XaNqQ9HGgvB4N
         FUXrIbKT/kMMxsgIcRqIpIUV7nUBsrapKplvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723629; x=1785328429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYyJQepaT7qKUKFUV0/pg84mP0BfdfU8waC2EXVSmY8=;
        b=qY7ryY06pc/+J2BpMsbDrNha7XbHaPg7Kvpv6yQpPl0D1LtiIF+ZrVpd/pQOS0GSiP
         RO0DrCrsMStodPIibv7kwhS04r1jTyokiVkOck00jCqmucRtUmUDWFRJBG7jv083z3TT
         KfGOUqqGkqnQHJYktj7H+7tJYJzuSX5FJApkkU+QvZ5dBKo+9mOAo37OA8Z6QL4+a89X
         w/pv6ej39HxNlNt0ok6TMpTo9JTi1hBPyp0sWGynrJxBVMg/Dbf18q0C6y7MG1NEyp+A
         zIJ1LMFbL4vF+uoIvW+/fJz1bZmSPumEGDlws0o+EeaCAxUZFbrxFvTicJRX+8db3pYN
         /iNA==
X-Gm-Message-State: AOJu0Yys4Io2ceA6bp/f3ipyL0UuuZ//0HP+w+6/X7jAR8aXIdJbOKca
	Jzc5AJYuG2lHtT+AiSnJ1qldx5Gff6apE6Zhwso/Vu4cl8l6lXjLelHmdiQUUsCZa83GfEPvoC0
	EtxNpzKE=
X-Gm-Gg: AR+sD11Ipg9dU2uc6rwgTwzKIBp7G69QhoR33Owmbzy14VXrs6Z8KPzXARZJeczGKOc
	NVaX6ppWAUbgvGf9mQXzFkZaJCWOlcY5NlZW2fB2G/fHISBQNp94fh0mrqCZS39TqXUPkZjS0F7
	XYMwyW8BnCCoVB2iMtfzmqbkS8TWkOvyRFi9JEj+bGgyxmcFlL0dQAZxnqvRNbpWFCHdL9HlamM
	0kMwurHpmQYkt/Is/VHo7vRFfUyZ74+42rkkiE+qQ9iUPH3j1DkX//OfceI2bOIDPLAQfjK3u2D
	DKFYDYp+zZSdfiVeQlfiIbl8Ef4LTjzmDsYDJf6YcWOz0iO9Hssb+dY9XhGtjk+AfnKRMf4vNgC
	h0g8dkFoqT2kflxl/iIUgu2iywIXocVceIwE8vjaQ30AxktOmMlmbubrhP8v+hQG2Td0YP2tQsp
	VRm0yHJ9+91Bf6ZFMA3gMzXNfA7Ug=
X-Received: by 2002:a17:90b:544f:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38e4b5b7637mr23024537a91.43.1784723629197;
        Wed, 22 Jul 2026 05:33:49 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:33:48 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 01/10] vim: Fix CVE-2026-55693
Date: Wed, 22 Jul 2026 18:03:27 +0530
Message-ID: <20260722123336.587556-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241669

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55693
[2] https://security-tracker.debian.org/tracker/CVE-2026-55693

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-55693.patch            | 88 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55693.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55693.patch b/meta/recipes-support/vim/files/CVE-2026-55693.patch
new file mode 100644
index 0000000000..41f48ebfa5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55693.patch
@@ -0,0 +1,88 @@
+From a80874d9b84a01040e3d1aef2d4a59e1934dafb7 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/spellfile.c                |  4 ++--
+ src/testdir/test_spellfile.vim | 26 ++++++++++++++++++++++++++
+ 2 files changed, 28 insertions(+), 2 deletions(-)
+
+diff --git a/src/spellfile.c b/src/spellfile.c
+index 5102dad5b6..b3ee9c0d63 100644
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
+index 8f3ef4907d..4da270acea 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1196,5 +1196,31 @@ func Test_mkspell_no_buffer_overflow()
+   defer delete('Xbof2.spl')
+ endfunc
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
+ 
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e34cc17fe5..c0315dfed6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-52858.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
+           file://CVE-2026-55693.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


