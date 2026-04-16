Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2138F8806D
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:31 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7576.1776322107348380989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZBbxkr6+;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43d75312379so180405f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322105; x=1776926905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXN7aEZFKmUORiNVJiXvWTSjjE98DeEPnv8xkjv6vSc=;
        b=ZBbxkr6+720Y19jvSKmVPZHBqXKEkKjGvJb3C0JHS79/RIg/pltvdXZnsvc74qxvYX
         WhPgaSJmlCQ13fRmuJ1YZE+5EKru3k0zIqOorYPt50kKwUuMg57MLh5YSAp6W8/PmE9i
         WguxspI8A4hKgav589sCadg67kuzEMVBl7gFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322105; x=1776926905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXN7aEZFKmUORiNVJiXvWTSjjE98DeEPnv8xkjv6vSc=;
        b=El95Ljazgoj2+bcY/BZGrEp9Vh8UbExZXhc2GgKGg1fZYmF3bkNrEMHY+L7yus/AkR
         DQYbaHGX8OHhLlYFAqYUcUAGQgn1CHZYGuFNfpMcx5sEyaO3yGh0OeaEWlc2zUCQnyBi
         WQZ04/y7eU+TY47MfBG1Eus/oXWw6IU8s3mSumMJ8PA2yEATcSv+oClEg6gNgpYpQduR
         edpLlPy5q7nJgPGj2epRiZmusy1tb36i+CSbHkiq2mG1mT291qi4cjhpOAQ71/MKIH88
         L0SsWRjzK+cUn1AaEEK/9Ukxz3GKYcfnUyCmX0/pn/S+IDl2QzewmQrmYKZvKjjZ/R+V
         XrfQ==
X-Gm-Message-State: AOJu0YxqFogaGLYKHhjeSU2VS3xjHFyHMxHcTnkgOR19OOnTGQAT7L+p
	nYD37YiRCHgaYzut7V5flpFqkDr13icV7p9z8RVvW4D6VDQafwxNVPGpouHDxmNe2NDueDv/Bln
	zHjqBfZIk1+hk
X-Gm-Gg: AeBDietIkyiTn/Pt5SxZFiMTVSZDN8pVuiIBe+3t0yFRJzC/07wqhdm6uS0SZUd9hM6
	wVMpIVy3kDmEBq3OdcsDgfodGfQnzfRqx73MSRBLC1UT7zT9o2SA55UZvys7Gh1OshrMQtemLhg
	SVbaMzQ5AKkWNWVt7DFx1gqDWvVuEjwgrfe24nb8S+QYcqYfgoS+4pdmBu83gD2u0kv+DI3L+JY
	lUm9P9zrV91D8Ti49TxE8HNG3ASR8ZwMfsauRXaXglg0kzPNya8V5sbB4Kownb14gAcZB+MQHoe
	Rljo3V1zIt+8sxCHz6ckF2rYdlYHQjiJi6XoRIwFCLUZTHIdzfc89mGx0EGcnapwbk2mE61IhDS
	0aNwAG3IjIdvilG407KtggW0beOC1JrkMUZQRCEynbAwFRyfXu0vgU6vkN65Vr9fsPZeM2ReK+b
	7emBQPtMyNrt3h0H1/L/e74NNpnXsafLPs7/a8tO/pSem452e6+J1oEYtM2/c8c+OXXse2TLBTj
	QW7pbMWl+jHVpI/yLXVXl/kpOXuyvRKbr3I9w==
X-Received: by 2002:a05:6000:1865:b0:43e:531f:720c with SMTP id ffacd0b85a97d-43fdbb400a3mr928858f8f.11.1776322105389;
        Wed, 15 Apr 2026 23:48:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 12/47] vim: Fix CVE-2026-28419
Date: Thu, 16 Apr 2026 08:47:13 +0200
Message-ID: <d4829660cfbd9c46c99142c935fd6ca26a3c13f9.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235354

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/vim/vim/commit/9b7dfa2948c9e1e5e32a5812812d580c7879f4a0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28419

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-28419.patch            | 86 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28419.patch b/meta/recipes-support/vim/files/CVE-2026-28419.patch
new file mode 100644
index 00000000000..91100a7e91e
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
index 11200a08240..70d3dbf7d8c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-26269.patch \
            file://CVE-2026-33412.patch \
            file://CVE-2026-28418.patch \
+           file://CVE-2026-28419.patch \
            "
 
 PV .= ".1683"

