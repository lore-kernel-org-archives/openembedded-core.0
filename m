Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00E4C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 04:41:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.71374.1752468081770643138
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 21:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9290718024=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56E3JOAX561940
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 04:41:20 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ufb1sn18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 04:41:20 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sun, 13 Jul 2025 21:41:19 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sun, 13 Jul 2025 21:41:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rpm: keep leading `/' from sed operation
Date: Mon, 14 Jul 2025 12:41:17 +0800
Message-ID: <20250714044117.3594938-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LYbn5m5p-W_bRKC8RGBdwAqKH723kBvp
X-Proofpoint-ORIG-GUID: LYbn5m5p-W_bRKC8RGBdwAqKH723kBvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAyMSBTYWx0ZWRfX3a4IlH8j8jLv
 0/uyXdS2vNCoZvhS6hMwwg754ucT7xQimwcA2Vl3Usk+mZt6/n3FA1Y/ExbgVg6dflZihe1dKya
 eC+WoubQbAiweDLbHBZZYMnQG/R771FJlBF3maQNc1Ly1D9TmwrSwb2eR0sgBG0H9uQ+AZ4VuHs
 Cn4+a6qN2cgui2/YUHzqsKCynSBoKfuYr676u722DxvL4YI8Ly9AhDLy9ESxnt9M/NAbiaiRqpY
 rFlXvQ1xk1U6FRywz8VYPvAMjuhsAhNodjs5ZZdmrXVUSeQaD956WVrscxKUhWrOY660vMoqltM
 B4NIbCYcID5v7CNH9Z4sR47sLt1NjwO8F5JekRfx6wPWM0/T1n3Fhu0mH0tjS0YNO43IIF3pXiO
 /TtSNaLm
X-Authority-Analysis: v=2.4 cv=bOMWIO+Z c=1 sm=1 tr=0 ts=68748a70 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=f1hami8VAAAA:8 a=t7CeM3EgAAAA:8
 a=iAVJRWEPGFGzzmCfX7wA:9 a=NS3OCI0N-QAA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FMFxGtP9trmfb28vA-lX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 04:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220211

For /usr/lib/rpm/macros, Yocto explicitly set OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM
= "ONLY" [1][2] to search tools from CMAKE_FIND_ROOT_PATH [5] which locates in
native recipe sysroot or HOSTTOOLS_DIR. If found in native recipe sysroot or
HOSTTOOLS_DIR, the sed operation removed leading `/'

root@qemux86-64:~# vi /usr/lib/rpm/macros
...
%__xz                   usr/bin/xz
%__make                 usr/bin/make
%__zstd                 usr/bin/zstd
%__quilt                usr/bin/quilt
%__patch                usr/bin/patch
...

root@qemux86-64:~# rpm --eval "%{__xz} %{__make} %{__zstd} %{__quilt} %{__patch}"
usr/bin/xz usr/bin/make usr/bin/zstd usr/bin/quilt usr/bin/patch

This commit keeps leading `/' from sed operation, and similar reason for
/usr/lib/cmake/rpm/rpm-targets.cmake

After applying this commit:
root@qemux86-64:~# rpm --eval "%{__xz} %{__make} %{__zstd} %{__quilt} %{__patch}"
/usr/bin/xz /usr/bin/make /usr/bin/zstd /usr/bin/quilt /usr/bin/patch

[1] https://git.openembedded.org/openembedded-core/commit/?id=f4ea12f6635125ee793f4dd801c538c0186f9dc3
[2] https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_ROOT_PATH_MODE_PROGRAM.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index dc4cfd4abbe..ba967ec1fa0 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -141,10 +141,10 @@ do_install:append:class-nativesdk() {
 }
 
 do_install:append () {
-	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${STAGING_DIR_NATIVE}/::g' \
+	sed -i -e 's:${HOSTTOOLS_DIR}::g' \
+            -e 's:${STAGING_DIR_NATIVE}::g' \
 	    ${D}/${libdir}/rpm/macros
-	sed -i -e 's:${RECIPE_SYSROOT}/::g' \
+	sed -i -e 's:${RECIPE_SYSROOT}::g' \
 	    ${D}/${libdir}/cmake/rpm/rpm-targets.cmake
 
 }
-- 
2.34.1


