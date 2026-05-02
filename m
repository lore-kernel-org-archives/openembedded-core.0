Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEB4CD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:31 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9490.1777739423324824976
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XSu70bug;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-449e96a8a80so1407011f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739421; x=1778344221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZQQKRS7p2fhZ6BXbfz560J36+qHPRQQLEGhgk+7eKY=;
        b=XSu70bug7TSzK7JsRfyx2t6GdpVLLiLri9L8a9FryIvJzb6DjLmcopgM1IWF2oNo/C
         Xrv9yDB1FU6ERmhZ+W4dlNOW1Sbte7DLahQ/ZMk/bKLQWto8gsgUICPIu3Q8+Gnr5iws
         DcepfyPEC0vK+e1Ze87XUmBfwKK9On9nWDyXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739421; x=1778344221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZQQKRS7p2fhZ6BXbfz560J36+qHPRQQLEGhgk+7eKY=;
        b=XbDgz+ekcZ5BRUCEa+kljmWxs5561tEUh5hs0AP9YKvgvyzn3Kb2azZiMiKsY4/DaK
         SfXSe80bWlmz88jDmrcRCodIiBf7iHH+eGFyPys1ll/YT19QbCeUAnKZAr+MUdOHozKq
         +E7Ov5IFYYddBPChMZYsLY7WN76Orht9En9B0JhZKHnymF8J6ZTm87q0dQQY80WmhGzm
         zkkkeLcJcrpDNP1NJhcMkpdztrigiDGNNGGUt5MyJOqQJ33ZoJ/SHuHtC1Z+y4/R4WLn
         kX7+ep6nwOLuNPmC0nNvjeE5L0v9qE8jUovWIsBHoDqAEg5X41GjLqV8yKVzy/JWlVM1
         SjuQ==
X-Gm-Message-State: AOJu0Yzg2EDS9oci8OPrPCaQwoi2RmMjH3DXcvf2RJzborlpyVkhStkc
	Zd+TjP58yrdN/r7fASDNjN5CN/bkjFSIdAK+9h6zfhih4dy6hYYpU+H2S1yH8o07ojYBwO7h5MR
	+ub0PgrJAyIHaUnrQWqAo8C15uVVEZfCunItEJj+wgap1b6bSHT/EaOxfzDsZUAl6AxUSj1896m
	snD7JjkjZLklQ7oN8=
X-Gm-Gg: AeBDietZglZS7hNcOutbhztv6ZJ5NIiRbmnEdLYUUjsG1yDDuVnhUzmzxFhrAKyqxbR
	dOEUFHi4rvBrAQgjpxiCV9XTE/yIGViFPJby3a6shb9ROP3T8YNJBJkvqW83YrOcLL+qQ0fC20v
	zk0g2ZfEWRqmMObIvxkFYgyAR/fGTuhbomXMNZsUNJ8dvIoGvs6fS+Dfi71lEu0FhRZMJba9YV3
	wDnruBjRSlezeWAedN+772APIjEdE/CXxke61gPwZdMMWH1eqiKWMaumpmhFKWYsLhvC0UYmIx+
	0U4QOGf3BGcVsNjz9hS4mGnT6z0daFlLwtLBFxu0hUoSmS5Z6SxTTYs0iAXNVfeZCOPsJGQaQFn
	/dBHVTgXvAzWWfvKM/vL8KfjjJo7tMh0fWLvyZSkWF9ssXH5Tjn02FIWc7HWSgdKjdDeuc9OuIM
	CrrfV7uWkfyHP1DD3XE/W3fSPTfIANZzSv6I5BRY3UIE5bRkpSI5yG8H6+4UowqhM=
X-Received: by 2002:a05:6000:310f:b0:449:a07a:9676 with SMTP id ffacd0b85a97d-44bb67d1e78mr5837596f8f.29.1777739421113;
        Sat, 02 May 2026 09:30:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/62] meson: upgrade 1.11.0 -> 1.11.1
Date: Sat,  2 May 2026 17:28:47 +0100
Message-ID: <20260502162929.1377831-27-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236336

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Make-CPU-family-warnings-fatal.patch   | 17 ++++++-----------
 ...Support-building-allarch-recipes-again.patch |  6 +++---
 .../meson/{meson_1.11.0.bb => meson_1.11.1.bb}  |  2 +-
 3 files changed, 10 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.11.0.bb => meson_1.11.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index c2dc3fffcf9..ae8bd4c954b 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 9854e557b77612afb095e9868bb7cba12bc1b1cb Mon Sep 17 00:00:00 2001
+From ba79cee701b80984c660ffc1c89ce1226b75ed5b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -6,15 +6,14 @@ Subject: [PATCH] Make CPU family warnings fatal
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
- mesonbuild/envconfig.py   | 4 ++--
- mesonbuild/environment.py | 6 ++----
- 2 files changed, 4 insertions(+), 6 deletions(-)
+ mesonbuild/envconfig.py | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 43fad0c..27be871 100644
+index b0072a4..762818c 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -287,8 +287,8 @@ class MachineInfo(HoldableObject):
+@@ -294,8 +294,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -25,11 +24,7 @@ index 43fad0c..27be871 100644
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
-diff --git i/mesonbuild/envconfig.py w/mesonbuild/envconfig.py
-index dd050b011..5277693c3 100644
---- i/mesonbuild/envconfig.py
-+++ w/mesonbuild/envconfig.py
-@@ -634,9 +634,7 @@ def detect_cpu_family(compilers: T.Dict[str, Compiler]) -> str:
+@@ -642,9 +642,7 @@ def detect_cpu_family(compilers: CompilerDict) -> str:
              trial = 'mips'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 2e294b5b7f2..30f79be3693 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From fac479734d7f6e04eba71c8193623465d9eb0228 Mon Sep 17 00:00:00 2001
+From 21abed6786056ae31e4028b98068ff78740872e6 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,10 +12,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 27be871..994ac77 100644
+index 762818c..0efa628 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -31,6 +31,7 @@ if T.TYPE_CHECKING:
+@@ -37,6 +37,7 @@ if T.TYPE_CHECKING:
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson_1.11.0.bb b/meta/recipes-devtools/meson/meson_1.11.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.11.0.bb
rename to meta/recipes-devtools/meson/meson_1.11.1.bb
index d06ede78a0b..26d9af6c199 100644
--- a/meta/recipes-devtools/meson/meson_1.11.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.11.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "dffdd0915ceb028541fe3bed77d63ba35e78514591c043736b450d62634eeb31"
+SRC_URI[sha256sum] = "6788ae299979643f8d841bcaf64352558436cae45a0355148a3aeeccf7913866"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases

