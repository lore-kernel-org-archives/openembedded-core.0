Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06440D3B7E4
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 07:46:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14162.1732520774621949785
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 23:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1059310bac=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP6hSHH022566
	for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 23:46:14 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433feq1asw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 23:46:13 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 24 Nov 2024 23:46:13 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 24 Nov 2024 23:46:12 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [kirkstone][PATCH] python3-pip: fix CVE-2023-5752
Date: Mon, 25 Nov 2024 15:46:11 +0800
Message-ID: <20241125074611.287564-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=c+L5Qg9l c=1 sm=1 tr=0 ts=67442b45 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=TrFIT4juWemFR5m1eWYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mEG5Mb8eReR3tPRDMAqUl6B3DoOxPYh-
X-Proofpoint-GUID: mEG5Mb8eReR3tPRDMAqUl6B3DoOxPYh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-25_04,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411250065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 07:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207720

From: Jiaying Song <jiaying.song.cn@windriver.com>

When installing a package from a Mercurial VCS URL (ie "pip install
hg+...") with pip prior to v23.3, the specified Mercurial revision could
be used to inject arbitrary configuration options to the "hg clone" call
(ie "--config"). Controlling the Mercurial configuration can modify how
and which repository is installed. This vulnerability does not affect
users who aren't installing from Mercurial.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-5752

Upstream patches:
https://github.com/pypa/pip/pull/12306/commits/389cb799d0da9a840749fcd14878928467ed49b4

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../python/python3-pip/CVE-2023-5752.patch    | 34 +++++++++++++++++++
 .../python/python3-pip_22.0.3.bb              |  8 +++--
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch b/meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch
new file mode 100644
index 0000000000..ef66a59021
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2023-5752.patch
@@ -0,0 +1,34 @@
+From b16dd80c50deaa4753045d93ed281d348509293f Mon Sep 17 00:00:00 2001
+From: Pradyun Gedam <pradyunsg@users.noreply.github.com>
+Date: Sun, 1 Oct 2023 14:10:25 +0100
+Subject: [PATCH] Use `-r=...` instead of `-r ...` for hg
+
+This ensures that the resulting revision can not be misinterpreted as an
+option.
+
+Upstream-Status: Backport
+[https://github.com/pypa/pip/pull/12306/commits/389cb799d0da9a840749fcd14878928467ed49b4]
+
+CVE: CVE-2023-5752
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ src/pip/_internal/vcs/mercurial.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pip/_internal/vcs/mercurial.py b/src/pip/_internal/vcs/mercurial.py
+index 2a005e0..e440c12 100644
+--- a/src/pip/_internal/vcs/mercurial.py
++++ b/src/pip/_internal/vcs/mercurial.py
+@@ -31,7 +31,7 @@ class Mercurial(VersionControl):
+ 
+     @staticmethod
+     def get_base_rev_args(rev: str) -> List[str]:
+-        return [rev]
++        return [f"-r={rev}"]
+ 
+     def fetch_new(
+         self, dest: str, url: HiddenText, rev_options: RevOptions, verbosity: int
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index 6e28b87ba3..28eab9c3de 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -34,9 +34,11 @@ LIC_FILES_CHKSUM = "\
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
-SRC_URI += "file://no_shebang_mangling.patch"
-SRC_URI += "file://reproducible.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch \
+            file://no_shebang_mangling.patch \
+            file://reproducible.patch \
+            file://CVE-2023-5752.patch \
+           "
 
 SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
 
-- 
2.34.1


