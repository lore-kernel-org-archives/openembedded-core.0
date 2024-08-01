Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1F8C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 04:56:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.61014.1722488159202771719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 21:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8943801d26=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4714sKmK005199
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Aug 2024 04:55:58 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mp3xcw2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 04:55:58 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 21:55:55 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] go: Fix CVE-2024-24789
Date: Thu, 1 Aug 2024 04:55:33 +0000
Message-ID: <20240801045533.953987-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: kJqBE4L-1f5Z3SBJX7pq_yqpu5Nn113Y
X-Proofpoint-ORIG-GUID: kJqBE4L-1f5Z3SBJX7pq_yqpu5Nn113Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_02,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408010027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 04:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202724

From: Soumya Sambu <soumya.sambu@windriver.com>

The archive/zip package's handling of certain types of invalid zip files
differs from the behavior of most zip implementations. This misalignment
could be exploited to create an zip file with contents that vary depending
on the implementation reading the file. The archive/zip package now rejects
files containing these errors.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-24789

Upstream-patch:
https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2024-24789.patch           | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 95fb572362..e83c4dfa80 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -56,6 +56,7 @@ SRC_URI += "\
     file://CVE-2024-24784.patch \
     file://CVE-2024-24785.patch \
     file://CVE-2023-45288.patch \
+    file://CVE-2024-24789.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch
new file mode 100644
index 0000000000..2679109a0e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch
@@ -0,0 +1,78 @@
+From c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 14 May 2024 14:39:10 -0700
+Subject: [PATCH] [release-branch.go1.21] archive/zip: treat truncated EOCDR
+ comment as an error
+
+When scanning for an end of central directory record,
+treat an EOCDR signature with a record containing a truncated
+comment as an error. Previously, we would skip over the invalid
+record and look for another one. Other implementations do not
+do this (they either consider this a hard error, or just ignore
+the truncated comment). This parser misalignment allowed
+presenting entirely different archive contents to Go programs
+and other zip decoders.
+
+For #66869
+Fixes #67553
+
+Change-Id: I94e5cb028534bb5704588b8af27f1e22ea49c7c6
+Reviewed-on: https://go-review.googlesource.com/c/go/+/585397
+Reviewed-by: Joseph Tsai <joetsai@digital-static.net>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+(cherry picked from commit 33d725e5758bf1fea62e6c77fc70b57a828a49f5)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/588795
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+
+CVE: CVE-2024-24789
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/archive/zip/reader.go      | 8 ++++++--
+ src/archive/zip/reader_test.go | 8 ++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/archive/zip/reader.go b/src/archive/zip/reader.go
+index e40a2c6..987f543 100644
+--- a/src/archive/zip/reader.go
++++ b/src/archive/zip/reader.go
+@@ -644,9 +644,13 @@ func findSignatureInBlock(b []byte) int {
+		if b[i] == 'P' && b[i+1] == 'K' && b[i+2] == 0x05 && b[i+3] == 0x06 {
+			// n is length of comment
+			n := int(b[i+directoryEndLen-2]) | int(b[i+directoryEndLen-1])<<8
+-			if n+directoryEndLen+i <= len(b) {
+-				return i
++			if n+directoryEndLen+i > len(b) {
++				// Truncated comment.
++				// Some parsers (such as Info-ZIP) ignore the truncated comment
++				// rather than treating it as a hard error.
++				return -1
+			}
++			return i
+		}
+	}
+	return -1
+diff --git a/src/archive/zip/reader_test.go b/src/archive/zip/reader_test.go
+index a549153..7ac394d 100644
+--- a/src/archive/zip/reader_test.go
++++ b/src/archive/zip/reader_test.go
+@@ -487,6 +487,14 @@ var tests = []ZipTest{
+			},
+		},
+	},
++	// Issue 66869: Don't skip over an EOCDR with a truncated comment.
++	// The test file sneakily hides a second EOCDR before the first one;
++	// previously we would extract one file ("file") from this archive,
++	// while most other tools would reject the file or extract a different one ("FILE").
++	{
++		Name:  "comment-truncated.zip",
++		Error: ErrFormat,
++	},
+ }
+
+ func TestReader(t *testing.T) {
+--
+2.40.0
-- 
2.40.0


