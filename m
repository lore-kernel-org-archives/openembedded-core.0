Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDFBEE2091
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 12:17:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10250.1770380238651475317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 04:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=loJqcbhz;
 spf=pass (domain: est.tech, ip: 52.101.65.58, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbLTYusEuFcnTHn26JRbqMn81dxjjkMem2WoI9AcikzVUaYsKT4m3bByp/UHsAJN1BXuCE5+pDUzb+aOkDm26WB6vrkMFQRfT8YlZFxAgaZfG34duJ1Ct9RKots9VIjQV/5qaxBU4l2vCEc8DzTJIwhAY9cXBkCjyQQVfnwlkecua8n8cC7xJiDdI4RE47S+9J46p44Eg3goI0dKrXLEifCkyfJyGjkR5R5/mOSQHy8b43Wss+HgsW3kpq8k9f1Km8Zfl6iXYRv9v0iw1TyEEQcBqGEtHo12ToAHCPHNOoNC0fTkQ08Ik8pr7L9bYaPsepmyxLimvhBGEfEoeNaE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WojbiEyXDjIgGEFBsFcB8eXlpfEgsMEVc/06OMm8Ic=;
 b=MDww6tGm/iJfQku1b4wI0C6rxVXdLrblv/XKm0R08gU8lfEItyBcoIQwpjhHgTw2gJamuCSKf/i4k3NFWlGcusV+9b4lqXiOAxrWZwAYngLMzEtABokyRNZVJbWMvJAW7etKLb8bTt26j+kPwxox2xn082imBNJdZRznPVVXQHFR5gdlSlKtynRE8Hd5Xzm2ejyepNCqJZidwDMx2BqxbybEalwTb2lkPrTYFsOlsz2i9Qd/bbVRdc/lC1AezwbQ7zLqYAvAMe2msrSrKzo2haU3QcF7EKgzdZ2Xz8g4DnpOVR95QnrG0xVpJ/41EYPd0ZVtH3pc2Xerq8L6DFNHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WojbiEyXDjIgGEFBsFcB8eXlpfEgsMEVc/06OMm8Ic=;
 b=loJqcbhz+cLUZ74p7lEd5XwUckx39nayOTY8blmoxJV7a87FbIAR0t2jGtGsjj3x8g81rVq4oHgZMxxPwVmjHrb3Y0KYUj1XBu/vw6B3XbGwslj3tcL7wquHO1pyKD7TEZDKcGL4+XkMpw51H7TfytB2RGtjxuiwZQs8VZy0e9301Ar9oqvY9XZ6+CBZQQel+Ym3RaBibaoB3a5hIjGBmHSi18QbBT5v8Z39eEsi1rqnisBlawfw643eD1U1CXKZLoqTJdf992Qo7HJxiDMQ1grWleYhoeLkjaZ9Q7UMb6ZJgwjiWAWQcGIDfzr4x3tFm26sDTT4nptsQFcFgqWnxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by VI0P189MB3152.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 12:17:14 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 12:17:13 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libassuan: add ptest support
Date: Fri,  6 Feb 2026 13:17:09 +0100
Message-ID: <20260206121709.7421-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::19) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|VI0P189MB3152:EE_
X-MS-Office365-Filtering-Correlation-Id: 98eb0eba-a1c7-4b82-528a-08de6579a8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eb7CEhQk5jRyPNTDCIwwN12chTg0tLt/14zYdG7OL+t+1/++XCHhiB+j4tUW?=
 =?us-ascii?Q?qqGye7NdoKo+UXINnfqVipZLA6WPUq7AEJyJaXJmbFS0KCqsfw6yudy9KdFQ?=
 =?us-ascii?Q?lKcGDbz+KajCalC6PemFo8q/rhOS2O+m8g/kCsNOzZwir1u4LP5ckOyIHFKm?=
 =?us-ascii?Q?ypJnlTavnAZBUxx0KK7eEK5qBxgLaczv7tRbidK0mgeys1dKh2xotl1vPyDu?=
 =?us-ascii?Q?VTPyrscTETq7ixI9l3dSu0zKIn0hLC2XPolMk0FVIEiYXdxg33owAdJFVTX7?=
 =?us-ascii?Q?/8VH1deQz1ObnGpkWaZDgQcBDFQkDkCuTZPeeXFES6nablYzte3vM18xwLgw?=
 =?us-ascii?Q?+6LcXLQ/A+UKkBuGf4n+ZqzDGdNjuUXNYjzh/zwOOsQAKHS+0pSJ5mlmv0XV?=
 =?us-ascii?Q?0ckwoW+D7vuvmTEojMMNNDTPOdUb1+rCdkmDCEAtn6/Aq/QPaqA/YMvSTF45?=
 =?us-ascii?Q?5xw5yIMIr6Ed91RKhRGZM9Pzm1ycPNvnKtYk/QmVIoKn2QE0DqTc66xwqERb?=
 =?us-ascii?Q?KeH6197zGn2ze6gpHvzFb/JF+cDVL0Zx2AMIYsnWq6HMl4AXAGpqVjrvXChI?=
 =?us-ascii?Q?TfgKUTEC3+aVs3Kc9MNWcjM3eGWMhR5z5CfWuxT+FhIbHk4FSeb4j79plS8n?=
 =?us-ascii?Q?8A7pyQV0XjDNUpxKtPlSDBvibSpyO8Q7v1QUsf/JGimyxjco00V5R8uMpff3?=
 =?us-ascii?Q?nOsv0IYWR9xub1SAniGqsSY3YMKgmS+17q2cYJATCr6UzIkfeQ3ac7gGF7ec?=
 =?us-ascii?Q?d3NA1TnFnTVpEOA+uPaF/Y+nIHdA3mNJ07fuJHPHZvLe5VVGepzNowKqoeFD?=
 =?us-ascii?Q?Vot5K4QrBgTVSq5BM0Aj7z9G7UpipW4MngcdVexHcaAABin+iQyEs+NoFaMm?=
 =?us-ascii?Q?abODzH43dkT3EzR//Nc1kkUnolmQ6RwYTWQv1gWr9olQMXkOvwiY7MnhXIsj?=
 =?us-ascii?Q?e4F0Uxpg/MTaqGjM2NTHpRxR1zCS4/xOyLNcPvhC3SxwW1hZSNar4cY7YAER?=
 =?us-ascii?Q?npTbm26hrXKkFKc5Nd855Tk9GRXxtrE/NuEF7dJ01Z3s8XrrWHLFSLU1o/1W?=
 =?us-ascii?Q?I2og07WxWFsU7QC0NhSXfWWoO2bCwv4B1klAKMRndoOkCAoRs/OVQFx7WRcP?=
 =?us-ascii?Q?03VCJHMKlrPzAVhhDe9tBgcEPc3ObA8Uf5qT2cXqbECVtY4oNF7jEdLt4KVA?=
 =?us-ascii?Q?LEK9EIWqbjKmFayptUimHLy41hxWPZbXYUxxNNMvZzf4xMSiDE0XCVPJ/ftL?=
 =?us-ascii?Q?ljrPiwAw+Z0S09L8hx0fS/KcfnbUTGGMhvBoQ5qjp36gEIuRpo7h4HotiaKf?=
 =?us-ascii?Q?oV6eONSrdWdBqf33LUw94FIIRsjQI+hlVEwrpIbuoGOaO16dfAnepyYXc4mk?=
 =?us-ascii?Q?Tmy/xE5H1UF0UJGaYHLWVW9/Buk/e7lr6eL6+sLxCaU9YpnaYpKTH1zhgftC?=
 =?us-ascii?Q?ulOGqpah57lCeUizHmtE8+c9gt8upec6zBPdkepvFlpIOUwQVULr5mex+GIZ?=
 =?us-ascii?Q?Vk2I1Fzjp27QUu7RjSxnR93YdjceH4dkH7NOkWCnDIMWMzlkA+8K/7MuUGcU?=
 =?us-ascii?Q?+1O+dggz4nUHPZBNseM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J+DxZ+s8plsVuns69nN2+v3hdqm0oOMhnNuwGbZK0ZkNqcdAit8dGnp79Jel?=
 =?us-ascii?Q?TmrWuglI5Nyyo8rAMFnSMJb/xPIrBNA1CW1LDly1YhList5BIGwacfrbosnq?=
 =?us-ascii?Q?qQIrI/hofWejcNGdtV1oygiYPWft22MsAN8L5TUGEvSr0dxEqSm/2zF2NraL?=
 =?us-ascii?Q?bTEzjSEW8gbQgeySUhgTEluFGTp5ZLvWbyG3tSnG4RvVC/dhAA7/GPXwHJ6R?=
 =?us-ascii?Q?Jyhx5HNC7/v3h/W0nRJR58bTwaMdHQi6FViQqGfoO7JF/S4tuQxZuocMrCmK?=
 =?us-ascii?Q?5BLZS1aQiNHqBmP+FO7wcJVQk2wXSreJem2PSghjM7AAyr6fH69z/RARKRSY?=
 =?us-ascii?Q?qBMxAVcm+SEgu0q208nprH3bQh9SFJxq7fDPKD15ElPoNR12+AvnyafetLcI?=
 =?us-ascii?Q?i1F14Wum49qTF/L0yxGFSaI5hDmFiPNihtyUF7UduCDvLk49+3rdfuBW5Bq0?=
 =?us-ascii?Q?GHb6XlRJ0fS8034EOqqjxBwvhw1IaPUpGJW6apFfkFyJK4k8lFeM0Rx8zvek?=
 =?us-ascii?Q?GvH162z/u5tY2lg2vsEMyTNnfbUjqOJZNm1k1r0TpAT0kYJRjXIwphb4akPI?=
 =?us-ascii?Q?FnHhrWtF7XLmCDXEbv2+G6o0rBUdb8jgv+0OG7/Oxb2BUsoIJYPAw8yZgvVw?=
 =?us-ascii?Q?KtwPRHF3I5MIMm6haK1xbIoRBrENkfMre9ZItyRTQgDQAmYlwjTmiYDbsGWp?=
 =?us-ascii?Q?cQcqQooG3zW5KX+bUWNu5/lluF20l2mhEjo9nMTUieOX6s6jBNvuCQwrE1aZ?=
 =?us-ascii?Q?tvtr0laFeh9iko1zGAuQQG2TVq4cmbPAxHecKirWPp6LfSlqvXgyOt/KTGEs?=
 =?us-ascii?Q?udVxtRCqavwXA24oWDI/0nggf/zTstLPgk2sW8KYfAuL3IkqKrUec90QCxrm?=
 =?us-ascii?Q?CKP5GebYOJsoKM9Zc9ccpuaK0KJgkCKWjiPAmAmYtj4+4F0b742sN/q7cv6z?=
 =?us-ascii?Q?lSVNCXqDEy4jfPtWR961+WDsKjOMZBi70Dx2eX5WpfOmT8HkviZAk8IGHZJ5?=
 =?us-ascii?Q?G6BcQVKVsbhXQrvIDwULIBSTu71jEUoNaBaIA491edhdDN4ZhyOtAgGW0diA?=
 =?us-ascii?Q?4HABV8+m0onOYD42ecNw5oDAXMeapxd1pebJ2gww5WyCJvOTjdgeLRl6smMR?=
 =?us-ascii?Q?f1+0ahMxra99P1ogOZsto2I4no6sT93kyhd9hLtVq4Sp7L71VVIuYzjCiA5n?=
 =?us-ascii?Q?TAHwXn69dx/7j4gWHK8tZKb76BssWz1BnWZTCHL/D/wcBriRyDHuqumsWrsX?=
 =?us-ascii?Q?NgxLRIU4Udqy7qiDVnhMQZj7cXVRsJ8E7/NnmmP7PS2diSJApqLD3wz2l/HQ?=
 =?us-ascii?Q?y6FZU8qhJnjjDt/ZQlMOEvjKBWOU13i6kktUvts0nt9wVoxYg6kQyaLxdSxp?=
 =?us-ascii?Q?dUtCC809fNE8dNoSjFMoZnOGNy+QolD6IVoWkzmGEmNvbhP/vDVNH9HJqX/E?=
 =?us-ascii?Q?81/oU7lzqsl1VQH8nv0wPWuUDl400H5fD2Y5EVfvxP+MlslEKoHNwZo4PwyF?=
 =?us-ascii?Q?zeBfpQm1bvpbzfBcYFmPecRyNyOFTLKfUnIJ2vgfvu3tJB3Afz6rXSWBpXqY?=
 =?us-ascii?Q?Ok6nSdYlAiqi34XWlmS0PD5zC7flM4ivIG1fye/f7JxixgV19eatadCcdJ6g?=
 =?us-ascii?Q?CMq40Z7vPdx2ey0V6lQJXBUo3iDPMBjdcfTHu+t/VlGGoMaObXoqToAsDkZ5?=
 =?us-ascii?Q?cfcRU874rTlT6ryplOkRUZIMv2u+3d2yXLGwI15cXMWueUpgllCQ96KQ7lEa?=
 =?us-ascii?Q?f4rYgWRqEg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 98eb0eba-a1c7-4b82-528a-08de6579a8f4
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 12:17:13.5348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCTncLegJSn85HCf3e6kUt8FPJdj9yxLKE/RD5ATVeS3OvaJAXNeXtLJbJ1DMGMj5wMmbHmFzFnAPMjEWDXQ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230614

