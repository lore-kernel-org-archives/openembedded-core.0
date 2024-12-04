Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE58E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 09:23:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9921.1733304210338587289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 01:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2068bfaaa6=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46frM6007198
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Dec 2024 01:23:30 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q46ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 01:23:29 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Dec 2024 01:23:29 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Dec 2024 01:23:28 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Changqing.Li@windriver.com>
Subject: [kirkstone][PATCH] diffoscope: fix CVE-2024-25711
Date: Wed, 4 Dec 2024 18:21:18 +0800
Message-ID: <20241204102118.2494669-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Hyl3d-cySa1P3R2gHMY3cF7IQ6pKUr3g
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=67501f91 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=03wrYq5vTPgSqdjdeHgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Hyl3d-cySa1P3R2gHMY3cF7IQ6pKUr3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_07,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208275

From: Jiaying Song <jiaying.song.cn@windriver.com>

diffoscope before 256 allows directory traversal via an embedded
filename in a GPG file. Contents of any file, such as ../.ssh/id_rsa,
may be disclosed to an attacker. This occurs because the value of the
gpg --use-embedded-filenames option is trusted.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-25711

Upstream patches:
https://salsa.debian.org/reproducible-builds/diffoscope/-/commit/458f7f04bc053a0066aa7d2fd3251747d4899476

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../diffoscope/CVE-2024-25711.patch           | 116 ++++++++++++++++++
 .../diffoscope/diffoscope_208.bb              |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch

diff --git a/meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch b/meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch
new file mode 100644
index 0000000000..de1099c40b
--- /dev/null
+++ b/meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch
@@ -0,0 +1,116 @@
+From 1eda4012c5350efae02fcc058e0a36cc71ad62fd Mon Sep 17 00:00:00 2001
+From: Chris Lamb <lamby@debian.org>
+Date: Fri, 9 Feb 2024 10:43:18 -0800
+Subject: [PATCH] Use a determistic name instead of trusting gpg's
+ --use-embedded-filenames. (Closes: reproducible-builds/diffoscope#361)
+
+... but also expose the embedded name by attaching the ("unstable") output of
+--list-packets.
+
+Many thanks to Daniel Kahn Gillmor <dkg@debian.org> for reporting this issue
+and providing feedback.
+
+Upstream-Status: Backport
+[https://salsa.debian.org/reproducible-builds/diffoscope/-/commit/458f7f04bc053a0066aa7d2fd3251747d4899476]
+
+CVE: CVE-2024-25711
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ diffoscope/comparators/pgp.py | 34 +++++++++++++++++++++++++++++-----
+ tests/comparators/test_pgp.py |  3 ++-
+ 2 files changed, 31 insertions(+), 6 deletions(-)
+
+diff --git a/diffoscope/comparators/pgp.py b/diffoscope/comparators/pgp.py
+index eea997b..9215664 100644
+--- a/diffoscope/comparators/pgp.py
++++ b/diffoscope/comparators/pgp.py
+@@ -32,6 +32,8 @@ from .utils.command import Command, our_check_output
+ 
+ logger = logging.getLogger(__name__)
+ 
++re_name = re.compile(r", created \d+, name=\"(?P<name>[^\"]+)\",")
++
+ 
+ class Pgpdump(Command):
+     @tool_required("pgpdump")
+@@ -46,21 +48,31 @@ class Pgpdump(Command):
+         )
+ 
+ 
++class GpgListPackets(Command):
++    @tool_required("gpg")
++    def cmdline(self):
++        return (
++            "gpg",
++            "--no-keyring",
++            "--list-packets",
++            self.path,
++        )
++
++
+ class PGPContainer(Archive):
+     @tool_required("gpg")
+     def open_archive(self):
+-        # Extract to a fresh temporary directory so that we can use the
+-        # embedded filename.
+-
++        # Extract to a fresh temporary directory.
+         self._temp_dir = get_temporary_directory(suffix="pgp")
+ 
+         try:
+             our_check_output(
+                 (
+                     "gpg",
+-                    "--use-embedded-filename",
+                     "--decrypt",
+                     "--no-keyring",
++                    "--output",
++                    os.path.join(self._temp_dir.name, "contents"),
+                     os.path.abspath(self.source.path),
+                 ),
+                 cwd=self._temp_dir.name,
+@@ -75,7 +87,7 @@ class PGPContainer(Archive):
+         self._temp_dir.cleanup()
+ 
+     def get_member_names(self):
+-        # Will only return one filename, taken from the signature file itself.
++        # Will only ever return one filename
+         return os.listdir(self._temp_dir.name)
+ 
+     def extract(self, member_name, dest_dir):
+@@ -136,4 +148,16 @@ class PgpSignature(TextFile):
+             ]
+         )
+ 
++        # ... as well as gpg --list-packets
++        difference.add_details(
++            [
++                Difference.from_operation(
++                    GpgListPackets,
++                    self.path,
++                    other.path,
++                    source="gpg --list-packets",
++                )
++            ]
++        )
++
+         return difference
+diff --git a/tests/comparators/test_pgp.py b/tests/comparators/test_pgp.py
+index 8652ea9..49b3fa0 100644
+--- a/tests/comparators/test_pgp.py
++++ b/tests/comparators/test_pgp.py
+@@ -80,8 +80,9 @@ def test_pgp_signature_identification(signature1, signature2):
+ def test_pgp_signature(signature1, signature2):
+     difference = signature1.compare(signature2)
+     assert_diff(difference, "pgp_signature_expected_diff")
++    assert len(difference.details) == 2
+     assert difference.details[0].source1 == "pgpdump"
+-    assert len(difference.details) == 1
++    assert difference.details[1].source1 == "gpg --list-packets"
+ 
+ 
+ @skip_unless_tools_exist("pgpdump")
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/diffoscope/diffoscope_208.bb b/meta/recipes-support/diffoscope/diffoscope_208.bb
index 3c3b007d60..e4fde88c95 100644
--- a/meta/recipes-support/diffoscope/diffoscope_208.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_208.bb
@@ -12,6 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
+SRC_URI += " file://CVE-2024-25711.patch"
 SRC_URI[sha256sum] = "2c5c0ac1159eefce158154849fe67f0f527dffc5295bfd3ca1aef14962ffcbcb"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
-- 
2.25.1


