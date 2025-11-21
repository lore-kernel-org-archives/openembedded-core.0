Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D138CFC272
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:13:26 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11066.1763730796443556808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rXwx9vm9;
 spf=pass (domain: est.tech, ip: 40.107.162.10, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9+idpm5myA7FuaIDe/XxH/JWlssdMHK03ULKpu5DgJ5mxWWS4qDIrYf+LWRa62qPQPI4+sReNsIWfb61mYQSLMV0FqjG3THR2E3dbqL6gbIuDm1rEmZlkhD3Qehbyz8C7m6MnFAw8s4dLRWU/QJKAAeenAy77uRZ2ewwVOYCTkVbRPiNwxbe7FYqDKR2eNpPsle0r0kgqWBHrDbHkwjf/vdLI3bMi2Z6eI09Owz+wifbvqKe3gHfOskHEZOs6HVIVhyAUKBfK+I06Xs39MH9qE6ZUbU5tPbFhRwY5QRDDVQuNT8gySnGOBM2fe7+M9m6oiIeZ1Qv6mxicZBe3LaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqIihobfMnZ4r6rcqpz1M6vwA4MMMZgpM7mSDPcK/R4=;
 b=PyuXz0GW4WAglbmYKkx+jag/olc9wL70edeKYHcDi5ddLqKN1dkMCZ2v6dEUAZZ71ms08KgmkpS5Pw2+LMmHdnkFwf+OVRbtVAfXznqimJQhm34HNFl7M3zzzyShZfqDukKJIeM+Qp/CJMMRvACTCCuhux1gmHEFXeNRGLs2DVdwCRWpEz9/q+ufZ/gucXcBh+Afp0JQ80LLS9cv7n2TuCNsOMe30V8ZUlEXmyVC33ITCmW5v3GpBxd67Bp3E6Zob+NEdY5Fu0x8xNwBR1Xr8F+E2ha3HrHTXPXRRkGKWzMSHxvrLJqfwGlTMo8hVtZXdQht999kQnOpYmXobFEu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqIihobfMnZ4r6rcqpz1M6vwA4MMMZgpM7mSDPcK/R4=;
 b=rXwx9vm98R7VX6BrdbficDTRN6dPXzGVFNrI7vAaP9NwZBOFBsEjSBO2TYz2SBrb4+hatyhso+LcD6ymstgy9G7r/JCv2DnSmc52rg/gnKCqNwzFf93+uwU2T7fUlzOUAn/Uuvrd6d6k4qR9AY/duelRsELTw/yVLPhe+USiNDONmUFI9/kh2t3oGUb4a9MgNAVpRUf7GzPh2CLCWoXXiTxb5GYGOB5Z/ogn3+XOIRzB+W8C7boTaQZDR/lRUnjB3CP5BC63ySFqtZ3jFDQyEe3O3Ls1DJgUt5hM3ckCajJ341JGCOqR9OiRQ8RVVTOA2obG4RPa7uBlvFSu/pNaIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by FRWP189MB3256.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 13:13:12 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 13:13:12 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] libyaml: add ptest support
