Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47B8CD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 08:15:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32035.1779351320598096143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 01:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EMQ5tj+O;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/ZAYUqUIh3VOEP1imRMp7dLtUSaSx7o0cOCtiwaJ+/wloAM2W58pkhXA5mGSdiGJrDMr1wphQiPO4ILiP5bsYaei/8Y4HSHW8q541h81aCjjuWp8LtQMsE32fa3JyYFZ2Sj5NLCnrVwdQQodt6QD+5luHYHOJc4Aogdnw7EkWI3ul3pRVHifSR1zMLy0qhdZz295ohlASQOv+AMsXXfYVn6BNrPzKv02f36ougPA5RWLxmRYtilVwjTACwxVpSIDJqr21sMyOCrQU+RF9phGt4I4tjUagxV7oyhuMVRtdAfHCn9owZuEOi216cZpsF0p7aoDEJgvcAoPnXHQyxZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfrfreTRS40q/7Do3dVCB2Af+mrp8min+1vqG2Ezu8w=;
 b=THNBHPjGv6hmKKyJ7/Edfb2sFHUdJlAUY2qsXT6pHr3FK3DeEkLnCU8TZYit9GUcBFOiD/Vf2SvsOXZJuW5/puBZuN0qH6Xr+4mGhFvr3UoluKQ7MeCTgYIA/oSZpSHlctFHMc0/it8cL8PO8JHIKXfqzarEqzsSrJrid5ooj9UJ/xDB2NWDwQhNK2sO7XUYiho5rsWybB/2PHFGa+7wjRAtxs7R331Xtoi34MP/KVf9aUIhnw2F4kLG4dpQotiMg3Oy1T+CFxyyB61/ugwzxV2yVJt1aLvmURdrawvy5MyoLrta2OflmycR3hZai3VHlpQVpSSl+XYnZAGAzzf0Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfrfreTRS40q/7Do3dVCB2Af+mrp8min+1vqG2Ezu8w=;
 b=EMQ5tj+O7oVGWKa+pqzYGNpKxjedRc57ZPs4idG0mCd2wkt8v7YoALwbu3hn40HEf7gJHbJ+2bWrenhiSXc011V1TOENctFcPbukgRTw+fb2BUZw5JNwiyBenX0STMu/gJO7b7F6BsMjvwkY4UR6LrNuqXGmeALFnF6IjCOKyQp4G9GJTh474SSfDZE7+DqblRAbedSkRuUp2P4yQEk2tgNX8oznkOQU2gwNHMFs1l2JYpkzs4m259oICP2hsA2TTxsZoRrkEBDiWnNtFcwHQ0CMp1xupNnXjD9pIcOsVGXpfWcSuQOZbx1zeg7HpQpWhZ15D0+zg5mi5WKGfuh5nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU7PPFFB02F9236.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aef) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Thu, 21 May
 2026 08:15:15 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 08:15:15 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libatomic-ops: add ptest support
