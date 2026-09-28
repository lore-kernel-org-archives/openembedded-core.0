Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F56CA5FA7
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:20:40 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55089.1790594434161010623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tLsO82qs;
 spf=pass (domain: est.tech, ip: 40.107.130.3, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU9q2BobcQpAlvOnJ2zNbUGhllBLXSp+Yc6JaoXNM+RwJh4kBncEowOO9DmIn8/jbKlh0/V6g2sKZ+iQXPE0k1gDiOdssLrrR/uc76XfF8z61BRGzX/3wSCartJTnKh21ywSH3gkgywY4In0trvfQsip97nnuhFDXgVkQvswYXlPKXHkjGKxPgvKMp+QAXHMA5FCrOV9FsvBEErZYz1yrdpD/szcTR3BEqegNYhih/gCcWRSkjCtheVLD4mw4I6X7YboEN5advyh6T4xv0m5Q9zmW//667vu5Qd/JgXhRtlAWXUJQxaXPqDj1290tbqAnwAQq2juzlKT3JcvovOQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA0XxNOBDmez9X5vn1y+Mv4hh3qJzIYjKK0yjC/J93M=;
 b=ddkt+u6BqdbbtbGq0hYeKiuJTSJ63Konhjtgqo5MKWwYsUlU2MiRQhZiGTrqR1D+AUXaoaymzTvPK4hWbzYqDeG8VDLWOR5N6O8SFiujh25+amE7wy9h6+Y9mpzCou6jjH0EkYNAsOm7MP9L1PtUi2NVfndED/jFUhznkdTdY1YnssmtIs2Nvx+PF4CNkteVruwV38Xhyd3pPgWYJhYsoYQQ+S/EMG9//c4/cZY/smX9F9X5eCQbCqq9pLmJJk96+S79R2/1t0cgZEer8Iqvi+b3oe8oCoJu6aw8UD0/K2zCK9j+zHMdA0Oxy5HwWHEhtv9WEwlfwM8E4z1ilFtNxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA0XxNOBDmez9X5vn1y+Mv4hh3qJzIYjKK0yjC/J93M=;
 b=tLsO82qsyEIFkY2RaR7K9izWgd6l4gTnpFQKeCFjevtrZu4q/TE5Y0jouQwhUKmSY4ctXHknUM1REK6rHRy8HZYCLPVcWMpwQl0pY/Q6usWVg9ghAlsaPWGxM0+KqJ5AZRfGaKWycj4uNkCfKZjBf0yN/aLnS7f3skDOA4xBkBvjE4fq5oe4hy1DmEHQTPrzfXMyXUeIgPI+VmWJaA26E9XaxAKqM7yztQM/UbHCCT3WdG14lgL6rOgdNhqMYraDacQKqmyxO0Nt3LzcKR+IYsfCarS7aOz/FCgMvGYT/mgSSQdZuMz51aBcY3yJHOWVKlbczxiPWtOkTOwU5l9hnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB0652.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:125::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:20:29 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:20:28 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] avahi: add ptest support
