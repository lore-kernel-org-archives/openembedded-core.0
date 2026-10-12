Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3C1CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:42:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10666.1791801736808878316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=II1V0rB5;
 spf=pass (domain: est.tech, ip: 40.107.130.64, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI1kKyz9mDUrfvfX1vpwsREcE8TnlEvq2ko8wyiA/QgLkhTZX3ZQmIqkNdhvZimMP1bzJlLCQTgOqcDXtIlOpu99pZ5XtG4pHWabXm2DIRQ2y9G6MQy41mbtIQP3FTn077Y6wHmyPL9dX4nqC0q7vVyEPOCOgxJM7DZdcYDK9GXLKkIeRrHjV2i/lyUv2uN7uiRqSUuaKH0G19Mf37DLWDqYNQj362aPaAJ9iimDTtRGJG1wGOAlbJpFbvEka4ZpYh0P/vIgj2PlIdF7VoSxdSikBrIKSOOC+j6Y9AXn3vSGXuRZlcMksjMS8XuS0et+SuCE/FcJU+go7gfugH1Gbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1byLkwtn8067JFWMnvnvDMFVjsTVpxuAlov24J7xw0=;
 b=kA3ofZrrzJf4LYUXWNgns5FYRPe9GmgivJgyz2P2euuXaj4+JHVb8svx4EJp7zF3n5s5ppLL6ENCMrbYasPgmSj8+0CTKBYk+lUAjW2RLOI/hKGzKrAog649Pqjo8xjVmsf6SrfcHo8Xzi7vIRTpa22sVzH63PwrAxMhWYXl4QTreec4P17Zg0MfZdcQn4ZECJDHZ9dR26pUGpry/ZW5439uqF4SpKiH+LkDyykvgbccncCaGqSD1FxB5EwQtt8sN+Lk8dWknF8ZDqCETLvmrxKFpG+t95NUQv9Q+K+N73NU6L0K1L6/Qy+Dukyl41TvEb0F6HWj55TLeO2EQZa6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1byLkwtn8067JFWMnvnvDMFVjsTVpxuAlov24J7xw0=;
 b=II1V0rB5/Pz+UXI4YHi/jnFVwU1sMo/0/HWYpC3pH3GUuYEtfyUjDCo/rkfwaeOYIhgk3i+S/wQMn1TbhilPVKNSkP7FRkoaFVs+C6T5CbZqodctpGY9D7Tyg5zP4lk5VWJ/fHE7yRsoj7ufc/yZ8zPV8czR+3vTLCbACimJb0iV4Hs2KG3veFwUb9t3ciCfCYD/7UO/zQkwtDrRjrahlnWRiUkTx2x7zP6KXUCAPwr74U2HNxxA9F5uazrgFo881ptCgrUxfzee/TusqEUdZHPMoq4lIyCP+WqFNmNura3A1GIos9wnXnCM3uZD4Ry/PBRaS4uObVh5DuMW5Un+Vw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AMBP189MB217643.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:814::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 10:42:11 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0496.017; Mon, 12 Oct 2026
 10:42:11 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] patch: add ptest support
