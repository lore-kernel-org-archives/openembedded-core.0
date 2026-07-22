Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD19C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:41:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47248.1784724084835301802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ZrqJIiLJ;
 spf=pass (domain: est.tech, ip: 40.107.159.24, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov7A6wglRWPZFWoGXhRFmERKh6VcX/H8eaIuU1XQb3NxrfhhtilCRInK0CjPGqnMwVeDyjASPTBAfJhP/edFHXm109B15+9wZqkPOb7x6sbe0ccdfXH0twL3g8Q9wXVDQ1Ywe187WO7PobXcIsEY3o7Ej9Q/m3aIDnhIbD/UZZ5U7yYCV8zEFfAw6o1b9pIAvk7fVr2Rhi4CYSiqJAdfHC+/9yrCIGKG6oL4QiMDYCzbrLvDQs42nNPA1k6n3RSzqLSXqcT6SCMbKirj6CgfvZ4nxWlagF9mN6iNZOojhLI6JLUf8xmX54wV+eRow7d4hGp941Z9RBOOtUVtuIY7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K11N7k4z9jh9o5VVLOVRQuBucDA8WUDLWiyHtFLykkk=;
 b=jqrk1MKI2wTfSTQXnu36BYh3oIXWiSwY/D1qi2m9mhsCv3UyPaKrmJkazQu6icp7fzhp2F5bGPTOPgNA8ggqOV1bCwOuDdzwCmknxsFS9BzG/Kt8JexuaR04r5pVJUq43Y45jTzqCITlFW7xqY/DsLJTQERrLLWLQwKOQEFpZI9x/D9MJt9xkJ1y4BCrDuUzc0MjPmx9TVJpOM3z13EFcvnpaAfdExZbBU8OJuUtzlMOTBZZI2O9h61QvIbH1eB33c3oZyV2fKXN43w/aiDPp60GQXwNaprKA5r349ozFEHDOv8hMwiEeTPAaYDEKDf1BLvxF1HzCClPQ5gOYBCGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K11N7k4z9jh9o5VVLOVRQuBucDA8WUDLWiyHtFLykkk=;
 b=ZrqJIiLJ2wjaUmWQqQMhPEJCEQUQM3LvJzlQvwZ+mYw5NkWHk9fm1e7ucignXt+Zy21jDIEXqbmA+jxF7/YIdWpn+vTFjyNeZt1iHTC0hb7bO6C0Jt2C41F+y323U1b8gU6xUojOPxGWey/IWVEkO/PwpY3+zqNlfAw1oMSlLPk165ON/fhEPAhhUlC5ZOh8uSIE+WAw5sBkQ13X5yWMyBh2LcE+lz8ZQnEOF/j7oYjebQmtpskpgTPPOkZp152pjSjXDvmOj8pt4WU4q7FDHJlWWg3RbWFnSvl+TWMFCZ2kOMr/+Ner0g6kS80K6mKQzIgvB5Al+nTjW432RP/SZQ==
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DB9P189MB3525.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:41:20 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 12:41:20 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dkelaiya@cisco.com"
	<dkelaiya@cisco.com>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 2/4] gawk: Fix CVE-2026-40468
Thread-Topic: [OE-core][wrynose][PATCH 2/4] gawk: Fix CVE-2026-40468
Thread-Index: AQHdGcArM56NTOfDJkyTV8vkjAidFLZ5ew+y
Date: Wed, 22 Jul 2026 12:41:19 +0000
Message-ID: 
 <AM9P189MB173190C6CCF9BF58650F817AF1C12@AM9P189MB1731.EURP189.PROD.OUTLOOK.COM>
References: <20260722095430.1416791-1-dkelaiya@cisco.com>
 <20260722095430.1416791-2-dkelaiya@cisco.com>
