Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0A3C4167B
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 22:00:43 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.58])
 by mx.groups.io with SMTP id smtpd.web10.68524.1701036038231974863
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 14:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ZrhEDcsW;
 spf=pass (domain: axis.com, ip: 40.107.241.58, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbCVgapF/AiTGPL12mMjjUN8pSRi3ifflxBkLINpdf6U29Cjf7Esm8KxUxYl6WAE+b03NIiQSJpP6wQReihCDk5lc4iAEEIahLI1+7sicsuZ+U8JW8e9XTXO/NIb8ZeAu9+K3Nsaa/0e7G4gZVA7rY6vvUsKmOO1IZ0+MD8TKs4tdlfKsTf64dEJPcnqwGVzfUUK/RqE2wUlJt4S6leteJkUovwZr5PY3gxSXCOCYoYzsNCCyVs9p1gphTUGwpDQU1/OHPomC7nPGGCZT5tcLebNFyH5igPAe3bteIsU7vk/Nfml16NWr6VYSQ2PlNqqUbukjvxhqWv3N5HB4hQnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQSfNko3rGUmjej7+ZGwCmtBNarvOxOqZkPlBTMBbQA=;
 b=hpYuU+l9B4MlZFrqrhE7pYM0WPHXIPLJQQCEOFueWJ4po/yTHkE9uKbMVzdPT9mZ8Ayh4OQxujfpJCubbtINSKH36kjWv4AGSVCY4dyTRrpw+Mgp4JuRZkZQHIQjuDNyHGu/wAsUTpWPBh/tplJd3abrzCeMl6iPxMB68MAelWj4jXcvPqhu1YMDBrWPsFt2YAS9ZG+HnxT/5UeKFfAmjFyRKb+0+U1Ab7d27Hm+ys6NbgVLCH13fMd/1PvQjhboMKG4z2Xh77FIFQqnBQ0v4+3+Tbh7v4WQLtqFyBGOdm0Jg4lVSpeQpZaFeHaL6CFb/x1R9FcpBqZEx9WYPUD/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQSfNko3rGUmjej7+ZGwCmtBNarvOxOqZkPlBTMBbQA=;
 b=ZrhEDcsWVB5D95rr8N1KsLKe5tH2GDtyGdfvymHEmKn2Yz1HPyB+E8WMwHMJsNZVAy8U3vEc+dfFcS5IEgmwG/uf4epuNXcSK/XHbH8XP+k6xDyNpK4DaGOYNcT/IW9azO+H/3ngaYt2UpkElf1zlAuz8e8OSD6jzqcd5jrrYM0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBAPR02MB6038.eurprd02.prod.outlook.com (2603:10a6:10:18c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 22:00:33 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%5]) with mapi id 15.20.7025.022; Sun, 26 Nov 2023
 22:00:33 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Hundeb?ll <martin@geanix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libpam: split /etc/environment into
 pam-plugin-env package
Thread-Topic: [OE-core] [PATCH] libpam: split /etc/environment into
 pam-plugin-env package
Thread-Index: AQHaHuBS6PlRIFxJFE+dXar7PCVBoLCNH73g
Date: Sun, 26 Nov 2023 22:00:33 +0000
Message-ID: 
 <DB5PR02MB1021314D52B17E1D8D7EE96A8EFBEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231124141213.2071910-1-martin@geanix.com>
