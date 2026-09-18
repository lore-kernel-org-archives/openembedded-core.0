Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB34C982D7
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 09:36:57 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7287.1789724210618332276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 02:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TBYMtXUh;
 spf=pass (domain: est.tech, ip: 52.101.65.17, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuNEyWbh5YzlrK/S+VbeGUrnJtOWcqg+CNqkMszc/BNSPKRhyMbnBpF8li4IWKA4YAhVCgNgXhT+kRupa3QuNl6C7jnFg92XUbp05sfeFpo9lczoRez8LiLPBmx5ZrmNCRss04DBxmdogQIUjjbNSrIuVSx/cC9Z3c3Eqo1CJjeav/OT89UoBE0wvMaeVOzRLID0fawvbcB9Y42yMzxtZYNACS/lK6YTkERjNPwJM+Td6ieN8LMGDx5QnXDP8SXrm03QhdAxo3EurCvleWPN73Y9Rsfdc9vVHPpdWm8fKUQzexL0f6+RqmBcZ4capsAdMg38iZSBCALswKFKZ/TfeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBtu25Oj9mevRZhiXxhh1kyjQwIDVuKD0PPlhb2b/Gk=;
 b=JDd0j+1QSmzA7FMDiFAyuQbhse9Bh5AXRi4ZF/PtI/yo4wzRb+z/VPxb3rz1wggtjUrrC5xgsNWemX/LqhCRg/QUzx+y5Gjl+WDrTNrPx/hDhY044tWmlImr8xb5ZTPej9EHTC87bxL9eSoObiZVefhgr4GU/rSKNhlufWZtsJa/HllhGPXTdB8x1v1s0wB87uh1tkTa3EeGBTs8G+ZK8qsT/v90Ksqc+Wisc0zlZTY2o52VZXqVGF9gE/e4KgsS4v3MX6eP5I0CUYg+hWC2cQukoPcwsuNvyWumL6f/QwmcfpIcxPDWIaQX3k5S9lvYI4pWyCROJDlazPJXLL4x1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBtu25Oj9mevRZhiXxhh1kyjQwIDVuKD0PPlhb2b/Gk=;
 b=TBYMtXUhOEfGMYomYBIrVKDe42OAN0PNuxQn+psAfNprbQCa/MXnAX2wpprj/OSIGFdonOmWzxzNuASJkifJuXlspHgMRgJHvl2KIU0lrvmV+r1ginWyn/RpRiPqxCf40AzyVS6OS4z04CUNT25ByUfZ89dsE31ap04tqbLZlMTPf8IPRpRDdOTufmFkewA/58wxNk0sVjUOewjTL8NouxpRiEu9z1p7MaxIeGed2lturucc6SB1CuhVUsOdmn++kmOLyvqY9bd1x+ujfEfdqr3B5MomQnaFZ5j8EPO+d/prRsqUH484e1jBBaUKyLtuAKygHa8HRGmpp16zDIpukQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB1045.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:167::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 09:36:45 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 09:36:45 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] psmisc: add ptest support
