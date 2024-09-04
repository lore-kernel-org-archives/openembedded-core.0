Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98F8CD37B4
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 11:55:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.48096.1725450935618781966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 04:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VI1eOqLX;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: rsangam@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2053525bd90so34105355ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725450934; x=1726055734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RuO+hPQ2Q7zldR1MOmWnqSkIZHM1oFU4XiZf56DenTY=;
        b=VI1eOqLXqxV+e9otjfNyTgVB04o/Rituu1uhhWOXL1Z7K8HsD/KpycQ5lSu380sagI
         rpQ7FWeDdo2oNneUkLlnhst4VtNMZYnILclpAVSIbmfbuuYx82egnW/t1cG5ijjXzY5S
         g4ZI8FSErAza70eyhhjAEHI6sgfYerMWQqlRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725450934; x=1726055734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuO+hPQ2Q7zldR1MOmWnqSkIZHM1oFU4XiZf56DenTY=;
        b=Pq2Oo5uUibM4ViyoU6uJsv0JUGyxl0lHm/JFIId7dB3s2F6mG9yeVhZnj1EIEYj5MZ
         1GSsPoH2OgLOyHXQxo/sNzd0TKO+RJTeLsdKdPTKYiHd3HevGAiYjqI1PkT3966MIeK9
         aBEpQXZFUPUu29iS0vZ2xOkh8O65yrFeKhJ+uXpwO+hpoYCH+FEoyGtTWWnI5t/bKkbT
         cgd+Z9OxP4JeRaMLy09YLRQPqxUnEDH8z98fDeiktik/49Y7CENEpZ3S6v+G1rpV9tgY
         KDZpz/j70taT8f4RlrBuhnHGP5UJUBeAi0ceeUGTuabfmSAyMcyaiIIynWUp4wv5jAw1
         kkOQ==
X-Gm-Message-State: AOJu0YyVMJiWWfz7fYNKc0Sv5rW2JjT2PQZunirlUgWTSttaKEcks8D3
	UrjaejlANCNaXDaS/v74XYCwqYiCslphx0mixMPIis5GqbrCVWz6rWoFFPt+FgYwiFJ9iEnXdMV
	A
X-Google-Smtp-Source: AGHT+IHGIVv8A1v2dDFtmx0SzYN0t3Uv2ghZk7AKY/Qxzm/pEGZ1QMXKW/x25onsW3LPuj4dX8A/1g==
X-Received: by 2002:a17:902:ce8e:b0:1fb:75b6:a40b with SMTP id d9443c01a7336-2054bc90992mr143258755ad.2.1725450934247;
        Wed, 04 Sep 2024 04:55:34 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.201.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae90cf63sm12433565ad.43.2024.09.04.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:55:33 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>,
	Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] python3: Security fix for CVE-2024-8088
Date: Wed,  4 Sep 2024 17:25:10 +0530
Message-Id: <20240904115510.695790-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 11:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204200

CVE fixed:
- CVE-2024-8088: python: cpython: denial of service in zipfile
Upstream-Status: Backport from https://github.com/python/cpython/commit/e0264a61119d551658d9445af38323ba94fc16db

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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


