Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F42DC982DB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:07:54 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1557.1789682873691947474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EgfpE7WP;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso1011145e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682872; x=1790287672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8NpdUPWZVOVoZohSSzSKanPFI/K8WGLTavl6xcsnf2Q=;
        b=EgfpE7WPcyf5FB537h5sG2FprDQtmFNFx1U1Lnk4tWB2rjKrCpKCBCjHTPeSX1Bw2j
         pVpv33PfiuXYDu9BnFcKv1wjDGx0Scrl5SngSwmu3mNIj2WEKBuFl5lkhyVOZ0jnNYCh
         SHIrweqrFFWjZFwjCeQR70IIT2tWl7908s9/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682872; x=1790287672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8NpdUPWZVOVoZohSSzSKanPFI/K8WGLTavl6xcsnf2Q=;
        b=nWGl7DAcxATXIeUERM1NksHYnH4RqHgdwlTBkmUQl4Xszx3ndffe8desU4Yz02FIhA
         T+uyRZa2VmuXSxNcOP8Nyh5nTm/lijs/VwTM9UYcypsQnFXRxYpTUpsas9RheCIIL5EN
         fIA2/0MbhrBng/1ikwI14O9BuovLFMP1Cm1oNv72fYOxT3l98wdSxsay2cckhxNgomQY
         +HMimorIc1BMMOpG8/yvuBa0uWcqfmyhhffc9lU0CIYNSrK5sg1x5jMTJ3lx/u9b12Z+
         TmJ7TeF2m0PPByNtOivE+Lm2mQdammbYCrlV+uGE/l14DbJ+l7LaLsY/OrHNm9DG4w36
         2vtA==
X-Gm-Message-State: AFuF++kn6y3X+xskiWtmJZKzJ8XqTA4PQASiIEo5la/ocjAIXdEFUZpA
	CP1m0ncffGPjjHsZ0zFWirKT25f9XrnUOuiNBAiSgWGShSHBfAM6tAEtsv9d9Z5iWwoFCl3i3pH
	8OZIgbKA=
X-Gm-Gg: AYBFou0xqhmLARTzLjoBwrGX3Wt3nGox8A36dFCuZdLiKw3VwfhZvuqqwca++X3dh5b
	3iiRhqqFHkAqxdVJGRS/dtvei5onckA1V5jSkyYaawM3zkojQvrdd024xEE/t5Ry0phbP828hRt
	7P4HSSofFYhRyb5+Xd+QZgcAoUKeWBZT5Xsi+k9S09ETobXaonr8cXeE4wovfkpuxp3MBKltuNz
	pVE8bbgimv8ADu1UiCn/a18v4W410G9U8ilzL2Ud+y5KgWkodl+AJ9adz27g0HkKmmwbaU+Tvwg
	ugE1L58qgiz+cCUe0SWWix8LvVNIsC8ElcS51dtRY/rUpGEWhTb2HLCyarPzOv6T0Cfux3NqNHk
	ZAAaFgWqc6XDmzHvZrN/SYW2Eq9T53jryYsaVWq0DXZYxSdLL8Fqpq0+IZY2uhUUwnc0XT0U8m9
	Sd8Tc5qdk1/054lc5tOLmUSY5G1hAesz4as115aCM4SZKTddrs/QrioTzPx10mVcGW5cYQpSTnD
	KMJHcx7qWuzPBRHyI5s1HwQAY8fmYbudHulkbLRicGY0/OZKXhWQgeAJ6yKtSlKs7ksLWP4JAQ=
X-Received: by 2002:a05:600c:1391:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-49fc574114fmr2979915e9.19.1789682871851;
        Thu, 17 Sep 2026 15:07:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/79] vim: Fix CVE-2026-52858 regression
Date: Fri, 18 Sep 2026 00:05:50 +0200
Message-ID: <7a78c67a15aecd7c455196419103a83b9ce12c4e.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246100

From: Devansh Patel <devanshp@cisco.com>

This patch fixes a regression introduced by the CVE-2026-52858 fix
already carried by OE-Core in commit [1]. The original security fix
added the g:pythoncomplete_allow_import opt-in, but the documented
behavior was broken because vim was not imported in the completion
class scope. This patch applies upstream Vim patch 9.2.0568 to restore
that behavior.

[1] https://github.com/openembedded/openembedded-core/commit/24ef5a9dfffe7b3d96fb62c0d3248348696c9115
[2] https://github.com/vim/vim/commit/4b850457e12e1a678dd209f2868154f7553cbf8d
[3] https://github.com/vim/vim/commit/868ad62cb8bf8038322eab2badd31bd98b02b9df
[4] https://github.com/vim/vim/security/advisories/GHSA-52mc-rq6p-rc7c

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-52858-regression.patch | 93 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858-regression.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch b/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
new file mode 100644
index 00000000000..50392fb76f1
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
@@ -0,0 +1,93 @@
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
+- Omitted src/version.c because the Wrynose recipe remains at Vim 9.2.0340;
+  the upstream version-table hunk is not needed for this backport.
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
index 77f681410a9..b3732cb780e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-45130.patch \
            file://CVE-2026-46483.patch \
            file://CVE-2026-52858.patch \
+           file://CVE-2026-52858-regression.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
            file://CVE-2026-42307.patch \

