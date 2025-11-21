Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFBDCFC268
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 11:54:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9841.1763726072626572493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 03:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sPwGitQH;
 spf=pass (domain: est.tech, ip: 52.101.66.68, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG99gHtZl8hSK5c0IPxHPlmhwAj8/4zQ3OQrlaSt8G5rNdR7L2X2PNm28pEuBt7Gd6rIaJ76a40a8QrQigP1olppQukA3cEy8sDpMOkcnkpabfXBWjwmIWdYb1wZb7DFX4x173UmI/eXHBJ1ZlUF3shnSBE0pVkb43uLxTYWyXfTVesHmWWE3qeJOzy4BXpSdLz6TuhF1vj1cg1K9nEJ9/tG+pf+jnW9iEIfJeTRU59TBuwbE8jJXJLonPE01vs3HDNpmuXfphfwHu7BnMVdRI+n9NX6r7AlYzxLuCjLK488XVj4RdM+5gCFthMJ/681Odlu1OKDmNvxvPP9UHCYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oodYM2UnVXbco9EspHL3fD3cyhue88kSO2bh4zLI/JI=;
 b=aFGkonP3Y5GcMsBdDusysG9suSsD1s1XfZtcUAW/svouTjcNe0INAvEllVXmK+DHt2Q+JplZ+B2n8oXi8qaMlHQAIRgQAn/hfp6qB9QOJnTNjPPbOcG9e8hkF3EIMDN6TtQQe/iqXLwusSJR28eLo28pfh7SJnpOke+cN9DFLti4ixUmCfpgBaX32pzvumnJ19EIoLe1kC8BocQIVI6+GCjpyX4guiQ3B3/c7wg73FlNB4Bl1Nnxxl+VXQbUAWO7baBfR/XMN2Y4g7f8d8H4G9Ie2ZTb9tGLaduDG1hL3aQOBcsgnfJdugIwz1JRGtvtkuzF+j+mnqmlGCwlrEtQdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oodYM2UnVXbco9EspHL3fD3cyhue88kSO2bh4zLI/JI=;
 b=sPwGitQHBHYwRTHoEy8qZbv0KBOolbqEqCflYH2gH9/CmqXyn6+k5MDX88PjFNHkGOwGDFQXg1BUwRCExIm49nnDSShZ24+Whix0bneiwzof7fI7ioOeWMV+gIN3DIoD/GPpVJOnlhvLsrFvlAznQ/CSStvhTEwdCgcvnwgy0CXywKQzOVTZFHJBWQfJ4/HKAevk0S7r/mSOx/jkDHMl3oPhby/D84JMMzWRf8aY+oZjbHUulsrGGlQJH6WW6wzz7gSNr11+cIUB0cYXAH6xeGeq3y3Dvu7QBLKmyO1wEbLVlcsDsU3+iE4NwppCgwVGAf96GpDxuCsjj7Xauu61Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU7PPFFB02F9236.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aef) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 11:54:29 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 11:54:28 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libyaml: add ptest support
