Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEB8C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:15:45 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10735.1789550140081745598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 02:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=k4WWr2Lk;
 spf=pass (domain: est.tech, ip: 52.101.72.16, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOKZcgRjwWiv6XrmyJll69ZGsWakYEHrS0/XzbEjUmrcp6XJ2liE3SgbvFDsvC91AWNesYhK3GKtgpGjv4zTErT0uBlAmPnRnW+t8izGyzvamwkKgZpoM8Ynaf0W7NLZaX9GK08CAb9tmqHIAvRsQYsVkBZgw6H0bDxUh4r0BDrBnrYYFx0h9EAto9EWAueubobU2tyFZjZSh2Hs2PcOfMKHsYFmtWWKSXsO+TuYeqsqYzwsed86K0NjcnIZnmrIlXnUZ/VBOm1hNzeK0VOx6NG52uf55nkbINy/MVYeGha5hvMuh/IldVfzf41Ru06WOMoIyPdHnXMjK/Xr0Cl10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzwG5LQ6LToiN8BkeQ2JN9NVMP6KdA7t3SRQ9uGB+X4=;
 b=T0KmdTTm2oGS0zESoRmF3ensjRBU96PHjwfRsFKQdMQAgJG3RIyJYGOQkMYyDbreeT9QhUG6p32qvxeL3owizgJlXCFuyhM7s++44vsYmAiap2yjb3acVSJ64pB2LE21QWvTJ61zn6jgjv59cqmsL6krJjpeyhCFwQ980KHKMPVQIzqsQVjACLpr7hatTyODyeIfmSNRskgOJMtLcwZt88VJvC9vcFhYEXUmSTlCR7iu3JfyjgntSKmlogvVnt4QdWpeNXNUqk/Z3JNvJMJjLCywuGF3KxKCgvFFaJz+uWxvxwiMIXRZPW/k/vQAN11UCOfWH5hlTFdFYcym8gqsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzwG5LQ6LToiN8BkeQ2JN9NVMP6KdA7t3SRQ9uGB+X4=;
 b=k4WWr2LkjikSUWyGFJ5MNLyj1FKwMRw+waRnPRtkJ3Jq2HkS4noKCx42hJyK/2pP+sAUhiWAr/Vze0r1kLkYc+bH69907omr8OqF71f/OVDCfx5xk55+dgpig5Mq/A1uf9gtwGoqNAKqepmXbuRgx+JFN2dSM4mvS+3tA02dTvO8hIWAAfoet5x/R7/ax8i0QGNXXsvwuABjiRqKroTbB1lQaolPYzHK98kyH0XNzO5KXYmMK8oQfo4rNfyRuXI/yJJJlLxgkyAQ7wEOL3swodmMXvLhFYG6X7WesepgvEkcr/tJZKpSfLDuJIAVHycJL/T6dF2m9p+2QBqf7IJoLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB9P189MB1932.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:337::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 09:15:35 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 09:15:35 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] psmisc: add ptest support
