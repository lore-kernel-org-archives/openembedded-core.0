Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA2BCD3431
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 13:23:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.49951.1725456231583401644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 06:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9977801a03=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4845fbP1025093
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Sep 2024 06:23:51 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41edurrk51-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 06:23:51 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 06:23:50 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 06:23:50 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] buildcfg: Print bitbake branch and revision when it is in a separate repo
Date: Wed, 4 Sep 2024 06:23:50 -0700
Message-ID: <8f43b5d81fdd28340c6c14fddd307b55ac05883e.1725456147.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725456147.git.liezhi.yang@windriver.com>
References: <cover.1725456147.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iqgi_0yP9fxzhF8c3Yy_3_dJg3cfE60N
X-Proofpoint-ORIG-GUID: iqgi_0yP9fxzhF8c3Yy_3_dJg3cfE60N
X-Authority-Analysis: v=2.4 cv=FbFlx4+6 c=1 sm=1 tr=0 ts=66d85f67 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=EW7mYuzs-HUwQ__6SjoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_11,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 mlxlogscore=645 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409040101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 13:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204207

From: Robert Yang <liezhi.yang@windriver.com>

Clone https://git.openembedded.org/bitbake into poky/bitbake
Before the patch:
meta
meta-poky
meta-yocto-bsp       = "master:377fd06d86f5f3be80a927ee19c30d9557077a7f"

Now:
bitbake              = "master:5bd0c65c217394cde4c8e382eba6cf7f4b909c97"
meta
meta-poky
meta-yocto-bsp       = "master:377fd06d86f5f3be80a927ee19c30d9557077a7f"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/buildcfg.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index 4b22f18f36..5e2de15127 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -73,6 +73,12 @@ def is_layer_modified(path):
 
 def get_layer_revisions(d):
     layers = (d.getVar("BBLAYERS") or "").split()
+    # bitbake may in a separate git repo
+    bitbake_dir = bb.__file__.rsplit('/', 3)[0]
+    bitbake_git_dir = os.path.join(bitbake_dir, '.git')
+    if os.path.exists(bitbake_git_dir):
+        layers.insert(0, bitbake_dir)
+
     revisions = []
     for i in layers:
         revisions.append((i, os.path.basename(i), get_metadata_git_branch(i).strip(), get_metadata_git_revision(i), is_layer_modified(i)))
-- 
2.25.1