In-Reply-To: <20260722095430.1416791-2-dkelaiya@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1731:EE_|DB9P189MB3525:EE_
x-ms-office365-filtering-correlation-id: 07aa0998-1380-4485-f985-08dee7ee87cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|23010399003|13003099007|22082099003|18002099003|38070700021|8096899003|11063799006|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info: 
 E5ylCmBVYJexEDucD3xTPlli950PSJEGeQHoJ9rVT0ydLr6ldwVPFdeDRtJVAHHKsUuQ74mj0Uw3sww6+EyhcSQ1tS/lStK8/cbazp86pLcAixSWUCsXdOrZGEc+YwoBLe3q5wnsLL+TemsyjLvrkMNQfBDG89OlPCz70A5GftL4g9Go8di0xtbP6nAI9r3cu57R9Ok1vZ9Us9q9QfsAVjvuemEzKSy1Y97RuuGrf5QMuo2neO35f9RJWkyI7OU2JZzi4L3GiS7wQTIAYn2VXU6Kp+mkIm3ztSe9RTYUnijWWThDO5TXUEPgbAJFs8jtuPv6+5d8N4aU53y9m7IhrfKhpRE6yGWtTQpJzxMcrtbTcz/p2U+L2N7TxVyKzc1HiPZhTEHn06RgXWR/Lw7rpvvem2ixN/Mq1DeXo42PtfN+z7vBgGYZ5s6v9FQUThP42eeF50SBXDPHM5ib3hE9/xuoijT4WOgeljLRqmpZ9aIS3C6Klhgc50OoVbP76rLtqSIw+3VNkU2xCmWooSD8j/PzACQeH9kkvybaldy2PRMn0M2RNZgM2xRkYuojZtKitIVpU/E7fVGn9xCO8TTSIyW7P8RclRun+K9cprpHKOC5nFOjXkUlbj229ZEMEhOPu5cNRXTUd3hmb5U00djCEIZa41evhOHt9JBIDzDc7PI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(13003099007)(22082099003)(18002099003)(38070700021)(8096899003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?xaYea6ASEfbgx+6IjGX0I+nQX/LsiPQ6QKQIbhQgtiltAt/97ab+6cnzfq?=
 =?iso-8859-2?Q?DE8UuefYfK+G5zEWpcZx45t7ACmMloiv2+51m0aELCLtIx8ATZmw4EYlO6?=
 =?iso-8859-2?Q?MVm5Se68PNh1WhoTR4vT2RbZdKVOY2PM+PhzQH3xDQ6felAY4n3Qhi0kp2?=
 =?iso-8859-2?Q?095vuWL34W2YkP5zUN8ImY3V2ftoMTzMMTktRtz7EvXtisvML01U7hd29G?=
 =?iso-8859-2?Q?yGs0nTQYYRZkx4TOo2ubl5T5lqCkIz/Oh2OruU4tjJ6joqC+0gXPHNPnUt?=
 =?iso-8859-2?Q?zuq0oVp8TJs8p7hvSCcZc6FvjkDK/xKKPuFu+PJuuo+afI7KRkblYlGGNG?=
 =?iso-8859-2?Q?aQC/RZQsdGFX4Ibi0BQAV8c5qOe6kxah9F/HRFU9JLOJjIPTLxjNBwFwnh?=
 =?iso-8859-2?Q?4D3RJxyVoDOy31Qi0/B+knjCrPEEdRXxCkyS16r42fkvLXht7vChv9sK6h?=
 =?iso-8859-2?Q?fGxRECvxiCoGLE2cjlEhv9ERz2Egtk3E6cEv18PigkaiD9znjQzpkBkakR?=
 =?iso-8859-2?Q?UV04TeVtJV+B08lti0k0J+kr4hhPm6zc8zmRhLuCKeRlci8OoaKl8DC5mc?=
 =?iso-8859-2?Q?JjGWsqBogtwsBXv9mX9OVtDXS2N/bGRdALAWY1eGx62O36x4Z2p8baLNdi?=
 =?iso-8859-2?Q?uMnXJ/dPzMgKIClqNSRezzLhav2tZnZGQntMszBZGvOnG7YXkqPitPvRHa?=
 =?iso-8859-2?Q?oYcK1+ic4wgFm9NMPrmM11fPAEwaL0RCHA01xuVoQwFJ/85TLLIr6Sazyo?=
 =?iso-8859-2?Q?7DPYxdlwXkazFYkqesTpAZWQ5SU3fSN9C3a6j7q+hY4jfrmm9PJFg5DDCb?=
 =?iso-8859-2?Q?gpLCWR906m7o1qgI4rjC4LbeA6yWe3/hN+A9xzLAQVL0rst6RnOTsp6wPB?=
 =?iso-8859-2?Q?ya0qtydFGPeut/FsFk2pBI/mGADoSb9brz+4bVvlorFJwr0Ves6hKoKy+8?=
 =?iso-8859-2?Q?Be56zUe3Cu7k0MgiJ19h/VIzUMHV3qPBW9Olpsewc5cnTPwKgF0qhrYVWu?=
 =?iso-8859-2?Q?yKMR6qb+yhqqm/fBFbmOzr03Xcof4vk2NDxila8oLZOJ7FNGDk4eqJIal1?=
 =?iso-8859-2?Q?lgGQGG9/PZFdplly44p6yROeu+YOPt6LPYxX1HM2KWMqkoFOwZjIqh00PX?=
 =?iso-8859-2?Q?WLmVh591M+SYmW17CMyIGc9O6i5hMtuGgidBVYgy0x5HFBiaSeFe0VmN/e?=
 =?iso-8859-2?Q?dqalSn7x6LmKO8uF9gy06882iX3C0FjHnDUVl3VSZZl0PPvZBgPXjP0lo+?=
 =?iso-8859-2?Q?28TKjIA7QEyq20xkn2ABIaC44HzH6qkI+4zniXBLM/K+6rFai6wa7xvsCG?=
 =?iso-8859-2?Q?l+FMRCb44R+Gu0AybMMly3n2smj/m+qEuRrbsfPkr/jn5BzbzBKyi6cSO9?=
 =?iso-8859-2?Q?L8pDmVru55361IatYumYfSXlTVbojr2ISKTsEDLZQbXyrqHJpU6GRz9iro?=
 =?iso-8859-2?Q?FNaxlPKvieH58FlnLbgm7XhNGk31F4/f+TC8O7uaKZl+S2VwbIofzDT29m?=
 =?iso-8859-2?Q?vYe36ypJxS5oys0S8rSGA0mR57lAOMTtuy96X/FVJNTK3FL9yXZFvIVWfT?=
 =?iso-8859-2?Q?/pzlsUv04hCHfg8jE/okrpV7YnaD2UHzkDtYIOlaNUeuR65Cgw1fW41bIm?=
 =?iso-8859-2?Q?yXu62EyhtPOoHGsLGC/4tb9BEpK3+HIlGkL6CpzCMNYLma1VX8g7xByZX4?=
 =?iso-8859-2?Q?EqM44SGxkH2ZW573zfj1JwUxGJeDSpPGfIORv1cubJMRpjQ2j7jk6K6PC5?=
 =?iso-8859-2?Q?+VcEh8FGUcdq4u6h6JAKCDjSxwNYH9x2NO4M+XiizyT5C94Ozp4M9ynjQd?=
 =?iso-8859-2?Q?zIFsSzsF40BBl9ZuZOBI++pliq/UUti4DrxHR6OTKEL6UmBBi3yqdSSDYj?=
 =?iso-8859-2?Q?oK?=
x-ms-exchange-antispam-messagedata-1: UKs6hKAf/abk7g==
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB173190C6CCF9BF58650F817AF1C12AM9P189MB1731EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07aa0998-1380-4485-f985-08dee7ee87cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 12:41:19.9775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqzYTylGaTbzjVhXM4uqzq/9EJ/4MSoEoAfgPhjBCQ7aLyAVUOSYasrlP8Jfpk+vQl5FRKsoWOXYuKnk4doCE0yL/aKzaGuXD3UIwNgahEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241684

--_000_AM9P189MB173190C6CCF9BF58650F817AF1C12AM9P189MB1731EURP_
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
Subject: [OE-core][wrynose][PATCH 2/4] gawk: Fix CVE-2026-40468

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit =
shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3D062f2f2581=
b991362c046f7f2e238ffa34e6f8c7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40468

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40468.patch            | 61 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40468.patch
new file mode 100644
index 0000000000..6b767c3bea
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
@@ -0,0 +1,61 @@
+From 1e0b3ebeb4a39680dcd9c8eeadd8e3bf1c7c6200 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Sat, 4 Apr 2026 21:45:58 +0300
+Subject: [PATCH] Minor integer overflow fixes.
+
+CVE: CVE-2026-40468
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git=
/commit/?id=3D062f2f2581b991362c046f7f2e238ffa34e6f8c7]
+
+(cherry picked from commit 062f2f2581b991362c046f7f2e238ffa34e6f8c7)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog | 8 ++++++++
+ builtin.c | 2 +-
+ node.c    | 2 +-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 517aba91..8cdf90f6 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2026-04-04         Arnold D. Robbins     <arnold@skeeve.com>
++
++      * builtin.c (do_sub): Make `sofar' be size_t to avoid
++      integer overflows.  Thanks to Micha=B3 Majchrowicz
++      <mmajchrowicz@afine.com> for the report.
++      * node.c (parse_escape): Change `i' to int64_t to avoid
++      overflows. Thanks to ASan with gcc -m32.
++
+ 2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
+
+        * io.c (do_getline_redir): Don't DEREF redir_exp too early.
+diff --git a/builtin.c b/builtin.c
+index 6305b541..d0e083da 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -1806,7 +1806,7 @@ do_sub(int nargs, unsigned int flags)
+        char *repl;
+        char *replend;
+        size_t repllen;
+-      int sofar;
++      size_t sofar;
+        int ampersands;
+        int matches =3D 0;
+        Regexp *rp;
+diff --git a/node.c b/node.c
+index 0e2bfb0f..f1e14dff 100644
+--- a/node.c
++++ b/node.c
+@@ -584,7 +584,7 @@ parse_escape(const char **string_ptr, const char **res=
ult, size_t *nbytes)
+        static char buf[MB_LEN_MAX];
+        enum escape_results retval =3D ESCAPE_OK;
+        int c =3D *(*string_ptr)++;
+-      long i;
++      int64_t i;
+        int count;
+        int j;
+        const char *start;
+--
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.0.bb
index 59c4cb2536..345103a7f0 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.pat=
ch \
            file://CVE-2026-40467.patch \
