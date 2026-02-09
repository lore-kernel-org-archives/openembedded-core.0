Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D056AE9461C
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 22:30:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5610.1770672431242130672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 13:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=fSyprZ3E;
 spf=pass (domain: est.tech, ip: 52.101.65.59, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcDa/3DiP3YXa+3C5Fk43w7oe6NyVdDHuPwlttbCtVNJsuyrIWLz4qSKZATVczT0BSuJerriMXl/ASo0v+KSdYUOKNzpCVHp2sfBof8++BGUQLd2H8jFYJvDbJAUzM9glFaKzN7tVe6LYp7t8gmYpL9xM0Z7t46VwhUDDiuyU0OtTulzITs88C56odpZreusjkvomML4UkdBIcchDBIXxFHAnQKkHfvRlOZADfuDKCehZOrQ8Uxnd6oCNUcIWeWia2e9PO7Essxiva56w34uG5+yYtM/fV59LLgdE+2Gr+CBzZfazd/8lNGMcHH5+7G6dYppPDxiHy6tdTdmKcjA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/b7KGikworm4WwJ2mGn+5tftm3HZrrbvFj7yQfuiC3w=;
 b=LeDDRzzBiK6FTI3P5rYwA3fyGHiAiiWnLqNtEYRkkj4SSRjIaKHxTk8ZUE0uUghUutgq9S1ZvHbKZw9VFUplGJS20qRiUxQrwB0p4Y+ARLw9Wr/Mj0fbh1j7zCAweJbrDDnJnvVXWocZsLgy/f0ZHSo9WGm/tBheALi1yLHG/JDEHfBZMWVtanELqMTeO/PZHVx+ku+IAqCyVRRjm8UT4DHHbK2WDUiuN5RYEOdkb/ABC3RUbD3cKbPlfg4k3OWv5YWPvSKzZRo4Iv6bNvPiTLx7dzFofRqgg+05u5QBox/nnkZovYDXVBB+YVVdqmEYDhknOJq/sgRqhixyX+hlyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/b7KGikworm4WwJ2mGn+5tftm3HZrrbvFj7yQfuiC3w=;
 b=fSyprZ3Ec375NjwFRZV80GxngBVCek5J7v97kdIC6tYev55vGvWAc9gA8A8zPbZzOFZG2/HJ8hrFOFUjnPfkBotMBoCHLyNaqrAkE0tdChiAjA8xFWqhRXG04w6AJyl8XSWF8YSQao/ywbViVd082p457XFYyo8XF8oXzdjJ+qOaK/HLoeaV8nAH5sixh4YI+LLttFLyJweTh5Qtp1IkyBfk57WuoaoYQ4zHmgD7tPDtH3GNHtixAN/4FPPMhbuUcR3u7R1mhNXhNitYPGDDwJZTzy4vvozVpd8adWUYEqi9kqbJbpU+KVuCViDDTb1kxt7RAxudtEvPTrA0oIz/hQ==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU4P189MB3472.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 9 Feb
 2026 21:27:04 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 21:27:04 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] python3-pip: patch CVE-2026-1703
Thread-Topic: [OE-core][scarthgap][PATCH] python3-pip: patch CVE-2026-1703
Thread-Index: AQHcmcyMSEOq0OCob0Owbyv+2vOSHrV6hOkAgABcrlc=
Date: Mon, 9 Feb 2026 21:27:04 +0000
Message-ID: 
 <AS8P189MB16720DEBE65975B510E08E2DB365A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260209140108.33848-1-adarsh.jagadish.kamini@est.tech>
 <DGAJWBIW4I84.35YIU2HK85XSO@smile.fr>
