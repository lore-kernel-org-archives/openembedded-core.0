Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A667CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:54:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1000.1790657648908195241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=fnrwDIDu;
 spf=pass (domain: ericsson.com, ip: 52.101.65.44, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTVGf0Ij9JlYXZd/yrAUWFNvpVec28zN82X3+u8eUmedKp4J2CG2iSxIfSc+XLxueQq9Bz2nBmBy7iFTCczEavzrU48PudYx3HoSPPDckTLqpW+8D4hF621+AoPt4VZdS22JvddNnqlXmWczQ6NSie7HZGi+xGVwRacH69tXXysbUTaFCBADYSYfdCqfqy4wMYhRBUeghhmoqEJZkaZyZoq4Lgt86okPIOLsNOBmfPtrxSt+iQ5qdUHZLn4h8rfJeKNRtNhEMDYOjWlQjr50qSYsRKUyITx2ZdJyI/fslu0pKTsz8IES2m8BII3YizolOUvHFUxPV9lI60m/lqeZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c5tn/n2sFIaMBbMLKBxa1RaYFguo6U2LKOAqUd4Sn4=;
 b=CcQPb62oqWeWms8HHiMtERM+d3OB397gmOoNqN1X8XYKw4T5lFdJgweOqszPVREqZvIizwfwrn9W1I6k8OeM+MejkDbrCDJ3e+8pMLIQHxGcOq7HPQDrNpll+kar+HkU+W6O8rjtQwWyM/O7B8EEBHy7Wr2pJbq/1hBJ4G+xCPz/tZByuFME05xnywtqD83leZ5/eIP+BzZUlw64UpqJRrJydRdt93LwybOm9E6PplW7safcbhk2tfHb+uGTRiHIdqwvxNaAUateE0VWaGSwKeImeGFvbr//d4QmIO+vrjr7q0Znm+FuFQiQwkoEp5JKlJJ4ccoow3bB4VkP1UL+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c5tn/n2sFIaMBbMLKBxa1RaYFguo6U2LKOAqUd4Sn4=;
 b=fnrwDIDuZp9XUKhEcuKkz6ooRN/A80NN9y8Zx+wCFHN9rfxUQ98Wff5zZs9D3NPiKyA002in7nSdT8Piipg8DzAILL7MZMElUBWGVYws12gvFMHdqiCr501nheoHnWqaySbwXO4Lci9D9LVBIYqoKBX7yhS6YL2PBtOQrhDBgemlind+eu++/j4anLXl/Ata/ALY0sLnwA4pG2I8n6AIAEFVsVaUqrWphyKeFPsQJQdonuTcNU28yMxM0GWpYHotaHGqylLlAzRIgwxxqTbcpawTzkBWqYr22/00v9lbxeaLI+CXxdOkOYpLdkMQ7Oiv/XqE09t7V3zDIOJzO7qXjA==
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com (2603:10a6:20b:140::11)
 by AM7PR07MB6833.eurprd07.prod.outlook.com (2603:10a6:20b:1b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Tue, 29 Sep
 2026 04:54:04 +0000
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0]) by AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 04:54:04 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 2/3] create-spdx-3.0: record component
 release date in SPDX output
Thread-Topic: [OE-core] [PATCH v3 2/3] create-spdx-3.0: record component
 release date in SPDX output
Thread-Index: AQHdT3wqrJiGQBrXOEGsjyXY0u2x8rbkeZ0AgACEg4A=
Date: Tue, 29 Sep 2026 04:54:04 +0000
Message-ID: <05bdd7bc8930813b541051b8943da80b7e6cf472.camel@ericsson.com>
References: <20260928190400.3908822-1-daniel.turull@ericsson.com>
	 <20260928190400.3908822-3-daniel.turull@ericsson.com>
	 <6720cb7aa4c91cc51bc72b47e48ed78b6a6d421b.camel@linuxfoundation.org>
In-Reply-To: 
 <6720cb7aa4c91cc51bc72b47e48ed78b6a6d421b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR07MB6437:EE_|AM7PR07MB6833:EE_
