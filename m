Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40830C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 13:05:06 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19751.1789391099418192276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 06:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HC78bdjx;
 spf=pass (domain: est.tech, ip: 52.101.66.1, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCJofQ/mNHMpDhtCJDJiv8Vg9CZ9dGo+l9rOfdol2HtuA9qOwEKEZzepSCFf4tS86jv9rXrdFSbf1UcGDfNk9KMaZrNENe99IHeuNbckQN8z3eDTmc7Yz2L3VdJIalgVG4uHfXW7um15+MPVPzlESIJECBxgUGPAV9KW4m5I7omyeDrm47yAtBZHWHfXlq1jSSmEAmhF06yjj1neByrd5vWq7F8zL8FXDVe6fVWv5p0/kmXfGB8Q1kq3VPM0hJBbqYNGzyOLyofwCIK3WnwSL429zobjQgbXsAYtBeZoOX1r4vTRHBnvxdsfclnl1aCVfnR5grG12HexQPFyxO3/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrLMsL6XEUak2Zs59/FYU1hLCCt5n4cZUC4jr2vWCM8=;
 b=dv9XWbLBJEF/tXjRGcouSED0D6i4TvDabwSMl/3FoPNztGaf/09gIC+4aTe0SNV4OmEcHw0dk4vreA++9RG0BLKtfwJqXQ5DLKhXYVRcKntQ+Rm6dMR8pvLuR9TrIwEaj5B1vK7zDBP9xQMNzSUrT0yzm19b1ZdQXBw0E2Ro43us04m0w2v2u6BwlUBmzkuRUAPAEfOSp8/r4fEbNS6f5+f/zDx1wc6ASl9wQ51Fdg3cI9m9h/4UAyLxdqRRxzkIdHWxNX+T4D8T9hM1dUq2mgpMDWaxN1aKpGh6pdKuCF0Gixs1X0t/K48Pv+0nGCjMhtuN/KSXt4EeOxl16j4Hsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrLMsL6XEUak2Zs59/FYU1hLCCt5n4cZUC4jr2vWCM8=;
 b=HC78bdjxKKpR8rQiRV+M1v+a7CVdNXJXt1N+iBjKacGUQB85AiZ2dsrvLOlk3LOGcZtqg69XVqicu9tM/60JllwtT6Dmtb3p3tVVYjZfXOGG+uqCmRxIpusTjd7tyjO8Hm5ArUkUwzghrAH4TNf1tgMdCJTf1ulo+ySU5cA4QcudbBwkJ/EEGu9b8eq0taYMPKZ2AenR57pR6FKEtSb/lYyavcDgY1uMgeVIYXnQhLKgoKS11q6umSo9RLQsk57tmqIMkatlmjrrvVxRrVuTZCxAD0PkXo2+Ywpz2FV+1gY9fycKfmowwTvw9okcgpOpQ9VtsVo/FkrcxfnwgRU4YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS4P189MB1968.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4ba::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:04:55 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:04:55 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] psmisc: add ptest support
