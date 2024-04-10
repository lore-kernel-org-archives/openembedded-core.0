Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D697CD1284
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 21:43:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2692.1712785416999587768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 14:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ng583505;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=483074a6bf=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43AKs45n027675
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 21:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=nGtfrtKlMMAw/JuR6FuQXM9Guhi3YPGmqkV5Uqc7Jrw=; b=
	Ng5835055gI5g3BPfWKLh/0uNdIzpztV/Jw4pZZQdaGDd8RJzeWL7yTq1VdexiCA
	Z2j65CZUoz6XbB/s9djsDXE9TA3BhdJUCIiL5nKsvfq6pW5fGt8/lV8uOc6+DAel
	d0EF9WdCBbPs7SVC+PvsmzeAB1davAEzwqx6ZwaIqwF8ssmliGl1XhzPqLFgZ2n4
	dO9XiPovvEjDxs50ovO1u9Rz9zX3MuGAgh+vXvJ0f7H73aQu7UFtniW9BL8XIMQI
	A9ZKvSAHW8/4nPEbG0/bghSkupl5fJJJovdxB0NeorbZWLcaxi4pnq6fjLZChW4V
	5MNBDhm1/vgBe5gJirt+3A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6na4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 21:43:35 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43ALhZoh029677;
	Wed, 10 Apr 2024 21:43:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xawc6na4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 21:43:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMbetT9KXREoHWUyYDUyS26X5gz5nB/8sEd+4+eGshmE3NMDM0HLSJr49WOB5d04UuJJC3DTUG3kXsSQI0gKqufy9QbdKkAItsUadDUrPPdq+u0HHrj26f/Bev8Zy/1wajaieawz65at7KNln0jOJExvZPeLVVpfs23nkE7U9W3a/VRrfSkf48SJNmbhDiTKMMHn0IicF0jJLxP/YV2XLDEpB4BeT811epV91CM7bpmaLC5b0DnY4JTh2l+hnUDmYCx517QTOA46P79V1TCXbZEwiR19/GFg/clvAODSWloqTgTCDMwZKkBgYwjCw+1q7tzBSmJM7LRZgR4T96+Nrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGtfrtKlMMAw/JuR6FuQXM9Guhi3YPGmqkV5Uqc7Jrw=;
 b=YekMsSvaPxspytOf/f6tevfqSyprsDzsnN7sAG2yzgYS9bA5SbEmo8v7Zptd6mjEE30xroTcaeAR3FrWVthv5crIjnvsORnRykyQD+DzSs9pa2PkeUAUGolENc5vlSC8sIJ0eczSfq1T1DGALmnSKyvqMiP9j1ucf89OUIft4p4dGrVIT14AKisSr/Khk3RmsySSmGXu597ughZIeKeBFYeO6gknjO4w8ZbRtLh8xi23dnjhAt/R83J2mzfKnrSJLjW7u3XWFvMPySj197+AAzL1g696dFpVyIu3L98DhjRz3KOZ/mQZ0eeg+bZRQjYqg6wd+1mn5AkgC6fmHLoKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7287.namprd11.prod.outlook.com (2603:10b6:8:13f::19)
 by SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 21:43:28 +0000