x-ms-office365-filtering-correlation-id: 721bdac5-cc04-4300-9a11-08df1de5afac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|10070799003|1800799024|38070700021|10067099003|18002099003|11063799006|4143699003|22082099003|56012099006;
x-microsoft-antispam-message-info: 
 3nZlQxBJIipU5ET+PrZNFdxCo/Fgj/QLiJGCLA3GFT8yqlLZnNvuMn9az3g+bnhzi4uWhBiPUyx0lvybk68PY0AwUS3bwlrLy0mWIfKWbkOr3hbPCLWd5LFXz0W6GzNmgcxMJ45x7zbMgEVsGrSS4j1FQPJHZ3okX1iTD88RdVxI5cvD0sdlzdcKUhxffSlKcVioU2f1aZNfFfIJDFsndsmNr/UnbUI2BjTk9uo240VG7pS/GsY/XCJnPK2FDTABSfHoWeynRYTuFWLYg4sDaFdQuwO6E+Py5Vvpc+URZxyve6m8QTmDEBdeiw4ozRkXWaCohnHq632Bmf/GhFzem2ZjZJZPyAeKLcalxjnCeMxo0ccParzZKt3oHLJDd94OIJmOEviEzoGU5sF/1PjZAT9GPCYCrLEjQjzE2L/qcUG5VdXgUq2wCeCmxNFTk+j43wE0d9aHA6S262RsATEu6eJ8+kNIx2fenLvaWy3awY+Etsg4CbWfxg6czN3a68srpJykPKu40VTqvm0tSopzpHdKFtjub0D+aT7H9yDbcSai1WPpFQuqTz0NISAQBjXxaIvpBFsdpSOQGXwVZawiOkJNuChVf9s+1ljVn6sdUfIk+rRnFRiMcqWOtDgmj5E/v5KTnquXmhSzZsBrNEzeG46Y7CXfq9IPCpmeHL7GsSDLMEBojH2gJKFUZtV7TuTOBIcp3I0KkJGuplN3RLBZ1iOuOG4cAouP4rEJiNn7hQM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6437.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(10070799003)(1800799024)(38070700021)(10067099003)(18002099003)(11063799006)(4143699003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TFhCd2JtUTEyZDR5bUFSWXRMaGZRWGxMdHozQ1dtZk5lRUJXemprbUQwNVFz?=
 =?utf-8?B?Mng4Tm02RWZEMlJINzZsemlxUHk0Qko0U2tqWnMrQTVMMDBHV245c0JNVEw4?=
 =?utf-8?B?NHo3UXRQb3R3VkVEd2VFTlZlcUE1YWw0dTR6QmhLNmpTa0lLY0RLbUp5NXFs?=
 =?utf-8?B?alBIRFFkVlRyMHlBdGRLRVVYVmVYT1U4NkpScUhFT2Z0ZVc4VG9BMGI0cmlu?=
 =?utf-8?B?bE1SazJod1pkWGtVWGVKb21yT0ZKbjdXTTZRQ2JuVW1ZMHhXYWUzTWkvNVpT?=
 =?utf-8?B?NzRrMGZiUlduZlptZmtKR0l6amgwTDJ2bEg1TUNzM2o2bHF5MWo0RldaUHVX?=
 =?utf-8?B?bXlmc3FBZWhiNU5XeWs4RjViVUU4ejZLWFdFSm9BNHFiTDJSRlVRNEdIRllt?=
 =?utf-8?B?c2ZsQjR2eUl3K3BDYmtOMm83QVhGSTRZRnZGdi91Z1RVc1BuenBjckxGdlRZ?=
 =?utf-8?B?aTh0UEhNZmZkNjFxcUZ1a3c0L3FkM3UvelpsRHowTGJwa255VU1oL0NSaGJV?=
 =?utf-8?B?MUNaV2VJaVRjM3VjZkhaNVpKN0k4TEF4cmp3TERIYlZHcnJPNUhFSjlCTFJF?=
 =?utf-8?B?dXhlRklFdFBmN3JVMHFuUDVTUm95OWkxM09RaUYzMkxBay9IeWtqbVhpZlVM?=
 =?utf-8?B?aDBBcDBzaE5JT2hMSFREdGwxNnFjNjhsZ2xBdERXeEhvRUFLR2pKcmQxQlpE?=
 =?utf-8?B?azBtOEdJZmVrZFJ3VjV2Y0YycDZzZVZ4cTgwbHZYa0NIMXorSS8wcnFuSVlZ?=
 =?utf-8?B?OXRMVGFOTUxwV2RZT2tlajVCMHhpWkNNOU1NNmo5RDJHZlZITzViYnhTS1dp?=
 =?utf-8?B?cVhGVlpJRllBVGRNVG9TcjZRdWsrQ1orUnpNcHVEcHdjTVJNY3BWeUNRNnJJ?=
 =?utf-8?B?NE8zb2RXcE9qTE1TMEN5M3Z2YW5YY2U0NUNVbXpRTUZkalp1a0NMUE82VDZG?=
 =?utf-8?B?L2NlaWNTNkt4RmtIZHhwbGxkaVdvZFdhVWx6K2NESDZuRzI1bmRTdTBlMDln?=
 =?utf-8?B?eUFTZ3lxWVpuOTFGbVJ4VFdkcnREUWN4WDdBVmx3a2ErcWxDZy9qYUhrNnBy?=
 =?utf-8?B?bExDRWRPMmYyc1FCRVpuWStYekt2bmRYODA4TmMyMkp2TnVnNmgrS24rMVpL?=
 =?utf-8?B?dkJINm4xUE9vdngyU05CbzhEc2RhWnRRdEdCOW1Ia2srRy9GSjcyWG1EOWMw?=
 =?utf-8?B?enJSK2l6bFpkYmk2enJwQ1dOTER6RGszUWxUTmFxaWNiLzBoZW91RzZLWGVI?=
 =?utf-8?B?M3o1SmEvczBJTVlUMmhiM1UyVm9YWHBKbHlMVHVGNnpFc2hEa2VHWC9uaHpE?=
 =?utf-8?B?N1d0dGl1cnA1cjl2WkpDNlhWVzdjTWd3Z1BhSHAvZk05bk5kZTBJcnBCWmp0?=
 =?utf-8?B?Vzl3RnNkVExlMm9NS3dLNlZmSFFJVVQwMlFtbm1oM3A2c0pxczh2UENzdGs4?=
 =?utf-8?B?U2V6MlBFM296WHdGZlVOU1Q3RnhqbGUyeXp0ZklQemVKR29Pc1prejB1MVF6?=
 =?utf-8?B?bGloa1dMYjdTbW1ZUDZJTlNPWWRkZzlyd0lFV1hBMmlxdXRUejF3dWZWM2ZT?=
 =?utf-8?B?aGdtTGtSUCtnUm1XNjBJZ0RSMy9HTng1RlJNUEFJRXp4OWJRZXZrVnMreW9t?=
 =?utf-8?B?blNqNncxTURhTGRib0VaQ0V4V1Jwc3FJQWg3MkdzQ2FKRVN2d2hVZk1YK0Yv?=
 =?utf-8?B?QjZiMFNmUWo4Z1IrRTNQeEpzSTllZzNlVnB6MFF1V2RjZmtjekpHbjRkRkdq?=
 =?utf-8?B?TUJDSzg1RTFscWk4b1hkN1ZFekpzNG5YZWUzL21KZWtyZFpVL1o4d1J3WXUr?=
 =?utf-8?B?cSs1N3Z3dFlTMXhsaWk0ZlVrRGdkaE1RYUFhRFpzb1BlYUJiRHF5ZzJxVFh0?=
 =?utf-8?B?Z1BmcTFTV0ptYzBJVFVjMG13MFJ3VTRXY0l3T0RVTjM5aVo5aHZ3bTdHbDAw?=
 =?utf-8?B?VjNjSHlMcW9wZnJmQkhYVmhjQTJrU2VoR0JHQys3dEdBZ25ReS82QWZXaTV4?=
 =?utf-8?B?SDBpcTNTZ1J5RzdBcHNHN3Zjamo1NS96ZXM3MHIzRnRXc0NmazQ5TFNvYjBa?=
 =?utf-8?B?a2tVTURlNXIxMk5NcHJwdm90aVphaEEwa1BITzJ1azlaVkZjQlI1K3ZTUkVC?=
 =?utf-8?B?Yjk0eEd0UWFyUUkzelhiMnlHdXZNVVZKc1B1NHphMmlYcFF3SkpRY1dkNFpJ?=
 =?utf-8?B?aThmdzRuR0NWMDFQLysydFNody96d3RndjQyK1B3RlpGQVlIUVFjeDFLTG1J?=
 =?utf-8?B?blZLODdwQzlYZjJoRWVyYVNlTkxTWitmb3VKZzNLYmlnWjZwYlBMZlkxOXl5?=
 =?utf-8?B?ODVIRUxEWFFoUkZxM2lxWDA3QmlSVzRDK0VDTzdEWEt0Q3g0aEJMbjhBdnJZ?=
 =?utf-8?Q?phEzXWaNenmILiB9ttk+Bl0GVL7ayxTmiGv/WUh4Gt9aI?=
x-ms-exchange-antispam-messagedata-1: hp3eE4TCNwB0779LZBfQU0A51Wc81mRcq78=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30905081B654E5489A612914FC3CFE7D@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6437.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721bdac5-cc04-4300-9a11-08df1de5afac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 04:54:04.1394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTeQ+zBYd3Oy0ZN4bBTkURRbM0Lx0qugWfLYdcpjLg0EAo+Tdn2Exj0p62LmJqxtmn27y1ls3mwH/TMieFPjnCi+Ql2n+lnHpdyu66VsgO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246818

T24gTW9uLCAyMDI2LTA5LTI4IGF0IDIxOjU5ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gTW9uLCAyMDI2LTA5LTI4IGF0IDIxOjAzICswMjAwLCBEYW5pZWwgVHVydWxsIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IERhbmllbCBUdXJ1bGwgPGRh
bmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiA+IA0KPiA+IFJlY29yZCBlYWNoIHJlY2lwZSdz
IHJlbGVhc2UgZGF0ZSBpbiB0aGUgcmVsZWFzZVRpbWUgcHJvcGVydHkgb2YgaXRzDQo+ID4gc29m
dHdhcmVfUGFja2FnZSBvYmplY3QsIHVzaW5nIHRoZSBTT1VSQ0VfREFURV9FUE9DSCBhbHJlYWR5
IGNvbXB1dGVkDQo+ID4gZm9yIHJlcHJvZHVjaWJsZSBidWlsZHMuDQo+ID4gDQo+ID4gQWNjdXJh
Y3kgZGVwZW5kcyBvbiBob3cgU09VUkNFX0RBVEVfRVBPQ0ggd2FzIGRlcml2ZWQ6IGV4YWN0IGZv
cg0KPiA+IGdpdC10YWdnZWQgcmVjaXBlcywgYmVzdC1lZmZvcnQgZm9yIHRhcmJhbGwvaHR0cChz
KSBzb3VyY2VzLiBTb21lDQo+ID4gUHl0aG9uIHNkaXN0cyAoZS5nLiBjcnlwdG9ncmFwaHksIGh5
cG90aGVzaXMsIG1hdHVyaW4pIG5vcm1hbGl6ZSBhbGwNCj4gPiBmaWxlIG10aW1lcyB0byBhIGZp
eGVkIHBsYWNlaG9sZGVyLCBzbyB0aGVpciByZWxlYXNlVGltZSByZWZsZWN0cw0KPiA+IHBhY2th
Z2luZy10b29sIGJlaGF2aW9yLCBub3QgdGhlIHJlYWwgcmVsZWFzZSBkYXRlLg0KPiA+IA0KPiA+
IFRlc3RlZCB3aXRoIG9lLXNlbGZ0ZXN0IC1yIHNwZHgsIGFuZCB3aXRoIGBiaXRiYWtlIHdvcmxk
DQo+ID4gLS1ydW5hbGw9ZG9fY3JlYXRlX3NwZHhgOiAxMDExLzExNTAgcmVjaXBlcyBnb3QgYSBy
ZWxlYXNlVGltZSAocmFuZ2UNCj4gPiAxOTk4LTEyLTMwIHRvIDIwMjYtMDktMTcpLCAxMzkgY29y
cmVjdGx5IGhhZCBub25lLg0KPiA+IA0KPiA+IEFJLUdlbmVyYXRlZDogVXNlcyBLaXJvIHdpdGgg
Q2xhdWRlIFNvbm5ldCA1DQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVs
LnR1cnVsbEBlcmljc3Nvbi5jb20+DQo+ID4gLS0tDQo+ID4gdjI6DQo+ID4gLSBEcm9wcGVkIGFs
bCBvcHRpb25zIHBlciBKb3NodWEncyBmZWVkYmFjazsgcmVhZCBTREVfRklMRSBkaXJlY3RseS4N
Cj4gPiAtIERyb3BwZWQgdGhlIHJlZHVuZGFudCBlbHNlOiBkZWxhdHRyKHJlY2lwZSwgInJlbGVh
c2VUaW1lIikgYnJhbmNoLg0KPiA+IC0gU2VsZnRlc3QgY29tcGFyZXMgYWdhaW5zdCBTREVfRklM
RSBjb250ZW50IGRpcmVjdGx5IGluc3RlYWQgb2YNCj4gPiDCoCBTT1VSQ0VfREFURV9FUE9DSCwg
d2hpY2ggY2FuIGRpdmVyZ2UgZnJvbSBpdC4NCj4gPiAtIEZpeGVkIGEgbGVhazogcmVjaXBlcyB3
aXRoIG5vIGdpdCBjaGVja291dCBhbmQgbm8gZmV0Y2hlZCBzb3VyY2UNCj4gPiDCoCBoYWQgU0RF
X0ZJTEUgaG9sZGluZyBvbmx5IFNPVVJDRV9EQVRFX0VQT0NIX0ZBTExCQUNLLCBzaG93aW5nIGEN
Cj4gPiDCoCBib2d1cyAyMDExLTA0LTA1VDIzOjAwOjAwWiByZWxlYXNlVGltZSBpbnN0ZWFkIG9m
IG5vbmUuDQo+ID4gdjM6DQo+ID4gLSBBbHNvIHJ1biBhZnRlciBkb191bnBhY2s6IGRvX2RlcGxv
eV9zb3VyY2VfZGF0ZV9lcG9jaCdzIHNldHNjZW5lDQo+ID4gwqAgc2hvcnRjdXQgY2FuIHNraXAg
aXQsIGxlYXZpbmcgU09VUkNFX0RBVEVfRVBPQ0ggdW5zZXQuDQo+ID4gLSBnZXRfcmVsZWFzZV9k
YXRlKCkgcmVhZHMgU09VUkNFX0RBVEVfRVBPQ0ggYWdhaW4gaW5zdGVhZCBvZg0KPiA+IMKgIFNE
RV9GSUxFLCBub3cgdGhhdCB0aGV5J3JlIGd1YXJhbnRlZWQgZXF1aXZhbGVudC4NCj4gPiAtIHRl
c3RfcmVsZWFzZV9kYXRlX3NvdXJjZV9kYXRlX2Vwb2NoOiBzd2l0Y2hlZCB0byB0YXIgKGJhc2Ut
ZmlsZXMNCj4gPiDCoCBoYXMgUyA9PSBVTlBBQ0tESVIgYW5kIG5ldmVyIGdldHMgYSByZWFsIFNP
VVJDRV9EQVRFX0VQT0NIKS4NCj4gPiAtIEFkZGVkIHRlc3RfcmVsZWFzZV9kYXRlX29taXR0ZWRf
Zm9yX2ZhbGxiYWNrX3ZhbHVlLg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9jbGFzc2VzL2NyZWF0ZS1z
cGR4LTMuMC5iYmNsYXNzIHzCoCAyICstDQo+ID4gwqBtZXRhL2xpYi9vZS9zcGR4MzBfdGFza3Mu
cHnCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOSArKysrKysrKysrKysrKw0KPiA+IMKgbWV0YS9saWIv
b2VxYS9zZWxmdGVzdC9jYXNlcy9zcGR4LnB5IHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0zLjAu
YmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0zLjAuYmJjbGFzcw0KPiA+IGluZGV4
IDU2ZmQwMWZkNTMuLjJiMTQ2NWI1YTYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2Ny
ZWF0ZS1zcGR4LTMuMC5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzL2NyZWF0ZS1zcGR4
LTMuMC5iYmNsYXNzDQo+ID4gQEAgLTE5Miw3ICsxOTIsNyBAQCBweXRob24gZG9fY3JlYXRlX3Jl
Y2lwZV9zcGR4KCkgew0KPiA+IMKgwqDCoMKgIGltcG9ydCBvZS5zcGR4MzBfdGFza3MNCj4gPiDC
oMKgwqDCoCBvZS5zcGR4MzBfdGFza3MuY3JlYXRlX3JlY2lwZV9zcGR4KGQpDQo+ID4gwqB9DQo+
ID4gLWFkZHRhc2sgZG9fY3JlYXRlX3JlY2lwZV9zcGR4DQo+ID4gK2FkZHRhc2sgZG9fY3JlYXRl
X3JlY2lwZV9zcGR4IGFmdGVyIGRvX3VucGFjayBkb19kZXBsb3lfc291cmNlX2RhdGVfZXBvY2gN
Cj4gPiDCoA0KPiA+IMKgU1NUQVRFVEFTS1MgKz0gImRvX2NyZWF0ZV9yZWNpcGVfc3BkeCINCj4g
PiDCoGRvX2NyZWF0ZV9yZWNpcGVfc3BkeFtzc3RhdGUtaW5wdXRkaXJzXSA9ICIke1NQRFhSRUNJ
UEVERVBMT1l9Ig0KPiANCj4gSSdtIG5vdCByZWFsbHkgdmVyeSBoYXBweSBhYm91dCB0aGlzIHBh
cnQgb2YgdGhlIGNoYW5nZS4gVGhlICJyZWNpcGUiDQo+IFNQRFggZGF0YSB3YXMgbWVhbnQgdG8g
YmUgdGhlIGRhdGEgd2hpY2ggY2FuIGJlIG9idGFpbmVkIGZyb20gdGhlDQo+IHJlY2lwZSB3aXRo
b3V0IGZldGNoaW5nIHRoZSBzb3VyY2VzLiBUaGlzIGNoYW5nZXMgdGhhdCBhbmQgYWRkcyBhDQo+
IGZldGNoL3VucGFjayByZXF1aXJlbWVudC4gQXQgdGhpcyBwb2ludCBpdCBtYXkgYXMgd2VsbCBi
ZSBtZXJnZWQgd2l0aA0KPiBvdGhlciBTUERYIGRhdGEgdGhhdCBiZWluZyBnZW5lcmF0ZWQgImxh
dGVyIiBpbiB0aGUgYnVpbGQgYXMgdGhlDQo+ICJyZWNpcGUiIG9ubHkgZGF0YSBpcyBsb3Npbmcg
aXQncyBtZWFuaW5nPw0KPiANCm9rLCBJIHdhcyBhIGJpdCBoZXNpdGFudCBvbiB0aGlzIGNoYW5n
ZSBhcyB3ZWxsLiBJJ2xsIGNoZWNrIGhvdyBjYW4gaXQgYmUgYWRkZWQNCmxhdGVyIGluIHRoZSBw
cm9jZXNzIHdpdGhvdXQgdG91Y2hpbmcgdGhlIHRhc2sgZGVwZW5kZW5jaWVzIGFuZCBvcmRlci4N
Cg0KQ2hlZXJzLA0KRGFuaWVsDQoNCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQo=

