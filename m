Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558A8C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:31:09 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12588.1788355867434909841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YzUwWCGW;
 spf=pass (domain: est.tech, ip: 40.107.130.3, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=du8WISe5pxDCa92tb2AXLOCK+CqP/boxR1NWHMunRU77qm26iq6whfd5gKZ2u4MwHW5FTizbj2HLTay5BXiKhqvGvCsevTBqk/UtbtBF8MQ26i7MJxRUzU7mAq77pnBvfS1giWQoZSi0OaJ6zMy3W1bdmnXweTBHg7xvcUwbCMuNlc0c+rRXOuQ03F1U4joX3dCztScjoo/59ncdil75nJSWYHfe+wIhCCf+APXwrjQ6PxP+0mTs0u3GPg9AEK5SXCPka4w9MOQ3QhayH9HWbiuMwMgsJRDiMnk0Jw/XqMbk5X78PUHvwlbIEyn9PrFBwY5DMsmxVe1AQ0fqKFQdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvT73FvS/bKwEaJaTRdC357eb8REwcEg7tsOqGIVpM0=;
 b=yYqBNJnieC7PtSrUtzAjR235xNitNlpEBjTL6Yq3HkL7bpYfPLRS7XL7UtB5G8xhSWjx96a5gNhRIpgYMIy9TyOLpbubtvmBZvX2CWww/BW4JoFOFEuEVJ89M7tA3warYTQM94ZTErW2k9TTcTT3ZDDAFn1xFecg7SUHWixrQjoWSV2BDu2U/9f/m4hpb98VOz3ROrmx9X9GKTn36qsFXhrgSIrarE6U2U91fNmbsq2KNZVRLTJVCp29IbK5fX7pUnd26YoxTgS38lRBNoVP50+zmYqYFJXWt6MgYRvg50r2FojQob/ojMOxuVLkwWoSjWWCqO2/L9RJg4dDw2t3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvT73FvS/bKwEaJaTRdC357eb8REwcEg7tsOqGIVpM0=;
 b=YzUwWCGWar/s/HHBazDmHDKsKMzz752HnnI24IFufPvfDZhgKv5co3NtScroVxFh4tG/W+7qUvt8pYnA2SYhOkvapgy5ualcwlEL9B6m6Q1zC9p0JHNvWzEnLfmQ7pL1TivPQPJ01C7BFBipwNj0O7KCbUtUaHx8tR5AtbLhFWe/o3CW9Iuy61501ATP6hVACq2klZ7CDpuRsg3UMLizxQ+ZZyFG5yq2nOFjfET++6SR+LYOCtd+TVDJxDKSEdB+49m9GLnG3O9Y+MkW2wdE6cyWmT/kmZCkF+ieiRUfSdJ15nHvufgwc6EUPbKZp84LOE08FF7r/61//+YFoL57MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM7P189MB0977.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:14d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:31:03 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 13:31:02 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] wget: add ptest support
Date: Wed,  2 Sep 2026 15:30:51 +0200
Message-ID: <20260902133051.36969-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0423.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::13) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM7P189MB0977:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7f34b9-eda3-43d8-4cbd-08df08f66f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oWoeclpXVUx8WE1sRSOpDFwx7Ji2i1dOVONMykZw5XoPLdhsMR3gaqc5AfF0jAT/hTq81t/2C4HZqkwqc9+por4kuLN6xS2yRFYm1/PLCYfDhfzxtffke2SPeRDGcYUdszKWfdoRkCmzeIWNQFER0MtP33iojRDOMRNbScYVJSo2dfyEbpvBH7fwFB6FhEK+F3FokXNum5D8yAlxM6DPk/LN2COHMuPwXJ5RT4Bj0/lhn4mezQPhOER8QrubdcvSBDX+F6Weal6Ec44HcnkCTlDp/FMgS8R1ObpyZ/jxB2I1rrPFcR8J+0MLELctek1Ah1vj13793ZF7uWmHhyAny0T/ZgTmz5/SQH4Ntcc/n5oPA/8ycIOjGmNX52nxwhbnycGQUEXOfrLxtdLPsj+eCkR7A6dyCS9tTwbBrR80GY/l9480HPLXqbw1W0SYrPf/uEyOmxHqbtWF/Y0Ax45qobalI3LhJtIVpIrY8nfUCQU2tyC9MYYHU/fYICKp9wnImECwPqXQbJ4vIDi2e8mv1Rr7CIGNJNH/yEAKpaOLFffn9kTkp+Dn4XTR4r8MOqfpF5DFhYdzQ3fHb1LKPU9VjKecknMgWLFr9md1Du0mtugGCk7ptX4wEgMrMcfDr0l+786YcLK7180wmsAuphlDFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?62DyvntVsjO2UHHuktzAMbA0Zy7ymtN9mYOBp9Kd+ZxMRX4egVxS8lFqOJvk?=
 =?us-ascii?Q?WVgX1UPM/9XWKbgJDHpS4ia2RJAXWUFwXn567KwjkdiePcRDWY2GZSA4n2TZ?=
 =?us-ascii?Q?1ou2KQKqToZUOeA0CJP5yYry8adergXF0eR8cQUKg/Z9A3Wp/0KnAs5IOEv3?=
 =?us-ascii?Q?7soOQppSGen5jyszFmB+rJmHwsQ9NaFcv4pyV8lPklAK9JutICAQzh3kGEJg?=
 =?us-ascii?Q?QjqoBQMwb428g8GVnhC0WW9uqzsLrrv3cchNY6FjsaBJ2i5eX//FT57DkxoB?=
 =?us-ascii?Q?1jK2vZDneGd4l0N5Hiu3JrfuuoKJavGYLy/t4e0yfYsIloQaumiqU6j9B0iQ?=
 =?us-ascii?Q?rXnsaUGF3wRsX17vz1zWhGI+ZgTuYsDHgZu24A73tqlYEK4E9ca9PPs753eC?=
 =?us-ascii?Q?01Osf3Tpd48GY1Cohg21kMx3oEoYvCjWjpOU9JHVH7X6GWT1SlsKBg8/5ydD?=
 =?us-ascii?Q?r+Q8TSaSiy+4rVbk+2BGlndTXA0z2bOKPZIX4hl0MJ2GvIrA+2+/7+2VrcUI?=
 =?us-ascii?Q?+W3VKenXQqGD8U2JVFYUPaKrcWsE44dL7ywSECfjWmyktuv7Pz0Yd1PN2Kqu?=
 =?us-ascii?Q?b29gpLDGRnz0dLpkJVhCK7r4l1d3/irJmp8LI6hY9sjSWwHe8JU4a7xWO6AL?=
 =?us-ascii?Q?LVRYUXS2x++9SP/bifvpcTjEz5Sv4wEc2yZG5kqKPuIgbgdfePpv4+oZ3JPD?=
 =?us-ascii?Q?ozvsoLb3Uz/PJYStVwz/8oC1CYnw60FOA3KZlNvISW4sJ1Cbswzpkvkdryru?=
 =?us-ascii?Q?tQUW9C+O3q6R+IRxcGbkCULcJEKvCfkG/W8NjCG5FbOM+oBxdSlAnNxHjIb/?=
 =?us-ascii?Q?9RwmxaUHqVmI6+IggJm8KiDla5xVPEfnrN0cy2XnRdAGA4BRW+nHL0nKgUM8?=
 =?us-ascii?Q?eSiuGc9N0xkGmZzcDMb/sZw5Is8MsOiGStKvLv3mbInBvDTIQ/iCOSILjmnG?=
 =?us-ascii?Q?wea16eWr5SUJJWLC0NpOSyU/hnAwcNDQm38wiqN/KCAtSbzrH1UuQZntb0of?=
 =?us-ascii?Q?zN7HSqG0E7GZ4RNeYuRDEtvmTYIsLZUKQY26orrIyP7PeRkfvQ31o03SFtkz?=
 =?us-ascii?Q?D1vApc+emajKKXP5DNhV/duggYFoGarESikQxRwpJCk3owv9UySkpmVMNrJg?=
 =?us-ascii?Q?lY2OSll4Bu0caATR8G8+V15ycSVSho0aH1qNp/cD2h/Y5P7PFb6XIbRYrPiV?=
 =?us-ascii?Q?DNFUnoLl6/2OqQI/gHcfq2vHvI+rwSxKL5swYMf7NG/5VmOKEIV++BmV7tRQ?=
 =?us-ascii?Q?QmTmjewH+aTqzi6utYW/QeCROhoTyusOQWzeog2+7VU7rd6eU6Qn2a1jJVg1?=
 =?us-ascii?Q?LiHRB4SbH5Z7RY1xJcBfjkHnrVmoVhoWCbT4465/QtBjmcH4PZXL/Pqfg+VL?=
 =?us-ascii?Q?w/q9CEk3ekAxV9PixgeYrvgyDo0KGifAscDM+pogy1DFd3j6KXe9XpUi0bLP?=
 =?us-ascii?Q?r2KGIqJmneP8V6sZW3flccZkuhRKE8PaJgkjIj5QreRXCON4umaTVNUGOsQY?=
 =?us-ascii?Q?4U3N6CfBbfAFn+GBzrPvMkqCfzwRuYadm0yLTHHf6iqdYBselvGpOMyCqa0r?=
 =?us-ascii?Q?ftzFVTqAdKko+OT35a1wlcaqmF6+EiXa4TfiPtJlgPgmp2tkq3T577esA3/c?=
 =?us-ascii?Q?5eEPPzlA9McnWjCbdfuB6NLWd/e9QxNI+tGiNnI5+mrvIn8lMeg3d/ehmJNq?=
 =?us-ascii?Q?YNyNQnanXeagvPywH3//IV55ng2O5oame2KkV63mq+LUjgjTY3T8H2ejZFbU?=
 =?us-ascii?Q?JtOTwh/Wdg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7f34b9-eda3-43d8-4cbd-08df08f66f0e
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:31:02.9282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6n+Bnxg6dstUJUNehQEy5IrS3sDMeJWTgCcKGAKugJTRMIAqv9+I2OuWn8Otylew6xT4lMNd5sqHW+a8zGK6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0977
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244960

