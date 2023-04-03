Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0A9C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:59:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web10.67049.1680519590121199479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Gq+DrqUk;
 spf=pass (domain: arm.com, ip: 40.107.20.48, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTAGCfSIB1CVOhu0zG+PNI4gfrk5N9ARgJD3McXw+dE=;
 b=Gq+DrqUkBOGKWHWUBEFI1JHwfSIP3hheW66G2J/9W35XpxJ0XOUAY0rOpTtPiw1pLXM0QdIIUT+ATOR1VuZ/tHGPhYW8h/Is2flKfpWGKBegk5vsvhmo5+4c4TWqdrAxkejDS9lnhduHvaHYcr+OZoFE3xMOni1eQ5zJ4AovZ+k=
Received: from AM5PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:206:1::43)
 by DU2PR08MB9990.eurprd08.prod.outlook.com (2603:10a6:10:492::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 3 Apr
 2023 10:59:46 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::d6) by AM5PR04CA0030.outlook.office365.com
 (2603:10a6:206:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Mon, 3 Apr 2023 10:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.16 via Frontend Transport; Mon, 3 Apr 2023 10:59:45 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Mon, 03 Apr 2023 10:59:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e47772c96d82b766
X-CR-MTA-TID: 64aa7808
Received: from eadd22791690.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C70FCC2F-B1EB-4378-9AE2-F67C0488689A.1;
	Mon, 03 Apr 2023 10:59:37 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eadd22791690.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 03 Apr 2023 10:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU7cz7E1rp7SCrS9yY8Yq8a3HOaSiw7gmpdTHsGdYWHW9iQBXZdqI5bYbyoGeVy4FhVhIbIcRYZBtYtFgL/cy1vywDmSNNwgC7Xv9jFhvekxymDAmOgH3HHeCd0t4GasLWkZsOoH4lWl7J6rAHu0YAxswnCecx9ADJzyMaUGH20TrbaK3C/FwjKbiB2xyz0kcwVL3GTMKITminCxSNZwmt4vuBRlmKecfDJaQ7ARJw0/JEsztIcfrzoKeqdGEm8vTKQbloWc9CZ1B1dGdjt2cpnuqqo2QPpuDvGe3yBkIVSqi4UQkSeumw68gJt6B+ctfoGyPRlqxMSxNW9qTa/5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTAGCfSIB1CVOhu0zG+PNI4gfrk5N9ARgJD3McXw+dE=;
 b=YU2yesGpOjEY/7sIp0cUMcgK82uqux9Td4YhZNSYNEw44YMp5av+aHFRxvT5HgpAR+CMHQoLPx+Zhe+piI5ixqM9wHBhjz/89PPy6ezQ+yfNXMnkNYwZcsTWf5d6IH5TK4IbpCmu4G+FZghxcJoXdwaiZBOq2MP62kMLjOO2sZF/T0TP9ilTao2D3t1cIfUNzmiu7pCx1t2CeLWEqjgHQd4zLDQUcapFArO6LrUYQFq/4CaVbX3jPLwozwgbXqcqGoDEsGF/64yoyUjjRkJnNXcYOX991HslboVEu0s/bIs1UZwygHbnKHuBT+AbhQhS0TRZs679UuF9FC3aDRGmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTAGCfSIB1CVOhu0zG+PNI4gfrk5N9ARgJD3McXw+dE=;
 b=Gq+DrqUkBOGKWHWUBEFI1JHwfSIP3hheW66G2J/9W35XpxJ0XOUAY0rOpTtPiw1pLXM0QdIIUT+ATOR1VuZ/tHGPhYW8h/Is2flKfpWGKBegk5vsvhmo5+4c4TWqdrAxkejDS9lnhduHvaHYcr+OZoFE3xMOni1eQ5zJ4AovZ+k=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6433.eurprd08.prod.outlook.com (2603:10a6:20b:36b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 10:59:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369%7]) with mapi id 15.20.6254.028; Mon, 3 Apr 2023
 10:59:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
Thread-Topic: [OE-core] [PATCH 1/2] systemd: Allow native build
Thread-Index: 
 AQHZYw155bCIHOVn9ECbS3by857hjq8TVzIAgAAE/4CAAACHAIAAKXeAgAEfNE2ABMszAA==
Date: Mon, 3 Apr 2023 10:59:28 +0000
Message-ID: <3ADE60F3-FF7C-4022-AB82-9D992AAD1405@arm.com>
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <ab068d9c1e16fe78ea74b25a30412b55cad616a1.camel@linuxfoundation.org>
 <1751778F66ADC2DD.27612@lists.openembedded.org>
 <27b6f2b6-5e7f-8be6-32fc-2aa7cbd1402f@gmail.com>
