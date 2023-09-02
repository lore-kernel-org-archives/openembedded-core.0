Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FD4C83F2C
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 12:02:18 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.6759.1693656132682111386
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 05:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BsJ/twlI;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=NYc2MKUb;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1693656133;
  x=1725192133;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JWzRECyWUCcMB1DCTaUBvGW0vy4wQEtYw4maYoJ1MxQ=;
  b=BsJ/twlI77xdzLw3f3d4SLoA8IKLIEDmA76t1J0+hKdjyYMNQYh4aBf9
   7aCbKuQN2WxAMFo36IaDdRZU1uhnfs1ktqyknWfo8jGN45T0jMFJjEaSs
   Gw53oCCUK5KKqZDtfdRfVy2cPXGC6C+woukPf0hHBlEbg7l6dF2dGVAVi
   5AYnptNAJoLhOkXe6TLhN046ZXdeedIIOW7OLhA1Dozkq17PSh4UW9k38
   uEMngkk6JsM7PZGetTKU3+DgQBK89GHuHFPAx/FP39JwYuZjQ3rTsK3gq
   ej53mH9vgY68EV1EUfDx9aPYxdho+GLKqLyqWG3Cx7O0e3f/A30kM+R3d
   Q==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi4GGZuK9yfNEADtDlpAyrmT07eCfwd32Xkap/ka08Lm43acE3CBbpieyh/zcEQbv341eXD7YQkX6kpXbO0dKZ4gzZZusIRBxIPY0jVms2KHS4j5Nw+isHQ5BrwO9iY5cE57C8NEyrFaN4UhhdFTczGsQpgJg5G2w1SmkD/ya8zJPUCCnoiIJuTJwc47tSMY2no5b+kH0MuBIOmb/25F1D24vb/IdRRArp3K5vnsopLt5XLSWu6HFXUBoPRG4Rn2UgB6gfJKDJzbbycF7on2KW6B0e3dcwxz7gaXmHGUtbhKx0ouWOdB6gMHkodnAfAdBdSikgFIPTgW74A+gtPDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWzRECyWUCcMB1DCTaUBvGW0vy4wQEtYw4maYoJ1MxQ=;
 b=R9XoSy3NrMuMPb30+Q0YN2RqY67gMYbe4GU2MYuTB23w1Q6M3iY4QTmKSXSpAzV53iww0RVDrq7W45sTLK1zRpgwdh3sVpmWv7J2Uqa+fiYfRK4VXHQb7PHCOHbulVh6c2jGaaXr4yaNjdWmy16ru4sGk7IDUjZGDv9HDS/p3osTKrXEtXK8mEA0J0lXzkBfQBFDl8YjfDvfzE+M6os9DDXnz2Kb1c7JbtzEsLAZ0axIIwUIH/3lhOtlS7g1/Z6eeWeTdylqqyvr4vBYXcfJ+b9CxRgwdtuk2cbuW6vDFA+mg41q8XgFqsO7/B8OtNTN/P7yqxvls7lroIkGJnPdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWzRECyWUCcMB1DCTaUBvGW0vy4wQEtYw4maYoJ1MxQ=;
 b=NYc2MKUbakJkmOXrgOCtpLU4GBVWM0RpqgMP7Nq992sbRZAc9zxInlWECiuXuVzpABDfoH9m+C9dvgjWTZoj4nHeAfHB0D/WMmfFTJpCcqRnA2l4j+oZIx5DQKe74MSOLVaBtSOC1qkqiQsLyu8LzPfOfJfUF1JXwBZCzT+nPZI=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
CC: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: RE: [Openembedded-architecture] Changes needing documentation - a new
 procedure
Thread-Topic: [Openembedded-architecture] Changes needing documentation - a
 new procedure
