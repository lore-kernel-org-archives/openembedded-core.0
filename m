Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF31C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:31:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47077.1784723499145947014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=pPoZBOYL;
 spf=pass (domain: est.tech, ip: 40.107.159.22, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rapgAxyG7rhro1BdgzXJb1AOheWQRuY7t2KoUkiwVI91//pTw0YIIC8Sc6QguE3R+OZSuKCE32o/WxnbeLIE3b+iPqN1QOLK3Jyrtv7cztttJPQRKD9TG4Eu+BiO8cp2ulJdWMTCg/MD6og6A/CBO3WTKKYGUB/R1wd7HQw6sSvDgHel43apD97yuhv8xKNyYdDDrRMwxtnF/7LyG1vDH+dKI7LQLaQW0WgyY/sztH58qLTYSTsvmTZNEkRs5U6xHtntsyybKFYyM0czyrEWUDekOASNKHZxibS0YYr7zOcgj3c0kM5f1CzSyTuJhvhwAstlORPpWXsHtbnkemYPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOrvL3iV/JepCo1He87QTH20zgpb/EWhsxzKr3X+vXk=;
 b=XUWurNwkcFLoS/RoEfLbG29A/CU4QdoL7dQ4DgvS7SkzGuiLZ79/SXZ/HdsPglQXysQyPZ94N77/jXwLhDdXDsBRHoJbwrn01W90moR80PEZ3tgpCKu8JF/JK64BNHz2bAAB+BPeAtjclUuE79OZUt9mYasN1YP/oridwVthX9wWhyIFq4EpQn1aj0ZsMuIbQjncnbKtrDcG32nvc2mDF8YYFICDz+dLtfCCBE+1kmn5p4tWZJPDPwUMY/LH8/EsKKK5ku7NLrVcgTv3/keOcImEe875BAkkPvxfjtwZ3Ojt1dqNBB640s2NYpvJr04oYT3nxk3Rap3Am+Q2suzYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOrvL3iV/JepCo1He87QTH20zgpb/EWhsxzKr3X+vXk=;
 b=pPoZBOYL2UgYXNPg/3XFPhItlTkmbnw/LU8UXCs4x/0iol6YfOIB26oEHjwgWle7zhk4Sj+4uD93wegOpRalTc6J6N4JCAjICIvffkRb6hPNeiJOnzXEpRany6WZmLuh6yQTk1kpVBvs11Dun9Lzb17U1kA9Eo6bW4HKnbEjUxAGvzrNLlTa63cXVuCo6C6mtWtBMrzgclLT0bhXInmmHUMff7j9X6TEZ8OEMAPgQbgt5zlot6h/iy2m39Fjd6bSvatipYoVPNOtqfvbRawOzXZZZRbB7WvPsfYyV9OpGvS/ufUHefN0tv2jayk7YRK3jldxQf4N0V2EOWpVoKKCLw==
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by GV1P189MB2980.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:264::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:31:32 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 12:31:32 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dkelaiya@cisco.com"
	<dkelaiya@cisco.com>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/4] gawk: Fix CVE-2026-40467
Thread-Topic: [OE-core][scarthgap][PATCH 1/4] gawk: Fix CVE-2026-40467
Thread-Index: AQHdGcBjsmhkGYO0V0WszR84H3xv07Z5eFiy
Date: Wed, 22 Jul 2026 12:31:31 +0000
Message-ID: 
 <AM9P189MB17316072167BD2A00BB3E675F1C12@AM9P189MB1731.EURP189.PROD.OUTLOOK.COM>
