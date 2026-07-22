Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8AEC4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9347.1784751723862836669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RiPDrngx;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caced6038eso88757105ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751723; x=1785356523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AmZZWKiYr4F0BLJf0RxqTC5ZK5VaVGyD/OVRkqZCTo=;
        b=RiPDrngxKpz+ugUq/yTe51js+AU0G9dB8PuKYmUMCL18fJCajmHncAjP63xiF/r4K9
         Yl0ddkKaPsMlbIuRm+4NNbSBzkGUnZWmZvInZvnLuF5B9OyPLUheGnQi1ECroJyc2Hk9
         Bftn9uwurc0pmJS/Jvmrw3egfN70A5Cmnjl6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751723; x=1785356523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AmZZWKiYr4F0BLJf0RxqTC5ZK5VaVGyD/OVRkqZCTo=;
        b=q4X/eVgMNY/g/vXFiVrQhkTOmXKBmvb0EILoQoV7HK2/jt3SpvZEN/48wnJqBAiYhy
         1EQlld8GzT9Wh3LXYLPQ54G2YUWyECabikEg5SDQgdkeVtS7VpTOw7QcW998agqrH/yS
         sUtmSBdU9y4toCxbD3FfDUHRKMoXhZpBCn+56SwOe2WCXPXogVlMhTxYqif4AH5ukB3K
         r3gpPMxY9uuTXjcx4h/NhGnJayYejJJH312BhpCJ23BvB84tZNqGr1qzSpewYXZCSdf0
         bcF3slkYw5twWovwp7lV3dAdjX4zwL70najBqNmF5JSPdR/4HucGNTHHP4C7Fk+EvLV/
         2mEw==
X-Gm-Message-State: AOJu0YwklY0iD8kjQqUtDknkFcIur/oRQFFNW1+SieDYznAEVVmXnNzS
	5OGfyvDOBxXjVkRtoLOXRakKUw0ftHwd5I4baYt4CKbNVunv+OrAGUCCVAqFWGqqEEQ6n4Mjnix
	sLN5cMK8=
X-Gm-Gg: AR+sD11fUG2PIBzd/siujYQLhZ3YN0EeDqwlsIbdn6NhJZYOP/tmTitQag7AhE2acHi
	+UGLazJQtAyNQRtQKyxbphBFZRTSTiNxpHM4tPGux3yhZx4HdpdxH1StSK5WEBeJfRkhmIcOOL7
	kLO6nLNZzRWx3HYeBp2opUVtO5ehzVz/QKFCtr6X8g2bOngDO2yD6w/JMcR+mxx3HVP71+9Q2Qx
	GlAlunncfUL4ySpiywkQvRy+x8mVAnkwhJYk0iZrKSDmQ8Sd6jEI7uVFeZk65P19Rzv6yQhm3Y1
	VzOVhcoqpqNoY/MG07++j3wbJSV3ZVwot1JYlpGu3d/XtQ/XFg78RKRHKjel7z2BuaGbST33LPN
	OuakoiJ8fVTL6k5aPgvUlLREzSA0uMZO2oLeMNsCtB9GX4xrXEasfSh0qGxTGW7MhbeleRpwyhI
	Gnz+UJYH8ox6Od/8vnCHSfQwc=
X-Received: by 2002:a17:902:fdaf:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2cf8dc98e9fmr57990485ad.12.1784751723183;
        Wed, 22 Jul 2026 13:22:03 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:22:02 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 06/13] vim: Security Fix for CVE-2026-55693
Date: Thu, 23 Jul 2026 01:48:58 +0530
Message-Id: <20260722201905.491897-6-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241750

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55693
[2] https://security-tracker.debian.org/tracker/CVE-2026-55693

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-55693.patch            | 88 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55693.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55693.patch b/meta/recipes-support/vim/files/CVE-2026-55693.patch
new file mode 100644
index 0000000000..d35b6f5fe5
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
index 038751ed74..e867d4c1cd 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
+           file://CVE-2026-55693.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


