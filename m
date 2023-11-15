Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B139C48BF9
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:42:10 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.73])
 by mx.groups.io with SMTP id smtpd.web11.13377.1700055725996648819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector1 header.b=Enmqwvsg;
 spf=pass (domain: infinera.com, ip: 40.107.244.73, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLDy2BtbHTt+od+ZlaeFmgX9c54CWDQ8ogse4NtcWoQgVhivrNaCWWBmQCm64TCHiXfMhY5a3hZLk4RyqTmHemXO/kgeoS4Fs6FQMVxqXkIiWA3QjrQDBt959Nck1nS9JblsjpazNl2kpeCcmQOvgotgsxTE6RIQ1YXP/3LkjTvM6d17TYIPFDJnSwSsSOi8FVeeReuRrBiw4XcOGR58nTmaGTg+T4Jhi+Iiu+VChzOfQaqlclZ3Fo6ACnjfEZgvnUb9gSKhyJjLNYkXUHuZgnafkHWpoSNg4wAUixkwgYJetIISwTMc2FladCVmEF33DeNr+7B/e/6qaZTD/NpR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9Y2KWPy02NeJ4O26cHrFjH7LPFeKz64xyQDNpeRNIQ=;
 b=mGicOT8krDzBGxlAwaDvDJdOGR8v+kITH1wf0Lww6+CBD3sRbrjI+0T5FnOJmFF9gQ94yuoa5bPc+RoL4IyJuBJS85OIKJhHSNFUcKlFXciGy/9U+aMYRmwPmIjrK9ximMk9EiYOWRhb1o2FPykcZcaIddBwDvwjOHtjreQW2UoidL7JHAQN1o2/s1NtbkbjK6i0vGLPHMQx6i0x7/37Wm5TNQFrSEybIG3La8sBgm8Csk4QYZtIVvRYiiGEA246cf1xgR7+yRlx0CRi8MDQi1X8S13i4U1CxkTLseSAnh/Qv54qneNu7RpunGM9QLXTBDvXwHsxoPZxPMFjmAjL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9Y2KWPy02NeJ4O26cHrFjH7LPFeKz64xyQDNpeRNIQ=;
 b=Enmqwvsgb/C5NxwnWf8Mcu0tCkkyThDZ2IcFIglcYOYT0Tl7GpEIwrr99mx7RoB5+1nFyvDNSb4UR8990OTdyrVsDzH3GNFOQP303xe3rdhDti31nFUR5CQ0ddKCbNdtAOcdROmttePF3nA5EKHUxqwVKNYohC8VXMXJgwMrg3URftqkRMoEQapba4OhZzcnX+dPk/SZdPZ8Cnqq3rGIDU2kRFNFfd5q+V3ORnVpX3fzLlXdhY6pi2MGDNrFf8jPWy0KFYuD6cItVBz5NqQg+sDTBbcAVTbYe2GCHhl7mdaycxhQfh1O9CVxnWEueGWtUbWTyamC6CtXf3p+CF6UbQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CH0PR10MB4841.namprd10.prod.outlook.com (2603:10b6:610:c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Wed, 15 Nov
 2023 13:42:01 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5%6]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 13:42:01 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] shadow: Add PW_SUBDIR
Thread-Topic: [OE-core] [PATCH 2/3] shadow: Add PW_SUBDIR
Thread-Index: AQHaFzo4YvdKKSdR20CYqjr8bGTp4bB7UeuAgAASpAA=
Date: Wed, 15 Nov 2023 13:42:01 +0000
Message-ID: <4f3483d322d0d4afb65b31ba06b3e0d383b62b6b.camel@infinera.com>
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
	 <20231114203608.1490318-3-joakim.tjernlund@infinera.com>
	 <CANNYZj_c1dCdhhuPhnNdQ+9PKQ_FPdbB-b2miypMM9jQuofBcg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_c1dCdhhuPhnNdQ+9PKQ_FPdbB-b2miypMM9jQuofBcg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.1 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CH0PR10MB4841:EE_
