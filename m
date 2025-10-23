Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F30BCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 15:35:13 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.56])
 by mx.groups.io with SMTP id smtpd.web10.24710.1761233710843630850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 08:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=V+zEdLO4;
 spf=pass (domain: est.tech, ip: 52.101.69.56, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKbiz7B7RpGrDxeC0Rapk3NRON6CHtDcaclNUe5syWvUrdVVL52nGLwciEYHX1S2nt1MkLl9TObzIVZOH2lkRq+KlaJyEq7zkeja2xxwy9W99vOJESf0k+1NBb6VXVRp7dCty2lH7ypVqobXnq2q57tPn2mIWXYmRq4lYwOYOOLkW5LRX7XO9k4T/JskFDI93mtC9Am0m98ffzo7MtpEi7dI/J7khejYpAXdruhE0PEjA+rQo4AMEBJSb8DHH6DIhVXBIH0+g0LJxWxVXUMpgG3XbpyMFwunKOLGlMwuI2VQrUQuhZWhRHtxjtKFEi/RHTBqhnRefcg7Fu95nLe2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l726ExuIkQ5hyUbHFBoi7jibXVCCHGqT84QzXsFz7UA=;
 b=YOPw22dbz9ViqSwpBK58qzGDLNCVHfd3DxA59wwnQQaIeZ4ilqACca6SlvCs+UXbAdOhm44/xS8jpXlM4PLk5Bwym57uYfWXeire+HnrZ70pxsmTuiH+VNN8PsCM0EnGxCW98wUqdzGlIT7fo/2mJn852Z6shOVx11iIU5RIDO2kIdph2pudX3xgvIIJ/plGDoFX36Vo5lfJcGWGQDsAILqWBQjj8UeZPtmVW5XVSxj2q6O8yecslYKNvwU/jDyuh6C5s9e4og/zJ8wykVyBb6Mn/8h1Q/j+SZB17KGj5aJBgIN0gSAXwTGg8QJZg5V6/ZHGPcLaQmwSMi6dcs2CGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l726ExuIkQ5hyUbHFBoi7jibXVCCHGqT84QzXsFz7UA=;
 b=V+zEdLO4HS5TQF6zGbsyq8AzeRW0NnzKGIbrGwTeH0Lo6galEd+yruCWwGlB0VtSrJht/J2w5Q+UyFJyP4IvPxQJ77OfuNP4VIvIZ6Rknp5c3BPHZpw+zLCi4lpsNcJyK4BZqW//OY+jINFgQ2BFXgruZvjajWmDoP2pnTeA7IzHRASycAS0yZFMXQyQt22kswUP/Xdh7mdicnVsggwr/zBrKnd4SD0C7LP3qcpS3qWHL1XAoWQh55WVOLpLi0v3XbatPaZMXwINcykN6ueujwigeWKREQe5RjOmnuPpNjsmrOPpI3R+0Y6WAZmKG8J06il2RWDjL3YKYFqiJ5vk7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by VI0P189MB3236.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 15:35:06 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9228.015; Thu, 23 Oct 2025
 15:35:05 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH v4] libxslt: add ptest support
