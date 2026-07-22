Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA1EC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:40:14 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46962.1784724006362183369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=mIA4p7HB;
 spf=pass (domain: est.tech, ip: 52.101.72.21, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlhmsIIv9PHW64aYQwjkKsaQGAGodQ/M2PfStDoVj7c/HIHVN9dnQql3B9NCjIKfAWOD9wwHQv36fgab0Sjt4iaLMBW6HvxOm/OJGUdRpliw7Z39oJQG9Pm9K0Tx9tmeiACrW5VO3Jk7VhDaADZXaGwYgEx/zPVNcjf0Ybj0bwtGuyuCt85efhqD8WRYNFg4gMpIWujYRX+8ZhtVwcPlUfs1WPyfo4RcrbQWAWJ12dxRVRgdqwWzgc8twuXNqMTwGVkHq7R8oGQY5by1mRj2F64GAHCQslcxRctmOzNj8/BNQrVJgftZrCpdazPb62a5BP+JVpricCyQkDPwkLypfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzQp4kolcw2jdF1TvgdLgqUPla24NKy2JXb41t7CSRo=;
 b=ZL3TP4IBex8rxZBDJMCcE1+c1MsqilNPIf2WckM6AsChrEKFgJYRFHXkOZf/O+z2KV+603EGMFejf1w7nie36VYbchaMB1R1rhcRrSMS/lKnX9+INaXXDguy0c20bFDvn4VHknND7v1moS5Mz0RyKQrMLBeYVwEsNiFGESsIz5UN8Dz3usT++d3VURh6Qr9/CKAfUwUEYzx9dISvS2+INyzRGYER+pqY4zKxotxXj74S9ZvE769TKldXP8EJWvu0FmRQLLTqTdzfR5f4bEHihKp5blNQQOT8qoKhj5rF3TyVs01jgLf2nDOeruLbi6Dg0cDDpTNSDZ28uH6wry6P6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzQp4kolcw2jdF1TvgdLgqUPla24NKy2JXb41t7CSRo=;
 b=mIA4p7HBXPl2D4/Oxva62nMXi/3KNj1sZDPcWrHX82t5zqVPGVeL38rK7GRFhKcU/XOwijLgkLco51iGWIhign1PVMVCPQFysISUewMpSkc0Jj9OG/XmZeVz1hQEwLKkBs0m1eQO/naQzJCsx1knDiCIvfencq9BF8eHZAUMjexOWN9Laq71vnmTvECJaPx3nGBy0+jskSL5uxWudyWLGpUSYJeDhcu2TmhGLfy9E08WDhA/nfPuD4QIAzLmVEE0h4kmvZzjdGaCpQ4rrDkt73oskiWYLhNpov7Az68xkGzA+6IVkGGXX1JFHe67le4Hv/MlsBbuQHakRnOt2sBE7Q==
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DB8P189MB0649.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.4; Wed, 22 Jul
 2026 12:40:02 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 12:40:02 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dkelaiya@cisco.com"
	<dkelaiya@cisco.com>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 1/4] gawk: Fix CVE-2026-40467
Thread-Topic: [OE-core][wrynose][PATCH 1/4] gawk: Fix CVE-2026-40467
Thread-Index: AQHdGcAleB3zdHPfeU6FW57VYaZSD7Z5et9v
Date: Wed, 22 Jul 2026 12:40:02 +0000
Message-ID: 
 <AM9P189MB173150AC70518D7E75A517D0F1C12@AM9P189MB1731.EURP189.PROD.OUTLOOK.COM>
