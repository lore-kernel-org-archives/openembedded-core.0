Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B77C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 15:23:02 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.303.1783696980635280155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 08:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ljk/axSm;
 spf=pass (domain: est.tech, ip: 40.107.162.0, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btbP8J9B59pErwvOjzF39fHEyvUOgge0vculB+5XY3JxlYxmwxYY6XBpyF0aWQD/IAzxtIUNPHWj9F1oC/w+iCdhJ5jELHpx2NaLde43C0SFE3mU2jixWnX8bFnFsjXxaEVPEVz+NBhF0tXV0hr/FrplTZ/psixs6849eFjPW28D55clp2kbyto1oYuwFW0+6v5+upwUo3GGnBdl012mXf11H3GmUo5EE8n93/IzSaq4ciB4G7cvlQ/AWBn49WQ6kUBJD+KH5ZxgzXUfgoNcbTpja+t2PlSOLCiVilLX5s4aof75Gcsc2ZS7ZO6WAkZ1qUJYjlvuxTqMagVmiCfluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3ts8mfHPNo6fd3Jq9oSd9MiXPRAR3VqVeKPFPg+pXY=;
 b=FVzRdHNsaCaVK3ww/26ZluXVavCV8OJi8EqxHLYZyhA0MwOI/PpQrB9lY8ONgZr/XQDRiyqLnHNPHrep56i2xLwUxLVoHYYnWNUmRLl90JtmN+WfVbHd++WTfHKnP7Pims1CAksCeo43kLF5F+tc6/7OZ+t8ydzgCE83s16kzmcmkYh6UHaRLL5Jlm0e3HjzGe4CLEOK0InplpaQdM5HKPumfimfL43TnroQ/StchFK2D8NGtGcTAOMcrnctaCDMvP9cvGMN2EggoqoFuZYO231963ylQV3p6yNhdaQnp/X6EgDxqwBJrJ1WctsBvPfmMNMAsjh7o3H8vFsyuHSJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3ts8mfHPNo6fd3Jq9oSd9MiXPRAR3VqVeKPFPg+pXY=;
 b=ljk/axSmObW/HYn5+1WTuSVGwWoywAXzd+z0xtvof8MGsB5XWbpG006oiif5ZNVpMaXDaZnodxj5wiMOngCIybibfoXfvrKcXB/w2EcGXPquVe8oOZjzW7g9zO7eCdeTYRTnF3oQOyKIlY8+0GdkNRBcJzEcjOp9iyXFAAto1tTto2uxWzGixxC00f+AsZNZ5/T5rPuOyV2GGvB9fgAnlBoHBeOFVkSgh3Qrc0eYA9kMjV3mTJ+cXnn0xwr/FJOWUlbjDjnhsoshzm3oDEesJYwNFsSTigBAwWuvYFwKqonIZTJ1WmMcLrbqMG7eipUBYc1QV6q/HJwZguylmEsyxg==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV2P189MB2162.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:ab::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Fri, 10 Jul
 2026 15:22:52 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Fri, 10 Jul 2026
 15:22:52 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] [wrynose] expat: fix CVE-2026-41080
Thread-Topic: [OE-core] [PATCH v2 1/2] [wrynose] expat: fix CVE-2026-41080
Thread-Index: AQHdD6w3uPuycxl/ZUqrgH0OrbtQhbZlekCAgAFlSRg=
Date: Fri, 10 Jul 2026 15:22:52 +0000
Message-ID: 
 <AMBP189MB31962F3722403D0EEDE30906F8FD2@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260709140651.48230-1-amaury.couderc@est.tech>
 <DJU8J04DONY4.1RYTJPW8YHL7X@smile.fr>
