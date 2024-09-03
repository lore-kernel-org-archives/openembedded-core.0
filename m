Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C78CCD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 12:51:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22344.1725367855093413801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 05:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99761bc802=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4834os8J004452
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Sep 2024 05:50:54 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41bxf4asc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 05:50:54 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 05:50:53 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 05:50:52 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] python3: Fix CVE-2024-8088
Date: Tue, 3 Sep 2024 12:50:49 +0000
Message-ID: <20240903125049.1362763-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OBntO4gxWItQefde7ygN7vXCCHRqjfFD
X-Authority-Analysis: v=2.4 cv=X8QAK3Te c=1 sm=1 tr=0 ts=66d7062e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=8AHkEIZyAAAA:8 a=sks2qJRycFtuEZz_4qYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OBntO4gxWItQefde7ygN7vXCCHRqjfFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=735 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2409030104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 12:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204160

From: Soumya Sambu <soumya.sambu@windriver.com>

There is a HIGH severity vulnerability affecting the CPython "zipfile"
module. When iterating over names of entries in a zip archive (for example,
methodsof "zipfile.ZipFile" like "namelist()", "iterdir()", "extractall()",
etc) the process can be put into an infinite loop with a maliciously crafted
zip archive. This defect applies when reading only metadata or extracting
the contents of the zip archive. Programs that are not handling
user-controlled zip archives are not affected.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-8088

Upstream-Patch:
https://github.com/corydolphin/flask-cors/commit/7ae310c56ac30e0b94fb42129aa377bf633256ec

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python/python3/CVE-2024-8088.patch        | 128 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.4.bb |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch b/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
new file mode 100644
index 0000000000..13836f1ccc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
@@ -0,0 +1,128 @@
+From dcc5182f27c1500006a1ef78e10613bb45788dea Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 12 Aug 2024 02:35:17 +0200
+Subject: [PATCH] gh-122905: Sanitize names in zipfile.Path. (GH-122906)
+ (#122923)
+
+CVE: CVE-2024-8088
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/dcc5182f27c1500006a1ef78e10613bb45788dea]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ Lib/test/test_zipfile/_path/test_path.py      | 17 +++++
+ Lib/zipfile/_path/__init__.py                 | 64 ++++++++++++++++++-
+ ...-08-11-14-08-04.gh-issue-122905.7tDsxA.rst |  1 +
+ 3 files changed, 81 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
+
+diff --git a/Lib/test/test_zipfile/_path/test_path.py b/Lib/test/test_zipfile/_path/test_path.py
+index 06d5aab..90885db 100644
+--- a/Lib/test/test_zipfile/_path/test_path.py
++++ b/Lib/test/test_zipfile/_path/test_path.py
+@@ -577,3 +577,20 @@ class TestPath(unittest.TestCase):
+         zipfile.Path(alpharep)
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
+diff --git a/Lib/zipfile/_path/__init__.py b/Lib/zipfile/_path/__init__.py
+index 78c4135..42f9fde 100644
+--- a/Lib/zipfile/_path/__init__.py
++++ b/Lib/zipfile/_path/__init__.py
+@@ -83,7 +83,69 @@ class InitializedState:
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
+diff --git a/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst b/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
+new file mode 100644
+index 0000000..1be44c9
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
+@@ -0,0 +1 @@
++:class:`zipfile.Path` objects now sanitize names from the zipfile.
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 9199edce3d..3ac83166ac 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://CVE-2024-7592.patch \
+           file://CVE-2024-8088.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.40.0


