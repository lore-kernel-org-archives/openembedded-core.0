Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56E5C0218E
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 08:55:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11922.1737449733190552103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 00:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31163e49e6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L85cvs006662
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 448cpq28yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 00:55:32 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 21 Jan 2025 00:55:32 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 21 Jan 2025 00:55:31 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/9] libgcc-common: apply multilib symlinks for nativesdk libgcc
Date: Tue, 21 Jan 2025 16:55:22 +0800
Message-ID: <20250121085526.1370937-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121085526.1370937-1-hongxu.jia@windriver.com>
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jNgBguQhNFSBGWgrP9q2wUK8q_tda8T1
X-Proofpoint-GUID: jNgBguQhNFSBGWgrP9q2wUK8q_tda8T1
X-Authority-Analysis: v=2.4 cv=TdtstQQh c=1 sm=1 tr=0 ts=678f6104 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=t7CeM3EgAAAA:8 a=46o5wDONuQUSbuuqhUIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=855 adultscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501210072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 08:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210077

Due to the supported SDKMACHINE includes:

  aarch64, i586, i686, loongarch64, ppc64, ppc64le, riscv64, x86_64

Only i586 and x86_64, i686 and x86_64 have multilib relationship,
so create multilib symlinks for i686,i586,x86_64 nativesdk. It will
have no regression when nativesdk-gcc disable multilib support in
which the symlinks is broken

[ YOCTO #15722 ]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 40 +++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index e3db17d700..ac284a0031 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -140,6 +140,46 @@ fakeroot python do_multilib_install() {
         os.symlink(src, dest)
 }
 
+# this makes multilib gcc files findable for nativesdk gcc
+# to link multilib nativesdk gcc library
+# e.g.
+# For x86_64 nativesdk-libgcc
+#    sysroots/x86_64-pokysdk-linux/usr/lib/i686-pokysdk-linux/14.2.0
+# by creating this symlink to it
+#    sysroots/x86_64-pokysdk-linux/usr/lib64/x86_64-pokysdk-linux/14.2.0/32
+#
+# For i686 nativesdk-libgcc
+#    sysroots/i686-pokysdk-linux/usr/lib64/x86_64-pokysdk-linux/14.2.0
+# by creating this symlink to it
+#    sysroots/i686-pokysdk-linux/usr/lib/i686-pokysdk-linux/14.2.0/64
+
+fakeroot python do_multilib_install:class-nativesdk() {
+    sdk_arch = d.getVar('SDK_ARCH')
+    if sdk_arch not in ['x86_64', 'i686']:
+        return
+
+    binv = d.getVar('BINV')
+    if d.getVar('SDK_ARCH') == 'x86_64':
+        tune_arch = 'i686'
+        tune_bitness = '32'
+        tune_baselib = 'lib'
+    elif d.getVar('SDK_ARCH') in ['i686', 'i586']:
+        tune_arch = 'x86_64'
+        tune_bitness = '64'
+        tune_baselib = 'lib64'
+
+    src = '../../../' + tune_baselib + '/' + \
+        tune_arch + d.getVar('SDK_VENDOR') + \
+        '-' + d.getVar('SDK_OS') + '/' + binv + '/'
+
+    dest = d.getVar('D') + d.getVar('libdir') + '/' + \
+        d.getVar('SDK_SYS') + '/' + binv + '/' + tune_bitness
+
+    if os.path.lexists(dest):
+        os.unlink(dest)
+    os.symlink(src, dest)
+}
+
 def get_original_os(d):
     vendoros = d.expand('${TARGET_ARCH}${ORIG_TARGET_VENDOR}-${TARGET_OS}')
     for suffix in [d.getVar('ABIEXTENSION'), d.getVar('LIBCEXTENSION')]:
-- 
2.34.1