In-Reply-To: <DJU8J04DONY4.1RYTJPW8YHL7X@smile.fr>
Accept-Language: en-SE, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|GV2P189MB2162:EE_
x-ms-office365-filtering-correlation-id: e61d8589-6618-41db-f03f-08dede971bcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|13003099007|56012099006|8096899003|22082099003|4143699003|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 d6x+WYmsEX++Ae2ktdHo+0dQwQY6/q4drJliR38qQ366Ob2G3hxteWNsxRcfhWQaoXUOFkS9atlz0xOyc9U7hz3cdKm7+c/2jFQQVu0uJn4raqbqOoUZZsL8aojL1MzauXlKKwA2L7T/jBHcZrrSF9jyH2RTNkZyWdVmyI1mt9cguCONxQYBX+GD28Z/xHiOmgHdtAvq46xMQtMBMcob1qtrwEnBMCECv/sRLGMgFbboavrOLBgjdz+YsZ/G+XkOAY1h93a3Sje7aDsB7A48DUWmeR5lGWyjqWiuj0HxXhlKwWP6ucm6NuCFplKjWyqjnShBITaiTkWVSiKKisL4IEtufVUkVLMKBgIL+71Fe6vsidNlTPJU9WD/gzeICMZS7vgd7S9WR8JkFxc5MNzhOHc1q09k5H6yx2Ze4PAuy35RMTledpLK9ue0/NrCnwuSoikHsBKXX9eRl0CbOR+/ew/M+1FiI9h3M4AC0WI9psCFF9ErLqDVHt8/m+KBIsWqPUp87kak319gCYLnEw2mN7VP4okEZN/vOqBsd417z7AenmSkpYeVn/rd9LMnMWEK8Vb17W5WaYEFULb4BDwJPB5FjhXBRR53ps0G2RldXqEC4oWzKCfLe1VxhAUCKSDdOIbTLKhyLFgz+rzLtmIbB+5XR0+30YFS3yjS8JrgO1QBd6uPHxffUIPAx0MuIOen+fci9vuOMA5KY4p/Upk43qp0zB+KUOGkaBsOP+kwRlI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(13003099007)(56012099006)(8096899003)(22082099003)(4143699003)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?XQsSJlmqfDaWLPI8IiGgvaO6f4RAudduUh6KvDT1srtwS2R/sDilul2W?=
 =?Windows-1252?Q?xKtrh4Zsjb5zXYBq3Bo6eUG7odfYmYm1ErPWH3J1kwWPBDPZjjLolpwU?=
 =?Windows-1252?Q?Dgz8ZwD1aDmwmPDUuAIckMcfoQtrLkIYk3rSVi8TzJCdsTd+SpaLtMMU?=
 =?Windows-1252?Q?jwZOJ89trfBQXGdNun/R3scfQK98ktlKGq9RQiFQMuq6oul3yWWVnaS1?=
 =?Windows-1252?Q?PcMuzVlzNqKDwZt0wtCdy/+nxptOQESWt1dfT2uTezN7Qn3yYo+Fev9J?=
 =?Windows-1252?Q?j0geijMQEKsTYXDJniG691mFMtP/v2Zy6qTwHeXoy0wTCKlgjDYWUzNL?=
 =?Windows-1252?Q?zhJYxL7RISuxKr9ilEJLjoigxmd1f5gUZk7AmW1rPejtdNJ4wi4teLEJ?=
 =?Windows-1252?Q?NphgmXCTByTZ9xyqRBb8fBDC83DndAous09r0jbvXjC02qJXr0I0lhwt?=
 =?Windows-1252?Q?pyR5EZiVsovDjvtTni9/2DdRpW8x9VMtGcbAKg7M943fKM7vjPgNJd5R?=
 =?Windows-1252?Q?RvVhLsZVCmMREWlJ5ZJ7lm/oXmKt/+iHVDVPeoJvJBq4wlZ+K/bSXaj5?=
 =?Windows-1252?Q?usIY0rjTUf1LrEAfDd57KdGfUCkVkbn13h4hkD7k0x3j168RTF/azxdT?=
 =?Windows-1252?Q?/mI0WhBs0tWBG3Q6Cmq9HP3ZRz3k/6SQNuStdrNbXi36bGiaeHSFlpzz?=
 =?Windows-1252?Q?XhHC5erLwup3OPP/3xV4XX5S2N17kuyXRbuwNfl+LMs5Lr/VwBt26swA?=
 =?Windows-1252?Q?apwBGhukHS50T+cuN1qoKJlGKKU0bwfa0jitT0MjzApAgONwCqF+AmlN?=
 =?Windows-1252?Q?RfraGlnLugD9xEKob3TmoU66Yv6+5BTi83NC29pIZ506i2XGq37rXWvm?=
 =?Windows-1252?Q?MpKP0GHHjafR94lBz7MGBUQKsC8Vy6Al1Eyfg/RMHM1h8pazqUn+F3dc?=
 =?Windows-1252?Q?eg5+PetW7YH0EjBN+1gpGkck6WyA6L4dyayiDQlOh63Dj4nceix6wqMd?=
 =?Windows-1252?Q?/DeUBznD0AEkTpyCtxA+vn1MiquItijByJr3OJ2AagjxGuC82Yyfemsg?=
 =?Windows-1252?Q?EC4vNccEfVqf53D4NoRrV405kGXXtadj6wiPEO7SfLlvPIzuhfbn4ajv?=
 =?Windows-1252?Q?plFDT3VxkHHqZSiXA6VjQ6LmG59dba23wE9UtS17Qq7RzT99xdZI8qKj?=
 =?Windows-1252?Q?VCdD7rZl2qbbypTErvT4FcwMznDD+s0SOPHkM6ky/TgcsGZnbfI2gvou?=
 =?Windows-1252?Q?V55HyBcsNadayLIBQQ5QB8Jh9tHOVoSx80T+n16T78JRR4nMesopdbqi?=
 =?Windows-1252?Q?47V4xnhBKMVsStOWJF0hhC48gv0In7AQCRR/ncIZp8yYXDOD/LTVRR0J?=
 =?Windows-1252?Q?zlPE7Z7OQ6GjpWVGtfeOACJZE1REmvb6WPOgWrtSLV5cddWta6egUuTt?=
 =?Windows-1252?Q?PHA/wKCt71AMGWtiLNUbEf4mofDS4S7PJjrLlowrI1QDseSmX0fTJylq?=
 =?Windows-1252?Q?06jIzc/vXkLnH8HoWa9gzwvY9RXUb0Kbr8c76oGFd4KdiqgNEE7eaCbO?=
 =?Windows-1252?Q?ErZMYWcWL/4I0KoNRMT20HFmW0bAFVn+XozZxNphxXW8k7Rdwe/IQRKG?=
 =?Windows-1252?Q?z3G4fusvfF1DzQ3yxroPtpp/qBNYxUQBQIlx7trSfsPJo6BJX3ebzAKC?=
 =?Windows-1252?Q?aRJxUjdvmBzVnRk4+y0ijOKdO8PCjdaB1F3pGpeOHeCCu4bAFdCmXyg7?=
 =?Windows-1252?Q?6kIQYP5SK5eGnW1MpmtLik8G+EPGQSlUHj827NLdHmgiyOFa6PpCiNO/?=
 =?Windows-1252?Q?fCjHpfSLXD99mhxuWGvDLGFi/Pe/0v5BruTDXt+axGKZ88N8LulH3hKD?=
 =?Windows-1252?Q?P+PaAWMzcgUxqu4bNxYSsJDZaywW9uEQvhY=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB31962F3722403D0EEDE30906F8FD2AMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e61d8589-6618-41db-f03f-08dede971bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 15:22:52.0963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qOG844Vhzn/bM/J4KEos9v+zVm1FoLYE4L7ajZj5Ow/sKJJE0cYfnVIixjDJzhRcCwccFnP+LHdASIws5nHU4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 15:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240658

