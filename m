Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DA9CD610E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:51:31 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.88])
 by mx.groups.io with SMTP id smtpd.web10.68519.1696870289143550898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=urmxLSBK;
 spf=pass (domain: siemens.com, ip: 40.107.104.88, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vmfuu14Iem54VwathJILvRDFYwVq6sghIMXRmusM+ktJbRhjJ8y6eYfY+LRwaoYnGHQ62/JKbu5uhexJVCFVpKzmUKF/O7L7C6zZRFn21FBmCKL4lNVNJ7SPcW5JYjANq4tCIhv4cZAHNLqwgW1jew0Zgu8agGzZtlOH0WdVKoojNORUXvIs3V6uMrbMQJSmj5w2UjJ4vSQlTcqcog5fG81YOhnIhu79Kzrp75ZOBy2XcMEN3c9A0XBvCyqjL6VTX6oJ3lm6jpezJfBKT24nARrvFhxEi5Mz1yderSmjYcBdl+U7s8TfdKhWiJOCtaQHZ7uIHn0lM6hTdOPwtB/VJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puOmAU8gc1+iVpmdWEYSIv1VhXIcHPEcXj3ho/CXSs0=;
 b=XtL2/h5/YCH3290uY7DH1PZjdlMe7JfCNXi+pQNmgk08Y+Sz8TVtL4mRS2V6VKoP5/56pAJUwHyha3hlFoDh2sjgZsFBBOD9nJU31xspb4qzry0yJBB+Zcjhj1Xd9mw8QbcQg4bEl/fYn+f4qDsvhTdDFipdCld6nv3STiRAF4Sr1Zu5fGitiMIaabU20rOiWcGzyDJYtlQxX6f2BC8g6TwFxfZ6Rw9AyMzB4WqjlwXYYg6q0jxDCY1QHWSrHAMZUs579l8tYblH00in60pFwquHOpWP/S0tmHy6D67wqIOQAO7m0VpW8Fvq7iuDV0sNstnozdXfbAaGj5nqqOK07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puOmAU8gc1+iVpmdWEYSIv1VhXIcHPEcXj3ho/CXSs0=;
 b=urmxLSBKd1opIGU4PizV9METtpvGgyVS+gkadoD66kCKEQwmln3lZVTUQG16bYpSRVDEWBzZydYqzpTCLcug3oJ252iwHIpkIa5OCa7hGPhKYOFOVCqqeK95HJVhHnhoIW7JcOom+t3h1Ki+XC/7lrgZm9LzoNr911XKlJiymZtO5UzcQQpantxaCgmLo0RfQ3F+f7L/Mdm9O0OmmXiqZ81aRn9eQpfqdAwQ0iORDD2nixRMOITK4Bk6WeOUSqtIZMtMK4925x5AgnV7mCb/RkS756j5nf07flvqJcdzEqm2r6/0JSfCCYxpyLiu5EflOBGihBtF9cmzn6WYrGcJ0w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7540.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.42; Mon, 9 Oct
 2023 16:51:26 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 16:51:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Marek Vasut <marex@denx.de>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
Thread-Topic: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
Thread-Index: AQHZ+s4QM7OitojrPkSOGd5qmkfWiLBBqgyAgAABCGA=
Date: Mon, 9 Oct 2023 16:51:26 +0000
Message-ID: 
 <AS1PR10MB56972FEC790240DB9F01228FFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231009163110.94431-1-marex@denx.de>
 <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
In-Reply-To: 
 <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=291a4468-a848-4ac2-ad0e-4a5311dad488;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-10-09T16:47:52Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7540:EE_
x-ms-office365-filtering-correlation-id: 0e3f39a5-3e95-4220-9d61-08dbc8e7fa39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FjwZXxoy0/ONcY3uA1vCUnQc1UMa3DTZ0FjKjFDwDD9lU9ojw3YZ085SGql6K4Jk/i1YZsd1+hnEDtrvL20UgE8T0M2HJ5rX6okrVo0CF6bBxLDXiXz8x6FVU4t0iJROSzRd2FOm+LrVp9Z1Ot1StASerWLuchB4PEqVDQUTYNrpgVim8kH3t4bfl+xQ6vZXClqg/+FwBMbwg8IfsxeaKpqimr8WBuoOrOkvkYlo7NhkKjr7L6vL39JqF5x0FgcmtYPmGJhb7ogKkVX1BNRiCFczHi55h9vf+OkXZe6P+4Tvy3AYyTwCehDEfgtHB5OMOzSP426sc2MMdN47r6+w+D77DPMichMPShYJMaOKZGBusYKPSMQYB0Wa/SJB5Cf9FGKNKYq7hg9Zhqq5i9C+38gtBQyMAs930KrK2LByQHQi2/2m39ZDLXiz2TtV2foQWjT4g9hVSwsbCqtAGN0ZPao7sUJB3/Z6kC+I5OV2TsikmNhGhY1zcOUdY+qUqWJaic8e+3+MNUJdVEdA+H9ZfpSpexDI7cPdrXzatoJFg+my5FO9Gd/4VJr7+vNjCm8aOQ4p8NzzwlNKBWgXT93kYHfzm4Kn6WhfPtb9nAc+YAU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(71200400001)(55236004)(53546011)(9686003)(7696005)(38100700002)(33656002)(38070700005)(55016003)(86362001)(26005)(82960400001)(122000001)(83380400001)(966005)(6506007)(478600001)(8676002)(66946007)(4326008)(2906002)(8936002)(41300700001)(316002)(52536014)(66476007)(66556008)(5660300002)(66446008)(110136005)(54906003)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OUs3VHFaQ1l3ZzB5bDdkSmhpUGQzcHBCR0RoSkVMWHl6Qnp3V29xYWdiMjMw?=
 =?utf-8?B?anBmeUhwZXV6SFNKMXc0dElLS2dyMjFmM0ZyRDRINHhRdmE3V3BVZnYxbUZx?=
 =?utf-8?B?aW1Sc0JTd3RxSkozRDFYT2RhRi9nMW5RY2lEYzI4KzBkL1JGQkVjTHZzNmtD?=
 =?utf-8?B?bFFUQUZZcmhaeUlLVW9PQklwUUJUbFhBaGlWeTVNWUg0TDdjTGpvZmJ0cE1y?=
 =?utf-8?B?UVdtVHY2WG1lY0cwTWpEMFJDYUtmMXpvT1NGdTdpb1ZRS1J5Rkdqb25ES1Fs?=
 =?utf-8?B?eGNIVWozQk04VW11blJGOFU3bFlDUUt5bE0xV3BScXVtMlZXZlpwT21BNmxH?=
 =?utf-8?B?VFFqSjMvcDMwS2JxUUh6R2xPYzJ6ZHg4NnMwb0dVTXAxQXBLWWhadlhadjVu?=
 =?utf-8?B?NXR1bXllSnIwL2R4bVRBQjVaYTJQeUxaU0FWUk1ySDN1UkptVmdXTnVUQkZ0?=
 =?utf-8?B?VTFucUhYZkRwditrbEpRSC9MOU8vTHQ4S1R0QWR4cmVVMXF0cHhRKzJPNWcz?=
 =?utf-8?B?QVlGcHd3eDNkRUZ2MFo3VjhQdjdSNHRPb0FpZy9CaGdvZlFHVFBZeFJ6Yy9E?=
 =?utf-8?B?UXNudW1uWXFNRXBDUlJkQTgrbi8wZzNCZnhEOVBWTVlibzhnMUtKOEYrYW45?=
 =?utf-8?B?eFZiV1NWa3Z0MFVSQjVwZ3dCcHB1dW1BRFJBaDJONHJyYVNxM0JCbjBkTHNt?=
 =?utf-8?B?cVJMMWp2OWxTenRNTGdDbFZORHp1Y0liYW1mSjlZVnVSKzlXa2loUldPTkI1?=
 =?utf-8?B?RnRGZjNZZmJxSTlaWVQxUjF1QkVLYUhSSkZKaDlSRXpqcTRzcEc4UlRQR09W?=
 =?utf-8?B?bGdZczJGZzVDN3A5MzgyaVJia3ZnaGhVSXREZE9MdlU2eWhZR054MzRYc2Jj?=
 =?utf-8?B?VzAvRnV1Z1hXd3VwblNnMUFNSS9uRU5LeWtSUklzOGtXamlIRWRFdlRpYnhn?=
 =?utf-8?B?ZmVIYTRxcTI5elp1MUxDSnRPbHMyMDA1djZ6VGNEd1VKdlZsLy9hek8vNkRz?=
 =?utf-8?B?L0s2Vi9kVTFhY1NyR0lxSWpiZFJIdnY0eWxZY0ZldUJydlpVL2xmU1R0WXBE?=
 =?utf-8?B?QytyeFZIN0dLQnFJbEFmOGJLWHo4WlZrRkkycmF0eG9xZkk3MFdWR3dINTlW?=
 =?utf-8?B?QmZyYzVRclJBVndIckZoVXF1QW9NUTFpLzFHQ2NZMmIwWTRLcjFmMlFUbCs5?=
 =?utf-8?B?dUxKR3RhL0p5bStpRmhHb0djNjQ4QWRHcmlqSWxYbUhYS0FGbVQyeU5sWlJh?=
 =?utf-8?B?Mi85MFAzMmlibk55ZWdKbTVVOHlIR2hoZmFteEhGWENaaHpxcmhNU1JNcnZs?=
 =?utf-8?B?bGdiTFhJWE9qR0ZORVh1VDE4RERLR1RicTNacTFHTkI3c1A5Q2JSWnA5dUwy?=
 =?utf-8?B?NU9HV0gvNEdTT3pMaGdIb3dYeUhsd2Fnd2xuQVlyVWM4dzFPSzB0cklscWlm?=
 =?utf-8?B?dHg3dVpkM2FEWHhnRktCVUVOME9yd1BSREl0YjhQVFBPMkRmdHZkOGZJM0I3?=
 =?utf-8?B?L25TZm5VUDJXMDNWZ09CbG94bkF6TjFwMFdBY1k5d2llV0tBSE95Z3d6S3d0?=
 =?utf-8?B?Z2JYbEpLbEswbEhVQ1hrNGtVMWlUWCtVaDlrZHprQkFZVFNWcklmSTFTQnpG?=
 =?utf-8?B?TjhaUmNpZzIzVXAyeWRONWRYN3g1bkUwdjE2YXJmdXpuSVFpUzdZVGxNQjhu?=
 =?utf-8?B?bDFIbDNYZ2tWeU1oV0JjYjc4b1ltVkUxTDZrMnFlYkxCbm5Wd0o0dlBwT1dE?=
 =?utf-8?B?QXRJYWRNY2p1L3o1VUh6aDdGS2NXL09ucFh6bmdkaHl2UkFmZkxYMVZSMFUx?=
 =?utf-8?B?SmZveGR2M1pQcnRDa1U5VzVPRTcwdEdsTFAvSjYxWkk0YlpzeDBsUkwvbDR6?=
 =?utf-8?B?Yk82MHp6T3RuV09YdmRvQUdxOGt0VWZHL2JsTHF2MlQvRCtBQkJtaGxwaGxK?=
 =?utf-8?B?NjFCL2MrWE5NUjI0T1hDRm5JajZqSlVmTGhFUTFKVk1IRUNxcWlCcnRWWnUr?=
 =?utf-8?B?NlRKNDRYdlFmc05nM3gvUWd0OXBKT1N2bDNNTGt5TFQwU1lzbWxtNkZjTEE2?=
 =?utf-8?B?U0ZiczJPZ3ZZWnpaNWFEanhFNkNjSUFuSm5CNVRHYlRxc0l0MlhYRzVIWTR5?=
 =?utf-8?Q?d3q+77lHa6lukQQsKojuL7pmM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3f39a5-3e95-4220-9d61-08dbc8e7fa39
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 16:51:26.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UX3UWiwRUJfdoorJwxmQqFTYhcYb/gl4J4hDiJ6emBi1LXG5oapjsSeYMew2AaxlAWt9YlQDQ0xA1F18fndy7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7540
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188853

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KU2VudDogTW9uZGF5LCBPY3RvYmVyIDksIDIwMjMgMTg6NDQNClRvOiBNYXJlayBWYXN1dCA8
bWFyZXhAZGVueC5kZT47IHN0ZXZlQHNha29tYW4uY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxs
b25pQGJvb3RsaW4uY29tPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG5jdXJzZXM6
IE1pdGlnYXRlIENWRS0yMDIzLTI5NDkxDQoNCj4gT24gTW9uLCAyMDIzLTEwLTA5IGF0IDE4OjMx
ICswMjAwLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gPiBDb25maWd1cmUgd2l0aCAiLS1kaXNhYmxl
LXJvb3QtZW52aXJvbiIgdG8gZGlzYWxsb3cgbG9hZGluZyBvZiBjdXN0b20gDQo+ID4gdGVybWlu
Zm8gZW50cmllcyBpbiBzZXR1aWQvc2V0Z2lkIHByb2dyYW1zLCBtaXRpZ2F0aW5nIHRoZSBpbXBh
Y3Qgb2YgDQo+ID4gQ1ZFLTIwMjMtMjk0OTEuDQo+ID4gDQo+ID4gVGhpcyBpcyB0YWtlbiBmcm9t
IGRlYmlhbjoNCj4gPiBodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL25jdXJzZXMvLS9j
b21taXQvMWM1MzBhYWQ3NzJmN2FlZWYwMzliDQo+ID4gODc4MGQ1MWNkMDliZDVhMDhhYw0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPg0KPiA+IC0t
LQ0KPiA+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5j
b20+DQo+ID4gQ2M6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXMu
aW5jIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXMuaW5jIA0KPiA+
IGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzLmluYw0KPiA+IGluZGV4IDM2N2Yz
YjE5ZjQuLjFiYzA3ZWMyZDQgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1
cnNlcy9uY3Vyc2VzLmluYw0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1
cnNlcy5pbmMNCj4gPiBAQCAtODcsNiArODcsNyBAQCBuY3Vyc2VzX2NvbmZpZ3VyZSgpIHsNCj4g
PiAgCSAgICAgICAgLS1lbmFibGUtc2lnd2luY2ggXA0KPiA+ICAJICAgICAgICAtLWVuYWJsZS1w
Yy1maWxlcyBcDQo+ID4gIAkgICAgICAgIC0tZGlzYWJsZS1ycGF0aC1oYWNrIFwNCj4gPiArCSAg
ICAgICAgLS1kaXNhYmxlLXJvb3QtZW52aXJvbiBcDQo+ID4gIAkJJHtFWENPTkZJR19BUkdTfSBc
DQo+ID4gIAkgICAgICAgIC0td2l0aC1tYW5wYWdlLWZvcm1hdD1ub3JtYWwgXA0KPiA+ICAJICAg
ICAgICAtLXdpdGhvdXQtbWFucGFnZS1yZW5hbWVzIFwNCj4NCj4gU2hvdWxkIHRoZSBwYXRjaCBh
ZGQgYSBDVkVfU1RBVFVTIGVudHJ5IGFzIHdlbGwgc28gdGhlIGN2ZSB0b29saW5nIGNhbiB0ZWxs
IHdlJ3ZlIG1pdGlnYXRlZCB0aGlzPw0KDQpuY3Vyc2VzIDYuNCBpcyBub3QgYWZmZWN0ZWQgYW5k
IG5vdCBzaG93biBpbiBDVkUgcmVwb3J0LCBub3Qgc3VyZSB3aHkgdGhpcyBpcyBzdWJtaXR0ZWQg
Zm9yIG1hc3Rlci4NClBldGVyDQoNCj4NCj4gQ2hlZXJzLA0KPg0KPiBSaWNoYXJkDQo=