x-ms-office365-filtering-correlation-id: 64f743f7-8cd9-43d6-92be-08dbe5e0a56d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Igb9cTSl4hHfosZ1TyF7XU3G0OQ2mIEEU8YggW8cY8jUr5BqBSAnjhHM7PBEssTI7NGSW/HiPLAY7O3Yqg09vVRCI8XBjvdBZFeS2Us7uhKt7UM5uPCI7AVnkdz7s2kZq+QqZGhnmBwfnQ1b8wTe/H+pXgk2BT75l35pAhwEa/KM9uALFVmkkIMshMU2r7ZiSLqUmUJx9qrTomuc7xMJZ+S5+/a029x8+/6JZM1f/nXPC5MxKPv6FZOtZueCSOzqVj8J9sKbQT1rzQjK06yRbMiTShrXlYxUWg0/JUOoHYIWFU/jliicFoUbMQN7k6z3XW9ZdfuCucfrFyruBvNyEKmw6UKn05XLRhsQxfbozCdHY3eTGOUZOny+hsGg1q1uFp4zjltt9xTue+eGz94UxEAjhMOUdNaBtdcX2L/1kFEYdHlVPdwon4NVCyq5YVINcnxLDXlpL0YHgk5AhDjSqbsNTqva2fpkUzHjQ+aTNIOgwBycwPsj//5RsHWVQCO/3th58Lp/fOjkupFmpRUYdvzBhb2PtaLocNQoM2o2iHFDDvf1okNA06hxIZm+kiRdzxmVE5KnV1CYjtIlErj6sEDKCLFLs0kFE8AuDRfkTh0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2906002)(2616005)(4326008)(36756003)(4744005)(8676002)(8936002)(966005)(6486002)(76116006)(6916009)(478600001)(4001150100001)(91956017)(86362001)(64756008)(316002)(5660300002)(66946007)(66446008)(66476007)(66556008)(122000001)(38070700009)(38100700002)(71200400001)(6506007)(41300700001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N1VoTWFjcFNiR1R0aUkxK2pmWlFLcTZuM3QydmFYWUtVdEttUGtDMzRwZUN4?=
 =?utf-8?B?aEp6U0lhMXA2cmsxcjVxR0hPZzRoQ2NSU096N2E2OHpFMk5tUmRBbHBpcFdk?=
 =?utf-8?B?NVB1K2VaMkVrcER3NjZ4WEtjN1BPY0JobmlZcUlLckowNkJhRkduNkwyV21W?=
 =?utf-8?B?aEh2QXJVMkt6clRFQnBBSlZveG9VMzlqeTBjSjgzOEJIMnQ5Wk1uWU5IRTRX?=
 =?utf-8?B?am03a2JXTzR6dUlubkU2Z00yNWtnOUFmU2xsdDA0TFVkZHNGMm9hWEZ2TXkz?=
 =?utf-8?B?aTZuaGRZeHZ0ZTU5K2oydGlTWEpMSFo1bDhvS0RrTm9EL3lJdXplN1BFVWlR?=
 =?utf-8?B?TGZMdWVVbmRadkdGL1Qzc2dEN21OV1FXM2FsQkMxb01FcDUzK05kYWJaWFdX?=
 =?utf-8?B?RnArdFo3Zktlc205YlYyajZPWXBHYk1lazdzeTRBN1NMQU5jaWY5Q1MxWktO?=
 =?utf-8?B?TWdpN2RiS3BvM0E0TVd4TTNpNEFIQXNzRCtJc2VIQllqbjRkU2R5UW9kYzlG?=
 =?utf-8?B?ODJSazZMREkxelZVTHVxY0JQWWhpSHJKeDJxUEJwa1lnY2hGelFxMmRSS1dv?=
 =?utf-8?B?MU5lOHdjUmpqME9ydHJpb2RwVWdYYkJQMis2VzdneXROaXF0eTI5aHBsa29i?=
 =?utf-8?B?bUE1VzlTdkF4MWFqbGFoOVBVb2NENUVyNTNSelVjNXR1RnRtalh0cEYvTS9L?=
 =?utf-8?B?Ty9hUWFJZU9KOGxuWnpnWVhLS3lSdkw4bk9JeUdLbzBaR0VRVTlpdDh6VzFP?=
 =?utf-8?B?cWpEZ1lGSnNiNElwdEQ3ZTd4T1QveUpNc0gxbTVEUW5La2dOWHN1bUtzVkF3?=
 =?utf-8?B?WnBXdWZIdldxc0RMSHlEWnFmVjdkZFg1US9qMldWMjRMcjV1TnBxeVp6VGJq?=
 =?utf-8?B?ZkwvRkpiOFNvUGxKN1hsZ2dBRmE5MkxOSkcwZ3Z4dW95ZnpqOFhkUW1UcFB5?=
 =?utf-8?B?dnZQR1d2VE5laDFSOExDdGRqYm1mRERzeklNVHJyYW9md2V6ejJsNnhCZElC?=
 =?utf-8?B?Tmp5Z1hmSnFiNUVtN3U3RHdWazgzQnJIbGEzNlRBenhXZHVvdjNNajZKd25W?=
 =?utf-8?B?WUFRR0p1dnc0SGF1Z05GZjJtYUdmM055M3hZd3RmQXRqVU14SldmM2gxaVRm?=
 =?utf-8?B?eGRWM0pLZUtrWVNJZjRqT0VLUjE5Qzl4UGhHekxtUmxUZm9Kam0xc3JBZklR?=
 =?utf-8?B?S3o3eDRzaVJ5dHFtQU03UjNFYnUyQUtvODRBMmswK0YwRWdqeHhiVitXM3hk?=
 =?utf-8?B?dzV4NklJMzhzUk4vbk1TS2JwL0doUzdHR1BWQXdyY3pOR09IbitJTHdpNGNm?=
 =?utf-8?B?eUh5RHZUK2RFMTdneStkN3E1YWwwZGRMa1BxRVFaK0thQkcxMWNTQkJMeWlu?=
 =?utf-8?B?K2dEUFhxMjlDampSMkkwV2ZMOUc4Yy80cUhIT2pyakUraVJITVErTEg1QTFj?=
 =?utf-8?B?Q0o0SjZrMHFSVXN5cWc1RHdwc3pabEJEMlF2dTBhcGtXcW9IbEJSSG1EV0Nm?=
 =?utf-8?B?S25qQ202TnYxQS9zcFRtOVNJemZNUTFITG5Ca0NsSVlyZnJJUFAyZUdnOEpE?=
 =?utf-8?B?M2QzK0dFTU1XWVNFNjFFZmVVUUZEMUFXaW1QTFdHUGNoOHZxeEdBcmFadUls?=
 =?utf-8?B?bmJtRmZlKzRKM2RjdVlWeDZIYUp5a0N6YUs0R0RMNnAyQzkzWlRrNmdpbzZS?=
 =?utf-8?B?bU00djZPNS9PSFRWaisrR21OS25XOVoyb3pXenMzK2djVWZ2WkNXS2pFN0Vh?=
 =?utf-8?B?ZlVaVXBHQktrZ29sRkIxUHg1YzM4TDRVREZtMU5PemJqMzEvbFE4d3hoU2hD?=
 =?utf-8?B?cUN6bE9DYnlvQW9JcmNmeXZxdlY0M2huZW12UGtSa3gvanROakIrRjVTTC9h?=
 =?utf-8?B?VDNRenRYY1ljZVZDMS9WTzQ0WmN4djZmNExuOER4RnF1RWlsNFExem53U3Zs?=
 =?utf-8?B?NEVSMmZWRkZrOFpSeE5oY25sazVYZHlIVlA2SWRMcVc2ZEdBVVJSYTFRcEJl?=
 =?utf-8?B?V08rMkQyck41UXBITzZHbmhQek5PaXFxS28zSSt2YXh0ZExuRmE0eC9mc0tE?=
 =?utf-8?B?eW9OYjZhVkVqQ2J3Uk4yTTI2WUtVR25tMUFpWWhEUzlIODJWckMxQTVZM0N5?=
 =?utf-8?B?TzlCQTJ6bXRBQkw0cVVWTk5zUm5YaFZ4TWxnMytURkNFVHl0YTMvYThwRmdo?=
 =?utf-8?Q?0vfvkMXkvyQlmwNFYRzTzFmsqQFSgJWK9VPhHkhSpHv/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <952301387E5E8840AAE94E097CD41228@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f743f7-8cd9-43d6-92be-08dbe5e0a56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 13:42:01.3582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0BAGjNTsct2o+xHAuP779dFL/R2AStQqwcH1SpqqvFcXmYw7EyD7AaI4VxW7AzqOYYAohtJdtmC8KIngUPwrLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4841
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 13:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190596

