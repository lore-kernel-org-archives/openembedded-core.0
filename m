Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F36AEDB7E6
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 09:57:33 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77761.1775555846236505066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 02:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UlW60f8o;
 spf=pass (domain: mvista.com, ip: 74.125.82.180, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c15849aa2cso6313757eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 02:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775555845; x=1776160645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tW4UXHSa6dtYgsGbp/yBbAdyndBqZuM1F1GSifI7GFc=;
        b=UlW60f8omOE22nX2HGEtP9jc5RZCQFVxOJANoOiJWNZsRQ5AZUJ1pSyWUeN7lN9RqR
         trJcrwZwyTDC5uUoVJTfT1uBpn3Lyuj0pJoXHRDpKgPomfzktl2Qtoc19sP/sC148Dz8
         KbP5dGwCDW4+HEOW9f3cyYcSzJ7qvZiQUMim0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555845; x=1776160645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW4UXHSa6dtYgsGbp/yBbAdyndBqZuM1F1GSifI7GFc=;
        b=DUC6suN8YA+FlV+BA5C6pu8OkY+yX7K2eILPARCuJ3M3euRgUkvXk+7UhsLsuGApCT
         QwqDDlfOXwRv6u8xZjPKmwrY2e3BBgPI28aX7oDYHvEtxKEWQKNWfKuFaen34OdtmNEh
         i3P+hlhGk2Ls6OFrKiZZMM664AA8wHrdREXvTRYitLKiQc8ivguRVxIuTFS90OoXDY5B
         R7KvmaATcy0rdwRnTi7XThL9a5tWcmKbXezTC0FV8725dS/4GTkXxmlKFLEP/TuOvW84
         upIgmN8NzG0yf80uy5An/aT1AXfofsRrXU6XV2Sx0y9VEi848xh88fOJn24vptVgvNmf
         VNaA==
X-Gm-Message-State: AOJu0YyYld+rF64yOn97rJ6KYZBJsGGOUx9Ref/9KWG/6QiwStDWYbs9
	P+j0dhUlgC1x7rRaLLXFWmdbykjkiMIsB1R5bY5U3gVNW+o4K+bcTFkRKZXHzJUYNM7DojJpaKa
	R9w0zJF8=
X-Gm-Gg: AeBDieumDjxNPR0270EA3R1EZcwtK/Dg1+/2VCcX7L7zjaMwKLAAtZG/LtmvJI5bYWz
	tFET4cEtjwgyD+ol6Mh9Iu7GTzENySjwVqORHSxoaVs1YCoFGlbeU0vqw/tz2YsTsFOQUEVUjgl
	4jLAJ688L3XLtA0b1r5wUS9YB+KyIG113XSwfeS91lwuGrWt949wzhUAcoKxvi/Yq62S5PtDW1U
	9B4ZdQ+pI340FH/OvAvpsGdjYSIgiguGPMAI0Q6oxyt7fdqM06HNd0f4rpJghrC8QtYz3rz9uV0
	evvSgmeFbU2doNCQhqh52c+nw1c2WTt5hfPs73GQolK07I1wBxiVFiWdVjuAvnNZoDjroVIW0nb
	EtUKI8DWyjVstDIItsESSXINVxRvin3BGc1DZyxyFEGMLPXeb7SB8NQSp6RJ4cv9HvvsQxg8nNZ
	Tf+KO+K3IAMVnGwcLDA5NekEFnhb4DeY3NvkTPcX1KiX9l+Ws=
X-Received: by 2002:a05:7300:641a:b0:2cb:da49:7e54 with SMTP id 5a478bee46e88-2cbf99ecbf7mr8103386eec.3.1775555845395;
        Tue, 07 Apr 2026 02:57:25 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.5.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c151sm16534021eec.19.2026.04.07.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:57:25 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: Fix CVE-2026-28419
Date: Tue,  7 Apr 2026 15:25:15 +0530
Message-ID: <20260407095515.59487-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234726

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


