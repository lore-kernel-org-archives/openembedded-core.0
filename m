Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4913C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:22:33 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9359.1784751745463296844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=knAhJxZc;
 spf=pass (domain: mvista.com, ip: 209.85.215.178, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso7795700a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751745; x=1785356545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzapKopLlT2aB8UjLpGOpINDoKFiOP8N3+WGyjxqSBo=;
        b=knAhJxZcaqpdEEVMEPXQ6QHWF6N5t5UR4ZRuPiF/MomSf9jeXfv4+G4EXJk+2YFOTd
         NlnNQAaDu+sykht1DJfh+sxuJDHYkDV+0pikurOgsv99000+JH04/qbYlZVhcxGBdwxT
         GY3swuyZgzue5/ge6kgO8lzQr6kseGYk24xDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751745; x=1785356545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzapKopLlT2aB8UjLpGOpINDoKFiOP8N3+WGyjxqSBo=;
        b=knwbAaxawCMlXc2Arn2/PCtOYv3CrCeeK4JBH7ofDhsN75+JTUqUIomvUN8divv3uL
         OFrx8kdhHZFdNZ+NpJj8nFnKuIoxNLpOJjNQuJ6q2rz4oj0fUJb5xGiE4j4QCjI6Pzas
         qdGPUsJPfkFVlxCWaYpVxDX1cdPcuZo9vnKo6RL0sYI/6BWuZNYei+EzhLwRZUmY6Coh
         TsdzRfSSELHrxQ3PY0w9AdLu6aARUqXG6OBKRJVuKKA2kT3VOYpPJj26QcoEcEV59jQt
         Jb/wL6uTxqisBnGnAgsvxBGyCjoozTofOxTns9MN3HVEcU88DucrCGTOqiFde1bysnwN
         96aA==
X-Gm-Message-State: AOJu0YzGjD1218k3JuI2RT7BIkpr6wS8jodzeTkedpGhqu5tojzdMRev
	shEfd9qNAjMLg1Zv7u7rVhioX6BCRecUu2YFE08yteWBey1jibHQyGcaUw9AA2vQqv3HPG2BXXS
	zeJ+EjOY=
X-Gm-Gg: AR+sD10SA8De6k4tY6pu7m+NXQr9FvsgrqyB8qkzKFGPYYBDt7OZDWUq5ts0w2wHoXw
	ul1geCqttu998U7qGu8Eh/Z6z8bEoR4eqJGeX5NmL8H1ywlWIJqyY1GkhF3O/jIh/8FaRlXB1Sd
	Jn2mHs7xJU/AtqWGZN9G5NEPiyTT9WzLyG7dOoHAYKWWjrs3IeaqWU8hmY/iggVLzcVk8zsjSBY
	uzZdCecyKYACmFLVFMry/o3Ee++kfBb9S5S6pQEh5ulAUD11MlQYaRWzaRMvzhjQtLmUjOWGXRm
	jsNQbrqUkA2jWL7apnREPOkYDOxIN/mOn6IFyeWr2+ht+fdK/qwWdWCI+37UwiNGu7Es51lPN80
	mh8l5kdcqjfcvXEpMK8+aRSX4ALJcfc/saeq5ElgqbkUn0iYuNk89AX8Dz5MQF99XK73i2LTY+Z
	oUe4aNzN508UT9
X-Received: by 2002:a05:6300:95:b0:3c3:b57b:6459 with SMTP id adf61e73a8af0-3c44afb5078mr41809637.7.1784751744608;
        Wed, 22 Jul 2026 13:22:24 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:22:24 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 13/13] vim: Security Fix for CVE-2026-59858
Date: Thu, 23 Jul 2026 01:49:05 +0530
Message-Id: <20260722201905.491897-13-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
References: <20260722201905.491897-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241757

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-59858
[2] https://security-tracker.debian.org/tracker/CVE-2026-59858

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-59858.patch            | 134 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-59858.patch b/meta/recipes-support/vim/files/CVE-2026-59858.patch
new file mode 100644
index 0000000000..0b754ec2d3
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
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ runtime/autoload/ccomplete.vim        |  2 +-
+ src/testdir/Make_all.mak              |  2 +
+ src/testdir/test_plugin_ccomplete.vim | 62 +++++++++++++++++++++++++++
+ 3 files changed, 65 insertions(+), 1 deletion(-)
+ create mode 100644 src/testdir/test_plugin_ccomplete.vim
+
+diff --git a/runtime/autoload/ccomplete.vim b/runtime/autoload/ccomplete.vim
+index cb4bb2c167..248d6f2e60 100644
+--- a/runtime/autoload/ccomplete.vim
++++ b/runtime/autoload/ccomplete.vim
+@@ -593,7 +593,7 @@ def StructMembers( # {{{1
+         return []
+       endif
+       execute 'silent! keepjumps noautocmd '
+-        .. n .. 'vimgrep ' .. '/\t' .. typename .. '\(\t\|$\)/j '
++        .. n .. 'vimgrep ' .. '/\t' .. escape(typename, '/\') .. '\(\t\|$\)/j '
+         .. fnames
+ 
+       qflist = getqflist()
+diff --git a/src/testdir/Make_all.mak b/src/testdir/Make_all.mak
+index 7d57b2e727..681e9b3b2a 100644
+--- a/src/testdir/Make_all.mak
++++ b/src/testdir/Make_all.mak
+@@ -242,6 +242,7 @@ NEW_TESTS = \
+ 	test_partial \
+ 	test_paste \
+ 	test_perl \
++	test_plugin_ccomplete \
+ 	test_plugin_comment \
+ 	test_plugin_glvs \
+ 	test_plugin_helptoc \
+@@ -516,6 +517,7 @@ NEW_TESTS_RES = \
+ 	test_partial.res \
+ 	test_paste.res \
+ 	test_perl.res \
++	test_plugin_ccomplete.res \
+ 	test_plugin_comment.res \
+ 	test_plugin_glvs.res \
+ 	test_plugin_helptoc.res \
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
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e659db50ed..16646dabff 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-57455.patch \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
+           file://CVE-2026-59858.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


