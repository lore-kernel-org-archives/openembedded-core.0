Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED06C61DDB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3047.1787945897912318049
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zehgdjfu;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so16501835e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945896; x=1788550696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dxkREiiB+1dEPg2Bk94QgNFsOeF45gKNPccyAoyAwMI=;
        b=zehgdjfuZsCAuOLGWyfaM2bn9zgMGBmID8BtO9IlqO6ldE5r05SZOv02Mo0BoOuLv3
         9XLvOPhDla3/oOjMBJoNCWIAQ5p7K2yqDP7LIBNFdgMRVQL3si5P1LU322nu/lEKD06V
         riT+/EKaOauWRNpnGgzp849WiKEOEKnZOFMZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945896; x=1788550696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dxkREiiB+1dEPg2Bk94QgNFsOeF45gKNPccyAoyAwMI=;
        b=MDC2K0pkRzZh2CikQjdu90DQ3RbIUsZCh+J3evq3kzFoMyfDMNw/KMXYd7uOsqTvGp
         xwcq95n/Pd2wJLdKVCkHXWV9KeyNAYh7uNHg9KqYR9MmKCX33D5baj/whtK7eB2NQ/rN
         /PMQQ7ostcRH3nzDXyN66gaO7NRaD+WzTJRTMYOJlxNTJ7fHYFJs2HvGRHoOYz6ZyL3N
         vaP0zB9py5tVOX7U1kiS/tS3H6RDBFbxVLU1v1+DT3oVgEtSDaR3Lp6CgNdhSVe6xsl1
         KYfD/whTCVYbVQyZ68bq+qKgKPzFvNLt99S7g+U/jQKYmL7UmmbwvWKb7K/oKsycfGSu
         ng9g==
X-Gm-Message-State: AFuF++nA8nuEkijZvD6I6Kg0iQIi+uYwJUpERgD32Hvvn1i3cHrTC4Vx
	6cOAU2OZW2pzPxlLlzCy7oCL5NLAeZg5x1e3KeP1szrQYdFxx+wtzkgZqfNqgm3UQVLGCDbNRWw
	cQmnaIzI=
X-Gm-Gg: AR+sD13mtlk8i2Ws0pPKYw06L/kkkowFazqjWNtm+dwMixiruPb1S9elpORzTO9mNwg
	f2ya7hXNEmbg0BOQVjdGJr72LQYFJHt5cVttDNiVPYZ30UvhtP0py9Oqxd2A6qNjVEs066dWaK3
	++sfntVF3403jK+ZvDIwC4sB+aYq16pJEqPiyNazvRxgDjA8vkix9IFfDELVaTOl19SaOafpgMK
	Zmv4SEMrLgFI6zLxJVJ45Becl2na8OpFdr8uwCWO/RJ0BoLr0qU2NDhcBL67zII712zYNOYVHxm
	Ji9Uf09FEptyi7Yuxk/C/DvWUPRnWI0tMeTowHAgXpVJZr8GL1TjyCsmFUR4NXqgqQEzQiEYUzp
	ysF3GWvDYWGUIsJ6WhcRyAwKkANyoWfTdXp0k/hkv2zQmZvgX5lL35zgCzrRKxrllbyWpsz1hk5
	tgTUu3E4Ap57hxqxZ0pxiW3RZjrnVA9s2Ny+uowUbhw19uOkLVbjCTrzLUUA1cC5ZbFAHUdUjql
	LXd86EFy72AsdL3MnUi+JyDTovTQ3HeG5t5FVnG2LRgf+/wcXk4aE2UJooDsX2w8w==
X-Received: by 2002:a05:600c:6215:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49b91c1d5f4mr145849635e9.3.1787945896053;
        Fri, 28 Aug 2026 12:38:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/56] vim: Fix for CVE-2026-59857
Date: Fri, 28 Aug 2026 21:35:31 +0200
Message-ID: <30fd95edd9a70398154269fc357fddec8da35461.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244582

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/d22ff1c955ff87e8273210eae125aab0e85b6c30
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59857

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-59857.patch            | 125 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59857.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59857.patch b/meta/recipes-support/vim/files/CVE-2026-59857.patch
new file mode 100644
index 00000000000..656a5be8884
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59857.patch
@@ -0,0 +1,125 @@
+From 0665e4c6f2723757814da2114a3bc7c85c6e1271 Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Mon, 22 Jun 2026 13:00:36 +0900
+Subject: [PATCH] patch 9.2.0725: [security]: Stack out-of-bounds write in
+ spell_soundfold_sal()
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
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ src/spell.c                    |  6 +++---
+ src/testdir/test_spellfile.vim | 24 ++++++++++++++++++++++++
+ src/version.c                  |  2 ++
+ 3 files changed, 29 insertions(+), 3 deletions(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index e0fc17bfb..34f5edb55 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -3513,7 +3513,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 			// no '<' rule used
+ 			i += k - 1;
+ 			z = 0;
+-			while (*s != NUL && s[1] != NUL && reslen < MAXWLEN)
++			while (*s != NUL && s[1] != NUL && reslen < MAXWLEN - 1)
+ 			{
+ 			    if (reslen == 0 || res[reslen - 1] != *s)
+ 				res[reslen++] = *s;
+@@ -3523,7 +3523,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 			c = *s;
+ 			if (strstr((char *)pf, "^^") != NULL)
+ 			{
+-			    if (c != NUL)
++			    if (c != NUL && reslen < MAXWLEN - 1)
+ 				res[reslen++] = c;
+ 			    STRMOVE(word, word + i + 1);
+ 			    i = 0;
+@@ -3542,7 +3542,7 @@ spell_soundfold_sal(slang_T *slang, char_u *inword, char_u *res)
+ 
+ 	if (z0 == 0)
+ 	{
+-	    if (k && !p0 && reslen < MAXWLEN && c != NUL
++	    if (k && !p0 && reslen < MAXWLEN - 1 && c != NUL
+ 		    && (!slang->sl_collapse || reslen == 0
+ 						     || res[reslen - 1] != c))
+ 		// condense only double letters
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 50afe3dfa..3a93883b4 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -387,6 +387,30 @@ func Test_spellfile_format_error()
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
+diff --git a/src/version.c b/src/version.c
+index fbc2c8b15..ceea0d5e7 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -736,6 +736,8 @@ static int included_patches[] =
+ {   /* Add new patch number below this line */
+ /**/
+     736,
++/**/
++    725,
+ /**/
+     699,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f0e54d71e08..9e2338fcb04 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57455.patch \
            file://CVE-2026-57456.patch \
            file://CVE-2026-59856.patch \
+           file://CVE-2026-59857.patch \
            "
 
 PV .= ".0340"