Date: Mon, 28 Sep 2026 13:20:20 +0200
Message-ID: <20260928112020.42351-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0316.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::14) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB0652:EE_
X-MS-Office365-Filtering-Correlation-Id: f97c09f0-5866-4a4b-9a18-08df1d527feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|3023799007|6133799003|10067099003|260925021311599003|260925022911599003|260925021911599003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pi23OrfeWcV+1u6Q/Kfxm3kYK/Z3vibPfy0CXzc0d18cWf5W38bbcGYA62+Gi+K8w7ldNa1T1NaH32HvgaG5bSHw+9xvVLypcnIqfuYOH4SltfJYd8gM+rSM76Ak2Nr1oXtGbVcVbqetSjd+NQYhKoiTCsKcupGzGFR592M63jMJFBV8x9e8iWvmrok/AFksP4oJPhnsQmipBPXaxGVCRbiyY8KlNAGoeQ7De10TpWfDy62a3FJ8Kag/p8e/c5t3eP4+Nz2Rey92WjVX98Rcsx4WT7wEBC2wyqyF2I9f5oBawSe7A2kTWcPFbHt4tk4Xna9h801mJnQopbYxKOisUwEkuSvk6DGHYjL3Wsv9+ZNGl+etfdiC0Iv8n31Lwlm0PFskKfc2Qh4J/lar2exKdvVgdS0CeDWQ4bgvrR1hWX33VUacS6RRW3wK4/5qopiQ/PmT1UpGOmOHzbq6GddBkqmOXJujwmsKz1yBzmXjLOE1dVtg1Y69aqDzPRgK14LoBbmcOLNXD30RlZ3Ll/09MshUcGhec9cYjgqwEyhpRSUSktJRgxJ51vkYZIUQrX2rqIRpOLrQKwExyqPv2GBqDd938S2MeQ7eVkDLESdGzSuUWiEybqS9Y1l/tJtkPQZX4+OF0765iljJ2YBvy/H70x5xqE17l/++1ZySB/QUMZU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(3023799007)(6133799003)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?adHJ5iVl0z1LE1LrV2STg7BTvlmUJlWhUrbl0YkAzhJvtKM+bKvLxkSnal9h?=
 =?us-ascii?Q?S5VjICa0P7T2yJxCbx2QCXw9S7DXVdczE2RN4PnH/6aqClIFNkH2VNdZSpSO?=
 =?us-ascii?Q?F+10hxGi0uWgxodhOajINUcNBTMH1PC46vgqI5lia6C4FoHKoxykfHUbjEDg?=
 =?us-ascii?Q?cmm37Zs2UAA5AgEWjmh/GzPcRBV9EDeE7yF/IX3/qIwRGWGRbFosZ0HA3oyO?=
 =?us-ascii?Q?71as1gBIrPZBYIQOpByNYsQPvd1RbmQ8Q+RGdUnp1YvBO9zvvkhFLFEDmh7q?=
 =?us-ascii?Q?e11GVgpUxCjI/wYj8bUd2Yf7LXPiu2COTH2xVI5Yn8lybw0tao+obMHwz6HS?=
 =?us-ascii?Q?rBhp9NBYC3L+jYCxDH7Qef8MfQJnDhcs9ZEd0rPFYvaKtKtbwoAcfzPtQutn?=
 =?us-ascii?Q?pnLSzGtW252WHgr6YbaDXjA+ahIHGwJF1jrkt7NerA3PgP9ofIyuLeSjANl5?=
 =?us-ascii?Q?Pw4+rskwso9e6IAswJZHmGGu8ioedj91ssYOnnY/bmWef8SsCWxiM5IEL990?=
 =?us-ascii?Q?wwaUwWu23gmf+ulp+b1anv/bstlUW1kx7g5VZRcPDjB5bKIprTSge4snTLDt?=
 =?us-ascii?Q?CZhjsyO3sC8aPMmO/kpb3enel4t9QqygBMKeqmnotgw056bprnTj9wWzir1o?=
 =?us-ascii?Q?8RZTE1Zul+oMUsmD9HkD+elsmasooF9xE78Ouq903SOgsK0IlGwYAZZZVV9w?=
 =?us-ascii?Q?vpUWQD6DiTkEN8J9YQWRAPImHu3cDXlbP5VIwrm//0/qYsMhK4f8+qqgQyjY?=
 =?us-ascii?Q?6/xHGp1gwFHQZIe/clYdx408HGIZbrwNbPYcY2uY6N+ZKdxDoRa987mw3bOG?=
 =?us-ascii?Q?e1a4H4mhl/wnrOQTCeXDvb0ITGN1BFIdjdU8BRkPDY99CiyYG0SV+yaB1PCn?=
 =?us-ascii?Q?1ao36YChu+fZyYP7WY9sS+5Rw6d9r7/0cIF1tnMG6/cZNivO5UlWfIjerxLg?=
 =?us-ascii?Q?qSl80/UJHy3CKTaw183aoxW1djtyQMNxckf1dIDKm9pdg9im4Ttz5FH+sX63?=
 =?us-ascii?Q?NZI8k66bOXcaOku+UoCSJHIK1CTZw+zHmx2o3lGMq4R3wxgoymtglvtHEu8t?=
 =?us-ascii?Q?dz1j3k/EB9wCpGNu02Us3aVD1LDA7JpsBCUIzHlkRSL1rQvI7ZnCuWXGrKwE?=
 =?us-ascii?Q?nCyXaOI9fIYIen5noQTx74BU/mdqyyfnYmIru0hiieHhMb7idc31B/S0m7qM?=
 =?us-ascii?Q?HQ7iHBX7tolaxgMPL51GI0Fy8Cfs8StmziSIc8KIkIEZ/OI5YUsRcP8cliaF?=
 =?us-ascii?Q?8HACaVUbqr7j0fiUqKOvOsAsrMIoSvVQEi9dExtYMUOfl8uHrXyLIJ1IBLXA?=
 =?us-ascii?Q?VjJf4dUUtN5uQjD46N1eXrQ0uGxW48NIRRRh3j/Fd/Fi2G1XA/tWDrVElH+R?=
 =?us-ascii?Q?w13u8801CdkoRo2ZfV6d2P/2+o4e8p1PpgLk1ifbaUiIQUvKxzc8JzQGBwhk?=
 =?us-ascii?Q?rEo0qAbaPKRKVj6ewJreLJd2FrVCFacCZuJqgnRYXqm6M6foD4P/EQ8k/sBl?=
 =?us-ascii?Q?Oy0ePL5slO+lyOJ2Q+uGoA60C7BLjLi2TPPOx34E2CnaWjKdHFYPb15jLets?=
 =?us-ascii?Q?lcEk1awzQW/Hg5beYEOm9wsNFEVl5wuFv0e17+rHmzGI7oHzz4eKynTzikyV?=
 =?us-ascii?Q?TFDxiCkghchpBWaG8entAdJxzZeZl3obw659rdoleidiZHIm9e1TYlX39sw0?=
 =?us-ascii?Q?/boVnZ2d2AexF81XpWhp2qRJmdm84941YrQNkT4bKs0Gd9xaXRFy3bkHM/u4?=
 =?us-ascii?Q?8p8MXTk4XA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f97c09f0-5866-4a4b-9a18-08df1d527feb
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:20:28.1726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZhmsEFI/P0LQmg8VvgWz56yVf6YeZJa3n5O+0ppQK9+k0v07Qvwxqpdmm72w08LxGrF6b3IbAdDBdHC2Ao0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0652
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246753

Build avahi's upstream automake unit tests (via --enable-tests) and run
the deterministic, non-interactive ones under ptest: the avahi-common
(strlst, domain, alternative, timeval, utf8) and avahi-core (dns-spin,
dns, hashmap) tests.

Tested on qemux86-64 with ptest-runner: 8 tests, all pass.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-connectivity/avahi/avahi_0.9.bb  | 31 ++++++++++++++++++-
 .../avahi/files/run-ptest                     | 12 +++++++
 3 files changed, 43 insertions(+), 1 deletion(-)
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
index 15189d0906..ff8d5ceb4e 100644
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
@@ -79,6 +81,33 @@ do_compile:prepend() {
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
+        d=3D$(dirname $t)
+        n=3D$(basename $t)
+        if [ -x ${B}/$d/.libs/$n ]; then
+            install -m 0755 ${B}/$d/.libs/$n ${D}${PTEST_PATH}/tests/$n
+        else
+            install -m 0755 ${B}/$t ${D}${PTEST_PATH}/tests/$n
+        fi
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
index 0000000000..3c675d5eef
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for t in *; do
+    if ./"$t" >/dev/null 2>&1; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
--=20
2.43.0


