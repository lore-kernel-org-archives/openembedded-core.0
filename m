Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18542C41513
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 05:41:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6808.1716961308731598653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 22:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6879d90fcd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T54DVb025354
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:41:48 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5kt1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:41:47 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 22:41:45 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 4/5] ghostscript: fix CVE-2024-29510
Date: Wed, 29 May 2024 05:41:19 +0000
Message-ID: <20240529054120.2288334-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240529054120.2288334-1-archana.polampalli@windriver.com>
References: <20240529054120.2288334-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: MTwxmGKFNCDfBxrwQVIt6lf-RHneMDmZ
X-Proofpoint-GUID: MTwxmGKFNCDfBxrwQVIt6lf-RHneMDmZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 05:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199986

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2024-29510.patch          | 84 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
new file mode 100644
index 0000000000..0234c79c7d
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
@@ -0,0 +1,84 @@
+From 3b1735085ecef20b29e8db3416ab36de93e86d1f Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 21 Mar 2024 09:01:15 +0000
+Subject: [PATCH 4/5] Uniprint device - prevent string configuration changes
+ when SAFER
+
+Bug #707662
+
+We cannot sanitise the string arguments used by the Uniprint device
+because they can potentially include anything.
+
+This commit ensures that these strings are locked and cannot be
+changed by PostScript once SAFER is activated. Full configuration from
+the command line is still possible (see the *.upp files in lib).
+
+This addresses CVE-2024-29510
+
+CVE: CVE-2024-29510
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=3b1735085ecef20b29e]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ devices/gdevupd.c | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/devices/gdevupd.c b/devices/gdevupd.c
+index 6635984..7952165 100644
+--- a/devices/gdevupd.c
++++ b/devices/gdevupd.c
+@@ -1886,6 +1886,16 @@ out on this copies.
+       if(!upd_strings[i]) continue;
+       UPD_PARAM_READ(param_read_string,upd_strings[i],value,udev->memory);
+       if(0 == code) {
++        if (gs_is_path_control_active(udev->memory)) {
++            if (strings[i].size != value.size)
++              error = gs_error_invalidaccess;
++            else {
++                if (strings[i].data && memcmp(strings[i].data, value.data, strings[i].size) != 0)
++                    error = gs_error_invalidaccess;
++            }
++            if (error < 0)
++                goto exit;
++        }
+          if(0 <= error) error |= UPD_PUT_STRINGS;
+          UPD_MM_DEL_PARAM(udev->memory, strings[i]);
+          if(!value.size) {
+@@ -1903,6 +1913,26 @@ out on this copies.
+       if(!upd_string_a[i]) continue;
+       UPD_PARAM_READ(param_read_string_array,upd_string_a[i],value,udev->memory);
+       if(0 == code) {
++          if (gs_is_path_control_active(udev->memory)) {
++              if (string_a[i].size != value.size)
++                  error = gs_error_invalidaccess;
++              else {
++                  int loop;
++                  for (loop = 0;loop < string_a[i].size;loop++) {
++                      gs_param_string *tmp1 = (gs_param_string *)&(string_a[i].data[loop]);
++                      gs_param_string *tmp2 = (gs_param_string *)&value.data[loop];
++
++                      if (tmp1->size != tmp2->size)
++                          error = gs_error_invalidaccess;
++                      else {
++                          if (tmp1->data && memcmp(tmp1->data, tmp2->data, tmp1->size) != 0)
++                              error = gs_error_invalidaccess;
++                      }
++                  }
++              }
++            if (error < 0)
++                goto exit;
++          }
+          if(0 <= error) error |= UPD_PUT_STRING_A;
+          UPD_MM_DEL_APARAM(udev->memory, string_a[i]);
+          if(!value.size) {
+@@ -2097,6 +2127,7 @@ transferred into the device-structure. In the case of "uniprint", this may
+       if(0 > code) error = code;
+    }
+
++exit:
+    if(0 < error) { /* Actually something loaded without error */
+
+       if(!(upd = udev->upd)) {
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 36c5aa3285..1fd08d1cfe 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -48,6 +48,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-33869-0002.patch \
                 file://CVE-2024-33871-0001.patch \
                 file://CVE-2024-33871-0002.patch \
+                file://CVE-2024-29510.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.40.0


