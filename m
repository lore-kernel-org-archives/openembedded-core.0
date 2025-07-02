Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C64C8303D
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 02:44:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14601.1751424251818847740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 19:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9278afadd9=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5620U2Gj013490
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 19:44:11 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3jky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 19:44:11 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 19:44:10 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 1 Jul 2025 19:44:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2 1/2] kernelsrc.bbclass/perf: clean up package version while using kernel source
Date: Wed, 2 Jul 2025 10:44:08 +0800
Message-ID: <20250702024408.1567464-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aGSOEsGsdU+84kJn@gmail.com>
References: <aGSOEsGsdU+84kJn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=68649cfb cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=ebKT7KSLUzKIW0Oku2YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AM4rHSBU2TPOtJ5PFS8b4Cq3n8m2r7r1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDAyMiBTYWx0ZWRfX7S4z3NMPjh6E ZzfMGlz5pAKNZv2rbKgUCQs/vfOyLb7hEbqS7lNbTw3PFIzDiLq71+RZVGLxupYOLzpzNnaSmT+ cL20vMd9E/KUinwILGysQ00YXIwMeG7YmoI5CrSGC6Wk3bu+q1kbT4DVEu2VnZ+Yn0FGIsjJDCL
 xthHIcPEi4e7Wlm2p1YOwgdrshyB+uvmx0YfEQzJ47tqRlUQHnFdEzwOEO2tEfqsfw54QdfvTkZ h0kDWCd9gQBqCoZiLdsoAr1tPKsqD2I4jgDbfcXf649YdZBOGzze9JsuHt5wObucd75nfFna7Xr +uTv3TUV9YFHDlwvwgm6auayA82N9aMkfGgHp1DiVfCUDqetB0TdTys+ga+bjUgXqA34H5YoFgF
 AM3KDs9ugfOWkGZd8HarrYPYw/EvLPm8qDVro7XEg6SHB9sZgcMPKuZOqPUQWN19Q/i7sfwl
X-Proofpoint-ORIG-GUID: AM4rHSBU2TPOtJ5PFS8b4Cq3n8m2r7r1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 02:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219753

If recipe inherits bbclass kernelsrc to use kernel sources,
the recipe should explicitly set ${KERNEL_VERSION} to ${PKGV}
in task do_package, otherwise package version (${PV} is usually
default 1.0) is not consistent with kernel source.

For example, there are 5 recipes in meta-openembedded to inherit
kernelsrc, but 4 recipes explicitly set PKGV.

meta-openembedded$ grep -e "setVar(.*PKGV.*KERNEL_VERSION" -e kernelsrc -rn *
meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb:9:inherit kernelsrc
meta-oe/recipes-kernel/bpftool/bpftool.bb:8:inherit bash-completion kernelsrc kernel-arch
meta-oe/recipes-kernel/bpftool/bpftool.bb:44:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
meta-oe/recipes-kernel/cpupower/cpupower.bb:8:inherit kernelsrc kernel-arch bash-completion
meta-oe/recipes-kernel/cpupower/cpupower.bb:32:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
meta-oe/recipes-kernel/turbostat/turbostat.bb:98:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb:25:inherit kernelsrc autotools-brokensep
meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb:68:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
meta-oe/recipes-kernel/spidev-test/spidev-test.bb:7:inherit bash-completion kernelsrc kernel-arch
meta-oe/recipes-kernel/spidev-test/spidev-test.bb:26:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])

This commit clean up the setting of PKGV, move it to kernelsrc.bbclass
for common use, the recipe (such as intel-speed-select) that inherited
kernelsrc will not be required to explicitly set ${PKGV} with
${KERNEL_VERSION}

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/kernelsrc.bbclass | 4 ++++
 meta/recipes-kernel/perf/perf.bb      | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-recipe/kernelsrc.bbclass
index ecb02dc9edc..93361842989 100644
--- a/meta/classes-recipe/kernelsrc.bbclass
+++ b/meta/classes-recipe/kernelsrc.bbclass
@@ -15,3 +15,7 @@ LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 
 inherit linux-kernel-base
 
+# The final packages get the kernel version instead of the default 1.0
+python do_package:prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
+}
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 157aca4d791..4f29bd5bbc3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -385,10 +385,6 @@ do_configure:prepend () {
     done
 }
 
-python do_package:prepend() {
-    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
-}
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
-- 
2.34.1