Date: Thu, 23 Oct 2025 17:34:59 +0200
Message-ID: <20251023153459.49699-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022204136.8276-1-pratik.farkase@est.tech>
References: <20251022204136.8276-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0282.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::17) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|VI0P189MB3236:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c18116-a1b6-44ae-136f-08de1249bd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BFRvoAIaZogPEbBGTEvxvMQ7dO9E5YeJJwD8b+NtUzrrl+ApFCptQNtDCGHB?=
 =?us-ascii?Q?zyMWCSmRmhgLmzhAZ8AXvHfeocIeydy4cPVJKyKkMhp6mndzvMIfJGT2292A?=
 =?us-ascii?Q?nRkqHd6HoRCwvSHq0nPXvc3jqWDHH8FnhNTr5nvJ1tW6uYggRe5Q2ROBmgft?=
 =?us-ascii?Q?b4OOvBaITUPmqt/wZhKtYLcgupOKcRSfpguyRwJF7djzvEHjg3kStusxnopN?=
 =?us-ascii?Q?0j+/pqNTmRKNp2aSTiV31F9zWhamAyuDtRuKRNwPaMojDalPkCKK5+2JsPb+?=
 =?us-ascii?Q?iQkKwfUuPTlqgWhY5nBNOqpkAaQN2/JqB8sylQlDevepl+6fh99515MyxiIK?=
 =?us-ascii?Q?fjAhXR7dhU2MzCIdPeEWYhriIFPL29UMnuIiESYcGOiTCJlTjcfnTFrM+Mxs?=
 =?us-ascii?Q?V0lVQwAa/Dy+gKbYVpD298EcVTcbtSzyksFH+WycES2g6HDlXiZ56BMyMRO5?=
 =?us-ascii?Q?StCGgJo6XqrOXnJOLgZ5rDIGlgyRM6CI6ux4PExzhQIiEdyBpwRs20K4Rkmb?=
 =?us-ascii?Q?AiaOAoJUabZwvXQsuckz3k5v53nNB2Tv2hUyyZuFKMDEZ2Rm4UOgH1cmAxLw?=
 =?us-ascii?Q?PQVwFiIpFU/PmdBFfiZfSMCAPd5KX8tMTOz2lYKJs6UEYU4hQBN1m60fo7fR?=
 =?us-ascii?Q?aIZJC/9HSK4r/siTeLRbn3HDtSBx56AJsYvLM/jKalhrM0s2hizIGr8I8drZ?=
 =?us-ascii?Q?KYMNjlaCHBgjMFr63eGcsp/k3lwVqvFjR0UZ1d4uv9ZcML80OU3u5tLfja0W?=
 =?us-ascii?Q?/J1SFBXdzXrWWGhp/Vm+LaJpL2nlv6ftEaGP8Os0Ibe4tz0HYtQF3Y2TZOKl?=
 =?us-ascii?Q?NJlHjl+XjBeuiNsYXHxTSuhajRHluEE8+v2FU0GADAKPSLqFJsyDo1qERtr1?=
 =?us-ascii?Q?jQMMA4IQTuVvqE8JjzXjWl1utczpzXlCLyc+etfDX3qGaCR5HtflaEsWPXfP?=
 =?us-ascii?Q?Fw0MFYwiBSeQIaxrOACcRTWBkwHqiOKRypzlZ7y6CT/a75AKmdgdMRqnN7SH?=
 =?us-ascii?Q?ORiDQkAz+odFoWLOZevYNqfWaEGX1N40uBB6gEmJGcqmV3WK9ZZYJgIKTQ8z?=
 =?us-ascii?Q?J3EgvPs8vFUEOrI0oNTYyKAPWHh1CURjof6XAg3rcfnBKiVVxGfEctNkU7EA?=
 =?us-ascii?Q?pe37tHN3H2xj108zgDX2rtmn80UiZtXBZCxQIr2n9J83Y2qDKR35fVtmSTcJ?=
 =?us-ascii?Q?opl7xhmcMUxlkWmHploCZfRtokeTpUUHgCDG4FhkmGDp9KrdXl9GXufp56pI?=
 =?us-ascii?Q?OA681x7YPNzrUUIdf9iJyDOswEMi5hO+q275PfeTuh7g5ILXPmAnxvYDYe4O?=
 =?us-ascii?Q?Pg1vkuxKGB8KNpr3slBUtaFb0BhOIvET52wk7J3d7u3pqrB4OwAcs8Gr8mL9?=
 =?us-ascii?Q?zKOO2DeMnuqD8cVC2Ftxm3rlFIiSEGxAzWR8qM9HLc9ZwnX+DOWGBNISy6wX?=
 =?us-ascii?Q?zoFG2Uadxmxz5k/VDmm9MvJ8Tut+iyi6LL0pVOjv0oQcv6XUUxacMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RXQIX79XYxL4nCQnDMwPk/eNaFbsP0mCaWm8AeVOZ9VjeUIao/OOxJ2b8YoN?=
 =?us-ascii?Q?OLOIEnGJb21RVaOC7JIhQhgeNgWTQc8+iAKi2Ch5nVkIM6hykdZMKTi5tFWS?=
 =?us-ascii?Q?YuJ/d5jq/yOVyxfJRl941vOTQ4rS1JPDsiKMZTHdQQYccglDU03rdIiy+3Bi?=
 =?us-ascii?Q?IxOpMmoS35C2rv6l/3k4usf0mQzbKWmwP3CkKXIrHPvCWWCqC5um02ye52L4?=
 =?us-ascii?Q?XGL1+4stlT2/xMQh+3R5D4j6bx3CIiRcsG4b0z3bmCMbj/O0BaGMnjG5gTz9?=
 =?us-ascii?Q?Azg3RGXEUcZ+SFpem6FT87xwVx7gr3EALe1UOro+3w2WWWfKdugn+N6FS8pp?=
 =?us-ascii?Q?VsWMOlnIfjCZSlUqDtmqMdtZ6r6PrQ8pVsIq+2fuAsRi6a6I0lWqlhuyPA3L?=
 =?us-ascii?Q?nq6CbiwxXUP2GAZx0LmTjniSe6K2W9rrPutrP1nEGEymyCNkvWqaZORE8rwO?=
 =?us-ascii?Q?DeGUG5yHxrklWgyp0a8Wu9/bjwrG6Z/y65bV86k9AYwocv+rdzV5VHLDvk91?=
 =?us-ascii?Q?YK+aJnTPRvDKfWkmhyuPdyP1FrLpxaWgPbO5uvqTFfXgTXrwCze1YG6ZomZl?=
 =?us-ascii?Q?NSoyagLUG8JiwfQgNN0rEsDDT+QODBL1jYDDSCn2lIPzXQmyQWTsBLZ6Yegs?=
 =?us-ascii?Q?zQ0ZU1tW1Ft8nP3SIBhWOP3Ng3c1LjVKH76W9ygpYWRRpptnjL0ausbsRaZg?=
 =?us-ascii?Q?IjCiFywFlN3XVCR52n8BvJjORJpIBlrdf9/JaZP2tLYCQD8J7cj06g9djC+k?=
 =?us-ascii?Q?2OxuwUeUxFkbwJzRdX6EJGYCs//vXTRIpmOeXQib1vK/Z/8c9GEghhoD2UzI?=
 =?us-ascii?Q?FxgC1JNMQ3hlf40fFpmglBSOeiufOoNNrZrbizxXmMGT+yjw8eKIWPznrK2z?=
 =?us-ascii?Q?YXlj0EVB4eHx7WuUwIWTP2/EDEemhXaOM39ndU/mcFCat1h7yLG8l9qQ6mJs?=
 =?us-ascii?Q?glkRMD7FzdPUquMS3/TbdegTr8sZK/aHHX6Kz9qJldMrdUFem+uW6TlndoQp?=
 =?us-ascii?Q?rxjdJA3qfVP9EuoGeiDvUuEJk6yLek5jIAChT7gSC/SJOK7pRkli5z7/Rwdn?=
 =?us-ascii?Q?2GD53eoUxvSXSdOvHiTRzUx2sJC1iE44dOdaVCbcSnVCyoW1MqBX8KDG8eSz?=
 =?us-ascii?Q?QJSSbdLQdqECkDnAK4flTclavBmGqTqnvJNyGAUIWHn8Ub4bwfTV6dDocgEW?=
 =?us-ascii?Q?f4kbBOqur8rYrF0BGjlRwzSxo6BOhnzEp+/1ulwihu1xUsrndM9EbKZXKwgL?=
 =?us-ascii?Q?H2T+iGEPQuPEDJiZPj8s5fzXj2o/MKeeyGAITwbRpF4IUzVMbUGjFcLuVMQL?=
 =?us-ascii?Q?Ga5dUV7CAFknzIY9XlnDbioDMJsknZsvTWvwBVt2G7RxOBJn+9rx2wnY4f8k?=
 =?us-ascii?Q?7Ll6aQ20EZdt4Xf8r/9CKUk846jA9fE/fgalR29J6bnormkuWodG0Eb+IMw2?=
 =?us-ascii?Q?mre7vw1o5LBBtL1zSfZZ8eY1qUTAFKEQ4QzUy/LORVuJGf+JpJAVH7+VscXq?=
 =?us-ascii?Q?Cmlyu3xVyL+MG5DmDy9+DkC2dJ2V3EmktsZsjiqFVUDY1ViWyEXPd7SxMlcS?=
 =?us-ascii?Q?k1gKEteD1A9fAGKHS0boebT2YNMSSQhVw0F360xyQYerxO8ddvL7MpszIWhL?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c18116-a1b6-44ae-136f-08de1249bd68
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 15:35:05.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1B2abBfOpTU3hccQPoKa1z4aBeYqySgpOUKC0GGcw+SMSv64dNW9nvPgl9PXhBMF1UKRpmSthy9IijEN7E/LSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 15:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225269

