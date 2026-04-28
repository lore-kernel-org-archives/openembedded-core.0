Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89264FF886C
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 08:57:59 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8429.1777365782025421782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 01:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=BSbnDBxU;
 spf=pass (domain: est.tech, ip: 52.101.70.55, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=St70L9T5OINyCiIKw+konWMY3DqukVjjylYYCMRfIi4T3PfTLb1ZZlGjpdwdCLHa1zA9GmIrUQIphSawWXFnUQc4LRIzS6PtZNqAKU/razQxzyRgI3jcjfPJau03PorX5wL2OO6wGZHCKz5x7NFyhpGSg2woHSAA9CJqhiRGQCAHJDpnETRWTuG3eEi6Q9pyljkHnNmBZggZrkQurQUrGEh+fItxTEgjv2+ZeNKFQRkWmodjmOMBAS7kC1Px+ck/jhQTIi2rPxcw37lJNRb3J+lj3mMNZTdqafc9Dzcbjjr0ygLQKlYiWI+Hqay6tzt6CXbwjxyP/MvAe95xDDZwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLMowKLP71D9WaViPcaV6A0yQrcQiQIVDOB1pYdnWO0=;
 b=lkEdbso6ne17zlUF+6i7TNIKyF8CytI1SqtHsTVEoTY10/qugrrLhlHir3KqbY+EEJOOOYSWWBHeP6lPxSoTetEtGUrQRRk1208tclQzvjgfZnmPsdl/B/L4dGsVeRpI48jYlavFFpuUkM+ORBjvO55P7/B3Ew1i3TxGD2WhkX6J3/7sgitON6CBZB1TE3K6Rg2WX2ECBdVdX0DhgB8UhbA2xhb5QbNSXxKiFxHbUryyVIu30cjnYoa8NAecUeSd0QyRvKTdGwU4c+1FSHUcTfWe9/8HmG5SivvBkKBQ3yQGUMskc1xF3mX7kN1jievbj0nohYurKfPxc4OQCe6fsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLMowKLP71D9WaViPcaV6A0yQrcQiQIVDOB1pYdnWO0=;
 b=BSbnDBxUTNNCCPza9dyvtOMM9oayCvKdd41HENohokkCkuCcZJfYZth8qvUr1lBhp0A+CL+X21kn6aJejlDxYkh0KXm4oN7ixhx1i/x1uItCRYFQm3HFayjpIvDbpi4u3Ea1GBJvdn72wIWNEr7Zhr/anPFuLsDdLdx5GKfQFdqMdlePJCgFGGOvjWgHsh8tXVri62pMd2vm8kO4ofDwlfIAxPN2g10aQab3ZyXm5Z/N8cKLj9P5qNk+AriXxkW2TvRXM3+52jqO/EHWpM+3iHwLM6SfMpYRgA6s1qMhjt+g0NR76L0Qr8L34VE5IdVTXPqdAy6BssKshEjPBrpg4w==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PA1P189MB3441.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:42:58 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 08:42:57 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Fabien Thomas <fabien.thomas@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 2/4] binutils: fix CVE-2025-69648
Thread-Topic: [OE-core][scarthgap][PATCH 2/4] binutils: fix CVE-2025-69648
Thread-Index: AQHc0lh026LlsSfNi0SGEutLPT8JvLXzEZ8AgAEe7s0=
Date: Tue, 28 Apr 2026 08:42:57 +0000
Message-ID: 
 <AS8P189MB167210CB6211A28587E8EAA5B3372@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260422130342.386379-1-adarsh.jagadish.kamini@est.tech>
 <DI41OMP4G56B.27ZI7H01HB7KW@smile.fr>
