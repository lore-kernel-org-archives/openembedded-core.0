Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B57EDF172
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 14:48:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73138.1770993289207082929
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 06:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=uIvl0IF1;
 spf=pass (domain: est.tech, ip: 52.101.65.28, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G115swqVO6NcOwOPimpPrw4AA9XDjzgBpLnFdmP21gFv6GWQecQSgmyKTP2sWrh8lMP4kv+xBwJNzXAJk+X8D/dw2WpuxrsCpCcqQBdHo1kMrwOve98V48dFmGYMR79pHgivPUY/2JpDN4fNKQNAFefPY/oeYbCl8ktIoxmHG+ZzUei4ysR5+GqOB3+1S3nIfSN9mErb479nVGMg+Zj9ryJ5ux4aiTM5QKo51W7U0+8J/U293CUIe81j3a2GVmlCVSYgJbccyeb60yPkGPgHRAed03xfAUPFkZLngn34H56c83yoE3/ppTLdu7NEHj7XCOvZ0bZ5N0x67lBL7eepTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye9K9k60G3aQ8pjMpgHYETnK692Rwped7udBjzEmK38=;
 b=K+XNCfNY8duI40vdALod9iTABZM6n3oX4y9895hQg4CSyK8Ig/3VE5VNCYdYS3dxo4VBTatr6nNjhtLpEICp+7kTQjAVR5EGOk01hDs+Y2LTywQXWJ2htn2cqi/nHtxU5Lg1tx67pflPCSmQoBk6xUIqT5RqiqchIZoB/RsziTgvF8CfsHnTf9QQT25JzmqwlU0Xljs8dSLumRvTm4B3I/LTs4L0msKoVIr+xy/oc6LNeGvZUFyxthDRJUH9sOU4TMwD9w0Qd4RgpLMr03bAe/Pb78IMBZ4Rko29jwqmMtj7azeGSMJUVMcMY9roTf6L0ghNO93TVHqiXDrWrRxDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye9K9k60G3aQ8pjMpgHYETnK692Rwped7udBjzEmK38=;
 b=uIvl0IF1R1d0cCZSs3/nhc1WIUJory5aD9tszk6W0um7TQr29np62bbf3ZudAG82p5KZHgLdVzuh/VhBd0AvvszA1eBvA0A0xYTJaVshl/cMvDUFl2n4nPk+mqwIEH/uvNCeEiHtriZoMjLYwWvavno6t8SomOUGXlZhw850IZ6oBLSYr1ZOPtCyfPaHVsZ1jVQvlT8CbK0gsIebzNU+bdo5foYwzaTvOzd0Ud/qUIrRxrNLkAoPBdIshR3w2hmlHs/2cPYcXINYtEb7XohB5dYjyNPGYP7wT0sVlSYUcIFARqvniKqbwA0tNl6skKRZbLgsKwMB1y+ugbv048ubmw==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV2P189MB3054.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 14:34:42 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 14:34:42 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v3] python3-pip: Backport fix CVE-2026-1703
Thread-Topic: [OE-core][master][PATCH v3] python3-pip: Backport fix
 CVE-2026-1703
Thread-Index: AQHcnCrGchyCn35eC0Kf5t6ZXac7ZbWAbPyAgABGRIA=
Date: Fri, 13 Feb 2026 14:34:42 +0000
Message-ID: 
 <AS8P189MB1672F4A2D5627190A843785EB361A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260212142039.81511-1-adarsh.jagadish.kamini@est.tech>
 <DGDRCZ7U3O3C.3XAKZ0U0203T@bootlin.com>
