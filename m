Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F89C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 16:05:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.40603.1699891502283021986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 08:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=v6D7FF/5;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=v6D7FF/5;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SsSz+r9geAY7ndZ/FrTrERjwo0C9tv0cF9dxSJDJTYWal7LyiB/hyVtaOHRSBuZcEn7ZMAQqF6kcRYbcSWf3w8FsvEWGWxohFbdQ4mXlsGGogSblQUsDD1H4vz4iPSz7dzck8bqEcxLtYriLqGYS+gFAxEUJl6dvM7RXvcjeaOf9CcGasIVGKP8Ai3FQalhEisw+onzfkBzlyDim8wW7OAebajCxdh7V8iO7i9KIhx9av86ZWMnR+CvM8M+lq2oLqJVyvmcKSzGn9ZRJaV3MCQiXDJ8F/y3r/Yn6jyYtBzMm2ZmpXuIpGQrj+Az3iinQqwn0VdKfSknIYRyPgwEMSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/c1s1TnGMCF7akJw//6SAkVHENWd//943jCmDH/8zQ=;
 b=nf4kAxYJZo3iSGrEW2o8I2xFlHCjDgPz13sFBrlsj0bqezsDUJZPhzH1qZeumyTiKU7yiCd48aYN0IpkowoGHSspqYysK6HABnfxmQcrg9o6zd0mmZT5w15z0egyPonUujrqBHhmxahhaf/QhbMACZ2nCisyGGcFYFbkZ796khLSPbNGjEwuBhwjsja0ZPp45CKA55INq+wMy2x5gpmjZYRT6/q4zbKz+BwfucX913ycqrKmQX+5p9S+llIm/m05MFBBz1KQexdxRZ5crG4EwAcf6pVLjQTNqVq4lbpKtrQ4vPTCE/QiKKVBur6V7EMBrsgP/VaOQaVhUAI4G0YnnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/c1s1TnGMCF7akJw//6SAkVHENWd//943jCmDH/8zQ=;
 b=v6D7FF/5Xu+ZFFIJiAda32GLa4R7tU5KBrniGtQEntnNrkAeAKtHc9VhWMt9EV1ydJDwMAb1js/TahHq8av/nqadGG30CciVw9otzPtorDfF/UpsN58ecM7Xixi5KoYlfnOwBUNspChEBnwo7qOykWgkyFmdb67wjOdQd9GWVco=
