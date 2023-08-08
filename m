Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516DFC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 10:15:49 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by mx.groups.io with SMTP id smtpd.web10.58271.1691489741428384793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 03:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=X74TgXjy;
 dkim=pass header.i=@mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=m+xwiVfT;
 spf=pass (domain: mediatek.com, ip: 210.61.82.184, mailfrom: yang.xu@mediatek.com)
X-UUID: 831ef58235d411eeb20a276fd37b9834-20230808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=iWgtqw0C27P1ppx9FgoKACB29L85jez4rzGJUgQ3vJo=;
	b=X74TgXjyyy0Be1KFyEOusUkSroU/FUaJstlXu1lJRz7uBQMeIX7O1bTXXgv8sBpTAuyAltiWcX82Ed9uLL61QDQ2qIYjSO7wgGdI0sOYC8HnvAzv5M6sLzFv7/fjqV7guebREYWaooEFqGFu0PoVL30i1JtoL+kW30ek2B5Qk98=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:3d6c5527-3401-4b38-b830-606d69dfab84,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:a1f9f142-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 831ef58235d411eeb20a276fd37b9834-20230808
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1900141076; Tue, 08 Aug 2023 18:15:34 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Aug 2023 18:15:33 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Aug 2023 18:15:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ca70eeqtrgxYQJ50qcgF161SL1ecmbeoXuuzALjU8odlpg1COia8gKqQjW7g/KeYqyLxvM79+u6wZQk2U1l4kDokpjDO8dRUIHHXKTzypY/hra5IJovT5/IdOYdzBdv+eFnab8P1pjDTYrm00SV/oPs8qHHSrGPFWtIn7l9Sys4rGsxBkkO/94tfuh3Kr6ymQraGTN2E6C6KvG+eILPIsCwSMTBiMvwRfrmMkFR7g4yq6xYt5mFBjY0ovbDtN0o7L981cFa5gwWdchaXbrgHOioa8DnhK2RW4X4+Da7E07hTm0iE0sDXyhp6vn4bQCvg69e1SwT/b0XPdA5X6sKw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWgtqw0C27P1ppx9FgoKACB29L85jez4rzGJUgQ3vJo=;
 b=RUPFT6/x03P+O16S1n6/rrH7zE73AEB15zFNTyfjZyupm3UNfE7n/PMr/LCXVQ/ZJKHyYD6lxo82fJYhEM5mDzFF9mhs4OmyWNyMra8BePpoNflg+YXiGxGpoTo2S0enGxpW4M0yJQJsoZNRcpdz6xzjRGabtpi4f1yRUfx9Vud06/PgsTCYObN3LtG23iN4bx2xLEAYc4rKuxUAb94ehVpu7TvoLBbeP2HR4kVmwQ+3UcJ7JO+2Xy6wEolevpwoHsR5/PV9wuI7eWgmQheOXuYaXK36jbCic2vqW+bnApbwEgkyxK5yjNe6X2dNWnJXQpsaHW424VomwLrmuxO0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWgtqw0C27P1ppx9FgoKACB29L85jez4rzGJUgQ3vJo=;
 b=m+xwiVfTqTSXFr6FUvTt1Me8mOw0bEnZuMJPjA/6jbS3wn9Sqn+/e6hl8ygMAv88DvmtZvYDCWk8z+tmQsfaLkMuStKRAORTzWG6csBUMCqNzp1L29NlvTxjiq1lfk9fLli1G9/EvjxE/h7CsUIJCR4gNyBM5/DLMtCBhKqBD1o=
