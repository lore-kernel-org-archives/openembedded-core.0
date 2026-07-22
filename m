Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC17AC4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:23 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9355.1784751742478078471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PI5bPFyd;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceed7018c8so64586065ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751742; x=1785356542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAnr4DfG96EQbUjFEAyG3/DKZ6T9l7h8nrH4+qzdin4=;
        b=PI5bPFyd0QxhWUgiIulOKLvukBXuo3r2nc57/jFrO/sEO51OZep/SAg7Mp5HPgjqVl
         DpteCIGxddF2ZerjaHmLhVtsBkVlTr/ob994xyIE9fUQYgvY31d1Py82wxQQrXfbSaAg
         Rc1V/LqSQTq/SEpHyG9cSpGEcvLeg7CnXCPD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751742; x=1785356542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAnr4DfG96EQbUjFEAyG3/DKZ6T9l7h8nrH4+qzdin4=;
        b=BXUqwMnBf6mYZnmfLF+JqKDXkaJ1rtC4A3HuhF8bExab3lrTGR+zE7zCoJSLjpw6BH
         UvvgLstDXTlcAfD4D4gCZKUMaV9bi6jlw53y+Kg+717Sx1ikA3QyqEmTa0Ycvs9W8Zi6
         7e36Xi1HCBNeleHlTGwkLnYTY9Znz/yU7g4gxQJIePnMUuWaJWIyfumyvzHuDtix+I4d
         LW3doAz1LzKQUA0Ltc3jBBCGps/6Qthh6PDezaT/f3aHR0ermhqKsEJ8yHi1iUGAlwIA
         GknkFfSxLwgwbPpTEZqWBVI1sQZ8S2rLD+0PmFVmSctKNP0ljpwdBNKvGCM87fCRCKnQ
         tJjg==
X-Gm-Message-State: AOJu0Yzb96u7QeUxtRM1FSbxDr+oe1xayxNH+wo0yAk/mMj9cNi3FaUK
	R/tKFxLR+V8NDwA7hKSGWaexfuHqkPJaGaO+IGEiuB3pdxKLycsLrX8V5XChtzUGvA8uf60dBHH
	78siWsEs=
X-Gm-Gg: AR+sD10wRLGx2H+wVsi1ipeWlT9aT7hNeswD6KRpFP+yCsvDu4woPgE9wOZyFg3i+/+
	xvL2eoFBFYCDc9oL1ZAWUWJ0NVAo2bNba3dWxtZym0oIp4CqK34tiretldwJ5wrVXijN/SjvZ3D
	Gb2niWSt4WcDc9iAGoa/NsBPjNZQ88BR3tKyUL8ycod9+AGzIKmQKQ+4ap0mshuM9rSY8Di8hVj
	+j+eftQPvMDN+p1g2GLf1Jx+2lrkST0WVy/Oo0mt2+h5Fi4/OaEioCMqeLcwuA+Q8w3w72wYhbN
	tG0xemFDoVdHqTbE1VwUB/XqXT4cTz6nhXE/up7925UEt1IYAd68ieotSL6FAJJzfr5VLLWF1ri
	IxrGCb6R+aqCmlasx6EUaPZGSqvHXLbowhA47JNEnHulyzDo5Uf/rYyXiJ1snr5KC9CKOlEK8dq
	Sswh8ehhCpIeEcUOB+vuqF5no=
X-Received: by 2002:a17:903:198c:b0:2c9:97a7:f548 with SMTP id d9443c01a7336-2cfa6f875f2mr4186175ad.46.1784751741751;
        Wed, 22 Jul 2026 13:22:21 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:22:21 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 12/13] vim: Security Fix for CVE-2026-59857
Date: Thu, 23 Jul 2026 01:49:04 +0530
Message-Id: <20260722201905.491897-12-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241756

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
index 770872df01..e659db50ed 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-57452.patch \
            file://CVE-2026-57455.patch \
            file://CVE-2026-59856.patch \
+           file://CVE-2026-59857.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


