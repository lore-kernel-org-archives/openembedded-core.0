Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD59C4725D
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 02:19:21 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.109])
 by mx.groups.io with SMTP id smtpd.web10.2239.1705544357355678273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 18:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=Gjhyjvsq;
 spf=pass (domain: aspeedtech.com, ip: 40.107.117.109, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOnBYLZm9W6p6W+O7Slj95rMmvsWtjDMx2ucHSD1cSTlv3QINcx9+fUMsjeQXMewMaNqmJvRSjS4M2VvVx2cdadUl9EC87FNRslpIQdy0G1jo07liJQ9TqUDUBGGo/SsHRmdn3T8AFMMUOyOw9jWxepamJyjGigZ2Vi69eq86KV9PJQWeCOXvJNbKjSms9YljoDFJQ5PCi0Ft3LolYJieiozWyHQ/joOVmuzYiI1BhsoZ14MJsgTVDttlW1g9I2yFV/vmp+OnU/wjsgsrbA7s0jO9hVJaeJGYrHnZrGEFYag+VjRwYvQx48K53bkbMz5G/lx6wa3NDB1yVwJqrFN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4K2r4VdcazrmQRHYOsjjT317XCvS6T5IWiu0465n8R8=;
 b=dx+nyPOagrYzfYoHCUFA+wcBMPX0L6norkGXcGcbJduBPvpns1CI9yhYTXbVRY9bMP5Kcl7NRIIMnhyENvBGX6wzYz8goXxMPpdPksQFrzkkR3Tt2jy3zEvybgB6tG3ChTWc/v3HkYzLCzUPqfP4CUHFDdlBqjr4wuM7gLnTvf4+1e/Oq/gIktf3L/54O3iZXf1Fzk/9Nv+SsnfDoLuiSj1b29QdwuUHPcbmJrUntiJ7/ByF081Ny12rUIUbFxV/VXUfrvCOhCY6hDbuyk+c8QMk3rwvUucxTPVprLddUXush2UDdSQigkHuKzqf/9De7gwO8X712xKEIqR7HsrlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K2r4VdcazrmQRHYOsjjT317XCvS6T5IWiu0465n8R8=;
 b=GjhyjvsqAlOnq9BI/yqzlE47g4q/tZgYCR/bMs++u6IHbNiFag7ICmGpRJwUG1PApbnqsiRKKgHextd6OIIeFijrxQPpmuwHP0x/7+jRlrInFwf75rTL7bNBrvj+7Q4dVzyrslhY+WzN54jjs3BGlfikaylEZxN13krtWnjfAoRjRFQfkKfhJlLG0O0Q1JOum5DxlkrxV9XV+iiVASg86ujmIbScdwlxBU684iDS+8gLVAVIISmfBeSjmr4zBToA38HuzPkMs5IA6VpIR1GT9X/PXEc8Jk4MGGDIqBlMUY9cV7COs1gwHL2CX3zj8mm0n3qv9yLXdIW9kSz9dVrZJw==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 TY0PR06MB5234.apcprd06.prod.outlook.com (2603:1096:400:21a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 02:19:11 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::c621:5399:ca9:c609]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::c621:5399:ca9:c609%5]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 02:19:09 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Tom Rini <trini@konsulko.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] uboot-sign: support to load optee-os and TFA images
Thread-Topic: [PATCH] uboot-sign: support to load optee-os and TFA images
Thread-Index: AQHaSVKqvWWf27BY1U6AILRAotgAPbDe1ZfA
Date: Thu, 18 Jan 2024 02:19:09 +0000
Message-ID: 
 <SI2PR06MB5041B4FBF62741BAB50A66CDFC712@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
 <1770.1705462624460046867@lists.openembedded.org>
 <20240117143705.GW12635@bill-the-cat>
