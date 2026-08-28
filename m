Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1DAC61DE5
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3045.1787945896522174595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q0530IRe;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso7570255e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945895; x=1788550695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jn2L15yh9UYOq0GviclYN96jmm6FBKsE+XzP9/Dg9LI=;
        b=q0530IReFvLgeDSMD0vVa1Rw6bTcW9MF/wMK/+wCjLfLUZGac0RcycPs3ONhBsG6Bt
         mAccYLz71W+Fcd5AT3LDYLvt5ZunyR6iZyAALnmyLMGLHdAiWVAp+4yYHoyf+3++6uZs
         DTdHZnRPDtyU833Nh0WaNzqTlVQpUsK2HFHXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945895; x=1788550695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jn2L15yh9UYOq0GviclYN96jmm6FBKsE+XzP9/Dg9LI=;
        b=ocRdWnhyU+b4cCphEdFRbJlrWVWCzZCVKoiel+OacgdsmGZeVWtOLS1OobhT9vx+bJ
         PW2isz/W+3NHNHozcNCA0ztC7iRD08dVZfYDWKAEFL8WnelROy/X4TWFTU4gKqXPqET0
         c0lQP5AVcpUc4IKmEI2qZaicSMq8rwkKYOdt4HUBKC8VqjRZmjq/GnNw4wsvpE0WsA/x
         n4QkPdmMnvn3OPXGlb736Ay9PcgXfGiEONlubwhDM5P49Zsg0pY9TJS+A5u0ShkGZu/C
         E3r8rbYW5KY639yY1vRafz24fvO1iY0p3jyhfQanem20Wm11cJWd7gB83hQjY/ZXdNLE
         PCzA==
X-Gm-Message-State: AFuF++nbafA2RP97wVtQ/MW/6JJMlp6VIWKpJTOx7bd97gfx9pb4FB1G
	0qwCRiqS2xyDAnmkLg932LmNfqKQLINRUZ//L7fmggkqApvUrzUiAiU82USf967HKdqsKYhBJGL
	ef0Y6Kp0=
X-Gm-Gg: AR+sD12P2vTbMGsfjbA4OY0dDE9/aDMXAJqVZWqAPM8rFFeg2VP2DYxO4h/iKoZEtMA
	pL7F0Gp5phFxyxeDdSTIp1P4PEBUkSJ4G99gBxKuIkV8vbVNZGY25hja+5Gf+vhKDf9691B7Bm+
	cohon+yl89SpsLayohEpkVqClJSddRY1C9SaSIPzFFEw926Ro7UfaaHa4i8iJhdFtudhQpGkK0S
	R0DpRBc3yRMLRiYeuEqmNg2aXOvT+lCTt93V1lF22DM/NOOkbhEtQAPX0mO+mYeRfuIgxEWBMM0
	TeE9BufdvnIHoVyTFpHnwpGvmWSGw9mt5q90tv+6BlHULLobMHl5lW3n1pWDaqUhVxMLeuS54mX
	RyoQMNRRJpvP7C06qogHstiWMGc1yYf3EwBLUPaJN2Eh8IIS5FErTZEufN9ekoBLRffJaTwWP2k
	L2rp7+9l8mfp9zLkJKakzCZFje0Jkzg4W9iaZPwdD8A0bweB9w9O0GxwhOb2RPeD0MjphsXR5xQ
	fWCpumJ3SOYFGKRHQ1yMRSgvk6FzMZGCnfRDPEdKrZqAy3PiKvBmpEaTcxK026Y
X-Received: by 2002:a05:600c:4e86:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49b91bd43a7mr121953565e9.0.1787945894672;
        Fri, 28 Aug 2026 12:38:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/56] vim: Fix for CVE-2026-57456
