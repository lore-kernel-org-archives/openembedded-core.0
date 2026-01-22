Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB474D2ED10
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 01:42:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28104.1769046134199018151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 17:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EielKDNj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54829c2545=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L401uv3401867
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Zfj5rvVLj47MvClH6J8u
	9EwiQ+HB5Dm30QrnV8JlCdk=; b=EielKDNjPbOZtoUsMMLSHwlIsQcCrapgd1I4
	rnBi94HdHqpxfe+E4brPIvgkCEg54BHfv32GTwCPhqiSNjvpX2xKUT3/CXQqGs0Q
	ch/Q1nnJc7He2b9dZOkVfbzqaM0y+uEKMvy2qJXkdKLvFDKkWHh0TqsQZaSnYFn1
	/pEWnuQL6O/V5k8BQWso2om130V7PGT1sNZKE0oIpkumoKg+HM3ludhukIltaYJp
	rFrfX6LiYqkVFuHTzvOWHZhrEPHiRmTqfed53AIn0j/Y7YXZ7bgC5uMLbWiHdrsP
	pK9zzBcFeSDQeJwAeY3C5qR+bRowAJ3p1xr6G28xAzd/4tTXyg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn74sm7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:42:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 21 Jan 2026 17:42:12 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 21 Jan 2026 17:42:11 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] libxml2: Fix CVE-2026-0990
Date: Thu, 22 Jan 2026 09:42:09 +0800
Message-ID: <20260122014210.2883454-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxMSBTYWx0ZWRfX5gwMOa7CPg//
 N9EyGlPtWiliTyyQ/wuMz/VBPw1JsFQ5zieXHGq8565ngAwKoW3y0gZpCIGWgb1f2w6TRY4Y98m
 B19hC5aKKHwbU7uTS2HJh2kBybtbIRQVFtdItHBdg1VEuonyZcXmL0m6ESr/4Z9muyndKjsB5ks
 tXvEkVnZMFIj+/HQmoZKiC9Ty/hbv2Vfku99b/ZGlL/HD3sBJVLlO/RIrxofxe/wHSNm2THb5zQ
 kU5rddD+0y4bQ1L1DZbek5cckLyCfWZfhc4Xe/Ra8JurP1sqvw+X3hmUVHP4wBcOpSuLbkxJ+j9
 qXN/kPBRjIIgY2dlaPCryzPHhpbatrO4Zlvj+pl6MfT9LQIKIlfJcIZG0sC6SdwwY1QRM23mm37
 4/rjv7Ww3c22O4gVIl3E1jq3+VsvjZqpH3qOg7bd6RN28qGPpUTlqzd8Yml3mlYvmw0BmDmVACj
 lNpE8JT3kwsXqm6D12Q==
X-Proofpoint-GUID: BFq5Xjs_YbxoaSreYdM6XgsNIOLhrIO6
X-Authority-Analysis: v=2.4 cv=C6rkCAP+ c=1 sm=1 tr=0 ts=69718074 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8 a=eWTTWk1sCCeaLu25jeoA:9
 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: BFq5Xjs_YbxoaSreYdM6XgsNIOLhrIO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229827

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2026-0990.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1961208e958ca22f80a0b4e4c9d71cfa050aa982

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libxml/libxml2/CVE-2026-0990.patch        | 81 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.15.1.bb    |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
new file mode 100644
index 0000000000..6b2b8799f5
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
@@ -0,0 +1,81 @@
+From 1961208e958ca22f80a0b4e4c9d71cfa050aa982 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Wed, 17 Dec 2025 15:24:08 +0100
+Subject: [PATCH] catalog: prevent inf recursion in xmlCatalogXMLResolveURI
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018
+
+CVE: CVE-2026-0990
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1961208e958ca22f80a0b4e4c9d71cfa050aa982]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ catalog.c | 31 +++++++++++++++++++++++--------
+ 1 file changed, 23 insertions(+), 8 deletions(-)
+
+diff --git a/catalog.c b/catalog.c
+index 76c063a8..46b877e6 100644
+--- a/catalog.c
++++ b/catalog.c
+@@ -2025,12 +2025,21 @@ static xmlChar *
+ xmlCatalogListXMLResolveURI(xmlCatalogEntryPtr catal, const xmlChar *URI) {
+     xmlChar *ret = NULL;
+     xmlChar *urnID = NULL;
++    xmlCatalogEntryPtr cur = NULL;
+ 
+     if (catal == NULL)
+         return(NULL);
+     if (URI == NULL)
+ 	return(NULL);
+ 
++    if (catal->depth > MAX_CATAL_DEPTH) {
++	xmlCatalogErr(catal, NULL, XML_CATALOG_RECURSION,
++		      "Detected recursion in catalog %s\n",
++		      catal->name, NULL, NULL);
++	return(NULL);
++    }
++    catal->depth++;
++
+     if (!xmlStrncmp(URI, BAD_CAST XML_URN_PUBID, sizeof(XML_URN_PUBID) - 1)) {
+ 	urnID = xmlCatalogUnWrapURN(URI);
+ 	if (xmlDebugCatalogs) {
+@@ -2044,21 +2053,27 @@ xmlCatalogListXMLResolveURI(xmlCatalogEntryPtr catal, const xmlChar *URI) {
+ 	ret = xmlCatalogListXMLResolve(catal, urnID, NULL);
+ 	if (urnID != NULL)
+ 	    xmlFree(urnID);
++	catal->depth--;
+ 	return(ret);
+     }
+-    while (catal != NULL) {
+-	if (catal->type == XML_CATA_CATALOG) {
+-	    if (catal->children == NULL) {
+-		xmlFetchXMLCatalogFile(catal);
++    cur = catal;
++    while (cur != NULL) {
++	if (cur->type == XML_CATA_CATALOG) {
++	    if (cur->children == NULL) {
++		xmlFetchXMLCatalogFile(cur);
+ 	    }
+-	    if (catal->children != NULL) {
+-		ret = xmlCatalogXMLResolveURI(catal->children, URI);
+-		if (ret != NULL)
++	    if (cur->children != NULL) {
++		ret = xmlCatalogXMLResolveURI(cur->children, URI);
++		if (ret != NULL) {
++		    catal->depth--;
+ 		    return(ret);
++		}
+ 	    }
+ 	}
+-	catal = catal->next;
++	cur = cur->next;
+     }
++
++    catal->depth--;
+     return(ret);
+ }
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
index 736aaea00e..c603fb7980 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -15,6 +15,7 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase
 
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
+           file://CVE-2026-0990.patch \
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-- 
2.34.1