Date: Thu, 21 May 2026 10:15:05 +0200
Message-ID: <20260521081505.10423-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506080459.21650-1-pratik.farkase@est.tech>
References: <20260506080459.21650-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0234.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::25) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DU7PPFFB02F9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c8f478-036a-44e8-53d2-08deb71116ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	g0iQo8B7VAE8H23vn6K97nNOg2YS0WUZ9sp3s7IROAgrHbqRy0Rcd8Bhmn5A+S/CuZHE4FpzqTySGfHuGLpV+pW1ctBUdTfHIA3oSa0zekIU1/CoNbuOLZfWYgNCe0YP4XFb9NhLF6q+dzXluIX3yUBJUgn1dNlhRkPCnm7xGrbUW/4p9fgbRNj6Ipt03WILX1+H9PqGHlQ6JO53EtPNLjXZOiG9sUO4awlZ5wuLEj52+ShHmjqug5CsTcdSwzf9hTD1EnPhXghWSlH43aW8PUdF9GTmE9GRqnGxp/OTqVefiubCEXvEB1j8M68uYsPtcGAbchxqPw8+pGFFQpiYl+TD0jrFZHuPZTEkuPo3lsU8yihk2tSKiuCdXbX3dMEdzSNbZ7+PqiZPFAh/0qGLjmbK93HuzKYu2PWrGyOrq9relBaJG4FtbvYKZklFbqqGdB7u1txO3vwJM7K61ReA+wbjttsXveto6I3cAj2dCI2kPfkRflkx7QIyfIDuPOBWKoNhf3SAo3SiEZd2XW2F5ZduJEX3z9bEOsEy3MQcesn8+YUVps/lQWt2ZwRqKNyh1sqypvqwrgrIGD2n1fawEcEkisOqZMjXlDWEptwsjzNTZxBQ60/fiEk8rQGWBZ+b0Go6cpDqo+lZ0UGRxysk5XnaGfYOgs4wm6BP0ZY1prF/4r3AUMO6RYTdJcYyBsAt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w4e6AowpDQcT5uRkZmu6upUHNWH+7V1nrqykXpXHC2Orj8QBoL3ppBD3WMgo?=
 =?us-ascii?Q?Y8si1AwS7Y4pL6NfWXVpzKD95SzXQieKJUIxKZLeHesP7fyEWxrUPrKWxcFC?=
 =?us-ascii?Q?fJpjmOdD8yNApy5D3w04B9Hxx9oG9uy7J05FT64c9hiUYlpLEkR9wkaopz2g?=
 =?us-ascii?Q?+ChY1sKtrIc9YhCzELJ90mq6gNmbMzuEg51MJ3c5IBaD8PUR8MG0gFC51iMS?=
 =?us-ascii?Q?RYELp8sV6KF5mZaWfWViCMwlFP626ggb99y+rzVwxnsf6cn/Ra6v4DffPSEJ?=
 =?us-ascii?Q?D0mTA8tQHoXHPvj5IBuSL7Ja27B+CvOUELA4oCAaLBOWUHt25kJYGwj59IrL?=
 =?us-ascii?Q?fwhvHHjoko0JQLWTM1LaxyT+PBLzLNVY9cAXYtCr76dDZPCUf7BW2jzQehFa?=
 =?us-ascii?Q?rzDxpDBkxztuXL6T84LWXNo9bWwkk/4lR3VhI9BDXPgggVjoaCDCCoXppaHd?=
 =?us-ascii?Q?BlqVCRQgGy/r6DtI+FdoVQYwSGTE+BjT63yjHm6lUz3Yq9dl6AQtTTiZskfu?=
 =?us-ascii?Q?0/nvYyPvF5mmEo9GxGqCAoHAQTbEnGEhQVSv9Gm+DJyglM/0dxiTWeX5BSZT?=
 =?us-ascii?Q?+vsAYtJrUDcPXokIesueFO2w5mMvQkE/JSvq3qndv+q3+b1f6oJtvks86YaN?=
 =?us-ascii?Q?3ChUA2q/432xsDYd4nSo08DkzjApI3cRTLfemULv7TVBuD04QQF0PtGKqn9F?=
 =?us-ascii?Q?69khfkqy6+egNeMLqBzhmUaDvRI1wnCRsG6v6OkMmIypOsoU9vA59nY5Bxpz?=
 =?us-ascii?Q?Udk0S8JAqC89kr60Cu3iewftk10jwwNNhYiXcFtNOCUI9q4b8I0xU3I1RR0W?=
 =?us-ascii?Q?UnuCHcx2+IJDLpIG/nM073e/ogmkUq91z7zdZI23E6DvGJEDhno6I83zWZ5K?=
 =?us-ascii?Q?CNl+GCIeaGCR1OfGgORoCbdkz/ob/JnphPXqjkxQBPtfD97t0r31zrCuHNbx?=
 =?us-ascii?Q?+QNZ/adeq59gml1ui8vHqSoQzFvK59PpBoTfNLXicCX8fMm4aUvaAZhP9hgP?=
 =?us-ascii?Q?CgK6wfeR+fyzH1/MUPV1/h+w1oWhIc8cW0ONLSj53VrQ9X7Cgiv3C42sQ01E?=
 =?us-ascii?Q?Bv38AtkSpS9Wap/sApyHuDG7UCelkCSfJkQIsavkW8nZRdReJq55NG26Ep0F?=
 =?us-ascii?Q?+OEPnPNTey1E6wd4j6exFvR+o9FtNQuNQb18mtJUBpONea+MvqSojUTtlJEG?=
 =?us-ascii?Q?gk2FbSFDh6jb3UCRBzO7JQ46ofN6ynN4tth7pxIlIE4fpw8mAI4pUhplsnPB?=
 =?us-ascii?Q?1IFkacr92+cj/vFJwN7LDHe4p4IW2o9VSfIx6cfsDtYxn0S1iigauR9ctst3?=
 =?us-ascii?Q?RovwOSWJZI2rAPWmWNrDnR02XWI8fDhvaSzPvGAp9i40olzsIg5H9V4k+/nF?=
 =?us-ascii?Q?Alru1UMmOEhLIWFoUpcbabApSORFgBqK+2afS5QWzaoR8b3GpMbj7AEHqq9J?=
 =?us-ascii?Q?ZDvM+Ou7Fs0jaaSex10jyjee3hvTc2ylB3ixskMQR9Ccu91wBicY33Rzkdbg?=
 =?us-ascii?Q?mSmjhtVcsIRbBav+o9BdqLZOMQssNPt2fphGRKbBWwo4FzjKSuqG4BwXHQNk?=
 =?us-ascii?Q?ynNS0ipQZ2rpP4o2rfgV8xxgWk963t7xshhpbe9VNykNlZNvNtguQ8s9KsdD?=
 =?us-ascii?Q?wUowCzY6MHnW5MHv7M7IaNxc2115+/zLdjVySaM/G3JNmYs+TGBPWP3heqTa?=
 =?us-ascii?Q?xIf1rFKzBmhD94e3UIPPtJZvK9j9f6JYE+ETabTZoRW9zVNfCKi2wrRwN76x?=
 =?us-ascii?Q?ZQtGnUpxrA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c8f478-036a-44e8-53d2-08deb71116ba
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 08:15:15.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/QpK95sF+ocWKImWTfbQ/dQm1KZoLzh2Dr0r8BATatPKEm6WrqQsTVklfTN7GaDkK97yZwuAM3RZd3NCRtpzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFFB02F9236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237477

