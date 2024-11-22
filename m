Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6938E65D2F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 08:24:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19534.1732263849108895898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 00:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105672805c=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM52W4Q027771
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:24:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0pqc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:24:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 22 Nov 2024 00:24:06 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 22 Nov 2024 00:24:06 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [scarthgap][PATCH] python3-zipp: fix CVE-2024-5569
Date: Fri, 22 Nov 2024 17:21:49 +0800
Message-ID: <20241122092149.777566-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 329a0bg1K8PXoRC9QCpSF_Lpr-9Fmoi9
X-Proofpoint-GUID: 329a0bg1K8PXoRC9QCpSF_Lpr-9Fmoi9
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=67403fa8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=0DMlDUsRAAAA:8 a=EzIPuJ9VBWzW5zNX7UYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=168rQcPrDVj8xHztDHWJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-22_02,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=674 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411220069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207594

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
2.25.1


