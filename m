Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60036C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 17:42:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14137.1783532538126921254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 10:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=pnxk5Hbi;
 spf=pass (domain: est.tech, ip: 52.101.66.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRgD5CXBQdxTJtkmgSfGEAYHouDjVM3Dv7Lh822s/adZ9bON+rICSuehFzWqLANqO65cAm4Lmq9Ywo2V2O5dS1Ve2xAEW8yl8zSFXosu5/o8p7kzg5k+zcokqv0MPNL/Gx2gAf9kkCXwGxN2+c/cXzQhOXRZRZTvEItcbWPwuJgHKwDYTzisM+CE2402Nc/fj5JL9yxvESqarCctL/Y/JotQswZeDAKGoe7osrlyePdqk091GRJgiABhKqLA2GkVBJ34YP8dH4ywfpo9BDNYj434aP6LOET1XmXqo+afCrUSR/a7M4nfwuAeTIsRBW6aIUXdWYJZNN9u/cmO+O7TNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn+ymPeqketkaTxoqPEY97Sw1T0ccqbCaqW6AgJYsQU=;
 b=vJVXgNpL+ReQlTuwzOeud0BkU3RVcSwbJosn3/XVmwLfJfwnLhby1NOKAQFXbFRb6YTb1uT3pDNCUKxREVIvgYdydjB6Htz1FflqBoDbGJnW8zcXJNTDQFUBhJunrAQjVj899saggm24qG9ISo+cibY2BUWOYgX72a3KEkqfsgYhuA+Hhqd94JFlEvTmNmv2l770oayBvxORzU5pgIJ1rSSsGJnJm1sjSyLZfOPCeLHV84lsPaCcuyM4IOBZiimeCbcVFv6C9dUA3KEArz7Q7udKYM5p379oSi7wszE6/N0MDe20A+2Yz8a7n1ZUW6khO8aBYL8ZQo9DLb/k/EI/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qn+ymPeqketkaTxoqPEY97Sw1T0ccqbCaqW6AgJYsQU=;
 b=pnxk5HbiulmVfrVd00Pwr3yLxErD0HxJS1TvXP/7DQBaKn1usqECzM6MLKgVrFF/ELKRUTqGDJw62Y23ObCk0Ue02q/vIhRifmtc7zcqun7wpj7nC5rsu5tD2n+u3wZ9tydwCQLVXyxaXhCm8KwfeBBkiLbH+IGOIAVg2ULlyt/wyMkl5CBju2PKbudP7E4KQj5k7j4dg82v7FSX0QSuJ0dpJ6NUquXI4fr1+tFDQDJ62Ze2aNJ/aVRq8G7+eBK3OKn+tYqgmAV6RDx/hBaolNMwH7vzhsNyZF7If4f26/E8ObBbXsVsmkfFhql//cRYrYKRFIf/0Phd8kWCoVe4eg==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PRAP189MB1970.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 17:42:10 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 17:42:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gzip: fix CVE-2026-41992
Thread-Topic: [OE-core] [PATCH] gzip: fix CVE-2026-41992
Thread-Index: AQHdDh22wR0w3OIVK0KVGHH28lyOcbZjvf6AgAAnm6I=
Date: Wed, 8 Jul 2026 17:42:09 +0000
Message-ID: 
 <DU7PPF66507B2D727B3B99660945CE0FCBEF3FF2@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
 <DJTAH1N4F2K6.2E4QADD7JMHLN@smile.fr>
In-Reply-To: <DJTAH1N4F2K6.2E4QADD7JMHLN@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|PRAP189MB1970:EE_
x-ms-office365-filtering-correlation-id: 0cc0b617-8ad5-40b6-18dc-08dedd183ca3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|10070799003|376014|23010399003|366016|13003099007|38070700021|11063799006|4143699003|56012099006|22082099003|18002099003|8096899003;
x-microsoft-antispam-message-info: 
 OPVhOh8XILb3EnufA/tv+Rv3NIgxm/2Ro+xOkjxwrtlnuREkjgc/kKPYHeE+6g1xyjYlScA39R7RrKcsObdZ5pP909x2xylU76QrjDz/7gNS/F9ZNBP80v67HNN1TnDuJbzLHP3oKshAPKIDEU6mYjZ9+s7e3i6IAh96zavwBBm9RPkRpIkFXMmmxd5wZAU3B46CqgfwxQnCYSZxxS8tuF9dg/L+yAkc82ceJEg0sNSUKXRoqJj4DP1Hkad0rf4fAXoYcUQp83/JF/8jpkirmlSTVDIVEAl8U/HFonO2rv1Lq+JPApdXJ/yLRzHhhjFADLq03ZVnKemUu6S4vwiEDNheIz9LTQaSmzy07adnjfyMgCNQxqNpqMwVPzf9wLJm/J960Yge9aGTQ7+1r1b1Lwr7cqeLWdg5XGzYQe1O/isEh32eoY9qTz4Q0QL+VYry+LsKZYxDgTdj+oZZYH+aE0GpV+GjKBNItRa/CzNNQgv9XKw3xB037pRvIdf3C1uPa+MSqwPsYltd1vSyIr6yIFt5NieiIarEZ03zoWZaNHrDLXNeLLu2gQJtYF2eLEsTzxEBRekM8TI5+MfqbXvHVNeuotAyO18X7QSaK74t1KRLJ9vrJRcOt+hArClbQ7gSPJlOyXhxc7KgEYItaSgKZdA4OKXVrGfl3PgoZrr12cGH33h7ThccU93dlsgbasnpBPjtlQojCUpF83p/TbzaNp9JfHi1xttXZEeKvzah9x0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(366016)(13003099007)(38070700021)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?ovyVOx+6Wj635RXYxAxFvM7aPW5DESgk41ojBeTp1VlqR+KS1AcGCQR8TS?=
 =?iso-8859-2?Q?aGdl7EIWeRo4A2/va/21HwSLPQADm1bm01IO4RP6XO59teYUawkkd2E9rL?=
 =?iso-8859-2?Q?FzAnWHvcrkhw5Iz2Rwhe41hKgP+fJXtIjqLAhJe7rp8pG0GmvXgclH5xfV?=
 =?iso-8859-2?Q?Pa82RROBwYDH5meZmELfvmc5N7EAMGJD3W7cAY75aeP6C5tBPGwzvUWsw5?=
 =?iso-8859-2?Q?vjZNk7Nd4tmp5oyuQb6Bes0GBT40CQkxFKvlEsxsPireEyr+ldrxrZLbSe?=
 =?iso-8859-2?Q?QzEQC+8IQMfTwnWPBMkTA4tgLfWHjD1vtFBXMFsZWkw1Yva532nsNQS8mi?=
 =?iso-8859-2?Q?P+gmFEWeboTsfsETzoB6QNIBVQrUkHyiYjwsFhLZfdMf2eAMVVDfI8b1zb?=
 =?iso-8859-2?Q?d3CaCAxzuJtfcCpDB2FMuA3R820jqvuzPUdKxBvqbFvGwjZ6TzxK5QV9gX?=
 =?iso-8859-2?Q?L02yFP+NxNNyJB3paYQu81JeEaQhLqAmvf9fX5qMWu8mgDQ5Fc52bd2RxD?=
 =?iso-8859-2?Q?NFcNgEnrHKdkZSQ5zMzs/0Ai/Lfo++UCFW/136gQlVamu9GBAckNW0T7Nc?=
 =?iso-8859-2?Q?6UV0taSExU1wNF4WclNOA8JQi0ub1OG9dvyFzy6XwJWslavLtnik+ecAyo?=
 =?iso-8859-2?Q?yREi5QgQfvYHQy4cNZKP7ns8Soi0ovVF9CFrSX3NL9g0YBnhzjufAnH8JS?=
 =?iso-8859-2?Q?s/r7eOH4M4DDgZmfoG+n+Ei52UmlT2tPRmxiqnUt160c4BqFKPtXjHpMvt?=
 =?iso-8859-2?Q?cMD0L+CAg3RVesYLR+W8SxwDhqNGN1Tdosa1S74D26SxUXBtiOJmN4dpjq?=
 =?iso-8859-2?Q?rMTfrG7MLefsPZ4AflJEIAddFNCkiBPIc+Ferm2APEZiXPTGIL661hDEgh?=
 =?iso-8859-2?Q?kU65uVzuovgkZ/Q4K+rt6R8mc6ZuZwAgrEAJO4wsloRZEDY+NTV0ULcwoF?=
 =?iso-8859-2?Q?AYEmMP4IjNvhSs94ORgLygcTWAfUd6kA6zcqKOEvsJbnkERjfpNmdoHkoR?=
 =?iso-8859-2?Q?Ho0GStpFsOo9rxgggCOXSsdT2eDNcl6GA5+yW5yn56u5apmBDIqB1yo4/T?=
 =?iso-8859-2?Q?l2u0NulnGoYMN9IvZCbiff62hEl82Oi0a7YyS+ojlLObaH0NAUDgSgxWmo?=
 =?iso-8859-2?Q?ZJWfqIBV7q+1LnIMyL/jlNHalKenax1zYGLoAi1185AKkXvX8g4KMRA3M6?=
 =?iso-8859-2?Q?s5WHi28+LFkz26r8PoFO//CLCYFO1fExoN4qD2spi80F4hOao2+O7zN8eC?=
 =?iso-8859-2?Q?L4ikwM6XFwo3YosoE1pe+cR6mQaC3YLO+aL9lP4mCivvFmxHM4z7OEfhAB?=
 =?iso-8859-2?Q?Zx72cg1S+temn+ssM0E11/QELEzO9kC3yG0/mG0NePFJ4mhfootOiaeTyD?=
 =?iso-8859-2?Q?fAZqwfJA/5mEccqIvl3g4U7HpQ3w4zKxqsWxuidwSllmG7bU7syRakSEtb?=
 =?iso-8859-2?Q?HyNYzvBMqYt9TVeVZvGT5a3CNGjgX27xjiJ8wTydf18xQ6Tl1rFofWFWcD?=
 =?iso-8859-2?Q?/IgK+5HzPEEZ2M4duujgKac4TCIZq6oKeVCPE2Q6FHJPirF/iNW/qe8aQC?=
 =?iso-8859-2?Q?WhxDZvYXpUHMyR2yi5ESDMus7TGI181k6R2J0cc9QqgXjfO7dKonsD809X?=
 =?iso-8859-2?Q?+j5HPw08+NTGC+cB9W+pZaOrTdah4Ql3NY4H4VonIVZC08OGJLa1eY52no?=
 =?iso-8859-2?Q?W96RN5rMdF/7QsQeHlW2uGQA8JyUTgNIHCx6YEkk+ueHFMbU01+vB5RXy1?=
 =?iso-8859-2?Q?BGmbSt9hnGSodOtUR7rYPiZEH35a8Z7Er5if6GPLa7SOmXxe0a33PN0ftH?=
 =?iso-8859-2?Q?AZODDtSwaVq1kflpRfOHQuhMlvqiu4U/IYgfKXYVPJy1JsJlFvkU/7dVM/?=
 =?iso-8859-2?Q?Ev?=
x-ms-exchange-antispam-messagedata-1: UD2k6zPaC3799Q==
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D727B3B99660945CE0FCBEF3FF2DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc0b617-8ad5-40b6-18dc-08dedd183ca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 17:42:09.9108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMKco13C2t365RZPNBYfN6EPX67y5ALK84jrbNvZZZie+7WWOrbS6RlzlT3S2FozuqHdjwbqDI5riBylFuRavkkwzMJkdnV/0aB4jilRFxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 17:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240504

--_000_DU7PPF66507B2D727B3B99660945CE0FCBEF3FF2DU7PPF66507B2D7_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Something went wrong from myside. I will check and share v2 .

Apologies for the confusion.

Regards,
Jaipaul
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, July 8, 2026 5:19 PM
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>; openembedded-core@lists.o=
penembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gzip: fix CVE-2026-41992

On Tue Jul 7, 2026 at 4:34 PM CEST, Jaipaul Cheernam via lists.openembedded=
.org wrote:
> Backport upstream fix for a global buffer overflow in the LZH
> decompression logic (unlzh.c). The left[] and right[] global arrays
> shared across LZW and LZH decompression routines are not reinitialized
> between files processed in the same invocation, allowing an
> out-of-bounds read in the LZH decoder.
>
> Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../gzip/gzip-1.14/CVE-2026-41992.patch       | 32 +++++++++++++++++++
>  meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.p=
atch
>
> diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch b/=
meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
> new file mode 100644
> index 0000000000..5d3534fcb1
> --- /dev/null
> +++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
> @@ -0,0 +1,32 @@
> +From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
> +From: Paul Eggert <eggert@cs.ucla.edu>
> +Date: Wed, 15 Apr 2026 12:00:17 -0700
> +Subject: gzip: don't mishandle .lzh after .Z
> +
> +Problem reported by Michal Majchrowicz.
> +* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.
> +
> +CVE: CVE-2026-41992
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.g=
it/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681]
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Hello,

