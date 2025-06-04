Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E647C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 06:59:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10230.1749020353312465950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 23:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=825006eed7=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5546L6Uf022035
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 06:59:12 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q237n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 06:59:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Jun 2025 23:59:11 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Jun 2025 23:59:09 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [kirkstone][PATCH] taglib: fix CVE-2023-47466
Date: Wed, 4 Jun 2025 14:59:05 +0800
Message-ID: <20250604065905.3714308-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: K8NbSX1oPYkB_tX5k2t7UN5bC-XKk9eM
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=683feec0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=qSU4cYFbAAAA:8 a=t7CeM3EgAAAA:8 a=FP58Ms26AAAA:8
 a=7Sixk0voVdRhntQFa1QA:9 a=ipjp_Qgxl_-kmBqn_OFm:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA1NyBTYWx0ZWRfX5L6FBSKloLmq NpJa3Peku5EAedWzgJP5VCjlNV/pv0qYalLwO8lAf6drdUbdzHznn9vASs9jayiThaATgBAFRbj LFLyFwAGGoA4g8vf9eH+3Km9IG7qf8oWzrDxa/kfgdj3UkqDzIi6QZ1UDC1pYNtZl+Kz3Ir+x8Q
 4IIGvpMz6mi5c2yDHD5ACCDVELpTIMYCc55rEhblg47ySt9OEcRlk/ZHLG7CbzEESVJaPdLAfe8 lTYYVU3igdex7fb97IUCaXkiXzp1FFwlGLb5cDL91Ny6/qhc3xqaDoJQSVIr7DMW2BKCyTCekal cYko4MjEuole7zwSSwrWXA6kiET4rU3wjlTh+p/FQo0EpxEk4BU7r+9rEJvMZ0o0Of+l+i+p53N
 bLFq12vODhWD5vDNjO0yoC2t1PvbLZFwwjd3pVcHZcsWNDAu5gdoEfhOl8mhS3jBoK9SLUrA
X-Proofpoint-ORIG-GUID: K8NbSX1oPYkB_tX5k2t7UN5bC-XKk9eM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 06:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217840

From: Jiaying Song <jiaying.song.cn@windriver.com>

TagLib before 2.0 allows a segmentation violation and application crash
during tag writing via a crafted WAV file in which an id3 chunk is the
only valid chunk.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-47466

Upstream patch:
https://github.com/taglib/taglib/commit/dfa33bec0806cbb45785accb8cc6c2048a7d40cf

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../taglib/files/CVE-2023-47466.patch         | 38 +++++++++++++++++++
 meta/recipes-support/taglib/taglib_1.12.bb    |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/taglib/files/CVE-2023-47466.patch

diff --git a/meta/recipes-support/taglib/files/CVE-2023-47466.patch b/meta/recipes-support/taglib/files/CVE-2023-47466.patch
new file mode 100644
index 0000000000..8ea8793e0a
--- /dev/null
+++ b/meta/recipes-support/taglib/files/CVE-2023-47466.patch
@@ -0,0 +1,38 @@
+From 41c1c2b3609fc542e357cc80185d90a9a6fccc1a Mon Sep 17 00:00:00 2001
+From: Urs Fleisch <ufleisch@users.sourceforge.net>
+Date: Sun, 5 Nov 2023 14:40:18 +0100
+Subject: [PATCH] Fix crash with invalid WAV files (#1163) (#1164)
+
+With specially crafted WAV files having the "id3 " chunk as the
+only valid chunk, when trying to write the tags, the existing
+"id3 " chunk is removed, and then vector::front() is called on
+the now empty chunks vector.
+Now it is checked if the vector is empty to avoid the crash.
+
+CVE: CVE-2023-47466
+
+Upstream-Status: Backport
+[https://github.com/taglib/taglib/commit/dfa33bec0806cbb45785accb8cc6c2048a7d40cf]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ taglib/riff/rifffile.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/taglib/riff/rifffile.cpp b/taglib/riff/rifffile.cpp
+index 005551f..f615e6c 100644
+--- a/taglib/riff/rifffile.cpp
++++ b/taglib/riff/rifffile.cpp
+@@ -361,6 +361,9 @@ void RIFF::File::writeChunk(const ByteVector &name, const ByteVector &data,
+ 
+ void RIFF::File::updateGlobalSize()
+ {
++  if(d->chunks.empty())
++    return;
++
+   const Chunk first = d->chunks.front();
+   const Chunk last  = d->chunks.back();
+   d->size = last.offset + last.size + last.padding - first.offset + 12;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/taglib/taglib_1.12.bb b/meta/recipes-support/taglib/taglib_1.12.bb
index 47ad8aacb6..51e03888b4 100644
--- a/meta/recipes-support/taglib/taglib_1.12.bb
+++ b/meta/recipes-support/taglib/taglib_1.12.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
+SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz \
+           file://CVE-2023-47466.patch \
+          "
 
 SRC_URI[md5sum] = "4313ed2671234e029b7af8f97c84e9af"
 SRC_URI[sha256sum] = "7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703"
-- 
2.34.1


