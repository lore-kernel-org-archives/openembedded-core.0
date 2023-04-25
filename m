Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB55C6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 06:07:36 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.72724.1682402852213515527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 23:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=OTIpXDx0;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 74a40b2ae32f11eda9a90f0bb45854f4-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=4TTJPPZv1baA1V8cJsxGBm4TznThVxYjDJkKk7vRLA0=;
	b=OTIpXDx0G0Xh5qMZyWPqKyS5MYhpbVcF/bkh0bZoRhFhox6iZ+rOnQPNAfyQ4DONhj7yuCYRPfMmWFnJHEWZa44JQ2DdyZVqOUCW1RkC7L+3UJboxNE+3OzlbTxxx9fn9a0/8eP/moGJJtDNb/jrr/cntfsWoFj2PiSOEb5IlKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:68766892-18d4-4bb1-bb26-5650b1df7c8d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:1
X-CID-INFO: VERSION:1.1.22,REQID:68766892-18d4-4bb1-bb26-5650b1df7c8d,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:re
	lease,TS:1
X-CID-META: VersionHash:120426c,CLOUDID:85502685-cd9c-45f5-8134-710979e3df0e,B
	ulkID:230425140729SH5SYSXI,BulkQuantity:0,Recheck:0,SF:17|19|102,TC:nil,Co
	ntent:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 74a40b2ae32f11eda9a90f0bb45854f4-20230425
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 34882953; Tue, 25 Apr 2023 14:07:27 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 25 Apr 2023 14:07:26 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 25 Apr 2023 14:07:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcjUnrZJzHmFavtPoND26vfLSVbJavPTJ0Idn+8s2CEjOdS3M0fWIjf6uhlTTu6Dd6/vEMJ+pAcSE4N0HPERSdsxbSAC0N2ESxV+7mD4dNTLmioY6w8wPC1yyI6UxBskLvmQCT738FZBsFY+xTll8W53BOaNidrmFfmMwahwme9bRw6tyam7sCXIXvq3nPq7Nkvn1b29x5+/MT1TGbvsd6ZGZ0bvjOrVbmW/LC8zhLLEuCH7GahMeE36Npt3dX4LKWsH1wNqhxAQLBv69hpIf5x+7nDGrIkHQfcch6fQSXeLJcCTx9xJX8i10MK3y6wEKuLfUIMEMgEeiHobPUGeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TTJPPZv1baA1V8cJsxGBm4TznThVxYjDJkKk7vRLA0=;
 b=JET8rg1SQV2lEP/5eeCBKOJBrEsyg2TiFPPE6eFC93hYd0f9xh2Bnj459PtowiKkOuQd91E6OP7J89DA9YygLnah27lx9sNfuPnIjCDdHy0lsHhz92wM25EwvkWSr/vjswLFooivo8wTQ6ztOTLb1Yb1YSq4qqU6XSkGD+9oa1YywARSz1/+PM+ppNs3pxizzBgFvowjiWzciKwyVmeiDjYJSeFYS1FFog8psm9o3BTQWnBYIKyfGUJc5f6UNCEYlCqKPBif3FXUTs0R7foUu9MvpKsJq0l96V6k7/D55tKUJW4LWrg4O+jDoR2ddqThru8Rzdbce39av/qylUTvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TTJPPZv1baA1V8cJsxGBm4TznThVxYjDJkKk7vRLA0=;
 b=gdM7r4OgYVQyEbXaDOqiae9ezeu4Puv+bBYhtOIijyrmox3xShPM3KIKVZWyOHM3T+f3yYqtqymdA3TLg0A2uFK5hLNFbXi1Am4NR/yqGA8l9/+h3P3XG3KM1+nCCJm5RyzeaeaZ10BgmfQBfpT4N5T5aR/IzaGTqU7EF71sx8Q=