Add ptest support using wget's upstream testenv Python test suite, which
spins up local HTTP servers and runs the installed wget against them,
covering downloads, authentication, cookies, redirects, recursive
fetching, content-disposition and HTTPS/TLS behaviour.

SSL_TESTS is set in run-ptest so the HTTPS tests run against the bundled
non-expiring test certificates.

AI-Generated: Assisted by Claude Sonnet 4
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-extended/wget/wget/run-ptest     | 21 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     | 21 ++++++++++++++++++-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/wget/wget/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index d8eba9dafa..4012be5f49 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -103,6 +103,7 @@ PTESTS_FAST =3D "\
     slang \
     utfcpp \
     wayland \
+    wget \
     xz \
     zlib \
 "
diff --git a/meta/recipes-extended/wget/wget/run-ptest b/meta/recipes-exten=
ded/wget/wget/run-ptest
new file mode 100644
index 0000000000..4677e300dc
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-3.0-only
+
+cd "$(dirname "$0")/testenv" || exit 1
+
+WGET_PATH=3D"$(command -v wget)"
+export WGET_PATH
+
+export SSL_TESTS=3D1
+
+for t in Test-*.py test_*.py; do
+    [ -f "$t" ] || continue
+    python3 -O "$t" > "$t.log" 2>&1
+    ret=3D$?
+    case $ret in
+        0)  echo "PASS: $t" ;;
+        77) echo "SKIP: $t" ;;
+        *)  echo "FAIL: $t" ;;
+    esac
+    rm -f "$t.log"
+done
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index 00667a1e24..d34696e5b6 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -9,7 +9,7 @@ SECTION =3D "console/network"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6f65012d1daf98cb09b386cfb68df26=
b"
=20
-inherit autotools gettext texinfo update-alternatives pkgconfig
+inherit autotools gettext texinfo update-alternatives pkgconfig ptest
=20
 DEPENDS +=3D "autoconf-archive-native pod2man-native"