Date: Fri, 21 Nov 2025 12:54:20 +0100
Message-ID: <20251121115420.15308-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121105612.12259-1-pratik.farkase@est.tech>
References: <20251121105612.12259-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::15) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU7PPFFB02F9236:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f9cff3-7113-48c5-388f-08de28f4b9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GsMhaGUXBe5/MwRM4a/gV2wp3CSpAmGMgSdS5+b7Yt3j/L4A8EzWaRFvKdyX?=
 =?us-ascii?Q?8PpTEA4L9lzFmDCmbXBwQbZilc48xPJYVFFfV8Cpj+tDbEheXTXIpB98VCDy?=
 =?us-ascii?Q?V2bCeUyzYGM62TyVUMdSRU4qs1oCH6HvTKGlLHuK850yg99tjWc6XUimELIl?=
 =?us-ascii?Q?3OlIYUah3hNAKiEo7g87gBe4wm814OSwksNnPelyrzLaM2zT4iTkIx4GQIhZ?=
 =?us-ascii?Q?GnZpSzJUzfBw6YBbbXJqqHVJolWN3dGm25gxWnfTWt+3BKw/sO35z+ZHEF5V?=
 =?us-ascii?Q?Zf8NyETqtLc8EIHBT9FO4SDBzkwoXzk8RMdlvM4vpQuRml23ijHi2+Z2C+Xi?=
 =?us-ascii?Q?dx2t93sxPT/4SgN9u+D22gpVU2stAWmlLybtolySS3AommD05jWUfuZx4wD5?=
 =?us-ascii?Q?OgzBRExrYJENg2q0DiDXVNN+i6qJbCytdWQmzJ8AGnemIeNS+lvTU14Olp7F?=
 =?us-ascii?Q?dwwmv0hUXp3XkkJ6yNREFYy6EXV5eR6Q2k+697ydGO4YLlD1a66gAuNywHgw?=
 =?us-ascii?Q?nwlmpbzHObWAHbQvyJAmnjMCbNDjzuY/npyXJiv/UT76fE8iJceth+BMJTdm?=
 =?us-ascii?Q?pagLGJz7VMArj+ztQsnBIyPoSHpEImIpjCHWQ5pllN8zVk4iwoZaUR9SIAZR?=
 =?us-ascii?Q?XGjIi0WI49t1A0R81DMGhV5gRasAlKRAattGFokVGeV31AF+MnLKYHvzKHpF?=
 =?us-ascii?Q?s88NeihUIXo76aOmivLF8FqzDNJPFjev0tYXmutE1jQt/5rV2ireDdN0IlnB?=
 =?us-ascii?Q?Gc528LM89GB9iXqkawZXqNsygzcdpj0MZmp9m9BIpwJuk7mNNBZ2pCnZL6dc?=
 =?us-ascii?Q?nXZsC3e9aJbcoWgwTlhudcuzocx5aMeqegaUDHpPROANZ1ZqRexOjJKKESEX?=
 =?us-ascii?Q?p7tkamAjqpTgipIwNQtWA8f6eiXsnbFmhqs0T1XkvKIeiTxlkBFbwWxY6HZ4?=
 =?us-ascii?Q?8GbBHQYSzmO68RyDHGs6yVmbIjylkW7k5/TGYnvl0tGPvJNIMJAUAlI9Z63i?=
 =?us-ascii?Q?r6Vh6GcRxPQ1R9UMICyWgLxgxCbPHzyhyqnkJi0ETrncpumHCIJRYa+8BQQB?=
 =?us-ascii?Q?ifp2DGRIVW+QL9eTDF3Q+0DjPQ8vKK8YgzsusGKX3Lr1pBEMY5SWGsxUdF9Z?=
 =?us-ascii?Q?oOPEeORUFdLpeQ9mTA0nLJCxf6WqDTsfnAeM8tofDXSfxbb4EKhCk6iw1hCp?=
 =?us-ascii?Q?6d6BkhycXj/MIOUH2tcDLdK/eil1cWkFH5fnoO29vQqrqCBMIkv0qYZllSmZ?=
 =?us-ascii?Q?til+yNqyDTd9ICL7764p3p8OwTKB4WNAUBLVZw4Mchpjx4nvf7XcYKTSvrvs?=
 =?us-ascii?Q?kKdmARqjB47KH+MJXzwPTJaPZJRrppZnw7Tb11wEYzPBUmLnGr15GrNfz9/b?=
 =?us-ascii?Q?dNcCWxyzuY/do+2dGAcO6vfiBtKz9IRmm+gE1qjx4K7y1nnPWyt9QVRq2cqO?=
 =?us-ascii?Q?kI5aYUkzVuyjQXdr3wGK/LHfAZF6sWUl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?09yqIL2jDckaLzvyZbovEG/lJxpxjXAv1aMiopITr7/DscNfD7Teiuao4nNn?=
 =?us-ascii?Q?gD0m/nsjsmzwxAftzyY7WjZyR5uzkHcN6fwfGZBfY2k4KqUmdurFcwY2PaRx?=
 =?us-ascii?Q?S+HC5VlUmFExfcvvyqEgCQ1NCziGZX8OMYYxc1poxPVI+gJUyg0sChAmZSG6?=
 =?us-ascii?Q?tFkV++OmBJtioDQ34wmYI1ZCqWsOSqHga1Gd89mRo8fQUz4WiVxJJZMtdIq5?=
 =?us-ascii?Q?DwRL/do3b5nQsBh34e2/NEkEduZu2upLnK/2bpnDxC5R00/2qfd/t1jRHWtv?=
 =?us-ascii?Q?MBOcXDsxnHsEUY25CfCdbamfKYDlHL09PBniaF4hrW8FATpdCSf63gwNXArM?=
 =?us-ascii?Q?UodBBeOzvdMDkzdYQnfsI69ovP51J/d48pVzzi8vxy1nesVefnc/cQtUH01F?=
 =?us-ascii?Q?yEA48ADViYTz67UXbzwJYVTAyuucMANpwbRbv9Mz2Qgxv5sm46DrDsFzibso?=
 =?us-ascii?Q?xOngMBjrOIKSjAmYY5BYZcFRAJsO2/wY+KCQGPGAUx0xhKkDxWtFuuwnpmE8?=
 =?us-ascii?Q?7rPVywkM3ZH68LpqLGq0kC+DWJpTBh2odOJD+vR7R11bAjDriHvn3wLGYMac?=
 =?us-ascii?Q?9DYtT9xZKXVwKlF/Slo6wZF2p8uFY5qJFKQOBDw+zAE26OHNBQyOvJu7cbrR?=
 =?us-ascii?Q?WlHQLcnxtuvB+P0CMiiLlc3lUxCsyKV3IGGTboBB6tWkSPmIGVmX/yjcMthj?=
 =?us-ascii?Q?5SwPbFHfL1WjVvKKV+M3+JEHpP5Cp9DBKdZMmlXal/6EmU270MIz9ME7mo9E?=
 =?us-ascii?Q?NGxTgJuR/g9Uha+Q2EbQ8uF6KZ3SuaUFAKdnirtlhllRviR1VdsGIy0F0fd2?=
 =?us-ascii?Q?3pujI95dPlPWCja8O14O0nSCbVF9MIafeAPw/jopM29rNHCIdaL9k40k+d08?=
 =?us-ascii?Q?CPBrPjc830Ua6YIbqcywhKb9wQzCQKvLb+rfc3ffIJVErTysxvFWn5zk5V7z?=
 =?us-ascii?Q?btDso1ss2Sko9rXw2Na4FDdueRtT/w2gFTCqh3Sln4ziU0suj/kod2oEh0cY?=
 =?us-ascii?Q?/bEeVjy2NsKCOxsdYqiF/e1yhsUgDtm2Rb/wNbEWAN6OG1QBlT45GkL0+GzN?=
 =?us-ascii?Q?EeEhbdk40h3UcPfQPMLpGSWeFHjjSiDT88PuZ9rRcwTMjML87NmG2Ysofr1A?=
 =?us-ascii?Q?W4UpZfLzaBNG4MdEhLDZ2lkeKaM7+Jx+bgKk8OQ5QzlF0M3y4CugQK90p61R?=
 =?us-ascii?Q?IeyLI1vcQ4RxsRFWEDLAoRL1TTyaY57GBd3c/y+NMSbblRPqb7rY1i5TKLhF?=
 =?us-ascii?Q?alS8W2z3wSzaOn/apszHeJ2y65IH8S/DzR2g1Mv0QO9j6In3PMVqmLCHPofb?=
 =?us-ascii?Q?MRKnsG6thvJXsh87qRCuSbfsRVQKbZqg7epevTNRplJ0rXDxz1ZQjsZtmeid?=
 =?us-ascii?Q?b1hiV6lO8I0a6sX5Uq3crTvxPzVUUtTytxdB2d/szwlQ2hm7+aUAMV/dI+A5?=
 =?us-ascii?Q?gbBi1AVN6zGRhs+VGMbwW9KpmNS9Ku9YOxpAClbMi3BErW2eAlAXvCT89zar?=
 =?us-ascii?Q?lgcemY9kpqxmLDXa6dIE78Evg8KUyg5GalQkA8TeQV2jmd9j/8enaruws8IZ?=
 =?us-ascii?Q?DnX83rtlQJpKO3EVd/UP7yfxgOAe7rpcp1HUNfd2ns68lGS9ft6wjFrCSWNf?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f9cff3-7113-48c5-388f-08de28f4b9b4
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 11:54:28.7472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmWX+KCCb13oOxiWMBvAQWEUkeL+uIGgFzYVW9ORgNx3B7ZK0XGJfmz473K1QAln8wuTaHE/EK5P411lkR70ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFFB02F9236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 11:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226673

