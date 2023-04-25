Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808BEC6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 06:04:36 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.72703.1682402669118666718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 23:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=J7OCDElA;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 07c082e0e32f11eda9a90f0bb45854f4-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hXSuS7/SmlpP5mVpHq9K2AHUg/Xv3HlpLVYlmRQI2pg=;
	b=J7OCDElAT9kwFdAMZ+zCNZcirsJPCOi6AKYyoTv5Q1fq4eSt1zdjex0Re1ZoiW6w5r7GLVdJVBy5i1x2CfwYX5FW7PF1duuUYo9mAwTqxj+1I/RJDfx4xCt2M+PdM8NzpWJEzKO7/nkQsmGJu+/C5W2d6D8oEbJoY8eAxcOQJpY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d998054e-456b-4fa1-9dc4-b493e9020c05,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:db322685-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 07c082e0e32f11eda9a90f0bb45854f4-20230425
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 597912405; Tue, 25 Apr 2023 14:04:25 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Apr 2023 14:04:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 25 Apr 2023 14:04:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkhImRaKGB64P8XDm4M6A26N17MnO3Sst6Ip2koHir1OY1e/V78c66GAxB2nE2Ck+6STeMD81iVBnlekcLxLbI+CmK969PMoFpOYpDbX8C0G0NyuZhCxaZ1QnvqtPfbZb+7Ktl9F1899ykoTPFGE6jlqNRqZbcl/btvCpn++xNcZcYn6U9+qOeb2G3D0kd+RjmiTHNPeE8s8Zghy30IQKWWoRNRIjD4msC5KSdFcshxWugfqiDAeMn2Wzw81Q5m5X0uv5JTqoYMtK7Q/DVq8ynSYibgKwAsVDqc7ohbNv5fiyoWg5k8Fvo8sj+Vs4shIr/neqyerSLVchqVQFs6jQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXSuS7/SmlpP5mVpHq9K2AHUg/Xv3HlpLVYlmRQI2pg=;
 b=BrlZ45Igf+Hd3ZWbqRZn72b3t+mbPqxrEhD0a+BoogSC2KYa+6EeXuPslsmPZgBuJ9WnuqfD+CKBJGnFBRXuENtqBVi4fTpiSQSfX0nNvjM8oBaX9ieK/ARB5ee4iDvnLmDNgnLDXKLp/z6101I3+5HtcAgdEpxGz4rMVvZqR1cgjjgg26ACI6HeusdhzeBRfvB/4sUI/ltsFn2IrtNSqyOcQ5pVa72usUkW81an+8/I51yJRjPhcyRSm9MxeytEHbgG9sxh4K4laewQweNbvsTxgziuDCNHeCNWX0D3tSpOBZXr1Bu8krf5cYW+mfEMSgo8p8PCLrE6meXLQnupHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXSuS7/SmlpP5mVpHq9K2AHUg/Xv3HlpLVYlmRQI2pg=;
 b=cJUE2GdDWlYfIK2UqNCPF1BEOyfaWiGGQO1SmM99JOaS/KjgQ/fLuAkt9fo9Zbw4BvfiHPTSMqQFYlhkfybgqJvPchnyRHEAGoulU91yrswCkrvYj9Vfphqp+wviq6YMmXiQ5WcOYBemYoXguGYAab1yzL3LYPKqEpmMzK+A3Oc=