In-Reply-To: <DGDRCZ7U3O3C.3XAKZ0U0203T@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|GV2P189MB3054:EE_
x-ms-office365-filtering-correlation-id: 618806fd-4f86-4350-e67f-08de6b0d06f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|7053199007|13003099007|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?h+6q6zNoyln7La1S5hMrqmUqb+0dLzOwnncjcaQ3UXeL95tm0n6FOmzOFP?=
 =?iso-8859-1?Q?neR8LFqzCXSLS2mGvbmlivwE9A0+prXkK1hImpq7T44X+GZRYyFKnjn2BS?=
 =?iso-8859-1?Q?KpiZrsc9o0mcob4nKEieco+kz0UYHr6tKbw4+jUS4Z/+C4blpLp4MHPASb?=
 =?iso-8859-1?Q?26C/KduMOXKXAxBZkSX1nBCUcGz97rb9ES+XBvcjR3373dm6oYqZtVhYKD?=
 =?iso-8859-1?Q?XnHx1UtwSLw998eEiHt5JlRgaEVsvbNBX/1iLfMs6QoA314+Gd79n8E41X?=
 =?iso-8859-1?Q?TyXdKWYYPMVrWRd7gbpzg6h3/vudvN+X2b0Bpt0xhYrxiXynvt5m5gcEQu?=
 =?iso-8859-1?Q?4VX/jZWqwFE7sR7Yrwc8zLkdBYnzf59KT3LR2kW3FjrEL48rP4XKil4tpo?=
 =?iso-8859-1?Q?/1V9MGtmEDu3ObTICQPKxOks1gSX9f6fOkHNsW7xckFKCrU45rVoQdiyRN?=
 =?iso-8859-1?Q?NyBIpvLOwjTw+cGujdfYp5EDp2Wcuxyeq5Ww1oq1qZ5Vy3U59aGqV6xy/C?=
 =?iso-8859-1?Q?8g0ju+RPq2mnSBWceTUJQhJ5wMZTP2HxKNDKbwQoQAyrXn8mGsKJGa6uDR?=
 =?iso-8859-1?Q?BC69fAGC42796ucMaygaQ+0ihtXav5DoLwTwW8v3o1kP3KoBFiN40hVqj/?=
 =?iso-8859-1?Q?62xMfue4GhQ0nDYoEQXnhJ9gvxmN/3L8JVMyIPUVWBv6VqQFMvxgphh8T9?=
 =?iso-8859-1?Q?DKL4ChN4lR7je40fd1PXhu8dNJXVUBxGmxkKkuhBb7PlyEheeGT+l8QKnU?=
 =?iso-8859-1?Q?mukoE8mPnO1Iy25ILuydn7hyJpbaGhtxautPPaqxV+ZwDJGpdJsBFe5Mur?=
 =?iso-8859-1?Q?awcYjdujz3Xfkfw+JjLyee3dsMFbppFFdTtf530yWPAWLBoFyLP9Zf1HB2?=
 =?iso-8859-1?Q?iWRDrNQMlnTaEMqwFGbSyBeImJ937vuny1MXNmaKc7DxT/BL6vOgwd/enb?=
 =?iso-8859-1?Q?we6YAYQlhaqlDGpnBX78lPJbM3H4MVrQ5P9ld5PbkGj2hD10o09Mui9o66?=
 =?iso-8859-1?Q?ngXe+PaR/QVmmeDye+HU0qV958iyx3iR3hQyQAI+ffev7PddSqTwj3mWrt?=
 =?iso-8859-1?Q?czISi1//5YyHofytPz01XqiEDm0aCd8uGLG8JoEBruB2T+I3Movqb94J2G?=
 =?iso-8859-1?Q?92pdBhQMmcFko+MrOtM5yKToAHfa49MNJWHDKnQM425vI7S2n0LzWmqLC+?=
 =?iso-8859-1?Q?7WcsJJ/wY6lMcXw3q/NYvSY77SxEq9LLWxv9e9EaFnwAta+NxPshmd+L7e?=
 =?iso-8859-1?Q?2QbJ5qhNeQVb7jfTuLClE1lqmGTKNeMS6GM4C76JcsDGAXZ7HJ1nKwmHOv?=
 =?iso-8859-1?Q?pzPy58BjXo1okk4akV9u7WhNznbjBkrrPcXjN77WJzboe6WDCZaTLifgEs?=
 =?iso-8859-1?Q?MFv/hJTHqpbY1D0i0yCUYQW/1JkF/DzrGHAXpKnHE7cvE0uDXec5EfsQmD?=
 =?iso-8859-1?Q?nLK8fH4p+iNdfkpkuWtPSSRofWtT3SNxOZ9iJE2+NCfzSh18iAolwGxJq5?=
 =?iso-8859-1?Q?8YxPDL6LBARzYw9BY6EgJPfMGrAff0vdYGWWy5mA45jbVbKMmdvJr7iF+z?=
 =?iso-8859-1?Q?D3ZeL86N6ZPEXN7oaP1lRHbm9izYxykfwTDVunHaEkVEHcXv/T8GlF0Bmt?=
 =?iso-8859-1?Q?aOWFf/dgZWDpY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007)(13003099007)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?DJxtvgPjk8DPTFGr4Bb+yaHWyW/b5he3cdcnnqPH4ADSSAt3PVbhZeh91t?=
 =?iso-8859-1?Q?dMlmA+isyT71bMt+weofU9rNAorJAZMjE0x0Q9nCZplGA3sjacHiJ9aNbQ?=
 =?iso-8859-1?Q?+MKXpHnt8ls87kHJtFjrydovPOZOprA2UrDVXyegBUzrTJbF702O+pplmb?=
 =?iso-8859-1?Q?GChvnANi/vthDmdzzacYoL8K30DBs/RARfLO2bFJgYE4NWngwH6nueFGzU?=
 =?iso-8859-1?Q?f6UJl0RH2nom9YPR3e5F3OkLJbHya/BCg5D5eNP4HiLB51Dx/3up+B9qM0?=
 =?iso-8859-1?Q?MNLx734l2H3VGL+s+mBlrlnmM7OrCeDrrINHSxNWoDQlsnxHZIZwUZC5nn?=
 =?iso-8859-1?Q?YZmNdIJoqsYi4XYvAJU+PC1Uohyo5uM9tfaoYsylXviiosuOioxtdOoiKK?=
 =?iso-8859-1?Q?tB1eoW5D8Kf0/En5gCD3jGeTpap+dt+tysKHC5vrlDaYw3t6i7XxRl3On2?=
 =?iso-8859-1?Q?a+C8Wr52qCBrOpVQLBr6HcfaJ3N6asKYiaN+FhyAal4+ZEI73oTB+x6fVy?=
 =?iso-8859-1?Q?qZpnk/n7RhvnrWnE4kJZIl60RUPZOcY8i8JKF1gtCRTR5uuHd7DW+6KdXB?=
 =?iso-8859-1?Q?tZ3r8R+OOKcflJwdOJtxvNEo5MLkwoIVGHulhJVAFPwvP3wkkEyvnYsCi0?=
 =?iso-8859-1?Q?d3CUWRKYYMabKM6JPHXm7RD+DadlKwjgSVrcgaBpE3/ntX0r9kFAQGQTi6?=
 =?iso-8859-1?Q?zYrCaUobOv1VK85fZG4bN5SYjBiuK+lXsMbijY2nWEWGpbFrQXNMQYfewv?=
 =?iso-8859-1?Q?3JzCDwSbnJJzALGUtrOP4t3WRELnYURArKn57MW/P8woYGLaYR6kSFQx2Z?=
 =?iso-8859-1?Q?gLyNII1iLQ4K6Nrx2bzLeAnGuzsN638Qf4ri6aRKeVonhQlZ3gSqSEKAAG?=
 =?iso-8859-1?Q?DictAou8lFnVALYhUAG7jwcrxaCgff0GWKtGpEVEldCYUVq67FFx4wKldh?=
 =?iso-8859-1?Q?rW90dlWdTcV74tLKSWrdS+QhagFLI4u0OIGUBi0R39AiAEN2ubaxRrYUtU?=
 =?iso-8859-1?Q?+LHEJ8AaPP0PkDV358CmzGmWBrYFxXnk1m1Ez+nuVKZ5+rAOPumZ4g1krE?=
 =?iso-8859-1?Q?6OOH3vY64k5kLpwhX9KORcRgFtWbk69bTnyNKFso7E4OcL7ExPlmX7ml4J?=
 =?iso-8859-1?Q?azV4ubsHH04fYDnZqP4op77pfxYz4oUtKHE9V5AQNvjry6tK8Vk4PcC/3H?=
 =?iso-8859-1?Q?RlIhG6eU5OlOaupYJ5rnGE3LpN7tttsKQh/Nqc3ZyWLqBm7r+5acCaZ2ES?=
 =?iso-8859-1?Q?MWHanszDgOqHkK64nshdWQc6jA8jw+D2yWGiwfih95Dq54Les6nZWWQdCZ?=
 =?iso-8859-1?Q?cyyQgjiGpU8+DgTMYR9JffwleAdoglsnJAqnQKXDpJFmnGY/Fb5Mn+GEiU?=
 =?iso-8859-1?Q?87lFI6bdX/dgRah0bLBnSpu8w+ylMT/MpbpsRvpomfe5/qJwf2pJTucj+v?=
 =?iso-8859-1?Q?SfG6FV9XQKxD/9isE9ZYUq2Jv+HkexyVSQawn44yj95v8LKZCbH3DtGHxK?=
 =?iso-8859-1?Q?PyEjBfe1uyEP6+rRGmR9K4yTVl2uh5Je+GSH2Fw7q1fcgqCVu4f1HfLX3B?=
 =?iso-8859-1?Q?bQoKr5KAzl/nVST2e/VnIxYOQ1oZzpxIeVOzerPZuvylSXOtkZoNIb2NNS?=
 =?iso-8859-1?Q?OwsNqi+v0QQFHB+dBhbB5kUPhBBOOkpDvujMkGfQ1xtjDvT74SQF5MfRfa?=
 =?iso-8859-1?Q?E/Ft8RyKbFGdww7ZuaNwWAu8ZZJgNDsbpdv+WH+6APdrvHTBTkfA9cKNNW?=
 =?iso-8859-1?Q?OHpaD8XdtjqwRQaO3oM0LHSteP0EkNP7DGISe8lLF+0Ork8LplsIywVxtO?=
 =?iso-8859-1?Q?+WaJ4fNfLa81Vtrbo6Ekj6KZ2q8DyxwW3INzqVIX1tsHcBZPeBM9pM36Gi?=
 =?iso-8859-1?Q?ss?=