--_000_AMBP189MB31962F3722403D0EEDE30906F8FD2AMBP189MB3196EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I included the commit for the windows patch as I thought we may need to sta=
y true to upstream expat, but it=92s true that it=92s not necessary. I drop=
ped it in the last version I sent.
The 1/2 tag is a mistake from my side, as I initially sent it paired with t=
he fix for CVE-2026-7210.

Best Regards,

Amaury

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Thursday, 09 July 2026 20:00:17
To: Amaury Couderc <amaury.couderc@est.tech>; openembedded-core@lists.opene=
mbedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] [wrynose] expat: fix CVE-2026-41080

On Thu Jul 9, 2026 at 4:06 PM CEST, Amaury Couderc via lists.openembedded.o=
rg wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> The existing hash flooding protection (based on SipHash) only used 4 to 8
> bytes of entropy for a salt, when 16 bytes of salt are supported by the
> implementation of SipHash used by Expat. Now full 16 bytes of entropy are
> used to improve protection against hash flooding attacks.
>
> Introduces new API function XML_SetHashSalt16Bytes and deprecates the
> legacy XML_SetHashSalt which is limited to 4-8 bytes.
>
> The fix is split into 2 patches for reviewability:
>   1. Main CVE fix: migrates hash salt to 128-bit struct sipkey, extracts
>      16 bytes of entropy, removes dead get_hash_secret_salt function
>      (copy_salt_to_sipkey accesses the struct directly), adds
>      XML_SetHashSalt16Bytes API, deprecates XML_SetHashSalt, adds symbol
>      export, backport feature macro, tests, and documentation.
>   2. Windows/cmake: adds the missing .def export for the new symbol.
>
> Note: the prerequisite commits that Peter Marko needed for scarthgap
> (clang-tidy misc-no-recursion fix and WASI getpid removal) are already
> present in expat 2.7.5, so they are not needed here.
>
> Backport patch to fix CVE-2026-41080
> https://nvd.nist.gov/vuln/detail/CVE-2026-41080
>
> Upstream fix:
> https://github.com/libexpat/libexpat/pull/1183
>
> CVE: CVE-2026-41080
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../expat/expat/CVE-2026-41080-1.patch        | 517 ++++++++++++++++++
>  .../expat/expat/CVE-2026-41080-2.patch        |  33 ++
>  meta/recipes-core/expat/expat_2.7.5.bb        |   2 +
>  3 files changed, 552 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
>
> [...]
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch b/meta/=
recipes-core/expat/expat/CVE-2026-41080-2.patch
> new file mode 100644
> index 0000000000..0410f8b070
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
> @@ -0,0 +1,33 @@
> +From 3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8 Mon Sep 17 00:00:00 2001
> +From: Christoph Reiter <reiter.christoph@gmail.com>
> +Date: Wed, 10 Jun 2026 21:27:51 +0200
> +Subject: [PATCH 2/2] cmake|windows: add missing export for new
> + XML_SetHashSalt16Bytes
> +
> +A new XML_SetHashSalt16Bytes symbol was added in #1183, but it
> +wasn't added to the def file, so the export is missing when building
> +libexpat on Windows with cmake.
> +
> +Add the new symbol to the .def template.
> +
> +CVE: CVE-2026-41080
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3=
cdd1df2644388aff25dd0ed7128c7bb1de1a7d8]
> +
> +Signed-off-by: Christoph Reiter <reiter.christoph@gmail.com>
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + lib/libexpat.def.cmake | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
> +index 9b9e22cb..948135a5 100644
> +--- a/lib/libexpat.def.cmake
> ++++ b/lib/libexpat.def.cmake
> +@@ -83,3 +83,5 @@ EXPORTS
> + ; added with version 2.7.2
> + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification @72
> + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold @73
> ++; added with version 2.7.6
> ++  XML_SetHashSalt16Bytes @74