References: <20260722095627.1424705-1-dkelaiya@cisco.com>
In-Reply-To: <20260722095627.1424705-1-dkelaiya@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1731:EE_|GV1P189MB2980:EE_
x-ms-office365-filtering-correlation-id: 0c2e5ca2-e7c6-4f28-a1ef-08dee7ed2953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|38070700021|56012099006|11063799006|10067099003|8096899003|13003099007|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 u2NkE5NvGo+db8LdEcPnLifIYEohZXR43yMUcYxBDlvanUHTC9iDdoGgM+D94rLYFsH6ZjoI0gS6lwzoBflxMUd04010KvQCgy6mJGHsCAIdzffGyCORRyfb4L95Y5qJvBuEp5YzYRNPgOrxtcJH5z5c3p0sqyLoDKv+fIKTLvoiqaKJxtrghMOMGrcE7KDkTTNRZQ+bbZLMJl4TIFc38fN18FWqDRXB/TiYdUdUuavBbHQFxl26jUXvqQgvHJbfWhxBxkIHpN+5yPcNzt6Y/NhAcb3ahj7kF+uyWmEXGPwCbC3tYR7vEf6O/ErTTqB2crgDesIjDZzlVaZW4uBDQyVLDNtxjKw4urKpGEQYZy8/KCE1PMvQ/xJW0YD4vH5CsgwJOvg1brCWdSu/naGjpIEP1aISWX22SvRZjzlkU/3+aSwCBQJnxlyY1LNT5MPLMQ/sWD1O9yLgeHO3gIbWiuwYu2fpWpHeHGBUbBU6eh2KyRjG76kYaFrl8cTeIuMHo38uWClBYbuqLYvFWlnC0pu112ruFZ7T5kz/d4vPBsNX1YXmq1ktnHJbsKnexdqYN3uiyKNPj/Qw9pytp7vwvtnVO6aJElPASrzFMsE2OUPdqjNbxBZbBMuaXFxWbgiRVOcrIZWLOSQpe2lkBDjlYJn/XxpAa7kPo1MiBYU0xlY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(8096899003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?g5xsiKcaJ56AnAX2UMQCw6thJSyntHTJKxHCp45AtD9lVDaLY8Z0p75bIM?=
 =?iso-8859-2?Q?5Pl8ScUHGD4PnzqEnbPKlIHSZtnVNNMTyVdb0dHmhqRQZuR85ndPn0XjgZ?=
 =?iso-8859-2?Q?9AZChLgJKUFip4V28rislL0Si5VMEJ/QJUHL4G4v0r10uaH3T3htJxgqab?=
 =?iso-8859-2?Q?1FwyEUeZrAvUaoLAE4XbWhEuXjf7OktHdWqNm/QiUJPGuc1gpyHy7GhCTE?=
 =?iso-8859-2?Q?vfsCzM5V35/SEZoPrz0fVn1ZmBSdBahuFZ/Y43dVcJriIakbiil2rqG7so?=
 =?iso-8859-2?Q?wasJeeASyBFf1oDSy382BiGBoNUvi2Vc+OiU+T0GmV6hP+nR+9ZMJsXAh9?=
 =?iso-8859-2?Q?vP8AYtcKn6fTAQyiH01r/9HwXgpVsuTP0+/UdTsIWnQn0xGw9S/1EbjISx?=
 =?iso-8859-2?Q?i9PYF4dtpMXhGJHd3ZcGdMT6KM3Y2GwqijAH2sIHBy9vj2elbk6i5mPBAk?=
 =?iso-8859-2?Q?ZBse6aZlBdcyMzWasINykk8B42Hl8jQkfksYpLbxK2ltX7eWF5/s9smNef?=
 =?iso-8859-2?Q?z5hl4ptpPKgICA+HqLaZeYwa+aD3Kl3zAYuUiteLTd3Oep5RrK8FrvnBRW?=
 =?iso-8859-2?Q?SzXNIs1/GucYbbqorb4Th+6t2a4VBWTM7xBKkkPtfr8BDZbSMocInS3ByG?=
 =?iso-8859-2?Q?eY+ObYIGdC7glQ1TzrQ/kQQ2xZ9mbN5uEF0l/FzoEq/KfehaUX7DAvrWDg?=
 =?iso-8859-2?Q?/MQSJtZwr9jMxurwU6+pRIMnk3Ri6SsA2gA/ty+jJlLQw4ppF3Ot71mpr7?=
 =?iso-8859-2?Q?vmv+Sk/O+lVP8PkiSK3qwMNC8QSmCbpkG8iLVVooeCkqwkT4KD1glhhEUi?=
 =?iso-8859-2?Q?aNjsKkxsMwP4UksnETFvH5kYG5GI1hk+MAftUXS19cvqUZ285PnaHYwKLd?=
 =?iso-8859-2?Q?xmZ2oL22wcixEiODf9DPcrQ6jnAu25ELHgVDIqrtORLU2IjQ93s4q9Xm+b?=
 =?iso-8859-2?Q?jBQ5C+ahSUKR+6jfL0H9qaK+o/v0w9m8G5GnOE/SSY7TRB9r8IjpH3i8xQ?=
 =?iso-8859-2?Q?s+IAb6WMDTKtqtpLM9tgDnm/g9fol9ZbZzQ1glOgTRnKtuOiTVzmvMr4Wz?=
 =?iso-8859-2?Q?KJtVF2me7r9bfuclVptEBhj6MthSAVoxlZB488iO7+DlpPga5gND8+Jjb3?=
 =?iso-8859-2?Q?00FN5qrT+4EL07T9K5EbZP+3Hb1MS/NN0blmNQkt+VOlkz/0Spzsymeby3?=
 =?iso-8859-2?Q?zAYbMclTolz8R1UcC5YXpYn6gfG//CobtvEzakPLDRmEX0lIPx8eiD8GFx?=
 =?iso-8859-2?Q?sWFK+o17oANh3FEw7F3sNktWAa5gon01pd7Jb8WCuNou1c7zKEuVvEDg3+?=
 =?iso-8859-2?Q?zc8U8yJmr/OvOjTq2TA+57oS/bNrDpa8Sb5j7dfccw6AkZD32hHEkAar93?=
 =?iso-8859-2?Q?f1hTFSXiEZDVfoFmIx+ep1cp8Ltt0Wi5xBmbZMcNo/Q+trP6KxhR2JGJMf?=
 =?iso-8859-2?Q?jb+5ue7V7eGExPHGBg63V3qxKQDvyl5HytpW7qYxCNbdA8gR7Oy2fCb9cQ?=
 =?iso-8859-2?Q?VW/M7b652jG8Ne927uj9IzMOH0TtG4z1rjiAa8taaZK4/OLsTe2ePSJEwf?=
 =?iso-8859-2?Q?tkpr7omZVxYOYximQHXMdKQeOy4NCIB+YMpiPjGYPpJJJLc3OQ5yEQrB4G?=
 =?iso-8859-2?Q?emiSdMGhZ+L8rYXbRRaWCnF+LrmUFNWX4e8XxZr5ZMtwNX6ZHvFljtrGQc?=
 =?iso-8859-2?Q?zwiHMuUw6GdtIsAdB5yJuKuv8zkNhPDJ2ROJObQawAlK5B9n7aZBLkMHsq?=
 =?iso-8859-2?Q?zB7nfr7CeJTy7Sct1caEYDyP6IYilsxSpRjJr8s4cVIQCp1A6ZvtxaIocB?=
 =?iso-8859-2?Q?/1j0sTjT+jPSv6ixouZ6H+LJgfb6UfZnUo2vIDank+IKm8JQSHJkAQ1Mfb?=
 =?iso-8859-2?Q?Xf?=
x-ms-exchange-antispam-messagedata-1: seBJ7almZDtsOA==
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB17316072167BD2A00BB3E675F1C12AM9P189MB1731EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2e5ca2-e7c6-4f28-a1ef-08dee7ed2953
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 12:31:31.9771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQVyRkdsPPK4L00xsQV5PsEp9e14xZpOsM9cwgoutoyAkEaVtw9S561qC2uFcmJY6+YV4uiTbyDGbMjBwKvXhL3GlYQLiug73UcOsz1Mt20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241667

--_000_AM9P189MB17316072167BD2A00BB3E675F1C12AM9P189MB1731EURP_
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
Subject: [OE-core][scarthgap][PATCH 1/4] gawk: Fix CVE-2026-40467

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit =
shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Da2d18c7410=
9e41bec29a23098eba2e00057286d8
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40467

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40467.patch            | 63 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40467.patch
new file mode 100644
index 0000000000..d813db5f8b
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
@@ -0,0 +1,63 @@
+From 22fd9e360251f70b34e9b46635b6d75bce49202f Mon Sep 17 00:00:00 2001
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
+index 2fa8b2f0..6bc88ebb 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
++
++      * io.c (do_getline_redir): Don't DEREF redir_exp too early.
++      Thanks to Micha=B3 Majchrowicz <mmajchrowicz@afine.com>
++      for the report.
++
+ 2023-11-02         Arnold D. Robbins     <arnold@skeeve.com>
+
+        * 5.3.0: Release tar ball made.
+diff --git a/io.c b/io.c
+index 44671ebd..4db4b21d 100644
+--- a/io.c
++++ b/io.c
+@@ -2836,22 +2836,25 @@ do_getline_redir(int into_variable, enum redirval =
redirtype)
+        assert(redirtype !=3D redirect_none);
+        redir_exp =3D TOP();
+        rp =3D redirect(redir_exp, redirtype, & redir_error, false);
+-      DEREF(redir_exp);
+        decr_sp();
+        if (rp =3D=3D NULL) {
+                if (redir_error) { /* failed redirect */
+                        if (! do_traditional)
+                                update_ERRNO_int(redir_error);
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
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.3.0.bb
index b1d1fe7ae4..56d7d7f76a 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
            file://0001-Fix-some-C23-compilatio-issues.patch \
+           file://CVE-2026-40467.patch \
            "

 SRC_URI[sha256sum] =3D "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb5=
5e440d30273336"
--
2.35.6


--_000_AM9P189MB17316072167BD2A00BB3E675F1C12AM9P189MB1731EURP_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
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
<b>Subject:</b> [OE-core][scarthgap][PATCH 1/4] gawk: Fix CVE-2026-40467</f=
ont>
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
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 63 +++++++++++++++++++<br>
&nbsp;meta/recipes-extended/gawk/gawk_5.3.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&nbsp;2 files changed, 64 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.pat=
ch<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40467.patch<br>
new file mode 100644<br>
index 0000000000..d813db5f8b<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch<br>
@@ -0,0 +1,63 @@<br>
+From 22fd9e360251f70b34e9b46635b6d75bce49202f Mon Sep 17 00:00:00 2001<br>
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
+index 2fa8b2f0..6bc88ebb 100644<br>
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
+ 2023-11-02&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 5.3.0: Release tar ball made.=
<br>
+diff --git a/io.c b/io.c<br>
+index 44671ebd..4db4b21d 100644<br>
+--- a/io.c<br>
++++ b/io.c<br>
+@@ -2836,22 +2836,25 @@ do_getline_redir(int into_variable, enum redirval =
redirtype)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(redirtype !=3D redirect_=
none);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; redir_exp =3D TOP();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rp =3D redirect(redir_exp, redi=
rtype, &amp; redir_error, false);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEREF(redir_exp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decr_sp();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rp =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (redir_error) { /* failed redirect */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! do_t=
raditional)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_ERRNO_int(redir_error);<br>
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
+2.44.4<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.3.0.bb<br>
index b1d1fe7ae4..56d7d7f76a 100644<br>
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb<br>
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb<br>
@@ -22,6 +22,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-m4-readline-add-missing-includes.patch">file://0001-m4-read=
line-add-missing-includes.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Fix-some-C23-compilatio-issues.patch">file://0001-Fix-some-=
C23-compilatio-issues.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-40467.patch">file://CVE-2026-40467.patch</a> \<br>
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

--_000_AM9P189MB17316072167BD2A00BB3E675F1C12AM9P189MB1731EURP_--

