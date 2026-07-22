Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA239C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:23 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9357.1784751736731488787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cuoRsSoA;
 spf=pass (domain: mvista.com, ip: 209.85.215.174, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so8215543a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751736; x=1785356536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXdTaZyWKkwVjAQEYKXmUhUEp7G783ejPNvu6vGMr4w=;
        b=cuoRsSoA4E8FaVY9hIWFS5RbeYlTns9vrY+BX+WSUwEP/G8a42x5hDmd+GJtkpcXiQ
         dLkaYl6ZXT0nExzTyAEmgZYT/mA9JfEmugFzhN+4Eua3mqY5SumA8Vy9H5P0lQIPMoCm
         5W5REuFMQGHQnOYmaRRg5V18U8iH10Qq4Dz2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751736; x=1785356536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXdTaZyWKkwVjAQEYKXmUhUEp7G783ejPNvu6vGMr4w=;
        b=dvAQMjw1OCSZlE5Wgm5rKU4j9TxKXsI+GWudpMb9UJFA13fLvVZC8Pc0zg0tW+D1hb
         oeS9eB2o4liv5JC2lAVF2Onh/Hw9qTJu4dGLikb1M4zoSeMASqU04nRTCeU3vYjbXlB8
         pQN6HAlJeCrOqOkZJ8W3sNaESzyT1xMG8PPPxKf7AqkCqP+PZG+FIX4aaKPb6BGxH0l9
         To6jfk5I8gMSC8ZC8W5DB3/CnGVyoXwwrRIF2Ni0sDkpbe5mKOXzjM09POkkMbVRfKjF
         86gYolzIvkNAAbhBnc7A0FRotyZgDRm1+ckfVra5qPlW9jrTqZBDOiARGS2vDimzNl1b
         QhaQ==
X-Gm-Message-State: AOJu0YywzKknftOdrSjui4Oga+B4FngUDrDoAbmMq5Dt87RROKVnnqRo
	mY63+UFn0KW56STDf6ULP9ebybD5ye0d0Tp/CwrJWSD0LV1PkIF5OTH+g12iesqrNwWDNOuH0VR
	oKetn9oo=
X-Gm-Gg: AR+sD11RrrPuQOddIpqzRyG+CH+WVMhRJufWYk93usrtdT4quHWG3Xy1T9+1A9i1FkV
	D5LXzwaf9gWb83hXsjyjqwnQDAhNEHtIkFyyduk2Ple/bCHChJAi9z4rykp+Y39Alb8lLplbq5k
	wrNGOlsKxk07uamtCOmHImp7i+4vN1sGrQS24tgw01dEm75HJALOMe5FkOGIxyGRYMZ0yvmNCwi
	8IOgX4wVdWZtYNkSDMeZIPTUHP8dAENjnvfmSqmT4Td8DWicAWtH82Hb+hft35Rabn0xTfR0e31
	OKTZMWD+Djmf8Tz4UFGP7nzHA6zycWRsiKJ4bfhhxj7Yq7Nv6pp3WXzUt72D8Pdpli5cEB7LPOS
	3LhbutK7IGDqBl9r/hSQRdMhsT8YtLUT2m4o29n8vAhdcKWshTsF8mQv0qvPkNsGfTkPqtn96Jr
	MxAU6Cg/1pdyLo
X-Received: by 2002:a05:6a21:6e03:b0:3c3:96dd:9ecc with SMTP id adf61e73a8af0-3c44b201100mr7424637.57.1784751736059;
        Wed, 22 Jul 2026 13:22:16 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:22:15 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 10/13] vim: Security Fix for CVE-2026-57455
Date: Thu, 23 Jul 2026 01:49:02 +0530
Message-Id: <20260722201905.491897-10-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241754

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
index 938fdecaf3..a76cdc53ae 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55892.patch \
            file://CVE-2026-55895.patch \
            file://CVE-2026-57452.patch \
+           file://CVE-2026-57455.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


