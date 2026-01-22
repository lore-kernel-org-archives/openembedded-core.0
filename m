Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5F7D2ED14
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 01:42:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28105.1769046134199360409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 17:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W46yyylE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54829c2545=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L1ZJ7i1784890
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 17:42:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6QihAF2rdP9yQ7LDoqLJqiTxlbev9Bjils2Imn32Pkw=; b=W46yyylEqcUy
	UaoecDIXG9JWyi3ItVG1YzDRy2eUHg0tEO7iVXbriZeNLIqOjZUdLgE4HZ2BSUAB
	UR8AH/BRjjUh1Dpmfuf6PIZNnq0xMO1KRQAlKLTZB9Mppyjk0D/rGCiRUHqC880h
	RnNq1Pb2qlaKm69hcoPbkXEbEg5egtjm3KrY1BtZPKpr+GIgIXMDXSqEMvVnf426
	JQ90RVLmqe30wMdobGGc5027+W6r6CvbbAVeO+ktLqRC4jvZloMQFNMru0OvfAto
	zxWSJUULzDgTVFdbte6zzAt+CQerDzK2gsJ7/V6sHViviVdUX2JBQcaYmkPHRjlq
	NeC+mSpjqA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn75sman-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 17:42:13 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 21 Jan 2026 17:42:13 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 21 Jan 2026 17:42:12 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] libxml2: Fix CVE-2026-0992
Date: Thu, 22 Jan 2026 09:42:10 +0800
Message-ID: <20260122014210.2883454-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122014210.2883454-1-mingli.yu@windriver.com>
References: <20260122014210.2883454-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Utr5SHWh5mwOO1PdC9O0t1uYitgwyuJ5
X-Proofpoint-GUID: Utr5SHWh5mwOO1PdC9O0t1uYitgwyuJ5
X-Authority-Analysis: v=2.4 cv=fpzRpV4f c=1 sm=1 tr=0 ts=69718075 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8 a=ONIfP_PlCfeb-ry2C-wA:9
 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxMiBTYWx0ZWRfX1ZWlaNCvTZKZ
 wL9HnRQa4cNUNJ42ygEAu8wc4rvTeH/IRuBA4bQkOZH+SSEEAeLL4ww9+u89zVehibx6Xfmpux4
 NN5xEnFoQMnZy1cDRauTpgSGo+cLtOp4tiRml4RyvPZ6ADgA/E2Ls5QNHDoAqPs5C+Ab4+YWvPS
 NCajA2d4eaFPYnAicJtubI5gqs8tAXbmkLLkTfyavT/KQo3M7ht+MS2ipI3ucKL3H7n189eQFJx
 id39UFLvyX3//0knofpjCtgnaE6CYAVszDq5Pw6cW9B9pPAayZoFBEsvq4FUR1ZdXawVbopRf7I
 GVjMKwVm90u1kZVD+Z46nWTTV2JRRYiLTxvhItB/7lXyHULL/JU4/C35LB52n8RtAes75bGITGx
 ame8ZYfJBT490D9yHbQX9uYhX+r+PDt9uuKstJovzd31ADSeGT89VbF87T+BctNJUHQ84PiVnbl
 HHnhDuiFvRKP+HXlnXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229828

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2026-0992.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa419a740a3191e56c60400f3ff18988d

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libxml/libxml2/CVE-2026-0992.patch        | 54 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.15.1.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
new file mode 100644
index 0000000000..5f0602f043
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0992.patch
@@ -0,0 +1,54 @@
+From f75abfcaa419a740a3191e56c60400f3ff18988d Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Fri, 19 Dec 2025 11:02:18 +0100
+Subject: [PATCH] catalog: Ignore repeated nextCatalog entries
+
+This patch makes the catalog parsing to ignore repeated entries of
+nextCatalog with the same value.
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1019
+
+CVE: CVE-2026-0992
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/f75abfcaa419a740a3191e56c60400f3ff18988d]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ catalog.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/catalog.c b/catalog.c
+index 46b877e6..fa6d77ca 100644
+--- a/catalog.c
++++ b/catalog.c
+@@ -1223,9 +1223,27 @@ xmlParseXMLCatalogNode(xmlNodePtr cur, xmlCatalogPrefer prefer,
+ 		BAD_CAST "delegateURI", BAD_CAST "uriStartString",
+ 		BAD_CAST "catalog", prefer, cgroup);
+     } else if (xmlStrEqual(cur->name, BAD_CAST "nextCatalog")) {
++	xmlCatalogEntryPtr prev = parent->children;
++
+ 	entry = xmlParseXMLCatalogOneNode(cur, XML_CATA_NEXT_CATALOG,
+ 		BAD_CAST "nextCatalog", NULL,
+ 		BAD_CAST "catalog", prefer, cgroup);
++	/* Avoid duplication of nextCatalog */
++	while (prev != NULL) {
++	    if ((prev->type == XML_CATA_NEXT_CATALOG) &&
++		(xmlStrEqual (prev->URL, entry->URL)) &&
++		(xmlStrEqual (prev->value, entry->value)) &&
++		(prev->prefer == entry->prefer) &&
++		(prev->group == entry->group)) {
++		    if (xmlDebugCatalogs)
++			xmlCatalogPrintDebug(
++			    "Ignoring repeated nextCatalog %s\n", entry->URL);
++		    xmlFreeCatalogEntry(entry, NULL);
++		    entry = NULL;
++		    break;
++	    }
++	    prev = prev->next;
++	}
+     }
+     if (entry != NULL) {
+         if (parent != NULL) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
index c603fb7980..a64ed8098e 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -16,6 +16,7 @@ inherit gnomebase
 
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://CVE-2026-0990.patch \
+           file://CVE-2026-0992.patch \
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-- 
2.34.1