T24gV2VkLCAyMDIzLTExLTE1IGF0IDEzOjM1ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVHVlLCAxNCBOb3YgMjAyMyBhdCAyMTozNiwgSm9ha2ltIFRqZXJubHVuZCB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8Sm9ha2ltLlRqZXJubHVuZD1pbmZpbmVyYS5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIGNy
ZWF0aW5nIHBhc3N3ZCBmaWxlcyBpbiBhIC9ldGMgc3ViZGlyDQo+ID4gK1N1YmplY3Q6IFtQQVRD
SF0gRGVmaW5lIFNVQlVJRF9GSUxFL1NVQkdJRF9GSUxFDQo+ID4gKw0KPiA+ICtVcHN0cmVhbS1T
dGF0dXM6IFBlbmRpbmcNCj4gDQo+IFBlbmRpbmcuLi4gd2hhdCBleGFjdGx5Pw0KDQpQZW5kaW5n
IG1lcmdlDQo+IA0KPiBJbiBvdGhlciB3b3JkcywgdXBzdHJlYW0gZmlyc3QsIHBsZWFzZS4gVGhp
cyBpcyBjbGVhcmx5IG5vdCBzb21ldGhpbmcNCj4gdGhhdCBvZS1jb3JlIHNob3VsZCBub3QgYmUg
Y2FycnlpbmcgYW5kIG1haW50YWluaW5nIGFuZCByZWJhc2luZy4NCg0KVXBzdHJlYW0gbWVyZ2Vk
IGl0LCBzZWUgIGh0dHBzOi8vZ2l0aHViLmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93L2NvbW1pdC9l
ZTNhNzljNjk1MmY4Y2E2NDljMjg2YzdmNzY2MzlkOWQxZGVkYWFkDQoNCiBKb2NrZQ0KDQo=

