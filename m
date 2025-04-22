Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5A6C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 19:36:38 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.6])
 by mx.groups.io with SMTP id smtpd.web10.49111.1745350590131091820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 12:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ny6yFkrZ;
 spf=pass (domain: axis.com, ip: 52.101.67.6, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrpTu9jV+oSQpwFnBR1UK7outZzSIMmYqObKcEMAnvPHazUlnwsq38VlWz5ssrDcrYJcccsNvdeLPY9dPEDXxvoBnLRB0/QY008zhszuU77HdI4wKCVFO2T5n1NrDf0GQbRV0GSNGkAPBs7FZh2dzuIW38rhwXROR41ckamqslFGLfiJZMU+bYjP1kK2tjC7a0zLNOuYnqtrlmSzTxeUJTKZ6dAMrfcqQAX6zqiwBE73IjJ2QGbDWvyGtDlXD67fPboIJ0C0iyuu63EjkoNbm04NWt/ilDvOJCbb41NiyXpFq33G0ONWpDxR6r8c2DaQitae//+1lZic8LbYY2+qPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn4q0d4RVU1m9weuBcLCt/IXv1sGdP5CTVH/j9cexbI=;
 b=UIx3E7+fPp2bDWg5MOTbDMsb5l9pzNWMlrQgPWpKIa7O1Tds3P+ddN6IplOtUSlk2lG3KdQbPlBgtEHgi3zzBpFGuoe8rjs1ySY+HChPRyEWqoVB7t+QWfu9g4NDPHeW1bS1LuCZqPKsRlm5o0/2mRRqmX0EnSbqEAsbLnvDQYho31PbdJo6WM7RrAY/6copxBtmt3bwt/Rs7isuKyLMwtPTX/gtq+Sd5aEbqoojca85N8FcUoSHpLoqm/apP51jWpheFAssc2exEQ/EoCD4QZm9Zaqv/isEr8IogXbwssCgZscE55SRh6z57QbY8mSwHDBnNdWdD3cqinGLSllRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn4q0d4RVU1m9weuBcLCt/IXv1sGdP5CTVH/j9cexbI=;
 b=ny6yFkrZmym6oqYGOEwZTvX+83TfZTbNTMGyzQBtJ7foaTmmuCK5tRkqEV+QX3p5ok4E0si0Tr/imyRHzyNmYrzwIrK3PbO678zYBSIAeeFGN7mlebzYB/oIz1OVuaBZPLnuzAcU//c+xCPBz4a3lOoCqNxB+4rN1q5Pf0252zk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM9PR02MB6609.eurprd02.prod.outlook.com (2603:10a6:20b:2cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 19:36:26 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8678.019; Tue, 22 Apr 2025
 19:36:26 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "patryk.seregiet@gmail.com" <patryk.seregiet@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] linux-firmware-rtl8723 RDEPENDS on entire
 linux-firmware
Thread-Topic: [OE-core] linux-firmware-rtl8723 RDEPENDS on entire
 linux-firmware
Thread-Index: AQHbs7WTw/YGv1XuKE6fdpbiV310H7OwDLBw
Date: Tue, 22 Apr 2025 19:36:26 +0000
Message-ID: 
 <DB5PR02MB10213F71504E2AA09A113921CEFBB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <CAOf3PZyrgCJviBHSBeDMmdcH+possRxwmNRoNOyXzRQtabV8iQ@mail.gmail.com>
In-Reply-To: 
 <CAOf3PZyrgCJviBHSBeDMmdcH+possRxwmNRoNOyXzRQtabV8iQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM9PR02MB6609:EE_
