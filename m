Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7C6C27C44
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 05:42:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6820.1716961366555709678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 22:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6879d90fcd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T5ZkTO027333
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 22:42:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybfggbfwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 22:42:46 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 22:42:44 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 3/4] ghostscript: fix CVE-2024-33871
Date: Wed, 29 May 2024 05:42:24 +0000
Message-ID: <20240529054225.2302069-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240529054225.2302069-1-archana.polampalli@windriver.com>
References: <20240529054225.2302069-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: j2hoM7eRCcEcRMtKnJjHYGXLfdcHBZdl
X-Proofpoint-ORIG-GUID: j2hoM7eRCcEcRMtKnJjHYGXLfdcHBZdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199990

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2024-33871.patch          | 43 +++++++++++++++++++
 .../ghostscript/ghostscript_10.02.1.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
new file mode 100644
index 0000000000..abe6384997
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
@@ -0,0 +1,43 @@
+From 7145885041bb52cc23964f0aa2aec1b1c82b5908 Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Mon, 22 Apr 2024 13:33:47 +0100
+Subject: [PATCH 4/5] OPVP device - prevent unsafe parameter change with SAFER
+
+Bug #707754 "OPVP device - Arbitrary code execution via custom Driver library"
+
+The "Driver" parameter for the "opvp"/"oprp" device specifies the name
+of a dynamic library and allows any library to be loaded.
+
+The patch does not allow changing this parameter after activating path
+control.
+
+This addresses CVE-2024-33871
+
+CVE: CVE-2024-33871
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=7145885041bb52cc2396]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ contrib/opvp/gdevopvp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/contrib/opvp/gdevopvp.c b/contrib/opvp/gdevopvp.c
+index 74200cf..80eb23b 100644
+--- a/contrib/opvp/gdevopvp.c
++++ b/contrib/opvp/gdevopvp.c
+@@ -3456,6 +3456,12 @@ _put_params(gx_device *dev, gs_param_list *plist)
+     code = param_read_string(plist, pname, &vdps);
+     switch (code) {
+     case 0:
++        if (gs_is_path_control_active(dev->memory)
++            && (!opdev->globals.vectorDriver || strlen(opdev->globals.vectorDriver) != vdps.size
++                || memcmp(opdev->globals.vectorDriver, vdps.data, vdps.size) != 0)) {
++            param_signal_error(plist, pname, gs_error_invalidaccess);
++            return_error(gs_error_invalidaccess);
++        }
+         buff = realloc(buff, vdps.size + 1);
+         memcpy(buff, vdps.data, vdps.size);
+         buff[vdps.size] = 0;
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 91285ed2ad..8bda4404cc 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://CVE-2024-33870.patch \
            file://CVE-2024-33869-0001.patch \
            file://CVE-2024-33869-0002.patch \
+           file://CVE-2024-33871.patch \
            "
 
 SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
-- 
2.40.0


