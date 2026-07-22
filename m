Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391E3C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:37:04 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46903.1784723820810040447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=tdMApYA3;
 spf=pass (domain: est.tech, ip: 52.101.72.9, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5XdQnwOMThXPIVxRizJUx/NuS+dDn4snri/BRpySVWK0782gIALY+WSVzO9doWzy6smRygO48Np8THB5kMudpsF0U2E2bbQvdLnz9R6uj1nx/7BkTRlFt27fnij4XvQYcQCCXVRTityUeQlsvJNp+lDYowopuPrYlPl4KX9HgVFZzDXz1FR14bpPDQOTOs8WYKvbm+dDxS/p8c/rWTF7e5OrKDmVhwCqLCYo3hVzmKPWOpgFW2KOWp9OS61AEyw+nvHG2UBUXjCA37u5Nyrzg+a+6rxD07z1zdwq5KK8Aa1mbxqe33RFUvI/r8pYSS6w+wSmHAaXnVht9sKhvvHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej+aHtpKhMQyA114lK6TUsY7Z5b6dyn07DTnwtUQqMQ=;
 b=CfuXJKQPIb+yUlAkCeiwS/NMKFnasWaTSZ/Yk25m+T7JWbE4geOwDPuRWF0XOSuXATKKGEvGwLqMFW8OjagOS5FFiQsgJ/7GFmAoQp+UOjg8srMVO0fwt+4DcbFWqo7r6PCjZzfVpru9KUOvld4Oc5nxkWgKzLSgR5XeJEbJX+hwAalv+No9p9fVJW7ArzYpuaGy3fPBkosCngQ5t+jLQRQp3WMluATzDJDpUoMcV89LyNwNv9PbaZSATX/ijGplwM962D07+/7xRnGowQwtmf/M4OWW7QBZPxfc29hzezvuBhmgEX8pRzsh9Z9M5xNtJBPBdbtYXvZyozDKT3qRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej+aHtpKhMQyA114lK6TUsY7Z5b6dyn07DTnwtUQqMQ=;
 b=tdMApYA3lpTE49SjIcVQs/XvNB9sbDo2HtlSe9zDiafMico5+4ggZ+wmAKlCnj6DzwllYmEu/abbXtRnqdn9LzI2r1qmeXn8DRqb83z/8N3YUfuuviRWwYcGpKJTBfnP4snynQhYAmjEyUhEbBYTc2KRFh+DHphlQelLUEA4bkmzdznVe+XMd6kbQdkcpm0wxqenWka3GsOiOlxGhbjsY+mDtgPMr2puF09Ohz9vmVf1BRksZl/FDAXHpld46CzyK461Yv/Obd7D6QBKMUZX2hBY4NhJQFbCP32uQ0uCuEMmNYDWwYlHY+6DNI7LX2DSKmHJ/GeknBmcnYvEN54exQ==
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DB8P189MB0649.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.4; Wed, 22 Jul
 2026 12:36:56 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 12:36:56 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dkelaiya@cisco.com"
	<dkelaiya@cisco.com>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 3/4] gawk: Fix CVE-2026-40469
Thread-Topic: [OE-core][scarthgap][PATCH 3/4] gawk: Fix CVE-2026-40469
Thread-Index: AQHdGcByiIj8J2YpfUSql4sWs3wD07Z5ef1+
Date: Wed, 22 Jul 2026 12:36:56 +0000
Message-ID: 
 <AM9P189MB1731078F0F1013495C28DD68F1C12@AM9P189MB1731.EURP189.PROD.OUTLOOK.COM>
References: <20260722095627.1424705-1-dkelaiya@cisco.com>
 <20260722095627.1424705-3-dkelaiya@cisco.com>