Received: from SG2PR03MB3081.apcprd03.prod.outlook.com (2603:1096:4:11::13) by
 SEYPR03MB6580.apcprd03.prod.outlook.com (2603:1096:101:85::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Tue, 25 Apr 2023 06:04:06 +0000
Received: from SG2PR03MB3081.apcprd03.prod.outlook.com
 ([fe80::489:7f0a:661b:c8f1]) by SG2PR03MB3081.apcprd03.prod.outlook.com
 ([fe80::489:7f0a:661b:c8f1%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 06:04:06 +0000
From: =?utf-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>
To: "yang.xu=mediatek.com@lists.openembedded.org"
	<yang.xu=mediatek.com@lists.openembedded.org>, "luca.ceresoli@bootlin.com"
	<luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2] openssl: set package level PERL5LIB
Thread-Topic: [OE-core] [PATCH v2] openssl: set package level PERL5LIB
Thread-Index: AQHZc1GmuO1gUzi6PUmNVJFj0siCS68z4deAgAevAIA=
Date: Tue, 25 Apr 2023 06:04:06 +0000
Message-ID: <5035080e48ce2ada7911332910175e30e8eadbdb.camel@mediatek.com>
References: <20230420063034.16806-1-yang.xu@mediatek.com>
	 <20230420104355.68722b88@booty>
In-Reply-To: <20230420104355.68722b88@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB3081:EE_|SEYPR03MB6580:EE_
x-ms-office365-filtering-correlation-id: e67915d1-0335-47e8-fed2-08db4552e0f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zp9XTOqxbNCpqoqpvY3rhqy7Obioj/d+eqFabpIIjArgGFlFV4KAaRnS+P7/XwpK3CeF7/9Rcj1mgf6LHZC6A8deJppcbRpigNVGp2ij7nsxPGvQ1JLQEQgWXEv+S3U4gJSMpPFvEmT2bnWBlP4Qzc6WIL9VyPioYvxvzNPeXpY3SCypSk+majPLMONmc5Lzjk49HUaVfl1514/5+vm3fujfioUTtfYH4Xyhk3JPAAbejNpzjI6xnFg+ce8paHZY7TTYO1jPZuqtVSvMgJoRsX62n8pi3Em5QGQKuY7Xg/7LYDII6QRnSQ0PDFV6tSXS9lxEvoWdf9Pna4BsyE4DTOFfryOnxfErpPU9BoKpXlAmHb4mqEvS8Z4+5mRa/sopNvAgomdvAcgFqy7PoCSwhZsKlpXiQgdBaxqMcJtQlZXhJi+SM+OLk3yfWx/ycXlmeTAayYddK0P+WMdHCxQq4TPnsKn7Xk/eP0AwQYWbXP/U8IvjOlUbysIl7a8ekP2R3ieeNGWqFIO7kPsX/Zaev29ivmJbdVi27XF84H9PVBSAIzskFd1UE9Z8HcQXXflqci8b9nN7NztAyROageYbD7/9fybLO5vvd+X/nthdjIeu1tFwIqqNcb+89MnGAa0Z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB3081.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(8676002)(8936002)(5660300002)(966005)(6486002)(71200400001)(38100700002)(76116006)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(122000001)(478600001)(54906003)(41300700001)(110136005)(36756003)(2616005)(85182001)(26005)(6512007)(6506007)(2906002)(186003)(86362001)(83380400001)(38070700005)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGxZMXl5amFWUEoxb3JxVm5weklOWEJIVHJNUU1jL0UrQ0E2NkRLVFdYdndt?=
 =?utf-8?B?MFcxTlZrZTZzM1lUKzM0dVh6cTZXS0lRV2JsdmJ3NFFaMDRpMGJINE5ic1VK?=
 =?utf-8?B?SURBK2Z4aVBCU2E3dm1wWm45MHR0YjZKaDRkMGdwVW96N3kvSnhLM0xWN3pJ?=
 =?utf-8?B?Y2pBa3RBUEtFaDJPWGZ6SnZoZnowalZkMU0vOVkyS2E1bjFKOCtybzlHN29r?=
 =?utf-8?B?SzVOam9uK3RXVDFMUUh6MFdyZ3ZIQWpXNllIb0Z1RHpFdlVoTHZkUGo4b1Rl?=
 =?utf-8?B?ZlVpcUN3L09QKzR4emYvTGRsNVBtVWQ4QUdSR1NrYlRYQnNQZXQxTVNDMEJT?=
 =?utf-8?B?Q0ZOMFZxeXpyeE05RkcrTWo1UW41bnlKd0ptYUVvR2FVdnhOSW1ON0haRXJV?=
 =?utf-8?B?V1VjakJCcWhOV0l2TDdHVEd6cjkxY1J4MnRRMC9zeU5NekpCK1ZNSWF3WjVu?=
 =?utf-8?B?KzBtT2c3cVpmKzR0bkp5anh2SEZOeC93VGJFd1BjUDIwWlRlRExrWmUxeVBm?=
 =?utf-8?B?VkdjaE9mNVFEWVlqRTV5Wkg4TTdRK3g4SS9MNlhHbjltdkN0dk10dmJDNkVm?=
 =?utf-8?B?c1BobGkvTjJuemwrcGRCSTFKcXBwZm5PaWo5T2REaVhxNzFRT2ozZEpPVVV4?=
 =?utf-8?B?L1RBelJvc2ExV2c3U0IvZ1N5MUhkZHBJNjZHREJpN0J3Q2ZpOUdhUkxIcy9I?=
 =?utf-8?B?SkpoSWlDL0ZWcGxSRGNsYjRuRy92V0hNc3grVlphbUhIY1pmamZabUZUNWNC?=
 =?utf-8?B?UEJOODhNOG1yeEpaT3ZzQXVRc2ZQQkVlblpLdnZYT1BORHpIaUQzQU9zM1BR?=
 =?utf-8?B?Y0dPVS94ODhhSUFFc3JoVXRYQ0VPS0xLUW42K2Z2bTlyTlZIbWNvRkZOeFBO?=
 =?utf-8?B?eEx2ZkxmWUZwTlpsRkFqaVNXYk9LVXF4T0pod2JFTGtpejk5N1dtVEdoR2lh?=
 =?utf-8?B?QTVWb01XYzlWL1Q3aHZzdStFbEE2OS9WcEJrWlY5OG1vRkM3T3BwRVNySmFr?=
 =?utf-8?B?eitzMU9iQ2paNlNaNkFFMlRhUmhyUEpoWFNTaGhqRnFOVTNiMEpSUzZ0SThH?=
 =?utf-8?B?bzVZU3BSeWs2SjFvaGxqYUdHUWlNSUhJOWNpZHBzZzQ0SndndkVjWEZCcnlM?=
 =?utf-8?B?cTB0SzFpdmNPTk5sWFc3MzAzQUwrV09wN2E4NE5TMjhGdjlvT0IrWnU2QXZT?=
 =?utf-8?B?MVV1SkhuRjZNQXpyOGJkWnlITGNld2R1NnArTWQ4M1VZTXJvNy9GK29NYzF1?=
 =?utf-8?B?WEZHMGtUOHM3RjdzTDJjb0YwRUhHZE0zVHE0ZTdGamRKcmdlSFBnd0IycTA5?=
 =?utf-8?B?NUlkcHJNMEJpYTVNYlpUaXZndzJ2eWo1cUhhMFhwWHUvZGlQOVFGazlkMVNQ?=
 =?utf-8?B?NVdNN09CSC9YSndhS0xNOHlDVDd5V0Q3QnRiSmp5M2R5Uk1wVHV2NGt3dTBB?=
 =?utf-8?B?NGM5OHFuT1FkTkdvaytTYkxJT1BZdUxpT09FQlVpYStzT293eWhHY1Ewb0VT?=
 =?utf-8?B?WVJQdzlISkdIUXFzQzlxVW1TZlBYaHpvRzd1LzBYSUp6NlZTcEFiaEZzRDFU?=
 =?utf-8?B?by9VMUhHdk52cmRIZTRBSXc5Mnd0Z2JyTGNtdXcwcWg1UVBheDFYN04rZnQx?=
 =?utf-8?B?SUQySUlMSFhmV2N5OExuOStCZmxEbm92RHUrNlU0KzUwNDdoclFIRnMrbGxG?=
 =?utf-8?B?MktUb3FHRnFSSUcxZE9UTXZZZTU3YTFFalE5YVpLUVF2NXZRc0VqOEtoL2ZV?=
 =?utf-8?B?MHp0RTdQTmhPWjUzSmdmaENCL0srV0FUem82c1oxeDdHeGx0OWVFUWFvUGtV?=
 =?utf-8?B?ZlFscDBqandPSVU5UDVmN01wY2pRb3l1U0ZaOUN1NWtUVUR5cEVud3RaRnI4?=
 =?utf-8?B?ZjBmNU5vaTAvcDExTnJVZExNaG1leTVFckVPVkR3ZzlpRzh2VVllVExmTHFK?=
 =?utf-8?B?ZjJQMEQzOXNKaTJFT1M1TmRkaGozeFdmb1h0YjFZN1BEWWI2T0VaczdBUk9D?=
 =?utf-8?B?TVA5dVYrRlNJWUh5ZmxYSFFPN050Ulhxb2syV2F5anZCT0p3SFFDa1dFMlU2?=
 =?utf-8?B?NVRPVExDZ1pLOFhrNjVmckE1MHd1em9IV1VzcFNCZWxNUW9IRjJpUDkrckRK?=
 =?utf-8?B?bnFiTk9TdWx6ZW1lREdUK01DcC9LOUFnUHVVdStXOW45R3UxNkNhNVJ4V1Zv?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4CAD77594697B4F966A1B9135F76A5E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB3081.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67915d1-0335-47e8-fed2-08db4552e0f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 06:04:06.6563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/V5HrmZKCybmDr7qzDpF0jJU0wS9DGn4xkWTuZhKM6xGgZPkJvlQxdrlGZ8cOARQH/VjZwzLH/fM/RUsDpF6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6580
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180373

RGVhciBTaXJzLA0KDQpTb3JyeSwgcGxlYXNlIE5PVCBhY2NlcHQgdGhpcyBwYXRjaCBiZWNhdXNl
IEkgZm91bmQgaXQgd2lsbCBicmVhayBpdHMNCm93biBzc3RhdGUgY2FjaGUuDQoNCkkgd2lsbCBm
b3VuZCBvdGhlciBzb2x1dGlvbiBmb3IgdGhpcyBvcGVuc3NsL3BlcmwgY28td29yayBpc3N1ZS4N
Cg0KT24gVGh1LCAyMDIzLTA0LTIwIGF0IDEwOjQzICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEhlbGxvIFlhbmcsDQo+IA0KPiB0aGFua3MgZm9yIHlvdSBwYXRj
aC4gSG93ZXZlciB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIHlvdXIgZS1tYWlsLCBzZWUNCj4gYmVs
b3cNCj4gDQo+IE9uIFRodSwgMjAgQXByIDIwMjMgMDY6MzA6MzQgKzAwMDANCj4gIllhbmcgWHUg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciDQo+IDx5YW5nLnh1PW1lZGlhdGVrLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl4NCj4gDQo+IEFzIHlvdSBjYW4gc2VlIHlvdXIgc2VuZGVyIGFkZHJl
c3MgaGFzIGJlZW4gbWFuZ2xlZCwgYW5kIGFzIGEgcmVzdWx0DQo+IHRoZSBwYXRjaCBpcyByZWpl
Y3RlZCBieSB0aGUgdGhlIG9wZW5lbWJlZGRlZCBnaXQgc2VydmVyLiBUaGlzIGlzIG5vdA0KPiB5
b3VyIGZhdWx0LCBidXQgd2UgbmVlZCB5b3UgdG8gbW9kaWZ5IHlvdXIgZ2l0IGNvbmZpZ3VyYXRp
b24gdG8NCj4gcHJldmVudA0KPiB0aGlzIGZyb20gaGFwcGVuaW5nIGluIHRoZSBmdXR1cmUuIEhh
dmUgYSBsb29rIGF0IHRoZSB3aWtpIGZvciBtb3JlDQo+IGluZm8gYW5kIGhvdyB0byBzb2x2ZSB0
aGF0Og0KPiANCj4gDQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cub3Bl
bmVtYmVkZGVkLm9yZy93aWtpL0hvd190b19zdWJtaXRfYV9wYXRjaF90b19PcGVuRW1iZWRkZWQq
Rml4aW5nX3lvdXJfRnJvbV9pZGVudGl0eV9fO0l3ISFDVFJOS0E5d01nMEFSYnchbXFkMkU5aElH
U3lYWDFJdUhIQXNaRU5sUkdhZ2x2Y3RYTTRuX2FHbW1QZXNHc0U3S01JeGlCd1JoQW9fN0g3SVA3
ZlZ3cTFJQ1lQS29RVlhnejZVMVpGdm5RJA0KPiANCj4gSSdtIHRha2luZyB5b3VyIHBhdGNoIGZv
ciB0ZXN0aW5nIG9uIHRoZSBhdXRvYnVpbGRlcnMsIGZpeGluZyBpdA0KPiBtYW51YWxseSBzbyB5
b3UgZG9uJ3QgbmVlZCB0byByZXNlbmQgaXQuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEx1Y2EN
Cj4gDQo+IC0tDQo+IEx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZw0KPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
czovL2Jvb3RsaW4uY29tX187ISFDVFJOS0E5d01nMEFSYnchbXFkMkU5aElHU3lYWDFJdUhIQXNa
RU5sUkdhZ2x2Y3RYTTRuX2FHbW1QZXNHc0U3S01JeGlCd1JoQW9fN0g3SVA3ZlZ3cTFJQ1lQS29R
VlhnejZMVXBocGx3JA0K