In-Reply-To: <DGAJWBIW4I84.35YIU2HK85XSO@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|DU4P189MB3472:EE_
x-ms-office365-filtering-correlation-id: c2aff00c-48bb-42ff-14b5-08de6821f83a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700021|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?9XZZsXM/bpvj2gDuPEcsEKStJxioLByIFauV3ar6PoB9x6adklz8OZKVBqGA?=
 =?us-ascii?Q?MtjwVr4My6nWlr/7Mmv7jhpuFSkrp4ztyUG+YVlvvBThJwrnntAwtVgv9qIx?=
 =?us-ascii?Q?r5HMDrofO2ZQHsv7C4H68sYtkIkPGVTXri7YFpcaNVzMA2SCClRzwYYWugmX?=
 =?us-ascii?Q?A1JVPXxJdzfoMfgpREWvfbxdFjT8Z8IqrqRoV/0IfEBdabdmv22NaTMOg4pb?=
 =?us-ascii?Q?f4M0GemcIpoCxx/oXEb88kiCawbG8fxX8Zj/IRZwOd8iBv3CeH6ILrZ+inrl?=
 =?us-ascii?Q?gHxYzruZ8RsgCMZPANvWOQb5ShMsUx3gwOnQBqumixVPhgIJDr34WVt2bz/5?=
 =?us-ascii?Q?TKatL4i+YAT1w015zw5TbLyAHGGbJWCRn8h3x662LjnfaSxj/wnKHkBpjgGS?=
 =?us-ascii?Q?MpnpXDm2yaAlH7IgjjspZifeBcmV7zAz13OjtTgrgkz2iEJDTbAz3/KPSAsq?=
 =?us-ascii?Q?smO3wYlHjE8IGx3QuBjaw09wOC2FhqhNil1agHLnoTcMQJf5slF7Fj/N3kxj?=
 =?us-ascii?Q?+0EyHxvlf2nSveX+Q5TymsTsaKWNsxSFkFyyL9MBuRLbcqm5s/tRo3ItoAVG?=
 =?us-ascii?Q?Vvqt3rSoaeliak0utfY08Jc+nBegtCBBk0xfWn+6FhIPvdHu4a4Xbc8gtZbu?=
 =?us-ascii?Q?Vh3PFZD6CodjayK4rPTX91Xbt3amDlsJzXDN1tyLIuU8PT+vy2+IuYKB+X6S?=
 =?us-ascii?Q?rkd4JfACIN8yFrJocIdLjSgw0sC67ZTlNZwf2hLE726Tpe+6d1o9vInjpdIR?=
 =?us-ascii?Q?lGt2uSNfOZ135aP+heskbtyA0y9Kh1NTipkGpak1PNWvacKo44l2ALeU7oL0?=
 =?us-ascii?Q?vsDPryIRTAvEd4UkAaClKmuax6GnM2atYm0goP1NoZrE3bUm3JjVs09QUKaK?=
 =?us-ascii?Q?sKsYKkwLpiwSyRLP3GYBuTymRGjPnb46K0wrodVh6e66at20Vcw1aMfloaNy?=
 =?us-ascii?Q?V68419mjUmW11ypX/CiQhMKFABeRzvwROVIxUH2keDdms1v+Q8bsxef0DHwq?=
 =?us-ascii?Q?D6x4Ib63Aml8oC18bOz7Xbuv9mZQ2riyD7LuXVt+FopJ0SRGgu6SDisCpiFi?=
 =?us-ascii?Q?dmhDIn2OvfbZWpID4e00s+jkyLHKkBHoNsZxCCzwVTf1dbESDfXtR4CcbiTZ?=
 =?us-ascii?Q?ldqtZoxtGEEIFrw4TiYavjxrkpnsOWYlZbyYkX1QlNnJtRR5gzz8Dm9zSxRD?=
 =?us-ascii?Q?bnOHR8rcS9fZ910CjQEf65I2UdpK4G7J0gWiU53MaB/a1CPYUq8oMGSRRo30?=
 =?us-ascii?Q?eivqF+iAI1pt4VWpeMknf6C+eVLEaC/dJbh6isZ253OyPLpl+B5xwc97f/9d?=
 =?us-ascii?Q?nLnOaBkPdQwotEQbY/v2Ob6V1F+eTY59FdcidPcxSb59ksmAld3uMkaGzaAO?=
 =?us-ascii?Q?2Hqshn3j3pdzePDB9yw+bBioAHZfqlQ//kwGuCz95Mv/TzrlOXonQDt5Q4Ce?=
 =?us-ascii?Q?BHMyyW9SLsQqh7F1/PytKoRG3l2EyDYCIC7ycYVH5R0liHloK2xEqs76uv2s?=
 =?us-ascii?Q?eWPAlajGpJfIKUMI9UwlA9yTMHRLM0sO1b8aOdKOZPeK7jj9mcz5HYLmqVJB?=
 =?us-ascii?Q?Jl3A3h3zX7AYf9Y80Ec=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?D/04ClUXfc1TJLx64iL2zqW834OuK+Pg3CjaHxUHmz54JBQxWlC4aBFUefZE?=
 =?us-ascii?Q?zO2PSE6qwRhiZM34nPJLB3GqfpPOdWSYhzpIiN+fGNA51ZYh25dbntnCuGRx?=
 =?us-ascii?Q?yyxuiOAQqokNvymu7Kf0d+l5e3R8XSDNmDr3cZpB9bsLnDfi/wBrYkFiAglN?=
 =?us-ascii?Q?XI4vEM8T5/sPv2A3fZxfYwFehPaBoxiT71qe0pWx9u1Mfi5nWuL1crCbplGi?=
 =?us-ascii?Q?jQBJTcp4xui+kht8dbLyVLuXeYhbbGd8Mco7zMQfZiiwZtI58Wajz6tj3QFX?=
 =?us-ascii?Q?OV1RPEuXRwSet2fs8TlHgj9VAkFBGPz/MgApfAXLi3a1foGgXDHo2GItLu0D?=
 =?us-ascii?Q?zAfnH97vVxWnLrkzj3z+OAqqef3w+Dc+8ltWPKNvqhrejh66akLDWSipDx/k?=
 =?us-ascii?Q?2WRvdchTcNIgEh2Xa5fuePStfGAIKaMU9ONXPlT+Z6c+Q6Yp/1fW8iq6RyW1?=
 =?us-ascii?Q?gwhxuH69YXOsomKohWRiQ3phA3U5Aml2lxal6A4nk1PUo7B0HRdCJGFbGDiz?=
 =?us-ascii?Q?ImBovDWn4TbN6uADqRCsI5grNvM+nVRfvZYrOlqVO3KPi9pMEbWRu0JYRwlE?=
 =?us-ascii?Q?ROCIfcJ5FQ/FjYbYDTQeujulOZ6MpDHzzedbHqFsQm8joGNojpKg/PSjzkbe?=
 =?us-ascii?Q?tvKWyi8H/eis9XTGJZ+7fBCmsMx01t8nJUnpYSC4jO9u0p9K1ZElJXYsy6wz?=
 =?us-ascii?Q?VjgyvFjhEpe0jFUuAljcI8so6h4eI91wAPzTqI3eRBHQqWWV6XsGU1blC1c0?=
 =?us-ascii?Q?jVc0UXh9NU5eYDf7pEBJW3gZInVRMjRpkXOKejBsvKk44KCU4s0MAOkeXXP7?=
 =?us-ascii?Q?BMCRnwek741AenCMyQZRNGIO6FQQskok08qO+hL2Q6cZFcBC7Ag+anEm571Q?=
 =?us-ascii?Q?tAxd+MPSAlctABrtmkbp193l3ZlDucSep637vMnpkatIthp4PKHtw87dfhR9?=
 =?us-ascii?Q?eD/6Wjbv3jCkF18qdw2KOXMKvLXxRPWsKsiBYOjOXWj4OjkSPscM66jE64uu?=
 =?us-ascii?Q?TVQyQus2aQPzfRkvckeA6TxNHn4lQHyMJ9nab03n3BDBnO2J22M5x7p/BADy?=
 =?us-ascii?Q?twGq2KAl/vxzEQKa9uCD1XMi/eMzKRBJtTbuvoP9cPWxMu1KtTO5hrG1Xn2/?=
 =?us-ascii?Q?zIAb9wOXgJ7xuPKTyD9mvpjGbkA/lBrY631zbAfu7KJNzZEmWFlBnfXzlg8l?=
 =?us-ascii?Q?cCmxNe9hXONIdSt0trtOUGBjZwvBuTNMVw0MSDu+ob9h25OWD2ruC0ysCsQP?=
 =?us-ascii?Q?5dTJkgdBenpxM5zYdb27ctOPM90bcbLTMe0pfkunVV98tDyVS9oJtEoIFNTo?=
 =?us-ascii?Q?7ND+yUg/OIS+7iKbGkpNgiAV1GST+9al3xQeErLm9XpTq82s6jYZbHMP3S63?=
 =?us-ascii?Q?ulhpxujVzWXUUI05N6TEtQ81R55DCQj4hAHtZlOLd/h32fXGdVpJtw4NLsKq?=
 =?us-ascii?Q?GGCTx1p4KpdfspwgB07Yq0Uy4vLUczTgD8Y7iaLrBHYJX2uaipiDZgIq81T8?=
 =?us-ascii?Q?mGdI9EM6CZFbcm7luq56G7738ZjvxMvd50gErOrxVdECja2IWpnhv2djuPfz?=
 =?us-ascii?Q?WFLRoPGWmBW+05fzP1BKzI2WfM3ps/5Hlr2z7lXk29/RdtEycRiEJpRGFr6J?=
 =?us-ascii?Q?PJjH7IaJQV5hT4+xo1DY7JDDHrnVitPPsvQ2YvxED7/ELqALWmVp3Wx75nqD?=
 =?us-ascii?Q?bQg0gS4qznKizRsHa7xsiqzN52hqI5uQYDUkrG9wPvy0K6/KHxM1CR5K2k+D?=
 =?us-ascii?Q?9rPhgSjdjcIP8XtkuqWD6gKOyQBRHksz8WR56ld2gpgt4rIrm8Z/PM1I2ASN?=