Date: Fri, 18 Sep 2026 11:36:41 +0200
Message-ID: <20260918093641.15987-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914130447.107189-1-pratik.farkase@est.tech>
References: <20260914130447.107189-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0189.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::14) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB1045:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fd5bd5-968b-429a-58c3-08df15685a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|3023799007|10067099003|6133799003|5023799004|11063799006|22082099003|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	4z2faD8bP/7wkijq0EalA2HyGzN17X53UVX52IXYWjIou+nsala9jYakosctedojV7E4PSnDyt/+IcXAkgVveWAktT3wolLOmZYyGhKGd5Uhf6gCO07K13bih6b/e3LLauLhqtrKkhYYmm996RkOdI626iSV17gqwH0BP8Hp1OXzBrAQp0qpQQf5geytyLr+ORDF/TZFMhTJNT0xZAwWmbMHmzhONfkCsVZAP+CxP/1RCuDmoxXcEujbbvVPX7MJS76vXQ5PMkbYjyAn+iJe/RVyaR/WIPzKRJxolBtgcQawaJUMPzDm02BAgsB+BhYizJJ+NlALOqnJUDLwtxRrcQkbRB0oWOtGE1K2DT6DDC3DD37nYvbuPsdoj7Ng+DFgu5CfDG/4aziN0L4KLM/8ljpGee9wBj9ScEmYoWSUZHjjsh2fQ/ngUihLe39eB+/kTHiHv1RnyvZ/PfWs7gvb7uezuVmzi67UgMrkE1S6DArAiZCsTPGnCUiSIKgE7orcf9DEEirL5iPsoKjhup/+Fj2EzjiewlLMBoHy61byLo6zU5kSlv43MolerSRq/JSao0DZyr43BRPTbslK3vnIgkK9bUA2u0tGrbjhHXemrEi48br8Ful19BzE1nwZ5bjbSQnhzCXPQrfO0XDUliAxGSCNFW1J171looqiiqlNMms=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(3023799007)(10067099003)(6133799003)(5023799004)(11063799006)(22082099003)(18002099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m0DlgeAG1US3gjNHXN33kz7EttSNO5xyg2l1L0W43u+225mq23NBBgQte+Bd?=
 =?us-ascii?Q?x+CJNbbQP3dJJjFRvk46RgD8UA5RVgX0+h0ZfzScWr7qhb+rB8mvTfwWx7mD?=
 =?us-ascii?Q?y0KEBuFZgMbzfhuuODRlf9EtOUjJHkPVqGqK12sth52QFRzG3s3Cqx+wfdcb?=
 =?us-ascii?Q?SWmKRPtCyOtYaWGxy8rvb6qGVn8Abh0mxJIuGEDcIrilQTto7jaalw+4YNin?=
 =?us-ascii?Q?l/jN+zvs2JJPIq4XgdWv3rBpzsAFfjfJDNdAA+2PcTNNuLVfDNdiJSmfvm/Q?=
 =?us-ascii?Q?HA0P0rc6n/FUh2gu/SKu2QGtr9bufCy0YA3hC66eQmpkpbgsYzME9en0Lccl?=
 =?us-ascii?Q?R//wD4yX9l7uxWdROooEsSc8JKeHYMumh8SH48813JOfccMNkIkcvw/ITJbG?=
 =?us-ascii?Q?M3c+ivRoOP3tmazUlUYGkVWToDSJWYS4Wy5Dl5XQi0RWVFaN8vrl8GXW58gf?=
 =?us-ascii?Q?qH/eSxYmjrLAgJ+vxGNvw2xaEdCCkVoF4kb/VH9pwLhMKIZ+qmAHRHTcwzMQ?=
 =?us-ascii?Q?iQzcwOKXaAUHLXGE6Tfge1VrOL4vXlq8xY1fbEYDSaoQHpcYAm3MpW46T/Iq?=
 =?us-ascii?Q?Db9SMwK6UwZkrkKQuaCPV8g1B8y6LEP/B4UGvX0Hc/5TPW8k6sqpVoEzJHDt?=
 =?us-ascii?Q?j/gBNlx8OsxrLQuD4vBBlX1MjnlECJbekmWI5aP+J3+uHetMfpVpUgDmZNyF?=
 =?us-ascii?Q?enUrO1eOQ+XulBSgE2K+PzZ1W06xfbU7cO0UJHjxMl6PYgsUvL1K9Kj9vJch?=
 =?us-ascii?Q?ojS2nT0Wh5Mymo2LyPbTBmXnEiR3w++vnbOHmIl4Eht/RDwylSM/3o7Ofklh?=
 =?us-ascii?Q?oVPiZxJWZ2FRGI9zv4y57jdLglzdPvk2pPUdrBKMMmTjRQK85ibPp64aDcNv?=
 =?us-ascii?Q?0rJ8DgUFuN4Qqt0XrSy/doZmbT9nZh2SAWJ9SPOoRJf1vnboCJJv2CrXf2Ye?=
 =?us-ascii?Q?QZcRGxIPMzMxPas2JlTMHOB7x9JFKdL2qxNHPId8QryV8/OAdUyfhvqpORLt?=
 =?us-ascii?Q?fFaYyRczrzghMzlB3bxNQ5CH6MrbN7tc2KQQindBX5tb2V8rGuha8uY/wMtI?=
 =?us-ascii?Q?j2W9OVTDXGYY5HBHED1XoK10Fa1K3jmQkoNj57WkMQokvVlYn7tFjkdJynn5?=
 =?us-ascii?Q?ewZVrABHnkReSN/rHmC0yuNTWxPiGvQD38rXlb/3yHV6oMInh0RLqV+lqazK?=
 =?us-ascii?Q?n32Gn80oCfh14SQQ5Ac98BfRrO/c44flvyGt/1zjjuk9YuHS0Iyx9YFPr6f7?=
 =?us-ascii?Q?RS3oxHHPDXW6WF4+KHjQKO+08SYFXdUZC4ygc/MbyQIuisRXSlSlhD8mFzWI?=
 =?us-ascii?Q?gXx2cCXXlCCPJ8KzYyXCZovNsuJ3+75elqnDNgYWoQO6XQWk15RuIKxa3kQ7?=
 =?us-ascii?Q?NMBWkXkzI8zpjsVzarhsCDRUcimriWYb0a1gUoB6KkLOUZFEAtaioSOwZfVj?=
 =?us-ascii?Q?Dhgr9cu5gLVHxYR9LX7nY+/wXMDxtBh7PAsFbe99pVBOIb5yAIHCEqfICBIa?=
 =?us-ascii?Q?N/FGboEqfY/wh2UbTz5jjJ2PILBhcMW8bbCvnIneNVXjLNBeFq91fXzaieRR?=
 =?us-ascii?Q?WF+z+YY5miUyfKOZu+TebwgmljQSua1UEE/AxNkMo7AA98JXghD3XZOC3l7F?=
 =?us-ascii?Q?lCS3GEB3KRs4uA6PAR+M+mBAMNPeQ7TMuLk299PkxzzS/Mb2E5bFLdbS/l3D?=
 =?us-ascii?Q?9aN+JTISNwRAULjaifXvpOT1oWctKqEM/tJbJfggvDmZ+WQLdB/mcty748zz?=
 =?us-ascii?Q?cbqIwZjzEg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fd5bd5-968b-429a-58c3-08df15685a8e
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 09:36:45.1091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unl0Xtj2tTjc7PIMrVDHcIw7iIMj15yESU4TtnCqrMK2ILXaPsaW3IQwNvaJNk8PjjEBA1e2AWF+ENL/U8q1aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246206

Add ptest support using psmisc's upstream DejaGnu testsuite, which
exercises killall, pslog and fuser via their .exp scripts. The tools and
the testsuite helper programs (socket_test, test-listen) are installed
under a src/ layout so the scripts' ${topdir}src/<tool> paths resolve on
target.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/psmisc/psmisc/run-ptest | 13 ++++++
 meta/recipes-extended/psmisc/psmisc_23.7.bb   | 45 ++++++++++++++++++-
 3 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/psmisc/psmisc/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 4012be5f49..f01abc4a57 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -68,6 +68,7 @@ PTESTS_FAST =3D "\
     opkg \
     popt \
     procps \
+    psmisc \
     python3-atomicwrites \
     python3-attrs \
     python3-bcrypt \
diff --git a/meta/recipes-extended/psmisc/psmisc/run-ptest b/meta/recipes-e=
xtended/psmisc/psmisc/run-ptest
new file mode 100644
index 0000000000..53f7521ac1
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+cd ./testsuite
+
+tmpdir=3D"$(pwd)/tmp"
+mkdir -p "$tmpdir"
+TMPDIR=3D"$(cd "$tmpdir" && pwd -P)"
+export TMPDIR
+
+for tool in @DEJATOOL@; do
+    runtest -a --tool $tool --outdir ../log
+done
+cd -
diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-ext=
ended/psmisc/psmisc_23.7.bb
index ad57c49ffe..3c768f4a86 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -13,10 +13,11 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb=
3"
=20
 SRC_URI =3D "git://gitlab.com/psmisc/psmisc.git;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV} \
+           file://run-ptest \
            "
 SRCREV =3D "9091d6dbcce3d8fb87adf9249a2eb346d25a562c"
=20
-inherit autotools gettext
+inherit autotools gettext ptest
=20
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as the=
y
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext
@@ -25,6 +26,48 @@ do_configure:prepend() {
     ( cd ${S} && po/update-potfiles )
 }
=20
+do_compile_ptest() {
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        oe_runmake $p
+    done
+    oe_runmake -C testsuite site.exp
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/testsuite
+    install -d ${D}${PTEST_PATH}/src
+    install -d ${D}${PTEST_PATH}/log
+
+    cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
+    install -m 0644 ${B}/testsuite/site.exp ${D}${PTEST_PATH}/testsuite/
+
+    # Tools exercised by the .exp scripts.
+    for p in killall pslog prtstat fuser; do
+        if [ -x ${B}/src/$p ]; then
+            install -m 0755 ${B}/src/$p ${D}${PTEST_PATH}/src/
+        fi
+    done
+
+    # Helper programs (check_PROGRAMS) used by the fuser tests.
+    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        install -m 0755 ${B}/$p ${D}${PTEST_PATH}/src/
+    done
+
+    sed -i -e "s#@DEJATOOL@#$(makefile-getvar ${B}/testsuite/Makefile DEJA=
TOOL)#" \
+        ${D}${PTEST_PATH}/run-ptest
+
+    sed -i -e "/set srcdir/c\\set srcdir ${PTEST_PATH}/testsuite" \
+           -e "/set objdir/c\\set objdir ${PTEST_PATH}/testsuite" \
+        ${D}${PTEST_PATH}/testsuite/site.exp
+}
+
+do_install_ptest_base:append() {
+    sed -i -e 's/^set \([a-zA-Z_]*\)$/set \1 ""/' \
+        ${D}${PTEST_PATH}/testsuite/site.exp
+}
+
+RDEPENDS:${PN}-ptest +=3D "dejagnu"
+
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinux"
--=20
2.43.0


