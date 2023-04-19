Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7792C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 05:30:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30876.1681882213819110158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 22:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34734a0540=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J4mRI8007268
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:30:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyjwaw1cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:30:12 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33J5UCRZ028014
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:30:12 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyjwaw1ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 19 Apr 2023 05:30:12 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 22:30:11 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 22:30:10 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>, <luca.ceresoli@bootlin.com>
Subject: [PATCH v2] report-error: make it catch ParseError error
Date: Wed, 19 Apr 2023 13:30:09 +0800
Message-ID: <20230419053009.384905-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414113129.12a7b652@booty>
References: <20230414113129.12a7b652@booty>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vs9-oEB_AluvNIe3BnaVLuqcY-0SSghq
X-Proofpoint-ORIG-GUID: rAxZ8wf88nJ6CONBQF5WfB5htShc5Z3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 05:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180207

From: Mingli Yu <mingli.yu@windriver.com>

Make the report-error catch ParseError error as below and then
we can check it directly via error report web.

ParseError at /build/layers/oe-core/meta/recipes-support/curl/curl_7.88.1.bb:32: unparsed line: 'PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/report-error.bbclass | 52 ++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 2b2ad56514..1452513a66 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -39,6 +39,19 @@ def get_conf_data(e, filename):
                     jsonstring=jsonstring + line
     return jsonstring
 
+def get_common_data(e):
+    data = {}
+    data['machine'] = e.data.getVar("MACHINE")
+    data['build_sys'] = e.data.getVar("BUILD_SYS")
+    data['distro'] = e.data.getVar("DISTRO")
+    data['target_sys'] = e.data.getVar("TARGET_SYS")
+    data['branch_commit'] = str(oe.buildcfg.detect_branch(e.data)) + ": " + str(oe.buildcfg.detect_revision(e.data))
+    data['bitbake_version'] = e.data.getVar("BB_VERSION")
+    data['layer_version'] = get_layers_branch_rev(e.data)
+    data['local_conf'] = get_conf_data(e, 'local.conf')
+    data['auto_conf'] = get_conf_data(e, 'auto.conf')
+    return data
+
 python errorreport_handler () {
         import json
         import codecs
@@ -56,19 +69,10 @@ python errorreport_handler () {
         if isinstance(e, bb.event.BuildStarted):
             bb.utils.mkdirhier(logpath)
             data = {}
-            machine = e.data.getVar("MACHINE")
-            data['machine'] = machine
-            data['build_sys'] = e.data.getVar("BUILD_SYS")
+            data = get_common_data(e)
             data['nativelsb'] = nativelsb()
-            data['distro'] = e.data.getVar("DISTRO")
-            data['target_sys'] = e.data.getVar("TARGET_SYS")
             data['failures'] = []
             data['component'] = " ".join(e.getPkgs())
-            data['branch_commit'] = str(oe.buildcfg.detect_branch(e.data)) + ": " + str(oe.buildcfg.detect_revision(e.data))
-            data['bitbake_version'] = e.data.getVar("BB_VERSION")
-            data['layer_version'] = get_layers_branch_rev(e.data)
-            data['local_conf'] = get_conf_data(e, 'local.conf')
-            data['auto_conf'] = get_conf_data(e, 'auto.conf')
             lock = bb.utils.lockfile(datafile + '.lock')
             errorreport_savedata(e, data, "error-report.txt")
             bb.utils.unlockfile(lock)
@@ -110,19 +114,10 @@ python errorreport_handler () {
         elif isinstance(e, bb.event.NoProvider):
             bb.utils.mkdirhier(logpath)
             data = {}
-            machine = e.data.getVar("MACHINE")
-            data['machine'] = machine
-            data['build_sys'] = e.data.getVar("BUILD_SYS")
+            data = get_common_data(e)
             data['nativelsb'] = nativelsb()
-            data['distro'] = e.data.getVar("DISTRO")
-            data['target_sys'] = e.data.getVar("TARGET_SYS")
             data['failures'] = []
             data['component'] = str(e._item)
-            data['branch_commit'] = str(oe.buildcfg.detect_branch(e.data)) + ": " + str(oe.buildcfg.detect_revision(e.data))
-            data['bitbake_version'] = e.data.getVar("BB_VERSION")
-            data['layer_version'] = get_layers_branch_rev(e.data)
-            data['local_conf'] = get_conf_data(e, 'local.conf')
-            data['auto_conf'] = get_conf_data(e, 'auto.conf')
             taskdata={}
             taskdata['log'] = str(e)
             taskdata['package'] = str(e._item)
@@ -132,6 +127,21 @@ python errorreport_handler () {
             errorreport_savedata(e, data, "error-report.txt")
             bb.utils.unlockfile(lock)
 
+        elif isinstance(e, bb.event.ParseError):
+            bb.utils.mkdirhier(logpath)
+            data = {}
+            data = get_common_data(e)
+            data['nativelsb'] = nativelsb()
+            data['failures'] = []
+            data['component'] = "parse"
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
@@ -145,4 +155,4 @@ python errorreport_handler () {
 }
 
 addhandler errorreport_handler
-errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed bb.event.NoProvider"
+errorreport_handler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskFailed bb.event.NoProvider bb.event.ParseError"
-- 
2.25.1


