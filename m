Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA31C624D8
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5677.1788326828131406511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DUjqzkMQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso5308665e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326826; x=1788931626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fsU+IIM1Lz+o3k3lueCbhCom523fjcbdfRpS5O32Z0U=;
        b=DUjqzkMQ3jmon/oIAeXd+wSCeHfZ4U5B/Pdaqjokv6VaSJkbJPK9kwHb6avwgDkkHD
         OpnM6ZjLBpB0XQ4ffJT/Gvtr+q5P0SS1aJ5MrVylOZySy9BnA98PwIbFKDNn8ra+fv/d
         FBqonhc6w2a39ET8iHBj1dg/1X5RYaWEqMlv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326826; x=1788931626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fsU+IIM1Lz+o3k3lueCbhCom523fjcbdfRpS5O32Z0U=;
        b=FLvaOMEAAP4T8jt/M9bR8RKQwjHriIJBu7uVcSBSpTnTGcGjuYlJqAIiGsCuWh/0Sq
         SpRIEZCCC1GVciYSeJ5ka+Eab8dwLjPdQiLp2tkIXly8EXM2PNLA7F8W9TLeNgKgn0ng
         5f3DY51uFHJCWyLeLKeuxEh0+nqr11Rv8le7GySzoCHZXh59ZJWTlltR2CQFKTrJvO1t
         HlgPcHPgLA53DwnbsmRRvOtjpCFcBFe7BEhO6e0von0HsaUACuH86HVX/idVZLU8ObXp
         btHmj+yIYzHluCi11BwxuxjCn0Aq1mmBWg6kOZ01j/lZNxgNjmXNj1EaUpsB6jVvXcaf
         3ECw==
X-Gm-Message-State: AFuF++kNcocb8aziT7957hjkbmIUldjout9UHiEN/7dBZwfY/TC97KZq
	efUFbo43EsmAaQwTp3gebm60IfOy3J/s5Ml67/zE7eBVCfjApxmf26rfY6X2DOYyeX5NrS4Ur2j
	AXHbrQ8U=
X-Gm-Gg: AR+sD11t37E+OY53+U29H4toQRXzom4QWYODXv7Zy0je5pldxLbkyU6dEQ2Pz2U4EvG
	iKBAobgn3vhk4lT3xq1Yu3iK07ccwF4v3Y++Funkkf4DtU8vbvGZhquRTmNpp4G+Ny5QjFksvMB
	WtAMoZ3vh5HKtl4ttPKjKrY2T9YawMXXfcvtLSKAw+KM551coE7mBti42m5xJRuHR376qLuQiTK
	7zU6dpkt9bp+sVhTC1z+fOy/pVrYUf63/6O0HMCjIUfyfWK2o1HIG3OZteB+B7PvrknjL7dGNsR
	0QUUFKeL2t0pI4x4L+b8wDk7VIayAo1itYBaQT8srWvr9z4b9uXYvnuPmtrxe9EUM3Va8keMCWw
	xegEoNMMEVVuJ4UViGuvpYCj/+eSqpNRk1iu4doihC9LEBwCcNNOD0NWpVyL7EUlMrcDikg0Txg
	LMc6OfiErS30E/rfxfZnPU3LbbCWKxw/ol9t8vtiaCSsOcSWcC0LhtbH+qHtE1eJKc24vW6MVBh
	cIbohb4PgGGyAuzbA==
X-Received: by 2002:a05:600c:608c:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49ce5826c6amr41386075e9.16.1788326826359;
        Tue, 01 Sep 2026 22:27:06 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/27] vim: Security Fix for CVE-2026-57455
Date: Wed,  2 Sep 2026 07:25:38 +0200
Message-ID: <91c8229fe73a22fdd07cec3db56fee2f281f1942.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244871

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57455
[2] https://security-tracker.debian.org/tracker/CVE-2026-57455

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-57455.patch            | 72 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57455.patch b/meta/recipes-support/vim/files/CVE-2026-57455.patch
new file mode 100644
index 00000000000..722238c794a
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
index 567da7be0cf..8794f831b05 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55892.patch \
            file://CVE-2026-55895.patch \
            file://CVE-2026-57452.patch \
+           file://CVE-2026-57455.patch \
            "
 
 PV .= ".1683"

