Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56A4C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:21:34 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2415.1788247293880715310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 00:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MnS9slfc;
 spf=pass (domain: mvista.com, ip: 209.85.215.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so4286424a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788247293; x=1788852093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i90qf+t3oAvv8zYF2OsFvC+/dTBE3JoHaTwCrlXq5oU=;
        b=MnS9slfcslE+TY6p3cL8/xKCnmPyu/bAA9oor+YCRoprRbTPrC5NiRXloTtPj5nsFG
         hSAvwA3PP8QwOe7QlMVuAaeLMmWByHdDqIXgAfgRl1LAVm8e+alKARnFJ8iTTzflkovr
         PlF7/wOxcuxMI1aorZGwZknwdAUWtRjUgfVEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247293; x=1788852093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i90qf+t3oAvv8zYF2OsFvC+/dTBE3JoHaTwCrlXq5oU=;
        b=DfEb9vb39/nyOs934H0yiI3QJ/uGbOuLWGCbuv7Qxud5lKXr/sIKIz5h91vsNEDq16
         Tiif7S6Q838aZl5fMrDzdlvrDb0aN4C/gRDfEtd/K9vnyPgaY4pVQ8OUYQwe3eYeaJDu
         RvYkfM0EfQLigRvWO1kkQUioD5rgHDRmClj16JURheXT3m4yBjrceVKgx0IQmu9TWUe5
         fVj5ILURSDGAZPu9Dk90+NPKVcBFn+mPK/CoFPz6Aynhm0tvvIUotgFoN1ObHHWcsWTd
         NZXLCAdjWk2/2gXl6eqPw27voOeUnC0uHf/b6OCaIDLLWWA0RQnHDBhNd3DJn8y3Qc1c
         GvSA==
X-Gm-Message-State: AFuF++lA4r+15SQi9AZtrnaEoHVaGA6+3YtXIgNZkJlFRPCWoz8MAYua
	0pmOP6TJ+iCXaeSIBKZZiHN08lQibgE1xOb1VbwoP0YGDF2dgQLOqST2WeFwLF4dlq+55ualE8u
	qmBPOlz8=
X-Gm-Gg: AYBFou10X+Cs9+MFDBX/wc2QAf/kgBIF4KqgmUofgSwCfhisbzuIElf4csykwq/fQDZ
	Ehgw7LPn7VsrY31DYAnJIb+5Fy5tDGnzMWXrYFdevwFlMXfzNx/uRq37oef5/j9G4YDyOqnBXW4
	3Tn7H4CML6I5vnMAykI7J5AO/1XesFOSnKrTbCtbQ5mU9KNOyoTVZlJWwOSSHt+DelOEzVeXWHt
	XwZfI1JblEzNYwMh64mygCcjWx8xTO4RKQYuY3leSwYbyibbYGHI+M95Dao54ogoTf/9DXmcuKD
	bY7iMh92nEwxoU4L6Tx303/2fGX6MEGTRmxBmjG6RH/IEddDLiFOaVovUwbwIoAaLyMWZmWIDg5
	ocREf6MGzBegzG0fkloQ4NJ2YdoFUqfD13JHYqnZlhZzPiLlnLmy9mFFSoq7F0ST+US/qp5+NIw
	Y61UeRUEd9WpjAAkPNJAQAxXLxX5iU/nVbe7kzvuIGsIg+fPCtRfTXM9MvANHBwrqnTe0ymg4ef
	tc=
X-Received: by 2002:a17:90b:5804:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-3989bd54c38mr34046960a91.22.1788247292943;
        Tue, 01 Sep 2026 00:21:32 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm54200607c88.4.2026.09.01.00.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:21:32 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH 1/3] vim: Fix for CVE-2026-73072
Date: Tue,  1 Sep 2026 12:51:14 +0530
Message-ID: <20260901072116.30784-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 07:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244799

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/05c41c922309c7a11b6ec2f124be66551c90d66a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73072

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73072.patch            | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73072.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73072.patch b/meta/recipes-support/vim/files/CVE-2026-73072.patch
new file mode 100644
index 0000000000..0ae3b2b49e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73072.patch
@@ -0,0 +1,64 @@
+From 05c41c922309c7a11b6ec2f124be66551c90d66a Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Fri, 24 Jul 2026 00:58:37 +0900
+Subject: [PATCH] patch 9.2.0846: [security]: heap buffer overflow in
+ set_sofo()
+
+Problem:  [security]: heap buffer overflow in set_sofo()
+          (Yazan Balawneh)
+Solution: Reset sl_sal_first (Yasuhiro Matsumoto).
+
+A crafted spell file with an empty SN_SAL section before an SN_SOFO
+section reaches set_sofo() with sl_sal_first[] already set to -1 by
+set_sal_first(). The counting loop then under-counts colliding
+multi-byte "from" characters, allocates an undersized list and writes
+past its end.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-9jqx-hgpr-6v64
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-73072
+Upstream-Status: Backport [https://github.com/vim/vim/commit/05c41c922309c7a11b6ec2f124be66551c90d66a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/spellfile.c                | 4 +++-
+ src/testdir/test_spellfile.vim | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/spellfile.c b/src/spellfile.c
+index b3ee9c0d63..a9f7e83752 100644
+--- a/src/spellfile.c
++++ b/src/spellfile.c
+@@ -1433,7 +1433,9 @@ set_sofo(slang_T *lp, char_u *from, char_u *to)
+ 	gap->ga_len = 256;
+ 
+ 	// First count the number of items for each list.  Temporarily use
+-	// sl_sal_first[] for this.
++	// sl_sal_first[] for this.  Reset it first: a preceding SN_SAL section
++	// may have set the entries to -1 via set_sal_first().
++	vim_memset(lp->sl_sal_first, 0, sizeof(salfirst_T) * 256);
+ 	for (p = from, s = to; *p != NUL && *s != NUL; )
+ 	{
+ 	    c = mb_cptr2char_adv(&p);
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 3a93883b4d..0b0cf42066 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -319,6 +319,11 @@ func Test_spellfile_format_error()
+   " SN_SOFO: multi-byte characters in sofofrom and sofoto
+   call Spellfile_Test(0z0600000000080002CF810002CF82FF000000000000000000000000, '')
+ 
++  " SN_SAL (empty) followed by SN_SOFO with two multi-byte 'from' characters
++  " sharing the same low byte.  A preceding SN_SAL poisons sl_sal_first[], so
++  " without a reset set_sofo() under-counts and writes out of bounds.
++  call Spellfile_Test(0z05000000000300000006000000000A0004CAABCEAB00024142FF000000000000000000000000, '')
++
+   " SN_COMPOUND: compmax is less than 2
+   call Spellfile_Test(0z08000000000101, 'E759:')
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1da47d9243..34d4507906 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
            file://CVE-2026-59858.patch \
+           file://CVE-2026-73072.patch \
            "
 
 PV .= ".0340"
-- 
2.50.1


