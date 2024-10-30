Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A27D7496B
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 05:08:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7931.1730264871232870747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 22:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10330b2ea0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U57Ja4019350;
	Wed, 30 Oct 2024 05:07:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gnn0vkgr-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Oct 2024 05:07:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 22:07:46 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 22:07:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>
Subject: [oe-core][PATCH V3 4/6] create-spdx-{2.2,3.0}: fix do_create_spdx dependency while spdx include sources
Date: Tue, 29 Oct 2024 22:07:43 -0700
Message-ID: <20241030050745.3702603-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030050745.3702603-1-hongxu.jia@windriver.com>
References: <20241030050745.3702603-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZIuFmm7b c=1 sm=1 tr=0 ts=6721bf25 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=UXYqD_Jfuu-suqyiGmQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nVdzfkMTOUpixpLf8hiSr2tChMspGGIV
X-Proofpoint-ORIG-GUID: nVdzfkMTOUpixpLf8hiSr2tChMspGGIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_02,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410300038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 05:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206541

Call function ${@create_spdx_source_deps(d)} or ${create_spdx_source_deps(d)}
along with addtask not working, use task do_create_spdx flag 'depends'
to instead

Move function create_spdx_source_deps to spdx-common.bbclass for both of
create-spdx-2.2.bbclass and create-spdx-3.0.bbclass

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


