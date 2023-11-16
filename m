Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A40AC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 18:40:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web11.14573.1700159997503083852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 10:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uGWYWM7T;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uGWYWM7T;
 spf=pass (domain: arm.com, ip: 40.107.22.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aXup6xkKmp4TX+Q/3p+0dv3XsvCHYJBiMx2Xh6VyG4AxoGSOZQpsFCLgdKHJn735sPfiNmA385je46DwHtJF22WyB1sjgS5MDn88TZXpWMAzqrs5dKzCVi5S/VVJuliA+9ywZ/Uo2rUQMmI2uJiW54RzLVtcU18WdC5Q83KOAiQteAKwrw1HAdxNwg4sYcOQTXMW2hD2UjOcgAlGMxgwTRppgiRvbGr3Mw7afXZ7jCj8Kcg0LvQca9HiWlfQCk5UNcZoP4xhAw7LAD3fdsChc2+Nsfl8PT8BCf2uzFvLBnTonMOVQ6WYVhWsEgIvAWOYfuVstDMmNErihDfm7LGWog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA5rF9HM4ZY8sc4G7pfAyOyHopm/nndrEiWT+YL7IYg=;
 b=mBAC79+Poh6YzHiqkeR+Uyfo/vdRi8q3g4nfSeLNjwUFLY98Crvp6Ldl2PVCTG3txgsXRkZMFfm9vMOTjnH7TkWOSSkAVUED374I+YuZ+Mvo4TRi3rdBNY+9HzVcMR0HUnjge7AG4Lp5j6CfS4qEVMER8kRWSEvMoa0WIAyHx0YTtGkbO/XSK7caAklBvumXxNRF41KWR3W9+zteZFGpSy8QcAv4IxGE6gjBm/iPS11wEeFLzCW82A/6jmLo0af3WM+D+P3CK2Y+8Qtv1mWpHH+woc6lRQxiahsQQVkYo4kHXxM/SA7z8XR238kAavitsbg+iDBKI9+9+qnAgfuspA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA5rF9HM4ZY8sc4G7pfAyOyHopm/nndrEiWT+YL7IYg=;
 b=uGWYWM7ThFctw26FyaJITs+S93oJIQvrhvFxnoSupHIK9+KMS7o4eExm3WnX11kKSBqTvMeATtqiqgaepsGnA4+J3N16gTWKUe5/0M368WD83lpSlbRmiAyIqu4CNSkTEmVsK8HF1cmHur2P58G3/btDXRERdW6IjY+cBwBzYZk=
Received: from DUZPR01CA0301.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::18) by PAXPR08MB7525.eurprd08.prod.outlook.com
 (2603:10a6:102:24b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 18:39:53 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::37) by DUZPR01CA0301.outlook.office365.com
 (2603:10a6:10:4b7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 18:39:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 18:39:52 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Thu, 16 Nov 2023 18:39:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 362eea386bdad5bb
X-CR-MTA-TID: 64aa7808
Received: from 246f682826ce.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C9EA0B7D-EDBD-4AA1-B413-C5191BF17BDA.1;
	Thu, 16 Nov 2023 18:39:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 246f682826ce.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Nov 2023 18:39:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSaRKHHLK1vA8wTGsZYZrKOhUSKUilYoVDE1ZcuviRIV3o5IUMJf0e7YwjMg/MjY6S/Ou7bMrCzmztXk5TEvWhPvZYbp00CEHfgIYm6NdJ6TprZyM++NQd7ZPzOQeX2UhZXfQWPTNC+KHx+A6PxBSNnPX4Rw6LYDX2bAK66fBwDeDon7Rec6L3f+372uae+0jQPTzA9eXylFmOlZ/2mCw6DmF0torKOPNj7h8AP1ZRda/bRkShTh9cQEjpMty/weLyao4b05+6DzJ3Jje6UXW9XMEDe+1WCPw9DSB0zDa7qvjq8ChflAjK8KvDXdUrAg+7jnINbwYvcAKCgAA0MFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA5rF9HM4ZY8sc4G7pfAyOyHopm/nndrEiWT+YL7IYg=;
 b=dHTpggQHlyin/kewP2JAtTk7bKpq1M8OVafPH0sFZakHtFJ19aO9ZzBktsfSnND314L/WB9qaQ1E3JDpi7P84A4LhTID+mCHGYPG3LROlIXXN2FFp2UvmxaDFBUzDyKFYdWLj4VpWjybJxJwEOV6P7gcHmmzs7adWeKIDoeMg7wa8HsIyMdN3rmb/Icj4EijHpPscualVagwkfq6y7Yhha6Wbs/sDSenYCJdOFZN8s2c0eg1wsmeGer0cTaGPjS1WcT6g2qq1UVyDdrJPsCxIQ0gH/xlsnRuwzga4p75PfoZ+2GLMgl30bffwX5H7G/vUoKlipaDBJqFnygvHYtRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA5rF9HM4ZY8sc4G7pfAyOyHopm/nndrEiWT+YL7IYg=;
 b=uGWYWM7ThFctw26FyaJITs+S93oJIQvrhvFxnoSupHIK9+KMS7o4eExm3WnX11kKSBqTvMeATtqiqgaepsGnA4+J3N16gTWKUe5/0M368WD83lpSlbRmiAyIqu4CNSkTEmVsK8HF1cmHur2P58G3/btDXRERdW6IjY+cBwBzYZk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7871.eurprd08.prod.outlook.com (2603:10a6:150:17::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 18:39:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 18:39:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/2] image_types.bbclass: add support for
 sparse images
Thread-Topic: [OE-core] [PATCH v2 2/2] image_types.bbclass: add support for
 sparse images
Thread-Index: AQHaFz43Vq/VlEfh0ES4SHAInNnrq7B9Sf0A
Date: Thu, 16 Nov 2023 18:39:43 +0000
Message-ID: <B6A4B710-D723-48B5-BB05-3BB16AA69C8C@arm.com>
References: <20231114210418.1323819-1-dmitry.baryshkov@linaro.org>
 <20231114210418.1323819-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231114210418.1323819-3-dmitry.baryshkov@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7871:EE_|DU6PEPF0000B61C:EE_|PAXPR08MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 32117f15-b124-4f34-c529-08dbe6d36bdb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MxvtbTTntOIphR/8jpsxK+ZfjL5zr+i8hYgOe8aZWMOYYK4ZFdKwCmlVJg+hLeOJj0nHE6WcVT9mmlAAQG3R0hp8V64TdTn0ZZAuNGZ1U9xzERWOiECVffZmV3tAtc6lZMgCOcDF9Ldgg9zvxLHQuVSlrDTJ8UumXtlE/UAU8X8vbQvxWdmbtac0/6MA/u0loJ4zD7B9NTsmxBR5o/Z3retF33jw5DhZASaphk9i1Xu82UTU2y5/5AxNoH4144hKU/9Q4UntL8vZLJYSie68+t9M502kUFkbnURXjCRwYucPG0MOt4qFzHrLNUiINXA76qTUI6dLSriDaS/ozEb0b5m+OambP6O4ls9xSZrsSq7R6l60G2Zu6KSev8dvjaQXcTDS7cfe7InrnmJPipqcsG6Ua47lGrs1Algw0m1azb/ekQolEpF6nzdmiyJr1SOt+8ocW9IRgo+ndmzUzQhtXbNCFCets2+puMveehp4hr0H8Ly5inw6OenoVB7kWG240yzaxcrOceJGue5NHrsei+a+ty/lgU9RXNyqttI8p82Qz14rLQ6msHQeoeJHcN63qQNb2GmFDYtHMy1KWZkI1pMRdBXn5tkzCQ51PQ/PZiFtDn0SoMMKJIQsafBztPk6ITmk5fD++uGNd9OZXIm7Rg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38070700009)(41300700001)(36756003)(122000001)(38100700002)(6506007)(5660300002)(53546011)(2616005)(316002)(4326008)(6916009)(8676002)(66476007)(26005)(8936002)(66556008)(6512007)(64756008)(76116006)(33656002)(66446008)(66946007)(91956017)(478600001)(83380400001)(71200400001)(86362001)(2906002)(4744005)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A61F13C38F0FF146863BED9E3D4FE319@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7871
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	985418b7-be0b-41dd-dd3a-08dbe6d36698
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jfTvLxsa/BS9G+iYtGzZNsSMbYWNE9vWXb+yxIY9lzTeiNt9jpTEPlZNbbh73nQLCtxwxG+bmWp5FtXTrvmaRbxGnKtZNhyRs7qJMqR2swkMhlSb5zNRVp+DF+oCWACI5UKuySPPJhmjdbbjPJmTGOqlyxjCKjbg8jn0pbEsTtJo1YUfgTQmfgWl1oxn3hMN1tZqOK7u0EGc9BFzfJk7tCax2/iy5adUdUeZZF9v1pPZOeGlI9nuMzHhfUHjC6hFYwa4m0ZCGfV8x2mdRHjYZFFTg+4G2P9pqgWfnsZqpLImGQH2uTpBqUa+KfR5i5nh+tn/qjIJcVEFYxWk5AaL0/6td4nImIgVZLFrKSO6wmuCKLWVsgNplAzOKsKZsIjjJvPourNXC70/D4IbRDU9slL5N4mk1K2u2bLxRuZ1s4JuISF2eJKTvQDZ9GRL6lp3ZUA4YAGyaabcL7JLz238QcunVH9f3PD21RrQ6o4ljG/yBeJrogqauF70Kj7Wid1kk3QZIvwYdJ9QI4OVItmSidOXvh6asIreKPq+G36XR1aJZVqk+zzfsYYbytj1vamA+Y7a/WPCvZ4CZVOvXVFh6ZrMinjOgvMZ/wdCjrYR9hKTRVnFX1r7VyJwxLMsO/QQmwKf1pRFzG73OLLO+F/cmxXzNDIl2fRuMbnMNsTtugIQonyEDzMQz44keqMYVMh/aoM+YTxU9MOKACbYS75kBD51BemPSFwHlcFPX6moxg/Eu9gZtZRhe525Z0T4rFbL
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(81166007)(36756003)(356005)(2906002)(36860700001)(40460700003)(5660300002)(41300700001)(47076005)(478600001)(83380400001)(8676002)(40480700001)(6506007)(8936002)(53546011)(6862004)(4326008)(6486002)(86362001)(70586007)(316002)(70206006)(336012)(33656002)(2616005)(82740400003)(26005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 18:39:52.5110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32117f15-b124-4f34-c529-08dbe6d36bdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 18:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190808

T24gMTQgTm92IDIwMjMsIGF0IDIxOjA0LCBEbWl0cnkgQmFyeXNoa292IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxkYmFyeXNoa292PWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEFuZHJvaWQtdGFyZ2V0ZWQgZGV2aWNlcyBzdXBwb3J0IHNvIGNhbGxl
ZCBzcGFyc2UgaW1hZ2UgZm9ybWF0LiBUaGlzIGlzDQo+IHRoZSByYXcgZmlsZXN5c3RlbSBpbWFn
ZSB3aXRoIGRyb3BwZWQgemVybyBibG9ja3MuIFRoaXMgd2F5IHRoZSBpbWFnZQ0KPiB0YWtlcyBs
ZXNzIHNwYWNlIGFuZCB0aGUgYm9vdGxvYWRlcnMgYW5kL29yIGZpbGVzeXN0ZW0gbWFuaXB1bGF0
aW9uDQo+IHRvb2xzIGNhbiBmbGFzaCBpdCBxdWlja2VyIChhcyB0aGV5IGRvIG5vdCBoYXZlIHRv
IHdyaXRlIHVzZWxlc3MNCj4gc2VxdWVuY2VzIG9mIHplcm9lcykuDQo+IA0KPiBBZGQgbmV3IGlt
YWdlIGNvbnZlcnNpb24gdHlwZSBjYWxsZWQgJ3NwYXJzZSd0byBiZSBhYmxlIHRvIGdlbmVyYXRl
DQo+IGZpbGVzeXN0ZW0gaW1hZ2VzIGluIHRoZSBzcGFyc2UgZm9ybWF0Lg0KDQpUaGVzZSBmaWxl
cyBhcmUgbm90IHRyYWRpdGlvbmFsIHNwYXJzZSBmaWxlcyBidXQgYSBuZXcgZm9ybWF0IHdoaWNo
IGVtcHR5IGJsb2NrcyBpZGVudGlmaWVkIGluIHRoZW0sIHJpZ2h0PyBUaGVuIHRoaXMgbmFtZSBp
cyB2ZXJ5IGNvbmZ1c2luZyBhbmQgYXMgUlAgc2F5cywgbWF5YmUgYW5kcm9pZC1zcGFyc2UgaXMg
YmV0dGVyLg0KDQpJdOKAmXMgYSBzaGFtZSB0byBoYXZlIHR3byBpZGVudGljYWwgdG9vbHMsIGJt
YXAtdG9vbHMgYW5kIHRoaXMuLi4NCg0KPiArQ09OVkVSU0lPTl9ERVBFTkRTX3NwYXJzZSA9ICJy
dXN0LWFuZHJvaWQtc3BhcnNlLW5hdGl2ZeKAnQ0KDQpBcyBjb252ZXJzaW9uIGNvbW1hbmRzIGNh
biBiZSBpbiBhbnkgY2xhc3MsIHlvdSBjb3VsZCBhZGQgYSBuZXcgY2xhc3MgdG8gd2hhdGV2ZXIg
bGF5ZXIgaGFzIHRoaXMgcmVjaXBlIGluc3RlYWQgb2YgYWRkaW5nIGRpcmVjdGx5IHRvIGNvcmUu
DQoNClJvc3MNCg0K

