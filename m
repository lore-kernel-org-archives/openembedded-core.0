Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12B7C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:44 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2824.1790154702926029669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YEPVETr1;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so2339295e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154701; x=1790759501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T9H3u0FhrHWhuEACS/puMRQevHOwzCisEuBnQHMu1rs=;
        b=YEPVETr1MGByosimlD+CvqhrzaMQUsma16yaVnZn2RIDSF3d4JetkIbBsRVVfcSYHm
         rjpz5rGUVhQOx3bjbS1EWxzwjFdzHB0z+INnLDOXtatPUrY+95cAjnF9xbOey9riu6iV
         V7m9OcHZn0guelKhEGPZq3djWc16VPSXEeOH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154701; x=1790759501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T9H3u0FhrHWhuEACS/puMRQevHOwzCisEuBnQHMu1rs=;
        b=p5d6oQ0qFwUyvmSpWPl/f4prpMTEMZPDbZubq/n4bsDx8Qa1CjMM2ayxxSM4seHsH7
         iI4Ba4wzBlgPIzEn05EYCRXclIVk5+0UjxBC+ZZFOlNPYJQpZfT9rrXkihu4u0FKCPIh
         IFhWBKwjBAkmaUnNMsQtwUyeKtE1DAE/9S+o+oaL5h2pJZugS1JWrbnCkVahwjJSWe59
         1HOHmO96lTBy2WrIuKIC7zMjQ0wcTbhIXudY7uhpbah1VLON4GAb1y8NvKom2yxJa17I
         h7noVb6Ryb3cL01R2Iyv8nOU6pEXBL1Z4SAUUe4LUG3JePkQcwIKRZXY5FRcsSBe4/9D
         sfUw==
X-Gm-Message-State: AFuF++lYBiwwNlQOh8MjbE+U5Nb5p2l0TrxuLj9EmJPJFQQl1w8hhCWO
	DsGUW6vvRrHFfcx0JBkh9qeZ85cfyPpa0r2thiIt3aVP9ZjLxbEFxXhPY46Mr8NF7HNg6/+svY9
	ujresliE=
X-Gm-Gg: AYBFou1hHjf1uRn55Hq6itRIpAJOXNCNAi7wTijEV3o8vRFWzxb4d69uPBnvXmfna1J
	qQTIrmFzpBk2viqlyELKLgN5lmx5iICr6x48wiBSe7d6yptA98c7qBina1C6BMSeFwvx9Zupu7r
	eJI7tgnobV7AQTE+DYFHxItbRHcfDEB7gKkDKfeARsN6E1DXsxg7ZMDuMgMXTpHsSX/BSOPdjlq
	UosbBfXxWFoW0VOKfqlU0L7mpAFigK6KvRZj92TAKhl1S6B+gPW7bDpskuNTEk7Axsk0EksScMX
	XEkEAFRn8q+grjsxbE3RQja9VAhr03nx9rFMOPKxYAz6RykWrxdgTKpsycJPtbfht0N6Ci3mTGn
	ccHRDPEiYzdR+wyuLhV4U6cd/G41jqykzoEKjUaOoYxiSFeXLay6Bha96+DD5qjv6vFuOzj6zDD
	kgdhKxlmNtc7gPNxwwEctgAsbtJAML8LIEVhBVfN9yB4hB2FGzvDVQnfMQcphe8cMrCNVfca4QM
	jnkxyyXXZmFWNNgivDuCe71SwUeCUSxn4yZv5qaT6IExEFYec8SCpQVAuaxuBxJ7BBVYVQK
X-Received: by 2002:a05:600c:1f90:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49fde20e848mr27511995e9.0.1790154701041;
        Wed, 23 Sep 2026 02:11:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/48] vim: Fix CVE-2026-52858 regression
Date: Wed, 23 Sep 2026 11:10:23 +0200
Message-ID: <a453d2d1de09a828fad9b68e5c1c84e832dfff4f.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246483

From: Devansh Patel <devanshp@cisco.com>

This patch fixes a regression introduced by the CVE-2026-52858 fix
already carried by OE-Core in commit [1]. The original security fix
added the g:pythoncomplete_allow_import opt-in, but the documented
behavior was broken because vim was not imported in the completion
class scope. This patch applies upstream Vim patch 9.2.0568 to restore
that behavior.

