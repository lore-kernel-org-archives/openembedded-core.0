Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794D8CFC275
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:24:36 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11280.1763731468927287051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jFH1E2v3;
 spf=pass (domain: est.tech, ip: 52.101.72.36, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib1eXyW3K4a0zZ9X/YuanELRTCXYpFWxSnGMJpy4lRT5DvbR+pKl57QiYC0OTyl0EiUJo2c/uKsifx5Kj2AfsbNjkuk3KdSc71eO2oiCZJUR44iGA+ZvUM72VT2+pZa7IE+2HAH5HzHjYZBqcDdnRL/RCGbopQ7hLJiQgd1mgG1uWXFglCg/8EUbLYmluqOvRXBhw6KMmIk5cOp6WlZsWIXJbGZD52yn6w4CRR3mjgqws02e1mjRC7F3oJx5WoF8cF6h+RvP7Et/tvYGjDsKLHhdCmbLTwhfkB814Rs9qmkmvNJ8tFUGKFA2sYLZGsJp+Hm1NbbDDexzIprQeoDLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzGSWXjjeyPKJ+8lrdZEFSKEiguW6jeFu72sB0Jr62o=;
 b=k6ZpgJiGAbkKCAOfXJnI5L3SiBnfry/J/Mps37oxQA/yZDeH4gzTbuef23qT74ObGnMdyt1cfNXRWpGgDIpxc6d4RgAO0XO+5SGA5Gj7c8MEVw76wgtexLNTK9b0kwSb49Dts71mkaGw1gzv9qzIcTFnjE9sOHu1v3GeZ5OoBhJw7HBN/FkAE4A8EbK2+KLwDa4yg6SKVvQVZu1bBfgOzZQM0Wbvygh+KZ00/ngC4c88YQaDZgxxBQ+RBAZ9/b8xMg9Fmna1VVw3Grr3S+oYrLOEQzAfulGteYx9wpLvaoAsrnVkLleJ0nJAbvVRzwoaf4TLE8/d+9QTctCZHw/62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzGSWXjjeyPKJ+8lrdZEFSKEiguW6jeFu72sB0Jr62o=;
 b=jFH1E2v3lOKr7BQMn/UUp7mucjlzFxB2hlrj4ZD1O5DjmgY9361oySk4CKbFyGCVN55Sf13ED/83Ez7I102/35svyr5UVuknbgWiqnHJckaRSq7CqqgXFpAnOG3ca12s8r/tawQwXaErHuljctrOghRWwRi+6euPf03SKgRIZzpbR9Cxx4SZcaMKHKnoC1wtY5QDACmgk9Yc3NKpfT6UH6pFvPDqB2/ltCeg0ylgqha9p32Vcf+AQoZFYF0Pg+AETvGC+QxpvZqZIVISJAvUXuA8dBOjvPP2kH5B2hgOJDsOVZDotDuarpjPIxniFeucGddKCJk2IoNaAk2/WUQEkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by VE1P189MB0893.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:16a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 13:24:23 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 13:24:23 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libcheck: add ptest support
Date: Fri, 21 Nov 2025 14:24:17 +0100
Message-ID: <20251121132417.19975-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114014145.23826-1-pratik.farkase@est.tech>
References: <20251114014145.23826-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::14) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|VE1P189MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf212c4-7492-42da-46b3-08de2901492a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aOKcAsGRvgb6NYwb83LUtRJJZM6jDg6qnb2/R16s9xwA5gwgr/HRPmeHokP5?=
 =?us-ascii?Q?19QfDobRKgPkfFCIURGSMhkoVeiBZ57gBAjKxm6L9Jlm1xSUYzVQgUPRaKR4?=
 =?us-ascii?Q?gPAV3YM4+8au9lpZg4HzhsPUocAZaBgFIpQjvAUPbNO/N9t5vz3SFI3kdnp8?=
 =?us-ascii?Q?Ig+bkJfknF19SrOG3gFyyfs/XyoMOvJDF7dG/SfoTlyY5dIxGtVOf2uo4KD5?=
 =?us-ascii?Q?P+dmiQ3S54CpjHPD78hm8BJbwe5JckxFMbEfbcMFev07WNLyOSOAI/OJSoY2?=
 =?us-ascii?Q?aCeZ5u5aeKtpBjm7a3xiUbUFfSmnqopAE4Ib+EZr8rWQBaRVYk0rWlS7A656?=
 =?us-ascii?Q?/n2HEpANUYXnMm4XP8AEt5OMXfopcmqS0B+hlz/Pc+CUuhV0oNrU3fNbIcBg?=
 =?us-ascii?Q?PA2trXqQ/lXS80dvWhx9xG4roRTnfS/a1NoUjHfxq2skuqG2XV91HjAuv7qP?=
 =?us-ascii?Q?UqZhM3rnvNM6IdKA0I2MAbFdWJ4mQ0TKuRnyT1bCt1KYn5v0KYTYnCXdH+hJ?=
 =?us-ascii?Q?gj9yrh8AWLy3+haLjLHSYSNfB4ANMbcYkI7WQAHI4UYyiaEq0lrWMbSCRoaK?=
 =?us-ascii?Q?0qM9AiBXGQ4b95p3ypDgD9ljFjbU1Y30GndlvA/uiz2efYw+wThvgHW4/M+n?=
 =?us-ascii?Q?nRvcaBFV/L1fq+QIqTZCKx68Oq0LvlWVoxAnZpkxCRx92q0fiVQQTjKrmsmt?=
 =?us-ascii?Q?zAuH37Wj4x1hbMNPq8aZtAdgY1C0rAYaYhNTl+1IrF4AqnY/gJZEnbMQFdw4?=
 =?us-ascii?Q?C55Gome+h7tuBhGTeHfBlU5VyvpoMuoC0DG/T0LGy/viZH7VEaZCCVlMWCvA?=
 =?us-ascii?Q?ioh7Q2Wp3M21ObqpUQpQj3uP0XzxaO0JalDd7GXL/SGoJ0D5lOsETljCxMbD?=
 =?us-ascii?Q?BResTstsX4P5eNQVzvKX94nOnpoJ/zCXIkKApepzyXnYsqdZBGWoeM0Paqer?=
 =?us-ascii?Q?UYAKvPKK0WIjXYplPCJ+EY0a7OrW04Fvf1sMRjX3fKJbcC81nLlvBpiwoNsg?=
 =?us-ascii?Q?4SUGb+Zc5czdZIDpxnhmwPcm6NLzWR9W3rGfBzZ63T1XHaszQScn0UPNuJsV?=
 =?us-ascii?Q?+eD09ggbI0L+zuU3XdoWtEDLoFPK7QCgXTQQ6BWeCm0Uu65ZZx89OWBpm0O+?=
 =?us-ascii?Q?K2nSmc76Hmnr1OFHd+mrGktr2T4hjPKqeTyJAOxAg1wskB1LX+JDmsU0RJJQ?=
 =?us-ascii?Q?hQeX5wJXsTzSrYJzKZylWFovYKVctCUUIrZerL3OcbcyEBOjIVZ71q8mnPrb?=
 =?us-ascii?Q?dRyIQGwQ0H0UPstj9cjy93uSBpPPtVkFOG6onneHadecW6eKYKmuNkUT9Sd6?=
 =?us-ascii?Q?mttvtb2PFImIQ+3r52w7jGMKSRBhyDQQ7I5CP8fy5anWX3wT1ydle9CT/TES?=
 =?us-ascii?Q?opVZLpnM7D3F0WnE5bbTziejQlYp8JSA1lmGpHA+etgSJbnnsQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jsVZFNi6bG4JFjkaT/7UzdTeoslKqRDV65eH9gRYAk6mY0VnD2wnzVwx7PDd?=
 =?us-ascii?Q?dw4j/XT6BPDGuoS8EEKX1QO8ZTqMhyxZJkFi0Glu3Srphzg2i9qcrvN15uzw?=
 =?us-ascii?Q?AmygWjRYs3w661wFQQoeiDqP6HxKdEBLFdk/FVCnsAFeaTCVCCJaOejgNsiD?=
 =?us-ascii?Q?Yb4uykOjs7EYVg2jlIA4CIudFcREIO4E7weXeYbiH5PhnJuMvYmUA1YsoGxh?=
 =?us-ascii?Q?sT5j6+3ceaCSp/7DioSpt55jvnVPEpAhZghF4BWv3qjtbKyLaqTCIkFQ9xo5?=
 =?us-ascii?Q?/iY1HMcHYjix0moUQ3Hj23DBQpyOaqICLQ3XQHyGvRzs2yEmqTrubIwOvS+X?=
 =?us-ascii?Q?iuEm5F8I671kKH7IllCPQ8V1nCFwUH459Q3vOzOIWCGgcu4QJji6Nu8utKTz?=
 =?us-ascii?Q?nfMqqvrxZprMomBn66BUdWOvJB3ftZKxzjSCOh1FHV+q7HRb4d1q0nlWLaJy?=
 =?us-ascii?Q?zWjkswWzh8KsTquJRIiYWOlRMZ+f3pUOrF+H3KEQvVBq0t3emhW2JCDLBQ7w?=
 =?us-ascii?Q?7IN3zKJ6OZHmLQr6Wx77Gsp3YSlw9ZBWSpXzDUmtbd9+AVOQAVVKh/9307DB?=
 =?us-ascii?Q?haZ8FbQQYhP5NrPmdwYd33w5Gl1hql3zG7mjFNioBD6A5odni13d3B47LbM+?=
 =?us-ascii?Q?1sWOwDwJi9ZB6X7UCEWr9XxfEBdnnTgGWv4n6Vk6S3s3qOAdp0sMMLLi0EnP?=
 =?us-ascii?Q?34jw+cunDUIi9MmsmFVFEpYU8VePByT43nJy58f0P3Pr2YPPXyakRjT1ULC3?=
 =?us-ascii?Q?6YCUzlAdEZEQ5u+bK8NF+/V+aAPALoerBzsGlHmTjgEFWfnz0235nEVLld0L?=
 =?us-ascii?Q?JrQesVqQ4IlNk7zOzXxZPH3mg2rOBmEEn2F5hm/lW433FogXWyHD9WOYhHed?=
 =?us-ascii?Q?qFIKo7pDPJvuaPkoZukJXo50Akdrf14IhLVQxgVICJ1JBtlswrrbVk76Hi/Y?=
 =?us-ascii?Q?h24tZvHInHbdaShX4GCpApWcDM8k3HQ+4YlGePsbUWW38c9I2uDON900EIPA?=
 =?us-ascii?Q?p718PO09wtRfKMGCY8RkL5Cz+7D+/iDDnyzE0Ri/6CnRPQ7ucD/xbzP6jUdC?=
 =?us-ascii?Q?aDgt5ldFFgmjcqPC7Ba8V7e736JsXCL0YPZpGK/L9gbZtO9nVVPv40tMoR1p?=
 =?us-ascii?Q?koTrnsj1CdbPGCF8gNbELQIH/DiRK0N66VGBzkOoth6IsJV1WuaPLAv1XaKs?=
 =?us-ascii?Q?r6J5QoyEtmSDMk6XrrWf7+7htYGNz5u1NXu7i9IohDd99cE61FNoU6z8yitH?=
 =?us-ascii?Q?lpAlfks1HJnB4Jy6/eba/RvHJQdsiO3psjAZmwTbRAxc4dPp5oIDa4uf50Sj?=
 =?us-ascii?Q?V5BMjsVcsmifEUaa8LokbWahZr/xJi8dBt5WDHZu7LeAHiFlvn3KY9HM/e/i?=
 =?us-ascii?Q?HuJmDcyrauuqHe+DSWUoGsSjkElItj4yawWGSYIxcmfe7AuXsTFA7k5BOxJj?=
 =?us-ascii?Q?BoJutGRq3iQAtxLzBIVPywpx6qG3gh1Knpmb9wtDgSzgmHZl5x4WwbJF/Q5u?=
 =?us-ascii?Q?JtvFeHMZFCQ0py4gpCBDa8xVLuDulMZjnhuQBsLKSDencb4fft/6fgJdQC4e?=
 =?us-ascii?Q?2KFIuIYm+Vl+GXuT8OfPsHlZy/Tw6otx3DqtwnPpK1khYyu96Hoa7zYdcFj3?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf212c4-7492-42da-46b3-08de2901492a
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:24:23.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sblSzrR0zA03cAZoCN0UTbXdPV+Gg6wS3/pvs4LIhu8K0tazSVyPUXKi+eRqNFnT7EH34QjnitKC7BYg82QL3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0893
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226679

