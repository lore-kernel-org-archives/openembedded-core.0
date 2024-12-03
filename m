Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C449E64A97
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:34 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.19579.1733233050527642410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dbel5ROt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21572ca3cccso24676975ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233050; x=1733837850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Y8uTAisc/YWKFOj5iCEx/HCA8u7jm/RlidoOFbjIMw=;
        b=dbel5ROtNO47ottUmjmJXnsXkXtEOdUG+q1jgAtGsk6m4WDQMvRxHvkF9TEFHbNiBN
         uPpWjIL2CRmHrYsoPuBqdrzlCKPmUIKrniCR0uvcr004N6r90MjMdFl74VJAGD5nDNcd
         yjyfAch4TbhX1VqP1smAlfxkaGxkFopj8YV1y3PfY4foye2Ogqv5dt6VzVXl4DqlwkrA
         SivSocn4bWs7vQOYR9uDhf1aARFponJb1dzdQ+6qrpjl0/7HvTM2fWchnr1rUr5GliqH
         i0UrcRUrxXmYphgxTETsyvYycRyHM6OwCl307zZBmyNRqddxt2rkPDxZuoJg4DA1nZvh
         Twzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233050; x=1733837850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Y8uTAisc/YWKFOj5iCEx/HCA8u7jm/RlidoOFbjIMw=;
        b=kI0kj4IfSR9ODzz5E59pSXx5ixFw7p9e8GkW8Oys/zCFT3ORCVivWqo3fj1RXA9rKL
         QmfUIMnv7GUS8XyYBs4oskanWeFJgBaw4LEb9Xxz41iSCeTXfACssPnqjv1d9Jd74p4f
         uBOGrpiNdpzo/WMtOml1o/LPGt3Ysv38TGKimE9UOFPVsugpu7Dl5oT2KAAdjZ+2RvPF
         9Ap4EUHYwnpisiG6WUCLuCP+D7/Y4Kaa2N+pR7azBVIjW9M1zCip67JcB43N11f1Ql3J
         gMmUf/EWQlDK03uFf3Voqs2xbtrWgEKNfZxZw75UGqXSOjkUiUj11iWRq3s/2SCozgjh
         WNCA==
X-Gm-Message-State: AOJu0YyJqOaec4Sbnpt9YdxEbDa0hxJQvgs0/5SLU2cJPGjbSztpTRpm
	FAGdMJj+H3TmX64rtXgdFyUoDd86Ss4G7yHOC7x4LUvuDsdR79IIxP6sCpiGGETzBf79eaoagyp
	f
X-Gm-Gg: ASbGnctMEnCpWY97ThHar4H64cuUxZqx8BDWmUVfrnYmWvAz9cWDYcu8S6/IjCr+pKp
	t4htd06n+4Nuv0vcQI6uUS2bizzClnV4qYQfBcNEX3CGAUdTGjPmSuDWanPSqYC2h7+0JXBnM4+
	HBR+kiyx1+axSWmXu0hS4QfVFDfoEFQus/3YX4/8LD5xO034P20t9S/LC3Y9Mzsn1P/iqMcW37T
	EJzlmIbHy/axTvgup1BRfloXugSsjfi96svoyA=
X-Google-Smtp-Source: AGHT+IHv33axVJ8ZYevgD+fubojq/L5PkuUQZzRonhGrFLwkRz3gz25z+LBvjuNr7tsUlv0R2Yapcg==
X-Received: by 2002:a17:902:f688:b0:215:a964:e680 with SMTP id d9443c01a7336-215bd200355mr28964585ad.25.1733233049786;
        Tue, 03 Dec 2024 05:37:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/16] python3-zipp: fix CVE-2024-5569
Date: Tue,  3 Dec 2024 05:37:05 -0800
Message-Id: <ec77cfe12f0790c7e3cf2d9bf00e47b4c653997c.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208190

From: Jiaying Song <jiaying.song.cn@windriver.com>

A Denial of Service (DoS) vulnerability exists in the jaraco/zipp
library, affecting all versions prior to 3.19.1. The vulnerability is
triggered when processing a specially crafted zip file that leads to an
infinite loop. This issue also impacts the zipfile module of CPython, as
features from the third-party zipp library are later merged into
CPython, and the affected code is identical in both projects. The
infinite loop can be initiated through the use of functions affecting
the `Path` module in both zipp and zipfile, such as `joinpath`, the
overloaded division operator, and `iterdir`. Although the infinite loop
is not resource exhaustive, it prevents the application from responding.
The vulnerability was addressed in version 3.19.1 of jaraco/zipp.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-5569

