Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE97C77B61
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 02:08:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2732.1681438121914892176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 19:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34688003be=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33E1uVlM002289
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 02:08:41 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7dp98bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 02:08:41 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 19:08:39 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 19:08:39 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] report-error: make it catch ParseError error
Date: Fri, 14 Apr 2023 10:08:38 +0800
Message-ID: <20230414020838.2696639-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x29wIc25Og1fdAGyh2fSfAUYztscoVcb
X-Proofpoint-GUID: x29wIc25Og1fdAGyh2fSfAUYztscoVcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_18,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=990 adultscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 02:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179984

From: Mingli Yu <mingli.yu@windriver.com>

Make the report-error catch ParseError error as below and then
we can check it directly via error report web.

ParseError at /build/layers/oe-core/meta/recipes-support/curl/curl_7.88.1.bb:32: unparsed line: 'PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/report-error.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 2b2ad56514..041db44941 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -132,6 +132,30 @@ python errorreport_handler () {
             errorreport_savedata(e, data, "error-report.txt")
             bb.utils.unlockfile(lock)
 
+        elif isinstance(e, bb.event.ParseError):
+            bb.utils.mkdirhier(logpath)
+            data = {}
+            machine = e.data.getVar("MACHINE")
+            data['machine'] = machine
+            data['build_sys'] = e.data.getVar("BUILD_SYS")
+            data['nativelsb'] = nativelsb()
+            data['distro'] = e.data.getVar("DISTRO")
+            data['target_sys'] = e.data.getVar("TARGET_SYS")
+            data['failures'] = []
+            data['component'] = "parse"
+            data['branch_commit'] = str(oe.buildcfg.detect_branch(e.data)) + ": " + str(oe.buildcfg.detect_revision(e.data))
+            data['bitbake_version'] = e.data.getVar("BB_VERSION")
+            data['layer_version'] = get_layers_branch_rev(e.data)
+            data['local_conf'] = get_conf_data(e, 'local.conf')
+            data['auto_conf'] = get_conf_data(e, 'auto.conf')
+            taskdata={}
+            taskdata['log'] = str(e._msg)
+            taskdata['task'] = str(e._msg)
+            data['failures'].append(taskdata)
+            lock = bb.utils.lockfile(datafile + '.lock')
+            errorreport_savedata(e, data, "error-report.txt")
+            bb.utils.unlockfile(lock)
+
         elif isinstance(e, bb.event.BuildCompleted):
             lock = bb.utils.lockfile(datafile + '.lock')
             jsondata = json.loads(errorreport_getdata(e))
@@ -145,4 +169,4 @@ python errorreport_handler () {
 }
 
 addhandler errorreport_handler
-errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed bb.event.NoProvider"
+errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed bb.event.NoProvider bb.event.ParseError"
-- 
2.25.1


