Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A5A1073C9F
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 11:31:46 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104060.1775647904161829858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 04:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Hh6UHuqo;
 spf=pass (domain: mvista.com, ip: 74.125.82.49, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12732165d1eso8476892c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 04:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775647903; x=1776252703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tW4UXHSa6dtYgsGbp/yBbAdyndBqZuM1F1GSifI7GFc=;
        b=Hh6UHuqoghEHWfk7pPYWE4RUbFkHgYM+1cAokU4RCrkU5qDYW1xZhZTPClikfEUl5u
         6KXTVjZB9Q1/xckQ19KqdsAXU7X7DEOeFHoWmHj8ij4YARKQ+cc0tsL4YEANnGWK0/R2
         T2kaIGHYut6l+VexL8S9OMQoZ3IlW/iFi9Jew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775647903; x=1776252703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW4UXHSa6dtYgsGbp/yBbAdyndBqZuM1F1GSifI7GFc=;
        b=PrLm6ke/SVXvEqDqGXmtRN92Q1H/9X4TQTXhHsxGBFPEWRQ7RrL64OSnhXd1FDyB0m
         obnqyY2NeDzzkkt8zLA+8pwRiwRAOrALP5dZKW0aQ+Of3judO6+YD2O8vZ0H2brybFRU
         67It7LY9ONJBR+1N+eIMDQGvBnUpQ7ty+FyQ9npqwi+azv4LKqa9SajiEclyYxFbgvef
         2+wVVMDXdAf0OefKssAmBH05Uy/HpPP5hI5yfe1gvV9lbbqnsEjo6X4+YjI5zflNhdko
         1ekYfaz2G1vV7dTvrUtcFuqoG4cH1agImaAgjJlYpu8m6rg0QXfAe/+oXa7fA0A8mIBH
         sBEg==
X-Gm-Message-State: AOJu0YysZp2DRoetcJ2Vcw8d2h+r9pV4RSDw7kWAqGyWjSuMqPZFnJse
	gqMX5kfWCDbKJpI8HjUucgmdEqd4jjB7zW9gAaTjcXneirZMVP5YsFpxNOYmCMDXyyFu0Mo/cys
	svSWHCj0=
X-Gm-Gg: AeBDievueHRohWbJD9Jrl7BNqy77/HlTlJpaBPKFjkJ0jzLGbryTF4pPmX79sI7y5SI
	yKhW7NKan3eiNHSe3JTo542nKB7oIpfmLkpjiarvFSOwuAA5LJHu4qv5in20Gj6Z8C/zECkQIUl
	DUj7VAohOOTrEw/bRTz0APniyxs4vHyVJaufcfWZL00J5Ei+SKQjbUhw3KPxHkx322VIB8/s/Rs
	eRiShzh8CAPQYLNi4XuckYR51SLUy83mihpBnNKU0DODeIbJFu3VgZKAvDlpPiKCVlQG37bYmzN
	Xx4Jgmn9imop3JsnF7krFKyvES0+e0pvyVmBXVlPphyPqWGOPlSSt1B5q6oy1JXoL+s4AOI1tU/
	L/rDbyFlAaLoW7UWGEIJmlCb5KBiLB9fqbChSlET7SD/LVflSwsA0+vaB3Kmq7q6zba1pemXeg/
	KzRyXEyc69L5xg48NKUzLUhprTIOD0O95m4IM=
X-Received: by 2002:a05:7022:112:b0:128:ceac:6da6 with SMTP id a92af1059eb24-12bfb7602e8mr10822009c88.30.1775647903274;
        Wed, 08 Apr 2026 04:31:43 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2cb09d6a6sm3053221eec.16.2026.04.08.04.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:31:42 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] vim: Fix CVE-2026-28419
Date: Wed,  8 Apr 2026 17:01:35 +0530
Message-ID: <20260408113135.1030525-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 11:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234834

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
index 713e277936..b74c4a49c1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
            file://CVE-2026-28418.patch \
+           file://CVE-2026-28419.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


