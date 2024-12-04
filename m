Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E53E77177
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:45 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.21199.1733334882198012579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EKKPkXmy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fc41dab8e3so44449a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334881; x=1733939681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt3YufxJL9R0pNeX5OI5idN5vabHURhspFukmMXrxR8=;
        b=EKKPkXmymIGOmUHreQo5D5UFhe6UzFAe42Pt0qJJ/UXmgSYSrX3clEr+f46AlvBSbT
         67JKzrSytG1Th4nURo2DS/hIW28k6AvN4tk/GD0HppwS3ESgQiupZRp7MS4As3iUz7Sr
         /p+/4eNfTD2pTq8GGTdnkvXilt0DPmitOVrpJlYsMIyLpLnO4JjsCqJ+NdHeCRtDcx0k
         2wA0toP3rV6sEdavF+9o6oqtDrP8UinLaa7Uk6iQz7luHOoh2iNCt1bNNY/NoDS3QR1p
         85BNl1jcI6QjDFN3Gv0QZIYVSkyJiMaMWq+Tvz/lvBGnfmn3ag6C8mwVfL580RvWgv4c
         lZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334881; x=1733939681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pt3YufxJL9R0pNeX5OI5idN5vabHURhspFukmMXrxR8=;
        b=cWxSfnjOujHyrqKZGDh0p36pkzjp86aznmJfb8FYdwr+NbU1KJbnKyIb+0l8bpTson
         c1o2liTrH4Xr2DkAohImL5KgyJZuyGKhVNuzITt7eDNa69Q0gdgZxuWDZlCWcCmt5/8S
         EwT4B1xWwFO14EHYu0wvMkVKoSg3K0EkkL2OctMrf719zYnqWdgwq6QljHAoJbUiAbAX
         zF8eSGKI9xXkOfzX7sJGAksKqqgup2LKyrw2cAoJfDPyzVBQTOpoA5Pi+7GUP1GEbH3d
         F6Txk8/rU3KdCZPw1DN2LXVSr8Hpj73PS4lBG79L9AwvoIa2ktb7Ir8207GtfK8XH6TX
         Zi8w==
X-Gm-Message-State: AOJu0YwAQh0qFPYXCXLrLHrxjs+q6R3221CdzeAbKFZSWKraypQMciKf
	jpGTvj3e/vPjz/4Xbj+0JN8jOxW+JFg1XkemZ5d0QMzwPxdDwsUIR2qfjkgL0f5W8m1SHCDMdQ7
	m
X-Gm-Gg: ASbGncvlYIt2Anozc/Z4Jgwl4yt6zvmQEX3rmS1iqstdfGxCAiw8j8ake8r0laeNawq
	py7tDdpjpdw9X8c3KjeLnoxDFvHasfk51dhODLhTuz7y6PUl7tNtl7nrZP7QhoCnlDGBlsWMsU1
	5buVoubiHiFgm0gKHTLJhISWDiA81Co6zad4FwHrfD7KWGWbGzBAqZbZWOuzcK2j/K3JFh4I64L
	B09Hqf+NE0/7XDtxv9S036/MfvsuWkcJ6YeJT4=
X-Google-Smtp-Source: AGHT+IFl1PKkY5VQcQBdPDjSEr4BEWFfM51jIbpCKG3PjQfaYjZrUv5Ng2CwHMBAqbDOk+0xHdqAtg==
X-Received: by 2002:a05:6a20:c706:b0:1e0:d17e:e8c2 with SMTP id adf61e73a8af0-1e1653a2a57mr9988836637.5.1733334881239;
        Wed, 04 Dec 2024 09:54:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/38] python3-zipp: fix CVE-2024-5569
Date: Wed,  4 Dec 2024 09:53:42 -0800
Message-Id: <13bd99e17f0aca108839e81e9aa0b14351116fdf.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208298

From: Hongxu Jia <hongxu.jia@windriver.com>

