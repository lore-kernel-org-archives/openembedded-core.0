Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87348C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:27 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19529.1784798778963613198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=i+vbL05s;
 spf=pass (domain: mvista.com, ip: 209.85.215.180, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so169506a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798778; x=1785403578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDhuEj5qrFtpVTGBOrlrppIQQpdz81Lb0x1DkjsxYFQ=;
        b=i+vbL05sslecQb2gDHw5Aky5robpFkPOoFVPt5Dc0oLxJxwG/w2+pluxdW+63lrwlc
         ES5ydHoZaMsko8h7IRozf1+aAlEAyUNAZWMr8YgCs32Iv5RYd1UpLOgrYWc4TjHufF10
         OvO2Iz183NbC8JwUetxAeIUDu4yvcpgXdZ3uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798778; x=1785403578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDhuEj5qrFtpVTGBOrlrppIQQpdz81Lb0x1DkjsxYFQ=;
        b=j1bEk6wYq7CIG85gRhUx2OA+XHSeJOZzyGWYtX49T7QMmE1apAB683SBNjt5TqqbZD
         K8N4L5KtyFpjotc/dRdxo55nc0duWm7dffPrENO0e6s8bUHCCtn9bCTMUBl/1489aF6u
         T9BGJH3nvT9tLMQBFKosYDLK+hJoCBKw3xBl0D+4nILCjcRvo02ITJLG+DNUPs7Ot2Mz
         NqLY94ceVHP2h8+ud4oYy8RsS/D54DN8Ue3VsaXvKr2oN6emPw13wG3YTGg2NOcEKngI
         0wz114RXNg2ZZv7H3KyuXfTB//pwNETrcv/QUYnuhMADmCFAOMYnIGU7f/1EBprfaOKY
         q/2g==
X-Gm-Message-State: AOJu0YyEhuuyRYUeHW3HVDEIyd2C5sKQY3WGrhtShCKFURQ8F6vOvsNK
	O/E6pOk4Seyp6TvConEOD2QGf4FwdxnBIB4irW6nz3k9W6A9bVhNsZyraiI0v+r7w4dC/9X26MQ
	7L4L0xpg=
X-Gm-Gg: AR+sD1089MbbtIUZBaKVbuPRyBqfNi2PnOkGYFi8aPinPuJKSbOFOB6XbJp2S7W0oHJ
	G1yE4/7jcRFCu96fmph0+LzHgCNGupiy2RL4G2097DaubTZhPrN6gz/71vhn+V5Txo3a6qPbiih
	x2TNuG097yDVjJQRQwDYU7barMx5X5J2426e5uHWEzggwYx9C3A46WzB+LTmorH0hYBW2fXA0Gb
	kS1VAvSz2qrJXnyhIBaPFCupBWyoi02RHnQAd4Iu4JvwF3rKVEsXcBws5ClNpeQF0/Xso7EwG5v
	TLDIGD7ZQ72ox7GEBwn1Oddo1QrCedC2wQNTw+u+ggtFeM+Cxp/Y+HKu6YCQje6yPXJqzScCBnA
	7DDv3+zaDL3VlnVZvCEReiHzCP5o5U5TDXG3EUN8EXHUOGPUU3FbGGdOaohXa+yYNNKJ39n5aRy
	3lVw8Y42T8VdI=
X-Received: by 2002:a05:6a20:9144:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c44c9c5d2cmr2093539637.15.1784798778317;
        Thu, 23 Jul 2026 02:26:18 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:16 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 06/13] vim: Security Fix for CVE-2026-55693
Date: Thu, 23 Jul 2026 14:53:47 +0530
Message-Id: <20260723092354.54697-6-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241810

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
index ec2cedc965..248160a82c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
+           file://CVE-2026-55693.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


