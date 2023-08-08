Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608F3C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 10:48:39 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web10.58634.1691491716974080766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 03:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=ZcZg/xQp;
 dkim=pass header.i=@mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=m62a1KhO;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 1af8512435d911ee9cb5633481061a41-20230808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IydNsw7OSYhjFYpIGSymloWLcs/Vw0AQ8R3D2q5hvaA=;
	b=ZcZg/xQpeyW2RU788KxYbG3A0+gl79va+ooyo3e649i0prperEH53ntBmhVskUVvig4yJPU5RIX1rmxd7TcxnRA5/6PuJJq0nyVwed47W8WlgAQ+aDlKenkyGXqkgi6Y+A9Tujo7kYUM8jwrKHtIoe5OISRwhI4NBlJMWWSqd3A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:18f5b182-0da1-4268-b860-3a4972dffa67,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:0bf647b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1af8512435d911ee9cb5633481061a41-20230808
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 205252673; Tue, 08 Aug 2023 18:48:27 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Aug 2023 18:48:26 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Aug 2023 18:48:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDkAknq74zS78hEaFVRK2BryTMUO0zfFrNSKFJE2vGTRB1RfathYHviDKHG/r9Z2FrzMRT6nZdss7Ii7Hef7pf3y8Mbnuqi5WGEkXfJZjkb1L2TT6zvZjK9FDE7NIUk6UKlDZXqvpm2h2UGpGTO0i5rs/iCwxzXyNwGlgmRJUf+SmD5l874qahtj3KWNdmw7Q5rX3+AORmS4OJs/BWO4F/KNlZY2h3kb8MvkBEXlCv3sZakp7eNlwxtdnu61UlAddyRVWIr7Kls+IY3fTx8lIlaCTikMIBqzTCui9gIYH9i21v3qP5+b2xlSAbvcgrm3H9i0Cva3wXrchwUYbYSiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IydNsw7OSYhjFYpIGSymloWLcs/Vw0AQ8R3D2q5hvaA=;
 b=W/2hoocM5O0s9fRsly0jPCWu4rHFlX7umoiBsY8W/yghe3zPb9+OTxIy7Ec4qdCuAn+NIpX1iWIALy/6mJN6TybzsDFkr+F9F6c2RrNS17wEAy7cYa/lgGAby7r8k/o9OdBMnftrcoa+89LwDtqF2rAb26CrzGW2lc9GJHY4vV7j8ISwcSESbrWF9kAS/3NWnbA/6GT+B7Ano/8ug/BXqbFKvOVoy76xo85AnER5enmTPwoQHrWvvtm4wFouXMplHX/EGesOE0WcqBHeLUBDbDSjICVFROcU0HiSqQWUHejiEu3KYFmDH3L5t5S+1nbwxi8Gd9ZJt/HDNIrPyao03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IydNsw7OSYhjFYpIGSymloWLcs/Vw0AQ8R3D2q5hvaA=;
 b=m62a1KhOgdDstpIrEfFGKBA20xDheYBG2vy4vxMO/UdtFVjqD90dG+yofScr3FKM9XlYamvMY5xbwqETQ+2wvi/BJknc5EJNCEer3AKxbIzqleOZCk1bQeXuLB60a4lKHq58iQviqQzXCKVTkxic789mLTN8jQdeRobhwBjXC0Q=
