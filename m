Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955F7C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5544.1788326827308028214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2Z87LDQ3;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so6491575e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326825; x=1788931625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7WEpviTguFZ5mTWL692eDw+N9GHxJmERu+9JJ+O1AXY=;
        b=2Z87LDQ3Ssb/OEvLL+9+M5ij4dvX/ZZ0YnIQRPcelCouS2w8k8qtSom99mq/cCAuvJ
         b3ZGBEnLotszyS2Op+hyez6C9mA2dJKC52CCF5/8/XcsBY3Ry4VOU3fCuuyMVqx3DNL7
         /fpkObS5TeDC84igWCPx5JLso9IRW0N5j7P5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326825; x=1788931625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7WEpviTguFZ5mTWL692eDw+N9GHxJmERu+9JJ+O1AXY=;
        b=M5pHMpiVl7/NyWr0oWzaOdX8efOfKMMx3Wo1O+hA9M7kgpAZ73pzRZqBJ6EJu0b640
         rnhZzv8qj3B36UIHiBfgyl7fgTbkJmfmrpHLio/35TxisGALM71/kqX1E9fMxe45G60e
         Euu4lKfzJYwZht+OXkWXR+IDFDzcbiPOrx3Z9MyJotVE634v6PEFCN94GODX+QGR6n63
         0Nc/8aIyhGU6p7RSDFKuLMhEULt1RM6co4QjC5NHSbXpKw8uIE6RYX3f0fServ0JzoQm
         BX/jaqRfhWnBLsEXIDdrcFmddIC6qTJnvxNW6uZ4SWU4Nglug2krLVccxUdasuPHWwD9
         u5CA==
X-Gm-Message-State: AFuF++mi91MIcbJTEvLSMW4pWI7LOufWo9NcM26AcLExcjqgNZ7PS2Ta
	UkvFb9us9eeECltJ5LCu4SWFQDQ2izZWOWXNcVuVjIgLTq3CxtQ7IfmqSfZ0uMqDaeduYGZEpgf
	XuZt3jYs=
X-Gm-Gg: AR+sD10P4135BRMYLhZEHazuG9a1vDkxQbWvzZ+sC+wodtrEosOsbJ7IPD5ZwYVmtfM
	xxTL4elSAN0o7XFTPUhnhKVf+WIvOAY1vCLFshRO3IhH/h9tVcWv9qvGdV+k4RTGBhzvbDjox2o
	CBUZDymeatUUe3jVFsVi/6H9XWXQknwDx+Is2ewQfwc1cMaZ7FB9oqsETSwH12pLkCAK4qMHKj0
	Xuo+uWNIVRdruVQT/AKjJMSnmhk8rdJOl4Osx052qDGo7f1g9IBDJ7KcbgwkpriGUNx5z+CdHAu
	GqvZ/B3ChS3yql0wFVC6rn17tWniZ3W7OcvHq11SJT6pBR2xwdTuCgr2VsKMYy94Io8AAK6abSP
	p0cSft3rPylYs4szoBWykcH81gXKDunGYCC6B2VyW0/oLKT6Sd6TjOV3ybuerko+bs4V+j/nV9x
	z/hDFjPYc/rP7ZGer/M8rfwmoiJLgXO9doBPET8oQn+oEV8ZtKdIIG0ZHudJgpnsnUStAvxsUsH
	krG11OsWUdld7Fk0w==
X-Received: by 2002:a05:600c:3b1b:b0:499:db27:7b1 with SMTP id 5b1f17b1804b1-49ce5823d39mr33854635e9.15.1788326825585;
        Tue, 01 Sep 2026 22:27:05 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/27] vim: Security Fix for CVE-2026-57452
Date: Wed,  2 Sep 2026 07:25:37 +0200
Message-ID: <140b752df903df36a10ffeb1f2bca7b2e3bb8a06.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244870

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57452
[2] https://security-tracker.debian.org/tracker/CVE-2026-57452

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-57452.patch            | 76 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57452.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57452.patch b/meta/recipes-support/vim/files/CVE-2026-57452.patch
new file mode 100644
index 00000000000..aaefbe80eb7
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57452.patch
@@ -0,0 +1,76 @@
+From c8777cec25dcfae89c42e9aff51af61f71c5745f Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 18 Jun 2026 18:41:16 +0000
+Subject: [PATCH] patch 9.2.0671: [security]: possible out-of-bounds read with
+ sodium encrypted files
+
+Problem:  [security]: possible out-of-bounds read with sodium encrypted
+          files (cipher-creator)
+Solution: Verify that there is enough space before calling
+          crypto_secretstream_xchacha20poly1305_init_pull()
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-c4j9-wr9j-4486
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/c8777cec25dcfae89c42e9aff51af61f71c5745f]
+CVE: CVE-2026-57452
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/crypt.c                |  3 ++-
+ src/testdir/test_crypt.vim | 24 ++++++++++++++++++++++++
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/src/crypt.c b/src/crypt.c
+index 55edd6c6de..a11d204e5e 100644
+--- a/src/crypt.c
++++ b/src/crypt.c
+@@ -1257,7 +1257,8 @@ crypt_sodium_buffer_decode(
+ 
+     if (sod_st->count == 0)
+     {
+-	if (crypto_secretstream_xchacha20poly1305_init_pull(&sod_st->state,
++	if (len < crypto_secretstream_xchacha20poly1305_HEADERBYTES ||
++		crypto_secretstream_xchacha20poly1305_init_pull(&sod_st->state,
+ 						       from, sod_st->key) != 0)
+ 	{
+ 	    emsg(_(e_libsodium_decryption_failed_header_incomplete));
+diff --git a/src/testdir/test_crypt.vim b/src/testdir/test_crypt.vim
+index 4a96c30702..151a4dea17 100644
+--- a/src/testdir/test_crypt.vim
++++ b/src/testdir/test_crypt.vim
+@@ -459,4 +459,28 @@ func Test_crypt_set_key_disallow_append_subtract()
+   bwipe!
+ endfunc
+ 
++func Test_crypt_sodium_short_body()
++  CheckFeature sodium
++  " A VimCrypt~04! file with a complete 36-byte header (12 magic + 16 salt +
++  " 8 seed) but a body shorter than one secretstream header (24 bytes) used to
++  " underflow the body length and crash with a wild out-of-bounds read in
++  " crypto_secretstream_xchacha20poly1305_pull().  It must now fail cleanly.
++  " Bytes: "VimCrypt~04!" + 16 salt + 8 seed + 8-byte body = 44 bytes.
++  call writefile(0z56696D43727970747E303421
++        \ + 0zA0A1A2A3A4A5A6A7A8A9AAABACADAEAF
++        \ + 0zB0B1B2B3B4B5B6B7
++        \ + 0z0000000000000000, 'Xtest_sodium_short')
++
++  let v:errmsg = ''
++  try
++  call feedkeys(":split Xtest_sodium_short\<CR>foobar\<CR>", "xt")
++  catch /^Vim\%((\S\+)\)\=:E1198:/
++    " no-op
++  endtry
++
++  bwipe!
++  call delete('Xtest_sodium_short')
++  set key=
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index bd1d52eaf67..567da7be0cf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-55693.patch \
            file://CVE-2026-55892.patch \
            file://CVE-2026-55895.patch \
+           file://CVE-2026-57452.patch \
            "
 
 PV .= ".1683"

