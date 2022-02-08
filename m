Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F87C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:25:51 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.91])
 by mx.groups.io with SMTP id smtpd.web09.12634.1644333949637985521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=g9Snk1/j;
 spf=pass (domain: melinkcorp.com, ip: 40.107.94.91,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnJ4+FseBL1Ui1hW9hGlYIChOrCN/VUGUrbFyhUF4FUzLUQR/AIuGTJhdqCe0kwEbQDL/weGOGFDEbPZvysxH3yvc0YfEEP++Ib98WUhINmxQ6xQ85hqW0bn7kWdWGwiW+OIpn1EdcJexsyC51xcWsTjkzi8Hmqjb5c+RslBaCXhQEejMQZNrpLyEng/0PxqrXSuGYB2QMO6D/EwOEXdx4JT+FrHf1ZsNzMWL6PH+TbiV7e8FqnN6KBrKsKKZWkXotkE7oWB49Z3CzsXZvS+E2KNMgF8p7irYUSNMoTMJhLIKSCBWGcVodbnRa3Csv7tyzmqiKkF6wQRXMAsrXU5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fEiwnsIH8TabQhSB0gNFjKBpTkcWQ8sZn9jEQ1Q328=;
 b=jPnvVpD8tO9uGGG+CvzBVXqz11W4UOIE/qkWdUu1L9B7w7fwJn7e/+LQOtUyLFAA7e2gkkrAlEsLcxUbw2YSFHPs1apQvnByTKI++0ke+DPq+KsE7ZkhtXR0ft9SD76CoNQyXJJ8V4IWJhgq5hGHkqw2E9D8zjTwpkBR+3eF6j5002x+9fh9YKdxX5+s7m284r8gQxz0MelDeyQONS8bvTyecQouju+llSPkT+QKjWTQboW5YinHp8W9VRjc5bwgVD5My+03EIf0pHeAP2pvgOKzgzrc7esLY8a7evn3us2XBG9UAkKtcNPEWQhaHfBcdGBggdHHKktrLJlVRkEAZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fEiwnsIH8TabQhSB0gNFjKBpTkcWQ8sZn9jEQ1Q328=;
 b=g9Snk1/jgBB58/mGcJfE071nqBgLhGkjapGdQQiF+3kT9FqqWLjavNJkKc8SLh/jwvnS6SzB1gF7hwlXffJEKUfxQySgoBJJNEd/VCeAeZjGKYXcTvgU3uYAsO78H8nPBARp0ATYgLyacmPhDo3hrkQxTUuhJsfwnDABYOvOSgMljj8hfvrS/q/K0qEo1ExRnyhmv3kLk3mQ25JM5nIrZEg1Ti0ew7kug+l1xqLLBTlMcHrI4BijJtUrEIN0efP/7Nld9z2bnS11T3wO+97ms/GU8+VDrd7vgfTvfzaebGs++8IeMEYfYTK92CmUo2C51JE62QtWCYemlqrO4fmDqA==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by MN2PR20MB2301.namprd20.prod.outlook.com (2603:10b6:208:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 15:25:46 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::b805:3743:bea:e7d]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::b805:3743:bea:e7d%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 15:25:46 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] gio-querymodules: error while loading shared libraries:
 libffi.so.6: cannot open shared object file
Thread-Topic: [OE-core] gio-querymodules: error while loading shared
 libraries: libffi.so.6: cannot open shared object file
Thread-Index: AdgcTEk/yTwxPrPGTJaVV/RKLvaNJQACGOWAACSkBfA=
Date: Tue, 8 Feb 2022 15:25:46 +0000
Message-ID: 
 <CH0PR20MB39480F83C8949247D7968800BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
