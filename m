Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3272EC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:43:24 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47276.1784724196765637714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=EZ23Iq/H;
 spf=pass (domain: est.tech, ip: 40.107.130.10, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OePTEsL0TYBO/xXaT7GDhtVqq2dm2+ATBioFKto1jrl+zH6aX/M2UhXrtBNgk5u2gdlXAZvoqXYRAkSEPTwCiuYEmo5aPdbc1w+JK0ZewmIKAVAxrmxlFDwApJRHI1bUv0qpPiVtXNRsqTHQ6PKfaxci1iUyD+zhE4AoDBPi/BjcTnel99fs1WHzCVtx32zBA1yjqJjZWAJqNSV/VIrho/b5FyLxw/MiQ1Ih2qvs1AwK//VSMwGNlagsHF+0oiauOXJ+pYin5TxdlLy855QxsZihGxJu02Thqn0lPw8v4rp3em4FUMe1+fVexNPpXnmstDpGBVX6Wo7Mai+zRLTfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWOlgmy2mNqYdbJ6i33aZgqKN8y2WeUmiYKqICOzByk=;
 b=IXxRT9mtDmcDhhM4nunbn/ZUM94hN9MWyvGlYwFebMxvqm6x2lsoecLnYDic8GSgkv+cwTd5W1AN90w8AcO1WEwsBQCXEzA332+zHiiTmenONBUSJsxU9o6xFiDmgFsUgFyu8K6050YHOkgiwGLgsYyLoOJXxRfRLJmghhLD4soYIS94AJZBxJdwMeByWe17sa2SGY0NWVCgxDBkQaHd4ACwQRYtswG5IKTfT6c0Bjc+jg3+UiNlrS/Zu9mPF5nbm5+HgvVsE7/NmEpIiXAE65qJPiA/IAkFWW2D5eejNoVM13/azlyg8JpIfAMj3Ml+TeGdVyAgZTJJ8VR7LVJOWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWOlgmy2mNqYdbJ6i33aZgqKN8y2WeUmiYKqICOzByk=;
 b=EZ23Iq/HEHXQw1g3TCR6P7HRrBUthf+iBac64BB++C11cbdBzdWFCPz/DhWQwPrK8GDSrA724YjRjK51MamtsDVo2dOeoI4YCEzxWzx0eR+Z4sEdpSp/9kVbpK2djONmC87KNebxeeHuvOludKsEh6BSOgmpqM7OXGu4A6tdSeWgcnS8bCj/glUWVMo7iy4N5s+cx8gxsKFshswaeqONhHU5mO0NwJlepe88qbzeVeOWaKEBd8jxiK3U/HyVICzIb5m3QyD6geSux47alHqlMMnzJAANNfFDijTWJZ5zGh4lvuNPdNRWz1BEWUaz/S7agDkDh5mr708QZ5qeceLDYg==
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DB9P189MB3525.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:43:12 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 12:43:12 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dkelaiya@cisco.com"
	<dkelaiya@cisco.com>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 3/4] gawk: Fix CVE-2026-40469
Thread-Topic: [OE-core][wrynose][PATCH 3/4] gawk: Fix CVE-2026-40469
Thread-Index: AQHdGcA4QAke6Hn9nkaNeysyAGcCFLZ5e8Te
Date: Wed, 22 Jul 2026 12:43:12 +0000
Message-ID: 
 <AM9P189MB173134BF9B149B749A6941E1F1C12@AM9P189MB1731.EURP189.PROD.OUTLOOK.COM>
References: <20260722095430.1416791-1-dkelaiya@cisco.com>
 <20260722095430.1416791-3-dkelaiya@cisco.com>
