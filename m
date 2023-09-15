Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6025DEE642E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 07:35:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15702.1694763312019002076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 00:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ePXklpkK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76224675e8=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38F71o0U013260
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 00:35:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=8iW8trqTzD1aLlAabuSB7Q4NOEbmaGBxSZfN+fSGCpk=; b=
	ePXklpkK8cFf7CbCkllMoVR/GrcSTbSHnzKf+VmxkYCvitGkCSjlloO0LTLdssFl
	YUWy1y1qKHz5a6kzqgw1whDhOfvQDOQH4ZssslDjqHIrZpG+3yxVWfgGuRyU1Mua
	2N8p/5TqhfLz/vm30/4xO2LwCXlSS7EcSnMoB1w2366xWVPIMwbab3HSoVuvs453
	/cRvjxHjtBthm1ZchC54gCjB6UFAgv7sXxsLiIPfuDCdBSpkMi5Me9PkLw6fHbrq
	4tH0yD4T0pCpqj11VST5YUkrNaZuTgcy8A4/kdMi8HlnFTFDWFXwUTdsDtXiGbj0
	YOW3Jfx9SRQWFqpcJqnBnQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y82amrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 00:35:11 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 00:35:08 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 2/2] tiff: fix CVE-2023-41175
Date: Fri, 15 Sep 2023 07:34:49 +0000
Message-ID: <20230915073449.2960389-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230915073449.2960389-1-yogita.urade@windriver.com>
References: <20230915073449.2960389-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: GigzD2lJEoK6FQWu81CjsUPfV0fUopdc
X-Proofpoint-ORIG-GUID: GigzD2lJEoK6FQWu81CjsUPfV0fUopdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=725 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309150065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 07:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187658

From: Yogita Urade <yogita.urade@windriver.com>

libtiff: potential integer overflow in raw2tiff.c

References:
https://bugzilla.redhat.com/show_bug.cgi?id=2235264
https://security-tracker.debian.org/tracker/CVE-2023-41175
https://gitlab.com/libtiff/libtiff/-/issues/592

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libtiff/files/CVE-2023-41175.patch        | 63 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.1.bb |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
new file mode 100644
index 0000000000..cca30b2196
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
@@ -0,0 +1,63 @@
+From 6e2dac5f904496d127c92ddc4e56eccfca25c2ee Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Thu, 14 Sep 2023 04:36:58 +0000
+Subject: [PATCH] raw2tiff: fix integer overflow and bypass of the check (fixes
+   #592)
+
+CVE: CVE-2023-41175
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/raw2tiff.c | 28 ++++++++++++++++++++++++++++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/tools/raw2tiff.c b/tools/raw2tiff.c
+index 4ee59e5..a811077 100644
+--- a/tools/raw2tiff.c
++++ b/tools/raw2tiff.c
+@@ -101,6 +101,7 @@ int main(int argc, char *argv[])
+     int fd;
+     char *outfilename = NULL;
+     TIFF *out;
++    uint32_t temp_limit_check = 0;     /* temp for integer overflow checking*/
+
+     uint32_t row, col, band;
+     int c;
+@@ -221,6 +222,33 @@ int main(int argc, char *argv[])
+     if (guessSize(fd, dtype, hdr_size, nbands, swab, &width, &length) < 0)
+         return EXIT_FAILURE;
+
++    /* check for integer overflow in */
++    /* hdr_size + (*width) * (*length) * nbands * depth */
++
++    if ((width == 0) || (length == 0) ){
++        fprintf(stderr, "Too large nbands value specified.\n");
++        return (EXIT_FAILURE);
++    }
++
++    temp_limit_check = nbands * depth;
++
++    if ( !temp_limit_check || length > ( UINT_MAX / temp_limit_check ) )  {
++        fprintf(stderr, "Too large length size specified.\n");
++        return (EXIT_FAILURE);
++    }
++    temp_limit_check = temp_limit_check * length;
++
++    if ( !temp_limit_check || width > ( UINT_MAX / temp_limit_check ) )  {
++        fprintf(stderr, "Too large width size specified.\n");
++        return (EXIT_FAILURE);
++    }
++    temp_limit_check = temp_limit_check * width;
++
++    if ( !temp_limit_check || hdr_size > ( UINT_MAX - temp_limit_check ) )  {
++        fprintf(stderr, "Too large header size specified.\n");
++        return (EXIT_FAILURE);
++    }
++
+     if (outfilename == NULL)
+         outfilename = argv[optind + 1];
+     out = TIFFOpen(outfilename, "w");
+--
+2.35.5
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
index d002e1b233..2b5e66b8f3 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
@@ -10,6 +10,7 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-40745.patch \
+           file://CVE-2023-41175.patch \
            "
 
 SRC_URI[sha256sum] = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b"
-- 
2.35.5


