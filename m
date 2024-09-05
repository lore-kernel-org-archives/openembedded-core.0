Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1521CD5BC0
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:41:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.8184.1725540077906353284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ft7AVHd3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20570b42f24so9961825ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725540077; x=1726144877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0PRZ8rAgkZM/pxYMYXVrAmpf0FHoTNNEWV57d5Y594=;
        b=Ft7AVHd3cZWSG3wNLpnoJxHBu+4yiYQ/DFaDwyWkJNAumTP8/NDtzciSXbwEPJO8se
         dYkI5gu7C0MLH1xHE95UPrVNtE9MjJ9AIu+hvhTMHJs/4YQ4SuiJYWr2pQdgVJFXycX4
         4txYYFSAAHrW04EyHll+CJbPIgy+ri+7h1NJv4FEhoFoZHJvTspdceVhyMoVFBs66G2T
         wwz/aywZPyQaF74wDIIFb7/YPPD89jNF6m30Umil/+JT3tacFK0uMpZWzACDtD0hD7UW
         3W5GYYCEpeOr7Sm+Zurg0xPz+PvvlRO28qHhn3IOUg4/gdruuuN/y8zvANqLpIyw8qdd
         fUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540077; x=1726144877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0PRZ8rAgkZM/pxYMYXVrAmpf0FHoTNNEWV57d5Y594=;
        b=GCHVTHRn+IdImOZWSPYT1OG/lplcIDyIznlEX+KhpUrRJVm3nCo511CkhMa/ljshyt
         Wpr2T7/RTiRjLaUJ6hgkxlX0bAfF4cd+8YGGEkd0wHHYMXvJjJS5fY4oCQWMuOPbhxfU
         iOlb8axfvzK9X779Srr9UtUC/cW/D+Q6qZ7/ic26LfK6Ww2uQVF/UHg7PdgprU9Ja4xB
         /CwMJrEh7J0HmqWctgRN5XPshkn4xUxepkKZWajSU+8PyOInOzy7t8jJ4iQMF1nzPZHA
         PD6by81stb8pAPUqih82UgVMSDpAgxiGcmL7I0PM9alKW0m/U5tGfuU48d5cBGwSLyUP
         ok6g==
X-Gm-Message-State: AOJu0YwUeYz8sryK7E1ueZ5+PM+/OyeaKgXR3zQaz2rJcGt4sr7mhkLc
	NIEL/Iat824B552BkrHpqQ9ys5dxFUdf9YF5w9miEGKBnEixYAQx6x6bsAQpoTgsAxYwxqjTf9i
	/NOg=
X-Google-Smtp-Source: AGHT+IFcWbu2m8lPCiIWIUn44Z7mNKh4wixd13GwBdUpSuGbgczc25pnnpKEXAFemn9Hbe+VB5/k4Q==
X-Received: by 2002:a17:902:da8c:b0:206:98c8:4a71 with SMTP id d9443c01a7336-20699afc7f3mr114532165ad.38.1725540077115;
        Thu, 05 Sep 2024 05:41:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38c31sm28107265ad.151.2024.09.05.05.41.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:41:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] python3: Security fix for CVE-2024-8088
Date: Thu,  5 Sep 2024 05:41:00 -0700
Message-Id: <295addec33c83443423a3ef87905c3a70f44a4e7.1725539924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725539924.git.steve@sakoman.com>
References: <cover.1725539924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 12:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204235

From: Rohini Sangam <rsangam@mvista.com>

CVE fixed:
- CVE-2024-8088: python: cpython: denial of service in zipfile
Upstream-Status: Backport from https://github.com/python/cpython/commit/e0264a61119d551658d9445af38323ba94fc16db

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2024-8088.patch        | 124 ++++++++++++++++++
 .../python/python3_3.10.14.bb                 |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch b/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
new file mode 100644
index 0000000000..10d28a9e65
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
@@ -0,0 +1,124 @@
+From e0264a61119d551658d9445af38323ba94fc16db Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Thu, 22 Aug 2024 19:24:33 -0400
+Subject: [PATCH] CVE-2024-8088: Sanitize names in zipfile.Path. (GH-122906)
+
+Upstream-Status: Backport from https://github.com/python/cpython/commit/e0264a61119d551658d9445af38323ba94fc16db
+CVE: CVE-2024-8088
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ Lib/test/test_zipfile.py   | 17 ++++++
+ Lib/zipfile.py             | 61 ++++++++++++++++++-
+ 2 files changed, 77 insertions(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_zipfile.py b/Lib/test/test_zipfile.py
+index 32c0170..a60dc11 100644
+--- a/Lib/test/test_zipfile.py
++++ b/Lib/test/test_zipfile.py
+@@ -3280,6 +3280,23 @@ with zipfile.ZipFile(io.BytesIO(), "w") as zf:
+         zipfile.Path(zf)
+         zf.extractall(source_path.parent)
+ 
++    def test_malformed_paths(self):
++        """
++        Path should handle malformed paths.
++        """
++        data = io.BytesIO()
++        zf = zipfile.ZipFile(data, "w")
++        zf.writestr("/one-slash.txt", b"content")
++        zf.writestr("//two-slash.txt", b"content")
++        zf.writestr("../parent.txt", b"content")
++        zf.filename = ''
++        root = zipfile.Path(zf)
++        assert list(map(str, root.iterdir())) == [
++            'one-slash.txt',
++            'two-slash.txt',
++            'parent.txt',
++        ]
++
+ 
+ class StripExtraTests(unittest.TestCase):
+     # Note: all of the "z" characters are technically invalid, but up
+diff --git a/Lib/zipfile.py b/Lib/zipfile.py
+index 7d18bc2..cbac8d9 100644
+--- a/Lib/zipfile.py
++++ b/Lib/zipfile.py
+@@ -9,6 +9,7 @@ import io
+ import itertools
+ import os
+ import posixpath
++import re
+ import shutil
+ import stat
+ import struct
+@@ -2182,7 +2183,65 @@ def _difference(minuend, subtrahend):
+     return itertools.filterfalse(set(subtrahend).__contains__, minuend)
+ 
+ 
+-class CompleteDirs(ZipFile):
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
++        Modeled after
++        https://github.com/python/cpython/blob/bcc1be39cb1d04ad9fc0bd1b9193d3972835a57c/Lib/zipfile/__init__.py#L1799-L1813
++        but provides consistent cross-platform behavior.
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
++        Retain any trailing slash.
++        >>> san('abc/')
++        'abc/'
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
++class CompleteDirs(SanitizedNames, ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+     are always included in the namelist.
+-- 
+2.35.7
+
diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes-devtools/python/python3_3.10.14.bb
index b5bc80ab88..14ab3f6155 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
+	   file://CVE-2024-8088.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


