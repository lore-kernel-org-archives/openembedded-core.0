Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1456FC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 12:00:00 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.85])
 by mx.groups.io with SMTP id smtpd.web10.70626.1679572790846641969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 04:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=A4a08J2B;
 spf=pass (domain: siemens.com, ip: 40.107.6.85, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHT5Z2xPVnOqp/04CSiG7v3p4fRnd4TZDbuSe24t615yfmPepH17/MMGAouh00E7/sq09KgHirR68vB/CgFMUPLDFFIHxdXmDATxbDW9F6BFUR2osV0vz3qlDgQQZFRMe9iw+/oHv5VhPqLV4lADWD3DhCOnvg3Kxb7mLFpLgjBpGrXxwvrNiXBxrzVu08M9XnG8/4nt/to65tBcrNx+uv+DMjMwzBhhP2vm5mntlKuKhHengv4gnzdouPKwCR6d0R0Bvn327B3KvJDHjMKkCUXGQ+p6SugWfqtpZKPX5rT4t4ZCp/ZpU7gGCrL3pMCspA6+enUg+Yi+zHp1jBK15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIlYey4DoTlH6HoIBTAmPDmXDMOQXabE20olH84ZKj4=;
 b=Fa4pM9bjn2375C3HxVAQE7Ex9x24h6Dc8t0Y/vOecunlQFlorn+jjCFOVYcwF8Tq0rx5gGXpWnF8TX65VxeAM0S+8MxdbKOqcXju7+xBB5snf5QFXvdj+Lre7TdTSLMWbNWviJsB1b/jDhSFj118Fr9RL4FDZ/1+th/b+Q3DqJ47JZ4KUx4AMb0xvmC6F3fQ+5LqiTbwEMG5HJWuMmnTXEtjqFLt5JnTjwGh8DASSJXUTDSVvrrPfZucQlJMEYqXZbi5niy0vN8cEfkT6byAnHCfGySDLY1lV0Uk9MLoas7nWLBKOQQu6/fAMoH2oNOwkqdeHQo8ukEKmMsddsUy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIlYey4DoTlH6HoIBTAmPDmXDMOQXabE20olH84ZKj4=;
 b=A4a08J2BM1GiccJdQw58BFMQbD/wEWl0h+Kk2vkPTRLFpbgYOgIF8g73hoZBJiuwP9S9A/g5mKZo/01PERUbnNuyAA6FBan0mq8P7S0ovJ4cGYxAMS3KFZlzoRAp3ppX6quTMOEthh0698/pupZi3DRxnZ3WinFFH0i+Da0JeZ7Ga0Gy/3c+2yYHVDPwgPR1NDAVA2TFyeVimP1o/O6wZWUWfrNJCx5LIVb6sR3iTK1v2hSO0BdLQVmRCeAxRNS+5X+fH+hCFHJVrfKu2tSHtMZ3zeSCk2MshvvXcxqFKvsMbaqea879fe0UfAeS8bjX79j0nF0pMig7JfZcUBH99g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB5235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 11:59:47 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3f45:ac57:985a:c006%7]) with mapi id 15.20.6222.008; Thu, 23 Mar 2023
 11:59:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][master][langdale][kirkstone][PATCH] gcc-shared-source:
 ensure that S exists in do_deploy_source_date_epoch
Thread-Topic: [OE-core][master][langdale][kirkstone][PATCH] gcc-shared-source:
 ensure that S exists in do_deploy_source_date_epoch
Thread-Index: AQHZXXb+4qjT9DaV70e0IXo3pT15Aq8IPZAAgAABojCAAAN0AA==
Date: Thu, 23 Mar 2023 11:59:47 +0000
Message-ID: 
 <AS1PR10MB569705403F56BA43CA730619FD879@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230323110146.243968-1-peter.marko@siemens.com>
 <a8d4855315c091bde32979f928885320c1b5b3dd.camel@linuxfoundation.org>
 <174F09F9DA2ECC9A.19937@lists.openembedded.org>
