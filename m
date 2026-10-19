Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EA5CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 13:05:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33953.1792415148507008469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 06:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gLv+zs60;
 spf=pass (domain: est.tech, ip: 52.101.69.31, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYun0dOZfHOSTl5DIXdNmyOJ2sAO5IgKgeWQ/IGQRL/YS7tcF1yYTMO0Vi7d9KdHSoMyh+i6e8gjlPM0S33LknnTbkpEXCphuIaMfP/tebPRoknLEfYneiJufaC6hs6taBlXGfLHdvPbyt5LLkWDYEsBNw/veEXbFoAugK6kdGcaiD9ThQehn5Tcv1WG4meVrIlErZQMDiixvzTnE3fiY6Oq2aMDTqAS93hZhv1aXo72x0XmEnauNhMXtoZFUR7TI0xo6EWlHX4xAJcHau/5JWIx2WZUDgckkzrlzHFK48cwNoHWvoD3FpdV1FK+jxSBKMT9f3DMkxFcIYXNT+LE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mWXZC3VOhXQCFQlaps4S6F+/CipneoR/17x4BUlv6k=;
 b=jPMzDXETuOp6bFDn9LBiMpwIoCT+7CzrHGDQ0rJec1RjdZlWamRP84+q9MY6173ixaPIDDf9UMkPtNRslQCxXW+3cXA0HtorBqgpTS/8hQHpUWtg4tRTIU17TclaRJFqmy4cVRUMpoxHC6MRl18lUBgLIZjd/Lkhmv8ZPN35GdlFGiMlZlUU3X5AEVEC3vDcnN2GboNDLGD407BiDSy0/c8u8fgeMMwKZTcvxrdbOBWBs7WJKdjzyeqqxGVY5ns89ggKgR58l6SSTnPWvuoAZHcIAWrceCFMGqNBZ2llbNxQtOlsVtoaBVKUppafjbKYIFAAFxvvXQqKEY6V/kDKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mWXZC3VOhXQCFQlaps4S6F+/CipneoR/17x4BUlv6k=;
 b=gLv+zs60y4yoFs8w+TBWIVBsJhgtvPdjWG7pFMx2v7mp9dCXyx8qVADSogVnw+VnR92jRjScJhkgRlzb0A4dGUV0xqbH5CeIqHOrR4JkIiemF+/B9vUGqU7fQqR6v/QQ9pcm6X93g8wCHjmNBp9LwO9v3HKzhnQNF9bhULo/HP5rEy03gGYnQTM5JwBAIq3aiogJ2Dx7jfoau98MMvPOrLzBR58A5GNSGWhtzOL6yK51FM1TA5AAjxi2Xc98BvF/oSebp8+lKNA7AwCGqHmwh+OCpL5DZtpBuixTbY3z4nUuq4EBSLFCNtgD0v+lWgFpa0wnLs5BUl1FMECxPi2SoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by PRAP189MB1826.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:29c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 13:05:41 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 13:05:40 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] mpfr: add ptest support