x-ms-office365-filtering-correlation-id: 78795078-3c7e-48e4-d0ac-08dd81d4f8e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WHEza3NHeUI2eldQUDZ0Y0NqNTZycHlEVmM5OGl5Z1M3cjczbkxWM1pKbDBE?=
 =?utf-8?B?emp0YnFHczhJNmJyYTNhSUk5QmFJUmVFWUZpS0NuTXEwVXJ2Mm9nMHMvTjQ4?=
 =?utf-8?B?SGRZQjlXQnBqK0xiM0thTVpiV3g1NncxSEw5dEYrK2dxdndZVzdvS25MbFhk?=
 =?utf-8?B?Rmw5MGJjRUw0czZMMVlmRDNkS0FMWk94TE03djBvTWJxd0d5QlJmVCtzKzNa?=
 =?utf-8?B?V3NuemZzVkx0RzZtblRockU1SkU5aUY4UkdZU3RGQkx4MFErTms3Y1Z3aEFX?=
 =?utf-8?B?ckY2c0p4bGZlTE1xeHZxaGZiWGFwYitrQ2NzVmJDUmFTRDF6d2x3eWZObmZr?=
 =?utf-8?B?YjB3MWZiYnZDMU9lZFVVM3k4VWhVZjdjT3FyaC94MkJCa25BMzhhRXFQOXcz?=
 =?utf-8?B?UlhUMDgrL2t5UkZFVjN0YVdPS3Rpb3pZWFZqSjA4clF0SUxhaVNucFRYM3lx?=
 =?utf-8?B?VmI3RGZGMmJxcVlkNXFvWDh2a3ppS0luQ3BUWUNYdEw4MEFiV2dPaXErL05q?=
 =?utf-8?B?T0p3aVJRS1BrOVpIbHJmMSs0alBEYzl0OGpUVXlnQlZMNjBsYlFZQzZyRzNT?=
 =?utf-8?B?TzQyaE00RHAvcEFBTXBQckt4YkZTOVJkNnVkNVZ1VUJITzZOdThvZHRTUFor?=
 =?utf-8?B?M1FDWWxremI1WmowdDVhU3dTYVBla3ZDM1FsLzNNVGIzeUYrOVhDOVlrbU5t?=
 =?utf-8?B?L1JySGtEWGJTVEdzdUpYZHZqZ3Y2cUwwSXNNVTYxa0lGeloveDdwT0RyM2Y5?=
 =?utf-8?B?elgxZHVKaFpsdHlYSVBqc1VIMk1SQmxDRUZBMGtTSmF0N09LdFlGYlpaTFBh?=
 =?utf-8?B?cFZFSEVuNGE0WmFOMktSa2hqdzYvaThlSnhVdGl6OGRJaytFNThvQ255d1lp?=
 =?utf-8?B?eUxZM2E5dzdlS2pXL3Q4UDhQNXVqTkFxTGlLZjY0VGpqVUZRV2JHY0p4dlB0?=
 =?utf-8?B?Q3l3SUNKUDVSRG5NOHo4dFpsODJpUjZjWlhHc3h3anQ1VEgzV1kvMlltOEt4?=
 =?utf-8?B?NEVtSTFaUzNydGRNZkhHSDVhaDhiNm00dmtmWk5QcGFkVW1UejRock0xQUJp?=
 =?utf-8?B?NVpaMmJyMkVyTkUzUTNFajhXQ0ExQkpDWHZaODBSc0VYZWV0SVh5WDRuVTI3?=
 =?utf-8?B?V1F5VFpBTGVaUW1KQW4vY0ZoVzdnRGdLcFAxK3UzNkcvNFg5N0xpYzFyUmdy?=
 =?utf-8?B?VmpLMWc3RnYyNGtZdUhoUlhqakZIUGp6aUVoQ2pJb3JXQ0luZG9ObnIrUnFE?=
 =?utf-8?B?V3h1dmNsL1RiOGc2YWR5SVBWRTFSYVVvVEpXZWVYbjcrTXhlQ2J4V3llZjlN?=
 =?utf-8?B?KzJ4ZTJ1aFY3VWFuei94K1hBS2pHNkZHZTdjalNCVVZKWmxVZHhFRmxLYmxS?=
 =?utf-8?B?SHVsK215TnM0d3NZRzloaERkaXQ1LzhUTi9KOU4yaFVobkxKVlpBeUxQSUFG?=
 =?utf-8?B?MDkwaEZTaUFjTUFDR0VlZ1B6NWdJdnBWb0kwQk0vY3psNWx4T2hMcWJ4WElX?=
 =?utf-8?B?VGlRRGRmSjNnbkJ4UTBlOEpjQW04NlU2OC82L0FLejFuQmhLNFhhS091Z2l4?=
 =?utf-8?B?cm1GVnBucmtKYTZ4RXpjdlhMWk1iZ3B3TnlGRFFnTXp4dlZ1S2xsUGpLRnFG?=
 =?utf-8?B?Q3NKbHNMS0w2aElSMS82OUNnOG1qY2htdWpQT0VXckJhajdqNHFRaXZUUlRq?=
 =?utf-8?B?Y0ZJZU1RbFF1ZG5Ka244UnBCdjFibWIyeU00LzM4TG94Zkd6TzFKZDRVeWtQ?=
 =?utf-8?B?dlV3UzhseXNGTWV6T0k5Z1A1Qnl3dU5pbHRQcnl5TlFRTy8yK0pSdUNPbjNL?=
 =?utf-8?B?TDdPd3pUNzdnM2Y3ZHJHVzd6aUNvY0NOeDJlUUNxK2hQVGJseG9uOWpHS2kr?=
 =?utf-8?B?QzV6blBvay9JYmFOSVpvMEZXOVlEcnB0ZHJ0Q2FyU1cyMzRkaTczMFFIdmtP?=
 =?utf-8?B?QUZWOWxHa1ZYSGUyOUpya1VJa2tIMzd6eGlFcGtzVkdvaDI2OGFicnpCSVc3?=
 =?utf-8?B?dXdPMFRxRWZnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ckp4NnB6TmdHYWNYdGp1dXorazB1bTR2T2txS2FKaWFmVGxDb0xoWEs3LzE0?=
 =?utf-8?B?amF2YTZQSWtraXNhdDJlYU5wa2lyVko3UlJpYmI1N3I4eDN1elhFUGdpaXRI?=
 =?utf-8?B?UXlIM09IeFVTN3dRZkdLc1I0emZneXd4WWxBNHorbE0wOU1xNjg2elZBVDVk?=
 =?utf-8?B?Smk2eGkvUGhEWkt2Tm5NajJ5TUZ6Q0dGcTdmK2RUWUhKMmZjd3RIcmw0K0p2?=
 =?utf-8?B?c3F3VnRFbHpMYjRZNXRWdURmdnhid040NkZsdVBjVXZ1VTk2aHBXVUNOSHN5?=
 =?utf-8?B?R0xtUWluUGUwWWRxOVhPWFpoczV2Y3MzV3lBbVRraGZUd3M5Y3VvL2oyYUFz?=
 =?utf-8?B?b1YzQW84SHk1VnVuWHlzcFZvd25sdkpvZ3NiaWpyRksxcEMxaFJJVWxNbXA2?=
 =?utf-8?B?N3hvYkdGY3pleU9FeU1lbVFpVHN4aVQ4dVd2T3JVTkZXRFN2RlUvb3dnVUdj?=
 =?utf-8?B?WEtKWGtLK3VkZFhWWjk2SjVYNk8xbTJJdVpacXRZeXdRZ1ovRnNweDE2MVlw?=
 =?utf-8?B?YnBOTTdFWU9GS0t6d1p0MmJxTW4yRE5VTWpTdEFnU0xlWWVEQk5NRjNnQm42?=
 =?utf-8?B?VmdYbnJKTGgxK2RrVmwxcGNyaEMvUklta0hSSTl0UzZxMW5ERUc1NGRvbFY1?=
 =?utf-8?B?c1puNzdMYzZCYnJkQ3lsTmdsd0dHaXdDd0dOdWhaWEV3U2tvM2lWTGhQV2Uv?=
 =?utf-8?B?QVdEd0NqenVkWHNFMWVEbmNwT0ozL0ZSbFNnV05aQUdwVUxBamo0bFJUdHBi?=
 =?utf-8?B?N3Zqc3RLdnNWTEVmUVVPTktNeENDNzIzQWdEZ003TU1ORXFEZFhHd1hmQUpj?=
 =?utf-8?B?QzRzb28wUW1TaWZNSnFxNjJGZllqbEREREV5blhIUUxYVjFuRlBwTUYxQlJk?=
 =?utf-8?B?UHVVeGxHQ251NTdNS0l5clpxWkI3RHloa25HRFB4SlgyTGhvNUd1ZUtQc01Y?=
 =?utf-8?B?b3hwMXltQS9vZ2V6RFNndnhvV0tMb3AyWmRiT25RMDB1bkxEakw1K0lZN0Z6?=
 =?utf-8?B?R3NxSFdXcDFOdXhFUXVRQVI4ZTdxUjZ1Z01wdnJhV1krOXE3SmVFdFo1WXE4?=
 =?utf-8?B?ZWpnbllsYlI0ak9qOFpxZEs1Y3BFK25kK1RCTlBiYWlUR3dMV2VkWHNScktY?=
 =?utf-8?B?ZWlETHQwZXMrYjA3MzVoVlFGYURWSDVhdjYrRDl1VHpiSWFnTDU1bEVPWjFs?=
 =?utf-8?B?WDk5bGJFc2ZSN0tBYjIxSFpRWXdKbmVHS2hLd2JEY0JCQ0tHYWNnVmZEUXlL?=
 =?utf-8?B?aDdwZlhYbmFRSmowSVdSWlZ0RVRSL3dGdHNIUU9uTmVwZlc3bkk1Q3c2K01J?=
 =?utf-8?B?QjdXMk5KK2loRngvdlRqV0RBUkZHTUI3YW96czIrWXFLbG5sb3N5b1o0TTZW?=
 =?utf-8?B?MFFpQWp0STFWeFpLZ0M5U3k3dURiUE5ZYmp3a2Y5MWcwVnQzdHVXVStoZ3U0?=
 =?utf-8?B?UHB6ZkREZ3BPVGQ3WDBuejRyMVFBYWlURURSeVNUUGY3eFJyaUIrYjNoQi9a?=
 =?utf-8?B?RjJOREowcFNNY3RsOTlFQVhaRGxhOVQ3UTdHSHJRWGNseldLdTdyME81OGQ0?=
 =?utf-8?B?Vm80OUZQWE9yMTFyeEx2TVBBWUV3dUNRZHNJeEJHRnFheGszVzh3WUErekNl?=
 =?utf-8?B?aTlVVnBHWG9UdWtxeFNYZ0FSRTByUnNhQldiMm1HTmN5MU5ZL0lEMUFJaTkz?=
 =?utf-8?B?VjhFUlRZSXJZUkt4eDdyMnpzR0p1TUN5MFFYZ243L2xKaWNoc0d1Q3gvelN6?=
 =?utf-8?B?aDM2KythT1hWM1BDcW5sK2hLU0k3SGdaTXdLYUxEUWhHUDREK0NRMVRTajgr?=
 =?utf-8?B?NFdrS1Y5QlBQZXBZbzVGMFo3bWMvWjg0MUZpUmxGN3E1THRvN1lvNlJoYi9I?=
 =?utf-8?B?ZWpFMEcwSWdNclBNcXBPRnh1am90d29mVXpCcjFFVGNRQnVyNU4wTVIyYlRx?=
 =?utf-8?B?TlZGQ202WEozb3hQUGRMZHc5MnZYTEtFVGFFdWJtcXJLN0dMT2F2TkVxbzRB?=
 =?utf-8?B?eENmekltMnNDeHRBbzlHUjBrWjFRd3k4cjZqOWlMcExXRkxyRWRabHBtblQ1?=
 =?utf-8?B?dStoanVZUDJXYnRyRmZRV1NrVGh3dUJkZWRFaFZZZmZIWDV1RlZwV0FYamwv?=
 =?utf-8?Q?69LU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78795078-3c7e-48e4-d0ac-08dd81d4f8e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 19:36:26.5018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWAQZDzrxpystljMOfe6XgwVpFSjDo3sKXWC2hYOacMCADUvuQPhyRKJHlBKRjAV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 19:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215245

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgcGF0cnlrIHNlcmVnaWV0IHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFNlbnQ6IGRlbiAyMiBhcHJpbCAyMDI1IDE4OjUwDQo+IFRvOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBsaW51
eC1maXJtd2FyZS1ydGw4NzIzIFJERVBFTkRTIG9uIGVudGlyZSBsaW51eC1maXJtd2FyZQ0KPiAN
Cj4gSGVsbG8sDQo+IA0KPiBUb2RheSBJIG5vdGljZWQgdGhhdCBldmVuIHRob3VnaCBJIG9ubHkg
aW5zdGFsbCBmZXcgc2VsZWN0ZWQNCj4gbGludXgtZmlybXdhcmUteHh4IHBhY2thZ2VzIEkgZW5k
IHVwIGluc3RhbGxpbmcgYWxsIG9mIHRoZW0uIEZpbmFsbHkgSQ0KPiBuYXJyb3dlZCBpdCBkb3du
IHRvIGxpbnV4LWZpcm13YXJlLXJ0bDg3MjMgUkRFUEVORFNpbmcgb24NCj4gbGludXgtZmlybXdh
cmUuDQo+IA0KPiBmcm9tIGJ1aWxkL3RtcC1nbGliYy9wa2dkYXRhL2lvdC1nYXRlLWlteDgvcnVu
dGltZS9saW51eC1maXJtd2FyZS1ydGw4NzIzOg0KPiAuLi4uDQo+IDExOlJERVBFTkRTOmxpbnV4
LWZpcm13YXJlLXJ0bDg3MjM6IGxpbnV4LWZpcm13YXJlIGxpbnV4LWZpcm13YXJlLXJ0bC1saWNl
bnNlDQoNClRoZSBwcm9ibGVtIGhlcmUgaXMgcnRsODcyM2RfY29uZmlnLmJpbiwgd2hpY2ggaXMg
YSBzeW1ib2xpYyBsaW5rIHRvIA0KcnRsODgyMWNfY29uZmlnLmJpbi4gVGhlIGxhdHRlciBpcyBw
YWNrYWdlZCBpbiBMaW51eC1maXJtd2FyZSBhbmQgdGh1cyANCmFuIGF1dG9tYXRpYyBydW50aW1l
IGRlcGVuZGVuY3kgaXMgYWRkZWQgZnJvbSBsaW51eC1maXJtd2FyZS1ydGw4NzIzIHRvIA0KbGlu
dXgtZmlybXdhcmUuDQoNCk15IGd1ZXNzIGlzIHRoYXQgdGhlIGZpbGVzIG1hdGNoaW5nIA0KJHtu
b25hcmNoX2Jhc2VfbGliZGlyfS9maXJtd2FyZS9ydGxfYnQvcnRsODgyMSogc2hvdWxkIGJlIGlu
Y2x1ZGVkIGluIA0KdGhlICR7UE59LXJ0bDg4MjEgcGFja2FnZSBpbnN0ZWFkLg0KDQo+IA0KPiBB
bm90aGVyIHBhY2thZ2UgdGhhdCBoYXMgdGhlIHNhbWUgcHJvYmxlbSBpcyBsaW51eC1maXJtd2Fy
ZS1hZHNwLXNzdC4NCj4gSSd2ZSBsb29rZWQgYXQgYWxsIHRoZSBjb2RlLCBiYmFwcGVuZHMsIGRp
ZmZlcmVudCBjb25mcyBhbmQgY291bGQgbm90DQo+IGZpbmQgaG93IGxpbnV4LWZpcm13YXJlIGVu
ZHMgdXAgYXMgUkRFUEVORFMgb2YgdGhpcyBwYWNrYWdlLiBUaGUgb25seQ0KPiBjb21taXQgcmVs
YXRlZCB0byB0aGlzIHBhY2thZ2UgSSBmb3VuZCBldmVuIHJlbW90ZWx5IGxpa2VseSB3YXMgdGhp
cw0KPiBpbiBvZS1jb3JlIGRlYWFmNDNiOGY2YzkwNWYwNGYzZDBjNTY2OTNjMDI3Y2VhYzNlM2EN
Cj4gd2hpY2ggYWRkcyAyIGxpbmVzIHRvIHRoZSBGSUxFUw0KPiBGSUxFUzoke1BOfS1ydGw4NzIz
ID0gIiBcDQo+ICAgICR7bm9uYXJjaF9iYXNlX2xpYmRpcn0vZmlybXdhcmUvcnRsd2lmaS9ydGw4
NzIzKi5iaW4qIFwNCj4gICAgJHtub25hcmNoX2Jhc2VfbGliZGlyfS9maXJtd2FyZS9ydHc4OC9y
dHc4NzIzKi5iaW4qIFwNCj4gICAgJHtub25hcmNoX2Jhc2VfbGliZGlyfS9maXJtd2FyZS9ydGxf
YnQvcnRsODcyMyouYmluKiBcDQo+IA0KPiBhbmQgd2hhdCBkbyB5b3Uga25vdywgcmVtb3Zpbmcg
dGhlIGxhc3QgbGluZSAiDQo+ICR7bm9uYXJjaF9iYXNlX2xpYmRpcn0vZmlybXdhcmUvcnRsX2J0
L3J0bDg3MjMqLmJpbioiIG1ha2VzIHRoaXMNCj4gcHJvYmxlbSBkaXNhcHBlYXIuIEkgY2FuJ3Qg
ZmlndXJlIG91dCB3aHkuIFNlZWluZyB0aGlzIEkgdG9vayBhIGxvb2sNCj4gYXQgbGludXgtZmly
bXdhcmUtYWRzcC1zc3QuIEl0IG9ubHkgaGFzIG9uZSBGSUxFUyBsaW5lDQo+IEZJTEVTOiR7UE59
LWFkc3Atc3N0ICAgICAgICAgICAgICA9DQo+ICIke25vbmFyY2hfYmFzZV9saWJkaXJ9L2Zpcm13
YXJlL2ludGVsL2RzcF9mdyoiDQo+IA0KPiBqdXN0IGZvciB0aGUgdGVzdCBJIHJlbW92ZWQgdGhl
IGFzdGVyaXNrIGFuZCBpdCBhbHNvIGZpeGVkIHRoZSBpc3N1ZS4NCj4gTm90IHN1cmUgaWYgY2hh
bmdpbmcgdGhlIEZJTEVTIHZhcmlhYmxlIGhlcmUgbWFrZXMgYW55IHJlYWwgZGlmZmVyZW5jZQ0K
PiBvciBpZiBpdCBqdXN0IGZsdXNoZXMgc29tZSBiYWQgY2FjaGUuLi4gbm8gaWRlYSwgaSB0cmll
ZA0KPiBkb19jbGVhbmFsbC9zc3RhdGUgYW5kIGFsbCB0aGUgdXN1YWwgc3R1ZmYgYnV0IHRoaXMg
aXMgdGhlIG9ubHkgd2F5IEkNCj4gbWFuYWdlZCB0byBjcmVhdGUgdGhlc2UgdHdvIHBhY2thZ2Vz
IHdpdGhvdXQgdGhlbSBoYXZpbmcgUkRFUEVORFMgc2V0DQo+IHRvIGxpbnV4LWZpcm13YXJlLg0K
DQpUaGUgcHJvYmxlbSBoZXJlIGlzIHNpbWlsYXIuIFRoZXJlIGFyZSBhIG51bWJlciBvZiBzeW1i
b2xpYyBsaW5rcyANCmluY2x1ZGVkIGluIHRoZSBsaW51eC1maXJtd2FyZS1hZHNwLXNzdCBwYWNr
YWdlIHRoYXQgbGluayB0byBmaWxlcyBpbiANCnRoZSBsaW51eC1maXJtd2FyZSBwYWNrYWdlLg0K
DQpNb3ZpbmcgdGhlIGZpbGVzIG1hdGNoaW5nIA0KJHtub25hcmNoX2Jhc2VfbGliZGlyfS9maXJt
d2FyZS9pbnRlbC9hdnMvKi9kc3BfYmFzZWZ3LmJpbiB0byANCiR7UE59LWFkc3Atc3N0IHNob3Vs
ZCBzb2x2ZSBpdC4NCg0KPiANCj4gUG96ZHJhd2lhbSAvIEJlc3QgUmVnYXJkcw0KPiBQYXRyeWsg
U2VyZWdpZXQNCg0KLy9QZXRlcg0KDQo=

