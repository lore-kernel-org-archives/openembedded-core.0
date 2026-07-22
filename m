Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EADFC4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:24 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46871.1784723655361029236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=L28X0mYU;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dcbade417so10738804a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723655; x=1785328455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dP+I5WFwGkJ7NvOLxOXBkTLQIBteIU7BYPG5ytKdAdc=;
        b=L28X0mYULPHq5dl/071841AlQzUS4uDM7zyZvBYRTHC/Mjjvxe65/RRMxruAS+H7xm
         y4tZSw1MjHQ5pqGpg9AJhA8yfSQxXH6npVy4jtBsGpAmgEBgG/BcreYw/LfWCieMOAMu
         OMt59b2T5FtjPWX8uNz3jyuKg7wHsjyu5cooQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723655; x=1785328455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dP+I5WFwGkJ7NvOLxOXBkTLQIBteIU7BYPG5ytKdAdc=;
        b=rehAvAHBIu+PsMLTTOvGIiXgqkhm0QEzKfXDXUmf1+mnTSO59fUOMlknP69Bl2S0UN
         b9XzuwaYhnOpm9TZVjIKBklUSGT1mDn+hMUzysP4+gLWmk3XTnX9GY06AOzziQ57D8wB
         OYpHLxZrYk7xDzgNDA8w56ZZEp03u+WRn2Dlm9M6RI/Sdz2EqOHgZxJNZgE4AwgLP6bC
         QvbzTAxO/MFqw+4v+AJt8LiUPqPybMZ16vaAjNdGBkCA9gx7RYpyWLxS4YEr/gRWB/zW
         3wGsYegVcoHq4oeWaZxxEkMfLrkgdsbPbC11dRXUe8NXjNq+9jUSM2eC9e+WpSgE9hlM
         GbMQ==
X-Gm-Message-State: AOJu0YyKPyA3xP0lP6W25hpxn1Y3hIodHnjbAU4Cch0NbxeRFY9rN5Oh
	+sFhyPSoYdC1nVn2BeMDRd1UMnPX3hKwHhlzWTamj0h7RRCNQlxO06fF9O5Nkn1aYRrxHLzNWWA
	gbT9b2gQ=
X-Gm-Gg: AR+sD12NjGr5qlBRHBE5NxVpu2j09aVe+akLBAIE/ZDU6R3nG6qH9Bt3jkECXzrGIU/
	uE+evsV8KUPjQeL+rOhvyzJr8Q1bu3H4CQOuWKAKH/xbsCvzwX044k93bHuyQwe0fnP+cJ+7vuc
	Umiy87SAPraexyBRFWZgsVaN0Tcl25CFe64IV32eSBilraA78PNgbnMxf7G+TyHCT83B0rShcNG
	za+YoDlcCmHvg9bx8aUBEqUfpvOiJUXYwJqDYou9tG9Avnv05T7W//ignr6AsSVYIEPK5rZl+9G
	zGUlp9nQZn6uxtKH1c/yPmobH1jcouwwN+Qhbr7PKmDDX72LgbJDlj3fFHu5XKi4+9yqgi29vDk
	9QTBVCHkaurRyT9E4S3YQ7UGRMs2/D8pumN477opiqpQXBYDKjg59Ss5J0WhiYmFzjhbS1dX43/
	DyFwRsx0Dd6hFuNmvr
X-Received: by 2002:a17:90b:544f:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38e4b5b7637mr23026303a91.43.1784723654625;
        Wed, 22 Jul 2026 05:34:14 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:34:13 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 06/10] vim: Fix CVE-2026-57455
Date: Wed, 22 Jul 2026 18:03:32 +0530
Message-ID: <20260722123336.587556-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241674

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57455
[2] https://security-tracker.debian.org/tracker/CVE-2026-57455

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-57455.patch            | 72 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57455.patch b/meta/recipes-support/vim/files/CVE-2026-57455.patch
new file mode 100644
index 0000000000..51f0eb7fe0
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57455.patch
@@ -0,0 +1,72 @@
+From 497f931f85339d175d7f69588dd249e8ccfed41b Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 21 Jun 2026 19:20:03 +0000
+Subject: [PATCH] patch 9.2.0698: [security]: Out-of-bounds write with
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/spell.c                    |  2 +-
+ src/testdir/test_spellfile.vim | 21 +++++++++++++++++++++
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 01eb57e3a9..060a2251a4 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -3270,7 +3270,7 @@ spell_soundfold_sofo(slang_T *slang, char_u *inword, char_u *res)
+     else
+     {
+ 	// The sl_sal_first[] table contains the translation.
+-	for (s = inword; (c = *s) != NUL; ++s)
++	for (s = inword; (c = *s) != NUL && ri < MAXWLEN - 1; ++s)
+ 	{
+ 	    if (VIM_ISWHITE(c))
+ 		c = ' ';
+diff --git a/src/testdir/test_spellfile.vim b/src/testdir/test_spellfile.vim
+index 4da270acea..c0c46a32d2 100644
+--- a/src/testdir/test_spellfile.vim
++++ b/src/testdir/test_spellfile.vim
+@@ -1223,4 +1223,25 @@ func Test_spell_sug_tree_count_words_overflow()
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
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 82f63f6067..dec5b68324 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57453.patch \
            file://CVE-2026-57451.patch \
            file://CVE-2026-57454.patch \
+           file://CVE-2026-57455.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