x-ms-exchange-antispam-messagedata-1: i6IcCe7OGyng109brvNzavIEdFzixJ43DAY=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c2aff00c-48bb-42ff-14b5-08de6821f83a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 21:27:04.0872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2miGObOgCrPV/m9nZCrwrlXWUkaN+jw9V303XyrDqfxGrqkGCLSRnOu9xxGesE+BU5kyZo4YHnpZl0YWFsSfK73yG+3tn36dEIb5nXYWoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3472
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB16720DEBE65975B510E08E2DB365AAS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 22:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230817

--_000_AS8P189MB16720DEBE65975B510E08E2DB365AAS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann Congal,

I have now submitted the backport fix for this CVE-2026-1703 for whinlatter=
 and master.

Thanks!
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, February 9, 2026 4:53 PM
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] python3-pip: patch CVE-2026-1703

On Mon Feb 9, 2026 at 3:01 PM CET, Adarsh Jagadish Kamini via lists.openemb=
edded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_24.0.bb                |  3 +-
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch

Hello,

As fas as I can tell, this patch was merged in pip v26.0, but master and
kirkstone are on v25.x. So, this patch is also needed there and I can't
merge on scarthgap until this is fixed on master&whinlatter.

Can you send a patch to fix CVE-2026-1703 on these branches (either a
backport or an upgrade) ?

