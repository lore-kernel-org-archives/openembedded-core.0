Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0FAC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 12:50:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.73])
 by mx.groups.io with SMTP id smtpd.web10.53463.1699274993595800207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 04:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0yJG/BGs;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0yJG/BGs;
 spf=pass (domain: arm.com, ip: 40.107.7.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IUTEGYxnGE5Hu8sTU01+cACl4JEzOFpQ8zWkQ4q4eT6d6AWJOODdkRmcya2ylvsMgGlHDbHfM5s0HgAsNY68bLRLMiKs7sdi0A7Lv1/3mYAa2lqonqhTzJ4SlSQ1aCbZu2+jrzotou+lX2TJ82MtS79TyFJlX2SyKAdbvFmPCxpl0iotRvbwLoT3Tu04+zsG922PpXlnMYsxI/kO6MxRF1X8fw9uvch2Pudehk9V7POUyb/qhpMLJQipoo/ABNlGNTG1N3NUOaxxwZb+GTEpelY6nJuGpS+9GO0Ahf2C3720/BkzMx0k9DObXq3wwPQcIeFJ6H6TbRB78aSpKJX07A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DREM37/x6Z/S9RLyhWamz2vIEeO+aoG0Wc9b3NeeeYg=;
 b=Vy4J0MANxSj3V+cHEGFBlrELp3+1y9dTZvyhdRlW9UN+s+1n7NuqhzWLg+m8FVlQKaVz2J/PTdljJfpbywDsIL5E2hU6jI1viG+kFQqpQx5lVmV9lDXlA+U1jh78GhdIJcy/RaWezP2LZMjAaXWW/1NL2ch7yXfym8x8d5ZSXugdZKggy5WTKxjPtpXf78wf3zoJ/4T0m/HD2G88N7B/9kh0HSmyuzeGc/yFMxz3Kb1BQugHg70WpAJwqMQglMKLf1LphxggQ7RJFRQakM5QqSYsK5fB+6ZmKGkujZKCIKOz0gbNs7QRoHqgBZQSYzy4CRYmrD+IbbOQ7Wq/mEDQ2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DREM37/x6Z/S9RLyhWamz2vIEeO+aoG0Wc9b3NeeeYg=;
 b=0yJG/BGsgJKKuybTXY0X9eIag0NFEdVNRE4uHkdOdTkHNSaVmSVxUbR3LKfHeRMaSL0+hUG6nWu1E3OPPts0PFAPu4Ixa7M8yP6Hsp5JDS9duhBSXkQCBW+xpzfgvjU7MENdKeBeJfqlgVvRnOsGTF3Ee9nBToROMmL1CF/FnQY=
Received: from AS9PR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::25) by AS8PR08MB6181.eurprd08.prod.outlook.com
 (2603:10a6:20b:29a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 12:49:49 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::5d) by AS9PR01CA0037.outlook.office365.com
 (2603:10a6:20b:542::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Mon, 6 Nov 2023 12:49:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Mon, 6 Nov 2023 12:49:49 +0000
Received: ("Tessian outbound e243565b0037:v228"); Mon, 06 Nov 2023 12:49:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63c980aa8c83aa64
X-CR-MTA-TID: 64aa7808
Received: from fdbdb23deb2c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E0874529-DCD0-41C7-8E80-A33ED07F1118.1;
	Mon, 06 Nov 2023 12:49:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fdbdb23deb2c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 06 Nov 2023 12:49:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLget8Knyz783ASpCLyZhr6AUG75ThK3wYWvIF04IwPduXskXkeAvm1QxTZJsHLhRdqDCFS5kxcFxvos2EQMl977vtYTMHPBwdzKUz9qKo1I/W1QPBNU3Gu6o7FLQIvvS847ISBBiHf4HavezuZnuZFwqYzb94YGTzH05s4Pd9bpw2Ao5/H2mXiqZYOUA4ogi9eCPKFJN4iOse0dZJ3gQr/oHTzJR/6IsWXWCuzZ075axlNFwBtsgh1bgsBW6vCsEzl2XKukKzHr+xLR5k11ET2e4IJddlvBQpkp+EdgE+6CuQcF3r8phabKTd9Zxx0MsLIlEBXvLDVg+3lzNThKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DREM37/x6Z/S9RLyhWamz2vIEeO+aoG0Wc9b3NeeeYg=;
 b=IIg+eNQjoZ9CPRQqdb9eZj/ebkFjRUPFAgnCbx7t2LzCZYRDFOngaA2oLPQa9d0oBKEroMgOSOOgSiyrtq3WoOPZNM0K9FfIT2zaTVuQLxR+UxqO8oWmNA55SXvYhfXAmiLEVYpIsef8UhAbqcuFs4Bw3rbwXk9/wCxi7pL48EOgNhu224noJyqSppPqa4Uv7x00Rnquss+JCzaD1KzNO+uiiZFzVaDGtE9+NGssAl5DVvU9Rd3ePGpPbYRR8+KdwAc/2lNSqS1K/nznnHNqrSUTwhdLI/TA7TzyyRQuvYYeHaCmfOLJPmy0ehB4Zv6N5IacZbKFEszOk//oBKUSzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DREM37/x6Z/S9RLyhWamz2vIEeO+aoG0Wc9b3NeeeYg=;
 b=0yJG/BGsgJKKuybTXY0X9eIag0NFEdVNRE4uHkdOdTkHNSaVmSVxUbR3LKfHeRMaSL0+hUG6nWu1E3OPPts0PFAPu4Ixa7M8yP6Hsp5JDS9duhBSXkQCBW+xpzfgvjU7MENdKeBeJfqlgVvRnOsGTF3Ee9nBToROMmL1CF/FnQY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7762.eurprd08.prod.outlook.com (2603:10a6:10:3ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 12:49:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 12:49:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cairo: upgrade 1.16.0 -> 1.18.0
Thread-Topic: [OE-core] [PATCH] cairo: upgrade 1.16.0 -> 1.18.0
Thread-Index: AQHaEFnSTqMql4HhqEm++HyuXtsgP7BtPrEA
Date: Mon, 6 Nov 2023 12:49:39 +0000
Message-ID: <3B746DFC-DB41-440A-BB22-7678F2DE3A21@arm.com>
References: <1699238045-2801-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1699238045-2801-1-git-send-email-qiutt@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7762:EE_|AMS0EPF00000195:EE_|AS8PR08MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7b4b4d-f09c-4408-dfda-08dbdec6dcf5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yVa7WDMJ1UIti9U5jv0L0ikxqJpEXuZUndzvCowzYWWnJaFb6n50B5csRIfPZSIMKytjtx7rR4wLtx/4ozxzjAcXfua9Ez5AA6a9bgexD2VIkMpFLBEM3iK9EYBuEypQtqV2Ohche6QOoPeRrzOHdl7J/E3YQ2KXNzXP5kTb8WeoreKbZwgqmIyP9lCPTtZgCDzXtTDx9lYDti2R/f8xvUtyfFgwrGTyDkpkjoDaW3bAf0rtzGi3IL73NG2q+dMvRVdsn4CZfq1OakOoFuordZqBZu7lMa6RYrv7NhG0xRw/x4Q/e/QsnugVIl2rz349Si+j6jv3W9QH/D+AlQ5mblCcqrmwzWEn41PGVHOCAT3ZTeROqs9vA+BOcMwDsLd0p2GqYlS7FayK4tltqb3REV/5rzbGcQrB5OON2m9HnBL3TjhVlboJaPwzt7UN9Ew+0gnkNfNir1VBzTDrO3KhszMTzq/eHBlSJGrLezgsjuWwwdTb8xXIBhOFxZ7XATz7PF0YoJajEqXHTjlDj6lDCO9EKRfFVptira0q924446xElM1uYS88DFxxyZ6C2ZREPQqE1rx3MQeb+Ud/iBrQACjkvk87oglY0+y6SMCcharNpEex0iTe0nRL5+pcOYXLDM4ajDVhBCgPoPegmis8hg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(33656002)(122000001)(2616005)(38100700002)(86362001)(478600001)(6506007)(966005)(36756003)(8676002)(4326008)(8936002)(26005)(6486002)(41300700001)(66476007)(66556008)(6916009)(66446008)(64756008)(71200400001)(91956017)(316002)(83380400001)(76116006)(6512007)(66946007)(2906002)(38070700009)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ED090D37F429044BDFE3CCCCA58CC4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7762
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	07a31e65-e0a0-46ad-22e6-08dbdec6d72f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t4yS/V2pSsZrq0oEWMr9wi6RfR/yMUbfLjr8Owz5jWGbOx8EotIfhcOCRK+RxaoYuopWstAW6kdBhQBoNczw7vLMlisdXQwmbGcG0eMAcu3VL1fvC+CXwtjujgzSWVLNshmd6YhPjlUfb2tgD3R7s7Xb5KDsrTGdkZxuFvjJdJojL7vZtUG18kcjIKz7GIWE6PXQwceWX2epxnJl8XVfGwvfvowtF6+LOwXfLP+bU70Vq0dBbPpY6eWYsKkQvxtRrUGrjHnq9OjiPGM9S/lZbVFoDb5WP0R7gKO6HpRq4ckxsLGSm+y+aaOV9ZrMna+1+FMG6hyrxovIjPlp2v9L1c/t3su21vyDNhn25cuXhzB6JNV6jyI3B4b1M4Ax5LieWRoRduqxVIajfBGVRENVapNq534+vYX7SQ05MGL+Yc7D4lWD+BTpDrobu+XM8+1yW3X813CNYmfnqDriozbhp61mMyzwsmvzEthe6P2xlUBmM4Oumfe9rNzleL+T/Gryy3sBESsoAkNyu/26toFFt+e/ehhI/vFo3aHrxbf9Od5P2I96xJ7106jpKN1o8rri96AYY+I+c7yc81V9SRm3TAdYO6z+P1olQkw1w4fXw37CLivbq/AKDz9lrGMZIP0M17ymEnLIOqgTMO91c6LQNezkvjYirxHT6i8Fk46t7kVh1LyR95IIZ8PsBixjcrPq+qTEZnbBH7wkGvqVbIWJoqji1NJfR+OZEX4QIsDFB7M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(36860700001)(40480700001)(356005)(6506007)(81166007)(6486002)(478600001)(966005)(6512007)(36756003)(82740400003)(336012)(316002)(2616005)(47076005)(26005)(70206006)(70586007)(83380400001)(8936002)(8676002)(6862004)(4326008)(86362001)(2906002)(41300700001)(33656002)(5660300002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 12:49:49.4580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7b4b4d-f09c-4408-dfda-08dbdec6dcf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190210

Q29tcGFyaW5nIHRoaXMgdG8gbXkgV0lQIHBhdGNoIG9mIHRoZSBzbmFwc2hvdCBpbiBTZXB0ZW1i
ZXI6DQoNCmh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcG9reS1jb250cmliL2NvbW1pdC8/
aD1yb3NzL2NhaXJvJmlkPTkyMTZlNzEwYjMyMjU4MWUyZWJlYzVmNzYzZmEzNDVjYjE2ZTA0MDkN
Cg0KVGhlIEJVR1RSQUNLRVIgZmllbGQgbmVlZHMgdXBkYXRpbmcuDQoNCj4gK1NSQ19VUklbbWQ1
c3VtXSA9ICIzZjA2ODVmYmFkYzUzMDYwNmY5NjViOTY0NWJiNTFkOSINCg0KRHJvcC4NCg0KPiBY
MTFERVBFTkRTID0gInZpcnR1YWwvbGlieDExIGxpYnNtIGxpYnhyZW5kZXIgbGlieGV4dCINCg0K
VGhpcyBsaXN0IG9mIGRlcGVuZGVuY2llcyBpcyBzbWFsbGVyIG5vdywgc28gSSBpbmxpbmVkIGl0
Lg0KDQo+ICtQQUNLQUdFQ09ORklHID8/PSAiIFwNCj4gKyAke0BiYi51dGlscy5jb250YWlucygn
RElTVFJPX0ZFQVRVUkVTJywgJ3gxMScsICd4MTEgeGNiJywgJycsIGQpfSBcDQo+ICsiDQo+ICsN
Cj4gUEFDS0FHRUNPTkZJRzpjbGFzcy1uYXRpdmUgPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJ
U1RST19GRUFUVVJFUycsICd4MTEnLCAneDExIHhjYicsICcnLCBkKX0iDQo+IFBBQ0tBR0VDT05G
SUc6Y2xhc3MtbmF0aXZlc2RrID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVS
RVMnLCAneDExJywgJ3gxMSB4Y2InLCAnJywgZCl94oCdDQoNClNhbWUgbGluZSB0aHJlZSB0aW1l
cywgbm8gbmVlZCBmb3IgdGhlIG92ZXJyaWRlcy4NCg0KPiArUEFDS0FHRUNPTkZJR1t4MTFdID0g
Ii1EeGxpYj1lbmFibGVkLC1EeGxpYj1kaXNhYmxlZCwke1gxMURFUEVORFN9Ig0KPiArUEFDS0FH
RUNPTkZJR1t4Y2JdID0gIi1EeGNiPWVuYWJsZWQsLUR4Y2I9ZGlzYWJsZWQsbGlieGNiIg0KDQpJ
bmxpbmUgdGhlIGRlcGVuZGVuY2llcywgYW5kIHJlbmFtZSB4MTEgdG8geGxpYiwgYXMgdGhhdOKA
mXMgd2hhdCB0aGUgb3B0aW9uIGlzIGNhbGxlZC4NCg0KVGhlIGRvX2luc3RhbGw6YXBwZW5kIGNh
biBiZSB0cmltbWVkLCBzZWUgbXkgV0lQLg0KDQo+IC1GSUxFUzoke1BOfSA9ICIke2xpYmRpcn0v
bGliY2Fpcm8uc28uKiINCj4gK0ZJTEVTOiR7UE59ID0gIiR7bGliZGlyfS9saWJjYWlyby5zby4q
ICR7bGliZGlyfS9jYWlyby9saWJjYWlyby1mZHIuc28qIg0KPiBGSUxFUzoke1BOfS1nb2JqZWN0
ID0gIiR7bGliZGlyfS9saWJjYWlyby1nb2JqZWN0LnNvLioiDQo+IEZJTEVTOiR7UE59LXNjcmlw
dC1pbnRlcnByZXRlciA9ICIke2xpYmRpcn0vbGliY2Fpcm8tc2NyaXB0LWludGVycHJldGVyLnNv
LioiDQo+IEZJTEVTOiR7UE59LXBlcmYtdXRpbHMgPSAiJHtiaW5kaXJ9L2NhaXJvLXRyYWNlKiAk
e2xpYmRpcn0vY2Fpcm8vKi5sYSAke2xpYmRpcn0vY2Fpcm8vbGliY2Fpcm8tdHJhY2Uuc2/igJ0N
Cg0KY2Fpcm8tZmRyIHNob3VsZCBiZSBpbiBwZXJmLXV0aWxzLCBub3QgdGhlIGNvcmUgbGlicmFy
eS4NCg0KUm9zcw==

