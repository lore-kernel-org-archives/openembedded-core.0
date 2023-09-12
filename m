Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C757FCA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 10:58:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.56])
 by mx.groups.io with SMTP id smtpd.web10.22048.1694516297324347263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 03:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hvolpVQe;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hvolpVQe;
 spf=pass (domain: arm.com, ip: 40.107.247.56, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiX25/OJTAeVuYjdwjdecc/PUOtBn9XV+V1ZxQZRGAU=;
 b=hvolpVQekzrbqucJmypziyz9ELLjcWyowR2DDom+1BhGqXvBBsa2n/0N5xwpSVs9MghWJEM0s9J6Ggmtdg1Gkt9PvF8LlS1NOzayc1XXb/pn0WloFpeKoqfkiVipEteDoP+E/Xqo/xBY/CWbJnnyqZcv9LrpidG+OjXP1yH9BNM=
Received: from DB9PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:10:1db::26)
 by VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 10:58:12 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::72) by DB9PR06CA0021.outlook.office365.com
 (2603:10a6:10:1db::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37 via Frontend
 Transport; Tue, 12 Sep 2023 10:58:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.17 via Frontend Transport; Tue, 12 Sep 2023 10:58:11 +0000
Received: ("Tessian outbound 1eb4e931b055:v175"); Tue, 12 Sep 2023 10:58:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 867329c3a1420a6a
X-CR-MTA-TID: 64aa7808
Received: from 936891114116.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8611493A-59D1-4EF9-86A1-B0C6320C95BE.1;
	Tue, 12 Sep 2023 10:58:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 936891114116.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Sep 2023 10:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1wbZYsuoXobgyUdtsGqEnNtbXy4ixZ/ItTcegxwlCAkhcdk8gvdE67f+QMKqcVChkvJV3XiQ/ljGoGSARtthBKxfAcGReEqiCMbHDc+JUYU1oROVLqrIusxEHh1h+v5+LxJ6XGr/SZ7o8/i2HOldC1I+BRrAKx9WL6qceG6rEvsee5GPtn5SBI1pPZE+3Q1+uU7Rcas343NyfgQdQ03Wgph/gkMdotbY+/GTtIbVhr5ciS2GfWAxgfgBAXDRkaockK/4EbcnyzM49UeErdECxWbDikFPD9fmjyul+YHFeaG6246Ng7LWsOaC4Uv0kf0FFrZclr2MbMk4ruF8FgXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiX25/OJTAeVuYjdwjdecc/PUOtBn9XV+V1ZxQZRGAU=;
 b=IDBIAKPmV4nqOc5h8/f3Z/Wt2i2H0r7sxj9P7B3DV7x7rdWNyUSUhgqNb0SUNwXVaobAlnSg/wLuizGJCR0+GT+0YD8wMx2dySFZbmTjRAuYNEmQfUs1ojwOqdr46oT3pTLvN6SR45qk089TQ/ubn/AeQxJ3wQtlXeKRz+pTmqN5+FpHT/HBmjKoyi2vUYyCGpitPgAtv+qR0PZt5rcf8jPMva+UgqCkKAtmZ/M2JH4F61UpNRO1mMF0dkEGINqVZVaVxQAC8BYlP7607czKX3oaNYs3FTRQMv9jinZOqasa+VB/wRpMBPCf66wacI0wis9cppLkjW2GPbb5e8QOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiX25/OJTAeVuYjdwjdecc/PUOtBn9XV+V1ZxQZRGAU=;
 b=hvolpVQekzrbqucJmypziyz9ELLjcWyowR2DDom+1BhGqXvBBsa2n/0N5xwpSVs9MghWJEM0s9J6Ggmtdg1Gkt9PvF8LlS1NOzayc1XXb/pn0WloFpeKoqfkiVipEteDoP+E/Xqo/xBY/CWbJnnyqZcv9LrpidG+OjXP1yH9BNM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9718.eurprd08.prod.outlook.com (2603:10a6:20b:616::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 10:58:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 10:58:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH]
 meta/conf/templates/default/conf-description.txt: add a template description
Thread-Topic: [OE-core] [PATCH]
 meta/conf/templates/default/conf-description.txt: add a template description
Thread-Index: AQHZ20x3PnmhNMdLU0+cg7fZUjHx5rAXGVmA
Date: Tue, 12 Sep 2023 10:58:01 +0000
Message-ID: <082C37B7-684B-49F1-BF8E-A0891EACABF6@arm.com>
References: <20230830141512.656130-1-alex@linutronix.de>
In-Reply-To: <20230830141512.656130-1-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9718:EE_|DBAEUR03FT014:EE_|VI1PR08MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 499e5aa0-4e4a-4ea9-8064-08dbb37f2808
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fbwyOWZeiHj2kpAJcXIN/rS4S25KUFWqFAyp7cYEPbwv2iQYWKhrMGXvUHCzXf6tnGquHlaAvp3DRKI4S6TcbKW7AqfU/ThxC31o0pLUNp6r//VkLxLxoxXfl2xACTA4HqtiyCO+1WQytw8+FrQwXc1YZv5Sl8OJ44zKIYkGmuh+pWTQNv+EeN/kYWlwTkOhzhCElfv27zbiw7XiAf7a9SUfFspUNrSSL8GMXtuqEWO3F6S1zyO5DRrbTJP6eTsTlo+MXX2kJArKMaSmfWqwdzFWz++2VWmPSApP5oENmonFVvv6t47h9Fpq4uAiRdWeR9I80AaaiTPQrH/AG79YJvIUb3IK/zPdkWNlJBmOpQ9/7nTFWUa4nwAAMJ3xwdD7AxfscY9hmzl0U/+cz6rm4IMyAe3UsIBMnaVZ95XM+1YVxYYBc4YEoPFH5ITzFmjGtVL3omHw82xAoh62R6IfZJOKfCbTMw2luynPiK3SDgimjz+pwygCXf1tRclFitb7ap39e0afxgsWj6EPea/cHGD+6PgymKgO3vwKoSCcN6b+rCj2cDIDvvnFNJhqQo3DXwti2BfBKX+/3S+SeVyp8wC1KmNsFXPjbrlHZUMR6xvVr7G6zqJkXt0hb0TeOX/xTIrrxnCIo5uolszSeKDCNA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(186009)(1800799009)(451199024)(41300700001)(6506007)(53546011)(71200400001)(6486002)(6512007)(2616005)(4744005)(2906002)(66556008)(6916009)(64756008)(66446008)(76116006)(66476007)(316002)(66946007)(5660300002)(8676002)(8936002)(478600001)(4326008)(26005)(36756003)(38100700002)(86362001)(38070700005)(33656002)(91956017)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0A41EA881D1ED4FB3AFC34A814AB277@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9718
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f86801b0-1d8a-4fc4-8e4d-08dbb37f220e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XmcJSWb53zOEqvk4LlBLmAUEpPcPQivv2figKwwc7ZGDvPFEwzPPXDu4QrmyHCmx7/V5kDpZjh8htsxpOGECo9lAccDHE428In5bAi7Ixomr9eKBE1lD6ZTAC4t1ZFaplSOiKal/Jx7aRZh6Bo+OLBmhhn/NnwYTFyr6MiXXjxbEufXWmMbccVidyGmvfHjgmd7wr3AvLiuUxrl4DY3pJYBC7g34G6Utq2ZkHlr/VGDVra76tZHpifmodjbXXV5yD+fxoSh5oUDxfb72Ei7eQZ/vVkYZFqGZLURsEhJB1Z4iEoMvq6/axvx9NEfKLpT61SmkTQ7IN0ZdwezCIOgMKViiSbqT0Bl/guC0lqXLGWjNHNAUTFX7O1lKJCepXzCH3qoxDISqmeL7B38UT3Qilt1ts6O7BOixTqBSvwRJhUx1Myf+6XjZlkdE6ZBDtQZkezJ2tjyQU1MsVoz5FbED1XMytC+Xd2tSnY+vfJsUEBAOXWdZvKpvf1Qo9yfOw84EO9H9wEF9VxynKSzG4J3u3t0MNyVMw05WpIvVi6uZWv90xVkNRGdUmu2ywEjJDUNGURgwYqJm+Np7paLQlNJybYYtR5ibeTsSnlMyWNg/R0vSRFXN8RByHTNbweu7gjJBpgVagCp7+HnuIsLcPt3UIau0j0WNYMWTEXVL1R2c+vu5kTLobvUhxkNW8bNd3hTMd2/resmE3lfHcWpTqn2rlNtpXxUqWJ1Zqb01vloCZRGc9vv3xbcYGOhtC/RACgDr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(6512007)(336012)(4744005)(26005)(2616005)(36860700001)(316002)(47076005)(70206006)(70586007)(8676002)(8936002)(4326008)(6862004)(5660300002)(6486002)(6506007)(41300700001)(53546011)(478600001)(81166007)(356005)(82740400003)(36756003)(86362001)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 10:58:11.6765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 499e5aa0-4e4a-4ea9-8064-08dbb37f2808
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 10:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187499

T24gMzAgQXVnIDIwMjMsIGF0IDE1OjE1LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gVGhlcmUgaXMgYSBuZWVkIHRvIHNlcGFyYXRlIHRoZSB0ZW1wbGF0ZSBu
b3RlcyAod2hpY2ggYXJlIGxlbmd0aHkNCj4gaW5zdHJ1Y3Rpb25zIGFib3V0IGhvdyB0byB1c2Ug
dGhlIHRlbXBsYXRlKSBhbmQgdGVtcGxhdGUgZGVzY3JpcHRpb24NCj4gKHdoaWNoIGlzIGEgc2hv
cnQgZXhwbGFuYXRpb24gb2Ygd2hhdCB0aGUgdGVtcGxhdGUgaXMgZm9yKS4NCg0KV2hhdOKAmXMg
dGhpcyBuZWVkPyAgSSBkb27igJl0IGhhdmUgYSBwcm9ibGVtIHdpdGggdGhlIGNvZGUgaW4gdGhl
IHBhdGNoZXMsIGJ1dCB0aGUgbmVlZCBvciBwdXJwb3NlIGZvciB0aGlzIGV4dHJhIGNvbmZpZ3Vy
YXRpb24gZmlsZSBpcyBub3QgZG9jdW1lbnRlZCBvciBleHBsYWluZWQgYW55d2hlcmUuDQoNCkNo
ZWVycywNClJvc3M=

