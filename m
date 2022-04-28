Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB09BC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 09:17:25 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web09.7630.1651137437164419408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 02:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=uKh/v01l;
 spf=pass (domain: arm.com, ip: 40.107.22.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fN9FujATo/5Zs/qKlvXGbOyeKo3pcoKecScEmzmuj6InMUzVYqhlX433q0/2SOSTphT0gjLRqwAAGaiE6u567aGJwWbNLLnVAqjm3WMMUxLS/eXiW/sI2gAKTv8zW6r53dTIJJN++06FYjAwjOiutmUjWaB3KWn0SGgeNcsQQ6MiJQsdXPEO5efZpGXB312HoRuSbcPepjmzKR8trjt3nCuw8LE89+51nhDe/tBC0NLDPgl9Zc6jnRttH9SHHQYwu3lH2t1X/5tdbbNIH1RgGhv2bVwcaerMe3TWs/RYy4wylaMrBSQSTREDkzxujisbtoKhbAH41JJ35JsVKSiB9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSjb5FWyln2rz6WxTPKLcQs+m0WwAWQ4o/BRfGVdkyU=;
 b=FEyEuJQPb6OvOzCAOnKg/UU/oUNSlW2eoHsyd2NsqU1lVg84u3UwfAL468anxSuXObE7pOp0BOpybBwVwDl7MvYGuLM5yjgZqB9CKq9WAgAe6nI/OR8MTEDub1s8P0QlozcZo3UWtkriMRMNM6yQ3xbZ5YU16D7T2k3Ajikz1hVtmtY0orJAi46U9lvNZnr2sgv00bmlVh9Zs5/Yo085yj0rDE786n26B7oS6I3YLilDshr4OnTko6IbY1kdHLRwXLrNf6+Mue7JntqJRZ9/JqJmE/m5/tDcNScaaedrf4/fO1ez/hODN5GWYKuRXvzO1PRPzZJJN0/AIq/LMPHr1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSjb5FWyln2rz6WxTPKLcQs+m0WwAWQ4o/BRfGVdkyU=;
 b=uKh/v01la/64xzy5L8i7OykzkKkUfJFUOQsQ1N+cYUy9kCfwuAUn6f83RzLJJ5o4y6wHSNBPsP3VCH7dVvr/oDgA/r9vWtMz62/v7NP1X6ym69U6lUrWtucWPeJtT6nk70LI6rJ2UqELIGn1Fdk6C3Rzrrp9GZfN6PcYbquOka4=
Received: from DB6PR0601CA0011.eurprd06.prod.outlook.com (2603:10a6:4:7b::21)
 by VI1PR08MB3375.eurprd08.prod.outlook.com (2603:10a6:803:87::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 28 Apr
 2022 09:17:10 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::55) by DB6PR0601CA0011.outlook.office365.com
 (2603:10a6:4:7b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Thu, 28 Apr 2022 09:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 09:17:10 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Thu, 28 Apr 2022 09:17:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b3adacc12e9d183
X-CR-MTA-TID: 64aa7808
Received: from de8f2c71df04.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A1F1B4A-7840-4966-966B-C1FF9C5F4AA9.1;
	Thu, 28 Apr 2022 09:17:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 de8f2c71df04.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 28 Apr 2022 09:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jojaO/Nt9GxTpllLQPVLQ81H0GE5cws2qHsCNIcmBoSYdzkAU4IKPIV8jAb5u48+QjUyuw8ujcjRQWLIi7dORvyk5mZOM5zVRmkfug764MmPAR/LkCGrO32Q8IFI1UMJwxeXmZrN3nRQq22whtOdGdmEVk5iNeOC1uU0nYyNkXd0shoVg50zs2yJk9hhvvHVg4HEiUQdkkZlUOv6E6YxKvLEDBx7rfVyxpsuwB3N+XX7b/RxtevxrJGoKeGov6ZBAojNwFSR2Do5z02ac6SguEdmaOXLMEUfhmqgGedOoz7ysc8ZrmlfvWI/ta5FZDotm1X9qrcL9WSLL3WpBn/0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSjb5FWyln2rz6WxTPKLcQs+m0WwAWQ4o/BRfGVdkyU=;
 b=jKx40aASZVLb99WcwtjXFqEMS+ZoqQ0Y5JwUJUUZ0ftZz9yXG4FXMDWKOd47gqcE/K+J4RNwHZPFciHwIvlPE4lbc+OfNqxtwccGbuFtfs92e+jDcijl0j67yr22kIjGm80AKGvf95txyYKd6NFiFt37pMoTkwVy5UBGlUSlw07q+dNVkzqcrsLCG00YP6vtfNrdLwQrCE27H9vtgB70T4XIIOfXyMq40/XUHJqABtAiD6fT0uiBG9CTDMeLBjKYhSzkznUedUBQGIIkASPleHIyjV1Ho/87nSBCQp6azxu6glWD3XlhtvUy73YbbAInPrCAmKrNJliVbt+sdFHm/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSjb5FWyln2rz6WxTPKLcQs+m0WwAWQ4o/BRfGVdkyU=;
 b=uKh/v01la/64xzy5L8i7OykzkKkUfJFUOQsQ1N+cYUy9kCfwuAUn6f83RzLJJ5o4y6wHSNBPsP3VCH7dVvr/oDgA/r9vWtMz62/v7NP1X6ym69U6lUrWtucWPeJtT6nk70LI6rJ2UqELIGn1Fdk6C3Rzrrp9GZfN6PcYbquOka4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5597.eurprd08.prod.outlook.com (2603:10a6:800:1b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 28 Apr
 2022 09:17:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::8af:d35b:6628:5013%5]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 09:17:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] cve-check: no need to depend on the fetch task
Thread-Topic: [OE-core] [PATCH] cve-check: no need to depend on the fetch task
Thread-Index: AQHYWjniuG07+/6S6kCwl+gftAHjDK0E/CYAgAAQ04A=
Date: Thu, 28 Apr 2022 09:17:00 +0000
Message-ID: <8DF2A965-7865-4956-84FB-4060AAEADEA7@arm.com>
References: <20220427132228.1179532-1-ross.burton@arm.com>
 <CAApg2=ROu0Vx5qca_QRVxbeB2E6fUFSMz3bi=Cj3QD1neJ6D-Q@mail.gmail.com>
In-Reply-To: 
 <CAApg2=ROu0Vx5qca_QRVxbeB2E6fUFSMz3bi=Cj3QD1neJ6D-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: da1acf63-8da1-4e07-9909-08da28f7dfa2
x-ms-traffictypediagnostic: 
	VE1PR08MB5597:EE_|DB5EUR03FT012:EE_|VI1PR08MB3375:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB33756D74E5421D1E24F92C8CE8FD9@VI1PR08MB3375.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zwxnDaDqtxzCGj8K3KGe1ZQUGNu2X4Vp0TdvWndFRS9tjG6yGIM8EtXnhOcIjndjr/NX8kV4vGiNVKqcTlJOHae99mTRs1NKedSKWdbzYrpum7NOHXDztTrPmnvc4KMgd93nalhsqLoE65cqOK5Wph/BCC7TaKYFO4xt8d9Bb3YXvLwidT4b2Xpa39alWC7TI1MTc06j+2nHTGG+qXXklUUcgD8eIkouR+ODPln4uviK1I6splbfLgvqfULpAu729JMjJsvBkuSL4ewpz7m3ULRycs0p8lyVKeW6UqAbLxw9lNvKgAKHL4ctgpotqTORTLFb0jZiqasX6wDqhfoO07Cbz/XWp4NErEkoYgRy2QqYBxcsKgE1Eqs/w3F5l6SoTFAPBspFiyywHMWHYsJqKf3BaPJIFDwiuUaNe1aQIa5t36FuK46Z9mMgThnTxwBUOJrkSlaTigln5cLf04Rqzw1/xgs5K6mPE9/vjyNSrKTbSwXHAHTz5p7Kr0jMQPYwalrzaSTN9SuatFPuJUpz0g5+KSFlC78VhdTndMuzKjA1dFqB//+VZBkctYK4y5MoVC429i3u/dkAHkSQM8d19LuiRMZAxDsrmvyRl4sXc6HzBgH0Gc8q8XtOG6RFCVvQS2zlBVIEyI2xQjV6YcNN7jl0l170C/jQpi7xmACrK5k3DyK4fz3lw3uOQY1vaH5E9KYCxV0qB+xNXvFjJJjg2HqNF3f0uAvhKCLIm9CPtLNiT7BrE2cZ2NwK5HpfACzU
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(6512007)(54906003)(6506007)(53546011)(6916009)(26005)(83380400001)(71200400001)(2906002)(316002)(86362001)(38070700005)(122000001)(38100700002)(64756008)(36756003)(2616005)(66446008)(66476007)(66946007)(76116006)(66556008)(8676002)(186003)(91956017)(4326008)(8936002)(33656002)(5660300002)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7F1C212D4200B4595282EDDAB6B60AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5597
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	46ad1956-9bd4-407c-a157-08da28f7d9c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CYcVh82N4aQPr6sQAVObQNJHZSaVTrlCCNrnfQSZomSJ+wD4NokNPma9dEg2aH2yEuxokMSXNS/xsO1bZKbzz4fWhhsHYDz5IsHXKXrpRI2VWUspWbq02gHlb3yoJ3fIKIig8AJOEhb4FZ4SxXsQqZLRh6vJePEP+D2wQSRJfZO9wDk8chxobovmHcqmp0XvecW/DBnuIpvEwR0KsQ6s6A2b+4O+nIqLdcAV5i5oYztj9HC2yhm61vc/vJb6qsNa21qTZ6pSW2rQaZqhYY1fR8xGMp9EhE4QEHRKvS02Qfjsj+WT9gH0J6N0iljE0eEnrll27flGIW55mnDkTkiV6u4lryR9FxsIiYrfunazzJ7OFEtKcdAKkWxfIKjv0+aBfb4n5lAhtMg/2l6N4w0n4q9Px5dEu1DK3q6t/HnV2j31zmGtNDFmPYiSiDrm6G/E7pEHUCm7AfitUwS95p81xLAQJrRVqIi/9U+lymg/0dlBYlS1BFEdzGf4fR4YY70nP3kjS2kOKTykpRlqLutqjf22X/FsZtEW3c2ZKYlQB0sQ23bZO0bFz/0oQRYEIuigdDOLCSdRUbF8dHhMvLs47zabce1a3m4FLwLEs0EJGbpUeaUMTKJeRkBPiSH++ZrQvt0u+Op+qUyHat6tKhj7vHX0KQl8HtcePSEWa3+npnae8WFRP0n16TaCD2yKsjW0cf7zQY6gP/zwmZmICCJsAggMXMzDkExuPrCLeNf4WTA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(33656002)(316002)(2906002)(5660300002)(6862004)(86362001)(4744005)(4326008)(8936002)(70586007)(81166007)(70206006)(356005)(40460700003)(83380400001)(508600001)(6486002)(8676002)(36756003)(6506007)(53546011)(47076005)(336012)(82310400005)(6512007)(26005)(186003)(2616005)(36860700001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:17:10.0354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da1acf63-8da1-4e07-9909-08da28f7dfa2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3375
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 09:17:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164938

DQoNCj4gT24gMjggQXByIDIwMjIsIGF0IDA5OjE2LCBNYXJ0YSBSeWJjenluc2thIDxyeWJjenlu
c2thQGdtYWlsLmNvbT4gd3JvdGU6DQo+IEEgc2lkZS1lZmZlY3Qgb2YgdGhpcyBjaGFuZ2UgaXMg
dGhhdCB3ZSBzZWVtIHRvIG5vdCBiZSBkb3dubG9hZGluZyB0aGUgTlZEIGRhdGFiYXNlDQo+IGFu
eW1vcmUuLi4gVGhpcyBpcyBwcm9iYWJseSBub3QgZXhhY3RseSB3aGF0IHdlIHdhbnQgcmlnaHQg
bm93Lg0KDQoNClRoYXTigJlzIHVuZXhwZWN0ZWQsIGFzIHRoZSBOVkQgZmV0Y2ggaXMgaW4gYW5v
dGhlciByZWNpcGUgZW50aXJlbHkuDQoNCk5vdGUgdGhhdCB0aGUgTlZEIGZldGNoIG9ubHkgaGFw
cGVucyBvbmNlIGEgZGF5LCBzbyBpdOKAmXMgcG9zc2libGUgaXQganVzdCBleGVjdXRlZCB2ZXJ5
IGZhc3QuDQoNClJvc3M=

