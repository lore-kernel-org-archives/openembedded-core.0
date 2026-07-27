Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D492C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 10:00:46 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27926.1785146440009855888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 03:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=TNC97TbG;
 spf=pass (domain: est.tech, ip: 52.101.69.1, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYWt81mK7K6xMQHR87S3MUgW4QI//ZXTewKwrbArfsVgNbdDUfp4ifzZsTO/IngKju++2aSHA7oVMNqBjwnXOvyblwLTJunl2nSMaugfrYZ9IWv4Y0n3MWAvQYZQEn578yt20cOVBRm0fzArYSetSek1EfIE8kllwaJn2WRYfzhkutwYvLPFab8HOU/KAS+w5WF6kSi8xcn2NgvRVR5AbXG5bZkLrOWg2dOANzh58Bj04lSp0vvuoeBHSswJoBYqGH9la1H9oo7XHPiiE0B48i9X+Mfkw+PKhe62S73eKfd8j3PelPy1Fpow0rvVztJ0jKrbnLywwe7d2OaOnYmZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsnP6ybuZZJTap6NjBAT/v66ODNjW5w/PbbGvrC4msA=;
 b=kPi8ztx2lYAY2X7d0rCSAex78OZReFTCgEYM6d/k8JBXZPj0xLl6uYY9LnW9wOJBMOInD2OnVkzgn6ZCUokIVSPOdyVOZVuWAsND5Rty65Yh/Kg0pAx1erXUv7fkopULwhD8QHIXovMfHiXZBVWB7zaltVm/T1xllLqkoWRuTy2ootBbz9JFAhIqmlMxenrrboAD8RjDY+HgOi9nrNytVh92X0lHQrq1QcJPpqet2zmiDdNqHUi+YJbbCVdKEGQ0FRL9Q++psh7oG5YR8bDv8tc4V4xnfQ42f0io8k23evB74Tg0pX4SCAbs8k89sXAawDCHaQnpXDjKLfNQ9Q9/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsnP6ybuZZJTap6NjBAT/v66ODNjW5w/PbbGvrC4msA=;
 b=TNC97TbGna4+6bNSWtWIxoLLKYKgxPQNRvxmUSYmR2KhEHFibarUfuNu0exJlVWbW6O/S56QC/fxmyebT7IJVwrYJUWK8lgtcTUUYdM75JtZ2qEaidOpH93+P+9/kYY8fJzDgbqVClAEwKy84MoR6GZRuWGELqTZYlQGB+Tmf6E/oDLEKulWp+ismgADwv97/6TwMD1n+g5vNZ/Aa28XnF1A/FEtnwsKm/53maDQwZsLT9VW0ymoZdSiSx3Mha3PtNLiY+QknZTsDXHxQh4UIQNNYFnJUZ3oXx/3tH7dhNeoRRDXQ5UmGD2JGkwB9d8F8OeFcf2dNxYVTRJkp8pJlw==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by VI0P189MB3464.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Mon, 27 Jul
 2026 10:00:35 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%6]) with mapi id 15.21.0270.006; Mon, 27 Jul 2026
 10:00:35 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Hetvi Thakar <hthakar@cisco.com>
Subject: Re: [OE-core] [PATCH 1/5] wget: fix CVE-2026-58469
Thread-Topic: [OE-core] [PATCH 1/5] wget: fix CVE-2026-58469
Thread-Index: AQHdGbKA7/SP+4skxEeduiPirJZwMraATN0AgADbQsU=
Date: Mon, 27 Jul 2026 10:00:35 +0000
Message-ID: 
 <AMBP189MB3196359C30BDACEB176F05B2F8CC2@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260722081709.14764-1-amaury.couderc@est.tech>
 <DK8SR59VW59C.13WTSX6Y2PQ8F@smile.fr>
