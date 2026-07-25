Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD993C53219
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 14:32:54 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.371.1784989971950235731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 07:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MSEHj6WG;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so1014826a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784989971; x=1785594771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jqf2VKfqxSyuyJJtp8kVMproI4H/rSpr+irXBepIXU=;
        b=MSEHj6WGoRREqRzh6WloeNGfYH1v/e1SGJmNqDD05RgFCGswTvYSFSA8ANPX/hBD5e
         fd65dvhK1tyVMC01p4vYI0iNIEROIG+jkuxqrgZgIl0wNX1+yDMsl0B6sERUbzXgl2Dp
         Uz9AX7gYEUfpBmwzRIULEHE6fKvRg+nawRTbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989971; x=1785594771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jqf2VKfqxSyuyJJtp8kVMproI4H/rSpr+irXBepIXU=;
        b=MEL1FGe0Xj6fSQ9tm38WPAhcsDY3se6iEm05iysEe+/IaA5w/XKpAnvFptP2nRoe2D
         HFcFJ5iSHUyrrvYyXyP0K5Ma7kFVJhtvuJhfpHQUUhXAMZHYhoVEdjqRwhpH9peTWxFB
         e7bucjd/HiwwsDYOgVmXSDfW2lcSLArHczxLmT5QUuqfkBqhBUoQwEnV77v2pa7xq4nP
         uOvFNQPwN95RJgV0m9zI16sDmVnPEXhtmWWndXfuZ6FtchK5yyQCIIiDOh0PJ/y9dYJw
         Qz79RH+xBjoaRwypPZZzpHB3YQHOXIMZMjVGjG8E64z2DPXzc85FtWnqZYdlGIScLYak
         zhgw==
X-Gm-Message-State: AOJu0Yygt5s2GshGs742tc1PUkcGV/3u9v/JvLm9JHHfaEfdDQ2bVoen
	sYr3yPgqJ9VX5gheDD73GJc8CJZu5/okiaPRvkopmMUDgrw0Y6Fo5p+Mqno+s5sM5CTqmbGKzc5
	6aktD8n4=
X-Gm-Gg: AR+sD11dHiL4Qxs2urJ5bHhqKisLcE9tLQ/3ARauX11O9t+JeiUV4zJKAXPH1clqoqn
	JZOLh9A+b1kShQBm2xX3lWpfQPEZ8XKp2i6A+5661fpYr7upYyRFleUIOyG/Z+NGnGs8x7Jkc+d
	4btl/Ek5THOUiQ9Ffn7pNR6H6sLFjaoTgV6ahAUaa2bAveThbdtn+8TOwdOb3KZLoonIjA2grwd
	U0zVWJbmW+56+UXnOqnsQWa8LOeYtH4YISlXQ35jDnHvUgNzck4tbXGTjuYhRQD2XEHAYurxHQx
	xF/oJqeSnNStnboc1SIW8l+zyq/+GOsdx2LMLKr5xSjjSqdAT9SvE/zkJTQiaSyym/f5/BucUhP
	oWBMoSQCqRfD6Jmb0SjkZRfi6QzW1SnQGsBJPjYBbXA1ltxY2xCUzyUj15GDv947I9wF7be0Ftg
	IN1UTqSiAjVS2Z
X-Received: by 2002:a05:6300:95:b0:3c0:9c19:65b3 with SMTP id adf61e73a8af0-3c67e19957bmr2309401637.75.1784989971301;
        Sat, 25 Jul 2026 07:32:51 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e585ae882sm1575845c88.6.2026.07.25.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:32:50 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 5/6] vim: Security Fix for CVE-2026-55892
Date: Sat, 25 Jul 2026 20:02:30 +0530
Message-Id: <20260725143231.230059-5-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260725143231.230059-1-sdoshi@mvista.com>
References: <20260725143231.230059-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 14:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241975

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
index 50ef18878e..445f5ff1cb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-43961.patch \
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
+           file://CVE-2026-55892.patch \
            "
 
 PV .= ".0340"
-- 
2.34.1


