Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6EDCA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 13:45:32 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.59])
 by mx.groups.io with SMTP id smtpd.web11.20275.1755697524214415602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 06:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=RjPCsjJz;
 spf=pass (domain: axis.com, ip: 52.101.69.59, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbRpuZZE3ZZot3QrXjDYC/z55/XRqXMQOGjVntpbzMpaPHKtzHvgktxDvmziEH66kEdtIFfDlTHhXb7uoWFqud3hTH73nd2xRZsqdewTumuqSweLudvmOrB3d8K1QCwwqrzJ8OHauJw4UG0IiLIsUCdzCMfWeQa+HPAr6zLg3wL50VvwG9f6CQ1vb1AWOemtbjAMemYWjzPjIzUVu7/mXhTd7K9ULVSA7MLue0Jb5DS5XczYDGLJfRa6u96nF+5J65yN5EawJ4mEuIEUkI/bBnaQ2eMVp2wQNiLraYyfh3QXFcf+sDwiSh7xhXkvB6DoxIikRcD3fFdSh0ZXKRr4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQoxvwB9ZCtecDyZ3IuJOVQnd0lrYMKEnWkrox5HlfE=;
 b=UxO1QToLZEHP3rYvWHVVCCtsIve5PppO43+qrS84AMGwuBvmxgfexm0kFbkVs2xpAKHhWlHIvTdfMtXLZCroqVNVG8tzAAV/r0FgAcg4Ndfj16EgrBaoRolrTVTXVvKcI0XjtzwV/ntEQqc86Nlsjqvs1ETPmbZKfCnIxmZpSP9ilAUSKTrn5RmeYacvUcReyZr2LfNLZNa4Ks3aKgEf4uYb9tsBu4atEv1VXP4aqMfpNz3ssb8pSpxk58U2alvlxR/5P7nhYnbliJs9SG/ARdTyvnb+kEOzeXi5IB4o+6LkqE7klpN7wWAJ3KTNay5EkpsluUE4vp+Y4Ol773UsGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQoxvwB9ZCtecDyZ3IuJOVQnd0lrYMKEnWkrox5HlfE=;
 b=RjPCsjJzBr0VERviYrjWAvHQAekQ0gAembuTasRev4yMeS5CjI3snQJ6kC2oE6KAWFDp3FtK1OxMWcEFvOWvvDqd8ZKclLqVlvTPXAhQtCNBDuGWu429JfOcIhfqvWOkMIYc5q4ik2CsJnvLIfNFCeErqA/v7vfZvpi2N4zJ8FM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAXPR02MB10341.eurprd02.prod.outlook.com (2603:10a6:102:247::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 13:45:20 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%3]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 13:45:20 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv4 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Topic: [OE-core] [PATCHv4 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Index: AQHcEMycF9WXsHvT4UOGMQ/YapscnLRrObsQgAA8OACAABRd0A==
Date: Wed, 20 Aug 2025 13:45:20 +0000
Message-ID: 
 <DB5PR02MB10213921DE9C137BB2B97A6E1EF33A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250817201832.2462509-1-pkj@axis.com>
 <DC660IEPZE9T.1VEW6S4PFZICU@bootlin.com>
 <DB5PR02MB10213A1E35598F2EBC48B4F7AEF33A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <DC78V5ZY2JLN.264DJH3F8F7D8@bootlin.com>
In-Reply-To: <DC78V5ZY2JLN.264DJH3F8F7D8@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAXPR02MB10341:EE_
x-ms-office365-filtering-correlation-id: 1dcbbb1a-faca-472c-3bff-08dddfefce3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NjYveXo5TUdTL3h6eXAyWTcwUDFTTjZnOXBKZ2tvVzlDSVl0VnhhWCt3VVlF?=
 =?utf-8?B?bDlDcGZyK2dDL2luSkFOZ1Jabm1NUnZMWmR4Yy9ndGZONEhyTVNGYXhsZGdv?=
 =?utf-8?B?djRibVpjeG92MnJGME1XWWx3YVNRbWg2a3NlMElLTXhTNW0rNlBKM0hlSXh0?=
 =?utf-8?B?dEMrNFlMbmJTa2p2T2J0WW05U3l4ak1pTEhUb1I5ZVBCdzRoU0U0RWYwMEZW?=
 =?utf-8?B?Ymd4WlhPVEIwaEMrQVVFcExTNExCb0Q3RVJpMDFoVis4WW9wQkVBL1NnNXhm?=
 =?utf-8?B?VDFpMUsrRnBQVEVmblpzaE1GN0hVTEM2UmlOcXQzanhZSjVORk5iZm9HM2FC?=
 =?utf-8?B?Mm1NU0JCeEMvd3l3NGk3S3hMT0I4WTBvZXVvYW01eENvUmQ4eGJOUWUzSTU2?=
 =?utf-8?B?TVJaRnFsUEF6dllLNDBXNVlOYnFKNUZTVXp4RjlyRC9GWUdaSWpPZGhsN0Q5?=
 =?utf-8?B?SnpoaFBmYnlmWG5nRG9DOFVNenp5eVR5Y0UxVTc0YXZYTURFSnhCUFhLcDUz?=
 =?utf-8?B?R0E4MXBrbkxCN0dOYzlWZ054dWUzQVJOU2IvTGJDdjBFNk1GZVBualFVM0pC?=
 =?utf-8?B?NjNQbnhHeS9NdUlKY0FUdkFMMC93dWlZV3hDdnR0dGxMcURvRUFZc2cydHFE?=
 =?utf-8?B?QzBUcW9VSENWWVRyUld3ckZFczhoSmlXUjRQUXB4bG44eTNjYmowazJXN20x?=
 =?utf-8?B?amZHZW11Tno4WWxpZDFady8wbVFKelFGbTZBOVQrcWhZM3piamtvWFhNRE55?=
 =?utf-8?B?UitCUVR0bVBHUWNmdTJoRitwMHlWWTBHRDY0bkpndXhMWGJZV3NabHdWS3I0?=
 =?utf-8?B?OUJWWUFWVXcwdklxSU1KTDV0dU9aZ3lrSmY0QVpQa3BuQkd4U21NeTlvMDZK?=
 =?utf-8?B?MVNaNVlYSEFybmxwUXhmUXNHbGVxclZaM0hrNnB5Y1ZSejQ5dU94Unk5UlVl?=
 =?utf-8?B?TFNMN1FOT0Z1Uzc5Zm13NmV5ZHl0UHJxM1hmSWR1ajBWeW40UkNkMzBsWkt0?=
 =?utf-8?B?NlhiaGhDMGo5Myt2cDV0NU5xdHAwdmVWQXE5SlAwRmtBNTlSMW1sVG9kcloy?=
 =?utf-8?B?Q2RPWlR5VzY3andBK3l6dmcvTXVIbC9SUWxuakZDUkFhYmNVZTdIb1diT1ZH?=
 =?utf-8?B?bTZ4c2c1NlAydUtEUS93VG80NUc5RzBpMVFrdUViaE1zdkxrZnNoZWx5UkIw?=
 =?utf-8?B?MFhpVTgzakNMTXZpZG9PekxKYUk0b3Z1NFpkdzNmbjhhNUczVko5alVxY1Jr?=
 =?utf-8?B?WUJ0RmdSU052Qm9YUTZaSnhOVk83RGhNZ1pwOGNjNXI2R0VWWUJIM2E0Y1VN?=
 =?utf-8?B?ekFoanhweXFsbko1R3o3UU5PVGw5cjROL0FzZ2dPamtKMUU3QlRiN0dySzlR?=
 =?utf-8?B?cmVOdklpZFhFb05sSW0vUnFmbVcvODVlTVZSS3hpbTNLZWNPYU10NkVsZWZB?=
 =?utf-8?B?RWt5TjJ1RmJGK0kxMzlVL3hyNkd5NTYyS3czMnYxQVVLTFozSnNBTGZwQVdD?=
 =?utf-8?B?RGlMNmlxUzlFemRnRWR2WXVwaHVnc2lUckcyc0ZQQ2gzZzZkVFlXTmdGdTNa?=
 =?utf-8?B?UXdwRzM3K3pQWDJ2Y0lXdEEzdUVUdE9MaDJlKzRWNU0waHpSQ050dWNRUy93?=
 =?utf-8?B?S0JZYXY1amRMdVhxOElONjFPczVlWVNHWkQzN3JnNHowcktkSEQ5Zkx2aGdz?=
 =?utf-8?B?cnFXT1ovaktGVFg1c2JDbnM3emhOSEZDUTVjV1VzRm4zU1N2M2VMbWpvRUtE?=
 =?utf-8?B?SUJLeUJhZDdXVnNGSm9vRklLc1Irck5mMlhDSzlHTUZOZ05GQ1d2SmhlS0tO?=
 =?utf-8?B?RHVzNk13M0g0QUpMRjNtejloQTVPQ0ovc0VTWTlkY0FRZk1vRDMrVk43UWIy?=
 =?utf-8?B?NStvbXIxb3VqeTNzWUZNRmFLYkgxNkNLWFo0dnplelgvZlowSlhWcFhQTU4x?=
 =?utf-8?Q?DiCFh/leFLA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bzhWUmRlVCtBdUxNQ1JyWStTMHF1Y0hYVVZBOFZaRldLM3ZpMUc2VWg0YWl1?=
 =?utf-8?B?MHFyaWVVa1lOK0NlejVBUVBndkIycjhSeFRsSUgzbnZoSGNlVVIyNkNxNUlU?=
 =?utf-8?B?cCtQTHF2WnVxcjFRMWhCVVR4ek9WUnRoNm1FU0c5UWgzaXVIYW5qb0E4d2pW?=
 =?utf-8?B?Y214WmRhKzNoUHc1bk81MnBvYkNjbC8vSC9sRE00M24wODRUa0kzN1hLUCs1?=
 =?utf-8?B?a2psT3ZtNWU5bkZSNDhCeExsUERDR1VqNmx6NHh2NjU2eXpKMzlZWm9pZm5q?=
 =?utf-8?B?T2F2TkhaMWVrWEgzLzVKRjhLcUpEZXpjdnMwUVNlWDlYeG1EcW5YNVlZblRu?=
 =?utf-8?B?a2JHaHp2K3ZGaWNEc0luc3d2T3dMZ0tmQklDMWFMQWU4QWdqUHZpZ2hrbnQ2?=
 =?utf-8?B?UUlhUDh0REZiTC9qYlN6dGxwdFYwNEI5Q0F6YnBpZUZoWllkblpBVlVHazY0?=
 =?utf-8?B?dkxwN1ZJaTRQbHJKQllMZ3o3eVdKTzgwMjMrMHBTVEkwZ3RuRGNJa3BwRUNi?=
 =?utf-8?B?WWdkM3hUNFpMRTc1S0NJaWdjcFhoT0lRTGJLVDZuR2YyZmoxVHo0VW9GektQ?=
 =?utf-8?B?eWZjZHVxRkdPdndRU2dFM1o1R29WTUM4QSsyUmpGdmRwbU1KRGprWUhpUWtC?=
 =?utf-8?B?Z2VEekk5bGRmSUtvYk0ySFl0SjlQdHJzUHY3THVCT3RzVWpseVh5emxwZVdx?=
 =?utf-8?B?cnZlQjNjNGE1K0hWL3JML3pJRHpBRUVEUzM3dXFxSmE1QjVLV3FhWmhzMTdF?=
 =?utf-8?B?WUt4YnJCUVQwYVhpc3lrQ3V5M0N3Z2hVTFdEODBkemtDSEJmUGlVMjF2WFFz?=
 =?utf-8?B?dHRMVGlKN211Yk1WNldPVmtMQ1ZEclNaVVVlSEcrNUlxYUl2c3VSQ1ZiY3FT?=
 =?utf-8?B?SHRxQUZQYkFzN1c5VmdqUThBWlRKa1pGM2hIeXIvNmFBQVIxOVd5bmQxOGNm?=
 =?utf-8?B?Uy93MXZpR0p1VzJKSGQ5MllzMzUwMjFkbDZXSUpTbTR6M0RLUGhhSGV3elAz?=
 =?utf-8?B?dlducStjeWpiekFEekRZaElNaUhTYys3R3VnTFVSYXZKNVBKbWVZNHYrejl5?=
 =?utf-8?B?VTdnN2Z3MENJRlZ6Y0ZaSmVSTnRoaTViRUU3UjM1TzJmYyt0T0U4WG8wOEhj?=
 =?utf-8?B?TUNxSENoc1ljajRHVitaUEVRQWFVbGxpT014TjQvRDZuNmxMa0Z4Yi9RR1pC?=
 =?utf-8?B?L2d5NW93SjFIMWxOTXF6emlEWkIweFNmZ2I5TU0ybXlMc2hyTGxRSWEwUWJp?=
 =?utf-8?B?N3BKZ1FCSVh1Z2U5YU8va283T3I5ODJhWGFDYjgwQ2ZOY09uQys3aHRyWTY5?=
 =?utf-8?B?eGc4YUh2SWRsc3RaSWJzdnp5SkFPOFVCelFCQWhPSDZJb1dSSG9OcWpYamlF?=
 =?utf-8?B?enNQeWhBSFpSc1czc2N4ZlcwRWhubGNuZ0FiN0hybmpXaFlaSDNqclpxY255?=
 =?utf-8?B?dFFoYTdkUnFXVDhRaUlyNlJDeTV2WkcrQVBZeGN1UVBiQjVIWkpmRUVPRTBV?=
 =?utf-8?B?aG5FVjhBSjQ5dHVTZjdzZ0hxbVVRRWw3R1VnSHh4eWEzSlZmSDlOSGowSlo2?=
 =?utf-8?B?Y1kySk9rMng3dXNHQ3hnYzNCbGE5RkZHR3pab0ZzYS9DRGpubXhxdkR1RzRv?=
 =?utf-8?B?SnRjWWF1endHdG5TT2Z5Y2xZeG9EaXA3a2Q4K1lINUlkcExDVXBudWFLUktk?=
 =?utf-8?B?L08rTHZ2cnlYZXo4UEVOYWU5Mjc2K1d6SmE3UTNuczJmV05ya3M4UVMwSWJC?=
 =?utf-8?B?V3NzclJMYlJxRzBtamJoblNQaG53MTBhRENrMWNkR2dRZG0ybDJSOGQ1ZXBU?=
 =?utf-8?B?U3VRRnF2MGIxNGV3YUpSMEtWRm51bUVjM3hCVXI4VFk0WXVpOE4vZndPNTkr?=
 =?utf-8?B?UnAyb2txR2NxcktSaGJKSWJqUEtxTFN2aDBsMUtydElNd09WR1ErbkduY0pm?=
 =?utf-8?B?aHpoaW02VUxETTd3eWlDckFSVEtBUWo0WG9FamZkOTljakVkaGQvL285Vjh5?=
 =?utf-8?B?VmVzSnJUVVVpbGlXSExRWUlKcUw3VERsamdCS0FTaHlka1pmUndCWUxoMG9G?=
 =?utf-8?B?MksyQWRDMHNuemZ3amEvdEt5VHZ3VGxpMlkrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcbbb1a-faca-472c-3bff-08dddfefce3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 13:45:20.3143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /PCuDxw0bjdQV2icmwsSsC/YhWiteNYUyxkdxWaeFJ8c0ybbbfAsOsPe+r1VGCJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB10341
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 13:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222184

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDIwIGF1
Z3VzdGkgMjAyNSAxNDoxMw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIdjQgMS8yXSBzeXN0ZW1kLXN5
c3RlbWN0bC1uYXRpdmU6IEluc3RhbGwgc3lzdGVtZC1zeXN2LWluc3RhbGwNCj4gDQo+IE9uIFdl
ZCBBdWcgMjAsIDIwMjUgYXQgMTE6MDggQU0gQ0VTVCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUuZHVib2lzLWJy
aWFuZEBib290bGluLmNvbT4NCj4gPj4gU2VudDogZGVuIDE5IGF1Z3VzdGkgMjAyNSAwNzo0Ng0K
PiA+PiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIdjQgMS8yXSBzeXN0ZW1kLXN5c3RlbWN0bC1uYXRpdmU6IElu
c3RhbGwgc3lzdGVtZC1zeXN2LWluc3RhbGwNCj4gPj4NCj4gPj4gT24gU3VuIEF1ZyAxNywgMjAy
NSBhdCAxMDoxOCBQTSBDRVNULCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgd3JvdGU6DQo+ID4+ID4gSXQgaXMgbmVlZGVkIHdoZW4gc3VwcG9ydCBmb3IgYm90
aCBzeXN0ZW1kIGFuZCBzeXN2aW5pdCBhcmUgZW5hYmxlZC4NCj4gPj4gPg0KPiA+PiA+IFRoaXMg
YWxzbyBhZGRzIGEgcGF0Y2ggZm9yIHN5c3RlbWN0bCB0byBhbGxvdyB0aGUgcGF0aCB0bw0KPiA+
PiA+IHN5c3RlbWQtc3lzdi1pbnN0YWxsIHRvIGJlIHNwZWNpZmllZCBpbiBydW50aW1lLiBUaGlz
IGlzIG5lZWRlZCBiZWNhdXNlDQo+ID4+ID4gdGhlIGhhcmRjb2RlZCBwYXRoIHRoYXQgaXMgYnVp
bHQgaW50byBzeXN0ZW1jdGwgZG9lcyBub3QgbWF0Y2ggdGhlIHBhdGgNCj4gPj4gPiB0byB3aGVy
ZSBpdCB3aWxsIGV2ZW50dWFsbHkgYmUgZXhlY3V0ZWQuDQo+ID4+ID4NCj4gPj4gPiBTaWduZWQt
b2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4N
Cj4gPj4gPiAtLS0NCj4gPj4NCj4gPj4gSGkgUGV0ZXIsDQo+ID4+DQo+ID4+IFRoYW5rcyBmb3Ig
dGhlIG5ldyB2ZXJzaW9uLiBIb3dldmVyLCBpdCBsb29rcyBsaWtlIEkgc3RpbGwgaGF2ZSBzaW1p
bGFyDQo+ID4+IGZhaWx1cmVzOg0KPiA+Pg0KPiA+PiBFUlJPUjogY29yZS1pbWFnZS1mdWxsLWNt
ZGxpbmUtMS4wLXIwIGRvX3Jvb3RmczogUG9zdGluc3RhbGwgc2NyaXB0bGV0cyBvZg0KPiA+PiBb
J2lwdGFibGVzJywgJ29wZW5zc2gtc3NoZCcsICdzeXNrbG9nZCcsICd2b2xhdGlsZS1iaW5kcycs
ICdzeXN0ZW1kLQ0KPiA+PiBuZXR3b3JrZCcsICdhdCcsICdjcm9uaWUnLCAnbG9ncm90YXRlJywg
J29ubHksIGNvbmZpZ3VyYXRpb24gcmVxdWlyZWQgb24NCj4gPj4gdGFyZ2V0JywgJ25mcy11dGls
cy1jbGllbnQnLCAnbmZzLXV0aWxzJywgJ3BzcGxhc2gnLCAncnVuLXBvc3RpbnN0cyddIGhhdmUN
Cj4gPj4gZmFpbGVkLiBJZiB0aGUgaW50ZW50aW9uIGlzIHRvIGRlZmVyIHRoZW0gdG8gZmlyc3Qg
Ym9vdCwNCj4gPj4gdGhlbiBwbGVhc2UgcGxhY2UgdGhlbSBpbnRvIHBrZ19wb3N0aW5zdF9vbnRh
cmdldDoke1BOfSAoKS4NCj4gPj4gRGVmZXJyaW5nIHRvIGZpcnN0IGJvb3QgdmlhICdleGl0IDEn
IGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQuDQo+ID4+DQo+ID4+IGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzkvYnVpbGRzLzIyMjINCj4gPj4g
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMv
MjAvYnVpbGRzLzIyMDYNCj4gPj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3Jn
L3ZhbGt5cmllLyMvYnVpbGRlcnMvMjIvYnVpbGRzLzIyNjcNCj4gPj4gaHR0cHM6Ly9hdXRvYnVp
bGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllL2FwaS92Mi9sb2dzLzMyODMzNTYvcmF3X2lu
bGluZQ0KPiA+Pg0KPiA+PiBCZXN0IHJlZ2FyZHMsDQo+ID4+IE1hdGhpZXUNCj4gPg0KPiANCj4g
SGkgUGV0ZXIsDQo+IA0KPiBJIGNvbmZpcm0gSSB3YXMgYWJsZSB0byByZXByb2R1Y2UgdGhpcyBs
b2NhbGx5Lg0KPiANCj4gPiBJIGZhaWwgdG8gcmVwcm9kdWNlIHRoaXMuIFdpdGggYm90aCBteSBw
YXRjaGVzIGFwcGxpZWQgYW5kIHN5c3RlbWQgZW5hYmxlZCwNCj4gPiBJIGNhbiBidWlsZCBjb3Jl
LWltYWdlLWZ1bGwtY21kbGluZSBhcyBleHBlY3RlZC4NCj4gPg0KPiA+IEZpcnN0LCBJIHdvdWxk
IGxpa2UgdG8gY29uZmlybSB0aGF0IHlvdSBhcmUgdGVzdGluZyB3aGF0IEkgYW0gdXNpbmcsIGJ1
dA0KPiA+IG1hdGhpZXUvbWFzdGVyLW5leHQgaGFzIGJlZW4gcmViYXNlZCBzaW5jZSB0aGUgdGVz
dCB3YXMgcnVuIHNvIEkgY2Fubm90DQo+ID4gZmV0Y2ggNTEyYjRhZmEwODVlYjNiNzc1ZDgxODE5
NTQ4OTAwOTU5ZDA4ZjYyNi4gTWF5YmUgeW91IHN0aWxsIGhhdmUgaXQgaW4NCj4gPiB5b3VyIGxv
Y2FsIHJlcG9zaXRvcnk/DQo+ID4NCj4gDQo+IFRoZSBzb3VyY2VzIGhhdmUgYmVlbiBhcmNoaXZl
ZCBoZXJlOg0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY2ktYXJjaGl2ZS9s
b2cvP2g9YXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS9hLWZ1bGwtMjIyNw0K
DQpUaGF0IHdhcyB2ZXJ5IHVzZWZ1bC4gSSBkaWQgbm90IGtub3cgb2YgdGhlIGF1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvKiANCnRhZ3MgYmVmb3JlLiBJcyB0aGUgYWJvdmUg
bGluayBwcmVzZW50IGFueXdoZXJlIGluIHRoZSBvdXRwdXQgZnJvbSB0aGUgam9iIA0Kb24gdGhl
IGF1dG9idWlsZGVyPw0KDQo+IA0KPiBJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgYnVpbGQg
d2l0aDoNCj4gTUFDSElORSA9ICJnZW5lcmljeDg2LTY0Ig0KPiBESVNUUk8gPSAicG9reS1hbHRj
ZmciDQo+IA0KPiBUaGVuIGJ1aWxkaW5nIGFueSBpbWFnZSwgc3VjaCBhcyBjb3JlLWltYWdlLW1p
bmltYWwuDQoNCkkgZmlndXJlZCBvdXQgdGhlIHByb2JsZW06IHN5c3RlbWQtc3lzdi1pbnN0YWxs
IG5lZWRzIHRvIGFsd2F5cyBiZSANCmluc3RhbGxlZCBieSB0aGUgc3lzdGVtZC1zeXN0ZW1jdGwt
bmF0aXZlIHJlY2lwZSwgcmVnYXJkbGVzcyBvZiANCkRJU1RST19GRUFUVVJFUy4gSSBoYXZlIHNl
bnQgYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIHRoZSBwYXRjaGVzLg0KDQo+ID4gU2Vjb25kLCBJIHdv
dWxkIG5lZWQgdGhlIGxvZy5kb19yb290ZnMgZnJvbSBvbmUgb2YgdGhlIGZhaWxlZCBidWlsZHMu
DQo+ID4gSXMgdGhpcyBzdG9yZWQgc29tZXdoZXJlIGFzIGFuIGFydGlmYWN0PyBJZiBub3QsIHRo
ZW4gdGhpcyBpcyBzb21ldGhpbmcgSQ0KPiA+IHdvdWxkIHJlYWxseSByZWNvbW1lbmQuIEluIG91
ciBDSSwgd2hlbiBhIGJ1aWxkIGZhaWxzLCB3ZSBjcmVhdGUgYSB0YXIgYmFsbA0KPiA+IHdpdGgg
YWxsIHRoZSB0ZW1wIGRpcmVjdG9yaWVzIGFuZCBzdG9yZSBpdCB0b2dldGhlciB3aXRoIHRoZSBv
dGhlciBhcnRpZmFjdHMNCj4gPiBmcm9tIHRoZSBidWlsZC4gVGhpcyByZWFsbHkgaGVscHMgZGVi
dWdnaW5nIHdoYXQgY2F1c2VkIHRoZSBmYWlsdXJlLiBJZg0KPiA+IHN0b3JpbmcgYWxsIHRoZSB0
ZW1wIGRpcmVjdG9yaWVzIGlzIGNvbnNpZGVyZWQgdG9vIG11Y2gsIGF0IGxlYXN0IGFyY2hpdmlu
Zw0KPiA+IHRoZSBsb2cuZG9fKiBmaWxlcyB0aGF0IGFyZSByZXBvcnRlZCBhdCB0aGUgZW5kIG9m
IHRoZSBidWlsZCB3b3VsZCBiZSBvZg0KPiA+IGdyZWF0IGhlbHAuDQo+IA0KPiBJJ20gYXR0YWNo
aW5nIHRoZSBkb19yb290ZnMgbG9nIG9mIHRoaXMgYnVpbGQuDQoNClRoYW5rIHlvdS4NCg0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KPiBNYXRoaWV1DQoNCi8vUGV0ZXINCg0K

