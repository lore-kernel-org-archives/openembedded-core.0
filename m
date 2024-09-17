Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E119C35FEA
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:51:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web11.15327.1726555895216438564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=JXIxTBeW;
 spf=pass (domain: de.bosch.com, ip: 40.107.20.80, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrErvnpZpDFAziQAaAgKMY8mv/WTdLcFXqHKx25pV0urA+UICP7OiUPBYMvUzo1a57mqmen4uqLxzrD8jZuL9w2mZwjlMovi8Gsu1XvFOUi873SJAcnAxVIJ5AACIItkO+g7We5Rik1tcs7W1AsCfeyr1jairxTkMr58R8gO400nzRL4b6DuDwp/B+L1NYwu54KaMhO988b9gem0lj6AiLtWlVegnXxMpwjfjJ2TiEVj2KUGl3JzFeBMyvD7P8c1x70amVwFS+vGBwUl3wWCKzKPdgYe6yTrcstXuxGB/OAlRsbNWZd0LsqyIhI4Jzh/U29sRiOXPLPVFh2pNmQdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHmdG1BHMc+gSdCtQa57n9yByCoGXlZomhqfARgRg/Q=;
 b=Bo0ucnrzXFz/sozj/vtocMihBKYRwu580NRiYIzbK87ynXTWzu9/4sLlFCMQ05dhWZM6ZkBupBZJNKe67O658Jo3V7jM52RHgXSR1c5oap6L1Ay1dwShptkpP0TiEXU63G69Lgz2XTRSM0j584+2RDk1WCcpzPBfNZ55vmzbioC1kRXknjtVfMWXlKwEgHbBE7cW581QF+iVoulArlCq/PUqUsrfq2Fmo31+XIZ+tn/DDsrR4n1Lk1jt77dlGcTRoMrBXKB3dBEmI7BtImmOUaNBlljzicStErnNTrvfprZhnIDQmsyrwDduVUyRpzd9n89GW+LMjDD0x286IFSDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHmdG1BHMc+gSdCtQa57n9yByCoGXlZomhqfARgRg/Q=;
 b=JXIxTBeWBfe04X/Rf7fqNzIGgJrOmGJjA1u3ppiY0f1Aen1Sk9ZyObBGsnkRMaHoWYzSPp1anANmFk7YtQby2AmYtyOBGOJxUKGW7N3ATrHD60/wr0LcDZKTrkcGwqZgqc1+IhMOXND79xqasFB/3M6R9cfjhjJjEPVlNKMZxWvgWd82mMV4y5BZjEqao6v+62mfAv4Ue2fjPSb8eR5r3JzLkDe9XuLoUZ3kxX7A2MylIB2wSpDG5v6mT/VklEvsbdBwYSd0QPk8UvEGIkAh2SqfCdxJDyAbKseVHqx/X9Cdfuf/5hPs7+NBquLbtIGWRBOeUiUIJ7k7J6G6Ct0xsw==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by GVXPR10MB8414.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 06:51:32 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 06:51:32 +0000
From: "Jonas Mark (BT-FS/ENG1-Mue)" <Mark.Jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "steve@sakoman.com"
	<steve@sakoman.com>
CC: "pidge@baylibre.com" <pidge@baylibre.com>, "alex@linutronix.de"
	<alex@linutronix.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Simoes Ricardo
 (BT-FS/ENG1.1-Ovr)" <Ricardo.Simoes@pt.bosch.com>
Subject: AW: Backport fix for inter-recipe useradd dependencies bug #13419
Thread-Topic: Backport fix for inter-recipe useradd dependencies bug #13419
Thread-Index: AdsIZuK9Lhmr0SrRQhe6uZfdz+y7ZwADtx+AABWzLFA=
Date: Tue, 17 Sep 2024 06:51:32 +0000
Message-ID: 
 <DU0PR10MB7076A4575A74F005ACE5D217AD612@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <DU0PR10MB7076812C64238EC056EFCE1AAD602@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <d6d5664e994c9cb45ec0e39bf05104b341920641.camel@linuxfoundation.org>
In-Reply-To: 
 <d6d5664e994c9cb45ec0e39bf05104b341920641.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|GVXPR10MB8414:EE_
x-ms-office365-filtering-correlation-id: f9fd0607-8914-40e0-6b28-08dcd6e52a0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?2Yc0Bs3hNaDg/MB7uu2hNjkArCj9EMgghvFkHGLE9ecwLhOjUImGDuvYMQSr?=
 =?us-ascii?Q?LSLN9EeoKJdUYnOWiP4/YsP/4YFiBuIOehhksGgyZtDZmSlXdnaJyM8OAxND?=
 =?us-ascii?Q?QjF91uLpJtDH5L7qWPMYCC64juhe6T96ztrSbr6UDgei+ogYd7fb2H2eirUp?=
 =?us-ascii?Q?wemdrTGR8hbhUv26CDQD/PUwfNv7baml+4Kc6M8fjG6UwqX8Ed9nnXnBMKqr?=
 =?us-ascii?Q?8+z803I12P+NoEus8UPASNiQmN0wQPkIUnHvvdcxYZMtraGFYI0zHrNHilsa?=
 =?us-ascii?Q?xSAN3TvC7rYduwKIPB7eZDcBfi93JhuhZl9bu8LsMcDTO0DNtzmrPnaXPLQw?=
 =?us-ascii?Q?aXoOSSKMj9078lkuFG9OFr7b2uABtfhHYFimHknCX93PvXmB12ZSQu+Mzwlv?=
 =?us-ascii?Q?B+YueNAdjxqKXSLWUGltxT0+Zv1a03f8R/lqsr9xRmN8lENLkPC3n13+kpLT?=
 =?us-ascii?Q?a1ZSBRkzwwrIIGRD/UIaeyEyS5RVlwPNigWoHpyu/Nz5I2qw7IuOPh0HtFNZ?=
 =?us-ascii?Q?W2PQYGRJ3/ntPEOi6sJd0Prn/aujbTqZuKCHs6KS0u+OF1IZnGUtN3pcAdj+?=
 =?us-ascii?Q?pD1AYF2lNvfGRXMruqUo7HcqN4ldPWmql/E3Rz2S45FgHy1xq17gXT9mlGsm?=
 =?us-ascii?Q?0tH0waBHvRn5nKCEpHkS8sz135FxGyaBGfcmnKye0pmZQ6NOHXtBkK7VzXMC?=
 =?us-ascii?Q?0HOyMy5Ld5Y0M6mB6T6JTYXZllEcfCZFw/x+nmtT6naWcbBLo0y2QT41T8Ki?=
 =?us-ascii?Q?VUo5lpRVf9nCb+7nRMfLsaMrROEofvMorOuTuWV6vdMFGSInS/VOBiWKw2ie?=
 =?us-ascii?Q?VW8cxBEyxWhYTs15qaWCzeSpqLMri3RPWHuUWYCqloLjtBoLeSuk79Fim2hh?=
 =?us-ascii?Q?Rpvn4gZqknC6BPYxbQfUX76zdn3/990o2OLjpxzqNNsGA8kKrt+gOxPw3Mlt?=
 =?us-ascii?Q?V14hfa+VQcgNowKz3eIkeraVWwbqsg6lB7v7BVgbhs6s5lGAhMvy5WeUNEbZ?=
 =?us-ascii?Q?mJSUG87GywQsYog/bccwAIqTCxVxdC+FHR1dP67krsH3KcA5YpAYxmYqj1NB?=
 =?us-ascii?Q?EMav+U4Ra5+1EQEqmffc+oa8k+wsC+CaYb2jXlMmOEHjNdjBtjA/RnYFoLpk?=
 =?us-ascii?Q?QxZwJoXhjBGaUKPznoeJ4wVyi9Uzkcrd+Oc19ke8TIcL1fLZGu8upltxDfho?=
 =?us-ascii?Q?NuRHaekGN3BgGLrbdlYoS8k9lC3kbHa2ElhxBkCXX5b9Kro0kVuhcEF8NAgM?=
 =?us-ascii?Q?Q8mqTRucQRX9qc5kTKkSymJOBVHuqglQi94d4+OluO01I/WNW2xLplTbclLo?=
 =?us-ascii?Q?ey++eMIYb6WMdClq+E6r3l5tqyYxpOB9QIF5penFu4NuuBBwu+onKdd78AS9?=
 =?us-ascii?Q?zsjO2BJIS1MvbwRPWNPSkxmvH9fjICZrmKQUmAzZZSLHQ1gvkw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Wa3tGFaN6Nn682IH6jvtSFI/CpoFlaYbJE6/ONYhXe0rxi0S35uL22vL620g?=
 =?us-ascii?Q?xnrQwsfUildiXlecFAC33kemxymiq1ehUptPuSOtERDTE2tXaXiFvDkPZGOB?=
 =?us-ascii?Q?Ue+2+LFiNmcMNA/svzXKiTSvYChRFif+9qcGQfZDhlKMmalQP5GZhWeHVb40?=
 =?us-ascii?Q?JYRBL6mF5e9dl7LlArQWBWs5aCkl1upI43r8BzmScAmwpnX6Lsnrh3QI2iBu?=
 =?us-ascii?Q?knMwqPPQ2tJOi1WNc6clfzzxL7KSbWIZpXG7ohf9PiTvPWq2GUraBumpe4oh?=
 =?us-ascii?Q?djyWLYagr8XW28JG/1IqdmJ5ySlXqOhmBGSTFNRPZfs7oDqiZ+K2Zt1iMMi4?=
 =?us-ascii?Q?070jI+iqq0jiNTgDzZz4jlRc9ZtkV9Nws1qfz8Qgahrkd0kdQrYkGdV6HleY?=
 =?us-ascii?Q?K/MWudUmPW+fm7rrADwdMq06zAnXROJbERDKEKIwyuLbQVp8t6KIFIDMjgWz?=
 =?us-ascii?Q?hbqRvtIc3NBRxLjKJO5PRw1VGxFDVOFOOTv8Of8jiwAQ3HO+TdSOaw3Y05hl?=
 =?us-ascii?Q?1ObC+nCyv7VQk/d/rJoT2Yv286Dz3mh+vrHz+M+bkgxtNIy7+i0TV7nAFnsy?=
 =?us-ascii?Q?matrsNoyxAm4XyfLJ/1tIY6aXE7wmiY4cnyDVBJZs8+7tb6xtGxf1WJ16aIc?=
 =?us-ascii?Q?3ktJ8lmKV3vNLFCRyUIr3EECXIfZ/vd/Z0FWK8h2O0tinJDt7RrsdEKSDPGm?=
 =?us-ascii?Q?NWl+33E1t3JkEIzluwAAwBVS+jWGUC90ZIqyfgYGURANyirc9rAC1h5N9eTW?=
 =?us-ascii?Q?DZfM+9+pdWIns6/TKEfh0/k83vylWvgLifyqegXpWCv53ebumvKRUSnETYEb?=
 =?us-ascii?Q?1j64dU50mthPUReHGzSR+KFZrQWxtqFUe6wpY44knFdn5WWDKPPXXSrgGQCR?=
 =?us-ascii?Q?EfAjS/hLqvSKxnjEP/fj2O0PJAL5iZJuaKOFxNnjNCkmk3UngckYSd5TPfq7?=
 =?us-ascii?Q?nbjtlb+fAySw9yCtMXISMLAmW+HpvzSxzTt1UUDXn5YKtSgAxAyKbvLhk6Ed?=
 =?us-ascii?Q?TF+6/9Mj9uvhQh5YYn/+QZ6hT3/slKmu2WUYnkL8Y0lShGPiWzvq8NaogYm5?=
 =?us-ascii?Q?EUze4ueMkjO77plMyw3dhkUFuCX4bTcYWo8AYqfoP+OC743saYc4Uvrk5pN4?=
 =?us-ascii?Q?F1F0/0Gpdl/JVflR2BV87yYAuMUZgxHi6eyKB2CzLkdt1RcWkq8B9phGoU4L?=
 =?us-ascii?Q?IBWkkBuvpcZWiK5YAsJZ+YyFwXxHuYdbkXZD3Wdakw4Uv11bXtgZd7z2qPva?=
 =?us-ascii?Q?3Z28YRFm/Nxk6kVjFJDHPkAxs7AEWWUjzJOLL5/lX5jKf/HcpmWtjYware/8?=
 =?us-ascii?Q?Z6zDhqKkl7ylw9UUeB+9z65NEygZMxJY07vDJnNDk6BX6nAVo2dNKy3YGD2x?=
 =?us-ascii?Q?F80K1FElKZvclWSPO4ZFE2sF8h1uPrxPiFreHCGo+aONdgttI74JwrTsH6O3?=
 =?us-ascii?Q?8OT21aTj8ugvxZD188bZwwhhDgg5b98wqTqUsVa4Y/iYQjH2UTlkW16HeTRu?=
 =?us-ascii?Q?HuXmcnWZTc4UIEHSD/g3P7RUesU9NO912cI0sNVrQ8X8KbkXZjoXQ9Dja0dP?=
 =?us-ascii?Q?VcF58xRt3mLewOFYiJ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fd0607-8914-40e0-6b28-08dcd6e52a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 06:51:32.0640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZEFJm/ngpsfiyic6cR1lNEobjP1wtqzF0srt2qH7F/2Wd/7n9eAAhvV1FA6DuOuRFSBwOfCvo1GEdkbxkUVvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8414
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 06:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204616

Hi Richard,

> On Mon, 2024-09-16 at 19:38 +0000, Jonas Mark (BT-FS/ENG1-Mue) wrote:
> > I am wondering whether it would be reasonable to ask for backporting
> > of the fix for inter-recipe useradd dependencies to Kirkstone?
> >
> > I am referring to the fix for bug #13419 which was fixed on
> Scarthgap.
> >
> >
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz
> >
> illa.yoctoproject.org%2Fshow_bug.cgi%3Fid%3D13419&data=3D05%7C02%7CMark.
> >
> Jonas%40de.bosch.com%7Cf4f038e950f74975cbaa08dcd68ce354%7C0ae51e1907c8
> >
> 4e4bbb6d648ee58410f4%7C0%7C0%7C638621147799841791%7CUnknown%7CTWFpbGZs
> >
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> >
> %7C0%7C%7C%7C&sdata=3DWFksvlULalWked50wkL8hCwnxWSKkT432fh1Zh2pkp0%3D&res
> > erved=3D0
> >
> > I understand that the backporting would involve the addition of
> > USERADD_DEPENDS to useradd.bbclass as well a fix to bitbake.
> >
> > My colleague Ricardo and I are visiting the OSSEU this week in case
> > somebody would like to discuss this in person.
>=20
> The changes to bitbake were complex and relied on previous work.
> Whether that work was even present in the kirkstone version of bitbake,
> I'm not sure.
>=20
> I've be very nervous about trying to backport that kind of change to a
> release as far through the LTS cycle as kirkstone is, particularly as
> it changes behaviour.
>=20
> You didn't mention whether you had tested those fixes against
> kirkstone? Even if so, I'd still probably be nervous about making
> changes like this as people might be relying on the existing behaviour
> or have their own workarounds.

Thank you very much for your detailed answer.

We started backporting the fixes. And then we got overwhelmed by the git hi=
story of bitbake. We also came to the conclusion that we could not guarante=
e that there is no previous work required for the backporting. That's when =
we decided to ask the experts.

So we agree with you that weighing risk against gain it should not be backp=
orted to Kirkstone.

Most likely we'll implement Alexander's proposed workaround. That is, (redu=
ndantly) create the necessary groups in all recipes adding users requiring =
these groups. It should be easy to get rid of that again once we update to =
Scarthgap and add the ADDUSER_DEPENDS instead.

Cheers,
Mark