x-ms-exchange-antispam-messagedata-1: O0FM3leMXGsz0d8R+IaXYR5MmStbYnUkujk=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 618806fd-4f86-4350-e67f-08de6b0d06f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 14:34:42.7969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OP1Gtc/M3B9RpGf9HFU6nrbgwZ6jvn3Oa1S5xC8mMoq+55LLTwIs5HbYuwm9p9u9LFd2R9MfNTC/N9liM/sQSr1XV9Ba8Wie/du/jEcKsKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3054
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672F4A2D5627190A843785EB361AAS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 14:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231122

--_000_AS8P189MB1672F4A2D5627190A843785EB361AAS8P189MB1672EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Fixed it in v4.

Thanks!
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Friday, February 13, 2026 11:22 AM
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v3] python3-pip: Backport fix CVE-2026=
-1703

On Thu Feb 12, 2026 at 3:20 PM CET, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_25.3.bb                |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch
>
> diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch=
 b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> new file mode 100644
> index 0000000000..fa3ecfd6d0
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> @@ -0,0 +1,55 @@
> +From f3354dbf1fa59895cd06f310064d57b73f05426a Mon Sep 17 00:00:00 2001
> +From: Damian Shaw <damian.peter.shaw@gmail.com>
> +Date: Fri, 30 Jan 2026 16:27:57 -0500
> +Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/commonpat=
h
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
> +index bc950ac93..b3f52e85e 100644
> +--- a/src/pip/_internal/utils/unpacking.py
> ++++ b/src/pip/_internal/utils/unpacking.py
> +@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str) -=
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
> +index 003cce148..582da9722 100644
> +--- a/tests/unit/test_utils_unpacking.py
> ++++ b/tests/unit/test_utils_unpacking.py
> +@@ -412,6 +412,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
> +         (("parent/", "parent/sub"), True),
> +         # Test target outside parent
> +         (("parent/", "parent/../sub"), False),
> ++        # Test target sub-string of parent
> ++        (("parent/child", "parent/childfoo"), False),
> +     ],
> + )
> + def test_is_within_directory(args: tuple[str, str], expected: bool) -> =
None:
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/python/python3-pip_25.3.bb b/meta/reci=
pes-devtools/python/python3-pip_25.3.bb
> index bbc70e3eae..5a50722d6d 100644
> --- a/meta/recipes-devtools/python/python3-pip_25.3.bb
> +++ b/meta/recipes-devtools/python/python3-pip_25.3.bb
> @@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703 \

