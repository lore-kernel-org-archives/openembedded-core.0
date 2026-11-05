Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29798.1793866705562105863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pZ/unoh9;
 spf=pass (domain: est.tech, ip: 52.101.83.59, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQCTVCLCvXabszTRO3t1pUueEn0PGSOVGNcFwtbNqFU0TTAmzXiyJ49X61jA2v6iFuhD6dp8rF4Ph0Tv9sAdA1pucbYJdaPRXJnPvKsqCWSgbKk+SZ81+f2ouvGjxnDmuhGfQ8l+88OyIbsoZ3KkEQH5Gv5CohkJC4DXM5E72dQVfurc/hs/r4nk7Ukbne/2/w5658pJWG3ujnSeC6RdFzQ6xpfDP3G6kqoz4cqwTtnTdIo0N4WSz2cP1XWclBqkfN9mAvUwmKBKJ0V0oL6MusGk9jP17+sLg4QImUW+ZIr8+60uhMe0XFuDSBE9H4x36gC0sy57gKfFFGdIRrB8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5qrk0CAMeq35tAVzIQaPxtWmGYwwrv89LprnQYnOVM=;
 b=Smf+iB1Mrx3SWHnWzNHTeawLlWUpbgWr06oSv3B4L3hrh9qt34uXORGViyA1oP17QzA8fLpebMgjkmAv3Seve4SsjJORwvRRn3a0pzNtTMUmIdSU/0/IdRagxQC5tm1/mkwnJ8jiEMwqrGC0/StXRAacV0i6udD7DU6Yx4bq3o7VBX8DD6Kts0gaygVbgaI2uPwEZg3Mo5Nj7tDVNB0pq82lk9wjHyQ9gzmpClS+h3UXV/GGBisgaOoxaB0a5jixnhqI+Xt/yyPZo0Qn0GkzF7dRVCfgSMGjOSTN7/Mr9RWIlNT1QfGK8LvvvyBsjfOXzMmm3mESGHLjnCvTbgE4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5qrk0CAMeq35tAVzIQaPxtWmGYwwrv89LprnQYnOVM=;
 b=pZ/unoh9yRdgoaZlR/u5cp3f8A4+jqIEW+8cdO0sagQAhuNQB+QPosdVNCzYCkVqBHiTl3apweMZRfh8nSHQ9hse1vR9OmVhy+qULFRiUkbEfCIFDtoTHYSm83iKvpXjXdf/Lfy9NdZ/oPaEcRF2ci23vDzQgS4sTHfLQb1Xh7HnXf7oFnGjkoxLqthlP72zItP1yY1DUUkN96h272J2C0hD5XS2Nu0iAVmaeq5mGnZmf73IXF+Kp2W/2Hd39ZoYfYgCNu4IzJeKlrUJMkbXwBjQuXDNKsyRNIckapNpNpdoX9nvieQesVUETNjOhWOsL++ShPtfas9EggRDs7SRBQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by PRAP189MB1897.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:290::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 08:18:18 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 08:18:18 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] log4cplus: add ptest support