=20
@@ -21,6 +21,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
            file://CVE-2026-58471.patch \
+           file://run-ptest \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
@@ -49,4 +50,22 @@ ALTERNATIVE_PRIORITY =3D "100"
=20
 RRECOMMENDS:${PN} +=3D "ca-certificates"
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/testenv
+    cp -r ${S}/testenv/certs ${D}${PTEST_PATH}/testenv/
+    cp -r ${S}/testenv/conf ${D}${PTEST_PATH}/testenv/
+    cp -r ${S}/testenv/exc ${D}${PTEST_PATH}/testenv/
+    cp -r ${S}/testenv/misc ${D}${PTEST_PATH}/testenv/
+    cp -r ${S}/testenv/server ${D}${PTEST_PATH}/testenv/
+    cp -r ${S}/testenv/test ${D}${PTEST_PATH}/testenv/
+    for t in ${S}/testenv/Test-*.py ${S}/testenv/test_*.py; do
+        case $t in
+            */Test-metalink-*) continue ;;
+        esac
+        install -m 0755 $t ${D}${PTEST_PATH}/testenv/
+    done
+}
+
+RDEPENDS:${PN}-ptest +=3D "python3-core python3-modules"
+
 BBCLASSEXTEND =3D "nativesdk"
--=20
2.43.0