Received: from TYZPR03MB6717.apcprd03.prod.outlook.com (2603:1096:400:1f2::7)
 by TYSPR03MB7388.apcprd03.prod.outlook.com (2603:1096:400:416::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:15:30 +0000
Received: from TYZPR03MB6717.apcprd03.prod.outlook.com
 ([fe80::cc39:6dbc:afa3:de25]) by TYZPR03MB6717.apcprd03.prod.outlook.com
 ([fe80::cc39:6dbc:afa3:de25%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:15:30 +0000
From: =?utf-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Ross.Burton@arm.com" <Ross.Burton@arm.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v4] sstatesig: Fix pn and taskname derivation in
 find_siginfo
Thread-Topic: [OE-core] [PATCH v4] sstatesig: Fix pn and taskname derivation
 in find_siginfo
Thread-Index: AQHZtTAnUDM+s4kBtkm5lINhnsZf0q/bpxL+gASxEIA=
Date: Tue, 8 Aug 2023 10:15:30 +0000
Message-ID: <5b4a1b35758598da483ae1d711150f892c89e612.camel@mediatek.com>
References: <20230713021659.23130-1-yang.xu@mediatek.com>
	 <17783A2A112CFD7F.19347@lists.openembedded.org>
	 <89e8391834fb349cff2b603545aee7a2742561ba.camel@linuxfoundation.org>
In-Reply-To: <89e8391834fb349cff2b603545aee7a2742561ba.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6717:EE_|TYSPR03MB7388:EE_
x-ms-office365-filtering-correlation-id: 15ede03b-68d4-496e-6c85-08db97f8650b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dqM3Ep5Tt/FombjCpGa8BFBiWmCa7JED3YDsD5B8TeGMjO1OBuxTBS8LgyseT1oTgKH7cEDdYumNfg3BcKCH4gHouyjXVelV9ZUTlRCVX5FUnoup80iNzL13Cohpa9syw2GKWi3Lloq8DKVPnjJ/ljDq+nSJMyMJtlltu4FNiSCf5ei0MYB5r3XohYecs8+oapkwo6KeXcrz0P2ijat3ksWv6OBpLOGwV8+z862x+twKcuQX2GaXDkPTadlT30eETvsxsGMFqWMCcTsaXP/rZOJOaHT+Ko8a8h+IP9JTpnUHJ63WYOx8/MLEwHVeDoiE6oRFPEZqKpVgnjgcBWVESX7rGfWgzUus04m+BHR4l9Fq0hpgo081shfUPxT9/ejgSIldqLrwhy3DOKViDiTtXFt3mJM5ZiL6cGqTjfktsLIEyXsWI6c/P4EMkrCSAeUpSXeINObYWaIv23Ax0xqlNkgSEQhYJvG8aOQLiedHDy0pJOlINvyvq94p+dMKH7UJPe3pLcJolwfC9G4b3hQVAzNEvJg8S7O3g3Md7zbJpFHwQUL+dzZRO7TZN4Yk+EJRfzFU9dts2/LfWBZyRG0f0VPt8DvWWOcFBpbAscZBuTGz+gZ0VOcULM3M08mDmCUuWglz6M19u5+sUIEQqxKcD8FMlVYqMCPaxxgiIfWusII=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6717.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(1800799003)(186006)(71200400001)(6512007)(6486002)(478600001)(110136005)(54906003)(316002)(4326008)(38070700005)(64756008)(86362001)(41300700001)(66476007)(66446008)(38100700002)(122000001)(66946007)(76116006)(66556008)(91956017)(83380400001)(2616005)(26005)(6506007)(85182001)(36756003)(2906002)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEZ6S1VGMWlBb3B4QTVlVFJzOXQ3SkQ4aTY0ZldJZGxZak5TdENUMWIrZzZm?=
 =?utf-8?B?cG02RE9tTDhMam1idVQvdUtmWmZMN3hURUg5QWF6S0RYYnZYc1lTNlA3QnBS?=
 =?utf-8?B?aWpBaFkrbEpKbFFSZ0liaG9oM3YwU2VLb1VtZFV5VCt0akdFRjBrVURQMHNJ?=
 =?utf-8?B?Z2puTXpyY004TWM1ekluYnZlWkorVUExT2RqaFU0NHV4T2phWTBKdGhycDZt?=
 =?utf-8?B?cXpCRk44QmFQRUdIcHh3WGt4YkFXNWIvUm5uQUhIVHB2UDdONUdUZ0twd0hy?=
 =?utf-8?B?UDhwajB3cXJUZjR6WW5BMU9MOTVuTlNsT0RpeTVMcVJEc3h3dm5kaEc1QVdk?=
 =?utf-8?B?Q3VKYzRVeU5HNlZadjBKaFF0N2JaVXByN0NrMGg2L1FrVG51Q28zUWVNVjJO?=
 =?utf-8?B?TUhpUkxiY09WOWtjWmgxY2I4Z2FEekdLZWFqaXdhZUR0WExFMFdIcDYwVFR3?=
 =?utf-8?B?S2xVdDlqZUt4S0xVZkMvZFkyK2hrUWExQVN2MEdCaEFBd0tIQkVWYVhhNlVV?=
 =?utf-8?B?MEhrYjlmZkZnalpzeEVjYUd2Zzlmc1A4YnNDd1RoM3VOUkFmaHdURHB5YkFN?=
 =?utf-8?B?TGdJd0ptMEJleHZOWE12Y1JHK2x0eGtOZDRWTU1QVVl1VmxXYUJYTzFRcUd1?=
 =?utf-8?B?SzJ4cVRpS1NzajIyUW1FNXB3dGNlUnNFKzk0MVhoOFFocElKWnFXRjBOd003?=
 =?utf-8?B?RHF5QmoyQ3VyYUlNNTFXeHRRMXl1OUFUaFlzSFN4bFhpcDlheEZ4UDRkSnRl?=
 =?utf-8?B?cDRNVE8wbXF3VEtlTEZFb1E1OFJjQzl0ZVNHOUlOaHRvVE5vVXI5TU9VRGtE?=
 =?utf-8?B?SE9UZ3cxUDdlalhOaVliRG9pT0pocE1SUVkrd09QbFNRa2YvTGdJYTNWL2Jp?=
 =?utf-8?B?cktIeFJUTnZRb2JYTU9BYldReHZ2bTJ4Qzg3NnFTR0l1NlRORUJlV2hvbFBq?=
 =?utf-8?B?UHVheUMrdVlzYlRGNElmdHpmZXAvOFpJb0N5STZlaVBUbFIrYmIyUnkwTm02?=
 =?utf-8?B?Y0x1bS96YVBMTm9DTjIvV1VTdUZDbHhJcUpLRGx1Ym1nVUdHNHNDekV1cHoz?=
 =?utf-8?B?cUpVcW9SWWI3d3dRMWY4NS9zUlY0bnhNMGt3TGRJczRxdFV4aFJQOGxJN3JO?=
 =?utf-8?B?SWtDT2R3TjRVcWJ5ME9zSWZrcXcwYjJ0clpvblRDcFV5Q0RJMWhSdlFRK3pZ?=
 =?utf-8?B?TU1OTVJkeUVVL1hpVHJZZUN1STczV0RidndlYTZkL1VyWnFLbUgxZHRYc1p2?=
 =?utf-8?B?T0VHb05pZHhPajI1UUlXVTJidHVpdmZObE80MkRLa1N3azA2cmw0NXlZN0tF?=
 =?utf-8?B?OXlTK0lTYU1NaEZhWmtsQVp1NkExQWVmc3JOakpSODdFTmVwQURLSzA1TVpC?=
 =?utf-8?B?VGJTQm9XTlVJYjdmaGRLbDZaeXFSWmlZRzFkTUQ5T2E0cDRhR2NSVGhRRGNl?=
 =?utf-8?B?ZE95ek9BNktNTFB2VjZ1bGpXeUxVdnk2RDBVQWdrNnI2cTdHM3JYaDJTNE5i?=
 =?utf-8?B?ZVRTbW1FZlh5Y2tpM3d5TnRLVlBXQkJSSCs3UGpUTVRGYUdXNG51NWdSd1Bl?=
 =?utf-8?B?bEdkZ21WUUxDNUc4cm1SYjB4UStOamNQb3FVcDdodUlucjdQd0pLckRMRkxh?=
 =?utf-8?B?a2tqbWZDZG95eklhODhnVUVwcmdiWUJzY3dNdXFiM0dodEtyQ01ReDZ6M25E?=
 =?utf-8?B?ZDVoUXQxRDRpeDFsNGRLMHZQbDM2c05ia3ByYi9sVFg5cXpKaE5Jc3BwSlY5?=
 =?utf-8?B?VTBLUlJpN0l0S2oyM3pEcHRORUI2N1dzUG8yNG5tN282dlFVN0w1Q1BBQnRU?=
 =?utf-8?B?Mll0OE5QaDROUWJuZU9WUjZOa1kxcE9taXJmd2VpbktsWnMrZXNhTXBZSTJa?=
 =?utf-8?B?Mk5sUmhqaDJJWHhudHFVSTEyZU1ydDYzVzZyZTlvTWRnaDdFZ2QzcTNDMnhI?=
 =?utf-8?B?RXdvNDBscURNVWR4Z09vZk44bU5UcURpZTRjM2NUVFdwdDhoellSdUdBcjkz?=
 =?utf-8?B?QjBzRW9iZFptVzhnam1yVW0ySWl2OHU4VmRjRFkxTzU2TnBKbldNRkZkRzhw?=
 =?utf-8?B?S2dMYXJmbVlZREJjdG8xZk5IMUI5ZUZwYkhweHlEdTRSbkxyVWI4Tzh1QlFq?=
 =?utf-8?Q?GL17V1c3ZTxPa4/m+Uk/HcKw6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA08F65F3940BE44A004BE70BE02C3D8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6717.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ede03b-68d4-496e-6c85-08db97f8650b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 10:15:30.5552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25F1NzeLhGzixBEPtvEdtWE6AtckmPn+VSvRRrV0uczFRs47a1b986kcZJAwEyc3oPjSJImeK3lo9kgK8fnQjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185655

SXQgaXMgYSBlbGVnYW50IHNvbHV0aW9uIGZvciBjdXJyZW50IGlzc3VlLiBJIHdpbGwgdGVzdCBh
bmQgdXBkYXRlIG15DQpwYXRjaCB0byBvbmx5IGluY2x1ZGUgdGVzdGNhc2UgcGFydCBzb29uLg0K
DQpUaGFuayB5b3UNCg0KWWFuZw0KDQpPbiBTYXQsIDIwMjMtMDgtMDUgYXQgMTE6MzYgKzAxMDAs
IFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2Ug
ZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUg
dmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIA0KPiBPbiBGcmksIDIwMjMt
MDgtMDQgYXQgMTc6MTMgKzAxMDAsIFJpY2hhcmQgUHVyZGllIHZpYQ0KPiBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyMy0wNy0xMyBhdCAwMjoxNiArMDAwMCwg
WWFuZyBYdSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IHdyb3RlOg0KPiA+ID4g
RnJvbTogWWFuZyBYdSA8eWFuZy54dUBtZWRpYXRlay5jb20+DQo+ID4gPiANCj4gPiA+IFRoZSBg
YmIuc2lnZ2VuLmNvbXBhcmVfc2lnZmlsZXNgIG1ldGhvZCB0cmFuc2Zvcm1zIHRoZSBrZXkgZm9y
bWF0DQo+IGZyb20NCj4gPiA+IGBbbWM6PG1jX25hbWU+Ol1bdmlydHVhbDpdW25hdGl2ZTpdPHJl
Y2lwZSBwYXRoPjo8dGFza25hbWU+YCB0bw0KPiA+ID4gYDxyZWNpcGUgZGlyPi88cmVjaXBlDQo+
IG5hbWU+Ojx0YXNrbmFtZT5bOnZpcnR1YWxdWzpuYXRpdmVdWzptYzo8bWNfbmFtZT5dYA0KPiA+
ID4gYnkgYGNsZWFuX2Jhc2VwYXRoc2AuIEhvd2V2ZXIsIGBmaW5kX3NpZ2luZm9gIHVzZXMgdGhl
IG9yaWdpbmFsDQo+IGZvcm1hdA0KPiA+ID4gdG8gZ2V0IHRoZSBwYWNrYWdlIG5hbWUgKHBuKSBh
bmQgdGFzayBuYW1lLg0KPiA+ID4gDQo+ID4gPiBUaGlzIGNvbW1pdCBjb3JyZWN0cyB0aGUgbWV0
aG9kIGZvciBkZXJpdmluZyB0aGUgcG4gYW5kIHRhc2sgbmFtZQ0KPiBpbg0KPiA+ID4gYGZpbmRf
c2lnaW5mb2AgYW5kIGFkZHMgaGFuZGxpbmcgZm9yIG11bHRpbGliIG5hbWUuDQo+ID4gPiBBbmQg
YWRkIHRlc3QgZm9yIGNvbXBhcmVfc2lnZmlsZXMgYW5kIGZpbmRfc2lnaW5mbyB3b3JraW5nDQo+
IHRvZ2V0aGVyLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx5YW5nLnh1
QG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gDQo+ID4gPiBOb3RlczoNCj4gPiA+ICAg
ICB2MTogY29ycmVjdCBoYW5kbGluZyBmb3IgcG4gYW5kIHRhc2tuYW1lIGZvciBuYXRpdmUgdGFy
Z2V0IGluDQo+IGZpbmRfc2lnaW5mbw0KPiA+ID4gICAgIHYyOiBhZGQgaGFuZGxpbmcgZm9yIG11
bHRpbGliIHRhcmdldCBpbiBmaW5kX3NpZ2luZm8NCj4gPiA+ICAgICB2MzogYWRkIHRlc3RjYXNl
IGZvciBjb21wYXJlX3NpZ2ZpbGVzIGFuZCBmaW5kX3NpZ2luZm8gd29yaw0KPiB0b2dldGhlci4N
Cj4gPiA+ICAgICB2NDogb3B0aW1pemUgdGVzdGNhc2UgdG8gYXZvaWQgbm9uLWRldGVybWluaXN0
aWMgZmFpbA0KPiA+ID4gDQo+ID4gPiAgLi4uL3JlY2lwZXMtdGVzdC9iaW51dGlscy9iaW51dGls
c18lLmJiYXBwZW5kIHwgIDIgKw0KPiA+ID4gIG1ldGEvbGliL29lL3NzdGF0ZXNpZy5weSAgICAg
ICAgICAgICAgICAgICAgICB8IDE3ICsrLS0NCj4gPiA+ICBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0
L2Nhc2VzL3NzdGF0ZXRlc3RzLnB5ICAgfCA4Mw0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4g
PiAgMyBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXNlbGZ0ZXN0L3JlY2lwZXMtDQo+IHRlc3QvYmlu
dXRpbHMvYmludXRpbHNfJS5iYmFwcGVuZA0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0
YS1zZWxmdGVzdC9yZWNpcGVzLQ0KPiB0ZXN0L2JpbnV0aWxzL2JpbnV0aWxzXyUuYmJhcHBlbmQg
Yi9tZXRhLXNlbGZ0ZXN0L3JlY2lwZXMtDQo+IHRlc3QvYmludXRpbHMvYmludXRpbHNfJS5iYmFw
cGVuZA0KPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+IGluZGV4IDAwMDAwMDAwMDAu
LjIwNTcyMDk4MmMNCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL21ldGEtc2VsZnRl
c3QvcmVjaXBlcy10ZXN0L2JpbnV0aWxzL2JpbnV0aWxzXyUuYmJhcHBlbmQNCj4gPiA+IEBAIC0w
LDAgKzEsMiBAQA0KPiA+ID4gKyMgVGhpcyBiYmFwcGVuZCBpcyB1c2VkIHRvIGFsdGVyIHRoZSBy
ZWNpcGUgdXNpbmcgdGhlDQo+IHRlc3RfcmVjaXBlLmluYyBmaWxlIGNyZWF0ZWQgYnkgdGVzdHMu
DQo+ID4gPiAraW5jbHVkZSB0ZXN0X3JlY2lwZS5pbmMNCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRh
L2xpYi9vZS9zc3RhdGVzaWcucHkgYi9tZXRhL2xpYi9vZS9zc3RhdGVzaWcucHkNCj4gPiA+IGlu
ZGV4IGY5NDNkZjE4MWUuLmYwNDFhMGM0MzAgMTAwNjQ0DQo+ID4gPiAtLS0gYS9tZXRhL2xpYi9v
ZS9zc3RhdGVzaWcucHkNCj4gPiA+ICsrKyBiL21ldGEvbGliL29lL3NzdGF0ZXNpZy5weQ0KPiA+
ID4gQEAgLTMyMSwxMSArMzIxLDE4IEBAIGRlZiBmaW5kX3NpZ2luZm8ocG4sIHRhc2tuYW1lLA0K
PiB0YXNraGFzaGxpc3QsIGQpOg0KPiA+ID4gICAgICBpZiBub3QgdGFza25hbWU6DQo+ID4gPiAg
ICAgICAgICAjIFdlIGhhdmUgdG8gZGVyaXZlIHBuIGFuZCB0YXNrbmFtZQ0KPiA+ID4gICAgICAg
ICAga2V5ID0gcG4NCj4gPiA+IC0gICAgICAgIHNwbGl0aXQgPSBrZXkuc3BsaXQoJy5iYjonKQ0K
PiA+ID4gLSAgICAgICAgdGFza25hbWUgPSBzcGxpdGl0WzFdDQo+ID4gPiAtICAgICAgICBwbiA9
IG9zLnBhdGguYmFzZW5hbWUoc3BsaXRpdFswXSkuc3BsaXQoJ18nKVswXQ0KPiA+ID4gLSAgICAg
ICAgaWYga2V5LnN0YXJ0c3dpdGgoJ3ZpcnR1YWw6bmF0aXZlOicpOg0KPiA+ID4gLSAgICAgICAg
ICAgIHBuID0gcG4gKyAnLW5hdGl2ZScNCj4gPiA+ICsgICAgICAgIGlmIGtleS5jb3VudCgnOicp
ID49IDI6DQo+ID4gPiArICAgICAgICAgICAgc3BsaXRpdCwgdGFza25hbWUsIGFmZml4ID0ga2V5
LnNwbGl0KCc6JywgMikNCj4gPiA+ICsgICAgICAgIGVsc2U6DQo+ID4gPiArICAgICAgICAgICAg
c3BsaXRpdCwgdGFza25hbWUgPSBrZXkuc3BsaXQoJzonLCAxKQ0KPiA+ID4gKyAgICAgICAgICAg
IGFmZml4ID0gJycNCj4gPiA+ICsgICAgICAgIHBuID0NCj4gb3MucGF0aC5zcGxpdGV4dChvcy5w
YXRoLmJhc2VuYW1lKHNwbGl0aXQpKVswXS5zcGxpdCgnXycpWzBdDQo+ID4gPiArICAgICAgICBh
ZmZpeGl0ZW1zID0gYWZmaXguc3BsaXQoJzonKQ0KPiA+ID4gKyAgICAgICAgaWYgYWZmaXhpdGVt
c1swXSA9PSAndmlydHVhbCc6DQo+ID4gPiArICAgICAgICAgICAgaWYgYWZmaXhpdGVtc1sxXSA9
PSAnbmF0aXZlJzoNCj4gPiA+ICsgICAgICAgICAgICAgICAgcG4gPSBwbiArICctbmF0aXZlJw0K
PiA+ID4gKyAgICAgICAgICAgIGlmIGFmZml4aXRlbXNbMV0gPT0gJ211bHRpbGliJzoNCj4gPiA+
ICsgICAgICAgICAgICAgICAgcG4gPSBhZmZpeGl0ZW1zWzJdICsgJy0nICsgcG4NCj4gPiA+ICAN
Cj4gPiA+ICAgICAgaGFzaGZpbGVzID0ge30NCj4gPiA+ICAgICAgZmlsZWRhdGVzID0ge30NCj4g
PiANCj4gPiANCj4gPiBJJ3ZlIHN0YXJlZCBhdCB0aGlzIHBhdGNoIGxvbmcgYW5kIGhhcmQgYW5k
IEknbSBjb21pbmcgdG8gdGhlDQo+ID4gY29uY2x1c2lvbiB0aGF0IHdoaWxzdCB3aGF0IHlvdSdy
ZSBkb2luZyBpbXByb3ZlcyB0aGluZ3MsIHRoZXJlIGFyZQ0KPiA+IG1vcmUgY29ybmVyIGNhc2Vz
IHJlbWFpbmluZyBhbmQgd2UncmUganVzdCBtb3ZpbmcgdGhlIHByb2JsZW0gdG8NCj4gbmV3DQo+
ID4gb25lcyBkb3duIHRoZSByb2FkLiBIYXZpbmcgdG8gaGFyZGNvZGUgaW4gZWFjaCBvZiB0aGUg
Y2xhc3MgbmFtZXMNCj4gYW5kDQo+ID4gc3BlY2lhbCBjYXNlIHRoZW0gaXMgYSBiaWcgd2Fybmlu
ZyBzaWduLg0KPiA+IA0KPiA+IEkgc3RhcnRlZCB3b25kZXJpbmcgd2h5IHdlIGVuY29kZSBwYXRo
bmFtZXMgaW50byB0aGUgc2lnaW5mbyBmaWxlcy4NCj4gVGhlDQo+ID4gcmVhc29uIGlzIHRoYXQg
aXMgaG93IGJpdGJha2UgaGFuZGxlcyB0aGVtIHdpdGhpbiBydW5xdWV1ZS4gSW4NCj4gZWFybGll
cg0KPiA+IHRpbWVzIHdoZW4gdGhpcyB3YXMgYmVpbmcgYnVpbHQsIHRoYXQgd2FzIGZpbmUgYnV0
IHRoaW5ncyBoYXZlIGJlZW4NCj4gPiBleHRlbmRlZCBtYW55IHRpbWVzIG92ZXIgc2luY2UgdGhh
dCBkZWNpc2lvbiB3YXMgbWFkZS4NCj4gPiANCj4gPiBUaGUgaXNzdWUgaXMgdGhhdCB0aG9zZSAi
aW50ZXJuYWwiIHJlcHJlc2VudGF0aW9ucyBkb24ndCBtYXAgb250bw0KPiBvdGhlcg0KPiA+IHN5
c3RlbXMsIHNvIHNzdGF0ZSB3cml0ZXMgZmlsZXMgaW4gYSBkaWZmZXJlbnQgZm9ybWF0LiBUaGVy
ZSBpcyBubw0KPiBlYXN5DQo+ID4gd2F5IHRvIG1hcCB0aGUgb3JpZ2luYWwgcmVwcmVzZW50YXRp
b25zIHRvIHRoZSBmb3JtYXQgdXNlZCBpbiB0aGUNCj4gPiBzc3RhdGUgZmlsZSBuYW1lcy4NCj4g
PiANCj4gPiBNeSBjb25jbHVzaW9uIGlzIHRoYXQgd2Ugc2hvdWxkIGNoYW5nZSB0aGUgc2lnaW5m
byBmaWxlcyB0byBoYXZlDQo+IHRoZQ0KPiA+IGRhdGEgYWxyZWFkeSBpbiAic3N0YXRlIiBmb3Jt
YXQuIFRoYXQgZG9lcyBwb3RlbnRpYWxseSBicmVhayBhIGZldw0KPiA+IHRoaW5ncyBidXQgaXMg
cHJvYmFibHkgd29ydGggZG9pbmcgZm9yIHRoZSBzaW1wbGljaXR5IGdhaW5zIGluIGNvZGUNCj4g
PiBsaWtlIHRoaXMuDQo+IA0KPiBJJ3ZlIHNlbnQgYSBjb3VwbGUgb2YgcGF0Y2hlcywgb25lIHRv
IGJpdGJha2UgYW5kIG9uZSB0byBPRS1Db3JlDQo+IHdoaWNoDQo+IGNoYW5nZSB0aGUgZm9ybWF0
IG9mIHRoZSBkYXRhIGluIHJ1bnRhc2tkZXBzIHRvIGJlIFBOIGJhc2VkIHJhdGhlcg0KPiB0aGFu
DQo+IHJlY2lwZSBmaWxlbmFtZSBiYXNlZCB3aGljaCB0aGVuIG1ha2VzIHRoZSBhYm92ZSBjaGFu
Z2UgdW5uZWVkZWQsIHdlDQo+IG5vDQo+IGxvbmdlciBuZWVkIHRvIGhhcmRjb2RlIGNsYXNzZXMg
aW50byBpdC4NCj4gDQo+IFdpdGggdGhvc2UgY2hhbmdlcywgSSBkaWQgY29uZmlybSB0aGF0IHRo
ZSB0ZXN0Y2FzZSBhZGRlZCBpbiB0aGlzDQo+IHBhdHRjaCBkb2VzIHBhc3MuDQo+IA0KPiBXZSBu
ZWVkIHRvIHJldmlldyB0aG9zZSBvdGhlciBjaGFuZ2VzIGJ1dCBhc3N1bWluZyB0ZXN0aW5nIHNo
b3dzIHRoZXkNCj4gd29yayBvdXQgb2sgY291bGQgeW91IHVwZGF0ZSB0aGlzIHBhdGNoIHRvIHNp
bXBseSBhZGQgdGhlIHRlc3QgY2FzZT8NCj4gSSdkIGFsc28gYXBwcmVjaWF0ZSBpdCBpZiB5b3Ug
Y291bGQgY2hlY2sgdGhvc2UgcGF0Y2hlcyBkbyByZXNvbHZlDQo+IHRoZQ0KPiBpc3N1ZSB5b3Ug
d2VyZSBzZWVpbmcuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0K

