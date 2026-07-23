Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CE0C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:37 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19534.1784798796639022037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=g/f4yOj6;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca80d708489so166479a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798796; x=1785403596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0T1B026Rh/sJ5RQJ5c8aElFI77kejRT1urnU+9BwSyQ=;
        b=g/f4yOj6LnM78mZjiKUJ623JutIvG20VcMYH/fBVGF6DaJGq+8H1PFqsTbkZnyU6nH
         fUdeKxGquKCAu420nJJC9B6DFUOtk5ChWr2QdXkwUkK/nj+OIMlWI860X5+trSTwzB88
         HUilL+AaStHe+CWJXJQPgtNFud6z8yWLWM6mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798796; x=1785403596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0T1B026Rh/sJ5RQJ5c8aElFI77kejRT1urnU+9BwSyQ=;
        b=LdxQqg34+cV0GobMwlDsM60RUN5vS15Z/dR0gNVYqWBIkwKvDwXiogzkafSqH+3NbX
         0P04UYJWO8AiNB4pCdoYCMUSfCChltdq/+QJTOmJogl2SMQMIhrQd5ly1kMVk6UWd/7s
         eGZJN2MRLiZEw6EK0/aXQZoytyElSaCEOV7mGmdBWHjK9fPSoltnH63l7aXzPqjFB62x
         RAgh6Zi8jQmNNbPqJgLlxYFFDZdzLxAZNQOJW07BaC5O8n1WOmBZseNts/1te260lHLL
         8Puhn5Lc0mAniK2rfebykO9LWl3HH3P1DqIfEn9rOOGRS99NYbRTeiPdFM8M9Ndz8UCZ
         nFxw==
X-Gm-Message-State: AOJu0YzfRyFfygwA87QXZlW5/oFVdaN+87T9EZhF/DQetIVyPJ0kOBrX
	AhMLv//2AkC7bpNKskdQoEpyoP2vmhveMGgdpcTK+lbpStH8gJ51xTprc1EEwH6U8xtaS421h0P
	yybkk6b8=
X-Gm-Gg: AR+sD10coMvmBDsA0dXmnyvmzHzKcityf1VZQEX/MceE04+w1ZaK/JqGDNXGPW8ulX+
	1XzcK/NL/H5wrtLIF4il8zZl4wcaW6GbAO9NPh9hFfoDwwwk7MUnxnZWYl0NlvMOmXDXPxo8Zfo
	5lwwaG465/MmRMERcikpIxGEF3grtIY7/thsCRp1fk2LZRWW0yc0HYFKknRzqhFEahihldMoglJ
	1KQbVgFyU6g55gSS83z71KMX3tRsDUm0gqh1ZeusIp7Xv1FEfgtdz9M5IDel874bEqWj0hAm4v7
	5uHc5BeO3nDI8qUVfNce/uJzfriGQYPMIS7KEp85Ck3QvmmMSAOR/yv2n7utDW+N575hx/Vpt8L
	cc8Mx+rqzKu89YpQGBHVbSkh3VFg71SIDKL86GZ40l3lSdM5urg1xLJnvwS3lUFF1cXsPIuLldL
	vPXpzKpPLYgMLXVVhZxopFwg==
X-Received: by 2002:a05:6a20:6a26:b0:3c4:2f75:719 with SMTP id adf61e73a8af0-3c44cd1de09mr2178964637.37.1784798795952;
        Thu, 23 Jul 2026 02:26:35 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:35 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 12/13] vim: Security Fix for CVE-2026-59857
