Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AFCC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 05:39:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18393.1754458741223657352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 22:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=031357a4b5=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5765c0nB2751613
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Aug 2025 22:38:57 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7ggrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 22:38:57 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 5 Aug 2025 22:38:56 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 5 Aug 2025 22:38:55 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/1] python3: fix CVE-2025-8194
Date: Wed, 6 Aug 2025 11:08:44 +0530
Message-ID: <20250806053844.1525681-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=6892ea71 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8
 a=8AHkEIZyAAAA:8 a=t7CeM3EgAAAA:8 a=OMKkimDRAAAA:8 a=c8N9-dkt5CMoR-3fHJUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=6rNxHmeHjkgHr7B4uqBA:22
X-Proofpoint-GUID: 1RidHuHeE6PA64-y4r7exkxZvwLg6y9G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAzMyBTYWx0ZWRfXwtTAAr57pmkV
 r2ppxpL7vElti8+n/2U8W+fqgwJfbFsjBUrS67nUxbZlMPFoe0mMemrlehtJsbqv6xm1IXvNRvY
 BzuidALB93L6aciCmANdllQzCMGbWfrWwmIHufljy/DKNYjrGbeqMCR/tcXBCQjjaDSAeLFKFYv
 /y9XJjqDeNYHA5unmfXVw4Kvg2CJPWnOtbGGfxH9pDq4nV4J7MOw096arbXcZEzTvTyHRMcYrpT
 YtJF6TBpsNgVVgfBkL7yHCybrFh4ecxZA41A5luyLI5gvy7myuwCI/EnZMveAwHYplWzlVgOEYe
 ITexFous4iqjeRHAigHG3zwMKr1JFW0s3Jz+cfxJ1xot1S5cha8PXR0B21IciU=
X-Proofpoint-ORIG-GUID: 1RidHuHeE6PA64-y4r7exkxZvwLg6y9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5765c0nB2751613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 05:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221499

There is a defect in the CPython =E2=80=9Ctarfile=E2=80=9D module affecti=
ng the
=E2=80=9CTarFile=E2=80=9D extraction and entry enumeration APIs. The tar =
implementation
would process tar archives with negative offsets without error,
resulting in an infinite loop and deadlock during the parsing of
maliciously crafted tar archives. This vulnerability can be mitigated
by including the following patch after importing the =E2=80=9Ctarfile=E2=80=
=9D module:
https://gist.github.com/sethmlarson/1716ac5b82b73dbcbf23ad2eff8b33e1

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8194

Upstream-patch:
https://github.com/python/cpython/commit/cdae923ffe187d6ef916c0f665a31249=
619193fe

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../python/python3/CVE-2025-8194.patch        | 224 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.13.4.bb |   1 +
 2 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.pa=