In-Reply-To: <DK8SR59VW59C.13WTSX6Y2PQ8F@smile.fr>
Accept-Language: en-SE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|VI0P189MB3464:EE_
x-ms-office365-filtering-correlation-id: c6dc581c-3b41-44ca-a6ff-08deebc5e70e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 qtI0gnwGCGdUYf6eW0QMBaJ3S/siWGHsqPjn6UrJ4ImbeuwCJhiMMxk4wpqlpcoAyJgsnNSEKwy0TTWamblZcINh0UKzZc4vfGIDsHd5sKQKwhN3I3Ics0D5zRY6U8ET0T0mF0jj3cZGfhtF5vkdkx7D+NWoGI4OaVNfz0KF1oGVgVYGyFJq7RH37MhT3lCgMPY0HopjLxpC2ByFsJ/d1DkzkLs1INBOH+PKQBdzsUr1sPSwQgNJbQ57IpZgUALbwN5meV3q+p89t7RdJqq1/ydTQZkla3F/BFQEF8wNyXahXSL13og78IpE9c/l/Y4ei+dzbFdE061Ly5p82iWC7Fh/ESA8LrUCe/fLMjHT5NXw43ySgGjE6CIcZavikSHafhbiBr6cdOv7gVOeYdMZ5BjswhC4sp64uYyzaiP2OtIv3xG3CZ2pIASxTMapC8bGTLv7qz6XzSvzGeEMErsvBAN0rK4XcQUJh506+uq7cRAN3n5BqitGgOXMZO5M5WLG1IgOj148CPaO5IW1Wvi0VvusmIEA0A7PTN4/wvK54rnaWjlN2kuGIJ8pMXBhUEWkiAk94VDhjgci61Wg0I3fjNSuGQ5KPTUCVRDgYJDKLaISilvrTpleAaehmfSyhz2JyQuDTtMOVJTKtUPIZYYl3ostowJMLdnkQO5LJ5Du2J8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?b+23h6lnslpQqd5vYi/uuS75vPlg/WcS+tXw3cVzPEPuIG/asi3DEc6j1nBO?=
 =?us-ascii?Q?ni6yXCd8RvZl7Vq5OA+gMqrJrdCHt8XlzC6SvNSzZ4R36Ci/kI9fNE+8Ul1G?=
 =?us-ascii?Q?8mtgBh40hT4lhb8m+kOX17nlqW9DO/f3zaNbaftb+3iFsBj3L1HPclRt/TwF?=
 =?us-ascii?Q?SAiKDu/doTcrPJPOzlPHS52/ufo8VXQdsBamRI1DZ/+aejTyjdkpf/E4MjI2?=
 =?us-ascii?Q?/klZIP15r83wxLnLgLLkPf3rWsfA4hafQibRuBRBaGQ5zX9QuLazR7l3Q6pN?=
 =?us-ascii?Q?BCiyh53ArCEAREHyn9dSZ5swAucSNhhTiGs5qg0ilfUqErM31aApRSWVGoXR?=
 =?us-ascii?Q?b8GPP64bLv3bM3Xxctphv4UQms6ypJQfCtMY4hcC4d7V1/n0AgyCbn6yCTFo?=
 =?us-ascii?Q?30LzwJcS86+iKK3Iq60ucE8bVFS7If4nJSsT6jgK9xqqJIS1lF3SnWM1T4PP?=
 =?us-ascii?Q?8jofqCBVFLK8Gkd8OD54/kXQe/LyQspC5yRNpgmN7JZEqxuS35jJ73eLTO1f?=
 =?us-ascii?Q?OKnIK1lSIyAFIHP0DUxmm5MmFuIGkly3BjVZCQXF9NlEn8GTjaG/0YtjR23F?=
 =?us-ascii?Q?CP5JoZmCWWuVXeP9CW3DInZ4nW3uY+Koa4KEVG1W6eE8kfvAZSqq9DBhpW4a?=
 =?us-ascii?Q?5LZ9VbvBtkbb9HYqXksrT+9QBL5Qpje9697Rdh4KTpEnfQgFaUYawk8vWo4v?=
 =?us-ascii?Q?FYqRx2ruOI329pdmqDY2gM3A59E/lynDqZwpruYJsT8JtxA7Hep1siBdayYu?=
 =?us-ascii?Q?TzLx+/QRaGHsLsMnogDPcK2hpGAwEfHiRz2Sg4qlYCSa8qbaOr0b0GSelmjv?=
 =?us-ascii?Q?jO9gxvgeceVU2zGDE1qxsSlXHI55b99FTY/BhTAQyy5BudIjonXmFKMAqnDZ?=
 =?us-ascii?Q?9R8JLPp5v0p92Hr23ic0yKomUXtBExqmLiIp9sZGBOQA4gER1KTApYOsbIU4?=
 =?us-ascii?Q?u/q2W36PzyyOJusKq+kxs3uNuzGz7rydDQehj+zaH6lK+juQBBECohvD0uMa?=
 =?us-ascii?Q?T/KHeI3cuHCXerugDA28bgmrGxplLX8ChLcR7GA37/F/jb9B9J39H5LRaIkL?=
 =?us-ascii?Q?YCaee0Oj2wRPrHHT1tb0x3wY7O2jznYchDuYl8/u4vBSZb+Sf9FdyGkCnU1Y?=
 =?us-ascii?Q?KcAwuDQdOarVLfEZykvWa3HQPwlQuIPml8JAvsMsWeO1LgXyylvAFCZze9n6?=
 =?us-ascii?Q?PcCyTYP0vGblzHHDrxxYpQ3GvCh6ujhvP492BMQZoI7gXH5BUWpogXHWc+b5?=
 =?us-ascii?Q?JcI4i/bicBabFi4uGtzysYoinJUIyaK7FLcgkFiFsZYoXNQsjBFi5MN3JpBZ?=
 =?us-ascii?Q?THbp8y9V5XUOcPTdPyad9b+Wp/DZsb43KIIo7BsN6JUk/yuiaTBoP/hAF+lT?=
 =?us-ascii?Q?rA58bhEnbrEwZ5k4IovvVzBFb4Q2pJbxRIkh5P2OGt5kC520+ASnDB4pPG9U?=
 =?us-ascii?Q?PaxDkCCXI+diHb4bFEtq00Tgq2lQUBQHEn3rG/gRvFbGXvytAa+zLpqF4FQ0?=
 =?us-ascii?Q?6B5/eC0/gNu5a0MiixZNr4Y3hjjbquolWxfLGXTlLeEN3aDOyJ7D/9bIVswO?=
 =?us-ascii?Q?F5yWYg+NpbcTBU+GDS+TO1cl8JYlq7UbcmUOi0zboBG2Xl2nu4y4qFaR4KYB?=
 =?us-ascii?Q?41RsCP/2r0MGrx3qIJQ4ahUADVcJS9ocEGW1+Z+RTEg3PTQfjEJ8+9xPSdHA?=
 =?us-ascii?Q?jQx/AWA8JG8Fln9g9zTQdxyrThz7C9ZIxm3RevuO8qCCtMGMQ/lnW1b/3vHA?=
 =?us-ascii?Q?qAHglZSP1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dc581c-3b41-44ca-a6ff-08deebc5e70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 10:00:35.0700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m82iQOB+wqGZ+ELFubg/PZimQ9DhvPWUpl98/gMLMORnBv3OoiMt/lQLFbjc2Do2+T/UHKJKliI6VZoxI9AerA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 10:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242079

