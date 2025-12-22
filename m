Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1D6D711D5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 07:00:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75899.1766386807284451702
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 23:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A4qieXmG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=445155024b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5gvp02114842
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 07:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=oJjzUuT4riDneyNo7+gl
	8OubrYqHyiopLBzvinnROzA=; b=A4qieXmGH7iWGMJbICMVn86NGEQ2nSEQ8796
	8xeUdJKlOR0hpwHaBf3j6wjpJqNr9PKZqwr6VrN9v1BaNTySim3B7gk8zq9/vUMw
	rZmb8PfIYceu1KiF0IT7FO0CcxeGsItzBd5VboC7DEILZxsfAKQoOaAFKiHKUy6E
	C8XdHatMCZ87L5jajn5m0OvM3EjmO+AhIIc8mdK7jDUbi79BF8Ugsxdise3Rt0od
	QWlR+5xIVU33Eo1kJw89HqiZLVotAUzhlKMX3C41Ia3sGrrsxtP8jIW5AbG9JgwK
	9mD0M0l8PtmKHn8CO3LcPqOxnlmDZbf6EpkHLxwZTmLNya+XRg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js71fu4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 07:00:05 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 21 Dec 2025 23:00:04 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 21 Dec 2025 23:00:03 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] libxslt: Fix CVE-2025-11731
Date: Mon, 22 Dec 2025 14:59:58 +0800
Message-ID: <20251222065958.2651046-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6r8QzsgMzUilNiuxr5RQm28CWRneD3U8
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=6948ec75 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=Z5getJ8MAAAA:20 a=t7CeM3EgAAAA:8 a=cm27Pg_UAAAA:8 a=6M9TsETqaMe1GmVcjvcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6r8QzsgMzUilNiuxr5RQm28CWRneD3U8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA2MSBTYWx0ZWRfXzSlnOSj1wFfV
 kklEmcH7G0n3p4yITjJp9NFarCdKtMbgwiX7kBv/KD+TTlFAYE4zN2qEMdge7vyXnZLQbGqVMal
 TxWgt2QBi+XXtv8+RS3JTK1GfjkpSwHGTsEEjmJc/94lSfNVhBQAUyLQmlX9FGiiZ9GHdB7e33a
 5EiTBrfsM00KCE6mkXC9QJmlCRz3103fKSqiWYwf0Y8Xsg8J1fc+NCjHgOMJim5NYf73EFt0U6s
 G+d75jkLh3cNk/ASMD7wwbgc2rASsmTb6Vnw1Qf2nc9IpZBMy4VSugjJ/kXDeq74mBJbkowbaL6
 2kgvlat9o4AggcgYl4h/JdpQtLSHK3m7nd1mNPaQ8cpJIF/GTCs/gN9qxP+hscC4Ssv5BcrZSpd
 V5EsX/YjRffjucfAymiA1KvwLRXeUs5zRf0SMk50osW2UEs4cDpo4Taq/gI5D8lWKNvYX+OCJOI
 LQ5EGadDQy9YFgTXV6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228283

From: Mingli Yu <mingli.yu@windriver.com>

Backport the patch [1] to fix CVE-2025-11731.

[1] https://gitlab.gnome.org/GNOME/libxslt/-/commit/fe508f201efb9ea37bfbe95413b8b28251497de3

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libxslt/files/CVE-2025-11731.patch        | 42 +++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2025-11731.patch

diff --git a/meta/recipes-support/libxslt/files/CVE-2025-11731.patch b/meta/recipes-support/libxslt/files/CVE-2025-11731.patch
new file mode 100644
index 0000000000..19702af6cb
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2025-11731.patch
@@ -0,0 +1,42 @@
+From fe508f201efb9ea37bfbe95413b8b28251497de3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Dominik=20R=C3=B6ttsches?= <drott@chromium.org>
+Date: Wed, 27 Aug 2025 14:28:40 +0300
+Subject: [PATCH] End function node ancestor search at document
+
+Avoids dereferencing a non-existent ->ns property on an
+XML_DOCUMENT_NODE pointer.
+
+Fixes #151.
+
+CVE: CVE-2025-11731
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/fe508f201efb9ea37bfbe95413b8b28251497de3]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ libexslt/functions.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libexslt/functions.c b/libexslt/functions.c
+index 8d35a7ae..a54ee70c 100644
+--- a/libexslt/functions.c
++++ b/libexslt/functions.c
+@@ -617,8 +617,13 @@ exsltFuncResultComp (xsltStylesheetPtr style, xmlNodePtr inst,
+      * instanciation of a func:result element.
+      */
+     for (test = inst->parent; test != NULL; test = test->parent) {
+-	if (IS_XSLT_ELEM(test) &&
+-	    IS_XSLT_NAME(test, "stylesheet")) {
++	if (/* Traversal has reached the top-level document without
++         * finding a func:function ancestor. */
++        (test != NULL && test->type == XML_DOCUMENT_NODE) ||
++        /* Traversal reached a stylesheet-namespace node,
++         * and has left the function namespace. */
++        (IS_XSLT_ELEM(test) &&
++         IS_XSLT_NAME(test, "stylesheet"))) {
+ 	    xsltGenericError(xsltGenericErrorContext,
+ 			     "func:result element not a descendant "
+ 			     "of a func:function\n");
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
index e08e92085d..e33b1bb902 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -14,7 +14,8 @@ SECTION = "libs"
 DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
-           file://gnome-libxslt-bug-139-apple-fix.diff"
+           file://gnome-libxslt-bug-139-apple-fix.diff \
+           file://CVE-2025-11731.patch"
 
 SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
 
-- 
2.34.1


