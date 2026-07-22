Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03515C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:34 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47128.1784723670676357573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Twe3NHWH;
 spf=pass (domain: mvista.com, ip: 209.85.215.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so4050446a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723670; x=1785328470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fH7whDIH9xzshCdb2nc6nk+OkEZt/O3UGVkrfTTRZs=;
        b=Twe3NHWHpSE3i4ptygAsJ8/+/ubk5658MSqSwsK9Y7DRBn0dl+x0rqcMvBCKGyn3Jx
         sOBlLJGl5Ho6ZKGKqMR2sjdX8ENyDExd5B5yXknA2q90zKU4Fufgye3TeniCGjT3BAXF
         Q0GbHvswvV7F5/ky9OhUXN3Ah5Q0PpA4ZjK90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723670; x=1785328470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+fH7whDIH9xzshCdb2nc6nk+OkEZt/O3UGVkrfTTRZs=;
        b=jGV7IYx9o9rz9IRBKzgKlyEqXRp0uic40cot5VjdW7amSxwSWCR8QUvpjfr9Iu2vNd
         L1qMLClXypAtwcgx0IkhJT+ckkY/DmkyW74oxVEhYP+S6hEkty9kFTe7BSIY0oRgcDJv
         kKNWrUGvPMlYwAa9LT3GHc68aOYFtBi24+ACY0LFm+Dx+YjllG/GZU3xdVKICLizlmJ4
         7D+5z4M0NZSPcKcqHnkNLB4EnSUW8XZV9zH1RZDQd+oj8sv+4I2NchasN8+sgq8RpQy/
         K4NXJbLY1GTeyL8JTSc+ducWXjuXN944mq790De+FONUrEBA1hUCTSWBmMdTw3ZECqsu
         9d8w==
X-Gm-Message-State: AOJu0Yx/xsWn/t0VXn2aybTXup/UPnNDMgHReZWUd4T43LMLO6+KzVhu
	FpF9vYTeknYhT05zWLwvuoRts5AXdlNppmH6fhae+droU/vjrOPaIs1BPpZ9tvdOQt3jUUSpD1+
	kd5oM6qo=
X-Gm-Gg: AR+sD13b1kWeKA7Zjqs7nSMwrt1q+FANqs2azGiQqlnMybHHhNzvEb4MbW6BCxgCytG
	ru4QrQgYxWCZ90m7kWQ++JXxPG/3xJxC+SxvZoTEKSZHYE+O0fVyoKtL2ycseQMYM+Y1xdk01uh
	6aR1V/Nb99ZtCp5coZLl0nuQGyRPNTwpmGi4ztPupCY+pGTMD2OBmiNq21R/LjzU2MehEPJn3LY
	8WdTPuTAqW7ydGWGiFIxTv/v+3axHkQ5xgWmczC7YHGUkL5gAJMBRbpaKDtgasmaxvE0jO+6sHX
	kXvxvoyNT1ZSPTeniGZgriH0VeZUx++AGchBKIWKTVpy5LVk1jmsSfdJ8uVmDX7YaE8jwK2r4zw
	k1UFGmA3dS0c2k7p7K428ZvNVm1rS73hUXEKe+fojWKea4B+hwEHVWgS3hylyO+4Jums/Mk7gT0
	ttehViDbl7MIdjw/7x2f0FNCyKxaY=
X-Received: by 2002:a17:90b:2f85:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-38e4b3e1015mr22028526a91.1.1784723670025;
        Wed, 22 Jul 2026 05:34:30 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:34:29 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 09/10] vim: Fix CVE-2026-59857
Date: Wed, 22 Jul 2026 18:03:35 +0530
Message-ID: <20260722123336.587556-9-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241677

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59857
[2] https://security-tracker.debian.org/tracker/CVE-2026-59857

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-59857.patch            | 110 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59857.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59857.patch b/meta/recipes-support/vim/files/CVE-2026-59857.patch
new file mode 100644
index 0000000000..aa1f0725b5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59857.patch
@@ -0,0 +1,110 @@
+From d22ff1c955ff87e8273210eae125aab0e85b6c30 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/spell.c                    |  6 +++---
+ src/testdir/test_spellfile.vim | 24 ++++++++++++++++++++++++
+ 2 files changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 060a2251a4..43a83ce7dc 100644
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
+index c0c46a32d2..a9bccc6491 100644
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
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b9f8e40a28..ab7564c3b6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57455.patch \
            file://CVE-2026-57456.patch \
            file://CVE-2026-59856.patch \
+           file://CVE-2026-59857.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


