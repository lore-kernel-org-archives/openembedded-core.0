Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C816C021AD
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 03:57:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42136.1740023848562975565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 19:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41466d0882=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K2MnnP015464;
	Thu, 20 Feb 2025 03:57:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00khvra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 20 Feb 2025 03:57:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 19 Feb 2025 19:57:25 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 19 Feb 2025 19:57:25 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
Subject: [PATCH] Revert "python3-ctypes: depend on ldconfig only if distro-feature set"
Date: Thu, 20 Feb 2025 11:57:24 +0800
Message-ID: <20250220035724.1460062-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fmF_-ILkboklNgKPAlXu-quZENm9SkgH
X-Proofpoint-ORIG-GUID: fmF_-ILkboklNgKPAlXu-quZENm9SkgH
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b6a827 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=8AHkEIZyAAAA:8 a=t7CeM3EgAAAA:8 a=p6ubOPH-QTuxIksJp-IA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1011
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 03:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211736

From: Changqing Li <changqing.li@windriver.com>

In oe-core, function ldconfig_postinst_fragment use exist of
/sbin/ldconfig to decide if ldconfig is runned to generate the cache,
and function _run_ldconfig will run ldconfig to generate cache during
generate rootfs.  ldconfig.service is actually not used since we have
generate ld.so.cache during do_rootfs, refer[1][2][3]. ldconfig
dependency is necessary when ldconfig not in DISTRO_FEATURES.

The reverted commit causes regression when ldconfig not in
DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
ctypes.util.find_library(name) can find the lib if it is installed, now,
since ldconfig is not installed, ctypes.util.find_library(name) cannot
find the lib even if it is installed.

Here is one usecase(gtk+3 lib is installed, ctypes.util.find_library
used to find the lib):
import wx.lib.wxcairo as wxcairo
File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/{}init{}.py", line 59, in <module>
  from .wx_cairocffi import _ContextFromDC, _FontFaceFromFont
File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 189, in <module>
  gdkLib = _findGDKLib()
File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 181, in _findGDKLib
  return _findHelper([libname], 'gdk',
                     "Unable to find the GDK shared library")
File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 170, in _findHelper
  raise RuntimeError(msg)
RuntimeError: Unable to find the GDK shared library

[1] https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass#n394
[2] https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootfs.py#n316
[3] https://github.com/systemd/systemd-stable/blob/v255-stable/units/ldconfig.service

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/python/python3_3.13.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 52fac76c00..f64d67da89 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -477,9 +477,7 @@ FILES:${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
-RDEPENDS:${PN}-ctypes:append:libc-glibc = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)} \
-"
+RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
 RDEPENDS:${PN}-ptest = "\
     ${PN}-dev \
     ${PN}-modules \
-- 
2.34.1


