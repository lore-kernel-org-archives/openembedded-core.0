Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A03FECD6C8
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 16:35:38 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23453.1770827724361529523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 08:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dqOF/H+A;
 spf=pass (domain: est.tech, ip: 52.101.66.12, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0bNfdF8i0CErzDEwHPr8YWEqqxJQjuIGBP8k3hg+KX5FnaRQgst1/p2QD0LugrVqCQDvdii6nLZrzb9NHwAFRqPYfcLvMLhn2kj64201M7v5eQjf3q30OXGdZ25cuoeHk2pdniS70L/9AwStbdqFszpvGMy+2wYaX155IHVyEzko56P0vBQqaq2duzOyrtBBPaDjFUdtOxWF5hhA4UoefuLs1Uj7zEFsYYCiYJR2gNSU7dO9PVd7RIj5AcYGUYA64prYNEuG/NyhDSoHa3mGhd5U0MtdM4jIifQ8yynqkRVxMu/yrxtsEhRJOxnXXJL1JJfMeYmM5XI6qNjTuerxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0IJcemgWT/+3AIDBze/GluuHc8mSAdU4yeyWDHDK00=;
 b=o+K83I9FqK8ZvJ+SjzeEcQXF5fhollMB1h872ejFLUYc1Wa9e0AyFXp7ji94YpXMK4+/KyAjCgKpvyZPuCTs99gLayP+2T8DpZtlQ85r6kK2G1REP6BrdGdrMjqDvncCvsfoGLkL4aLfs5EszrXn5cMo3wDQ692shv9pN4a2cTL05S5NjLI3azHBIoQK0Lexz2y5jb6GNYQP3e01TfkcK0uAS/QbDN0VnZY7gVTded41cTYU/iwXjvu9lkgwQ9jGa4I/3jH7xf4rVaMgjiwyEQfq+Nf+vrTW//o2OS2YAcEt8vrsZZQrabKe6sqXQCCUJO5kwql5LCQEj6FJAVYJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0IJcemgWT/+3AIDBze/GluuHc8mSAdU4yeyWDHDK00=;
 b=dqOF/H+AZjyUkC9qIwflhB5zzar3VSynWncBm65hbQLqIYvJOWShvjolvexmcYIAAjptBtv38OYM6yCH1dls8hObtZsl8P36Fe0zCxPn0O9P49cwj6Wf91AuToHBeF2vVf71QgWUSAqiDCB4DMH0PaPqJNeBfzhAp+ItxtWPw0votrsT+X6wm9FVMrRBJqw1rmhqXMThGYtwId6ec0UWQeRIwQYE+epCDghc1lgqibWBsb6bTHVToEHWcv6ZoMGk5SDWbNSsYv6GGlgWNDW3+9fYb20py7QQmgLAcH3nFpldpY9t3JW+VJVnIqx5EsCbhfjJ4cl/7vgVAR9P1fk5PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU4P189MB3497.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Wed, 11 Feb
 2026 16:35:21 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 16:35:20 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libsolv: ptest: remove conditional checks
Date: Wed, 11 Feb 2026 17:35:14 +0100
Message-ID: <20260211163515.6656-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::18) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU4P189MB3497:EE_
X-MS-Office365-Filtering-Correlation-Id: 5399c2f8-b9e1-4d22-224a-08de698b8bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tOJjN0uZDLQB4ImJp6MPAEeGQxClayEIayOYFHLD+Ljj9PinqJeau6f5N6ur?=
 =?us-ascii?Q?cZzh7oR1NmOPmrgtmkUDDmaIaDmj9wmhMH01UW3B9mVaIJHGPTFH3hEw5uzY?=
 =?us-ascii?Q?NBCe7LSvgabRvld9bSeCma2TFgfa1n8OcvtVPLOr0xXfRb94ztSCbDP8/MsU?=
 =?us-ascii?Q?InaC0d56bLLY4IoOn6ESC1FdOH3s9ymmgjj3qp+tEMFB+gynH1iCTFvSdL0Q?=
 =?us-ascii?Q?zV3wWDQB/6x4TDwxMGSxGRJVqqgZ4ou2xGUFa8Z+eiF3uBWJ+4TpbN2xf1v7?=
 =?us-ascii?Q?byZ2dNVeif9ts3f3SmkZbP0dVD8pDd7sysEkhmilo+RbM++p87aEu2XyxL9O?=
 =?us-ascii?Q?+7lsdBz1tfFe5+1xVinJhZJeDYsONl+XaOfOsYoFctRUILuv0IdsA//m6nq8?=
 =?us-ascii?Q?FDFlnVh0zGA+D+rjzpZCHIFulg3qPAruLFUF6w+InCpujJThj6arv1hcL4iY?=
 =?us-ascii?Q?S2kSxIyb2UM67vWDU2B9U+Tb9uXIKMgOnCVGk7cEq8ZIbw3xjRfevL6Q4pHB?=
 =?us-ascii?Q?t+WkfikbQxg/8vxjdu+/zh0MQ1ONfu/adm3CnF/TLA7GmRYXSOulXUh7LtFP?=
 =?us-ascii?Q?PxysuEW+vbQXtxzZrgUif002VVr7pXTINC24E4col1Rv/Q8Yq74kr7Jxpu8Z?=
 =?us-ascii?Q?+VARr2M64VJuCRhgbtT5UpMSf20ywV3uaF+lVpCCuun7hgKP6dg19rkwzY22?=
 =?us-ascii?Q?wEVLGU4HnOmB9qG2RKhxsnAzlVsHVBtRnj99/Pgt4ZAGl2vh1FA+op+QRHQw?=
 =?us-ascii?Q?Us9y7nc/dbh0R4IxdUC0LSB4z7+9GJwEupzIkI5PcJ0LxW00NBjf8cJIi/bS?=
 =?us-ascii?Q?z8kDn/D0zcxjWzq3Dq6URWQj+F5uBMzW9zxpNsCP7T+WVMd8AxQzulj8RtKI?=
 =?us-ascii?Q?zc+FXH0fmDY5sxrIzPz6CppoVGVa/KQjWJXtdzraWGrLN8lj7apiaRiv7GFR?=
 =?us-ascii?Q?EYCMLoqQGOLyDk0hBbaPB0z5dh1urZkVONl0Ig6XCSevSZ4FV3wKKx9cRKrr?=
 =?us-ascii?Q?8+mgQSNXt8AS9gJvf4oijSIbzLUZBkwM6eBXzvhmr4e/653zZEVeYqc+gtaR?=
 =?us-ascii?Q?He4BFIopDzMBeRe7jaWacyqhX8SkLybpYQ6CCRCJNvEU62uroVj8payEG1Cp?=
 =?us-ascii?Q?vSYGKWKUInxUOlUKtgWrO3xe7oy4JrByB3STpoTm4aQZz98WSFYAxA998+lj?=
 =?us-ascii?Q?PVeXr5TPpXq+uJFCkW7aEPpj0vY9MW6OJfogURnZ5hiPiYlFhvzvTLcP3qGz?=
 =?us-ascii?Q?K95rtva5oHBtD5pJZNVj3n21zKRQ0D655Tou2y8SdCQO0wWGVlnwXr+8MjyD?=
 =?us-ascii?Q?hk4gBOeleHwJxf6SAIreHJWUpaa47tn6GojCANX3r6xx+CjB0qwJjPDbMOeH?=
 =?us-ascii?Q?Q/rRMqNMDhdb45KYt82hXy1HTj8XndfrxRPvlhPXje94hHBXOFyzfr+Irfoi?=
 =?us-ascii?Q?TZfwZVfO5/UKo7VuzYdAbFBDY9VzTEkv9zRoB+roXsf9WFOrAb64bDlXgBCf?=
 =?us-ascii?Q?MfRPA3hvfZlNM/BKELKLVo8tjWOdUGABpasqnTcttUTC/biUn8VHGhxs/zFA?=
 =?us-ascii?Q?tCMuoQaLpqhGbRHKIP4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?518XDEYJTbGxLeT1XhdJlJM+PRhjVtu0WSMkKxVm/jgY2bt+ghw81kO0CDxX?=
 =?us-ascii?Q?UE3N7dMM/2ZDND41sncX3ay6Tp4mkfcXW9sRUyFcU9nPdSJgc+D2WwrgCVn9?=
 =?us-ascii?Q?NOsfBxPffefyCJjVTmK8Pnnp2+VeucWiRxUKeaau3Te+9vN6JyetUWATd7U8?=
 =?us-ascii?Q?K6H0l91kOlMABRtpsg1Ym3muPdwvLC979BqePxnLtkU3fUyq/U+8jGvQL9n+?=
 =?us-ascii?Q?KJEdB5boad4D4r5rVicwFcsr0ZrTs+aKDzeQh2tIaIDMfoPmqxfGzLmd27nV?=
 =?us-ascii?Q?ekkmurtQr+ou/Lwsi0ZVD8dZZltJyNWYmRx16iJ27Z/ZiGcKXsCrP65inqO0?=
 =?us-ascii?Q?2Nj6OdgdVMp27STSSH25EC3wW0c6OVQowPCXgWH46gJjaz65fNWGHwCmVc2s?=
 =?us-ascii?Q?945DuXrzEKHuW8mWfI/WWIjDHWxk6AuoRmiIbWMOCporntSneLrX+McDLSgn?=
 =?us-ascii?Q?B7rYIwHyypic58hhssOSy+vmyP8LMBw/1ud4EULIZmf+MdfWqGihJjLzJkbV?=
 =?us-ascii?Q?vP8+y0U7hWmOGv3i4wvPVDSlFVSZX4ZRw9eaYPKOBGAavXuiEmq3HLPZv3XF?=
 =?us-ascii?Q?ruDojVPCcY3tlQ5xMmPgyZ7mCjbZtyuAK3Ss8bo4BtQHe+gKejojnbn3Woct?=
 =?us-ascii?Q?jRt2kUBY5gFds+SYx5iaUfFzP6UlQO/Sj06F2U/r5s21dEGzj+A7r4LsUoTr?=
 =?us-ascii?Q?LFw1gf6xCQmUpw+R+MRaDydtpP+LwXJoGjutBnfFNNxu4ua9K7fGm6qUSlUL?=
 =?us-ascii?Q?yrFg0CgVJI285E1Zj+HB0r+Re5ZOkUYvVH9aYNhSqd7ZvcV5MGJ8LyS+8YYC?=
 =?us-ascii?Q?ITES3n6MmBLkRiLhTH4Nhi7qSapZkVXANm7LImixrAbcbwR9xFs0Sn8+KO/B?=
 =?us-ascii?Q?19I8ILzFPjk0Id1S6Ub8TO6sPubipMpKZjyZuAYcvGYeeWCwsVdKORQB9IPe?=
 =?us-ascii?Q?s5O0ArJzkuWuq/F2tGPBk8FMGgJEbWz/PiipQcCQYdngqwf9DFJCI6ib+afi?=
 =?us-ascii?Q?Q16R8IW9yLeKKeOYoZzC6vgZ0+ohOeSEmSiC221xKVOgNW2ej0P8dw+Ock4P?=
 =?us-ascii?Q?ox15uYLk5dhGwqIiUiIyx5gHvQ9dLQN6P4K6nPd04/7HY9f62kD+Kz2+sofa?=
 =?us-ascii?Q?3XCfx01MM3Wkaa7xZtEUo3JkEzYbnbbn/NNuM+LjFh8N2SvQHsZurwox+pXd?=
 =?us-ascii?Q?CLox/nJ9ZLfZONkHrGs3mJmNjjb6orTwatsu3teupo7nHcD68NHkFnjvRZET?=
 =?us-ascii?Q?m8bR5c3DTfQDdyQwWG6J/bi0Ur7XsePqIaTouHyDd66WyA0iIpjGfBy/LTAh?=
 =?us-ascii?Q?JyrDBBeWvurV2sJu84enoT62wHomt1T+Eu9sYr2l8X5SdBVe3Qqf4V+9CSC5?=
 =?us-ascii?Q?80nk1xvC/j0eI1MQK1xxzyVX5PNu8FigdL/CsrODw5yUytJ8GQPR6xllkT1p?=
 =?us-ascii?Q?/hnKuxdLuE0ulz+6EeL6Vcwv943KGDKBqTKEYrdsJk+s9VFqoiJSsO7b3q0i?=
 =?us-ascii?Q?/DpMtevyujiknCzS203P07uJyURvluK0+7c9O1C1334IhM2ATGMCO8itXAdx?=
 =?us-ascii?Q?6W25pXvaeyXcEBSB1810Egxdh6v3hEeF3lMfDJ+irPg3NxOPF8zHI+dRtjQc?=
 =?us-ascii?Q?F7VWQ9HcGx3JDoLvreQZTc2UWcdheoeLmfiFJMM4i18w2CMy338upZWgIlc9?=
 =?us-ascii?Q?OXIrcrXO3F/JXkW/qPyfI26+rN5e87M6ODuy0/Yki9LOdqx3YO0lZr2JTSIa?=
 =?us-ascii?Q?L60tyoEFQw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5399c2f8-b9e1-4d22-224a-08de698b8bb1
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 16:35:19.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz6ta8tqoZPl0zelE5SQP93x3Rycf5pKY1oZw/iklF/f7YVOFdmhfgObCcx4rTSheTtQAvGWzO6jaqxTFcthFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 16:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230995