In-Reply-To: <20260722095430.1416791-3-dkelaiya@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1731:EE_|DB9P189MB3525:EE_
x-ms-office365-filtering-correlation-id: 07d7c129-f93c-4602-8fbc-08dee7eecb03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|23010399003|13003099007|6133799003|22082099003|18002099003|38070700021|8096899003|11063799006|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info: 
 Hp6fSDAOml/8pg+hsE73BsqBJMQ+53Dtols4PuS+0zhlKO+m/Rdu/BswU9ddZh3J7V8lE3AD9SzcJOHtHi4h8BnoATFExUO3kT1tPC+SyIin0skbvW/GI9DGrnn+vXkhS+w4Negq/zdtQyC1LgjRbDCrbYtUg2xJU2yzutQBsoH3UXUsKJnwDTl2k8EAZGwi0j5xNUEfnoN0qGZg/MhRWyOAgk5+9G5J/Mi2ze7IM7CVvBvsoDc5k4e8a168x88Edo43TEPmf7Ek64Xjs+1qy1QtWuE9gTVq/w/WtL0rOq2+1VmKda8wmzYV/9V/OlisW+O/I5Mn/xrJDI0I5LET7C1b3krLayrvkN5SmJKgdddlBi0wL4LRJUASvv46Jf6hRcE2mhKm8/+tlNhXwu1BYVWKrZbt/B+KFRPfvBPg7JRCoeSOpkPeE6w7tgbDjmHzztKbtS/0NlZ5fzFFLDbKE3mmytEs3i9OF2HXZyoz+OI709SGqEXjjbxfFSVgRQnk+OG3T6xZEIlOz7Q9TDQ8sin9DUfroxy1inwgr9aBE97TWkva3DbK2abCHBzsrc5bTPJSYNYlwysencUR3HxR3ZtdEtkw2RlQGdbiLUjP03y2sn7w22uCmJVtQJsZl40BXa/r3zyxDj7k3aQ2oOb2vlp1tcrSyyqn+TmZ//CCXs0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(13003099007)(6133799003)(22082099003)(18002099003)(38070700021)(8096899003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?fJ5OopLar6b4062CQPzyL6WC27J5sKY0Zni0xxfkc5kw3/SYNLxWSWvuIQ?=
 =?iso-8859-2?Q?16j1GTvuuo7ceR0IzGTmdBkpS/cQQqD0QZsJV4cd6izZEAkfG6qWbTvgrY?=
 =?iso-8859-2?Q?qwrkYs+h4txg5YajyYZedqaD1uyHRCUCjZ6SCA0xySdDm3CRVjBKCa3gfx?=
 =?iso-8859-2?Q?os4TBewB9Op5g5HptwbYC0h0LSvSLzi7bEGV2bvTmDFcrsOXR0h0tsK94v?=
 =?iso-8859-2?Q?RI5VJn5+j3EGeQGT8q3Kk7eDIHj+eFZ67yJKUafJhFZSPV879Z8js9TCyY?=
 =?iso-8859-2?Q?djP0x+042uro0nPQadqBE0TDXKTCQ0Cct6SMKZCJjbm1pkfdvD2yoFVCTA?=
 =?iso-8859-2?Q?HuzgcJfJLDwYjO/Jj2xMhHNDsl/TGXGzWajsBJYlkB6qbtdMSZhPhMEPdv?=
 =?iso-8859-2?Q?OcpXVAEFltoRwE9d5s3hx3IQBIdWdx1J+fsy/TBtIou6Hc1QAP9kK6EJ0R?=
 =?iso-8859-2?Q?P7E1cpgrdSVCiOoxEcAPTNXOyPrDP4rF+WF2cI3vCASYh0TixKbt9ZqOZN?=
 =?iso-8859-2?Q?FPbvUCaPovNlNk6FsCd+nw1NnMjxaawLC0BWb0QSW3FeSLrT2HHV8MHNIB?=
 =?iso-8859-2?Q?IzNR53QCCkgVt5fNOi92tmmYvKbSkfSPhuKQVDyt7BFghKE1dXPNlKtG+k?=
 =?iso-8859-2?Q?UHAY8DG7MmbdsUh3sonYS5myveGlE+TqFdY5UuSreF/+lnzr67O81xT8oI?=
 =?iso-8859-2?Q?rWBARVf/K6GlhO8NrXmcujX4MsQHAgIpYJ1PlFr1S8DL9eRGFIDJadWFMT?=
 =?iso-8859-2?Q?2iYb9A2rhtuINpd/QbVlW778p2LAgBy9FUTVWUPrLdK3rncEFFxogLehka?=
 =?iso-8859-2?Q?0i7IUDXYwZORJxcypIW+o1eGnGGwua3GxdigZf/gsSSvwN5sItKiWntIku?=
 =?iso-8859-2?Q?+R6l5DMxgas27/vIja8lJHA7vhrtdKqwFCAW69MdQ3PXM4RCL1t8jP1XXB?=
 =?iso-8859-2?Q?p/PM+uYgjeEAvyLwgZpgFZB4wCgLdk7I5kePKteJKTA5u3yR8SnWQnPDNV?=
 =?iso-8859-2?Q?6ecelf33txcnU9W1C4S+x4A0QODnJZ/aWaxGx5hHbFqWH+uuHdktUrZz5w?=
 =?iso-8859-2?Q?8r3Mhtbn8NsWhpoO5hviyTHmM78OxuFYCUPvjBeTxSLK8Ut/tfxM/fnsik?=
 =?iso-8859-2?Q?386FRIz5n/fu3OwGXs8WISuUryPKVOVkDy4BIEWzsPXH4gMQU9xIqLemr2?=
 =?iso-8859-2?Q?8Pw8mXPC3wdFbmg1YWAnMpeF2MoFXO2Uy8HZ9s8f/OW0JO6wn3EH8C0yT4?=
 =?iso-8859-2?Q?4VJ9YVnl8gwSd6u+d2NSg722kFM0IxcXS/CEgNPDQtrvry+T/MUeSURGR0?=
 =?iso-8859-2?Q?fjlH012JC+IbGsP1Cg8oNFFupHmQVQXb0y9iNQTpZ6+6g/QwP0mzE6GTI2?=
 =?iso-8859-2?Q?INmdvSabNa797hnpZEy1XOBJLFmM4+S0xRwEyXXeF8ZKa1fwAJk4W+YA9B?=
 =?iso-8859-2?Q?ZNamzyKqhKjZny9X3F8wrzWmy+dHAgzRxsiqrB861fvhXvhCfKLzTkpQnn?=
 =?iso-8859-2?Q?qBpVMdSGVJaWAm2abPwVP+KhrXIGeZAMLiKOwNnv61OVF6q5ADux8fiJ18?=
 =?iso-8859-2?Q?H3aN3if/a2zHSH8/bjVtYiszpd7Imkq/Qj9zY64KM6PuI8tQVXOJLqQBRE?=
 =?iso-8859-2?Q?9439jZbNCsEtvC9X3DLQuOvoVeelSmcmDkXzlVhcht3jdhmzqYAR76zbNA?=
 =?iso-8859-2?Q?hm9lYz8diVdmsruvmXUXqZ/W8ANz2HkR7s8dM9HhnYP5dq+0g8fFwLqPut?=
 =?iso-8859-2?Q?MB2ujMrs1qXXozAZfSd0tWc6l4eBfQnin8JckzNaYAdvekzuG98Kaw2AIa?=
 =?iso-8859-2?Q?CfGzmhxn71/a4H3IPPDmHeYLvRxAjYk4hNx9SOWZR2C9izyzZIxg2MBsXc?=
 =?iso-8859-2?Q?kj?=
