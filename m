Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCC4CA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 07:39:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4314.1791358752481420865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 00:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YktJ8OUp;
 spf=pass (domain: est.tech, ip: 52.101.84.9, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPYI+Ci2yILn3IHz5zH9ydRB8rAqgsKt+Chx2rBewdOxQ6Tl9o9FbssPg/QzAgsLWzhdSowevGf57jJFUIh8BgsxFk0rviPf1bUP+uYQx4zFt+qGhb2pTcKYtUMFUvA/hYHtLaI5c51hKoPm94uYOtq4YroyCnpKlHxR9ufdhPr8tcz95qY7alSAeBlJ8ZDgqe9gVdJ6qYPVmhh5z+X8fxRHkR4NFUe1Ii8B1EiHCoH4BbOT/gE3x6Ofeian/arb8m1nPI+J1oNJlL7+/IkkduTj8o/OcTLT4A76ZionNaIofX+oYjdd+iATetw3JByHy7HFEkCxuV5f0jnWQSFpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZNJVTVE4GW5y4E721CQ5972to5nzV1CP/Wjt/PjzHs=;
 b=nyMYDB8UVMo3K/wMFhvn3dj+n6UC2U2w/ZiGU6ONyLwdk3aDz84C6PdpMYH/8Flq7tx5iaW//+gQFNCYZ8foFL99nBPfGleUCUrTjCjd0OwY5hTSIR04h+p3cgqiC3w1XEfD+Z7INwIv00vOsUq5QDKc2kpq97MAzpgNrZNukxJFRk/6VJmIe27ocI4HjdJ0RyjsqE9gdR19SzAODlSEbzVqtAsX+xiHD4K+aoRHu5tqsL+06xf5TsX/2pIPtnjvGTZKNwNjPbltFUCD8ojsMGEznj9n8qNMD/dui8bzArNx9bpIvnzbz8kD+tCtUm5EJysv0Pqq+WaB84mCuXQQ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZNJVTVE4GW5y4E721CQ5972to5nzV1CP/Wjt/PjzHs=;
 b=YktJ8OUpHTdy2ukzvhDQTT1Z9fhjajAhicWd25UKiPW1zttfJ4xQmMQR3Nj0inVzRgNLxtRiK9cYAnfnZNEHHhyJ0elhg+4oTCBROjRUJydfKcgpbOlbVpWZLGYOQn9sRrPjN35+m4E2MdlmFY4Iqh6gBVTNut9Cu4ZmP76AvIYCNCK7o1/hCjtanNSQgcvB+ps9ZG4Z/QAUl+1U6Uwq5WSvNR8pFY8wnO0U88HuEE7sGa1yPLuX1ueUO65e9FHPlgoynPmnkJj4ThVaD8wl2qeFv5KfNmUPKic845wid+PzOUBeSaXW+cobcAwHgcFU6Mf3Gx/xxg5VHFSAUdH9BA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS4P189MB2254.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:582::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 07:39:06 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 07:39:06 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] avahi: add ptest support