Thanks!

>
> diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch=
 b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> new file mode 100644
> index 0000000000..8d34d2acb4
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> @@ -0,0 +1,55 @@
> +From ed41e052ebe78fcf043c43ea05bf16f73dfbb581 Mon Sep 17 00:00:00 2001
> +From: Damian Shaw <damian.peter.shaw@gmail.com>
> +Date: Fri, 30 Jan 2026 16:27:57 -0500
> +Subject: [PATCH] Merge pull request #13777 from sethmlarson/commonpath
> +
> +Use os.path.commonpath() instead of commonprefix()
> +
> +CVE: CVE-2026-1703
> +
> +Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4=
faa9594e05d02ca05a413a2a4e7735]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + news/+1ee322a1.bugfix.rst            | 1 +
> + src/pip/_internal/utils/unpacking.py | 2 +-
> + tests/unit/test_utils_unpacking.py   | 2 ++
> + 3 files changed, 4 insertions(+), 1 deletion(-)
> + create mode 100644 news/+1ee322a1.bugfix.rst
> +
> +diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
> +new file mode 100644
> +index 000000000..edb1b320c
> +--- /dev/null
> ++++ b/news/+1ee322a1.bugfix.rst
> +@@ -0,0 +1 @@
> ++Use a path-segment prefix comparison, not char-by-char.
> +diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/ut=
ils/unpacking.py
> +index 78b5c13ce..0b26525fb 100644
> +--- a/src/pip/_internal/utils/unpacking.py
> ++++ b/src/pip/_internal/utils/unpacking.py
> +@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -=
> bool:
> +     abs_directory =3D os.path.abspath(directory)
> +     abs_target =3D os.path.abspath(target)
> +
> +-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
> ++    prefix =3D os.path.commonpath([abs_directory, abs_target])
> +     return prefix =3D=3D abs_directory
> +
> +
> +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
> +index 1f0b59dbd..724ca0be8 100644
> +--- a/tests/unit/test_utils_unpacking.py
> ++++ b/tests/unit/test_utils_unpacking.py
> +@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
> +         (("parent/", "parent/sub"), True),
> +         # Test target outside parent
> +         (("parent/", "parent/../sub"), False),
> ++        # Test target sub-string of parent
> ++        (("parent/child", "parent/childfoo"), False),
> +     ],
> + )
> + def test_is_within_directory(args: Tuple[str, str], expected: bool) -> =
None:
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/reci=
pes-devtools/python/python3-pip_24.0.bb
> index be4a29500a..83f8d869ac 100644
> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
> @@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \"
>
>  SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b30=
1b718fe6f593aba2"
>


