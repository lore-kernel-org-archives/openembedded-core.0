Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A53CC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 21:57:01 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.88])
 by mx.groups.io with SMTP id smtpd.web11.46660.1701899813125957530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 13:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=QPmd28l0;
 spf=pass (domain: axis.com, ip: 40.107.15.88, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP+itUPdsKh+LEgfXxJ0H1n/JU/FiBKiGOKqj0bQe0K0Qmtyi9GM0IrCIXWvK6jGQRWWPhBfv+rvDPCX5znuF9etkPUdJzUtN8zpgcQwm5wxbNgYrsFQ/19jud5BypN0SNSFU4ZZzdYGrxL1XKtW8mL/bunWgT5yDFxhgW538LGWpTR8FDPR011SE4x11KjYX56FgdUEgu7xi2vXciAvEvJT+Qfj2/aHsDI9JXkMsoyicXtDKiIlCD77MzmE+NwbjZ4WdVAUZmy+UYMhDbs5YgwmNGEqyR3gdaJhWgdxSmjRcN2xVQb8P8Il0K5AfaolQkk/h+ENNl0qZ5s5PD4T8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkvO9cj1xoB09wyqyijJGMOGiJ7R3B+HYShz8vkJ8G4=;
 b=fSOYBruZt5/9ouU97Dr46Aaa2OphpgSiHn0P8UD9hNE1wKc+gnWfWwbnxC16VfrqvG89HZDSNVQFyCrpwlvcEJ9Qv8ynNDwdO8M0HQpcbhuU9Y9veXxLO0U03PoHCFKaxgYK5RdHKwlVAvFs+zcx4AAnJTa8A3zA/8ZznbvPwxZeE9VQZCLg+WxlVbwA59G7HAWQeb59wll3WucP+U4Tjn7IvCgLd9PIwk00Yxj30FtL1lg6Eek1s6Mnki5m8Rqq1PY04ynrVRmrgd1O2FggDSjxI/1eUx5/epshoeGCayjDFtVcbdVIY86lZufoxbcGEudZdD1UFOtklTjjYlWI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkvO9cj1xoB09wyqyijJGMOGiJ7R3B+HYShz8vkJ8G4=;
 b=QPmd28l0zxPwxt9AajEj6NH+GDDpVokYTFFqtrYoUq37gvHUhLKjafNhM1VG9ehbE5CbdGxAIGywYFAJmzMFLVSnuekWROGwU9EIN4R1QyzS8DkNY7L2pTxkYZwAugtptjzxk1FX9U8CVwta2TaE9V7Fwkz/toQrT7uwOblpAu4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM9PR02MB6593.eurprd02.prod.outlook.com (2603:10a6:20b:2cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 21:56:49 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%6]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 21:56:49 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, Khem Raj
	<raj.khem@gmail.com>
CC: "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] openssh: shrinking to a new PACKAGECONFIG line
 to set systemd readiness notification support
Thread-Topic: [OE-core][PATCH] openssh: shrinking to a new PACKAGECONFIG line
 to set systemd readiness notification support
Thread-Index: AQHaJFyAjcK/Cxb/f0iFYRnt66tpPLCUxpiAgAPxtwCABBpboA==
Date: Wed, 6 Dec 2023 21:56:49 +0000
Message-ID: 
 <DB5PR02MB1021391CDBF57C29E1480B941EF84A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231201140947.792594-1-xiangyu.chen@eng.windriver.com>
 <CAMKF1spO26_0T5i7npXaekipmO16geFyjsmXgR+OL0LE23WvPQ@mail.gmail.com>
 <14c22f1d-0879-4643-8bbf-741ece167522@eng.windriver.com>
In-Reply-To: <14c22f1d-0879-4643-8bbf-741ece167522@eng.windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM9PR02MB6593:EE_
x-ms-office365-filtering-correlation-id: 311af2f0-84d9-42c7-f385-08dbf6a63f9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oRUtV9V9563j9QvepG/IhsqHM6EPF7nKp/59BDtYvpCvTTJUdyijQEH0qzvQnD90YnZs2yZKmRTEjh6DSbz4QWM8aPpJecxwGr9dB3zl/3Bi7YC7MP2iPQVaQSCQkKFouEX7lp1OH7k+bY2TcLW2O9GXPiYSNBVT5Ep6C2txOp66M7wpCRs1u6uPqsOR7/M+6eFCskl/rwCa+XSRGKV/B4JP1Oark95lQCD/ekB1kPtpmUiC1FeHNE6BsyL6yUHrgZZjeR7nGeGXhNSI/LeTh43Q5OvKB0ZEII9XG0WwulLFVEb7BHhVzyVHFfNK+/SlY7MlDDOmOpbV5Y7XwN2AXr0BAzkckxlw16bnKT2rChQ0nzrxCBwutn/meLbRXBkwaTtVTSlM5EQFuAfWRZECeO9j7omrfs9QPD1wmUE5wC5EeZxy/7MU7iONRGXZg9jcnLg6GwLZ3y3dJRGVFnoR8ef2aiLyrzuFr1v6mrz2jqr8yQ8yir8XPOSOlG5lV39kj4D9NF2j+eJesJRqoszkGlEuf+rEI7ksV2EkVcX1OKLyP6ZoSBYY44tBqLG3mFJO+WyjgP4xTccknbyMCmYGmBlGfAIaxY/pkwhV3NUQqb67ppUkTKWaZ6yIAbe3RLWmqrBR1zPqGi5OGBCcdGU36rQuPTVjzEvJb3Qr3ct5hQ0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(76116006)(66946007)(41300700001)(316002)(66476007)(8936002)(66446008)(66556008)(86362001)(8676002)(4326008)(52536014)(44832011)(478600001)(64756008)(54906003)(110136005)(33656002)(15650500001)(122000001)(53546011)(5660300002)(2906002)(38100700002)(26005)(71200400001)(83380400001)(6506007)(9686003)(38070700009)(55016003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VkErZzFDSjAyT2pTdTNHSHJKVmg4Z0Z1WHRPS2xLVm04bm1la2pqa1k4Y0Iw?=
 =?utf-8?B?d3VYMWdjelEreVRJVkxudi9jbURMZno4UGdjOEZ2T3RvVndEaGNkQmdLTVN5?=
 =?utf-8?B?c3VmbzM1SFpsV2haVUZhVlhNWlZhOU5vc2hjcjJoZk50YjJHZXdXSWZaQ0lx?=
 =?utf-8?B?WjJLR0NIK3dqUjIvRUJWSlB5MFlaSTRnNVRCbUZiNVM0Uk5mem0xRktuTkRw?=
 =?utf-8?B?V1dTOEs0QVpIYVFyOGw0VnQydEdTUVlqbHhKY2lSYjFsSnBpenZJdGNzVTl2?=
 =?utf-8?B?VmZrUFpOVFhhdjRYRjVIUytPZE8wd044WVF1eTJZOFR0VHZvQ0ZoemYyeXpN?=
 =?utf-8?B?Zy9oWjQvckwvWlVCYjhBL01wTHhUcTh2V2ZzREFRRG9Qa2pBa1d2bytKNG51?=
 =?utf-8?B?V29TSmUyTDFtN1ZKVFEvNDFVSTBYTWFTYVdzbDJDS3lDZS9Md3pjNmhOUktj?=
 =?utf-8?B?YWZkZytDdnEwZXMzdXdabXBtVVl4VC8vSUFFZld1UVZPS3JOQ3R6YjZYMGE0?=
 =?utf-8?B?WmwreXBWaEE1TGk4aG5hZ2xra043bXNWMnRVWWFJc09yUnYyRTREcisvMXpU?=
 =?utf-8?B?REN6TlNKZXdXRk04YUtXb1E0Uk9yWXBGTFk5V3BkS0orNElXQ2FWbkJlcXVF?=
 =?utf-8?B?cjdJd1ZUUVBOTndpTFBnWHFma0g4a1d6WEJYcmtlSG1OSHVsZlFXYjlucUR3?=
 =?utf-8?B?RGlJakk0L3kveUZud1lwejZ0NnpBZGN0d3BUYU9nVzNFUjNib0hmeWl6em9o?=
 =?utf-8?B?bCtGdDJST0xsRE5NekovcEE4SzVSRDNKM1JVeDEraVRoQzBaRlIwS25Ub3Ax?=
 =?utf-8?B?cHUzMUFQaGRaTDFuQ2hJaXF2dzh5U2JCcmg3S09DWHZSdGtISmg5bWZUSU9h?=
 =?utf-8?B?dVFpVUI0RGcxM3BmdmV1U3JHSmEvOC82anl6MExlSGRtMVhyUGhBdUR4T1hV?=
 =?utf-8?B?RWt5d1RFQk9DQjRSTkdicDh2d2xNWm9uWTdua3lBMWxlalViNHBjdTQ0eW5w?=
 =?utf-8?B?eGpXeTVLQTd5d2N5V1ZQMHh4YVJiQnhhZXJUdkt5TVc4b2Vhc2ZSNDZ5c09a?=
 =?utf-8?B?RnBuUGNYQ0lPVFk3TVB5dERvL0pPdC9ZS1VrbmNZcDRWeWJQRjdVQVAwMWl0?=
 =?utf-8?B?UktuT0kwbGVDQlpIMnBiUTl0NVlxcVRYTmhsY0NmTXlkQnV2blF1VWpRYkp6?=
 =?utf-8?B?eXRsOWpoZlZWaVJLZE5kWGJXWlhhTE00dmhzaTV5Tmx0dGl1akMzdVZISVdN?=
 =?utf-8?B?MW5BamMzQ3BjSFBSNzRiS3JCRzkxVUx2SDNMWldJUk84SXFkK2owcFYvcUxK?=
 =?utf-8?B?NzMzd0ZzSGRrNVZFR3NKOTM0b0EyZ0hhVmgvZVVJdFZuWE91UktXTFgwR0Vk?=
 =?utf-8?B?WnJlSnh4OEJRa2dBckZkWnFYL0JZTVpiMko5ZmR5Wk4za2FIa1J0TklqZlgx?=
 =?utf-8?B?OEZhcEppWkNseGRINU9xSlJGNmlYMGlaSTByUzZzdTk4Tmo5cmdnYUNrUks2?=
 =?utf-8?B?UHN4WGhwdmJ1Yy96WFRvM25mVjk5SFRhK1hJOXlyT1RITHgwdm5ISm5teEhx?=
 =?utf-8?B?SUo4bllBQnlrNTE0RkhhSDd6aXRTNEZpN1kyaXg5eDhrTHVqZ0JTc2ZzVnJC?=
 =?utf-8?B?cnZJdWxJWjI2ZG1pVmVvZGtCUXN6VlBrV2drTGx2Y3ZYL2tndFMxYllSOWEv?=
 =?utf-8?B?QTJheENINGlpNU1wQk9STyt5QlI3OFFZWGhEWlczUExPRksreEpjS3pGZWha?=
 =?utf-8?B?Q2ZqWDV0RE5HVE9OazFwTnJhOWFOQVRnd3FOUFlUend0NElia1E3RjFTU2tE?=
 =?utf-8?B?V04xNlllSFJseFE2NUwwTURRaHNOQ2t3dGRmWEU3VlhjRWE1Wk51YlRRb2NZ?=
 =?utf-8?B?Rm9KQy9COVBsR2Z1eWpJQkc3dkgrUmFVMEhlTFdkUXAyRWVtaFRNWVN3cXRI?=
 =?utf-8?B?bTU0YXpHK1ZwTklzTzJoSGR2MEw0YVpEUDJPTmczUFRyczBpVC83UjZra1ps?=
 =?utf-8?B?V2g1b3ZtQkZvSDlzQzVIM1lSTzNEbW1JTmp5WlhIYi92dUlYcklCencyTzUv?=
 =?utf-8?B?MkVVSkZUWTVyd01wMjU3MVZBYUdIODViWFp5aWtUdTcyZ1BUMXB6SlRWQS9T?=
 =?utf-8?Q?r2Sk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311af2f0-84d9-42c7-f385-08dbf6a63f9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 21:56:49.4956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/qPXAbw2m26KflU3+Lz8Ha42YeI8NhSvaAt2at51Z4dVwHCuu+G/vdvME5Kh+nL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6593
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 21:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191935

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFhpYW5neXUgQ2hlbg0KPiBTZW50OiBkZW4gNCBkZWNl
bWJlciAyMDIzIDA4OjA3DQo+IFRvOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBD
YzogcXVhcmVzbWEuam9zZUBnbWFpbC5jb207IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gb3BlbnNzaDogc2hy
aW5raW5nIHRvIGEgbmV3IFBBQ0tBR0VDT05GSUcgbGluZSB0byBzZXQgc3lzdGVtZCByZWFkaW5l
c3Mgbm90aWZpY2F0aW9uIHN1cHBvcnQNCj4gDQo+IE9uIDEyLzIvMjMgMDI6NTMsIEtoZW0gUmFq
IHdyb3RlOg0KPiA+IENBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJp
dmVyIGVtYWlsIGFjY291bnQhDQo+ID4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlLg0KPiA+DQo+ID4gT24gRnJpLCBEZWMgMSwgMjAyMyBhdCA2OjE04oCvQU0gWGlh
bmd5dSBDaGVuIDx4aWFuZ3l1LmNoZW5AZW5nLndpbmRyaXZlci5jb20+IHdyb3RlOg0KPiA+PiBG
cm9tOiBYaWFuZ3l1IENoZW4gPHhpYW5neXUuY2hlbkB3aW5kcml2ZXIuY29tPg0KPiA+Pg0KPiA+
PiBVc2luZyBQQUNLQUdFQ09ORklHIGxpbmUgdG8gc2V0IHRoZSBwYXRjaCBvZiBzeXN0ZW1kIHJl
YWRpbmVzcyBub3RpZmljYXRpb24NCj4gPj4gc3VwcG9ydCwgaXQgY2FuIG1ha2UgdGhlIC5iYiBm
aWxlIG1vcmUgY2xlYXJseS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogWGlhbmd5dSBDaGVu
IDx4aWFuZ3l1LmNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS41cDEuYmIgfCA1ICsrLS0tDQo+ID4+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPj4N
Cj4gPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVu
c3NoXzkuNXAxLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hf
OS41cDEuYmINCj4gPj4gaW5kZXggYmJiOGZiMDkxYS4uMmMxYzgyMWVhOSAxMDA2NDQNCj4gPj4g
LS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS41cDEuYmIN
Cj4gPj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfOS41
cDEuYmINCj4gPj4gQEAgLTUzLDEzICs1MywxMyBAQCBTWVNURU1EX1BBQ0tBR0VTID0gIiR7UE59
LXNzaGQiDQo+ID4+ICAgU1lTVEVNRF9TRVJWSUNFOiR7UE59LXNzaGQgPSAic3NoZC5zb2NrZXQg
c3NoZC5zZXJ2aWNlIg0KPiA+Pg0KPiA+PiAgIGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tlbnNlcCBw
dGVzdCBwa2djb25maWcNCj4gPj4gLURFUEVORFMgKz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdE
SVNUUk9fRkVBVFVSRVMnLCAnc3lzdGVtZCcsICdzeXN0ZW1kJywgJycsIGQpfSINCj4gPj4NCj4g
Pj4gLVBBQ0tBR0VDT05GSUcgPz89ICIiDQo+ID4+ICtQQUNLQUdFQ09ORklHID8/PSAiJHtAYmIu
dXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnc3lzdGVtZCcsIGQpfSINCj4gPiBUaGlz
IG1ha2VzIHNlbnNlIGlmIHNvbWVvbmUgd291bGQgbGlrZSB0byBkaXNhYmxlIHN5c3RlbWQgc3Vw
cG9ydCB3aGVuDQo+ID4gdXNpbmcgc3lzdGVtZCBpbml0IHN5c3RlbQ0KPiA+IHdoaWNoIGRvZXMg
bm90IHNlZW0gdmVyeSBsaWtlbHkuIElzIHRoZXJlIGFueXRoaW5nIGVsc2Ugb3RoZXIgdGhhbg0K
PiA+IGNsZWFudXAgdGhhdCB5b3UgYXJlIHRhcmdldGluZyB3aXRoIGl0ID8NCj4gDQo+IEFoLCB5
ZXMsIHRoaXMgY29tbWl0IGFwcGx5IG90aGVyIHRocmVhZCdzIGNvbW1lbnQgKG9lLWNvcmUgbWFp
bGxpc3QNCj4gIzE5MDU5MyksIGR1ZSB0byB0aGF0DQo+IA0KPiB0aHJlYWQgd2FzIGZpbHRlcmVk
IHRvIGFub3RoZXIgbWFpbCBmb2xkZXIsIHdoZW4gSSByZWFkIHRoYXQgY29tbWVudCwNCj4gdGhl
IHBhdGNoIGhhcyBhbHJlYWR5IGFwcGxpZWQNCj4gDQo+IHRvIHRoZSBtYXN0ZXIgYnJhbmNoLCBz
byBJIGNyZWF0ZSB0aGlzIGNvbW1pdCB0byBtYWtlIGEgY2xlYW51cC4NCj4gDQo+ID4gSWYgc28s
IEkgdGhpbmsgdGhlIHN0YXR1cyBxdW8gaXMgYmV0dGVyLg0KDQpJIGRpc2FncmVlLiBUaGlzIGxv
b2tzIGV4YWN0bHkgbGlrZSBhIGNsZWFudXAgSSB3b3VsZCBsaWtlIHRvIHNlZSANCmhhcHBlbiBp
ZiBJIHNhdyBhIHJlY2lwZSB3aXRoIHRob3NlIHNwcmVhZCBvdXQgY29uZmlndXJhdGlvbnMgdGhh
dCANCmNhbiBiZSBzaW1wbGlmaWVkIHRvIGEgc2luZ2xlIFBBQ0tBR0VDT05GSUcuDQoNClRoZSBj
b21taXQgc3ViamVjdCBpcyBhIGJpdCBvZGQgdGhvdWdoLiBJIHdvdWxkIGNoYW5nZSBpdCB0byAN
CnNvbWV0aGluZyBsaWtlOg0KDQpzeXN0ZW1kOiBTaW1wbGlmeSBjb25maWd1cmF0aW9uIG9mIHN5
c3RlbWQgc3VwcG9ydA0KDQo+ID4+ICAgUEFDS0FHRUNPTkZJR1trZXJiZXJvc10gPSAiLS13aXRo
LWtlcmJlcm9zNSwtLXdpdGhvdXQta2VyYmVyb3M1LGtyYjUiDQo+ID4+ICAgUEFDS0FHRUNPTkZJ
R1tsZG5zXSA9ICItLXdpdGgtbGRucywtLXdpdGhvdXQtbGRucyxsZG5zIg0KPiA+PiAgIFBBQ0tB
R0VDT05GSUdbbGliZWRpdF0gPSAiLS13aXRoLWxpYmVkaXQsLS13aXRob3V0LWxpYmVkaXQsbGli
ZWRpdCINCj4gPj4gICBQQUNLQUdFQ09ORklHW21hbnBhZ2VzXSA9ICItLXdpdGgtbWFudHlwZT1t
YW4sLS13aXRoLW1hbnR5cGU9Y2F0Ig0KPiA+PiArUEFDS0FHRUNPTkZJR1tzeXN0ZW1kXSA9ICIt
LXdpdGgtc3lzdGVtZCwtLXdpdGhvdXQtc3lzdGVtZCxzeXN0ZW1kIg0KPiA+Pg0KPiA+PiAgIEVY
VFJBX0FVVE9SRUNPTkYgKz0gIi0tZXhjbHVkZT1hY2xvY2FsIg0KPiA+Pg0KPiA+PiBAQCAtNzEs
NyArNzEsNiBAQCBFWFRSQV9PRUNPTkYgPSAiJ0xPR0lOX1BST0dSQU09JHtiYXNlX2JpbmRpcn0v
bG9naW4nIFwNCj4gPj4gICAgICAgICAgICAgICAgICAgLS1zeXNjb25mZGlyPSR7c3lzY29uZmRp
cn0vc3NoIFwNCj4gPj4gICAgICAgICAgICAgICAgICAgLS13aXRoLXhhdXRoPSR7YmluZGlyfS94
YXV0aCBcDQo+ID4+ICAgICAgICAgICAgICAgICAgIC0tZGlzYWJsZS1zdHJpcCBcDQo+ID4+IC0g
ICAgICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdz
eXN0ZW1kJywgJy0td2l0aC1zeXN0ZW1kJywgJy0td2l0aG91dC1zeXN0ZW1kJywgZCl9IFwNCj4g
Pj4gICAgICAgICAgICAgICAgICAgIg0KPiA+Pg0KPiA+PiAgICMgbXVzbCBkb2Vzbid0IGltcGxl
bWVudCB3dG1wL3V0bXAgYW5kIGxvZ3d0bXANCj4gPj4gLS0NCj4gPj4gMi4yNS4xDQoNCi8vUGV0
ZXINCg0K

