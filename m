Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53BACD6E4C
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:24 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16906.1780186700221661855
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UFelhW5L;
 spf=pass (domain: konsulko.com, ip: 209.85.216.53, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3698e34a567so13704629a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186700; x=1780791500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0u1MOJSFY6FDlMDZj8xTAXpYaUA5/AFvfWyC5KSPCzI=;
        b=UFelhW5LBxO3sn9JHzGhc0y0HWs1f8s0pxg9dQBxPImW0JfLGStITHgeUuiKNjP8IN
         gs4qXebi+oZGMh1WPtmRrn4qHHz4Dn9GBz8ZfphwKSjMOtvvAXHSTMc2V1lyxipVWuVw
         06PnzlC8MP3VCIrrmTl3HOh610x6uqtSfBV6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186700; x=1780791500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0u1MOJSFY6FDlMDZj8xTAXpYaUA5/AFvfWyC5KSPCzI=;
        b=Y5IUhMG764IL7t8+Uy3kYiqXP2+9RijyWsFfUvJzglrhlqTXVvjCKCSUfzusYRcVak
         pq+teqYk4lP8oHaZlJgdg4SQLq/xqRbEmu8iNSGzJr3VKJ0xLBH96h4gOYUE3thE7WR8
         uTWTbOgkGnpxbw8Tle0w3mBMtx5gwZfvjK1gYu4FVMWyndjnHkGgqfACwUekNgEJO6Kk
         SHb+fR7NqEPYAB7amlYccfxpT9iWIywvlLE83rOPA/tZ8ww4SOQhwVU8HwuuXOdczmnn
         ISdxUGe5zaxk3uheoVHInt6TEzrUXzRBCL6wIIMbnZfG8+fRfAfijB17J4GD7eeTsDUh
         eJyQ==
X-Gm-Message-State: AOJu0YytSGaMO379wxzBybQrwZoZB69abQQbGmSzprIUCLwQ0Fup4rFf
	zAafhPpgQUcvLjiAEacQqpllbYBrZfhaL2odPu4gEG9h6q9/HcRoZ2VEyQBXIYtQHk9dxGz6xR/
	lXGyQ
X-Gm-Gg: Acq92OH73Qti373BeuQTcnhwTT+ZUXfuWLXfc5X3FPvBY2nBzPtuxEWTjgSxT1Ak/Db
	elwDotWHbp5ws6YXPnlbGTrACyo/lq4nBq+Zre4h5D1wbu3fwXEekkjzfEoJN3K5ageddenE6sv
	TOMgFIaNVdYy93QuKLwkxa8kDZjryhvsQ2ilLx2loFllqZx53io1h1QF9PNQTmD3PAMCdaifypk
	8zai4LsCOV0b8ABQkB3J6FGrIgoZK+mS4FG1QtZueuy96X7Ki4ugO5mI4c6O/IJmUcDBns9Rvg0
	CSniuh0Rin7s10/9DJuggafLf0uTT3BwO+UXVjkZlM1ccUxHT3qTV+z0xnVHlbH7EnJSoy4zdeM
	PItpf8C0kjNngQYnzwtYBLLReu5YMgiTLryq0FAEyrvYJD1FsYZbLcDOhOtO/4FsQDJmmcRijfr
	wUmGUwuPJly2XO8wlMroHs6Pfh0v+xPMcx84jkG0fOm3AQkF9/1ToQ48v4C+gHqRzLzQfSd1smi
	wTd0UWmegQ6
X-Received: by 2002:a17:90b:4c:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-36c4ff0b59cmr4936814a91.6.1780186699572;
        Sat, 30 May 2026 17:18:19 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc660da67sm6135718a91.6.2026.05.30.17.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:19 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 7/9] python3-snowballstemmer: upgrade 3.0.1 -> 3.1.0
Date: Sat, 30 May 2026 17:17:54 -0700
Message-ID: <20260531001756.1582306-7-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-1-tim.orling@konsulko.com>
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237786

From: Tim Orling <tim.orling@konsulko.com>

git shortlog:

Dmitry Shachnev (5):
      python: Drop Python 2 support, require Python ≥ 3.3
      python: Simplify code after dropping Python 2 support
      python: Add a minimal pyproject.toml file
      Stop excluding classifiers for Armenian and Yiddish
      stemwords.py: Replace deprecated codecs.open() with built-in open()

Henry Schreiner (1):
      Protect empty languages dict

Olly Betts (11):
      python: Fix algorithms() when wrapping PyStemmer
      python: Reduce overhead of forwarding to PyStemmer
      stemwords.py: Make -i and -o optional
      Python: Optimise string test
      Avoid unnecessary cursor update in among helpers
      Python: Change slice_check() to assert conditions
      Python: Remove parentheses from assert
      Update slice end after `delete` and `<-`
      Python: Remove deprecated licence classifier
      stemwords.py: Remove now-unused `import codecs`
      Update for 3.1.0

For full comparison of changes, see [1].

[1] https://github.com/snowballstem/snowball/compare/v3.0.1...v3.1.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-snowballstemmer_3.0.1.bb   | 13 -------
 .../python/python3-snowballstemmer_3.1.0.bb   | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb

diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb b/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
deleted file mode 100644
index 37cfbce7dc..0000000000
--- a/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Snowball compiler and stemming algorithms"
-HOMEPAGE = "https://github.com/snowballstem/snowball"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=19139aaf3c8c8fa1ca6edd59c072fb9f"
-
-SRC_URI[sha256sum] = "6d5eeeec8e9f84d4d56b847692bacf79bc2c8e90c7f80ca4444ff8b6f2e52895"
-
-PYPI_PACKAGE = "snowballstemmer"
-
-inherit pypi python_setuptools_build_meta
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
new file mode 100644
index 0000000000..7eb862753f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
@@ -0,0 +1,35 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,7 +1,7 @@
+#  Copyright (c) 2001, Dr Martin Porter
+#  Copyright (c) 2004,2005, Richard Boulton
+#  Copyright (c) 2013, Yoshiki Shibukawa
+# -Copyright (c) 2006,2007,2009,2010,2011,2014-2019, Olly Betts
+# +Copyright (c) 2006-2025, Olly Betts
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
+SUMMARY = "Snowball compiler and stemming algorithms"
+HOMEPAGE = "https://github.com/snowballstem/snowball"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=07c3b61d971c3df6e19ce439cfe1fb8c"
+
+SRC_URI[sha256sum] = "fd9e34526b23340cd23ffea6c9f9760974ecc2c2ac9e1d81401443ccdb2a801f"
+
+PYPI_PACKAGE = "snowballstemmer"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


