Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1CDC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 16:29:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web10.1419.1665592145010168262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 09:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=23a4dQea;
 spf=pass (domain: arm.com, ip: 40.107.22.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IHKvyv0wVJaJ53JQ7xNZP8HKKy/0DuWyFxZeO73TUMAyS0mH0/juDZ6UaoIJpIollQpMWRHp0bkfwFbExLxF+6IXX3rwv8RsHwA6DAh4FEPAhZGod1FrNxPPTpVuLCVGp0HVi81GC12QLCLX8EzXk+tFnCWhmr41KEyBV6EDV55tCpJU2h4mr4fytqywyw7O7jMat1a/Ycur9ldP1ImkvWbHzm6DCEYZHlW7EJM0DfWaMV3WGUvT6T7sGs6MDDFqqr3naeXeWAvfGnX+J+kwCyRYVrZEaw6nj1TmEPzopuRxDk9GK2J49tMq1y81Hno3hA5mTyapUOaJbVdp6Jy9+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5MUfq0qQ6WfgcYDcvT+O2Ho6OtbAbSaA901sSkgAPM=;
 b=BaUuI8Fe2ixGPmtsr5WLuyqwU2k3nhuiU9TMCks0uzFiG9p/zRrgiLhjaiZnbDatTaub8ClrQbD8sejrNG3PnbRitrOqsVbnxbAT1pnbKjkVO1cEro+E81TfLcgaIQo8wV6XWj9ORbpHNOKbn0msSKvYVyUiwP9vkV0j+v3FCTqk5R+MnMi5VqHU6QF3K1pNUI+/yxax04sgpGtPatrdyZ5zEyAebrf+UqTfuvJsnExq0yGrEK0FtCBOEo419/bpKnEPxsGCvrFRSkpBDIY8sLc0B55om7QTp0VCXN9pBX0D4rn+dnlhCh9OrnKJ2dxIqY9oRfMALn5ZS4MVq7esSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5MUfq0qQ6WfgcYDcvT+O2Ho6OtbAbSaA901sSkgAPM=;
 b=23a4dQeaZfWXzCVnxmHNC44saskXmstxllZEB+AdOYXcmmg8nicyB1lhFyDEwh3eGYjznYsA+JCUfLUypy0TW4rc4FJS6VHF7JmrElu1SBw90X6vZVu04ct1GIQQNqF9sFmBpFbBKizGx0HRMDf1SfJx3k3qa8HFKqXkkA8k1YQ=
Received: from AS9PR06CA0643.eurprd06.prod.outlook.com (2603:10a6:20b:46f::15)
 by PAXPR08MB6670.eurprd08.prod.outlook.com (2603:10a6:102:130::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 16:29:01 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::71) by AS9PR06CA0643.outlook.office365.com
 (2603:10a6:20b:46f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 16:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 16:29:01 +0000
Received: ("Tessian outbound c2c2da38ad67:v128"); Wed, 12 Oct 2022 16:29:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8ca7fb28e47c5f8
X-CR-MTA-TID: 64aa7808
Received: from 70669e1497ea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4B2FF007-9F25-4263-B83F-AB55E892C1F0.1;
	Wed, 12 Oct 2022 16:28:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70669e1497ea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Oct 2022 16:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kn9UOpQP2tdHNxakYBlJsDOGyZJDAkMBy0AqPDEZGeglZyi79YPU4SEjTmJ5VU7OOHZI7L1DzRAD2eDsRQYIq2JVrsvmxObanKLVB9IZ28uEeuRXHxWMGprXsOsPWStpuARSEXpfi0MnzE5ZuNYNq+lFFUzF/HiIgPpL1+T4wOD5ccHzwTBRGamEA2eufXJ7rzbG5mhdCph099wPbayamSwKw4yyZOfq0Gge3Trr2BidB+sgNRw2uv3YE5Ox6c1yWqXHgAsQGgNZNlKRit9x0+7oIKW/gcoybt+kdSLGsebh9PIZZ0xN6BRa+sNkZqxnXIYnAazybyDrTHpAGouOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5MUfq0qQ6WfgcYDcvT+O2Ho6OtbAbSaA901sSkgAPM=;
 b=CxTrcXD5nWSYFOHFk97TNaqHYJ+2uor6gArfNb7LS/9KUfcrSGTT3AqmPvrV8I/5jHDkAFdouNgNI2Jy6WXvSPvjFX+zLndYhZIsCLuIc+PmMuCzkR/Y9H35rSWIXp9sGJ2cLR2ZJjukC8SR4rAF/nzDgCDeHygFqGu3beus9xyER3rVa6s3CDsPe5vKYKSMcQ2FstavUzGnVUXiKptxxm0A61dt7ETUrCAyNnlYZBLKCvMbLgq8+2XZlnIg2b5UXzLml+qm6Eosv7XcB+34Sq+6SNiGJPdBCaVD/7cx+g3PLy6tSkiajcAdiGDzFeQO6U4rMOMszh3RgokrI6YOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5MUfq0qQ6WfgcYDcvT+O2Ho6OtbAbSaA901sSkgAPM=;
 b=23a4dQeaZfWXzCVnxmHNC44saskXmstxllZEB+AdOYXcmmg8nicyB1lhFyDEwh3eGYjznYsA+JCUfLUypy0TW4rc4FJS6VHF7JmrElu1SBw90X6vZVu04ct1GIQQNqF9sFmBpFbBKizGx0HRMDf1SfJx3k3qa8HFKqXkkA8k1YQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8346.eurprd08.prod.outlook.com (2603:10a6:10:40a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Wed, 12 Oct
 2022 16:28:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 16:28:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alberto@pianon.eu" <alberto@pianon.eu>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "marta.rybczynska@linaro.org"
	<marta.rybczynska@linaro.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Carlo Piana <carlo@piana.eu>
Subject: Re: [OE-core] severe issue in CVE checker
Thread-Topic: [OE-core] severe issue in CVE checker
Thread-Index: AQHY3gvnaHmC4vrA80akzzn884+zJK4K81MA
Date: Wed, 12 Oct 2022 16:28:50 +0000
Message-ID: <1E128F9E-4B95-43D4-BD73-915FECB99774@arm.com>
References: <233c014c169e00e6a9ce464f3ab2bf79@pianon.eu>
In-Reply-To: <233c014c169e00e6a9ce464f3ab2bf79@pianon.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8346:EE_|VE1EUR03FT041:EE_|PAXPR08MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a9abb7-3629-4d62-970f-08daac6edee1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1+2PuMwEL17oT5OhNMVeLMKsFzQ9TbsmzlAjSWfWqU8W3ZPlNfqq3TR0SJCq5EC8zpCUQxYRAq8gwnqoFAGz1jFOAg06VtgwGm/ZFHnlGR7nx5DVe1CVt6qov1XIipKkqTnOgIfjFnN4SdBRzc3LofqcRjHQFqvzvzMxSRaMLGpuoFfwtvyuqWbdo7Z+RiOv3tZn7rT8BIjP6JeLkn1FeQLePrcWaGZ42I5zcSH6oU9l3oyd9t3d84Ejy7SsYYnufCQ5LG4dPCr74SPTTDBY65Zq2QUlI+oYZ1MPMC7FlN53688QBnt0B1NODa5Z3/zZStAdxEVERcdmVXzHojegNJt7LhJcXO8Q5hgcoL5SjKzLbwislZ4vhJfP2KpVX6oGap4vXyu8Lh6FLizRcNcjVGaTYXEIEBpOsLeNNeuaoiff8yTMhc06UvHNIxsCJPs22S9LVwkBxKzTXoQkqcVnniFi/kMdPwznFgg1NCw/IAWXbb3DSd7c/JZVNPrFD8UFbURWK7RVNNQJ5WvpjFTOZtJgAVxB4MRedPJScL51hnYJXAOLbavVzAkbOXZUWNSX84M97JYftDS6ke+TNrJZ7fT4h7Kt6pGSF8NKKSKQVG85K9Tiks5xtGEw5357/sqrKU+h47w/dGR4GDpnIBoyvw/Ro4MlXLLI4UtnWSvn2WrdBP2ukZgQyk7iZscOB1lChe9kcfWU4nOaqV5Cun9vn22yQGlyJBKfPFpZCGKr5FABgvNp+uBPq0ZFCs+lUfn48d2kVkLiYI4YVOFQuN3EsubkwHcwvrjpcu7lYz6SXwU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199015)(186003)(2906002)(2616005)(66899015)(6512007)(6916009)(71200400001)(36756003)(76116006)(33656002)(91956017)(41300700001)(64756008)(122000001)(4326008)(53546011)(66556008)(86362001)(66446008)(66476007)(66946007)(38100700002)(6506007)(4744005)(38070700005)(83380400001)(5660300002)(26005)(8676002)(54906003)(316002)(6486002)(478600001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <862345058CCF3C499B38B6D4DFA82034@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cc69656c-f03b-4dac-950d-08daac6ed87b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5WN4a8WvwEH089kOcatv74ob2y21hRWVbrSCI4nrzGZcTi2Xje9ZtSEpbj+RuxROBQc17AONWMIGU8NoYQYnNxKzYafaEo6MjKdabqOGA/rCL07G0qc7PRXG3TKwMGENaLIR05C2stKzrMxD0q7w9acKPswiZVellENMfTqGoxZW368g71lFNwivlx1GP4gOiTQbu3AjIb9JwId/7Wy2Bl3UMCFAfxnTqZLfxAuUQ9TVIqmc9CmRKwA3eEun5cOwV8tslkHb1yq/ku7TNLxqTV3OcdpU3AmlJPLVpNE+FJ7j1p70Nl43ew231ARiumz6QTM2sM2UDusQgMN1jLYBtlBKwUKotTdUgKcyLiikCDr/y7W3G+OkgSLdjpgpoHu1dumVD7VDn7qfNYqd6pOp9Oif3iIq8XOtimugqS4pIa/s1ngcAFHc5cOZOSQ72lUwlve2w+RDcFenYffHkHKunPcAhhIDaEvRhSjk6tHM4zvj9JL/7nHH8BGjS1FaR1mWTbP76piRb8pkZFRc4ZlXZAw3Df5q3IhwpSAGXiBfNRI+MoAsQXq74I23SOH08hRGqkP2SBglAv/ZZ0DIgUEro0KkvH94pKo3GyHOxp/eHkUWo510mmLnuPUz6eDhyE2dKj7bWfhGJQGpPoyjA3mY4+tgMwYNCo21uWhgssXMhFI6ea1cXnkYjeXnRgIEddxzuPNVt43WHhG3UYygOjiUNrFhhrIcRbe0YuNowp6dVr03gkZdxAwDQJt4BQQ6ySduQiAiNdF0NEfVhudW9NuV7Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(66899015)(36756003)(86362001)(33656002)(82740400003)(40460700003)(81166007)(356005)(4744005)(6862004)(8936002)(5660300002)(2906002)(41300700001)(70206006)(70586007)(8676002)(4326008)(6512007)(40480700001)(54906003)(83380400001)(26005)(36860700001)(6486002)(47076005)(186003)(316002)(336012)(478600001)(53546011)(107886003)(2616005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:29:01.0959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a9abb7-3629-4d62-970f-08daac6edee1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6670
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 16:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171668

T24gMTIgT2N0IDIwMjIsIGF0IDA4OjI1LCBBbGJlcnRvIFBpYW5vbiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8YWxiZXJ0bz1waWFub24uZXVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IA0KPiBJdCBpdGVyYXRlcyBvdmVyIE5JU1QgQ1ZFIGRiIHllYXJzLCBidXQgaWYgc29t
ZSB5ZWFyIGZhaWwgdG8gZG93bmxvYWQsIGl0IGdvZXMgb24gYW55d2F5LCBhbmQgaXQgc3RpbGwg
bWVyZ2VzIHRoZSBzdWNjZXNzZnVsIGRvd25sb2FkcyBpbnRvIG52ZGN2ZV8xLjEuZGIsIHdpdGhv
dXQgcmV0dXJuaW5nIGVycm9yLg0KPiANCj4gSU1ITyB0aGlzIGlzIGEgc2V2ZXJlIGlzc3VlIGJl
Y2F1c2UgaXQgbWF5IHNpbGVudGx5IGxlYWQgdG8gZmFsc2UgbmVnYXRpdmVzIGluIHRoZSBDVkUg
Y2hlY2suIElmIHNvbWUgZG93bmxvYWRzIGZhaWwgZHVlIHRvIHRpbWVvdXRzIG9yIG90aGVyIGNv
bm5lY3Rpb24gcHJvYmxlbXMsIGN2ZS1jaGVjayBzaG91bGQgcmV0cnkgYSBudW1iZXIgb2YgdGlt
ZXMsIGFuZCBpZiBhbnkgZG93bmxvYWQgc3RpbGwgZmFpbHMsIGN2ZS11cGRhdGUtZGItbmF0aXZl
IGRvX2ZlY3RoIHNob3VsZCBmYWlsLCBhbmQgaXQgdHVybiBhbGwgZG9fY3ZlX2NoZWNrIHRhc2tz
IHNob3VsZCBmYWlsLCBzaW5jZSBkb2luZyBhIENWRSBjaGVjayBhZ2FpbnN0IGEgY29ycnVwdGVk
L2luY29tcGxldGUgQ1ZFIGRhdGFiYXNlIGlzIGNsZWFybHkgdXNlbGVzcw0KDQpZZXMsIHRoYXTi
gJlzIGEgYnVnLg0KDQpQbGVhc2UgZG8gZmlsZSBhIGJ1ZyAoYnVnemlsbGEueW9jdG9wcm9qZWN0
Lm9yZyksIGFuZCBpZGVhbGx5IHNlbmQgYSBwYXRjaCBpZiB5b3UgY2FuLg0KDQpSb3NzDQoNCg==

