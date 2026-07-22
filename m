Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02578C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:24 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46872.1784723660712759588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JGEGey/d;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso10481343a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723660; x=1785328460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+r5PIA7wCrycVEPu00S4/NgGGLuCbdUWeaApKVSJCno=;
        b=JGEGey/dwb/DarXIGym2ju1qHtdc5g1Nu1VP54H6tMF6x5gUgzobErPqQWU4buu9J9
         8xMw23cQih/duvBPlvjuQRcXh3W6RJKWEGUJ9yQbETnBLsc3WNGU1mQ8qujgIvLaqsV/
         gSQncii69aevicDO0HyQr2qrbZizpQ4AUkR5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723660; x=1785328460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+r5PIA7wCrycVEPu00S4/NgGGLuCbdUWeaApKVSJCno=;
        b=Fch3iTVMhEzi+8hY1B1aLfFbkTJAFuCIcYjtOfXFY9sAe/W/JBIdHrvma5S+Sk9Eg2
         WkA8m/lDDpXJ6kJmIK5Y80e8fyzg1uZmLTyv2kXE25rWxloYPyNZ17jP7SSoTB0BLamL
         2sSKOClByj21TEOIifYA91CX84aj2lNoserBr8SaL466f0/4qJH1lWNHIL6XxOD+/h5u
         fZo3wWk+abuPMjbF3PX7fYXUWCn6Ie35L5CjtjgyeSCHeLfzD1b3ynFNPbnwl6gzGSTM
         4z937ZWgXop7q6QDW6yr5XnjoV8vf9pNePBKXg1mON4HP2l9OA6TLWVAwAi2VJWOOW8/
         nLGg==
X-Gm-Message-State: AOJu0YyDc/tvwZMEAIcOo7gtQfnO9rc/Rvg5zC4Mo9wX5oB4brHqA2Hw
	b5GL1KbjxheXBt4l0L3VdSpsLLf5u4aiKu0Ks+BrbxhUz4ZlgHesvuLbQC4XnuQ3oM9OMA6GkGw
	pfZMubwg=
X-Gm-Gg: AR+sD11EUPe8nnm23lanuvs67z6dGRuQf/eiJzqG32nHKXmnzNfysg6XH9uka0uM5H0
	X3UmanltU27zX8bNVLFIM6p2U8ZntMH+2qZlgONYxiPv3JnNafIqYkDaeer+27TcoPU04uNWHeE
	iND1OLNggTfmrKFZie4m0KdFnwISDc2FMT3TdGgPxpvaLRXunrP6fisLdPtFAe2Wli13F7I0xBZ
	M3Xif+msQaxyCSFKIUErhBG1WOfA513wG6i+8bU2LUx+RmNTk8lH0fctzHQz0j+DRFs+TBExGVb
	/mRDdIe5cKzpwH1glFSNfj5N7Swf1GmNcUgB0rqSxhWU1bJckX5D/+x24dbLsR/LRokxA4EfPit
	JpYBxDwh89/PmYzMYZy76wLYC/t1RADf4BASLVOboO+Cnme54lCR7wm8wwbaUQJeplJ2xsTktKX
	7AhHpW2brFLhqHT1b64rod+Amb1dY=
X-Received: by 2002:a17:90b:4d09:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38e4b594eb3mr23140973a91.31.1784723659850;
        Wed, 22 Jul 2026 05:34:19 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:34:18 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 07/10] vim: Fix CVE-2026-57456
Date: Wed, 22 Jul 2026 18:03:33 +0530
Message-ID: <20260722123336.587556-7-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241675

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57456
[2] https://security-tracker.debian.org/tracker/CVE-2026-57456

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-57456.patch            | 149 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57456.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-57456.patch b/meta/recipes-support/vim/files/CVE-2026-57456.patch
new file mode 100644
index 0000000000..9a4155ef04
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-57456.patch
@@ -0,0 +1,149 @@
+From cce141c42740f122dd8486ae04e21c2a81016ba8 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ runtime/autoload/python3complete.vim        |  9 +++++----
+ runtime/autoload/pythoncomplete.vim         |  9 +++++----
+ src/testdir/test_plugin_python3complete.vim | 15 +++++++++++++++
+ 3 files changed, 25 insertions(+), 8 deletions(-)
+
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index c4ef19d82f..f90cca74b3 100644
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
+index 39b1efd299..d2f5d57b0c 100644
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
+index e2b0c6616d..590348ee4a 100644
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
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index dec5b68324..008dbdb8df 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57451.patch \
            file://CVE-2026-57454.patch \
            file://CVE-2026-57455.patch \
+           file://CVE-2026-57456.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