In-Reply-To: <20260722095627.1424705-3-dkelaiya@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1731:EE_|DB8P189MB0649:EE_
x-ms-office365-filtering-correlation-id: 1a47145d-53bf-4fbb-2a7f-08dee7edead3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|10070799003|376014|1800799024|366016|38070700021|13003099007|6133799003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: 
 kmK0X4Hfm45g5wv0v765MDX9xXiar/5QPxjW2f211OoXfRYKJqbjOOzdUwUDMoEnxN36sZ9CAJrQ8tobFrvPsusTtNLRw0LHHpwd1jzUarc2+4P47V41RGHzbghgE1MZPXgC+oe16WOu+qlvniBcHcqyud7skkSRAPwDGc9yru2Sg0tj/cgAUJ7f9uz3XisG1OLnZ+3WbU1nYH0J+vmlsjp5Drt3UtTd97A3Tz6RBZdPfV1CawA5dG39hMdvVUV/xXI3aWfZAF+Q3hCgTMrCs07VnNs7rKC3tVBmJLJ98ogD3Ty3aATX+3TjBSMr6gDCgsqCTzP2GtxJTlw5bpCj2lu3KjsMeCggaglvU2Tnu4UH5W0OCgjPqf8lpJXruI58eirw8gMt4SOTULmO80O5hHg3bCQs8Cwm2jUQ/moN42+K3G5IP75KR+Qb0+sLti/QAOaHnLjpMg5thK1wLG/WEajl3QqIAjGNMeNeQWQpL5v5qEb/fmLiLRtlZ6OV9a/3JunnQiLBbRHQAg01aZWsz3El51dyLyYjhaqkgciIu/D+EQ7CuCc4Zq6Eq7oI1Z+tn8WI8PFk0vS12JN+xOGYVgVYJmFJtg99N+bwiU61YTwRix/d/Tih/RPqW6XfGbdenfv+Jh3OtJUUeonHP7GyIuXJmT90aXS9Ol6syz1PIBM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(1800799024)(366016)(38070700021)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?dLY8/lB83cggM97ZWm3fOZaQNaVYvdlKO8tkO1SWt7DXGn7jpMe10aEjxx?=
 =?iso-8859-2?Q?mO3spS/5O1XlPnZa0xutG9Xw8jU1dQiHO4MYI+y7grNSMkxan8uelWClBu?=
 =?iso-8859-2?Q?yWA36Sj/kt2x90FFgb8Zr39O7cZsxKER23xNwolr64fKHAgGOy4LZpVXo6?=
 =?iso-8859-2?Q?5ifggWyQeqOcj3kIpMjycbsQ5PqPXZqbdC1jvXxRg25Wkqzoo+OGlWz3QG?=
 =?iso-8859-2?Q?S0k1wm+RRg6VcuTAmfn2mrKtPp66ilSzOogOM51OmvQtMaVztwP9fVeTep?=
 =?iso-8859-2?Q?T20F5Tyin4WdCyfgYh3e4D+d3i6YK79pBDEuRvD4jLgywPPgo5Ob0Msji6?=
 =?iso-8859-2?Q?qnOtnc41D2WFfu3Bu5kz7dUzAO4VWX4YMiDyp1HkGiibi0jj3PzrTos4Xi?=
 =?iso-8859-2?Q?+sZj1fA7AN5K72I9LcKmJNmaScsklAAysyMBnHH0RSX4uNV4xEhD6lDsoM?=
 =?iso-8859-2?Q?AqiF3H6V1TMk/lJNeBro69V/LxH2U2vsBoQ74HjYy4SrZ1KsZ0FZtJaojJ?=
 =?iso-8859-2?Q?NuAUe41TMBFJOlclO1qDqPXAoNZi6pjDu8hhme3sl+YmJ4WRM7QnCxQX0d?=
 =?iso-8859-2?Q?qNqvwGJXcWD1znVry2N6zWcWFRqCqCP586tsG/B62PZl9FOSYbZs2WzAGG?=
 =?iso-8859-2?Q?Z2+mgKjtN7PDo+1dzzr0t08m6PxU5W0zRr7RXb+mCtqbD+dUA2bW7l1kQ7?=
 =?iso-8859-2?Q?iUKUrW3CLgpGeAMWDC0C2txMcdNxbGOFG6uKpDZ3/AleqyZkR5mOd7KtN7?=
 =?iso-8859-2?Q?ei0paM9h+dsouM2xe6vHZIiRDVSxZo/t6Kv4DsnQ76pNyUMrPHsPPmZDHh?=
 =?iso-8859-2?Q?JPG6ZhCbejeD8YqrMeRHF7ysCkhaq50OpVFkhx118JS3LDZMBKY7tOMAsk?=
 =?iso-8859-2?Q?fUXLtd5aTglXS5Dk3djQjAxBXOk+Bioru+p519ANJR5iXPEYDgcjzvprfS?=
 =?iso-8859-2?Q?x/BOf1H0fXSJqf+RCiEnjwMdVrN+9e+QhPGZkELY5zwtCaTE996ysNTIAP?=
 =?iso-8859-2?Q?Nt5z+lCy9XnomXfE2hWkk5RMgowspd/xa4wvwdRj0e5hD/ae20jbVG/FAe?=
 =?iso-8859-2?Q?LDJcvmEIjlP8c1PSF4S9L4WfNwY1V2tLKSFeACXwLu0EdTy3lD68M388hi?=
 =?iso-8859-2?Q?WpXFjDpC19lvNNnPNDxNbj/k/+a2QfCO5hGVelX4APtqpEkZalw32Debuf?=
 =?iso-8859-2?Q?mcNA/lF+Wl3o8jnnVaXQiQOdGJOXJzusqtSO9xjl+QzhjbZ/DSRIHtSiX6?=
 =?iso-8859-2?Q?YEpsSg8MnQHXaioyuPZPYGP2YClio3Av9S5om1gWHloVBUZBPniu0FYMv0?=
 =?iso-8859-2?Q?TXFzreAH2hMloYrw1rSZoLn0vF5u0VIO4cdn9wXOnVVsC/DuEkRKuHKoyh?=
 =?iso-8859-2?Q?XXa7WAnKLe3XxLHSCLA1HzK5dQQAqAJAdjIpbnoIHBy1weS8w5u5zN6o16?=
 =?iso-8859-2?Q?Q7URlXznVkgHz0Nva4GImy27F8fBBpxFEpHqu+JXKzrb2rMHsaQwCX6Ewb?=
 =?iso-8859-2?Q?DaqDB6rCXUO/yDVwDAg0NUnpaUjHwX7A/Xr7g2C8WiB/DIOGugpyZ2BEn3?=
 =?iso-8859-2?Q?rXu9GaXdlvkEhXwSOm7t0x1muAxKGXOwuTcnRq6s5RGUy1xGyHEJNvR9hw?=
 =?iso-8859-2?Q?dlIsFfhnqF5QB6rG+My9l6m9A1WOk6Og9y4upidb+qGNDW+Xz/0JOCZOd3?=
 =?iso-8859-2?Q?UwtJwt+XKlKnoElamfBbY4+qOTR+rfwr/mqiaTaGLf/EKeZj+jNbL2rk/2?=
 =?iso-8859-2?Q?Y5A7LitNkkucwiWbZ+/u5nZ5xtKsrRIfBeCgfAx//kAwibEZ2OLRMHHWgo?=
 =?iso-8859-2?Q?jzHEatGNbN0KB5GMi37SD3sX8mGywbk0hC+iHaQtsxK9K9QFVrIcXs95Jc?=
 =?iso-8859-2?Q?84?=