Add ptest support for libyaml to enable running the test suite
on target devices. This includes:

- test-version: Verifies library version information
- test-reader: Tests YAML reading functionality

All 2 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libyaml/ptest
PASS: test-version
PASS: test-reader
DURATION: 0
END: /usr/lib/libyaml/ptest
STOP: ptest-runner

Changes in v2:
- Remove hardcoded version from test summary
- Remove static XFAIL/XPASS/ERROR lines (always 0)
- Move PTEST_TESTS definition above functions for better readability
- Auto-discover test binaries in run-ptest

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libyaml/libyaml/run-ptest | 46 +++++++++++++++++++
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 21 ++++++++-
 3 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 06d113e264..6a0c23586e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -49,6 +49,7 @@ PTESTS_FAST =3D "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libyaml \
     logrotate \
     lua \
     lzo \
diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest b/meta/recipes-=
support/libyaml/libyaml/run-ptest
new file mode 100755
index 0000000000..a9cbe9cf0d
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+# run-ptest - Execute libyaml test suite
+
+cd tests || exit 1
+
+TOTAL=3D0
+PASS=3D0
+FAIL=3D0
+SKIP=3D0
+
+run_test() {
+    test_name=3D"$1"
+    test_bin=3D"./${test_name}"
+
+    TOTAL=3D$((TOTAL + 1))
+
+    if [ ! -x "${test_bin}" ]; then
+        echo "SKIP: ${test_name}"
+        SKIP=3D$((SKIP + 1))
+        return
+    fi
+
+    if ${test_bin} >/dev/null 2>&1; then
+        echo "PASS: ${test_name}"
+        PASS=3D$((PASS + 1))
+    else
+        echo "FAIL: ${test_name}"
+        FAIL=3D$((FAIL + 1))
+        return 1
+    fi
+}
+
+for test_bin in ./test-*; do
+    if [ -x "${test_bin}" ]; then
+        test_name=3D$(basename "${test_bin}")
+        run_test "${test_name}"
+    fi
+done
+
+echo "# TOTAL: ${TOTAL}"
+echo "# PASS:  ${PASS}"
+echo "# SKIP:  ${SKIP}"
+echo "# FAIL:  ${FAIL}"
+
+test ${FAIL} -eq 0
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-s=
upport/libyaml/libyaml_0.2.5.bb
index 0d8e8762d5..9a905215d3 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -7,14 +7,31 @@ SECTION =3D "libs/devel"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://License;md5=3D7bbd28caa69f81f5cd5f48647236663=
d"
=20
-SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+           file://run-ptest \
+"
 SRC_URI[sha256sum] =3D "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2=
988e3c02678ef4"
=20
 S =3D "${UNPACKDIR}/yaml-${PV}"
=20
-inherit autotools
+inherit autotools ptest
=20
 DISABLE_STATIC:class-nativesdk =3D ""
 DISABLE_STATIC:class-native =3D ""
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+PTEST_TESTS =3D "test-version test-reader"
+
+do_compile_ptest() {
+    oe_runmake -C tests ${PTEST_TESTS}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for test in ${PTEST_TESTS}; do
+        if [ -f ${B}/tests/.libs/${test} ]; then
+            install -m 0755 ${B}/tests/.libs/${test} ${D}${PTEST_PATH}/tes=
ts/
+        fi
+    done
+}
--=20
2.43.0

