Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D1EC531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:47 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19535.1784798799089827130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VLo/YOjI;
 spf=pass (domain: mvista.com, ip: 209.85.215.175, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso260988a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798798; x=1785403598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMcshy9tyt6fANbCeJ2Ec9AeGqNgaZCF4mNCTz7/BB8=;
        b=VLo/YOjIa/ubOSM6068WrXV1XNheVuye/J0TTK7+iPj+9Q0+OVexFXsY9pF+gjlY2G
         GpED+lkhQKm/m/Q1W+N1RRNFl4enXqFzUflYqOnQNKvLTkr1v2XNGg26RWGX4fLEDQI7
         sZURLF5sJRxQKf52hR3OeDB4ML2S5OSQ4C358=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798798; x=1785403598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMcshy9tyt6fANbCeJ2Ec9AeGqNgaZCF4mNCTz7/BB8=;
        b=G3QqnTelF4hlsQ6ZTfv/JBNJ0Y5ytarVBZuN0jLgdmiEF1QNQXw706Cly0pGSYehkp
         Y0Qve2EyNI6vv1n1HGBNE/FBl+k8+mNEjy8TxxuSFVBU2zSbmz2mr/DT0MZUJ5Ack78g
         ltUsnZBNa45diYndy10Q1Y7wsQupCAGDIQiRtbixTtN65btYKRa7RSmT9FwjVmu+7TZV
         Q/HNwvgu/DUjrPeflMhnmNoY4PUjufvOz1Nql7atIQJEMDySSi482/HRThZEBTb38/nz
         FvCeHevWcMbhFMVR9+2LUVJLAdYFEXAxSCMa8OITtlVeK4Abm+uTLqPQV+vCXf9f0HHU
         N8mA==
X-Gm-Message-State: AOJu0YzikAD+oCh3oxsKcBhZ/WD7lDddKk/ItnwVk/Z3bdjhMAT6ry/v
	SHz7tO4GE85uM+B8jU8TB4RzCR+sNZOI4I3RgXjHvSGbtDjaHscws67tVDFVTTelRLiHnMI/1he
	5e6ia1NE=
X-Gm-Gg: AR+sD13PSYaRfRWWluCcQtcOEa+biKyI0uy6pJ7yf6MG+P8MwFZ88CmfgESEaFKLbCI
	qV2ElKBo9+H2Q675cb3icYoWZgSkcB9RqoHc4QnsTYRyusbrYKjIx/FU5zXcFQiF517Iurq1vGQ
	ru3GWKCxbl1V14rwFn98UBe7TX0WTasYiYqsdqfruM9l+AXeyp0wRw3mVZ2+0obaP0c+pYdYGhp
	iG31LAxADTMqbq+7lh51yGmzPtlxq9wFyLphmen/MIeHsGkzbcsL6X2to7AFWx+c4DyKp63kwMC
	VTLXmIfHY7f1vrtpL0s4ii1rg7Qc4mw5YXIiwFqocOymP6pTuM4PYADjdET6vFXn4HLrV3B43u4
	rWNy8tFuKEkhfhGvmMyRknzkJHAQyrylZ8l21PWl3X0FKmxQWgvyWknelz04PbUD2XXrK61a/cP
	e5kaPgJrm8XFQ=
X-Received: by 2002:a05:6a21:6b87:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c44b157945mr2551990637.41.1784798798336;
        Thu, 23 Jul 2026 02:26:38 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:37 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 13/13] vim: Security Fix for CVE-2026-59858
Date: Thu, 23 Jul 2026 14:53:54 +0530
Message-Id: <20260723092354.54697-13-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241817

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
index a484a5c840..6ef9745b57 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-57455.patch \
            file://CVE-2026-59856.patch \
            file://CVE-2026-59857.patch \
+           file://CVE-2026-59858.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


