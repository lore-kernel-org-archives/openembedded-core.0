Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05B6CE7B0D
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:29:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35043.1725629379420586207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 06:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9979a097e3=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486Adrbq001167
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Sep 2024 13:29:38 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41fhy8gvdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 13:29:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 06:29:37 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 06:29:36 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 3/3] expat: fix CVE-2024-45492
Date: Fri, 6 Sep 2024 13:29:30 +0000
Message-ID: <20240906132930.2926495-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240906132930.2926495-1-archana.polampalli@windriver.com>
References: <20240906132930.2926495-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dkD8_FJN33iQlfEvWdnuBYUdbkaSWXWI
X-Proofpoint-ORIG-GUID: dkD8_FJN33iQlfEvWdnuBYUdbkaSWXWI
X-Authority-Analysis: v=2.4 cv=f6gaB/yM c=1 sm=1 tr=0 ts=66db03c2 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=-Xy8Vmf_AAAA:8 a=NEAV23lmAAAA:8 a=OBQj1sAUoBz71i574iAA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=UVb-SS9ExmY72c4GIYVd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409060098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 13:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204266

From: Archana Polampalli <archana.polampalli@windriver.com>

An issue was discovered in libexpat before 2.6.3. nextScaffoldPart in xmlparse.c
can have an integer overflow for m_groupSize on 32-bit platforms (where UINT_MAX equals SIZE_MAX).

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../expat/expat/CVE-2024-45492.patch          | 38 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45492.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-45492.patch b/meta/recipes-core/expat/expat/CVE-2024-45492.patch
new file mode 100644
index 0000000000..a569f18067
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45492.patch
@@ -0,0 +1,38 @@
+From 9b0615959a4df00b4719c5beae286eb52fd32fe0 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Aug 2024 22:37:16 +0200
+Subject: [PATCH] lib: Detect integer overflow in function nextScaffoldPart
+
+Reported by TaiYou
+
+CVE: CVE-2024-45492
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/892/commits/9bf0f2c16ee86f64]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/xmlparse.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index adb27e3..6d7e92f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7465,6 +7465,15 @@ nextScaffoldPart(XML_Parser parser) {
+   int next;
+
+   if (! dtd->scaffIndex) {
++    /* Detect and prevent integer overflow.
++     * The preprocessor guard addresses the "always false" warning
++     * from -Wtype-limits on platforms where
++     * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++    if (parser->m_groupSize > ((size_t)(-1) / sizeof(int))) {
++      return -1;
++    }
++#endif
+     dtd->scaffIndex = (int *)MALLOC(parser, parser->m_groupSize * sizeof(int));
+     if (! dtd->scaffIndex)
+       return -1;
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index bfd0961913..8fccb8b27f 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2024-45490-0001.patch \
 	   file://CVE-2024-45490-0002.patch \
 	   file://CVE-2024-45491.patch \
+	   file://CVE-2024-45492.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.40.0