Date: Mon, 12 Oct 2026 12:42:07 +0200
Message-ID: <20261012104207.22429-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::27) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AMBP189MB217643:EE_
X-MS-Office365-Filtering-Correlation-Id: 66263d19-3d70-432d-c9ad-08df284d7886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|261009223027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	CEUc6bjE3kc9DplVIwacx4smVTn+DbjEgfHA20+8wKwiZppP8bhfNIpwoB66QXtZ8y3h9rXyalebIp3tvZKSMbVyyoMQmv8qifDojI4BZ5Y1jSq9UogpDV3hbYTr9u3zwv/QF21OTYDXOvqrNSoc1jE5XWSISAHkh+nihw0YRilX1kWTcCNSABXGr8AIskEnO57JKmq4J8UnHzmFwWsUqOHAwu6MewIxwwok9ciesn1Pqd8xoIamm5ZOiVpOs/AhlazvIeZ8YvQ5sxZlCYj1th80d+RgDIKUUWF/jfxA/L2G6P0hW5yFVG2GKLPVgZ8OuLhT+KHWsJ7lKqKIqikqyRDvSeVhhro9cyALkfLdu0cMYJjn6T9uwU7o3U3ggkbkHmVa3Q8ArTd3nI9N8NCPWMXpK++ilQJ1XFOzn9PJfHSkhHeBFB2yCc8KxY2rsfFvStHVMEfTaEbZ26qAiuhmMlt9eprHSYkRLyL4gMrk7S4XkyN1uzgvDg0oIwCic8opv1Gq7T/T+kybobEcEYHtywvvACLbBwErTf7vI6W+rliyipjBkS941RxO7dBCVQp7hSGKMQayjedojk2fFe7n6W6MD4skRau12dBlnGnzcMYX0umsKTbb+me/yPrKP24wLjQZkGqxLn0FciQLMEMP6i3ql+3Xxb8Jj6/uAP472+s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MT9NZ9hS12eNM2YELzfbdyedux0TEQRtwKB1eeM5C2gubkPaD/KRJFfZLQo1?=
 =?us-ascii?Q?RHRfPVdQ3Q/ZAnFa4t4hwyWTgAQASb57ppXqWkfQ++m7yYKRu7Hhl+hrwzWM?=
 =?us-ascii?Q?XOD88REIxjUIR+rkcXi+wOXuBfFQIYlPE/kW3BRKz/iIKqW1xnD4QKM3JQd9?=
 =?us-ascii?Q?Sh2s4RgCSU4BKP4nVDsx2tw7O4yq2CgF/nbzeSTux0mI9/iU3OZxmaSSTWxt?=
 =?us-ascii?Q?i6LsklTiZixoudljnQy45xBfS7wUTiYFFLgkZ464sbA0QSMAp1/Dse9Xtsp0?=
 =?us-ascii?Q?OHEh/bejdQIz1ZfDGe9x8QF/sI1bkURBprx8cnNsHx90VgLmjSGhW5gY+uz0?=
 =?us-ascii?Q?vkRzq2rjZvjj65S7rPToaIYsog2giblUgzBTkeeqio3w2duJiKY8cAhq41bC?=
 =?us-ascii?Q?QbOfks5qV7Ky5O7ygwZL1RDbeDldIVQSXyFIk5LzC3XLJWWva/Grf5MAf33y?=
 =?us-ascii?Q?ULBYwiMMxnv4HFiGmlIaY17ryjHo/S1xCqhMUecebRsLoCHNIEaZT8UNtdlN?=
 =?us-ascii?Q?QzOKPuuvcXbcW025o7RtJJJOIDFpqVEx5zHiq0WlbzuZ1kXRK9cdxWp382fm?=
 =?us-ascii?Q?ovZnXSaugD8F2rwwR4TdWV76OfuW+ZoCO4ppAyA1uD62Uv+srxxGUyK62RvZ?=
 =?us-ascii?Q?140F2KugpFfDx3c5Yg28Hlcmnr28lLIFkgY6BitVYhd2sxkxuKxXwDiijz+G?=
 =?us-ascii?Q?7L041GH8HKZkV22M4ANEZZDm9/MxQ2BI09XsEBq4yIfNiXSycEsEHs/MnnZ6?=
 =?us-ascii?Q?q0a3HLOzRM8sNuQJ0Uhv+9u/0ivRqSXAFldpmUlLbm3F8BNA1/XVbw6UagQa?=
 =?us-ascii?Q?rmYxvucX5D0M1og2V8emPXgpXC3VNfTYUiaa9vbyk/p4jOutSFdBgxxK3kji?=
 =?us-ascii?Q?pKHZdQfbCtXEFuVWW3mJHNsnFDOUHRD6no11mkoXU6N3hN9VtSnmtGQ2V2hf?=
 =?us-ascii?Q?FxHwftO3WaM5ALPO58uIQcHApceqKu8jirS04wm7t/YcHc4TBWMB9cSJlMG5?=
 =?us-ascii?Q?7dJEtI6dZ9U6/kDEjxMuAppFoTh8EI3XdSUyILwQJZNw5gb8xyGkrNH0OtaI?=
 =?us-ascii?Q?nMBhXYT3lcCJk31lWeajGWl1Cv53j/HPlT83s5I0wDqNiAEWT5cSr9Mq4nvw?=
 =?us-ascii?Q?ipKNwiYNex1Xd/7J9O+Vuj22QCaJZK8F1zxUlxDrjCMa2PhuDVudUs8SBvdd?=
 =?us-ascii?Q?euIt6cn0WgPD6hgQ+JscIDar3q1zz5me24dqkwpUBKY/OskNl4h1UgywmCsy?=
 =?us-ascii?Q?/ksU4RXCoAea10uMPLDmB5vdSS+eHwVU/WIPrzoztnwOgC+LxXlyixEojGoW?=
 =?us-ascii?Q?Yx+FMVveCmM/cNV8fQ0jARF/8UMjUAp9kKTKUWxt7n+hyWEt7pYLeDEWX/b0?=
 =?us-ascii?Q?f7PUGJGkjdMLyjfxByDatN2iQbsQBZ85jt6uUIKu1yiS7y7dBASqFrqo2Dfi?=
 =?us-ascii?Q?MNppy0lf4EEFMmS51asp+t3YXfZEEGuOlM9RI+SLCevyqm8urX5FYCBY1ANS?=
 =?us-ascii?Q?8kfeAJ00vtbZQ2Ry0kDl1cONKuRVk/cf/dZUdIsRolMrYjtCIvMZhWJfYUE5?=
 =?us-ascii?Q?+gLbF2Cek9ttAuLzE+iHJYXLpXH3+qprqusHTQb6CzsXJcOK4+bchUTKMCdQ?=
 =?us-ascii?Q?AxBjYMjWx0AYnz1QMUz+jfipSn/DeI9YlUQ6u6/AZSesRg14VpNOVpcxTSao?=
 =?us-ascii?Q?2Tdao9c7mkY/6X2Z1mamtU4gdmZicN+W4DX0GMAUxV7fd2GkV4+ZbMnrP8ks?=
 =?us-ascii?Q?NtMhciFybw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 66263d19-3d70-432d-c9ad-08df284d7886
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:42:11.0599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZopkt54XERJOExQqETrY/ZOUdd6Lu1+kzaIn32zI1j4ehyJcZPdpYsovecs4FS7F2uVh9AfwzJMTATN5z+7fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB217643
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247629

