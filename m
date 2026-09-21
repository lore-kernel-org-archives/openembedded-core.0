Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D0DC982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:38:56 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45959.1789986233752260959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=OmcCm2uP;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.37, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnNwKhr4IGBy7S1KuaI1zdPeCx1IUp97uIsN2tszSoXYOqX6DEzD48kwJKiyGVld35Xrq9dLbqKAjci8q446kuwR1LJKDH2Gta69BvByNB5BsHh9qToZGHMl86Pb1mJ1Bneg+AnicA/8LGaEu4uoefQW6fSIdYzYxqxEp9q4dY8eLbpsv8CyRsi4LhzNJLT51eg14MFvPMJmWSWZ4bWSREo2iarG6Ha041TZ87x0iJKP5wlx1HyN6Jl4WzUwu7QToAIwC5EHLQH3Vwdk7CwG+wHPCgNMP8gzvckYW4mE1s4alU+IJZgnMElzlliDZuWXG+mP8HWP7FUJ5OLHtu93dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdB4eGp2O/DmgJWotBOPpHNX0Y5D9Q8yVHbVW+cyrCU=;
 b=sGlEblsOwlRV9ZX+NWNCr/0bqaqg9zb8zOf8sk6Q/jt5kqC49beAmDnEXCjsOIXcUGLLHGcv225iajCimT3GWHxjwu4+vP0i4RbwszRnWDrivNqK6VLVj558FOLmuxb70JhKLSvSnVp7tdaq4SuAkUIssgFEDm1orIlicnK45NsTkWLr9V4cyG45YGhLYkiStlMDx2KvNOttFw9skDM0bURFG/+MqJPqt7A7y7oiyddnACdvRr9Ch3J+AexXfDYK6nueqJ5cTciUDPmq9sB05MfNctmw8hq0oa5x2bhGtZ8PV8HQoG756v2yRTcUELwXGQcW8iTXQCPQ2T6NOaiA7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdB4eGp2O/DmgJWotBOPpHNX0Y5D9Q8yVHbVW+cyrCU=;
 b=OmcCm2uPNurOnxY1DlFoMtFLiUVnehv9Ni8mHnCmbI3IDh4asUOk2QL3wXLVDNLtKh5tWnrUU2jsK7pgWm7g4DxLHFi3VjI7Oe8FaSH0yD/1itZ/dLNETNXJgJyTBltz3qYb50gJTcpRqDyIEq/UecMZyiwULI3Xe+sPX8Eu8h13fADTe9y2piuYDssMWEdCIiOrqSjRoayGVyxwi7Lj0FduC4pJPCAP4hZ1bcwQhzeoWURYWnOuV9RyMIEJj1U5gUeK/C0rvPOB2NHDfE6mrffQZUT7CXb1F8+wmOj4XhY8DFGiiJsG8SS1P1/MGCGmyDh1koh0iQruDeyl5otC+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::9)
 by PN4P287MB4251.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:09:13 +0000
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504]) by MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:09:13 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][wrynose][PATCH] alsa-lib: Add ptest
Date: Mon, 21 Sep 2026 15:39:06 +0530
Message-ID: <20260921100906.1107652-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN2P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::17) To MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:148::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAYP287MB3754:EE_|PN4P287MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 445fa75c-b9dc-4f21-a7c0-08df17c8635e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|10067099003|56012099006|6133799003|55112099003|18002099003|11063799006|12006099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	yRlMKKGbrIHh+7lB4kCuLHVc3fTzq1BLOpIcGf/Med/cO4R2mRfULmaovmiQpJlN3kp8JQgbwv9umY1ClSJxv/gTYmrvKpKbysNS+Xi51kO+gPO3a0IwhqOxoKRcWYD7NTvGuB/GxRLK04W6oCfh/+Ls0FGyW9PE1R+BdVPaVcVLoSGHu7QBwLEzi0Kk/LcbGYDeBbRVWSGm/vsuumkPz65lPwW0f2DDKvuZouuaDexd++z9kFwv5nQWfNppfIRfjInGfhqyoCH82vSBS4hjincgU2QRR5lo9iblHiWmDm3cVh5CeewszKBJtAOrb4xi5Or8vDT7Daph7AqiKQLQWjhWjskToFA91TlKgAKmzF8sphiqaDxidnSVfOm2hCaDVYY8djKxuG04WfhfteKEaR6B9rdSGoemmy82Wp4KCC2OYiQX8jtkpNVvi8JinNYCz2/IaBiUgT+eb/OqnwOM4uLtjjYxo03zFk8PctI+gkySZ9pnD05jKpI0gwZE0lXEPPTXW65Qn+GNhtbZ1SnEM9l66aay1qhzLNXQOzuVzsfhdqSMu7BWJZWES97l4t50vKlGHOSgbk7sDEISV5b1Q5P8RjsztjK8rgIWbwH3eOcljakY27ozKvJwUvPrfdOGG76Z2vTtckeMy08jpebuqEYtwbWeCfgP5+UMqkxOvXo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAYP287MB3754.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(55112099003)(18002099003)(11063799006)(12006099003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X7Mm2XzzhGsWSVrYRnKjsE+UPsL6mnXlHy/dIXiWOoVoqCbQwASX4qWguWPd?=
 =?us-ascii?Q?jzSG7HHLDTBJL7KYZiYB/+Iq1wX+lCnebG94FC4PeOiFb2cwOvBZWRtrr4Z9?=
 =?us-ascii?Q?GTmeOvKCsjDFtayuoSxvrHyxUW64S4z9xNI7hrIOedv/PyJyMJL37u/jPbDd?=
 =?us-ascii?Q?H1RAOn/4uqou8BY/uDpyqdg3bEo5qM85rkUzpqcmfPTy45YZ8glMI08KP9Tu?=
 =?us-ascii?Q?r1Id+0h3HFmtQd9u5SE2skVFANf5WddMwGmMotprwOSysktjUlEO3og7tvLG?=
 =?us-ascii?Q?6YEEBpQkTAu+uMoYa6fUCrH6+NuDLGfEvAdCin9tO43Nbt0uQWUvhChkFJFP?=
 =?us-ascii?Q?kMoMEfmzAxzBtHDa0U+jfvJEIlVgs3sqZzyJEZFI9gazYVt7WpgZhJIHY2L9?=
 =?us-ascii?Q?o341xye85VlaKvDg96eDZqXkl8oXxd7AWBrHXUK3eXi/31gDxOd/gSM42y7r?=
 =?us-ascii?Q?EEk5lo3E0VN4CqZPWixY5IjqvG83zIbltpIgCQ3FMC5RlGJ0YeigtI+6y1vm?=
 =?us-ascii?Q?0+QWWHCNa0xs95RDqE+KHuoWL8y74fanIm2TpLbplOzHM6FWrJpXhkujkivI?=
 =?us-ascii?Q?fg84w3QbDJv7W+TLahZxScNUd73Rf8SdI+ZAI4YmtF/Rv7LKoNdKyEvT2Be+?=
 =?us-ascii?Q?ENAR1xSAIrP9tsvYGCOmI3KJLHiMTEQl14VqzrvsEYB1zdpnY/Ns0JgGNqtJ?=
 =?us-ascii?Q?sYK9boERr8gYdUthr5uJIbeuw/VWb5s8w4m+74L8MZ32fy7HZ/pxxicCaqAd?=
 =?us-ascii?Q?P3xy2iiL98tOzueJ/FjznfGN2kKN3emaGJUH72M57O1PhD3C2gnVqGJuWegF?=
 =?us-ascii?Q?dr7gDROCiuAf511L17N46zDz2SJPNE6tQJOcAU8UJP+8Q5bRxkwaOV/Cs70F?=
 =?us-ascii?Q?1JmuJKz5LJSdEqTKIcMAGLu89ypE3/Nvs94O8hUTiPhaKDkOqcjdn76itOqI?=
 =?us-ascii?Q?pnF9aio3vtAxC0fkhhbdlmP3JSV+zHinUD8XV2sYEzqmnPDb2wfWRdrnJALp?=
 =?us-ascii?Q?s1znGyNTUgIs0kr8a01u6icVnaPJkPiXHbEY9RecMEN1vF3t9sAstJU4kAiF?=
 =?us-ascii?Q?yPSKW/RIFSp2VSrScm0D0+oAUObBx18KQoYckL+byT7dJzB09by/epyAQ2o7?=
 =?us-ascii?Q?EhE1r0tI5YvzRx2r/x0iD9uIhILWd/2inEdpbfVkj8ukI0yyGSgqlixYzhZe?=
 =?us-ascii?Q?/wjzY3KFCB4yTUU+y0P3Bc7BWsVsY56aQHYOQw0HZE/xr2y9xrMwoleX7vVJ?=
 =?us-ascii?Q?x3IdwvwSeME9ebf/rRlbDUY4XxqrdIEdhhleztN6OabB4QiitPws8JBqPjOJ?=
 =?us-ascii?Q?yxw0Dpu+nQebtQv2Z6a6Wc+C9jlUBl9ao1LiwtAOu1MwHOsI8sUmkvyy/kbx?=
 =?us-ascii?Q?LT1V8qIWnCe7pV9bAVSmkbmlafJ8mYZvp7f2sJrAhri7dwkKlngOqnwm3ZTt?=
 =?us-ascii?Q?73d+XggLU5ko8Vr6bgnL9w2cQBgqx0pAdmjlViZH+EiQJdJ/E7N0+QH4q3pE?=
 =?us-ascii?Q?ouOfSPyCZZaQK2Urg+WlW+x1pf9oQIrpvvci5nIoMf+GqidSloc6Wxa4jhnF?=
 =?us-ascii?Q?i1vM14X+CrF1CYdo1sKuml7zRf73UHxFb29c7ctHGbX7q5R1xVJ1LE8tay8B?=
 =?us-ascii?Q?KtK+B0yr+NMK2JrHAo88tNuYYfWY3asTCr0GXewKnEk1iOf0UIhoNvshP5jh?=
 =?us-ascii?Q?EEyRJ5a6hmok7s5wI8Mi864zhLggnUCxj+uuOUXICNeOjp04+ZBiP5+/pnAj?=
 =?us-ascii?Q?KKUHeF5LPTTIMg6j8TWrGO+lkOUh1L8=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 445fa75c-b9dc-4f21-a7c0-08df17c8635e
X-MS-Exchange-CrossTenant-AuthSource: MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:09:13.8806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FihcNku5KsanGBdUmRuILsfwAcoueTGhV3wwpoMsblFVnVq92026kWg0cJxCI9+gG/a6eRir/Hv7xMVUIJWWeZSyVF4lE4Owo4D94LM3xzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4251
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246315

From: Sana Kazi <Kazi.S@bmwtechworks.in>

alsa-lib is a user space library that provides audio and MIDI
functionality apis for simplifying application programming
and provide higher level functionality

ptest executes below binaries on target:
1.config
2.control
3.client_event_filter
4.midi_event

The following changes are introduced:

- Add the required include path to CFLAGS to resolve:

  fatal error: alsa/asoundlib.h: No such file or directory

- Remove the test suite execution "make" call using sed to avoid
  executing tests during the build.

- Build the test sources using:
    oe_runmake check

- Install the generated test binaries through do_install_ptest().

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib/run-ptest                   | 14 +++++++++++
 .../alsa/alsa-lib_1.2.15.3.bb                 | 25 ++++++++++++++++---
 3 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index a2c5c0477a..aa536c6023 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST =3D "\
     acl \
+    alsa-lib \
     apr-util \
     attr \
     babeltrace2 \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes=
-multimedia/alsa/alsa-lib/run-ptest
new file mode 100644
index 0000000000..f6d3ac23df
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+set -eux
+
+for t in config control midi_event client_event_filter
+do
+    if "./$t" > "alsa-lib_$t.log" 2>&1
+    then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+        cat "alsa-lib_$t.log"
+    fi
+    rm "alsa-lib_$t.log"
+done
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.2.15.3.bb
index 04976f3bf7..290d1fbb63 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -9,12 +9,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e=
631dd8edb7424769c7 \
                     file://src/socket.c;md5=3D285675b45e83f571c6a957fe4ab7=
9c93;beginline=3D9;endline=3D24 \
                     "
=20
-SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://run-ptest \
+           "
 SRC_URI +=3D "file://CVE-2026-25068.patch"
 SRC_URI +=3D "file://CVE-2026-56109.patch"
 SRC_URI[sha256sum] =3D "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4=
ac0c8970be861e"
-
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
=20
 EXTRA_OECONF +=3D " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)}=
 \
@@ -43,4 +44,22 @@ RPROVIDES:alsa-conf =3D "alsa-conf-base"
 RREPLACES:alsa-conf =3D "alsa-conf-base"
 RCONFLICTS:alsa-conf =3D "alsa-conf-base"
=20
+EXTRA_OEMAKE:append =3D " AM_CPPFLAGS=3D-I${S}/include"
+
+do_compile:append() {
+        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/=
lsb/Makefile.in
+        oe_runmake check
+}
+
+do_install_ptest:append() {
+    for f in control client_event_filter namehint
+    do
+        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
+    done
+
+    for f in config midi_event
+    do
+        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
+    done
+}
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