References: <20260722095430.1416791-1-dkelaiya@cisco.com>
In-Reply-To: <20260722095430.1416791-1-dkelaiya@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1731:EE_|DB8P189MB0649:EE_
x-ms-office365-filtering-correlation-id: ca7b03f8-1efe-4ac8-4440-08dee7ee598b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|10070799003|376014|1800799024|366016|38070700021|13003099007|56012099006|10067099003|11063799006|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: 
 neop9+4oa4xwpLenpr3Vh1KIL+oTrXauRfy9rxP2SGR1YQKfgA9hOaKfoydTIpEpgScjGNdQi2OTxqpVWUEfjlGeJT/WGZDSF4OMovxiT4TPSVnQSu5BiPShZaenZKYIY5y1lqCiBKRggX0jBA6htk205FZwcM+PoHKTeBcIZcYCL5f4Bn5r3uxK6iuKhDJr4ZNdvdVqnNGZE6LqwWhagOfRPrdusih+nqQnAR1WLBQ9Z6Gukb3BuvTOCyEbr7qcR3p+Ngj9M7GA2ZPYvvx0w5A59j2ISDaazZz5W3tyfP54+lK+mjtkSqeFuF9dDc18LKUEr/gNbo+nDVq7ryV544hO8xL8I7MfqC0XU4aI0HaL0WxwU+cDsUal1NTo8lDpldQviaVevFasujNvO1JUi5D+/JYPrtS9bTmReXXUKZLv5g5K0CKv8sbhuc29P1wm34S1isySF779j5AfADIXxFPdWQl7N+R4LMc3mieat7recIgIAClZCkKeFMLNLBUxQq2/Aq734QxjdHWj0vRE1N1hcBBJmNBMi5peXiiDeMpL/57zwJXKy4otsNNyglPmqTbKZkrSHcmKvRdcM4uUmB2xdQpv/EuHSJLrBGswKb8LuTAu208AxfFisZSNJGzkrQUJr6qDglvojSYplYvzYqYDn9NvGq60rR0Rvpmn9lE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(1800799024)(366016)(38070700021)(13003099007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?0S+Ur34HbzC12hk1VOSxux46A8N4VpsbRBtcuFTvzuEoJC1RhYffaJagOM?=
 =?iso-8859-2?Q?VlAnxe3OZLXOz94eClZHsBxilyk937pZp61fUYG4FYOHJf25wtdjX21c8f?=
 =?iso-8859-2?Q?lmoq3C0EOL6ro9PuSafHjNGhdOsf06UIaAfW0WXK9boE2ScWGYZPfP8DvZ?=
 =?iso-8859-2?Q?7vUVNI3s738hb+gjeDRq9eD4A/cKrHiXq81GEgziVaLhoiLjO5v+eW1X1Y?=
 =?iso-8859-2?Q?BhRkUR8zJYeM640iZhJcCvnVI2LT9w11nYrZiO0KsyR8FQh4QlKD56YwGm?=
 =?iso-8859-2?Q?LBAcwWBL60K95RtMQJehru5V0yxNIRX53XAzaSguWVCtX3u8Ei7c6H/nmI?=
 =?iso-8859-2?Q?7gIJPGuhmaRXwKaloJ3segSqIPeFWWQjGXvKyWD5+Ox4BVXjuU4+5Uq3Yh?=
 =?iso-8859-2?Q?TPIfvjiTjWMBb2THawU5UcIs29rF1SqxEoVsaqRmcPQYQw3WRIxPC4Ukr1?=
 =?iso-8859-2?Q?4GnhQYmZ3eUesLMRNPaMp4msYJvTuUL4uFVtnArah9TJqtkPJiGF5jomZX?=
 =?iso-8859-2?Q?SIYa0uabNkXNCAALEq8fMVZKVg5vx5p5LsfJON9wMgZTWW0EfbOFodEy0j?=
 =?iso-8859-2?Q?nmrevbphG+oXSZAuDIdVQBrOLqYeX0FLRWKzaNL9rEI242bBavIWSfQokQ?=
 =?iso-8859-2?Q?DTfHXHlzIxMjfQPuifWNnoc90VBlusB1EMwLOi0LEUuJaecFH4JX0UkPpz?=
 =?iso-8859-2?Q?pHxo3BxNB8AeEnHF+awWXhsjMj03tgWCF5COySY6pI8SaTJtlJPOFR2oY+?=
 =?iso-8859-2?Q?3wzFAJUkngfYURGfUX94SJVh0wwRtM9uXJSUAo6Kr3KbbLBxNupNr3D4p0?=
 =?iso-8859-2?Q?3hjM0zoh20PETyFjoc98En1742N5T+V5cjXFRIe6JK+QymEVNIEDs0YQkC?=
 =?iso-8859-2?Q?D9YVZIAowtlFNlL320gHZ4PZ5aqZ7MxDDkNEYj3wkybWFQSlwlYHEuYa4y?=
 =?iso-8859-2?Q?6mbouGmJaTiEHh2h2v+N67ArzkV2ZrJ7RIxhnPRLKMwx9sw5zWvRokEc4J?=
 =?iso-8859-2?Q?j0UYnsW1RMmVJNyBXY6SoNPGstNLEPo7gtQGt6FoS9iugTWYTuq+gmgIZ6?=
 =?iso-8859-2?Q?ql+oioDTP4tycKVe2inmAJZ0v2FJJhXOPAO6hKOXAnEhc9A2m6eR2ewJDR?=
 =?iso-8859-2?Q?qpXNmv+mQrUFrbgU7dlwj1+SlgSlaOFX9l+VMdyy2hlbaUiEM48+kF47e/?=
 =?iso-8859-2?Q?vSSfAuIXklxZsHaidFdFidUYx482a2t72MJI2h2BzR+sMn/oOdhGTAH14a?=
 =?iso-8859-2?Q?7/Dx60xV21p/oLBFn4/QMv9+s7HSxztqTguRexUwSmqip2pdOct/VuGghS?=
 =?iso-8859-2?Q?YbjEqaR1M3Ppbyb25cz5p2TxY2EG0N44UHwcR9glcblWw7/m9/ri944juG?=
 =?iso-8859-2?Q?JHZMc40wlE5JlJ+B9s9brra2WB2n9p7Pt7C08iX4amxyiI2GFVGJAlZ78M?=
 =?iso-8859-2?Q?taorcwW4kM3/NlLHRvUJ66EBzivfZvodAHNxl/B54/58N1nPvJkTtYe0oS?=
 =?iso-8859-2?Q?pR4HimOmTLO3RV72NLR1WuV8mOVoAYscKjDkvXhBH4JwXOQ6z0B5MECwDv?=
 =?iso-8859-2?Q?WqtF/NR9F+uDFZKm6tuTNTQD2Hh6mJMuhziy5pNwYrog+J4aZV179Bks9k?=
 =?iso-8859-2?Q?fDO//qSqcbno1ojNtZZS1rGCJXRiVcP7hoEL38b1Otnwd7hxbqJ6JSTXjx?=
 =?iso-8859-2?Q?fMCrCVMzw8BVR7MQBn00IB2MfKtAqom+RgeLcMv39X2n7rU64dD8gXKEjr?=
 =?iso-8859-2?Q?ZJheWh8Apw3S+wWZR5nRo6pjA9TU4DCk4UYg7OM5KBpvLSdMuj+I7mrA4s?=
 =?iso-8859-2?Q?OpOPA62QZFcjAcbxZm5DdSfiKiuC2dpUdtrfZEUPlNH3TWtYEMKYsvzaH3?=
 =?iso-8859-2?Q?PZ?=
x-ms-exchange-antispam-messagedata-1: r/Hgy3l+23t5ZQ==
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB173150AC70518D7E75A517D0F1C12AM9P189MB1731EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7b03f8-1efe-4ac8-4440-08dee7ee598b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 12:40:02.3492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+gDsNQ/+Eo4Jzr9TI9JQB93ZW1amN/EFj6omhjlB8lPr9BnWeUY/77IjLqGaoh7jowZ6DmIZ2LzOwPYCx3tk9cyLXpP147NK5+pI9xVNAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241683

--_000_AM9P189MB173150AC70518D7E75A517D0F1C12AM9P189MB1731EURP_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVAT=
E LIMITED at Cisco) via lists.openembedded.org <dkelaiya=3Dcisco.com@lists.=
openembedded.org>
Sent: Wednesday, July 22, 2026 11:54 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: xe-linux-external@cisco.com <xe-linux-external@cisco.com>; Darsh Kelaiy=
a <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/4] gawk: Fix CVE-2026-40467

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit =
shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Da2d18c7410=
9e41bec29a23098eba2e00057286d8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40467

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40467.patch            | 62 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40467.patch
new file mode 100644
index 0000000000..772172c373
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
@@ -0,0 +1,62 @@
+From 194a2884f21a6fc02c446ca4e2dc9107298832db Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 3 Apr 2026 12:02:11 +0300
+Subject: [PATCH] Small memory management fix in io.c.
+
+CVE: CVE-2026-40467
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git=
/commit/?id=3Da2d18c74109e41bec29a23098eba2e00057286d8]
+
+(cherry picked from commit a2d18c74109e41bec29a23098eba2e00057286d8)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog | 6 ++++++
+ io.c      | 5 ++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index a714ca1a..517aba91 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
++
++      * io.c (do_getline_redir): Don't DEREF redir_exp too early.
++      Thanks to Micha=B3 Majchrowicz <mmajchrowicz@afine.com>
++      for the report.
++
+ 2026-02-22         Arnold D. Robbins     <arnold@skeeve.com>
+
+        * 5.4.0: Release tar ball made.
+diff --git a/io.c b/io.c
+index a3b877c4..7a547aa1 100644
+--- a/io.c
++++ b/io.c
+@@ -2853,21 +2853,24 @@ do_getline_redir(int into_variable, enum redirval =
redirtype)
+        redir_exp =3D TOP();
+        redir_exp =3D elem_new_to_scalar(redir_exp);
+        rp =3D redirect(redir_exp, redirtype, & redir_error, false);
+-      DEREF(redir_exp);
+        decr_sp();
+        if (rp =3D=3D NULL) {
+                if (redir_error) { /* failed redirect */
+                        update_ERRNO_int(redir_error);
+                }
++              DEREF(redir_exp);
+                return make_number((AWKNUM) -1.0);
+        } else if ((rp->flag & RED_TWOWAY) !=3D 0 && rp->iop =3D=3D NULL) =
{
+                if (is_non_fatal_redirect(redir_exp->stptr, redir_exp->stl=
en)) {
+                        update_ERRNO_int(EBADF);
++                      DEREF(redir_exp);
+                        return make_number((AWKNUM) -1.0);
+                }
+                (void) close_rp(rp, CLOSE_ALL);
++              DEREF(redir_exp);       // we're about to die, but what the=
 heck, release it anyway
+                fatal(_("getline: attempt to read from closed read end of =
two-way pipe"));
+        }
++      DEREF(redir_exp);
+        iop =3D rp->iop;
+        if (iop =3D=3D NULL)                /* end of input */
+                return make_number((AWKNUM) 0.0);
+--
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.0.bb
index d7211f28f3..59c4cb2536 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] =3D "--enable-pma,--disable-p=
ma, "
 SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.pat=
ch \
+           file://CVE-2026-40467.patch \
            "

 SRC_URI[sha256sum] =3D "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc26=
8ca428a90b4ac1"
--
2.35.6


--_000_AM9P189MB173150AC70518D7E75A517D0F1C12AM9P189MB1731EURP_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Looks good to me.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reviewed-by: Leonid Iziumtsev &lt;leonid.iziumtsev@est.tech&gt;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Darsh Kelaiya -X (dkelaiya - E INFOCHIPS
 PRIVATE LIMITED at Cisco) via lists.openembedded.org &lt;dkelaiya=3Dcisco.=
com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, July 22, 2026 11:54 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external@cisco.com &lt;xe-linux-external@cisco.com&gt;;=
 Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<b>Subject:</b> [OE-core][wrynose][PATCH 1/4] gawk: Fix CVE-2026-40467</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<br>
This patch applies the upstream fix as referenced in [2], using the commit =
shown in [1].<br>
<br>
[1] <a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=
=3Da2d18c74109e41bec29a23098eba2e00057286d8">
https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Da2d18c74109e41=
bec29a23098eba2e00057286d8</a><br>
[2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-40467">https://nvd=
.nist.gov/vuln/detail/CVE-2026-40467</a><br>
<br>
Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
---<br>
&nbsp;.../gawk/gawk/CVE-2026-40467.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 62 +++++++++++++++++++<br>
&nbsp;meta/recipes-extended/gawk/gawk_5.4.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&nbsp;2 files changed, 63 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.pat=
ch<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40467.patch<br>
new file mode 100644<br>
index 0000000000..772172c373<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch<br>
@@ -0,0 +1,62 @@<br>
+From 194a2884f21a6fc02c446ca4e2dc9107298832db Mon Sep 17 00:00:00 2001<br>
+From: &quot;Arnold D. Robbins&quot; &lt;arnold@skeeve.com&gt;<br>
+Date: Fri, 3 Apr 2026 12:02:11 +0300<br>
+Subject: [PATCH] Small memory management fix in io.c.<br>
+<br>
+CVE: CVE-2026-40467<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.org/cg=
it/gawk.git/commit/?id=3Da2d18c74109e41bec29a23098eba2e00057286d8">https://=
cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Da2d18c74109e41bec29a23=
098eba2e00057286d8</a>]<br>
+<br>
+(cherry picked from commit a2d18c74109e41bec29a23098eba2e00057286d8)<br>
+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
+---<br>
+ ChangeLog | 6 ++++++<br>
+ io.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 5 ++++-<br>
+ 2 files changed, 10 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index a714ca1a..517aba91 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,9 @@<br>
++2026-04-03&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * io.c (do_getline_redir): Don't DEREF red=
ir_exp too early.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks to Micha=B3 Majchrowicz &lt;mmajchr=
owicz@afine.com&gt;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for the report.<br>
++<br>
+ 2026-02-22&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 5.4.0: Release tar ball made.=
<br>
+diff --git a/io.c b/io.c<br>
+index a3b877c4..7a547aa1 100644<br>
+--- a/io.c<br>
++++ b/io.c<br>
+@@ -2853,21 +2853,24 @@ do_getline_redir(int into_variable, enum redirval =
redirtype)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; redir_exp =3D TOP();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; redir_exp =3D elem_new_to_scala=
r(redir_exp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rp =3D redirect(redir_exp, redi=
rtype, &amp; redir_error, false);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEREF(redir_exp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decr_sp();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rp =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (redir_error) { /* failed redirect */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_ERR=
NO_int(redir_error);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DEREF(redir_exp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return make_number((AWKNUM) -1.0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if ((rp-&gt;flag &amp; R=
ED_TWOWAY) !=3D 0 &amp;&amp; rp-&gt;iop =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (is_non_fatal_redirect(redir_exp-&gt;stptr, redir_exp-&=
gt;stlen)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_ERR=
NO_int(EBADF);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEREF(redir_exp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return mak=
e_number((AWKNUM) -1.0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; (void) close_rp(rp, CLOSE_ALL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DEREF(redir_exp);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // we're about =
to die, but what the heck, release it anyway<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; fatal(_(&quot;getline: attempt to read from closed read en=
d of two-way pipe&quot;));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEREF(redir_exp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iop =3D rp-&gt;iop;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (iop =3D=3D NULL)&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; /* end of input */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return make_number((AWKNUM) 0.0);<br>
+-- <br>
+2.53.0<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.0.bb<br>
index d7211f28f3..59c4cb2536 100644<br>
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb<br>
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb<br>
@@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] =3D &quot;--enable-pma,--disa=
ble-pma, &quot;<br>
&nbsp;SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-configure.ac-re-enable-disabled-printf-features.patch">
file://0001-configure.ac-re-enable-disabled-printf-features.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-40467.patch">file://CVE-2026-40467.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93=
f7a688dc268ca428a90b4ac1&quot;<br>
-- <br>
2.35.6<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM9P189MB173150AC70518D7E75A517D0F1C12AM9P189MB1731EURP_--