In-Reply-To: <DI41OMP4G56B.27ZI7H01HB7KW@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|PA1P189MB3441:EE_
x-ms-office365-filtering-correlation-id: 6e61330d-d33d-45f8-dde0-08dea50225e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 WANPuCacMEXkmKC650Y3NU3Xj8x1ZaZ9JjO+TO31iQLDpS3jSzzkn4gfUqoKaTsL3RSg9SIvvMMYXqn67LC+JxvkK0u/QdGjPG/JJmqLjiAm2X172K5bRE8fd0bI3t7ppAv5DiMFoozmipvBNxI/dIYlfYUCQJsNXlSQ4K48CS3XXgSDQ9dj0t4nBZCSZQ2eNNkxuf3MM0zhM+8V6mRtWg46C0JNAVFfDLibIqMi+Nfb18PVGU+Bfv6mbC++MEfyregkpEBgpjOLsLLdmeAGXQPO9bimLfLKnvDEmtnXRMswhwZ52psAkukTILHymFJ7XdKS2lxUgLfen72XfFdG+MF58ZzP4nZduo9wJ+IDMNrXYznB4ZUJsnddGLnMpR+Eu2ffOENPcPbaSEnHkjf43egM8Rl542mYNJJs2Ok0sZbgmRn4ncTvgm1YxzYFo+4aRyO8fOPP27o0y6Ft7vs/Cck1RGmw2XpSQhTh6yvcw7kgf11Ext1zLEstW3Ia2wCqdU9qnV6FF1OQ4AMfWwl4raQPeaTu+VQFXOJ1NONVlvSwHiX2hny6oRMdYYg0exbYeNfz3jvt9Xv/tw19D2wcvEoNXGxmVShB3ehsuX7XDl7fEhIRx38FpRWPQkdriaWpa7zukDUvcPvYYQYhV8uOmrmUDQeWeHz4LCDH5rxgwTMfNdT4kfG+kx66E7a8QvRlGJYsTIkGWcq9ikjIIOLoPFxDdClsqkAi7F7lKqa3X/a0dNdMGcAhz9+ReCYfnZCN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?z09txPyWwhMm5yzhzLAi9H/b1v0LKJTZ2DCIFlAl20K/pE5W70Ikc7/Z?=
 =?Windows-1252?Q?j5xrl1JmDjSCg8+i/oXellFfHUAvViltmzwDOSm9Hf+OHCwoPaPrdr4b?=
 =?Windows-1252?Q?nkYnSxNulQzKf2iNljyWf91RuIic5CCy3rDPo2GPrmMEO12/9RQpHad7?=
 =?Windows-1252?Q?uvcksPf0Uy4MCbZFrAmCnegDESQvTNcdDW2t+m/CIlFg2MfcXexaa8r5?=
 =?Windows-1252?Q?MO3sv0rAEM/YEtlRNMnI4knO4Gzzd9Vc5UAEDrwSf4nRSQ+xnCKILUZq?=
 =?Windows-1252?Q?a/tx4jh8Q/xn/RYaZOr1XXj5PkXpW+keXJ8POFJBQ94KhlZGokmSmxE4?=
 =?Windows-1252?Q?zc2JLfRsCAca8hPSfBf0C0IhtET7iijEveAhHPKoroxxRau7M0f6TDAs?=
 =?Windows-1252?Q?jOexVuFPMzhno9FkhjyUWSYXDRWVOyqp/9uY1BrxM4OZgL/TCSXjBHRL?=
 =?Windows-1252?Q?9sfmdUAm+St5fi1cmuVtbofOLhbwcExp/mieJJ2L/OmZAdSXZ3wlxa2c?=
 =?Windows-1252?Q?BWPhvQKW3Q+8QRMZ4rv55xPwanu1IwohGanF3fsUcZOg4WQZpGH9T1PY?=
 =?Windows-1252?Q?hzj8Jy5OmS5pWGXRD95RjuMv1B6VQv0gD6y8ID4Aodw0O2bsRiE9Dj9L?=
 =?Windows-1252?Q?A8iJavxV8ah1vUeEjMDqoy+MBNAgUolpHwLz+Cp78cPiHymiRmOXzVb0?=
 =?Windows-1252?Q?/6cVlBLD/1vJHx88ZRICPmBEtPaWd3G9pIUh8lKdFjvUZtAGw6AWW7dV?=
 =?Windows-1252?Q?xSwR80vYpQFc4Tf/9IBYjaXDGMXRdEpgJlXWK5Zyp19V/DI2OKWcxFJV?=
 =?Windows-1252?Q?RaIbcdgZHm03x6gRQqBTANdy6PQXfmEecJG4eSq2RpxC5M4DK3PyJM9y?=
 =?Windows-1252?Q?6WxBtXGo+G7+VsxzB2NFQ65c0snayTwyZiGCrZnXDHfx8QOCWAZt7tgq?=
 =?Windows-1252?Q?jecAL08XYUOjR5+lxTcKVvNRkrcjSCSgOfOs9Bg+2Bh7cSrZLRyKlCyx?=
 =?Windows-1252?Q?Zz3HsGRRB9F3s2UTznnE/Ek4u32cr2y+NdEUXb/K3tFjb/oxkO9ZifUl?=
 =?Windows-1252?Q?ZKr7qYe9JE7WOnZv+Hgyy0jyfbUUFG8RIRmuwIF7TY/eBQJFDIVhkxz7?=
 =?Windows-1252?Q?blyusO+p3GZwLY5nEhG6n+lgQI3VHnV0XOQ5GpBhSA5DZMAfun3ZCKdd?=
 =?Windows-1252?Q?ui3YHXR5alYXoWO9mx0X4uUcKonNUFfFPIclZoTothREDETs11Wy7D7e?=
 =?Windows-1252?Q?asJPpiFG3GJJGDsl8bxRg3GbiZv02uuCMbcCvIJw7NCtPI2GT8bLiCe+?=
 =?Windows-1252?Q?MHCqIQQqOGbEEhruOffyzIya1TfIoxYX2H/2Wj6BsTexT7EOiURmd9CD?=
 =?Windows-1252?Q?MsQWVN7JDzSMAJ0NFbKHuSPesk+duy0Zf11XA6EzSUpjyXRJICiVSs+q?=
 =?Windows-1252?Q?2z09LrHxVClEwjyrRWdAm9eCmG0gomt2Fk1Fp5d9SbD/2ITDMEgq//bz?=
 =?Windows-1252?Q?Icm6EdcfymdVNVnxoiQBRNu9rYoObK+AQYN4NhTqxfYNIfh8KBaJSBec?=
 =?Windows-1252?Q?2n671RJp6piAG8YpqHwz1HK4E6kK/A2jDeHX33gd7eBSrE4xnZCVbk+8?=
 =?Windows-1252?Q?FFBLglMNNNRwJOc8iP4HXXOs0KyojLkLXqtBHr6fy3KEOl0zRg3IxPGg?=
 =?Windows-1252?Q?+leCEhqm16Mh2dMab7gwDKwhouNHVf8AFPUyBXO0GbRP1ZhFYdJQnjll?=
 =?Windows-1252?Q?mcSSIsQ2LZe+Q+vvkrAjcpMusYA/bQ4RoyZXkHArmIrFTFs5AhvIdqG2?=
 =?Windows-1252?Q?WkEF1WB6CLxhTVOGLoMyKn3BEiyps867avdiqJ/ycxPIbaFSs38IHEXk?=
 =?Windows-1252?Q?7BeQrz0lDudPnRUNlgTzudI0mccTWjNsv4I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e61330d-d33d-45f8-dde0-08dea50225e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 08:42:57.7189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+HeP9nhg2cBCkI66nKFiBaVfaQf2tk0yXb3xwh7kztRR0Tm+ldwAFOipURuezJ0T2QOGZVZm/eD5sI/REIZpTZz+vm4yZ3AT3r4cChu5Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3441
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB167210CB6211A28587E8EAA5B3372AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 08:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236046

