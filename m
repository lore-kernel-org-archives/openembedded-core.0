Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB41C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:52:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22724.1739893937383705399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 07:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=414422ebf7=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IBtjuC025648
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:52:16 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44thw93759-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:52:16 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Feb 2025 07:36:33 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] libxml2: fix CVE-2022-49043
Date: Tue, 18 Feb 2025 15:36:09 +0000
Message-ID: <20250218153609.2253121-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=CZzy5Krl c=1 sm=1 tr=0 ts=67b4acb0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8
 a=2YoSfDhkQW-wtfDNacEA:9 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lKNjfSw-r9h2eRof2x9EPfb6LxaOmXze
X-Proofpoint-ORIG-GUID: lKNjfSw-r9h2eRof2x9EPfb6LxaOmXze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=756
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502180115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211635

From: Divya Chellam <divya.chellam@windriver.com>

xmlXIncludeAddNode in xinclude.c in libxml2 before 2.11.0 has a
use-after-free.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-49043

Upstream-patch:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/5a19e21605398cef6a8b1452477a8705cb41562b

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libxml/libxml2/CVE-2022-49043.patch       | 40 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch
new file mode 100644
index 0000000000..75e963dacc
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-49043.patch
@@ -0,0 +1,40 @@
+From 5a19e21605398cef6a8b1452477a8705cb41562b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 2 Nov 2022 16:13:27 +0100
+Subject: [PATCH] malloc-fail: Fix use-after-free in xmlXIncludeAddNode
+
+Found with libFuzzer, see #344.
+
+CVE: CVE-2022-49043
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/5a19e21605398cef6a8b1452477a8705cb41562b]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ xinclude.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xinclude.c b/xinclude.c
+index e5fdf0f..36fa8ec 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -612,14 +612,15 @@ xmlXIncludeAddNode(xmlXIncludeCtxtPtr ctxt, xmlNodePtr cur) {
+     }
+     URL = xmlSaveUri(uri);
+     xmlFreeURI(uri);
+-    xmlFree(URI);
+     if (URL == NULL) {
+ 	xmlXIncludeErr(ctxt, cur, XML_XINCLUDE_HREF_URI,
+ 	               "invalid value URI %s\n", URI);
+ 	if (fragment != NULL)
+ 	    xmlFree(fragment);
++	xmlFree(URI);
+ 	return(-1);
+     }
++    xmlFree(URI);
+ 
+     if (xmlStrEqual(URL, ctxt->doc->URL))
+ 	local = 1;
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 94b3b510ae..ecaae0b436 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -33,6 +33,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2023-45322-2.patch \
            file://CVE-2024-25062.patch \
            file://CVE-2024-34459.patch \
+           file://CVE-2022-49043.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.40.0