File name should be CVE-2026-1703.patch.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_AS8P189MB1672F4A2D5627190A843785EB361AAS8P189MB1672EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Fixed it in v4.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.c=
om&gt;<br>
<b>Sent:</b>&nbsp;Friday, February 13, 2026 11:22 AM<br>
<b>To:</b>&nbsp;Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&=
gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.o=
penembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core][master][PATCH v3] python3-pip: Backport =
fix CVE-2026-1703</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Thu Feb 12, 2026 at 3:20 PM CET, Adarsh =
Jagadish Kamini wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Include the patch linked in the NVD report: <a class=3D"OWAAutoLink" i=
d=3D"OWAe1c125e4-33d8-8c21-6227-df7e29835a77" data-auth=3D"NotApplicable" h=
ref=3D"https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2=
a4e7735">
https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735=
</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../python/python3-pip/CVE-2026-1703.patch&nbsp;&nbsp;&nbsp; | 5=
5 +++++++++++++++++++<br>
&gt;&nbsp; .../python/python3-pip_25.3.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-<br>
&gt;&nbsp; 2 files changed, 58 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-=
2026-1703.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.pa=
tch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..fa3ecfd6d0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +From f3354dbf1fa59895cd06f310064d57b73f05426a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Damian Shaw &lt;damian.peter.shaw@gmail.com&gt;<br>
&gt; +Date: Fri, 30 Jan 2026 16:27:57 -0500<br>
&gt; +Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/common=
path<br>
&gt; +<br>
&gt; +Use os.path.commonpath() instead of commonprefix()<br>
&gt; +<br>
&gt; +CVE: CVE-2026-1703<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a class=3D"OWAAutoLink" id=3D"OWA253776b3=
-1199-9385-8602-e417ebaabfdf" data-auth=3D"NotApplicable" href=3D"https://g=
ithub.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">https:/=
/github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735</a>]<b=
r>
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
&gt; +index bc950ac93..b3f52e85e 100644<br>
&gt; +--- a/src/pip/_internal/utils/unpacking.py<br>
&gt; ++++ b/src/pip/_internal/utils/unpacking.py<br>
&gt; +@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str=
) -&gt; bool:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; abs_directory =3D os.path.abspath(directory)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; abs_target =3D os.path.abspath(target)<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; prefix =3D os.path.commonprefix([abs_directory, a=
bs_target])<br>
&gt; ++&nbsp;&nbsp;&nbsp; prefix =3D os.path.commonpath([abs_directory, abs=
_target])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return prefix =3D=3D abs_directory<br>
&gt; +<br>
&gt; +<br>
&gt; +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_uti=
ls_unpacking.py<br>
&gt; +index 003cce148..582da9722 100644<br>
&gt; +--- a/tests/unit/test_utils_unpacking.py<br>
&gt; ++++ b/tests/unit/test_utils_unpacking.py<br>
&gt; +@@ -412,6 +412,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -&gt; N=
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
&gt; + def test_is_within_directory(args: tuple[str, str], expected: bool) =
-&gt; None:<br>
&gt; +--<br>
&gt; +2.44.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pip_25.3.bb b/meta/r=
ecipes-devtools/python/python3-pip_25.3.bb<br>
&gt; index bbc70e3eae..5a50722d6d 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-pip_25.3.bb<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip_25.3.bb<br>
&gt; @@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D=
63ec52baf95163b597008bb46db68030 \<br>
&gt;&nbsp;<br>
&gt;&nbsp; inherit pypi python_setuptools_build_meta<br>
&gt;&nbsp;<br>
&gt; -SRC_URI +=3D &quot;<a class=3D"OWAAutoLink" id=3D"OWA5407d9bd-43a5-8a=
b7-96b2-c232245663f7" data-auth=3D"NotApplicable" href=3D"file://no_shebang=
_mangling.patch">file://no_shebang_mangling.patch</a>&quot;<br>
&gt; +SRC_URI +=3D &quot;file://no_shebang_mangling.patch \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 class=3D"OWAAutoLink" id=3D"OWAab5e7283-edb5-a636-25df-2cc1eabe0da4" data-=
auth=3D"NotApplicable" href=3D"file://CVE-2026-1703">
file://CVE-2026-1703</a>&nbsp;\<br>
<br>
File name should be CVE-2026-1703.patch.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a class=3D"OWAAutoLink" id=3D"OWA972bd1af-6302-6552-e3e1-5898e576620d" dat=
a-auth=3D"NotApplicable" href=3D"https://bootlin.com">https://bootlin.com</=
a><br>
<br>
</div>
</body>
</html>

--_000_AS8P189MB1672F4A2D5627190A843785EB361AAS8P189MB1672EURP_--

