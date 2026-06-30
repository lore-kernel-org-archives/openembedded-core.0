Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8754C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 04:44:15 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14149.1782794649864113803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 21:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PG5y2vyU;
 spf=pass (domain: mvista.com, ip: 74.125.82.182, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30edbb0dc5fso1611031eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 21:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782794649; x=1783399449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKUiMchy3Ql+4Kd36aUH1Kge9Xcje3V09vzERvFFoAY=;
        b=PG5y2vyUhGprw4fXIhl+2KqgDm40haEeBZzSHEsNn8ce5sOnaZkY3qyDzAJVOPHObT
         6HZijiQgylSOvFIQQe9jDY7dnKgfE9+VmaJyczn61rRTwivArqD9s2Od3K+ijIrO1VkI
         4IbWMgr0XfRb8Vy70Ihw7bcXPzyK2sGIsLNGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782794649; x=1783399449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKUiMchy3Ql+4Kd36aUH1Kge9Xcje3V09vzERvFFoAY=;
        b=GK6Y35z+x/bFcXYrGScjZwJC8tdELVvBOzReU0BLCmM+/xGu24hA72T6fVcDENf5uo
         Oqi1gUhdklnes+nlokCH8wPVygOezqobGCbs8BwZSIaxdnyH+OIcfwNvZSj8D2B0D8R9
         x+e/KvMhqSH+E6m/7Uf8HIVUQwXofy1J7gejjTYPuqDoZ3MTAscB6XKtuyhnalOJxBSB
         tv0I6WCzuSAse4qnfpict22J+8ZIgGWw1QNYHSBKK3qmw/pFEOrnVOcbHEOV5mUCo2yp
         X2xLXNroKk+mbQCMjmywVUbP/cQG/GHvFRcmFDU4w7DqKODkCEwjd87cQOw9PwNNi9rP
         PqKQ==
X-Gm-Message-State: AOJu0Yxxd8RZvlG0ItebrRMxUbKq9VlP/fEr4RTXG2Ft1ke97EN4kooQ
	LpPFZ9C2Bqtj/iSHxZGYP3FWihW4qu3ssL7c9oJlNIxDRUq/mZaaRbnZUHLdU+0hFmOpXNyIJJA
	l37XeLuM=
X-Gm-Gg: AfdE7ck1HOuDSQp/JnjC1Gp2Hx5tYFp4Qj87RtZGrnkYFhSg1otz/giX2Z5tNR00y2X
	ARhqHWh/4QLoTj/XPMDE/NOM3C01yg2zjsht20w1jyzO1L4t3+W7T5Oew/0rx+r7pbQlwcPtV7D
	oUaQDjMdApRJfh0jjmV2RC3jv8r1nhSnbBilt/eV2x6i1E/ICI0Hj2f5xgsilO/OhXNjIe1nGbf
	9Z2t67S/+WzooW4xQPiu2NvDAdEw4IceJP7pEbCqt/jXdXHXh87E1+6sPK03vjQtu6Qz6z8ZofC
	RbwQYzAshmhLDemHOCdhkfi3SFuoDUtXPKTXLcqgZhdsWvOhB0IIUFEr+Ko3rqxFyROxe3L//M3
	0xBl4Rg6bK6dkXGRn45ivuaPefJ1HjUM9KeHVd0/DyLswK9aabkYHkuTb7KqBIMxQhn2f0azwYv
	jeDM47ixy12jnqf+67j2kCDDwCRw==
X-Received: by 2002:a05:693c:2d8b:b0:30c:a62b:d033 with SMTP id 5a478bee46e88-30ee1347f41mr1801488eec.15.1782794648882;
        Mon, 29 Jun 2026 21:44:08 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee326c7a7sm3380307eec.29.2026.06.29.21.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:44:08 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [wrynose][PATCH 3/3] vim: Fix for CVE-2026-52858,CVE-2026-52859,CVE-2026-52860
Date: Tue, 30 Jun 2026 10:13:41 +0530
Message-ID: <20260630044343.12138-3-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260630044343.12138-1-hprajapati@mvista.com>
References: <20260630044343.12138-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 04:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239837

Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]

