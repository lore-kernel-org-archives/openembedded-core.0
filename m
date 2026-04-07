Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9079AEDB7EE
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 10:20:13 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78153.1775557211698282686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 03:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ix8toP3r;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c56aa62931so10179252eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775557211; x=1776162011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUtWeil5xUX7EQtZX5Nhhlz2/ejajSSYrsZ2starSfQ=;
        b=Ix8toP3raunT4glHgSXusfQYNbmlgkoNi/5cx5+mrIXDd6E3bubqeAdg+9CNO5Su4+
         SM3EUxg2SLeacgnTNJ3Z3WTfpJqtFaTb85MMVR3dKi9gfP+GB5ORNvOZcUEJzfxb7cJt
         C+kc8wbEwwWXh4Hkfish9l531vbBfJk5XTIT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557211; x=1776162011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dUtWeil5xUX7EQtZX5Nhhlz2/ejajSSYrsZ2starSfQ=;
        b=HlJM7MrOiN4zMsCpTYYOjIP9lhEq1CZ3Lmz6H3fcLHqv7Rdt0SNuUhZKnFQYAobA4r
         oJgRAryl/haMyFJmS/5ZPkv1apYxDD73ebaZ2eCGLKFnPH8KezNKffkZO2DaL9+fKdvx
         bMo4B8ws4tj2t3uetxOHpZbxdGfhGNCHxMsBPh6OfCPqRAfUC1ClOBT1V+DDMF2P72NN
         tAqiiW3kARsxP0+8b6vnR7twVVMhMTKlVKc8Jwgm2QA7ioDkIrQxjPkK5plaCBPeXWDN
         nGQ0Eln3l/eY3+vgG7zWKJv4P+VkmjBEThuzaXiif7C6m8koqtaMrzLL1kuz/C0qWT0B
         ilQQ==
X-Gm-Message-State: AOJu0YwIFBIHXiRohAH+LkSOjUDO2rwImT/HfKpjVkDKg7CX4eyiFoUB
	qpsyff01wTRAW9W9Qw8vHuuZIV653Ea+9hEF/cWbWirnLm/hZOyTEnG9Z9S4x0FevypSMtG30oS
	39mlrF6M=
X-Gm-Gg: AeBDieuiZNb8qGuEI7ISDtPznj9nEdPzoSLHANNG61ecm6ITga75LpsC1zfVScVGIDZ
	fJs0uS6GDjLTrk+h2WY8Hwca1XAk1n2ixhncvVRp4Y02N5W/9W3QfI/70xiNZmHipLU+7bdnQky
	T9x8EtUG2OdSC5SpGZ2t/ZYYT9Uo5JzYLDQ+m9EFyfkVLy3+magIYpwlynl6uwCgQ0RNBbG/ROH
	ph345oh8LiQfuO2zNOLe1GXCPXGnF0zd1QXj584k3p+RSpMDfWfUcnX/2rUi9iLUxap8RZMSf7G
	1M1/4aGJXJahS480MRkZ2b3RXxi1VULEHNYtVOtEDMKKcS5x5QECcZ7WtgtOedR89YiM8CI9JxC
	uzE2XmdDtyBk6PiDcDaC9yjYP02M0/4tAZhnbvXP1YPQORq3kq4MMKprmDtjtGCW8YiKXX0v+uv
	hrX5g9tw8VDGUx8MAzfk1NIsPSC6Z0fKWcpho3
X-Received: by 2002:a05:7300:a985:b0:2d1:299f:521a with SMTP id 5a478bee46e88-2d129a04688mr2552070eec.26.1775557210693;
        Tue, 07 Apr 2026 03:20:10 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.5.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca793ea2f2sm15349969eec.9.2026.04.07.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:20:10 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [whinlatter][PATCH 2/2] vim: Fix CVE-2026-28419
Date: Tue,  7 Apr 2026 15:43:17 +0530
Message-ID: <20260407101318.62249-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260407101318.62249-1-hprajapati@mvista.com>
References: <20260407101318.62249-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 10:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234728

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/9b7dfa2948c9e1e5e32a5812812d580c7879f4a0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28419

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-28419.patch            | 86 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28419.patch b/meta/recipes-support/vim/files/CVE-2026-28419.patch
new file mode 100644
index 0000000000..91100a7e91
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28419.patch
@@ -0,0 +1,86 @@
+From 9b7dfa2948c9e1e5e32a5812812d580c7879f4a0 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Mon, 23 Feb 2026 19:35:25 +0000
+Subject: [PATCH] patch 9.2.0075: [security]: Buffer underflow with emacs tag
+ file
+
+Problem:  When parsing a malformed Emacs-style tags file, a 1-byte
+          heap-buffer-underflow read occurs if the 0x7f delimiter
+          appears at the very beginning of a line. This happens
+          because the code attempts to scan backward for a tag
+          name from the delimiter without checking if space exists.
+          (ehdgks0627, un3xploitable)
+Solution: Add a check to ensure the delimiter (p_7f) is not at the
+          start of the buffer (lbuf) before attempting to isolate
+          the tag name.
+
+GitHub Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-xcc8-r6c5-hvwv
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+
+CVE: CVE-2026-28419
+Upstream-Status: Backport [https://github.com/vim/vim/commit/9b7dfa2948c9e1e5e32a5812812d580c7879f4a0]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/tag.c                    |  3 +++
+ src/testdir/test_taglist.vim | 16 ++++++++++++++++
+ src/version.c                |  2 ++
+ 3 files changed, 21 insertions(+)
+
+diff --git a/src/tag.c b/src/tag.c
+index 45af67f20d..d3a73997bb 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -2023,6 +2023,9 @@ etag_fail:
+     }
+     else			    // second format: isolate tagname
+     {
++	if (p_7f == lbuf)
++	    goto etag_fail;
++
+ 	// find end of tagname
+ 	for (p = p_7f - 1; !vim_iswordc(*p); --p)
+ 	    if (p == lbuf)
+diff --git a/src/testdir/test_taglist.vim b/src/testdir/test_taglist.vim
+index 506e64f7ae..42ecc4b76e 100644
+--- a/src/testdir/test_taglist.vim
++++ b/src/testdir/test_taglist.vim
+@@ -316,4 +316,20 @@ func Test_evil_emacs_tagfile()
+   set tags&
+ endfunc
+ 
++" This used to crash Vim due to a heap-buffer-underflow
++func Test_emacs_tagfile_underflow()
++  CheckFeature emacs_tags
++  " The sequence from the crash artifact:
++  let lines = [
++    \ "\x0c\xff\xffT\x19\x8a",
++    \ "\x19\x19\x0dtags\x19\x19\x19\x00\xff\xff\xff",
++    \ "\x7f3\x0c"
++    \ ]
++  call writefile(lines, 'Xtags', 'D')
++  set tags=Xtags
++  call assert_fails(':tag a', 'E431:')
++
++  set tags&
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 7d265ab641..4f47ec2688 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1686,
+ /**/
+     1685,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 11200a0824..70d3dbf7d8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-26269.patch \
            file://CVE-2026-33412.patch \
            file://CVE-2026-28418.patch \
+           file://CVE-2026-28419.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


