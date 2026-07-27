Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4713AC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:20:41 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25235.1785133238261119834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bb7A47CH;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so2266980b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1785133238; x=1785738038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdscDaBZX1vtERVeJxudMsHJt9M9Ls4jHAcE2HS+EBk=;
        b=bb7A47CHGROcr3ewx4GT/wFRZWP/B+V7A76/7Qa4spkbkYJIsBWAITrU7pxlU33drb
         suycRntEXTPAjtPJetbU6BjGJEa9dxOaK3VmcvOrHgaLdTh/ljc8xN7AKj4613GS92W+
         lmeW1LzFz5JG2vEih1BePhC7YuF4i/IeRstv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785133238; x=1785738038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdscDaBZX1vtERVeJxudMsHJt9M9Ls4jHAcE2HS+EBk=;
        b=iBBf/8hBJdT0mttNJmhc/pF2qTz2+oTMFJol+B/xaDU3dfTBpTDqgds+duDOcr4I3y
         CEHVFz6latq2xdSd5FDSKlLanGnXycKYsaLU6L97lxxyRCZOhVqJjyCQtpzzdwxjnlJu
         BFtsBp0kco7gRkWuJIe2kMIweZ/9+SUw4UsBwqXKJZdGLSnEFiT5mwHjfZ0uJOw3I4ce
         0toIg3UmPtgQvCN+fEt2D32VdF7NDORaEDkzG6s+NqcQEsxZusWVsbKTeXp5fi9jabj2
         6hyjb2uuLVQ2mAQ6f5oeQPyRsZPoXWaSiOVxGwAs1d5dAyxTJPWXze0D7094tL6/yttp
         uYaw==
X-Gm-Message-State: AOJu0YzAGHtJGOwYCAIY9UzGosSscIkH3y6AN6Ro++B5xm1yxJm+U8fv
	hYSGqt2kCCCZROp1js2SlOIdCwTbc5WOtsgbddns+tF9Ii9+ToBzJJAovBzBjmLVVR1JYW1Kwrc
	nyD977iQ=
X-Gm-Gg: AR+sD10ooQOO6VRiYf6NHvf6iXVEfL1c6PMPFaw4HTXgLtJBNo0tH5kcofKcpHOpISG
	6vHS9vDYnVu8HJ0QUgtsKgnsVoUe6YtwjhdM9H2asioRndIyFwqMk526BGhQZaSOFSYkvcAxRNx
	tIhYjPYZm+/rxo1bP8OQJB46VYUcKgRkipe7yISDAj3TvxF0vkGEEi2CJ3RmHTN9rtEfIToJDjw
	v9sviGNRdlQZIS0K0rRFWPwkJDVIt3W9C73b8Rpxz5AQg8zmpSEizJbw1E+Fl8IBowqj83Hx5hV
	B+bJePHULc+3LmYIVjQ3uZWevQOBOLynqtyFVgp1li6Qei44wYo1Gl5fx+zzO9rC0RIp3JCyYP+
	gXvG0CinVmw8JzS3Zitw/fr5JSrMujAkyqxLfgM220p6YZdidMkla3lRr88YPTgQpv6K2IaLLMJ
	/vWDC+dvmGnREs
X-Received: by 2002:a05:6a20:6a27:b0:3c0:9c1a:893c with SMTP id adf61e73a8af0-3c67e16412fmr6847019637.68.1785133237560;
        Sun, 26 Jul 2026 23:20:37 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm42733554eec.4.2026.07.26.23.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:20:37 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCHv2 5/6] vim: Security Fix for CVE-2026-55892
Date: Mon, 27 Jul 2026 11:48:16 +0530
Message-Id: <20260727061817.8586-5-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727061817.8586-1-sdoshi@mvista.com>
References: <20260727061817.8586-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242036

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55892
[2] https://security-tracker.debian.org/tracker/CVE-2026-55892

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-55892.patch            | 95 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55892.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55892.patch b/meta/recipes-support/vim/files/CVE-2026-55892.patch
new file mode 100644
index 0000000000..fc43095362
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55892.patch
@@ -0,0 +1,95 @@
+From 8325b193bba5f01e7a7d8241fc8633d93dff996b Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Tue, 16 Jun 2026 20:32:21 +0000
+Subject: [PATCH] patch 9.2.0662: [security] Stack out-of-bounds write in
+ dump_prefixes()
+
+Problem:  [security]: a crafted spell file with a self-referential
+          BY_INDEX node in the prefix tree can drive dump_prefixes()
+          past the end of its MAXWLEN-sized depth arrays on :spelldump
+          (cipher-creator)
+Solution: only descend while depth < MAXWLEN - 1, as the sibling trie
+          walkers already do (Yasuhiro Matsumoto)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-qm9w-fmpj-879h
+
+Supported by AI
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/8325b193bba5f01e7a7d8241fc8633d93dff996b]
+CVE: CVE-2026-55892
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/spell.c                |  2 +-
+ src/testdir/test_spell.vim | 27 +++++++++++++++++++++++++++
+ src/version.c              |  2 ++
+ 3 files changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 01eb57e3a9..72d1f0b521 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -4325,7 +4325,7 @@ dump_prefixes(
+ 			}
+ 		    }
+ 		}
+-		else
++		else if (depth < MAXWLEN - 1)
+ 		{
+ 		    // Normal char, go one level deeper.
+ 		    prefix[depth++] = c;
+diff --git a/src/testdir/test_spell.vim b/src/testdir/test_spell.vim
+index 58a2d58707..77eac49fd8 100644
+--- a/src/testdir/test_spell.vim
++++ b/src/testdir/test_spell.vim
+@@ -1581,4 +1581,31 @@ func Test_suggest_spell_restore()
+   bwipe!
+ endfunc
+ 
++" A crafted .spl with a self-referential BY_INDEX node in the PREFIXTREE drove
++" dump_prefixes() past its MAXWLEN-sized depth arrays (stack out-of-bounds
++" write).  The tree parses cleanly (shared refs aren't recursed); the walk
++" happens on :spelldump.  Reaching the assert means no OOB.  Same class as the
++" tree_count_words() fix (9.2.0653).
++func Test_spelldump_prefixtree_overflow()
++  CheckUnix
++  call mkdir('Xrtp/spell', 'pR')
++  " VIMspell + v50, SN_PREFCOND(prefixcnt=1), SN_END,
++  " LWORDTREE word "a" with affixID=1 (so dump_prefixes runs),
++  " empty KWORDTREE, PREFIXTREE child BY_INDEX -> nodeidx 0 (self-cycle), 'A'
++  let spl = eval('0z56494D7370656C6C32030000000003000100FF00000004'
++        \ .. '0161010220010000000000000002010100000041')
++  call writefile(spl, 'Xrtp/spell/xx.utf-8.spl', 'b')
++
++  new
++  set runtimepath+=./Xrtp
++  set spelllang=xx
++  set spell
++  spelldump
++  call assert_true(line('$') > 1)
++
++  set spell& spelllang& runtimepath&
++  bwipe!
++  bwipe!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 03a520b146..b40bd9be93 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    662,
+ /**/
+     496,
+ /**/
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7a4a0bc932..f423e4d5cb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
+           file://CVE-2026-55892.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