--
Yoann Congal
Smile ECS


--_000_AS8P189MB16720DEBE65975B510E08E2DB365AAS8P189MB1672EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif;" class=3D"elementToProof">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">Hi </span><span style=
=3D"font-size: 11pt; color: rgb(0, 0, 0);">Yoann Congal,</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I have now submitted the backport fix for this CVE-2026-1703 for whinlatter=
 and master.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, February 9, 2026 4:53 PM<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH] python3-pip: patch CVE-2026=
-1703</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Feb 9, 2026 at 3:01 PM CET, Adarsh Jagadish=
 Kamini via lists.openembedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Include the patch linked in the NVD report: <a href=3D"https://github.=
com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">
https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735=
</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../python/python3-pip/CVE-2026-1703.patch&nbsp;&nbsp;&nbsp; | 5=
5 +++++++++++++++++++<br>
&gt;&nbsp; .../python/python3-pip_24.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +-<br>
&gt;&nbsp; 2 files changed, 57 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-=
2026-1703.patch<br>
<br>
Hello,<br>
<br>
As fas as I can tell, this patch was merged in pip v26.0, but master and<br=
>
kirkstone are on v25.x. So, this patch is also needed there and I can't<br>
merge on scarthgap until this is fixed on master&amp;whinlatter.<br>
<br>
Can you send a patch to fix CVE-2026-1703 on these branches (either a<br>
backport or an upgrade) ?<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.pa=
tch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8d34d2acb4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +From ed41e052ebe78fcf043c43ea05bf16f73dfbb581 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Damian Shaw &lt;damian.peter.shaw@gmail.com&gt;<br>
&gt; +Date: Fri, 30 Jan 2026 16:27:57 -0500<br>
&gt; +Subject: [PATCH] Merge pull request #13777 from sethmlarson/commonpat=
h<br>
&gt; +<br>
&gt; +Use os.path.commonpath() instead of commonprefix()<br>
&gt; +<br>
&gt; +CVE: CVE-2026-1703<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.=
tech&gt;<br>
&gt; +---<br>
&gt; + news/+1ee322a1.bugfix.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
&gt; + src/pip/_internal/utils/unpacking.py | 2 +-<br>
&gt; + tests/unit/test_utils_unpacking.py&nbsp;&nbsp; | 2 ++<br>
&gt; + 3 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt; + create mode 100644 news/+1ee322a1.bugfix.rst<br>
&gt; +<br>
&gt; +diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst<br=
>
&gt; +new file mode 100644<br>
&gt; +index 000000000..edb1b320c<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/news/+1ee322a1.bugfix.rst<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++Use a path-segment prefix comparison, not char-by-char.<br>
&gt; +diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal=
/utils/unpacking.py<br>
&gt; +index 78b5c13ce..0b26525fb 100644<br>
&gt; +--- a/src/pip/_internal/utils/unpacking.py<br>
&gt; ++++ b/src/pip/_internal/utils/unpacking.py<br>
&gt; +@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str=
) -&gt; bool:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; abs_directory =3D os.path.abspath(directory)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; abs_target =3D os.path.abspath(target)<br>
&gt; + <br>
&gt; +-&nbsp;&nbsp;&nbsp; prefix =3D os.path.commonprefix([abs_directory, a=
bs_target])<br>
&gt; ++&nbsp;&nbsp;&nbsp; prefix =3D os.path.commonpath([abs_directory, abs=
_target])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return prefix =3D=3D abs_directory<br>
&gt; + <br>
&gt; + <br>
&gt; +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_uti=
ls_unpacking.py<br>
&gt; +index 1f0b59dbd..724ca0be8 100644<br>
&gt; +--- a/tests/unit/test_utils_unpacking.py<br>
&gt; ++++ b/tests/unit/test_utils_unpacking.py<br>
&gt; +@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -&gt; N=
one:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/&quot=
;, &quot;parent/sub&quot;), True),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Test target outsid=
e parent<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/&quot=
;, &quot;parent/../sub&quot;), False),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Test target sub-string =
of parent<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/child&quot=
;, &quot;parent/childfoo&quot;), False),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
&gt; + )<br>
&gt; + def test_is_within_directory(args: Tuple[str, str], expected: bool) =
-&gt; None:<br>
&gt; +-- <br>
&gt; +2.44.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/r=
ecipes-devtools/python/python3-pip_24.0.bb<br>
&gt; index be4a29500a..83f8d869ac 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-pip_24.0.bb<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb<br>
&gt; @@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://L=
ICENSE.txt;md5=3D63ec52baf95163b597008bb46db68030 \<br>
&gt;&nbsp; <br>
&gt;&nbsp; inherit pypi python_setuptools_build_meta<br>
&gt;&nbsp; <br>
&gt; -SRC_URI +=3D &quot;<a href=3D"file://no_shebang_mangling.patch">file:=
//no_shebang_mangling.patch</a>&quot;<br>
&gt; +SRC_URI +=3D &quot;<a href=3D""></a>file://no_shebang_mangling.patch =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://CVE-2026-1703.patch">file://CVE-2026-1703.patch</a> \&quot;=
<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;ea9bd1a847e8c5774a5777bb398c19e80bc=
d4e2aa16a4b301b718fe6f593aba2&quot;<br>
&gt;&nbsp; <br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB16720DEBE65975B510E08E2DB365AAS8P189MB1672EURP_--

