Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B850BD10BE4
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 03:25:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4382.1729913125363708125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 20:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=002900eeaf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q3OaKJ000751;
	Fri, 25 Oct 2024 20:25:22 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c8240wrm-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 25 Oct 2024 20:25:22 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 20:25:20 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 20:25:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>
Subject: [oe-core][PATCH 4/6] meta/lib/oe/spdx30_tasks.py: improve debug log in add_package_files
Date: Fri, 25 Oct 2024 20:25:17 -0700
Message-ID: <20241026032519.1968518-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241026032519.1968518-1-hongxu.jia@windriver.com>
References: <20241026032519.1968518-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UrgxNPwB c=1 sm=1 tr=0 ts=671c6122 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=24AZYWMyAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=O3SGjoYcfhoxR4A708MA:9 a=aAh4nC1LCUkA:10
 a=bG88sKzkDEFeXWNnvthB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: geB5D1_wp0wOywip20pFCq9m4q2Ea_nD
X-Proofpoint-GUID: geB5D1_wp0wOywip20pFCq9m4q2Ea_nD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410260026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Oct 2024 03:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206385

While SPDX_INCLUDE_SOURCES = "1" [1], there are mess of `Adding file'
in debug log
'''
DEBUG: Adding file tmp/work/x86_64-linux/gettext-minimal-native/0.22.5/spdx/3.0.1/work/sources-unpack/COPYING to http://spdx.org/spdxdocs/gettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/e2c2366654a818397af8b8ddb45fda88c2c71aa2d71695861f82376a658d8e66/document/gettext-minimal-native
DEBUG: Adding file tmp/work/x86_64-linux/gettext-minimal-native/0.22.5/spdx/3.0.1/work/gettext-0.22.5/.tarball-version to http://spdx.org/spdxdocs/gettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/e2c2366654a818397af8b8ddb45fda88c2c71aa2d71695861f82376a658d8e66/document/gettext-minimal-native
'''

Summary the total number other than print for each file.
'''
DEBUG: Start adding files to http://spdx.org/spdxdocs/gettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/f5e0e04913ac4c595be791fc001d545a77519ed6ee8c743deef721ca0898bc94/document/gettext-minimal-native
DEBUG: Added 7201 files to http://spdx.org/spdxdocs/gettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/f5e0e04913ac4c595be791fc001d545a77519ed6ee8c743deef721ca0898bc94/document/gettext-minimal-native
'''
Correct file_counter to start with 0

[1] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-SPDX_INCLUDE_SOURCES

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/spdx30_tasks.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index e0b656d81f..575b66ea5d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -144,19 +144,19 @@ def add_package_files(
 
     spdx_files = set()
 
-    file_counter = 1
+    bb.debug(1, "Start adding files to %s" % (objset.doc._id))
+    file_counter = 0
     for subdir, dirs, files in os.walk(topdir):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
             dirs[:] = [d for d in dirs if d not in ignore_top_level_dirs]
 
+
         for file in files:
             filepath = Path(subdir) / file
             if filepath.is_symlink() or not filepath.is_file():
                 continue
 
-            bb.debug(1, "Adding file %s to %s" % (filepath, objset.doc._id))
-
             filename = str(filepath.relative_to(topdir))
             file_purposes = get_purposes(filepath)
 
@@ -187,6 +187,8 @@ def add_package_files(
 
             file_counter += 1
 
+    bb.debug(1, "Added %d files to %s" % (file_counter, objset.doc._id))
+
     return spdx_files
 
 
-- 
2.25.1


