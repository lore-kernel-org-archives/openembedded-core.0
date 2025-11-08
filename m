Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C3CCD13CF
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 16:32:08 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8994.1762619524140986183
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 08:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=oyIijLWH;
 spf=pass (domain: axis.com, ip: 52.101.65.23, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tb5/g1Ca+O98l/HRiF2rQcy+V5d666D58IFpCaaFBNGMcCLQmX5PFG9wjP+xdPU6iXoqVZ8U9Y9uZC4ZIk0hkSijtfaVWg+/zrM4T428kA+WmerYsfffR552OOnB5j0g+I+LxjimItM1iD1LzdJtCunTe5noRd28fP34opmUUMJhipVE53lryZOpgeLfqA4fXYCLSWhAnbmrUkTd70cvrw+HGiD0aKWYerdtiWKqo2GNODJlM7thOe+hlcAcQ4AFLlqtgqNCrn1pKmxO1sOtYKvJ+2dsMWm1UchGvn+LI4+F/6ntXQ/ZcwhTU3dtO8TlPd/G+aayDFYDm95W+GuiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONDhhf4qEEk+zuvgWPo6WXJ9sLDsvKJTZcZFsieKcc4=;
 b=O7SZWpI4fXzjNtopu0a3o46aLsbbqBjhErrYP2ZF2bn7Tf4kjKfAY7zv/UQLOdD8B3PiLuvTCjaGEjjRLZpyVIsLXTcnsUVcEkzJ/TDvBwQFH4TXj4X8WhfEYXKyK5jtkFmxn24yRM1qTXKyQXtDV3v9faNKuzvCp/BJIPLgZQ3xfoEyY/YchKAvKyLvXPe0fCeMaM7igeIhOLuedx4F1fiu/shFcggd2Sj5xFGmIN2cF/p4y27ZFgEmyiabdZ1sqZprf+jw68et0QA8KBZycqkdXtk9BG896SdRSrl7dM/BcDS58a8zIqKQXf87SO0SaWDxsPn+hMp56l29MC//Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONDhhf4qEEk+zuvgWPo6WXJ9sLDsvKJTZcZFsieKcc4=;
 b=oyIijLWHDsWZsvtsTFwxcrtsO+HSQk4+9mLMUfuc/AcLcLLzmeT6NPzvZOxUyosytjhSogFnjcOb48Jp+zVfCve1/c5/I9i+zSAAIwClfTaHwQdVU4X2Nmsckh5Ah0BkmK+L11llZ4CXbQBl+L9cuUv3TB8vpIwP2RJNa3+cvkc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA6PR02MB10753.eurprd02.prod.outlook.com (2603:10a6:102:3d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 16:32:00 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 16:32:00 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"liu.ming50@gmail.com" <liu.ming50@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] bash-completion.bbclass: put bash-completion
 package to PACKAGE_BEFORE_PN
Thread-Topic: [OE-core] [PATCH] bash-completion.bbclass: put bash-completion
 package to PACKAGE_BEFORE_PN
Thread-Index: AQHcUKQNIgwlOMHtf0ePGirNgb4+v7Tozs6AgAAobGA=
Date: Sat, 8 Nov 2025 16:31:59 +0000
Message-ID: 
 <DB5PR02MB10213441EEB2CA76CF300E623EFC0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251108113710.23299-1-liu.ming50@gmail.com>
 <DE3D91UDJETW.1GCQINSH3TU1E@bootlin.com>
In-Reply-To: <DE3D91UDJETW.1GCQINSH3TU1E@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA6PR02MB10753:EE_
x-ms-office365-filtering-correlation-id: 3dfff902-5faa-4d09-a3c5-08de1ee45755
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bWhEcStLMXJyTmRXMTJGaSthWHZxbEVlUVIyN3Nna2x4bU4xRldqWThoTHJC?=
 =?utf-8?B?NkxiQklLS0hqekRlQ1dKMlNlTENIaWk4TVVUZ1B6ejVGK3VxNGhvTHZjWWpL?=
 =?utf-8?B?NEM5c1poLzllMjkxTnFINWRoL0VVdVIvaVBCVm4xbjhYZjkvbitlSzZ0eEVH?=
 =?utf-8?B?ZW9tN3BiYnVhcXJsRE9EL213cm5VTHJ6N2JYZU54ZzhaL2pkb0lhbzlEZUFr?=
 =?utf-8?B?WGJjMXh5SWpTRytsdzBQLzhtTlZvbndyVHBMOFhwWW45V1krVjJuZm82VUJV?=
 =?utf-8?B?blBVTjY2R2NGQ0FwNkQrbzVXY1NuUEsxWURtVnZ6N2kyRDhkSU5UcHBDNDk0?=
 =?utf-8?B?QzI0ZWxGell1TEFHSUhKL0N2RW50VE9oR1JtTnI3TXoycVdZY0dTc2pqeEFk?=
 =?utf-8?B?QUtRcmc4clVGUGJnRHdnOVRld2RSUTNmVW1WVjByeW85bThNZ1dCYTU2Ym12?=
 =?utf-8?B?bnI1RkVhaC9pc0Fwb05TTElsRzRJYU0ydlBlQWxIU2U1RERvYVpqbmNyZDBM?=
 =?utf-8?B?L2pxSU1kWmE2eG9NUGI2VTBKNGNYbVBLaHc4ZitidFZISUh3SXV2VzVVdWVi?=
 =?utf-8?B?dTNSSXhhL1N1dWM4TFF0UzFuV2VPdmlDNCtHeEFob1Zhd1Nzd0pxaytGeklC?=
 =?utf-8?B?NFZpelNqd3lzeWRBWlhiY3VQZDFkSFQ5SkZNQ1ZBT2dUNzd2VlJ4VTlYL3FR?=
 =?utf-8?B?endFSFYwV1hSLzFBSHM4TlI0ZHZUMDQyYmVkMzRnYzgvNVVpZmJ2SWtZcmVo?=
 =?utf-8?B?WjFhQUxKMFcrZnBZZ2g2M2JyUHVrSFN4bTVnRWJ0WUl2aXkxQy83ZjNOcVFO?=
 =?utf-8?B?YXlaRHZUdHhRMjdOVUtKVllrWG1jdTFBS1RnQjZ3NnZZSThlT2RLTDhMNWgx?=
 =?utf-8?B?aEZXakdyTzZDN1FkemZqS0p1dkR5b0lxVlloTUxGMmliOGdqV0o1SzJSZjhv?=
 =?utf-8?B?N1ZoUzF6Y01TL3lvdVF3R1ArbzJiTlVEd0NtQWNGUVZiOU9lQTNkeDZia0hJ?=
 =?utf-8?B?WmlRNC9MYjVrVVg5RkYyVEwyZGc0Vk1lQ3VrRzhRU2FyUmZmUXgxbzlwS2lU?=
 =?utf-8?B?WTdQV1lqcmZIKzNKdmZ4L2w3TmFRRWZDdzlrUjR5SlhQMXZmT2dpZlNaU3lB?=
 =?utf-8?B?TGU4eXFkQ2NwVG83djdLemw4eHlIN09lcVN6M3hhS2sxcVJpczRWUjlRbU8w?=
 =?utf-8?B?ZjB5bkx0Q3lXZG13V0JZNVp3VzJuVVBBVEFqVkJoTGtJZ0c1WFdlMk1jNkl6?=
 =?utf-8?B?YkdqRVNMc09pZUdONlZjRG40Uy82UUJnRHJQbHo4UkJRTTFYNFhSRTRzbndN?=
 =?utf-8?B?YXdnN0V2R1dSeTBxemRadFQzaENXeFltV3dRQkJMdkRRajFvSHp5VzNRRkxy?=
 =?utf-8?B?K2tXWGc0MUJ6cGpaUEpmTUxuVjZ1N2Qwd2I2U0FISXhwd2pJazdVcmg3b3NN?=
 =?utf-8?B?bCtWK2JKL2p4djIwNVdkaEFhZldsUWFncFFkV05JN3ZzWDVUYXdPNVk2L3NZ?=
 =?utf-8?B?SU1qQStRVXE1aldlUUZXRlVKR2pXMHh5NHEzS01HOFVnY2R2MC9jSjRmVDhj?=
 =?utf-8?B?VGZSK1NNdUpIb1RXYm1OMnVRZC9USEhkd0hhckE3OGw0VWxrODRSZWMzWVlN?=
 =?utf-8?B?TGF0d2ZCMXpnaUhjaFUrM2loandvcUE4UWJBd0RoaGMxdHAxb2o3SFl6QXdx?=
 =?utf-8?B?TXdPUlc0THUybHdSYzdUQ0xvdDg4eTNsMDJJMWN6aDJhVCt1R21xMHRzcEZM?=
 =?utf-8?B?YzE0NWV2djdRTWVXdjRkNU04VGNSNGUxMzdjeVE0OSttWnNPMWxONnUrd1J2?=
 =?utf-8?B?TFY2K2prM3psTUNSYTlZWjhWRmgzekVqQ1hualFKb3Q4WS84aC83ZGdlRGNQ?=
 =?utf-8?B?NWduU3hZN2Q3cEcwMzNzMHhjOXF0U3RxVXRoblBham1OUGtWUkVYemNQU0Iv?=
 =?utf-8?B?MlE3cTZ3ZWRKdU5ZaDBXMUNoSTlRL3kzU2NJeHZtRkVGdGdya0V2MGtmWFNQ?=
 =?utf-8?B?ejVubnN5SDJ3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NFhUVlRXOCtoY0xReVQ4dGdQQ000OVkzdW9pbkgzMzhDRnk5Nmo0RTNxYTN0?=
 =?utf-8?B?VGFPdzVPSFExdnF4c0FZSkNBcGg0K3NlazdIakFnS0RtWWlwTnJ1TXBrbzc0?=
 =?utf-8?B?VFptV1VZdytiVnhIN3d2aSs0WUZIaC9idVovWHpZbTJTVGpPb2dab0gzSVVS?=
 =?utf-8?B?VjZ5TjdISW9LK0pNMllxcUhhY0lLVUJPdHZuWnJQeUxxbFJUeFZhcVhBcXVL?=
 =?utf-8?B?TS9rNXIrcWYySEpmbzcyYmFGNWU0OUpDWVNqQmFpUlV1R0lSTlFSNVhIVXFj?=
 =?utf-8?B?NklNS0doRzFSdVk0VmR4OVRUc3dBdE1kZXZUbzAwRXJZOCtQWS9uMDNKWWlU?=
 =?utf-8?B?WTJHVmNlUUo4QzFZdzZNbGFCSDNQSEI3TU9BWStHeDhwSHA5czVkSjJ2OHRl?=
 =?utf-8?B?cm41NFhZam5aMkpQZXduUWVZZ0ZXYWtJTXJLVkdiNDBZVlA0L3JiTVd6blVQ?=
 =?utf-8?B?Z0svNkh2WmNOYVU4TlVpLzAvSTBjVEFaNlFKWUhIajFyS1FxUXRGNGRzUkhG?=
 =?utf-8?B?dXBVc2MzVUpzWmhKQklwQjV3b2p4WTFkYzJ5dlM3WHQwRlZ1Q1IvQks4SXds?=
 =?utf-8?B?UnNleWt4RUFTWmR4Sjh3dDE3OUhMNWFDamF3VlFoSDBhcENaWCtwTmRIalRn?=
 =?utf-8?B?ZW1RbWhDTW1BdVFxWExRNnlyQ1lNNjFDbTFxOTkvN3RENzNMRmtaRDJkd0xB?=
 =?utf-8?B?RlpEQWNtSklTdzFJa1hZeXY5eEdJOWFIVFdRUXZFZFhUV010Y21PUmpiU2Zj?=
 =?utf-8?B?OStkdWMydmV3cUFVVVFFMTBVcUtxcnorL3N1azNIOHBla2J1Ukl0U01VNnA3?=
 =?utf-8?B?K2JBYXZtQXUzZUJ6TDJsY0RsSkZZQ3JnOHd1Q1pIS3lKNkF4VkhiQ0pYMVBt?=
 =?utf-8?B?MEd0ek8vcVhscDhGSFE1dFIvK3NhZWVQOEYwMEJWK2p5WlF4cytqbjRZUndL?=
 =?utf-8?B?OXVOZFdIKy84NUhSVHRqMDZFblYxUUFDYjQvejdtV1VoUmVZSHZNb1pqNDVM?=
 =?utf-8?B?S2lqekMrVmR4NUI2bDU1Sis3UWtlYTh5SkdoNm4yQWhybkhhRHp6ejNieXJB?=
 =?utf-8?B?cDUvSmtIcmw1WXZraExBMjUram1JUlVpRStGazQ0c2FyZk1aYUs2MEF6VzNh?=
 =?utf-8?B?dVJqWHprUlptdktoaFJPWFZWM0syRmJQbnc0V2NoMW5aUkY0K0pUUjhBamdq?=
 =?utf-8?B?ZU5nNWR6TTM5VVRsOXo4RStWR0c1U0JQODFlSHJ5ak1rSkw3OThKdUtmSzdm?=
 =?utf-8?B?M2s0Q2o3UXNUeUVmcmh3S1VIU1BCZDE4blJHUkQ3ekRBZmg0aE01azA5QlhB?=
 =?utf-8?B?ZVhVdjRwWlBJdFpVYVNhK3BFeUpNV1lKQUVFeFNWZ2ZFRUNvamhlV3V4MjdJ?=
 =?utf-8?B?WWxpeGJTdjh5NVpCMFJCQlNpdG9hcVBjL0U0eXNwMjNmdnRuakZwZzlOMTBL?=
 =?utf-8?B?UGIxejB2aHFUTmhEUVIreHcyRlMyZ0c4WHF2L2h5SHBaYlhQREp1M3hXallp?=
 =?utf-8?B?VEVUM24wSXBKM09DSmJRNGx1QXhoQXQ4WkhtcHVxZjhWQTRoVC9BemV0NStV?=
 =?utf-8?B?d3c1Z0ZhZWxjVVp0Ujk5QStucG5oTmRqNnNjNnJxMkNVRmZhL3pHT2tYMkJi?=
 =?utf-8?B?bTZPcFlMUXdwRFhwaG94YXhPajZCN3NFbzZvdk9SbHZqZjIyVzY1L1ZkU21O?=
 =?utf-8?B?UnJhVTN0WjNLU1k2YUdXTUlBZDM0ek5za0NqV2RVVzhjWUlhSE9QcWNkak5W?=
 =?utf-8?B?NnZSRFBxMkJHWUM4dTJZSGhMeUlWanJUZVJpU215aVdFWXZhUXV5dXdSVjJw?=
 =?utf-8?B?SERhYTJRdHpia0tmUVRoaE44bVFXV3hrOVp2MGd1QU96VEJZZjR3VHpzbWdv?=
 =?utf-8?B?R3dRZWhxV2pkOFRoSlIyK3QvNTZLcVIzMlBVc2ZsRFJKTUdzV3oreVZkN3Nt?=
 =?utf-8?B?WkRzdHc3cWhJanFGUnNqblQ3T0VMQW5qUFhTa0RVa05nQ29TT3h0TzVLRnNT?=
 =?utf-8?B?SlpKVnJ5NU1KWUZ0K3hIaVBLSnEwZWVHUEQvZDN2RlY5QmdRTXdKUE1hSm1r?=
 =?utf-8?B?am8wZFFRSFpqNzVUTWRsM3B3Zk1USDhEOXNFZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfff902-5faa-4d09-a3c5-08de1ee45755
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 16:31:59.9653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m2WygjkLxRJM4kWFLvxR0ZIh782ABKr1nI3944Rz2ypdf5UtItBscn0vTKbi7hIh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 16:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226081

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgTWF0aGlldSBEdWJvaXMtQnJpYW5kIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFNlbnQ6IGRlbiA4IG5vdmVtYmVyIDIwMjUgMTU6MDENCj4gVG86IGxp
dS5taW5nNTBAZ21haWwuY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBiYXNoLWNvbXBsZXRpb24uYmJj
bGFzczogcHV0IGJhc2gtY29tcGxldGlvbiBwYWNrYWdlIHRvIFBBQ0tBR0VfQkVGT1JFX1BODQo+
IA0KPiBPbiBTYXQgTm92IDgsIDIwMjUgYXQgMTI6MzcgUE0gQ0VULCBNaW5nIExpdSB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBJdCB3YXMgb2JzZXJ2ZWQgd2hlbiBGSUxF
Uzoke1BOfSBjb250YWlucyAiJHtzeXNjb25mZGlyfSIgb3INCj4gPiAiJHtkYXRhZGlyfSIsIHRo
ZSBiYXNoLWNvbXBsZXRpb24gZmlsZXMgd29udCBiZSBpbnN0YWxsZWQgdG8NCj4gPiBiYXNoLWNv
bXBsZXRpb24gcGFja2FnZS4NCj4gPg0KPiA+IEZpeCBpdCBieSBwdXR0aW5nIGJhc2gtY29tcGxl
dGlvbiBwYWNrYWdlIHRvIFBBQ0tBR0VfQkVGT1JFX1BOLCB0aGlzDQo+ID4gZW5zdXJlcyBiYXNo
LWNvbXBsZXRpb24gcGFja2FnZSBnZXQgdGhlIGZpbGVzIHBhY2thZ2VkIGJlZm9yZSBQTi4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pbmcgTGl1IDxsaXUubWluZzUwQGdtYWlsLmNvbT4NCj4g
PiAtLS0NCj4gDQo+IEhpIE1pbmcsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+IA0K
PiBJdCBsb29rcyBsaWtlIHRoaXMgaXMgYnJlYWtpbmcgc29tZSBidWlsZHM6DQo+IA0KPiBFUlJP
UjogaXByb3V0ZTItNi4xNy4wLXIwIGRvX3BhY2thZ2U6IFFBIElzc3VlOiBpcHJvdXRlMjoNCj4g
RmlsZXMvZGlyZWN0b3JpZXMgd2VyZSBpbnN0YWxsZWQgYnV0IG5vdCBzaGlwcGVkIGluIGFueSBw
YWNrYWdlOg0KPiAgIC91c3Ivc2hhcmUNCj4gICAvdXNyL3NoYXJlL2Jhc2gtY29tcGxldGlvbg0K
PiAgIC91c3Ivc2hhcmUvYmFzaC1jb21wbGV0aW9uL2NvbXBsZXRpb25zDQo+ICAgL3Vzci9zaGFy
ZS9iYXNoLWNvbXBsZXRpb24vY29tcGxldGlvbnMvdGMNCj4gICAvdXNyL3NoYXJlL2Jhc2gtY29t
cGxldGlvbi9jb21wbGV0aW9ucy9kZXZsaW5rDQo+IC4uLg0KPiBFUlJPUjogc3lzdGVtZC0xXzI1
OC4xLXIwIGRvX3BhY2thZ2U6IFFBIElzc3VlOiBzeXN0ZW1kOiBGaWxlcy9kaXJlY3Rvcmllcw0K
PiB3ZXJlIGluc3RhbGxlZCBidXQgbm90IHNoaXBwZWQgaW4gYW55IHBhY2thZ2U6DQo+ICAgL3Vz
ci9zaGFyZS9iYXNoLWNvbXBsZXRpb24vY29tcGxldGlvbnMvdXNlcmRiY3RsDQo+ICAgL3Vzci9z
aGFyZS9iYXNoLWNvbXBsZXRpb24vY29tcGxldGlvbnMvc3lzdGVtZC1pZDEyOA0KPiAgIC91c3Iv
c2hhcmUvYmFzaC1jb21wbGV0aW9uL2NvbXBsZXRpb25zL2Jvb3RjdGwNCj4gICAvdXNyL3NoYXJl
L2Jhc2gtY29tcGxldGlvbi9jb21wbGV0aW9ucy9zeXN0ZW1kLXJ1bg0KPiAgIC91c3Ivc2hhcmUv
YmFzaC1jb21wbGV0aW9uL2NvbXBsZXRpb25zL2xvY2FsZWN0bA0KPiAgIC91c3Ivc2hhcmUvYmFz
aC1jb21wbGV0aW9uL2NvbXBsZXRpb25zL2pvdXJuYWxjdGwNCj4gICAvdXNyL3NoYXJlL2Jhc2gt
Y29tcGxldGlvbi9jb21wbGV0aW9ucy9zeXN0ZW1kLWNndG9wDQo+ICAgL3Vzci9zaGFyZS9iYXNo
LWNvbXBsZXRpb24vY29tcGxldGlvbnMvc3lzdGVtZC1uc3Bhd24NCj4gICAvdXNyL3NoYXJlL2Jh
c2gtY29tcGxldGlvbi9jb21wbGV0aW9ucy9zeXN0ZW1kLWNyZWRzDQo+ICAgL3Vzci9zaGFyZS9i
YXNoLWNvbXBsZXRpb24vY29tcGxldGlvbnMvc3lzdGVtY3RsDQo+ICAgL3Vzci9zaGFyZS9iYXNo
LWNvbXBsZXRpb24vY29tcGxldGlvbnMvc3lzdGVtZC1kaXNzZWN0DQo+ICAgL3Vzci9zaGFyZS9i
YXNoLWNvbXBsZXRpb24vY29tcGxldGlvbnMvcmVzb2x2ZWN0bA0KPiAgIC91c3Ivc2hhcmUvYmFz
aC1jb21wbGV0aW9uL2NvbXBsZXRpb25zL21hY2hpbmVjdGwNCj4gICAvdXNyL3NoYXJlL2Jhc2gt
Y29tcGxldGlvbi9jb21wbGV0aW9ucy9zeXN0ZW1kLWRlbHRhDQo+ICAgL3Vzci9zaGFyZS9iYXNo
LWNvbXBsZXRpb24vY29tcGxldGlvbnMvc3lzdGVtZC1wYXRoDQo+ICAgL3Vzci9zaGFyZS9iYXNo
LWNvbXBsZXRpb24vY29tcGxldGlvbnMvc3lzdGVtZC1hbmFseXplDQo+ICAgL3Vzci9zaGFyZS9i
YXNoLWNvbXBsZXRpb24vY29tcGxldGlvbnMvbG9naW5jdGwNCj4gICAvdXNyL3NoYXJlL2Jhc2gt
Y29tcGxldGlvbi9jb21wbGV0aW9ucy9idXNjdGwNCj4gICAvdXNyL3NoYXJlL2Jhc2gtY29tcGxl
dGlvbi9jb21wbGV0aW9ucy9uZXR3b3JrY3RsDQo+ICAgL3Vzci9zaGFyZS9iYXNoLWNvbXBsZXRp
b24vY29tcGxldGlvbnMvaG9zdG5hbWVjdGwNCj4gICAvdXNyL3NoYXJlL2Jhc2gtY29tcGxldGlv
bi9jb21wbGV0aW9ucy9zeXN0ZW1kLWNnbHMNCj4gICAvdXNyL3NoYXJlL2Jhc2gtY29tcGxldGlv
bi9jb21wbGV0aW9ucy9rZXJuZWwtaW5zdGFsbA0KPiAgIC91c3Ivc2hhcmUvYmFzaC1jb21wbGV0
aW9uL2NvbXBsZXRpb25zL3N5c3RlbWQtY2F0DQo+ICAgL3Vzci9zaGFyZS9iYXNoLWNvbXBsZXRp
b24vY29tcGxldGlvbnMvc3lzdGVtZC12cGljaw0KPiAgIC91c3Ivc2hhcmUvYmFzaC1jb21wbGV0
aW9uL2NvbXBsZXRpb25zL3RpbWVkYXRlY3RsDQo+ICAgL3Vzci9zaGFyZS9iYXNoLWNvbXBsZXRp
b24vY29tcGxldGlvbnMvc3lzdGVtZC1yZXNvbHZlDQo+ICAgL3Vzci9zaGFyZS9iYXNoLWNvbXBs
ZXRpb24vY29tcGxldGlvbnMvc3lzdGVtZC1kZXRlY3QtdmlydA0KPiAgIC91c3Ivc2hhcmUvYmFz
aC1jb21wbGV0aW9uL2NvbXBsZXRpb25zL3J1bjANCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzIwL2J1aWxkcy8yNjY5DQo+IGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzEx
L2J1aWxkcy8yNjY3DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxr
eXJpZS8jL2J1aWxkZXJzLzY1L2J1aWxkcy8yNjg3DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9j
dG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzc0L2J1aWxkcy8yNjc5DQo+IGh0dHBz
Oi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzc4L2J1
aWxkcy8yNzIyDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJp
ZS8jL2J1aWxkZXJzLzk5L2J1aWxkcy8yNjg0DQo+IA0KPiBDYW4geW91IGZpeCB0aGlzIGlzc3Vl
Pw0KPiANCj4gVGhhbmtzLA0KPiBNYXRoaWV1DQoNCkl0IGlzIGNvbW1vbiBmb3IgcmVjaXBlcyB0
byBhc3NpZ24gdG8gUEFDS0FHRV9CRUZPUkVfUE4gdXNpbmcgdGhlID0gDQpvcGVyYXRvciwgYW5k
IHR5cGljYWxseSBhZnRlciBoYXZpbmcgZG9uZSB0aGUgaW5oZXJpdHMuIFlvdSB3aWxsIGhhdmUg
DQp0byB1c2UgUEFDS0FHRV9CRUZPUkVfUE46YXBwZW5kLiBBY3R1YWxseSwgeW91IG1heSBhcyB3
ZWxsIHVzZSANClBBQ0tBR0VTOnByZXBlbmQgaW5zdGVhZC4NCg0KLy9QZXRlcg0KDQo=