Date: Fri, 21 Nov 2025 14:13:06 +0100
Message-ID: <20251121131306.19079-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121115420.15308-1-pratik.farkase@est.tech>
References: <20251121115420.15308-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::14) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|FRWP189MB3256:EE_
X-MS-Office365-Filtering-Correlation-Id: 1deed922-91a8-4110-0850-08de28ffb949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/blV4565ofVSG2X2YMJCOMKEIjVIKSAuuhjkUTkNp5S41iJLjS/uZsa33MFY?=
 =?us-ascii?Q?SSF7puMIoBgsdj++gHcwot1YU1UL/+HSmSSgheDNjjxGqPFxFgg7k5gNffOU?=
 =?us-ascii?Q?qZftM7EqtzZMh88/VroX6RlplJAmS6fpKNuMfNAPc+0EVk8dxapCsTdeUXd9?=
 =?us-ascii?Q?KgzW5/sK2Y8iuf5M736VjAN7d+bVJ9ccT7Zw+qQcTX5xL+49g9CySLAG+hiI?=
 =?us-ascii?Q?7NrQ93idbMivuKKdR17948sEnM4GApRjlzeN7lXtsRFdhWWmd8VIy3b8xcP9?=
 =?us-ascii?Q?yT0G3aExUOJyFoysttAMTl40qxwB9FoM8ulawrkRYwlog5MtmEjD4P9rkzbd?=
 =?us-ascii?Q?/ibaKb614/ydAt2bWTbIqcOOxTxwyPtHTrzN93CHEfWx/NtHlU9lGhxnxDu5?=
 =?us-ascii?Q?YI9QHD2i5wh30KCpZpdzABRVPXxsEk62W3HlxaaZ2P4OjZ2rvjX945hpB3wu?=
 =?us-ascii?Q?dCKZHJjV2xaQtbjWH2UocpGU/Wvne+9c78c19SzGAoIsyolwRysZCqXYwJ8i?=
 =?us-ascii?Q?2t1VR4X1ki/bEUdeq4aD1C47j701Q9Hz08N/8QYq6vM5Ib/63NTjgddEsQnG?=
 =?us-ascii?Q?lvmKY1BkyosBv5Hzc6NMrggnfiYp6OZ72NHJOw4e6Khhd7JcRv0t6OdDoozt?=
 =?us-ascii?Q?HSNlFB9itRBAd4C6vqaA7V7DXl78MBlJAZd88zfYV0rAEKuopSrh8Xxxa67c?=
 =?us-ascii?Q?5xN+CxA5xrsqI3D1bHATqtfVkSoA81v+grJ7Ng3SOjC3qwMT9iaOZu2qnSLm?=
 =?us-ascii?Q?bGsC9KYkIUWsp1Y7C+xfwsb2Tp39HacS3OsXwX47cDftJWSWAlJECN5vrG/7?=
 =?us-ascii?Q?PglHCjPdm2t4tpXfoArXf9MtMboQXi1wEzJw2YTar49+Tet3JEphqc9lm+OU?=
 =?us-ascii?Q?xnJF/RiA6EFwZ0QbHXzRIyvIjz/OZzHh58Yj+4hiK47U3H3Nxc22c7mfeDAy?=
 =?us-ascii?Q?MrOEv6f+Es4rdgYrj3x1ULJQNjTZ4BjtarE0G1fNDB1cAJo+eAqBw66/2CWw?=
 =?us-ascii?Q?nByGySRC90C9+7H6adoaTXage7D9z3kIMPu6ZI2QGPsFfkT/mXYE8WKpHAWS?=
 =?us-ascii?Q?kO16l94q0H/p6sm/x87Y7zbl3dl7YEgtFDmC+PeV7MwaXWUKL5g5PmYb2SBi?=
 =?us-ascii?Q?LbcghiZrrhefvzEwQ3BD+iWN7603Ibm0CLqkBC0vFdmUfRgXdX8jfWs7a97s?=
 =?us-ascii?Q?v8xYnxqhfdY8OvecLK5PlaTiZqG/TPSEEWppyWFdptwVMGHWPToQ9mth75U6?=
 =?us-ascii?Q?TCcBGDbMZCgvrDT1H5Iuwjicprqu/YX0nQP9jz46jfuvOOUJeIUBeyfCl7XC?=
 =?us-ascii?Q?fueZajojsgvVGiodvXqSwqQtV1+lRehryT0hIvV676/UADhgDWF7cJ9m9bC3?=
 =?us-ascii?Q?28y9hgu/bn/FUyrWwuoscHkH2l5rwK5b5zejnN/epuJwuixGbRfsp2DRNw6X?=
 =?us-ascii?Q?Yt6tStpocoGwCmwdJYpSbcr8igC8/sfF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u4cZXc290i+/pxE1S1NPsyLXZ98a5+tWyCSEFGik79THMAztc8auFd1bw/UY?=
 =?us-ascii?Q?m9+mZAD++Y1IkHFOels39DbOYfXuJKTy9sK4CivJrpP4kzj9fRV68eb/yWrg?=
 =?us-ascii?Q?eYpqSOX/3MsYDNdMHwty65FE74uD3BVUSWSPMsrdUjVMBZe1VBbFk/5bNCbm?=
 =?us-ascii?Q?COHo6M0LeVqx9C880Z2F15/qCKistS0lFu7isx0WGsOVuXzCZWUuyqUBlpDp?=
 =?us-ascii?Q?WOvRCtx08QZnRzJskUg+TUc7vuq8VTR/Qdb/5hFoF7N8kyWSIWiv+HUBq+Pr?=
 =?us-ascii?Q?v8+CuXKvg/ktBT+4uldSXucOF1ed5E+0iwG8u+AKFrsr1WcjBkDW2ABBGavN?=
 =?us-ascii?Q?/0Pb5Z2DCD1dlze8Qrv1zD+hc3awHnjkj2FAmcbl87mIjk4hJQ++33Bvv/Oo?=
 =?us-ascii?Q?p3vapVIausLBd5DW51qwqr7YiwqvdTAbTAXzTUR6NWRRVpO7nF58uYimOuoO?=
 =?us-ascii?Q?uo9wJEuT4L9xMq3AENjihDAzDWQbLFg/4KtPmi7vkwwEDlBs6pQy9ThqiHkc?=
 =?us-ascii?Q?KiNYwxAvjYJ5Jb/DBiz2ZuAyOK2vRD8W0T/zt7ag9ZPQbH9J/KC9ff/F4o7N?=
 =?us-ascii?Q?s3PeqRaILPDdhUFDKnP7Chho86Z5a4nf1FTYjbvMjcAJXJ/Fv+WIw3/dsU6R?=
 =?us-ascii?Q?2BR6qLKAtACjR7C+wJcxMo3dvt/CAPGpWM3ZLmPzkYhnuj8lEZDcfg8ANO8q?=
 =?us-ascii?Q?ZEC+HTB9NuHlq/EQ8jNKXNv5OtKarnFQXn1Z3bLJvSFI9yj9JWRMIpnUC+YV?=
 =?us-ascii?Q?SjsQBlFBajdZRvfmGKh0kzaEQtjLYd7oFXtHf1XEzDicKvCL8BAdsG4w5wqk?=
 =?us-ascii?Q?lAKWhbJ+CJwUui+3i1upyaQ4atFczWlRfJg3YdklKBQQAqUuGxAy7aKQIbkb?=
 =?us-ascii?Q?Bl0pKI4hVmoyl6sf8bCo1hYcBvYLmbNUFoNW8yPb2oND/VkESMpcRbr0hJBo?=
 =?us-ascii?Q?KtcS7GTA5y6U2MJONa7RmRviugmLgqG8kLo9562sD+SAnTr3lvkdQMkFNJ7w?=
 =?us-ascii?Q?3BbTRSF7ArHFbRn4eBlyvXRxX9sQIYZ2jc+nJ5HWpMSqK0yE89tyS2LSj9py?=
 =?us-ascii?Q?f31EOdR7lGMLvMPr8ck9BHCtMk3gQoBKBxW8N1AnuzHPkgzC7iIyN2/bVQ4X?=
 =?us-ascii?Q?qVym/pBD/hsqrfp7PwalD2j82yJeBcv3rjnz+QhNm9SXTv4qx2aZUnS7NIzz?=
 =?us-ascii?Q?YOb4P4Mf2wQdXALUlT/c2xCZhxlTom9OWNs7ExfGLcLO6KbxkOm5m9mx5VPK?=
 =?us-ascii?Q?yeUNYdARv8rgI5eZgAG5B6ADHjuAQPmdKJP9dY13ZEv2hkCOh4waFr8+yniH?=
 =?us-ascii?Q?iqH5ooc2zsFtUD42arjfsI1c/YLmMb5go7ndsMNXmOI5d0khJj233FjLHWV9?=
 =?us-ascii?Q?0LN2DKJB3g9K/HFq7cDPiGDztOmZtyQ71ZKzTw+iL/HlepzYLPWg2kB8puVY?=
 =?us-ascii?Q?yKbB5oLlNwl3OFexA9FMzWAxU4aRBDSXvlfKrTujRYZ+PRx2Lf+26tH9HSLk?=
 =?us-ascii?Q?bgsjxHd3ybKxGiW46RhoBvkNPjZ+TLMCcaH1TOdezCi5TTo4bv00cr0bnDJA?=
 =?us-ascii?Q?QD19ApLEZV2yemIy+8Rt0t6qFrJspTGjMU2oHTVDMPktdetbyd3vWs+r5+Cs?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1deed922-91a8-4110-0850-08de28ffb949
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:13:12.5488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q58OxfUJJ8FYSrTG46k6Z1tt+a8KitEzlVZrN7jSgT8HdiwoZFbdg+VDNUUiJaQuZS5OSetNkFKyeFgHDraecA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3256
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226677

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

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v3:
- Remove redundant executable check in run_test function

Changes in v2:
- Remove hardcoded version from test summary
- Remove static XFAIL/XPASS/ERROR lines (always 0)
- Move PTEST_TESTS definition above functions for better readability
- Auto-discover test binaries in run-ptest
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libyaml/libyaml/run-ptest | 38 +++++++++++++++++++
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 21 +++++++++-
 3 files changed, 58 insertions(+), 2 deletions(-)
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
index 0000000000..a5f554a15b
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+# run-ptest - Execute libyaml test suite
+
+cd tests || exit 1
+
+TOTAL=3D0
+PASS=3D0
+FAIL=3D0
+
+run_test() {
+    test_name=3D"$1"
+    test_bin=3D"./${test_name}"
+
+    TOTAL=3D$((TOTAL + 1))
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


