Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2D4C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:11 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.109])
 by mx.groups.io with SMTP id smtpd.web10.13395.1699971186413025364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 06:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=JO9NvnHf;
 spf=pass (domain: nedap.com, ip: 40.107.15.109, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuNZWuTK0Ajx8H9GULZvGREP8PiLXThHVa1scAA896lPjYWSb0zai7itJ6vZX8QKwlJZfahwJPC/Lwn8PSXG5/UrlB6B2Jxn/GIiCEn6M2R9ZzHgQ56dGgkqyISnKJW/dExxp7KTo2EuxAp6oNGw8q/UBzKkU13eHE3QeYRz+fNA0/iaSUlGX/Eyky0StcRlzUQtZyRbBWeQrBK0W9ZsbYmLVySrKWg4jrvlD/QuIAbsM0jOv03Mrb/iT/mbtgWpSy9m5I1KqlwKKHpjMjiwaz2tyU40ZTAaDY5ycSm2B4PxsrKJpWCj8zL0hHCMDOBwA+Rwi5zEI41CVk0x/vbp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTrMJadHS2j5j4u7DChShR40B6Z09QIvn7VpvJHaQRg=;
 b=X3HVT9fZympDDjjBAMJTLa1b1SFKSu3G9iPCsjSoxxKlfgt/HfEicyalpFYpHa/DWvwj0mZhZXGcnp0WuOpsRHXDXeYqnJT494O207Rx+6YaDthZSmIsXfggiLy7mxPa8JpLL2TuxM+8vWLoRPZLxdZZBynA9v6Q55wCimWYdF0xyfgBd/qZWTjh15TzVypa0TRLEBat58vVegG7WG1JpFH4lbUXdkwo8x6OdWEG3cwZBnx9KQwU9YAAMG98jKwz7DP7P4xR19X6oP4gI5Z1lFk539RAeCLB6c6ltuK+5N9qGPg+IswMRFaiHlZNiqmC5BSHS+TzPQ4Cdye5JV172w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTrMJadHS2j5j4u7DChShR40B6Z09QIvn7VpvJHaQRg=;
 b=JO9NvnHfi4PKCFroecY//ScmHfExxzVu5GSWEfnfge0/j/ZiH+bqMip7YE8DMLdvksPmbRCx3+WeDI6f3Oc8/m3CDDM/W2xVhAcOYvmGelNVPxDROUZ5lxaPbcoMRwlrX5vQer30R2udAjB/5RISxNr3KEDTvOMa5KVxL54WWSE=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by AM0PR10MB3348.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 14:13:01 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ba10:eb74:e945:d470]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ba10:eb74:e945:d470%6]) with mapi id 15.20.6977.026; Tue, 14 Nov 2023
 14:13:01 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC 6/7] bitbake-layers: Add default remote to
 layers-setup.json
Thread-Topic: [OE-core] [RFC 6/7] bitbake-layers: Add default remote to
 layers-setup.json
Thread-Index: AQHaEY79h0XZ99k0E02fVkxF0T/7n7BwSPaAgAA6eeCACVYYgIAAC53w
Date: Tue, 14 Nov 2023 14:13:01 +0000
Message-ID: 
 <VI1PR10MB3182F41FE694F81336354BDDF7B2A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
 <20231107152641.1043-8-jermain.horsman@nedap.com>
 <CANNYZj_KbgyoEnXe1F815bcjMO+H_s9k1RbPzbpcxOxfNwpQBQ@mail.gmail.com>
 <VI1PR10MB3182C867637E593F93D86C67F7A8A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj9TbFnsh5C2ntG_POMd-Npsj2a0AgU2GF3tVEBqaJgEFw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9TbFnsh5C2ntG_POMd-Npsj2a0AgU2GF3tVEBqaJgEFw@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|AM0PR10MB3348:EE_
