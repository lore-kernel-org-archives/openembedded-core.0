Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D57CC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5674.1788326824513873943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=C8OlTaaP;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so3919735e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326823; x=1788931623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d3SVAbhrqenkv1Ww5+v4UVLAjfI5Z3wOzn72hFwCk6g=;
        b=C8OlTaaPhaHNPJE2iH40Vp6z4bInxbwEkgy77mO+JDHXgPAAgS3ues4IEnRtfy1P2b
         +y+inMpY5kdUi3nG8T4FMNl8m/g368Pb0JULj6FFlikghU+ck9y8tZ3qVpzzKcIDvx2e
         bmM0Y9w9laX8CBphyw7ASl814jfHlufEn14Pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326823; x=1788931623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d3SVAbhrqenkv1Ww5+v4UVLAjfI5Z3wOzn72hFwCk6g=;
        b=Q2U1lUwQPxP2J/SKmutejKzEosuCwog0D7qBF/9fsKaO504WDt7WMYM7+++U/mtspW
         fhB6U/tLXfvmXhFp4uFoHEVobWYm2hTjzDmLkGf6esMhHGnxjwCzKOZzutV3uIjZLqtM
         lScA2lIO8ocZZ099l809heJcKHwjTqQlUAv4GvNXXnGxw8M4OrwkbgYXCmdUZIYnpE2D
         nRd3TPRWRZr/uzUSQUbrA8/X1VZM35lxQk0HA76kGSRaoKy4TEVxED2fRpZup68ogiLN
         HRuIw8vg8tQVhYsQyH5VDuJI+C5McSw41TVxxckMs2KvOoRdyUAZf7QZuCIZGNG0Aod3
         3PtA==
X-Gm-Message-State: AFuF++lsk/zkVYUHB2u0YeTJsWeXsJcevugkbsonFPRQzDEMelvVWjBE
	pFBodK6+HlLAR6hdc0zrZEypo5MdU55ied6Js9wuCmeZLW5WidiogvPivDd4I8YLDRwcAi7hIHw
	lTh73VLs=
X-Gm-Gg: AR+sD125/FYDYaQ3Nw7+5fAmI3bjhBLZ6TNrsebq6NMMOu565b2+3iTc1GZQd/X6GQ5
	/fEU3zGLqA07aPbxFNKmma/aZO8MiOiVaVkhI8lqRD4U8J9Bsaqc8g2MLfg3fSXfGAFF6ttcMhW
	CbCO8X2apaoUN9ylMFRzhjJnWKcm/evqHsw/0jtyqDqh7JEZWJqNdTHmMsn8QgbWswS+JHQpV+E
	U8bA8SWtj9NXSLUplsalU9/Qvz+LWgJXeZG6/3EiyQN1FS4yj4XS3EryZ5f5mr2P6hyRVoPiCl2
	2W+cP1MxMxKtO6RBKtFaS8QpKWSpXvFrCIglRMVyn3WlGYSOxA3gEbPnSfh6b3vsTEzZJzrTeta
	V7ZwtrLPFjyPO8U8/908ptuYrl72q0uK0V22QW9iQJwkEKY6zedXo/JPaEYDLCldn9JybWD3Nfx
	gWHDWZdvTWwrQj5pcYfSuSFzZF2rmjw8DllBxj3TuTBZhLjrLW0ruDnAkfEkSsRqU2TaqEegynw
	HpW0yfsSJaxwCAbiO4=
X-Received: by 2002:a05:600c:1913:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49ce583d6ecmr28979605e9.9.1788326822642;
        Tue, 01 Sep 2026 22:27:02 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.27.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:27:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/27] vim: Security Fix for CVE-2026-55892
Date: Wed,  2 Sep 2026 07:25:35 +0200
Message-ID: <df7fb45b185ad3fd3b339ee25ce9dad041741f25.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244869

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55892
[2] https://security-tracker.debian.org/tracker/CVE-2026-55892

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-55892.patch            | 81 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55892.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55892.patch b/meta/recipes-support/vim/files/CVE-2026-55892.patch
new file mode 100644
index 00000000000..5f46c97cfa3
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-55892.patch
@@ -0,0 +1,81 @@
+From f0df4a48a426bd67c0c2f5ad536000a4368cd4c0 Mon Sep 17 00:00:00 2001
+From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Date: Tue, 16 Jun 2026 20:32:21 +0000
+Subject: [PATCH 10/17] patch 9.2.0662: [security] Stack out-of-bounds write in
+ dump_prefixes()
+
+Problem:  [security]: a crafted spell file with a self-referential
+          BY_INDEX node in the prefix tree can drive dump_prefixes()
+          past the end of its MAXWLEN-sized depth arrays on :spelldump
+          (cipher-creator)
+Solution: only descend while depth < MAXWLEN - 1, as the sibling trie
+          walkers already do (Yasuhiro Matsumoto)
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-qm9w-fmpj-879h
+
+Supported by AI
+
+Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/8325b193bba5f01e7a7d8241fc8633d93dff996b]
+CVE: CVE-2026-55892
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/spell.c                |  2 +-
+ src/testdir/test_spell.vim | 27 +++++++++++++++++++++++++++
+ 2 files changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/src/spell.c b/src/spell.c
+index 2281986435..6ef3fa899b 100644
+--- a/src/spell.c
++++ b/src/spell.c
+@@ -4328,7 +4328,7 @@ dump_prefixes(
+ 			}
+ 		    }
+ 		}
+-		else
++		else if (depth < MAXWLEN - 1)
+ 		{
+ 		    // Normal char, go one level deeper.
+ 		    prefix[depth++] = c;
+diff --git a/src/testdir/test_spell.vim b/src/testdir/test_spell.vim
+index 170ea57926..2a3f0e3696 100644
+--- a/src/testdir/test_spell.vim
++++ b/src/testdir/test_spell.vim
+@@ -1567,4 +1567,31 @@ let g:test_data_aff_sal = [
+       \"SAL Z                    S",
+       \ ]
+ 
++" A crafted .spl with a self-referential BY_INDEX node in the PREFIXTREE drove
++" dump_prefixes() past its MAXWLEN-sized depth arrays (stack out-of-bounds
++" write).  The tree parses cleanly (shared refs aren't recursed); the walk
++" happens on :spelldump.  Reaching the assert means no OOB.  Same class as the
++" tree_count_words() fix (9.2.0653).
++func Test_spelldump_prefixtree_overflow()
++  CheckUnix
++  call mkdir('Xrtp/spell', 'pR')
++  " VIMspell + v50, SN_PREFCOND(prefixcnt=1), SN_END,
++  " LWORDTREE word "a" with affixID=1 (so dump_prefixes runs),
++  " empty KWORDTREE, PREFIXTREE child BY_INDEX -> nodeidx 0 (self-cycle), 'A'
++  let spl = eval('0z56494D7370656C6C32030000000003000100FF00000004'
++        \ .. '0161010220010000000000000002010100000041')
++  call writefile(spl, 'Xrtp/spell/xx.utf-8.spl', 'b')
++
++  new
++  set runtimepath+=./Xrtp
++  set spelllang=xx
++  set spell
++  spelldump
++  call assert_true(line('$') > 1)
++
++  set spell& spelllang& runtimepath&
++  bwipe!
++  bwipe!
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 248160a82c2..07f7b7dd16c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
            file://CVE-2026-55693.patch \
+           file://CVE-2026-55892.patch \
            "
 
 PV .= ".1683"