Received: from TYZPR03MB6717.apcprd03.prod.outlook.com (2603:1096:400:1f2::7)
 by TYZPR03MB7289.apcprd03.prod.outlook.com (2603:1096:400:41f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 10:48:23 +0000
Received: from TYZPR03MB6717.apcprd03.prod.outlook.com
 ([fe80::cc39:6dbc:afa3:de25]) by TYZPR03MB6717.apcprd03.prod.outlook.com
 ([fe80::cc39:6dbc:afa3:de25%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:48:23 +0000
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
Thread-Index: AQHZtTAnUDM+s4kBtkm5lINhnsZf0q/bpxL+gASxEICAAAbGgIAAAmgA
Date: Tue, 8 Aug 2023 10:48:23 +0000
Message-ID: <82185064eb39af49337a37a5ac4d3570b7d845d8.camel@mediatek.com>
References: <20230713021659.23130-1-yang.xu@mediatek.com>
	 <17783A2A112CFD7F.19347@lists.openembedded.org>
	 <89e8391834fb349cff2b603545aee7a2742561ba.camel@linuxfoundation.org>
	 <5b4a1b35758598da483ae1d711150f892c89e612.camel@mediatek.com>
	 <5811f5c5d0f051523649f29298b1757838b660e9.camel@linuxfoundation.org>
In-Reply-To: <5811f5c5d0f051523649f29298b1757838b660e9.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6717:EE_|TYZPR03MB7289:EE_
x-ms-office365-filtering-correlation-id: a90e57f0-6a60-4fff-6702-08db97fcfd09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLbOwaC8WXe4+NLbzoe81mgwVsUckLOjq7lzeikzPRFq31xpRaT3+6/aVtm89Dau38x4Ofr/1D/2zSmVyWaH2WqgsWceIByZP8C3Hs8W+/Q6PjmrNjLySB3vGfWtsCSjZjRqNUpl8Kp2F0Coy+eYOAOEgYTt3cvd0Mb8Sd7jwQT2Y9yAaJ3KV1s926x7uf4RbwZP+2jec6+kEap51NVbtTNKmfQjIXY2CwXrSrVJtdZhXpIBERsukE+hj6+XhvwIRrZNX61/9ycfvX2f2fnWpYBGwUUqBSfZCplpMhAdPbayVprQKjuWeWiExyh8dgLxupm3VDUmBjJWy0s0TdztQ19hQv1DHwFnShf/KHXac0S0stL4lpqVgEEXwfXEdSlS9eeQM7IvOCxt3K8mdZ6iF23EZUXB9lHub6zy94NZdTP2EA1wB+exHIMnSNw5SasJBsiYGzKJf+U2A+nxUJljuQwz9zUhSO64poB2f8WZ07vyCHbWMEkLdT/eQ/qD3KDOsBpmo3PVDkWjDU62tan8WomJDBmROIlwkGEtWpcmIHoUtA5yJ9K2fGY3Dx0VcBd+bggWIdxFeliISEt2lUgwSM3uPYZ1rjAXaBpdTkgES2HN+Lr5HorNtrbXlM05HU2cccF8Tw/AlrtFVq7+ftUH5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6717.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(186006)(1800799003)(26005)(41300700001)(6506007)(8936002)(8676002)(83380400001)(2906002)(36756003)(85182001)(4744005)(2616005)(122000001)(38100700002)(38070700005)(86362001)(5660300002)(76116006)(4326008)(66946007)(64756008)(91956017)(66556008)(66476007)(66446008)(478600001)(54906003)(6512007)(966005)(110136005)(6486002)(71200400001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmNNdHdXWHFCRUF3eEhXa3M0VVhCMnY0Z0s2ZkJzQ3VZWnpVdUlNS1BUU0VJ?=
 =?utf-8?B?OHc0L1lTM3ptaXVXK2JYMmpVZytsMkNBR3dPbFVrQnJuVXh2WDIvejB3MHN5?=
 =?utf-8?B?SVBEbk5xS3RBQlBnb3VWL2NVQWtaUHVJQVZTclJJZ3h1NXRoNlpkenM2YXdZ?=
 =?utf-8?B?anRVamFCcmtBUTRLcTRGbThNUXhSTkpjaEhzZEdVMWxNNzBmNjY4M2RnWGJZ?=
 =?utf-8?B?ejNyYnl6T202SWNwYi9jQzVHQjZLaWVHdHArRlJ2ckpRK3gvTU9oOE96aTA5?=
 =?utf-8?B?ZmpBL2lUMGRjL2ZodVZnY2JJMnBlcVdRcTV3VXNrZks1bGxLTTVDeFkrakFh?=
 =?utf-8?B?NEthbHVwcWQ0eFpXUTNmdEZzMEtVdHdSYVBOb2k5YXRVWU1jTFd4MGpvYzRY?=
 =?utf-8?B?ZmVNNzF0djhVSDlkeWExRzdMOTlLTnduT3pjWVJGOXRmWExFbGt6dDZuOHJT?=
 =?utf-8?B?MndyZHd2Q1FSYXJreFg5cTlxY3JOVDlVZmx4RW9wZXArQk5ZOXl4L2x0UGRB?=
 =?utf-8?B?K2ZOenFmWDAyVlp2bU1vb1NrVkJ5SFZtUTJST0prdUVFWGdVWjgwVW0yN1BK?=
 =?utf-8?B?a1RaazFuU0xGZ0tKN0xNbERiRnFOZ2R0bWpUdTFlTkpmRWw4QkRYcm43d2NP?=
 =?utf-8?B?N20wSC9xbHZHT0Zjc25qRjB2TzVvaExFNTUwNFVqcVdGQWRUMEFuSHY5Ny93?=
 =?utf-8?B?QWpjRG5qTXpyV2dSbS8rdjhGc05FbDZoNVBMTHdadHZKS0dRb3JUcjN5Tndj?=
 =?utf-8?B?dGYvNFJWZ1ZITklUNXlxSSt3ckFzalR5UWl1VkQyVVVnVEE2RDBSem5OR0c4?=
 =?utf-8?B?Tk85bGNMUkhlb0FWeFp5YlBId3FDTnhVN3cxTUUzRis1ZE5qUzVmSWo4UGdh?=
 =?utf-8?B?K0pMOWdXdGZYT3hkZ3c2T3pKVWczblo5NGtadmRLbUQzWnlxWHZLdjJjNUtj?=
 =?utf-8?B?aFhOaExJSW5NSDhkdXZxcHpSUy9yWkxsR3cyS3dBUXhKMFk2MFpDTmNoMWZt?=
 =?utf-8?B?aVgyUVlXVEd4NHZkTVFROWw2WTlzQ1ZucWhYangrRTcwdnFqanBFS0dRYVJL?=
 =?utf-8?B?STl2RXBCNldIemtuY1l5dmhrbkE1cTU4T3JmMWFOWklhMGs1S05nQ3JISVJp?=
 =?utf-8?B?N2N6SzlqTXE3djA4VnZLTTBSTHFQZmU1M0FlaWlnTjNoU3Z0dnhEckZMU0xh?=
 =?utf-8?B?VTkwcENjL2dNeUY2R0E2S3lNMmZpQWl2MHhTTlN2aGJjdWJNRzFlNThpMmRC?=
 =?utf-8?B?NW1TTVFkQUsrdFIreDZmek8yRzhKeGJBRndIN00yMHVCYUZMZ2V5ZHV6ZWI3?=
 =?utf-8?B?dmE5R0pGeWVBL0FPM0JEekc4RjhUYktRTHRIZjB4dzV2bkJ5bEZ1Sm42Sm9w?=
 =?utf-8?B?RGRZTHc0WHJZazZsNlNnYjBDOHFtSVBaQnZSbU1iWHFzR0liZHpOdzd6Slpq?=
 =?utf-8?B?ZnZvVnNxQlNFWFpoa09hZDFIQUc2aTVlNSsxZFV3cit1Q0xEVWRBajFncDJh?=
 =?utf-8?B?bjk3OVRKZXloSUxNaXlDc0NSaEIzdVNDUTVKMnA0U3Z3ZmtkOFdzRmw0aG4v?=
 =?utf-8?B?ZnBpaURySm9xSlZzMEdzZmVwWGdqZzROc21sUHFFRDlqalZtL240ODFGZEJp?=
 =?utf-8?B?UTdWQ1U2L2UwZ0JxTlZBSmhmaU1ZSExhc3JkQzI1NzJTWkJiaS9tSEk1QUg4?=
 =?utf-8?B?MGU4a3lGQUFETVNWQkkzZHB5cUpMNTZwSWZqSkRDOFJJM2I1V01jZ2YwZmdO?=
 =?utf-8?B?N3A1V2sxVGpJbVJDTmx4T0ozTURpZlVvUEE3cC91NmZvYTF4ajdRbjM3Ulcz?=
 =?utf-8?B?aXl0UUZCdFpmSmdJVkZNazBvMGl6ZUlWTFN2UUFrcklJbmswYlRsUDRqbnhE?=
 =?utf-8?B?OUxHazIxT2txUGp5Smw5YTErOEtKSjYyYURxOS93VWpqY3dJWHFlQzhYcWhn?=
 =?utf-8?B?NDNtSXltekx3NmVUdmEwaUZOdTBOWk8yWUYwMDlMS1FxMjJldFhxTUpNSHN6?=
 =?utf-8?B?dDErZnZvcS96alA4NFZGaDZXdkFteldyRHVQdTVsUXpHNWFlSG53MVZ6MmRF?=
 =?utf-8?B?RzAyUnNPMStxV2tLbUxJTXBxQ2lFNWNxenFOTEpEQTVCQ2tEM0FBQ1ZjYU9Z?=
 =?utf-8?Q?bOOLqxl10A8XZo8Mt+rQVImtv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9ADD2AD47ACFF4483158D52176AC0D1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6717.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90e57f0-6a60-4fff-6702-08db97fcfd09
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 10:48:23.5341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJtOcEADXwJmxiqvmBIUTRWnezEXWwlGHO1OaSMqDwyrod+m9ewyyXpGeG5McMkS9CXyqyjzjknH5uQmvZ8g5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7289
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185659

SSBnb3QgaXQsIHRoYW5rIHlvdSA6KQ0KDQpZYW5nDQoNCk9uIFR1ZSwgMjAyMy0wOC0wOCBhdCAx
MTozOSArMDEwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFp
bCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0K
PiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgDQo+IE9u
IFR1ZSwgMjAyMy0wOC0wOCBhdCAxMDoxNSArMDAwMCwgWWFuZyBYdSAo5b6Q5omsKSB3cm90ZToN
Cj4gPiBJdCBpcyBhIGVsZWdhbnQgc29sdXRpb24gZm9yIGN1cnJlbnQgaXNzdWUuIEkgd2lsbCB0
ZXN0IGFuZCB1cGRhdGUNCj4gbXkNCj4gPiBwYXRjaCB0byBvbmx5IGluY2x1ZGUgdGVzdGNhc2Ug
cGFydCBzb29uLg0KPiA+IA0KPiA+IFRoYW5rIHlvdQ0KPiANCj4gSSBkaWQgZW5kIHVwIHR3ZWFr
aW5nIHlvdXIgcGF0Y2ggdG8gdGhpczoNCj4gDQo+IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0
Lm9yZy9wb2t5L2NvbW1pdC8/aD1tYXN0ZXItbmV4dCZpZD0zYTc5NDUyNTA3ODQ2NzU2ZjZkNzhj
YWI0ZGM0YWRhZmEwY2IyYmU3DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo=