In-Reply-To: <27b6f2b6-5e7f-8be6-32fc-2aa7cbd1402f@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6433:EE_|AM7EUR03FT037:EE_|DU2PR08MB9990:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a04a3cf-9732-46ce-dc1e-08db34328908
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V4EKJEOG+e90WQytYoHRwXw5hIjHOqK1lWDuMGPOaGkUbW50S9SXdQVq38dYtBRSZbsRqY+CyZ7ybfZyx15LN+Mz/G666+7vdbTZzm2lw+uFuRlXmqtF+T7WO1pgUfm6kW6WbrGh+upHo0fN0Jqd45BTfulB92sEID31iysVwKH3w/UHIIcvXCJ5yF+taXuh1DinRWDZhLlkxZNAv4tomCaUOosBctgZ0fXhwgBR02cvyexYKgK7T2K5tsxNqILeObpN72r8UFt9uWJNWHS5Og3PKl5Kc1WsFXVO10CoIt7eyqANZ0yqnwApGhqhREh8LiPnBWb3g26mjyq/Irh/7KuqUaTKz6alrPH7rBTREnun/+ytDpp0PHUZpyih9nbMxB2qzuqQnjCcQONluw7SXoS9V8Ryia8JULX6mdnHNidghyygpovBXnX5ebfPghsFHEJTN5ui2yDIdVBHew9clilqRJiSEmixI04jYJ+nKY9vHtQjzYHLwHo30Dfvs4zH3k7D7qCOXGkqvpWBH34LiTrcIfC8hXUV4tXIBqCDn/WNG0FBtk0Q/fLuHY5xS0l3yKxz9KwC8SKFE8xcy5ykIaQZA6qEl2j04bGDLw3Od9q8DWgqtKhoMhSollHQQBL3q62jueXxJJ+lQP0Ot16wgg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(8936002)(316002)(122000001)(41300700001)(8676002)(38100700002)(76116006)(91956017)(66446008)(66946007)(64756008)(66556008)(66476007)(6916009)(4326008)(6506007)(6512007)(26005)(53546011)(186003)(2616005)(71200400001)(478600001)(6486002)(54906003)(38070700005)(5660300002)(4744005)(2906002)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <357B613D0279A849B7421105555A4980@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6433
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	20ad2e4f-3ad3-4ab4-5b2a-08db34327ebe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8ffqjGrS55FxSRliMSe5VzKCuc8PhURLZjIfyb1Yr4AyyorBsbRgyTxfdg1hxyo770QVk/HeFw6+F0uUoGnFJVTQE5XU68mKdV5W17SzInJXcP59mwG6d/TdoDOqZ+CEMFT4KX3uYK5pxPRoYuvY1T0yvD1ZlR7a4otBQEwlUfYGdfU0h4R7T8GoFpttV4t/nT1+UPVD7g40S13oKtnYG7T/gsHscM7MMpX/FxKkwh/lD7TGx7jhAGF8ZgtUU1LN6DB8IBSEg7u7uhIxKXEWh2FL9hgNc64RSCC/4pwk40uU18f846DwbFiLgqU/5QtFMrj3fFTKvJ3kDH6hz8ahhkI/zOB4NYWPV2fh82+w6adf2p8zZi9yb+Scf5Gll/ecD9wMFz/eYkFzn2mFtDjiI+FTIkpMDw1tprzPKXu1o/QVHKfIn0iA6uLbC0x53K0SiIzDbvMohjfY6JcChJmmtEFdgw1ZWM2MDd7GyVqD11g7iXxJaxCE3GLMJz/T8MT5z/xIvv79YvW8OS9vmpzmFQNtuk4uuy1TRT/bDxZ/THjQti7tPd0UpP9jcfvBc4Tpu2UTqicBBUiRfOQG1a8onX4U9NpNjynTJXnPm1pvyaHtyASDuXtQ+dnPAWuivftbzh/71Ml9lX1lkL3DwvKjuWINhYlFUSTc00w8FxWRzbFaT4BeoE5676gPlfOHXGN0aBECcOt5Gvk5axknuZk1dQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(47076005)(40460700003)(2906002)(336012)(2616005)(6512007)(54906003)(81166007)(186003)(8676002)(478600001)(4326008)(70206006)(316002)(6506007)(4744005)(26005)(82310400005)(53546011)(70586007)(36860700001)(86362001)(33656002)(41300700001)(5660300002)(356005)(82740400003)(40480700001)(6486002)(36756003)(8936002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 10:59:45.4500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a04a3cf-9732-46ce-dc1e-08db34328908
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9990
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179615

T24gMzEgTWFyIDIwMjMsIGF0IDEwOjQ2LCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiBSZWdhcmRpbmcgbXkgYXR0ZW1wdHMgdG8gZml4IHRoaXM6IEkgaGF2ZSBsb29r
ZWQgaW50bw0KPiBtYWtpbmcgdGhlc2UgZXhlY3V0YWJsZXMgdXNlICJuYXRpdmU6IHRydWUiIGJ1
dCBpdA0KPiB3b3VsZCBuZWVkIGR1cGxpY2F0aW5nIGFsbCB0aGUgZHJpdmVyIGFuZCBsaWJyYXJ5
IHRhcmdldHMNCj4gd2l0aCAibmF0aXZlOiB0cnVlIiwgdG9vLCBhbmQgaXQgc2VlbWVkIHRvIGJl
IHRvbyBpbnRydXNpdmUuDQo+IEFsc28sIGl0IGRvZXNuJ3QgZWxpbWluYXRlIHRoZSBuYXRpdmUg
ZGVwZW5kZW5jeSBjaGFpbiwNCj4gYnVpbGRpbmcgdGhlc2UgZXhlY3V0YWJsZXMgd291bGQgc3Rp
bGwgbmVlZCBzeXN0ZW1kLW5hdGl2ZSwNCj4gbGliZ3VkZXYtbmF0aXZlIGFuZCBsaWJndXNiLW5h
dGl2ZS4NCg0KSeKAmWQgc2F5IHRoaXMgaXMgc3RpbGwgdGhlIGNvcnJlY3Qgc29sdXRpb24sIGFs
dGhvdWdoIHRoZSDigJhuYXRpdmXigJkgbGliZnByaW50IHdvdWxkIGJlIGFzIGxlYW4gYXMgcG9z
c2libGUgYW5kIG5vdCB0aGUgZW50aXJlIGxpYnJhcnkuDQoNClJvc3M=