Simplify run-ptest and do_install_ptest by removing conditional
checks. If upstream renames or relocates test files, the build should
fail explicitly rather than silently skipping tests, ensuring the
recipe is updated appropriately.

Changes:
  - Use testcases/* glob to automatically discover all test suites
  - Remove file existence checks from run-ptest
  - Remove file existence checks from do_install_ptest

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../libsolv/libsolv/run-ptest                 | 19 +++++--------------
 .../libsolv/libsolv_0.7.35.bb                 | 15 +++------------
 2 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv/run-ptest b/meta/recipes=
-extended/libsolv/libsolv/run-ptest
index 1462aecd61..857b719ae5 100755
--- a/meta/recipes-extended/libsolv/libsolv/run-ptest
+++ b/meta/recipes-extended/libsolv/libsolv/run-ptest
@@ -2,20 +2,11 @@
=20
 cd test
=20
-for t in allowuninstall alternative blacklist choicerules choose cleandeps=
 \
-         cplxdeps distupgrade evrcmp excludefromweak favor focus forcebest=
 \
-         lock lockstep multiversion namespace proof recommendations sat \
-         selection strictrepoprio strongrecommends targeted testcase weakd=
eps \
-         whatprovideswithdisabled yumobs; do
-
-    if [ -x ./runtestcases.sh ] && [ -d testcases/$t ]; then
-        ./runtestcases.sh ../tools/testsolv testcases/$t
-        if [ $? -eq 0 ]; then
-            echo "PASS: $t"
-        else
-            echo "FAIL: $t"
-        fi
+for t in testcases/*; do
+    ./runtestcases.sh ../tools/testsolv $t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
     else
-        echo "SKIP: $t"
+        echo "FAIL: $t"
     fi
 done
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.35.bb
index 53daa36106..ef348de904 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -38,18 +38,9 @@ do_compile_ptest() {
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tools
     install -d ${D}${PTEST_PATH}/test
-
-    if [ -f ${B}/tools/testsolv ]; then
-        install -m 0755 ${B}/tools/testsolv ${D}${PTEST_PATH}/tools/
-    fi
-
-    if [ -f ${S}/test/runtestcases.sh ]; then
-        install -m 0755 ${S}/test/runtestcases.sh ${D}${PTEST_PATH}/test/
-    fi
-
-    if [ -d ${S}/test/testcases ]; then
-        cp -r ${S}/test/testcases ${D}${PTEST_PATH}/test/
-    fi
+    install -m 0755 ${B}/tools/testsolv ${D}${PTEST_PATH}/tools/
+    install -m 0755 ${S}/test/runtestcases.sh ${D}${PTEST_PATH}/test/
+    cp -r ${S}/test/testcases ${D}${PTEST_PATH}/test/
 }
=20
 RDEPENDS:${PN}-ptest +=3D "bash"
--=20
2.43.0


