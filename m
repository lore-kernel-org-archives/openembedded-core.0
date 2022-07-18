Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFAEC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 15:16:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.52])
 by mx.groups.io with SMTP id smtpd.web12.28604.1658157376140443509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=xxlvR1+Y;
 spf=pass (domain: arm.com, ip: 40.107.20.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fl6rfqg/HVhVzlXwTgY27isZvEKeCyFpT80Ped3ywWKYQ3zHe8eb7tC2lWdps0MUZc7fdrp+p8n3GQZfH1SqGyEg7F7Gpn5jWSTy/V/XEbDjy1lK/KdJJFQHhhYgVKx9ZdDuEzdxngvKA8Buy5cRU+roNdlyeRg3oSGFX5Nw91fSX0fKNXSkk9G95RCNylMnrcDHuniRbu9Z9WwWIypXsqK2pXKs3LZGsrcTz4du6Bud20S0/28q+cDOg3w/aTu8rOFI7trhGGrTZcOmUGUCOzRt0CEhrXUnG8hRaBz56t+kY9XjSaRZDBggmy6sMGswKhkpZB+kuRxTTRvS7Dwt6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0z3O8pjZabsb94mq6EYA3ixAYZPV43nqQIqf1GUl60=;
 b=iis/wqELLDB4pXjfX3nxBgT39ABsyFF/0pDwnWLMdXH5Yj/InZwhKTEiPd4yCrn0QwHkbcbKyqHpmId2JSMrJFS07J+cc+9EyLRiAtCTxu7UuhJpIDxTL4PYQMEowa+Im4C1PquemRnYiuGMcSSbEz+1IY43bm4bbSuWlEFMKX7osd9MKRwDrqgw0x3j1aL6bLRu2lEEe0Wqzgeveorrn6JSdUlK/Qj54ow7cbflcb8xZ0iBscMq0H/Q0lj+9OwoIyuGHxML0+bU8Nehg776phKtn2JJZH7v1MaDqg8xL4GFIlo7BW94NLKY5IRnZbA8mbQDHufV4me33gXWF/cF1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0z3O8pjZabsb94mq6EYA3ixAYZPV43nqQIqf1GUl60=;
 b=xxlvR1+Y55EiJQdvi2/JBzovGuWXHlFg/O3dYDNfYXZrjM4hHG8WA2PeTE/e0FFO+tBTtNkGzBDMOoBvooR1VmI9fw36qVtXPcJbazw7SLdvNEo1qWMXIiUisjfpfRbNXmdcSAnx5f1n4wx1dmiPxxL8n+MuyRRJhbOAVPG+6Vg=
Received: from AS9PR06CA0417.eurprd06.prod.outlook.com (2603:10a6:20b:461::21)
 by HE1PR0802MB2409.eurprd08.prod.outlook.com (2603:10a6:3:dc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Mon, 18 Jul
 2022 15:16:10 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::a3) by AS9PR06CA0417.outlook.office365.com
 (2603:10a6:20b:461::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Mon, 18 Jul 2022 15:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 15:16:10 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 18 Jul 2022 15:16:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 26342e91b5ef93a8
X-CR-MTA-TID: 64aa7808
Received: from f37a211bde92.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF73C8F9-A746-4C5C-A7C3-8B7450AC43C2.1;
	Mon, 18 Jul 2022 15:16:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f37a211bde92.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Jul 2022 15:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSS/zLtEsf/a//6HrBRzMrtEw9VEYTMy0fvNfEcYD5pkbMK5VW8nRIIjAKtKJ6R5slTeUXB5X2U2rjjzu0EbXuv6Bd8IV4ozXU+kfCUrdDxI/OZJP49v5C3SNjJEZAtP8Gkh4rYRRyeMtcU2vnumUuINJ+K+jbpmhveZgKpVGfcninbQAmMA7gmXyuCLqmlJ0P3Wc/AdYjhepApFJVqs620w3+R7ZHnHj9N4WwZenMuPn7/D/69NsTIr7v25/kJbvx9UYeHriUP/qEY/hYC1ve/3ktp9G2aAjURQX6DlFTiJH0rJYi0bSjAHE4HQXvEbHLNxODv8nsADnS08jA/Mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0z3O8pjZabsb94mq6EYA3ixAYZPV43nqQIqf1GUl60=;
 b=XEjaNDneXwHzXSJB+BTIgq6FLIdtKofePqh2sKIRuBryQgExMOjqU+YWtmFUy+BF6WEumaw5i0O/os93ztmFQhPUEDZRBabKLuWb2X+M14YwOKXvE7urwWScGRa7xeahspAa6+yst+YV1nge+jXREuaGLW5iROlgqCcrOr4BqRXDh6CVTZOstkE5fFvtWrw3My9Ed+Ywoq7cxgopvN2bbjKEVW9BpO0uYP6O8+Z7c0rddNBC1RzK3X9r1PYuHznpyxGCQ89Ouvdoxu8lJ78ow3pmXBWwbnUP3o4dffm+kLzRKwKCbbHn34WxFao8SLf0YaxkPIr+kcUdFQtBsrjfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0z3O8pjZabsb94mq6EYA3ixAYZPV43nqQIqf1GUl60=;
 b=xxlvR1+Y55EiJQdvi2/JBzovGuWXHlFg/O3dYDNfYXZrjM4hHG8WA2PeTE/e0FFO+tBTtNkGzBDMOoBvooR1VmI9fw36qVtXPcJbazw7SLdvNEo1qWMXIiUisjfpfRbNXmdcSAnx5f1n4wx1dmiPxxL8n+MuyRRJhbOAVPG+6Vg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6003.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 15:16:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:16:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "akash.hadke@kpit.com" <akash.hadke@kpit.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][master][kirkstone][PATCH] cve-check.bbclass: Add
 anonymous function to get patched CVEs from recipe
Thread-Topic: [OE-core] [poky][master][kirkstone][PATCH] cve-check.bbclass:
 Add anonymous function to get patched CVEs from recipe
Thread-Index: AQHYldra0S6go3Kl3E+EgotogGeeBa16kZUAgAAFx4CACa+CgA==
Date: Mon, 18 Jul 2022 15:16:01 +0000
Message-ID: <AAE95E75-469F-4C53-8922-CE8FD80701CD@arm.com>
References: <A70DCBA1-F769-485C-AE06-F71A5C85A2B5@arm.com>
 <15370.1657624891584790233@lists.openembedded.org>
In-Reply-To: <15370.1657624891584790233@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ee59ba08-402c-4839-ea53-08da68d0722a
x-ms-traffictypediagnostic: 
	AM9PR08MB6003:EE_|AM5EUR03FT060:EE_|HE1PR0802MB2409:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KtcfS0Wo+AMQ8jO33Fh7l+ibXzbjV9zooYJitNdLUoqoBubl9Y23kXIUA98OPbLB6K1vzV4VuQ7maJxHfARGUicLpzsZ8JLmhkHhr6tHkmOxl4O8pfW1qwDfAs6Ep5S4/9tuaFXM/FuGQv4uqmgRiWTF15qSaOjc2rbWt+hYFK0rMGzoJY7vO/DY5uhcPa27QhqnpcWHlBchCoJ0qzCloWzmBjI0gWFY5ABw1/stxUxp7aq5TEHpPwuYBgl3o8EysPnlI7fW7BkWoW2LMaPgNYWsc2MU8Ewr4AoIiQ0eC3GSwy73UNGy8mv8l50KKjA3hOf/cCtQd5o1ti1i2C9LVNGlTuLQ16+nIqXo6oGtfCKgOxj3/uCstTrGgy0Eefgp5fnnDnVVi/tP8fxEexx3MbY4Jnxh3tWlLaZmSzERfWyHe0ED+AG5P3V30TlKuGj6Kg5BJX0OfdAu0CcRzQ22ML0OQdaETCN69bmCbWnqBxeplInbZ0N80swRV7ZNXxmjNfUrT29KitlSslhtXt+vI8rpKZzrx6AUp7Eoc+e4IZulknNwRxG2yzHxvpMtzKkRd45pDxGssSiF6hWk9fm8sZQEMuPgokaoj4nKYzpVf1jgGfCTzdKOirss26umkJU9QMmG6WW5EV+iR4qH+aK9Fo/z61IzqHT3Wuchq4YFLAEpliH4egAWwY/XtIBTMves+HmbZhEY5zbaM4it9MWN52TB7/kGCm0pAM9C7MJotOQ7eU5JR3vEGN7Wdf2gjpn03PE+Q2wxCFopem/WDkPkW6SEDMd6jjxgSTQuxuOJeNTKcEYSv6zYoX5AGcirybqpFIQN4pnS3Nu67pz10vOgN+UVnUQ8WS8+FMPzZ6T+rG8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(478600001)(8936002)(66556008)(66446008)(91956017)(66946007)(66476007)(64756008)(71200400001)(86362001)(4326008)(8676002)(76116006)(6486002)(316002)(6916009)(38070700005)(36756003)(4744005)(53546011)(6506007)(83380400001)(2906002)(26005)(122000001)(6512007)(41300700001)(38100700002)(33656002)(2616005)(186003)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6315FC60A43C54AA74E83855172DFD6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6003
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f807eeef-bc0f-43fc-56f4-08da68d06d1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YR7qtJEy8Wc0CPQW6S5E9vJ2WVOzaW9O22hp5N/ZuB7Yw937Z6FGpj30MvWYlVvtz3YNYBoOiO7MePrFPKbLbA5BPc2t0r/Nh7Y1B1UPnl4T+howlCfohv/GEGvBCaoo+adulP1Mjlz+aBXKRc9HByfiPc5kzGioLqxy8wr8gDk40B2zAogkAxAgPtqnLJr3A+mYNXhj9n8a0LmLvMYTi8z5DbYCBiLkjkxrYsg4LeaapjCsF1QE7G4G1URJ1AJQKdO58L9LjWW3VXYOPHg5GIvnHsggL5eydtHW/srB3eBgMh0WhCJFBapeV5Ezmi2jZwIu5m0N/OX4NoAjTAL40HQkDOXo1wK2RaWoAbMawk64m/OAOowo6avSEHD5U5CYeGNjwclH9EHTt3H6RE7VBn5DSHEDwAbZ6YoMy6PzaUS5CXqmywb8AHoGpdq2tNGygzgVZgASFQqu5A+SnVjeAsaQPSCuStqSfkhPZ8Mzfk5otaiz6Q8NW6z2vS9rqzrf2/Yjq1EGlzET8rAuY5e1rcC9KVQlPgdbKwtpqq8ICwvlDHOG+CDkCkcF5RwM0UExcEmFxRhHoWwhzMm9BMeuXOlFMZaojcW0rR8E1AdDgP5YEZw1HcXeW8lSeJ99Ny6uU8nomDNLIgGQ8fAPJzaJYzVDMI8iPEADemzSCX+wIppAxxJoqmDJfHacJvnI8c8v5AjVJ9QHBT6qREvXOYofPSaeIBAqPu8U+whbBDIUAwSUFaaGCOycnVOuDGM7ZnJfsqJvPNIIqWSgZ5YC7A0GlRwz3UpKKUnRqXcjsCHRZWCSyfiMPiR5EZ++d2DEm8/W
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(40470700004)(46966006)(36840700001)(6486002)(82740400003)(356005)(478600001)(86362001)(81166007)(2616005)(6512007)(26005)(6506007)(186003)(83380400001)(47076005)(41300700001)(53546011)(336012)(40460700003)(40480700001)(4744005)(70586007)(6862004)(4326008)(5660300002)(70206006)(8676002)(8936002)(36860700001)(2906002)(33656002)(36756003)(316002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 15:16:10.3622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee59ba08-402c-4839-ea53-08da68d0722a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 15:16:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168237

T24gMTIgSnVsIDIwMjIsIGF0IDEyOjIxLCBha2FzaCBoYWRrZSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8YWthc2guaGFka2U9a3BpdC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IFdlIGNhbiBpbmhlcml0IGN2ZS1jaGVjayBieSBkZWZhdWx0IGluIHRoZSBjb25maWd1
cmF0aW9uIHRvIGV4cG9ydCBDVkUgaW5mb3JtYXRpb24gbGlrZSBDVkVfUFJPRFVDVCwgQ1ZFX1ZF
UlNJT04gYW5kIHRoZSBuZXdseSBhZGRlZCB2YXJpYWJsZSBDVkVfUEFUQ0hFRC4gQW5kIENWRV9D
SEVDS19XSVRIX0RCIHZhcmlhYmxlIHdpbGwgYXZvaWQgc2Nhbm5pbmcgdGhlIENWRXMgZnJvbSBE
Qg0KPiBJdCB3aWxsIHdvcmsgbGlrZSAyIG9wZXJhdGlvbmFsIG1vZGUgZm9yIGN2ZS1jaGVjay5i
YmNsYXNzIA0KDQpMb29raW5nIG1vcmUgY2xvc2VseSwgdGhhdOKAmXMgZ29pbmcgdG8gYmUgYSBw
cmV0dHkgaG9ycmlibGUgcGVyZm9ybWFuY2UgaGl0IGJlY2F1c2UgeW914oCZcmUgc2Nhbm5pbmcg
dGhlIGVudGlyZSBzb3VyY2VzIHRyZWUgZXZlcnkgdGltZSB0aGUgcmVjaXBlIGlzIHBhcnNlZC4N
Cg0KSWYgeW91IGhhdmUgQ1ZFX0NIRUNLX1dJVEhfREIsIHdoeSBkbyB5b3UgbmVlZCB0aGlzIHZh
cmlhYmxlIGF0IGFsbD8NCg0KUm9zcw==

