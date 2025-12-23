Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244BDE6C614
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:20:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96744.1766474401127247298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AiR2gQ8I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44524d5110=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN0xWKR4000126
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=F7r+9XEyXtAJuAOC9wzQ
	mA6H688tFmrzHho5YIjdYPs=; b=AiR2gQ8IoSDH9LEw/J5vflpItuAJba95HuTH
	tcGO6oTaTEu+O4blYPRWSvHEK49tIaw2Wahwm1zia5/z2URTvaaXr94NL6pUrCcC
	XG7VwqRwgg3Xv6U/PVvWfr1ZZb0r2BunyjGKVaIGCA3y4d7/ZretrQn8NGQao5dM
	Wu/rx5KNIU38kp5+P1adnC/sDWTxrPqWMw+4YgFPtbezFV+aenabmo9uLLpdORc0
	tVO3YqM1hqctxOWnPHtVBKFX7gzCSLluDBd/U4/Bmq0XKCQH8Uei+V4ZaIeFc5+G
	Uwvlr3UOgCTPt66QfX/e1rS8dQfLFbfIX0YEK6fdT0EH6Hejtw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js72qq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:20:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 23:19:58 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 23:19:58 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] libxslt: Fix CVE-2025-11731
Date: Tue, 23 Dec 2025 15:19:51 +0800
Message-ID: <20251223071951.3442541-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _1Lt5BzkbFFGbhHlAGVngjRga1gmZite
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=694a42a0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=cm27Pg_UAAAA:8 a=6M9TsETqaMe1GmVcjvcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _1Lt5BzkbFFGbhHlAGVngjRga1gmZite
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA2MCBTYWx0ZWRfX7EAUaRMAzhBC
 76HRdFrqLjioDhM8vRHyTmc/OwNDoBTphuskoN8HC1KUSTqnz7b+IuHvVOg4iYfgC1+/yBiKA6C
 Q0cC1PTuc0tQxnWcp/s4xktpAJmwoXtctagxAXtPxJNL7C8EVUnXiMDz8tLgLsVgjjTjKZQ0go0
 bHgQGKK+FaWFKcEndxtLkPMyV6+PlktAmrsAtbsvQehgxbFbs5Nh6DAH+xNTlGE0qgMzY6Sf3yw
 cm+GQcN5/lCmd/05TYbB2mUC9qwq2Gn1QzvE4sv3Gzd37ko99u4bxqLSczwPVn7J5qnlvh6LFoP
 cqThTwygS7rulLn9zWCU7QrC0rS1GHsPVPA84sLM7weDJd8ci3DKfnqksJraVfa5mlGsv/Tvu+M
 CmWQro/gvxAqDkOyyjgPGW817F6lUJ9yB2lgG4hDsY1Kmyt9znPKmMIdXDPiDxc1aI7BunQW8tu
 bfLMt6QYfD/mZKBr1xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228454

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2025-11731.

[1] https://gitlab.gnome.org/GNOME/libxslt/-/commit/fe508f201efb9ea37bfbe95413b8b28251497de3

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libxslt/libxslt/CVE-2025-11731.patch      | 42 +++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch b/meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch
new file mode 100644
index 00000000000..19702af6cb6
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch
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
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index fc1fafbf195..4f86069d774 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/libxslt/1.1/libxslt-${PV}.tar.xz \
            file://CVE-2023-40403-004.patch \
            file://CVE-2023-40403-005.patch \
            file://CVE-2025-7424.patch \
+           file://CVE-2025-11731.patch \
           "
 
 SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
-- 
2.34.1


