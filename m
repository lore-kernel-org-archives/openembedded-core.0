Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A35D78787
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:16:29 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.2295.1732205783693252143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FBAtxmqN;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460b16d4534so6721511cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732205782; x=1732810582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoieCgQDVbF26G1VBenYjWXOybKJG1lJ3pGFLNyHNvE=;
        b=FBAtxmqNIELbzCY14nNnA2XSJgSVqoWUYMErsQMkWgReeV0jAIp02QMNXcG9DbZvaX
         7wbiIlX/rvLYNhCHwt6TfjyGGz+eEX/OUcPSqfxgflRdxtC5tpdJCySO6CYmcq4fuizN
         SJ4s7dajo8Ab8hooyuRYQike8fcpGGMyGVGgTvzUQKgNbbcNnYrrNhqf0RE7cIXGJxAi
         9e8lfIAYOnnzCZOY2BcHZ2Nz9YxpY2aSOfyTmHWrTS8pVHgWJLSRdhcVrAasjnsGb5/D
         c7xSAcenTylT6b8zEEmZAgz897k+oqOICUYHiBiLiz19VGIZo6dfzfU63vSNdAtfnc9X
         1YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732205782; x=1732810582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoieCgQDVbF26G1VBenYjWXOybKJG1lJ3pGFLNyHNvE=;
        b=Wq9PHIVMfm2h3a53hXlzLiS6fHCyNEyfM+/VgO1rm8/CP/LYA97BJIDWC/E3dMgO7g
         rfbUc7bYFQSHEBJZu1xpK9qRGerbUbsU3+HUPD/5SOOhIChYVz/hIhgMIkTaamfAM+rx
         C2d3wSWCuaLkQN/PCFP+pjBDFQ6DV0L83rYSs1a31xGt0aV5HbUB7Se23bVU46Vt2dLn
         8t+yq5RmOcBbJJRYE3xrYE28M+PSVQduGvk/hvEbBJU9fLRGbwKjfbT+gm6lbyEK/Zhy
         D7N4Ft8Ywmvt5OUIhsRvp6d1MJUIkmjAwpMNSxKtXxQNWC8u1+DXJmXVqzJvsWgt0nzr
         82ow==
X-Gm-Message-State: AOJu0YzeQJ1rrixuDniKAJBHy/O8TZBkdUNHW2SAMJSNpaIvYyV+d9ZP
	+4ThQdhZ/0IhrYxdnIN2AQd63pWSXy+UY/3d78+fQ7uhdyR+rxBEXtZBsVgF9XEyLS8UlUoXxys
	b
X-Gm-Gg: ASbGncuF+0erWYsrQqKFjKPpuDmGYIIsn5MK8biZ/CVARswNGoAxVvcprdxrBPhJ8AV
	g0hT71KVBAR/SHGy/ESu5P0Y/c+nZf9wfOlMV08R5JAcjU0ZDI8S8K6uVaJ/76h4m4b4Zq75v8h
	+QcqaaJmzVu6618tXzjzUZGVDKQxw9HV88mPgloxAvqRMkgucjry0JkVQU74qHu0jObfbGZqqur
	Qtr1/coZoPkPTNn2h4ijZMa9msO/LwKosRclmSC75/gcA0G2K39cpOv3bm69GgkacvcyiAlX5kh
	9flQ9vOuoMsQHoL/OebfXotMOSSdZoU=
X-Google-Smtp-Source: AGHT+IHFIJW4+nC8DBJsdbV/W6Kj6mSJ73n8C9u/MtemvpoycfIKbyoG+wsBmPrde6hZ/4GRJASAHw==
X-Received: by 2002:ac8:5946:0:b0:45d:9357:1cca with SMTP id d75a77b69052e-46477dba223mr83102191cf.14.1732205782284;
        Thu, 21 Nov 2024 08:16:22 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c4054e2sm173641cf.38.2024.11.21.08.16.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:16:21 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-setuptools: upgrade 72.1.0 -> 75.6.0
Date: Thu, 21 Nov 2024 11:16:20 -0500
Message-Id: <20241121161620.2141006-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 16:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207545

Changelog: https://github.com/pypa/setuptools/blob/main/NEWS.rst

0001-conditionally-do-not-fetch-code-by-easy_install.patch had to be
adjusted to apply on top of 75.6.0.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...onally-do-not-fetch-code-by-easy_install.patch | 15 +++++++++++----
 ...ols_72.1.0.bb => python3-setuptools_75.6.0.bb} |  2 +-
 2 files changed, 12 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb => python3-setuptools_75.6.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 16b316e9cc2..527160735f0 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
+From 00611eb8151825632bc36c189109626d9223037f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -11,18 +11,22 @@ when that ever gets removed this patch can also be deleted.
 
 Upstream-Status: Denied [https://github.com/pypa/setuptools/issues/4735]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Update to apply against v75.6.0.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 858fb20..62bd853 100644
+index 66fe68f7a..8647c2082 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -672,6 +672,11 @@ class easy_install(Command):
+@@ -673,6 +673,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and _rmtree(tmpdir)
  
-     def easy_install(self, spec, deps=False):
+     def easy_install(self, spec, deps: bool = False) -> Distribution | None:
 +        if os.environ.get('NO_FETCH_BUILD', None):
 +            log.error("ERROR: Do not try to fetch `%s' for building. "
 +                      "Please add its native recipe to DEPENDS." % spec)
@@ -31,3 +35,6 @@ index 858fb20..62bd853 100644
          with self._tmpdir() as tmpdir:
              if not isinstance(spec, Requirement):
                  if URL_SCHEME(spec):
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_75.6.0.bb
index 5a01111934c..c0e4b7031d7 100644
--- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
+SRC_URI[sha256sum] = "8199222558df7c86216af4f84c30e9b34a61d8ba19366cc914424cdbd28252f6"
 
 DEPENDS += "python3"
 
-- 
2.39.5