Install GNU patch's shell-based test suite and run it under ptest
against the installed binary. The run-ptest script maps the automake
test protocol (exit 0 =3D pass, 77 =3D skip) to ptest-runner results and
handles the dash-o-append and context-format expected failures.

Tested on qemux86-64 with ptest-runner: 47 pass, 2 skip, 0 fail.
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/patch/patch.inc         | 16 +++++++-
 meta/recipes-devtools/patch/patch/run-ptest   | 40 +++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/patch/patch/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 2cbc5d39d6..a1f87517ce 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -68,6 +68,7 @@ PTESTS_FAST =3D "\
     nettle \
     npth \
     opkg \
+    patch \
     popt \
     procps \
     psmisc \
diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/=
patch/patch.inc
index ecbb070ec4..4b90ece07c 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -8,11 +8,25 @@ HOMEPAGE =3D "http://savannah.gnu.org/projects/patch/"
 SRC_URI =3D "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
  	   file://CVE-2026-56289.patch \
  	   file://CVE-2026-56288.patch \
+ 	   file://run-ptest \
    	   "
=20
 S =3D "${UNPACKDIR}/patch-${PV}"
=20
-inherit autotools update-alternatives
+inherit autotools update-alternatives ptest
=20
 ALTERNATIVE:${PN} =3D "patch"
 ALTERNATIVE_PRIORITY =3D "100"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0644 ${S}/tests/test-lib.sh ${D}${PTEST_PATH}/tests/
+    for t in $(cd ${S}/tests && ls); do
+        if [ -f ${S}/tests/$t ] && [ "$t" !=3D "test-lib.sh" ] && \
+           [ "$t" !=3D "Makefile.am" ] && [ "$t" !=3D "Makefile.in" ]; the=
n
+            install -m 0755 ${S}/tests/$t ${D}${PTEST_PATH}/tests/$t
+        fi
+    done
+}
+
+RDEPENDS:${PN}-ptest +=3D "diffutils sed coreutils"
diff --git a/meta/recipes-devtools/patch/patch/run-ptest b/meta/recipes-dev=
tools/patch/patch/run-ptest
new file mode 100755
index 0000000000..dc7d9ae9ae
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/run-ptest
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/tests" || exit 1
+
+PATCH=3D"$(command -v patch)"
+srcdir=3D"."
+abs_top_builddir=3D"$(cd .. && pwd)"
+export PATCH srcdir abs_top_builddir
+
+XFAIL_TESTS=3D"dash-o-append context-format"
+
+is_xfail() {
+    for x in $XFAIL_TESTS; do
+        [ "$1" =3D "$x" ] && return 0
+    done
+    return 1
+}
+
+for t in *; do
+    [ -f "$t" ] || continue
+    [ "$t" =3D "test-lib.sh" ] && continue
+
+    sh "$t" > "$t.log" 2>&1
+    rc=3D$?
+
+    if is_xfail "$t"; then
+        if [ "$rc" -eq 0 ]; then
+            echo "FAIL: $t (unexpected pass)"
+        else
+            echo "PASS: $t (expected failure)"
+        fi
+        continue
+    fi
+
+    case "$rc" in
+        0)  echo "PASS: $t" ;;
+        77) echo "SKIP: $t" ;;
+        *)  echo "FAIL: $t" ;;
+    esac
+done
--=20
2.43.0