Add package test (ptest) support to libcheck recipe to enable
running the test suite on target devices.

The implementation installs:
- Test binaries (check_check, check_check_export)
- Test helper binaries and scripts
- Shell script tests that validate various output formats
- Test configuration files

All 9 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libcheck/ptest
PASS: check_check_export
PASS: check_check
PASS: test_output.sh
PASS: test_check_nofork.sh
PASS: test_check_nofork_teardown.sh
PASS: test_xml_output.sh
PASS: test_log_output.sh
PASS: test_set_max_msg_size.sh
PASS: test_tap_output.sh
END: /usr/lib/libcheck/ptest
STOP: ptest-runner

Note: The test_vars SRCDIR path is set to /usr/src/debug/libcheck/0.15.2/te=
sts
to match the debug source paths embedded in compiled binaries.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v2:
- Merged duplicate test loops in run-ptest
- Hardcoded binary list instead of dynamic detection
- Use *.sh glob for installing test scripts
- Use ${TARGET_DBGSRC_DIR} instead of hardcoded path
- Removed redundant RDEPENDS
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libcheck/libcheck/run-ptest               | 24 ++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               | 28 +++++++++++++++++--
 3 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 06d113e264..3cd5f244be 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST =3D "\
     icu \
     json-c \
     json-glib \
+    libcheck \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-support/libcheck/libcheck/run-ptest b/meta/recipe=
s-support/libcheck/libcheck/run-ptest
new file mode 100644
index 0000000000..6523b1d146
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+# run-ptest script for libcheck
+# Runs the libcheck test suite and outputs results in ptest format
+
+cd tests || exit 1
+
+for test in check_check_export check_check \
+            test_output.sh test_check_nofork.sh test_check_nofork_teardown=
.sh \
+            test_xml_output.sh test_log_output.sh test_set_max_msg_size.sh=
 \
