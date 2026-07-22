Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D19AC4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9348.1784751730346467435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ga3X2dE2;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cae1a3a744so97546405ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751730; x=1785356530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2ylDJHfN6eboNGhjTfK6F0Comaey72ufFrog9E/4N0=;
        b=Ga3X2dE2tZEJ+XiasD0J4OcfHrtfVaSFqFi2QQVCYCi3ZXlE4blG48k8Q8qdkMBKrE
         7zLyG23h02CBATbNUOdNwx4Q349G740YTv0i6BVAFEqopSCgrgySNVhgWqKtsRpRYSk8
         BsMgwo8g0QIlaL3ZGAzS3RbwVldMypQ3jmqvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751730; x=1785356530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2ylDJHfN6eboNGhjTfK6F0Comaey72ufFrog9E/4N0=;
        b=l2AIVBcbphhcJn+/bmYxbD6/4pIDHw3bBZxRXKS2jGBzWJZm/5VWyAy0bE7AnHGNc3
         ZCwhEKguhDIC91X52Xnrl2U0u6Iun92AVJdaznMjfbKY6b6D72Gu3dF7JoGG4P7TlGWD
         fZ6ow5R00GSDGyBhIKxRGILKeiCF/ShZb+1h0/xJRKgoIbBSC6Kl7NK7Jgh1f+ur2MpE
         3MGggYsFudvMP5eS7Fvl+eWcpXPxWWvaAuxvN8wsC5h7fPzJxMWZh85wLAJHbXtf3BLA
         qvEyZPbjYu01Q7nzWHQHTM5uAv/X1ZI1csn05PhGihTbrTeZrLlWciUiuVvxcqBpFU/a
         lbaw==
X-Gm-Message-State: AOJu0Yz6RCqTOJPD4Y2Guqnag5fRNQ1zHrSgXw7MnYIiehmp7R2Wzbjl
	5kthmpCj3E5JPwSBs/q4AnTZIRME0s52P+mn9iYnI8CiSH2/se/Y6VIL63DXemz958f83tQYgOX
	zWRkmbsg=
X-Gm-Gg: AR+sD12XXSygq78T3WSO1TQSBo/8bYlNEv5yTzITq7QkwwoOMvdPI2Mc1qNqUMBnFNK
	z+9IG56B+rZMrruYv6z69qafcrNHxXlaSOzsccaRv9EE/YpAh5nleSmPPc/hYBUNhOsdR0vrRFv
	zKec91B06U1rp1mCFpR8jV98Y6mn0WcdBTQseq+vK48SS7LsDGyk6r75N/0sZ6K1hVz2lgydUg2
	gwlxzGzPt1EiP1Ccitu24GwLvteMaYKpembi+wUMdmfFWWUov4ny+EtyQz04JG6qJimagtHhM9W
	irM8GLFLeIPUSQT4y+YuYSRAN4yRvsshs4IA48CFRYmxGgXzRPpuAE7dU+AOFDcBTwTN6dSl8jL
	xKw4tx6QVS2aN8UkSNiJJVSmc47uyheDP2TLXx6TnTdenYQJ/GBXLJcUgxDOJe+qeW3tmrXqA7C
	IGn3PfhQpA8/6C
X-Received: by 2002:a17:902:f693:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cfa75078dbmr3611065ad.34.1784751729723;
        Wed, 22 Jul 2026 13:22:09 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:22:09 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 08/13] vim: Security Fix for CVE-2026-55895
Date: Thu, 23 Jul 2026 01:49:00 +0530
Message-Id: <20260722201905.491897-8-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241752

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55895
[2] https://security-tracker.debian.org/tracker/CVE-2026-55895

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-55895.patch            | 53 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55895.patch b/meta/recipes-support/vim/files/CVE-2026-55895.patch
new file mode 100644
index 0000000000..0084006b72
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55895.patch
@@ -0,0 +1,53 @@
+From 0d286458d71ff7b4d759621dd9a567aa9354819a Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Tue, 16 Jun 2026 21:00:28 +0000
+Subject: [PATCH 11/17] patch 9.2.0663: [security]: runtime(netrw): code
+ injection in local file deletion
+
+Problem:  [security]: s:NetrwLocalRmFile() escapes only the backslash in
+          the file name before passing it to :execute, so a name
+          containing "|" injects arbitrary Ex commands when the file is
+          deleted (cipher-creator)
+Solution: Use fnameescape() to correctly escape the file name
+          (Yasuhiro Matsumoto).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-vhh8-v6wx-hjjh
+
+Supported by AI
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/55bc757a5d436e59d50fe43f7cda94b118f86cb2]
+CVE: CVE-2026-55895
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index 9014ca339b..af43f469d1 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -3025,7 +3025,7 @@ function s:NetrwBrowse(islocal,dirname)
+     elseif !a:islocal && dirname !~ '[\/]$' && dirname !~ '^"'
+         " s:NetrwBrowse :  remote regular file handler {{{3
+         if bufname(dirname) != ""
+-            exe "NetrwKeepj b ".bufname(dirname)
++            exe "NetrwKeepj b ".fnameescape(bufname(dirname))
+         else
+             " attempt transfer of remote regular file
+ 
+@@ -8737,7 +8737,7 @@ function s:NetrwLocalRmFile(path, fname, all)
+             call netrw#msg#Notify('ERROR', printf("unable to delete <%s>!", rmfile))
+         else
+             " Remove file only if there are no pending changes
+-            execute printf('silent! bwipeout %s', rmfile)
++            execute printf('silent! bwipeout %s', fnameescape(rmfile))
+         endif
+ 
+     elseif dir && (all || empty(ok))
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 64e3eab106..5a4778fe7c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-47167.patch \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55892.patch \
+           file://CVE-2026-55895.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


