Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F42BC83005
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 09:58:12 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.54634.1686563886456442932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 02:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=fiNi135t;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1686563886;
  x=1718099886;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QnzKVnOGz56AHHp6xVx4zLnujfrSwFrRxRdf6O11R3U=;
  b=fiNi135t9nWhmgs4L+x5tcI9hYHJpcsG0kmMTJCNPr0i/TY3qccfUwHc
   7cTQTlE/h7/dky6VHmPk0i7K0IfHVWFqwplXBtM7YZNwNMVWqPDKx9ygC
   4MyhPpj8eczWdRDgh4dfirwEB8vYaFmotFYj7L5uTQovFupymX3GpGKoz
   DuWSOahw4MhWEBX3+tHXWd3w1Mh0ly3E2WzHPi153Fwve4H8YaT++pV4L
   MtJQBvzqUd4RRhhlMet/LHpdxxi0d/s6RrfYA1OAq6yDyLXh24vaiCM9I
   V4mG0CUh4BS6KHHhfCh7xGy7/+tYlns/vZ5cqIhRdtUa86/bTSaLioqI0
   w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJEfAnSrLveO9qONEG80JybhoDy/scVDDWCRd4ry9qxKNS2/MXVOI4EzR+mwfbmhp251maOKvdlnmKqLNdQnn1SU4zQuNLamKPcgAPBEZBVV5VCaj0DH6O8d80RihDUxL1KhXFMXHbxgTk5pYRICIyo8ZJIdFg86O4dAHwCj2qet7d5E+ykhLpAm3Uxxvn5DItA96kFFhawQd3t894E5L8xyXuqZhcoESM2TEih0Fun0PEubZo8Jh6VYj9oO8fgmP8YhY97bl8+81M6ED0OLYQojGWDI+dDNJUULuK99F1oXFhaPnK1HR9KOjJYRbqtrFTWdp/+O6luRB73xInwR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnzKVnOGz56AHHp6xVx4zLnujfrSwFrRxRdf6O11R3U=;
 b=AiH0fnAgvIRhkXtrtaVvSJWSdebRFRGMkubk8HNhjDoSRfswC0fOQvYIx1w2KyCBKLuOmXtDBL8Lz6niUOCfTxnYoIhM5XlrfNYPtS/GK/90z2xV99pmez1K4sS6KQ6uStrloXYhDNx27zPVEG3tCZ4H0EQYnUtWD1f/4pJw2+CFX5+AjobIuQBKQDB1CwyD+cUei4LXg3Aha14mnhvDVOERfl/Iv1T3plr7OgAx571rHHZ1UMLJSi/eyZglBXs3X4A5ZSibhflRELFCZaVazXnV4Rsz8mjqeecA+Sx3JqeadmVU+u5qu+Zqx+jzIkfYE5pDiNZizNsL39byc/OZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnzKVnOGz56AHHp6xVx4zLnujfrSwFrRxRdf6O11R3U=;
 b=M7LSrk/jZAnOLXF3Fq/o6RJRloqs2Ond36cJbSsQPQa2OjOosOBszr2w6/Q1SZCszRG11cXK9iIZq7dkzLSB+rJUsu01KDOKX5P9hHo/xf2efv/EQvo55r+H39zHJojD9RVf+y661EfZPwu2h8oAAuDIEzmv44GSa+TMt+h4J3M=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "rs@ti.com" <rs@ti.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "reatmon@ti.com" <reatmon@ti.com>,
	"denis@denix.org" <denis@denix.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 4/6] weston-init: fix the mixed indentation
Thread-Topic: [OE-core][PATCH 4/6] weston-init: fix the mixed indentation
Thread-Index: AQHZmzjx/G59YnmtU0CwX7A4Kek356+GHOLQgADKpICAAApcAA==
Date: Mon, 12 Jun 2023 09:58:01 +0000
Message-ID: <DB5PR02MB10213D04533C11ED783E5335AEF54A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230610011339.3716428-1-rs@ti.com>
 <20230610011339.3716428-5-rs@ti.com>
 <DB5PR02MB102136F50D6C9E9121C9FD08FEF57A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj99QKDuDc7oPaytFOUAeaiSL9y6WMT2Dmo5nLUTNNOLKQ@mail.gmail.com>
