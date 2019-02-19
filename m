Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 7482 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Feb 2019 21:07:52 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780048.outbound.protection.outlook.com [40.107.78.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6827C662
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lOBjEx22g82R9zOYB0+tBL38ZMRmfi/JevGmX26SXhU=;
	b=CqJnTbrZ/VEiUKNgCMwhvl3B7Ry05pAQ/sa+dzO9Nhg9YA0q84wn8Dk+/bC1btFKhwsl+kMcVXxlx2O9L8LrOrWoheA/vLJ3lIoo1M7BmTxzPsgYw3SQKq4+bmLbESh6PmhiT1hiZWe5mF4o6X0xI0+h8OcKJulEpTSG47SgynI=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB4247.namprd02.prod.outlook.com (52.135.203.159) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.18; Tue, 19 Feb 2019 19:34:42 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::618e:ed5f:30ab:ad8b]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::618e:ed5f:30ab:ad8b%3]) with mapi id 15.20.1643.014;
	Tue, 19 Feb 2019 19:34:42 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Philip Balister <philip@balister.org>
Thread-Topic: [OE-core][PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to
	provide external dtb
Thread-Index: AQHUxMlUMZsb5uQ2+0mQ/ONikT6WoqXkrKQAgALdvjA=
Date: Tue, 19 Feb 2019 19:34:42 +0000
Message-ID: <BYAPR02MB6005274C95E7FE6ACA65292DB97C0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
In-Reply-To: <679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c353143-6731-4434-4dcd-08d696a14bce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR02MB4247; 
x-ms-traffictypediagnostic: BYAPR02MB4247:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCWUFQUjAyTUI0MjQ3OzIzOlBidHNCd0xuSkxLTFRUTzZxL0ZnTXIwaE9W?=
	=?utf-8?B?NGkrbHEzOVNjWThmU05uNUloaEorSUdUMHdkQ014NWw5VmtLdlZYSXkvUlVh?=
	=?utf-8?B?SzdKamltZnV4ayttbzBuN0NiN3ppRXEvbzJvTGhwdzZqemNSUmxZSHFPeGU3?=
	=?utf-8?B?WXpjUi9XUTZOWkRqZjNEQnc4L0xrNlRYcVVBMmd5RjlpaTkwdG8rTnJQdkNG?=
	=?utf-8?B?Q2o4L1p0TWFhNGdkZ09LRVpTc2x1RTRZUXM5NFV6aVJqS09xL3FnRFRDWFkx?=
	=?utf-8?B?VmNCY0JWalpZcGFQT2ZEa2hQdC9BeDBSVE1rSWdTSkVBdFgzdGRnd0tuSS9C?=
	=?utf-8?B?dzF3OGQ1UURzVmRXbWppWGRvZXF1RjBDZzFUZXRSNktCYUtJaWYwMjM4c0Mx?=
	=?utf-8?B?WWZtMmthOURneVBsMjZsRWNqaVJUbzdPVmowNFd5MTR2MWcyQTRUa1N6LzF6?=
	=?utf-8?B?T3JiQnVTZDFOS2FNdlo2bVNscXhObWE5NlZKNnlxM1FxLy9OMEdPc0s4THNr?=
	=?utf-8?B?N1pnK21jT291dUxjNHBrNU5QS1luQXZOdU9RMzFzeXFGYlQ5aW1iaFh0VDg1?=
	=?utf-8?B?Y3RkTzM1MDRiN0xvTFJQaE5XYXphNU04MnNyaW1Ud1dZb1piMHFoY2ZtK0hW?=
	=?utf-8?B?OE5wSktHR2tiTG1Ya0xKbm1KTDdEandmaTBuMW5IRFRoOXVKS24xZ3d2T2tE?=
	=?utf-8?B?REl4SUd0emExUGJDZ0FrUkN1WmIvVmNsUHBkMHcwK3VlaWM2T2VmRlF3b3Yx?=
	=?utf-8?B?TVplc2Ywb3RCSWJDcDVzQzI5RG9vU2xYWTVNbVpjb0UzRWlqWGF5Z0s4YTV1?=
	=?utf-8?B?TEl1REVTcVpLM0tJL0lmd0tyUk1TeVM5QXlReXVRdFhjLy9iRVp4ejZEUzk0?=
	=?utf-8?B?OUFRU0lWTEc3ZlVHcnhWNjhEVFZPcitaSDNuL3lrZE9JT2lnNm1PODIwQlU3?=
	=?utf-8?B?WGF4Wlg0eHBQMHZGNFJOY0h5bVNnWnFwUVd1bU1EN0N0dVNmbm5Cek0xM0xr?=
	=?utf-8?B?eUs1NzBPSE1GaSt4UTAyV0NBWXRGVkxkSWpqdUFYNU80Nng0TDBCREdaSWZQ?=
	=?utf-8?B?RlZhTUZVWGxxOERuQ0FjbVh5S0hCWDIzSWdHM3hjWXFUNzcxcGtjcy92UHc1?=
	=?utf-8?B?OU4zM0oyZzhYV2h6UHJuMVpwVi9vSHl6VVdJREFJQlJuMm5FREhId2FHV3FF?=
	=?utf-8?B?MTFSLy9OY20xK2lMcnpkUDU0YTJseitiY1NDbjFCdkJ4NHNvalB6STI4QndJ?=
	=?utf-8?B?Q1ZtWWJaelRkVEdjTitoM0JOYkoyQWl0VWVQWmgyeEZ5R2liRzJ5R05MNFg0?=
	=?utf-8?B?dzU5NmxwZGNwUVhNVFJLT2FEL3ozV29tZjFMU1BhUVhtM3h1K2t3MTRvK1ly?=
	=?utf-8?B?V3VvOHF5WmFzZXBIYWNPSFNaTHJ1bWpJeWt3ZDNSdVdLZWV3WERPUDdTWVBk?=
	=?utf-8?B?a2RYV0xpQ0tILzFDNi9aYkYvRGxlcDBwNUdGZFlVeS9Hb2RZQ3JoNk1iUCsr?=
	=?utf-8?B?V2xjN0U1OExnQWJwdUJMVXNPcTBiU05rZUNTQlZUZ3pHQXd6SzBOZ3I3Y1Jv?=
	=?utf-8?B?bzY3ZUZZbk1kN29jcXFsZm1XRFhPN3RVczhDd3pWWnN1aVlvd0pTMjdOa09v?=
	=?utf-8?B?OFVjMndkb0t3RVZMVTlDNG91UzJvdGYvUStKcmpyOVVMOXhUS0M1L1pML0d3?=
	=?utf-8?Q?aur1hAr2wJq+WuTLtrd0dIjdRdgsWn+WtAdsMIJ?=
x-microsoft-antispam-prvs: <BYAPR02MB424736503C13A280EA3BA09EB97C0@BYAPR02MB4247.namprd02.prod.outlook.com>
x-forefront-prvs: 09538D3531
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39850400004)(396003)(366004)(346002)(376002)(13464003)(199004)(189003)(81166006)(229853002)(97736004)(53546011)(6506007)(6116002)(26005)(8936002)(14454004)(186003)(102836004)(81156014)(316002)(3846002)(33656002)(6436002)(99286004)(7696005)(8676002)(76176011)(25786009)(6916009)(74316002)(106356001)(305945005)(105586002)(7736002)(53936002)(71190400001)(71200400001)(72206003)(68736007)(478600001)(2906002)(14444005)(256004)(6246003)(4326008)(476003)(55016002)(86362001)(5660300002)(486006)(11346002)(66066001)(9686003)(446003)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4247;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L0aQPcjW/TDiNyJA8Hy8yN1Wh9wJ9GhI00q/CIQvB3Maqoc6/FKkfLoauBZrTybV7uNP3P3zj3BKklo+aEcx4VRquohPywjOh1pezsogG11WERCUtIoMRXlOgYa6rIatc8rYCUqcz1Wu3IVQjLo1WNu4ctaUNMkL3ilMBYjhCHvMqGZO3/yDwpqtouP3P1lew6yj1QWe9RikvVZIUs8s+lfFMxeWoyDYv0kOa/irl1e7DnqyxW0TQfvDIS66Jt+z+MqbYl11jQyM/I5ShXhp3+zwP+9sAsoNAIU7ZyEkuTUDxlcxXDKxnbHff0nU6t91qvsqndJVQqjuxx2TpryXGtuHT30SPDUVbVXCC1QTkko6BjB9uDKT37ZWhH6mNErvnm1CwK9GEXCslayWb45o02TAh1/ltppPFL+NqExuUI8=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c353143-6731-4434-4dcd-08d696a14bce
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2019 19:34:42.3625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4247
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
X-List-Received-Date: Wed, 20 Feb 2019 21:07:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUGhpbGlwLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxp
cCBCYWxpc3RlciBbbWFpbHRvOnBoaWxpcEBiYWxpc3Rlci5vcmddDQo+IFNlbnQ6IFN1bmRheSwg
RmVicnVhcnkgMTcsIDIwMTkgMzo0NyBQTQ0KPiBUbzogTWFuanVrdW1hciBIYXJ0aGlrb3RlIE1h
dGhhIDxNQU5KVUtVTUB4aWxpbnguY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmUgPG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV1bUEFUQ0ggMi8yXSBrZXJuZWwtZml0aW1hZ2UuYmJjbGFzczogSW50cm9kdWNlIGEgd2F5
IHRvDQo+IHByb3ZpZGUgZXh0ZXJuYWwgZHRiDQo+IA0KPiBXaXRoIHRoZXNlIHBhdGNoZXMsIEkg
bWFkZSBhIGZpdEltYWdlIHRoYXQgYm9vdGVkIG9uIHRoZSBtaW5pLXplZC4gSXQgd291bGQgYmUg
bmljZQ0KPiB0byBpbmNsdWRlIGEgbm90ZSBvbiBob3cgdG8gZW5hYmxlIHRoaXMuIEkgdG9vayBh
dCBmZXcgc3RhYnMgYXQgaXQgYW5kIGVuZGVkIHVwIHdpdGgNCg0KVGhhbmtzIGZvciB0ZXN0aW5n
IGl0IG91dCBvbiBtaW5pLXplZA0KDQo+IA0KPiBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9k
dGIgPSAiZGV2aWNldHJlZSINCj4gDQoNClllcywgSSBzaG91bGQgaGF2ZSBhZGRlZCB0aGlzIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4gSSB3aWxsIHVwZGF0ZSBpdCBhbmQgcmUtc2VuZCBWMg0KDQpU
aGFua3MsDQpNYW5qdQ0KDQo+IGluIGhlIG1hY2hpbmUgZmlsZSB0byBnZXQgdGhlIGNvZGUgdG8g
dHJpZ2dlci4NCj4gDQo+IFBoaWxpcA0KPiANCj4gT24gMDIvMTQvMjAxOSAwNzo1NiBQTSwgTWFu
anVrdW1hciBNYXRoYSB3cm90ZToNCj4gPiBDdXJyZW50bHkga2VybmVsLWZpdGltYWdlIGdldHMg
dGhlIGR0YiBmcm9tIEtFUk5FTF9ERVZJQ0VUUkVFLCBob3dldmVyDQo+ID4gdGhlcmUgYXJlIGlu
c3RhbmNlcyB3aGVuIHRoZSBEVEIgZmlsZSBjYW4gYmUgZ2VuZXJhdGVkIHVzaW5nIG90aGVyDQo+
ID4gcmVjaXBlcywgcHJvdmlkZSBhIHdheSB0byBpbmNsdWRlIHRoZSBEVEIgaW5zdGVhZCBvZiBp
bmtlcm5lbCBkZXZpY2UNCj4gPiB0cmVlLg0KPiA+DQoNCjwuLi4+DQo=

