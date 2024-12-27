Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0864E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 06:11:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8786.1735279873484193386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 22:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20915da4f3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR5sfYg020250;
	Thu, 26 Dec 2024 22:11:12 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub4xg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 Dec 2024 22:11:12 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 26 Dec 2024 22:11:11 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 26 Dec 2024 22:11:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: [PATCH] meta/classes/create-spdx.bbclass: support to inherit SPDX class conditionally
Date: Thu, 26 Dec 2024 22:11:11 -0800
Message-ID: <20241227061111.2086879-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=676e4500 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=-6ojaKfNRxLSS2ehq9kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GLHsHPZXfB2H62vASXkZzFFWqdJGXoPy
X-Proofpoint-ORIG-GUID: GLHsHPZXfB2H62vASXkZzFFWqdJGXoPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=933
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 06:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209093

In order to inherit SPDX class conditionally, using variable ${SPDX_CLASS}
to inherit SPDX class other than original 'INHERIT:remove = "create-spdx"'
and INHERIT += "create-spdx-2.2"

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/create-spdx.bbclass     | 3 ++-
 meta/lib/oeqa/selftest/cases/spdx.py | 8 ++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index b604973ae0..35cd63f31e 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -5,4 +5,5 @@
 #
 # Include this class when you don't care what version of SPDX you get; it will
 # be updated to the latest stable version that is supported
-inherit create-spdx-3.0
+SPDX_CLASS ??= "create-spdx-3.0"
+inherit ${SPDX_CLASS}
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index f3b955ed2b..4789041a6a 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -24,8 +24,7 @@ class SPDX22Check(OESelftestTestCase):
     def check_recipe_spdx(self, high_level_dir, spdx_file, target_name):
         config = textwrap.dedent(
             """\
-            INHERIT:remove = "create-spdx"
-            INHERIT += "create-spdx-2.2"
+            SPDX_CLASS = "create-spdx-2.2"
             """
         )
         self.write_config(config)
@@ -89,8 +88,7 @@ class SPDX3CheckBase(object):
         config = (
             textwrap.dedent(
                 f"""\
-                INHERIT:remove = "create-spdx"
-                INHERIT += "{self.SPDX_CLASS}"
+                SPDX_CLASS = "create-spdx-3.0"
                 """
             )
             + textwrap.dedent(extraconf)
@@ -138,8 +136,6 @@ class SPDX3CheckBase(object):
 
 
 class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
-    SPDX_CLASS = "create-spdx-3.0"
-
     def test_base_files(self):
         self.check_recipe_spdx(
             "base-files",
-- 
2.25.1


