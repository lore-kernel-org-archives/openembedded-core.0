Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E5BFD9E2D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 02:24:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86670.1772159064368415447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 18:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bUeRuGUo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6518253275=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2NJCb3669190
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 02:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=da+y2ZKmcF4DiqT6IN9w
	O2F4ZZqArx3K7ypjiYqG3zQ=; b=bUeRuGUoyTdx5qniCrhw++r42415hAo1l4TM
	LXKUG1JlN8NGMOzWT06PehtEz2i/8GelwWNIq2yAb3Q6LWiIm0NgL0n/PUE2oGBm
	diDOXQLJ8t1ngV5BIdlcA+6U04UO34ILUYJjeJPHcnz1PIDLnFctYskWWZosWIQC
	uZFqI+eV0+9ZLL5eFQohIzKmkVm9ACUu933PmaDGVgSn3jb2MzFmQWRUeWUM0lCM
	RVxf2FyTm8B+Y7lhsDNvULcb0kUaNax8FovA61YwcdrfJx/OUjOKF1uVzERrIIgx
	f9l+0UXCHPtgU+te9a/30EfkhvErsLdinanG52BcwOM/IIb29Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdvdsceu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 02:24:23 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 26 Feb 2026 18:24:21 -0800
Received: from oak-lpgbuild14.wrs.com (10.66.9.59) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 26 Feb 2026 18:24:21 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V3 1/2] runqemu: restore support to run inside SDK
Date: Fri, 27 Feb 2026 02:24:20 +0000
Message-ID: <20260227022421.4072802-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAxOCBTYWx0ZWRfX3l/9RCHBLanB
 Qa2FBxjOwHHRRm0+FcxUyRRCS/HJhWULsIM3oTRYatBMLPVqLd4tV18lSHC7nkIQF0E7rcZPpeX
 NGODgZNqYKd/L1KgSSxkkvTMB2JbhTDBVOf90hgjvl8e3kiSwP5mwDREnG3v4raCUmfIprrW5wg
 yVOLNtUl6vo3PavVgnnjB/ye2i56KWCHaI519suIYM5LQeHGbXO5KaTYmDbtauJJos4cxGb8bMT
 BvtVTfy9S5jROkKNORrzh7l/zbTmvCuzPcf4jdaz6hW6/mFmf6geT4GnnMof+nohQ6L/WMmR1Rq
 iOmYaH8TMzbaa9BIX53dCr1edOOOMeSUl8zW7je80iGv8fMNTMb7b0PZ8vO+axZe2gOU0/Sz8ji
 Z+MspfbfHn8ggUWH3xsARBreiw2EbUCXd2KPWLye0Z+58W7Pfa5kirRPBGiQR/w00VN4eAe80g+
 wRgL3W7+9erogZxn/KA==
X-Proofpoint-GUID: Ys1PkbYRa4NsMIuFLgFLqwJovhLdMYM8
X-Authority-Analysis: v=2.4 cv=UKzQ3Sfy c=1 sm=1 tr=0 ts=69a10057 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=2V6DY6BgAAAA:8
 a=0mkdOpYzm_CPxjOHJy0A:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-ORIG-GUID: Ys1PkbYRa4NsMIuFLgFLqwJovhLdMYM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 02:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232073

From: Chen Qi <Qi.Chen@windriver.com>

Using runqemu from SDK has been supported for a long time[1].

Below are example steps for using runqemu inside SDK.
1. mkdir destdir
2. cp -r /path/to/build/tmp/deploy/image/qemux86-64 destdir
3. Install SDK to destdir
4. Source SDK
5. runqemu qemux86-64 nographic slirp

Recently the related code path was deleted by accident during
an effort to make codes cleaner and more consistent.

We need to restore support for it.

What actually matters is the STAGING_BINDIR_NATIVE, which we
use to locate the qemu binary. So in case of SDK, we set it
from OECORE_NATIVE_SYSROOT. The STAGING_DIR_NATIVE checking
and setting are meaningless, thus deleting it.

[1] https://git.openembedded.org/openembedded-core/commit/?id=93649edc034f2540ff55dc9b41638797209cfb9c

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 32a3d6296a..5587d47865 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -997,17 +997,21 @@ to your build configuration.
                 logger.info('Setting DEPLOY_DIR_IMAGE to folder containing %s (%s)' % (self.qemuboot, imgdir))
                 self.set('DEPLOY_DIR_IMAGE', imgdir)
 
-        # If the STAGING_*_NATIVE directories from the config file don't exist
+        oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT')
+        if oecore_native_sysroot:
+            logger.info('In SDK environment, setting STAGING_BINDIR_NATIVE from OECORE_NATIVE_SYSROOT (%s)' % oecore_native_sysroot)
+            self.set('STAGING_BINDIR_NATIVE', '%s/usr/bin' % oecore_native_sysroot)
+
+        # If the STAGING_BINDIR_NATIVE directories from the config file don't exist
         # and we're in a sourced OE build directory try to extract the paths
         # from `bitbake -e`
-        havenative = os.path.exists(self.get('STAGING_DIR_NATIVE')) and \
-            os.path.exists(self.get('STAGING_BINDIR_NATIVE'))
+        havenative = os.path.exists(os.path.exists(self.get('STAGING_BINDIR_NATIVE')))
 
         if not havenative:
             if not self.bitbake_e:
                 self.load_bitbake_env()
 
-            native_vars = ['STAGING_DIR_NATIVE']
+            native_vars = ['STAGING_BINDIR_NATIVE']
             for nv in native_vars:
                 s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
                 if s and s.group(1) != self.get(nv):
-- 
2.43.0