Hello,

I reviewed the patches from Hetvi and they seem good to me.
I would propose to go forward with them instead of mine for
scarthgap and wrynose branches.
For the master branch I can send a v2 of the patches which
include the follow-up regression fixes so that everything is
covered.

Would it be fine for you?

Kind Regards,

Amaury

________________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Sunday, 26 July 2026 22:48
To: Amaury Couderc; openembedded-core@lists.openembedded.org
Cc: Hetvi Thakar
Subject: Re: [OE-core] [PATCH 1/5] wget: fix CVE-2026-58469

On Wed Jul 22, 2026 at 10:16 AM CEST, Amaury Couderc via lists.openembedded=
.org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Backport patch to fix CVE-2026-58469.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-58469
>   https://www.cve.org/CVERecord?id=3DCVE-2026-58469
>   https://security-tracker.debian.org/tracker/CVE-2026-58469
>   https://ubuntu.com/security/CVE-2026-58469
>   https://osv.dev/list?q=3DCVE-2026-58469
>
> Upstream fix:
>   https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4=
fb0b6f7826 [nvd]
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../wget/wget/CVE-2026-58469.patch            | 52 +++++++++++++++++++
>  meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

Hello,

Hetvi Thakar wrote[0] about a related series to wrynose:
> I reviewed the earlier series.
> It looks like the follow-up upstream regression fixes for
> CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
> These follow-up commits are required to complete the backport, and I
> have included them in my series .

Hetvi, do you confirm this is missing here as well?

In the meantime, I think we should hold this series since we suspect it's
missing regression patches.

[0]: https://lore.kernel.org/all/PH7PR11MB8598AB8F89B7886FD3EC9148ADC02@PH7=
PR11MB8598.namprd11.prod.outlook.com/

Regards,
--
Yoann Congal
Smile ECS