In-Reply-To: <20240117143705.GW12635@bill-the-cat>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|TY0PR06MB5234:EE_
x-ms-office365-filtering-correlation-id: 2e44a29a-eda1-4065-dbe9-08dc17cbdaf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a7FMIuMlXSNW5odefdE0VZxKfZ9+ha/YdMrDZSA37ziG33F8BmkmFgvsaD9y6W2kGZRxdcQ/FSCYRuaYEN/wOhwuK40KDN4K03u7hVJqrFdJmK0sF9bYE2ZpbtQEfTT2mnqNhpDw1bFUVmrUq1tLug4ZqAg6/xHydhLdn+/KMb7PV+leN6a4zyMEPeYiLOfYYq0zY23L/CRQknLfcqVR0qlScCUfkviH+GUZn6zNsOZ8BrJs6dQ45CCbrKuavx4NlddwamdTyXZipZiMdoQ6zYqD+kamyKTrX+sv/z80QH0kYGeteJKXKdb6YJZ6j6fAvUAPxB1A8F5jNkFyxMIV3Wk83Y6ZVHTkyFksyJsChs4IrtoqP2G55EBzD8lXJVqW290PyIHS2OcFZfZkkoYwB16m2pN2HmeLINQk53GbcPu9PSlA8hP4cK/+NS2IUpkwr0GY6ZvaiFaCWcWYRpVphfsbRXvc2r1T2XYhOLVZBt2MC5ny4VGJMYI3bUKnbPRhzrtr45syjmDrkyZmSzX1t2rvz1fOOI9Le/sm+FPCVowqP1wAXx3lwacg/7OZSL0k1YLgCRiETDBlqc0f4m5RUWaUm95JBFgzghsYdKv6/lrOmpOsqYbhGkbjTrtovTm8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39850400004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(2906002)(8676002)(66476007)(4326008)(4744005)(8936002)(52536014)(316002)(76116006)(66446008)(66946007)(55016003)(6916009)(64756008)(66556008)(478600001)(6506007)(7696005)(71200400001)(9686003)(53546011)(83380400001)(26005)(41300700001)(38070700009)(122000001)(33656002)(38100700002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Se+pzGuKmKBfhPhjydiw0FnkYL8IrAifyGncbpj+6hmJMxza3UZQ5Lwmv+xQ?=
 =?us-ascii?Q?FhBNuDe/ORTeYHjcZh1YrsbmaP0B/vzW8b/OiwK3qZjqKns+1FAoLF09CFMy?=
 =?us-ascii?Q?QiOc8IG/E6I9EgngAv/X7RtsY8V6efYl1xCojGzjaa7iuY4er9/5qqn/4oKU?=
 =?us-ascii?Q?zdB7O7CZ5tKIiDo6AnTW0cJ/4Sl2XsgP7LVtGXmVyw4nsIX2YRXbVCsen9f5?=
 =?us-ascii?Q?oeZQ7RYmmX2GFvObzGSPMaxiX6pcIKzLI1WuTaj5/GOzJLJmnEen4S2hLrRG?=
 =?us-ascii?Q?no1QMVzBmVsSc+nBRJXTk8Z00UzI6PN18LoMsVvoTGSIL0jzV2s9F0HKsF5H?=
 =?us-ascii?Q?AA2ONUpNtNB7bMHr3/4ocm2Hzgl1j2y7mBybhjTwL4/xaeMSIse5qEeJ+hoL?=
 =?us-ascii?Q?22mwTnZINCmkjfYtQsdaew6SEFqHrZuClf2Gflgot9KCsxfGI00m+LXnvafx?=
 =?us-ascii?Q?s0KxhHb77mYLeXCu1p2auLHqaiabWj8my/qRZ4KD9jRs7suCkl6Q+HEmtGbW?=
 =?us-ascii?Q?0hiLAtmpN8HZD8JQrpRlgjnKy0cgSeiNDQ0OccZ3Wl+7hrukxZCNr0bVrdR9?=
 =?us-ascii?Q?rfVUyKceQvedl2k26Lk7WBbnA+QGiiEczMGeKwUTUOcBugIXs0KyueKr3jzP?=
 =?us-ascii?Q?SnNseRyCqwSJ5NTWCcfHeoTDWHaNmRLwys9Pgdd7Z9kNzSMVUqeurFV65kXs?=
 =?us-ascii?Q?nyuXAekoJYHiaBcd1vVnTSBJ+pkcTyyvV70t1wSnDBVkkfFZ3434ICLuzP2Y?=
 =?us-ascii?Q?EutYVpwGstRJ2FU3EeE/XzcfRHAkNK2f8g3/mkGMTldL2sc308cyP/DTZlXr?=
 =?us-ascii?Q?Pz3vzGdep6lqsZ3zC4ZqmgOD9x9wg4S/7fDImYtCmaOlVaFzagYFg16SpJQQ?=
 =?us-ascii?Q?yI36HvuX310sZgpgqB+Yu0p9sW5RK14qiCYerf+wCaQDg3WTZxyokvuKFTmI?=
 =?us-ascii?Q?QOqdwvfhRTrl130ZfLNyChX+LtkFIC9b3SgcxPB3oNNewMAyQya30e01sjUH?=
 =?us-ascii?Q?W1xCvJQLZmdP7VC3vzpRsQem7bsq6QPo7SWrvtcWpKB1r8f5lIsc5OGDTM4t?=
 =?us-ascii?Q?Ogrztwu3g7jxoeQFBOYvc1gHDUUOxTGM9qGjNyp8LDFBp6ZOBuvQanqMycld?=
 =?us-ascii?Q?Z898+j4XUozd57v1h1BZNE+3TntfRjoralvpkcUabelvIkaNHrruvkhzSr89?=
 =?us-ascii?Q?aOlCGNT3Y7nQMMVvupLfHzB8iwJmZewQwnW5/6wPZkCBAC2jsE943ogD8O5D?=
 =?us-ascii?Q?vAl2jwtD0iuzP+RzDGTB3HJ1GKwBp2jCunPj5bqRpVpWudvCnVS8XANzBtnp?=
 =?us-ascii?Q?9h8C6HwojVhAxJpaELDEDIxl48tXgMp8rLF9x0vxply0JvjmsqslLI8CGHT1?=
 =?us-ascii?Q?pR/0LJtV5ttueGEO0d/eOySw4CesWcTI4z4DPw7JgKq9hRPZ1xCskYEjGxQq?=
 =?us-ascii?Q?j+Kvva+XuJ7N6qFFWs/3vVrs8MqtI5p3cArSX/tIVuMwSN7sMLeEMfyZ2CFG?=
 =?us-ascii?Q?K5E5ls/qL3B+EG1OG4QRWZMjRRpXgKFG8jgThzvxndF8IPk0DXf2MFx+nnbt?=
 =?us-ascii?Q?XWr0UkUR4TKaOVaknyXkasoMAUBefb3M0NR69Vc+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e44a29a-eda1-4065-dbe9-08dc17cbdaf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 02:19:09.8883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdqcVFFXRwJNJ/x1PaBpkE20rGKUoY0+pHvH6Gzq4bnEl/q9+/JlCU51kS6B5BE4LPVX1dc5ncfVjtsmZlzk0D5Sb7s9Ut5bVBn3Lz88ARg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193954

> -----Original Message-----
> From: Tom Rini <trini@konsulko.com>
> Sent: Wednesday, January 17, 2024 10:37 PM
> To: Jamin Lin <jamin_lin@aspeedtech.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [PATCH] uboot-sign: support to load optee-os and TFA images
>=20
> On Tue, Jan 16, 2024 at 07:37:04PM -0800, Jamin Lin wrote:
>=20
> > Hi Alexander,
> >
> > One more thing, So far, bitman only support hash 256.
>=20
> What hashing algorithm would you like to be using instead? We can always
> include more and better options with configuration as needed.
>=20
> --
> Tom

Hi Tom
At present, makeimage tool support hash 256, 384 and 512. It also support r=
sa 2038, 3072 and 4096.
It would be better if binman support these algorithms.

I patched uboot-sign.bbclass the original goal is to make yocto support opt=
ee-os and tfa in the old version of u-boot.
Thanks