Add ptest support for libatomic-ops, running the upstream test suite
which validates atomic operations, generalized emulation, pthread-based
fallbacks, lock-free stack, and memory allocation.

Tested on qemux86-64 with ptest-runner: 5 PASS, 0 FAIL.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v2:
- Use makefile-getvar to get check_PROGRAMS instead of find

 .../conf/distro/include/ptest-packagelists.inc |  1 +
 .../libatomic-ops/libatomic-ops/run-ptest      | 12 ++++++++++++
 .../libatomic-ops/libatomic-ops_7.10.0.bb      | 18 ++++++++++++++++--
 3 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libatomic-ops/libatomic-ops/run-pt=
est

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 50b6a8a41e..5238013c6b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -30,6 +30,7 @@ PTESTS_FAST =3D "\
     json-glib \
     libarchive \
     libassuan \
+    libatomic-ops \
     libcheck \
     libconfig \
     libconvert-asn1-perl \
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops/run-ptest b/m=
eta/recipes-support/libatomic-ops/libatomic-ops/run-ptest
new file mode 100755
index 0000000000..355908b85d
--- /dev/null
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for test in $(find . -maxdepth 1 -type f -executable | sort); do
+    testname=3D$(basename "$test")
+    if ./"$test"; then
+        echo "PASS: $testname"
+    else
+        echo "FAIL: $testname"
+    fi
+done
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb b/m=
eta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
index c31ccac7b0..82adf417a3 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263 \
                     file://LICENSE;md5=3D5700d28353dfa2f191ca9b1bd707865e =
\
                     "
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz=
"
+SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz=
 \
+           file://run-ptest \
+           "
 GITHUB_BASE_URI =3D "https://github.com/bdwgc/libatomic_ops/releases"
=20
 SRC_URI[sha256sum] =3D "0db3ebff755db170f65e74a64ec4511812e9ee3185c232eeff=
eacd274190dfb0"
@@ -19,6 +21,18 @@ S =3D "${UNPACKDIR}/libatomic_ops-${PV}"
=20
 ALLOW_EMPTY:${PN} =3D "1"
=20
-inherit autotools pkgconfig github-releases
+inherit autotools pkgconfig github-releases ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    for t in $(makefile-getvar ${B}/tests/Makefile check_PROGRAMS); do
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/$t ${D}${=
PTEST_PATH}/tests/
+    done
+}
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