Date: Fri, 28 Aug 2026 21:35:29 +0200
Message-ID: <4f07a9a705bd681fdd8c17649643c36252d65e5b.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244580

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/cce141c42740f122dd8486ae04e21c2a81016ba8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-57456

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-57456.patch            | 164 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57456.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57456.patch b/meta/recipes-support/vim/files/CVE-2026-57456.patch
new file mode 100644
index 00000000000..253fff486d5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57456.patch
@@ -0,0 +1,164 @@
+From 88a735ff4fa7ff269ba4ca94a44e8cdaefa5df28 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sun, 21 Jun 2026 19:50:56 +0000
+Subject: [PATCH] patch 9.2.0699: [security]: possible code execution with
+ python complete
+
+Problem:  [security]: possible code execution with python complete
+          (morningbread)
+Solution: Use repr() to quote the doc strings correctly
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-ppj8-wqjf-6fp3
+
+Supported by AI
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/cce141c42740f122dd8486ae04e21c2a81016ba8]
+CVE: CVE-2026-57456
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ runtime/autoload/python3complete.vim        |  9 +++++----
+ runtime/autoload/pythoncomplete.vim         |  9 +++++----
+ src/testdir/test_plugin_python3complete.vim | 15 +++++++++++++++
+ src/version.c                               |  2 ++
+ 4 files changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index c4ef19d82..f90cca74b 100644
+--- a/runtime/autoload/python3complete.vim
++++ b/runtime/autoload/python3complete.vim
+@@ -2,7 +2,7 @@
+ " Maintainer: <vacancy>
+ " Previous Maintainer: Aaron Griffin <aaronmgriffin@gmail.com>
+ " Version: 0.10
+-" Last Updated: 2026 Jun 04
++" Last Updated: 2026 Jun 21
+ "
+ " Roland Puntaier: this file contains adaptations for python3 and is parallel to pythoncomplete.vim
+ "
+@@ -22,6 +22,7 @@
+ "     previous code passed buffer-supplied expressions to exec() which
+ "     Python evaluates at definition time, allowing arbitrary code
+ "     execution via crafted def/class headers
++"   * use repr() on doc strings to prevent code execution
+ "
+ " v 0.9
+ "   * Fixed docstring parsing for classes and functions
+@@ -335,7 +336,7 @@ class Scope(object):
+ 
+     def get_code(self):
+         str = ""
+-        if len(self.docstr) > 0: str += '"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += repr(self.docstr)+'\n'
+         str += 'class _PyCmplNoType:\n    def __getattr__(self,name):\n        return None\n'
+         for sub in self.subscopes:
+             str += sub.get_code()
+@@ -378,7 +379,7 @@ class Class(Scope):
+                        if _DOTTED_NAME_RE.match(s.strip())]
+         if len(safe_supers) > 0: str += '(%s)' % ','.join(safe_supers)
+         str += ':\n'
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         if len(self.subscopes) > 0:
+             for s in self.subscopes: str += s.get_code()
+         else:
+@@ -401,7 +402,7 @@ class Function(Scope):
+         safe_params = [p for p in safe_params if p]
+         str = "%sdef %s(%s):\n" % \
+             (self.currentindent(),self.name,','.join(safe_params))
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         str += "%spass\n" % self.childindent()
+         return str
+ 
+diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pythoncomplete.vim
+index 39b1efd29..d2f5d57b0 100644
+--- a/runtime/autoload/pythoncomplete.vim
++++ b/runtime/autoload/pythoncomplete.vim
+@@ -2,7 +2,7 @@
+ " Maintainer: <vacancy>
+ " Previous Maintainer: Aaron Griffin <aaronmgriffin@gmail.com>
+ " Version: 0.10
+-" Last Updated: 2026 Jun 04
++" Last Updated: 2026 Jun 21
+ "
+ " Changes
+ " TODO:
+@@ -20,6 +20,7 @@
+ "     previous code passed buffer-supplied expressions to exec() which
+ "     Python evaluates at definition time, allowing arbitrary code
+ "     execution via crafted def/class headers
++"   * use repr() on doc strings to prevent code execution
+ "
+ " v 0.9
+ "   * Fixed docstring parsing for classes and functions
+@@ -350,7 +351,7 @@ class Scope(object):
+ 
+     def get_code(self):
+         str = ""
+-        if len(self.docstr) > 0: str += '"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += repr(self.docstr)+'\n'
+         str += 'class _PyCmplNoType:\n    def __getattr__(self,name):\n        return None\n'
+         for sub in self.subscopes:
+             str += sub.get_code()
+@@ -393,7 +394,7 @@ class Class(Scope):
+                        if _DOTTED_NAME_RE.match(s.strip())]
+         if len(safe_supers) > 0: str += '(%s)' % ','.join(safe_supers)
+         str += ':\n'
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         if len(self.subscopes) > 0:
+             for s in self.subscopes: str += s.get_code()
+         else:
+@@ -416,7 +417,7 @@ class Function(Scope):
+         safe_params = [p for p in safe_params if p]
+         str = "%sdef %s(%s):\n" % \
+             (self.currentindent(),self.name,','.join(safe_params))
+-        if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
++        if len(self.docstr) > 0: str += self.childindent()+repr(self.docstr)+'\n'
+         str += "%spass\n" % self.childindent()
+         return str
+ 
+diff --git a/src/testdir/test_plugin_python3complete.vim b/src/testdir/test_plugin_python3complete.vim
+index e2b0c6616..590348ee4 100644
+--- a/src/testdir/test_plugin_python3complete.vim
++++ b/src/testdir/test_plugin_python3complete.vim
+@@ -221,4 +221,19 @@ func Test_python3complete_allow_import_on_runs_imports()
+         \ 'g:pythoncomplete_allow_import=1 did not run the buffer import')
+ endfunc
+ 
++func Test_python3complete_no_exec_via_class_docstring()
++  " A class-body docstring is emitted verbatim between triple quotes by
++  " get_code() and runs at class-definition time during exec().  A single-
++  " quoted source docstring lets an embedded """ survive doc()'s leading/
++  " trailing quote strip and break out of the generated literal.
++  let marker = tempname()
++  call s:CompleteAndExpectNoMarker([
++        \ 'class Foo:',
++        \ '    ''x"""+open("' . marker . '", "w").close()+"""y''',
++        \ '    pass',
++        \ 'Foo.',
++        \ ], marker,
++        \ 'class docstring expression was evaluated during omni-completion')
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index d3b72595f..bf680c656 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -734,6 +734,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    699,
+ /**/
+     698,
+ /**/
+-- 
+2.53.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8c5a5e88a9c..0f1355f0fcc 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57453.patch \
            file://CVE-2026-57454.patch \
            file://CVE-2026-57455.patch \
+           file://CVE-2026-57456.patch \
            "
 
 PV .= ".0340"