Hello,

CVE-2026-41080-2.patch patch message and linked discussion only mention
build on Windows. Are you sure we need this patch?
Does this fix a build failure you saw?
I'd rather not backport a patch we don't need...

Regards,
--
Yoann Congal
Smile ECS


--_000_AMBP189MB31962F3722403D0EEDE30906F8FD2AMBP189MB3196EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Hi Yoann,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
I included the commit for the windows patch as I thought we may need to sta=
y true to upstream expat, but it=92s true that it=92s not necessary. I drop=
ped it in the last version I sent.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
The 1/2 tag is a mistake from my side, as I initially sent it paired with t=
he fix for CVE-2026-7210.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Best Regards,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Amaury</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system=
, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"ltr">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr" id=3D"ms-outlook-mobile-signature">
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Thursday, 09 July 2026 20:00:17<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;; openembedded-cor=
e@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<b=
r>
<b>Subject:</b> Re: [OE-core] [PATCH v2 1/2] [wrynose] expat: fix CVE-2026-=
41080</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu Jul 9, 2026 at 4:06 PM CEST, Amaury Couderc=
 via lists.openembedded.org wrote:<br>
&gt; From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt;<br>
&gt; The existing hash flooding protection (based on SipHash) only used 4 t=
o 8<br>
&gt; bytes of entropy for a salt, when 16 bytes of salt are supported by th=
e<br>
&gt; implementation of SipHash used by Expat. Now full 16 bytes of entropy =
are<br>
&gt; used to improve protection against hash flooding attacks.<br>
&gt;<br>
&gt; Introduces new API function XML_SetHashSalt16Bytes and deprecates the<=
br>
&gt; legacy XML_SetHashSalt which is limited to 4-8 bytes.<br>
&gt;<br>
&gt; The fix is split into 2 patches for reviewability:<br>
&gt;&nbsp;&nbsp; 1. Main CVE fix: migrates hash salt to 128-bit struct sipk=
ey, extracts<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16 bytes of entropy, removes dead get_ha=
sh_secret_salt function<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (copy_salt_to_sipkey accesses the struct=
 directly), adds<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_SetHashSalt16Bytes API, deprecates X=