Date: Mon, 14 Sep 2026 15:04:46 +0200
Message-ID: <20260914130447.107189-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0360.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::28) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AS4P189MB1968:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c168ec5-9aed-430d-28a9-08df1260c599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|5023799004|11063799006|56012099006|10067099003|20052099010|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Q4BA7P0CYKRHSmTulvXoffwoSMAErzz4q54gYdeYXyJKMZTz0NJ68kU5fCdIxuB6YiK/t6A7FKp3HXMMNj/KH7XqlrRaYPr2z4T9twlEg7m/WYLL1XclNT7QaI7jqyNgjEtS10LSn3UGqomI2Mhhx2RPtpfSalQrVCf3JjEDWlenhR/xkE9KwfJsDKqjyEOTllxVJ6a/O1D4Twn5N9kgS/4j1vqeaL5Bd6XD70ogig28Ia8vS04zaabDqFMgZvMUUrvSkTFPZKS0x0kHrkSqDDtJR0jKHBub3XRQIsT6HdBUeEGIF/Mn0/7qGsHuEGOQ2k4wz6v5ELCMVi52EP925ZmroOnKWyizEby/qlt6wYBLW4AodvVHfqAU6otvcmsY9CvBb1dwypwMRsSZZDEXqeG7QnMgtdLwbFsmdHWhevxvD6ruIIRi4nFXjq5v2a4P+8MWnV6KjYN0baRcTAotqaGAf3HrBxGE5Wanhl9USmhzKww4ihGjigEaplPtow5cUBbdTlszSPI/LY5FskK2vgYRugEEVCFi0XvuD7/0/KZm6FYB8vrv7hgyd9ZD5csGdV1zIuJfZrUau7462JTv2UBkU48LhSn9rze0E5Y9YgDhOdjmylcSaiJn6pjltifoU41fE5eqEKbEgnHsD6qNjUCT9F293GdMZHfJ3Vj3UAs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(5023799004)(11063799006)(56012099006)(10067099003)(20052099010)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/aQar5CeDrRBS3SFihtk6CuNUn7YWod03dMfbFdWYWniLPB0nXF3eqvw/HVr?=
 =?us-ascii?Q?4Izgs6RPD1MEBms1XmyNGdF+7mncztseXM9p/UFOt2E3nB9IH/skCN6sv/68?=
 =?us-ascii?Q?LjLvymIOgI9egmj3k/yQM+Pp06eYJKgprDXz1XgaButD5uiKHmF9fExVWViu?=
 =?us-ascii?Q?m1Muwk9YomdQzIZIeZ23n9YyWUSSqipqSgEIOgTSb+jteYpjyBLCu7iEOllu?=
 =?us-ascii?Q?M2FWgg3WhG4QZrK2rzps62os3nHYdrUw/FIwA/eGHAZ9IfKMjLqaOVVrsp9C?=
 =?us-ascii?Q?8CYSWNkYjFt3oHXruKvlFc0/btnTd+xEELuGCrlWdaQfucSulNLnxvhnoNfb?=
 =?us-ascii?Q?NFQDRvmmRWWlLXC0t5BjL2L0LmIhlSt8V5FJNrBQBzDU+EvzjgsfXcBxKVaK?=
 =?us-ascii?Q?RPDbeLT5OPlmKfmGXmoMm2AhGNnpaGj/nZtJCUFGnd+3kgby4vhuQZwgZuqN?=
 =?us-ascii?Q?BzAQgXutcrYQKANnl58SnRgDRMTnsbXlMuwTHdANDva9606OzGod1D1f32T8?=
 =?us-ascii?Q?l6KNzv4R8pXF9ZaqJWW6f/NGIr8+MUI//3eUhH0HFr0Xv3+jhfaMcHd+T/FO?=
 =?us-ascii?Q?4JJvwAUMuGo6gqpf+Vv0aSsZxAxD4T7mDxJjrHBccRVm/ChlzJSY3OrylwR8?=
 =?us-ascii?Q?ShL6GqZST4G0k9QDI4/MHRN5HxphYuHRtP/liick2q6cZylPIQgycC6/EOQ/?=
 =?us-ascii?Q?JVUExy+KyCWEM2jf4lRBKWo8aLbmlD1D90gQUdK1NjVA7jnocu6xJIsrf8YD?=
 =?us-ascii?Q?Q1FbJzXgGSXtYfwK+YFZJJgotElJoZHu3Hutx1/GFrVZg6/Qs1qFJ6FMRWPB?=
 =?us-ascii?Q?kI5lN1Ds/ovv/GtNVq08mdh637jt+1k9P9bqml0e5j2m2QvoSpBT3kEpzP2Q?=
 =?us-ascii?Q?kBXPAo3m25z1lZDmtqpOrDmMEdUtjwvOeuTqVVjija+NxjEoiTJ09RGDzu9f?=
 =?us-ascii?Q?9pNJsEUirPRdtzon515EV++mrx4QXNJo1Jr/CjIpG/ev58Kza769D+AloXqI?=
 =?us-ascii?Q?Bxv5L3GOQkdeqqT5KAADbdz8GjRYEazjxkjZzoI/RS2kKWFyHq6N09Sx9aqI?=
 =?us-ascii?Q?EMlXMDQRWIBkarYgXwunws4TPj3dj+8If0pDeUaRA9InRIVSOLjbawgfVMVy?=
 =?us-ascii?Q?Ka++HkkpckZJBA5aC7DeNYp7UZFPTafv0zlK8mBGFXGLmxnToVkuUg+L+Iov?=
 =?us-ascii?Q?jtqO1gWtozwyx807rwHdKVSpBd3+6HWwbziRqovAPeX2orOxuHRiXqx+cgFz?=
 =?us-ascii?Q?2FhMwUWAZTDt5LVgAjWGeusug/G+HWiJktPl//CR9UYy7rITq2+Lp+rdXUFB?=
 =?us-ascii?Q?ozXjKGaRB6UG+iOsSdFyrwN2xZJHw3/qvF39ovG26bV1FdrjbjJn3EQ/W2ZW?=
 =?us-ascii?Q?80r8HhrmHElYCb5gClrrQWEMaIcH0StP7izYTqKZHZSq6D4TANSFtHX03+Bo?=
 =?us-ascii?Q?cIZmV9ZM6DDhWJTZ1YcYsRM7Sh3YPYIovGpSSStuM0Rq9BANRFmiPMclYPM6?=
 =?us-ascii?Q?mMrgQ0VmXlWukjHWNX5cvqTfvqxRGHPbuYQ7RjnavEA/BiNRF+vlCun7C0DR?=
 =?us-ascii?Q?F3rbdpBdInXP8SfJXQ5tJgHeh5frwYhJ0RI9D211ONW11o3fYdD7k7t6M/pK?=
 =?us-ascii?Q?Hkv9aCkNpfvPouWJJM1clqcIrCtagGUSUx6ef4h3aXS5bhZ3Dn6Z9HHlBU9P?=
 =?us-ascii?Q?dqnX5rSqVjDcpu9JKw7HCVUyFFkUzDGvsRPQwC8t18p5yLnuyKrIwOKf/ZvM?=
 =?us-ascii?Q?0P05bpiFgA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c168ec5-9aed-430d-28a9-08df1260c599
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:04:55.3000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHrSA1ahpZQ+yD5N803rjeoZ3S1lagkYR/nFKU38favy73APuqz0lmVigNLqbln5FmQJGWXkw2hoCjA5vmbl8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 13:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245780

Add ptest support using psmisc's upstream DejaGnu testsuite, which
exercises killall, pslog and fuser via their .exp scripts. The tools and
the testsuite helper programs (socket_test, test-listen) are installed
under a src/ layout so the scripts' ${topdir}src/<tool> paths resolve on
target.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/psmisc/psmisc/run-ptest |  7 +++
 meta/recipes-extended/psmisc/psmisc_23.7.bb   | 45 ++++++++++++++++++-
 3 files changed, 52 insertions(+), 1 deletion(-)
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
index 0000000000..f4e79f5ae3
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+cd ./testsuite
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