References: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: ac2fd493-1dbb-47ed-bc3b-a2056ba50907
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2df649a3-f50c-4184-329c-08d9eb17479f
x-ms-traffictypediagnostic: MN2PR20MB2301:EE_
x-microsoft-antispam-prvs: 
 <MN2PR20MB2301ECBB82DE37CB00723880BB2D9@MN2PR20MB2301.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 79V28LKH9pAl9AInWSiL/EOLqJ+5kFPkFPJdWrmO2gPCGoM+wkQ7GsCdrgw9GMwdJImathg9mGpHZOt+lbiKJfmEhP4dATa8BMm9SMf7LwwLRofUPrQbbHArPvZYofO28wO2m3kvIuchJ6FMgJ3ogWRLsxZKzhQzz4zUiTPYjOGwkv7EoVWK+IAVDo4wMZ7FMeR0e9MpAzHr62bo+0uBZdHwZbRlwonVm1mOB7xIw0fxNdWGFJqjDJHRXt6z14bklZaswEFf0z0S1KR6ZgcTdT3NMixdUTh195HtaDD+l0mZfJz3rp4svTf63bdeBwSozXQfaydkzYRH3OLhg+jjaIJFVewqBGSpDZkyeu15p48skitEBBycw5DXHcriRDVx38a5b71yk6ndnEAXvKPurLm0ir3ZgFYHLo78WZgXuuviSzpDh6E0Wfky1gjsSpy/1KQmN7AwLP34jueTZamfQnPqTr3tqWS9mi4kOgrseCqBenO7Fvfze8pPk2yJMUcE139LFbVMToHWPBj+cKKVhrVcsWQwllryZuYwjPb9HfhdxOqdU2UDsYCA7JSkvcXXZu/CoATZGtBD/Pgr38GEne6CBqrhCG9RoRkrNIZEaGsFskXVStm+kMMPlG/nQzn85w4S2TGnp2CSd0fC/6MZX6Yh9EWH9VuvilBEmdoHbij7xg7LAYqeFS5g0ylLRiSw10Rf/qr2VrpY7Mgj7I+UTWeFL9M7Gt8X+/k5SlNfugNJ1UB+aLG8jXNbn4XuPruNNqVQbjZUV3GE9J25B0N2vjzuqJZRrCuWIBoUeLZC+vM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(376002)(396003)(366004)(39840400004)(136003)(346002)(508600001)(71200400001)(38100700002)(55016003)(66556008)(966005)(316002)(2906002)(6916009)(186003)(76116006)(66946007)(33656002)(122000001)(66446008)(64756008)(66476007)(4326008)(8936002)(8676002)(7696005)(52536014)(86362001)(38070700005)(83380400001)(9686003)(6506007)(5660300002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N2E4dDlMODJ1MGhuTHBBVm5rNTVmQU93TjRMbWxkZm91dXRjK0NyTGhUaTNP?=
 =?utf-8?B?aXN1WE8xaURCSzNZMlZhMnk0RWN6MDF1Y2tKdGFjL0YramM1WmxnS2wxT3Vy?=
 =?utf-8?B?bnZXTStYWkV4V0Jqb2pyNE1zQVRjcFhKdHAyd0I1dFBkRnZ1YW90czNpczhZ?=
 =?utf-8?B?eUg5QW1WTnRqY1VWeExiaGh1Y1BxcnlOYmdYdXlDSnByMTlHOXNyMmJPbzVW?=
 =?utf-8?B?Z25xT25kQUgxRTJ5WUdXM09zQ21GcS8zYXhBOHp3ZE82OVozaWFaVm1ZQkRI?=
 =?utf-8?B?cUtLdjNMOE13dmRsdFM2ekViMURYMDE4ZmpFM1JFWE8yS0NucDZTQlpsd01k?=
 =?utf-8?B?MmZoVVFadGk2bEVrVGVqUHR4cU9vSFJmTndQM3hMLzNCQ3pIQzVEY2ZFbFMr?=
 =?utf-8?B?OTU5bVV6MnhNQ2NvU0JQOC9lNVFFbUNZMEVxV0F3QWdENmNJeU5rNXA0bVRV?=
 =?utf-8?B?Z09ENjhtT01ieWlhbWVhMDFJSFpyRS92OWxxUmcyRHYvT0Z3eGx5dXY5UVZn?=
 =?utf-8?B?VFNmeTI0THZjNkRQMy8wbm1qRXlGemhuVlFITzR6SllEci81cy82N1czczdx?=
 =?utf-8?B?WFJjVVc3bTgzdzdmMEFlWnpUWk9mMkQwVmdGb3FLN01CQ2RvRHpTU0ZEQ0c4?=
 =?utf-8?B?c3dzaXAwdXd4TExMWWx6Z2RTa0RVazNWb2JVUFY0bnFpNzE1K3o4WDlKZ0tF?=
 =?utf-8?B?b1UwZlA2UHdtdlBmWnlrVmJxcCt6UXpqVXZMNUcrUVdncmJ4THp4RjRrWjVD?=
 =?utf-8?B?RVNpZkE2TGVQd2pzRnlhanlyYkxCT0NVd2VqWWRRWElEMEd2LzJRdXkzRFNy?=
 =?utf-8?B?N0R6MGI5ekxYSHAxamVrTklJcHJvY044aURIdlgweFhLQ2s1c0JkZlpVNzds?=
 =?utf-8?B?dG9JUnpJbjAxaHF0WUNDOCthYlZpODMzVEZhaWxYcFNjaitaYUw3R214NGdG?=
 =?utf-8?B?NVljL1h2UG9RUHBkTmgzT2NDTGI0eG1YYTVndEswbklQMXZDRzY3eWtwV0Fn?=
 =?utf-8?B?OVRrZjJPWittN095V3U5ZE81OUJjM2JlYlVGVlRPRG9nNVhTWEhqZVZzd0pu?=
 =?utf-8?B?VlNKTXd3dEtQdHpNRkdsUWxpeVpxQmJ0blVmUjhkd29KdDVNQ2xUQ1BPd0tt?=
 =?utf-8?B?ZE9TV2FDTzhxankxNDcwWHVJdVlmeUVnZVdHaXJZenI3ODdoMTJNeEx6aFZB?=
 =?utf-8?B?dnByM0R3UGhtZC9oZEdvYmNhMnhQbm1HTkN5UG5ILzFMb3AxZHNKQUV6SzRE?=
 =?utf-8?B?YjdDVmN6TThpREdpNHZ0SERmSVBsbHNnK2F2SkNBRFUya01wUHlSUTltUjBu?=
 =?utf-8?B?RjFiUXNoa29MUHNyUmtNUW51RkhVNFR4SDlSMWMza1Bnd3dtdDRrd3NrS3d2?=
 =?utf-8?B?bGJZSVpkNU5KZy9VdzNzRGxYVE9mbzF0cTJsN3BPekRBR29pTjYxbmQvdFBv?=
 =?utf-8?B?cFcxdHF4bFZxekZMS1U2c3A2MUZma3hmVU1wSDBxNEk1elVRaGhLVE05aHpV?=
 =?utf-8?B?azBKNmo2K0ZHMEZjUmFiWGRHclZqMlBWYmdBTDFmVlQ0eVRsMXAxRzFUeHN0?=
 =?utf-8?B?RUlMcWdON0tyTWxZYUdYRE5IcjZXbG1OUXpaL3l1L1RheW1QLzNpUUZKSUlo?=
 =?utf-8?B?MWM5RVd1VzdiaGNuWTNzL3VVbFJTanNKMlZCQ01oV1hwR09SeTBxRHJtTEhO?=
 =?utf-8?B?WmFPanRHcVVEaVU5ZXU2N0lRRDhvUUVoY3N0anBHa3NNY0gwbTcrNi9Qb3Iv?=
 =?utf-8?B?d0tUWmdmcThOOStiOG5XTlVBTThIM0ZGeWtKVG5KNTVvcTQxRkdIbEFzeHRE?=
 =?utf-8?B?NUJqRWhrTEVIcDhSVmV4ZXZmK29kbjFYSENEeGxVZlFCcGRDemdBSGJaT3Mw?=
 =?utf-8?B?YldUNHkzQXBFWWpNUFpuWDVnRkROUWNNWWxWM2JQa3IzTzJLcll5aUJudHg3?=
 =?utf-8?B?ZE5sSTd5ZTJrQ2R3WWdYVkNoN01iZi9pcDJpbmZSM08ycE10N1h5cUNvQ05i?=
 =?utf-8?B?MmorYWUrRXVlY2JOczBIYksxSnJYMnBIdVBMZ3U4LzBZSXBzNHUyRStmTzI1?=
 =?utf-8?B?aTBvdkpEUk5RUTJ6cGtOYkJYMmh6UkJGendXcS9aZ1VNNHFQaU54cUtXNEly?=
 =?utf-8?B?T25BT1lrb29VU3ZwMi9sUEdmOG1Td3pkNTdoY2I1c2dLSitEVURPZmFOYjho?=
 =?utf-8?B?TFpwRCtqYTM0TEpybVA2a1YrK0ZUbXQvVHdQL3lrU0o0MGw1ZjBoc0tDUzNH?=
 =?utf-8?Q?rXDywaUrFHkHu7g/VP8AF/QBeEkCsVOH054rsXEinc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2df649a3-f50c-4184-329c-08d9eb17479f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 15:25:46.7245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 H00rWVHVzOT6ZWOXIKYah66tT9f8gevAU1ZJ6LDYutgqME7Up92iYTsmy6iG+421Ho7PY5PDTw0myeyfoVgtPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB2301
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 15:25:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161514

QWxleCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFy
eSA3LCAyMDIyIDE6NTggUE0NCj4gVG86IEJyeWFuIEV2ZW5zb24gPGJldmVuc29uQG1lbGlua2Nv
cnAuY29tPg0KPiBDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUg
bGF5ZXIgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIGdpby1xdWVyeW1vZHVsZXM6IGVycm9yIHdoaWxlIGxvYWRp
bmcgc2hhcmVkDQo+IGxpYnJhcmllczogbGliZmZpLnNvLjY6IGNhbm5vdCBvcGVuIHNoYXJlZCBv
YmplY3QgZmlsZQ0KPiANCj4gVXBncmFkaW5nIGZyb20gb25lIHlvY3RvIHJlbGVhc2UgdG8gYSBk
aWZmZXJlbnQgeW9jdG8gcmVsZWFzZSB3aXRoIGEgcGFja2FnZQ0KPiBtYW5hZ2VyIGlzIG5vdCBz
dXBwb3J0ZWQgb3IgdGVzdGVkLiBZb3UgbmVlZCB0byByZXBsYWNlIHRoZSBpbWFnZQ0KPiBjb21w
bGV0ZWx5Lg0KPiANCg0KSSB0cmFjZWQgYmFjayBhbmQgSSBzZWUgdGhlIGdpby1xdWVyeW1vZHVs
ZXMgY2FsbCBpcyBpbnNlcnRlZCBpbiB0aGUgcG9zdHJtIGJ5IGdpby1tb2R1bGUtY2xhc3MuYmJj
bGFzcy4gIEJhc2VkIG9uIHRoZSBjb21taXQgbm90ZXMsIHRoZSBwb3N0cm0gYW5kIHBvc3RpbnN0
IHN0ZXBzIGFyZSBhbiBvcHRpbWl6YXRpb24gYW5kIGFyZSBub3QgcmVxdWlyZWQgdG8gc3VjY2Vl
ZC4gIFRoZXJlZm9yZSBJJ2QgYXJndWUgdGhpcyBzaG91bGQgZmFpbCBncmFjZWZ1bGx5OyBqdXN0
IGJlY2F1c2Ugd2UgaGF2ZW4ndCB5ZXQgc2VlbiB0aGlzIGZhaWwgZHVyaW5nIG1pbm9yIHVwZ3Jh
ZGUgYXR0ZW1wdHMgZG9lc24ndCBtZWFuIGl0IGNhbid0LiAgSSdkIHByb3Bvc2UgY2hhbmdpbmcg
dGhlIGxpbmU6DQoNCiAgICAke2xpYmV4ZWNkaXJ9LyR7TUxQUkVGSVh9Z2lvLXF1ZXJ5bW9kdWxl
cyAke2xpYmRpcn0vZ2lvL21vZHVsZXMvDQoNCmluIGdpby1tb2R1bGUtY2FjaGUuYmJjbGFzcyB0
bzoNCg0KICAgICR7bGliZXhlY2Rpcn0vJHtNTFBSRUZJWH1naW8tcXVlcnltb2R1bGVzICR7bGli
ZGlyfS9naW8vbW9kdWxlcy8gfHwgdHJ1ZQ0KDQpJIHRlc3RlZCB0aGlzIGNoYW5nZSBhbmQgaXQg
Zml4ZWQgbXkgdXBncmFkZSBpc3N1ZS4gIEkgc3RpbGwgc2F3IHRoZSBlcnJvciBtZXNzYWdlIGJ1
dCBsaWJnbGliLTIuMCBjb21wbGV0ZWQgaXRzIHVwZ3JhZGUgc3VjY2Vzc2Z1bGx5LiAgSWYgeW91
IGRvbid0IHNlZSBhbnkgaXNzdWVzIHdpdGggdGhpcyBjaGFuZ2UsIEknbGwgc2VuZCBhIHBhdGNo
IG91dCBsYXRlciB0b2RheS4NCg0KVGhhbmtzLA0KQnJ5YW4NCg0KPiBBbGV4DQo+IA0KPiBPbiBN
b24sIDcgRmViIDIwMjIgYXQgMTk6NDksIEJyeWFuIEV2ZW5zb24gPGJldmVuc29uQG1lbGlua2Nv
cnAuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEFsbCwNCj4gPg0KPiA+IEknbSBoYXZpbmcgc29t
ZSB1cGdyYWRlIGlzc3VlcyByZWxhdGVkIHRvIHVwZ3JhZGluZyBsaWJnbGliLTIuMC0wLiAgSSBo
YXZlIGENCj4gZGV2aWNlIHRoYXQgaXMgYmFzZWQgb24gdGhlIG1vcnR5IHJlbGVhc2UgdGhhdCBJ
IGFtIHVwZ3JhZGluZyB0byBhIGJ1aWxkDQo+IGJhc2VkIG9uIHRoZSBkdW5mZWxsIHJlbGVhc2Uu
ICBJIGFtIHVzaW5nIG9wa2cgZm9yIGEgcGFja2FnZSBtYW5hZ2VyLiAgRHVyaW5nDQo+IHVwZ3Jh
ZGUgSSBzZWUgdGhlIGVycm9yIG1lc3NhZ2UgaW4gdGhlIHN1YmplY3QuICBJIHRoaW5rIEkgaGF2
ZSBhbiBpZGVhIG9mIHdoYXQNCj4gaXMgaGFwcGVuaW5nIGFuZCBJJ20gbG9va2luZyBmb3IgaGVs
cCBvbiBob3cgdG8gZml4IGl0Lg0KPiA+DQo+ID4gSSBzZWVoIHRoYXQgbGliZ2xpYi0yLjAtMCBk
ZXBlbmRzIG9uIGxpYmZmaS4gIEJldHdlZW4gdGhlIG1vcnR5IHJlbGVhc2UgYW5kDQo+IHRoZSBk
dW5mZWxsIHJlbGVhc2UsIGxpYmZmaSB1cGdyYWRlZCBmcm9tIGxpYmZmaTYgdG8gbGliZmZpNy4g
IFdoZW4gSSB1cGdyYWRlIG15DQo+IHN5c3RlbSwgbGliZmZpIHVwZ3JhZGVzIGZyb20gbGliZmZp
NiB0byBsaWJmZmk3IHByaW9yIHRvIGxpYmdsaWItMi4wLTAgdXBncmFkaW5nLg0KPiBXaGVuIGxp
YmdsaWItMi4wLTAgdXBncmFkZXMsIGl0IGNhbGxzICcvdXNyL2xpYmV4ZWMvZ2lvLXF1ZXJ5bW9k
dWxlcw0KPiAvdXNyL2xpYi9naW8vbW9kdWxlcy8nIGluIGl0cyBwb3N0cm0gc2NyaXB0LiAgVGhp
cyBwb3N0cm0gc2NyaXB0IGZhaWxzIGFuZCBnaXZlcw0KPiB0aGUgZXJyb3IgbGlzdGVkIHRoZSBz
dWJqZWN0IGxpbmUuICBJJ20gYXNzdW1pbmcgdGhhdCB0aGlzIGZhaWxzIGJlY2F1c2UgZ2lvLQ0K
PiBxdWVyeW1vZHVsZXMgZGVwZW5kcyBvbiBsaWJmZmk2IHdoaWNoIGlzIG5vIGxvbmdlciBpbnN0
YWxsZWQuDQo+ID4NCj4gPiBIYXMgYW55b25lIHJ1biBpbnRvIGEgc2ltaWxhciBwcm9ibGVtIGFu
ZCBmb3VuZCBhIHdheSB0byBmaXggaXQ/ICBJJ3ZlIHRyaWVkIGENCj4gZmV3IGRpZmZlcmVudCB3
YXlzIHRvIGZvcmNlIGEgZGlmZmVyZW50IHVwZ3JhZGUgb3JkZXIgYW5kIHNvIGZhciBub3RoaW5n
DQo+IHdvcmtzLg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IEJyeWFuDQo+ID4NCj4gPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMTYxNDYzKToNCj4gPiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdl
LzE2MTQ2Mw0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL210Lzg4OTc5MTU2LzE2ODY0ODkNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNv
cmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtDQo+IGNvcmUvdW5zdWINCj4g
PiBbYWxleC5rYW5hdmluQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PiA+DQo=

