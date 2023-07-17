Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0EDC001B0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 07:11:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2998.1689577880299934771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 00:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6562525d2f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36H6ZbeE007107;
	Mon, 17 Jul 2023 07:11:17 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8a9atb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 17 Jul 2023 07:11:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 00:11:16 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 00:11:15 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <alexandre.belloni@bootlin.com>
Subject: [PATCH v4] qemu: Add qemu-common package
Date: Mon, 17 Jul 2023 15:11:14 +0800
Message-ID: <20230717071114.2734859-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: oN_KtFHH4TsZN8ZaTWGJCcMrS8K6H2Ur
X-Proofpoint-ORIG-GUID: oN_KtFHH4TsZN8ZaTWGJCcMrS8K6H2Ur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_05,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=464 clxscore=1011 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307170064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 07:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184432

From: Mingli Yu <mingli.yu@windriver.com>

We split the qemu package [1] to add support to make user can install
one qemu arch emulation rpm to ease the concerns who care much about
the rpm size in embedded device.

But for the user who only install the qemu-*.rpm can't do anything
except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
explicitly.

So add qemu-common package to package all thing into qemu-common when
not split the package, and package only the basic into qemu-common and
other arch related to each qemu arch emulation rpm when split the package
to fix the backward compatibility.

qenu-*.rpm which is meta package rdepends on qemu-common and the available
qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.

[1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---

v3->v4: remove the added native-sdk dependency.

 meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
 meta/recipes-devtools/qemu/qemu_8.0.3.bb |  2 +-
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 16581db69d..76560f454d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -225,15 +225,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
 
-INSANE_SKIP:${PN} = "arch"
+INSANE_SKIP:${PN}-common = "arch"
 
 FILES:${PN} += "${datadir}/icons"
 
 # For user who want to install all arch packages
-PACKAGES =+ "${PN}-system-all ${PN}-user-all"
+PACKAGES =+ "${PN}-common"
+RDEPENDS:${PN} += "${PN}-common"
 
-ALLOW_EMPTY:${PN}-system-all = "1"
-ALLOW_EMPTY:${PN}-user-all = "1"
+ALLOW_EMPTY:${PN} = "1"
+FILES:${PN} = ""
+
+FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
 
 PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
 
@@ -241,15 +244,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
 
 python split_qemu_packages () {
     archdir = d.expand('${bindir}/')
-    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
-    if syspackages:
-        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
+    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
 
-    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
-    if userpackages:
-        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
+    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
+    if subpackages:
+        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
     mipspackage = d.getVar('PN') + "-user-mips"
-    if mipspackage in ' '.join(userpackages):
+    if mipspackage in ' '.join(subpackages):
         d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
 }
 
diff --git a/meta/recipes-devtools/qemu/qemu_8.0.3.bb b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
index 42e133967e..5d3c47c3b0 100644
--- a/meta/recipes-devtools/qemu/qemu_8.0.3.bb
+++ b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
@@ -8,7 +8,7 @@ DEPENDS:append:libc-musl = " libucontext"
 
 CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
 
-RDEPENDS:${PN}:class-target += "bash"
+RDEPENDS:${PN}-common:class-target += "bash"
 
 EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
-- 
2.25.1