+           file://CVE-2026-40468.patch \
            "

 SRC_URI[sha256sum] =3D "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc26=
8ca428a90b4ac1"
--
2.35.6


--_000_AM9P189MB173190C6CCF9BF58650F817AF1C12AM9P189MB1731EURP_
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
<b>Subject:</b> [OE-core][wrynose][PATCH 2/4] gawk: Fix CVE-2026-40468</fon=
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
=3D062f2f2581b991362c046f7f2e238ffa34e6f8c7">
https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3D062f2f2581b991=
362c046f7f2e238ffa34e6f8c7</a><br>
[2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-40468">https://nvd=
.nist.gov/vuln/detail/CVE-2026-40468</a><br>
<br>
Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
---<br>
&nbsp;.../gawk/gawk/CVE-2026-40468.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 61 +++++++++++++++++++<br>
&nbsp;meta/recipes-extended/gawk/gawk_5.4.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&nbsp;2 files changed, 62 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.pat=
ch<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40468.patch<br>
new file mode 100644<br>
index 0000000000..6b767c3bea<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch<br>
@@ -0,0 +1,61 @@<br>
+From 1e0b3ebeb4a39680dcd9c8eeadd8e3bf1c7c6200 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Arnold D. Robbins&quot; &lt;arnold@skeeve.com&gt;<br>
+Date: Sat, 4 Apr 2026 21:45:58 +0300<br>
+Subject: [PATCH] Minor integer overflow fixes.<br>
+<br>
+CVE: CVE-2026-40468<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.org/cg=
it/gawk.git/commit/?id=3D062f2f2581b991362c046f7f2e238ffa34e6f8c7">https://=
cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3D062f2f2581b991362c046f=
7f2e238ffa34e6f8c7</a>]<br>
+<br>
+(cherry picked from commit 062f2f2581b991362c046f7f2e238ffa34e6f8c7)<br>
+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
+---<br>
+ ChangeLog | 8 ++++++++<br>
+ builtin.c | 2 +-<br>
+ node.c&nbsp;&nbsp;&nbsp; | 2 +-<br>
+ 3 files changed, 10 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index 517aba91..8cdf90f6 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,11 @@<br>
++2026-04-04&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * builtin.c (do_sub): Make `sofar' be size=
_t to avoid<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; integer overflows.&nbsp; Thanks to Micha=
=B3 Majchrowicz<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;mmajchrowicz@afine.com&gt; for the rep=
ort.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * node.c (parse_escape): Change `i' to int=
64_t to avoid<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; overflows. Thanks to ASan with gcc -m32.<b=
r>
++<br>
+ 2026-04-03&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * io.c (do_getline_redir): Don'=
t DEREF redir_exp too early.<br>
+diff --git a/builtin.c b/builtin.c<br>
+index 6305b541..d0e083da 100644<br>
+--- a/builtin.c<br>
++++ b/builtin.c<br>
+@@ -1806,7 +1806,7 @@ do_sub(int nargs, unsigned int flags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *repl;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *replend;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t repllen;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int sofar;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t sofar;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ampersands;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int matches =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regexp *rp;<br>
+diff --git a/node.c b/node.c<br>
+index 0e2bfb0f..f1e14dff 100644<br>
+--- a/node.c<br>
++++ b/node.c<br>
+@@ -584,7 +584,7 @@ parse_escape(const char **string_ptr, const char **res=
ult, size_t *nbytes)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static char buf[MB_LEN_MAX];<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum escape_results retval =3D =
ESCAPE_OK;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int c =3D *(*string_ptr)++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long i;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int64_t i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int j;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *start;<br>
+-- <br>
+2.53.0<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.0.bb<br>
index 59c4cb2536..345103a7f0 100644<br>
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb<br>
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb<br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-configure.ac-re-enable-disabled-printf-features.patch">
file://0001-configure.ac-re-enable-disabled-printf-features.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40467.patch">file://CVE-2026-40467.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-40468.patch">file://CVE-2026-40468.patch</a> \<br>
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

--_000_AM9P189MB173190C6CCF9BF58650F817AF1C12AM9P189MB1731EURP_--