+            test_tap_output.sh; do
+    if [ -x ./$test ]; then
+        ./$test > /dev/null 2>&1
+        if [ $? -eq 0 ]; then
+            echo "PASS: $test"
+        else
+            echo "FAIL: $test"
+        fi
+    else
+        echo "SKIP: $test"
+    fi
+done
+
+exit 0
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipe=
s-support/libcheck/libcheck_0.15.2.bb
index adf95f5040..e45c1d0264 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -6,7 +6,6 @@ segmentation faults or other signals can be caught. Test re=
sults are \
 reportable in the following: Subunit, TAP, XML, and a generic logging form=
at."
 HOMEPAGE =3D "https://libcheck.github.io/check/"
 SECTION =3D "devel"
-
 LICENSE  =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D2d5025d4aa3495befef8f172=
06a5b0a1"
=20
@@ -14,20 +13,45 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/check-${=
PV}.tar.gz \
            file://automake-output.patch \
            file://subunit.patch \
            file://0001-Fix-texinfo-errors-and-warnings.patch \
+           file://run-ptest \
 "
=20
 SRC_URI[sha256sum] =3D "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835=
eb1a52932fa20a"
+
 GITHUB_BASE_URI =3D "https://github.com/libcheck/check/releases/"
=20
 S =3D "${UNPACKDIR}/check-${PV}"
