Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80BFC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:57:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43774.1785193014826523254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sonGVZLS;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so31575575e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193013; x=1785797813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YLjb6Gob0g851dySNYRNtjBBDqW1iTZDQpU+m5Xas68=;
        b=sonGVZLSXO3p0bh/1BBsbvPq2pT5Bf/ucIPYFSjL7LClWQry3LiefmCDZ3Qd6aCHWC
         EDROETHa4Rxs4aTDTVTGMzZUJ7Y1J3IjLmdt37d3eVqy7GXlzkiD5OSvbUDc3qoQuMP0
         SZkfhVf8NXlPPbmwEks08RgQfJuShD3tkYLBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193013; x=1785797813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YLjb6Gob0g851dySNYRNtjBBDqW1iTZDQpU+m5Xas68=;
        b=gF9M4NA4rhK4Cf27g1DKije14t3kJ6ARiOmL5O6P+nbZHd9O0E1UMUNtp8SjrKZ+wm
         hP18deS83tw+zUc626ricZYTRUS/NGpXf4BsHVWyjMTGHyXLv+P9nnw1deIsMnaEn6EN
         jX6pQM868zxkhAXxc24+YHIPVUTjZujSJ+V1ZNrS58ZYVEIh0F/KmvfcJKnNi0vxHxUF
         gj+vR9c7jPE49yHIuu7tLG4V3AYGoMi8FACsBIikrQR38L33JRjaEE6psdQgItowkye1
         v3tGHY7ihRUqSTMkLreEumgJCNS+TAgnMRqW9DHame9z9QnYTSaVOE1JnLfC1G4UYBxQ
         fFSw==
X-Gm-Message-State: AOJu0Yw18nMlrP2RIEDcfcRu5HwwWrGz8ECOqe2ZzFtcjTSeDDd4qpVy
	sx0c5ANX/2wbetmStxNPjTWdkg0mBIEx2NQqbkbjerDcZRW/7qmy3cHLEezXnKn85SB4yz7Ve0c
	AqBhK+QE=
X-Gm-Gg: AR+sD10V05MP5XGsR7FQAayDrljzxvU7opGZVnN/yEO1zcJkZ6WJuqitbs6Jk6JrKoI
	pzTbbrllhrLpJBP+4c7pwkN+eq13uQH4aMqdo3NnSVU11HGoLORNIoNAbd7R/5NIohOvTrLndxc
	3SiCsxrspDoBMFdLH0Hoat156SOESaRKGb8I68JHRCPbaaBInHN2ozg4vkSJwL1NUMrtjcfbCH4
	8+CeXmtDDzHxshMH02DRW6czLXSWzuVABIB2zUZTuuUg7/WwHflfzDc1hDk6qrOaSyWnLhmZW8p
	w3F6z8a9kKVpAoMdkk3h3LwOaW04d+ap6RWIIq9vD3J4DukB53bViV2JXSJ0I9PaVcwMtYN+uTI
	JPfudKUe50DyssLQoNbB0kYn4CT1bjvErTLQGbmRtPJ2IQx+y6mZ439vQSMuHKgHQUZhUSQEy5S
	kylxOxE7NcknsmOAH4dqPaWhLbH89U+yOQSVk8aujtmiBfIKirSsw9TxIixI+aGORs0cpIME1kT
	9uv0w==
X-Received: by 2002:a05:600c:4683:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-496b56d443fmr131827475e9.15.1785193012985;
        Mon, 27 Jul 2026 15:56:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/36] vim: Security Fix for CVE-2026-55892
Date: Tue, 28 Jul 2026 00:55:49 +0200
Message-ID: <7957a3e2ccd97a5730f90dde9abdf7165bb12c3c.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242152

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55892
[2] https://security-tracker.debian.org/tracker/CVE-2026-55892

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-55892.patch            | 95 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55892.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55892.patch b/meta/recipes-support/vim/files/CVE-2026-55892.patch
new file mode 100644
index 00000000000..fc430953623
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
index 7a4a0bc932f..f423e4d5cb0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
+           file://CVE-2026-55892.patch \
            "
 
 PV .= ".0340"

