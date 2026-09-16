Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB15C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 08:16:49 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10089.1789546599151703465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 01:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=N4GlPfaF;
 spf=pass (domain: est.tech, ip: 52.101.66.66, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6z/3jo0jNSqho8kVTQ8BtI3q2mY5A5AueWhqe68EbnmL0gixS8sSCib/zWzQ36uJL4l/QfEwbwkdRhzwNruFE84430mlmnJsxxVGBkE2xSeYb4rlQWCSQeviJYUs76V8jvnsy9MfozTMXBs4LJo19VXwGkpxUuTuOkamipXHnNiOUQlrFBaFEu3j3Ome+bY5cFtiKi500Rurq2RPEER3uiUZu5fj4fXppQtoA4kmIu82nZuzs4P9aAoCzg+RjGyIMGlEPELKgHsILHeYjBNNyFkqtk6FdUm7cnC+SI46DhNrrta2qGyHEvvUNzLBbYXYcbkb8y5U1HNNBPm8uh60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1Uun0SNWtHn3hCsFlDM7xbmqpIUMuWIe/hXpllw578=;
 b=R2/g2Qx21uH5T0EWyWU7XYyqILvDgSB+ghj+qN+ajVPcdVX6q7LtOeuFzcqrTyJrE3kpYvVTDsYRlL1ostWB0HpBXa5YHVMYNWT+u4PX4TK44kzrJ0T2mms89e/sM4f3TXJnA/lOiBsnkWNDMwFrCZaDnEqsLAxUdzYfmd4YNeZ7doUYtthjPkKZJfKv2edskC8ehw3rtnfSzczUgW3L4wS0N5KjM/aT12uDnHN6zQXP3IBE1Ux1ZjRRsvOgKTaER8ggMgVxeCPuf0WwufNnnV/ZV2LZQFDOQeLvEI0nvAug2jT1PE2/0SFGtOJi3WoSERcIVcjzGWJmNw/DujDDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1Uun0SNWtHn3hCsFlDM7xbmqpIUMuWIe/hXpllw578=;
 b=N4GlPfaFe8CVnJCFqYQEf19YW0hDWcOJo8Ztp2KFyL+0xFXxzuF7iwsA0qFVIp119zW3GW2kKYzEDz8V4EAYKM79hlVnbSLMBTk6Z+bAtDNGexlb0Hy/J5JMPAxHc6UWEjRp2wGI0Ws70fI758h7J/2xYlqMqgDY0dGxZMjtz+MZL+sBURgRpExuivR0euPyPSPTuOzFD/yQq5WCZZRO7UBYUaG0Hc3XJe25uQn+Nhsc59gpBX0vLFSCSq94LgER6vkN9ZOSlCTHSv9gux0nfXPWDLD62ovwQFPnJauxzgYJodwRDpzzWKbsgH2bOoudUdW4mYPsWaBvhGHiDasShA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV2P189MB3102.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 08:16:28 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 08:16:28 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] psmisc: add ptest support
