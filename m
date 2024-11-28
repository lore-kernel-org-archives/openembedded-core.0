Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF187D66BAF
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 06:49:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.89958.1732776563845004452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 22:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1062761e67=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS6ZFEW030852
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 06:49:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671b0q07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 06:49:22 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 22:49:21 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 22:49:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] python3-zipp: fix CVE-2024-5569
Date: Thu, 28 Nov 2024 14:49:20 +0800
Message-ID: <20241128064920.139214-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vThH24FpKj4HTSeZ3Z4cCW2aENd4OiGg
X-Proofpoint-ORIG-GUID: vThH24FpKj4HTSeZ3Z4cCW2aENd4OiGg
X-Authority-Analysis: v=2.4 cv=TIe/S0la c=1 sm=1 tr=0 ts=67481272 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=0DMlDUsRAAAA:8 a=0UIqs_TCDM9Tqfb3_acA:9
 a=cmuagjC9wImHlllo:21 a=FdTzh2GWekK77mhwV6Dw:22 a=168rQcPrDVj8xHztDHWJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_06,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=793 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2411280052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 06:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207976

According to [1] which provided the fix link [2], but upstream author
reworked it later [3][4][5]

Backport all the patches for tracing

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-5569
[2] https://github.com/jaraco/zipp/commit/fd604bd34f0343472521a36da1fbd22e793e14fd
[3] https://github.com/jaraco/zipp/commit/3cb5609002263eb19f7b5efda82d96f1f57fe876
[4] https://github.com/jaraco/zipp/commit/f89b93f0370dd85d23d243e25dfc1f99f4d8de48
[5] https://github.com/jaraco/zipp/commit/cc61e6140f0dfde2ff372db932442cf6df890f09

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Add-SanitizedNames-mixin.patch       | 88 ++++++++++++++++++
 ...Names-in-CompleteDirs.-Fixes-broken-.patch | 28 ++++++
 .../0003-Removed-SanitizedNames.patch         | 92 +++++++++++++++++++
 ...-loop-when-zipfile-begins-with-more-.patch | 47 ++++++++++
 ...ath.rstrip-to-consolidate-checks-for.patch | 28 ++++++
 .../python/python3-zipp_3.17.0.bb             |  8 ++
 6 files changed, 291 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch

diff --git a/meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch b/meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch
new file mode 100644
index 0000000000..13cfcd98db
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch
@@ -0,0 +1,88 @@
+From bbdbd3afc6748eb09e4f98e53549c0b9e90c6221 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Fri, 31 May 2024 11:56:42 -0400
+Subject: [PATCH 1/5] Add SanitizedNames mixin.
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/564fcc10cdbfdaecdb33688e149827465931c9e0]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp/__init__.py | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 62 insertions(+)
+
+diff --git a/zipp/__init__.py b/zipp/__init__.py
+index becd010..6c3e0c2 100644
+--- a/zipp/__init__.py
++++ b/zipp/__init__.py
+@@ -84,6 +84,68 @@ class InitializedState:
+         super().__init__(*args, **kwargs)
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
+ class CompleteDirs(InitializedState, zipfile.ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch b/meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch
new file mode 100644
index 0000000000..f6911bfb76
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch
@@ -0,0 +1,28 @@
+From 32fda539edd83403a96537a9d9fbcd797bd53b0f Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Thu, 28 Nov 2024 14:07:33 +0800
+Subject: [PATCH 2/5] Employ SanitizedNames in CompleteDirs. Fixes broken test.
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/58115d2be968644ce71ce6bcc9b79826c82a1806]
+Remove test code
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zipp/__init__.py b/zipp/__init__.py
+index 6c3e0c2..e980e9b 100644
+--- a/zipp/__init__.py
++++ b/zipp/__init__.py
+@@ -146,7 +146,7 @@ class SanitizedNames:
+         return joined + '/' * name.endswith('/')
+ 
+ 
+-class CompleteDirs(InitializedState, zipfile.ZipFile):
++class CompleteDirs(InitializedState, SanitizedNames, zipfile.ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+     are always included in the namelist.
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch b/meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch
new file mode 100644
index 0000000000..689bb4a303
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch
@@ -0,0 +1,92 @@
+From b71f159320a971349fee88ee183bd0afaf088569 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Thu, 28 Nov 2024 14:10:17 +0800
+Subject: [PATCH 3/5] Removed SanitizedNames.
+
+Restores expectations around special characters in zipfiles, but also restores the infinite loop.
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/3cb5609002263eb19f7b5efda82d96f1f57fe876]
+Remove test codes
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp/__init__.py | 64 +-----------------------------------------------
+ 1 file changed, 1 insertion(+), 63 deletions(-)
+
+diff --git a/zipp/__init__.py b/zipp/__init__.py
+index e980e9b..becd010 100644
+--- a/zipp/__init__.py
++++ b/zipp/__init__.py
+@@ -84,69 +84,7 @@ class InitializedState:
+         super().__init__(*args, **kwargs)
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
+-class CompleteDirs(InitializedState, SanitizedNames, zipfile.ZipFile):
++class CompleteDirs(InitializedState, zipfile.ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+     are always included in the namelist.
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch b/meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch
new file mode 100644
index 0000000000..95e30be55f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch
@@ -0,0 +1,47 @@
+From a92d9a4fcdfe510befcbe182db5f1982f9839d2d Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Thu, 28 Nov 2024 14:12:38 +0800
+Subject: [PATCH 4/5] Address infinite loop when zipfile begins with more than
+ one leading slash.
+
+Alternate and more surgical fix for jaraco/zipp#119. Ref python/cpython#123270
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/f89b93f0370dd85d23d243e25dfc1f99f4d8de48]
+Remove test codes
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp/__init__.py | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/zipp/__init__.py b/zipp/__init__.py
+index becd010..e43d1de 100644
+--- a/zipp/__init__.py
++++ b/zipp/__init__.py
+@@ -35,7 +35,7 @@ def _parents(path):
+ def _ancestry(path):
+     """
+     Given a path with elements separated by
+-    posixpath.sep, generate all elements of that path
++    posixpath.sep, generate all elements of that path.
+ 
+     >>> list(_ancestry('b/d'))
+     ['b/d', 'b']
+@@ -47,9 +47,14 @@ def _ancestry(path):
+     ['b']
+     >>> list(_ancestry(''))
+     []
++
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
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch b/meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch
new file mode 100644
index 0000000000..81468d4143
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch
@@ -0,0 +1,28 @@
+From 5b4e4ff80e46d786ca1ebd726b399e6301d5c231 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Mon, 26 Aug 2024 11:46:25 -0400
+Subject: [PATCH 5/5] Prefer simpler path.rstrip to consolidate checks for
+ empty or only paths.
+
+Upstream-Status: Backport [https://github.com/jaraco/zipp/commit/cc61e6140f0dfde2ff372db932442cf6df890f09]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ zipp/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zipp/__init__.py b/zipp/__init__.py
+index e43d1de..3d93e1e 100644
+--- a/zipp/__init__.py
++++ b/zipp/__init__.py
+@@ -54,7 +54,7 @@ def _ancestry(path):
+     ['//b//d///f', '//b//d', '//b']
+     """
+     path = path.rstrip(posixpath.sep)
+-    while path and not path.endswith(posixpath.sep):
++    while path.rstrip(posixpath.sep):
+         yield path
+         path, tail = posixpath.split(path)
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb b/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
index e9e220e315..eea7a17f88 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
@@ -9,6 +9,14 @@ DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += " \
+    file://0001-Add-SanitizedNames-mixin.patch \
+    file://0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch \
+    file://0003-Removed-SanitizedNames.patch \
+    file://0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch \
+    file://0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch \
+"
+
 DEPENDS += "python3-toml-native"
 
 RDEPENDS:${PN} += "python3-compression \
-- 
2.34.1


