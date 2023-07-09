Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8D4EB64DC
	for <webhook@archiver.kernel.org>; Sun,  9 Jul 2023 14:49:03 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web10.18797.1688914134461508991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 07:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=F8TiOOYo;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: b4fd01721e6711ee9cb5633481061a41-20230709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UPlieJc+VPvKoJJTv7vs8Z+5kZPeh8eoBnVrWIcQPco=;
	b=F8TiOOYoycgyyLzYF2+WhiOXU3ZoB0bU3wyWJ8lrXoTa/fxKm+dtdbd4+IZcwtCQndw/xgfHZnp7gH8PaZIGS7jZAi3TB9sI/bTI58aCf0gIhul9foUx8c7HUSGc5/LDg6QpjjBkUW6NoNP59o32EeBm00eHkBGFG4cQUPT5vnA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:df6effc1-b1b6-421b-bfdc-ef0d7607312a,IP:0,U
	RL:5,TC:0,Content:-5,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:51
X-CID-INFO: VERSION:1.1.27,REQID:df6effc1-b1b6-421b-bfdc-ef0d7607312a,IP:0,URL
	:5,TC:0,Content:-5,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:51
X-CID-META: VersionHash:01c9525,CLOUDID:c548cada-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:230707203643RFS460YA,BulkQuantity:3,Recheck:0,SF:17|19|48|29|28|102,
	TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: b4fd01721e6711ee9cb5633481061a41-20230709
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 669772054; Sun, 09 Jul 2023 22:48:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 9 Jul 2023 22:48:44 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 9 Jul 2023 22:48:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oH3GlZW2SnHbIsAjvO0G0s2lKyUlp0fvXjlU1Z1FsqD2LfTBRoEtXpBVUzo99idCI5zHGXtpenZC/8ldZL9LGHGRoJ6V/28M7edRbUZKbfMAtyvOJmqT/6HydzhciqCxAOMIwMPrgu+Mhes6Dw1XycOLe+VWMCkHWtePxtBiBPwiDYYQIleppTyM4qEbkQ91AZwBrJdBW3rSZFeFO6mkIGWhuQGcNTyBN+qseK5Jf7ZJbAS3IL7K7Lf/D+znfvfRsjYTQcHILAcBBs7uO0qLx/NMevy/oKtz+3DpZQrzwld1Ij8cwkJX/KJQXiRS+7fK3K/5AfY6IVMFKw0yP7LhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPlieJc+VPvKoJJTv7vs8Z+5kZPeh8eoBnVrWIcQPco=;
 b=VxqPTQr28ryRSHeIEeQbEKjL+lJTeyFy16j0R0OWbLCsPFk44CmsGDorkIzLBRLfG/6kGgM/pYGGW4NUaiVSOZYs1zex3vOdIousA6OI3NexPuJZY8JH0oQyV3q0LUouaiSDK3qIjC1ThsUaiL0hrDZgMxNhaawXFRuMHI6X7/1FFdnA43EqB4Y4TY1e2IGYShdYjtehCKcdwT3xewiMDeCN7f0NwNCNfSSXTeLII9ZbfgLsGvPIvWUI/TLmSS0f4xU+juc/JcvUvzAPXUSfmpypaQyUM4jXMBg+0XKSdcUMXW3nGUp3M2ME8LniScBtLfd3BgdF7tRMDs0RNd66kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPlieJc+VPvKoJJTv7vs8Z+5kZPeh8eoBnVrWIcQPco=;
 b=S1j13fkkfIb/1beV1eBmUCydcPj2KX7JZaDOgd5HuF1eOz0rW3CRp8CVrWGm4gCZK1tQ+CB5lgNfx+fcUX0trBhTImlJG0EBkLm50KHpY+4Ys1SUfcjoJEgIaLfnLVbjCH4lgEAnkX8XNORDrXZNvMezJHpX6P0ibcsHJy1jINU=
