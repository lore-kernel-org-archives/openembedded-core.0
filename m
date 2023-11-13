Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E7AC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 17:34:29 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web10.1489.1699896859451056150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 09:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qJAGwkx9;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qJAGwkx9;
 spf=pass (domain: arm.com, ip: 40.107.8.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AA9erlTmEgoEu9mds4Dx7U5m99QXEBKhcJ5+8dNr5JhvZG0jxdDArFxJXuOd+hCcThzzqcbtmYHTOKOK1uHFPDKnCTHNQ0ww67QFsbHnshKrOnS9NYxa/xeGPdQ3XVYUt25eIncpJXkjJc8KZ2uIccVqB7SNVvSmlPYsm3f0YO3LnzyhroeJHBdebnfTg/pMuhDbdguZMIaz3XpFGZGRIW7l3RT+888XzOOSVLoR5syI4nSP9yTaI9STOFJPvvY/+yDUupR6q7tvfSyGSyq7D9iUDF8v7ZwRScra+qgV4C1MLbpFe7rtwAAzEKbY8EXN7siHFEBQO8DEsanzRtnRUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53EqVUQ/GhcnkUAQUuEoHYtNeiZKOfLlsGho2HDCvJY=;
 b=UyTENRwRaVDFHmaU2+AIYetawdhpOyxGjVtJcUZloXmZXB8ZCt9C8zJY0Ribv1pdilcXcUb7aNwP0ztv1py9FOEGgkQDsveW6CmDxzpKYkXc6KcoSkDJ3PECvz5kooVNE3KTcTSJhb6F2IN0Ipzjo7WBGE+lvOBDbTjlUsIQM9xsFVEVOOCUv4o9CqgC+zQDiuSr+p+YmlGrS4KAPP0lX7SDZBb0Ao/SEW1dp/qlQQPf+SSqphiIGHcvz3Cg9iqLpdPunZnylRW6mPNToDwvJx64UcBH+gRy1JudrNwEoxcRtGWgUEgXbWf2T2bZ6Sndz62eIHxrOUZI/qrRkKjCVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53EqVUQ/GhcnkUAQUuEoHYtNeiZKOfLlsGho2HDCvJY=;
 b=qJAGwkx9Wr96nToJ7CtXsnubOpOB2CL538eVQZ68VZ+HwzLxgrskFSJfqH45e8M8BKjqzQLJVBhTYzK6JPJq72B+bYiD91FUwHvQQQSTTSGjhAQrphBuxtNCFVUwb+wDvoQt3GxDMgY9KDOCq/jfsF3EaciHJRayW+TuRLmLydU=
Received: from AM4PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:205::37) by
 VE1PR08MB5582.eurprd08.prod.outlook.com (2603:10a6:800:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 17:34:15 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:205:0:cafe::f1) by AM4PR05CA0024.outlook.office365.com
 (2603:10a6:205::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28 via Frontend
 Transport; Mon, 13 Nov 2023 17:34:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 17:34:14 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Mon, 13 Nov 2023 17:34:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11034dcfe31d6419
X-CR-MTA-TID: 64aa7808
Received: from 8e9446511f08.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 74AA8CA8-35D9-4F24-85ED-6182856A63CA.1;
	Mon, 13 Nov 2023 17:34:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e9446511f08.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Nov 2023 17:34:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuNx6zLvxk8ekYJJxBCxVho6Qm+/DRvo9h36b0t/LpqxYXcCZnqFUtMaf/rm+vJn19GsbYdW7CBQCfS4B12CnpWEzmfiHfkP78VYApxBmv0+iKsED6ucVeDVRVQ3tjaGioX3/3Fa4Fjc+0+lk87gK6CPCAIxAjIKWU55KB3mfUfvRtPBrL40LS6nHlKuXi0paLbtMYl79XQ6HN+NcBZYwqWcBxzo8kj9YZ598YU+wbjA7jOUfFg1Yog3zO0fOoHOpt2DsmaC08n4/4C/X1o6dPX98nxMC/G14o/BLOWlfmDQ3AGjFVPwDtchsRGDyGMtgz5SVzLn2sn5gsiOdKCR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53EqVUQ/GhcnkUAQUuEoHYtNeiZKOfLlsGho2HDCvJY=;
 b=iKPLyvEe5oUxZc98/u0MfyPDg+EzeQHlLvr4X4GA8X0WwRmqmQicnAd1TXwvG1Rwdo/Rfz5woVzNbMMxV1r2U6QXgVTo6oio5ggPPhzagLSePG3V/Xi9OfO+FenYhEcJk/v/QezIFNIYZkSbhMcIxWvsonTvEsTeHxiMh+mO7vpQFgRJc6OWK0b4ptNpnDP+FyI18aVUh9L5NuIl8EGyDvbhuV5wAfLfB+dHZZmBt/N1JkbYikDWhqGV99Yo3GQCMA8uPQfM9L7eYumW9x22wYARXBJfKmHJYRdUAXphz1nwSw2ZsM/bV6nyeoPF1JTrW4hWPAEfHoxvZtnNOHz7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53EqVUQ/GhcnkUAQUuEoHYtNeiZKOfLlsGho2HDCvJY=;
 b=qJAGwkx9Wr96nToJ7CtXsnubOpOB2CL538eVQZ68VZ+HwzLxgrskFSJfqH45e8M8BKjqzQLJVBhTYzK6JPJq72B+bYiD91FUwHvQQQSTTSGjhAQrphBuxtNCFVUwb+wDvoQt3GxDMgY9KDOCq/jfsF3EaciHJRayW+TuRLmLydU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8624.eurprd08.prod.outlook.com (2603:10a6:20b:55f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 17:34:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 17:34:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "xiangyu.chen@eng.windriver.com" <xiangyu.chen@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH] openssh: add systemd readiness notification
 support
Thread-Topic: [OE-Core][PATCH] openssh: add systemd readiness notification
 support
Thread-Index: AQHaFIVYPridlyrtoEaKzFUkGlv1oLB4hh0A
Date: Mon, 13 Nov 2023 17:34:07 +0000
Message-ID: <9E7E1A0C-DC06-4E14-8462-4C972FC905D0@arm.com>
References: <20231111103028.2896744-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20231111103028.2896744-1-xiangyu.chen@eng.windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8624:EE_|AMS0EPF000001B3:EE_|VE1PR08MB5582:EE_
X-MS-Office365-Filtering-Correlation-Id: 7280dca7-9858-4861-e3f5-08dbe46ec19e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PbYMlj8e25JMUdar3ZZRo/KgKDZMpD/4kAVV3C6zoW9nRh5jGXbJWFswKWL7Ue5GreHRTNhO+7H6BhjuRmds3l3kIYLaQAsheOxmeKLgV6zGT1V7HH7SATAZ2J0XXqRZBt8BEIPHUMLafyGlxIuur3Vjl87yhP4tIk4JoDa7Z4hExn9KUrT1XvtHjZx/lFQh0V+JHt69VJ4wh8XYe3Kp57p+KcvN9UQHTsEj3Wbyeucgx3GsYKgWZHZNsVH345VPkTowBK+RYF0xnK5wIz22Ptzs3MWqTVfzoBkYNt9ACc+cTTtfNPHVfddD6KdXRAqPUtUGrYZeFXSXXNlfOmqY8BLFduiQCCM1uzJNQGjkeFONzuc0e3h6vPsyYbCsGy9ZrWXTaEDxihoYXl4SJI+5X3hWIEaKy6C1bLXXS75nUB1nk5RgkOUPs5hcvyoHljpBypO9L000k49dJXlrHOolChAJqLLw0mnslsrkYM57C6CsQsMphqlPr+6MthWZzWcsbWXwfPRt93/JgqQK70280MRgO+HpZchHJGktj7Cc2ZirgdFihz34WqIfwHSDZAugCtXuK17355Iuv1hHxFXVdXCtFvhgkcefK9it7MDruDDybzFXSLM+uHsRpilFZAVp1KYO3MqCZE15PBXEYSzGjw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(4326008)(8936002)(8676002)(122000001)(38100700002)(66946007)(91956017)(71200400001)(6506007)(76116006)(64756008)(66446008)(53546011)(66556008)(66476007)(478600001)(966005)(6486002)(26005)(6512007)(316002)(6916009)(2616005)(33656002)(36756003)(5660300002)(86362001)(4744005)(2906002)(41300700001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <660183FDB6CBCF40AF32BFD15470BCAE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8624
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	126975f9-a3a1-476d-1da8-08dbe46ebd1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rn1bq6J8D80dpMJIwnP3a8O6mKugIWa5lZS9J6n64nxTvoHGCvrns7QES77EQ32FuHN+Y4bWOGGEFXg0npP1tDIHIzn2iAijTCcs+rsVfuSUgB4B5S1NLCmTiYtssYjHXmmia/96vl0b5t/rKFAFNvPlHwg7khP/dskAVFTy441oMtwMU/UQhJ/FS/sGmGuKpkWxhAsxc7kzRwu2eDxRJScVcHCdSqc1kM5wCb1U21YHecq5sI8KQrSbO6fzg0DNMp5zt+pTdgu8pSuI0AhpbvrQtvjZ6qI+r/Ek9DGtmsISKOo0fHg+csFp+2zVQp0MPziDruwgwuXZM24R5RxK6KsvaIhlkeRbM+ubqsR1JYYd7dil5S1BFwlfdrQRU0kWGrQ+4rvEzlG8mxnVIQJg5OkvFMHhYpXS3tn4uUKCJTbJdMbCMLTmlPdhFZLXSrHQm9nTba+uEWhxsiK9HLocYMcjxfmbo4dTSwKbeLiF3MCff55PqBjgu8cEzuuJOQjip64PfkofcCRwyBmBZ7onV4BIsG8HLF5dDoEz8fIMb0TFbtbmW9yVEjcys7KMf7I+CGrysXbeqUMaEqU2NodnaJlHINWQVOa92uh4RoBB/9dyesA643y49OjQhe07AlDLrEg0O8ayHeBp2sNaUYDpKCyCzajt5/DIxCz/5Bl7f5Bm/JtiNwO7pAj3/wO1rYFsZurj7cLZ34D441U9NgJABA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(36840700001)(46966006)(336012)(26005)(6506007)(2616005)(6512007)(36860700001)(47076005)(6862004)(5660300002)(8676002)(8936002)(41300700001)(4326008)(4744005)(2906002)(6486002)(966005)(478600001)(70206006)(70586007)(316002)(36756003)(86362001)(33656002)(82740400003)(356005)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 17:34:14.8539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7280dca7-9858-4861-e3f5-08dbe46ec19e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 17:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190482

T24gMTEgTm92IDIwMjMsIGF0IDEwOjMwLCBYaWFuZ3l1IENoZW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHhpYW5neXUuY2hlbj1lbmcud2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gVGFrZW4gYSBwYXRjaCBmcm9tIGRlYmFpblsxXSB0aGF0IGFmdGVy
IHNzaGQgbGlzdGVuaW5nIHBvcnQsIHVzaW5nIGEgc2lnbmFsIHRvIHRlbGwgc3lzdGVtZA0KPiBp
dCBpcyByZWFkeSBub3cuDQoNCkl04oCZcyBub3QgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJp
YXRlLCB0aGlzIGlzIHBlcmZlY3RseSBhY2NlcHRhYmxlIGZvciB1cHN0cmVhbS4NCg0KSW4gZmFj
dCBpdOKAmXMgYmVlbiBzdWJtaXR0ZWQgdXBzdHJlYW0gYWxyZWFkeSBhbmQgdGhlcmXigJlzIGEg
bmV3ZXIgaXRlcmF0aW9uIHRoYW4gdGhpcyBwYXRjaCBoYXM6DQoNCmh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuc3NoL29wZW5zc2gtcG9ydGFibGUvcHVsbC8zNzUvY29tbWl0cy9iZTE4NzQzNTkxMWNk
ZTZjYzNjZWY2OTgyYTUwODI2MTA3NGYxZTU2DQoNClBsZWFzZSB1c2UgdGhhdCBwYXRjaCBpbnN0
ZWFkLCBhbmQgc2V0IHRoZSBVcHN0cmVhbS1TdGF0dXMgdG8gc3VibWl0dGVkLg0KDQpSb3Nz

