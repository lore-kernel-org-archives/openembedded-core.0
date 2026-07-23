Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F020C531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:27 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19549.1784798782201134511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WybT4ISV;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: sdoshi@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso379386a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798781; x=1785403581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+VS8a6uij8vGfeHigtSgyQGgFx7nh/n24Xw8JeMFXk=;
        b=WybT4ISV8igwYFbRMkgaMejZwyBBFigKqwmcTjTgyQoMX5P+jli1CC3DSan1aF4chi
         Rb+agzPpwp+gh1xFmez3ovZCUb60o6H/KW2+EFMKXSy9tSp1Ndch0hRDhxySci4XmhZz
         Vd4acXe5k+fCzSN0xOv8gl5s/p5EGycQwYr3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798781; x=1785403581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+VS8a6uij8vGfeHigtSgyQGgFx7nh/n24Xw8JeMFXk=;
        b=LkaPWsGdiY8+MuImi4MiiQGRllQH9kPcIVlDTZy6rOSf2Tl1Ba6KiBj7H6SboUGNbw
         LEjK8gXBAHAPOkLMf1YANd29ZCHoVAT/qd23ItsqCqAeYfISwAI7bIyIEYZQ+KweBkDp
         Z1q2LAQm9iGMjCUMUUeGpvZG9gajBZYk8i+ZfMz3bQO5gf0lZklcoCcdCfHGSGkuEoLb
         0gEFO42eLfgUNCi068VztHHOLOSSquSK5U+OblUvjtw3QzhWYKw0Hdy8Vbv6tFSEifN6
         3xYJTH/XdwPlOaC3v8uN+frF3oUrv/+WIXzTWuYyqC/dPUb6bUFeWyM0km30PEObpSTg
         3m8g==
X-Gm-Message-State: AOJu0Yw3X0+fh+kQ9SDGwuUwWxgmA1KFqyxNjuUO/Ad5CWD4s2jIr4Vt
	xuQlj97k08vKv7gPZklffs3MfxfOmIBHHrMwFMHMiaFbzscC0/9XcWX6CLWXMOfJiZSRBA/WRai
	wGwcATzc=
X-Gm-Gg: AR+sD12ihlenfCnHcnJvoVy7ljBRBf5q5b8nhvKK8QOoMalC+Rw1PiInKz0gKiSZsl1
	LT0Tx4fNWFo79aspRGIURcj/rgB4+Q9GgSYmUFp6+ksDAQfNqjHAXKfoaJI0B7zxpIbUB3rDOVI
	EzuyS3+NtasjHAGlRZ9czGOp+9JlXInT7e2K26C9aYbJjleJp8GUQhrSgRE8mvF09eLkFW/etLo
	9qzvfhg49qFP5mNPWGNP/5xnnVp7DpdGAXdlpHaEJ2a+C14c/30YxDp1xryE+DBkoPaEQ4ohSjS
	pFt4p7xv9k8uCeujLDfwaA9o4GyNzms32m4LcS1oVrEsnnb2Xw7UccFkeRDdV6H0C+cSAGgJSNb
	fL8qLDsPZEucHXv5yKugZD26nF3BVrrsAp+1CrFKAHpDIP/NY0YNLC946QsFKbkr7xGnnsM6oo5
	tQhL3utnS5kyI=
X-Received: by 2002:a05:6a21:1392:b0:3c3:88a5:83db with SMTP id adf61e73a8af0-3c44afa75f7mr2476747637.5.1784798781495;
        Thu, 23 Jul 2026 02:26:21 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:20 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 07/13] vim: Security Fix for CVE-2026-55892
Date: Thu, 23 Jul 2026 14:53:48 +0530
Message-Id: <20260723092354.54697-7-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723092354.54697-1-sdoshi@mvista.com>
References: <20260723092354.54697-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241811

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-55892
[2] https://security-tracker.debian.org/tracker/CVE-2026-55892

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-55892.patch            | 81 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55892.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-55892.patch b/meta/recipes-support/vim/files/CVE-2026-55892.patch
new file mode 100644
index 0000000000..5f46c97cfa
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
index 248160a82c..07f7b7dd16 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-47162.patch \
            file://CVE-2026-47167.patch \
            file://CVE-2026-55693.patch \
+           file://CVE-2026-55892.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


