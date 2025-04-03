Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE03DC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 08:53:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8627.1743670387798140280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61880f2290=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5335e243032407
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Apr 2025 01:53:07 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0r8fn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 01:53:07 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 3 Apr 2025 01:53:06 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 3 Apr 2025 01:53:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] initscripts: add function log_success_msg/log_failure_msg/log_warning_msg
Date: Thu, 3 Apr 2025 16:53:05 +0800
Message-ID: <20250403085305.3667237-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=67ee4c73 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=IHY4GhH-AAAA:8 a=t7CeM3EgAAAA:8 a=lfWvFnmza6eDiIdRuE4A:9
 a=5V7z7r4ZuTEA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=D2-2_G0xO5IXdrd33UjC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XWsa32w7_AKW8rVVUSOjxTd6IFBGi8ZG
X-Proofpoint-GUID: XWsa32w7_AKW8rVVUSOjxTd6IFBGi8ZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504030033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 08:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214308

From: Changqing Li <changqing.li@windriver.com>

* add function log_success_msg/log_failure_msg/log_warning_msg, some
packages still use these functions, like mariadb, refer [1], without
these function, with sysV init manager, mariadb will report error:

root@qemux86-64:~# /etc/init.d/mysqld status
/etc/init.d/mysqld: line 383: log_success_msg: command not found

* remove RCONFLICTS with lsbinitscripts, LSB support already remove in
  [2]

[1] https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104
[2] https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290
[3] https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../initscripts/initscripts-1.0/functions     | 21 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 -
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 35aebd4a55..7fc19c808b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -92,3 +92,24 @@ passed() {
     echo -n -e "${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}"
     return $rc
 }
+
+log_success_msg()
+{
+    echo -n $@
+    success
+    echo
+}
+
+log_failure_msg()
+{
+    echo -n $@
+    failure
+    echo
+}
+
+log_warning_msg()
+{
+    echo -n $@
+    warning
+    echo
+}
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 98693fa66e..0bc078c5eb 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -54,7 +54,6 @@ RDEPENDS:${PN} = "initd-functions \
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS:${PN} = "${PN}-functions"
 RPROVIDES:${PN}-functions = "initd-functions"
-RCONFLICTS:${PN}-functions = "lsbinitscripts"
 FILES:${PN}-functions = "${sysconfdir}/init.d/functions*"
 FILES:${PN}-sushell = "${base_sbindir}/sushell"
 
-- 
2.34.1