x-ms-office365-filtering-correlation-id: f6acb796-e124-483e-4640-08dbe51bcfc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bXt6eG/IVfSFc1iQyeZqs5Emn6mG/99sK5OQ6p/1sk7nortjeI5UGj8p9frDIHIEV1vzrdK1kXd7eUSrnWpr7dTZbTjIIYlA5yUZMaONH/dvYrIrKSUOiNwDsCMuXxlKU0T2wgPAhOVCNtld4LH9nPK5MYRh5FiN1skvOv4iQwmIkw4qf3QDSW4Fgz0uovkemIjifyJhX9fAy5Mtij6ZBTaKUAQKE6JjyNqPxfXQkfiOt7T6D/ajNhL3szE7bMMNJdhgAU6k64X3Xbi5fa7MmY2wPF69Ma2fSSysIn3e4Q1elEJSDk/u+BHYjxrgmIqhYP9LMBPYE2rL8J+EdqEQ35mq2gqRJJ88o9t5dwqBI3MVL6IsUKzclYTrWoCZkRNtuF6v68VB+a7A/8ZavQSDNsmYehHQPmGrCydndgfcBVh/qpysw72+G/wGVj5kXazLoscTCup7NW4oeo4yvWgf70e5YuppUORydC39acFfpp4xFNRwb/rYdaH2wKjI4HJVjFNW3Dco5gZuFrkZuamwhK7J73npPj7jkYnLNvo2FTGNYFDWio2d4s1kl/Jj30QjHBcbrMzqM+bZ+Wqe6hkje4yzfV6zb54FheH6ukPTMTYY8O/vAGTCh3DeWGeb6Ogl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(33656002)(2906002)(83380400001)(55016003)(86362001)(122000001)(558084003)(38100700002)(38070700009)(4326008)(8676002)(71200400001)(8936002)(478600001)(44832011)(7696005)(52536014)(6506007)(66476007)(66446008)(76116006)(66946007)(316002)(6916009)(64756008)(66556008)(5660300002)(41300700001)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T0ZNKzVWSXl5T2kySm5vWm44VmU4UHZxcHNPUmdhZVRkZ0IwS09xenZGYkcz?=
 =?utf-8?B?d0F2cllkOGZwcGVsV2hRbzFQQkEvQ3VBRllyR2h6TmpIcUZXbUJtNUdMc2FF?=
 =?utf-8?B?Z1UrVitFajBRbW9vVGIwQ3hGMkxsSkNVUk10ejlzN1g3UUgxU1pWaUltOThx?=
 =?utf-8?B?ZG5pdU9jbVBkWDhzcTU1WFI3Q2M1QllweDk1aEN2RThKN0VWV3VDdFZJMkxD?=
 =?utf-8?B?b2lkbFUwajFjNmJQM3ExaHAvNmRjekJEQkFoZXoraXlpR3EzYVRvd0RPdDU0?=
 =?utf-8?B?YkhMckdxdkF1YUd1YzVkNlU2TDFzMnM2QUR4aFk0YytIcm5NbVZzNVIrWHFZ?=
 =?utf-8?B?L25teUMyTEp4ck5XcTJzdndRR2VXVG05TXpwTCtjY1hXWXl3djRSWUNJNWQw?=
 =?utf-8?B?eHY3K3RKM0tBWDhNVGxSQlgxd2NhSTNybkRzSFBLQmd6bGJET2MrZmZ1dStW?=
 =?utf-8?B?a1FGaSt4QmhpVERNT1RZQkdsL2svdWhxUTJpdFppMEphMTI4a0FlcFlsVU11?=
 =?utf-8?B?RXlFVnpXdE90SXR0SE5ob1BpQ0c2SmNxUXVFTHJUelBOdEQ5L2RscmVPVVBD?=
 =?utf-8?B?YUdITXRMVzc4TTZ5WjY1TTVzZnVjdHJ4ZzBrTmRBUmlZdGxCTGFtMHlGb2NE?=
 =?utf-8?B?Z2VvQUtVaTcrVWoyTHBEUXpQNDdhZWhQVzRDWHhoS2tnaFRzbzNsbEQvcXRK?=
 =?utf-8?B?WlV5RG5DWmt6V2pBU2lsK2hvM1BvRk8wbDRNYjZEUXJseEhBYlZwNlhtb2tL?=
 =?utf-8?B?bFNvbUlkLzVvcFNrdVE4aUJVWjI1ODRIQzNTR0FET0pyNkNiVXdPb1Q3bXAv?=
 =?utf-8?B?YmVHblVKaGtJRnVrRCtqU2xESTZaQVVmNHhMVVYyT3pFMGNHcCsyVU5Ya2Js?=
 =?utf-8?B?ZEU3Ly8vdFNneitNdk1xSWhKL3ZRb2hralBobFhnOVNjVVVQZTBwM2dYM05m?=
 =?utf-8?B?WkxoQ1BmT2NENlRyYVQ1Y0xsRDNqSm1ObnlBOGp5MFJ3SHNHRitYanFNRm11?=
 =?utf-8?B?bmtBbVQ4clZNV0RudGNsdFN3SVV4VWdVQ3ZOUHVFRnF5NkJ0OTBobHJBZUFI?=
 =?utf-8?B?eTVWRktkS0JtNys2OExIOWZQRXpJS0Q2N1VIYWZCbCtXcG5yRmE3RUtkQVpv?=
 =?utf-8?B?U05kRitqSTNCZElja3ZxVzJ4Q2tVVm1DcnRkazN2dVpRS25pczZhK3V4MUhv?=
 =?utf-8?B?N0RsWHU3OUhIM1AyR0lDaVRHOU1kS21aWkRwa1p0VlNSU1BiRHBLM045NzVR?=
 =?utf-8?B?UEVvY1VPZWt2TnBOU09xRXJEekxmYkoyZWQrRXg1S3NROXJFMzFpblBGdTQw?=
 =?utf-8?B?S0RYQUVDalJhejk5MnFOZTRSZFd2bktQaFRpQWtDZklwWExESzdPeTBjbXFh?=
 =?utf-8?B?citZbnpZeVVEd05YMzhvandpUUNLb0xXTVBDTE4wMTU3bUs1eXJuU2swcWNS?=
 =?utf-8?B?bGhKZVlzZFlvV0RNMjlKSHlrSGxPNHM5Q3phUGpOa3VPUDdmdXZJUXNXRmVZ?=
 =?utf-8?B?YWlURFRDVUw4anloamY2MFRHM3U4U0I0bWVjY3hKTmxIb05abjEvWlBFSUxW?=
 =?utf-8?B?Q2hya3ZHRGdZSDFjY2xGS2s5dVNhK05RVm9hNTFzZ0V2YXhreXcvTXJyWHpJ?=
 =?utf-8?B?S242MVAxRkFXQzZaaGcweFVmelYvYkxoQmpLVGZOOVA4RlJid2RtZDluY3Iz?=
 =?utf-8?B?SE5QY0FHZGhXTXo2NGloMlF2UXg5N1ZHdHg0ZmdjNFVJdE5Nc3djL2YrYlA1?=
 =?utf-8?B?cWp3aG5pbUVRRzZKKzFBekd5TlAyWTdONllWaGdJaDg1SE5YZGFwdmR6TEtP?=
 =?utf-8?B?SE1RU3RPd0RZazIrMWlKN1pXWVFMalMzamNIcWZPZGVsOTgvWjlEeE4wczVS?=
 =?utf-8?B?TE5DdDBnQ004U0VVKzJhRG95bFZHYlVOSml4TFBMbzRQOCt1VE5wbjFsVitY?=
 =?utf-8?B?VmxlNW9mMkdtMTFzc0loY0pPc01BWS9KNEtrZFlFQmtybzkvRFBmdDlkMHBM?=
 =?utf-8?B?QzR3S3Q0Rjh6OWRNUUFYV051aWlWRWFGKzZKSVNqOGtJSC9BQUVUaWhFeDg2?=
 =?utf-8?B?N3lHWkM0Vk90ODlDVy9vbm9oRmp0WnpYVitLSWZDbW9hVERQZTBTdUlLa3N2?=
 =?utf-8?Q?SH9enY8/vSmIIoANtW7m4STK9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f6acb796-e124-483e-4640-08dbe51bcfc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 14:13:01.5879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhwYgS1PH43IPDBbpe24yTEiGJe54QhQMDefHdecjWX/XurWxol7JcuA1chl5XBuF8pX030ktXtgDSOZNDltHIb7TkTRHrOd+XH5yRqbhhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3348
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 14:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190509

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE0LCAyMDIzIDI6
MjggUE0NCg0KPiBJJ20gZmluZSB3aXRoIHRoYXQuIENhbiB5b3UgdHdlYWsgdGhlIHRvb2xzPw0K
DQpZZWFoIEkgd2lsbCwganVzdCBuZWVkIHNvbWUgdGltZSB0byB3b3JrIG9uIHRoaXMsDQpzbyBp
dCBtaWdodCB0YWtlIGEgYml0IG9mIHRpbWUuDQoNClNpbmNlcmVseSwNCg0KSmVybWFpbiBIb3Jz
bWFuDQo=

