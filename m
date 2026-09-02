Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00DAC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5679.1788326830488353188
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T5tts1or;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso6495425e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326829; x=1788931629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EmBgRNCDXo/OG0uZ++bC36kXlYedGPK4jGzp1KAZIFM=;
        b=T5tts1ors5GhNryJjXC2LSweeM11+3T9IlyVowpLV/sTqvGs/Fu4Tx99DqBwbwZmTE
         jgsxmaBLzAmgjTMzziPASsVaBJUm1jYB5WeBH5I2XNOwZ436qx0ppM5jrI5hoY8aBHPN
         aiiFnQGsjDSYb/26XhjOoi6ejdCzuOu0TIBcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326829; x=1788931629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EmBgRNCDXo/OG0uZ++bC36kXlYedGPK4jGzp1KAZIFM=;
        b=Hmddz4swVN3iHOcE+oHBm2CFljxMK7tRGoj5TI5tFGAuUUJxRlaPknL1agA2C8n6fs
         EymsgkBQe0byQH8sNrZJnRm4l9tZBfLrGpdZ84a8wSxVigLgBXsXpMxiK+L2frHtGiqL
         4pwRmjDsVL4cEnEOWVm81uu/gtH+b30QY0AfCwJZW3dndJv04/dFj6x6toQomUk09p53
         X4NvIxfVthHB2+Igafnch9+QyrxvEEehC0X3wnURlHe+Hsp40wkobrDtfEA2ZbyUiiAy
         OXDMMxPEliDBfpoxTZVvBYRIFN58pxiLjX9agMRNUBjnbLtzArI6dKWqQZRmYyduNi5u
         3ekg==
X-Gm-Message-State: AFuF++m7SEc4/ZLdNfZZs6y0B/9SRoNBQeACW1hg6r384wsfuiC6v+bM
	2YIHgE0jCZlQzbTfoNZp7IndhUOMf5pyIpsK80lph+X3OXh5Cc9Eom1SWgwvxL7GFGK9AQMFyHI
	2QdXwsx4=
X-Gm-Gg: AR+sD11NxNFpFiU+K55gPFvxKE77SkoOSJFhZgPBP1y7KIgcy9w4z6Bu9uaS0dmNoNC
	Ieg06X2A8UTlISOa92jEa+XAZ12p94NfrFRXkjtzfl57+scduHcZDUkGjQqf/dEtkcSSXz3HJhF
	T+uQCvc0o7y3Apw5XlU7ju31ERBIomhBN2eUR3kO1rrZmHm4pbiiXkPGvygQs6qKDG1TaahGjkS
	9pSv10CDZMuYy0gTlHKGTrddgxG4fJZoXdfq7HljLll3SXNnqATCaX5ezbFdTkx54CRLFe3do8N
	AAMUK7f0zbd4hxzbkEzFH5TPcVBWiiRKsgzc13yeKpXtgGTlNau0bYfHXhdZub1XQoPFu5S/Q5c
	ztf7seOpPtvJ5/nLfkf6uTL7DDUJbZXqBCAiqo4bGt5bSMkMapFn6pYgygLpz7gwNHECpYMejqP
	EKW/douWQ+dBFDgjnHq9gevWxd5FjLWUvoxnDfGlJUmtxYwVRufPa2UjHk3v9WBem97pC+x6a7j
	khJQ/SvdxcgV33cIg==
X-Received: by 2002:a05:600c:4e86:b0:49a:77c1:d246 with SMTP id 5b1f17b1804b1-49ce5852589mr34713755e9.15.1788326828682;
        Tue, 01 Sep 2026 22:27:08 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/27] vim: Security Fix for CVE-2026-59857
Date: Wed,  2 Sep 2026 07:25:40 +0200
Message-ID: <65c4b003cddf3a2489118a04c3caec37c8256df7.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244874

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59857
[2] https://security-tracker.debian.org/tracker/CVE-2026-59857

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-59857.patch            | 110 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59857.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59857.patch b/meta/recipes-support/vim/files/CVE-2026-59857.patch
new file mode 100644
index 00000000000..ed92190a954
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
index 37a965429a9..a484a5c8405 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -47,6 +47,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-57452.patch \
            file://CVE-2026-57455.patch \
            file://CVE-2026-59856.patch \
+           file://CVE-2026-59857.patch \
            "
 
 PV .= ".1683"

