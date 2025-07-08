Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6A4C83F10
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 09:38:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14641.1751967529736736773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 02:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=928426fcf9=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5685tgV3004075
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 09:38:48 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19jp0f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 09:38:48 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 8 Jul 2025 02:38:29 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 2/3] libarchive: fix CVE-2025-5916
Date: Tue, 8 Jul 2025 15:08:17 +0530
Message-ID: <20250708093818.3041744-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250708093818.3041744-1-divya.chellam@windriver.com>
References: <20250708093818.3041744-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: co9OuzdlJDa0g1sxEggHCUAjQrrvxr4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA3OCBTYWx0ZWRfX075d7M2JLn1K qmc7RZ9EB1wz1piNI6o+aHeihUpZcAi31DNI71fuWMxAODHXiX8SlYXdDaKpHNRsZTKhyol5JG8 5O4yLooV5CQvmzxXDDpaLN1t8/p66Q/zjmJkmkDvSx1bLzChBAkMrVyCyZ+lQRUHwZqNDaBX2RF
 IKAk5F0kUCIiPv6pRaPlo1kREq3GI+Q3WTigM2Tsy2Neqavd/usLpo9xorLMLyjFZMBleLaun16 98aCgrUcOKPHzBG/9ZRsuahqvELsJXyeO73oqb5RNPrtQ2D1YC/4GAS13ENy4sXH7l6Q2N84NoW 9Vw2m3sPm5bDAFiRG7Wr5zqEPG6x86YWjNNACYJt4/kR+FibzvnW2ilKjm2IaRYkBaoBNk3M9Fh
 Cx2+fKeIMiPtkH8oZRymM2uTsdbaOJRcU001ZQEUWH9IuodozdiFB0Ru8s63t1Tqvmqo1ICQ
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=686ce728 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8
 a=gvgSt4wf3b-gOhW1Ot4A:9 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-GUID: co9OuzdlJDa0g1sxEggHCUAjQrrvxr4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 09:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220024

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability has been identified in the libarchive library. This flaw
involves an integer overflow that can be triggered when processing a Web
Archive (WARC) file that claims to have more than INT64_MAX - 4 content
bytes. An attacker could craft a malicious WARC archive to induce this
overflow, potentially leading to unpredictable program behavior, memory
corruption, or a denial-of-service condition within applications that
process such archives using libarchive.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-5916