Add ptest support for libxslt 1.1.43 including:
- do_compile_ptest and do_install_ptest
- test data installation
- cleanup of buildpath references
- added run-ptest installation

Enable --with-plugins only when ptest is enabled, per review feedback.

v3:
- Remove unconditional --with-plugins (leftover from v2)

v4:
- adapt run-ptest to emit PASS: or FAIL: lines for each test
- run-ptest installation with proper permissions

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libxslt/files/run-ptest  | 38 +++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb | 42 +++++++++++++++++--
 3 files changed, 78 insertions(+), 3 deletions(-)
 create mode 100755 meta/recipes-support/libxslt/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 9950e46776..b295e0049f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -47,6 +47,7 @@ PTESTS_FAST =3D "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libxslt \
     logrotate \
     lua \
     lzo \
diff --git a/meta/recipes-support/libxslt/files/run-ptest b/meta/recipes-su=
pport/libxslt/files/run-ptest
new file mode 100755
index 0000000000..1673f933e5
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/run-ptest
@@ -0,0 +1,38 @@
+#!/bin/sh
+set -eu
+
+PT_DIR=3D"$(dirname "$0")"
+cd "$PT_DIR/tests"
+
+echo "=3D=3D=3D Running libxslt ptests =3D=3D=3D"
+
+RESULT=3D0
+
+if [ -x .libs/runtest ]; then
+    echo "Running .libs/runtest"
+    ./.libs/runtest --verbose --timing 2>&1 | tee runtest.log
+    RT_RET=3D${PIPESTATUS[0]:-0} || RT_RET=3D$?
+elif [ -x ./runtest ]; then
+    echo "Running runtest"
+    ./runtest --verbose --timing 2>&1 | tee runtest.log
+    RT_RET=3D${PIPESTATUS[0]:-0} || RT_RET=3D$?
+else
+    echo "FAIL: runtest binary not found"
+    exit 1
+fi
+
+if [ "$RT_RET" -ne 0 ]; then
+    echo "FAIL: runtest returned $RT_RET"
+    RESULT=3D1
+else
+    echo "PASS: runtest"
+fi
+
+if [ "$RESULT" -eq 0 ]; then
+    echo "PASS: all libxslt tests passed"
+else
+    echo "FAIL: some libxslt tests failed"
+fi
+
+echo "Finished libxslt ptests"
+exit "$RESULT"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-=
support/libxslt/libxslt_1.1.43.bb
index e08e92085d..2b2f45f72c 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -11,10 +11,11 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07afbeb24026c9b03aecfeba=
458"
=20
 SECTION =3D "libs"
