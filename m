Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBBEC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 12:23:23 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.66])
 by mx.groups.io with SMTP id smtpd.web11.19838.1736943798406721605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 04:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RIkjLCq3;
 spf=pass (domain: arm.com, ip: 40.107.247.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2BEPlgqM/dH3Vx8B/YTarKIFh6haI++qRAnBKcUysEwKcPTitoFH0f/dWXFHn7Ei3QEUxi/zFr/4G4XrhbRv/xz6wKdym3g7TiGdXxozosQsPuYVi43eHkXSEb+lsH9+QYF2LUNplYJjy+ZzloM6AOknyLWAV4jltmIWhHKfKs88yGxxaD/s6yfnx4qh5qUfIwt6Vh5ya3601oKXu0TUD42w2akTt3pwligi3WzSdRFGEVEZB4DglgFmBAQucX210di2PKqRrAM+t3Grx+NRldiheR3r7CEXStg/1XkpTRNkIzLEi6x96P4KHbbN3DtKve+hBPmY8Km/3Z6wgk7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3aZo1EyvlmiKq9i4aKTwetRF40Qbdxe7Npjnvlh58A=;
 b=xUAvBmVoQH3sm1jaWb2FRQlbStpQaZaOoWyj/bmSuPFHAucTDHRL0DUjsz23CNYOW6orDVr5PQnt/pen5SvIvhKDeZQNQHz6LnYpTo4TwktQrSrjguMIRNAgN2Z7Om+KLRnfxUhwU1dIQ95VhGOAKR6aJaCPgySiH5Bkze2rst+FHbY3RAIIOexiAmcm9/LOEDuWlPHp2Lhancw8llpkJZqDbK/VWGMIjstu6/PMTUQfAqrWDJragkbyB9cm5htzo6hco5cZL8nxpOymb6mXHhS97PsP3RVVOC+bXZYMlpItTuABSYyK8ZnpwKmLo9Y/TENEiNA7zoOj6nk1I3d7Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3aZo1EyvlmiKq9i4aKTwetRF40Qbdxe7Npjnvlh58A=;
 b=RIkjLCq3pt4U65EBiDd6T0ecJjPoasiMCvMhJ3BcYyGcoVX90iRL4iL7mx17bpquqEjrGuZDTCyBGX9ik0+ndr2s/Kc9r2VkwElrzjPwaUd6Sby71WkDlSDRKYAEvlUpJknk3Cs4k2G3W5a8mwgTdpyGHfPskVgMW01uWsfeqz0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB5344.eurprd08.prod.outlook.com (2603:10a6:803:13e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 12:23:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 12:23:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2][OE-core 4/4] cve-check: allow feed choice
Thread-Topic: [OE-core] [PATCH v2][OE-core 4/4] cve-check: allow feed choice
Thread-Index: AQHbVe5ivAlAKG+0XUiDDI/MZdIYTrMWrt4AgAE1uAA=
Date: Wed, 15 Jan 2025 12:23:15 +0000
Message-ID: <90F815DC-7009-4529-91DC-93F33737DEC4@arm.com>
References: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
 <20241224102557.9300-5-marta.rybczynska@ygreky.com>
 <6703A7E3-30BD-44E9-875C-058BD2EAF58C@arm.com>
In-Reply-To: <6703A7E3-30BD-44E9-875C-058BD2EAF58C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|VI1PR08MB5344:EE_
x-ms-office365-filtering-correlation-id: 7f4b5d0e-41f4-42c0-99be-08dd355f62c1
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QUx3Q3FoRStMdmljZHMzR05oN01nc0RFejhIS1hXSit1YmpQRjVzWk9xMlhh?=
 =?utf-8?B?c3VSTHBWSWpTYnQ0K01oejVwQ0h5VnlyM1lnWmlmaVdxanBSdTNXcXpOV3p5?=
 =?utf-8?B?YTEwZEtqd2x1ODF1d3RvbitSV0VQZ3kxd0toc1JpNndEWGp1UUM2T1JrQUl0?=
 =?utf-8?B?ZjRiSlkwTFltbFlvOGJ0bzJNTmFYNklUV21FY3BVdUNLNlpQaXZlVkVncVFn?=
 =?utf-8?B?SS9uanVNWFdTNTBSeE5HTS9CRlZuWDR5dUpQNWJ6RXVHRUEwbUlJbmVkSVNW?=
 =?utf-8?B?Wk5qc1JFSENPdW1KSTNSUS9oSEErT3dKSVR6S1ppMm5LWVl5YzVhMEpzWGdk?=
 =?utf-8?B?SnBFU29zMk5jOHlxcW9RYzN0dVowVXF2aDVPNlF5MUN0UDRKRENaNzgvTGFO?=
 =?utf-8?B?SEVRYmNhaU80YW8zZlp0dnRFZSs2SkJNRUpHQTFVamNMcFZUcElKc0dYbjZ0?=
 =?utf-8?B?UU9meXI0aktsRUl1c1phL2lhY0xTYURTcDBHM0JDdWpOanNaR2N2d09GVksy?=
 =?utf-8?B?UmdYUFBmY0EwajdiM3BnZkZwZVVXUGVBTTdFQVRXVDFVUEhRV0xZSnlobWdq?=
 =?utf-8?B?aU9ieGJmWi9qL3JDNnpCUldObG1Wd0ROVWtYanhNZ24rZkt2a3YvNG1NNFVT?=
 =?utf-8?B?VGMvMFdCS2Q1RTZtL0Rmb243OS9OUHVpV295dlNHZ09LUUNoTDNGaDJCYzRM?=
 =?utf-8?B?YXcxR1UvU2NVd3FPTklWb2dNM2ZjSkRuKzEyQ1JSd2dONnpVMk5yKzRkUVZI?=
 =?utf-8?B?d0dMb1JoL2tzRzBpWFcxSlZ2QnRWTGgzYVNCcDhobGhudjgwVzRjOE9oTEZ3?=
 =?utf-8?B?VENDbENIdFJJaVQ3YWYrTUZLaFFzUnpVZEp0eGM2YmlVUVY4Yi9pOTRFd1Z3?=
 =?utf-8?B?cUFwWGsxZlEyZHJ4SFBtNG8xcjZXRUFtWC80ZmtRVmtyY3Q4L3NBMTBsUE91?=
 =?utf-8?B?Z0xFSHpNTWkyQzgraDNkd0V4Y1pIZkd6R1lKdDRpd2NNWkM4dEtFVHBJTHBE?=
 =?utf-8?B?SktaV0EzYzVVa051R1NvOGZ2d3liNkFoNHhCN244WnA4ejB3QmZoZUgvUURu?=
 =?utf-8?B?anVnSTlISXhpVisvdmorVjR4RExuZnlDa25MTis5Q3laVjhQWTJEbng1U0tM?=
 =?utf-8?B?Zlg2UlVYMVRJa0hRZlByakRPcU8wNURkNjN0c3I2aWdKaWUwZnJrc2FmSlBM?=
 =?utf-8?B?UFMyZkF4OUVwT0szbitvMnVqL0xQOHpUMjdJdWhEdVVURE4xRlI2cHFzN2dx?=
 =?utf-8?B?RVBla21leFFsOFV6L2dNZ2ZucTRMUmJUUmJuUkc3aFJKY0tjV1lkQVI1Rm9E?=
 =?utf-8?B?Uk5IZ2JEMzNIN2JvUGxNOUsvRU5mMm5od3kvd0lIQ3lHb2w0N3VHRmJsS21w?=
 =?utf-8?B?WXA1YlhXc1QwalJOdjU1QjRQUU8rOTRFY3ZGdm16NWZmekVrV09QK0N4ajlH?=
 =?utf-8?B?TnREVXA1azRNcjJraVJFbVN0Y3hlQ2NTY1lUNnQ1bzVxTys5SEF3MVBaUDZ0?=
 =?utf-8?B?UzF6ZzJIZW5wZ3lCbExDY1M1dmQ3aERxSGhqVGpORkdpNVpuYWxFS0xNWkRv?=
 =?utf-8?B?dmlBSVl1SHhwWUJSY3lGcU9oS2tKVnhKM2ErWUtCd2hFemVkREJHQ05BS0I2?=
 =?utf-8?B?U093Q3RPUjcwZjBRbm9Kak1yOEdvbXkwODVpOU51UzdMd05sdGExaVE3b2JV?=
 =?utf-8?B?OHM2cWFHNVJlRVgyK1pPcjNMY0dyK3lKc3dYelR4K0dwOENjdW15OGNVeFBV?=
 =?utf-8?B?TERYeVNHSVdXU2NqZmpiMTZVZlkzVHNsbkwvWmJRK3dQb2JLVXdUK0kzaXFZ?=
 =?utf-8?B?Y0xHckRtc0RNM0ZZTUtkaE5uNm5VaFFrMDJPVk5hcWtiNFBwd0pldE1RZERs?=
 =?utf-8?Q?ynh+9zDMv9Q1u?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SXd5SXowQm56Z1JGVE1hRmljVWRQRG95QkJwRyt1L2JoWmlPY1VHV0gxaldw?=
 =?utf-8?B?bGRXRVd0MXFMcVIrYy9NTUo0TjRCUmpxSmE3MlNHLyt2NkVzNUJQRkhjZSs5?=
 =?utf-8?B?STlYbTNmb0h6SjdWU0c0RzRkWmVwTUdzMGZOYUU5MXZJb1REOEtNYTg1aFdH?=
 =?utf-8?B?RWhhdDNmU040Z3JxWEdZL0NMR3FFK3ZLZkxqVlRON3QwUU16eG5mUVJETmZV?=
 =?utf-8?B?Y1BjWkQrTTQ1VzhzRk1wT01kMHJyZFFoQXo1WFlLTWVnbjhtNFMzbWVENG1U?=
 =?utf-8?B?cU84ZmIwQlptYmFVeC9IRy9jZ0RXYkQ4WThmTWt1YS9wUUtYV3lYSy92cXBX?=
 =?utf-8?B?SlpqR2NzSXJBc1BGOGRhUWc5R0tHNlIzdFNVK3VnZkJoZWl0bWVmVktna2RU?=
 =?utf-8?B?NWI2ditzSTZLWEhaUUpsTzFDTUhPRFhJYWQzMzhVMHhzZUYxcDlGdHowSkpB?=
 =?utf-8?B?R05XVCtybkxlMGkyazhQUjZOc1V6WkEwdnlSdWhaMTdBZ1puZnVZZHVhbm1G?=
 =?utf-8?B?Ymp4VmVrNWlBVDZMUlpTMm14a0xGNExmR1hlNURzcWZlaFhaMHZHcHhnMGxI?=
 =?utf-8?B?UG9sUDlBMTR2bzZsd0l4a0EzRWJiVnRLakRyeUtPYVdlVFdrZ1dFeVpWZjZH?=
 =?utf-8?B?LzBnWXJrbVo4TUx2eVMzYWJDSEo4cG0rdGhiOTMvME9ERjJTVStjdGhHd3dh?=
 =?utf-8?B?TkIzcjVBK3lsanZrQml0N0NyZ0NTNGkvampIVnlrSDd6UXhyQTVwZytwZVhO?=
 =?utf-8?B?RGFxWVMvY04vR3d4aXVVaUg5Nzl2U1lIVXM2NldWNkcxUlZnVkpaWDRGelA3?=
 =?utf-8?B?Nnh0OS9wcVdkNDZXWDB1Q1M0T0JjZ2xmYUN2a1VzdHMwTmhFSmdYbG0wa1Av?=
 =?utf-8?B?ZzlhOUVTZ1BaeVdhN2o5bUQ1RHV1cG51SWkxRHFJMENYOVhDaFZpdG96RVFE?=
 =?utf-8?B?NVI4OXdYY0x6cGdmL2xzWTBGOXBUVjBLSFkwbXNzNVh5dFlGeUtMazBDSWhM?=
 =?utf-8?B?K0tnKy90N2o4NnNheGIzbW8vS1lpOVAvamRuYzEvUVZPdnFxS1RuNDZ4MEFV?=
 =?utf-8?B?TGw3TTBpa3h2dU5ISy9jakVyOHorMUdWNVM2dnBLaGQ1V2ltY2NKY1ROdXc0?=
 =?utf-8?B?MCsxbVBtWG90THU2ZjI5d2NiV1V2UTRGZnc5ZDNSVEZXelJOTUdIbUh2MVVm?=
 =?utf-8?B?alZVaXRFRGc5dytIOXM5NWFLR2tiNmR6a0ZxVVFmQk1UcVNodEVYK0VCeEs3?=
 =?utf-8?B?ZlBwY1J3M0VUTE5pYVd5YlBRbFBnZ0IxR2NQVGJLa1k1THo4TVA4ZWhmVjVj?=
 =?utf-8?B?S1dsSzAyTVA2OGx0SnZiSnZpWDFYZmYyS0pmaVVIZEJ1Q3hUUlYwRDlMTHQw?=
 =?utf-8?B?bzVrTTd0eFNydGI1RmY1L3Mvbk5hRkthbjM3WWtxOWt1VWFCL0hYNS9pcEtr?=
 =?utf-8?B?NzArQXRiVFlCS2d5bXpRRzZTaEF3REJyVDYxOWFqV0VxbGJCZ1g0RDIyR0RU?=
 =?utf-8?B?alFjNFpwbmRpS3E4ZDAyS0FCVEhodUgyVlJ6VVFIVTFML2EzZEx0N1VxQnhP?=
 =?utf-8?B?OU1FeVpXWG50azlsT29LTDdPeEZHUFlqQ2RVZ1hLekZCRlBJdDB3QS8zaE5L?=
 =?utf-8?B?NkRLZ1A5L1RMMFRoNFVCZURKdXh6U2N6ekNURjMrVkM0c01JeENZK21hR0dy?=
 =?utf-8?B?YkNBakxXcWNhK0FFeE1xVnM1L2lJNDgxcldvd2RqaXFVMmVQYTIxM0pWb2NM?=
 =?utf-8?B?eWsrRjN2eTlPOEwyNlNsRWQvNFNOYXJ3bk1keVZPWDJRZDVhRVVlNGE4N05h?=
 =?utf-8?B?SVBFLzBOenJMQUQrcWVYN2llejY5OFlBRjFPVFg0T1BPTnA1VTZQZkFHWHVE?=
 =?utf-8?B?RmRycXhVU0g3WXE1cXFjdktxWnNZRm5qQ2RSTlEzMlFmcFdZZVkveWx3TFMv?=
 =?utf-8?B?TUNJRDlLbmZ6N2xMYzRlQ1ovaDlXQVZmdTl5eVRya24weHcvZUV5dG5Ceks3?=
 =?utf-8?B?Y0t5SjBpU3huc1FMMVVkK3BoWVpvTTBNcUpyZG5zZ2o4REZkWkhnd0Q3WlR6?=
 =?utf-8?B?RFRWcnRiaFEvb3ZQS293MVNlVFI0UzBNNjZSeW84MXA4cEFRZlRGNENIcGZN?=
 =?utf-8?Q?FQh7KTGtPmOGFcOXsYwUKYoRi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7804000F5293584B836D5A464E17FCBF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4b5d0e-41f4-42c0-99be-08dd355f62c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 12:23:15.1190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tkgfovdnNcVwdPs9KONLkdLfADVgkAM0gmvwuwy98XdODcM962/XZpQTsETveOSGF8+4jeN97QuX+ulMliD8Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5344
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 12:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209896

SGksDQoNCkFsc28gSSByYW4gdGhlIHNjYW5uZXIgYWdhaW5zdCBjb3JlLWltYWdlLXNhdG8gZm9y
IGVhY2ggb2YgdGhlIGZlZWRzIGFuZCBpbnRlcmVzdGluZ2x5IG52ZDIgd2FzIHRoZSBvbmx5IG9u
ZSB0byByZXBvcnQgQ1ZFLTE5OTktMDUyNC4gIERvIHlvdSBoYXZlIGFueSBpZGVhIHdoeSB0aGlz
IG1pZ2h0IGJlPw0KDQpUaGF0IHNhaWQsIGEgZmV0Y2ggdGFraW5nIGEgbWludXRlIG9yIHNvIGlu
c3RlYWQgb2YgYWxtb3N0IGFuIGhvdXIgaXMgYSBncmVhdCBpbXByb3ZlbWVudCENCg0KQ2hlZXJz
LA0KUm9zcw0KDQo+IE9uIDE0IEphbiAyMDI1LCBhdCAxNzo1NCwgUm9zcyBCdXJ0b24gdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJvc3MuYnVydG9uPWFybS5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiAyNCBEZWMgMjAyNCwgYXQgMTA6MjUsIE1hcnRhIFJ5
YmN6eW5za2EgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJ5YmN6eW5za2E9Z21haWwuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gVGhlcmXigJlzIGFuIGluY29u
c2lzdGVuY3k6DQo+IA0KPj4gU2V0IHRoZSBOVkRfREJfVkVSU0lPTiB2YXJpYWJsZSB0byBjaG9v
c2UgZmVlZDoNCj4+IE5WRDIgKGRlZmF1bHQpIC0gdGhlIE5WRCBmZWVkIHdpdGggQVBJIHZlcnNp
b24gMg0KPj4gTlZEMSAtIHRoZSBOVkQgSlNPTiBmZWVkIChkZXByZWNhdGVkKQ0KPj4gRktJRSAt
IHRoZSBGS0lFLUNBRCBmZWVkIHJlY29uc3RydWN0aW9uDQo+IA0KPiDigJxOVkQx4oCdDQo+IA0K
Pj4gKyMgUG9zc2libGUgZGF0YWJhc2Ugc291cmNlczogTlZEMSwgTlZEMiwgRktJRQ0KPj4gK05W
RF9EQl9WRVJTSU9OID89ICJOVkQyIg0KPiANCj4g4oCcTlZEMeKAnQ0KPiANCj4+ICsgICAgaWYg
bnZkX2RhdGFiYXNlX3R5cGUgbm90IGluICgiTlZEIiwgIk5WRDIiLCAiRktJReKAnSk6DQo+IA0K
PiDigJxOVkTigJ0NCj4gDQo+IEnigJltIHRoaW5raW5nIOKAnE5WRDHigJ0gc2hvdWxkIGJlIHVz
ZWQgZXZlcnl3aGVyZS4NCj4gDQo+IElmIHlvdSBzZXQgaXQgYXMgdGhlIGRvY3VtZW50YXRpb24g
c2F5cyB0aGVuIGV2ZXJ5IHJlY2lwZSB0aHJvd3MgYSB3YXJuaW5nLCB3aGljaCBpcyBxdWl0ZSB0
aGUgcGFzdGVib21iLiAgTWlnaHQgYmUgYmV0dGVyIHRvIG1ha2UgaXQgYmIuZmF0YWwoKSBhbmQg
dGVsbCB0aGUgdXNlciB0byBmaXggdGhlaXIgdHlwbz8NCj4gDQo+IFJvc3MNCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRv
IHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMjA5ODExKTogaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMDk4MTENCj4g
TXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTEwMjcw
MzI1LzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0K
PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