Thread-Index: AQHZ3W3mNy88E/7mLEuTNTVQs2X3VLAHbsNA
Date: Sat, 2 Sep 2023 12:02:07 +0000
Message-ID: <AS8PR02MB10201153E245BA2D5E55AB80CEFEBA@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <721109e496c7c5e0459812f86feaae87fed38ee9.camel@linuxfoundation.org>
In-Reply-To: <721109e496c7c5e0459812f86feaae87fed38ee9.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|DU0PR02MB8189:EE_
x-ms-office365-filtering-correlation-id: 6188ed6a-376e-429e-9d27-08dbabac6e49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aFqpfc7Qpv7YB+W/6AK93sPUKHCwa/2Vsb11unem3jIKiVWi6KuQ+BCxv5Mbsj+qo13xQia9ZDwXy/Ik+EQAOvy2es89B/W48aXrKGqBfMCeBsbLd65xaPXtLRBDrp5tkP3KTLNa4Wt+DgsMVnevCi/MGrrzJ2WSgn+T/BIK4+Q6fL2jDwMvHZL5crmY2HC2BjpBCkLdZFdzHPeM612e/7tOD3167hcJFE7VXTT3UKfBqD8JatLzSv4izWy2DJGRqFLkvBlkZZN1p0IIuRhD71dyF+tbAkJWftashs2oOYCFHjkrVf7wIJHPtBIOp11CNfW7u/5PXRWnkVXMjBukYA7Jdx4EVxquS/fnXfWOXo9yYlUcy2anXo8qMed0xpDHaNVTC4pb8CYBvwBY0rODNGVIJllYXvK1/pI6LCmbQtPaZlsUAVXpx5fFsgiPbtBhrbHFrhMjn4wwK0gp/5TN0YA9BRpjQxQCRSHsUKZop4cRi2xJRce/e8mrg61x/qc+vUQPHlsBF54Usy1E8KwCeqr6hWj9SeIMIZ/Z9OgG96onyJiDE7ms7nVUqE6fO0CWkJNMSYKsfzEM2S51JXy6BY+So9gZoflQDTbfJJL00WKILvSxb18RBtJsKw+6EZ9S
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199024)(1800799009)(186009)(5660300002)(83380400001)(44832011)(26005)(86362001)(478600001)(33656002)(53546011)(9686003)(7696005)(6506007)(71200400001)(55016003)(122000001)(38070700005)(38100700002)(52536014)(8676002)(316002)(8936002)(4326008)(41300700001)(66556008)(76116006)(66476007)(64756008)(66446008)(110136005)(66946007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlIrR0Nna1RtWVlyc3dkNmg0ZzZnYXRmbno2SmY5TVNSZXZJU1B1ckt5Si9J?=
 =?utf-8?B?ZC9kYk1LWGlXYU9XSGpkaWhUc25FYlpIYS8rd3FQelQ0a1NsbXIrQ3RQQWh2?=
 =?utf-8?B?dUUya2VKQ3RaWFU5S3JQdHlQaEVRNk56Um01NEsvcVZZQ09hM01nSmFxQ0FN?=
 =?utf-8?B?Tm9kbXB4L0F3WVBYaXM2MTlicDEwZzRsS2FBTEVvSmtjVUJVZjltaGNQSXN2?=
 =?utf-8?B?bDE0Q1FlL2h5WmU1L3RuYk9YVTFzWXhKZWhCYnBJbjEwZFdZZ1JjQmlMSW1J?=
 =?utf-8?B?V0wzS29LTVJybWFoU283M3NYWDZkSWRmSWE3RW5kb0pNZWdRV1NETDhyNm5x?=
 =?utf-8?B?cEhIT3dsN1ZmVzI4Ly9WKytHTk5iV1Y2bFpqSUhDMmpCYXA2YzRpM012SWtL?=
 =?utf-8?B?NFFmMENST2dEY1YyOGtoWWRxaC90SzVPUTRyM24xUDdjWkxjQ29qMVN3UkEv?=
 =?utf-8?B?aG9YZjU2OWpoRXdaL3F4YlQ3SXRHbitjdURnTHNTR05pZHRzbHhseDZXSHFK?=
 =?utf-8?B?M3B5NGFkWUVhcnpWYVhQaERpelNBRS9yZVNGNTRLL3ZzWW5qaWlDVUVVd3Jz?=
 =?utf-8?B?NnNQb05FdlA4K3lnVXkzbnpyU21aMjI3THRmRnNQdEhvTytLdXBFcGtyVVZD?=
 =?utf-8?B?akZYS0FDaXlWYUR5ZHJkOW9JUi9hYUR4NGJ5OU40a2Y3ZkNweEZ2ZmhxNTR2?=
 =?utf-8?B?UDVUREZrQkNNa2dkMXFYVmRPTkFvRXRCMmZXMklQR2VXU3ZqOUJ6STJPWERk?=
 =?utf-8?B?Z0VnQ1JVSHlkR3NUVjVidW5CSjdMUnd0dVplM05YZ05KR21EeUJXYm1JeVJw?=
 =?utf-8?B?Z3UrSzUrRllzbjU4QkFaWE5TSnRZQ2Mrb0kzd1dlQWpXUjZyc0pBZ0c3dk1M?=
 =?utf-8?B?Z2RkYW5SVktsdkVUbjVWY21pTFllYnRMTUp6a2IweWNQaGZrbGdwcEhIaS9R?=
 =?utf-8?B?cms3Mk45Zm5zMVR0dmFRaEl4WWNrZmpOa3hKeTZ1LzZQSit5akRMSVdaOHlH?=
 =?utf-8?B?ZmhQRWI5c282TGpoTHh4RDN4UmQzSisvLzM3dUhlZGNxM0UzNTFFUk0xMjVv?=
 =?utf-8?B?L3lkZVNGdSs4L1pNai9lZkUybmFSRVRhNFo1Mmo4UlN2d0ErdHYvNjdWSXk1?=
 =?utf-8?B?M3FpMVRoTEhsWmE3aG5nQ2lYNUFuelZrckgzL2lOR0U3U3ZMb3cxUVI5YjBy?=
 =?utf-8?B?QjBoNnVrMUtPRjlva1Z6R3R4L3kzZDNoU0h5Q0d4TXUxbTNKUFhUODd3YlRI?=
 =?utf-8?B?V1FyTlB5bkdIemhLajJsSGlnTVE5d3RGVk1paG9rVHIwQ0VCeitKV200R0VW?=
 =?utf-8?B?QjN5eGNES1RqcGtNcVViVURWbkczUXJsTlNHSTAxcXJyenVWWHIrR05JNkty?=
 =?utf-8?B?T1IwK1Bnd2pUNjVqZWxRZlBtTEFPWmRqRkYrU3dmN0dFckw4bDBrbDJJRXUy?=
 =?utf-8?B?dWpBUkZwOWRYaTBtWUdKTFZPRmJjTE1Dei9LaFJ4dUx5UkxCRTR1VGtaMHFG?=
 =?utf-8?B?UEI0Uk5iK1VGQ1EvNTJzUzVjcWNmU3hQaDV2cUJiR0VNZFVPL3dWNnpjQ1dG?=
 =?utf-8?B?VHRXOWxYYzRnUEFGY3prbjk5a0J2Z20rUFFUNXNKSWwycEhCKzJheWVXYlFi?=
 =?utf-8?B?S29wQ011akdJOHVEVEFSeHhmcEZQdkw1Mm9td2FsMFRERXNJdFBpcmhCT2tv?=
 =?utf-8?B?SXNjVElKaS9mRVlIQ2p3WGVUbmtqWW5wbnNQaTQvVHVWNUFQTmMwNEVZeVRF?=
 =?utf-8?B?Y1MyVVNwbENTenpwVFpWMDYyK2UyOWtPSERFWEwzT1had0dHRWF3SHZld0Yy?=
 =?utf-8?B?eE9GQWczR1A0YURwRWlNb05GaDRRZnh1VkxHZUlZTkNobGt3MmJDSElQNndD?=
 =?utf-8?B?QkhVL2dvenU4WTBlL2NWVVhmR1FPcklhcWZBaHV0QUZ1WFg3MVdqaFpRazEx?=
 =?utf-8?B?MFRpN2M2OWR1a0l3U1dzcWJqTzZTZFQ5STlqU1VlNWZuczZ3N1c4RWN4Z0Y4?=
 =?utf-8?B?amRrdERzOUowNmlzK3dGSzVPRmZldDhTaWhuQTJWZThkNk1YUURMckk3N2Rh?=
 =?utf-8?B?MzUrb3ZNWlF1T2pNTjhEcGZTRXlrQS84RkkvUGhlK0gxSXJnMnpRMXlVL00v?=
 =?utf-8?Q?zIOw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6188ed6a-376e-429e-9d27-08dbabac6e49
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2023 12:02:07.6035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jxt/mHaKbd/6MiQvU0QSnNcDk/UYOgMoSWyybhMwO28545jHUs345PhjnamTaiZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 12:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187149

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtYXJjaGl0
ZWN0dXJlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gYXJjaGl0ZWN0
dXJlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0K
PiBTZW50OiBkZW4gMiBzZXB0ZW1iZXIgMjAyMyAwOToyMA0KPiBUbzogb3BlbmVtYmVkZGVkLWNv
cmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+Ow0KPiBvcGVuZW1i
ZWRkZWQtYXJjaGl0ZWN0dXJlIDxvcGVuZW1iZWRkZWQtDQo+IGFyY2hpdGVjdHVyZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPg0KPiBDYzogTWljaGFlbCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVu
YWNrZXJAYm9vdGxpbi5jb20+DQo+IFN1YmplY3Q6IFtPcGVuZW1iZWRkZWQtYXJjaGl0ZWN0dXJl
XSBDaGFuZ2VzIG5lZWRpbmcgZG9jdW1lbnRhdGlvbiAtIGEgbmV3DQo+IHByb2NlZHVyZQ0KPiAN
Cj4gSSd2ZSBiZWVuIGNvbmNlcm5lZCBmb3IgYSB3aGlsZSBhYm91dCB0aGUgcHJvY2VzcyBvZiBh
ZGRpbmcNCj4gZG9jdW1lbnRhdGlvbiBpbmZsdWVuY2luZyBjaGFuZ2VzLiBPdXIgZG9jcyBhcmUg
aW4gYSBzZXBhcmF0ZSByZXBvIGFuZA0KPiB0aGlzIGRvZXMgaGF2ZSBhZHZhbnRhZ2VzLiBUaGV5
IGRvIHNwYW4gbXVsdGlwbGUgYXJlYXMgb2YgdGhlIHByb2plY3QNCj4gYW5kIGluIGdlbmVyYWwg
dGhpcyBkb2VzIHdvcmsgd2VsbCBmb3IgdXMuwqBJdCBkb2VzIG1lYW4gdGhlIGRvY3MgYXJlDQo+
IGNvbnNpc3RlbnQgYW5kIGhhdmUgYSBjb21tb24gc3R5bGUvdm9pY2UuDQo+IA0KPiBFcXVhbGx5
LCBpdCBpcyBoYXJkIHRvIGFzayB1c2VycyB0byBhZGQgZG9jdW1lbnRhdGlvbiBjaGFuZ2VzIGlu
IHRoZWlyDQo+IGNvbW1pdHMgYW5kIHRoaXMgbGVhZHMgdG8gdGhlIGRvY3MgaGF2aW5nIHRvIHBs
YXkgY2F0Y2h1cCBhbmQgcHVzaGVzIGENCj4gbG90IG9mIHdvcmsgdG8gdGhlIGRvY3MgbWFpbnRh
aW5lcnMuDQo+IA0KPiBXZSdyZSB0aGVyZWZvcmUgZ29pbmcgdG8gdHJ5IHNvbWV0aGluZyBuZXcg
d2hlcmUgSSdsbCBhc2sgcGVvcGxlIHRvIGFkZA0KPiBub3RlcyB0byBhIGZpbGUgaW4gT0UtQ29y
ZSwgRE9DUy1XSVAgd2hlbiB0aGV5IG1ha2UgYSBjaGFuZ2Ugd2hpY2gNCj4gbmVlZHMgZG9jcyB1
cGRhdGVzLiBUaGlzIHdpbGwgaW5jbHVkZSBjaGFuZ2VzIHdoaWNoIG5lZWQgYSByZWxlYXNlDQo+
IG5vdGVzIG9yIG1pZ3JhdGlvbiBndWlkZSBlbnRyeS4gVGhlIGRvY3MgbWFpbnRhaW5lcnMgd2ls
bCB0aGVuIGtub3cNCj4gd2hhdCBuZWVkcyB0byBiZSBkb25lIGFuZCBob3BlZnVsbHkgaGF2ZSBh
dCBsZWFzdCB0aGUgYmFzaWMgaW5mb3JtYXRpb24NCj4gdGhleSBuZWVkIHRvIG1ha2UgdGhlIGRv
Y3MgY2hhbmdlcyBuZWVkZWQuDQo+IA0KPiBUaGlzIGlzIGFuIGV4cGVyaW1lbnQgYnV0IGhvcGVm
dWxseSBvbmUgdGhhdCB3aWxsIGJlIHN1Y2Nlc3NmdWwgYW5kIGxldA0KPiBvdXIgZG9jcyBjb250
aW51ZSB0byBncm93Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQpJIHdvdWxkIHJl
Y29tbWVuZCB0byBtYWtlIERPQ1MtV0lQIGEgZGlyZWN0b3J5IHdoZXJlIHlvdSBkcm9wIG9uZSBm
aWxlIA0KcGVyIGNoYW5nZS4gVGhhdCB3YXkgeW91IGF2b2lkIGFsbCBwcm9ibGVtcyB3aXRoIGNv
bmZsaWN0cyBkdXJpbmcgDQp0ZXN0aW5nLCBpbnRlZ3JhdGlvbiBhbmQgY2hlcnJ5LXBpY2tpbmcu
IFlvdSBhbHNvIGF1dG9tYXRpY2FsbHkgZ2V0IGEgDQpsaXN0IG9mIHRoZSBwZW5kaW5nIGNoYW5n
ZXMgYnkgbGlzdGluZyB0aGUgZmlsZXMgaW4gdGhhdCBkaXJlY3RvcnkuDQoNCi8vUGV0ZXINCg0K

