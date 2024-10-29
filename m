Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2013D2AB01
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 09:17:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14986.1730193449553403419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 02:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=103298b06a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T4cLXq031504;
	Tue, 29 Oct 2024 09:17:28 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8kau1-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Oct 2024 09:17:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 02:17:24 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 02:17:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>
Subject: [oe-core][PATCH 5/7] create-spdx-{2.2,3.0}: fix do_create_spdx
Date: Tue, 29 Oct 2024 02:17:21 -0700
Message-ID: <20241029091723.2851061-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091723.2851061-1-hongxu.jia@windriver.com>
References: <20241029091723.2851061-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6r2_mKapRVXCZ_ZS1QFVYPPdtLvDUAdQ
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=6720a828 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=_jWdJo5MRqURDcVo7_AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6r2_mKapRVXCZ_ZS1QFVYPPdtLvDUAdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_04,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=910
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410290072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206482

Call function ${@create_spdx_source_deps(d)} or ${create_spdx_source_deps(d)}
along with addtask not working, use task do_create_spdx flag 'depends'
to instead

Move create_spdx_source_deps to meta/lib/oe/spdx_common.py for both
of SPDX 2.2 and SPDX 3.0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/create-spdx-2.2.bbclass |  5 ++++-
 meta/classes/create-spdx-3.0.bbclass | 19 ++++---------------
 meta/classes/spdx-common.bbclass     | 21 +++++++++++++++++++++
 meta/lib/oe/spdx_common.py           |  4 ++++
 4 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index cd1d6819bf..27242ecf70 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -584,7 +584,10 @@ addtask do_create_spdx_setscene
 
 do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
-do_create_spdx[depends] += "${PATCHDEPENDENCY}"
+do_create_spdx[depends] += " \
+    ${PATCHDEPENDENCY} \
+    ${@create_spdx_source_deps(d)} \
+"
 
 python do_create_runtime_spdx() {
     from datetime import datetime, timezone
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 5f0590198f..bc23d2d211 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -132,22 +132,8 @@ addtask do_create_spdx after \
     do_collect_spdx_deps \
     do_deploy_source_date_epoch \
     do_populate_sysroot do_package do_packagedata \
-    ${create_spdx_source_deps(d)} \
     before do_populate_sdk do_populate_sdk_ext do_build do_rm_work
 
-def create_spdx_source_deps(d):
-    deps = []
-    if d.getVar("SPDX_INCLUDE_SOURCES") == "1":
-        deps.extend([
-            # do_unpack is a hack for now; we only need it to get the
-            # dependencies do_unpack already has so we can extract the source
-            # ourselves
-            "do_unpack",
-            # For kernel source code
-            "do_shared_workdir",
-        ])
-    return " ".join(deps)
-
 SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
 do_create_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
@@ -159,7 +145,10 @@ addtask do_create_spdx_setscene
 
 do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
-do_create_spdx[depends] += "${PATCHDEPENDENCY}"
+do_create_spdx[depends] += " \
+    ${PATCHDEPENDENCY} \
+    ${@create_spdx_source_deps(d)} \
+"
 
 python do_create_package_spdx() {
     import oe.spdx30_tasks
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index cd9cc0db98..ad02da5cd6 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -39,6 +39,27 @@ SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
+def create_spdx_source_deps(d):
+    import oe.spdx_common
+
+    deps = []
+    if d.getVar("SPDX_INCLUDE_SOURCES") == "1":
+        pn = d.getVar('PN')
+        # do_unpack is a hack for now; we only need it to get the
+        # dependencies do_unpack already has so we can extract the source
+        # ourselves
+        if oe.spdx_common.has_task(d, "do_unpack"):
+            deps.append("%s:do_unpack" % pn)
+
+        if oe.spdx_common.is_work_shared_spdx(d) and \
+           oe.spdx_common.process_sources(d):
+            # For kernel source code
+            if oe.spdx_common.has_task(d, "do_shared_workdir"):
+                deps.append("%s:do_shared_workdir" % pn)
+
+    return " ".join(deps)
+
+
 python do_collect_spdx_deps() {
     # This task calculates the build time dependencies of the recipe, and is
     # required because while a task can deptask on itself, those dependencies
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 1ea55419ae..7a85579f64 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -226,6 +226,10 @@ def get_patched_src(d):
         d.setVar("WORKDIR", workdir)
 
 
+def has_task(d, task):
+    return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVarFlag(task, "noexec", False))
+
+
 def fetch_data_to_uri(fd, name):
     """
     Translates a bitbake FetchData to a string URI
-- 
2.25.1