Date: Thu, 23 Jul 2026 14:53:53 +0530
Message-Id: <20260723092354.54697-12-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241816

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59857
[2] https://security-tracker.debian.org/tracker/CVE-2026-59857

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-59857.patch            | 110 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59857.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59857.patch b/meta/recipes-support/vim/files/CVE-2026-59857.patch
new file mode 100644
index 0000000000..ed92190a95
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59857.patch
@@ -0,0 +1,110 @@
+From 48287480f53acfb5e6f9172e571ed2f0508dfab2 Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Mon, 22 Jun 2026 13:00:36 +0900
+Subject: [PATCH 16/17] patch 9.2.0725: [security]: Stack out-of-bounds write
+ in spell_soundfold_sal()
+
+Problem:  [security]: A crafted spell file with non-collapsing SAL rules
+          can make soundfold() write one byte past the end of the
+          MAXWLEN result buffer.  This is the same class of
+          out-of-bounds write as GHSA-q8mh-6qm3-25g4 (fixed in 9.2.0698
+          for the SOFO branch), found while auditing the surrounding
+          code.
+Solution: Bound the single-byte SAL result writes and the terminating
+          NUL to MAXWLEN - 1, matching the SOFO branch.
+
+The single-byte branch of spell_soundfold_sal() guarded its writes with
+"reslen < MAXWLEN", allowing reslen to reach MAXWLEN (254).  The trailing
+"res[reslen] = NUL" then wrote at index 254 of the 254-byte stack buffer
+res[MAXWLEN], an off-by-one out-of-bounds write.  Input is case-folded to
+about 253 characters, so a 253-character argument together with a SAL map
+that does not collapse (collapse_result false) reaches the boundary.
+
+Related to previous issue
+[GHSA-q8mh-6qm3-25g4](https://github.com/vim/vim/security/advisories/GHSA-q8mh-6qm3-25g4)
+(9.2.0698)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-m3hf-xcm3-xhm2
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
+Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/d22ff1c955ff87e8273210eae125aab0e85b6c30]
+CVE: CVE-2026-59857
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/spell.c                    |  6 +++---
+ src/testdir/test_spellfile.vim | 24 ++++++++++++++++++++++++
+ 2 files changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index a7909ef46e..05d6f0159d 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -3516,7 +3516,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 			// no '<' rule used
+ 			i += k - 1;
+ 			z = 0;
+-			while (*s != NUL && s[1] != NUL && reslen < MAXWLEN)
++			while (*s != NUL && s[1] != NUL && reslen < MAXWLEN - 1)
+ 			{
+ 			    if (reslen == 0 || res[reslen - 1] != *s)
+ 				res[reslen++] = *s;
+@@ -3526,7 +3526,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 			c = *s;
+ 			if (strstr((char *)pf, "^^") != NULL)
+ 			{
+-			    if (c != NUL)
++			    if (c != NUL && reslen < MAXWLEN - 1)
+ 				res[reslen++] = c;
+ 			    STRMOVE(word, word + i + 1);
+ 			    i = 0;
+@@ -3545,7 +3545,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 
+ 	if (z0 == 0)
+ 	{
+-	    if (k && !p0 && reslen < MAXWLEN && c != NUL
++	    if (k && !p0 && reslen < MAXWLEN - 1 && c != NUL
+ 		    && (!slang->sl_collapse || reslen == 0
+ 						     || res[reslen - 1] != c))
+ 		// condense only double letters
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index d04d024911..c8c7ac2642 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -383,6 +383,30 @@ func Test_spellfile_format_error()
+   let &rtp = save_rtp
+ endfunc
+ 
++" An over-length soundfold() argument must not overflow the MAXWLEN result
++" buffer in the single-byte branch of spell_soundfold_sal().
++func Test_spellfile_soundfold_sal_overflow()
++  let save_enc = &encoding
++  set encoding=latin1
++  " A SAL map that appends without collapsing, so the result is not shorter
++  " than the input.
++  call writefile(['SET ISO8859-1', 'SAL collapse_result false',
++	\ 'SAL a aaaa', 'SAL b bbbb'], 'Xsal.aff')
++  call writefile(['2', 'hello', 'world'], 'Xsal.dic')
++  mkspell! Xsal Xsal
++  set spl=Xsal.latin1.spl spell
++
++  " 253 input characters hit the buffer boundary; the result must not exceed
++  " MAXWLEN - 1.
++  call assert_true(strlen(soundfold(repeat('a', 253))) <= 253)
++
++  set nospell spl& spelllang&
++  call delete('Xsal.aff')
++  call delete('Xsal.dic')
++  call delete('Xsal.latin1.spl')
++  let &encoding = save_enc
++endfunc
++
+ " Test for format errors in suggest file
+ func Test_sugfile_format_error()
+   let save_rtp = &rtp
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 37a965429a..a484a5c840 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -47,6 +47,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-57452.patch \
            file://CVE-2026-57455.patch \
            file://CVE-2026-59856.patch \
+           file://CVE-2026-59857.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