[1] https://github.com/vim/vim/commit/4b850457e12e1a678dd209f2868154f7553cbf8d
[2] https://github.com/vim/vim/commit/63680c6d3d52477817b49cd1a66e7aabe8a7aa19
[3] https://github.com/vim/vim/commit/c8c63673bc4253212820626aeeb75999d9a539d2
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-52858
[5] https://nvd.nist.gov/vuln/detail/CVE-2026-52859
[6] https://nvd.nist.gov/vuln/detail/CVE-2026-52860

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-52858.patch            | 167 +++++++
 .../vim/files/CVE-2026-52859.patch            | 274 +++++++++++
 .../vim/files/CVE-2026-52860.patch            | 446 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   3 +
 4 files changed, 890 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52859.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52860.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-52858.patch b/meta/recipes-support/vim/files/CVE-2026-52858.patch
new file mode 100644
index 0000000000..38d477eeb9
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-52858.patch
@@ -0,0 +1,167 @@
+From 4b850457e12e1a678dd209f2868154f7553cbf8d Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Fri, 29 May 2026 19:05:53 +0000
+Subject: [PATCH] patch 9.2.0561: [security]: possible code execution with
+ python3complete
+
+Problem:  [security]: possible code execution with python3complete
+Solution: Disable execution of import/from statements
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-52mc-rq6p-rc7c
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/4b850457e12e1a678dd209f2868154f7553cbf8d]
+CVE: CVE-2026-52858
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/autoload/README.txt          |  1 +
+ runtime/autoload/python3complete.vim | 17 ++++++++++++++---
+ runtime/autoload/pythoncomplete.vim  | 17 ++++++++++++++---
+ runtime/doc/filetype.txt             | 15 ++++++++++++++-
+ 4 files changed, 43 insertions(+), 7 deletions(-)
+
+diff --git a/runtime/autoload/README.txt b/runtime/autoload/README.txt
+index 3b18d3dde5..b22581963e 100644
+--- a/runtime/autoload/README.txt
++++ b/runtime/autoload/README.txt
+@@ -17,6 +17,7 @@ htmlcomplete.vim	HTML
+ javascriptcomplete.vim  Javascript
+ phpcomplete.vim		PHP
+ pythoncomplete.vim	Python
++python3complete.vim Python
+ rubycomplete.vim	Ruby
+ syntaxcomplete.vim	from syntax highlighting
+ xmlcomplete.vim		XML (uses files in the xml directory)
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index 3e54433f41..2b6a652525 100644
+--- a/runtime/autoload/python3complete.vim
++++ b/runtime/autoload/python3complete.vim
+@@ -14,6 +14,10 @@
+ "   i.e. "import url<c-x,c-o>"
+ " Continue parsing on invalid line??
+ "
++" v 0.10 by Vim project
++"   * disables importing local modules, unless the global Vim variable
++"     g:pythoncomplete_allow_import is set to non-zero
++"
+ " v 0.9
+ "   * Fixed docstring parsing for classes and functions
+ "   * Fixed parsing of *args and **kwargs type arguments
+@@ -132,11 +136,20 @@ class Completer(object):
+ 
+     def evalsource(self,text,line=0):
+         sc = self.parser.parse(text,line)
++        try: allow_imports = int(
++          vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
++        except Exception:
++          allow_imports = 0
+         src = sc.get_code()
+         dbg("source: %s" % src)
+         try: exec(src,self.compldict)
+         except: dbg("parser: %s, %s" % (sys.exc_info()[0],sys.exc_info()[1]))
+         for l in sc.locals:
++            # Executing import/from statements harvested from the buffer runs
++            # arbitrary package code; only do so when the user opted in.
++            if not allow_imports and (l.startswith('import')
++                                            or l.startswith('from ')):
++                continue
+             try: exec(l,self.compldict)
+             except: dbg("locals: %s, %s [%s]" % (sys.exc_info()[0],sys.exc_info()[1],l))
+ 
+@@ -300,13 +313,11 @@ class Scope(object):
+     def get_code(self):
+         str = ""
+         if len(self.docstr) > 0: str += '"""'+self.docstr+'"""\n'
+-        for l in self.locals:
+-            if l.startswith('import'): str += l+'\n'
+         str += 'class _PyCmplNoType:\n    def __getattr__(self,name):\n        return None\n'
+         for sub in self.subscopes:
+             str += sub.get_code()
+         for l in self.locals:
+-            if not l.startswith('import'): str += l+'\n'
++            if not l.startswith('import') and not l.startswith('from '): str += l+'\n'
+ 
+         return str
+ 
+diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pythoncomplete.vim
+index aa28bb721f..10147767ef 100644
+--- a/runtime/autoload/pythoncomplete.vim
++++ b/runtime/autoload/pythoncomplete.vim
+@@ -12,6 +12,10 @@
+ "   i.e. "import url<c-x,c-o>"
+ " Continue parsing on invalid line??
+ "
++" v 0.10 by Vim project
++"   * disables importing local modules, unless the global Vim variable
++"     g:pythoncomplete_allow_import is set to non-zero
++"
+ " v 0.9
+ "   * Fixed docstring parsing for classes and functions
+ "   * Fixed parsing of *args and **kwargs type arguments
+@@ -146,11 +150,20 @@ class Completer(object):
+ 
+     def evalsource(self,text,line=0):
+         sc = self.parser.parse(text,line)
++        try: allow_imports = int(
++          vim.eval("get(g:, 'pythoncomplete_allow_import', 0)"))
++        except Exception:
++          allow_imports = 0
+         src = sc.get_code()
+         dbg("source: %s" % src)
+         try: exec(src) in self.compldict
+         except: dbg("parser: %s, %s" % (sys.exc_info()[0],sys.exc_info()[1]))
+         for l in sc.locals:
++            # Executing import/from statements harvested from the buffer runs
++            # arbitrary package code; only do so when the user opted in.
++            if not allow_imports and (l.startswith('import')
++                                            or l.startswith('from ')):
++                continue
+             try: exec(l) in self.compldict
+             except: dbg("locals: %s, %s [%s]" % (sys.exc_info()[0],sys.exc_info()[1],l))
+ 
+@@ -315,13 +328,11 @@ class Scope(object):
+     def get_code(self):
+         str = ""
+         if len(self.docstr) > 0: str += '"""'+self.docstr+'"""\n'
+-        for l in self.locals:
+-            if l.startswith('import'): str += l+'\n'
+         str += 'class _PyCmplNoType:\n    def __getattr__(self,name):\n        return None\n'
+         for sub in self.subscopes:
+             str += sub.get_code()
+         for l in self.locals:
+-            if not l.startswith('import'): str += l+'\n'
++            if not l.startswith('import') and not l.startswith('from '): str += l+'\n'
+ 
+         return str
+ 
+diff --git a/runtime/doc/filetype.txt b/runtime/doc/filetype.txt
+index 461f801ccc..24d833cd54 100644
+--- a/runtime/doc/filetype.txt
++++ b/runtime/doc/filetype.txt
+@@ -982,7 +982,20 @@ By default the following options are set, in accordance with PEP8: >
+ To disable this behavior, set the following variable in your vimrc: >
+ 
+ 	let g:python_recommended_style = 0
+-
++<
++Python omni-completion |compl-omni| is provided by python3complete.vim (or
++pythoncomplete.vim) for Vim builds with the |+python|/|+python3| interpreter.
++By default it does not inspect the import / from statements found in the
++buffer. This means completion of names defined in the buffer itself (classes,
++functions, variables) works, but completion of members of imported modules is
++not offered.
++
++To enable completion of imported module members, set: >
++	let g:pythoncomplete_allow_import = 1
++<
++WARNING: enabling this causes omni-completion to execute the import statements
++found in the buffer through Python's import machinery, which runs the imported
++modules' top-level code. Only enable this for code you trust.
+ 
+ QF QUICKFIX					    *qf.vim* *ft-qf-plugin*
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-52859.patch b/meta/recipes-support/vim/files/CVE-2026-52859.patch
new file mode 100644
index 0000000000..7a91dab496
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-52859.patch
@@ -0,0 +1,274 @@
+From 63680c6d3d52477817b49cd1a66e7aabe8a7aa19 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Sat, 30 May 2026 16:34:40 +0000
+Subject: [PATCH] patch 9.2.0565: [security]: out-of-bounds read in
+ update_snapshot()
+
+Problem:  Out-of-bounds read in update_snapshot() when a terminal cell
+          fills all VTERM_MAX_CHARS_PER_CELL slots (a base character
+          plus five combining marks): the loop over cell.chars[] has no
+          upper bound and libvterm leaves the array unterminated when full, so
+          it reads past the array and appends out-of-bounds values to a
+          buffer sized for only VTERM_MAX_CHARS_PER_CELL characters.
+Solution: Bound the loop with i < VTERM_MAX_CHARS_PER_CELL, mirroring
+          the loop in handle_pushline() (Christian Brabandt).
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/63680c6d3d52477817b49cd1a66e7aabe8a7aa19]
+CVE: CVE-2026-52859
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/terminal.c                          |   3 +-
+ src/testdir/samples/combining_chars.txt | 200 ++++++++++++++++++++++++
+ src/testdir/test_terminal3.vim          |  15 ++
+ 3 files changed, 217 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/samples/combining_chars.txt
+
+diff --git a/src/terminal.c b/src/terminal.c
+index 6a9c286e29..f42125bf22 100644
+--- a/src/terminal.c
++++ b/src/terminal.c
+@@ -2265,7 +2265,8 @@ update_snapshot(term_T *term)
+ 			    int	    i;
+ 			    int	    c;
+ 
+-			    for (i = 0; (c = cell.chars[i]) > 0 || i == 0; ++i)
++			    for (i = 0; i < VTERM_MAX_CHARS_PER_CELL &&
++				    ((c = cell.chars[i]) > 0 || i == 0); ++i)
+ 				ga.ga_len += utf_char2bytes(c == NUL ? ' ' : c,
+ 					     (char_u *)ga.ga_data + ga.ga_len);
+ 			}
+diff --git a/src/testdir/samples/combining_chars.txt b/src/testdir/samples/combining_chars.txt
+new file mode 100644
+index 0000000000..d9a3c171fb
+--- /dev/null
++++ b/src/testdir/samples/combining_chars.txt
+@@ -0,0 +1,200 @@
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́
++á́́́́ጁ
++á́́́́ጁ
++á́́́́ጁ
++á́́́́ጁ
++á́́́́ጁ
++á́́́́ጁ
++á́́́́ጁ
++á́́́́ጁ
++á́́́́ጁ
++á́́́́ጁ
+diff --git a/src/testdir/test_terminal3.vim b/src/testdir/test_terminal3.vim
+index 04c7c925e3..738a4c6284 100644
+--- a/src/testdir/test_terminal3.vim
++++ b/src/testdir/test_terminal3.vim
+@@ -1241,4 +1241,19 @@ func Test_terminal_csi_args_overflow()
+   call StopVimInTerminal(buf)
+ endfunc
+ 
++func Test_terminal_output_combining_chars()
++  CheckUnix
++  new
++  let cmd = "cat samples/combining_chars.txt"
++  let buf = term_start(cmd, {'curwin': 1, 'term_finish': 'open', 'term_rows': 10, 'term_cols': 30})
++  call WaitForAssert({-> assert_match('finished', term_getstatus(buf))})
++  call TermWait(buf)
++  let lines = getbufline(buf, 1, '$')
++  " get byte lengths to confirm combining chars present
++  let lens = map(copy(lines), 'len(v:val)')
++  let expected = repeat([11], 190) + repeat([14], 10)
++  call assert_equal(expected, lens)
++  bw!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2026-52860.patch b/meta/recipes-support/vim/files/CVE-2026-52860.patch
new file mode 100644
index 0000000000..1e370847f6
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-52860.patch
@@ -0,0 +1,446 @@
+From c8c63673bc4253212820626aeeb75999d9a539d2 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 4 Jun 2026 21:06:09 +0000
+Subject: [PATCH] patch 9.2.0597: [security]: possible code execution with
+ python complete
+
+Problem:  [security]: another possible code execution with python complete
+          (David Carliez)
+Solution: Strip default expressions and annotations from generated
+          source for pythoncomplete and python3complete.
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-65p9-mwwx-7468
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/c8c63673bc4253212820626aeeb75999d9a539d2]
+CVE: CVE-2026-52860
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/autoload/python3complete.vim        |  43 +++-
+ runtime/autoload/pythoncomplete.vim         |  43 +++-
+ src/testdir/Make_all.mak                    |   2 +
+ src/testdir/test_plugin_python3complete.vim | 224 ++++++++++++++++++++
+ 4 files changed, 304 insertions(+), 8 deletions(-)
+ create mode 100644 src/testdir/test_plugin_python3complete.vim
+
+diff --git a/runtime/autoload/python3complete.vim b/runtime/autoload/python3complete.vim
+index 2b6a652525..c4ef19d82f 100644
+--- a/runtime/autoload/python3complete.vim
++++ b/runtime/autoload/python3complete.vim
+@@ -1,8 +1,8 @@
+ "python3complete.vim - Omni Completion for python
+ " Maintainer: <vacancy>
+ " Previous Maintainer: Aaron Griffin <aaronmgriffin@gmail.com>
+-" Version: 0.9
+-" Last Updated: 2022 Mar 30
++" Version: 0.10
++" Last Updated: 2026 Jun 04
+ "
+ " Roland Puntaier: this file contains adaptations for python3 and is parallel to pythoncomplete.vim
+ "
+@@ -17,6 +17,11 @@
+ " v 0.10 by Vim project
+ "   * disables importing local modules, unless the global Vim variable
+ "     g:pythoncomplete_allow_import is set to non-zero
++"   * strip default values and annotations from function parameter lists
++"     before exec(), and whitelist class base lists to dotted names: the
++"     previous code passed buffer-supplied expressions to exec() which
++"     Python evaluates at definition time, allowing arbitrary code
++"     execution via crafted def/class headers
+ "
+ " v 0.9
+ "   * Fixed docstring parsing for classes and functions
+@@ -100,6 +105,24 @@ warnings.simplefilter(action='ignore', category=FutureWarning)
+ 
+ import sys, tokenize, io, types
+ from token import NAME, DEDENT, NEWLINE, STRING
++import re
++
++# Used by Class.get_code(): a base class expression is only included in the
++# code passed to exec() if it is a pure dotted name (e.g. "Base", "mod.Base",
++# "pkg.sub.Cls").  Anything containing calls, subscripts, "=", ":" or other
++# operators is dropped, since exec()-ing it would evaluate buffer-supplied
++# expressions.  See the security note in the file header.
++_DOTTED_NAME_RE = re.compile(r'^[A-Za-z_]\w*(\s*\.\s*[A-Za-z_]\w*)*$')
++
++def _strip_param(p):
++    # Return the bare parameter name from a parameter spec harvested by
++    # _parenparse(), discarding any default value or annotation.  Default
++    # values and annotations would otherwise be evaluated by exec() at
++    # function-definition time.  Star prefixes ("*args", "**kw") and bare
++    # "*" / "/" are preserved as written.
++    p = p.split('=', 1)[0]
++    p = p.split(':', 1)[0]
++    return p.strip()
+ 
+ debugstmts=[]
+ def dbg(s): debugstmts.append(s)
+@@ -347,7 +370,13 @@ class Class(Scope):
+         return c
+     def get_code(self):
+         str = '%sclass %s' % (self.currentindent(),self.name)
+-        if len(self.supers) > 0: str += '(%s)' % ','.join(self.supers)
++        # Only include base class expressions that are pure dotted names.
++        # Anything else (calls, subscripts, conditionals, ...) is dropped
++        # because exec() would evaluate it at class-definition time.  See
++        # the security note in the file header.
++        safe_supers = [s.strip() for s in self.supers
++                       if _DOTTED_NAME_RE.match(s.strip())]
++        if len(safe_supers) > 0: str += '(%s)' % ','.join(safe_supers)
+         str += ':\n'
+         if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
+         if len(self.subscopes) > 0:
+@@ -364,8 +393,14 @@ class Function(Scope):
+     def copy_decl(self,indent=0):
+         return Function(self.name,self.params,indent, self.docstr)
+     def get_code(self):
++        # Strip default values and annotations from each parameter before
++        # joining: exec() evaluates these at definition time and a hostile
++        # buffer could otherwise execute arbitrary code via crafted def
++        # headers.  See file header for details.
++        safe_params = [_strip_param(p) for p in self.params]
++        safe_params = [p for p in safe_params if p]
+         str = "%sdef %s(%s):\n" % \
+-            (self.currentindent(),self.name,','.join(self.params))
++            (self.currentindent(),self.name,','.join(safe_params))
+         if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
+         str += "%spass\n" % self.childindent()
+         return str
+diff --git a/runtime/autoload/pythoncomplete.vim b/runtime/autoload/pythoncomplete.vim
+index 10147767ef..39b1efd299 100644
+--- a/runtime/autoload/pythoncomplete.vim
++++ b/runtime/autoload/pythoncomplete.vim
+@@ -1,8 +1,8 @@
+ "pythoncomplete.vim - Omni Completion for python
+ " Maintainer: <vacancy>
+ " Previous Maintainer: Aaron Griffin <aaronmgriffin@gmail.com>
+-" Version: 0.9
+-" Last Updated: 2020 Oct 9
++" Version: 0.10
++" Last Updated: 2026 Jun 04
+ "
+ " Changes
+ " TODO:
+@@ -15,6 +15,11 @@
+ " v 0.10 by Vim project
+ "   * disables importing local modules, unless the global Vim variable
+ "     g:pythoncomplete_allow_import is set to non-zero
++"   * strip default values and annotations from function parameter lists
++"     before exec(), and whitelist class base lists to dotted names: the
++"     previous code passed buffer-supplied expressions to exec() which
++"     Python evaluates at definition time, allowing arbitrary code
++"     execution via crafted def/class headers
+ "
+ " v 0.9
+ "   * Fixed docstring parsing for classes and functions
+@@ -95,6 +100,24 @@ function! s:DefPython()
+ python << PYTHONEOF
+ import sys, tokenize, cStringIO, types
+ from token import NAME, DEDENT, NEWLINE, STRING
++import re
++
++# Used by Class.get_code(): a base class expression is only included in the
++# code passed to exec() if it is a pure dotted name (e.g. "Base", "mod.Base",
++# "pkg.sub.Cls").  Anything containing calls, subscripts, "=", ":" or other
++# operators is dropped, since exec()-ing it would evaluate buffer-supplied
++# expressions.  See the security note in the file header.
++_DOTTED_NAME_RE = re.compile(r'^[A-Za-z_]\w*(\s*\.\s*[A-Za-z_]\w*)*$')
++
++def _strip_param(p):
++    # Return the bare parameter name from a parameter spec harvested by
++    # _parenparse(), discarding any default value or annotation.  Default
++    # values and annotations would otherwise be evaluated by exec() at
++    # function-definition time.  Star prefixes ("*args", "**kw") and bare
++    # "*" / "/" are preserved as written.
++    p = p.split('=', 1)[0]
++    p = p.split(':', 1)[0]
++    return p.strip()
+ 
+ debugstmts=[]
+ def dbg(s): debugstmts.append(s)
+@@ -362,7 +385,13 @@ class Class(Scope):
+         return c
+     def get_code(self):
+         str = '%sclass %s' % (self.currentindent(),self.name)
+-        if len(self.supers) > 0: str += '(%s)' % ','.join(self.supers)
++        # Only include base class expressions that are pure dotted names.
++        # Anything else (calls, subscripts, conditionals, ...) is dropped
++        # because exec() would evaluate it at class-definition time.  See
++        # the security note in the file header.
++        safe_supers = [s.strip() for s in self.supers
++                       if _DOTTED_NAME_RE.match(s.strip())]
++        if len(safe_supers) > 0: str += '(%s)' % ','.join(safe_supers)
+         str += ':\n'
+         if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
+         if len(self.subscopes) > 0:
+@@ -379,8 +408,14 @@ class Function(Scope):
+     def copy_decl(self,indent=0):
+         return Function(self.name,self.params,indent, self.docstr)
+     def get_code(self):
++        # Strip default values and annotations from each parameter before
++        # joining: exec() evaluates these at definition time and a hostile
++        # buffer could otherwise execute arbitrary code via crafted def
++        # headers.  See file header for details.
++        safe_params = [_strip_param(p) for p in self.params]
++        safe_params = [p for p in safe_params if p]
+         str = "%sdef %s(%s):\n" % \
+-            (self.currentindent(),self.name,','.join(self.params))
++            (self.currentindent(),self.name,','.join(safe_params))
+         if len(self.docstr) > 0: str += self.childindent()+'"""'+self.docstr+'"""\n'
+         str += "%spass\n" % self.childindent()
+         return str
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index f8c7f8bb46..b06d1af431 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -250,6 +250,7 @@ NEW_TESTS = \
+ 	test_plugin_man \
+ 	test_plugin_matchparen \
+ 	test_plugin_netrw \
++	test_plugin_python3complete \
+ 	test_plugin_osc52 \
+ 	test_plugin_tar \
+ 	test_plugin_termdebug \
+@@ -528,6 +529,7 @@ NEW_TESTS_RES = \
+ 	test_plugin_man.res \
+ 	test_plugin_matchparen.res \
+ 	test_plugin_netrw.res \
++	test_plugin_python3complete.res \
+ 	test_plugin_osc52.res \
+ 	test_plugin_tar.res \
+ 	test_plugin_termdebug.res \
+diff --git a/src/testdir/test_plugin_python3complete.vim b/src/testdir/test_plugin_python3complete.vim
+new file mode 100644
+index 0000000000..e2b0c6616d
+--- /dev/null
++++ b/src/testdir/test_plugin_python3complete.vim
+@@ -0,0 +1,224 @@
++" Tests for the Python omni-completion plugin (runtime/autoload/python3complete.vim).
++"
++CheckFeature python3
++
++" Run omni-completion against the given buffer contents and assert that the
++" marker file was not created.  Pre-patch behaviour exec()s reconstructed
++" def/class headers, which evaluates the buffer-supplied expression and
++" creates the marker file.  Post-patch, the expressions are stripped.
++func s:CompleteAndExpectNoMarker(buffer_lines, marker_path, msg)
++  call delete(a:marker_path)
++  defer delete(a:marker_path)
++  let g:pythoncomplete_allow_import = 0
++  new
++  setfiletype python
++  call setline(1, a:buffer_lines)
++  call cursor(line('$'), col([line('$'), '$']))
++
++  " The PoC trigger -- direct invocation of the omnifunc with an empty base.
++  " This is the same path Vim takes for CTRL-X CTRL-O.
++  silent! call python3complete#Complete(0, '')
++
++  call assert_false(filereadable(a:marker_path),
++        \ a:msg . ' (marker ' . a:marker_path . ' was created)')
++
++  bwipe!
++  unlet! g:pythoncomplete_allow_import
++endfunc
++
++func Test_python3complete_no_exec_via_function_default()
++  let marker = tempname()
++  call s:CompleteAndExpectNoMarker([
++        \ 'def f(x=open(' . string(marker) . ', "w").close()):',
++        \ '    pass',
++        \ 'f.',
++        \ ], marker,
++        \ 'function default expression was evaluated during omni-completion')
++endfunc
++
++func Test_python3complete_no_exec_via_function_annotation()
++  let marker = tempname()
++  call s:CompleteAndExpectNoMarker([
++        \ 'def f(x: open(' . string(marker) . ', "w").close()):',
++        \ '    pass',
++        \ 'f.',
++        \ ], marker,
++        \ 'function annotation expression was evaluated during omni-completion')
++endfunc
++
++func Test_python3complete_no_exec_via_class_base()
++  let marker = tempname()
++  " "or object" gives the class a valid base after the side-effecting
++  " open().close() expression returns None.  Without "or object" the
++  " exec would raise TypeError, but the file would still be created
++  " before the exception -- the assertion would still hold.  Using
++  " "or object" keeps the buffer parseable as valid Python.
++  call s:CompleteAndExpectNoMarker([
++        \ 'class Foo(open(' . string(marker) . ', "w").close() or object):',
++        \ '    pass',
++        \ 'Foo.',
++        \ ], marker,
++        \ 'class base expression was evaluated during omni-completion')
++endfunc
++
++func Test_python3complete_no_exec_with_multiple_params()
++  " The strip must apply to every parameter, not just the first.
++  let marker = tempname()
++  call s:CompleteAndExpectNoMarker([
++        \ 'def f(a, b=1, c=open(' . string(marker) . ', "w").close(), d=2):',
++        \ '    pass',
++        \ 'f.',
++        \ ], marker,
++        \ 'non-first parameter default was evaluated during omni-completion')
++endfunc
++
++func Test_python3complete_no_exec_via_starargs_default()
++  " "*args" and "**kw" must still be preserved after stripping; ensure a
++  " default following them is also stripped.
++  let marker = tempname()
++  call s:CompleteAndExpectNoMarker([
++        \ 'def f(*args, key=open(' . string(marker) . ', "w").close(), **kw):',
++        \ '    pass',
++        \ 'f.',
++        \ ], marker,
++        \ 'keyword-only default after *args was evaluated during omni-completion')
++endfunc
++
++func Test_python3complete_normal_completion_still_works()
++  " Positive control: completion against a buffer with a legitimate class
++  " must still produce completion items.  The stripping logic should not
++  " break the normal completion path.
++  let g:pythoncomplete_allow_import = 0
++
++  new
++  setfiletype python
++  call setline(1, [
++        \ 'class MyHelper:',
++        \ '    def alpha(self): pass',
++        \ '    def beta(self): pass',
++        \ 'h = MyHelper()',
++        \ 'h.',
++        \ ])
++  call cursor(5, 3)
++
++  " First call returns the column to start completion at; second returns
++  " the list of completion items.
++  let start = python3complete#Complete(1, '')
++  call assert_true(start >= 0,
++        \ 'python3complete#Complete(1, "") returned ' . start)
++
++  let items = python3complete#Complete(0, '')
++  " Items should be a list (possibly empty if the parser can't resolve "h",
++  " but should not be a parse error from our stripping changes).
++  call assert_equal(type([]), type(items),
++        \ 'python3complete#Complete(0, "") did not return a list')
++
++  bwipe!
++  unlet! g:pythoncomplete_allow_import
++endfunc
++
++func Test_python3complete_inherited_completion_via_dotted_base()
++  " Positive control for the class-base whitelist: a dotted-name base class
++  " (the common, safe case) must still be carried into the reconstructed
++  " source so that completion on a subclass can resolve inherited members.
++  let g:pythoncomplete_allow_import = 0
++
++  new
++  setfiletype python
++  call setline(1, [
++        \ 'class Base:',
++        \ '    def shared(self): pass',
++        \ 'class Derived(Base):',
++        \ '    def own(self): pass',
++        \ 'd = Derived()',
++        \ 'd.',
++        \ ])
++  call cursor(6, 3)
++
++  let items = python3complete#Complete(0, '')
++  call assert_equal(type([]), type(items),
++        \ 'completion against a subclass with a dotted base did not return a list')
++
++  bwipe!
++  unlet! g:pythoncomplete_allow_import
++endfunc
++
++" Build a tiny Python module that creates a marker file as a side effect of
++" being imported, add its directory to sys.path, run omni-completion against
++" a buffer containing `import vimtest_marker_mod`, and report whether the
++" marker file was created.  Used by the two allow_import tests below.
++func s:RunImportCompletion(allow_import_value)
++  let g:pythoncomplete_allow_import = a:allow_import_value
++  let marker = tempname()
++  let module_dir = tempname()
++  call mkdir(module_dir, 'R')
++
++  call writefile([
++        \ 'open(' . string(marker) . ', "w").close()',
++        \ ], module_dir . '/vimtest_marker_mod.py')
++
++  defer delete(marker)
++
++  " Pass module_dir to Python via a g: variable so vim.eval() can read it.
++  let g:pythoncomplete_test_module_dir = module_dir
++  py3 << EOF
++import sys, vim
++_p = vim.eval('g:pythoncomplete_test_module_dir')
++if _p not in sys.path:
++    sys.path.insert(0, _p)
++# Drop any cached copy so the module body re-runs and the marker side
++# effect fires on import.
++sys.modules.pop('vimtest_marker_mod', None)
++EOF
++
++  new
++  setfiletype python
++  call setline(1, [
++        \ 'import vimtest_marker_mod',
++        \ 'vimtest_marker_mod.',
++        \ ])
++  call cursor(2, 2)
++
++  silent! call python3complete#Complete(0, '')
++
++  let ran = filereadable(marker)
++
++  bwipe!
++  unlet g:pythoncomplete_allow_import
++
++  " Teardown: restore sys.path, drop the cached module so a subsequent
++  " test run starts clean, clean up the temp module dir.
++  py3 << EOF
++import sys, vim
++_p = vim.eval('g:pythoncomplete_test_module_dir')
++if _p in sys.path:
++    sys.path.remove(_p)
++sys.modules.pop('vimtest_marker_mod', None)
++EOF
++  unlet g:pythoncomplete_test_module_dir
++  call delete(module_dir, 'rf')
++  call delete(marker)
++  unlet! g:pythoncomplete_allow_import
++
++  return ran
++endfunc
++
++func Test_python3complete_allow_import_off_blocks_imports()
++  " GHSA-52mc-rq6p-rc7c mitigation: with the default flag value (0), an
++  " `import` line harvested from the buffer must NOT be exec()'d.  The
++  " marker module's side effect (creating a file when its body runs) is
++  " the observable proof that the exec did or did not happen.
++  call assert_false(s:RunImportCompletion(0),
++        \ 'g:pythoncomplete_allow_import=0 did not block the buffer import')
++endfunc
++
++func Test_python3complete_allow_import_on_runs_imports()
++  " Symmetric positive control: with the flag set to non-zero, the harvested
++  " import IS exec()'d and the module loads.  Without this control the
++  " negative test above could pass for unrelated reasons (e.g. completion
++  " failing to parse the buffer at all).
++  call assert_true(s:RunImportCompletion(1),
++        \ 'g:pythoncomplete_allow_import=1 did not run the buffer import')
++endfunc
++
++" vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6eafc53c74..e34cc17fe5 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,6 +20,9 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-41411.patch \
            file://CVE-2026-45130.patch \
            file://CVE-2026-46483.patch \
+           file://CVE-2026-52858.patch \
+           file://CVE-2026-52859.patch \
+           file://CVE-2026-52860.patch \
            "
 
 PV .= ".0340"
-- 
2.50.1