--_000_AS8P189MB167210CB6211A28587E8EAA5B3372AS8P189MB1672EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
The original patch was submitted to whinlatter by Deepak. So, I kept it to =
pass the credits.

Thanks!
________________________________
From: Fabien Thomas <fabien.thomas@smile.fr>
Sent: Monday, April 27, 2026 17:33
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 2/4] binutils: fix CVE-2025-69648

On Wed Apr 22, 2026 at 3:03 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Backport upstream fix for CVE-2025-69648 [1].
>
> [1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D598704=
a00cbac5e85c2bedd363357b5bf6fcee33
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../binutils/binutils-2.42.inc                |   1 +
>  .../binutils/binutils/CVE-2025-69648.patch    | 190 ++++++++++++++++++
>  2 files changed, 191 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
8.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index a337a3e850..6c1f9dc870 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -72,5 +72,6 @@ SRC_URI =3D "\
>       file://0029-CVE-2025-11839.patch \
>       file://0030-CVE-2025-11840.patch \
>       file://CVE-2025-69647.patch \
> +     file://CVE-2025-69648.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> new file mode 100644
> index 0000000000..e04d7ed6c2
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> @@ -0,0 +1,190 @@
> +From 7df481dd76c05c89782721e9df5468be829c356b Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Sat, 22 Nov 2025 09:22:10 +1030
> +Subject: [PATCH] PR 33638, debug_rnglists output
> +
> +The fuzzed testcase in this PR continuously outputs an error about
> +the debug_rnglists header.  Fixed by taking notice of the error and
> +stopping output.  The patch also limits the length in all cases, not
> +just when a relocation is present, and limits the offset entry count
> +read from the header.  I removed the warning and the test for relocs
> +because the code can't work reliably with unresolved relocs in the
> +length field.
> +
> +     PR 33638
> +     * dwarf.c (display_debug_rnglists_list): Return bool.  Rename
> +     "inital_length" to plain "length".  Verify length is large
> +     enough to read header.  Limit length to rest of section.
> +     Similarly limit offset_entry_count.
> +     (display_debug_ranges): Check display_debug_rnglists_unit_header
> +     return status.  Stop output on error.
> +
> +CVE: CVE-2025-69648
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33]
> +
> +(cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
> + 1 file changed, 34 insertions(+), 33 deletions(-)
> +
> +diff --git a/binutils/dwarf.c b/binutils/dwarf.c
> +index f4bcb677761..b4fb56351ec 100644
> +--- a/binutils/dwarf.c
> ++++ b/binutils/dwarf.c
> +@@ -8282,7 +8282,7 @@ display_debug_rnglists_list (unsigned char * start=
,
> +   return start;
> + }
> +
> +-static int
> ++static bool
> + display_debug_rnglists_unit_header (struct dwarf_section *  section,
> +                                  uint64_t *              unit_offset,
> +                                  unsigned char *         poffset_size)
> +@@ -8290,7 +8290,8 @@ display_debug_rnglists_unit_header (struct dwarf_s=
ection *  section,
> +   uint64_t        start_offset =3D *unit_offset;
> +   unsigned char * p =3D section->start + start_offset;
> +   unsigned char * finish =3D section->start + section->size;
> +-  uint64_t        initial_length;
> ++  unsigned char * hdr;
> ++  uint64_t        length;
> +   unsigned char   segment_selector_size;
> +   unsigned int    offset_entry_count;
> +   unsigned int    i;
> +@@ -8299,66 +8300,59 @@ display_debug_rnglists_unit_header (struct dwarf=
_section *  section,
> +   unsigned char   offset_size;
> +
> +   /* Get and check the length of the block.  */
> +-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
> ++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
> +
> +-  if (initial_length =3D=3D 0xffffffff)
> ++  if (length =3D=3D 0xffffffff)
> +     {
> +       /* This section is 64-bit DWARF 3.  */
> +-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
> ++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
> +       *poffset_size =3D offset_size =3D 8;
> +     }
> +   else
> +     *poffset_size =3D offset_size =3D 4;
> +
> +-  if (initial_length > (size_t) (finish - p))
> +-    {
> +-      /* If the length field has a relocation against it, then we shoul=
d
> +-     not complain if it is inaccurate (and probably negative).
> +-     It is copied from .debug_line handling code.  */
> +-      if (reloc_at (section, (p - section->start) - offset_size))
> +-    initial_length =3D finish - p;
> +-      else
> +-    {
> +-      warn (_("The length field (%#" PRIx64
> +-              ") in the debug_rnglists header is wrong"
> +-              " - the section is too small\n"),
> +-            initial_length);
> +-      return 0;
> +-    }
> +-    }
> +-
> +-  /* Report the next unit offset to the caller.  */
> +-  *unit_offset =3D (p - section->start) + initial_length;
> ++  if (length < 8)
> ++    return false;
> +
> +   /* Get the other fields in the header.  */
> ++  hdr =3D p;
> +   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
> +   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
> +   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
> +   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
> +
> +   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
> +-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
> ++  printf (_("  Length:          %#" PRIx64 "\n"), length);
> +   printf (_("  DWARF version:   %u\n"), version);
> +   printf (_("  Address size:    %u\n"), address_size);
> +   printf (_("  Segment size:    %u\n"), segment_selector_size);
> +   printf (_("  Offset entries:  %u\n"), offset_entry_count);
> +
> ++  if (length > (size_t) (finish - hdr))
> ++    length =3D finish - hdr;
> ++
> ++  /* Report the next unit offset to the caller.  */
> ++  *unit_offset =3D (hdr - section->start) + length;
> ++
> +   /* Check the fields.  */
> +   if (segment_selector_size !=3D 0)
> +     {
> +       warn (_("The %s section contains "
> +            "unsupported segment selector size: %d.\n"),
> +          section->name, segment_selector_size);
> +-      return 0;
> ++      return false;
> +     }
> +
> +   if (version < 5)
> +     {
> +       warn (_("Only DWARF version 5+ debug_rnglists info "
> +            "is currently supported.\n"));
> +-      return 0;
> ++      return false;
> +     }
> +
> ++  uint64_t max_off_count =3D (length - 8) / offset_size;
> ++  if (offset_entry_count > max_off_count)
> ++    offset_entry_count =3D max_off_count;
> +   if (offset_entry_count !=3D 0)
> +     {
> +       printf (_("\n   Offsets starting at %#tx:\n"), p - section->start=
);
> +@@ -8372,7 +8366,7 @@ display_debug_rnglists_unit_header (struct dwarf_s=
ection *  section,
> +      }
> +     }
> +
> +-  return 1;
> ++  return true;
> + }
> +
> + static bool
> +@@ -8404,6 +8398,7 @@ display_debug_ranges (struct dwarf_section *sectio=
n,
> +   uint64_t last_offset =3D 0;
> +   uint64_t next_rnglists_cu_offset =3D 0;
> +   unsigned char offset_size;
> ++  bool ok_header =3D true;
> +
> +   if (bytes =3D=3D 0)
> +     {
> +@@ -8493,8 +8488,12 @@ display_debug_ranges (struct dwarf_section *secti=
on,
> +       /* If we've moved on to the next compile unit in the rnglists sec=
tion - dump the unit header(s).  */
> +       if (is_rnglists && next_rnglists_cu_offset < offset)
> +      {
> +-      while (next_rnglists_cu_offset < offset)
> +-        display_debug_rnglists_unit_header (section, &next_rnglists_cu_=
offset, &offset_size);
> ++      while (ok_header && next_rnglists_cu_offset < offset)
> ++        ok_header =3D display_debug_rnglists_unit_header (section,
> ++                                                        &next_rnglists_=
cu_offset,
> ++                                                        &offset_size);
> ++      if (!ok_header)
> ++        break;
> +        printf (_("    Offset   Begin    End\n"));
> +      }
> +
> +@@ -8548,10 +8547,12 @@ display_debug_ranges (struct dwarf_section *sect=
ion,
> +     }
> +
> +   /* Display trailing empty (or unreferenced) compile units, if any.  *=
/
> +-  if (is_rnglists)
> ++  if (is_rnglists && ok_header)
> +     while (next_rnglists_cu_offset < section->size)
> +-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_of=
fset, &offset_size);
> +-
> ++      if (!display_debug_rnglists_unit_header (section,
> ++                                           &next_rnglists_cu_offset,
> ++                                           &offset_size))
> ++    break;
> +   putchar ('\n');
> +
> +   free (range_entries);
> +--
> +2.35.6
> +

Hello Adarsh,

I'm filling in for Yoann while he's on leave.

Thank you for these pathes. A few notes, however: for future binutils proje=
cts,
please include links to the CVE (ideally NVD or NIST), as well as the link
to the Bugzilla entry mentioned in the patch that indicates that the patch
is resolved and in which version (especially when there are =93duplicates=
=94).

All of these elements make it easier for us to validate the patch.

And for this second patch, I see a Signed-off-by: Deepak Rathore <deeratho@=
cisco.com>
Are there two of you from different companies who made this backport,
or is this a mistake?

Thank for your reply.
--
Fabien Thomas
Smile ECS


--_000_AS8P189MB167210CB6211A28587E8EAA5B3372AS8P189MB1672EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The original patch was submitted to whinlatter by Deepak. So, I kept it to =
pass the credits.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Fabien Thomas &lt;fab=
ien.thomas@smile.fr&gt;<br>
<b>Sent:</b> Monday, April 27, 2026 17:33<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 2/4] binutils: fix CVE-2025-=
69648</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Apr 22, 2026 at 3:03 PM CEST, Adarsh Jagadi=
sh Kamini via lists.openembedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Backport upstream fix for CVE-2025-69648 [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.=
git;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33">
https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D598704a00cba=
c5e85c2bedd363357b5bf6fcee33</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../binutils/binutils-2.42.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<=
br>
&gt;&nbsp; .../binutils/binutils/CVE-2025-69648.patch&nbsp;&nbsp;&nbsp; | 1=
90 ++++++++++++++++++<br>
&gt;&nbsp; 2 files changed, 191 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2=
025-69648.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.42.inc<br>
&gt; index a337a3e850..6c1f9dc870 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
&gt; @@ -72,5 +72,6 @@ SRC_URI =3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0029-CVE-2025-11=
839.patch">file://0029-CVE-2025-11839.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0030-CVE-2025-11=
840.patch">file://0030-CVE-2025-11840.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69647.p=
atch">file://CVE-2025-69647.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69648.patch">file=
://CVE-2025-69648.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; S&nbsp; =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.pa=
tch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e04d7ed6c2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch<br>
&gt; @@ -0,0 +1,190 @@<br>
&gt; +From 7df481dd76c05c89782721e9df5468be829c356b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alan Modra &lt;amodra@gmail.com&gt;<br>
&gt; +Date: Sat, 22 Nov 2025 09:22:10 +1030<br>
&gt; +Subject: [PATCH] PR 33638, debug_rnglists output<br>
&gt; +<br>
&gt; +The fuzzed testcase in this PR continuously outputs an error about<br=
>
&gt; +the debug_rnglists header.&nbsp; Fixed by taking notice of the error =
and<br>
&gt; +stopping output.&nbsp; The patch also limits the length in all cases,=
 not<br>
&gt; +just when a relocation is present, and limits the offset entry count<=
br>
&gt; +read from the header.&nbsp; I removed the warning and the test for re=
locs<br>
&gt; +because the code can't work reliably with unresolved relocs in the<br=
>
&gt; +length field.<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PR 33638<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; * dwarf.c (display_debug_rnglists_list): Ret=
urn bool.&nbsp; Rename<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; &quot;inital_length&quot; to plain &quot;len=
gth&quot;.&nbsp; Verify length is large<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enough to read header.&nbsp; Limit length to=
 rest of section.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; Similarly limit offset_entry_count.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; (display_debug_ranges): Check display_debug_=
rnglists_unit_header<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return status.&nbsp; Stop output on error.<b=
r>
&gt; +<br>
&gt; +CVE: CVE-2025-69648<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/gitw=
eb.cgi?p=3Dbinutils-gdb.git;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33">h=
ttps://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D598704a00cbac=
5e85c2bedd363357b5bf6fcee33</a>]<br>
&gt; +<br>
&gt; +(cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.=
tech&gt;<br>
&gt; +---<br>
&gt; + binutils/dwarf.c | 67 ++++++++++++++++++++++++----------------------=
--<br>
&gt; + 1 file changed, 34 insertions(+), 33 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/binutils/dwarf.c b/binutils/dwarf.c<br>
&gt; +index f4bcb677761..b4fb56351ec 100644<br>
&gt; +--- a/binutils/dwarf.c<br>
&gt; ++++ b/binutils/dwarf.c<br>
&gt; +@@ -8282,7 +8282,7 @@ display_debug_rnglists_list (unsigned char * st=
art,<br>
&gt; +&nbsp;&nbsp; return start;<br>
&gt; + }<br>
&gt; + <br>
&gt; +-static int<br>
&gt; ++static bool<br>
&gt; + display_debug_rnglists_unit_header (struct dwarf_section *&nbsp; sec=
tion,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unit_o=
ffset,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; poffset_size)<br>
&gt; +@@ -8290,7 +8290,8 @@ display_debug_rnglists_unit_header (struct dwar=
f_section *&nbsp; section,<br>
&gt; +&nbsp;&nbsp; uint64_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; start=
_offset =3D *unit_offset;<br>
&gt; +&nbsp;&nbsp; unsigned char * p =3D section-&gt;start + start_offset;<=
br>
&gt; +&nbsp;&nbsp; unsigned char * finish =3D section-&gt;start + section-&=
gt;size;<br>
&gt; +-&nbsp; uint64_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; initial_le=
ngth;<br>
&gt; ++&nbsp; unsigned char * hdr;<br>
&gt; ++&nbsp; uint64_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; length;<br=
>
&gt; +&nbsp;&nbsp; unsigned char&nbsp;&nbsp; segment_selector_size;<br>
&gt; +&nbsp;&nbsp; unsigned int&nbsp;&nbsp;&nbsp; offset_entry_count;<br>
&gt; +&nbsp;&nbsp; unsigned int&nbsp;&nbsp;&nbsp; i;<br>
&gt; +@@ -8299,66 +8300,59 @@ display_debug_rnglists_unit_header (struct dw=
arf_section *&nbsp; section,<br>
&gt; +&nbsp;&nbsp; unsigned char&nbsp;&nbsp; offset_size;<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; /* Get and check the length of the block.&nbsp; */<br>
&gt; +-&nbsp; SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);<br>
&gt; ++&nbsp; SAFE_BYTE_GET_AND_INC (length, p, 4, finish);<br>
&gt; + <br>
&gt; +-&nbsp; if (initial_length =3D=3D 0xffffffff)<br>
&gt; ++&nbsp; if (length =3D=3D 0xffffffff)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* This section is 64-bit DWARF =
3.&nbsp; */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAFE_BYTE_GET_AND_INC (initial_length=
, p, 8, finish);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SAFE_BYTE_GET_AND_INC (length, p, 8, =
finish);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *poffset_size =3D offset_size =
=3D 8;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; *poffset_size =3D offset_size =3D 4;<br>
&gt; + <br>
&gt; +-&nbsp; if (initial_length &gt; (size_t) (finish - p))<br>
&gt; +-&nbsp;&nbsp;&nbsp; {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If the length field has a relocati=
on against it, then we should<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; not complain if it is inaccurate (and proba=
bly negative).<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; It is copied from .debug_line handling code=
.&nbsp; */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (reloc_at (section, (p - section-&=
gt;start) - offset_size))<br>
&gt; +-&nbsp;&nbsp;&nbsp; initial_length =3D finish - p;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +-&nbsp;&nbsp;&nbsp; {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warn (_(&quot;The length field (%#&qu=
ot; PRIx64<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;) in the debug_rnglists header is wrong&quot;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot; - the section is too small\n&quot;),<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
nitial_length);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +-&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp; }<br>
&gt; +-<br>
&gt; +-&nbsp; /* Report the next unit offset to the caller.&nbsp; */<br>
&gt; +-&nbsp; *unit_offset =3D (p - section-&gt;start) + initial_length;<br=
>
&gt; ++&nbsp; if (length &lt; 8)<br>
&gt; ++&nbsp;&nbsp;&nbsp; return false;<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; /* Get the other fields in the header.&nbsp; */<br>
&gt; ++&nbsp; hdr =3D p;<br>
&gt; +&nbsp;&nbsp; SAFE_BYTE_GET_AND_INC (version, p, 2, finish);<br>
&gt; +&nbsp;&nbsp; SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);<br>
&gt; +&nbsp;&nbsp; SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, fini=
sh);<br>
&gt; +&nbsp;&nbsp; SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish)=
;<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; printf (_(&quot; Table at Offset: %#&quot; PRIx64 &quot;=
:\n&quot;), start_offset);<br>
&gt; +-&nbsp; printf (_(&quot;&nbsp; Length:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; %#&quot; PRIx64 &quot;\n&quot;), initial_length);<b=
r>
&gt; ++&nbsp; printf (_(&quot;&nbsp; Length:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; %#&quot; PRIx64 &quot;\n&quot;), length);<br>
&gt; +&nbsp;&nbsp; printf (_(&quot;&nbsp; DWARF version:&nbsp;&nbsp; %u\n&q=
uot;), version);<br>
&gt; +&nbsp;&nbsp; printf (_(&quot;&nbsp; Address size:&nbsp;&nbsp;&nbsp; %=
u\n&quot;), address_size);<br>
&gt; +&nbsp;&nbsp; printf (_(&quot;&nbsp; Segment size:&nbsp;&nbsp;&nbsp; %=
u\n&quot;), segment_selector_size);<br>
&gt; +&nbsp;&nbsp; printf (_(&quot;&nbsp; Offset entries:&nbsp; %u\n&quot;)=
, offset_entry_count);<br>
&gt; + <br>
&gt; ++&nbsp; if (length &gt; (size_t) (finish - hdr))<br>
&gt; ++&nbsp;&nbsp;&nbsp; length =3D finish - hdr;<br>
&gt; ++<br>
&gt; ++&nbsp; /* Report the next unit offset to the caller.&nbsp; */<br>
&gt; ++&nbsp; *unit_offset =3D (hdr - section-&gt;start) + length;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp; /* Check the fields.&nbsp; */<br>
&gt; +&nbsp;&nbsp; if (segment_selector_size !=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warn (_(&quot;The %s section con=
tains &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;unsupported segment selector size: %d.\n&quot;),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; section-&gt;na=
me, segment_selector_size);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; if (version &lt; 5)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warn (_(&quot;Only DWARF version=
 5+ debug_rnglists info &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;is currently supported.\n&quot;));<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + <br>
&gt; ++&nbsp; uint64_t max_off_count =3D (length - 8) / offset_size;<br>
&gt; ++&nbsp; if (offset_entry_count &gt; max_off_count)<br>
&gt; ++&nbsp;&nbsp;&nbsp; offset_entry_count =3D max_off_count;<br>
&gt; +&nbsp;&nbsp; if (offset_entry_count !=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf (_(&quot;\n&nbsp;&nbsp; O=
ffsets starting at %#tx:\n&quot;), p - section-&gt;start);<br>
&gt; +@@ -8372,7 +8366,7 @@ display_debug_rnglists_unit_header (struct dwar=
f_section *&nbsp; section,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + <br>
&gt; +-&nbsp; return 1;<br>
&gt; ++&nbsp; return true;<br>
&gt; + }<br>
&gt; + <br>
&gt; + static bool<br>
&gt; +@@ -8404,6 +8398,7 @@ display_debug_ranges (struct dwarf_section *sec=
tion,<br>
&gt; +&nbsp;&nbsp; uint64_t last_offset =3D 0;<br>
&gt; +&nbsp;&nbsp; uint64_t next_rnglists_cu_offset =3D 0;<br>
&gt; +&nbsp;&nbsp; unsigned char offset_size;<br>
&gt; ++&nbsp; bool ok_header =3D true;<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; if (bytes =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +@@ -8493,8 +8488,12 @@ display_debug_ranges (struct dwarf_section *se=
ction,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If we've moved on to the next=
 compile unit in the rnglists section - dump the unit header(s).&nbsp; */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_rnglists &amp;&amp; next_=
rnglists_cu_offset &lt; offset)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (next_rnglists_cu_offset &lt; o=
ffset)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_debug_rnglists_un=
it_header (section, &amp;next_rnglists_cu_offset, &amp;offset_size);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (ok_header &amp;&amp; next_rngl=
ists_cu_offset &lt; offset)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok_header =3D display_deb=
ug_rnglists_unit_header (section,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;next_rnglists_cu_offset,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;offset_size);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ok_header)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf (_(&quot;&nbsp;&nbs=
p;&nbsp; Offset&nbsp;&nbsp; Begin&nbsp;&nbsp;&nbsp; End\n&quot;));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + <br>
&gt; +@@ -8548,10 +8547,12 @@ display_debug_ranges (struct dwarf_section *s=
ection,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; /* Display trailing empty (or unreferenced) compile unit=
s, if any.&nbsp; */<br>
&gt; +-&nbsp; if (is_rnglists)<br>
&gt; ++&nbsp; if (is_rnglists &amp;&amp; ok_header)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; while (next_rnglists_cu_offset &lt; section-=
&gt;size)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; display_debug_rnglists_unit_header (s=
ection, &amp;next_rnglists_cu_offset, &amp;offset_size);<br>
&gt; +-<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!display_debug_rnglists_unit_head=
er (section,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;next_rnglists_cu_offset,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;offset_size))<br>
&gt; ++&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp; putchar ('\n');<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; free (range_entries);<br>
&gt; +-- <br>
&gt; +2.35.6<br>
&gt; +<br>
<br>
Hello Adarsh,<br>
<br>
I'm filling in for Yoann while he's on leave.<br>
<br>
Thank you for these pathes. A few notes, however: for future binutils proje=
cts, <br>
please include links to the CVE (ideally NVD or NIST), as well as the link =
<br>
to the Bugzilla entry mentioned in the patch that indicates that the patch =
<br>
is resolved and in which version (especially when there are =93duplicates=
=94).<br>
<br>
All of these elements make it easier for us to validate the patch.<br>
<br>
And for this second patch, I see a Signed-off-by: Deepak Rathore &lt;deerat=
ho@cisco.com&gt;<br>
Are there two of you from different companies who made this backport, <br>
or is this a mistake?<br>
<br>
Thank for your reply.<br>
--<br>
Fabien Thomas<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB167210CB6211A28587E8EAA5B3372AS8P189MB1672EURP_--