Received: from SG2PR03MB3081.apcprd03.prod.outlook.com (2603:1096:4:11::13) by
 SEYPR03MB6580.apcprd03.prod.outlook.com (2603:1096:101:85::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Tue, 25 Apr 2023 06:04:35 +0000
Received: from SG2PR03MB3081.apcprd03.prod.outlook.com
 ([fe80::489:7f0a:661b:c8f1]) by SG2PR03MB3081.apcprd03.prod.outlook.com
 ([fe80::489:7f0a:661b:c8f1%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 06:04:34 +0000
From: =?utf-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [PATCH v3] openssl: set package level PERL5LIB
Thread-Topic: [PATCH v3] openssl: set package level PERL5LIB
Thread-Index: AQHZdAK+7Y/RMfKlGkicSbJ92rhJkK87j5gA
Date: Tue, 25 Apr 2023 06:04:34 +0000
Message-ID: <380e6b364ca282645ec2e5102e1550767f8966d0.camel@mediatek.com>
References: <20230421033801.28653-1-yang.xu@mediatek.com>
In-Reply-To: <20230421033801.28653-1-yang.xu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB3081:EE_|SEYPR03MB6580:EE_
x-ms-office365-filtering-correlation-id: a0d05c2a-6f5c-46bb-a7f4-08db4552f1bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8pnxqlkbY2eOZmXytpis0UsA5jxn63vgeVNowzFovkbtylSGcQffTnU6iCEOmliPsu6ND+98me/A+g4L0bCMxzQYETw06A9E8vGyccunnhBGIKF8ABTCRH3MbwPGFjZ7FVewAkaUfrhzxVFhl7F2WvX/4mNX3ORsDK7qsQ0pOp2Hx3nXRDo9FPiJvC0cf7nHPIAAJ/8lUHxlulAbWJAwrzjV2f9/U4M1ZAYTYUPATB0son7D8asVLq24MGSjyZ6Ngu57MrDDVQXi3XtKmxj6oprXfc+w8PKaFeTq1X8RXMSjH2x1xA7OJFiiXE1AQK5W0uX57g0iILyOrbkmf9yDSyuU3IzXr/9TsFrHxb5YMehjgS9fQaDj8bRaxyo26zohHCshP0kwsZKvNIkA5dh9lEZZ4v5cU5HTQ7+PcoedLZuV0f16KgnB+yslTlMisaa9/XBpyCUmhrfZaoENdcSXp6/gfHuYdYmfqkOOENAxIYK5y0m7ds1+AX7KZmQakA32yEX3H/9pTgS5LXwwD3AnI4ZLClmiY0riCBUpIkZg3kP8Y2uBkWhsKqHc+ua2MADHaORCvcPntC4sztVB/K14UmZyK+hvWtcz6Adn21dAPCm7ThVEOS3Affxfb29DPVROjfacDYDDfLsN4imMQ8bQQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB3081.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(8676002)(8936002)(5660300002)(6486002)(71200400001)(38100700002)(76116006)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(122000001)(478600001)(41300700001)(36756003)(2616005)(85182001)(26005)(6512007)(6506007)(2906002)(186003)(86362001)(83380400001)(6916009)(38070700005)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cExkL0xZSTlrZlU0Wm5oWXF1eXc3UWVHZ3h2TWhMSzRyb0YwOFV0NjViZFk1?=
 =?utf-8?B?T0ZmZGMxVVMwUXN0V21hd2hEUmVWWG9admRuSWVpdTRlbDVRZnE5bG5UeGRU?=
 =?utf-8?B?dk5lVHV6cVQyaFc0N1dGQnAvazZNNmdwL09DczZzVTVOMDcrdGlYNUQwdHNC?=
 =?utf-8?B?clhXb1lEUjBsNUNJQXI1djJxRFpKSWljcmpGQmZWYldsU3h0aTBOdnBmUVNu?=
 =?utf-8?B?VzVWQ3VVQm1SUEJHT1BDMnNKanhlYk9MODcxeU9BZXAvSHpsUnF0WHEybzNN?=
 =?utf-8?B?d294TkdYelhMS2REUXhMOGxLc081SDJ2TGZ1ZGdJRGFMQXZFQWFaVXVQUlpY?=
 =?utf-8?B?Smc1bEpDeU9mVndhU091dWJGc0dKYi9zdnhoTEVya3h2bDNKZHJkYTlXMWpV?=
 =?utf-8?B?ZTJpeVNVU24xTUh1ekRUTjRtL2pSenM5SDRSUitvWEFGZDhDL1FvbXZQSjQ3?=
 =?utf-8?B?cXpkcW11WHNCS0JyN0hSNk9SbjQza3g2RnNZcXU2N1NBWE8xdjFDTGhJUDVL?=
 =?utf-8?B?bUNpanIrLytQRUd5bUc2MW04T3c1Zk1LYzFaS1pqb2hUSkx0TVhKaWFEZWpv?=
 =?utf-8?B?UHAwQUV4UW9WMEJDaTE4OVhXZGZpTmtXbzVjUXh6MWNTYzhBdCtDdS9tL2JM?=
 =?utf-8?B?VGdPV3NGWS9wRVl5QTdTY1RMWWh3MWNsc3gwNXJDbEVDOXZVY2xwcEtYam9Z?=
 =?utf-8?B?bld2MzFyN2YyWVRZUDE5OXhPeHQ5VWZuNll5SjAwRUhzV1pkYkE0WXRRYWZ3?=
 =?utf-8?B?VVFjc1lISCtRQWdtME5MR2g3NG8yck9HLzVrN252OG1tc2ZIQ1JhME4wT0tz?=
 =?utf-8?B?bHNnS1BDVGRBYWFOUXpoTHBwMWNWanZ3VDVuNHlTdzE2V3YzTWZYK0JQUFZ2?=
 =?utf-8?B?MktjeGJjTElJNE02QzJSZ2lYK1A2NmFNeGc0WWdsWlhVRVZSU0xURmlUUHdJ?=
 =?utf-8?B?MVB6bjlVclNjdE4zZ25uTExubDBJaVRoK3dTSnZ4QlFZTTlZYkRGclJUOFI4?=
 =?utf-8?B?MU5EZFB1WWM4bHdmUzg5bVNTcVVvKytRMVZ4Z0FNbTNYWGZsYVpwRnRyanZz?=
 =?utf-8?B?L2xpc3NjMnFXVk5aYzBGTndmcE04VGF5dy9LMk55MDg5S1hQMitjWS9DRDdC?=
 =?utf-8?B?eXRGN1RoSzluTno3OU9STDVwTm5GS3lvU2prelcyV2dnaFlQbGR3VlJRdnpu?=
 =?utf-8?B?VDg4VlRxY1NjcFo4T3B2M3FTQXhHZTdROXB2d3ZoZFdHbkNyNWNpYzgvQlZp?=
 =?utf-8?B?REZBTXlYQVhHVVRFQWhmSnhBWkM4NGRIeThUZ2prRFhPZFBINmFCZ2xrY3Mx?=
 =?utf-8?B?VjljcndGTWdBUkI4YmtmNER1ajRCL0xpVU1IbEUvWU1zZ0lhdHFIS3I2SVhS?=
 =?utf-8?B?bjJ0aitra3hwNnFOM1hPRlZrT0k4azBPZitIWHdHT2hlamE1d2FCeHkzZVlv?=
 =?utf-8?B?QVVVcUFNc2RrR1JhSTk5dXkxN0VIUEtKRWhnQ1lYSDJPU3NZT2ZVSm1CS2tC?=
 =?utf-8?B?SEhxcy9SdGRsVndIVk9IOGtMc2ltVnpNa0JIVEo1NCtXWVhkMVNjbWk4YkpL?=
 =?utf-8?B?QXNXMlV1NjNlZFNoVktkSzZpdU9UazQzT2N3VEhpZ1RyRUk2M3AvN1ZtTGhQ?=
 =?utf-8?B?QzlXd2plSDNwb1NwVStyZFZBbVFnSCtQZ2xvUTQ1QXVvRGwwVHpvR2liMmJM?=
 =?utf-8?B?ZHVVMDQyK3g4d3hESFJXZ2p4T1RTRXJ6TnRwZWxGTmx6MnFtL1hJNUdPVStK?=
 =?utf-8?B?czdpT2s1eFdDWDVDWmFSM253SlIyVE9Kb1pTcnNmc04zamtvcWlVSFJ1S0Zx?=
 =?utf-8?B?V003bmczZk93dHI1enlRdFNRMSs2TXUyY1l1cXdUdVFvNzBROWRuVk1nZmov?=
 =?utf-8?B?Q1dteUgzbk5RY3o5MUw0ZDZKVTBGUEdVd0Z2djJHZWovY2RhakdaNmQ3cUQw?=
 =?utf-8?B?RUthaTRPdDVHbi8rZzRwRGNLMmMrRklIOUhKUHRGZlZkRmh3K1NwMVFBNzhU?=
 =?utf-8?B?dzNERVJiOUwxSmFwM3FRSWZlblZsWmxVemJVMVJYc2tleEZZZlprUitzWm85?=
 =?utf-8?B?UEpMNDdGcHQvcWcxeXdiL3BxWEJuZE9RTEJsSDI2SlVTNXB3UWZTazBYbkk2?=
 =?utf-8?B?RkNVamtiVE9PcnhGbEdQNHAxRDhobEcrQVdXKzRwOFcrYTVwaVBBT2tUVVEr?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4ECF8FA10BD65744A98CAF32BD8EEE8C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB3081.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d05c2a-6f5c-46bb-a7f4-08db4552f1bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 06:04:34.7755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hFg837mxEyJkj8jj9X2DDt5MvMI9Dx2bCF0VieoNyOYME7mwKNZK2sN7qJiWrWG5J5D8jinW+qBdsJUxNDgwlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6580
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180374

RGVhciBTaXJzLA0KDQpTb3JyeSwgcGxlYXNlIE5PVCBhY2NlcHQgdGhpcyBwYXRjaCBiZWNhdXNl
IEkgZm91bmQgaXQgd2lsbCBicmVhayBpdHMNCm93biBzc3RhdGUgY2FjaGUuDQoNCkkgd2lsbCBm
b3VuZCBvdGhlciBzb2x1dGlvbiBmb3IgdGhpcyBvcGVuc3NsL3BlcmwgY28td29yayBpc3N1ZS4N
Cg0KT24gRnJpLCAyMDIzLTA0LTIxIGF0IDAzOjM4ICswMDAwLCB5YW5nLnh1QG1lZGlhdGVrLmNv
bSB3cm90ZToNCj4gRnJvbTogWWFuZyBYdSA8eWFuZy54dUBtZWRpYXRlay5jb20+DQo+IA0KPiBC
dWlsZCBvcGVuc3NsIHdpdGggc2hhcmVkIHN0YXRlIGNhY2hlIG1heSBtZWV0IHByb2JsZW0gdW5k
ZXIgYmVsb3cNCj4gY29uZGl0aW9uczoNCj4gMS4gc3N0YXRlIGNhY2hlIGdlbmVyYXRlZCBieSBh
bm90aGVyIHVzZXIgb24gc2FtZSBtYWNoaW5lDQo+IDIuIGluYXBwcm9wcmlhdGUgUEVSTDVMSUIg
c2V0dGluZw0KPiAzLiBvcGVuc3NsIGJ1aWxkIGZyb20gc2NyYXRjaCBidXQgcGVybCB1c2luZyBj
YWNoZQ0KPiANCj4gV2hlbiBidWlsZCBvcGVuc3NsIGZyb20gc2NyYXRjaCB3aXRoIHBlcmwgdXNp
bmcgY2FjaGUsIGl0IHdpbGwgYmUNCj4gYWJvcnRlZCBhdCBkb19jb25maWd1cmUgc3RhZ2UsDQo+
IGVycm9yIG1lc3NhZ2UgaXMgbGlrZSAiQ2FuJ3QgbG9jYXRlIFRleHQvVGVtcGxhdGUucG0gYXQN
Cj4gL2hvbWUvQS9bYnVpbGQgcGF0aF0vW3BlcmwgbW9kdWxlIHBhdGhdL1RleHQvVGVtcGxhdGUu
cG0gOiBQZXJtaXNzaW9uDQo+IERlbmllZCIuDQo+IA0KPiBUaGUgc2ltcGxpZmllZCBlbnZpcm9u
bWVudCBhbmQgc2NlbmFyaW9zIGlzOg0KPiAxKSBVc2VyIEEsIGhpcyBob21lIGRpcmVjdG9yeSBp
cyAvaG9tZS9BLCBnZW5lcmF0ZSBvbmUgc3N0YXRlIGNhY2hlDQo+IHVuZGVyIC9ob21lL0EuDQo+
IDIpIFRoaXMgc3N0YXRlIGNhY2hlIG1vdmVkIHRvIC9ob21lL1B1YmxpYywgYWN0IGFzIHNoYXJl
ZCBzc3RhdGUNCj4gY2FjaGUNCj4gMykgVXNlciBCLCBoaXMgaG9tZSBkaXJlY3RvcnkgaXMgL2hv
bWUvQiwgdXNpbmcgc3N0YXRlIGNhY2hlIGluDQo+IC9ob21lL1B1YmxpYyBhbmQgYnVpbGQgeW9j
dG8uDQo+IDQpIFVzZXIgQiBoYXMgbm8gcGVybWlzc2lvbiB0byBhY2Nlc3MgL2hvbWUvQS4NCj4g
DQo+IFNvbWUgaW5mb3JtYXRpb24gYWJvdXQgcGVybCBiZWhhdmlvcjoNCj4gMS4gcGVybCB3aWxs
IGhhcmRjb2RlIGJ1aWxkdGltZSBwYXRoIGluIEBJTkMgaW4gYmluYXJ5IChtb2R1bGUgc2VhcmNo
DQo+IGRpcmVjdG9yaWVzKQ0KPiAyLiB3aGVuICJ1c2UgTU9EVUxFIiwgcGVybCB3aWxsIHNlYXJj
aCBASU5DIGZyb20gYmVnaW4gdG8gZW5kIHVudGlsDQo+IGl0IGZvdW5kIE1PRFVMRS4NCj4gMy4g
d2hlbiBwZXJsIHNlYXJjaCBtb2R1bGUgdGhyb3VnaCBkaXJlY3RvcmllcyBpbiBASU5DDQo+ICAg
ICAgMy4xIGlmIFtkaXJlY3RvcnldL01PRFVMRS5wbSBpcyBub3QgZXhpc3QsIHNlYXJjaCBpbiBu
ZXh0DQo+IGRpcmVjdG9yeSBpbiBASU5DLg0KPiAgICAgIDMuMiBpZiBbZGlyZWN0b3J5XS9NT0RV
TEUucG0gaGFzIG5vIHBlcm1pc3Npb24gdG8gYWNjZXNzLCBwZXJsDQo+IHdpbGwgQUJPUlQuDQo+
IA0KPiBXaGlsZSBidWlsZCBvcGVuc3NsIGZyb20gZnJvbSBzY3JhdGNoIHdpdGggcGVybCB1c2lu
ZyBjYWNoZSwgQElOQw0KPiBkaXJlY3Rvcnkgb3JkZXIgaXM6DQo+IDEuPFBFUkw1TElCPg0KPiAy
LjxkZWZhdWx0IG1vZHVsZSBwYXRoIGluICR7V09SS0RJUn0vcmVjaXBlLXN5c3Jvb3QtbmF0aXZl
Pg0KPiAzLjxoYXJkY29kZSBtb2R1bGUgcGF0aCBpbiBiaW5hcnksIHdoaWNoIGluY2x1ZGUgL2hv
bWUvQS9YWFgvWVlZPg0KPiA0Ljxtb2R1bGUgZm91bmQgYnkgRmluZEJpbiwgbW9kdWxlIFRleHQt
VGVtcGxhdGUgY2FuIGJlIGZvdW5kIGJ5IGl0Pg0KPiANCj4gV2l0aG91dCBhcHByb3ByaWF0ZSBQ
RVJMNUxJQiBzZXR0aW5nLCBwZXJsIGNhbid0IGZpbmQNCj4gVGV4dC9UZW1wbGF0ZS5wbSBpbg0K
PiA8UEVSTDVMSUI+LCBhbmQgaXQgYWxzbyBjYW4ndCBmaW5kIGl0IGluIDxkZWZhdWx0IG1vZHVs
ZSBwYXRoPi4NCj4gDQo+IFRoZW4gcGVybCBzZWFyY2ggVGV4dC9UZW1wbGF0ZS5wbSBpbiA8aGFy
ZGNvZGUgbW9kdWxlIHBhdGggaW4NCj4gYmluYXJ5PiwNCj4gKmlmIC9ob21lL0EgaXMgbm90IGV4
aXN0ZWQsIHBlcmwgd2lsbCBzZWFyY2ggaW4gPG1vZHVsZSBmb3VuZCBieQ0KPiBGaW5kQmluPiBh
bmQgZm91bmQgVGV4dC9UZW1wbGF0ZS5wbSBmaW5hbGx5LiAoT0sgY2FzZSkNCj4gKmlmIC9ob21l
L0EgaXMgZXhpc3RlZCBidXQgaGFzIG5vIHBlcm1pc3Npb24gYWNjZXNzLCBwZXJsIHdpbGwgQUJP
UlQNCj4gaW1tZWRpYXRlbHkuIChORyBjYXNlKQ0KPiANCj4gU28gdGhpcyBwYXRjaCBkb2VzIHNv
bWUgZml4dXAgZm9yIE5HIGNhc2U6DQo+IDEpIHNldCBhcHByb3ByaWF0ZSBQRVJMNUxJQiB0byBt
YWtlIHBlcmwgY2FuIGZvdW5kIFRleHQvVGVtcGFsdGUucG0NCj4gYXQgaGlnaGVzdCBwcmlvcml0
eSBmb2xkZXIgPFBFUkw1TElCPi4NCj4gMikgYWRkIG90aGVyIHBlcmwgbW9kdWxlIGRpcmVjdG9y
aWVzIG5lZWRlZCBieSBvcGVuc3NsIGJ1aWxkIGluDQo+IFBFUkw1TElCDQo+IDMpIHNldCBQRVJM
NUxJQiBhcyBwYWNrYWdlIGVudmlyb25tZW50IHZhcmlhYmxlDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBZYW5nIFh1IDx5YW5nLnh1QG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8zLjEuMC5iYiB8IDYgKysrKystDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMy4xLjAuYmIN
Cj4gYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8zLjEuMC5iYg0K
PiBpbmRleCBiMzE5YzY2MDQ0Li42MTM0NTFmMjY1IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8zLjEuMC5iYg0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8zLjEuMC5iYg0KPiBAQCAtNTQsNiAr
NTQsMTAgQEAgQ0ZMQUdTOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiDQo+IC1ET1BFTlNTTERJ
Uj0vbm90L2J1aWx0aW4gLURFTkdJTkVTRElSPS9ub3QvYnUNCj4gICMgVGhlIGRlZmF1bHQgaXMg
dG8gdHJ1c3QgdXBzdHJlYW0gY2hvaWNlcy4NCj4gIERFUFJFQ0FURURfQ1JZUFRPX0ZMQUdTID89
ICIiDQo+ICANCj4gKyMgU2V0IHBhY2thZ2UgbGV2ZWwgUEVSTDVMSUINCj4gK1BFUkw1TElCID0g
IiR7U30vZXh0ZXJuYWwvcGVybC9UZXh0LVRlbXBsYXRlLQ0KPiAxLjU2L2xpYi86JHtTfS9jcnlw
dG8vcGVybGFzbSINCj4gK2V4cG9ydCBQRVJMNUxJQg0KPiArDQo+ICBkb19jb25maWd1cmUgKCkg
ew0KPiAgCSMgV2hlbiB3ZSB1cGdyYWRlIGdsaWJjIGJ1dCBub3QgdW5pbmF0aXZlIHdlIHNlZSBv
YnR1c2UNCj4gZmFpbHVyZXMgaW4gb3BlbnNzbC4gTWFrZQ0KPiAgCSMgdGhlIGlzc3VlIHJlYWxs
eSBjbGVhciB0aGF0IHBlcmwgaXNuJ3QgZnVuY3Rpb25hbCBkdWUgdG8NCj4gc3ltYm9sIG1pc21h
dGNoIGlzc3Vlcy4NCj4gQEAgLTEzOCw3ICsxNDIsNyBAQCBkb19jb25maWd1cmUgKCkgew0KPiAg
CWZpDQo+ICAJIyBXQVJOSU5HOiBkbyBub3Qgc2V0IGNvbXBpbGVyL2xpbmtlciBmbGFncyAoLUkv
LUQgZXRjLikgaW4NCj4gRVhUUkFfT0VDT05GLCBhcyB0aGV5IHdpbGwgZnVsbHkgcmVwbGFjZSB0
aGUNCj4gIAkjIGVudmlyb25tZW50IHZhcmlhYmxlcyBzZXQgYnkgYml0YmFrZS4gQWRqdXN0IHRo
ZSBlbnZpcm9ubWVudA0KPiB2YXJpYWJsZXMgaW5zdGVhZC4NCj4gLQlIQVNIQkFOR1BFUkw9Ii91
c3IvYmluL2VudiBwZXJsIiBQRVJMPXBlcmwNCj4gUEVSTDVMSUI9IiR7U30vZXh0ZXJuYWwvcGVy
bC9UZXh0LVRlbXBsYXRlLTEuNDYvbGliLyIgXA0KPiArCUhBU0hCQU5HUEVSTD0iL3Vzci9iaW4v
ZW52IHBlcmwiIFBFUkw9cGVybCBcDQo+ICAJcGVybCAke1N9L0NvbmZpZ3VyZSAke0VYVFJBX09F
Q09ORn0gJHtQQUNLQUdFQ09ORklHX0NPTkZBUkdTfQ0KPiAke0RFUFJFQ0FURURfQ1JZUFRPX0ZM
QUdTfSAtLXByZWZpeD0kdXNlcHJlZml4IC0tDQo+IG9wZW5zc2xkaXI9JHtsaWJkaXJ9L3NzbC0z
IC0tbGliZGlyPSR7bGliZGlyfSAkdGFyZ2V0DQo+ICAJcGVybCAke0J9L2NvbmZpZ2RhdGEucG0g
LS1kdW1wDQo+ICB9DQo=

