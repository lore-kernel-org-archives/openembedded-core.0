Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0365DC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:34:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46875.1784723675786730945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ETn31k77;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so5774220a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784723675; x=1785328475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgXcNkp400B1FLrHzfzkUdYmHRFUiMPnNZenfYoB4cU=;
        b=ETn31k77ghZQqjCdwjP6BXJSr762rweKfBVeQs74qUxEuhEij5mXGm0tf5R0CDeE+j
         RAODf0GeOg/4ZaGG/2eOV9kgDYXAyR7MnCe17Y/57phdbxgiiAJQ1h9J5xpViP+bpMA3
         BKev3/y+0IjnTpGqbhG74F24MOCEeOASoFJpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723675; x=1785328475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgXcNkp400B1FLrHzfzkUdYmHRFUiMPnNZenfYoB4cU=;
        b=B36fIFVaQwplSC7N4WaAzk3Mr36nTcoCNJ68pQmQmqV9kHxnlDLnKsLgJ6xzk8i2I7
         5/7R0GvxAixhXTXBL3x+Da57Qbw8xYmrafy5fMwcluYE3ehXY1OZbeOG45rlcH+yX+ph
         8Fac9WPiX4T7QZ9QkQfmNV2dS5dOboMZNrbDZ7HVTIEUT/tHY7fhko06BKPIoNrOb/2f
         +100R58t6jujVc0GSIdaKZB3AYNIkcKMFhR3qWatYXV2oJ56bUzeT0LZgg3My4qOuH12
         fsK2bUJt3rRr3++P+psoiSaLPJr8z6uY/nmqWe5IwMdgD9zKoyF09u9vxjxLZchuUf7p
         WbOg==
X-Gm-Message-State: AOJu0Yz11thM1A9b88NEKLNwErLbPGAsXi62eFyZzb5OP/Zk/104VsZZ
	muqDL7w8sd8QdFNP/8Q8hdrIqiAMDcoCUSH9+g6Kw4E0RNJbxmfuHlzuL4YSIUtsbDHFyZs65cx
	5+6KysrQ=
X-Gm-Gg: AR+sD10pcGncAE0zFhJjyRT0571ubBl1+6SRoK1kJXcnj+KHLTI3tDMJsH0xBInglYt
	+ReR5SQERyy0RS3ioJ4IqB+n3mPTxWCP7xLgMeP7o7AwTQCOXClt7jvozNsOlPIqhb0jfktovw3
	JInS0wNt1UTK6D7XTzUab2yvcvnftisZVfqD+UqWw0PvuIVB8femc6e9gfOm7JyqW/OXgm322Jb
	T50ko78hTCkBlOq6p+IDGuoUBDseyJknnwP9JdbfFhIfDWMwgnq1H8vLzigNUGhY42Z37WmB/G7
	jkqVEv/t4e95hUZWbknzJvoAKrpV3/VRBOXUtH8UA+AXRtZzgeQM28LRCFvjkbO4247HI4Rso4u
	aJxYHrnNNH6MB9mR3n3WSJkbO+QgHzeDCt1oZZxI33KKBmQj2cbVfk9RTON5u9THh3D5eq2F7u6
	LiSum6w7DWelOu4uKU
X-Received: by 2002:a17:90b:4a0e:b0:387:e0db:bc25 with SMTP id 98e67ed59e1d1-38e4b55c8cemr24305439a91.37.1784723675007;
        Wed, 22 Jul 2026 05:34:35 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:92d:e2c5:62da:989e:f39a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm5823414c88.7.2026.07.22.05.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:34:34 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 10/10] vim: Fix CVE-2026-59858