Received: from TYZPR03MB6717.apcprd03.prod.outlook.com (2603:1096:400:1f2::7)
 by TYZPR03MB5826.apcprd03.prod.outlook.com (2603:1096:400:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Sun, 9 Jul
 2023 14:48:41 +0000
Received: from TYZPR03MB6717.apcprd03.prod.outlook.com
 ([fe80::8c2b:6b90:ecb1:fc87]) by TYZPR03MB6717.apcprd03.prod.outlook.com
 ([fe80::8c2b:6b90:ecb1:fc87%7]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 14:48:40 +0000
From: =?utf-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] sstatesig: Fix pn and taskname derivation in
 find_siginfo
Thread-Topic: [OE-core] [PATCH v3] sstatesig: Fix pn and taskname derivation
 in find_siginfo
Thread-Index: AQHZsJ+jFLbGm0fu406b40g+RTl5qq+uPhWAgANJkQA=
Date: Sun, 9 Jul 2023 14:48:40 +0000
Message-ID: <3fc42a2b4651a800a62a00a33a28d61fab141de1.camel@mediatek.com>
References: <20230707065239.28468-1-yang.xu@mediatek.com>
	 <202307071236355ddab32a@mail.local>
In-Reply-To: <202307071236355ddab32a@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6717:EE_|TYZPR03MB5826:EE_
x-ms-office365-filtering-correlation-id: 7f88ee23-191f-4a25-6eec-08db808b95fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lkklkaMqOHIUlnN79W5q7B4dg9yv5hN2x50vJhBA1h45R7RAj48iJtaC9R7k1289jrL5KJ4qpQv1u2ZXn0DrK7hDVAJB36RKyymtFxacbnFyis+KJeNgFpvr5G5s/WT6L7f261dcsWRMCMc4Uj9sdzGs23UwqQLXPnRRhtNMo6X6g32XaUE3gZF7w2h4Tv48YeGe5RQ4SVL31FiNuxMRJYcgKRKejgsSPR4Ci1V9UsOKhOwhDkhZI+OOaWPWZyKlFElR96rfCNm/uWh87oSS6b9z3RTczoU3s8dKfm5G2vkcICqng9q88NKoN9R7/Ym/LDWhAZzX9uNfRZKZtRVs9DrGrtgGMbK61742wsEwsMGMuIYG6c2M5P9JBcMKaqEroWJG+fHUDNWoiJAduLS6RxV4DStgnQflR9pwCsrz157Jkeg2ts49a6IJzDbRJTmXbZN2gCyonyxG1L//G12coBgTZj3UhkcUsWicfEndkyYfm6SXz7OC12tr/IuvNcbkHYNPUwUlJhjbHo34N8zzz2iKxYDBKcl7DOvisMa5gp1OmoYXqFGX9Ftz5Dd0PK3QfqfAtmHHGs9g24RCgMNSzI+bT70zXFkbdact2AIIVXzsUL2rV+abK37ZuP09kwh17BmHnyxeWJqs0wmkefuKOg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6717.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199021)(71200400001)(478600001)(6486002)(91956017)(54906003)(26005)(6506007)(76116006)(966005)(6512007)(2906002)(186003)(316002)(41300700001)(64756008)(66476007)(4326008)(6916009)(66556008)(66946007)(8676002)(8936002)(5660300002)(38100700002)(122000001)(66446008)(86362001)(36756003)(85182001)(38070700005)(2616005)(83380400001)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2tPSFd3SlV0dHhoeU1NRC9NRjl3VUJlMXV0TVRLWmNFK01mcVVxMG1lWkJZ?=
 =?utf-8?B?VUYwV093dE9wSjVCbnRTMFoycHBpaTFkVFpmcURiYWY0VGM2ZkEwa2dHSlkr?=
 =?utf-8?B?U016cU55TTczMGY0WG5SR2lOd29wNlpQdUZIOHh6MG5jUHNqNXFrbFlvUWxr?=
 =?utf-8?B?RmVGdXJNUzlLZklJUHp2aFN6V0lqUzVhYi9zZUlJbjBadG9PSllzckpzc004?=
 =?utf-8?B?RmZkMElseGxWY2dxUTRNZW1BTENUbXpMOHBpckt6dTJzN3padUFoNE82dzFy?=
 =?utf-8?B?NVczTXVIbnVXRVBKY21tSlpYUkc2SCt2VXNvMFpScVhmL0RXOVNJbTJoZ3ZI?=
 =?utf-8?B?eEhhb2c4ODVpL01xVHFjdzFlZ2t1cU10aGQydWZDK2xjL0dpcTBaT2ZxSzc2?=
 =?utf-8?B?TFdGYWQxcGQrNlowN2ZFTXFGd1JQQkRrOVpnQ1F4R2JtRzZPQVNUTjRLRVoy?=
 =?utf-8?B?RGFWUDhSUXJ5VFJyN0hueTVWZUNteUZuT3k5S1h1amFOZXFoV2dhcEc1RStt?=
 =?utf-8?B?bWN5YjN4ZVZ5aDI1OVZzQnE3ZU52YmovRis2VWtVTitrUTBRZXFiMm00MHZv?=
 =?utf-8?B?bnlwMXpHQWp6WEkrUjkwd3JQeTVjNjcrOWZFNU1haWNjTnFPRFNreFFiSHl2?=
 =?utf-8?B?NVZpbmpmWmlmY0NhazNFeW1EMm4wYmNPemE0ZEdEZysvTFZsdDFSVVU4N2pV?=
 =?utf-8?B?YUNXZkZ4Nm16dlVoSW9CNWhkUWhUSGdpL1pEbnU2NnRtaHNTcSszcDZ5aW5s?=
 =?utf-8?B?MG91Zjk2c2xFTk5ETnE1azlZR0NEdWc3dEQ5bjloT29EeW5hYWp5eWtqVHpW?=
 =?utf-8?B?Ynh6SFYvNUZtQTBhSmc2azUwZ2RtdWRKblpBblAvZkYvY1h1b2l5YVFLQ1Za?=
 =?utf-8?B?TGJkVFJ1NzhjaHp4R2o2emFiakJsSk0xZXc3ZngrTXBMUitxb1FxVTFNS1RD?=
 =?utf-8?B?aXJOdFAybnZ2VDJWTG5FV3R0YWhRUXBwOHR2N3BBRnY0aU5TM0srSTQxOXBh?=
 =?utf-8?B?dHZmek9mbWZBM1JmZmR2V0VLWHQrVEhCbTZsT2xhVjRBQkZ0cnM3RFBMd2Jj?=
 =?utf-8?B?ZWVmUjhBTkYvTVdyUG5waTFkTWRSaElFQ29FOFV2bHZjR2xoNzFmTXZNeFB4?=
 =?utf-8?B?amFqUmQ5TUpHbHg2dlMyeW9vZmo1aVBDYWFTb202aE5paVhoYlJ6bWdRcVBP?=
 =?utf-8?B?dHRYc0RTVlZWcEZJWWwvMnJRalMvenIyUTBpVlFOcTZaZlgyY2hDWmE3R1px?=
 =?utf-8?B?ektYODVQZ2dGU3RqRlg0Um1ldm1JQmIyOTZCUFVxWnhoaTdoYXdrR20vVHI0?=
 =?utf-8?B?UkJFK1ZPRDBzYVFEMWVmbHd0QnFGSyszZ215V1lmZXExSE8zR3BGeHQyS1Uw?=
 =?utf-8?B?L05zZzM4cW0xbWJIZEUydHJ5REhwYS9ieWl0UlhzVjF0SGhQbEN6cFRZM1JO?=
 =?utf-8?B?TkE2am1FbTN5ZG94aTlrREV3SE5iSXZSOWJWUmZBMlhTZ3JWY3BzV0JSNmlO?=
 =?utf-8?B?VGEzVk80WVBRRE11MkI4U2w5TFl6dnptc04weDgwZFQydXc0bmNhUE5MQTY2?=
 =?utf-8?B?S0hxZTcvdE1GMEJvRzRvWE5zNVRvdlZsSFl3cUYyZ0gwbm5NV3VHTVNnSU5t?=
 =?utf-8?B?RG95OFFkd3VLWG9aaTZmaEE2bnI1cDRGWWZqVS9RVFd5UGxRNkFWUExlUjJq?=
 =?utf-8?B?NDRMRjYwSnoxNHg2aFZqRDJpdTYxemNPSUJ6WlBwRTE0TklWc2plclJHeUh4?=
 =?utf-8?B?MUp3VW4zMjVCS1dER1QxdGhOVHcrUXZuVk5aK1REYTJFbG1UL3ZTaVRhTDE4?=
 =?utf-8?B?UlJBMzJSdzdEMmhwbmU3RHIxNzM1OXZsd3hPM3hiMktjczdtVmVweTdVTGFS?=
 =?utf-8?B?QmFtWGRXTnlOZ1lUQm5qa1BDRDRZWGY4WGhZRVdGVkE5Tmh1WlNjWXBxTmxU?=
 =?utf-8?B?cFJlUVhrbUFLVWZjQVo4NEd1blZSRG9GOEliaVdFMmV5TzhMRlZiNXprQkVv?=
 =?utf-8?B?L3FzMVlheWdabEloNTFMazNQRmVZTTlwa3g5bFhmTERoTm1COXdablFDRm1i?=
 =?utf-8?B?RnBQUEdXRTdpb2VhU1ZPSTRzcUZ4c3FtNGRwZ2ZnT0w0a3dqZXFwNG9yMXlV?=
 =?utf-8?B?SXFKVjJnZGp5RUprM0NOc2h3TkNUNGsvU3k1R1IxZWNWRDl0NktOKy9IQmRI?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <310D7A6A1AF35C42B3768B1CFBA2A8F0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6717.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f88ee23-191f-4a25-6eec-08db808b95fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2023 14:48:40.7739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBQG6uTPo/P5QTucD2a0wk8g7aZiZTDtFWMQJWrYQej+gw+WM71xylwcIvrSjh/N3nuecjDDXbwCGtzMEbTCcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 14:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184040

RGVhciBBbGV4YW5kcmUsDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZW1pbmRlci4NCg0KdjE6IGNv
cnJlY3QgaGFuZGluZyBmb3IgcG4gYW5kIHRhc2tuYW1lIGZvciBuYXRpdmUgdGFyZ2V0IGluDQpm
aW5kX3NpZ2luZm8NCnYyOiBhZGQgaGFuZGxpbmcgZm9yIG11bHRpbGliIHRhcmdldCBpbiBmaW5k
X3NpZ2luZm8NCnYzOiBhZGQgdGVzdCBmb3IgY29tcGFyZV9zaWdmaWxlcyBhbmQgZmluZF9zaWdp
bmZvIHdvcmsgdG9nZXRoZXIgDQoNCkRvIEkgbmVlZCBzdWJtaXQgYSBwYXRjaCB2NCB0byBhZGQg
dGhlc2UgY2hhbmdlbG9nIGluZm9ybWF0aW9uPw0KDQpUaGFuayB5b3UNCg0KDQpPbiBGcmksIDIw
MjMtMDctMDcgYXQgMTQ6MzYgKzAyMDAsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiAgCSAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gIEhlbGxvLA0KPiANCj4gT24gMDcvMDcvMjAyMyAwNjo1MjozOSswMDAwLCBZYW5n
IFh1IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IEZyb206IFlhbmcg
WHUgPHlhbmcueHVAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IFRoZSBgYmIuc2lnZ2VuLmNvbXBh
cmVfc2lnZmlsZXNgIG1ldGhvZCB0cmFuc2Zvcm1zIHRoZSBrZXkgZm9ybWF0DQo+IGZyb20NCj4g
PiBgW21jOjxtY19uYW1lPjpdW3ZpcnR1YWw6XVtuYXRpdmU6XTxyZWNpcGUgcGF0aD46PHRhc2tu
YW1lPmAgdG8NCj4gPiBgPHJlY2lwZSBkaXI+LzxyZWNpcGUNCj4gbmFtZT46PHRhc2tuYW1lPls6
dmlydHVhbF1bOm5hdGl2ZV1bOm1jOjxtY19uYW1lPl1gDQo+ID4gYnkgYGNsZWFuX2Jhc2VwYXRo
c2AuIEhvd2V2ZXIsIGBmaW5kX3NpZ2luZm9gIHVzZXMgdGhlIG9yaWdpbmFsDQo+IGZvcm1hdA0K
PiA+IHRvIGdldCB0aGUgcGFja2FnZSBuYW1lIChwbikgYW5kIHRhc2sgbmFtZS4NCj4gPiANCj4g
PiBUaGlzIGNvbW1pdCBjb3JyZWN0cyB0aGUgbWV0aG9kIGZvciBkZXJpdmluZyB0aGUgcG4gYW5k
IHRhc2sgbmFtZQ0KPiBpbg0KPiA+IGBmaW5kX3NpZ2luZm9gIGFuZCBhZGRzIGhhbmRsaW5nIGZv
ciBtdWx0aWxpYiBuYW1lLg0KPiA+IEFuZCBhZGQgdGVzdCBmb3IgY29tcGFyZV9zaWdmaWxlcyBh
bmQgZmluZF9zaWdpbmZvIHdvcmtpbmcNCj4gdG9nZXRoZXIuDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogWWFuZyBYdSA8eWFuZy54dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+IA0KPiBQbGVh
c2UgYWx3YXlzIGluY2x1ZGUgYSBjaGFuZ2Vsb2cgaW4gdGhpcyBsb2NhdGlvbiwgZWxzZSB3ZSBj
YW4ndA0KPiBrbm93DQo+IGVhc2lseSB3aGF0IGNoYW5nZWQgc2luY2UgdjIuDQo+IA0KPiA+ICAu
Li4vcmVjaXBlcy10ZXN0L2JpbnV0aWxzL2JpbnV0aWxzXyUuYmJhcHBlbmQgfCAgMiArDQo+ID4g
IG1ldGEvbGliL29lL3NzdGF0ZXNpZy5weSAgICAgICAgICAgICAgICAgICAgICB8IDE3ICsrKyst
LQ0KPiA+ICBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL3NzdGF0ZXRlc3RzLnB5ICAgfCA1
Mw0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtc2Vs
ZnRlc3QvcmVjaXBlcy0NCj4gdGVzdC9iaW51dGlscy9iaW51dGlsc18lLmJiYXBwZW5kDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtc2VsZnRlc3QvcmVjaXBlcy0NCj4gdGVzdC9iaW51dGls
cy9iaW51dGlsc18lLmJiYXBwZW5kIGIvbWV0YS1zZWxmdGVzdC9yZWNpcGVzLQ0KPiB0ZXN0L2Jp
bnV0aWxzL2JpbnV0aWxzXyUuYmJhcHBlbmQNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAuLjIwNTcyMDk4MmMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvbWV0YS1zZWxmdGVzdC9yZWNpcGVzLXRlc3QvYmludXRpbHMvYmludXRpbHNfJS5iYmFwcGVu
ZA0KPiA+IEBAIC0wLDAgKzEsMiBAQA0KPiA+ICsjIFRoaXMgYmJhcHBlbmQgaXMgdXNlZCB0byBh
bHRlciB0aGUgcmVjaXBlIHVzaW5nIHRoZQ0KPiB0ZXN0X3JlY2lwZS5pbmMgZmlsZSBjcmVhdGVk
IGJ5IHRlc3RzLg0KPiA+ICtpbmNsdWRlIHRlc3RfcmVjaXBlLmluYw0KPiA+IGRpZmYgLS1naXQg
YS9tZXRhL2xpYi9vZS9zc3RhdGVzaWcucHkgYi9tZXRhL2xpYi9vZS9zc3RhdGVzaWcucHkNCj4g
PiBpbmRleCBmOTQzZGYxODFlLi5mMDQxYTBjNDMwIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvbGli
L29lL3NzdGF0ZXNpZy5weQ0KPiA+ICsrKyBiL21ldGEvbGliL29lL3NzdGF0ZXNpZy5weQ0KPiA+
IEBAIC0zMjEsMTEgKzMyMSwxOCBAQCBkZWYgZmluZF9zaWdpbmZvKHBuLCB0YXNrbmFtZSwgdGFz
a2hhc2hsaXN0LA0KPiBkKToNCj4gPiAgICAgIGlmIG5vdCB0YXNrbmFtZToNCj4gPiAgICAgICAg
ICAjIFdlIGhhdmUgdG8gZGVyaXZlIHBuIGFuZCB0YXNrbmFtZQ0KPiA+ICAgICAgICAgIGtleSA9
IHBuDQo+ID4gLSAgICAgICAgc3BsaXRpdCA9IGtleS5zcGxpdCgnLmJiOicpDQo+ID4gLSAgICAg
ICAgdGFza25hbWUgPSBzcGxpdGl0WzFdDQo+ID4gLSAgICAgICAgcG4gPSBvcy5wYXRoLmJhc2Vu
YW1lKHNwbGl0aXRbMF0pLnNwbGl0KCdfJylbMF0NCj4gPiAtICAgICAgICBpZiBrZXkuc3RhcnRz
d2l0aCgndmlydHVhbDpuYXRpdmU6Jyk6DQo+ID4gLSAgICAgICAgICAgIHBuID0gcG4gKyAnLW5h
dGl2ZScNCj4gPiArICAgICAgICBpZiBrZXkuY291bnQoJzonKSA+PSAyOg0KPiA+ICsgICAgICAg
ICAgICBzcGxpdGl0LCB0YXNrbmFtZSwgYWZmaXggPSBrZXkuc3BsaXQoJzonLCAyKQ0KPiA+ICsg
ICAgICAgIGVsc2U6DQo+ID4gKyAgICAgICAgICAgIHNwbGl0aXQsIHRhc2tuYW1lID0ga2V5LnNw
bGl0KCc6JywgMSkNCj4gPiArICAgICAgICAgICAgYWZmaXggPSAnJw0KPiA+ICsgICAgICAgIHBu
ID0NCj4gb3MucGF0aC5zcGxpdGV4dChvcy5wYXRoLmJhc2VuYW1lKHNwbGl0aXQpKVswXS5zcGxp
dCgnXycpWzBdDQo+ID4gKyAgICAgICAgYWZmaXhpdGVtcyA9IGFmZml4LnNwbGl0KCc6JykNCj4g
PiArICAgICAgICBpZiBhZmZpeGl0ZW1zWzBdID09ICd2aXJ0dWFsJzoNCj4gPiArICAgICAgICAg
ICAgaWYgYWZmaXhpdGVtc1sxXSA9PSAnbmF0aXZlJzoNCj4gPiArICAgICAgICAgICAgICAgIHBu
ID0gcG4gKyAnLW5hdGl2ZScNCj4gPiArICAgICAgICAgICAgaWYgYWZmaXhpdGVtc1sxXSA9PSAn
bXVsdGlsaWInOg0KPiA+ICsgICAgICAgICAgICAgICAgcG4gPSBhZmZpeGl0ZW1zWzJdICsgJy0n
ICsgcG4NCj4gPiAgDQo+ID4gICAgICBoYXNoZmlsZXMgPSB7fQ0KPiA+ICAgICAgZmlsZWRhdGVz
ID0ge30NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9zc3Rh
dGV0ZXN0cy5weQ0KPiBiL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvc3N0YXRldGVzdHMu
cHkNCj4gPiBpbmRleCBmZWJhZmRiMmY3Li44MThkOGI2MjNkIDEwMDY0NA0KPiA+IC0tLSBhL21l
dGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvc3N0YXRldGVzdHMucHkNCj4gPiArKysgYi9tZXRh
L2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL3NzdGF0ZXRlc3RzLnB5DQo+ID4gQEAgLTY5MSwzICs2
OTEsNTYgQEAgVE1QRElSID0gIiR7VE9QRElSfS90bXAtc3N0YXRlc2FtZWhhc2gyIg0KPiA+ICAg
ICAgICAgIHNlbGYubWF4RGlmZiA9IE5vbmUNCj4gPiAgICAgICAgICBzZWxmLmFzc2VydENvdW50
RXF1YWwoZmlsZXMxLCBmaWxlczIpDQo+ID4gIA0KPiA+ICtjbGFzcyBTU3RhdGVGaW5kU2lnaW5m
byhTU3RhdGVCYXNlKToNCj4gPiArICAgIGRlZiB0ZXN0X3NzdGF0ZV9jb21wYXJlX3NpZ2ZpbGVz
X2FuZF9maW5kX3NpZ2luZm8oc2VsZik6DQo+ID4gKyAgICAgICAgIiIiDQo+ID4gKyAgICAgICAg
VGVzdCB0aGUgZnVuY3Rpb25hbGl0eSBvZiB0aGUgZmluZF9zaWdpbmZvOiBiYXNpYyBmdW5jdGlv
bg0KPiBhbmQgY2FsbGJhY2sgaW4gY29tcGFyZV9zaWdmaWxlcw0KPiA+ICsgICAgICAgICIiIg0K
PiA+ICsgICAgICAgIHNlbGYud3JpdGVfY29uZmlnKCIiIg0KPiA+ICtUTVBESVIgPSBcIiR7VE9Q
RElSfS90bXAtc3N0YXRlcy1maW5kc2lnaW5mb1wiDQo+ID4gK1RDTElCQ0FQUEVORCA9IFwiXCIN
Cj4gPiArTUFDSElORSA9IFwicWVtdXg4NlwiDQo+ID4gK3JlcXVpcmUgY29uZi9tdWx0aWxpYi5j
b25mDQo+ID4gK01VTFRJTElCUyA9ICJtdWx0aWxpYjpsaWIzMiINCj4gPiArREVGQVVMVFRVTkU6
dmlydGNsYXNzLW11bHRpbGliLWxpYjMyID0gIng4NiINCj4gPiArQkJfU0lHTkFUVVJFX0hBTkRM
RVIgPSAiT0VCYXNpY0hhc2giDQo+ID4gKyIiIikNCj4gPiArICAgICAgICBzZWxmLnRyYWNrX2Zv
cl9jbGVhbnVwKHNlbGYudG9wZGlyICsgIi90bXAtc3N0YXRlcy0NCj4gZmluZHNpZ2luZm8iKQ0K
PiA+ICsNCj4gPiArICAgICAgICBwbnMgPSBbImJpbnV0aWxzIiwgImJpbnV0aWxzLW5hdGl2ZSIs
ICJsaWIzMi1iaW51dGlscyJdDQo+ID4gKw0KPiA+ICsgICAgICAgICNmb3JjaW5nIGdlbmVyYXRl
IGRpZmZlcmVudCBzdGFtcHMgZm9yIGJpbnV0aWxzIGV2ZXJ5IHRpbWUNCj4gPiArICAgICAgICBz
ZWxmLndyaXRlX3JlY2lwZWluYygiYmludXRpbHMiLCAnZG9fZmV0Y2hbbm9zdGFtcF0gPQ0KPiAi
MSInKQ0KPiA+ICsgICAgICAgIGZvciBwbiBpbiBwbnMqMjoNCj4gPiArICAgICAgICAgICAgYml0
YmFrZSgiJXMgLVMgbm9uZSIgJSBwbikNCj4gPiArICAgICAgICBzZWxmLmRlbGV0ZV9yZWNpcGVp
bmMoImJpbnV0aWxzIikNCj4gPiArDQo+ID4gKyAgICAgICAgd2l0aCBiYi50aW5mb2lsLlRpbmZv
aWwoKSBhcyB0aW5mb2lsOg0KPiA+ICsgICAgICAgICAgICB0aW5mb2lsLnByZXBhcmUoY29uZmln
X29ubHk9VHJ1ZSkNCj4gPiArDQo+ID4gKyAgICAgICAgICAgIGRlZiBmaW5kX3NpZ2luZm8ocG4s
IHRhc2tuYW1lLCBzaWdzPU5vbmUpOg0KPiA+ICsgICAgICAgICAgICAgICAgcmVzdWx0ID0gTm9u
ZQ0KPiA+DQo+ICsgICAgICAgICAgICAgICAgdGluZm9pbC5zZXRfZXZlbnRfbWFzayhbImJiLmV2
ZW50LkZpbmRTaWdJbmZvUmVzdWx0Ig0KPiAsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgImJiLmNvbW1hbmQuQ29tbWFuZENvbXBsZXRlZCJdKQ0KPiA+ICsgICAgICAgICAg
ICAgICAgcmV0ID0gdGluZm9pbC5ydW5fY29tbWFuZCgiZmluZFNpZ0luZm8iLCBwbiwNCj4gdGFz
a25hbWUsIHNpZ3MpDQo+ID4gKyAgICAgICAgICAgICAgICBpZiByZXQ6DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgd2hpbGUgVHJ1ZToNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgZXZl
bnQgPSB0aW5mb2lsLndhaXRfZXZlbnQoMSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
aWYgZXZlbnQ6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiBpc2luc3RhbmNl
KGV2ZW50LA0KPiBiYi5jb21tYW5kLkNvbW1hbmRDb21wbGV0ZWQpOg0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBlbGlmIGlzaW5zdGFuY2UoZXZlbnQsDQo+IGJiLmV2ZW50LkZpbmRTaWdJbmZvUmVzdWx0
KToNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXN1bHQgPSBldmVudC5y
ZXN1bHQNCj4gPiArICAgICAgICAgICAgICAgIHJldHVybiByZXN1bHQNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgIGRlZiByZWN1cnNlY2Ioa2V5LCBoYXNoMSwgaGFzaDIpOg0KPiA+ICsgICAgICAg
ICAgICAgICAgaGFzaGVzID0gW2hhc2gxLCBoYXNoMl0NCj4gPiArICAgICAgICAgICAgICAgIGhh
c2hmaWxlcyA9IGZpbmRfc2lnaW5mbyhrZXksIE5vbmUsIGhhc2hlcykNCj4gPiArICAgICAgICAg
ICAgICAgIHNlbGYuYXNzZXJ0Q291bnRFcXVhbChoYXNoZXMsIGhhc2hmaWxlcykNCj4gPiArICAg
ICAgICAgICAgICAgIGJiLnNpZ2dlbi5jb21wYXJlX3NpZ2ZpbGVzKGhhc2hmaWxlc1toYXNoMV0s
DQo+IGhhc2hmaWxlc1toYXNoMl0sIHJlY3Vyc2VjYikNCj4gPiArDQo+ID4gKyAgICAgICAgICAg
IGZvciBwbiBpbiBwbnM6DQo+ID4gKyAgICAgICAgICAgICAgICBmaWxlZGF0ZXMgPSBmaW5kX3Np
Z2luZm8ocG4sICJkb19jb21waWxlIikNCj4gPiArICAgICAgICAgICAgICAgIHNlbGYuYXNzZXJ0
R3JlYXRlckVxdWFsKGxlbihmaWxlZGF0ZXMpLCAyKQ0KPiA+ICsgICAgICAgICAgICAgICAgbGF0
ZXN0ZmlsZXMgPSBzb3J0ZWQoZmlsZWRhdGVzLmtleXMoKSwga2V5PWxhbWJkYQ0KPiBmOiBmaWxl
ZGF0ZXNbZl0pWy0yOl0NCj4gPiArICAgICAgICAgICAgICAgIGJiLnNpZ2dlbi5jb21wYXJlX3Np
Z2ZpbGVzKGxhdGVzdGZpbGVzWy0yXSwNCj4gbGF0ZXN0ZmlsZXNbLTFdLCByZWN1cnNlY2IpDQo+
ID4gLS0gDQo+ID4gMi4yNS4xDQo+ID4gDQo+IA0KPiA+IA0KPiA+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxODQwMDEpOiANCj4gaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xODQwMDENCj4g
PiBNdXRlIFRoaXMgVG9waWM6IA0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
MTAwMDAxMzA1LzM2MTcxNzkNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3du
ZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiANCj4gaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gW2FsZXhh
bmRyZS5iZWxsb25pQGJvb3RsaW4uY29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
ID4gDQo+IA0KPiANCg==