Received: from DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4]) by DS0PR11MB7287.namprd11.prod.outlook.com
 ([fe80::6444:a7f8:1876:84c4%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:43:28 +0000
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "Slater, Joseph" <joe.slater@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface
 names
Thread-Topic: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface
 names
Thread-Index: AQHaRAluibax8wkzFEKf53PfKK2bc7FiEXGAgAA/sYCAACAYIIAAJFBA
Date: Wed, 10 Apr 2024 21:43:28 +0000
Message-ID: 
 <DS0PR11MB72875E651DB4C62BAC36F48788062@DS0PR11MB7287.namprd11.prod.outlook.com>
References: <20240110211016.1470053-1-joe.slater@windriver.com>
	 <629B6710-F394-41B8-AEB0-6C8A6A594EAE@arm.com>
 <7e0175bab97db273ce3abb44f19e985a89f33773.camel@linuxfoundation.org>
 <17C501F6F3FE569C.18172@lists.openembedded.org>
In-Reply-To: <17C501F6F3FE569C.18172@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7287:EE_|SA1PR11MB7040:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4C082PB9bA3D4mAy6msv+2/E7FaKjeVBQfs/2/gikmI+9nODPnIRH5coTDoGRGo/hA74Psj+1Y9l1tAkw6hJcODZYNOJzfLtH/WUiINGrySHNNOp2r3SKdGDPObYOaNuVYa/x5+SXc/v6WrXLvp39QDyEhBpEsUnx5Scr588BWHyc6VU6nxYaY+8ULKa8BfbT1ySPdCjKPPfjsFJGbN7pm5ULmU/za2fyu8Ur7l3HZRiX0dbwi+isZkbMG+EjwmHN86vS5O+z0Ce4WpO/EQFUvjw7/PlXhVCPs+AUMV6ZON0U/jaWsB3B7GljI1OC0+4CWJj0m0kkjyiXD0HJFCLTEOwqF7icKjYACcR6waJ0Iu8RmIxVXG9rquh313tbty4pPKSZpTNA24FJV+vNAeydS2KeC/XejGC8S7pVjZUoONCEICejuJylXiSOmbACHqUxybESWxOQWNvFnCjN3gRPopCYie+3iJY2xppHcYAQswKrzjOVuZEzBWSIgCH0LEkHc+V1qTUIIC6th5YSq/J4Ed+HBYJqFVLT2PcNx9eKDKEB90kFaeC1fDWXw/KFb2AS1U85/xQA9TjvZ8zv/Y/zgkZ0sB+B3aqXIe1wVoF/kkxb+Cq5hqvGYLtJeHSSou+4zDiF9Wm7KnZoQVniJQXGrZjjnl+mPptVuy4QfIx80c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7287.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WjdLcHlQeXFyTml2cFYzd20wMkdzbkdFa1daMHhXclRxMjdhM1RWMXBsOXVk?=
 =?utf-8?B?TnNTODkxVkcxUFFPUHBtS1hEYUdXMG5MajFTTWNWQm5iY1hQaTYyNXZEYVZ1?=
 =?utf-8?B?OGcxVWFOSUJ5aUlENytMaVpSSHZuV0YzVUdQME1JM2g0amFvaDZ2L0VTR1hm?=
 =?utf-8?B?UFNHaU9wQzcxdWJLM081TkdoTnVrYlJETUNLUHVUSXFFNjFQZC9UU05SWUp5?=
 =?utf-8?B?UVNkT0lqOHppVHJvSDF3aldZbncyMTg0V09Ga3RTb2hFOW9pN1lqRUhldzFw?=
 =?utf-8?B?THk1K0ZzcWIxdStya0FuR3hCYnh5WHorQ0F4MEE1ZkVkWHVzWGsvOGJrZVdJ?=
 =?utf-8?B?Y0lTVlg3dWZaZnJrVjVmNGtlaUc2OHVBSzB4YkJhL0xOa0V3RnFncmU2eVBE?=
 =?utf-8?B?ZmpCU1lCYXhDemZ3V1RxV3VPajdCK0JweXJEVU1CcXRicC9uVGdWS3dkNVdO?=
 =?utf-8?B?QmZnTG1oelRDNExzMmNtbmNnR0RhNkNMTkFqa0hqanhMUzB4R2hFY2Ewb0o5?=
 =?utf-8?B?QXVydmpIaGZveFNDTU8rVzVweHpZYjZoTnVqZFo5MFhzZW9yZnBmUGp5Y05Q?=
 =?utf-8?B?dW9KTEw5QlBDZCtabVc0S2ZtUm5WUWE3UytCQTA3UElrdU5Nbll0UzdhVWY1?=
 =?utf-8?B?QTA3RjZEOFg4ZGZkbTBhOTBDMWIwamNxU3h2b05YOTJ2cjh5Rlpzc3pQaDR3?=
 =?utf-8?B?c2lWTDdsVlVNMi9IMFRjV2ZZUVlCdGNpZDR6eVRrRUszWWZadmlLd2J5Z0p0?=
 =?utf-8?B?c2xpcWM1SjY2TmNvZ2YzcnhRS2Y0dHpUNnEyVkxzK2FvWE5QcFJvRXdmVkl2?=
 =?utf-8?B?a1VWazJJK29nZjlRYXNNc2dpUnViUmRJcFQ1UDlVVjhYK1U1WlhNTElBcy81?=
 =?utf-8?B?U1BqbnJYbkJlQVdnODU1V29PY0txSDJvK1BkN1h3NmRhNFEvd1hKNjFUZ1ls?=
 =?utf-8?B?bGFDZDlzbTBLTUZ5M3JhZGxEd29iMlZ0YnZ0QTRtRFpOeFhJNERaeFZaYzM3?=
 =?utf-8?B?WkRxUzlQeG9JV2RQY2ZJQlR5aU9wMDNFUitpT2lGUTlXbzVNbFo3UVpBYjRX?=
 =?utf-8?B?a2dkRy9SeXg2WTFJbmVDNlU1eG9GUXMyNkxMZi84UUhjYzY0b3FYQ21MVTRi?=
 =?utf-8?B?RkovdlBUSWJKWDZHOXh6dy9qbkZRZEpsRmh6VndGT0UrYnZubzVqVTl4Njls?=
 =?utf-8?B?a0JZNTJVWE16RklvaW00YTQ5SVM2d2ZEWEQxK2R2Y0krenlObVZtcktCUjBj?=
 =?utf-8?B?U2NUQmlsdng0MzNnV0lBSDNiUHc0RElVemg0Mkw4blRISzYyeXFhZU5zTU12?=
 =?utf-8?B?dFYrNTBJQXp4R0V4d1Fnc1hyRkYxM2FicnhlSHZEN0dyTTdoZi9IZGlieEdO?=
 =?utf-8?B?YnpRRlFBUkxEbTdOLytCU05LMjZCTklmYVFqeUxMRm5LWWZocHJJanE4Ri9u?=
 =?utf-8?B?bjFmSm1uRWg1VTVLU2FlZFhhMkg1SWpxVVFrcVJmVlZhajczRlI5SUtWL1FE?=
 =?utf-8?B?a3VjOEVaVXg2V1dQWnVVUXVOQ3dmK3AwZDdWYlVHemN1Yk5sZHBBeTYwZGhW?=
 =?utf-8?B?VVdOS3VkWmxuN3lpRlBzNzFKdlY4enQxdWlQQkplb0tDYklDU2hJWDRBSTAw?=
 =?utf-8?B?NXlnOE53OS9mcWpOL0hUclZ4YVkvdHVjaHVTOEt5bXpFeC80dlpEMytJdENn?=
 =?utf-8?B?VXMzZ0ZQYUxmVGFFVCt4TExCcUx2b3FPQUVvdVpQZEcyYXliRk9FeDBCeU9s?=
 =?utf-8?B?TWwzY0pBc2lNcW1wamdMdDdSajc5cnVxZVlxdFBoMVAxK2JjS25ST2ZGRjB6?=
 =?utf-8?B?RUNvd1F3Sys1NzhNUTVqbGlYaVFOOHEvcGdrSzY5MmFDNytmY1lzL1lhRVZF?=
 =?utf-8?B?dnNEeXlJdXVQeXAwdmprRWFNbHkyOEdaS3JmZ0ZENVNMdEllZVdoWm8xN2sv?=
 =?utf-8?B?eXdnR0pFUk44Z2dQZzE1QjRRdzB6QU5jYVJteWt3Nklib2ZIZ0dVNHVjY3pV?=
 =?utf-8?B?aU1NOEpmMHluMDlEYy80dStkT2xYUkNaMkZaenJLczlxcUZVRS9SRUJ1MGd6?=
 =?utf-8?B?VVRWUjVMMDlISkZNTnp4WHk2QUZuMnk1Mkx6Q3lQeFRJMmVqL1plUlkwQ3oy?=
 =?utf-8?Q?i1kGDSbI2Vk1wfPkSB9YKD2AI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b92b0e-7171-42cb-51c9-08dc59a74243
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 21:43:28.5484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijtbBVpsfYsZbZosPUSfCkKZ3EltUmvx2DCoxernq21rbuftCsPN56SqoFEN6E96dVegJ+kwFXZCZLo8CX4U3MIaQP7qixxIeXsa9Qt9urw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-Proofpoint-GUID: iTubG839l8Cr-ceBozuQULjTIoSB9hd0
X-Proofpoint-ORIG-GUID: pHNA5Y9XEETzvnk08i6w0_eUKOmURZvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_06,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=808 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 21:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198108

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBKb2UgU2xhdGVyIHZpYQ0KPiBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTAsIDIwMjQgMTI6MzAgUE0N
Cj4gVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
PjsgUm9zcyBCdXJ0b24NCj4gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+IENjOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBNYWNMZW9kLCBSYW5keQ0KPiA8UmFuZHku
TWFjTGVvZEB3aW5kcml2ZXIuY29tPg0KPiBTdWJqZWN0OiBSZTogW29lLWNvcmVdW1BBVENIIDEv
MV0gaW5pdC1pZnVwZG93bjogYWRkIHByZWRpY3RhYmxlIGludGVyZmFjZSBuYW1lcw0KPiANCj4g
VGhlIGVhc2llc3QgdGhpbmcgdG8gZG8gaXMgdG8gY2hhbmdlICJhdXRvIC9ldGgwIiBiYWNrIHRv
ICJhdXRvIGV0aDAiLiAgVGhpcyBsZXRzDQo+IGJpdGJha2UncyBpZnVwZG93biBpbml0aWFsaXpl
IGV0aDAgYW5kIGFsc28gYWxsb3dzIHRoZSByZWFsIGlmdXBkb3duIHRvIGluaXRpYWxpemUNCj4g
ZW4qIGludGVyZmFjZXMgaWYgdGhleSBleGlzdC4NCg0KT29wcywgdGhhdCdzIGJ1c3lib3gsIG5v
dCBiaXRiYWtlLiAgU2luY2Ugd2Ugd291bGQgbmVlZCBpZnVwZG93biB0byBwcm9jZXNzIHJlbmFt
ZWQgaW50ZXJmYWNlcywgSSdtIHByZXBhcmluZyBhIHBhdGNoIGZvciBwYWNrYWdlZ3JvdXAtY29y
ZS1ib290ICB0byBSUkVDT01NRU5EUyBpdCBpbnRvIHRoZSByb290ZnMgaWYgc3lzdmluaXQgYW5k
IHBuaS1uYW1lcyBhcmUgZGlzdHJvIGZlYXR1cmVzLg0KDQpKb2UNCg0KPiANCj4gSm9lDQo+IA0K
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gU2VudDogV2VkbmVzZGF5
LCBBcHJpbCAxMCwgMjAyNCAxMDoyOSBBTQ0KPiA+IFRvOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0
b25AYXJtLmNvbT47IFNsYXRlciwgSm9zZXBoDQo+ID4gPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNv
bT4NCj4gPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTWFj
TGVvZCwgUmFuZHkNCj4gPiA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPg0KPiA+IFN1Ympl
Y3Q6IFJlOiBbb2UtY29yZV1bUEFUQ0ggMS8xXSBpbml0LWlmdXBkb3duOiBhZGQgcHJlZGljdGFi
bGUNCj4gPiBpbnRlcmZhY2UgbmFtZXMNCj4gPg0KPiA+IE9uIFdlZCwgMjAyNC0wNC0xMCBhdCAx
Mzo0MSArMDAwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+ID4gPiBPbiAxMCBKYW4gMjAyNCwgYXQg
MjE6MTAsIEpvZSBTbGF0ZXIgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IDxqb2Uu
c2xhdGVyPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4g
PiA+IC0jIFdpcmVkIG9yIHdpcmVsZXNzIGludGVyZmFjZXMNCj4gPiA+ID4gLWF1dG8gZXRoMA0K
PiA+ID4gPiArIyBXaXJlZCBvciB3aXJlbGVzcyBpbnRlcmZhY2VzIGluY2x1ZGluZyBwcmVkaWN0
YWJsZSBuYW1lcyBhdXRvDQo+ID4gPiA+ICsvZXRoMA0KPiA+ID4NCj4gPiA+IE9idmlvdXNseSB3
ZeKAmXJlIGRheXMgYXdheSBmcm9tIHJlbGVhc2UgYnV0IEkgdGhpbmsgd2UgbmVlZCB0byByZXZl
cnQNCj4gPiA+IG9yIHJld3JpdGUgdGhpcy4NCj4gPiA+DQo+ID4gPiBUaGUgL25hbWUgc3ludGF4
IGlzIHNwZWNpZmljIHRvIOKAnHByb3BlcuKAnSBpZnVwZG93biwgc28gYW55IHN5c3RlbQ0KPiA+
ID4gd2hpY2ggdXNlcyBidXN5Ym944oCZcyBpZnVwZG93biB3aWxsIGZhaWwgdG8gaGF2ZSBmdW5j
dGlvbmFsDQo+ID4gPiBuZXR3b3JraW5nLsKgIFdlIGRvbuKAmXQgc2VlIHRoaXMgb24gdGhlIEFC
IGJlY2F1c2UgdGhlcmUgaXMgYSBzZXBhcmF0ZQ0KPiA+ID4gaW50ZXJmYWNlcyBmaWxlIGZvciB0
aGUgcWVtdWFsbCBvdmVycmlkZSwgdGhpcyBmaWxlIGlzIG9ubHkgdXNlZCBpbg0KPiA+ID4gbm9u
LXFlbXUgc2l0dWF0aW9ucy4NCj4gPg0KPiA+IEknbSB3b3JyaWVkIGFib3V0IHRoZSBudW1iZXIg
b2Ygb3RoZXIgY2hhbmdlcyBvdmVyIHRoZSBsYXN0IGZldyBtb250aHMNCj4gPiB0aGF0IGFyZSBy
ZWxhdGVkIHRvIHRoaXMgc28gYSBzaW1wbGUgcmV2ZXJ0IG1pZ2h0IG5vdCBnZXQgdXMgdG8gYSBn
b29kIHBsYWNlLg0KPiA+DQo+ID4gSSdkIGxpa2UgdG8gc2VlIGEgcGF0Y2ggcHJvcG9zYWwgb24g
d2hhdCB3ZSBzaG91bGQgZG8uIFRpbWUgaXMgc2hvcnQNCj4gPiBhcyB0ZXN0aW5nIGNoYW5nZXMg
dGFrZXMgdGltZSBhbmQgd2UncmUgbm93IGEgYml0IGJlaGluZCBhbHJlYWR5IDovLg0KPiA+DQo+
ID4gU28gc3BlY2lmaWMgcHJvcG9zYWxzIHdlbGNvbWUuDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4N
Cj4gPiBSaWNoYXJkDQoNCg==

