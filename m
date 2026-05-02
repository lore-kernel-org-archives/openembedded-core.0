Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1870DCD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9473.1777739389686532617
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T4nCkLA0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1553448f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739387; x=1778344187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASJ+v4kvgPqnlpbqLyfC0Qp2fSMdcToDh0u89VfS404=;
        b=T4nCkLA0W3RBdg1y9lRF1Mo3yGiPVlEbvGmwCPy/JBa3lqhXMomJXfopzLypiGQOOw
         5wx4mXUtzMQMjkV5bksL7OKwyvAOT6DPSlU1fgXzLr4lj7Gz7Ho6IrVktL1DWivf0kEn
         7uou74EQsbo+v861he3NGAr0LzuJAv8ScbHqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739387; x=1778344187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ASJ+v4kvgPqnlpbqLyfC0Qp2fSMdcToDh0u89VfS404=;
        b=rvPRkjvAc3m0oTzko5uDw/fpnGvq99XcYL0X1a2EuBnxzl/787Ip4F4VA4rPwzeUUx
         9SbPBdMlb/mCXS6TxXVgRHFjCigWdYzTTt48Lr1Ow156hjBgEfXVzvOZ52RsooQ2f856
         L72CHhcw9MIwkDJCvoP9KrQwewgQH0V2JRsBIuGykuygBr+s1PuDthXS4LSPK9/L4pQo
         HOUT1nXWc083hybmVe+DwTGy9dmQnoOZ6sHTS3hiA5C1Xo194VNPno74nBg2SWL4P1Cy
         39DcrCGj8MCdiA7Gh/dZoBBAKl/SNYVoz1TBa6XuFUliSUZaDTicernhFEwHkBq+wHvT
         anhA==
X-Gm-Message-State: AOJu0Yy1MKh7AiXuJ6SBHgoY2TokEwoP5W0qQRt3+pHJiczj584+Umev
	LNLhXfaMKQhQP7SxV77LkZwfwMhnNVUk8bXkEKMGnVIO9hJW1iwSjPclrdmtq2UxOX5EGpDaU8Z
	efF6i1y8mipBN1Bf5nuLEHRFKhBmBYLzbeZQObK/c8Wm/e+7glRIprW6JUWWuxG4omXkCJUruTU
	i3m5pOQfL0CaEDufQ=
X-Gm-Gg: AeBDievdZyjGJzSytxVa+1jTo9R78++R6EiWeBEpDgO67sYmrh6y6WHmR4IZ7RyIMUU
	7QKzpmW7EFXwkdYJSJIFCNW68u/nrx9woC2KCJ3lBfax6r29wLWQjMwoHXdkbHD1K+Lj37x/UjH
	1XRkqAwefpEjH4QdGuGnWAYX5DzxJGiVDo+OuNQ+CgYdnnjNrfZ3QQ7kOXmLyNHI1WXVwOZoJIC
	wklE22TuUdhnztcBmZHFfV7cD1/AuBfb1V/MAMXYNoR2hHeyXjTYVy0zHRqmbCqlTcLYrYN0hiR
	eM4txCjUiktvRQrgZj8UE+CWLM8PbKy52sfr6+USm161/gkiu+hb3nnBaxHjZ1GmaYvtZUxskTg
	p7sLuxHk7APcUGU6xxiMvWB5UmStep6QI9BRTm9q6Z5bT1nuAusDLW+62z/ejayYsQZB30NarF7
	y3DBhh1cyv6LK/RvhvnQlMWGA4g5Rodypp+oAk9L1Tcx+efvP8AHZmQU2kUm9aLOebQbk2DIgr6
	Q==
X-Received: by 2002:a05:6000:2f83:b0:43d:184:8aa2 with SMTP id ffacd0b85a97d-44bb434d4camr5854910f8f.16.1777739387557;
        Sat, 02 May 2026 09:29:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/62] git: upgrade 2.53.0 -> 2.54.0
Date: Sat,  2 May 2026 17:28:30 +0100
Message-ID: <20260502162929.1377831-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236319

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...uname-do-not-force-RHEL-7-specific-build-.patch |  4 ++--
 meta/recipes-devtools/git/git/fixsort.patch        | 14 +++++++-------
 .../git/{git_2.53.0.bb => git_2.54.0.bb}           |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/git/{git_2.53.0.bb => git_2.54.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 61bf0e12dce..b0c8e652aa4 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From 325c30dac4eafdd463c8ffcfe1215858d642ab91 Mon Sep 17 00:00:00 2001
+From d73b4c666aa12452a26c3fac83371a707e6f13c0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,7 +17,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index b12d4e1..b5b8d82 100644
+index 5feb582..060cd29 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
 @@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
index 7066e1808d1..046d09160aa 100644
--- a/meta/recipes-devtools/git/git/fixsort.patch
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -1,4 +1,4 @@
-From 65fa5c0f849fe4a1e3cb8e6af0086ef0748c28de Mon Sep 17 00:00:00 2001
+From f928abf16841e42bfd49ccaabc164318f61e842a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 17 Feb 2021 17:57:13 +0000
 Subject: [PATCH] generate-configlist.sh: Fix determinism issue
@@ -19,14 +19,14 @@ shell script generating the header.
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd37d8e454524987842f.camel@linuxfoundation.org/T/#u]
 ---
- generate-configlist.sh | 2 +-
+ tools/generate-configlist.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/generate-configlist.sh b/generate-configlist.sh
-index 75c39ad..6d4525e 100755
---- a/generate-configlist.sh
-+++ b/generate-configlist.sh
-@@ -23,7 +23,7 @@ EOF
+diff --git a/tools/generate-configlist.sh b/tools/generate-configlist.sh
+index e28054f..96ddd51 100755
+--- a/tools/generate-configlist.sh
++++ b/tools/generate-configlist.sh
+@@ -24,7 +24,7 @@ EOF
  	d' \
  	    "$SOURCE_DIR"/Documentation/*config.adoc \
  	    "$SOURCE_DIR"/Documentation/config/*.adoc |
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.54.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.53.0.bb
rename to meta/recipes-devtools/git/git_2.54.0.bb
index 8d71905f419..80c535a726f 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.54.0.bb
@@ -170,7 +170,7 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "429dc0f5fe5f14109930cdbbb588c5d6ef5b8528910f0d738040744bebdc6275"
+SRC_URI[tarball.sha256sum] = "45e8107643a44e3ce46f5665beb35af3932fb0d70017687905ab5d4e3aafa8eb"
 
 CVE_STATUS[CVE-2024-32002] = "fixed-version: fixed since v2.46.0"
 CVE_STATUS[CVE-2024-50349] = "fixed-version: fixed since v2.49.0"

