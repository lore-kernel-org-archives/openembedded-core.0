Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4FEC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 22:17:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web11.41017.1699654666422410604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 14:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=oTaU/Y1D;
 spf=pass (domain: axis.com, ip: 40.107.20.74, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiJoDiT0N/Znr29QHVXS9ASwi9Tuk1/orSfRZRIGXzD9aYG8Xwto3gUF1eukaspdQx0F5Hm9X8p672DRtbGamRy//LQqfNoXWu/mNxe5ZGUpyQcEkMCBPl71oCDTIijqOhjlgEkr/MMLPnKc+l/AFHjezo+UeQ30MbsiZtMNpadrOPflJtz1XObsyuzoyrXdjAmPi1bQ6Vi3RTep8xthHcWK7gKpdUZw4mdtKPrZGI9niOAuC4HSqllStx7h2gd2sG/xYrJ11sltEUjpKPza47AklNyTZ1nfc/gMfZW9bwCKqTXURGW8gIuVERBxmP1o80J2KJPgnRJiT+HiKTzqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrRrz/O3v8cheBdiLnrhn8HUyedt2h6A0AhxcD5OXhM=;
 b=b1kOJCX8haNsU5nDOXR6nsJhNfHvgKjeaIpcu2fbDfse6ZR0uxvJSz5qKMSFqNNFH9ccKsCnYAwQs+f8xpxbgeza/D0nTd1oeMegDWovTU4txG2SpsG4OS85bWH95UdBT6CX448LBPr2WpQ4qtjr0U9y06M7IcvxV/KZ3O0pqpoEK6L1DsJ8HCoseaItKRvJCHr3Lz0dKJVhP4P6enn8FJQoxIC/eBl+BVV5QFhInTsZuQrWV8qo/kzoGFYVldekMEEH2C4o/NSaACeTeFmU99nZbuIFjnZznMB1ZIGEfe4uDh1lgPOeL9BQ4Og09b86QijvfrtAB0vwcHZcwIb+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrRrz/O3v8cheBdiLnrhn8HUyedt2h6A0AhxcD5OXhM=;
 b=oTaU/Y1D6BPXOCtg7hucOqGtc6P5W9jzh76R6Y+oACEXTPGG7RP3RPasTkVYKSIVf+1nqXnyTVO1d6PaSIdAxdIYH7TgZUOLK52+h05jaz6/x+190e+STyod6XCWozb3eEUK5LABdPU5tyIEPBJoe07QdiTlntF2al7PxU2hsfQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM9PR02MB7011.eurprd02.prod.outlook.com (2603:10a6:20b:267::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Fri, 10 Nov
 2023 22:17:42 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%4]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 22:17:42 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [OE-core][kirkstone 5/7] cve-check:
 slightly more verbose warning when adding the same package twice
Thread-Topic: Patchtest results for [OE-core][kirkstone 5/7] cve-check:
 slightly more verbose warning when adding the same package twice
Thread-Index: AQHaEpimQMZkVipD8kqwVJZ+Nk3SK7B0IC0A
Date: Fri, 10 Nov 2023 22:17:42 +0000
Message-ID: 
 <DB5PR02MB102137E183FED66ECFFFB402BEFAEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 4b449d5dcbaebb0690a55cf45e3a735c2d8df101.1699483825.git.steve@sakoman.com
 <0101018bb132b353-748b9567-dd8c-4bb7-a06b-dcb1a6da9975-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018bb132b353-748b9567-dd8c-4bb7-a06b-dcb1a6da9975-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM9PR02MB7011:EE_
x-ms-office365-filtering-correlation-id: 467b3b7d-d4e6-4b71-d660-08dbe23adbd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FHqMZx9NDZOyYWKxGU7qmsUlu/IFnbmE/SqNFvJMEOqLF6R01MXdsIpG79T3+TSbDezHLOPP9dystwA7AjVoMREnFtMEoJIW7XOl91d6dlFr17XUd6IV1M/tzCcOFuaXYu4UiBLxxzjbjZDIZx/KKnesZury+qDZYQFITNi20ty5f3Z54ulPFUsejEb032FVun9HYNpLK6ioPDmjoDIDIBHuq4HYb5J5PDVeP1rb9cbRfSRDHQTKIejvI1W2bUd5Q4SlOSo0+Q/nciHkwXPmYuKRgoY0KkdqZsuyxwigXhmCIweOQ8aHSL/91XwVCTtwcy6cCqRbsVv2TbQ5AF8eXgnMOWbgjKG/Rf7RnYzZOawLD/9nhOpZyEL1XKfxvMuUmO4Vem/O+8LnkRcWovXf6umvY2PyUjDgeoz2T8Vfjd/FfF7TqV5i3kjoiy1gPRx6SyLhdy1Yrim1AZ00trC6xfkWGUfvbfagDsUVMF5MyfOQT6ktScZuAT1tHoSXEnnIdVx/CgY8Sv+U2tHesXwHTgjvfxLaoe2+68Zu1xsdLrQ6AlpO4ltEnUnUmm5wdwHV42s58aIoqt88zbvnattSACUGuTDgs/FxpmOvmPtoqPlD6bXUpeCmRZS4Lgsdg2u+SPwowOk42q/8+LIkAX0LbmdnhkSEV16P65zHJ44P1LM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(230273577357003)(230173577357003)(1800799009)(186009)(451199024)(64100799003)(38070700009)(55016003)(53546011)(71200400001)(7696005)(6506007)(83380400001)(38100700002)(122000001)(41300700001)(9686003)(86362001)(33656002)(2906002)(44832011)(5660300002)(8936002)(8676002)(52536014)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(4326008)(6916009)(316002)(26005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?E8+140QAoFqZb8rFEmcGT3CgfY4QrjU9by5vnsJ0hf7HKWPEySXAu3U0vzJg?=
 =?us-ascii?Q?LY/goPcCsPb7RqTl+Iw6jiFsm1ksSippRP7IvxwfOHweo880LKEL23S4Mugi?=
 =?us-ascii?Q?3TAcFAC+Q3/memz7ESDAC5CLmW7FldOddVYnGTcHqT9XEbEo/0tYzndbv8ev?=
 =?us-ascii?Q?VSyiFD9zWsJBn8Bmy+8w6KvaKMoaYq83Z6O8R9M05p4lsR1gvobH4uki3IXG?=
 =?us-ascii?Q?cMmwfrCiitmOeq7JU1wqoHqsiu7myA6X99TE1QJLiFTCgQZdjki4nCd/fO9L?=
 =?us-ascii?Q?+F7UZNpsQFDQ6ZDo9FWPZeEu+rCUEi8FgiOVce6GflZ0+c1OueQDvTEb5ztS?=
 =?us-ascii?Q?eJhEmRWAwS2jNVxErGzM9X2JqBzUwSz+USp4P6YkBhIpcUaDwsJw4dr38unm?=
 =?us-ascii?Q?QTnwxbg67hnjL7as8dFPg6KxnugNKIdIwtRKdWxwt4R6PRXWl+uwSeQKNR2i?=
 =?us-ascii?Q?jaccZWc1zGZivosUkJVPh4iKJe9vzuhQxbkD3NkwzdiENtPdCkQXxwNbsj6l?=
 =?us-ascii?Q?yCCd5I2bz34dbdMEI1pWHKL9MOsKfZJ5bgFW0ugSCoIAyVw2nrwzuEzUZ379?=
 =?us-ascii?Q?MLkHBrVadWghGhr4VTNvrrT2ipkQFceXCqRZV3rGMg3s6mNZWCvzYaaeclG3?=
 =?us-ascii?Q?THSk1Fra0OvkjwGLAMVhFzsJ2mWb5O5MPyA++6SoI7ZW+Wx69CZDmKNN4zvW?=
 =?us-ascii?Q?DCR31aRL4/JdWVUaXR1vX6lrPVpMpB8K47im1tNCDZ+nwUUUUCxCuNxSz6wP?=
 =?us-ascii?Q?voeoUaU1gRJWXLFR8FEcGV9jszXMajmPmddkearrRmPfnKpw40eKijEfo9XL?=
 =?us-ascii?Q?7p3pPKj46DB9ZpO2ZXxpdeYe/fzMMOh3AwIKzXdAvJL5Ib0e5C5T2ARzjAQu?=
 =?us-ascii?Q?hM9f5u+S7t7d22RLfDlhx3Hdx2ErwfogTnrHFcT33y18hYvRHViZ2tf5NVea?=
 =?us-ascii?Q?t/frpqYbGaOQ8ZCxucdl2HwSJTPxWe4aSdRfiD+W7NSXytjGPeUGluTVKRCo?=
 =?us-ascii?Q?UTzM5cdOAM5Oub0rRbZvFWU+9e0BUEdl00ELYty2IkNlqxzBExTLkpSrsmst?=
 =?us-ascii?Q?anO3fULtIYqrPe1TsU5LGxCGeCWqqj2+NxCKWFyc9Uosafz3JJ+w1VfL1xua?=
 =?us-ascii?Q?5Z35qtAXmw6xgpw5+6M5ZPTPf5VQetIy4xmTGiEyYiah7V7vwsDh4WzSkfQK?=
 =?us-ascii?Q?VAaVJW/uwrIUAWbKveNXN148QFQP4EGRT+hZ4Jwu79PYCsJI9tf6fuH3bTF5?=
 =?us-ascii?Q?lHx3MwwcYciAwP76NN1tPEUZHozRZBp8LE05qbGNMxRh47FTkHa4AIAh8EmQ?=
 =?us-ascii?Q?AGLXyW4ZWz0fzhjFa6WamGThHcxH0czJzceyUVx5p7EclQL6MZAxFK6yc+vj?=
 =?us-ascii?Q?wZpMbWLtcn7DQRxQ/gaIXaW/F65dsZy4BB10ED6lZElaF7vJtWjtLZdVp3lb?=
 =?us-ascii?Q?nACFDffHyuYFE7nbQN0+XZGZ+Zz3XlZTTbI5S8DW+O3fbX4o0FTyk0shPXOP?=
 =?us-ascii?Q?GcMceMKX9LQmiBFgbP/axuH37X+qsFowwTuiaiSsTGGSZsFOCdpYVpPxPORl?=
 =?us-ascii?Q?s5+DzfnNlBz/PGnyT3o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467b3b7d-d4e6-4b71-d660-08dbe23adbd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 22:17:42.7008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71OFOIjXWNiaKs1syFxC/nE2W61qDsQ2Tvwo10UeqNCXg3hSYd662AhfHlCeoHEb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 22:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190410

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Patchtest
> Sent: den 9 november 2023 00:10
> To: Steve Sakoman <steve@sakoman.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-core][kirkstone 5/7] cve-check: slight=
ly more verbose warning when adding the same package twice
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/kirkstone-5-7-cve-check-slight=
ly-more-verbose-warning-when-adding-the-same-package-twice.patch
>=20
> FAIL: test shortlog length: Edit shortlog so that it is 90 characters or =
less (currently 91 characters) (test_mbox.TestMbox.test_shortlog_length)

I find it extremely confusing that this test refers to "shortlog".
I had to go check the code to see what it was actually testing.
It seems it is actually the "commit subject" that is being tested.

Can we please change this and other tests that refer to "shortlog"=20
to either use "commit subject" (in messages) or "subject" (in=20
names)?

Also, it seems the test incorrectly includes the "[kirkstone 5/7]"=20
part in the tested length.

//Peter


