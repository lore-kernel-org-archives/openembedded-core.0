Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4FACDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 18:44:14 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.61])
 by mx.groups.io with SMTP id smtpd.web10.1225.1697654654332491214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 11:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=ZB6OWwgD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.61, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KG1PQ4iDvn7BixZCmOCsISuantYZzrkQUy1+OMw6cF0E3o+AQzQJNdpLZLE4aMY4bZVF337OosFD34sGvaasbShgYtw5doEin9O3QW8e5u3vEDUuAituYqb9pQTfI73kVy4WbS5Zp5STwuqJftqK9kmFAMkel6W6Mbwe7hlEKF1G8yVyus5bykZvyxgRZVAyzSnns4A0TXGzO+oGkqWjG/2xnozc9CDi2mknuVqXiPWhBZTTbKvAG4qmDA7B4U7npPcGuoIllQ9YYgRSuwB9KZkfBiNVp0p0R+IdUHLpYuBn3JbBRTwx9hN87OvMQsqeN5LLKeHBRmC1Ra4VZuTg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF3nHAkeklmChDo+X+wpufv+M3szDQ9J6LM4Ehqx+Bg=;
 b=I5Nbu6Mu8gaQogvK4vQ+nTHxnK2UlLZmMvqOmaFyyTlOIec5jkrL4yF1RtdoZQTQtDXWrYOIh9KmaDMHTbeGabMLvxmdjvaSieQ7IFFyackpr8l13uM35LvG77Ugfz4A5OZYKYBXGjTeMTb7bnD0WaJY38v1SZRP2oMXE2Fvx8V+BUcKFhoaQL+Za1V0umpBXKpRpc6wGTNhzM6zCpW8RiQx2rzK98sV9AqxsFR7bfPPX+k63TKtQcPHb5hRDskclNhm8iKBCbsKHLB29LfuhtUFlQeKiSmf9Bd3suEUk8PPbFpJo03CPkkXYZY2bbh3yFLRW/wlPtzJHidZviK8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cF3nHAkeklmChDo+X+wpufv+M3szDQ9J6LM4Ehqx+Bg=;
 b=ZB6OWwgD2Dx6OxgHXQzQQtFLat8BEXgodzSlr1+ADfE64rTDVQTqY6CIKztYjWAuDRBSqzBv6Y6lPu/GOofYSCv35ZzQauN9O4cjWRilfOwPMwYqwF7AkKouu7fqptSsq/5ovTfk+z4KLci4sYT51k3rT7tEesq7kdofUnAHGgLEj86rPqRNpsglAyG/bHyw0LjgrMNwCKDvfFGR55rKnBXUvN4xaIknamlv6PQVCKN3ZcxpjifmaKzudDG/kxSCzaeBDJIpX5WOA/kJ7z0fBNonnexWN/2/90KTTTc9NxHjI/Wik7aW6P4pPzAbt8S/OZoIqT9YfS1qmU5yfy8lhA==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 LV3PR12MB9329.namprd12.prod.outlook.com (2603:10b6:408:21c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Wed, 18 Oct 2023 18:44:11 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 18:44:11 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jon.richardson@generac.com"
	<jon.richardson@generac.com>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: RE: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Topic: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Index: AQHZ/UpPSpqXsZ6kUUCDzfR30Ie+b7BP6tQAgAAAoMA=
Date: Wed, 18 Oct 2023 18:44:10 +0000
Message-ID: 
 <DM8PR12MB543052BA41D9B837EAF752908BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20231012202535.2902235-1-chris.laplante@agilent.com>
 <202310181841287c53633a@mail.local>
In-Reply-To: <202310181841287c53633a@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=72013273-4f4c-4cce-afdf-98440ebe27cf;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-10-18T18:43:42Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|LV3PR12MB9329:EE_
x-ms-office365-filtering-correlation-id: bc10df17-b903-424b-3ada-08dbd00a37f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pDSQxbxi4DmGrfJuPN5HyDQy4bcciD8V2JoD7ACLcT4X4Vp+rwVWYLqJIaQmKD/OqqoQGpt6tVVWG2KrTUmWnXQAJzY9O5Vte9egUG5avzuwLRuNoZcVSZ2zW5WViXr9iDF8YFKEggqJcWFFrcy/KSksoJqR5TQxu3nZ+oAuL0BYpgMwXfK6ijXbb3nU+dB/vzoJI0IEdMGl1uwpJHAwFG1EEBgsDHqPWaYAR4nEJlAydGH56D2jHyWssAjzHkJ3YWVaBh2CQ0BP8G4p+m4qdk18pkbdbKzsE7p6fJT/V08geVjg51NztF+RczWkCJ2rc+ci5o18Z1USOYjDCgVwQTg+Y7L78AleJbipZZdvnFBW4YtjiPSBF5MG3HtjSphcJUxaDjn2hOXsrwqyYrsi3L2NDQCS7VDCvJF+s6cN7GQGVFzTilLH7qRCBh2g129L8WKcbN5UklrGCfD1SxVTrJ/kC7L/LbvQ1db/9vQ+lKNQNxe2I40n7bLAswHnadU4jQhEHTpqrXe0J46xIL/EL9w8oTuaOLX0OUyYUSk/WA/Hwdn5EUfOzASAPDCTpL2N6UTiiaiJQ2ZAzzcE1mF5log+7OLx2t8w/FdHAhaVcmlMNyTh7cXVVOykFAKNed6v
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(966005)(66556008)(6916009)(45080400002)(66446008)(54906003)(66476007)(66946007)(76116006)(64756008)(478600001)(71200400001)(26005)(6506007)(7696005)(9686003)(5660300002)(33656002)(40140700001)(4001150100001)(2906002)(4326008)(8676002)(8936002)(52536014)(41300700001)(38070700005)(122000001)(316002)(86362001)(83380400001)(38100700002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RWQzOVpNdGpQOGdVRkkvWFZWS2JvcWk4bm9GNGRHaFNPckRZTWpOWUNpSEJa?=
 =?utf-8?B?cFlxUjlFa1hKNFl1cjNxMGRoeUNhRFhpUlF4WFdrSC9SQi9meWZ6bGZyc0pq?=
 =?utf-8?B?OW5CdzE0eVdmMmxqci9NejUvSEx0S3drRlBWR3Z4SWI3dWhsZ1JVMGQ2NTJP?=
 =?utf-8?B?aXNKRGIxVEtqMFdPNUhURnJ6TnRCVVlMQjlJQXFIVWhQK3J5SlhGdTZUSmFT?=
 =?utf-8?B?NFl3anpXbXNZb0M0SFgzdktJVWMvR1MwblRaMWI4dmRPRWFiUEtRSURoUUw0?=
 =?utf-8?B?V1Z3OFF3WDd6NjVQYnNpNVM2VVdweEtqSzN3VGQwbzIydDhZMjMxNWV6Z0gw?=
 =?utf-8?B?SWdhT25PQndkZGh0bFNzRGVFZ3gxRUZzUVBtd2orNEY3VklUNG9xOWhHWkMy?=
 =?utf-8?B?Sy9PcnRSU1ZZSWlZLzJGZzROMkFxRW1xQk9EL3ZXd1ZzaHA0ZkM0Zkc4amEx?=
 =?utf-8?B?cXVqdko1UUROTlhrK1J5VHdnMVB2RVBidjlCZks2TENuWGxSbkhORS9PR3Vl?=
 =?utf-8?B?dm5lZkZZd1FDem0xNkJGc0ZHa0tkaW95QTNvWlJBdFJ5Y1R4Y0Z1dnViZG9i?=
 =?utf-8?B?Qkc4Y3pzM0Q2TWl4Ry9oZExOZjlPRFhEMGxGOU0vSUV6dDhmMzJzc2c2QWcy?=
 =?utf-8?B?NUhkUkF4YjhsWWJhQ0phdDF5cjBzNEtNRGpUMjdhd3lxK1F1L0pDWU1YdXUy?=
 =?utf-8?B?RGZMcHZxKzlVa3B6anhIQTBneDFiTHN6THlaQjhjNHk2YXZCeGhKOE1RRUVZ?=
 =?utf-8?B?eE4wU3dzVE15dm5xaXJxVUFZMVdMOVVVL1ZrSG5NK3BKL1JIbzl0UEN4S2xN?=
 =?utf-8?B?TFN4QUtyeU4vQkYydFBZQ1Y5VHd5N002SURRU2oxYis1MFpLSERZWnk3UDhp?=
 =?utf-8?B?bjRsSDZaeEpaTTBxVTZTT1ZHSWVWbUVjWHpZU09yNFNEUVNFOEVvWlQvRG9y?=
 =?utf-8?B?dmFTdTZhenlsNG9rQnFRNDBPaDQzYUkrUmZLdkErSzBGKzFLU01nL25lK3Bm?=
 =?utf-8?B?cGtUMTdVZzVZa05hbUxRRXhzOHFmaVcrc0pnWGxpSml4MUpxblNkR3RUMDg4?=
 =?utf-8?B?alNFRktMWFZYOExkbEQwaG5xZ0RhNmdWOGNzMjI2cTZ1bGltSWxXZEFEaHhF?=
 =?utf-8?B?bklveldxYi9CYlRabGlJMnUxbkIvblBQYXlnQXlmcXN1Rlc3NVB1QS9WeWpN?=
 =?utf-8?B?MEFWa1NmaXNuTWZ5T0hVYmhEVDMzR2lhd1VGQ1ZRSGxPSmR6dkpJaWk5U2FN?=
 =?utf-8?B?YzV6R1I1b3BuQlA2L0V1TWpSeWJTMlZtSVJtMG1DWkdqcTRLUzVDYmliUjVX?=
 =?utf-8?B?TWlZL1Y3aHAyY3RLQlJoVUZnL2N0dDZYeEpPVW1LVDlDTDlwMWdvTTh2b2tV?=
 =?utf-8?B?K1lnRjZBQUhHVE9wQUpyVVRiV0puU3BXajhGM3hoZDU5RHl2VDc3YllUVk1q?=
 =?utf-8?B?amdsMWttOG5BbGZrby80Tllrb2o4NDM5TmpkcE9VS1dBZkVTUEVRaExnOEpo?=
 =?utf-8?B?ZHhqSDhScXpkeGV3RlRuQ0UyUndGUy9ZY1k4WHY5MDl4MGZYMGhaSUNMcW5N?=
 =?utf-8?B?cXNIcTZDenVZMHpSSUhxRnFjVWNaaE9MSzlIeDhJUVM2eTNRWjJRME5yU2pH?=
 =?utf-8?B?YWFYcnFOYVNRd0xuWG41UkhmSUF0Q0doTERmN3QwOFRwcWJoMGdXTWk1RSs5?=
 =?utf-8?B?dVRSdFBHOWFSYkVJY2dBUXM2RmkySVg1VnFCdlhZZU8wYUJTa2s2Z2l3VFlr?=
 =?utf-8?B?SEZzWDVzM293bGNRbDk1QmY2STFGcE1LTXRCSXZsSnJzeHJjNHNUZm5nWi9o?=
 =?utf-8?B?SzlmOGk1ZU1yQ1ZsZ1pyTUExYVZCNlBEU0ZaalJEamREeG1iMVlsUUhzN0NB?=
 =?utf-8?B?cHBqU1l5Mnl1K1FSQTFVbWtEQi9Ld0tnWEk4ekszZFZGNjBMSHhVZEdBRGZR?=
 =?utf-8?B?UTlJaFYrVFdwS2xQRWpRc21ma0g1Y3VvcGszN2lzeW11MGFuM0pMVEkrRnlB?=
 =?utf-8?B?UzNtQVVFY1ZHRnhFcGN0K2NFdVhsK0hTa0p4ZnBmaDlWQURVRUZIelkxYjVy?=
 =?utf-8?B?YnUraERldjNURUxmWGx5dUdqdEQvVDRWZ2l6NUI2cVZvWjJCclNrSG1Icm12?=
 =?utf-8?Q?sCVTfeEp/MqbXFHh7wmmvR+lW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc10df17-b903-424b-3ada-08dbd00a37f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 18:44:10.9550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFr4iwgbNfGYMaPdvwew4FITGq+CPCcwN0kJn1HKk0HKBVpmm71OcLbkBzbs5g6ldlNbto/an/T1z6nU8uIbJOFNU7uzYXVXLro1+1vr3Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 18:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189419

PiBIZWxsbywNCj4gDQo+IFRoZSBzZXJpZXMgY2F1c2VzOg0KPiANCj4gMjAyMy0xMC0xNyAyMzow
NzoxNSw1MDkgLSBvZS1zZWxmdGVzdCAtIElORk8gLQ0KPiBkZXZ0b29sLkRldnRvb2xVcGdyYWRl
VGVzdHMudGVzdF9kZXZ0b29sX21vZGlmeV9rZXJuZWxfb3ZlcnJpZGVzDQo+IChzdWJ1bml0LlJl
bW90ZWRUZXN0Q2FzZSkNCj4gMjAyMy0xMC0xNyAyMzowNzoxNSw2NzUgLSBvZS1zZWxmdGVzdCAt
IElORk8gLSAgLi4uIEZBSUwNCj4gU3RkZXJyOg0KPiAyMDIzLTEwLTE3IDIyOjI4OjM1LDc3MyAt
IG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIEFkZGluZzogImluY2x1ZGUgc2VsZnRlc3QuaW5jIiBpbg0K
PiAvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL29lLXNlbGZ0ZXN0LWNlbnRvcy9idWlsZC9i
dWlsZC1zdC0NCj4gMjY2NzU0Ni9jb25mL2xvY2FsLmNvbmYNCj4gMjAyMy0xMC0xNyAyMjoyODoz
NSw3NzMgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBBZGRpbmc6ICJpbmNsdWRlIGJibGF5ZXJzLmlu
YyIgaW4NCj4gYmJsYXllcnMuY29uZg0KPiAyMDIzLTEwLTE3IDIzOjA3OjE1LDY4MCAtIG9lLXNl
bGZ0ZXN0IC0gSU5GTyAtIDc6IDEwLzMyIDExNi81NDQgKDEwMDguNTJzKSAoMA0KPiBmYWlsZWQp
IChkZXZ0b29sLkRldnRvb2xVcGdyYWRlVGVzdHMudGVzdF9kZXZ0b29sX21vZGlmeV9rZXJuZWxf
b3ZlcnJpZGVzKQ0KPiAyMDIzLTEwLTE3IDIzOjA3OjE1LDY4MSAtIG9lLXNlbGZ0ZXN0IC0gSU5G
TyAtDQo+IHRlc3R0b29scy50ZXN0cmVzdWx0LnJlYWwuX1N0cmluZ0V4Y2VwdGlvbjogVHJhY2Vi
YWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KPiAgIEZpbGUgIi9ob21lL3Bva3lidWlsZC95
b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtDQo+IGNlbnRvcy9idWlsZC9tZXRhL2xpYi9vZXFhL3Nl
bGZ0ZXN0L2Nhc2VzL2RldnRvb2wucHkiLCBsaW5lIDIyMzYsIGluDQo+IHRlc3RfZGV2dG9vbF9t
b2RpZnlfa2VybmVsX292ZXJyaWRlcw0KPiAgICAgc2VsZi5hc3NlcnRTZXRFcXVhbChzZXQodGFn
cyksIHsiZGV2dG9vbC1iYXNlIiwgImRldnRvb2wtcGF0Y2hlZCJ9KQ0KPiAgIEZpbGUgIi91c3Iv
bGliNjQvcHl0aG9uMy45L3VuaXR0ZXN0L2Nhc2UucHkiLCBsaW5lIDEwOTcsIGluIGFzc2VydFNl
dEVxdWFsDQo+ICAgICBzZWxmLmZhaWwoc2VsZi5fZm9ybWF0TWVzc2FnZShtc2csIHN0YW5kYXJk
TXNnKSkNCj4gICBGaWxlICIvdXNyL2xpYjY0L3B5dGhvbjMuOS91bml0dGVzdC9jYXNlLnB5Iiwg
bGluZSA2NzYsIGluIGZhaWwNCj4gICAgIHJhaXNlIHNlbGYuZmFpbHVyZUV4Y2VwdGlvbihtc2cp
DQo+IEFzc2VydGlvbkVycm9yOiBJdGVtcyBpbiB0aGUgc2Vjb25kIHNldCBidXQgbm90IHRoZSBm
aXJzdDoNCj4gJ2RldnRvb2wtYmFzZScNCj4gDQo+IGh0dHBzOi8vbmFtMTIuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmF1dG9idWlsDQo+IGRlci55
b2N0b3Byb2plY3Qub3JnJTJGdHlwaG9vbiUyRiUyMyUyRmJ1aWxkZXJzJTJGNzklMkZidWlsZHMl
MkY1OTI3JQ0KPiAyRnN0ZXBzJTJGMTQlMkZsb2dzJTJGc3RkaW8mZGF0YT0wNSU3QzAxJTdDY2hy
aXMubGFwbGFudGUlNDBhZ2lsZW50LmNvDQo+IG0lN0NlNjlhNjAyOWY4Yzg0MjhmMTQwMjA4ZGJk
MDA5ZDgxMSU3Q2E5YzBiYzA5OGI0NjQyMDY5MzUxMmJhMTINCj4gZmI0YTVjMCU3QzAlN0MwJTdD
NjM4MzMyNTEyOTM3MTQxMzYxJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOA0KPiBleUpXSWpvaU1D
NHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QN
Cj4gJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT1wdEhjUmYzUDglMkZnNkclMkJnQTJaWFI2U1NWdUtK
Y1pHT1JVdw0KPiBVemJZb0o3MEUlM0QmcmVzZXJ2ZWQ9MA0KDQpJJ2xsIHRha2UgYSBsb29rLCB0
aGFua3MuIFRoaXMgc2VyaWVzIGlzIG5vdCByZWFkeSBmb3Igb3RoZXIgcmVhc29ucyBiZXNpZGVz
IHRoaXMgdGhvdWdoIDooIA0KDQpUaGFua3MsDQpDaHJpcw0K