ML_SetHashSalt, adds symbol<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export, backport feature macro, tests, a=
nd documentation.<br>
&gt;&nbsp;&nbsp; 2. Windows/cmake: adds the missing .def export for the new=
 symbol.<br>
&gt;<br>
&gt; Note: the prerequisite commits that Peter Marko needed for scarthgap<b=
r>
&gt; (clang-tidy misc-no-recursion fix and WASI getpid removal) are already=
<br>
&gt; present in expat 2.7.5, so they are not needed here.<br>
&gt;<br>
&gt; Backport patch to fix CVE-2026-41080<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-41080">https://nv=
d.nist.gov/vuln/detail/CVE-2026-41080</a><br>
&gt;<br>
&gt; Upstream fix:<br>
&gt; <a href=3D"https://github.com/libexpat/libexpat/pull/1183">https://git=
hub.com/libexpat/libexpat/pull/1183</a><br>
&gt;<br>
&gt; CVE: CVE-2026-41080<br>
&gt;<br>
&gt; Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../expat/expat/CVE-2026-41080-1.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 517 ++++++++++++++++++<br>
&gt;&nbsp; .../expat/expat/CVE-2026-41080-2.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 33 ++<br>
&gt;&nbsp; meta/recipes-core/expat/expat_2.7.5.bb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 552 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-=
1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-=
2.patch<br>
&gt;<br>
&gt; [...]<br>
&gt; diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch b/me=
ta/recipes-core/expat/expat/CVE-2026-41080-2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0410f8b070<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +From 3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Christoph Reiter &lt;reiter.christoph@gmail.com&gt;<br>
&gt; +Date: Wed, 10 Jun 2026 21:27:51 +0200<br>
&gt; +Subject: [PATCH 2/2] cmake|windows: add missing export for new<br>
&gt; + XML_SetHashSalt16Bytes<br>
&gt; +<br>
&gt; +A new XML_SetHashSalt16Bytes symbol was added in #1183, but it<br>
&gt; +wasn't added to the def file, so the export is missing when building<=
br>
&gt; +libexpat on Windows with cmake.<br>
&gt; +<br>
&gt; +Add the new symbol to the .def template.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-41080<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libexpat/lib=
expat/commit/3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8">https://github.com/l=
ibexpat/libexpat/commit/3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Christoph Reiter &lt;reiter.christoph@gmail.com&gt;<br=
>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + lib/libexpat.def.cmake | 2 ++<br>
&gt; + 1 file changed, 2 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake<br>
&gt; +index 9b9e22cb..948135a5 100644<br>
&gt; +--- a/lib/libexpat.def.cmake<br>
&gt; ++++ b/lib/libexpat.def.cmake<br>
&gt; +@@ -83,3 +83,5 @@ EXPORTS<br>
&gt; + ; added with version 2.7.2<br>
&gt; + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification @=
72<br>
&gt; + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold @7=
3<br>
&gt; ++; added with version 2.7.6<br>
&gt; ++&nbsp; XML_SetHashSalt16Bytes @74<br>
<br>
Hello,<br>
<br>
CVE-2026-41080-2.patch patch message and linked discussion only mention<br>
build on Windows. Are you sure we need this patch?<br>
Does this fix a build failure you saw?<br>
I'd rather not backport a patch we don't need...<br>
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

--_000_AMBP189MB31962F3722403D0EEDE30906F8FD2AMBP189MB3196EURP_--