Date: Thu,  5 Nov 2026 09:18:14 +0100
Message-ID: <20261105081814.16384-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104083458.12316-1-pratik.farkase@est.tech>
References: <20261104083458.12316-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::8) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|PRAP189MB1897:EE_
X-MS-Office365-Filtering-Correlation-Id: e940dbbe-11f6-46e7-b678-08df3b15591d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|22082099003|260925021911599003|260925022911599003|260925021311599003|261102123227099003|56012099006|18002099003|261009223027099003|261021121427099003|261021123027099003|261022075727099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info: zX5XGsvqIlmUIwYNzhWcDz8+MzMpjRqUBZwPo3PpPHCMFFRJtsHdX5hdR9CXZ4PvAKpGYVTXUwDy31Y2d077/GwARU0cFlWOqtehtz+3an0kRj6YOWDcEZSFYz94kRLpb1ts3Zh3QHb9sJsq1D/Ii7oK02NyVN6qllZmOlY3DP8dxSke5neamky/txU2KO9LKGvftUtK9jo+WmW28aNXJbV5DbtDEDmBhBgLfnnQfLa/swuntW9cvYq/6VIKHN8Ls4GGQDS2bGo/ZHpgm6BwCdFqFifZXjIbyTFa1qbykm5lMhfOjYmSnx/cmHJExFGob5jRk0A79eTuOoaAwK9TVH+fQnr3y+Gta5lo7nPlHfF5OZ3+UcMRFzqxNfqmBrAxM5uzPJWVCoMFsw/fuz0DRJ+257e8xFl4eQKKKWN0ow5hweNWdmhsj5pkNLeXWRpAMfUCnBDND3u15nfTkFE3UEb82oeNmy04kQaAgrb7ZOi+2cLpFyp8bRyjIUU2zNJIDXQIfuIHO3DoCSP+a/5rKH08X7m0LipHaXBaBg4Vp8b3Yjy2GNjyRiWu/IayctxFXqCb1tj8vQVN+dwTEvftzIuH+we96aQzAq2Ml6MkD6SDUXrhF7/eb1oi/0WRHPG+UYexx4eIrYmtwYqb7dtyAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(22082099003)(260925021911599003)(260925022911599003)(260925021311599003)(261102123227099003)(56012099006)(18002099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZipQxCEqr+OkJQR0Jh3wf0wg/pkVV8PLHQAQJYKimJQui3/E/8g217JHWQqd?=
 =?us-ascii?Q?MD0d5dxYxVfmkl3wIW3yOmF4A+C4V9GDm/ln+A37RJMWGh5MmwueSHxOkIVc?=
 =?us-ascii?Q?VUncNNgCkHrnl1x1tl4im6IwLqmFWQbh11fa1s76bjIqg04Fr1Z34IBb0FFw?=
 =?us-ascii?Q?ihGuZEVpCmF//a0z5g2x51AwO8tpMspzCxR+XQ6c5+2KuXwpCl8jPFwy+SfG?=
 =?us-ascii?Q?gOXZQU4xSrs/EacSsOuNbJTMRAo6+0qI7RjY2e41r8GbWSXsGdVkrhnn7Hom?=
 =?us-ascii?Q?LpcWiF3Fvcik4x6lw7fRpVaDQy22AQz/7UpBaxkj2lTN2qEFObTqsZv3TUpm?=
 =?us-ascii?Q?zp7w+D2arPVdYFRWCdP4m0hf0c/UXvFvqeNVeb51jNTcXNbwhfYEilGiBRAO?=
 =?us-ascii?Q?m5WWjwNXycGVPX7aCmNKC8KbO7aRe3hgOVwxA4Pq7oPY0phSXUC9pkKbAp9w?=
 =?us-ascii?Q?H/LfsPF0F7Wih/1wYXx75HPO0bs7w72ISECwTLogK3n+qaCiiznpFlBzlR1d?=
 =?us-ascii?Q?hacksGbkv0L+j9x77Of/Hbu5GHECxQR55q1+YFsinKpRnvO37QfqxnPcgH4J?=
 =?us-ascii?Q?342VJRxOf6NNH/iLwDMOqEB6679TsGDZp0THyzT1FS8JKnVA0xXrcoAxZiwS?=
 =?us-ascii?Q?BRyyeiN6QY2H/FmZioChqJzs1hcqvIUGniamckUnm4dkTEYpYJpLPgmBCdm5?=
 =?us-ascii?Q?kJZW/6KDSoUGKfBTfZntsRS1K7jEfsX0wTs8OKAg4gs0/6xaSUpXi4/5uSaV?=
 =?us-ascii?Q?2W4keJ/3qMzhXlstMTpPxv5hTTSqjdf/PFEH+xr3weVIOz1Zvq3CH0gQQb/C?=
 =?us-ascii?Q?dVWgx06xTFgY9crE2deIw2MQjjJImhlAEhmtyEZR7j3rNU7je9UUABaax20p?=
 =?us-ascii?Q?lqZvRfsRUkmHf0u8VEULeN5dlPrP9FoFv4ef5CLhLsK4w/RMGQhoO0Wy10MQ?=
 =?us-ascii?Q?8XLX4SvU+RDLJ9aZbLkfdOt03gKjilGfz09BQk1ntYrdMNC3xDft63LqeXaP?=
 =?us-ascii?Q?td8RlbCif+qx0Sz/hsvSHew9k6ajjcfIpG8vUqiE+CjRsaHlsX0TIwadamFN?=
 =?us-ascii?Q?/99qU1UPlVhy6WLdYnB3Pz/FwQicl4uxZFwu+g/OgJU9Qc8PPfPo8dITJz1w?=
 =?us-ascii?Q?7MkQIhQYoY8rLClllzff0u986PXHLhX+J6sDbyBmM4xnhX6P0plbzHC024EE?=
 =?us-ascii?Q?qxAj3fKnSkjf5DKGLNMG4rkjoYhjiE1hhCy1k78HWUDZGTvZkIynC+SDadRf?=
 =?us-ascii?Q?HiVrBLQzCxhxFOaFIs+cwvTzlw6w0qtggy47i2/W1BuoI4FPVk8BQCZJFQqP?=
 =?us-ascii?Q?wtDtlHLlaYcxnlQeBltIYo8AYWXptamh1w7RX4p4QqtTWwOzthITI5MM9/6b?=
 =?us-ascii?Q?y22V1IZZR6A89SugZ+LNggx7TJ2GoPa/7A9wPkA7LpmQPIMiV/tc1mYkYuFY?=
 =?us-ascii?Q?lNOQAzceEWYWt/jf3cVn4icWgI+AdOwqP4DLuEA0v3sj9T1L7M2E7/ItfYK0?=
 =?us-ascii?Q?XxGEjN+gDu6I+AwRo96ZyO89aj8KYKiv3tBW0JVjZR6LnbWJdWo+GFvBQY57?=
 =?us-ascii?Q?QdQRVCqkE9HK36HcFsISH99TBQiotRWWWpNc35e1V/UfKlxvhMujfPsvlv3R?=
 =?us-ascii?Q?lNkycaYBQO2QMrIDN4QFPtXSjFyBeDKqXO7+++eF7yqBhwW7ystb7ClUC8cs?=
 =?us-ascii?Q?Npa4925KF0ffwJ14FKmQ9pJr8r2Cc7oCqFm84rNgKdmKp23G4xzlQcD8zfjr?=
 =?us-ascii?Q?hheB2rgTiQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e940dbbe-11f6-46e7-b678-08df3b15591d
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:18:18.6493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCM0qVDutHmeRSjoKvymbywseNmUHCVaYFuvMZrauPHAWg9oo7V2xoH7HIdlLGgHOaoEbgc7k5YCDqf27fnBvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1897
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249457
Content-Type: text/plain; charset="utf-8"

Build the GNU Autotest based test suite and run it under ptest, following
the tar ptest pattern: the generated testsuite is shipped together with
atconfig/atlocal, whose build-host paths and tool locations are rewritten
to the on-target ptest directory. The test programs use libtool -no-install=
,
so the real binaries are installed with libtool.

Tested on qemuriscv64 with ptest-runner.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    v2: Trim atlocal to the variables the on-target tests need; the dropped
        compiler/flags variables embedded build paths and broke ptest packa=
ge
        reproducibility.

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../log4cplus/log4cplus/run-ptest             |  5 ++
 .../log4cplus/log4cplus_2.2.0.1.bb            | 74 ++++++++++++++++++-
 3 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/log4cplus/log4cplus/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index d5357d8732..f8d2cb25b0 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -63,6 +63,7 @@ PTESTS_FAST =3D "\
     libxmlb \
     libxslt \
     libyaml \
+    log4cplus \
     logrotate \
     lttng-ust \
     lua \
diff --git a/meta/recipes-devtools/log4cplus/log4cplus/run-ptest b/meta/rec=
ipes-devtools/log4cplus/log4cplus/run-ptest
new file mode 100644
index 0000000000..1f346cc8b1
--- /dev/null
+++ b/meta/recipes-devtools/log4cplus/log4cplus/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+cd @PTEST_PATH@/tests/
+
+./testsuite --am-fmt -k '!headers-compilation'
diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb b/meta/re=
cipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
index a10dd175a2..91b7eddcb4 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
@@ -16,6 +16,78 @@ SRC_URI[sha256sum] =3D "374175c22fabe752eb1c20138e732b69=
ae191e641f92d32c9432985cd8
 UPSTREAM_CHECK_URI =3D "https://github.com/log4cplus/log4cplus/releases"
 UPSTREAM_CHECK_REGEX =3D "log4cplus-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
+
+SRC_URI +=3D "file://run-ptest"
+
+RDEPENDS:${PN}-ptest +=3D "bash diffutils gawk grep sed ${PN}"
+
+INSANE_SKIP:${PN}-ptest +=3D "buildpaths"
+
+LOG4CPLUS_PTEST_TESTS =3D " \
+    appender_test \
+    configandwatch_test \
+    customloglevel_test \
+    fileappender_test \
+    filter_test \
+    hierarchy_test \
+    loglog_test \
+    ndc_test \
+    ostream_test \
+    patternlayout_test \
+    performance_test \
+    priority_test \
+    propertyconfig_test \
+    thread_test \
+    timeformat_test \
+    unit_tests \
+"
+
+do_compile_ptest() {
+    rm -f ${S}/tests/testsuite
+    oe_runmake -C ${B} tests/testsuite
+    for t in ${LOG4CPLUS_PTEST_TESTS}; do
+        oe_runmake -C ${B} $t ${t}U
+    done
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    install -m 0755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+
+    install -m 0644 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "/^abs_/d" ${D}${PTEST_PATH}/tests/atconfig
+    cat >> ${D}${PTEST_PATH}/tests/atconfig <<EOF
+abs_builddir=3D'${PTEST_PATH}/tests'
+abs_srcdir=3D'${PTEST_PATH}/tests'
+abs_top_builddir=3D'${PTEST_PATH}'
+abs_top_srcdir=3D'${PTEST_PATH}'
+EOF
+
+    enable_threads=3D$(sed -n "s|^: \${ENABLE_THREADS=3D'\(.*\)'}|\1|p" ${=
B}/tests/atlocal)
+    wchar_support=3D$(sed -n "s|^: \${BUILD_WITH_WCHAR_T_SUPPORT=3D'\(.*\)=
'}|\1|p" ${B}/tests/atlocal)
+    cat > ${D}${PTEST_PATH}/tests/atlocal <<EOF
+: \${GREP=3D'grep'}
+: \${AWK=3D'gawk'}
+: \${SED=3D'sed'}
+: \${ENABLE_THREADS=3D'$enable_threads'}
+: \${BUILD_WITH_WCHAR_T_SUPPORT=3D'$wchar_support'}
+EOF
+
+    for t in ${LOG4CPLUS_PTEST_TESTS}; do
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$t ${D}${PTEST_=
PATH}/
+        [ -e ${B}/${t}U ] && ${B}/libtool --mode=3Dinstall install -m 0755=
 ${B}/${t}U ${D}${PTEST_PATH}/
+        install -d ${D}${PTEST_PATH}/tests/$t
+        for f in expout experr log4cplus.properties.1 log4cplus.properties=
.2; do
+            [ -e ${S}/tests/$t/$f ] && install -m 0644 ${S}/tests/$t/$f ${=
D}${PTEST_PATH}/tests/$t/
+        done
+        for f in ${B}/tests/$t/*.properties; do
+            [ -e $f ] && install -m 0644 $f ${D}${PTEST_PATH}/tests/$t/
+        done
+    done
+
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+}
=20
 BBCLASSEXTEND =3D "native"
--=20
2.43.0

