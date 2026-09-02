Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9C0C61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5673.1788326822649841758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z2nNyqNs;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so3741785e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326821; x=1788931621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=za9lQzWTsrGVpZQ9cILX/7yNl5yu3tkOJq565O1kenI=;
        b=Z2nNyqNs4dzepRp/ZPXTRsrkXAVg9mD5QEkRg8mA7K0D5bbsdgh4yGY54hp1CvojQD
         CXMIxGboVamvYuPkeGiWKoh0Tdf/BUWDUot2eRo27R/FXNV1Cos1yQFj+7iyJ6g3QLqL
         8kfeG6lpYrCn8egFxlhoEm0fgTq5FFQluYxXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326821; x=1788931621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=za9lQzWTsrGVpZQ9cILX/7yNl5yu3tkOJq565O1kenI=;
        b=EGBdqNsnUD0xAYSf1RDKCm/od9W0sHBfzy9NRTybhypbeEZbXhGcky0S6Pq/1puEDX
         pKGW4G4jMJIXWX25/oeW748SE057RSZTUSCY7qiJPN1d0d6t4OspMS4X9/u5eK0RI9uN
         GIMKgp4QM3hQnqHsIxJK+jug+RWZNbRy+xc7Wjdggp1fIJR2DRoKr1aPl4ZrmXqNkDqs
         Lph3A6y4cWWctCte19xGhlC9GLW/FB69YLClVtq8uRdET40djG3P8MZDvORPVA6CsT9z
         kqu5a756DLOvZIHGf5ME0e34yYj+gvwQUXf5JkGSUDfHSdBLG3G1Nylz2i8xpFIhjBEd
         kV0w==
X-Gm-Message-State: AFuF++mCHenMVj1GPxQ/uvNoyDhSRaAnVC6H9KOu+RJRLBMjMXBwIxOY
	RLB8OUyHtzSFMgrwUTS7bxeJn7W0xrrr0g7rTyWjAX+SmWiV9Lps9qbe7XDezuc2A/ZLde51top
	zu+CqEhU=
X-Gm-Gg: AR+sD11Wzv3lunDm64/OjQT5WHYhdWV46gP6mOB6HsfN9+zY7tprv29uXB02EYhg8d2
	/Hzn8oQySXSmWzzJuBB9YskFgRzPaNqMERVLwckUNuIh8epZRay/LIhyBgnnoA71q+51qgrKgKm
	ZAH1hWsv1lWB40MjOCXhTXLjMtDzqnIfC4kLBk/GXGsf2vL3aoydT/Z/6LEIYSsGUWfTWccxFDZ
	9Cyz/sWcACbMnIm98fLEdQgz5vuzQYukMjVWYEiCgVCisFYVsC+jq6jgaBovxn9iPs1LeJ5K4rd
	KHznIjK0NNZluJHN7fjTkJut+63wY2oatoIAs4wJirhXQfuswXxA0Y9EmRlNI5FL3bFW1AEe1fX
	v1QtJcg5++83GwiJXPAiIBgZ0qH83ywgo0xtHVJDvXYN+ATr31ZipVdvJztNC/jhRwNkGpmanBE
	z1KrpgCQQBKRjFx7wjW7I4/hATFOIksdu38pZyjbxJDHUsB5YJSVs2m1ubjoVcH+yiLMgRmNjS0
	d+js91PpVszhRb2/g==
X-Received: by 2002:a05:600c:621b:b0:499:dbae:86be with SMTP id 5b1f17b1804b1-49ce58352ccmr38554005e9.14.1788326820834;
        Tue, 01 Sep 2026 22:27:00 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/27] vim: Security Fix for CVE-2026-55693
Date: Wed,  2 Sep 2026 07:25:34 +0200
Message-ID: <f4d6729cf38708effd445aa739bfd34d3adda3d0.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244868

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55693
[2] https://security-tracker.debian.org/tracker/CVE-2026-55693

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-55693.patch            | 88 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55693.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55693.patch b/meta/recipes-support/vim/files/CVE-2026-55693.patch
new file mode 100644
index 00000000000..d35b6f5fe54
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55693.patch
@@ -0,0 +1,88 @@
+From 315b35adb406138c962bcc653db95acc3c87c8ab Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 15 Jun 2026 19:39:08 +0000
+Subject: [PATCH 09/17] patch 9.2.0653: [security]: out-of-bounds write in
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
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/spellfile.c                |  4 ++--
+ src/testdir/test_spellfile.vim | 27 +++++++++++++++++++++++++++
+ 2 files changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/src/spellfile.c b/src/spellfile.c
+index 0b9536dc16..0010d9aa27 100644
+--- a/src/spellfile.c
++++ b/src/spellfile.c
+@@ -645,7 +645,7 @@ tree_count_words(char_u *byts, idx_T *idxs)
+ 		    ++curi[depth];
+ 		}
+ 	    }
+-	    else
++	    else if (depth < MAXWLEN - 1)
+ 	    {
+ 		// Normal char, go one level deeper to count the words.
+ 		++depth;
+@@ -5648,7 +5648,7 @@ sug_filltree(spellinfo_T *spin, slang_T *slang)
+ 		    ++curi[depth];
+ 		}
+ 	    }
+-	    else
++	    else if (depth < MAXWLEN - 1)
+ 	    {
+ 		// Normal char, go one level deeper.
+ 		tword[depth++] = c;
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index b72974ed07..e5f8c5778f 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1166,4 +1166,31 @@ func Test_mkspell_empty_dic()
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
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index ec2cedc965d..248160a82c2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
+           file://CVE-2026-55693.patch \
            "
 
 PV .= ".1683"

