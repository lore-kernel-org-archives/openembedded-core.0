Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D291C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 22:26:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.89])
 by mx.groups.io with SMTP id smtpd.web10.2288.1668119202679793736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 14:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MtA17tSS;
 spf=pass (domain: arm.com, ip: 40.107.7.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WNkDPnocq6ZkmNGiuPWB70I6IKN51hz/Qo7vS+L+iQWmohb7/XtXaoYgPT1GvLPKbTPX53dfMkvSrigmYrd9EanoSROaNTkA5Nc5wEh/6dHqEPywGuUXMxNj5u3My85tQRZtx/OxaqquqcDOXOpVbueG3uEhlOtEU8fj4tdF0WBX92OWxoFlFPeRphVyiwFoTxJKzSNfEcTq0r3VGLAPZXWbLQFAJE9ltZO1ZOZ25VjEF2Zs70GdH5h9Cbm9DbtuWv8LlhfRAT6biiTQVpkoO8MWR4VQ7LOVQvD/xmQ6wqG+xGA9toIUvyN4vim/TIIvY5mCPmYD7s12wRtrN0bwdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UcGUcJEC5KKaRF5nfZX+Rzz30MLnReufxcEznbD+Oc=;
 b=KsFhbH38NP3k2eWCxyUi1BsWNi5+HdkA/BxCpY/dfqvZHJMCwouIlmnxxCH+YDqMooFXqtdr9Nc/OFSABMjuLR8fwcMPSPEpdWrFpHtn8yx1N0ftGQYY/3QkZED7EfC+93toiBDKm0DXQelpxsvkpTORHBiMmofgrw9an251/bOQtV/7D68PYX8UzYuKFP7XAVjtTar8UbIRJXMPfZpuJKE+eTXlzWCTT8cWPLXkEEUteUizd42/yhRLFsw4wNQyPQm1J3jPiwVH0RbrxnvQGW1McuxOzSlKodUaFpSKCipgj+FiAI5Z54cllDsctgVYiXzFdQvWOwc4PrlGZxnDRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UcGUcJEC5KKaRF5nfZX+Rzz30MLnReufxcEznbD+Oc=;
 b=MtA17tSSjb05d2FqhZTcGFIw1rtV6HEN1kyXwYbT2X8lNBi+a1qiNyxsda/mCCWK7Y3HD2m4pLtnSUe23zVrX7DuTRDFyCR3srgRi9NbSAKgkJj1Df3HVEYCMv4INnBe2FebciNBWIZf+lVaecRRuY3ZH1fodjU/p+YiYiLbt6M=
Received: from DB8PR06CA0037.eurprd06.prod.outlook.com (2603:10a6:10:120::11)
 by GV2PR08MB8391.eurprd08.prod.outlook.com (2603:10a6:150:ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Thu, 10 Nov
 2022 22:26:37 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::e4) by DB8PR06CA0037.outlook.office365.com
 (2603:10a6:10:120::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Thu, 10 Nov 2022 22:26:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 22:26:37 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Thu, 10 Nov 2022 22:26:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a766370ace12419e
X-CR-MTA-TID: 64aa7808
Received: from a95b905e6923.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9727932F-21CB-403D-BD8F-7D47CCBD4B4E.1;
	Thu, 10 Nov 2022 22:26:30 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a95b905e6923.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Nov 2022 22:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mX8qJVI6rGhuaAM0JK52Qj03hCRpF2i4ordRuVcmvR65S9sM2Rl3/AyvuHs8p+LE93QzL1ludnnG2flC19cWu+GS11Jvq/wlnCTYHv3aDoJZ4qSmrbSurnVFp0y0JG1Grr7QQ7NzzQvNKeP34Z85UQ+KGPQEPzVupNRKQBYz/25VRwdU7sJhtY2V3xbzSa/kuk9VrSBY0apycEALqf24AoqL+i1EtA9ZGIgi1F6bYT6kNZ29Ofy/8TLAdFQJx+XXHPvUzFx2Hnf9zSRgWEUlAyXA8kt3pElib3mMP9JIGE37bQxXUcztdLWLSTqKxJOKvbF6YOxiMCTHC8KDI91+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UcGUcJEC5KKaRF5nfZX+Rzz30MLnReufxcEznbD+Oc=;
 b=EFx5FwzOLMI3cApd6EjdaX7pcttOi+WxWv1OohY9UAK0hag1BYYY0BMp+/+r/nc1leDPCNGCPS0+atc++zNrNP8l9Z2wEPw33PWoAOJMchFnVItdLvhaV/R9gTREb5KwCLVis1EgW7XfJYKTaKqYWtvYW90JMXS5M7EV9cGf4VG+IYbJHSdIS7RWQ8pA8k6ldGnRTArqzcTj0nZLHp04GJcgu7wykhe72tgKCDYSk6YeEXK9sib2oDLfbybvHzqQAWlfDZBJQ4MUzVDicrki63BZRTRgt/d1qef3TsPQ5trL9tIVOeGGsw9Vz0WCeot7hvtNb6w2lt0d0iDOmF0dtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UcGUcJEC5KKaRF5nfZX+Rzz30MLnReufxcEznbD+Oc=;
 b=MtA17tSSjb05d2FqhZTcGFIw1rtV6HEN1kyXwYbT2X8lNBi+a1qiNyxsda/mCCWK7Y3HD2m4pLtnSUe23zVrX7DuTRDFyCR3srgRi9NbSAKgkJj1Df3HVEYCMv4INnBe2FebciNBWIZf+lVaecRRuY3ZH1fodjU/p+YiYiLbt6M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9046.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Thu, 10 Nov
 2022 22:26:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%5]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 22:26:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "adhityax.siddartha.ravula@intel.com"
	<adhityax.siddartha.ravula@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pixman: backport fix for CVE-2022-44638
Thread-Topic: [OE-core] [PATCH] pixman: backport fix for CVE-2022-44638
Thread-Index: AQHY845NHU+kIombJEq/HyOE4i8+G644P5CAgACAOAA=
Date: Thu, 10 Nov 2022 22:26:26 +0000
Message-ID: <557B9C1D-EAFF-448F-8E3C-B52F99F8AC7E@arm.com>
References: <20221108162148.29550-1-adhityax.siddartha.ravula@intel.com>
 <Y20O+Vc2Qjy6ugii@mail.local>
In-Reply-To: <Y20O+Vc2Qjy6ugii@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9046:EE_|DBAEUR03FT020:EE_|GV2PR08MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: feaf1ea8-a0b5-415b-54bf-08dac36aa19d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DfHY8L0ABO3jzKnwXRb5jiLGoDa7HUL4h+3QAhMTHG9zDS2PXMoWVEzi9yok2v3tMrDf9m9Nag8bnurxdXAmUfw0Y41pG24jgv+X7rybMnMcjn00IzRPNLZYNB2lw91yqlg764H+J8xgvmxyJR98g7W1ybanMz9clRtC/+Cw7SBGptTd8+h+c+gRZIA9PiTvfTnhGTaOOBL7TravrUtFDAhVcTiVtORC4D5TuG9D7yAr6BJM/2D4wwCglqSmd+PIB5Xg0pBn/CJ7wXFChJ/K+pxQClAXSpoLO9Fjs3/V3vkXFDbQEOHGY6PsR1y/dmrRNYl6k2S4z9iUM9yr9ji/9Mo0h65f3iiYq8esxC+WCj9X1f4dNRFiG7OGoHX8G4iasf/RiKvTIqKr1n+/LWKCida7j67X79VlyhwOKoUpUZflvyG8zuXiwMshl6MRoMlHG0VZekaX12NgkReUtARuU7/tS+9wQWyJ2tJ8o/81kBfUgCEDUoD+MohGt+FRYGTMv93dV/eYp5Bu/WulhW1RSooRyYlCewelHZQEqqK2xS8cPaJhNb5HR7IpV9Y+D58iahZOM03aHjgAG1HHn34e97FUtzwWLWBRR/Od+xKaF+KeEZxPJSqS46jTzrrqQI7esLucOP0x99utG2TJ8fnCct483I6p9izpZX55e0wh1sVxOWvKe9I11c78pzb+iWUE4Bkfi2lgbXDye9stwwg0sqoH1SUlgNcwYWlsbo851T8k84ToM2XsZIy8XoXKD60iXndcY+XpgNrhCHx97Cght2wnBQjY3a0gOrdal/9VPFaljbk8geH28G7k1i8yOX4c
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199015)(64756008)(76116006)(4326008)(8676002)(66446008)(66556008)(33656002)(41300700001)(91956017)(478600001)(2906002)(5660300002)(316002)(83380400001)(6486002)(38070700005)(26005)(966005)(71200400001)(66476007)(122000001)(6506007)(86362001)(53546011)(38100700002)(186003)(6512007)(2616005)(66946007)(54906003)(6916009)(66899015)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EE251CF5822434DA7ACDE6A58872F76@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9046
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47ab392b-9e04-4da9-cb33-08dac36a9b8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Fh3kvzGGZ2HNJDOu7e23wvOMej6vDsyEvWOWLSs+7Wbg/xsp2ofN2AUQH1LpZfLQ0UijUP7S7mZoaEAmo6jrV/HpxMdD3nksutidpgk7fWTjAlX4e3EvyuNHnBU1wH+U5wIpSj4bj8aJ+E5FpLX1CbVGECLJ5VWp/K9ylopJaU8vrNJfN/s/i/x/+Kt2g+skmsBFK2LtrTodu60VLowwHshfmyb9QLzJGRBflZXcpJvD8ntB5lcU5iVTNSzcrOhUjp/9Q101jt0uq3w71kx4zo/jMwQ4NFdxghZsYPELlvp36I8m1dzPhpwkZxpMlO2WQSqPFVSL3caz3vIDe+ufFF3XBbOsw4afhSJO5/fZpUROwptzgLNgOi8PfU94jQCOBzqPVTU4Uf3tPIUY3Lf5UOhlV26qeEk/FvSNj3IliS1dTpCf6rhPX4XiSe89hv3x6lts3/2QjsSCdnWyR3BCSWddbrMw8yqjhpUstqoA/cZB+Xpv8yEJypTU23hHI3ju+mlklj9zQdF7sgrqs+vVZBWc3GYXMkGNE5pq3X0i6Hsa7jUUsopVG5mRj0RJRgZ1T/1TTPrSkfgMvOTKT3T67t6/T30iOFS3hsR3u34dlpZIThiQSn3R7LJRGvDSvIC46YagnwJ7nNCvJ3z4ssHoHbM75h/bwyjQZeYREvsKUr2SWi/+8tC0j/sxlS75AW69Gd/bzFFGoqjiLUFlZNm84sYInrTbtqiaxYqCq8Z/O2jdBwWOmm//fH3gnoMy17V6+VkpG+DS9h/W/33IQ18RzNHGrLcWcOtlMK8atIkPjY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(316002)(6512007)(70586007)(36860700001)(86362001)(54906003)(82740400003)(6862004)(6486002)(966005)(356005)(8936002)(41300700001)(2616005)(2906002)(26005)(47076005)(4326008)(83380400001)(186003)(8676002)(40460700003)(336012)(478600001)(6506007)(5660300002)(70206006)(81166007)(40480700001)(66899015)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 22:26:37.1738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feaf1ea8-a0b5-415b-54bf-08dac36aa19d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 22:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173112

