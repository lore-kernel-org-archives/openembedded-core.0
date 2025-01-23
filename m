Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9755DC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:25:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6794.1737620702903826307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3118843f91=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N6g3QJ013791
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 00:25:02 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqjg9hcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 00:25:02 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 23 Jan 2025 00:25:01 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 23 Jan 2025 00:25:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] dos2unix.bbclass: Fix patch error for recipes that inherit dos2unix.
Date: Thu, 23 Jan 2025 16:25:00 +0800
Message-ID: <20250123082500.903901-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122044245.3463096-1-hongxu.jia@windriver.com>
References: <20250122044245.3463096-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1i1BegpTFhsk8Bjdo_2eqBJvqlZ29gW5
X-Proofpoint-ORIG-GUID: 1i1BegpTFhsk8Bjdo_2eqBJvqlZ29gW5
X-Authority-Analysis: v=2.4 cv=d7QPyQjE c=1 sm=1 tr=0 ts=6791fcde cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=sEjYR0fyHhnjKJuzxcIA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501230063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 08:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210178

While SPDX_INCLUDE_SOURCES = "1", call do_patch in do_create_spdx failed
for these recipes inherit dos2unix

Prepend function do_convert_crlf_to_lf to task do_patch to assure always
run before do_patch

Add dos2unix-native to DEPENDS to assure the existence of command dos2unix
before do_convert_crlf_to_lf is executed in any task

Also remove extra do_convert_crlf_to_lf in archiver.bbclass which
is not necessary any more

Suggested-by Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
Changed in v2:

Do not call bb.build.exec_func to run do_convert_crlf_to_lf in classes/spdx-common,
preprend it to task do_patch to assure always run before do_patch

 meta/classes-recipe/dos2unix.bbclass | 8 +++++---
 meta/classes/archiver.bbclass        | 3 ---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/dos2unix.bbclass b/meta/classes-recipe/dos2unix.bbclass
index 18e89b1cf2..edc8c3afb4 100644
--- a/meta/classes-recipe/dos2unix.bbclass
+++ b/meta/classes-recipe/dos2unix.bbclass
@@ -10,11 +10,13 @@
 # on Linux(LF), which can cause annoying patching errors during
 # git push/checkout processes.
 
-do_convert_crlf_to_lf[depends] += "dos2unix-native:do_populate_sysroot"
+DEPENDS += "dos2unix-native"
 
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


