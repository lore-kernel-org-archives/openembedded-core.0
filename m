Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F17CE9D3FF
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:16:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22760.1770218217064642017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=XJnKtAM0;
 spf=pass (domain: est.tech, ip: 52.101.66.15, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8cIdENTjONgYQyGts3A2ozNhMAVqhFM+0V0PFVyMiYzPzp8u6HSpjR6GAkr17tXBnZuKQyJDi12KblEofXftT4ATSp29/GFI8RkEvgsjnsLAxmPn8sv75ivP3vgr7PsOS5ZNPs9nq1tCmqdBu8VIBLB57vn/6lepVISrAEB5p1HHWfhLlE10NSdCQEpAM7bftrCZeRxNervy0gyKUtfI86uKJEdfvY9he+JfTUURjw+Wajlf0kBBbAf0u8derNVNxRl0wzWuELIhGYzWqCfcQhidjhKzGrOfQ9ni+8bO8p2zM5tZJIXjFNIrMVxflhHVSkBnEaaulMHCyKpL1z1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOm2BWHri9A9C7oe6FGiQRHA6GRN8lrgz1nCnc31Gy4=;
 b=jQ8XWt61DSF1KqPcPGHIEeF6wRlHKmY5e0atQgmbEOR9KGvp7zhq3RT2s+kA0LRFjsZuAj0xoVBTDCowG+GTwoYQerhmeZ+NbFdmucvNwnrEiaAWdmKZA4VYzspDetEQobwGuyzh2fbqlc1LuJS1rynPcQNYp2JbcNqMLlHqDlfd+hN/ucP4Ae6uEnYpLnqQT1baEmMrQagkmzeU54zqCNDZBaRrAuhZmWeSfDzTvtkvRCq0JTRe61VV2Tq40VJLmGLU6gVZ6kp9lccnEHeQaKb+/zU3d5t/1h1jj7DLdOG04/5nehSawKVMdBUG03Q6coAFNFZjfYR7TwLwUb1ePA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOm2BWHri9A9C7oe6FGiQRHA6GRN8lrgz1nCnc31Gy4=;
 b=XJnKtAM0S0PdRjVbzcNkrUJpC4SHS0sDlzjAbIU9Wu+pH02ZTTZoNRqYbryBaMy/OXoU6kYkIMmSY7utpdSGxqK3hPPzaFIBmO7JvWqUItCdyaJ7M/l/f6YMZmqluvXTdrudy+b+QECP2/xdayx9j+o4+wePdPWVqjg/B7GLDz8GgSq+gRNzl9QamShR0nr/arqpRarCBMbWeCQyJEM42Ia2/WdZp1DIYBLqT9B64r/835jyGfxafSDkFoFQvlvAomvl6WBHQYUephbg7yyYkos2B9BoVmuOuquOX/5jrsxR/Q+dvfR7nUbP7JPmRkLPSlpkm1efC3TnFG7+0F61Rw==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DB8P189MB1110.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:16:53 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 15:16:53 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
Thread-Topic: [OE-core][PATCH v1] libconfig: add ptest support
Thread-Index: 
 AQHckF9WTpead0Uhr0+hKOkrljk1fLVoSx+AgACHnwWACZn6AIAAQ7bFgAAA2ACAAAAuGA==
Date: Wed, 4 Feb 2026 15:16:53 +0000
Message-ID: 
 <GV2P189MB3005289A31D62A6EF5C551CAFE98A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com>
 <DU2PPFB77F8FB197407E3ABBE614C6C569DFE9EA@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
 <CANNYZj8YBnBb1dnU0jVUB1VGhSZxRWsLjq6qnwB1apHsVtL7_w@mail.gmail.com>
 <GV2P189MB3005D914A2CCB8FA282C3B44FE98A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <CANNYZj8E3-sucj4aqHh-OqzV0Z668aZ+YKUpLWccQboCEgNWHg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8E3-sucj4aqHh-OqzV0Z668aZ+YKUpLWccQboCEgNWHg@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DB8P189MB1110:EE_
x-ms-office365-filtering-correlation-id: ea16b4a2-1a42-4c2d-2166-08de64006d62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MDYRh9fStl8n75GSbyKfmPasNxsNxTNOe6CqVOAcS8DRUHmLtI+8XA7pVyzD?=
 =?us-ascii?Q?DlUSmxB0HGWDFMIrbL60n1ZiT7myFPkBuqdfdvaRx/ra2XAudXsU0M0GObKs?=
 =?us-ascii?Q?vqtJaiblmu6LYqNX+nGbCv1sr5E9dSpka5rovyE+ugbYg9NzBTg/Zj4KsDpa?=
 =?us-ascii?Q?ViRzcWVWM4Feq/k/SilWiQg8pNDnkrQ6YhH6H8vBOCKLRQDxF/OskbpNqTBE?=
 =?us-ascii?Q?acQ0JNRSxk2+lFliPXnezRK3M5zUi91v8pu9k/uKB5OsEH7NniOYkAur9Y1D?=
 =?us-ascii?Q?FWZTUBKdeABvtyS5+LY3g2lWpPqT6o3z03KgJhfwZpEb2a7pmL2fGFZ3wG0V?=
 =?us-ascii?Q?+o0Rpr6gOSVp5Ijp8RTjcb2jf1k8N1usYTnMXXUMVYpR2m2IZCQmruWdsMSf?=
 =?us-ascii?Q?iAwodmDNVnKQCuxng8jJOS97ZFkfp8a7K69hiS/nXSRfRFN/wJHRXgtentMf?=
 =?us-ascii?Q?g9cY8XeZG6Z6z0W/v/KmV/dujM9Q2iT43069fMCPoAgy7rqUFo82BXHtVijL?=
 =?us-ascii?Q?iNv2NbiAa7GahlH7o7LfKMOoMeeVBwwE4gCxQn/LK34lVC3nFXaVXksglPsg?=
 =?us-ascii?Q?k4YLHdSLtmwlVOuyNmB1n175lAYdxirQN7jsILH3A3UYfE723bhRExCU/3YD?=
 =?us-ascii?Q?9WyG+Y+mruYa9cUcktp13xXXWc77JUs5S/IIcOincQIvD1C+q9HRUf5H7iRt?=
 =?us-ascii?Q?ebtztnqmwsVQF7p+YL+JT/x3HXoxJSVKCR6xMImFVhLrTsIPc0JEtVKNNSRO?=
 =?us-ascii?Q?ATj0cw5Oaaps3JlNXsVBjOoVeRbZp3PjYRUtnYhaCmArzK0ZhGFXPlD83Bgl?=
 =?us-ascii?Q?lR+8IlawkAcqsUSMK61XDOtttrSjpUIIetnn+O1tM7DZrue4FyPDpR3Oqa3I?=
 =?us-ascii?Q?ebX5SX9nvRakcpDEajq2sVqbi6SOX/Q6PYDYJjSXrb0i2mS4f4y5OgzksHnF?=
 =?us-ascii?Q?B/itAA03Mf5MJ9dhSinR2jbtJK7nmGviCCaAcdU+Sz7Vnq24XdmUhbDZyptb?=
 =?us-ascii?Q?gEM3Vefuo17O4g7U7uFIix9pkeLlIXYLVGo3k5h83f86QxRdz/N+u4NpLck6?=
 =?us-ascii?Q?J8bex8eEXVY5FvELWc35j65neu4FXpAecv7lLUGiRtCSousrYfiJBLK7hH4+?=
 =?us-ascii?Q?Ssgku2HBchyHbLcJy6FQKV651HW2S0Mw71Km+cHj5tI5qPWia87qUy6N3gym?=
 =?us-ascii?Q?pZuMcv3EGS1fu1PN0P/MdZt8voGiG1SkbHVsThNhHsYDiVoKG18/ef2yzxy5?=
 =?us-ascii?Q?/Dcv6H5+ggsWMbMT/3lHw3g+8skLdhLkhyLa2PzobltkoGpiCSrv6HSXOkl+?=
 =?us-ascii?Q?W0/VYTIrbVEq2+7BVpYcht21byq18BRsRVORZcF6W77wDxBw7epH4RbOefYF?=
 =?us-ascii?Q?M+PgEwaYJ3JdQGMfgOKl06j2OewpCM5FH88k3paAuAtU+onXX2C+DFhZHri2?=
 =?us-ascii?Q?G7b4+gEVKBEV/E0UurpW+iCYo0k3UtfyYP/+aSAVzn01wZXBifzVmlAdJv5h?=
 =?us-ascii?Q?9iBufwN4xaEkasRRTcXgKsNxdOFJtcofzbyVXOyqVnWbbhUvXwW8Ag8pBfEs?=
 =?us-ascii?Q?5tOMBzkL9d0R9jXyGH4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?N+Zofg/VgLdsdRC/G3kpTXI7u2k02a4XQEq5eOJ3BrS5xJDJhIRUJ/UHyuWR?=
 =?us-ascii?Q?n/XatZ5uIPfTyv408JJZPQ2Lr6c4cDwpKJqSbKRZBAMsiXY8FMj/JhUWho1u?=
 =?us-ascii?Q?kehqPOxKUvHVOhkCh4BKRHZ03WvD81L39mbRNq5c7LA4H8S7OCVTcWbWlsMA?=
 =?us-ascii?Q?ixflKw4FxUyJymeJ+zM3kuu4wra9kryYJcEXoiOrseK8293GNuTBupPYEXcy?=
 =?us-ascii?Q?o02tIfM2MgYyaffG9MWBqyVOVHtjybFw4nQGbISycy8Fy6tvtUlPt6t4GF/T?=
 =?us-ascii?Q?WcETAL0YcjvDKy5oDC91oMp0EukW4iBVkYdwXOltz/0YM8wwY/gCYHmcU3al?=
 =?us-ascii?Q?baJa9D0w3L4PjfoIoT2b8N/pbwUKueYXFtPpY8nAAgmyFDtr+1c+TpoFG0P/?=
 =?us-ascii?Q?kMSDLs3Hs+lS0x7njVHGQ2GJnn8qFNF4jlIGm8HJBY+MArQgPE0RxKg6Ggcw?=
 =?us-ascii?Q?yqRFX61bzZJFOTrovFJOt/Inmux062rqV29S2YRDIJnmVBJ8QRaFj9R/C9fC?=
 =?us-ascii?Q?NzZFg3A77vai8jeNCbvGGwtmlc8dLDGzM3l8Jg4/ME16DLy9ENk10+wu/DFz?=
 =?us-ascii?Q?mKSLvBql/VifczazSew+1PDQ6nUegvy6cn2z4UiNHFyjVXPkEF3sGIKJGUV7?=
 =?us-ascii?Q?KlTFQxUqjGpHbbZIaqz4NqPjw7V2scvvOq6lngb3Pvj/LcJPFRhwcLyOqLp3?=
 =?us-ascii?Q?LOAKl0lSEYTMztq5kBqNTRtf+DJ0nz1brGQXCHi2SlqWPALPLipdn1UhdSDh?=
 =?us-ascii?Q?5EFepqlKD+mGiro85pBcFlwVE1KTKhz8xj2TCXUgmtqBYotuj5WzF30dsiEA?=
 =?us-ascii?Q?tr/HQ5SKEXL4IaqmpMpVZKnn+0EwNXoLJMck4gfkW7GDSjYUb45V99f1ss3M?=
 =?us-ascii?Q?dAggJnHl/2LZ7zB8ptsZjglBfjWxPf2OOZg9XTe0RB+Hcc4xQCkHZU8cLDtg?=
 =?us-ascii?Q?o34RgCwFUMnu2dckr5PDmiCAcECah94Uj9GSZ+GLhjmaTaqqrwPIPTxObTK3?=
 =?us-ascii?Q?/VihNAR8S6sf2iPYEt0u9GahY5sS2hPjJ5VA99v/oNsk/dtmJTRTki8nAMS9?=
 =?us-ascii?Q?h5hMUlCh8enJowKkXO6ohPY+7iK6M0op382NGC/t/gz6JH2G1VD0JI9bDEpq?=
 =?us-ascii?Q?Hp3AmXR84DMqIBlhIbE98rown+vEKnicq8EuaYScPslPXGLp65fRsg+kI6O4?=
 =?us-ascii?Q?CHkaDsWpQ+rzWYD1K7QJ6orezb4ikr9JDhA9z8QiXl1mOn0SLKuG2xxu/jjf?=
 =?us-ascii?Q?LKXy5BI6nNwmIhAV4le4dFEq21N8xnq6bcA35I7+kSXFgG/scy2dg0KgPABC?=
 =?us-ascii?Q?THXJ1G+676uICTIBjkk92LP/kQ1CFhnjYKAve4DWYN/TuFe7A4UH2mU7JRUO?=
 =?us-ascii?Q?xq4QLd3pea+kGLCcaI/zsaPJexg6e8YRoPfYJpWUBhDczmh2ZHOQ9ySsU4pY?=
 =?us-ascii?Q?8nknZ2o04mvdxGMDCJpdJofPLQPc5XWalsX4ztdOxblY3S0rcJqd7sSxRDvH?=
 =?us-ascii?Q?kb4KKRyFnuBmPDtJ4GytFl2hvIsiKSpIM5gLVsnS1FZ93qU4eOHOSnAmyNjO?=
 =?us-ascii?Q?JhBXrY+BhNKtrRa50mX9Q5Ju5qGgtOUvdXYsBP5I3OHBiC3+HUJUC4l+Twbz?=
 =?us-ascii?Q?Heil4u1U5ZS1tPslc58zqnmfLoo/4PwAvLAxHXiWfLlCyM46OG2YV+clfkhE?=
 =?us-ascii?Q?5Wt+Rtkt4bM1Q9n/KAo62icAWg5mYt2yM9qe/nexEDJnvz0jjjKebjk2IEHw?=
 =?us-ascii?Q?saxFwOyLtA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea16b4a2-1a42-4c2d-2166-08de64006d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 15:16:53.0503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rdc1b6vgqc6depg8XtIuBLVNQofa5SkA0VzuBiocSZnxtdOsZA5rOvC2LVQ4vuiaSmtLIHcQtrBrST+yoX7S6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230544

We use ${B}/libtool instead of libtool from PATH. The build was invoking th=
e host/native libtool instead of the
package-specific libtool generated during the configure step.

Best Regards,
Pratik

________________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Wednesday, February 4, 2026 4:14 PM
To: Pratik Farkase
Cc: Randy MacLeod; openembedded-core@lists.openembedded.org; pratik.farkase=
@ericsson.com; Richard Purdie
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support

I am struggling to see if there are any differences in v3 compared to
v2 though. Can you point them out please?

Alex

On Wed, 4 Feb 2026 at 16:12, Pratik Farkase <pratik.farkase@est.tech> wrote=
:
>
> Hi,
>
> Thanks for catching this error. I have sent a v3 separately.
>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Wednesday, February 4, 2026 12:09 PM
> To: Pratik Farkase
> Cc: Randy MacLeod; openembedded-core@lists.openembedded.org; pratik.farka=
se@ericsson.com; Richard Purdie
> Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
>
> Unfortunately this was merged to master prematurely, and I just had to
> sent a revert:
>
> https://lists.openembedded.org/g/openembedded-core/message/230509
>
> Please address the issues and resend.
>
> Alex
>
>
> On Thu, 29 Jan 2026 at 09:33, Pratik Farkase via
> lists.openembedded.org
> <pratik.farkase=3Dest.tech@lists.openembedded.org> wrote:
> >
> > Hi Randy,
> >
> > Good catch! You're absolutely right - the bash dependency was unnecessa=
ry.
> >
> > I've removed the RDEPENDS on bash. Patch v2 is sent separately.
> >
> > Thanks for the review!
> >
> > Best Regards,
> > Pratik
> >
> > ________________________________________
> > From: Randy MacLeod <randy.macleod@windriver.com>
> > Sent: Thursday, January 29, 2026 1:26 AM
> > To: Pratik Farkase; openembedded-core@lists.openembedded.org
> > Cc: pratik.farkase@ericsson.com
> > Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
> >
> > Hi Pratik,
> >
> > On 2026-01-28 9:06 a.m., Pratik Farkase via lists.openembedded.org wrot=
e:
> >
> > Add ptest support to enable automated testing of libconfig
> > using ptest-runner.
> >
> > Nice, thanks.
> >
> >
> >
> > The implementation uses libtool --mode=3Dinstall to properly
> > install test binaries, avoiding issues with libtool wrapper
> > scripts. Tests are built via 'make check TESTS=3D' to compile
> > without running during the build phase.
> >
> > The test suite includes 16 tests covering parsing, formatting,
> > binary/hex values, escaped strings, and various edge cases.
> > All tests pass successfully on qemux86-64 :
> > START: ptest-runner
> > BEGIN: /usr/lib/libconfig/ptest
> > [TEST] ParsingAndFormatting
> > parsing testdata/input_0.cfg
> > parsing testdata/input_1.cfg
> > parsing testdata/input_2.cfg
> > parsing testdata/input_3.cfg
> > parsing testdata/input_4.cfg
> > parsing testdata/input_5.cfg
> > parsing testdata/input_6.cfg
> > parsing testdata/input_7.cfg
> > [ OK ] ParsingAndFormatting
> >
> > [TEST] ParseInvalidFiles
> > [ OK ] ParseInvalidFiles
> >
> > [TEST] ParseInvalidStrings
> > [ OK ] ParseInvalidStrings
> >
> > [TEST] BigInt1
> > [ OK ] BigInt1
> >
> > [TEST] BigInt2
> > [ OK ] BigInt2
> >
> > [TEST] BigInt3
> > [ OK ] BigInt3
> >
> > [TEST] BigInt4
> > [ OK ] BigInt4
> >
> > [TEST] BigInt5
> > [ OK ] BigInt5
> >
> > [TEST] BigInt6
> > [ OK ] BigInt6
> >
> > [TEST] BigInt7
> > [ OK ] BigInt7
> >
> > [TEST] RemoveSetting
> > [ OK ] RemoveSetting
> >
> > [TEST] EscapedStrings
> > [ OK ] EscapedStrings
> >
> > [TEST] OverrideSetting
> > [ OK ] OverrideSetting
> >
> > [TEST] SettingLookups
> > [ OK ] SettingLookups
> >
> > [TEST] ReadStream
> > [ OK ] ReadStream
> >
> > [TEST] BinaryAndHex
> > some auto big hex: 4294967296
> > some auto big bin: 8589934591
> > negativehex: -1430532899
> > [ OK ] BinaryAndHex
> >
> > 16 tests; 16 passed, 0 failed
> > PASS: libconfig_tests
> > DURATION: 0
> > END: /usr/lib/libconfig/ptest
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
> > Signed-off-by: Pratik Farkase <pratik.farkase@est.tech><mailto:pratik.f=
arkase@est.tech>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++
> >  .../libconfig/libconfig_1.8.2.bb              | 21 ++++++++++++++++++-
> >  3 files changed, 37 insertions(+), 1 deletion(-)
> >  create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/con=
f/distro/include/ptest-packagelists.inc
> > index 739995bcfe..7c5810f252 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
> >      json-c \
> >      json-glib \
> >      libcheck \
> > +    libconfig \
> >      libconvert-asn1-perl \
> >      libexif \
> >      libgpg-error\
> > diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta=
/recipes-extended/libconfig/libconfig/run-ptest
> > new file mode 100755
> > index 0000000000..d81fcf4def
> > --- /dev/null
> > +++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
> > @@ -0,0 +1,16 @@
> > +#!/bin/sh
> > +
> > +cd tests
> > +
> > +for t in libconfig_tests; do
> > +    if [ -x ./$t ]; then
> > +        ./$t
> > +        if [ $? -eq 0 ]; then
> > +            echo "PASS: $t"
> > +        else
> > +            echo "FAIL: $t"
> > +        fi
> > +    else
> > +        echo "SKIP: $t"
> > +    fi
> > +done
> > diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/=
recipes-extended/libconfig/libconfig_1.8.2.bb
> > index 6e08a7b04b..9ae0ce2e6e 100644
> > --- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> > +++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> > @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D17c8e32f=
0f72580cc2906b409d46b5ac"<file://COPYING.LIB;md5=3D17c8e32f0f72580cc2906b40=
9d46b5ac>
> >
> >  SRC_URI =3D " \
> >      git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV} \
> > +    file://run-ptest \
> >  "
> >  SRCREV =3D "a42cb47c1526a4f2ed025fcbb2289863375bc898"
> >
> > @@ -17,7 +18,7 @@ DEPENDS +=3D "bison-native flex-native"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
> >
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig ptest
> >
> >  PACKAGE_BEFORE_PN =3D "${PN}++"
> >  FILES:${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
> > @@ -27,3 +28,21 @@ do_compile:prepend() {
> >      rm -f ${S}/lib/grammar.[ch]
> >      rm -f ${S}/lib/scanner.[ch]
> >  }
> > +
> > +do_compile_ptest() {
> > +    oe_runmake -C tests check TESTS=3D
> > +}
> > +
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +
> > +    if [ -f ${B}/tests/libconfig_tests ]; then
> > +        libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig_=
tests ${D}${PTEST_PATH}/tests/libconfig_tests
> > +    fi
> > +
> > +    if [ -d ${S}/tests/testdata ]; then
> > +        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
> > +    fi
> > +}
> > +
> > +RDEPENDS:${PN}-ptest +=3D "<mailto:@@-27,3+28,21@@do_compile:prepend()=
{rm-f${S}/lib/grammar.[ch]rm-f${S}/lib/scanner.[ch]}++do_compile_ptest(){+o=
e_runmake-CtestscheckTESTS=3D+}++do_install_ptest(){+install-d${D}${PTEST_P=
ATH}/tests++if[-f${B}/tests/libconfig_tests];then+libtool--mode=3Dinstallin=
stall-m0755${B}/tests/libconfig_tests${D}${PTEST_PATH}/tests/libconfig_test=
s+fi++if[-d${S}/tests/testdata];then+cp-r${S}/tests/testdata${D}${PTEST_PAT=
H}/tests/+fi+}++RDEPENDS:${PN}-ptest+=3D>bash"
> >
> > Why do you need bash rather than any posix shell?
> > We run the ptests in a minimal environment so if busybox shell works, p=
lease drop this.
> >
> > If not, please either remove the bash dependency or explain it in the c=
ommit log.
> >
> > Thanks,
> >
> > ../Randy
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#230125): https://lists.openembedded.org/g/openembed=
ded-core/message/230125
> > Mute This Topic: https://lists.openembedded.org/mt/117507676/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

