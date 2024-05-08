Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5147C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 12:25:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10872.1715171110975674498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 05:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XxxfBMNh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5858ca950f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44852Eu2013696
	for <openembedded-core@lists.openembedded.org>; Wed, 8 May 2024 05:25:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=QEr7u
	pPpeG2GSf12kJAZJXfSsR6FiuskWJC5ji/Pwko=; b=XxxfBMNhZ1f2IwMep013l
	dlcQ+d231cgmP533rCUODFQgeOUINKmX+2+ZlKztcJ50RalJzUrGcsQN6NTBEFxz
	jhrQAERYUjk+zs0n6fazDiyP6HGO6SbrfcCyW+DEWJiabns1rdPeomhfhNmCSAoy
	GwYISWggCyAMBNJIk3PjsLnA1Q629+V0jj4Ix/6lNInNjL0+3Dg9JOMD84ic4+8T
	PoyHuX88LjS7uH9Zx/+9L4F0SvlpuavdGXvHRz1HVcsKYdFui9HxnWkO4YFT1a35
	5aqPPLngv16YvrA/44oAIAMTL2ewsh0O+O/8ENvtLS39qJZavkCncz8sczHZvpqg
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xyse1grhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 05:25:10 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 8 May 2024 05:25:08 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/2] xserver-xorg: fix CVE-2024-31082
Date: Wed, 8 May 2024 12:24:55 +0000
Message-ID: <20240508122456.1977036-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: -3VVFBQEEMV7dvzCwdDL1yBND9KNbf7N
X-Proofpoint-ORIG-GUID: -3VVFBQEEMV7dvzCwdDL1yBND9KNbf7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_07,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 12:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199119

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xserver-xorg/CVE-2024-31082.patch         | 52 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch
new file mode 100644
index 0000000000..81d76977bb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch
@@ -0,0 +1,52 @@
+From 6c684d035c06fd41c727f0ef0744517580864cef Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 19:07:34 -0700
+Subject: [PATCH] Xquartz: ProcAppleDRICreatePixmap needs to use unswapped
+ length to send reply
+
+CVE-2024-31082
+
+Fixes: 14205ade0 ("XQuartz: appledri: Fix byte swapping in replies")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+CVE: CVE-2024-31082
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/6c684d035c06fd4]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ hw/xquartz/xpr/appledri.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xquartz/xpr/appledri.c b/hw/xquartz/xpr/appledri.c
+index 7757465..40422b6 100644
+--- a/hw/xquartz/xpr/appledri.c
++++ b/hw/xquartz/xpr/appledri.c
+@@ -272,6 +272,7 @@ ProcAppleDRICreatePixmap(ClientPtr client)
+     xAppleDRICreatePixmapReply rep;
+     int width, height, pitch, bpp;
+     void *ptr;
++    CARD32 stringLength;
+
+     REQUEST_SIZE_MATCH(xAppleDRICreatePixmapReq);
+
+@@ -307,6 +308,7 @@ ProcAppleDRICreatePixmap(ClientPtr client)
+     if (sizeof(rep) != sz_xAppleDRICreatePixmapReply)
+         ErrorF("error sizeof(rep) is %zu\n", sizeof(rep));
+
++    stringLength = rep.stringLength;  /* save unswapped value */
+     if (client->swapped) {
+         swaps(&rep.sequenceNumber);
+         swapl(&rep.length);
+@@ -319,7 +321,7 @@ ProcAppleDRICreatePixmap(ClientPtr client)
+     }
+
+     WriteToClient(client, sizeof(rep), &rep);
+-    WriteToClient(client, rep.stringLength, path);
++    WriteToClient(client, stringLength, path);
+
+     return Success;
+ }
+--
+2.40.0
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index b9eed92103..0a8cb7d81a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-0409.patch \
            file://CVE-2024-31080.patch \
            file://CVE-2024-31081.patch \
+           file://CVE-2024-31082.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.40.0