Add ptest support to enable automated testing of libassuan
using ptest-runner.

The implementation installs test programs (version, pipeconnect,
fdpassing) and the shell script test (fdpassing-socket.sh).

All 4 tests pass on qemux86-64:
START: ptest-runner
BEGIN: /usr/lib/libassuan/ptest
PASS: version
Received data `Your lucky number is 3552664958674928.  Watch for it everywh=
ere.'
PASS: pipeconnect
PASS: fdpassing
PASS: fdpassing-socket.sh
END: /usr/lib/libassuan/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Change-Id: I922e1639babf6b949286c769cd1d221168d7318d
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libassuan/libassuan/run-ptest             | 14 +++++++++++
 .../libassuan/libassuan_3.0.2.bb              | 25 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-support/libassuan/libassuan/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b9616e9bf4..ba4f99c04d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST =3D "\
     icu \
     json-c \
     json-glib \
+    libassuan \
     libcheck \
     libconvert-asn1-perl \
     libexif \
diff --git a/meta/recipes-support/libassuan/libassuan/run-ptest b/meta/reci=
pes-support/libassuan/libassuan/run-ptest
new file mode 100755
index 0000000000..ce6f975408
--- /dev/null
+++ b/meta/recipes-support/libassuan/libassuan/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+cd tests
+
+for t in version pipeconnect fdpassing fdpassing-socket.sh; do
+    if [ -x ./$t ]; then
+        ./$t
+        if [ $? -eq 0 ]; then
+            echo "PASS: $t"
+        else
+            echo "FAIL: $t"
+        fi
+    fi
+done
diff --git a/meta/recipes-support/libassuan/libassuan_3.0.2.bb b/meta/recip=
es-support/libassuan/libassuan_3.0.2.bb
index 0d2ccce989..9333ba1aa2 100644
--- a/meta/recipes-support/libassuan/libassuan_3.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_3.0.2.bb
@@ -18,13 +18,14 @@ DEPENDS =3D "libgpg-error"
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
+           file://run-ptest \
           "
=20
 SRC_URI[sha256sum] =3D "d2931cdad266e633510f9970e1a2f346055e351bb19f9b7891=
2475b8074c36f6"
=20
 BINCONFIG =3D "${bindir}/libassuan-config"
=20
-inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig multilib_header pte=
st
=20
 require recipes-support/gnupg/drop-unknown-suffix.inc
=20
@@ -37,4 +38,26 @@ do_install:append () {
     oe_multilib_header assuan.h
 }
=20
+do_compile_ptest() {
+    oe_runmake -C tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    for test in version pipeconnect fdpassing; do
+        if [ -f ${B}/tests/$test ]; then
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/$test=
 ${D}${PTEST_PATH}/tests/
+        fi
+    done
+
+    if [ -f ${S}/tests/fdpassing-socket.sh ]; then
+        install -m 0755 ${S}/tests/fdpassing-socket.sh ${D}${PTEST_PATH}/t=
ests/
+    fi
+
+    if [ -f ${S}/tests/motd ]; then
+        install -m 0644 ${S}/tests/motd ${D}${PTEST_PATH}/tests/
+    fi
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


