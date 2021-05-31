Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.44087.1622467447223263261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 06:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YQeTNuPf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id v23so8590140wrd.10
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QDRmqt0zge3Edi85nKja7krdnLCOv4OWIPXVGK9vWr0=;
        b=YQeTNuPfKH1ib+MQWyAQMGyWiZmh7G5T4iMtpM6VhbsUO+nGT+FATaw8BldROln20W
         ClYLzZPTZV0o3vM7P6EqPlEpub6X9uWI+PnKsn5BcRruMevZv7LbJx7QSGO+u4wtieU9
         KxbuwY0cXzaUMSz6f+9etnZn99kVjpN86WWkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QDRmqt0zge3Edi85nKja7krdnLCOv4OWIPXVGK9vWr0=;
        b=kiVOL/E+ch0nPSWaz9hbqO3gc6n5jcvsXoiNcsuN21YHcsuckqIVq861weQsgH3ppk
         qw+xFIs0rFtx/oxLn1LPWuUsU7FpfkFieqPUr1yrevzWxJS0Wgg1uGsjU5yCkWyywpDN
         A0vuqNrFgL5cgM5je5kOaFFDvG5zXZ8lQ9kAnNu+P2T0u8jm2VWMBmMU12mg2Ce1zzpg
         ErDuDClpD7aldV+mUFBshmPADO8xGn+A0lUTDA7EnLn0SoRtsp5cvp1qRXL128dYQVd8
         CWbISXGixn/Po+k588by/b936tsoVZO+CmXqSwfQO2zhA90VZTBkI8j5zWsBh/pWjVxA
         3zsQ==
X-Gm-Message-State: AOAM5339cO92xH6/SjXEPAbfeefK7t0TRfRBH6zwfJiTIq3Jrg9I7ftI
	mXla1TvLOg/6+9l3SGYH7uKPpQeSpDWzew==
X-Google-Smtp-Source: ABdhPJzCX8rcLnGWESt/21KiNQFT6gfikBP250jWP5TG4VayyUWgSPM7QxmLATKRI6z6AHKVNsLsGA==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr6976649wrq.111.1622467445649;
        Mon, 31 May 2021 06:24:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id z11sm13912849wmf.31.2021.05.31.06.24.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:24:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-setuptools: upgrade 56.2.0 -> 57.0.0
Date: Mon, 31 May 2021 14:24:04 +0100
Message-Id: <20210531132404.2843797-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210531132404.2843797-1-richard.purdie@linuxfoundation.org>
References: <20210531132404.2843797-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to fix a reproducibility issue in the new version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ly-do-not-fetch-code-by-easy_install.patch |  2 +-
 .../python3-setuptools/reproducibility.patch  | 40 +++++++++++++++++++
 ...56.2.0.bb => python3-setuptools_57.0.0.bb} |  5 ++-
 3 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
 rename meta/recipes-devtools/python/{python3-setuptools_56.2.0.bb => python3-setuptools_57.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 59e278d1aed..1082fe79be3 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From d6339e6b3de0f3be5ca50541d82f99d827700f45 Mon Sep 17 00:00:00 2001
+From f6afc18e08a6c428ce8becd114c535a6840f1b9f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch b/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
new file mode 100644
index 00000000000..149d8ad5cea
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
@@ -0,0 +1,40 @@
+The License-File lines in PKG-INFO change ordering depending on the order on disk, 
+for example for python-packaging, one build shows:
+
+License-File: LICENSE
+License-File: LICENSE.APACHE
+License-File: LICENSE.BSD
+
+and the other shows:
+
+License-File: LICENSE
+License-File: LICENSE.BSD
+License-File: LICENSE.APACHE
+
+This is because glob uses os.listdir() which is unsorted. Sort the result to avoid this.
+
+Upstream-Status: Submitted [https://github.com/pypa/setuptools/issues/2691]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: setuptools-57.0.0/setuptools/dist.py
+===================================================================
+--- setuptools-57.0.0.orig/setuptools/dist.py
++++ setuptools-57.0.0/setuptools/dist.py
+@@ -15,7 +15,7 @@ import distutils.command
+ from distutils.util import strtobool
+ from distutils.debug import DEBUG
+ from distutils.fancy_getopt import translate_longopt
+-from glob import iglob
++from glob import glob
+ import itertools
+ import textwrap
+ from typing import List, Optional, TYPE_CHECKING
+@@ -603,7 +603,7 @@ class Distribution(_Distribution):
+         return (
+             path
+             for pattern in patterns
+-            for path in iglob(pattern)
++            for path in sorted(glob(pattern))
+             if not path.endswith('~')
+             and os.path.isfile(path)
+         )
diff --git a/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
index bb852d06522..a15b51e31c6 100644
--- a/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
@@ -8,9 +8,10 @@ inherit pypi setuptools3
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch \
+            file://reproducibility.patch"
 
-SRC_URI[sha256sum] = "7bb5652625e94e73b9358b7ed8c6431b732e80cf31f4e0972294c64f0e5b849e"
+SRC_URI[sha256sum] = "401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2

