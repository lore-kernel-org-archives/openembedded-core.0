Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17783C83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 09:00:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14916.1753002014370715312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 02:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9296d98d46=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56K8ukbu3312475
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 02:00:13 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0rr4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 02:00:13 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sun, 20 Jul 2025 02:00:02 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sun, 20 Jul 2025 02:00:01 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/4] babeltrace2: Enable python plugins
Date: Sun, 20 Jul 2025 17:00:08 +0800
Message-ID: <20250720090010.3122861-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX5/mLfFDxmWpm
 nFcJG4EmObudymMNhPyfBB8m0bE9owEatcFtMG1ZTeAzjcOYs1Xr15/xxx8aoPmtvm8+4HQ5H+t
 xOBKOS3gmtSZEcfIdiMi0UtWHJ/o1C6zqIKPrIq52ivInwJwQs5U+DDVaA4V82JRoGp1W8erI9w
 ztMtgqUGH3QS0AiqwTSCF8MnNXpnnv3WyTRz0H5Rc52WZM0EAIu3Yra6YpetLaIvopsY3i+Upde
 U54E5hp6aCNfVwPNYM5gw2QpqZXQMfGP1rKinvAaQKM0rBYVgndPCREMCKSw14d/cLVOIk9gNuu
 yUwYCUcBZbt9iWcuwi41ir2d/FpYuUMGSSx07Eq/SgYyB37VtCiQ6ROHOonOihBbLI9/EIBtTFj
 hmTbv/jN
X-Proofpoint-ORIG-GUID: KwKsBTPVqIZofzE6HZ7GWl5POwNF6UBL
X-Proofpoint-GUID: KwKsBTPVqIZofzE6HZ7GWl5POwNF6UBL
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687cb01d cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8
 a=G2XSRNlJUAbAyn01LSwA:9 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 09:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220615

From: Mingli Yu <mingli.yu@windriver.com>

* The lttng-tools test fails as below as it needs bt2 module.
ERROR: ust/high-throughput/test_high_throughput_snapshot.py
===========================================================

Traceback (most recent call last):
  File "/usr/lib/lttng-tools/ptest/tests/regression/./ust/high-throughput/test_high_throughput_snapshot.py", line 26, in <module>
    import bt2
ModuleNotFoundError: No module named 'bt2'

Enable python plugins for babeltrace2 to provide the above support.

* Add swig-native to DEPENDS to fix the below configure error.
 | configure: error: SWIG 2.0.0 or newer is required to build the python bindings

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index 8bab7f677a6..88f589eafbc 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
 LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
-DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv"
+DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv swig-native"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v${PV} \
            file://run-ptest \
@@ -19,13 +19,13 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 inherit autotools pkgconfig ptest python3targetconfig
 
-EXTRA_OECONF = "--disable-debug-info --disable-Werror"
+EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
 
 PACKAGECONFIG ??= "manpages"
 PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
 
 FILES:${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
-FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so"
+FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so ${PYTHON_SITEPACKAGES_DIR}/*"
 
 ASNEEDED = ""
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld=bfd ', '', d)}"
-- 
2.34.1