Date: Mon, 19 Oct 2026 15:05:35 +0200
Message-ID: <20261019130535.123457-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::12) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|PRAP189MB1826:EE_
X-MS-Office365-Filtering-Correlation-Id: efdc5398-b479-4652-590f-08df2de1ad45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|10067099003|12006099003|13003099007|260925022911599003|260925021911599003|260925021311599003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	V733wTEwUkZ+afBrb5QS8yektN9w60dEqcJvnnMGNUb+fkEyKjEkba+gDGBOLMgKCHdNiRs8Wfyddiy/2RMOm1BkXHaBxb58OyCytu7LT56pK7qaO6AWpvQh1QOUQL7bSrqUYTIgZBbZIXoc9rX7qw/IS9mtZyTTjaEpCorUy70Hp7WNYEpcAGHvRocsIzuq/zIwNmwbrIcyg9E0yBp/ZZgSN3aRtu3KGnOPKMm6JLd2bF0KwUr7riolBUpbRkslu5CGOS9C6x4qqMfZmg40wEeQIrfOHIyddgTJ0hkAOHtsLLo8Eq1EAatT03Fd816/lunNdU8yI5MYLsOCdBI3qvHGGjjEjnSZSCKGiiXRg9XiBYOfmg/tTD6eHlhljrAvjtCq932xCHNcNO4glKlS5EYzZWxqz0FjKAd36uaLfJYInc/JaOcPYGlRnqYcDJoYIUAba/xIB4Gfs10rBWLrEIFd264ri6nq40xoDZUoelzR6vzrsDwSH4tcEmBj5uhfcdM4gzFk3reKnBtBqfmxVCRvRJh4c1qj+pVp9hEeNLGjzkUrDxSbfUDeI6UuMsfAJlj0tJjy3L83o/x7fdfhysoAErZdnlpB9Kp3gil72wA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(10067099003)(12006099003)(13003099007)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b/qCVAXjV0b8rthK/kAh/u+HWjoV3bObLTZzAWlBjmb9iLPzFv/ymYGDx3DU?=
 =?us-ascii?Q?HEjM0/WLTC12ZwBgntlcIZX98WWiqGos+dq4JpU71LaPSE7UQwljNMuhXlIp?=
 =?us-ascii?Q?5458AQ387th9GWVzWNsQham4Ae0RiHQfrm4NoH5NONtz98k79wg+eVxlMmvn?=
 =?us-ascii?Q?vXMH4HoTSG/SMLe9/wOEOirH56cj7eaIKsEWLhPuAvB2S8CMtwMSE8/l62CY?=
 =?us-ascii?Q?roat7OEVGhE7U9qyetXxZNdadvvD87eXIOCym2VdfGPltBOcIb2BvoQ08JW8?=
 =?us-ascii?Q?Bf5l0haJqRTfZMsdc1WmFjfK35BS7honeIeQKXDs2Pe1eU+mQpujSL32KCex?=
 =?us-ascii?Q?1Il/Lqu45wQ0rAZvKEwx6O6Yk1z2NRyb4UTpiQ2MWWGsmDjK1/JjFwnlJ/l/?=
 =?us-ascii?Q?NDzXe2BO9RwWA1X4L7HOIiOinWvJrXwKrZ6jGs13Fhho7TDudcWJAp5KphKA?=
 =?us-ascii?Q?Kbjsdkz0mH34Db1J/QAFk3cKAlZOsVtNSIkPoGHibiyvTdma8WLhRCHvsGiK?=
 =?us-ascii?Q?yUwtEHjSo3gPVXHXlPHuVlSRSeqoZ4hoYLwjyh6RQi0sXOOZ8rEbcdcrqgq5?=
 =?us-ascii?Q?gEI0cf3hZlid5rTC1N5MHQ9s3cOBTj15gF5tzUNJkZKOE1K6/UXe25Ppuj7F?=
 =?us-ascii?Q?UhxBZwTpVrjU2ualoKH4sTbIuhuDfOXSSKDZvjGUQvheFuNDA3670G7QkXJv?=
 =?us-ascii?Q?u7IkFpRLj2xAU5h2nQrM7LmSJMsljLtTNoxG+hiykfD2plRS2G/sZG7iz/7y?=
 =?us-ascii?Q?x44Y/OEQpv420c4J8Ax2cU8RFtU2gbQX02+oLvMqUpSKhJSiHuwT4z0K6GlD?=
 =?us-ascii?Q?F6kVbBBYiiLjAPn1x4ljl20K3YalZNAXqITsibPUS+km6k6VKMHcAr0lC42J?=
 =?us-ascii?Q?QadrwfzZpNJLnBRjIeDfegqqV1HnMnKLu1ZnGa5KxxFl5wgZq0Yveas4yl0u?=
 =?us-ascii?Q?el5xTGFukV8pREL1RVlsoj9Niabm5SUqIiHBLEq8IMDUp6aXZm2bVMJ9BGlN?=
 =?us-ascii?Q?zVYphiXHVYe9OHE6T/hwsAth1KJQuRw1dKvLuUtClNlQmNprFSlxCdte0q7c?=
 =?us-ascii?Q?jK5cn8KPH6MjZAsntMjSFd05oUocIIjGOwqXwpb8ubi6bzZOHlEjeH1UZ1fC?=
 =?us-ascii?Q?Oh5JkHIXaRqbUpl/cWVJmcQuZyRwWCfAAp2f8fgFqhJl2pM1DzCOqCx4EWiF?=
 =?us-ascii?Q?pRio87Ic6BYZoclgcBBcT8BzebMfwAYHayIoIeedq9Nuefc5haKrbFBP2Xom?=
 =?us-ascii?Q?acr/fvUW4bwLkSWsJwBs6mlz+VOXspVntd5xoDrgErOZMlgbUUdyp+SEMayh?=
 =?us-ascii?Q?TWecRClRgTJ12ejovX+fbVodGAiFJxFCCn/zEsPm3DsHIIaI3BMjdRyMXi39?=
 =?us-ascii?Q?9sPZowQR394m/KHyxjhi64No4pPg7K2AjSc/Y7pq0vEwrfjjDtGXrBIS2grG?=
 =?us-ascii?Q?sUdQp7sOl22Lb3F363IZDyKwvnMohPVPQje86M43ImSkTZL1bnQScdvUbDp5?=
 =?us-ascii?Q?4Y3mevdAv9na/13VXHD79kxxNMrX1EV5/sJcFS9biRPIyhGU2D10scAqjTeh?=
 =?us-ascii?Q?ZbLpy9tI7lYWUrV03reb6sKmfi50K47Ol8yzb8ZiMAj5SQwDZbpzKUKU1k7h?=
 =?us-ascii?Q?cEGyW4gvRtbBBlI47W1jQAS52PBCm8uC6APQQGesMWuh1Ox6YrMa9i8Rat0f?=
 =?us-ascii?Q?t/ZUMEmre2wjMYbzN+4ViptDLcovMgjjfm5RKYvSUFCANLaHrmJWNdZ09pq/?=
 =?us-ascii?Q?+QGzhS0Meg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: efdc5398-b479-4652-590f-08df2de1ad45
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 13:05:40.8935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2e0pmMpA3EqVnzltGjJY1B4IcZB/tvi+MrtcYmz52Osizhhfb+841EPvwPKduuIRm9RZ4DENQ8H3U5d47hK2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 13:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248166