Date: Wed, 16 Sep 2026 10:16:24 +0200
Message-ID: <20260916081624.11957-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914130447.107189-1-pratik.farkase@est.tech>
References: <20260914130447.107189-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::33) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GV2P189MB3102:EE_
X-MS-Office365-Filtering-Correlation-Id: 7180b78e-0d52-4023-6afb-08df13cacee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|5023799004|10067099003|20052099010|22082099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	g+CITZdr2WB9aMXBuSFGFS6h2X18A5YDlzY92HjOEbBCF6WH6eBFrFqlZC4U2Al9fu0AUydYDupiNIEMmTuKJ/Gd5whJMaliDcVNSmbwkXp1GRVC1bAfoRq5PEzdqZ4fL0juv0CktGrdRcq61UnBo1YP5tgkOjzKksrKQ2rOIl30yf+AHV/8dlBe1U3n9tXMxnFSlXRxD/6lpbMN75ezc7oS/isRyYBtlNSxh6vbgYupVxXH0jCiM+Es3tJs+In5Q2swJUC9ffkbYrUyJTXbuz0v6HF88q2baxdX4O98nyfQPSxfY2WEy4KfecUWsRh2/1yxamM7oa6XQ6neereWalbhL+pUYkACvpkEDZW2EjZQ3IKCWFwN/Wx3kSwjhqv6hmDLCc5h0LQKx7t5R1x8gVIlkiF08UofVim3gfJIf59lY2h5UnSbQza7Aqe5mjtrnwoym6d1tSdE8P1s7X1ckIDjnf0bjhILdu462r+zhb7V40sU9UKvDS6VD/syytBuFksonn10dhwcoMiKBMvNOxPJ1nrk2h+tYvSwmaJkTDoHAbWmDwDZ+kyefT6InomR7yOSxRafzKBW2lijXSqXckhGYgtsD030Pu2MyrUgp51jLD9Q8r6qdNG7kkFjRjlpd4ucO5CmQ+qZZ5Hm0Z1wDnQvHXTAYjMWVmCtaoAnti8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(5023799004)(10067099003)(20052099010)(22082099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8+7xvnjMhtP81cSb3hpWebkk/CiIkQacSp6iWE02/QRf0TPQ3Sz9n+mAbSjS?=
 =?us-ascii?Q?v7NHWM62iMuWMejSu70D0q6DmZDFTw1d+V0OYPlOWHTrxXQY1nZGFpj54ZAZ?=
 =?us-ascii?Q?IQkTH7LSe5WCcB4ILSS0roHtt1icrJcrlF+KBgSeBeLYcaIfm1b5YzK54DW5?=
 =?us-ascii?Q?HGzyrCvW8Xe5tUXhBPOHIk/QTbuKNy1xNUg8v/1erWtJN/WZsB2k0BluOHHa?=
 =?us-ascii?Q?dM1vpdktSk2YWlXFYYsYrQDdXVRm4Klo1LC7/lGMNWgmgO072bbFFgMxmCqS?=
 =?us-ascii?Q?YFwMdQ0ZrY8G0Wuq2NiMKwf0S8kS4956tmsm6Sc+FkGMqh7Ie9rTsVcAjb6+?=
 =?us-ascii?Q?M5nXImM90Gz6Nb2UPNK/G7oFth87X5r8NBmF37cmb/UpjdKe1Is+S8gMQcGy?=
 =?us-ascii?Q?mmFrsb7z7ObYsm9Rz2f+I76NkrFYxIWo7WJh3RGa3rqUT8JdzYG4p3KSeazg?=
 =?us-ascii?Q?MCYv428ruhiOT6xtPKHZ3+HaoynYky9U8XsRnu478pMOG77QfKUXsokhSMj+?=
 =?us-ascii?Q?QArvJPQgcQThG7H/yqhIezPRN0PtyjCwXCcXXejKjtr1XKHwxGjOtMaNDjIo?=
 =?us-ascii?Q?f4iefJH43ArP4+qGX6vYKrU6ipLAfyyshy4zLq/elZOABYt0pG6Xvm+W5KUT?=
 =?us-ascii?Q?lFdSdgedHtBuX+dJFxuOsSwJVf2zsU1Lr+JHyG8AcDjeNS8OxOz6eszrjxO4?=
 =?us-ascii?Q?DwsCEDNroA9dAjzPDVSJrA+7OYFXxY0RSdSrV+idyo/4UgaJq3FwjmneEKe+?=
 =?us-ascii?Q?dQy48+7gmGuBjOJQ/jRDwCAKv1auAo3xd8GwK//HT11+23VSnp6d/dbz4gOA?=
 =?us-ascii?Q?lQdnjXxq0nfmOJNv9iMZG6z6G8O0H5d+LkdyIQ5/7n99rb6wZxvInGj0LeW/?=
 =?us-ascii?Q?T/ryWbp0cdKWsIg1ay5OhuoAqTxfiCIBOXK6jycFd7SBpuIle6bxHp3+ooex?=
 =?us-ascii?Q?ie6EspvKywmrOLC5RNkO1JrY+cXADCLU2PAkRyBSHR3m5yiSfBwIUpcdzCaH?=
 =?us-ascii?Q?6iB0e6WKJ3gGD5hmGOb93w6IIDX9AhmnFmuPQl9xyibBqGZh/w7BwgPQOvRu?=
 =?us-ascii?Q?lwH6pU/YETkTdfkkzIIxsyCCIOwPErcShDHOK4sbcrvPzH0132NTiGeoO5h2?=
 =?us-ascii?Q?XrN/C+pIS6TPN6H7zKfIPUBTxWr93Gzhw1PxF/GVCDIdNc05/bLJCe12h4lh?=
 =?us-ascii?Q?LIPsWxrDCzIGwycLfqzy4NTYo8+vdt0uFk6b//+8SWqGg4DAOuB/6fVv1ra+?=
 =?us-ascii?Q?/Ckt+ve0kGM/TvR4DApmRt90BAhYND9I6oPe9XgIAZszD32Gwh8VlonSAU6W?=
 =?us-ascii?Q?V7ss103XiRD4SeLYuJIC2U4KCYswSzXoNXTOiNyraXbuVslXvBIfh8RTh/jU?=
 =?us-ascii?Q?nzqk1mS1QzNUa7xSiVPkvk3ppJLXD7cI38l5oiHhCl8W11y09TdFfbXvsUQN?=
 =?us-ascii?Q?zr5eLUZGxDDWrEBMzHfPto4QTNr2DM4XjCb7s7tRfyPsynkf0OcZpfAd39lb?=
 =?us-ascii?Q?2OpdIIKKDOb9L9fQOYG/GhxUIRISisSuGGIEh8Pw9gOK/bzvEyaS8oaXKgat?=
 =?us-ascii?Q?oKexao2bTtyym/fTyA5XORAfNd5l++Tff41+tZbsmatZtMFQP4YwpuHlOC4o?=
 =?us-ascii?Q?10WHT3dyRltRrX5P/Kkl14ecfKpBVdMkDEcMzlW0dKaAv48ESADpMO5lQi6a?=
 =?us-ascii?Q?kC7BPYUStUdFP8YYwwSi5bZa9B8I1SD5/y10LdzYuFTmmDtCft24f8fLzXxA?=
 =?us-ascii?Q?iq0spux6YA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7180b78e-0d52-4023-6afb-08df13cacee7
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 08:16:28.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBJOJI7H0MS2KqSqNK2CzkCwkHhDosXBjLkel5g7nE3Sm5tkU1hJnrG18OSPii6ArXFZYPcifoLDyDGUQEY6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245935

Add ptest support using psmisc's upstream DejaGnu testsuite, which
exercises killall, pslog and fuser via their .exp scripts. The tools and
the testsuite helper programs (socket_test, test-listen) are installed
under a src/ layout so the scripts' ${topdir}src/<tool> paths resolve on
target.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v2:
- Point mktemp at a private, symlink-resolved TMPDIR in run-ptest
  so the fuser -a/-av/-va tests do not fail intermittently on the
  autobuilder when /tmp is a symlink or on a different mount.

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/psmisc/psmisc/run-ptest | 20 +++++++++
 meta/recipes-extended/psmisc/psmisc_23.7.bb   | 45 ++++++++++++++++++-
 3 files changed, 65 insertions(+), 1 deletion(-)
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
index 0000000000..ca7391b172
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc/run-ptest
@@ -0,0 +1,20 @@
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