-DEPENDS =3D "libxml2"
+DEPENDS =3D "libxml2 libxslt-native"
=20
 SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.=
tar.xz \
-           file://gnome-libxslt-bug-139-apple-fix.diff"
+           file://gnome-libxslt-bug-139-apple-fix.diff \
+	    file://run-ptest"
=20
 SRC_URI[sha256sum] =3D "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea33030652=
31a6d403f0183a"
=20
@@ -26,7 +27,41 @@ S =3D "${WORKDIR}/libxslt-${PV}"
=20
 BINCONFIG =3D "${bindir}/xslt-config"
=20
-inherit autotools pkgconfig binconfig-disabled lib_package multilib_header
+inherit autotools pkgconfig binconfig-disabled lib_package multilib_header=
 ptest
+
+RDEPENDS:${PN}-ptest +=3D "${PN}-bin make libxslt-utils libxml2-utils xmlt=
o coreutils sed grep diffutils bash libxml2-utils perl"
+
+do_compile_ptest() {
+    cp -r ${S}/tests ${B}/
+    oe_runmake -C ${B}/tests runtest || true
+    if grep -q "run-threads" ${B}/tests/Makefile; then
+        oe_runmake -C ${B}/tests run-threads || true
+    fi
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    if [ -d ${B}/tests/.libs ]; then
+        cp -a ${B}/tests/.libs ${D}${PTEST_PATH}/tests/
+    fi
+
+    for f in runtest run-threads; do
+        if [ -f ${B}/tests/$f ]; then
+            install -m 0755 ${B}/tests/$f ${D}${PTEST_PATH}/tests/
+            sed -i -e "s#${TMPDIR}##g" \
+                   -e "s#${B}##g" \
+                   -e "s#${S}##g" \
+                   ${D}${PTEST_PATH}/tests/$f || true
+        fi
+    done
+
+    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/ || true
+    find ${D}${PTEST_PATH}/tests -name 'Makefile*' -delete || true
+    find ${D}${PTEST_PATH}/tests -name '.deps' -type d -exec rm -rf {} + |=
| true
+
+    install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
+}
=20
 do_configure:prepend () {
 	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the h=
eader.
@@ -39,6 +74,7 @@ do_configure:prepend () {
 }
=20
 EXTRA_OECONF =3D "--without-python --without-debug --without-crypto"
+EXTRA_OECONF:append:ptest =3D " --with-plugins"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin +=3D "${PN}-utils"
 RCONFLICTS:${PN}-bin +=3D "${PN}-utils"
--=20
2.43.0