In-Reply-To: <174F09F9DA2ECC9A.19937@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-03-23T11:59:46Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=418a80b5-9e1d-4842-b73c-b4e1612feffe;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB5235:EE_
x-ms-office365-filtering-correlation-id: f72bc80b-77f9-4644-68ff-08db2b96196d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iKxf6MyFFa3/+5aICFCTFUjgsMFzYVFmPaKu6P+5RhWDBJbzEqdVJgrCyyLluFSeFSYDPD6AZ00y+HdaR2GHCorVX4WuIDMrDpjFKHyuCFFCj6hHPxdXWPM73Ruc8fdJ870SFX6kqwTitmNQX8XTQOrOYRAllpKoAdpr87F4OEzwoFD2T+4xutBqY4EMk/9AvvISZMua8FzfRdyYwW9Q7tRTk37KjyZUww2w/tX12Tcp3ztOdnOeuFbC03cwJaLwxxsBgLVqlS7BWGtdF5Xc2gtPPkcmTMCmRqqSO9B4YvAmZpdKo2t8xEQA16M0AiFJ2S0YzQSVlYS5CgqZMovQawUhCz1xP7Lh/2UV8yAxE9B2UedmkBKQ1qyUma43cqNnu413D4PrjJEJoHr6oKTzIxgUmFmf0G9HZtP4ddN6fgSYIJEj0VpM1pz+M4BimqL5co4CxNzSp1r3OUHWNteHn1y2kdDYM68iUhWgUoUzZRD45YyduxMzBglUK4ibCECDnHW7wYEyN/k5fjggIwKpjXLPleGCBODf6GOzWr4ArUwGNmykRS8P9mSUPqfw0U1PZHOts2XS2ET2CbHKn/0a5t4hQi6VqxSS591nYQD5aBQVk9p4WW2gHbI5NGB1rzedN2WpoCko1LCmzXXnz49L+W0DK4FqdqcnFvmmLhwfSPo2k1ruaGLcx5tO9UxV3zmEjJP1Zhw8zde0S1vAQNWVVQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199018)(33656002)(6506007)(26005)(53546011)(186003)(9686003)(55236004)(66446008)(41300700001)(66946007)(66556008)(66476007)(316002)(64756008)(6916009)(4326008)(8676002)(76116006)(71200400001)(8936002)(478600001)(5660300002)(7696005)(52536014)(38100700002)(55016003)(82960400001)(122000001)(86362001)(38070700005)(83380400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WDAxQ0hBSnlianhwK0RCN3c5dUhlODgvUHp5c2RtTlA1eHBOMWdCQ0trNk5w?=
 =?utf-8?B?d2k2LzBsTlBkZGpTUUhUTzVLeEovODNaSFE2eSt1c0dYbkZXdVRWZVRRYUJF?=
 =?utf-8?B?SFpWTHBQOUxNMXR4YkJETnFybWZ4VTBTVzJxVjExYnQzTVRGZFRUaDZhbjNm?=
 =?utf-8?B?NWU0MS9QeVNzZjRyK3VWL1BBdkU1cmw5TGREK0t3VW5TaS83Tlg0YksvekpS?=
 =?utf-8?B?b015cGQ1NkhEbkNsd1Nqd2VHNnFOdm5jNzRiRlRPSC83aEdqRkthcHd5Wk9P?=
 =?utf-8?B?UndXbkwrWm16Um50THpKVjlxTHNNZ2dLMnMzWnkyd2IzVk9Nd0FMQU5Jc3Fr?=
 =?utf-8?B?cmR5YXlNYVkxYmd5bDZuQk1VUFBaK1Q0enMxOVJPQ00xV0VEaVp0clpuOVJ3?=
 =?utf-8?B?WXZ5emlXRzB2MDZyeVVia3ZPTm1sdjJHMlRFOURGeDNESnQwWDkxQ0tEaTdC?=
 =?utf-8?B?eE5BKzkzQ3FlR0s0WW9YSlRtYTk4K3kvM2M3MmxuaEtLWVpqSTJrU3Ywci9C?=
 =?utf-8?B?dEpiaGRaS0F1cTc3eVdTUkxYYTZ1YXJXNmdiWkNCU1diWStVbXRQWEVTd3dk?=
 =?utf-8?B?dHgyczBia0xJRGkrZ010WllGRUFsWDY3c01Md3BiTi9SMWpBMkRzYk9qcHIx?=
 =?utf-8?B?ajhlQjFOZUJUTWU3eWVOOElFbS9LWTJuRGZxVC9zZUZIUWZkbGlhRWhVMHpu?=
 =?utf-8?B?MHpyVDJZa0g1aGxuNzR3ZDNXb08vSlA0MjlJZ0NwM1RpYnJGMlo0Y2drQUZq?=
 =?utf-8?B?NndrUW5tbVl3NGIranErWlRUdDNwT3lxL1lWK00rN3puRHN5STlsbG5hT3cz?=
 =?utf-8?B?WEg4Zy8vSTBJU05wdUt3QVNsVVlNY0hKRDR1Zk9QbU95aUVOcHVtNU9aOFF0?=
 =?utf-8?B?RS9FTTFJTXFwT3p3aXNXVzc3ZW1Scm9nWERYTStscjFyWlpGZ2hNL0tvSG1G?=
 =?utf-8?B?TFEzWUFzYVhtTXIvUU1VMHZvRzFxakttZS91R2JUVjdpZzhLUW9yRmROamg3?=
 =?utf-8?B?N21DTkdoWTgrR20wNzl4eEU4ZkNVeXA2QVNuY3Vtb3hab05uWDFiQ1Z6QXc1?=
 =?utf-8?B?Z2ppU1ZiQXNuUTh2MHpKWjB1aHFwVGdEa01XTkx4d1padUw1OEhDdzEwNk5G?=
 =?utf-8?B?WU0vZDFNT21TdnV1YjdrU1ZiWkdSTmV2eVlWZ1hzMzVzMzlEdnp5Q0tGZThT?=
 =?utf-8?B?SEl1bHJtZDRZbHhEVlViVzRIdFV1ZjVDOXJHeTEzWFJZRmpKcVRWVjJ5V0di?=
 =?utf-8?B?STExSWNkbEF0L2dFQ3NZNXJNZ2tLS1E2QzlYVW5BeDMzRmJ5RmZxb3VvalJ4?=
 =?utf-8?B?Q2picGhPYWtZbnl1SjdlUVE3cHljMGJOZEE2cFBHOG52RVpNTUxYbXBoa0JO?=
 =?utf-8?B?Mlh4Ymlpc1RBSnJKS0ZWeS9vRUFQZXlEQ1RRcGVSaC9iZmNoRHNUWWFmVEJP?=
 =?utf-8?B?WkZkVVZiamRGVmtxajBpR2gzRGxrMklST1I0U3phR3BvS1d3NzJsSGcvUDJI?=
 =?utf-8?B?K0xzTFh1TVJ6cWVsMEZ4VHBDb0hrNTMzRnVWWTdnVW5LNmFZVS93SEFwaExQ?=
 =?utf-8?B?WFZ4Y3F0a0t6dEJQK05wMm03U3hsMDhJc0lUTExiTk9ESUtaL24xdVNDWFNo?=
 =?utf-8?B?b3Fja0Z5d0FYVno0ai9lWlhXQ1VuN3pjTjBZUGt2TkxTY2hjT1BBaEpvYkhO?=
 =?utf-8?B?RVNsNENhU3JSalFjamYyUXJ4ZDFCUnU2aVI0S01Uenlvc1pENWNuYnJoU01o?=
 =?utf-8?B?MERYaHlMaU9tZHdJYk02TWxCeTI3RDFDWnpna0Z1S3hzREdJc3pIOVhvOEdP?=
 =?utf-8?B?eE9vWTNLdlovTzJiWS9EZUlHcGlQY3hXUkZRTGtFWWxaUG9vUmZpTE11ZUZK?=
 =?utf-8?B?TktIZW9mQUJEZjZXWVI0QkJIR1dZa3kyZERxd0hORXkyZzQ1ZHFqWW1BTkhu?=
 =?utf-8?B?QzZvbkJ5RTNwNXVJNzRmbGlOVDNURFVZTXI4TTVBT1RsQk9XaHYxQTBRT2JI?=
 =?utf-8?B?Q3puSTZzeFh6YkpGZWxaN25weUVYRXFpS0NMeWdXVjc2YUNweTFWZExOUjJR?=
 =?utf-8?B?RnJ3dWJUbUVmUnJGZ0hxTWhDQXZWWUtjRmdkVlRpMVI3UHoyWEN0K0NqRXJY?=
 =?utf-8?Q?M4O0UqK9ro0E3eLQHPybKiF5b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f72bc80b-77f9-4644-68ff-08db2b96196d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 11:59:47.4269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1EaZHuQTgrmpJyCxXLDggtjRZ+wvzLvcF8dTK6Ptw8IP9Z3BaQgXEQlzFqcTTFUxagEFcAwsgR+swsaBmIvCpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5235
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 12:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178980

V291bGQgdGhpcyBiZSBtb3JlIGFjY2VwdGFibGUgY2hhbmdlPw0KDQotICAgICAgIGNwIC1wICR7
U30vLi4vJHNkZV9maWxlICR7U0RFX0RFUExPWURJUn0NCi0gICAgICAgY3AgLXAgJHtTfS8uLi8k
c2RlX2ZpbGUgJHtTREVfRklMRX0NCisgICAgICAgY3AgLXAgJChkaXJuYW1lICR7U30pLyRzZGVf
ZmlsZSAke1NERV9ERVBMT1lESVJ9DQorICAgICAgIGNwIC1wICQoZGlybmFtZSAke1N9KS8kc2Rl
X2ZpbGUgJHtTREVfRklMRX0NCg0KUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIg
TWFya28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogVGh1cnNkYXksIE1hcmNo
IDIzLCAyMDIzIDEyOjQ5DQo+IFRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVttYXN0ZXJdW2xhbmdkYWxlXVtraXJr
c3RvbmVdW1BBVENIXSBnY2Mtc2hhcmVkLXNvdXJjZTogZW5zdXJlIHRoYXQgUyBleGlzdHMgaW4g
ZG9fZGVwbG95X3NvdXJjZV9kYXRlX2Vwb2NoDQo+DQo+IEhpIFJpY2hhcmQsDQo+DQo+IEkgaGF2
ZSB2ZXJpZmllZCB0aGF0IGl0IGZhaWxzIHRoZSByZXByb2R1Y2VyIGFsc28gb24gbWFzdGVyIChw
b2t5OiAyMzIxMmM4YzQ0IChIRUFELCBtaXJyb3IvbWFzdGVyKSBycG06IGZpeCBSUE1fRVRDQ09O
RklHRElSIHZhbHVlIGluIFNESykNCj4NCj4gSSBkb24ndCB0aGluayBpdCBoaWRlcyBhbnl0aGlu
Zy4NCj4gVGhlIGNvbnRlbnQgb2YgJHtTfSBpcyBjb21wbGV0ZWx5IGlycmVsZXZhbnQgZm9yIHRo
ZSB0YXNrIGV4Y2VwdCB0aGF0IGl0IGlzIHVzZWQgdG8gY3JlYXRlIHBhdGhzIHRvIGZpbGVzIGJh
c2VkIG9uICIke1N9Ly4uIi4NCj4NCj4gQmVzdCBSZWdhcmRzLA0KPiAgIFBldGVyDQo+DQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjMs
IDIwMjMgMTI6NDANCj4gVG86IE1hcmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBldGVy
Lk1hcmtvQHNpZW1lbnMuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW21hc3Rlcl1bbGFuZ2RhbGVdW2tpcmtzdG9u
ZV1bUEFUQ0hdIGdjYy1zaGFyZWQtc291cmNlOiBlbnN1cmUgdGhhdCBTIGV4aXN0cyBpbiBkb19k
ZXBsb3lfc291cmNlX2RhdGVfZXBvY2gNCj4NCj4gPiBPbiBUaHUsIDIwMjMtMDMtMjMgYXQgMTI6
MDEgKzAxMDAsIFBldGVyIE1hcmtvIHdyb3RlOg0KPiA+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBl
dGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+ID4gDQo+ID4gPiBUaGlzIGluY2x1ZGUgb3ZlcnJp
ZGVzIGRvX2RlcGxveV9zb3VyY2VfZGF0ZV9lcG9jaCBmdW5jdGlvbiBhbmQgaXMgDQo+ID4gPiBh
ZGRpdGlvbmFsbHkgcmVmZXJlbmNpbmcgJHtTfS4NCj4gPiA+IElmICR7U30gZG9lcyBub3QgZXhp
c3QgeWV0LCB0aGUgZnVuY3Rpb24gd2lsbCBmYWlsIGJlY2F1c2UgaXQgY2Fubm90IA0KPiA+ID4g
ZXZhbHVhdGUgcGF0aCAuLiBmcm9tIG5vbi1leGlzdGluZyBkaXJlY3RvcnkuDQo+ID4gPiANCj4g
PiA+IFJlcHJvZHVjZXIgKHZlcmlmaWVkIGluIGtpcmtzdG9uZSk6DQo+ID4gPiAgIGJpdGJha2Ug
Z2NjIC1jIGRlcGxveV9zb3VyY2VfZGF0ZV9lcG9jaA0KPiA+ID4gICBiaXRiYWtlIGdjYyAtYyBj
bGVhbnNzdGF0ZQ0KPiA+ID4gICBybSAtcmYgYnVpbGQvdG1wDQo+ID4gPiAgIGJpdGJha2UgZ2Nj
IC1jIGRlcGxveV9zb3VyY2VfZGF0ZV9lcG9jaA0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+
ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1zaGFyZWQtc291cmNlLmluYyB8IDEgKw0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gDQo+ID4gPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mtc2hhcmVkLXNvdXJjZS5pbmMN
Cj4gPiA+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mtc2hhcmVkLXNvdXJjZS5pbmMN
Cj4gPiA+IGluZGV4IGNkMmUzNDEwOTkuLjdjODRlYTA4OGQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1zaGFyZWQtc291cmNlLmluYw0KPiA+ID4gKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2Mtc2hhcmVkLXNvdXJjZS5pbmMNCj4gPiA+
IEBAIC0xMCw2ICsxMCw3IEBAIFNSQ19VUkkgPSAiIg0KPiA+ID4gIGRvX2NvbmZpZ3VyZVtkZXBl
bmRzXSArPSAiZ2NjLXNvdXJjZS0ke1BWfTpkb19wcmVjb25maWd1cmUiDQo+ID4gPiAgZG9fcG9w
dWxhdGVfbGljW2RlcGVuZHNdICs9ICJnY2Mtc291cmNlLSR7UFZ9OmRvX3VucGFjayINCj4gPiA+
ICBkb19kZXBsb3lfc291cmNlX2RhdGVfZXBvY2hbZGVwZW5kc10gKz0gImdjYy1zb3VyY2UtJHtQ
Vn06ZG9fZGVwbG95X3NvdXJjZV9kYXRlX2Vwb2NoIg0KPiA+ID4gK2RvX2RlcGxveV9zb3VyY2Vf
ZGF0ZV9lcG9jaFtkaXJzXSArPSAiJHtTfSINCj4gPiA+ICANCj4gPiA+ICAjIENvcHkgdGhlIFNE
RSBmcm9tIHRoZSBzaGFyZWQgd29ya2RpciB0byB0aGUgcmVjaXBlIHdvcmtkaXIgDQo+ID4gPiBk
b19kZXBsb3lfc291cmNlX2RhdGVfZXBvY2ggKCkgew0KPiA+DQo+ID4gSSBoYXZlIGEgc3VzcGlj
aW9uIHRoaXMgd2FzIGZpeGVkIGRpZmZlcmVudGx5IGluIG1hc3Rlci4NCj4gPg0KPiA+IFRoZSBm
aXggbG9va3MgaW5jb3JyZWN0IHNpbmNlIGl0IHdpbGwganVzdCBtYWtlIHRoZSBkaXJlY3Rvcnkg
ZXhpc3QsIHdoaWNoIHdpbGwgaGlkZSB0aGUgZXJyb3IgYnV0IHdvbid0IGZpeCB3aGF0ZXZlciB0
aGUgcmFjZSBpcyBjYXVzaW5nIHRoZSB1bmRlcmx5aW5nIGRldGVybWluaXNtIHByb2JsZW0uDQo+
ID4NCj4gPiBDYW4geW91IGNvbmZpcm0gdGhlIHByb2JsZW0gZXhpc3RzIG9uIG1hc3RlciB0byBz
dGFydCB3aXRoIHBsZWFzZT8NCj4gPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0K
DQoNCg0K