tch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-8194.patch b/m=
eta/recipes-devtools/python/python3/CVE-2025-8194.patch
new file mode 100644
index 0000000000..28653e1843
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-8194.patch
@@ -0,0 +1,224 @@
+From cdae923ffe187d6ef916c0f665a31249619193fe Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 28 Jul 2025 17:59:33 +0200
+Subject: [PATCH] gh-130577: tarfile now validates archives to ensure mem=
ber
+ offsets are non-negative (GH-137027) (#137170)
+
+gh-130577: tarfile now validates archives to ensure member offsets are n=
on-negative (GH-137027)
+(cherry picked from commit 7040aa54f14676938970e10c5f74ea93cd56aa38)
+
+Co-authored-by: Alexander Urieles <aeurielesn@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+
+CVE: CVE-2025-8194
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/cdae=
923ffe187d6ef916c0f665a31249619193fe]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ Lib/tarfile.py                                |   3 +
+ Lib/test/test_tarfile.py                      | 156 ++++++++++++++++++
+ ...-07-23-00-35-29.gh-issue-130577.c7EITy.rst |   3 +
+ 3 files changed, 162 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issu=
e-130577.c7EITy.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 0980f6a..9ff9df6 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1636,6 +1636,9 @@ class TarInfo(object):
+         """Round up a byte count by BLOCKSIZE and return it,
+            e.g. _block(834) =3D> 1024.
+         """
++        # Only non-negative offsets are allowed
++        if count < 0:
++            raise InvalidHeaderError("invalid offset")
+         blocks, remainder =3D divmod(count, BLOCKSIZE)
+         if remainder:
+             blocks +=3D 1
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index ac31be0..7024be4 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -50,6 +50,7 @@ bz2name =3D os.path.join(TEMPDIR, "testtar.tar.bz2")
+ xzname =3D os.path.join(TEMPDIR, "testtar.tar.xz")
+ tmpname =3D os.path.join(TEMPDIR, "tmp.tar")
+ dotlessname =3D os.path.join(TEMPDIR, "testtar")
++SPACE =3D b" "
+
+ sha256_regtype =3D (
+     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
+@@ -4578,6 +4579,161 @@ class OverwriteTests(archiver_tests.OverwriteTes=
ts, unittest.TestCase):
+         ar.extractall(self.testdir, filter=3D'fully_trusted')
+
+
++class OffsetValidationTests(unittest.TestCase):
++    tarname =3D tmpname
++    invalid_posix_header =3D (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, space, null terminator: 8 bytes
++        + b"000755" + SPACE + tarfile.NUL
++        # uid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0011407" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # magic: 6 bytes, version: 2 bytes
++        + tarfile.POSIX_MAGIC
++        # uname: 32 bytes
++        + tarfile.NUL * 32
++        # gname: 32 bytes
++        + tarfile.NUL * 32
++        # devmajor, space, null terminator: 8 bytes
++        + tarfile.NUL * 6 + SPACE + tarfile.NUL
++        # devminor, space, null terminator: 8 bytes
++        + tarfile.NUL * 6 + SPACE + tarfile.NUL
++        # prefix: 155 bytes
++        + tarfile.NUL * tarfile.LENGTH_PREFIX
++        # padding: 12 bytes
++        + tarfile.NUL * 12
++    )
++    invalid_gnu_header =3D (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, null terminator: 8 bytes
++        + b"0000755" + tarfile.NUL
++        # uid, null terminator: 8 bytes
++        + b"0000001" + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"0000001" + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0011327" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # magic: 8 bytes
++        + tarfile.GNU_MAGIC
++        # uname: 32 bytes
++        + tarfile.NUL * 32
++        # gname: 32 bytes
++        + tarfile.NUL * 32
++        # devmajor, null terminator: 8 bytes
++        + tarfile.NUL * 8
++        # devminor, null terminator: 8 bytes
++        + tarfile.NUL * 8
++        # padding: 167 bytes
++        + tarfile.NUL * 167
++    )
++    invalid_v7_header =3D (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, space, null terminator: 8 bytes
++        + b"000755" + SPACE + tarfile.NUL
++        # uid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0010070" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # padding: 255 bytes
++        + tarfile.NUL * 255
++    )
++    valid_gnu_header =3D tarfile.TarInfo("filename").tobuf(tarfile.GNU_=
FORMAT)
++    data_block =3D b"\xff" * tarfile.BLOCKSIZE
++
++    def _write_buffer(self, buffer):
++        with open(self.tarname, "wb") as f:
++            f.write(buffer)
++
++    def _get_members(self, ignore_zeros=3DNone):
++        with open(self.tarname, "rb") as f:
++            with tarfile.open(
++                mode=3D"r", fileobj=3Df, ignore_zeros=3Dignore_zeros
++            ) as tar:
++                return tar.getmembers()
++
++    def _assert_raises_read_error_exception(self):
++        with self.assertRaisesRegex(
++            tarfile.ReadError, "file could not be opened successfully"
++        ):
++            self._get_members()
++
++    def test_invalid_offset_header_validations(self):
++        for tar_format, invalid_header in (
++            ("posix", self.invalid_posix_header),
++            ("gnu", self.invalid_gnu_header),
++            ("v7", self.invalid_v7_header),
++        ):
++            with self.subTest(format=3Dtar_format):
++                self._write_buffer(invalid_header)
++                self._assert_raises_read_error_exception()
++
++    def test_early_stop_at_invalid_offset_header(self):
++        buffer =3D self.valid_gnu_header + self.invalid_gnu_header + se=
lf.valid_gnu_header
++        self._write_buffer(buffer)
++        members =3D self._get_members()
++        self.assertEqual(len(members), 1)
++        self.assertEqual(members[0].name, "filename")
++        self.assertEqual(members[0].offset, 0)
++
++    def test_ignore_invalid_archive(self):
++        # 3 invalid headers with their respective data
++        buffer =3D (self.invalid_gnu_header + self.data_block) * 3
++        self._write_buffer(buffer)
++        members =3D self._get_members(ignore_zeros=3DTrue)
++        self.assertEqual(len(members), 0)
++
++    def test_ignore_invalid_offset_headers(self):
++        for first_block, second_block, expected_offset in (
++            (
++                (self.valid_gnu_header),
++                (self.invalid_gnu_header + self.data_block),
++                0,
++            ),
++            (
++                (self.invalid_gnu_header + self.data_block),
++                (self.valid_gnu_header),
++                1024,
++            ),
++        ):
++            self._write_buffer(first_block + second_block)
++            members =3D self._get_members(ignore_zeros=3DTrue)
++            self.assertEqual(len(members), 1)
++            self.assertEqual(members[0].name, "filename")
++            self.assertEqual(members[0].offset, expected_offset)
++
++
+ def setUpModule():
+     os_helper.unlink(TEMPDIR)
+     os.makedirs(TEMPDIR)
+diff --git a/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-13057=
7.c7EITy.rst b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-1305=
77.c7EITy.rst
+new file mode 100644
+index 0000000..342cabb
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EIT=
y.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile` now validates archives to ensure member offsets are
++non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
++:gh:`130577`.)
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.13.4.bb b/meta/recipe=
s-devtools/python/python3_3.13.4.bb
index 0a2c41cdce..6823a21cc3 100644
--- a/meta/recipes-devtools/python/python3_3.13.4.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-test_active_children-skip-problematic-test.patch =
\
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multi=
ssl.patch \
+           file://CVE-2025-8194.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.40.0


