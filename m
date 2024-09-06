Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7C7CE7B10
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:29:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34697.1725629376095592213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 06:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9979a097e3=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4864XLNc017612
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Sep 2024 13:29:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41fhy8gvde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 13:29:35 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 06:29:33 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 06:29:32 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/3] expat: fix CVE-2024-45490
Date: Fri, 6 Sep 2024 13:29:28 +0000
Message-ID: <20240906132930.2926495-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Xzai1Uvu9zh97OI62i2pFCE2buNzoExR
X-Proofpoint-ORIG-GUID: Xzai1Uvu9zh97OI62i2pFCE2buNzoExR
X-Authority-Analysis: v=2.4 cv=f6gaB/yM c=1 sm=1 tr=0 ts=66db03bf cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=-Xy8Vmf_AAAA:8 a=NEAV23lmAAAA:8 a=58qsVsGZZA54sgsFlT0A:9 a=wFQlJsPxl2ERan9X:21
 a=FdTzh2GWekK77mhwV6Dw:22 a=UVb-SS9ExmY72c4GIYVd:22
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204264

From: Archana Polampalli <archana.polampalli@windriver.com>

An issue was discovered in libexpat before 2.6.3. xmlparse.c does not reject
a negative length for XML_ParseBuffer.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../expat/expat/CVE-2024-45490-0001.patch     | 35 +++++++++++++
 .../expat/expat/CVE-2024-45490-0002.patch     | 49 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch b/meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch
new file mode 100644
index 0000000000..acdeb5b7df
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch
@@ -0,0 +1,35 @@
+From 1d4f03d21b4f42031716522a6b96346b7a60d4c4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 19 Aug 2024 22:26:07 +0200
+Subject: [PATCH] lib: Reject negative len for XML_ParseBuffer
+
+Reported by TaiYou
+
+CVE: CVE-2024-45490
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5c1a31642e243f4870c0bd1f2afc7597976521bf]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/xmlparse.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9984d02..6f0440b 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1996,6 +1996,12 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+
+   if (parser == NULL)
+     return XML_STATUS_ERROR;
++
++  if (len < 0) {
++    parser->m_errorCode = XML_ERROR_INVALID_ARGUMENT;
++    return XML_STATUS_ERROR;
++  }
++
+   switch (parser->m_parsingStatus.parsing) {
+   case XML_SUSPENDED:
+     parser->m_errorCode = XML_ERROR_SUSPENDED;
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch b/meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch
new file mode 100644
index 0000000000..e769182087
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch
@@ -0,0 +1,49 @@
+From 2db233019f551fe4c701bbbc5eb0fa58ff349daa Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 25 Aug 2024 19:09:51 +0200
+Subject: [PATCH] doc: Document that XML_Parse/XML_ParseBuffer reject "len < 0"
+
+CVE: CVE-2024-45490
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2db233019f551fe4c701bbbc5eb0fa58ff349daa]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ doc/reference.html | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index cdf3983..ebae824 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -1097,7 +1097,9 @@ containing part (or perhaps all) of the document. The number of bytes of s
+ that are part of the document is indicated by <code>len</code>. This means
+ that <code>s</code> doesn't have to be null terminated. It also means that
+ if <code>len</code> is larger than the number of bytes in the block of
+-memory that <code>s</code> points at, then a memory fault is likely. The
++memory that <code>s</code> points at, then a memory fault is likely.
++Negative values for <code>len</code> are rejected since Expat 2.2.1.
++The
+ <code>isFinal</code> parameter informs the parser that this is the last
+ piece of the document. Frequently, the last piece is empty (i.e.
+ <code>len</code> is zero.)
+@@ -1113,11 +1115,17 @@ XML_ParseBuffer(XML_Parser p,
+                 int isFinal);
+ </pre>
+ <div class="fcndef">
++<p>
+ This is just like <code><a href= "#XML_Parse" >XML_Parse</a></code>,
+ except in this case Expat provides the buffer.  By obtaining the
+ buffer from Expat with the <code><a href= "#XML_GetBuffer"
+ >XML_GetBuffer</a></code> function, the application can avoid double
+ copying of the input.
++</p>
++
++<p>
++Negative values for <code>len</code> are rejected since Expat 2.6.3.
++</p>
+ </div>
+
+ <h4 id="XML_GetBuffer">XML_GetBuffer</h4>
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index 31e989cfe2..6d927ec8c8 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -22,6 +22,8 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2023-52426-009.patch \
 	   file://CVE-2023-52426-010.patch \
 	   file://CVE-2023-52426-011.patch \
+	   file://CVE-2024-45490-0001.patch \
+	   file://CVE-2024-45490-0002.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.40.0