According to [1] which provided the fix link [2], but upstream author
reworked it later [3][4][5]

Backport and rebase all the patches for tracing

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-5569
[2] https://github.com/jaraco/zipp/commit/fd604bd34f0343472521a36da1fbd22e793e14fd
[3] https://github.com/jaraco/zipp/commit/3cb5609002263eb19f7b5efda82d96f1f57fe876
[4] https://github.com/jaraco/zipp/commit/f89b93f0370dd85d23d243e25dfc1f99f4d8de48
[5] https://github.com/jaraco/zipp/commit/cc61e6140f0dfde2ff372db932442cf6df890f09

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Add-SanitizedNames-mixin.patch       | 89 +++++++++++++++++
 ...Names-in-CompleteDirs.-Fixes-broken-.patch | 30 ++++++
 .../0003-Removed-SanitizedNames.patch         | 95 +++++++++++++++++++
 ...-loop-when-zipfile-begins-with-more-.patch | 48 ++++++++++
 ...ath.rstrip-to-consolidate-checks-for.patch | 30 ++++++
 .../python/python3-zipp_3.7.0.bb              |  8 ++
 6 files changed, 300 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch

diff --git a/meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch b/meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch
new file mode 100644
index 0000000000..a352e7b9bd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch
@@ -0,0 +1,89 @@
+From ef2227e35d1ae833b7bfa1674a45f58c732ae1a6 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Wed, 27 Nov 2024 23:27:57 -0800
+Subject: [PATCH 1/5] Add SanitizedNames mixin.
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/564fcc10cdbfdaecdb33688e149827465931c9e0]
+CVE: CVE-2024-5569
+Rebase to v3.7.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp.py | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 62 insertions(+)
+
+diff --git a/zipp.py b/zipp.py
+index 26b723c..8f0950f 100644
+--- a/zipp.py
++++ b/zipp.py
+@@ -68,6 +68,68 @@ def _difference(minuend, subtrahend):
+     return itertools.filterfalse(set(subtrahend).__contains__, minuend)
+ 
+ 
++class SanitizedNames:
++    """
++    ZipFile mix-in to ensure names are sanitized.
++    """
++
++    def namelist(self):
++        return list(map(self._sanitize, super().namelist()))
++
++    @staticmethod
++    def _sanitize(name):
++        r"""
++        Ensure a relative path with posix separators and no dot names.
++
++        Modeled after
++        https://github.com/python/cpython/blob/bcc1be39cb1d04ad9fc0bd1b9193d3972835a57c/Lib/zipfile/__init__.py#L1799-L1813
++        but provides consistent cross-platform behavior.
++
++        >>> san = SanitizedNames._sanitize
++        >>> san('/foo/bar')
++        'foo/bar'
++        >>> san('//foo.txt')
++        'foo.txt'
++        >>> san('foo/.././bar.txt')
++        'foo/bar.txt'
++        >>> san('foo../.bar.txt')
++        'foo../.bar.txt'
++        >>> san('\\foo\\bar.txt')
++        'foo/bar.txt'
++        >>> san('D:\\foo.txt')
++        'D/foo.txt'
++        >>> san('\\\\server\\share\\file.txt')
++        'server/share/file.txt'
++        >>> san('\\\\?\\GLOBALROOT\\Volume3')
++        '?/GLOBALROOT/Volume3'
++        >>> san('\\\\.\\PhysicalDrive1\\root')
++        'PhysicalDrive1/root'
++
++        Retain any trailing slash.
++        >>> san('abc/')
++        'abc/'
++
++        Raises a ValueError if the result is empty.
++        >>> san('../..')
++        Traceback (most recent call last):
++        ...
++        ValueError: Empty filename
++        """
++
++        def allowed(part):
++            return part and part not in {'..', '.'}
++
++        # Remove the drive letter.
++        # Don't use ntpath.splitdrive, because that also strips UNC paths
++        bare = re.sub('^([A-Z]):', r'\1', name, flags=re.IGNORECASE)
++        clean = bare.replace('\\', '/')
++        parts = clean.split('/')
++        joined = '/'.join(filter(allowed, parts))
++        if not joined:
++            raise ValueError("Empty filename")
++        return joined + '/' * name.endswith('/')
++
++
+ class CompleteDirs(zipfile.ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch b/meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch
new file mode 100644
index 0000000000..d2ea4d49a1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch
@@ -0,0 +1,30 @@
+From 8b09dbf95b3ba78a63f220941e31ac92f4ad192c Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Wed, 27 Nov 2024 23:31:57 -0800
+Subject: [PATCH 2/5] Employ SanitizedNames in CompleteDirs. Fixes broken test.
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/58115d2be968644ce71ce6bcc9b79826c82a1806]
+Remove test code
+Rebase to v3.7.0
+CVE: CVE-2024-5569
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zipp.py b/zipp.py
+index 8f0950f..29d2572 100644
+--- a/zipp.py
++++ b/zipp.py
+@@ -130,7 +130,7 @@ class SanitizedNames:
+         return joined + '/' * name.endswith('/')
+ 
+ 
+-class CompleteDirs(zipfile.ZipFile):
++class CompleteDirs(SanitizedNames, zipfile.ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+     are always included in the namelist.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch b/meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch
new file mode 100644
index 0000000000..45a7dc5bb1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch
@@ -0,0 +1,95 @@
+From b52b8af403e64607ae8d5e4cd18d4099d63e7264 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Wed, 27 Nov 2024 23:33:11 -0800
+Subject: [PATCH 3/5] Removed SanitizedNames.
+
+Restores expectations around special characters in zipfiles, but also restores the infinite loop.
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/3cb5609002263eb19f7b5efda82d96f1f57fe876]
+Remove test codes
+Rebase to v3.7.0
+CVE: CVE-2024-5569
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp.py | 64 +--------------------------------------------------------
+ 1 file changed, 1 insertion(+), 63 deletions(-)
+
+diff --git a/zipp.py b/zipp.py
+index 29d2572..26b723c 100644
+--- a/zipp.py
++++ b/zipp.py
+@@ -68,69 +68,7 @@ def _difference(minuend, subtrahend):
+     return itertools.filterfalse(set(subtrahend).__contains__, minuend)
+ 
+ 
+-class SanitizedNames:
+-    """
+-    ZipFile mix-in to ensure names are sanitized.
+-    """
+-
+-    def namelist(self):
+-        return list(map(self._sanitize, super().namelist()))
+-
+-    @staticmethod
+-    def _sanitize(name):
+-        r"""
+-        Ensure a relative path with posix separators and no dot names.
+-
+-        Modeled after
+-        https://github.com/python/cpython/blob/bcc1be39cb1d04ad9fc0bd1b9193d3972835a57c/Lib/zipfile/__init__.py#L1799-L1813
+-        but provides consistent cross-platform behavior.
+-
+-        >>> san = SanitizedNames._sanitize
+-        >>> san('/foo/bar')
+-        'foo/bar'
+-        >>> san('//foo.txt')
+-        'foo.txt'
+-        >>> san('foo/.././bar.txt')
+-        'foo/bar.txt'
+-        >>> san('foo../.bar.txt')
+-        'foo../.bar.txt'
+-        >>> san('\\foo\\bar.txt')
+-        'foo/bar.txt'
+-        >>> san('D:\\foo.txt')
+-        'D/foo.txt'
+-        >>> san('\\\\server\\share\\file.txt')
+-        'server/share/file.txt'
+-        >>> san('\\\\?\\GLOBALROOT\\Volume3')
+-        '?/GLOBALROOT/Volume3'
+-        >>> san('\\\\.\\PhysicalDrive1\\root')
+-        'PhysicalDrive1/root'
+-
+-        Retain any trailing slash.
+-        >>> san('abc/')
+-        'abc/'
+-
+-        Raises a ValueError if the result is empty.
+-        >>> san('../..')
+-        Traceback (most recent call last):
+-        ...
+-        ValueError: Empty filename
+-        """
+-
+-        def allowed(part):
+-            return part and part not in {'..', '.'}
+-
+-        # Remove the drive letter.
+-        # Don't use ntpath.splitdrive, because that also strips UNC paths
+-        bare = re.sub('^([A-Z]):', r'\1', name, flags=re.IGNORECASE)
+-        clean = bare.replace('\\', '/')
+-        parts = clean.split('/')
+-        joined = '/'.join(filter(allowed, parts))
+-        if not joined:
+-            raise ValueError("Empty filename")
+-        return joined + '/' * name.endswith('/')
+-
+-
+-class CompleteDirs(SanitizedNames, zipfile.ZipFile):
++class CompleteDirs(zipfile.ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+     are always included in the namelist.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch b/meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch
new file mode 100644
index 0000000000..46871122a9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch
@@ -0,0 +1,48 @@
+From ef4ee19919bd49a9c1207ff8d87f83dd48aed436 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Wed, 27 Nov 2024 23:35:28 -0800
+Subject: [PATCH 4/5] Address infinite loop when zipfile begins with more than
+ one leading slash.
+
+Alternate and more surgical fix for jaraco/zipp#119. Ref python/cpython#123270
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/f89b93f0370dd85d23d243e25dfc1f99f4d8de48]
+Remove test codes
+Rebase to v3.7.0
+CVE: CVE-2024-5569
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp.py | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/zipp.py b/zipp.py
+index 26b723c..236af49 100644
+--- a/zipp.py
++++ b/zipp.py
+@@ -37,7 +37,7 @@ def _parents(path):
+ def _ancestry(path):
+     """
+     Given a path with elements separated by
+-    posixpath.sep, generate all elements of that path
++    posixpath.sep, generate all elements of that path.
+ 
+     >>> list(_ancestry('b/d'))
+     ['b/d', 'b']
+@@ -49,9 +49,13 @@ def _ancestry(path):
+     ['b']
+     >>> list(_ancestry(''))
+     []
++    Multiple separators are treated like a single.
++
++    >>> list(_ancestry('//b//d///f//'))
++    ['//b//d///f', '//b//d', '//b']
+     """
+     path = path.rstrip(posixpath.sep)
+-    while path and path != posixpath.sep:
++    while path and not path.endswith(posixpath.sep):
+         yield path
+         path, tail = posixpath.split(path)
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch b/meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch
new file mode 100644
index 0000000000..de91c68361
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch
@@ -0,0 +1,30 @@
+From 9084bc59784cb240628996c1cb95f4f786ebedcc Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Wed, 27 Nov 2024 23:38:28 -0800
+Subject: [PATCH 5/5] Prefer simpler path.rstrip to consolidate checks for
+ empty or only paths.
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/cc61e6140f0dfde2ff372db932442cf6df890f09]
+Rebase to v3.7.0
+CVE: CVE-2024-5569
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zipp.py b/zipp.py
+index 236af49..87c4219 100644
+--- a/zipp.py
++++ b/zipp.py
+@@ -55,7 +55,7 @@ def _ancestry(path):
+     ['//b//d///f', '//b//d', '//b']
+     """
+     path = path.rstrip(posixpath.sep)
+-    while path and not path.endswith(posixpath.sep):
++    while path.rstrip(posixpath.sep):
+         yield path
+         path, tail = posixpath.split(path)
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
index 495e7f51f0..d9db1b4408 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
@@ -9,6 +9,14 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += " \
+    file://0001-Add-SanitizedNames-mixin.patch \
+    file://0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch \
+    file://0003-Removed-SanitizedNames.patch \
+    file://0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch \
+    file://0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch \
+"
+
 DEPENDS += "${PYTHON_PN}-toml-native"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-compression \
-- 
2.34.1