=20
-inherit cmake pkgconfig texinfo github-releases
+inherit cmake pkgconfig texinfo github-releases ptest
=20
 RREPLACES:${PN} =3D "check (<=3D 0.9.5)"
=20
 EXTRA_OECMAKE:append:class-target =3D " -DAWK_PATH=3D${bindir}/awk"
 EXTRA_OECMAKE =3D "-DENABLE_SUBUNIT_EXT=3DOFF"
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    install -m 0755 ${B}/tests/check_check ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_check_export ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/ex_output ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_nofork ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_nofork_teardown ${D}${PTEST_PATH}/tes=
ts/
+    install -m 0755 ${B}/tests/check_set_max_msg_size ${D}${PTEST_PATH}/te=
sts/
+
+    install -m 0755 ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
+
+    install -m 0755 ${S}/tests/test_output_strings ${D}${PTEST_PATH}/tests=
/
+
+    if [ -f ${B}/tests/test_vars ]; then
+        install -m 0644 ${B}/tests/test_vars ${D}${PTEST_PATH}/tests/
+        sed -i \
+            -e 's|if \[ x"[^"]*" !=3D x"\." \];|if \[ x"${TARGET_DBGSRC_DI=
R}/tests" !=3D x"." \];|g' \
+            -e 's|SRCDIR=3D"[^"]*"|SRCDIR=3D"${TARGET_DBGSRC_DIR}/tests/"|=
g' \
+            ${D}${PTEST_PATH}/tests/test_vars
+    fi
+}
+
 do_install:append:class-native() {
     create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
 }
--=20
2.43.0