In-Reply-To: <CANNYZj99QKDuDc7oPaytFOUAeaiSL9y6WMT2Dmo5nLUTNNOLKQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB6607:EE_
x-ms-office365-filtering-correlation-id: 4adece1d-a6e2-4761-e99c-08db6b2b81ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zExLMgGzBCg1Ub/tJ7hf0Tn9UM7RZm6qKjOJ/ILNQcVfiYDQAZAjRdnsRQ6EDj6HTxHOcxRLABKsgV32ZE8Fe7GZBMpT2cElsC086oYvqR1feL5CKAC0s2rq7v8uOF5TdgkyTRqh9bXvvSXHEgtweXDssRkuBqMKVhwq6OQ1RpYIXxfMxHnW2NopBhrmgYre7iWSZQHGdGPZTIz8TjD6BYADCwKl57Z1zCkcyVP4uJfdUWL+9pkRV+UOYuM844t818l0CgR6nFDDiNMxbrXIR2lAmw+GzbyOY0J6i0zLCoQAvUlszVFBL4vh++OYSBAab5gTcC6xFWUrhIvaKj25yqzdVIb6A/TtGX0AogXcsQ3byXwvUw3cd/WGPJepZA7oWq4z7Y5YSGMCGtj2YJmBdsS5IIzsV0Gxgyg4hevo6E5W1/aX4G45Yi66aaoWr6X2MMYssPYqFKNSQFxt1tT73vNCTYDhcXPia8uUFs/ASn86KHXWbtfac4k8/J+aAZKB/RhHK972wpMx/NWf1NJK1p1iLh7SmYfprlxuYig+drADpwbZbTlyZuvif2Iq31W/OPRlVM2OkAmfbaPLWmmqOXBncVbB6MwtmfvtDgiPv3FsKY38sNoTB7XymXCgwn1O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(38070700005)(86362001)(33656002)(66556008)(66476007)(478600001)(54906003)(6916009)(4326008)(64756008)(71200400001)(66946007)(316002)(66446008)(76116006)(7696005)(55016003)(8936002)(8676002)(41300700001)(5660300002)(2906002)(44832011)(52536014)(122000001)(38100700002)(53546011)(9686003)(6506007)(26005)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjRidnhWRjlLd3BTeDFXdDFsWGtjTzR3TnhBQXhpbUh0SWplL2EwVE1iWVBM?=
 =?utf-8?B?cGNQQTFLaXg2YXFJb3dDUTA1U0NjWkNYL3FoNjUveWNwVDRXWkwrVkVBTEph?=
 =?utf-8?B?dkNKR1lSTXJndGFEeG54YTc5eFJxOFdLRmRLcnUzdEprQkhET2FsK1JkdWU0?=
 =?utf-8?B?NWhzRW1FUVZnejJkZnV0OG5WN2NncS9HMlFuVkZvKzZreE41U2gyUTZEYnlj?=
 =?utf-8?B?M3plWUhGdG04Vno5eDRKK0JlZDdxRUpwdEVLRFZUeFVOWlRCSFVLbHF5eWp4?=
 =?utf-8?B?ZzA4dTlXN0dFcjJpdnB0SE9abFJDTU1Dc2lJemQxbUdGME5PZjlValhlRmJl?=
 =?utf-8?B?RDFLQnNZc0prVzd5U1FRV3NOTTAwWVNVcCtGMzRJKzJ6VHpGZEkxaW5oSndl?=
 =?utf-8?B?V2orZHZoMUdickZWVWhEWW1uQWFJZ1VCL1dmTXhITGJtRnVWNjYwUm55cDJJ?=
 =?utf-8?B?SHVGOTdncEQ1WjhLRTR0dmU5UWlTOGVQTStyTlVUSlRKRUdBK2F5Mll3U2Fr?=
 =?utf-8?B?WiswaHRuN1p2NEVxMkNkaVlYaUhFZG4xM1JRN2ZWWUFlWE1RaDRvR2R5S1Mw?=
 =?utf-8?B?QUNYOGI4MXZ1aTZDLzZNVENvWVVUdm1Jc0VGb0lDM3czNmVhb0JQYmhQSjZR?=
 =?utf-8?B?Q2t2WTNPejR6RGhyRk1neExxcUhUMVkyNXk4MVU5eEdxS2RaTVlxaGp1cjJK?=
 =?utf-8?B?cnJWZlBSOWt1dEZGcnRocTdRemZ5V01DNC9YblZUS0grc1R5K1IvRzNhdU52?=
 =?utf-8?B?SlFQa25DLzAwS1lNZzdnbmJBbXZ4REpFUVJleUwxQlZEdEsyZkIvNHB6djBU?=
 =?utf-8?B?Y2lqeUFuK0hWcVJtK09lZE1TclNqUFNKb2s0VDRUbFJyVHlwTVFLK3ptdllJ?=
 =?utf-8?B?UjdnYmU0OTZMMEZPbGkyaCt4SXBvQk9pS0pCWTIxcjdGdVBTbVQ2OTg1SVpB?=
 =?utf-8?B?djhwVnFGbnZWSzFOUVJsOWpyODZmYUN1LyttSVlXbm9FUW9zd0VYZlpHMGVL?=
 =?utf-8?B?YkJqbCt2NStvTUw4THdKR1JPZnA5c2ZhV0xVWGpkUUZBVmFaYUpVb3RCMEU5?=
 =?utf-8?B?ZVFSeUxXNU5Ic0pERWt2cm41dlcrNkZKdG40Nm83Qlk5MTdEUy9IaWlXME12?=
 =?utf-8?B?TDUxUnlyVFpxbkJXWjJEbDcwSU5iR29QOU9FeXRQalduakxPQlRNUU5ydFQy?=
 =?utf-8?B?MDgra0d5L1BaMXFlRHhtLzJnZVEzZENaR3VUUkhJc3VZbkN3QlBaYThkKy9H?=
 =?utf-8?B?ekgrc3FXNmpHNXdEYXBYdWgrRTJlbFZiNlpkVENPcTY1citCcllIZXhPdlZD?=
 =?utf-8?B?ckNMSEszMzRhS0ZNazNFU2FSV0I4Ym1jS1lVT05rTWsxb3d1NXZlcUEyY0t4?=
 =?utf-8?B?a21FTzBQaDFabDFkanBOYTh1K0piQ3hQUUNvWXIrWnlxVG96akFkR2xOTzIz?=
 =?utf-8?B?akZRR0pXNjhxM3BYK2VOTlZBNzdEZ2NrREQ3NUtReXh5TW5JUHJTbEg1TVBp?=
 =?utf-8?B?dG0vc0FSa003ZVNHdXRDUjduK0NPVGpBQ0p1cjZLeWUrWFhabTRPMVZLS2xy?=
 =?utf-8?B?Tld2VkVPd0NRREpPT1RBcGJ3eG5CU254QmxVUnBnSWhRMXVzRys2WkhPWVVl?=
 =?utf-8?B?bFhod3Y2R1pIYlhiWk9LQ2I0MG16YnlzaVRSWHY0YkhnaEZlRHRqcDg2anFl?=
 =?utf-8?B?UXdmdmx4M3VsOTFIeTNSbEwvMk4xVnlvQ2ZyZ0FiUHVKYWRJRVdEeWRPdWpV?=
 =?utf-8?B?c2cySlJ0M2x4dVplUk9WWGQyU2pMSitQdkFvZ2dmVnRlVUJRTUZVYWY0Ukx1?=
 =?utf-8?B?aFRDVXF0ajk3UE5oV3ZvLzl2ZjBVVFpPNnUzVXJnWm1ub1oxbVcrUXhKNjVB?=
 =?utf-8?B?bFBEWWM5Mm04ZUZuK21CN2VHK0paMEdrc2E0YWJoTFAvUlZkMGNJQitjSm1M?=
 =?utf-8?B?dmViNHU0RTNwY0x1OVZJKzNHVUFPSDRrRHRUYmFaR09FKzE5OU1NcmZEVEht?=
 =?utf-8?B?QmV1MHRCRUJZejVpZzZOMUZ0bEpZcmg2VlNTeFFaYW9kTWFza1A1OVJVKzNV?=
 =?utf-8?B?VDBOckJ0L2ZCR2hjQ0FiYWlEdVN6anpFZFJnYWIwdmJZYU5CVG84VUJpSmlD?=
 =?utf-8?Q?e1Sc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adece1d-a6e2-4761-e99c-08db6b2b81ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 09:58:01.0741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNPeKU8N/Q+Zxtc+dW1FDQAD2tIq+4t1G7pduwvzszFlfMNyr+HLZnlmrrpMYqbP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6607
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 09:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182660

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDEyIGp1bmkgMjAyMyAxMToxOQ0K
PiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+
IENjOiByc0B0aS5jb207IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc7IHJlYXRt
b25AdGkuY29tOw0KPiBkZW5pc0BkZW5peC5vcmc7IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4u
Y29tOyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIDQvNl0gd2VzdG9uLWluaXQ6IGZpeCB0aGUgbWl4ZWQg
aW5kZW50YXRpb24NCj4gDQo+IE9uIFN1biwgMTEgSnVuIDIwMjMgYXQgMjM6MjUsIFBldGVyIEtq
ZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPiA+
IEkga25vdyBteSB0ZXh0IGVkaXRvciBpcyBnb2luZyB0byBnZXQgYW5ncnkgYXQgbWUgaWYgdGhp
cyBjb250aW51ZXMuDQo+ID4NCj4gPiBHZXQgYSBiZXR0ZXIgZWRpdG9yLiA7KSBBdCBsZWFzdCBm
b3IgRW1hY3MgdGhlcmUgaXMgYSBiaXRiYWtlLW1vZGUgdGhhdA0KPiA+IHN1cHBvcnRzIHRoZSBk
aWZmZXJlbnQgd2F5cyBvZiBpbmRlbnRpbmcgc2hlbGwgYW5kIFB5dGhvbiBjb2RlIGluIHRoZQ0K
PiA+IHNhbWUgcmVjaXBlLg0KPiANCj4gT3Igd2UgY2FuIHN0b3AgY2FyaW5nIGFib3V0IGluZGVu
dGF0aW9uLCBhcyBsb25nIGFzIGl0J3MgY29uc2lzdGVudA0KPiB3aXRoIHdoYXQgaXMgYWxyZWFk
eSB0aGVyZSwgYW5kIGRvZXNuJ3QgZ2V0IGluIHRoZSB3YXkgb2YgcmV2aWV3aW5nDQo+IHBhdGNo
ZXMuIFRoYXQncyBteSBwcmVmZXJyZWQgb3B0aW9uLCBhbmQgaGFzIGJlZW4gZm9yIHRoZSBwYXN0
IDI1DQo+IHllYXJzLg0KPiANCj4gQWxleA0KDQpXZWxsIHRoYXQgaXMgb2YgY291cnNlIGFuIG9w
dGlvbiwgYnV0IHRoZW4gaXQgbWF5IGdldCBtZXNzeSBpZiBkaWZmZXJlbnQgDQpwZW9wbGUgaGF2
ZSBkaWZmZXJlbnQgcHJlZmVyZW5jZXMgYW5kIHN0YXJ0IGNoYW5naW5nIHRoZSBpbmRlbnRhdGlv
biBiYWNrIA0KYW5kIGZvcnRoLi4uDQoNCi8vUGV0ZXINCg0K

