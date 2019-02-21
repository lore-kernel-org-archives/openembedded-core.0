Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 24471 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Feb 2019 20:55:24 UTC
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
	by mail.openembedded.org (Postfix) with ESMTP id 983D77C61B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 20:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CY07gGZhHRShjY4++BOBA1B6hnZ/j9VGKRorRWHceFQ=;
	b=4LMyPPVgZ38b3/RN98Sjx03zKbh0NRKvyJhRjlWZXt62OoVdmDicKzRa/sdxTZIW9VmwOzn6d33tLsZq65LkzyfppzqRqbR8k4EmyRRYQx/13xDuOFRD/lDDgfs+VuXhjlD/e6NCC2/CPDLNvX/M2BFeqX14NSH0ErthYC26sEo=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB5208.namprd02.prod.outlook.com (20.177.124.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.19; Thu, 21 Feb 2019 03:53:26 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::618e:ed5f:30ab:ad8b]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::618e:ed5f:30ab:ad8b%3]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 03:53:26 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Philip Balister
	<philip@balister.org>
Thread-Topic: [OE-core] [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way
	to provide external dtb
Thread-Index: AQHUyXI75r3YpIHqLUuVfrdaM0EPXqXpno6A
Date: Thu, 21 Feb 2019 03:53:26 +0000
Message-ID: <BYAPR02MB6005A0C02E838863D370C7B4B97E0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
	<BYAPR02MB6005274C95E7FE6ACA65292DB97C0@BYAPR02MB6005.namprd02.prod.outlook.com>
	<6fe6cbadaf29e01975ec71a1b005d2fdb7885484.camel@linuxfoundation.org>
In-Reply-To: <6fe6cbadaf29e01975ec71a1b005d2fdb7885484.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb7c84b2-75a5-42a0-fd1f-08d697b02244
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR02MB5208; 
X-MS-TrafficTypeDiagnostic: BYAPR02MB5208:|BYAPR02MB5208:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCWUFQUjAyTUI1MjA4OzIzOlJ0MnhoMCtVZ3Nta1IrR01NY0dzc0VhSlhO?=
	=?utf-8?B?TmVjeHFzMmo2ZDh5RjUxNFBHa3FGOUl0b0JQMnkrUit6cDB6aXRNMEsrRFNK?=
	=?utf-8?B?TjB6aFFVUE1OSGVGeXZ4Y21VdmlGRkdDZDROak43TVdwejlUU25iRlZmODEw?=
	=?utf-8?B?aVU1UmZqdTkybWEyUmZKRDhSZXZKTVllODE2Z3RvbFVVQXZHckVYU2xoUURN?=
	=?utf-8?B?aEZlbUNuSm5kbUJnMzlnMHl2aEFtSFdGVVhLSERKVFRqbkFkNkUxeGMwakNQ?=
	=?utf-8?B?ZlR0SVZKTFJ0bG5hZlo5a2FqMDVHdE1QTHFlNHgzWlFHeXlzVVdJODVvUWFp?=
	=?utf-8?B?WVdEaGxvVTllMk9rVVo4SWlaZGFkR2M3aXdjd2xiTm9sVllPTk0zNGZ5cHFo?=
	=?utf-8?B?dlBBcFJOQVBBcHpiN3U2cFo3bm5jeHh0ZUxOOG5PYnY3b0JKZ1cvVFZLc1gv?=
	=?utf-8?B?Y0NnSi92TElWaE9kZEY2T09aRVdoYnBFUnpjL2g3ZG1sSzlibHVrVk9NUU5w?=
	=?utf-8?B?MUZVMHZQTGpqYXU5L2E2T1QwNW5mbEtEeHdhbFpnR1NxOVNUT1dCWjFRVFFS?=
	=?utf-8?B?blhHTmpiOEFOcmtBWlF0aFlPY3pDazdOa0FwSVVLaVFSalhoRjVmTUVJbDRR?=
	=?utf-8?B?R0Rhb0U1WFpqeThscjZTNlYza3I1TnlhMkFIOENzT0Vab1FQTjJrejdYY0xy?=
	=?utf-8?B?c3QyZmg3aENLcFpReS8waW51U1cvNS9MMlZkUGkxVkhVSXZjU0Ywb3Y1OUw1?=
	=?utf-8?B?Zi9UMHBLeWM4UHBLZFE0bXhnQ0FYYkdmdXNYWFN0QUs2djd1YzdkYUJFeEZY?=
	=?utf-8?B?dE1wNFN6ckV6TDAySUVZV2NPMFN0U2JsSUVlL1JoNkhkcWlRN3A0V2VvV2gr?=
	=?utf-8?B?NkpBRjhRS1dvRXF1WldvUU91MFVCTHJtdnphS1RDYnNQODNxTlBCSzV5dGV2?=
	=?utf-8?B?ZDhEb0ZTWk1RSkRRVHkrRXdCTVIvS1JGdUpDT0owS0wyVjV5L3BIUnFPbjFh?=
	=?utf-8?B?VWFyL0VDeGl5alRxVEViZVBwbUExNzNwQks3MU04eUxZVHZmTitjUDdzTWJI?=
	=?utf-8?B?YTYxVXR0a3pXMVkzeHljS1YvY1Nid2ozVXdRZU5DbmgxdkU3UGlOdEtqclJr?=
	=?utf-8?B?cm9rVDNoRnp0aWZCcHQxOXBCWlcwT1NkaDhrbkNuSmxZZ2JrNzM2d3AzcTI5?=
	=?utf-8?B?c0hnQzYrYjYwUlVPa1ozUjRlQ2hGT09QYjBLcFQ0SkZtdS9GUkY1R24wdzE5?=
	=?utf-8?B?Z2pnMTk2NThYNXdCbnJoVThEeWUvUXdIaitaMHlLOG9UWjRxTWkrZE13eXVs?=
	=?utf-8?B?TGlvMi9aWVY0aTRWT1U4STVmY1E2QjEvMXZPNStHR1MxbDNaenpZQjdYYkY1?=
	=?utf-8?B?cDJBOUFMVG9pQ21USit2SmpXUDY2aG9SbVY1TitlSFdHbnRHaVFlTm1qSi9K?=
	=?utf-8?B?WTFQSnd3YXZSZ1BvdFE5UUhlL29IL1d1NWJTNTJMM25sZFdEYTliTEc1ZVBT?=
	=?utf-8?B?em9yWXdkL0ZXTDI5UTVnK1lkcXl3N1lUSjVaUDhJTDRMMVVQWmhUVDhyeUdO?=
	=?utf-8?B?dkdXRkxjc2V2OHFYNjI2RWxidjJ4ZkxSOHFjZXF3RUkzVnpoMkFmMDlpYW1y?=
	=?utf-8?B?WWhWeitFaTlwaUc1d0VoaE8yWkpwSDZIZzNEemxCWkF6RytaR0NLS3Bjb0Y1?=
	=?utf-8?B?djZQK3F2MW55OW4wSCtZbExrMUw0TjBZcFhiWmI3Sis2YmFGZGUwempHcjds?=
	=?utf-8?Q?epJdFzx/aOQLD4yFFO6tIF0F+ThVrdJfl+4hc=3D?=
x-microsoft-antispam-prvs: <BYAPR02MB5208754BD3BE7B47F53B15F8B97E0@BYAPR02MB5208.namprd02.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(376002)(346002)(136003)(39860400002)(189003)(199004)(13464003)(68736007)(316002)(5660300002)(476003)(25786009)(66066001)(6246003)(81166006)(53936002)(81156014)(2906002)(8936002)(14454004)(4326008)(256004)(478600001)(71190400001)(72206003)(3846002)(446003)(71200400001)(6116002)(14444005)(186003)(11346002)(86362001)(486006)(105586002)(305945005)(76176011)(33656002)(7736002)(53546011)(106356001)(102836004)(6346003)(6506007)(26005)(99286004)(55016002)(229853002)(9686003)(8676002)(6436002)(74316002)(110136005)(97736004)(93886005)(7696005)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5208;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GDRRMKy7XWPuuIaTA0b2vYM3RjiPIDlVscaCWxRcHYMYq3qsGuDBpALw2mdGPgBa8paZKO1jGbNqoGrz1RVGKHnPaRlAH+Yom0dkZSitWxVmSJ0uq9ZzIv15Rxqd6o0R94GFcb9Sgb1P9ncBx0upqLdSPJqdw54ZcuouvkLbK1gnPzo2D4tnSjnDM9OjLW0ZgiAlvNcUbDnwyuswbx2nrA1a1rD1sHzK4mkvtuBM39cepC8NwzaMLyKlAnR/TSdDpIjVS8UBDHmFHk4MWDCRKoxt4ncoBynToZ8i4+cM/FP/M91K28nZoqe1Qy2G0bhDPoKTOoGHfdqezgWLVNScHpndVknosPoUXTs48yvixu3cxjQakX4xNhfCLcJ8GpwDqkt8eqQf6E9VPa0aKJYQiIiEUS2hrR4u5bj8LVc1ehI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7c84b2-75a5-42a0-fd1f-08d697b02244
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 03:53:26.3107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5208
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5208;
	23:4mA6CqRbmuiSbguHtnhxrLs0bGYFhVBkdlUZPwP/lZmtXjMKivkiTBUEIW6adIyY1oOlPzg6pfr1aL1Uck4w2dqfSaJRY6vZT9Jvq7KicqiV/TIZtj1ZKe5HIQgLPzaEcsAwauPHMOb4rvU+beph1Q==
X-OriginatorOrg: xilinx.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2019 20:55:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNo
YXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+
IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjAsIDIwMTkgMzoxNiBQTQ0KPiBUbzogTWFuanVr
dW1hciBIYXJ0aGlrb3RlIE1hdGhhIDxNQU5KVUtVTUB4aWxpbnguY29tPjsgUGhpbGlwIEJhbGlz
dGVyDQo+IDxwaGlsaXBAYmFsaXN0ZXIub3JnPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmUgPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDIvMl0ga2VybmVsLWZpdGltYWdlLmJiY2xhc3M6IEludHJvZHVjZSBh
IHdheSB0bw0KPiBwcm92aWRlIGV4dGVybmFsIGR0Yg0KPiANCj4gT24gVHVlLCAyMDE5LTAyLTE5
IGF0IDE5OjM0ICswMDAwLCBNYW5qdWt1bWFyIEhhcnRoaWtvdGUgTWF0aGEgd3JvdGU6DQo+ID4g
SGkgUGhpbGlwLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
RnJvbTogUGhpbGlwIEJhbGlzdGVyIFttYWlsdG86cGhpbGlwQGJhbGlzdGVyLm9yZ10NCj4gPiA+
IFNlbnQ6IFN1bmRheSwgRmVicnVhcnkgMTcsIDIwMTkgMzo0NyBQTQ0KPiA+ID4gVG86IE1hbmp1
a3VtYXIgSGFydGhpa290ZSBNYXRoYSA8TUFOSlVLVU1AeGlsaW54LmNvbT4NCj4gPiA+IENjOiBv
cGVuZW1iZWRkZWQtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggMi8yXSBrZXJuZWwtZml0aW1h
Z2UuYmJjbGFzczoNCj4gPiA+IEludHJvZHVjZSBhIHdheSB0bw0KPiA+ID4gcHJvdmlkZSBleHRl
cm5hbCBkdGINCj4gPiA+DQo+ID4gPiBXaXRoIHRoZXNlIHBhdGNoZXMsIEkgbWFkZSBhIGZpdElt
YWdlIHRoYXQgYm9vdGVkIG9uIHRoZSBtaW5pLXplZC4NCj4gPiA+IEl0IHdvdWxkIGJlIG5pY2UN
Cj4gPiA+IHRvIGluY2x1ZGUgYSBub3RlIG9uIGhvdyB0byBlbmFibGUgdGhpcy4gSSB0b29rIGF0
IGZldyBzdGFicyBhdCBpdA0KPiA+ID4gYW5kIGVuZGVkIHVwIHdpdGgNCj4gPg0KPiA+IFRoYW5r
cyBmb3IgdGVzdGluZyBpdCBvdXQgb24gbWluaS16ZWQNCj4gPg0KPiA+ID4gUFJFRkVSUkVEX1BS
T1ZJREVSX3ZpcnR1YWwvZHRiID0gImRldmljZXRyZWUiDQo+ID4gPg0KPiA+DQo+ID4gWWVzLCBJ
IHNob3VsZCBoYXZlIGFkZGVkIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBJIHdpbGwgdXBk
YXRlIGl0DQo+ID4gYW5kIHJlLXNlbmQgVjINCj4gDQo+IFdoYXQgbWF5IGFsc28gaGVscCBhIGxv
dCBoZXJlIHdvdWxkIGJlIHNvbWUgdGVzdHMuIFRoaXMgaXMgY3VycmVudGx5IGEgYmxhY2tob2xl
IGluDQo+IHRoZSB0ZXN0cyA6KA0KPiANCkFyZSB0aGVyZSBleGFtcGxlcyBvZiBoYXZpbmcgdGVz
dHMgb25seSBmb3IgYmJjbGFzcyBpbiBPRS1Db3JlPyANCg0KV2UgbmVlZCBhIHJlY2lwZSBvciBj
cmVhdGUtb25lIHRvIGluaGVyaXQgdGhpcyBjbGFzcyBhbmQgcHJvYmFibHkgYWRkIHRoYXQgYXMg
YSB0ZXN0Y2FzZS4gDQpJIGFtIG5vdCBzdXJlIGhvdyB0byBwcm9jZWVkLCBhbnkgZXhhbXBsZSB3
b3VsZCBoZWxwIHRvIGltcGxlbWVudCB0aGUgc2FtZQ0KDQpUaGFua3MsDQpNYW5qdQ0K

