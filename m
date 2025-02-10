Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382DFC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 21:05:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web11.4308.1739221510537204256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 13:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=M1HUfBdY;
 spf=pass (domain: axis.com, ip: 40.107.21.77, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oj6x/TUawTUA7Kq2Z1gQZ4np/xUWFga3n9Zku8ReBmt/x9htjkfQ/Hsuc0ZqMdxJR+FJkzDghBQOORZNZNg65yGVus9dyUMaDUjKCAENjRsPndg8zAsBFn1JMNlhOh1vxntVgelrA285NqYuQaQNd6dKLYRY/71LZi+77VkkF8JPQ1fqlUlGVNwGEuMt/jygJGZkdpYRpftqHZpMqVKaXaT348wQqZaRRjDBqD4JQY8mkmSeWgliWMyWm2B4EM2CeT6YdCCdsut2EG6RUu1dXF6I0/iU+zuHFNqVkKkE2eX0eeL/7HnmGencxTJmQc+WeYGzLHTTyiVNgCe4bwh+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+MdBrLTah6PHLkk8hVOHSHEDdQ5hTJ/0ZAeNZfKVEI=;
 b=diqS2r3KjeUo3XuXqigXMQyBcQOu3D1ZL91MVc8AoxRde/zhCiReiNj+NhqK5kaRUAMihR972CLbuMN2VmYuktRw+xV24VGMuQ0m2VJjAzO3KNzwNGVHycIDBI/LjiqDlCp/zi9P2HYds2viJs91R6v9Dvg9UvGNDwYVcVIAGTUKuAyRY6OFwko/scQzyKatR/JX/2TPMPlPNRgbiSvhpQ4Pxk7c8WrTDkXfuVQmg7IiwHykLppkJbAHvOErN8q2zldFL2/SE/rc36P4O+Cn8NjkL0oNfU+wzuKy+yA7zwDl2lXt2kQao88i4/GqyTb/+jkNFPH8ILNN7yG4Ax62Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+MdBrLTah6PHLkk8hVOHSHEDdQ5hTJ/0ZAeNZfKVEI=;
 b=M1HUfBdY2JEINXepSw1GzLTQnJzf+tse0VkjXSHDbnIKThUwrewMLY67f0aHqncQEuyAqys9VMcgq+CT37p/xQmY+qot9a2CQfawaruPGPHeAOWJYB9B1+R8LHpKRyV1RMx4aB2Oh2ABFL5RfDAgzbS6xl4oAXN+eNZkj/vCuUk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB10013.eurprd02.prod.outlook.com (2603:10a6:10:447::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 21:05:07 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 21:05:06 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "oobitots@cisco.com"
	<oobitots@cisco.com>
CC: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ruslan Bilovol (rbilovol)"
	<rbilovol@cisco.com>
Subject: RE: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Topic: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Index: 
 AQHbeKZdCriq+uort0CFlSC6luWE5bNAcbkAgAAD1wCAAAC8AIAAVD6AgAAELQCAAD2RkA==
Date: Mon, 10 Feb 2025 21:05:06 +0000
Message-ID: 
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250206144907.1924993-1-oobitots@cisco.com>
 <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB10013:EE_
x-ms-office365-filtering-correlation-id: 427731ef-fd84-406e-99ae-08dd4a1698bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aUgrKzR0Rm5TTk1FNTluSDFUQzVWZHNuVU9Jd3VFSEM3Vm9xSFFISFlQM3ln?=
 =?utf-8?B?OTFidEJDMEVKNFJRNGVUQ29LdmVhd2NMa1BXOXIzOHpRTjNhVGd6T21HMHU2?=
 =?utf-8?B?dmpsNzF3TUF6UjdmcWwzbGFCVlFvQk1EdE9ORjBlMWtzUURDb1F5QWFzaTh3?=
 =?utf-8?B?bDhFTDZCWWFmWDlsODZBd3k4dHNGYWtUZmZSQTdwQlpOejlNc0tpMHQvTmow?=
 =?utf-8?B?RjdlV1o3akczQUMwUzdnNzNpU2k4SURGL0hRZlo1MHlhOEFIZkJLdHdzbFlK?=
 =?utf-8?B?K25LZkp4a2ZES0lwcm53WGxpSEJZMW5IdEM0L2dlREwxQ3ZxUnhGdEZPeDNo?=
 =?utf-8?B?VDBMMXFJT2lXWWhlL2J5VlBqUHNFQkIvK1hyOWlYZEJGYjAzQ1pDR3R4ZXV3?=
 =?utf-8?B?UU1jckFiMEVXTXQ1YVlwOXA1Q2QwaHVxY2tyZ3IvRHpmdU1yY0N4eTRpYm9R?=
 =?utf-8?B?dzJQNzZBVitTM1VLejFCNlpyR2Z3RFhmWER0OTh5WHlUM25HTm5Yd1VjUzVR?=
 =?utf-8?B?Ukdza2F2dW94SW42ZmdkYW1DK1EwQi8yN29OZHJKNjNtSTJ0SC93OTVwT3g2?=
 =?utf-8?B?SHFtZjZRUVpIV1hybUNVTXNKM1B3Q3Y5ZG9XSlBURnpNOVEyRnE0N09zQTZo?=
 =?utf-8?B?SzJFMXJmOVJXNHVNbXNvUE81WkZaSEVBbFh6TWRyQ0oyenI2eWp5dGhqclMx?=
 =?utf-8?B?WVhOOXlsWEdsb1NvbWtaSnp5dUVRbThNVUQrNXhYVGdhRVQ3cFBxTjV2SGlx?=
 =?utf-8?B?MlpOd1ZRaXFKQysySTRaZDlCaHdlbzRHU1NOY0d3ZUlDS2pXdXZRSkJFT3lP?=
 =?utf-8?B?andUbTZySzhiQ0hOUXVmTFA0TWUvSDBQU1BTOC9XZEk5blBqdXp4bXpyVEI0?=
 =?utf-8?B?eXpxWERVOVdvVHFWSUFNS0d6K0VFaEtyY1QxNUpwbytOOG55Sjc0ZDZCVU10?=
 =?utf-8?B?QWtwb1Btc0dnTUtWaHFvbzhCdEcxU3JvQ3BMcFk0akgvN0FYZzdKQ1oyN0tz?=
 =?utf-8?B?UlhiZ0RhRyt0SmhNQ0hWNzFySkdSUUlOd0lJdHBNa09MSmc5d1FHbmQ2WU5C?=
 =?utf-8?B?dzBNQXcxZFBhckYzU0JDM2tCQnVkM2tER2pTaVJOMyt3SzFEVWxJR0h1eGZX?=
 =?utf-8?B?c003bmVNZElFcFRna3l2OW9jbHdNVmJrQ0JGVlFRY0YvWktieEFHRFJkVEpN?=
 =?utf-8?B?M1dXVTV2VmVsUGtWcktkWHp5b2pJQnBKTjlWeU5hOVNwb3dvS0V3MjN2UEIx?=
 =?utf-8?B?VWovUVhQYldlYnpva0RGNG4xdnVXVHE5bEprUzR3NVN2a3N5azU0eEpOdjNX?=
 =?utf-8?B?cmNab0lZRU85ckhadXQ1bE1ZMmJPdEFwOUFaK1JWeCszS2JSUFRtMWVva1pn?=
 =?utf-8?B?V2pCOExuUzZUVmRVVlFEVHc0cHVrVUJTSmlLNVBjMnMxcHBET0NSdk1BZEVR?=
 =?utf-8?B?S2hzUlI0Rlh4Nmx5TXpvM3ZtSU5OemNDQ290R014N3RMYzZaM2laUEtFRXVl?=
 =?utf-8?B?R29tOTFSSExsbnJ0ZkwwR2MxTVZRbFQ1TmYyVnRuTmo2N2h4VkdlS2laVDNy?=
 =?utf-8?B?VFBwSkFRVVByWTV0eFcxVUVMMWo1ejBJTmJwd1ZrVk5GS3M0SjFuMkZVYjQ5?=
 =?utf-8?B?Ky9RRTNsRlZOM1o1UWh6WFpzaGJGNi9uNmh0Z3RXZnlXSWwwYVpoUmYxZ3d5?=
 =?utf-8?B?K295d3FrdzV3My85dmwvQi9mQ21DOGdCRnVOTEN2YU9tZSthTUwyNDkwSHlz?=
 =?utf-8?B?WklKQ1B2cUI1VVN5S2xMOE5yQlJXaU5Ec1RnckdUczFQdS91SlI3bmxZbThV?=
 =?utf-8?B?eWtqaGE2Tks4NzJ2R1BTTnJlaTNJelpYaGNMa0xIQlQzV3NpTG1RV0JOQUZB?=
 =?utf-8?B?dzc4eHZTVmtPRVNFeVNzdHJ6QWNsbkFCbU0zV2NmNFUybkx4dnQxWXU2bVdF?=
 =?utf-8?Q?w7Ob7JFlz0uWulOZkqdrP+kwNCWTZzj4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K1RwcTMzTFVYVGVIM1ZLMDllekEwRWhuY3FGSVdNS3k4Sm9KZDIwM21hRVIv?=
 =?utf-8?B?YUVJYVNIczFHS3IzVXlzcm1wd2ZSZUdrdnl5dTZZREQ1TXlNcGc1S1ZxYy9j?=
 =?utf-8?B?NjVyUS9udCtzM0h1Mm1zQzFRWDNkMHdQUmxEU0ZldjRVRVpRRmttY0grOFVH?=
 =?utf-8?B?SkRENDl2OEUydGc5MlZ4dGxYSExSK0dyS0Qxb2VxU1lwMFVPSGdDYTVmaEVp?=
 =?utf-8?B?d0V0YTBPNlcrOHRwQkorUFpGNkNBY2R6U0R5V01nMzNPc0pUN2VCeER5dDdK?=
 =?utf-8?B?WFhLSG4rTGIrcVg0QSs3S2VXNEU4anJLYzVkWlNaZTd3ZWk4cUh3Z0NNTmh0?=
 =?utf-8?B?TnlITWlxaG5LTEtOaW1UNHZiclZNK1Q5bnJFOGVMaHFid0VOeUxoazFkSFRo?=
 =?utf-8?B?T2piMVpZRkZ2M1VXK0JSeDN0WUh3U2N0MlVMOEYvZ1pDejVqRS9VdU9EKzRT?=
 =?utf-8?B?UXZtSXBsYndES1lhMzVIdWhKMkNwalhuLzNESVhtN2ZZdm9hL3BrTHZwby84?=
 =?utf-8?B?MUhwbnVLbWtGa2tNZGliOEgzV1o1Y09DLzh2TUpsaU15Wk1oZDFhZndSVDlW?=
 =?utf-8?B?TnVkdmJDWko1dXdOVEZkckNxV0VBYWIvaXVwNkczSmFHRmE3MGJrV2ZKbnNq?=
 =?utf-8?B?d21aS2pKaHNXMi9mRzRVUWJkWFNneFVibGRwVU84K25iYk1QTDluTHhmNVBW?=
 =?utf-8?B?bHN2c295bTNOSit2VVJIWmwxc3FjaStVYTh0S0crN2QvZ2psK1ZMdk03clZk?=
 =?utf-8?B?TzNha0RPYnBibjJQTEhyc05qUms2RnlIcWU1UDBlY3dmQmpWNVdJL3pkQkNB?=
 =?utf-8?B?ZVNrTUtiTXZ5QUxVQ3hELzVHYnljVHJBOVFzYmdGR2E0Tkt1SSszZjRQT0o1?=
 =?utf-8?B?Rmp6VjA3aWp6YWFNbkVxRjRsODdKc3dZSTlCdzlEZWIyOFVYU2xYSDRWVVVL?=
 =?utf-8?B?NnlzK1p4UURIM1I1M0dSQWlBbVBPTHNtK2RnQ1duQ0tCZ1lRbVNKMFZtRTA2?=
 =?utf-8?B?OGRvcmszemhEbHA3RnhpdmwrNFM2R3ZSTUYzQkZBemlIN1pDdHNYMyt3Y2Vz?=
 =?utf-8?B?VmlnL2JIR2c0YUJRMnlJQk5uK2R3Z041Nmg4V1VCWUE1Mjg1L2hIZXpMNERP?=
 =?utf-8?B?SzViSmozcWFBTGdlWk5RbFFodkpYd3lqN2Jtd3ZxY1dxd09hSEJwOGJHa1BM?=
 =?utf-8?B?RXNZcDVZU1VrTlptaGJYZzViVDBWRUxHZVpEVFVyNFgybjBSc2J0REFleXhn?=
 =?utf-8?B?R0s5K0c3NkVSSEh2dFk1MmVPd214ei9Yazh2T1lKcE04eEdGelc1M0x3OUxH?=
 =?utf-8?B?eTJEL0NSK2s4U3NuMkpqT1NSVlNtQ2pyY0RpMnNhREFpRW14RjFhSHBHbXZT?=
 =?utf-8?B?em9YVkVCVG1tVStVZDBzVERkS0VBKzBiQ0NGN2NPbGxzam0vTmJRN2pyVDNK?=
 =?utf-8?B?b0E3bFBNTWU2U2cxc09SZGVKVG8xb0JPS2YxS09HeDVhdmRudDdWUWR5N3Jh?=
 =?utf-8?B?dWFmTnlEazV6cExTblcrbE9KdGdONytZZGt2dmVhZ1QrZHRjS2tmMHpRbWJI?=
 =?utf-8?B?ck5MaDFkVHNLSUszU21QTE1pcnNSdVp4ek12S2FmeWVvdEdlT3Y4OXpHUHNP?=
 =?utf-8?B?aDFDNkJyZFBScXJZbXo1Sjd1dy9xUzg5bUpKOGRjdzBUaWR0bm9ZeDNyQmV6?=
 =?utf-8?B?emhOaEY4VmRvUnl5Vm14S3BTSWE3SGhmZ1JFOXFLcE54Z0hqNCswbDNkYnVo?=
 =?utf-8?B?azRhZG1pY3hpZHZWbmpSQ2dzazZCR2tRTXVNUGRvS1ByOUZ0ZFltWkhveWpQ?=
 =?utf-8?B?RkswS2lTam1LMFhjMXlPM3E0NzlPYmpWanZFUDhuVHQ0MXJ4THEwYWYwUyts?=
 =?utf-8?B?YXFLOXAvY1Rra2Y2Ym9nSVdvNks2c0lVYWhiZld5dDh5Ulhjd2NmUGhiRlgw?=
 =?utf-8?B?TFBPd2NNNllvSFJpTDRPV1J5dUdXOHpvVlVuN01rKzhpajMzdHhFWk82WSs1?=
 =?utf-8?B?dDY0VVVzM1k4cEhnV3dOVVo3UXZhM21zd0Fwek51cDhwQ2t3RTRQUW1rRyt6?=
 =?utf-8?B?cnZKN3NYK1kzbWNmMUFTZWViSm1UTXE5c01TUHJORWVrV09vZ1dDUzhwRGJF?=
 =?utf-8?Q?1CNY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427731ef-fd84-406e-99ae-08dd4a1698bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 21:05:06.8185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SGX8MdlLShgEVtQaugPHQIZPUu6hUD+W1B8b9tI+f65sk1qWcz3y2shONBL4Dnr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB10013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 21:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211119

QWRkaXRpb25hbGx5LCBjaGFuZ2luZyB0aGUgcGFja2FnaW5nIGRvZXMgbm90IGFmZmVjdCB3aGF0
IGlzIGFkZGVkIHRvIA0KdGhlIHN5c3Jvb3QuDQoNCi8vUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24g
QmVoYWxmIE9mIEFsZXhhbmRlciBLYW5hdmluIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFNlbnQ6IGRlbiAxMCBmZWJydWFyaSAyMDI1IDE4OjIwDQo+IFRvOiBvb2JpdG90c0BjaXNj
by5jb20NCj4gQ2M6IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPjsgb3BlbmVtYmVk
ZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IFJ1c2xhbiBCaWxvdm9sIChyYmls
b3ZvbCkNCj4gPHJiaWxvdm9sQGNpc2NvLmNvbT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0hdIHN5c3RlbWQ6IG1vdmUgc3lzdGVtY3RsIHV0aWxpdHkgdG8gc2VwYXJhdGUNCj4gc3Vi
cGFja2FnZQ0KPiANCj4gVGhleSdyZSBub3QgYWN0dWFsbHkgY29waWVkLiBUaGV5J3JlIGhhcmQt
bGlua2VkIGZyb20NCj4gc3lzcm9vdHMtY29tcG9uZW50cy8uIFRoaXMgaXMgYSBjaGVhcCBvcGVy
YXRpb24gYW5kIGl0IGRvZXNuJ3Qgd2FzdGUNCj4gZGlzayBzcGFjZS4NCj4gDQo+IEFsZXgNCj4g
DQo+IE9uIE1vbiwgMTAgRmViIDIwMjUgYXQgMTg6MDUsIE9sZWtzaXkgT2JpdG90c2t5eSB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b29iaXRvdHM9Y2lzY28uY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQWxleGFuZGVyLA0KPiA+DQo+ID4g
QnkgJ2RlcGxveWluZyB3aG9sZSBzeXN0ZW1kJyBJIG1lYW4gbmV4dDoNCj4gPg0KPiA+IEV2ZXJ5
IGNvbXBvbmVudCBjb3B5IGFuZCBpbnN0YWxscyBwYWNrYWdlcyB3aXRoIGxpYnJhcmllcywgdXRp
bGl0aWVzIGFuZA0KPiBjb25maWcgZmlsZXMgaW4gY29tcG9uZW50IGxvY2FsIHN5c3Jvb3QsIGku
ZS4gZGlyZWN0b3J5IHVzZWQgdG8gY3JlYXRlDQo+IGZpbmFsIGNvbXBvbmVudCBpbWFnZToNCj4g
Pg0KPiA+IGxpYnN5c3RlbWQwXzI1NS40DQo+ID4gbGlic3lzdGVtZC1zaGFyZWRfMjU1LjQNCj4g
PiBzeXN0ZW1kXzI1NS40DQo+ID4NCj4gPiBTbywgb24gZGlzayB3ZSBoYXZlIGR1cGxpY2F0aW9u
IG9mIGZpbGVzIGZvciBldmVyeSBjb21wb25lbnQgdGhhdCBkZXBlbmQNCj4gb24gdGhlIHN5c3Rl
bWN0bC4NCj4gPiBJbiBjYXNlIG9mIHNlcGFyYXRlIHN1YnBhY2thZ2Ugd2UgaGF2ZSBvbmUgcm9v
dCBjb21wb25lbnQgZGVwZW5kIG9uIHRoZQ0KPiBzeXN0ZW1kIGFuZCBhbGwgb3RoZXIgY29tcG9u
ZW50cyB3aWxsIGNvbnRhaW4gb25seSBzeXN0ZW1kLXN5c3RlbWN0bA0KPiBwYWNrYWdlIGNvbnRl
bnQuDQo+ID4NCj4gPiBPZiBjb3Vyc2UsIEkgdW5kZXJzdGFuZCBpdCdzIHF1aXRlIGEgc3BlY2lm
aWMgc2NlbmFyaW8uDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IE9sZWtzaXkNCj4gPg0KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+ID4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAx
MCwgMjAyNSAxMzowMw0KPiA+IFRvOiBPbGVrc2l5IE9iaXRvdHNreXkgLVggKG9vYml0b3RzIC0g
R0xPQkFMTE9HSUMgSU5DIGF0IENpc2NvKQ0KPiA8b29iaXRvdHNAY2lzY28uY29tPg0KPiA+IENj
OiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPjsNCj4gUnVzbGFuIEJpbG92b2wgKHJiaWxvdm9sKSA8cmJpbG92b2xAY2lzY28u
Y29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBzeXN0ZW1kOiBtb3ZlIHN5
c3RlbWN0bCB1dGlsaXR5IHRvDQo+IHNlcGFyYXRlIHN1YnBhY2thZ2UNCj4gPg0KPiA+IE9uIE1v
biwgMTAgRmViIDIwMjUgYXQgMTM6MDEsIE9sZWtzaXkgT2JpdG90c2t5eSB2aWENCj4gPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxvb2JpdG90cz1jaXNjby5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4NCj4gPiB3cm90ZToNCj4gPiA+IFdlIGhhdmUgbmV4dCBzaXR1YXRpb246DQo+ID4gPiAt
IGEgbG90IG9mIHNvZnR3YXJlIGNvbXBvbmVudHMgdGhhdCBkZXBlbmQgb24gcGFja2FnZXMgYW5k
IGRlcGxveSBhbGwNCj4gcGFja2FnZXMgdGhleSBkZXBlbmQgb24gbG9jYWxseSBpbnNpZGUgY29t
cG9uZW50Lg0KPiA+ID4gLSBzb21lIGNvbXBvbmVudHMgZGlyZWN0bHkgZGVwZW5kIG9uIHN5c3Rl
bWN0bCBvbmx5IChlLmcuIHRoaXMgYmluYXJ5DQo+IHVzZWQgaW4gc2NyaXB0cyksIHNvIGZvciBl
dmVyeSBjb21wb25lbnQgd2UgaGF2ZSB0byBkZXBsb3kgd2hvbGUgc3lzdGVtZA0KPiBsb2NhbGx5
Lg0KPiA+ID4gLSBmaW5hbGx5LCBhbGwvc29tZSBvZiB0aG9zZSBjb21wb25lbnRzIHdpbGwgYmUg
bWVyZ2VkIGluIHNvbWUgd2F5IGFuZA0KPiB3aWxsIHVzZSBzeXN0ZW1kL2xpYnN5c3RlbWQsIGJ1
dCB1bnRpbCB0aGVuIGl0IHdpbGwgYmUgbmljZSB0byBnZXQgcmlkIG9mDQo+IHN1Y2ggZHVwbGlj
YXRpb24uDQo+ID4NCj4gPiBJJ20gc29ycnksIGJ1dCB0aGlzIGRvZXMgbm90IHF1aXRlIG1ha2Ug
c2Vuc2UuIFlvdSBuZWVkIHRvIG1vcmUNCj4gPiBzcGVjaWZpY2FsbHkgZGVzY3JpYmUgd2hhdCAn
ZGVwbG95aW5nIHdob2xlIHN5c3RlbWQnIG1lYW5zLCBhbmQgd2h5IGlzDQo+ID4gdGhhdCBwcm9i
bGVtYXRpYy4NCj4gPg0KPiA+IEFsZXgNCj4gPg0KPiA+DQo+ID4NCg==