In-Reply-To: <20231124141213.2071910-1-martin@geanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBAPR02MB6038:EE_
x-ms-office365-filtering-correlation-id: b56c1cec-695f-4655-bacc-08dbeecb1d27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7YKULaOqzJ1/wuNnKdPHbd/7XATCuGqtaH8X+opTuUUlYgMWW1sMCMlFVmM8GOc/MY41qOC6Qg3W8GKqtJT/wbpD7Ugm6PMmfgh6MJkGJmYvViBWa5wMcFTFKQ06s5o6g/5uV+srNjR3tZDttEY6Ihxm+INQDUUkRy3tt8Qt0FwwQc06AUfzxT9A4Bl3foTHPasqRaapLxZN/0HK8yryyZdUIFTICyqe6wTjCa8iJ7u4FVBFzW0g7UUlVrjybzgkRgiDOBJpHyzZ4CNgkOwltR09budkLL1jgCKXHQCc/FSA/lT2XhP1zSer60nrMk7J7yrzu3zL53xuwQ0KJ9257dc3qdfp40fXH4nrmNZjPtB+ZunCGe71WVniuQRsuinQjafIfozgdSSFjcjolYBkePbmDubpRvXkKr7BN72pBXA3I17CRS1DNovYmXEa/eSDZ0wJc/wz2WOK2YmOXGOFHQz87LSBa1MngJjKugJzFjn4kkn59hg7G0tNuSck63h1ZYsfGWlDJt/ASBT3NF3AF4oIKgTT6TFzL0FE2fGmUZx78jpt6uSnPIRI/SQsQu/gldgYTxljVyKzFgfuKUgRbl5KuvzlPV6KsJCtruhdTyFltyk+aLTa56yNhDhb9zzu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39840400004)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(26005)(71200400001)(9686003)(53546011)(6506007)(7696005)(66574015)(8936002)(8676002)(55016003)(44832011)(86362001)(5660300002)(52536014)(478600001)(64756008)(316002)(66446008)(110136005)(66476007)(66556008)(66946007)(76116006)(38100700002)(83380400001)(122000001)(38070700009)(33656002)(2906002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U1dsWWk4RkRwdGVHN3J4QlM1eHlWL1pTMWhRWFdaL0tCbDBGcTdSVzVxTHJ1?=
 =?utf-8?B?cFp1N3hyZTAxSy83dFVDOUJBQXcvYzJ1dy9DNzVFWUFVQjNxZjJtM21MOUV1?=
 =?utf-8?B?bzJiNkFyb3Q4SlViRjJRQVJWejF1Yks4ZEg5YlBqcnU2ZVZFdTZBZmNFb0xp?=
 =?utf-8?B?TnFZaFROcVB5NDRMNzFOTExrVjU5dlJzeWJNMmpuTnJnNFhVTFBOenJBWmVp?=
 =?utf-8?B?cndmMVBndTdWNHFKbHIyU1VWK0NraHlzeVErS1ZYNmExNWduejIyNXlHbEYv?=
 =?utf-8?B?QWZ3M2RuV0Z6TEhqem9vSlU0QmlidE9LZ0ZPVi8vb3pqcHVyRVN6WlEzR0VG?=
 =?utf-8?B?Z3NWZHdlVGIyVlFVVi9UNWo1RFFiOURRNkdpeitZdTd0cFlZcGo5NVdNVTM0?=
 =?utf-8?B?eXZvckFwYjdDZkk5ZHlJOGFlRU9ZTFJXdkxWRWl5emFnMXN0OXhHVytYbVBX?=
 =?utf-8?B?cEJlOTZ2NzJseUlhbUVjZGx6WU1nZWY1cDgwRTZ2TCtqOFZjYnZCWDVmWUxT?=
 =?utf-8?B?MVFrNHYzYXVqRXNNUWRnWHQ4Y2Y0VHZuZ2RMSTRkQUZHNXJEY2k4K2ZFbm5T?=
 =?utf-8?B?UENWU08wa284eE50ZmdKenBscEZja2E3V1g5WmF4Zy9Kdk5sR3M2V2hCTHdQ?=
 =?utf-8?B?K0hTdDJ1L28rc2NQcXVSUlNYNVVIVjFPTVFhU0Jvbko0VVBETDdhRkFtNml1?=
 =?utf-8?B?UHd6dzNOZGV5dDNzSkFzNCtHdS9YbVVXMjgySmtrSVlQaDlRQXpwQXpUMmhk?=
 =?utf-8?B?T05TTmVKenZrb0h2ZWlLWkRTVmRJNjdUYXVoU3llSlZCeXdZUlRuUVQ1bWVI?=
 =?utf-8?B?QTVSMHJQS3BtRDRCQitsNytnYmlpWVg0TytLam1xcjQ1OHVXSUhZQVIxS2RN?=
 =?utf-8?B?S3MwcWJMOWdJQ0dyS1Y2emVoNFEvcGczeGN6SnpndVFTbUpDU0FSanQzeFFW?=
 =?utf-8?B?RmFGLzZwRkhrODVNQ1lHeFBSRXNMVGhLSHNPWC9hekVzSFZCVUVIc0p5VEg1?=
 =?utf-8?B?ZnZlTXR4bldMK0NTZXVJSll5aHd1UkxEeDlqUFc2QktObEZMRDB2YzZ0REdD?=
 =?utf-8?B?OWFsYTRVdHZZRitLVTUrYjY3Vkd2Uy90V0FabnNVdmQ0VUhYVGV5cGxEOFVI?=
 =?utf-8?B?RTZUWEtDUitHZEdhYzU5UjVRZlh0ZEtoZzdrcVhWSDlkbDl4THFZWi84YWRy?=
 =?utf-8?B?V1g1b3EwUnMyaCtZZVY0N0NuUjZUeURtT2QzN2pkWis3U1Jnc1NmeG1rSG9a?=
 =?utf-8?B?eFZhZDJvV3lGeU00OTdyZE9QU1BPY25pdGRvMEtXL3pLZFNXeGVqNW9yaUFj?=
 =?utf-8?B?MVJNVkhvdi95cHd6QWg3SFIyVUFMQXZrcyt3VlJPV1BCMzJRbkRidW9PSWxD?=
 =?utf-8?B?bHFiQWRxY2Q4cTFKY2svdytiTnBkaDh1MFdURGFvVHE0dzQvMDA4R1pzY3RE?=
 =?utf-8?B?QW52T1dSOTB0USt1c3BtaCtQNG11OUd4KzE5ZHhxcjhvVGVscnNnZjhYOThw?=
 =?utf-8?B?bGJ3bnBORW4zZ0k4UWV4VlJ6NmpScjdUT3cwS1BydXlYZjkvcXVYVVVjUWF1?=
 =?utf-8?B?OFRsekdIWkt5Qk1JdVNqb0U0WjBLeE1Cd2swckRudXVkUXk4dXN2bHRsSFRT?=
 =?utf-8?B?MXZZYklVV2xObmdOR1JGTHZyRnN3TzRFdkowMXI5N0pSVGhCb24yOTlxRFU3?=
 =?utf-8?B?eHFJRFdpaUlVaWZuOFBCQTUzeDJlOGVLakp3dFZiWHVyZmVraGxjSUlib25y?=
 =?utf-8?B?V2hyUkxQb2FQQlhKUXFocUdJdlJNRjRUMEIvbFBBSUhSakU4T09kdXRYVnBi?=
 =?utf-8?B?Vk8zVnFTb3pSMEVYb3VYZ3dMakcvdlRlM1MwUHc4LzJ0L2dzazlTU1lWMWJs?=
 =?utf-8?B?dlZqc2FMKzVCZ2xnVGh3N1RjdTM4eUtTS28zUkNVYTZWbFdXQWFrNVdsUWEx?=
 =?utf-8?B?a1JtWCs1c3MycFVnemp1M1FpcHBuRDI4azNlc0tFWW9TREtxR2NDbHMyV0s5?=
 =?utf-8?B?ZmQzK0h4d3FoVTU5TCt4OURMWEM4SHh3aldwVDEvYW16YXdmcGJmejFac1RO?=
 =?utf-8?B?eWNJQnRmYkF3ZkY2bFlnMUozY2s2UldpR3c2UWhOTXM4UzR1U3RHMkdpa0Fy?=
 =?utf-8?Q?wRYA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b56c1cec-695f-4655-bacc-08dbeecb1d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2023 22:00:33.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpET7+P+IwPU+oe981Ssflx/bMZ5LltSNgds12HwPISENGRwclEOLXb8xwQ/Gt7a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 22:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191241

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgTWFydGluIEh1bmRlYj9sbA0KPiBTZW50OiBkZW4gMjQgbm92
ZW1iZXIgMjAyMyAxNToxMg0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBDYzogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPg0KPiBT
dWJqZWN0OiBbT0UtY29yZV0gW1BBVENIXSBsaWJwYW06IHNwbGl0IC9ldGMvZW52aXJvbm1lbnQg
aW50byBwYW0tcGx1Z2luLWVudiBwYWNrYWdlDQo+IA0KPiBTaW5jZSBzeXN0ZW1kLXYyNTUsIHBh
bS1wbHVnaW4tdW1hc2sgaXMgcHVsbGVkIGluIGJ5IGJ5IHRoZSBsb2dpbmQNCj4gcGFja2FnZSBj
b25maWcgZm9yIHN5c3RlbWQuIFRoaXMgY2F1c2VzIC9ldGMvZW52aXJvbm1lbnQgdG8gYnkgaW5z
dGFsbGVkDQoNCkNoYW5nZSAiYnkiIHRvICJiZSIuDQoNCj4gYXMgcGFydCBvZiBsaWJwYW0tcnVu
dGltZS4gSW4gb3VyIGNhc2UsIHRoaXMgYnJva2UgZG9fcm9vdGZzIGZvciBvdXINCj4gaW1hZ2Us
IGJlY2F1c2UgL2V0Yy9lbnZpcm9ubWVudCBpcyBhbHJlYWR5IHByb3ZpZGVkIGFub3RoZXIgKGN1
c3RvbSkNCg0KQ2hhbmdlICJhbm90aGVyIiB0byAiYnkgYW5vdGhlciIuDQoNCj4gcmVjaXBlLg0K
PiANCj4gRml4IHRoaXMgYnkgbWFraW5nIHRoZSAvZXRjL2Vudmlyb25tZW50IGZpbGUgcGFydCBv
ZiB0aGUgcGFtLXBsdWdpbi1lbnYNCj4gcGFja2FnZSwgd2hpY2ggaXNuJ3QgYXV0b21hdGljYWxs
eSBwdWxsZWQgaW4gYnkgc3lzdGVtZC1sb2dpbmQuIEl0IGFsc28NCj4gaGFwcGVucyB0byBiZSB0
aGUgd2hlcmUgaXQgc2hvdWxkIGJlLCBhcyB0aGUgZmlsZSBpcyBpbnN0YWxsZWQgYXMgYnkgdGhl
DQo+IHBhbV9lbnYgcGx1Z2luLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIEh1bmRlYsO4
bGwgPG1hcnRpbkBnZWFuaXguY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9w
YW0vbGlicGFtXzEuNS4zLmJiIHwgNyArKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3BhbS9saWJwYW1fMS41LjMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFt
L2xpYnBhbV8xLjUuMy5iYg0KPiBpbmRleCAxYWEzMDdhZjRkLi5jMmJhMWU2ODk5IDEwMDY0NA0K
PiAtLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjUuMy5iYg0KPiArKysg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjUuMy5iYg0KPiBAQCAtNTEsOSAr
NTEsMTQgQEAgUEFDS0FHRUNPTkZJR1t1c2VyZGJdID0gIi0tZW5hYmxlLWRiPWRiLC0tZW5hYmxl
LWRiPW5vLGRiLCINCj4gIFBBQ0tBR0VTICs9ICIke1BOfS1ydW50aW1lICR7UE59LXh0ZXN0cyIN
Cj4gIEZJTEVTOiR7UE59ID0gIiR7YmFzZV9saWJkaXJ9L2xpYioke1NPTElCU30iDQo+ICBGSUxF
Uzoke1BOfS1kZXYgKz0gIiR7YmFzZV9saWJkaXJ9L3NlY3VyaXR5LyoubGEgJHtiYXNlX2xpYmRp
cn0vKi5sYSAke2Jhc2VfbGliZGlyfS9saWIqJHtTT0xJQlNERVZ9Ig0KPiAtRklMRVM6JHtQTn0t
cnVudGltZSA9ICIke3N5c2NvbmZkaXJ9ICR7c2JpbmRpcn0gJHtzeXN0ZW1kX3N5c3RlbV91bml0
ZGlyfSINCj4gK0ZJTEVTOiR7UE59LXJ1bnRpbWUgPSAiJHtzeXNjb25mZGlyfS9wYW0uZCAke3N5
c2NvbmZkaXJ9L3NlY3VyaXR5ICR7c3lzY29uZmRpcn0vdG1wZmlsZXMuZCAke3NiaW5kaXJ9ICR7
c3lzdGVtZF9zeXN0ZW1fdW5pdGRpcn0iDQoNClRoaXMgaXMgcHJvbmUgdG8gZXJyb3JzIGlmIGxp
YnBhbSBhZGRzIGFueXRoaW5nIGVsc2UgdG8gL2V0YyBpbiB0aGUgZnV0dXJlLiANCklmIHlvdSBp
bnN0ZWFkIGFkZCBgcHJlcGVuZD1UcnVlYCBhcyBhcmd1bWVudCB0byB0aGUgZG9fc3BsaXRfcGFj
a2FnZXMoKSANCmNhbGwgdGhhdCBjcmVhdGVzIHRoZSBwYW0tcGx1Z2luIHBhY2thZ2VzLCB0aGlz
IHNob3VsZCBub3QgYmUgbmVlZGVkLg0KDQo+ICBGSUxFUzoke1BOfS14dGVzdHMgPSAiJHtkYXRh
ZGlyfS9MaW51eC1QQU0veHRlc3RzIg0KPiANCj4gKyMgbGlicGFtIGluc3RhbGxzIC9ldGMvZW52
aXJvbm1lbnQgZm9yIHVzZSB3aXRoIHRoZSBwYW1fZW52IHBsdWdpbi4gTWFrZSBzdXJlIGl0IGlz
DQo+ICsjIHBhY2thZ2VkIHdpdGggdGhlIHBhbS1wbHVnaW4tZW52IHBhY2thZ2UgdG8gYXZvaWQg
YnJlYWtpbmcgaW5zdGFsbGF0aW9ucyB3aGljaA0KPiArIyBpbnN0YWxsIHRoYXQgZmlsZSB2aWEg
b3RoZXIgcGFja2FnZXMNCj4gK0ZJTEVTOnBhbS1wbHVnaW4tZW52ID0gIi9ldGMvZW52aXJvbm1l
bnQiDQoNCkNoYW5nZSAvZXRjIHRvICR7c3lzY29uZmlyfS4NCg0KPiArDQo+ICBQQUNLQUdFU19E
WU5BTUlDICs9ICJeJHtNTFBSRUZJWH1wYW0tcGx1Z2luLS4qIg0KPiANCj4gIGRlZiBnZXRfbXVs
dGlsaWJfYml0KGQpOg0KPiAtLQ0KPiAyLjQyLjANCg0KLy9QZXRlcg0KDQo=