Date: Wed,  7 Oct 2026 09:39:01 +0200
Message-ID: <20261007073901.11008-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928112020.42351-1-pratik.farkase@est.tech>
References: <20260928112020.42351-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::15) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AS4P189MB2254:EE_
X-MS-Office365-Filtering-Correlation-Id: b860b2eb-4720-4e01-78b0-08df244610f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|6133799003|18002099003|22082099003|3023799007|56012099006|260925022911599003|260925021911599003|260925021311599003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Dx3ow3SYBzs4PQ7fDZ5FUEGJ1AcicfEIq+oRB0EXX0S2slCjzp52CdhcUlw5AT3EOD6asYg6Np09w9//aLPG9V72snneOrSYqdWKhsP4pbOdJmdDhW1dRma/xHoIZHLffcK60BOjFAmH8YQeSOm8kvie5Ev1zrJuu3VzVONIdGjZMpu7Ju+NgNJSivLjJjQFg8N3cuTklbdDlgXKQsOcTNTOOP3iwJ35Re5shw78JeDEpe0QyJh6E3h9LAMdajn6lL+u38SvdTPNJ60ApAgZmpDk4OnPKH8f7b78Gv6EUVBhfzkMQ7mA2rC7beih8VNBVkynAOA3HgWc4Blgdnw/4P3vB0D0CAQAzROfKOusRSVgteCfFf3oddJOGKqoc4csOZ3HHV/MYD6lyBHBYgx8WqN+2ScsrwtBH+JQhjwOkLEdAtVbrl7SJ3jCPBgrp+VcY7v79yNepEg6P1s627FOxjJsVAqKh5a21fzgCV4m55VZUTrwtxcfvY+LTnJEazaj0WG0PjmlCNTZiah0rrpHimqqUb7yoOhIKpxwUCiHLmPsvyF6qRXTSfZrXT21PvQTI4IK1fbk/E53zM49r6eIDeYMTiH03Ty4ISKSp6UroB9gMF1QcpboKV0E2S/d2l1kl/DhEbRpJyfhkzD9BQoNYryQNPGsxjARqiaFYe0PXYQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9p9z0cER8Inm9zRx8YxEMh4QNUMxlDgPSaOKYlV0zE3VAfQSRfIkXPNZz6TV?=
 =?us-ascii?Q?kk4dMm3lO+fuUOYgrlfZ0f9e8Gg/dYoEu5Llp0L4XOLb6ML2zHfzeMUeTZ84?=
 =?us-ascii?Q?zvyjVvrN8s9PDoukf/Nh3JPEG+3teocC7nauv1VM4CJKxkaCuDw1vWs/KzmC?=
 =?us-ascii?Q?oJuOWfFqd8k1Gm4PiRcg0gDDt9/9hsWo1S/R7lNzJP8GskRkV85M9RYsnLe6?=
 =?us-ascii?Q?7SsB3FY7a3wFldXMKBZdrq5VdzIz67UHzdVFyV1AqyiCmNNJnGXZOC1pwpVO?=
 =?us-ascii?Q?rxNBYEw5HlGKCw6rV9/pDO8BSZfTFAf7FfC2zwBSlGP31J/5au2eeXTyXWfs?=
 =?us-ascii?Q?H6vbnhE9Ox5au0NS1Ejl5kDQ3JC3PATVhwau7q9rpxPoVLUumbtyRYCEjUZJ?=
 =?us-ascii?Q?qzQqce+bIYFJHv1j9BspyDCIKV7sHw/ffK2mjR8nvw2+cMHciJTgrOt/Yu1Q?=
 =?us-ascii?Q?S3CTjLgDrQucL6/9WbAtYMVTOENwqgvFFYh+1LYAo+qrd7jVtifVnSe4DLZ8?=
 =?us-ascii?Q?cQCqi0qNkOq1NPCqGL/xM/osPXEEquhIsrrKomUqA1XQH0vDcajJa/6nARfe?=
 =?us-ascii?Q?XBtyK7THwXkpD2E7tLKMLuWT8Bnq8yKbq/VuPkLDSR8cxaamBQL9MaxpYBaX?=
 =?us-ascii?Q?oGfexymT2C5RwPj4fB8D5eHSB0hhOBtrgSUWY7KJI29LaEmA8mm8Rsw3sdqZ?=
 =?us-ascii?Q?mQqrhiA7k5LFsprIufLOvJFVSGFRrHBZJ9iFvxbrf06n810O+ZK23Un9SSSa?=
 =?us-ascii?Q?WqMDrHHif6yzbTnv63K2ZT5v4s0C1XFoNN2nhHWg1Eyrou3CQ7bTk8MolKwi?=
 =?us-ascii?Q?P/AYG7/t5GTh7uvL+FgrecbUAQBibjbt2C57+IqU3jX/PnjidRDexEISfOPZ?=
 =?us-ascii?Q?Vo4dPp9b1dEiwRhdGMNBzWSImWjGJpfZnBMa7BdbbWWu5pyArlf+gih05JjH?=
 =?us-ascii?Q?HtWLkCPsGD0/pZha1bz05oZ9xpqNi1g21HhDgkNN9Ur/IeQT4OAY1KF/E+oe?=
 =?us-ascii?Q?7mBHuKVsuHt/OMea1kDzPzdUlFMY8sCeBXvKRBKFtszFnHzkO/1ro8yL9Q/e?=
 =?us-ascii?Q?RPMwNny6GadS9Dh1+v62gQdwna7LnamUhN5V7b9HnoD+fdc4EjnjzUVMn13t?=
 =?us-ascii?Q?7j+MfeLQ1SkAuSdAjcjR0m/f/YrTHa7DpqFGG+qEH5Rl7Biog0gegpTItnFD?=
 =?us-ascii?Q?HjHQubff+lyxxL04sfJ6++DAjs5ym6lNGq1/xwv5CllnlFj2Qj6089r7zSUF?=
 =?us-ascii?Q?UotgrHgcRisg9pNmLYo6DRs17qhVrwmwCwSs/HqOqGUZP4uhpLl5gnpVjK2A?=
 =?us-ascii?Q?zITwcU/WIaDla7c4GdSwOfQ4hHwAr2Yb3JWJXPWR5FOJzTTTmCbAXGHF+lzs?=
 =?us-ascii?Q?JmslHg4dpYW5a6a5z9939UHxrOQkbZyNeLtCGkjiGoE1hM0HpGc+Dd4CrzYs?=
 =?us-ascii?Q?HsKhd3FM71LKwvZlMbMSHwsmLig12X/5IJaxy79ygh7cJAjO90Ob660qVsp4?=
 =?us-ascii?Q?lbM5FsmwYIn1QENpFEoKn+I2RDCWPxdjoo8EGl+fSBAAHtPHAevbKuGSfiLW?=
 =?us-ascii?Q?AiUiilpJOtLkMGhQwXKoMCGVs2MR2mxBAEpC3LhCZ4RPZEmQhD9KpM2sDhVo?=
 =?us-ascii?Q?vm7ekgoQjQtR31CpUfsF/meKKDgX6/KikMnUQCirX8KQR9nOWGP8uKsOK73v?=
 =?us-ascii?Q?OlrPDbYXvClXA4jmJIHvrWesT2U9+cgeNKWOE+P3tLQnEaTPhGsp1dy30/31?=
 =?us-ascii?Q?esdCQ/bPrA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b860b2eb-4720-4e01-78b0-08df244610f7
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 07:39:06.2028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSvGBcqB5q4tx3OqBl6UQnHSJK6NT2YBUg0d7UUh/4E3Fbko4qWVNaSxJUpDDuHjxa1M6v8D5JI4/zCqT3jFYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2254
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 07:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247376