Build mpfr's upstream 'make check' programs and run them under ptest.
The tests read their .dat input files relative to the compiled-in SRCDIR,
so build them with srcdir=3D. and install the data files alongside the
binaries, which run-ptest executes from the tests directory.

Tested on qemux86-64 with ptest-runner: 195 tests, all pass.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/mpfr/mpfr/run-ptest      | 20 +++++++++++++++++++
 meta/recipes-support/mpfr/mpfr_4.2.2.bb       | 19 ++++++++++++++++--
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/mpfr/mpfr/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 518962cbaa..a77cf7f5be 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -66,6 +66,7 @@ PTESTS_FAST =3D "\
     lua \
     lzo \
     m4 \
+    mpfr \
     nettle \
     npth \
     opkg \
diff --git a/meta/recipes-support/mpfr/mpfr/run-ptest b/meta/recipes-suppor=
t/mpfr/mpfr/run-ptest
new file mode 100755
index 0000000000..ddc2e1845f
--- /dev/null
+++ b/meta/recipes-support/mpfr/mpfr/run-ptest
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for t in t*; do
+    # Only the executable test programs, not data files or libraries.
+    [ -f "$t" ] && [ -x "$t" ] || continue
+    case "$t" in
+        *.la|*.sh) continue ;;
+    esac
+
+    ./"$t"
+    rc=3D$?
+
+    case "$rc" in
+        0)  echo "PASS: $t" ;;
+        77) echo "SKIP: $t" ;;
+        *)  echo "FAIL: $t" ;;
+    esac
+done
diff --git a/meta/recipes-support/mpfr/mpfr_4.2.2.bb b/meta/recipes-support=
/mpfr/mpfr_4.2.2.bb
index 4d1747c3fd..6b48940171 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://www.mpfr.org/"
 LICENSE =3D "LGPL-3.0-or-later"
 SECTION =3D "devel"
=20
-inherit autotools texinfo
+inherit autotools texinfo ptest
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e44046=
4 \
                     file://COPYING.LESSER;md5=3D3000208d539ec061b899bce1d9=
ce9404 \
@@ -13,9 +13,24 @@ CVE_PRODUCT =3D "gnu_mpfr"
=20
 DEPENDS =3D "gmp"
=20
-SRC_URI =3D "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
+SRC_URI =3D "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] =3D "b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a=
6869ad81c6ce01"
=20
 UPSTREAM_CHECK_URI =3D "http://www.mpfr.org/mpfr-current/"
=20
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests check TESTS=3D srcdir=3D.
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    find ${B}/tests -maxdepth 1 -type f -executable ! -name "*.la" | while=
 read -r t; do
+        ${B}/libtool --mode=3Dinstall install -m 0755 "$t" ${D}${PTEST_PAT=
H}/tests/
+    done
+    # Data files consumed by tfpif, tinp_str and tmul.
+    install -m 0644 ${S}/tests/*.dat ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