Received: from AS9PR05CA0157.eurprd05.prod.outlook.com (2603:10a6:20b:496::24)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 16:04:55 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:20b:496:cafe::ec) by AS9PR05CA0157.outlook.office365.com
 (2603:10a6:20b:496::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28 via Frontend
 Transport; Mon, 13 Nov 2023 16:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 16:04:55 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Mon, 13 Nov 2023 16:04:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3712f9c73b4f7155
X-CR-MTA-TID: 64aa7808
Received: from c69e7f13c9a1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 87D8E169-EA11-4AB7-BB53-64F5ACD0EC84.1;
	Mon, 13 Nov 2023 16:04:48 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c69e7f13c9a1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Nov 2023 16:04:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihooA1fSnDzTAAn8LII1qCw6RgG7URdLkXw4bNJOAMXBZWdW8zpjROPwc/iR0b9i2bMujIn7lv1LDlPeytAOPg6DQFsMR6k7r49AOsZ7S5Go7T58PI1RzMhrlHO/cnfuymgNaF5gycg1y989klCBoQCgsuG8InqprBbwO6XWQTWvOf1WdFlYgiM5fF45NoigT8KTk6o8f9sRhgfRBPKLuyuIZdzXovVGM3b9NdtgF6kgo3NZPcD028ZkBSxp3Tq+PHom1LGKps/j33YafCMLa89BWv8c2yW9leeJHQwngIamUkXaeeFwML1X7I/GfKaaRl1FxYeeL4WXQLNm+lNBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/c1s1TnGMCF7akJw//6SAkVHENWd//943jCmDH/8zQ=;
 b=cyBYhKHdJ4ISayHcpHcykPIIaLt5Tcvz/JVZ5YvLFosPL7ju8owOnWFmNWoNI6ovtId5YFpVd9CmC33eCKYtZaFx4eTtpEdUlGYDy8Qp2/Rp97zafh9zIUOBJqUSfDivySIJnZEDFQuc85aPxu8m3hJQl/i+SfQznxvTE21erXsRcRtWQbkEOCDgJah7IrGpKe+XgwUggsOIFc6jKHCE6lEsXcHcMHQvkBCHZCYZqlr21cx3WKS9I5P5PcclL65YWzmS2dYdVezTxvNzPS0qPdDlpY3Ixgzaxvw2OlmARteOtwmEVNH5LMeQwUoqEqBfpcymwtC+OqMiPqmCvm/SMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/c1s1TnGMCF7akJw//6SAkVHENWd//943jCmDH/8zQ=;
 b=v6D7FF/5Xu+ZFFIJiAda32GLa4R7tU5KBrniGtQEntnNrkAeAKtHc9VhWMt9EV1ydJDwMAb1js/TahHq8av/nqadGG30CciVw9otzPtorDfF/UpsN58ecM7Xixi5KoYlfnOwBUNspChEBnwo7qOykWgkyFmdb67wjOdQd9GWVco=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7809.eurprd08.prod.outlook.com (2603:10a6:10:3b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 16:04:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 16:04:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv2] cups: Upgrade 2.4.6 -> 2.4.7
Thread-Topic: [oe-core][PATCHv2] cups: Upgrade 2.4.6 -> 2.4.7
Thread-Index: AQHaFa56D2LCWt4WCU+m7YiZS6dA47B4atSA
Date: Mon, 13 Nov 2023 16:04:46 +0000
Message-ID: <6071A77D-A48A-455A-BB22-A0BF0A5FE295@arm.com>
References: <20231112212327.82530-1-f_l_k@t-online.de>
In-Reply-To: <20231112212327.82530-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7809:EE_|AM2PEPF0001C709:EE_|AS8PR08MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b3bd77-bc7e-4b4b-0c12-08dbe4624753
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NjfRDAwwJuRdWHbMJusMGGe8KkMTKPtWYmVFh0T3uAV2J97cr+VDWtrbw5Y6JyZx+Ms3hWkxJh7y+FW9sB8aVXivMenAL4ZRuxGCms8F7JEQP2CK6Z3LegJwetPKkzJLhPCUCyMf4yxUeIm4221IEh9FgzD8sr/3NMOUyWoNqbFlc0Rew5gl1cjsXfOSCOWx/6kWpNyKZarNNsV4sVU3XrVrdA0ybhAOJgp1rYSwlqS1O9AesAYMMG95lHmtPSSCaUaO4wYVIXxbJNUg8L59Q/SJwxJgr21mX+i1LbQn+TMkE4NX4eapkBAFeQAg55ChUFvIr+Bxq9ve+f6DgjxaO98n+QG6sXi7GYVjCZEZ3KaafLtdmODsah6nDhAT3vsLlH4KXwLMllDQp2/9pLyJD/NYgEFRrYM1awrFHBjxQN1pmiQqdId1+5XrfqEFCs07ZbErgAz65HZ0ArKpQWVGirhPGszcR0aujOjCTGhkwu6jELC1B3y5tdegAdtX/zprc+woWHXbzhu1pLTs9DH3yZK4EFw01DIiGb8AsX5iRhARJm4E2fKbr+o4iUTJ9j1WtzwnB2ikNnXRFMm3ddDNfDJK49ga9fa2deRM03yvQJFov2cKtloFBGVASCaT13PP
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(6506007)(53546011)(71200400001)(2616005)(6512007)(5660300002)(8676002)(8936002)(41300700001)(4326008)(4744005)(2906002)(966005)(6486002)(478600001)(316002)(6916009)(91956017)(64756008)(66446008)(66476007)(76116006)(66946007)(66556008)(122000001)(86362001)(36756003)(33656002)(38100700002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <62220D0E1F2DC843824458F96C8458AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7809
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7eb21ca0-d614-4af1-1452-08dbe4624194
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	di2zi9hadhgaBhpvQRbZVHFubOisQpVuaAXT+bCB5WtJg7aKRulIVtzBOebUoY18HTF84z6BwUATxfW23BpYopFY7lqDZVJvRF4cNt6r7fmAIvwTpVtUALYjVANHfbt4oihQxir3AMPLh97UmMZnL+pQ+SlWihiGonNWdCx/bZcCcdpfKVj8sz17bbsiINdbPZI4AuBi1/FthfHawMIIX4Z9BIEyGuHx4NaUhZ7DYB6734C1Pt2WnHUxENf4xaVAlaz9t6Y/9ggwTvBjk4C6EBFoSfXrDtCNRpXunV5ZymiJvH1sWf/r5HJ3R6kF8qfdZ4eL6x8Tlyrdq8TUZCmPnvk7J/fqG/I50hKBKgfgx+VYMzM1bR8eFH5xQ6wRhTTGJqjhB14VgQOfxYJHpCAbF08gil3TS2ihp4eCHtgITV1vNTcEXoUSViuJ2OG1bExDGCpKarU/FfUPPJI3th4xVJbdV/TYp3hZSL1HjJiOiantSniLCeUBPRVMo06ZeZeqxiVzovSr8zrx9liFzIOqzSivkl2mLa79pKTOD97RB2jHFS/BBKlvUXf7ADg6ua/yXUDVC93dz5NPKW/rH92B9zlkXf4IaPzYNdmAdQE0cXJkvNE+cnuL2uZWPUJ9ppAeV1jf53JB06YbnGedQNCVFuB2jxEW+OobTqyEFVMtuhFZZE21dAudStkyGk2qK0fvjkzwEvYzD6lLs4VSueeQFsCJOL2znnXf72/hCaPABSQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(40470700004)(46966006)(36840700001)(36860700001)(2906002)(40460700003)(2616005)(5660300002)(86362001)(41300700001)(47076005)(33656002)(336012)(26005)(82740400003)(6512007)(70206006)(70586007)(316002)(83380400001)(966005)(36756003)(478600001)(81166007)(6486002)(53546011)(356005)(6506007)(8676002)(6862004)(4326008)(40480700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:04:55.6984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b3bd77-bc7e-4b4b-0c12-08dbe4624753
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 16:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190480

T24gMTIgTm92IDIwMjMsIGF0IDIxOjIzLCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IC1ERVBFTkRTID0gImxpYnBuZyBqcGVnIGRidXMgemxpYiBsaWJ1c2IxIg0KPiArREVQRU5E
UyA9ICJsaWJwbmcganBlZyBkYnVzIHpsaWIgbGlidXNiMSAke0BiYi51dGlscy5jb250YWlucygn
UEFDS0FHRUNPTkZJRycsICdnbnV0bHMnLCAnZ251dGxzJywgJ29wZW5zc2wnLCBkKX0iDQoNClRo
YXTigJlzIGhvcnJpYmxlLCB0aGVyZeKAmXMgYSBwZXJmZWN0bHkgZ29vZCB3YXkgb2Ygc3BlY2lm
eWluZyBERVBFTkRTIGluIFBBQ0tBR0VDT05GSUdzLg0KDQo+IC1QQUNLQUdFQ09ORklHW2dudXRs
c10gPSAiLS13aXRoLXRscz1nbnV0bHMsLS13aXRoLXRscz1ubyxnbnV0bHMiDQo+ICtQQUNLQUdF
Q09ORklHW2dudXRsc10gPSAiLS13aXRoLXRscz1nbnV0bHMsLS13aXRoLXRscz1vcGVuc3NsIg0K
DQpJIHN1Z2dlc3QgdXNpbmcgdGhlIGxlc3Nlci1rbm93biBQQUNLQUdFQ09ORklHIGZsYWdzLCBz
cGVjaWZpY2FsbHkg4oCcb3B0aW9ucyB0aGF0IGNvbmZsaWN04oCdOg0KDQpodHRwczovL2RvY3Mu
eW9jdG9wcm9qZWN0Lm9yZy9yZWYtbWFudWFsL3ZhcmlhYmxlcy5odG1sI3Rlcm0tUEFDS0FHRUNP
TkZJRw0KDQpPRSBkb2VzbuKAmXQgLSBjdXJyZW50bHkgLSBoYXZlIGFueSBwcmVmZXJlbmNlIGVp
dGhlciB3YXkuICBJIHJhaXNlZCB0aGlzIGEgd2hpbGUgYWdvIGJ1dCBvYnZpb3VzbHkgYW55b25l
IHdobyBjYXJlcyBlbm91Z2ggdG8gaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGRvZXNu4oCZdCBhZ3Jl
ZSB3aXRoIGFueW9uZSBlbHNl4oCmDQoNCkNVUFMgaGFzIHR3byBzdXBwb3J0ZWQgVExTIGJhY2tl
bmRzLCBhbmQgaXQgbG9va3MgZm9yIG9wZW5zc2wgYmVmb3JlIGdudXRscy4gIFNvIEkgc3VnZ2Vz
dCBhZGRpbmcgYSBwYWNrYWdlY29uZmlnIGZvciBlYWNoIG9mIHRob3NlLCBkZWZhdWx0aW5nIHRv
IG9wZW5zc2wsIGFuZCBtYWtlIHRoZW0gbXV0dWFsbHkgZXhjbHVzaXZlLg0KDQpSb3Nz