Build avahi's upstream automake unit tests (via --enable-tests) and run
the deterministic, non-interactive ones under ptest: the avahi-common
(strlst, domain, alternative, timeval, utf8) and avahi-core (dns-spin,
dns, hashmap) tests.

Tested on qemux86-64 with ptest-runner: 8 tests, all pass.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    Changes in v2:
    - do_install_ptest: use 'libtool --mode=3Dinstall' to install the test
      programs instead of hand-picking the binary from .libs.
    - run-ptest: stop redirecting test output to /dev/null so failures can
      be diagnosed from the ptest log.

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-connectivity/avahi/avahi_0.9.bb  | 28 ++++++++++++++++++-
 .../avahi/files/run-ptest                     | 12 ++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index cc9a3451cb..7d0a9148bc 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -7,6 +7,7 @@ PTESTS_FAST =3D "\
     acl \
     apr-util \
     attr \
+    avahi \
     babeltrace2 \
     bc \
     bluez5 \
diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.9.bb
index 15189d0906..92b3531fd9 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "git://github.com/avahi/avahi;protocol=3Dhttp=
s;branch=3Dmaster;tag=3Dv0.9-rc
            file://avahi-daemon.in \
            file://avahi-dnsconfd.in \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
+           file://run-ptest \
            "
=20
 PV =3D "0.9~rc5"
@@ -47,7 +48,7 @@ PACKAGECONFIG[libevent] =3D "--enable-libevent,--disable-=
libevent,libevent"
 PACKAGECONFIG[systemd] =3D "--enable-libsystemd,--disable-libsystemd --wit=
hout-systemdsystemunitdir,systemd"
 PACKAGECONFIG[qt5] =3D "--enable-qt5,--disable-qt5,qtbase"
=20
-inherit autotools pkgconfig gettext gobject-introspection github-releases
+inherit autotools pkgconfig gettext gobject-introspection github-releases =
ptest
=20
 EXTRA_OECONF =3D " \
              --runstatedir=3D${runtimedir} \
@@ -62,6 +63,7 @@ EXTRA_OECONF =3D " \
              --disable-python \
              --disable-doxygen-doc \
              --disable-manpages \
+             --enable-tests \
              ${EXTRA_OECONF_SYSVINIT} \
            "
=20
@@ -79,6 +81,30 @@ do_compile:prepend() {
=20
 RRECOMMENDS:${PN}:append:libc-glibc =3D " avahi-libnss-mdns"
=20
+AVAHI_PTESTS =3D " \
+    avahi-common/strlst-test \
+    avahi-common/domain-test \
+    avahi-common/alternative-test \
+    avahi-common/timeval-test \
+    avahi-common/utf8-test \
+    avahi-core/dns-spin-test \
+    avahi-core/dns-test \
+    avahi-core/hashmap-test \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for t in ${AVAHI_PTESTS}; do
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$t \
+            ${D}${PTEST_PATH}/tests/$(basename $t)
+    done
+}
+
+RDEPENDS:${PN}-ptest +=3D "libavahi-common libavahi-core"
+RDEPENDS:${PN}-ptest:remove =3D "${PN}"
+
 do_install() {
 	autotools_do_install
=20
diff --git a/meta/recipes-connectivity/avahi/files/run-ptest b/meta/recipes=
-connectivity/avahi/files/run-ptest
new file mode 100644
index 0000000000..5312c04da7
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for t in *; do
+    if ./"$t"; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
--=20
2.43.0


