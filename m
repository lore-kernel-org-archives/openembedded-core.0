Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEAFE7107E
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 14:39:23 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.75])
 by mx.groups.io with SMTP id smtpd.web10.19539.1695307155956374381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 07:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=Ir0T9V/8;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.75, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLaESKnlqsv5cl1nwQbGZt54tlpulkXgntfTZ2OGCtmACuZABIDa4Bg3uUoiPFYBHiQh7rqGQEl3WI9mrGvbk4X9BR1bCDNgzXjxlEIv1KvY/rCWWO3KIDryT+7Hty1b0F24YIdVKkYdcenjKzdhJfIPh83wgRNGu/D3JrUHdMwwl1ZpYGfhqmkcCPvkji2lW0b9dlWQZqm4lbsAiqWf85Weuc4reVpcPOpjBlFTzB4knO+2sDLn6rNIaANUYgDMkSG+RJ9jErl5W54b1sOrUpvvuGWPQ63Sk7Pe31P96YGYWPi1qgmxj49MByV+sZYAkjQYUYBMLVlQY2xWp71PIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjgtshqNxB3o5GYr9pDJ01QOU4rmDb9AqccqxyZrryQ=;
 b=kAlaE8QXlMSdA9yfUGK+bG3PED0TJb4+LUjzi068dMBr5ddk5O3JQA+BYXmoSo+dFMYFoGOgiLntAXfpCIkcYl0kyU2umNBTMy1lIx7m144XZR6J+CCSTySrZEg0NUZXSxDE5iyP01M37sAmy+gTB4x6Q/SSYsvXVNEr1ZmVg58tq7aaeQcblofvw55EzyuOsmwQWg/pqzx6F0sOUKqSz1ju3vnvzkUqLxlvCNuRzQTXSRRAk5L+YYQ4L1WcUwiwJ8M7lNKQCHxkG7pXu30Pu2kDAw7/WxHTddmUJD7tsaJPkCSYJk6a+520gi1qemw1Zk5td+vC1nzU007n4dBmfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjgtshqNxB3o5GYr9pDJ01QOU4rmDb9AqccqxyZrryQ=;
 b=Ir0T9V/8rribh7LfpJvKCTyHSttcby0gUn9fa/nEk5IpXhM0jlYYz1Jf+G+kVKMA/zpGf0Bo3B73yqgFaEw5YbtLa1dKzYFF1eyB9xujBtJuGsjQxyKoNWOxZRth+WhYlogn2vi9fVbiQqIElNmCSbW7Ri806SI+yVHKvGqTyaQiYm6wyKd8NIVZg+Fd99WWlr1gmYvD9xXLDcJ5LTY8Yjd5gCx7FSWHKi8g7mVWzWWIleAdKBkM0/WCP9w6lKD1ujlZmpIbfCIV62pKaij2ZL98Ctn76EOVTGpcjaBeANW0S7pkfJw0GrYL0Q2gtyAkX2QAAAht8s7P1b+pzegsCw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 DS7PR12MB5862.namprd12.prod.outlook.com (2603:10b6:8:79::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Thu, 21 Sep 2023 14:39:11 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 14:39:11 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Julien STEPHAN
	<jstephan@baylibre.com>
Subject: RE: [Openembedded-architecture] Core workflow: sstate for all,
 bblock/bbunlock, tools for why is sstate not being reused?
Thread-Topic: [Openembedded-architecture] Core workflow: sstate for all,
 bblock/bbunlock, tools for why is sstate not being reused?
Thread-Index: AQHZ7HxyGNcKShXW7UCEDvXW6rJfwrAlWJnA
Date: Thu, 21 Sep 2023 14:39:11 +0000
Message-ID: 
 <DM8PR12MB54304C00CC6C924121E1CBDF8BF8A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
 <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
 <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=0b745002-fa83-4d4d-bbdb-5d53df979ba0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-09-21T14:34:54Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|DS7PR12MB5862:EE_
x-ms-office365-filtering-correlation-id: d1d006a5-27ab-4373-9f84-08dbbab0850e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FkVRfJ9JLW9e7S3AGQtBUDQ5WKYDZdgpsRmspmkqRnUGrsnMIo06z/uooEEdzQzkjQ9TXUBOLp82d4mUBQk2rsyJl+eKx76g/eubGSHbpiGU3SFGjLOLkYoM7weobyFMt2job28MZIvPh3nqVsYs93cZHFKZbPb66xE2WuR3RRRIBXkjdPt0THEyluwXtYqv56vz7chh2TENLgufv8VqM5p1JgpQwAPsWLZXgl/CDK3raPDxU5ycpIQQ5Hil6oY2+xMHDeKnYoVw0t9JH0y8D5iPxVtqGT/gBR/+M74VCVZV+whR75WoQ5osgCn9Vb59O1FoVBbBuinhW/5HgJFgpqfJ0KTH/TsMU/YQSMAvqbN51aOx2QgwmKLIp4ArvhQm7EEvuJAbfU6oJMLtOjS9DS0CNwRkcnREXtdikUlz7mij+HCdEXo5saatAc1K7HBn+tkawTCKQW25t3qBwBaxOmr5OIc5SSgQ8/F/feVJWuoM+5gTs9dGTDTUkag65TPdV0g650nv9EKJXlrSeDCA8nabnCugmLkmKhF9clP6ipmIS9mC7Bh6p0jkTmD+x0XZNk06hR/s3wtdRrMb928hecHje14p23p4YOhuBoRPsBvG72x8wRTw+Lz1DpTO0/RI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(1800799009)(186009)(451199024)(110136005)(9686003)(55016003)(26005)(316002)(38100700002)(66946007)(38070700005)(64756008)(54906003)(76116006)(66446008)(66476007)(71200400001)(66556008)(41300700001)(478600001)(122000001)(6506007)(7696005)(33656002)(2906002)(83380400001)(86362001)(52536014)(8936002)(4326008)(8676002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V2Z2WWJiWWYxNmZydU96dnFzZExNajlMSjN4THAyb21qMzF0M1EwaVh1dk01?=
 =?utf-8?B?QTgvSjdyWkpxNGo0S21QTjUyRWxVQmIwYjZVZHhBbDJXcmpBZlMvRDVWRFdV?=
 =?utf-8?B?OTZyTnAwai9CV3BmR0I1MWFiZ2ZBQjJkMWx2d2o0OWppK1luQ1A3N2FVYmh3?=
 =?utf-8?B?NmVuckNxclJrU1lHa3dOeFNPNGE1enR2bHRKMFRQY2FaOWx5NERqWVh1WkFN?=
 =?utf-8?B?ZWVIbVVkTk5WOUNxZy93dHp3YTN0ZmM0TC91MUxrbEswVzJIeGFyQXhHM1NT?=
 =?utf-8?B?OTVzWHR6ZEpvZGVxTDNkT2lSdys1QVJGNnA4ZXFJdjVDbDM1TmVuOFZjMUl1?=
 =?utf-8?B?MjNlTGE1NVRvVzRRVE9BS3cvc251ek1zM2hkTVVtcFRHQVFXdnJJYURiSEZF?=
 =?utf-8?B?VVEvUXJKS2JEYUN0SWlGTWJTSDZueU5tV0NUVHc4T2FkVm1hY2ZRYzdDY0FZ?=
 =?utf-8?B?L25xRlF5cjdxZTN4U3RJN3BBSlY3bWE0WENwYTB1U3ZEZXRSOXdaMjc1cjhH?=
 =?utf-8?B?S2Zpdi8zR2dldUp5YWxLZEJuRkNJOStJOHIrNGxTVDdkRFRrU1NNRS9OL2Fh?=
 =?utf-8?B?STdibTUvdzI2TEpCaTZRTW9WdWRFWFRzQk9UbkFQQVE1U3FRYUJUZGJMaEZT?=
 =?utf-8?B?V0tCckgvRzRzSUlaU1pxYXNZQ0VLZjdwT2FFZ2g2aUpyWi90UWNUc0Z3VVZm?=
 =?utf-8?B?dHprck4zMHplUDhFcVVYZUhyNlpDNmlIOVJQSzlSOUgxL045elBxbnFiVnl3?=
 =?utf-8?B?NlA3Wm9YaENVUGMvbzVudmpUeVFab2t0aW83V205UVBKT3psNFE3V3g5WDA2?=
 =?utf-8?B?c2Z2YkJRcVBPQVRRdC9STW55WlNuOHhoMDJnMnR6ZmEzMzVoV2liMmhpWlo0?=
 =?utf-8?B?MFZHeUcvYWdBS3ZabU5sZjkvY252VTRtNStFZWFvaDU5b3ZaZmRqUU9QQStG?=
 =?utf-8?B?YjBteW9ZQVV1R3U1SWxvV29rdHhOdUdjbm1OQndYWFZtMUVROEQ4REFSbCtU?=
 =?utf-8?B?RzBEZnNIUFhtaDVoSDRQZUc1QTQ2R3VJOUQ4TFRidWpnTVhDWFIxUVdsVWQ0?=
 =?utf-8?B?SGpSTXY0ZGZTeG9rY0RUdjhnV2FmM3ZDOVdWNWFROG9RYm1kNjVqNXVNZVRS?=
 =?utf-8?B?cWtjSGE3TFVZMHhnUEdHL1NaekhjclFuMjMvV1l4eUhtZkFjTzAzaUlGUHFp?=
 =?utf-8?B?ZktVVkt1MjJGOENoM21maVFRcWNiRjRtZSszYmljVUYyMlV3NTV5MTVHczRm?=
 =?utf-8?B?RG4rdm9Cb1M4cVpNRSsxU0t4UEF0Ukw2ellSMGRYejNwUlhLVFVIb1ZHZDBN?=
 =?utf-8?B?eUlUS0ZwVUZnT1pKTEltcnpmSkg3em02bHpLMGhEVk5IcFhvNFhnWGlRaEJn?=
 =?utf-8?B?VTVVcGw5eTZEajZWWXAvaEN4cjFxZnZNVVh4SCt3VWJkUDVOZTBNbDhVaEFr?=
 =?utf-8?B?NHIwcmhZb0tQOWVJaUFUa0N3Y0FDSHhmNW5JcHlBK3Z6U0RkYmhSMTFVdDU2?=
 =?utf-8?B?RHdLZ2NIZEl0MENKU3MxYklyQ0NUNmRQRTVJMU9QSWlSenlObjB5SFJidFVy?=
 =?utf-8?B?b0ZtNDBlNGtRcFdpcGNLMW9ob2QxSzdDdzFkMFZZZGxYSERxbTVHNE1KWmxp?=
 =?utf-8?B?N0JucURocUdOY3BFdXdiTmwvU2poWVQ0YTlYSFZpUEx6TE11d1RuYVc2S2xq?=
 =?utf-8?B?NUNoUlpWc1I2VUE1cjRMbU1xNWxCYlVXa2tPNmhvV05IUW56MTV5Skh1a053?=
 =?utf-8?B?ZFNaMmhuYk1wN3ZhMkFEOG1rUzY4NUhHdGR1ejd0S2RwdnBpNTMzOXBRSjNm?=
 =?utf-8?B?empRbWUrKzFHMFhxMHVmUU82Z3NvcnBranljMUdFNDltVEdLYU1ETUE0Zy90?=
 =?utf-8?B?Z25nbTFDSkJCUE9vU1I3OEhRWWFnV3FQUW1pcnlQbHp5VHR1UmpSZUY1ajFJ?=
 =?utf-8?B?ZFVmWkJkUzAyT08zaUJxaXA1TFNOY2Nyc2VyK0IwUjdORXdQZUsxOEI0cGln?=
 =?utf-8?B?R3FRL0pwN2VyN0MxN1hXenl3SUYxbWUwQnFQKyt2dkNmdTFCSnZxSFhFSEpx?=
 =?utf-8?B?aEdWUTN2VFpsMkNRTnk3d0ZkNnVxUUdOQWVGbVBUYW8wUFozbFMzTUhiUTYr?=
 =?utf-8?Q?ttc3u5FplsOuOC2q8MkhcORxI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d006a5-27ab-4373-9f84-08dbbab0850e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 14:39:11.1920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: br6UByFTNMxdgPSVKPXEw9TJbAtNaWuvD3BP+STEs6qLfb8n65/wiQ1lJ1ry1kkdiBChBFW3dDtF+OiOVTfcFyKFItx3+G0dol10b/9XEPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5862
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 14:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188008

PiBPbiBUaHUsIDE0IFNlcHQgMjAyMyBhdCAyMTo1NCwgUmljaGFyZCBQdXJkaWUNCj4gPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+IFRoZSB0b29scyBhcmUg
YWxyZWFkeSBzdXBwb3NlZCB0byBzdXBwb3J0IGRvaW5nIHRoaXMgd2l0aCBsb2NhbCBmaWxlDQo+
ID4gc3N0YXRlIHNvdXJjZXMsIHRoZXkganVzdCBkbyBhIGJhZCBqb2IgYXQgZ2V0dGluZyB0aGUg
ZGlmZnMgcmlnaHQuIE9uZQ0KPiA+IGludGVudCBvZiB0aGlzIHdvcmsgaXRlbSB3YXMgdG8gdHJ5
IGFuZCB1bmRlcnN0YW5kIHdoeSB0aGV5IGRvbid0IHdvcmsNCj4gPiBhbmQgYWRkcmVzcyB0aGF0
IHNvIGF0IGxlYXN0IGZvciBmaWxlc3lzdGVtIHNzdGF0ZSBtaXJyb3JzLCB5b3UgY2FuDQo+ID4g
Z2V0IGJldHRlciByZXN1bHRzLiBJIGRvbid0IGtub3cgaG93IHdlIHNvbHZlIHRoZSByZW1vdGUg
aHR0cCBpc3N1ZSBhcyB5ZXQuDQo+IA0KPiBJIHJhbiBhIGZldyBleHBlcmltZW50cyB3aXRoIGJp
dGJha2UgLVMgcHJpbnRkaWZmLCBhbmQgc28gZmFyIEkgaGF2ZW4ndCB5ZXQgc2Vlbg0KPiBhbiB1
bmhlbHBmdWwgcmVzdWx0LiBIZXJlJ3MgdGhlIG1vc3QgaW1wcmVzc2l2ZSBvbmU6DQo+IA0KPiAk
IGJpdGJha2UgbGlic29sdi1uYXRpdmUgKHVzZXMgY21ha2UtbmF0aXZlKSAkIGdpdCByZXZlcnQg
PGxhdGVzdCBjbWFrZSB2ZXJzaW9uDQo+IHVwZGF0ZT4gJCBybSAtcmYgYnVpbGQvdG1wLyAkIGJp
dGJha2UgLVMgcHJpbnRkaWZmIGxpYnNvbHYtbmF0aXZlIC4uLg0KPiBUaGUgZGlmZmVyZW5jZXMg
YmV0d2VlbiB0aGUgY3VycmVudCBidWlsZCBhbmQgYW55IGNhY2hlZCB0YXNrcyBzdGFydCBhdCB0
aGUNCj4gZm9sbG93aW5nIHRhc2tzOg0KPiAvc3J2L3dvcmsvYWxleC9wb2t5L21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZS0NCj4gbmF0aXZlXzMuMjcuNC5iYjpkb19yZWNpcGVfcWEN
Cj4gTk9URTogV3JpdGluZyB0YXNrIHNpZ25hdHVyZSBmaWxlcw0KPiBXcml0aW5nIGxvY2tlZCBz
aWdzIHRvIC9zcnYvc3RvcmFnZS9hbGV4L3lvY3RvL2J1aWxkLXNzdGF0ZS9sb2NrZWQtc2lncy5p
bmMNCj4gDQo+IFRhc2sgY21ha2UtbmF0aXZlOmRvX3JlY2lwZV9xYSBjb3VsZG4ndCBiZSB1c2Vk
IGZyb20gdGhlIGNhY2hlIGJlY2F1c2U6DQo+ICAgV2UgbmVlZCBoYXNoDQo+IDVlNjQ5YTQ5YzRm
MGRlMmU2MmJjOGZhNDIxNWRmMTAyMWI5NzcyNzYyMDY1MzUyZWYwZDIwNGQyZDcyZjRlZmIsDQo+
IGNsb3Nlc3QgbWF0Y2hpbmcgdGFzayB3YXMNCj4gODVjNzNlYWRjYTA2ZDBlOTJmY2VhMTMwYWU2
ZTIzZTkwMmM5NjMxNGVmMWMzOGM2MGExNGVkMzQ0NWQyNGVkNw0KPiAgIGJhc2VoYXNoIGNoYW5n
ZWQgZnJvbQ0KPiA3ZDRhZGY4MTdkOTk4OTNhMzBhOTQzMzA4MDNhMGViMWMwMDY1MmFiMjE3YzIx
NTk5OTQ0ZjgxZjAyM2FmNmNkIHRvDQo+IDdlOTM2MzEzNzZlZDE1OWMxMTQ2MDY0N2JmN2Y0MTc4
Y2IyNjBkNDRmMzY3ZDA4NThjMmNkOTZhZTIyNTZiMDkNCj4gICBWYXJpYWJsZSBQViB2YWx1ZSBj
aGFuZ2VkIGZyb20gJzMuMjcuNScgdG8gJzMuMjcuNCcNCj4gICBWYXJpYWJsZSBTUkNfVVJJW3No
YTI1NnN1bV0gdmFsdWUgY2hhbmdlZCBmcm9tDQo+ICc1MTc1ZThmZTFjYTliMWRkMDkwOTAxMzBk
YjcyMDE5NjhiY2NlMTU5NTk3MWZmOWU5OTk4YzJmMDc2NTAwNGM5Jw0KPiB0bw0KPiAnMGE5MDVj
YTg2MzVjYTgxYWExNTJlMTIzYmRkZTdlNTRjYmU3NjRmZGQ5YTcwZDYyYWY0NGNhZDhiOTI5Njdh
ZicNCj4gDQo+IFRoYXQncyBwcmV0dHkgZ29vZCwgaXNuJ3QgaXQ/IEl0IGRvZXMgcHJpbnQgYm90
aCB3aGF0IG5lZWRzIHRvIGJlIHJlLXJ1biwgYW5kDQo+ICp3aHkqIGFzIHdlbGwuDQo+IA0KPiBJ
IGhhdmUgbm8gaWRlYSB5ZXQgd2hhdCBraW5kIG9mIG1hZ2ljIGl0IGRvZXMgdG8gZmluZCB0aGUg
J2Nsb3Nlc3QgbWF0Y2hpbmcgdGFzaycNCj4gaW4gc3N0YXRlLCBidXQgaWYgdGhpcyBicmVha3Mg
ZG93biBpbiBzb21lIG90aGVyIHNjZW5hcmlvcywgd2UgbmVlZCB0byBmaW5kIHRoZW0NCj4gdG8g
Z2V0IGEgc3RhcnRpbmcgcG9pbnQgZm9yIG1ha2luZyB0aGUgdG9vbHMgYmV0dGVyLiBJZGVhcz8g
SSdtIHJlYWR5IHRvIHRyeSB0aGVtDQo+IDopDQoNClRoYXQgaXMgdmVyeSBpbXByZXNzaXZlIGFu
ZCBJJ2QgYWxzbyBsb3ZlIHRvIGhlYXIgYWJvdXQgd2hhdCBoZXVyaXN0aWNzIGl0IHVzZXMuIA0K
DQpXZSB1c2UgQXJ0aWZhY3RvcnkgdG8gaG9zdCBvdXIgc3N0YXRlLiAoQXJ0aWZhY3RvcnkgZG9l
c27igJl0IGhhdmUgc3BlY2lmaWMgc3VwcG9ydCBmb3IgaXQsIGl0J3MganVzdCBiYXNpY2FsbHkg
YWN0aW5nIGFzIGEgZ2VuZXJpYyBIVFRQIHNlcnZlci4gQnV0IGl0IG1ha2VzIHRoaW5ncyBsaWtl
IExEQVAgZWFzeSkuIEkgaGF2ZSBmb3IgYSB3aGlsZSBiZWVuIHRoaW5raW5nIG9mIGJ1aWxkaW5n
IGEgdG9vbCB0aGF0IHRyaWVzIHRvIGZpbmQgdGhlICJjbG9zZXN0IiBzc3RhdGUgb24gdGhlIHNl
cnZlciBhbmQgdGhlbiByZWN1cnNpdmVseSBydW5zIGJpdGJha2UtZGlmZnNpZyBvbiBpdC4gVGhl
IHRvb2wgd2FzIGdvaW5nIHRvIGJlIGNhbGxlZCAnd2h5LW5vdC1zc3RhdGUnLg0KDQpUaGFua3Ms
DQpDaHJpcw0K

