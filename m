Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24CEC531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:37 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19553.1784798790776570920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=N0sYuUAC;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-caf45fc5202so433579a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798790; x=1785403590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzws/VPXReLb9Ubo3W/dFLZ+ECn9wb3Sdu7cPsznnqQ=;
        b=N0sYuUACvdXzB+IazzkYPGr/w7of+2xLYw+xQmMnSKvENxrsMtxnQxvT6Guhe7Ec1W
         Kk9YD8LI+8vrTHf2juhE43deflChh9FycMxeUxlSZKvk3+0M57/GQdPvXfPyosf25Ktq
         8Tw4LYZpaIWiJ5yVde0cTsksHBOQzD57yzleM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798790; x=1785403590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tzws/VPXReLb9Ubo3W/dFLZ+ECn9wb3Sdu7cPsznnqQ=;
        b=QENZ+OF67hYqCU6jKLKM6pO7YfsMZ6I+Wvp12sgwHDObCqQrj/GhgOKMIJrsz+xEmz
         8nkRT6jPbSoR+EPpMxL0f8Bzq3/an9kDLlAKS2GJZKKXQWcgcswHcPM8G5y9Hwfzduex
         qgOW3JyKDdGVnhpSTw9OuMeZWxrCtxy2Xjk1lz3DzlT2s8svx3JCUaGJSdZfFTW8mClt
         WFx67GT9z1lUCcxQu/6cGteoejpc4PlgHy1/1XH1TKLoQh0JMQIIqyU34q5CdMI5NzTK
         X7a1p6LeKZpvJGph3bmIGGN6qBWxH+NVn6fKH0gMaoraUpV9NFDl7AT+xGcY0TfiFvnu
         WnRA==
X-Gm-Message-State: AOJu0YwYyutPriJTnvpo1jXpppdTjLkERUsZnglbctVq35mVV8zN33AC
	41h1QD2/hzC408MIaj+2BfgWehiL9qa3vY/HLR4uNdhlf+N3uRsBRxbeRi1JwrZqNPgTZizemjx
	BilCn7gE=
X-Gm-Gg: AR+sD12Gy2Q9ml03F/f1xcGQcvSYcORNSmJdOJlinz0NH+6XguUddaxxpuyXKSsSUNz
	WHBerd2GHVg6gsGQqPxcwdGl8oRvNUHpG4o5ud05PL6Q8lGdlEtIye4XOlJVld+bxFkDG7stZ9E
	fbVzDux2UbAx2FRsaOUXlEnRccP9O3bH53G0+4jGR5KB5fZJye4XjCdig/0ZAdHwaJFyGuNKZlW
	4hkFN199JKuS1Iv9NSRUsL9zoDhm+W4xXuv4OGCce5ku5eAUR8Htsghc8pJtMY3B/BOPk8CennH
	siT+h927jBO3KSbIOlEmXLZhuZYNUrEG9LS6oYWt6fHsreEtQs+RWk8+Ngufe40uawak+Cb+y9i
	88KIAAZZC7IrG8zew/sjHsxoC0myhAf5ncW057SrjrvAzFO5ycunxHkL9+dV+jh0ULAtllVzMsq
	KYyJ0QDHCLWkE=
X-Received: by 2002:a05:6a20:b68a:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3c44b051f78mr2372112637.30.1784798790107;
        Thu, 23 Jul 2026 02:26:30 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:29 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 10/13] vim: Security Fix for CVE-2026-57455
Date: Thu, 23 Jul 2026 14:53:51 +0530
Message-Id: <20260723092354.54697-10-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241814

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57455
[2] https://security-tracker.debian.org/tracker/CVE-2026-57455

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-57455.patch            | 72 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57455.patch b/meta/recipes-support/vim/files/CVE-2026-57455.patch
new file mode 100644
index 0000000000..722238c794
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57455.patch
@@ -0,0 +1,72 @@
+From 497d2fb19b2af9bccf139bb910e4f91b583e769d Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 21 Jun 2026 19:20:03 +0000
+Subject: [PATCH 13/17] patch 9.2.0698: [security]: Out-of-bounds write with
+ soundfold()
+
+Problem:  [security]: Out-of-bounds write with soundfold()
+          (cipher-creator)
+Solution: Add an abort condition to the for loop to validate the buffer
+          size.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-q8mh-6qm3-25g4
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/497f931f85339d175d7f69588dd249e8ccfed41b]
+CVE: CVE-2026-57455
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/spell.c                    |  2 +-
+ src/testdir/test_spellfile.vim | 21 +++++++++++++++++++++
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 6ef3fa899b..a7909ef46e 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -3273,7 +3273,7 @@ spell_soundfold_sofo(slang_T *slang, char_u *inword, char_u *res)
+     else
+     {
+ 	// The sl_sal_first[] table contains the translation.
+-	for (s = inword; (c = *s) != NUL; ++s)
++	for (s = inword; (c = *s) != NUL && ri < MAXWLEN - 1; ++s)
+ 	{
+ 	    if (VIM_ISWHITE(c))
+ 		c = ' ';
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index e5f8c5778f..d04d024911 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1193,4 +1193,25 @@ func Test_spell_sug_tree_count_words_overflow()
+   bwipe!
+ endfunc
+ 
++" A word longer than MAXWLEN must not overflow the soundfold result buffer in
++" the single-byte SOFO branch of spell_soundfold_sofo().
++func Test_soundfold_overflow()
++  let _enc=&enc
++  set enc=latin1
++  call writefile(['SOFOFROM ab', 'SOFOTO xy'], 'Xtest.aff', 'D')
++  call writefile(['1', 'foo'], 'Xtest.dic', 'D')
++  mkspell! Xtest Xtest
++  defer delete('Xtest.latin1.spl')
++  defer delete('Xtest.latin1.sug')
++  setl spelllang=Xtest.latin1.spl spell
++
++  " Before the fix the copy loop wrote one byte per input byte into a
++  " MAXWLEN (254) stack buffer with no upper bound, smashing the stack.
++  let sound = soundfold(repeat('ab', 300))
++  call assert_true(strlen(sound) < 254, 'soundfold result exceeds MAXWLEN')
++
++  set spell& spelllang&
++  let &enc = _enc
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 567da7be0c..8794f831b0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55892.patch \
            file://CVE-2026-55895.patch \
            file://CVE-2026-57452.patch \
+           file://CVE-2026-57455.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


