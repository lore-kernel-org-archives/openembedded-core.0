Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34045C61CE7
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 12:23:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6386.1749644622706815025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 05:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82574c9249=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B503l0013724
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 05:23:42 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm43db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 05:23:42 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 11 Jun 2025 05:23:41 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 11 Jun 2025 05:23:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] scripts/oe-find-native-sysroot: fix get sysroot failed
Date: Wed, 11 Jun 2025 20:23:39 +0800
Message-ID: <20250611122339.2893630-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pXfgbDKKDN-MCBK-twCg0-QLQw66yOqM
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6849754e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=-LOdDCWZbwsFUZgiUrkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEwNiBTYWx0ZWRfXwCyXIRZhIeOk LYH1J1W+dbT5Lroy/O0r8fxd2uZuvPyWn6ArzYPKUojpScFXRz2R+rufvmDsfz6vwOPW2/kc0o/ o5XgknxUL/aCsXeAu+rWlU+I3Ru7XCxYFGRF3M6AyX2lFw0fYss3sSRZm+ticFzEP/hWtW/CyhY
 fkVMCKZyPf1dKeivY4kxw1Lfj1mFiLwEcJhzw/vXuHxwUI+V7rcJv24lAUuXFXyoNdgjulF9pv4 aPwEOHSA6Wgbrm3POQ9Dy3hqiTewrdT3oFLfOB17uso1T1ViTrpyYVY2kkIKu2srd1+xJxsfQfw 3NOqwXCPXpLC2Dox2x9NPIo6ONhTKS0E8VazdbT21Xd/CJXCiK/Qf9zgpw1vEjixdDG4goPiiLo
 gYmPEqCXIjjVlVjuVI0S90ziR3EopkfWIW/OOJnl4pgajeq744d/zSp5qny7n6v6C9I3NQ32
X-Proofpoint-ORIG-GUID: pXfgbDKKDN-MCBK-twCg0-QLQw66yOqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506110106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 12:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218451

Calling oe-debuginfod in a build failed:
...
$ oe-debuginfod
|Getting sysroot...
|Error: NOTE: Reconnecting to bitbake server...
|NOTE: Retrying server connection (#1)... (18:55:53.009687)
|path-to-build/tmp/work/x86_64-linux/elfutils-native/0.192/recipe-sysroot-native doesn't exist.
|Have you run 'bitbake elfutils-native -caddto_recipe_sysroot'?
...

While calling bitbake-getvar to get sysroot, the output of bitbake-getvar
was mixed with output from bitbake
...
NOTE: Reconnecting to bitbake server...
...

Improve the output of bitbake-getvar, filter out unrelated message

BTW: bitbake-getvar --quiet (Silence bitbake server logging) could not
skip above "NOTE: Reconnecting to bitbake server..." message from bitbake

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/oe-find-native-sysroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 6228efcbeec..778c16f5db8 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -38,7 +38,7 @@ fi
 # Global vars
 set_oe_native_sysroot(){
     echo "Getting sysroot..."
-    OECORE_NATIVE_SYSROOT=$(bitbake-getvar -r $1 --value STAGING_DIR_NATIVE)
+    OECORE_NATIVE_SYSROOT=$(bitbake-getvar -r $1 STAGING_DIR_NATIVE |grep '^STAGING_DIR_NATIVE='|sed -e 's/^STAGING_DIR_NATIVE=//' -e 's/"//g')
 }
 
 if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
-- 
2.34.1


