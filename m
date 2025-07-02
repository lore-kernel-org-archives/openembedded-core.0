Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A52C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 06:52:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17644.1751439127657955416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 23:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92784424e9=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56255i1c029311
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 23:52:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3raa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 23:52:07 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 23:52:04 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 4/5] libarchive: fix CVE-2025-5917
Date: Wed, 2 Jul 2025 12:21:33 +0530
Message-ID: <20250702065134.753410-4-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250702065134.753410-1-divya.chellam@windriver.com>
References: <20250702065134.753410-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6864d717 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=aA-rkObNAAAA:8
 a=nvQci821jSjmoYLxP8YA:9 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oXaCvIbC2-sakUjjhIPqMRnl2Qz6Oj9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1MyBTYWx0ZWRfX0h8PU9BSOH5D odmkr1YHIMB36KYKIvlxhFiqu9le2rY0hWM/apa5Nv3v4sxihzv+03f/EH23D0pbdaT+GITg4JR lMQCNu4j9uZFpys/908TlM/+xkUiyRP2FnNAZlt5cl49c6CA38tjoF7t5OtMVaJ61of9bi3/NZn
 oPCN6UjtwN7pXSanMzL28Wmf4cNec85K/jU+RctFA3u3GyiqIOOHGsAFxy40IC4dFXGLLIQ6XV7 8NBgut/tKrem7CHF5XXaCA9a/2rf9D95gAj9+N4+4SNLqEK8/+JPfT4xjwRh/DqJG2qpI6W03qs y7Nr3UAuyTsr2gbB1cqVfRaVhOSTnD5NejJLMTXfecOWpmP1ZdgKMrtdX+F2SwRvky7CAjV2RqY
 CsDIvy/ozJB3MXym01gb3TjxKfKCkoXd9yeumcjd43fly20RkJUY5TZxRxr4XopzyHikmB3o
X-Proofpoint-ORIG-GUID: oXaCvIbC2-sakUjjhIPqMRnl2Qz6Oj9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 06:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219785

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability has been identified in the libarchive library. This flaw involves an 'off-by-
one' miscalculation when handling prefixes and suffixes for file names. This can lead to a 1-
byte write overflow. While seemingly small, such an overflow can corrupt adjacent memory, lea
ding to unpredictable program behavior, crashes, or in specific circumstances, could be lever
aged as a building block for more sophisticated exploitation.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-5917

Upstream-patch:
https://github.com/libarchive/libarchive/commit/7c02cde37a63580cd1859183fbbd2cf04a89be85

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libarchive/libarchive/CVE-2025-5917.patch | 54 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
new file mode 100644
index 0000000000..28f7b6023a
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
@@ -0,0 +1,54 @@
+From 7c02cde37a63580cd1859183fbbd2cf04a89be85 Mon Sep 17 00:00:00 2001
+From: Brian Campbell <Brian.Campbell@ed.ac.uk>
+Date: Sat, 26 Apr 2025 05:11:19 +0100
+Subject: [PATCH] Fix overflow in build_ustar_entry (#2588)
+
+The calculations for the suffix and prefix can increment the endpoint
+for a trailing slash. Hence the limits used should be one lower than the
+maximum number of bytes.
+
+Without this patch, when this happens for both the prefix and the
+suffix, we end up with 156 + 100 bytes, and the write of the null at the
+end will overflow the 256 byte buffer. This can be reproduced by running
+```
+mkdir -p foo/bar
+bsdtar cvf test.tar foo////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////bar
+```
+when bsdtar is compiled with Address Sanitiser, although I originally
+noticed this by accident with a genuine filename on a CHERI capability
+system, which faults immediately on the buffer overflow.
+
+CVE: CVE-2025-5917
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/7c02cde37a63580cd1859183fbbd2cf04a89be85]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ libarchive/archive_write_set_format_pax.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_write_set_format_pax.c b/libarchive/archive_write_set_format_pax.c
+index 6e35f70..b2ba959 100644
+--- a/libarchive/archive_write_set_format_pax.c
++++ b/libarchive/archive_write_set_format_pax.c
+@@ -1571,7 +1571,7 @@ build_ustar_entry_name(char *dest, const char *src, size_t src_length,
+ 	const char *filename, *filename_end;
+ 	char *p;
+ 	int need_slash = 0; /* Was there a trailing slash? */
+-	size_t suffix_length = 99;
++	size_t suffix_length = 98; /* 99 - 1 for trailing slash */
+ 	size_t insert_length;
+ 
+ 	/* Length of additional dir element to be added. */
+@@ -1623,7 +1623,7 @@ build_ustar_entry_name(char *dest, const char *src, size_t src_length,
+ 	/* Step 2: Locate the "prefix" section of the dirname, including
+ 	 * trailing '/'. */
+ 	prefix = src;
+-	prefix_end = prefix + 155;
++	prefix_end = prefix + 154 /* 155 - 1 for trailing / */;
+ 	if (prefix_end > filename)
+ 		prefix_end = filename;
+ 	while (prefix_end > prefix && *prefix_end != '/')
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 250a3c016f..bb8609dd09 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
            file://CVE-2025-5916.patch \
+           file://CVE-2025-5917.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.40.0