x-ms-exchange-antispam-messagedata-1: rwh+LA7UNqys0w==
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB173134BF9B149B749A6941E1F1C12AM9P189MB1731EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d7c129-f93c-4602-8fbc-08dee7eecb03
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 12:43:12.7023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fiXY+JSAN+3j4ywd5Rck1J6e1ZXDtFwOGn9o8xMynPl1ifIveg6Tnwnb+HRgUHXs0dy4Ta+j5CLoEkOMogwwtAoyhO46YzpE+fNNG+WmStM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241685

--_000_AM9P189MB173134BF9B149B749A6941E1F1C12AM9P189MB1731EURP_
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
Subject: [OE-core][wrynose][PATCH 3/4] gawk: Fix CVE-2026-40469

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
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40469.patch
new file mode 100644
index 0000000000..73cda824a7
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
@@ -0,0 +1,90 @@
+From 436584a4302b1c6da55080c0a0408a98e551ea7e Mon Sep 17 00:00:00 2001
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
+index 8cdf90f6..c1b2e7f4 100644
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
+index d0e083da..3906d507 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -1820,11 +1820,13 @@ do_sub(int nargs, unsigned int flags)
+        bool lastmatchnonzero;
+        char *mb_indices =3D NULL;
+        int searchflags =3D RE_NEED_START;
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
+@@ -1856,11 +1858,9 @@ do_sub(int nargs, unsigned int flags)
+                DEREF(glob_flag);
+                searchflags |=3D RE_NEED_SUB;
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
+@@ -1976,6 +1976,21 @@ do_sub(int nargs, unsigned int flags)
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
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.0.bb
index 345103a7f0..a7c88224dd 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://0001-configure.ac-re-enable-disabled-printf-features.pat=
ch \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
+           file://CVE-2026-40469.patch \
            "

 SRC_URI[sha256sum] =3D "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc26=
8ca428a90b4ac1"
--
2.35.6


--_000_AM9P189MB173134BF9B149B749A6941E1F1C12AM9P189MB1731EURP_
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
<b>Subject:</b> [OE-core][wrynose][PATCH 3/4] gawk: Fix CVE-2026-40469</fon=
t>
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
&nbsp;meta/recipes-extended/gawk/gawk_5.4.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&nbsp;2 files changed, 91 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.pat=
ch<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40469.patch<br>
new file mode 100644<br>
index 0000000000..73cda824a7<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch<br>
@@ -0,0 +1,90 @@<br>
+From 436584a4302b1c6da55080c0a0408a98e551ea7e Mon Sep 17 00:00:00 2001<br>
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
+index 8cdf90f6..c1b2e7f4 100644<br>
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
+index d0e083da..3906d507 100644<br>
+--- a/builtin.c<br>
++++ b/builtin.c<br>
+@@ -1820,11 +1820,13 @@ do_sub(int nargs, unsigned int flags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool lastmatchnonzero;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *mb_indices =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int searchflags =3D RE_NEED_STA=
RT;<br>
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
+@@ -1856,11 +1858,9 @@ do_sub(int nargs, unsigned int flags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; DEREF(glob_flag);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; searchflags |=3D RE_NEED_SUB;<br>
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
+@@ -1976,6 +1976,21 @@ do_sub(int nargs, unsigned int flags)<br>
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
+2.53.0<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.0.bb<br>
index 345103a7f0..a7c88224dd 100644<br>
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb<br>
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb<br>
@@ -30,6 +30,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-configure.ac-re-enable-disabled-printf-features.patch">
file://0001-configure.ac-re-enable-disabled-printf-features.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40467.patch">file://CVE-2026-40467.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40468.patch">file://CVE-2026-40468.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-40469.patch">file://CVE-2026-40469.patch</a> \<br>
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

--_000_AM9P189MB173134BF9B149B749A6941E1F1C12AM9P189MB1731EURP_--