x-ms-exchange-antispam-messagedata-1: /PAjUHGrCnkiaw==
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB1731078F0F1013495C28DD68F1C12AM9P189MB1731EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a47145d-53bf-4fbb-2a7f-08dee7edead3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 12:36:56.5535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMLTxKa80ypmVEi5ufB9zdqK+/ACRU7ExRwdKDLENBYcWyO1u2WxdEWbxrSv18loPxZubZJXvtfxXNAR6Ni9S3eXDkJZiTGA4Or39vtz5Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241680

--_000_AM9P189MB1731078F0F1013495C28DD68F1C12AM9P189MB1731EURP_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVAT=
E LIMITED at Cisco) via lists.openembedded.org <dkelaiya=3Dcisco.com@lists.=
openembedded.org>
Sent: Wednesday, July 22, 2026 11:56 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: xe-linux-external@cisco.com <xe-linux-external@cisco.com>; Darsh Kelaiy=
a <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/4] gawk: Fix CVE-2026-40469

From: Darsh Kelaiya <dkelaiya@cisco.com>

NVD [3] identifies upstream merge commit [2] as the fix. The
CVE-specific change is its second parent [1], which adds 32-bit
overflow checking in do_sub().

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Daa7272a6e1=
184cdd21ab8f89200219abd8053eda
[2] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dae1b2d508f=
46913269a9e62aceda3636afe8147b
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40469

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40469.patch            | 90 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40469.patch
new file mode 100644
index 0000000000..49b6a23b01
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
@@ -0,0 +1,90 @@
+From f907980a3e7a58006b796308021c8410a24e0f3c Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Mon, 6 Apr 2026 10:56:38 +0300
+Subject: [PATCH] Add overflow checking in do_sub for 32 bit systems.
+
+CVE: CVE-2026-40469
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git=
/commit/?id=3Daa7272a6e1184cdd21ab8f89200219abd8053eda]
+
+(cherry picked from commit aa7272a6e1184cdd21ab8f89200219abd8053eda)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog |  9 +++++++++
+ builtin.c | 25 ++++++++++++++++++++-----
+ 2 files changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index e691b241..74eea81f 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,12 @@
++2026-04-06         Arnold D. Robbins     <arnold@skeeve.com>
++
++      * builtin.c (do_sub): Check for overflow in calculation of size
++      of result buffer by doing the math in 64 bits. This provides
++      a fatal message on 32 bit systems if overflow happens instead
++      of letting dynamic memory get corrupted and likely causing
++      a core dump. Thanks to Micha=B3 Majchrowicz <mmajchrowicz@afine.com=
>
++      for the report and fix.
++
+ 2026-04-04         Arnold D. Robbins     <arnold@skeeve.com>
+
+        * builtin.c (do_sub): Make `sofar' be size_t to avoid
+diff --git a/builtin.c b/builtin.c
+index 80ab6069..d63cf47b 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -2998,11 +2998,13 @@ do_sub(int nargs, unsigned int flags)
+        long current;
+        bool lastmatchnonzero;
+        char *mb_indices =3D NULL;
++      const char *fname =3D NULL;       // for fatal message, below
+
+        if ((flags & GENSUB) !=3D 0) {
+                double d;
+                NODE *glob_flag;
+
++              fname =3D "gensub";
+                check_exact_args(nargs, "gensub", 4);
+
+                tmp =3D PEEK(3);
+@@ -3033,11 +3035,9 @@ do_sub(int nargs, unsigned int flags)
+                }
+                DEREF(glob_flag);
+        } else {
+-              if ((flags & GSUB) !=3D 0) {
+-                      check_exact_args(nargs, "gsub", 3);
+-              } else {
+-                      check_exact_args(nargs, "sub", 3);
+-              }
++              fname =3D ((flags & GSUB) !=3D 0) ? "gsub" : "sub";
++
++              check_exact_args(nargs, fname, 3);
+
+                /* take care of regexp early, in case re_update is fatal *=
/
+
+@@ -3153,6 +3153,21 @@ do_sub(int nargs, unsigned int flags)
+                 * vary since ampersand is actual text of regexp match.
+                 */
+
++              // 4/2026: This overflow check simply provides a fatal
++              // message instead of letting realloc() die later after
++              // a buffer overrun.  It simply makes the user experience b=
etter,
++              // but does not prevent gawk from dying miserably.  I suppo=
se
++              // it's worth the trouble, but just barely.
++
++              /* uint64_t so the product is 64-bit even on 32-bit ILP32 b=
uilds */
++              uint64_t repl_contribution =3D
++                      (uint64_t)(unsigned int)ampersands
++                      * (uint64_t)(uintptr_t)(matchend - matchstart);
++              if (repl_contribution > (uint64_t)SIZE_MAX
++                  || repl_contribution > (uint64_t)SIZE_MAX - (size_t)(ma=
tchend - text)
++                                              - repllen - 1)
++                      fatal(_("%s: replacement expansion too large"), fna=
me);
++
+                /*
+                 * add 1 to len to handle "empty" case where
+                 * matchend =3D=3D matchstart and we force a match on a si=
ngle
+--
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.3.0.bb
index d79b0222a6..7bd34a3ff8 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-Fix-some-C23-compilatio-issues.patch \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
+           file://CVE-2026-40469.patch \
            "

 SRC_URI[sha256sum] =3D "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb5=
5e440d30273336"
--
2.35.6


--_000_AM9P189MB1731078F0F1013495C28DD68F1C12AM9P189MB1731EURP_
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
<b>Sent:</b> Wednesday, July 22, 2026 11:56 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external@cisco.com &lt;xe-linux-external@cisco.com&gt;;=
 Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<b>Subject:</b> [OE-core][scarthgap][PATCH 3/4] gawk: Fix CVE-2026-40469</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<br>
NVD [3] identifies upstream merge commit [2] as the fix. The<br>
CVE-specific change is its second parent [1], which adds 32-bit<br>
overflow checking in do_sub().<br>
<br>
[1] <a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=
=3Daa7272a6e1184cdd21ab8f89200219abd8053eda">
https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Daa7272a6e1184c=
dd21ab8f89200219abd8053eda</a><br>
[2] <a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=
=3Dae1b2d508f46913269a9e62aceda3636afe8147b">
https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dae1b2d508f4691=
3269a9e62aceda3636afe8147b</a><br>
[3] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-40469">https://nvd=
.nist.gov/vuln/detail/CVE-2026-40469</a><br>
<br>
Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
---<br>
&nbsp;.../gawk/gawk/CVE-2026-40469.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 90 +++++++++++++++++++<br>
&nbsp;meta/recipes-extended/gawk/gawk_5.3.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&nbsp;2 files changed, 91 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.pat=
ch<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40469.patch<br>
new file mode 100644<br>
index 0000000000..49b6a23b01<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch<br>
@@ -0,0 +1,90 @@<br>
+From f907980a3e7a58006b796308021c8410a24e0f3c Mon Sep 17 00:00:00 2001<br>
+From: &quot;Arnold D. Robbins&quot; &lt;arnold@skeeve.com&gt;<br>
+Date: Mon, 6 Apr 2026 10:56:38 +0300<br>
+Subject: [PATCH] Add overflow checking in do_sub for 32 bit systems.<br>
+<br>
+CVE: CVE-2026-40469<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.org/cg=
it/gawk.git/commit/?id=3Daa7272a6e1184cdd21ab8f89200219abd8053eda">https://=
cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Daa7272a6e1184cdd21ab8f=
89200219abd8053eda</a>]<br>
+<br>
+(cherry picked from commit aa7272a6e1184cdd21ab8f89200219abd8053eda)<br>
+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
+---<br>
+ ChangeLog |&nbsp; 9 +++++++++<br>
+ builtin.c | 25 ++++++++++++++++++++-----<br>
+ 2 files changed, 29 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index e691b241..74eea81f 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,12 @@<br>
++2026-04-06&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * builtin.c (do_sub): Check for overflow i=
n calculation of size<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of result buffer by doing the math in 64 b=
its. This provides<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a fatal message on 32 bit systems if overf=
low happens instead<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of letting dynamic memory get corrupted an=
d likely causing<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a core dump. Thanks to Micha=B3 Majchrowic=
z &lt;mmajchrowicz@afine.com&gt;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for the report and fix.<br>
++<br>
+ 2026-04-04&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * builtin.c (do_sub): Make `sof=
ar' be size_t to avoid<br>
+diff --git a/builtin.c b/builtin.c<br>
+index 80ab6069..d63cf47b 100644<br>
+--- a/builtin.c<br>
++++ b/builtin.c<br>
+@@ -2998,11 +2998,13 @@ do_sub(int nargs, unsigned int flags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long current;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool lastmatchnonzero;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *mb_indices =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *fname =3D NULL;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; // for fatal message, below<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((flags &amp; GENSUB) !=3D 0=
) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; double d;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; NODE *glob_flag;<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fname =3D &quot;gensub&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; check_exact_args(nargs, &quot;gensub&quot;, 4);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; tmp =3D PEEK(3);<br>
+@@ -3033,11 +3035,9 @@ do_sub(int nargs, unsigned int flags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; DEREF(glob_flag);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if ((flags &amp; GSUB) !=3D 0) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_exact_args(narg=
s, &quot;gsub&quot;, 3);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_exact_args(narg=
s, &quot;sub&quot;, 3);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fname =3D ((flags &amp; GSUB) !=3D 0) ? &quot;gsub&quot; : &quot;sub&=
quot;;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; check_exact_args(nargs, fname, 3);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* take care of regexp early, in case re_update is fatal *=
/<br>
+ <br>
+@@ -3153,6 +3153,21 @@ do_sub(int nargs, unsigned int flags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; * vary since ampersand is actual text of regexp matc=
h.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; */<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; // 4/2026: This overflow check simply provides a fatal<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; // message instead of letting realloc() die later after<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; // a buffer overrun.&nbsp; It simply makes the user experience better=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; // but does not prevent gawk from dying miserably.&nbsp; I suppose<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; // it's worth the trouble, but just barely.<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* uint64_t so the product is 64-bit even on 32-bit ILP32 builds */<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; uint64_t repl_contribution =3D<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint64_t)(unsigned i=
nt)ampersands<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (uint64_t)(uintptr_=
t)(matchend - matchstart);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (repl_contribution &gt; (uint64_t)SIZE_MAX<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || repl_contribution &gt; (uint64_t)SIZE_MAX =
- (size_t)(matchend - text)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - repllen - 1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fatal(_(&quot;%s: rep=
lacement expansion too large&quot;), fname);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; * add 1 to len to handle &quot;empty&quot; case wher=
e<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; * matchend =3D=3D matchstart and we force a match on=
 a single<br>
+-- <br>
+2.44.4<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.3.0.bb<br>
index d79b0222a6..7bd34a3ff8 100644<br>
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb<br>
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb<br>
@@ -24,6 +24,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Fix-some-C23-compilatio-issues.patch">file://0001-Fix-some-=
C23-compilatio-issues.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40467.patch">file://CVE-2026-40467.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40468.patch">file://CVE-2026-40468.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-40469.patch">file://CVE-2026-40469.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;378f8864ec21cfceaa048f7e1869ac9b4597b449=
087caf1eb55e440d30273336&quot;<br>
-- <br>
2.35.6<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM9P189MB1731078F0F1013495C28DD68F1C12AM9P189MB1731EURP_--