Upstream patches:
https://github.com/jaraco/zipp/pull/120/commits/79a309fe54dc6b7934fb72e9f31bcb58f2e9f547
https://github.com/jaraco/zipp/pull/120/commits/564fcc10cdbfdaecdb33688e149827465931c9e0
https://github.com/jaraco/zipp/pull/120/commits/58115d2be968644ce71ce6bcc9b79826c82a1806
https://github.com/jaraco/zipp/pull/120/commits/c18417ed2953e181728a7dac07bff88a2190abf7

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3-zipp/CVE-2024-5569.patch   | 138 ++++++++++++++++++
 .../python/python3-zipp_3.17.0.bb             |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-zipp/CVE-2024-5569.patch

diff --git a/meta/recipes-devtools/python/python3-zipp/CVE-2024-5569.patch b/meta/recipes-devtools/python/python3-zipp/CVE-2024-5569.patch
new file mode 100644
index 0000000000..1cc43243bf
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/CVE-2024-5569.patch
@@ -0,0 +1,138 @@
+From b1804347ec2db16452a7bff2b469d2c66776b904 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Fri, 31 May 2024 11:20:57 -0400
+Subject: [PATCH] fix CVE-2024-5569
+
+The patch includes the following changes:
+c18417e Add news fragment.
+58115d2 Employ SanitizedNames in CompleteDirs. Fixes broken test.
+564fcc1 Add SanitizedNames mixin.
+79a309f Add some assertions about malformed paths.
+
+Upstream-Status: Backport
+[https://github.com/jaraco/zipp/pull/120/commits/79a309fe54dc6b7934fb72e9f31bcb58f2e9f547]
+[https://github.com/jaraco/zipp/pull/120/commits/564fcc10cdbfdaecdb33688e149827465931c9e0]
+[https://github.com/jaraco/zipp/pull/120/commits/58115d2be968644ce71ce6bcc9b79826c82a1806]
+[https://github.com/jaraco/zipp/pull/120/commits/c18417ed2953e181728a7dac07bff88a2190abf7]
+
+CVE: CVE-2024-5569
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ newsfragments/119.bugfix.rst |  1 +
+ tests/test_path.py           | 17 ++++++++++
+ zipp/__init__.py             | 64 +++++++++++++++++++++++++++++++++++-
+ 3 files changed, 81 insertions(+), 1 deletion(-)
+ create mode 100644 newsfragments/119.bugfix.rst
+
+diff --git a/newsfragments/119.bugfix.rst b/newsfragments/119.bugfix.rst
+new file mode 100644
+index 0000000..6c72e2d
+--- /dev/null
++++ b/newsfragments/119.bugfix.rst
+@@ -0,0 +1 @@
++Improved handling of malformed zip files.
+\ No newline at end of file
+diff --git a/tests/test_path.py b/tests/test_path.py
+index a77a5de..3752243 100644
+--- a/tests/test_path.py
++++ b/tests/test_path.py
+@@ -575,3 +575,20 @@ class TestPath(unittest.TestCase):
+         zipp.Path(alpharep)
+         with self.assertRaises(KeyError):
+             alpharep.getinfo('does-not-exist')
++    
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
+diff --git a/zipp/__init__.py b/zipp/__init__.py
+index becd010..e980e9b 100644
+--- a/zipp/__init__.py
++++ b/zipp/__init__.py
+@@ -84,7 +84,69 @@ class InitializedState:
+         super().__init__(*args, **kwargs)
+ 
+ 
+-class CompleteDirs(InitializedState, zipfile.ZipFile):
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
++class CompleteDirs(InitializedState, SanitizedNames, zipfile.ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+     are always included in the namelist.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb b/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
index e9e220e315..9f756887b5 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
+SRC_URI += "file://CVE-2024-5569.patch"
 SRC_URI[sha256sum] = "84e64a1c28cf7e91ed2078bb8cc8c259cb19b76942096c8d7b84947690cabaf0"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.34.1


