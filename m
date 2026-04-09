Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F755F36B91
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:53 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145081.1775776305509768150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0H2rHAkd;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so9840525e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776304; x=1776381104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdZr4nAtbs2Lcg82Mqgy0e/UF/0j8A/T4NQbmG4ttd4=;
        b=0H2rHAkdiX9EZvCApTsk2L8h9JpFeBDTGrfWkguYG2JtZypFc4/SOvKdY1J9TKf/JY
         Jobx4RUHWZ+vvXc/JxlXG5ZL7NjBBa3ovYlXX8Mjv29FoRydE2Ns+ijLxNzqx4BsNJkp
         O2NFMeRRbwzGDbbBHjSnPbAH3Ww3I+u5B2IJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776304; x=1776381104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MdZr4nAtbs2Lcg82Mqgy0e/UF/0j8A/T4NQbmG4ttd4=;
        b=NQTIHKqgCPenAbktYSTigHuJple9ZLdgM6byD83wgXKWhJ1IwuD/KxKFu3lxDtMzYQ
         MQJprWaFLkVR8Sjjf6iKpb0B3IdY5B/vTuDJ+HhR7GV8+MajUcW/1MfJkXMSBoPbbj9F
         3gSZZKeVBSQnRPaRcG8ZNG6oAFLD8fvZr8xSDN9Equ3q7cviOBaDNsCuokMs0FjIGbNZ
         xst/z3b+n6OtLa7jAAxoXrc3xPb7MfCA2sWFQLuTubYzKHgOWYAdTzl2dX2IU+ksaKCB
         SRHJy6aNWGT/jQegLMuyhlFevb5L+BtXEz46zrFwBNs1f3XiJbWEvxRKa48PQ1hROsiJ
         FEhQ==
X-Gm-Message-State: AOJu0YzCkmYVjvA0tsoyZmxJeO2qUFMqRmBg4m0c6lCygim9/VqdyAnP
	FULwp62Blp5HRw6kQ52MAwSSvEMxSjdfHrK8GWlb62g2rdIGgmUOZxsI7iUJ7BLQ+P2s/Ah4GSv
	UajUYyWmnLdDU
X-Gm-Gg: AeBDievfewikpWLudquoQmEqh6izxCqb8MEHd9TNCKgc/g8EWXNMqvBMtwFAgocM1OR
	ceoujuwzJ/ajIuMh93/fkTTfI6CKrytC0xWhwprkbViZQlA8L503lfmznCraDpelKnSogyKuvn+
	rC3O2BzdM+OYSFax0BaHn64YcIoje0KSfDk9Lu11PbxGe8/+iRJLbjYR8NCtWZisx+57Ni8DzWu
	eCIjm0HBdy6fYnB7QyYosQzm9Nr4pcf6IEYrkhpI62kwdAHe77XYX32ucaWFdJTGpQBP4hREaZ/
	oRiv8DW3VEuneMTuZOEY2dCDgPNVUEmQ6lVeTGnbpfY8yD8mMmFmibaHark9GLt4DkMHPhMbGU+
	7STuYLol3L6NJHLxwEqKuqjF6bk651H2ZSWQE3XhxR6Wml6JqLLzFFv4b/9rRgGgyhaXK/ykLGe
	VyVmnUl3ghjKs9HDJTggOm3JeAbA72bQU8m3nFfvoWk5ZMGS2tJibCPVLfH6ORzomEGivNuNFei
	c7xvQulBsn0cEG1bwCm+PQDKzVx
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-488d680577dmr7380915e9.2.1775776303698;
        Thu, 09 Apr 2026 16:11:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 28/30] vim: Fix CVE-2026-28419
Date: Fri, 10 Apr 2026 01:10:28 +0200
Message-ID: <550a2a5e2d3b5aa08f50b89a0127187c3f76854c.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234987

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
index 713e2779362..b74c4a49c12 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
            file://CVE-2026-28418.patch \
+           file://CVE-2026-28419.patch \
            "
 
 PV .= ".1683"