Date: Wed, 16 Sep 2026 11:15:31 +0200
Message-ID: <20260916091531.14596-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914130447.107189-1-pratik.farkase@est.tech>
References: <20260914130447.107189-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB9P189MB1932:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a777560-04f7-4c67-d6d8-08df13d310ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|5023799004|11063799006|10067099003|20052099010|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	KBo8MrBHYaLEm6yUDYDhuRQ7b3fdpT+N1u1KQaWPF0SE2E5Cn+1Uev0s7gUKxClUh9EKYfp2VFPDWdwSH9W/z/zn45mx0Sw+B5/k4tkrcYxrtn6BmQtB/5p8GkI+1IcpV87O7Za60LCu0+vzhm+ok9w+uCCrtjZDnVU/7v+o8iTQEtKs9FNt5aGNxiNCJdGCaxx4ETwyfk6KNhMA35kEEfKZqX7z2HsRnH07GnXIsbYjiHIp8QAK5g1XPRncv474lPa5vP5fAM9Agd2TCW04uwyuGshNcidk4bmP/5octNeZOixtzUQybX+310kDwY6TUQp3zkNOFMWMUzETAeVlcj1+JgygZ9DcBfCN/ot9Ch9YNqCQ04Afx200L4jORYjhbVjXA4Xjd4mfQJI1K3dFkGwqaV18KpmY0Des3+f5BP7n0wZX2ogdBjQ1lGEgaop0jJqVz1eNlIPN9qSs8kqdpsaQBqM3AVdU+a3OAnUnMiRM0WEdO6rW66k6BWsiy+J3/FbBHQHiRDXO8+gsBc8nadq319b1UVpg1diZkfcLrHnSm0TxSrxm3pFCEBSatmBw9OXDzfgwB3fjbtLwPTRQhnQgnOWiisR8LoToHvxfBbffT3RHU29aX6+QcZa9XHbzqis1rI9nTS/hzwASadVfDqjIT+kUEl2d9GG/hSdatQg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(5023799004)(11063799006)(10067099003)(20052099010)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wd5ESp6Bc4kQVYfM0gSPpPJeRFI621fEjG7yv5JernRQID9syYUD3aR5fmIz?=
 =?us-ascii?Q?1A2xtlSXRObU+iVtus8F8gWz7Rzex2nUzZktnhuNhj0hJ4d7bsWAC2tPkiMN?=
 =?us-ascii?Q?wROmvBW2Mf44YyraOU4TE4SwAFbaAF4JndpjMXcDqNtFW8qZBEFD+hIWYPAK?=
 =?us-ascii?Q?lFBbWAi9WGInIHDD3IMIH3iQDOIZf3FiUXdVuEUpAMdwjLFdXQ3IW4ibugfj?=
 =?us-ascii?Q?/jYAPGhaJMYjd2g5zrDnQhcilPep6+da9HiiULUGO2PF/ud1Dlk295enmWp4?=
 =?us-ascii?Q?5SzTPb/e8hh2ARkcQLYsMsPTrwoSq+YRa+dVZSIpxcc8U3gCeFWIYQGXZEq/?=
 =?us-ascii?Q?AtWh4aD5afzVi1UkDsYQ8NmiujTsvb0OE+RcBGCtYwpmCXhV04enXo2v5U9w?=
 =?us-ascii?Q?m8t1bcjZ/1Cw9yECB9gUdjaIzEwMbYKbBCZfszHoc+prvxo8v9VnqNX9iOub?=
 =?us-ascii?Q?Pv6+JccMGn/3XYrjCoDXUHOQP9lhi/oKRCmQwQVhm4cnUfI6NHPrbv+Agbdg?=
 =?us-ascii?Q?RLetncU1JsMu8GFKiBUZPcQp/6JQT8H+5FEcFrVbZ1lDEDg2ta9XT7J9PN/Z?=
 =?us-ascii?Q?csZe1W0UKQdmNTUT+dVbhv7JYbWdDBQ9/x6og1vmmafQ1+3xuuOBIialeCy/?=
 =?us-ascii?Q?XHd0CsPAC1okywmqK4F+g8L6ODqkWpdL9jifckq5Te0pjtvFrnZldQLFpc74?=
 =?us-ascii?Q?HjImTp94nf2kFIxNAXJpZJeDAK9TB/x1AqUlQiOYRqNZO8tfupu0zXLceYwZ?=
 =?us-ascii?Q?SzgWYIs2CKlK4qwzzHE3tixG/jrIk1Jt08lrS7H9y+Yx2sfY9NwIWHyaUQXv?=
 =?us-ascii?Q?yfmQmKDUwskQNdiBXKDPnkluW4k7ZBhM4Eklz5Xwg103hf7nULjqw4kdtCzW?=
 =?us-ascii?Q?DyWyDipVzv6A1jiw/kyxW6uV/+pIWiuXh6gHzYS/nzHRVGs2aZxU0e2u3jwe?=
 =?us-ascii?Q?2x0NgMFLKxIADCWu5OEimTqP4NtdCjAMADvpFrCyS+c1yi+baKvKKlKW2fFl?=
 =?us-ascii?Q?KLrifrnIAi0hGVYGmniSBy7IffKnv46CMtuFg22wTxKiaTdfyS1HhItE40bj?=
 =?us-ascii?Q?pSjMSHRqpTcFVPExki3dRMohGEU8De3Nxo30ZKJSYA0SYp7CXh7MzP4IWWuO?=
 =?us-ascii?Q?zm4LWdKaVigqzx73IF+g47LJgO1aszaYYACXwvMus9bCN4BMPLq7Zf7i2oY1?=
 =?us-ascii?Q?OXybqBUmpp4sKLvtWHs+9xXJlEROO+WLGnoJW/BapxDqdiE4dVxDojNrhfdX?=
 =?us-ascii?Q?Ltawo5g82zahTmRkQ0om0lFBy+JNslL+R65/eWvPNnLtvouiqz5eZ5HsXPWP?=
 =?us-ascii?Q?Sbr/GYNxokAfP7CoPCQWrnztv3vzEfckFap5n6t8Klpd4fmIXCn7ZRqQZkeA?=
 =?us-ascii?Q?QvaSntyWxNCXBO7vHpw0cohwE+qZoBuI1LOg4h0uK8++cn3j7lT7BdwN5aXk?=
 =?us-ascii?Q?qt7KyBQbMXJSoO9k2l84l0fa1LjQmKfBLaeyx60VdqkDAXd9zTPU8kFKEYPj?=
 =?us-ascii?Q?Sh4TxcjVxXWrD2hmqSVqPdYNfd2tv3qBLV2OzEoX14NCt7pKUGqK/2UL1Cs+?=
 =?us-ascii?Q?6NetLoojXEDLIFmicbNTwmyRotdJxIaKahTHsbu/kyCOb37/Qim6st6OeA6n?=
 =?us-ascii?Q?4QqM9qUs4fSTV5oa/3Krszv7RkaQp4MHxm0GAOUnpreIKd1bF0BPZloO9H8r?=
 =?us-ascii?Q?gV1BvUaUSOuBkMz0XlN2HZQHq+E24g7dhq2VeHa4ImFwcFUaYbfDY3u3ooGV?=
 =?us-ascii?Q?aPidVTvyHw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a777560-04f7-4c67-d6d8-08df13d310ad
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:15:34.9968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lna6ig2N1RUYgh9NvJZvggPbndw+5WhFMWPIxqnJncg5q/MK+kFJOLN5/84dPYLHrOdTKBZ7RNdVi0KSJcoihw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1932
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245945

Add ptest support using psmisc's upstream DejaGnu testsuite, which
exercises killall, pslog and fuser via their .exp scripts. The tools and
the testsuite helper programs (socket_test, test-listen) are installed
under a src/ layout so the scripts' ${topdir}src/<tool> paths resolve on
target.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    Changes in v2:
    - Point mktemp at a private, symlink-resolved TMPDIR in run-ptest so th=
e
      fuser -a/-av/-va tests do not fail intermittently on the autobuilder
      when /tmp is a symlink or on a different mount.

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