[1] https://github.com/openembedded/openembedded-core/commit/1c08fa48b6765ace24a261ecf43f871e850cee88
[2] https://github.com/vim/vim/commit/4b850457e12e1a678dd209f2868154f7553cbf8d
[3] https://github.com/vim/vim/commit/868ad62cb8bf8038322eab2badd31bd98b02b9df
[4] https://github.com/vim/vim/security/advisories/GHSA-52mc-rq6p-rc7c

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-52858-regression.patch | 94 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858-regression.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch b/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
new file mode 100644
index 00000000000..d3b11a62629
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
@@ -0,0 +1,94 @@
+From 8075209bb1e721ca89c2e7fd5d216d7fe2bd3ea6 Mon Sep 17 00:00:00 2001
+From: thinca <thinca@gmail.com>
+Date: Sun, 31 May 2026 12:33:07 +0000
+Subject: [PATCH] patch 9.2.0568: pythoncomplete: g:pythoncomplete_allow_import
+ had no effect
+
+Problem:  The security patch 9.2.0561 added a vim.eval() call inside
+          Completer.evalsource() to honor g:pythoncomplete_allow_import.
+          But the 'vim' module is only imported inside the outer
+          vimcomplete() / vimpy3complete() function, not at the script's
+          top level, so referring to it from a Completer method raises
+          NameError.  The surrounding bare 'except' silently swallows
+          the error and leaves allow_imports at 0, meaning the opt-in
+          never takes effect -- 'import os' (and any other
+          buffer-level import) is always skipped, no candidates are
+          produced for 'os.<...>' and
+          Test_popup_and_preview_autocommand() fails on the Windows
+          CI matrix (Linux skips the test because Python 2 is absent).
+Solution: Re-import 'vim' at the top of evalsource() in both
+          pythoncomplete.vim and python3complete.vim so the eval reads
+          the global, and set g:pythoncomplete_allow_import = 1 in the
+          test (it is the opt-in intended for callers that trust the
+          buffer contents) (thinca).
+
+closes: #20386
+
+CVE: CVE-2026-52858
+Upstream-Status: Backport [https://github.com/vim/vim/commit/868ad62cb8bf8038322eab2badd31bd98b02b9df]
+
+Backport Changes:
+- Omitted src/version.c because the Scarthgap recipe remains at Vim 9.1.1683;
+  the upstream version-table hunk targets Vim 9.2 and conflicted during
+  cherry-pick, while the runtime and test changes applied unchanged.
+
+Signed-off-by: thinca <thinca@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 868ad62cb8bf8038322eab2badd31bd98b02b9df)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/autoload/python3complete.vim | 3 +++
+ runtime/autoload/pythoncomplete.vim  | 3 +++
+ src/testdir/test_popup.vim           | 4 ++++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index a0314242b..bdabf62c8 100644
+--- a/runtime/autoload/python3complete.vim
++++ b/runtime/autoload/python3complete.vim
+@@ -158,6 +158,9 @@ class Completer(object):
+        self.parser = PyParser()
+ 
+     def evalsource(self,text,line=0):
++        # vim is imported locally in vimpy3complete(); re-import here so the
++        # vim.eval() below works (otherwise NameError, silently caught).
++        import vim
+         sc = self.parser.parse(text,line)
+         try: allow_imports = int(
+           vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
+diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pythoncomplete.vim
+index 39b1efd29..761488244 100644
+--- a/runtime/autoload/pythoncomplete.vim
++++ b/runtime/autoload/pythoncomplete.vim
+@@ -172,6 +172,9 @@ class Completer(object):
+        self.parser = PyParser()
+ 
+     def evalsource(self,text,line=0):
++        # vim is imported locally in vimcomplete(); re-import here so the
++        # vim.eval() below works (otherwise NameError, silently caught).
++        import vim
+         sc = self.parser.parse(text,line)
+         try: allow_imports = int(
+           vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
+diff --git a/src/testdir/test_popup.vim b/src/testdir/test_popup.vim
+index fac2a7592..55c2f232d 100644
+--- a/src/testdir/test_popup.vim
++++ b/src/testdir/test_popup.vim
+@@ -723,6 +723,9 @@ func Test_popup_and_preview_autocommand()
+     au!
+     au BufAdd * nested tab sball
+   augroup END
++  " Let pythoncomplete follow the buffer's 'import os' (off by default
++  " since v9.2.0561) so 'os.' can be completed.
++  let g:pythoncomplete_allow_import = 1
+   set omnifunc=pythoncomplete#Complete
+   call setline(1, 'import os')
+   " make the line long
+@@ -745,6 +748,7 @@ func Test_popup_and_preview_autocommand()
+   augroup END
+   augroup! MyBufAdd
+   bw!
++  unlet g:pythoncomplete_allow_import
+ endfunc
+ 
+ func s:run_popup_and_previewwindow_dump(lines, dumpfile)
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0acf8247b72..5a34c1fa35f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-46483.patch \
            file://CVE-2026-28420.patch \
            file://CVE-2026-52858.patch \
+           file://CVE-2026-52858-regression.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-28422.patch \