Upstream-patch:
https://github.com/libarchive/libarchive/commit/ef093729521fcf73fa4007d5ae77adfe4df42403

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libarchive/libarchive/CVE-2025-5916.patch | 116 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
new file mode 100644
index 0000000000..d32c8ee84e
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
@@ -0,0 +1,116 @@
+From ef093729521fcf73fa4007d5ae77adfe4df42403 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Mon, 7 Apr 2025 00:24:13 +0200
+Subject: [PATCH] warc: Prevent signed integer overflow (#2568)
+
+If a warc archive claims to have more than INT64_MAX - 4 content bytes,
+the inevitable failure to skip all these bytes could lead to parsing
+data which should be ignored instead.
+
+The test case contains a conversation entry with that many bytes and if
+the entry is not properly skipped, the warc implementation would read
+the conversation data as a new file entry.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5916
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/ef093729521fcf73fa4007d5ae77adfe4df42403]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/archive_read_support_format_warc.c |  7 ++++--
+ libarchive/test/test_read_format_warc.c       | 24 +++++++++++++++++++
+ .../test_read_format_warc_incomplete.warc.uu  | 10 ++++++++
+ 4 files changed, 40 insertions(+), 2 deletions(-)
+ create mode 100644 libarchive/test/test_read_format_warc_incomplete.warc.uu
+
+diff --git a/Makefile.am b/Makefile.am
+index e486a8d..dd1620d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -913,6 +913,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_ustar_filename_eucjp.tar.Z.uu \
+ 	libarchive/test/test_read_format_ustar_filename_koi8r.tar.Z.uu \
+ 	libarchive/test/test_read_format_warc.warc.uu \
++	libarchive/test/test_read_format_warc_incomplete.warc.uu \
+ 	libarchive/test/test_read_format_zip.zip.uu \
+ 	libarchive/test/test_read_format_zip_7075_utf8_paths.zip.uu \
+ 	libarchive/test/test_read_format_zip_7z_deflate.zip.uu \
+diff --git a/libarchive/archive_read_support_format_warc.c b/libarchive/archive_read_support_format_warc.c
+index 2732996..19cf5a3 100644
+--- a/libarchive/archive_read_support_format_warc.c
++++ b/libarchive/archive_read_support_format_warc.c
+@@ -379,7 +379,8 @@ start_over:
+ 	case LAST_WT:
+ 	default:
+ 		/* consume the content and start over */
+-		_warc_skip(a);
++		if (_warc_skip(a) < 0)
++			return (ARCHIVE_FATAL);
+ 		goto start_over;
+ 	}
+ 	return (ARCHIVE_OK);
+@@ -432,7 +433,9 @@ _warc_skip(struct archive_read *a)
+ {
+ 	struct warc_s *w = a->format->data;
+ 
+-	__archive_read_consume(a, w->cntlen + 4U/*\r\n\r\n separator*/);
++	if (__archive_read_consume(a, w->cntlen) < 0 ||
++	    __archive_read_consume(a, 4U/*\r\n\r\n separator*/) < 0)
++		return (ARCHIVE_FATAL);
+ 	w->cntlen = 0U;
+ 	w->cntoff = 0U;
+ 	return (ARCHIVE_OK);
+diff --git a/libarchive/test/test_read_format_warc.c b/libarchive/test/test_read_format_warc.c
+index 658ab8a..8a6d178 100644
+--- a/libarchive/test/test_read_format_warc.c
++++ b/libarchive/test/test_read_format_warc.c
+@@ -80,3 +80,27 @@ DEFINE_TEST(test_read_format_warc)
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+ }
++
++DEFINE_TEST(test_read_format_warc_incomplete)
++{
++	const char reffile[] = "test_read_format_warc_incomplete.warc";
++	struct archive_entry *ae;
++	struct archive *a;
++
++	extract_reference_file(reffile);
++	assert((a = archive_read_new()) != NULL);
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_open_filename(a, reffile, 10240));
++
++	/* Entry cannot be parsed */
++	assertEqualIntA(a, ARCHIVE_FATAL, archive_read_next_header(a, &ae));
++
++	/* Verify archive format. */
++	assertEqualIntA(a, ARCHIVE_FILTER_NONE, archive_filter_code(a, 0));
++
++	/* Verify closing and resource freeing */
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
++	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
++}
+diff --git a/libarchive/test/test_read_format_warc_incomplete.warc.uu b/libarchive/test/test_read_format_warc_incomplete.warc.uu
+new file mode 100644
+index 0000000..b91b97e
+--- /dev/null
++++ b/libarchive/test/test_read_format_warc_incomplete.warc.uu
+@@ -0,0 +1,10 @@
++begin 644 test_read_format_warc_incomplete.warc
++M5T%20R\Q+C`-"E=!4D,M5'EP93H@8V]N=F5R<VEO;@T*5T%20RU$871E.B`R
++M,#(U+3`S+3,P5#$U.C`P.C0P6@T*0V]N=&5N="U,96YG=&@Z(#DR,C,S-S(P
++M,S8X-30W-S4X,#<-"@T*5T%20R\Q+C`-"E=!4D,M5'EP93H@<F5S;W5R8V4-
++M"E=!4D,M5&%R9V5T+55223H@9FEL93HO+W)E861M92YT>'0-"E=!4D,M1&%T
++M93H@,C`R-2TP,RTS,%0Q-3HP,#HT,%H-"D-O;G1E;G0M5'EP93H@=&5X="]P
++M;&%I;@T*0V]N=&5N="U,96YG=&@Z(#,X#0H-"E1H92!R96%D;64N='AT('-H
++4;W5L9"!N;W0@8F4@=FES:6)L90H`
++`
++end
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index c612c1b7e0..f90063ba3a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-25724.patch \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
+           file://CVE-2025-5916.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.40.0


