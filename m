Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8B8C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 09:12:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7207.1737623547808726201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 01:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3118843f91=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7QOoe013295;
	Thu, 23 Jan 2025 09:12:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3hhcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jan 2025 09:12:26 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 23 Jan 2025 01:12:24 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 23 Jan 2025 01:12:24 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3] dos2unix.bbclass: Fix patch error for recipes that inherit dos2unix.
Date: Thu, 23 Jan 2025 17:12:23 +0800
Message-ID: <20250123091223.1535398-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: efGKW5vwmk-XZvszJ3JqahkIXaDI2-xC
X-Proofpoint-ORIG-GUID: efGKW5vwmk-XZvszJ3JqahkIXaDI2-xC
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=679207fa cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=sEjYR0fyHhnjKJuzxcIA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501230069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 09:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210183

While SPDX_INCLUDE_SOURCES = "1", call do_patch in do_create_spdx failed
for these recipes inherit dos2unix

Prepend function convert_crlf_to_lf to task do_patch to assure always
run before do_patch

Add dos2unix-native to PATCHDEPENDENCY to assure the existence of
command dos2unix before convert_crlf_to_lf is executed in do_patch
- The do_creat_spdx task has added PATCHDEPENDENCY to depends
- The do_unpack_and_patch task has added task after do_patch
  (addtask do_unpack_and_patch after do_patch do_preconfigure)

Also remove extra do_convert_crlf_to_lf in archiver.bbclass which
is not necessary any more

Suggested-by Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
Changed in v2: 

Do not call bb.build.exec_func to run do_convert_crlf_to_lf in classes/spdx-common,
preprend it to task do_patch to assure always run before do_patch

Changed in v3:
Add dos2unix-native to PATCHDEPENDENCY other than to DEPENDS
which is too late for do_patch

 meta/classes-recipe/dos2unix.bbclass | 8 +++++---
 meta/classes/archiver.bbclass        | 3 ---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/dos2unix.bbclass b/meta/classes-recipe/dos2unix.bbclass
index 18e89b1cf2..3a094197a2 100644
--- a/meta/classes-recipe/dos2unix.bbclass
+++ b/meta/classes-recipe/dos2unix.bbclass
@@ -10,11 +10,13 @@
 # on Linux(LF), which can cause annoying patching errors during
 # git push/checkout processes.
 
-do_convert_crlf_to_lf[depends] += "dos2unix-native:do_populate_sysroot"
+PATCHDEPENDENCY += "dos2unix-native:do_populate_sysroot"
 
 # Convert CRLF line terminators to LF
-do_convert_crlf_to_lf () {
+convert_crlf_to_lf () {
 	find ${S} -type f -exec dos2unix {} \;
 }
 
-addtask convert_crlf_to_lf after do_unpack before do_patch
+python do_patch:prepend() {
+    bb.build.exec_func('convert_crlf_to_lf', d)
+}
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index df271feddd..4404f0c032 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -507,9 +507,6 @@ python do_unpack_and_patch() {
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
 
-    if bb.data.inherits_class('dos2unix', d):
-        bb.build.exec_func('do_convert_crlf_to_lf', d)
-
     # Make sure gcc and kernel sources are patched only once
     if not (d.getVar('SRC_URI') == "" or is_work_shared(d)):
         bb.build.exec_func('do_patch', d)
-- 
2.34.1