Date: Wed, 22 Jul 2026 18:03:36 +0530
Message-ID: <20260722123336.587556-10-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722123336.587556-1-vanusuri@mvista.com>
References: <20260722123336.587556-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241678

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59858
[2] https://security-tracker.debian.org/tracker/CVE-2026-59858

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../vim/files/CVE-2026-59858.patch            | 134 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59858.patch b/meta/recipes-support/vim/files/CVE-2026-59858.patch
new file mode 100644
index 0000000000..a2b903be04
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-59858.patch
@@ -0,0 +1,134 @@
+From 6b611b0d15603c52ebdad17172b0232b4f65704e Mon Sep 17 00:00:00 2001
+From: Hirohito Higashi <h.east.727@gmail.com>
+Date: Fri, 26 Jun 2026 15:41:24 +0900
+Subject: [PATCH] patch 9.2.0735: [security]: arbitrary Ex command execution
+ during C omni-completion
+
+Problem:  [security]: With C omni-completion, a crafted tags file can execute
+          arbitrary Ex commands when completing a struct/union member
+          (cipher-creator)
+Solution: Escape the type field before inserting it into the :vimgrep
+          pattern so it cannot close the pattern and start a new command
+          (Hirohito Higashi).
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-mf92-v4xw-j45x
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>"
+Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/6b611b0d15603c52ebdad17172b0232b4f65704e]
+CVE: CVE-2026-59858
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ runtime/autoload/ccomplete.vim        |  2 +-
+ src/testdir/Make_all.mak              |  2 +
+ src/testdir/test_plugin_ccomplete.vim | 62 +++++++++++++++++++++++++++
+ 3 files changed, 65 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_ccomplete.vim
+
+diff --git a/runtime/autoload/ccomplete.vim b/runtime/autoload/ccomplete.vim
+index 51237be98b..dc3388b524 100644
+--- a/runtime/autoload/ccomplete.vim
++++ b/runtime/autoload/ccomplete.vim
+@@ -600,7 +600,7 @@ def StructMembers( # {{{1
+         return []
+       endif
+       execute 'silent! keepjumps noautocmd '
+-        .. n .. 'vimgrep ' .. '/\t' .. typename .. '\(\t\|$\)/j '
++        .. n .. 'vimgrep ' .. '/\t' .. escape(typename, '/\') .. '\(\t\|$\)/j '
+         .. fnames
+ 
+       qflist = getqflist()
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index b5735b6c3c..0cf2c41102 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -243,6 +243,7 @@ NEW_TESTS = \
+ 	test_partial \
+ 	test_paste \
+ 	test_perl \
++	test_plugin_ccomplete \
+ 	test_plugin_comment \
+ 	test_plugin_glvs \
+ 	test_plugin_helpcurwin \
+@@ -523,6 +524,7 @@ NEW_TESTS_RES = \
+ 	test_partial.res \
+ 	test_paste.res \
+ 	test_perl.res \
++	test_plugin_ccomplete.res \
+ 	test_plugin_comment.res \
+ 	test_plugin_glvs.res \
+ 	test_plugin_helpcurwin.res \
+diff --git a/src/testdir/test_plugin_ccomplete.vim b/src/testdir/test_plugin_ccomplete.vim
+new file mode 100644
+index 0000000000..a635bd50bd
+--- /dev/null
++++ b/src/testdir/test_plugin_ccomplete.vim
+@@ -0,0 +1,62 @@
++" Tests for the C omni-completion plugin (runtime/autoload/ccomplete.vim).
++
++func s:WriteTags(lines)
++  " Mark unsorted so lookup is a linear scan regardless of entry order.
++  let tagsfile = tempname()
++  call writefile(["!_TAG_FILE_SORTED\t0\t/0/"] + a:lines, tagsfile)
++  return tagsfile
++endfunc
++
++" A crafted typeref field is interpolated into the :vimgrep pattern in
++" StructMembers().  Without escaping, "/" closes the pattern and "|" starts a
++" new Ex command, so the field runs as an Ex command during completion.
++func Test_ccomplete_no_exec_via_typeref()
++  unlet! g:ccomplete_injected
++  let tagsfile = s:WriteTags([
++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:x/|let g:ccomplete_injected = 1|\"",
++        \ ])
++
++  let save_tags = &tags
++  let &tags = tagsfile
++
++  new
++  call ccomplete#Complete(1, '')
++  call ccomplete#Complete(0, 'myvar.x')
++
++  call assert_false(exists('g:ccomplete_injected'),
++        \ 'typeref field was executed as an Ex command during omni-completion')
++
++  bwipe!
++  let &tags = save_tags
++  unlet! g:ccomplete_injected
++endfunc
++
++" A legitimate typeref must still drive struct-member completion: escaping the
++" field value must not break the normal path.
++func Test_ccomplete_typeref_completion_still_works()
++  let tagsfile = s:WriteTags([
++        \ "myvar\tmain.c\t/^x$/;\"\tv\ttyperef:struct:mystruct",
++        \ "alpha\tmain.c\t/^x$/;\"\tm\tstruct:mystruct",
++        \ "beta\tmain.c\t/^x$/;\"\tm\tstruct:mystruct",
++        \ ])
++
++  let save_tags = &tags
++  let &tags = tagsfile
++
++  new
++  call ccomplete#Complete(1, '')
++  let items = ccomplete#Complete(0, 'myvar.')
++
++  call assert_equal(type([]), type(items),
++        \ 'ccomplete#Complete did not return a list')
++  let names = map(copy(items), 'v:val.word')
++  call assert_true(index(names, 'alpha') >= 0,
++        \ 'struct member "alpha" missing from completion: ' . string(names))
++  call assert_true(index(names, 'beta') >= 0,
++        \ 'struct member "beta" missing from completion: ' . string(names))
++
++  bwipe!
++  let &tags = save_tags
++endfunc
++
++" vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index ab7564c3b6..0642393db3 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-57456.patch \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
+           file://CVE-2026-59858.patch \
            "
 
 PV .= ".0340"
-- 
2.43.0