This patch is slightly different from upstream (without explanation):
-Subject: =3D?UTF-8?q?gzip:=3D20don=3DE2=3D80=3D99t=3D20mishandle=3D20.lzh=
=3D20after=3D20.Z?=3D
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
+Subject: gzip: don't mishandle .lzh after .Z

-Problem reported by Micha=B3 Majchrowicz.
+Problem reported by Michal Majchrowicz.

... and the THANKS file was dropped.

Micha=B3 name was transcribed as Michal. I don't know how "nitpickery" it
is...

Regards,
--
Yoann Congal
Smile ECS


--_000_DU7PPF66507B2D727B3B99660945CE0FCBEF3FF2DU7PPF66507B2D7_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Hi Yoann,</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
<br>
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Something went wrong from myside. I will check and share v2 .&nbsp;</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
<br>
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Apologies for the confusion.&nbsp;</div>
<div><br>
</div>
<div id=3D"editor-signature">
<div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Regards,</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Jaipaul</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, July 8, 2026 5:19 PM<br>
<b>To:</b> Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;; openembedded=
-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&g=
t;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] gzip: fix CVE-2026-41992</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Jul 7, 2026 at 4:34 PM CEST, Jaipaul Cheern=
am via lists.openembedded.org wrote:<br>
&gt; Backport upstream fix for a global buffer overflow in the LZH<br>
&gt; decompression logic (unlzh.c). The left[] and right[] global arrays<br=
>
&gt; shared across LZW and LZH decompression routines are not reinitialized=
<br>
&gt; between files processed in the same invocation, allowing an<br>
&gt; out-of-bounds read in the LZH decoder.<br>
&gt;<br>
&gt; Reference: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-41992"=
>https://nvd.nist.gov/vuln/detail/CVE-2026-41992</a><br>
&gt; Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../gzip/gzip-1.14/CVE-2026-41992.patch&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 32 +++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-extended/gzip/gzip_1.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 33 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026=
-41992.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch=
 b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5d3534fcb1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Paul Eggert &lt;eggert@cs.ucla.edu&gt;<br>
&gt; +Date: Wed, 15 Apr 2026 12:00:17 -0700<br>
&gt; +Subject: gzip: don't mishandle .lzh after .Z<br>
&gt; +<br>
&gt; +Problem reported by Michal Majchrowicz.<br>
&gt; +* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-41992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.o=
rg/cgit/gzip.git/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681">htt=
ps://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=3D63dbf6b3b9e6e781d=
f1a6a64e609b10e23969681</a>]<br>
&gt; +Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
<br>
Hello,<br>
<br>
This patch is slightly different from upstream (without explanation):<br>
-Subject: =3D?UTF-8?q?gzip:=3D20don=3DE2=3D80=3D99t=3D20mishandle=3D20.lzh=
=3D20after=3D20.Z?=3D<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
+Subject: gzip: don't mishandle .lzh after .Z<br>
<br>
-Problem reported by Micha=B3 Majchrowicz.<br>
+Problem reported by Michal Majchrowicz.<br>
<br>
... and the THANKS file was dropped.<br>
<br>
Micha=B3 name was transcribed as Michal. I don't know how &quot;nitpickery&=
quot; it<br>
is...<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DU7PPF66507B2D727B3B99660945CE0FCBEF3FF2DU7PPF66507B2D7_--

