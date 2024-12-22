Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370FAE7718D
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 16:02:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26608.1734883363010202169
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 08:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2086e2608f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMFjeln026233
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 08:02:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2p8r58-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 08:02:42 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 22 Dec 2024 08:02:38 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 22 Dec 2024 08:02:38 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] base/features_check: Make PARSE_ALL_RECIPES and SOURCE_MIRROR_FETCH boolean
Date: Sun, 22 Dec 2024 08:02:37 -0800
Message-ID: <d0ea97b6aef8612c3d0c936b226fc313a2da6bd7.1734883316.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1734883316.git.liezhi.yang@windriver.com>
References: <cover.1734883316.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GfO9ppArKBaLoNibqXMsbCkgtca2jfiS
X-Authority-Analysis: v=2.4 cv=LtNoymdc c=1 sm=1 tr=0 ts=67683822 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=rO0jUEH_k9kR1O0LtbIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GfO9ppArKBaLoNibqXMsbCkgtca2jfiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-22_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412220148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 16:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209006

From: Robert Yang <liezhi.yang@windriver.com>

So that value "0" can turn them off.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/base.bbclass           | 7 ++++---
 meta/classes-recipe/features_check.bbclass | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 101ecdcf0f..c8268abcdf 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -330,7 +330,7 @@ python base_eventhandler() {
         # particular.
         #
         pn = d.getVar('PN')
-        source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False)
+        source_mirror_fetch = bb.utils.to_boolean(d.getVar('SOURCE_MIRROR_FETCH', False))
         if not source_mirror_fetch:
             provs = (d.getVar("PROVIDES") or "").split()
             multiprovidersallowed = (d.getVar("BB_MULTI_PROVIDER_ALLOWED") or "").split()
@@ -553,7 +553,7 @@ python () {
         d.appendVarFlag('do_devshell', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
 
     need_machine = d.getVar('COMPATIBLE_MACHINE')
-    if need_machine and not d.getVar('PARSE_ALL_RECIPES', False):
+    if need_machine and not bb.utils.to_boolean(d.getVar('PARSE_ALL_RECIPES', False)):
         import re
         compat_machines = (d.getVar('MACHINEOVERRIDES') or "").split(":")
         for m in compat_machines:
@@ -562,7 +562,8 @@ python () {
         else:
             raise bb.parse.SkipRecipe("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE'))
 
-    source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False) or d.getVar('PARSE_ALL_RECIPES', False)
+    source_mirror_fetch = bb.utils.to_boolean(d.getVar('SOURCE_MIRROR_FETCH', False)) or \
+            bb.utils.to_boolean(d.getVar('PARSE_ALL_RECIPES', False))
     if not source_mirror_fetch:
         need_host = d.getVar('COMPATIBLE_HOST')
         if need_host:
diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-recipe/features_check.bbclass
index 163a7bc3fc..4e122ecaef 100644
--- a/meta/classes-recipe/features_check.bbclass
+++ b/meta/classes-recipe/features_check.bbclass
@@ -16,7 +16,7 @@
 
 
 python () {
-    if d.getVar('PARSE_ALL_RECIPES', False):
+    if bb.utils.to_boolean(d.getVar('PARSE_ALL_RECIPES', False)):
         return
 
     unused = True
-- 
2.44.1


