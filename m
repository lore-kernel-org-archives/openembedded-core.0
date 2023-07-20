Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8D9EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 13:16:36 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.53])
 by mx.groups.io with SMTP id smtpd.web10.12672.1689858986650379163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 06:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=bZCp32Bd;
 spf=pass (domain: advantech.cz, ip: 40.107.255.53, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhmveI/MiSZyHW0y2j1LmInIHfTN/RHHemqOvhNkFVmalMFuMWzdmkAYjHb3eQGecTseyx2KgdteD7v45ys8x3ci6vvAxCLhBVjEQGF4IFS/0sRHeqfDDW3TfEhv14rbZm3FX2Nshdtmf6zLQ3UUcaKo7kzF+VNjsm8D2jTrbK3IQpAW0G2gsjEpau9TBzrxSqJ+5EIXqPuz1ZPFbxI7E0gD1Pmt1RA7xJLNFf+HF2jcZTmd69MzaWxRZAqBKEewgMLpRKMbCRWPGXKEXEnWj3UhjEaeGcL5Gkp1iLN2hPpHl0aQ+AlUDBhR93+GjPd3C8oE6ehGKSCL3ZHZhG+hbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pytRATpOV7aMh9o+7qB6oUE4vaq/X2AEHKJjiLTnpqA=;
 b=OYJGfCaZ2xp0VCVJ/cWBA+jMDBq9uImEGlcR/CzM55lTbEATA1w9PqljkdGElDqzl62Y7OfamYW2wha9DMHsbUBeRLELg7ta6hzqYHyGmfvQiY6sf3heWu1fk4+WsR4WapJOYF5OJif2rHC2QwpgSMCWj1xFZT/7tvxT8w1PmkoMVYEcaTfbnuTusRGrr0T6OCM1RjD3gp4AyTnvKwG8zvgl/RhDRGukZpdq9TqDH/uT6Fq3v9kbFMJtHAr3id5xOCJ5+w5ZA2asXAGqeagnR9qILe0VAXznHemDISEYs4mbBpnoHbOgVyKf6cCy3cUIPGJpd1oQTXE96BuMRMQ+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pytRATpOV7aMh9o+7qB6oUE4vaq/X2AEHKJjiLTnpqA=;
 b=bZCp32Bd6fjWRveO16NOwxWuEQOkgWWUeNeeH71v2+IPJMYBFtke9bflaLWKqsZ2L7f5CzJSaXvy9z6qbdQ82AU2h3Gv3rHNvkE4rpoxWzFpHrlxtTGNPKJlDMmz727+gwijjgBU0BsjBBSGYi1cmy7UaNVZSXRkd0MkUr9CjimEB55V95dciy1YoXNN9rhXvOsfgCjRPTYjey1ImokMmIQnYPt3570U1iNCrxjNA7xeBlh5HrNWYF6efIUcKj2oPeWsSKuW9xa/hZhcZfLmP3uUU/bkkIrUnSw0g9Gi57zROpP/cGgzDy8mXK7nanB2cwO2Cs43mMtWEI1P+hSQnA==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB4921.apcprd02.prod.outlook.com (2603:1096:4:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 13:16:22 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c%7]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 13:16:21 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Topic: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Index: 
 Adm6Zirrs9Te84mJRC+MJegq9PcmmAAAnvEAAAEeMFAAB62GgAAZFM4wAAbwU4AAABBCUA==
Date: Thu, 20 Jul 2023 13:16:21 +0000
Message-ID: 
 <TY2PR02MB3678FC5D7379332D46E8A7EB813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
References: 
 <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
 <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com>
 <TY2PR02MB367838917BD294BF286FE226813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4P6NXH-7am1emePfWaZN43e58FsWe9_Rdj2_PdXD6b9RA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P6NXH-7am1emePfWaZN43e58FsWe9_Rdj2_PdXD6b9RA@mail.gmail.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB4921:EE_
x-ms-office365-filtering-correlation-id: bb8fb349-f904-4993-a92d-08db892382cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 A/QL6upb6KzELENzEVgJMCGbo2LJhweFzewRbuZgyO8Du86oaiq43M5v03atR2pRKZfZEO9Ork3VyXD47mibAzCLrJtdI4zjLJmImdytrMqMqEQXoZjzAuyKJBpYYCDPg29IEk+1cJjy5BQDR8pQmqXdgMk0JccVFSRKB1pF6gIVF44iYDIbYGPCel25dcmTNzV/lbcO1eK1wQQRbgtTu/XW4F9/N4kJIo6NMhDrWZnwbwITmvacxUX76Vfkh2XLF715NbcgySceIZ8sYt7/c7dOEWAnjkQHyX338CektZlgQohFjdRdbAKuEh7lAlH3Yy96kSHmdhIf3whWn5GMLgwj2HHDvcDJ8jrfhzUnlVj9cEFjI+Y4CvoHkuzobIgW29UstEwt2SvdZREhz8LMdRNkBgpdrXqP2ZQmA2/8dkIpmGU7YO/QKlIsRNbiixG7WownJDWry8AKqigcdU3v4kn7SdNmOhfrfgHWoVVFViXlrNP7AxSsefXcBjGDWdEtCU45M098QGwawWC6P5XUs8FuRXxQx/xo1Tgc33FygHQy+aAdO9nDm5/wTPJP7a7/PpXv2osBVDJYs3gLkJ+O9p1ZfSIXLj159M3dFf5AT4TRx3ExIOHmyFkz7htC5XMY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(71200400001)(6916009)(7696005)(66446008)(6506007)(4326008)(26005)(64756008)(66556008)(66946007)(76116006)(478600001)(66476007)(86362001)(33656002)(186003)(316002)(8676002)(8936002)(41300700001)(52536014)(5660300002)(44832011)(9686003)(55016003)(2906002)(4744005)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OXlVZURMOWlwbXVQMWNzaXlWSEMxbnJWZWpiWEVIZ1VYSHNRSmZ3VG44eEFE?=
 =?utf-8?B?dkMxU000VVZoMGNxMFRTMjJSYURnTmVUd2VrVis4dmpmTDhVbno4Zmw5ODZo?=
 =?utf-8?B?S0krUkIwVG9vbzNHSW1laUNKNXJRcXVOeEJGckxNVWwxMGI2TTFaTEZuRCtE?=
 =?utf-8?B?T0oyUTQxRytOR0R5M2VMeFVCTW92ZXprWk9sekxMWXM4M2xwalhqYUFGWWtQ?=
 =?utf-8?B?V0xreUhuU3BTcUtSQmxtdEMzWjQyV1kyUHB4MzU2T3lKV1IvRHUwZFRQalNL?=
 =?utf-8?B?OGFpWW0vZU1xZmJWaFQ3N0YralYrT0pjaXZmZnpQdXBaMkg0aWtpMUt1cXE0?=
 =?utf-8?B?RHV0cVNLNVVDWlpCYSttNXZVTHQ5UFpXNlloa3podlFrZmQ4S3JnUisxWjYv?=
 =?utf-8?B?YVp1MXRIL2RkRW9kaWZIQUE4ZDB4UTUrSDNEZGNQckFtUWVaamF0YnMyUnRZ?=
 =?utf-8?B?MnZqTDl5dVUyTGViZDA2RzZlaGxiVG0wbFJFaEVBa3JYMG9vN21BRzQxVjNJ?=
 =?utf-8?B?OTBzY1FQSzlIZ3VDcVQ0NHQvTWVxWFE2T05TWVNzQy9MNkZpR3d2UFluMkJq?=
 =?utf-8?B?d09SVWhyQzdwVFZCVEtLSFZlbkxFaUFpNmlTbUFJYVd2VWUvTmllOFFnZEZ4?=
 =?utf-8?B?YldmTFA2OWIxWFFQR1I5cUhQUEdZZ0N3elJjV3A1Qk0zRklrWnN3RXdUeCt6?=
 =?utf-8?B?Z1B2a2huV2tuMHZueVp1NC9GSVBDVWxpT3lMdENud3RtQkhWZkR1bGx4QTk3?=
 =?utf-8?B?VTVUOXVzUFkxdzkwakVUWTV1bkdpL1ZLOEljTWZucDF3UjlGdUVSTjIySG0x?=
 =?utf-8?B?SHdZK29FaDNRZWQ2VlFlT0dQVzJlZmhLWEpJbm1Wb2pSei94RnZVaEtuVklm?=
 =?utf-8?B?UUY4NzgvOFNEK0dxOGtIZTRlR3U0NkpBS3hIU0RSaW5aSkxnL1RhcTJ4blN6?=
 =?utf-8?B?RjBLL0dwVXFPQ2JrdGpta1VOWk5xMDdrZjROdGloT3EybjAvZVV4b0NNd3dq?=
 =?utf-8?B?MXdaWjBXWEg4eFNwT3lwNUI5UXVYMnJNKy9VaVpHNnBCZVVwdXYzS3F6K3dn?=
 =?utf-8?B?TFVCVkRaMkJwaW5TR040VWg1dWd4Nmh6OW9ZaFRPSWVSYWxxWXdCY24wSlkw?=
 =?utf-8?B?a1BYb3F1bDU0aVVjWTlvT0o1eGJVa3RUNlNicEZBUUhPT3Q3Vk5YWWFoVWJu?=
 =?utf-8?B?b3hhN1ViOTA2WVY3YlBBY1BZMittVG5ZYUwrTGFEU2E4bVJnbUlYTWhxSzBt?=
 =?utf-8?B?Q2tKWHV3Umw3TWVtWDNLVkRwZFFaSUhHWU5vQWFmd2k0TFd1Ti9DOEZ4U0h2?=
 =?utf-8?B?dzZBeEFhY0crWTZWTHRCMVk1Vk5hMENrVTE4aFdHdWpsRTVEajduNUF0UC8w?=
 =?utf-8?B?eE1hV2tLZDQwUnZXWnV4elU5a1dwaWs1RytWQzdMVlJZYVoyVy84RDZFbWNK?=
 =?utf-8?B?YnJGVEhVQWdQenlPT01xVFpFS2F2RUt0R1Z1N2RuWFRMeDc3WVVEcW9sb2pJ?=
 =?utf-8?B?WkRNNHBsSkx4bnVFZVlwQTRhRWdBLzRJdmdWNklOVTBwcUw0UHNxWEE1bjdX?=
 =?utf-8?B?YTdvczE5MmpXdUMrVEVyTnNYc2Y5T0Zaam00ay9QbFd3MVU2Mkc4dHF6NktF?=
 =?utf-8?B?b1dsSjk3MnVJWUxRTy9DbGJud1FqdUNHRUxwSTFtSllGSEtsODFMYVZHaVJM?=
 =?utf-8?B?ZHI5am52dzVBWUZ6UHo3S1dMV3I3UHoxRTgzaDZVbFVsTlEzRnQwV29HTS9H?=
 =?utf-8?B?Q2xwTDZUekhweGFiM2RBVTdpZGJUVDFGUVF0V2hYMXFNNTc3MVdSRHZYTWs5?=
 =?utf-8?B?SXVJL1ZITXg0QXEvL0hFb283TXpDQ2hXZStGMVp4NTcyQVBWdFMxNjhySlVZ?=
 =?utf-8?B?dzFWQVFQZ0R0NC9qUG1FSUdUeUVBcWdjcEFEd0dTK1JadGI4NWsrR09IQmZU?=
 =?utf-8?B?cWgyRDVUWXA1dXdsdzVEaVhsY1lNdVFvQmNOMGoxWVJBYjJrODRzbm5UZWxi?=
 =?utf-8?B?RnlPaVVzTVE0YWJxQkQ0UWFjZ2tONVdRUG9Pb2xmaTBpcnJUZ1QyaGd4M3h6?=
 =?utf-8?B?OUFMSEV2Zm02VnY5ZXJucHhLd2xYSWJFdkZxNVozbEhYSXZHT1A0NFl6K1Fi?=
 =?utf-8?B?eVNsOEh4THRVU291R3RtMnVsam0wK2s0c1g3eVRpWTZvZW1OY3FEYnNZMTF1?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8fb349-f904-4993-a92d-08db892382cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 13:16:21.3996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bm2fJEXnPdVXFshCJIN3VmmS/x/z4M73fs971dhJeXknYqzRxuuB2TX+cpNR/Bu3PHGMydOpNdL2qjDHsPLAEzEF726BaoM1UipLSt/3u6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 13:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184637

PiBNeSBxdWVzdGlvbiB3YXMgYWJvdXQgQ09ORklHX0xPQ0FMVkVSU0lPTl9BVVRPIGJlaW5nIHNv
bWV0aGluZyB0aGF0IHlvdQ0KPiBjaGFuZ2VkIGFmdGVyIHRoZSBmaXJzdCBpc3N1ZSBwb3BwZWQg
dXAgKEkgdW5kZXJzdG9vZCB3aGF0IGl0IHdhcyBjaGFuZ2luZyBmcm9tDQo+IHlvdXIgZmlyc3Qg
ZGVzY3JpcHRpb24pIEkgY2FuJ3QgY2xlYXJseSBzZWUgaWYgeW91IHR1cm5lZCBpdCBvbiBpbiBy
ZXNwb25zZSB0byB0aGUNCj4gYnJlYWthZ2UsIGJ1dCBJJ20gYXNzdW1pbmcgdGhhdCB0aGUgYW5z
d2VyIGlzIHllcy4NCg0KT2gsIHNvcnJ5IGZvciB0aGUgY29uc3Vpb24uIFllcywgSSBjaGFuZ2Vk
IHRoZSBDT05GSUdfTE9DQUxWRVJTSU9OX0FVVE8gb25seSB0byByZWR1Y2UgdGhlIG51bWJlciBv
ZiBzdWZmaXhlcy4NCg0KDQpDaGVlcnMsDQpQZXRyDQo=

