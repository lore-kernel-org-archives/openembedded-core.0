Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EFDC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 09:36:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.65849.1680514554868629673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 02:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3457bee8e5=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3339NQga031446
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Apr 2023 09:35:54 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pp9u4husw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 09:35:53 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 3 Apr 2023 02:35:52 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 3 Apr 2023 02:35:52 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] report-error: catch Nothing PROVIDES error
Date: Mon, 3 Apr 2023 17:35:51 +0800
Message-ID: <20230403093551.1972493-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KZNDB75JxxfdomriHVzbapgVHRJ9Id0X
X-Proofpoint-GUID: KZNDB75JxxfdomriHVzbapgVHRJ9Id0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=796 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 09:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179604

From: Mingli Yu <mingli.yu@windriver.com>

Make the report-error catch Nothing PROVIDES error and then
we can check it directly via error report web.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/report-error.bbclass | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 2f692fbbcc..2b2ad56514 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -107,6 +107,31 @@ python errorreport_handler () {
             errorreport_savedata(e, jsondata, "error-report.txt")
             bb.utils.unlockfile(lock)
 
+        elif isinstance(e, bb.event.NoProvider):
+            bb.utils.mkdirhier(logpath)
+            data = {}
+            machine = e.data.getVar("MACHINE")
+            data['machine'] = machine
+            data['build_sys'] = e.data.getVar("BUILD_SYS")
+            data['nativelsb'] = nativelsb()
+            data['distro'] = e.data.getVar("DISTRO")
+            data['target_sys'] = e.data.getVar("TARGET_SYS")
+            data['failures'] = []
+            data['component'] = str(e._item)
+            data['branch_commit'] = str(oe.buildcfg.detect_branch(e.data)) + ": " + str(oe.buildcfg.detect_revision(e.data))
+            data['bitbake_version'] = e.data.getVar("BB_VERSION")
+            data['layer_version'] = get_layers_branch_rev(e.data)
+            data['local_conf'] = get_conf_data(e, 'local.conf')
+            data['auto_conf'] = get_conf_data(e, 'auto.conf')
+            taskdata={}
+            taskdata['log'] = str(e)
+            taskdata['package'] = str(e._item)
+            taskdata['task'] = "Nothing provides " + "'" + str(e._item) + "'"
+            data['failures'].append(taskdata)
+            lock = bb.utils.lockfile(datafile + '.lock')
+            errorreport_savedata(e, data, "error-report.txt")
+            bb.utils.unlockfile(lock)
+
         elif isinstance(e, bb.event.BuildCompleted):
             lock = bb.utils.lockfile(datafile + '.lock')
             jsondata = json.loads(errorreport_getdata(e))
@@ -120,4 +145,4 @@ python errorreport_handler () {
 }
 
 addhandler errorreport_handler
-errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed"
+errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed bb.event.NoProvider"
-- 
2.25.1