Rm9yIG1hc3RlciBhbiB1cGdyYWRlIGhhcyBiZWVuIG1lcmdlZCwgd2UgZG9u4oCZdCBuZWVkIHRv
IHBhdGNoIGl0Lg0KDQpSb3NzDQoNCj4gT24gMTAgTm92IDIwMjIsIGF0IDE0OjQ3LCBBbGV4YW5k
cmUgQmVsbG9uaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8YWxleGFuZHJlLmJlbGxvbmk9
Ym9vdGxpbi5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBIZWxsbywN
Cj4gDQo+IE9uIDA4LzExLzIwMjIgMjE6NTE6NDgrMDUzMCwgYWRoaXR5YXguc2lkZGFydGhhLnJh
dnVsYUBpbnRlbC5jb20gd3JvdGU6DQo+PiBGcm9tOiBBZGhpdHlhIFNpZGRhcnRoYSA8YWRoaXR5
YXguc2lkZGFydGhhLnJhdnVsYUBpbnRlbC5jb20+DQo+PiANCj4+IFJlZmVyZW5jZSB0byB1cHN0
cmVhbSBwYXRjaDoNCj4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXhtYW4vcGl4
bWFuLy0vY29tbWl0L2ExZjg4ZTg0MmUwMjE2YTViNGRmMWFiMDIzY2FlYmUzM2MxMDEzOTUNCj4+
IA0KPiANCj4gWW91ciBtYWlsZXIgbWFuZ2xlZCB0aGUgd2hpdGVzcGFjZXMgYW5kIHRoZSBwYXRj
aCBkb2Vzbid0IGFwcGx5DQo+IHByb3Blcmx5Og0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3Rv
cHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzM3L2J1aWxkcy82MTQ1L3N0ZXBzLzExL2xv
Z3Mvc3RkaW8NCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBBZGhpdHlhIFNpZGRhcnRoYSA8YWRoaXR5
YXguc2lkZGFydGhhLnJhdnVsYUBpbnRlbC5jb20+DQo+PiAtLS0NCj4+IC4uLi94b3JnLWxpYi9w
aXhtYW4vQ1ZFLTIwMjItNDQ2MzgucGF0Y2ggICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysN
Cj4+IC4uLi94b3JnLWxpYi9waXhtYW5fMC40MC4wLmJiICAgICAgICAgICAgICAgICB8ICAxICsN
Cj4+IDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQ0KPj4gY3JlYXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9waXhtYW4vQ1ZFLTIwMjItNDQ2Mzgu
cGF0Y2gNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxp
Yi9waXhtYW4vQ1ZFLTIwMjItNDQ2MzgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1saWIvcGl4bWFuL0NWRS0yMDIyLTQ0NjM4LnBhdGNoDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uYWI1YWNhZjJlZQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4g
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3BpeG1hbi9DVkUtMjAyMi00NDYz
OC5wYXRjaA0KPj4gQEAgLTAsMCArMSwzNyBAQA0KPj4gK0Zyb20gYTFmODhlODQyZTAyMTZhNWI0
ZGYxYWIwMjNjYWViZTMzYzEwMTM5NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+ICtGcm9t
OiBNYXR0IFR1cm5lciA8bWF0dHN0ODhAZ21haWwuY29tPg0KPj4gK0RhdGU6IFdlZCwgMiBOb3Yg
MjAyMiAxMjowNzozMiAtMDQwMA0KPj4gK1N1YmplY3Q6IFtQQVRDSF0gQXZvaWQgaW50ZWdlciBv
dmVyZmxvdyBsZWFkaW5nIHRvIG91dC1vZi1ib3VuZHMgd3JpdGUNCj4+ICsNCj4+ICtVcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0DQo+PiArQ1ZFOiBDVkUtMjAyMi00NDYzOA0KPj4gKw0KPj4gK1Jl
ZmVyZW5jZSB0byB1cHN0cmVhbSBwYXRjaDoNCj4+ICtodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvcGl4bWFuL3BpeG1hbi8tL2NvbW1pdC9hMWY4OGU4NDJlMDIxNmE1YjRkZjFhYjAyM2Nh
ZWJlMzNjMTAxMzk1DQo+PiArDQo+PiArU2lnbmVkLW9mZi1ieTogUmF2dWxhIEFkaGl0eWFYIFNp
ZGRhcnRoYSA8YWRoaXR5YXguc2lkZGFydGhhLnJhdnVsYUBpbnRlbC5jb20+DQo+PiArDQo+PiAr
VGhhbmtzIHRvIE1hZGRpZSBTdG9uZSBhbmQgR29vZ2xlJ3MgUHJvamVjdCBaZXJvIGZvciBkaXNj
b3ZlcmluZyB0aGlzDQo+PiAraXNzdWUsIHByb3ZpZGluZyBhIHByb29mLW9mLWNvbmNlcHQsIGFu
ZCBhIGdyZWF0IGFuYWx5c2lzLg0KPj4gKw0KPj4gK0Nsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3BpeG1hbi9waXhtYW4vLS9pc3N1ZXMvNjMNCj4+ICstLS0NCj4+ICsgcGl4
bWFuL3BpeG1hbi10cmFwLmMgfCAyICstDQo+PiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPj4gKw0KPj4gK2RpZmYgLS1naXQgYS9waXhtYW4vcGl4bWFu
LXRyYXAuYyBiL3BpeG1hbi9waXhtYW4tdHJhcC5jDQo+PiAraW5kZXggOTE3NjZmZC4uNzU2MDQw
NSAxMDA2NDQNCj4+ICstLS0gYS9waXhtYW4vcGl4bWFuLXRyYXAuYw0KPj4gKysrKyBiL3BpeG1h
bi9waXhtYW4tdHJhcC5jDQo+PiArQEAgLTc0LDcgKzc0LDcgQEAgcGl4bWFuX3NhbXBsZV9mbG9v
cl95IChwaXhtYW5fZml4ZWRfdCB5LA0KPj4gKyANCj4+ICsgICAgIGlmIChmIDwgWV9GUkFDX0ZJ
UlNUIChuKSkNCj4+ICsgICAgIHsNCj4+ICstIGlmIChwaXhtYW5fZml4ZWRfdG9faW50IChpKSA9
PSAweDgwMDApDQo+PiArKyBpZiAocGl4bWFuX2ZpeGVkX3RvX2ludCAoaSkgPT0gMHhmZmZmODAw
MCkNCj4+ICsgew0KPj4gKyAgICBmID0gMDsgLyogc2F0dXJhdGUgKi8NCj4+ICsgfQ0KPj4gKy0t
IA0KPj4gK0dpdExhYg0KPj4gKw0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9waXhtYW5fMC40MC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
bGliL3BpeG1hbl8wLjQwLjAuYmINCj4+IGluZGV4IGNjZmUyNzc3NDYuLmM1NjczM2VlZmQgMTAw
NjQ0DQo+PiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvcGl4bWFuXzAuNDAu
MC5iYg0KPj4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3BpeG1hbl8wLjQw
LjAuYmINCj4+IEBAIC05LDYgKzksNyBAQCBERVBFTkRTID0gInpsaWIiDQo+PiANCj4+IFNSQ19V
UkkgPSAiaHR0cHM6Ly93d3cuY2Fpcm9ncmFwaGljcy5vcmcvcmVsZWFzZXMvJHtCUH0udGFyLmd6
IFwNCj4+ICAgICAgICAgICAgZmlsZTovLzAwMDEtQVJNLXFlbXUtcmVsYXRlZC13b3JrYXJvdW5k
cy1pbi1jcHUtZmVhdHVyZXMtZGV0ZWN0aS5wYXRjaCBcDQo+PiArICAgICAgICAgICBmaWxlOi8v
Q1ZFLTIwMjItNDQ2MzgucGF0Y2ggXA0KPj4gICAgICAgICAgICAiDQo+PiBTUkNfVVJJW21kNXN1
bV0gPSAiNzM4NThjMDg2MmRkOTg5NmZiNWY2MmFlMjY3MDg0YTQiDQo+PiBTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNmQyMDBkZWMzNzQwZDllYzRlYzhkMTE4MGUyNTc3OWMwMGJjNzQ5Zjk0Mjc4Yzhi
OTAyMWY1NTM0ZGIyMjNmYyINCj4+IC0tIA0KPj4gMi4xNy4xDQo+PiANCj4gDQo+PiANCj4+IA0K
Pj4gDQo+IA0KPiANCj4gLS0gDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09P
LCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0
cHM6Ly9ib290bGluLmNvbQ0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6
IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVw
bHkgT25saW5lICgjMTczMDc3KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzMwNzcNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTQ4ODY0NzQvNjg3NTg4OA0KPiBHcm91cCBPd25l
cjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+IA0KDQo=

