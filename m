Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F7FC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:16:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web09.19704.1666620994309793632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rG/yLk7p;
 spf=pass (domain: arm.com, ip: 40.107.8.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XYYDFLYLLNstIQ79Jl9Fi8u0aq7v+MkaiALF0aRFZzkBLY362/yRRI6yiYefP79PiRlgxURn6rD5BlM26tPrKI36ng422t9WPk+7XXCmT/GKD92lnfIsauq7jq3JG7tK00kPvh1psyHp1MHWK4pFP+Th8bSFABx5sCxBIw2DK+BuLDDQnGYzDnVJLbN58Bq5L3xDjInD7ZlT6BFgSmENPP8+Yu4glUwsWR+Bw/hqPS+CNdjpJ3MWEBxv5usiHzqSDU2Go/9B9iB6p4HUocEjL5+Naxf+5/BKPhVAd9iTH0XwbcVNTe6b0kJmtP6bG5UiUy+p4tG/0QulSqy8GHQESw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e0S7V5YzJnb4QrPRGQMePtuO1i1L95dhUSrjGrEiaI=;
 b=nVqKmmppJ3jYYkLJw7tdiVJ0QgHZhSyEqqahieCjHXKTn8bI800gFdr94aU4fO84v8Dyiy2Jl+GYq0vgoFyo6t9+t30crJgkmE6OufqEWPkeNUrm1m4TumqL2pmo8wWNF0zg5AE7ajabHIgcjmzY8AnQ/80twseE7BOVKDN7x64qh97BrVk42eCy3dpQdYls/hJbJ0cZHffNesufLvlaz1aqViHPlBTw68aPrBk3IYUrUcjC0KjCzIWy98bI+xsKKOesKu01urPUF1xBybGencw2IsCcyYVKlAa1RKXSrd9CuBzypkmnXQhNBrw5kQXHxKkHNsYCjxYAER5zkrewEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e0S7V5YzJnb4QrPRGQMePtuO1i1L95dhUSrjGrEiaI=;
 b=rG/yLk7pKQexLAmrNPEGeScjFvNsm0jQPjXRsEwXEPcJ20nYebJThhNT4exL18/tHV9XsHp8EBG07MJI6H3zqAlfZ/LsQTHGN6jRXyVZ0u9T6kCbclxBgIgctTatR5bvBPK9c+UXTGA750yRyIPiU4phMzKKtlU1RuQnRLgl52w=
Received: from ZR0P278CA0146.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::7) by
 DU0PR08MB8043.eurprd08.prod.outlook.com (2603:10a6:10:3e7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.33; Mon, 24 Oct 2022 14:16:29 +0000
Received: from VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:41:cafe::83) by ZR0P278CA0146.outlook.office365.com
 (2603:10a6:910:41::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Mon, 24 Oct 2022 14:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT034.mail.protection.outlook.com (100.127.144.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 24 Oct 2022 14:16:28 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Mon, 24 Oct 2022 14:16:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 196e0cfaf0d8a74e
X-CR-MTA-TID: 64aa7808
Received: from 2c5f5ff89d65.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1511112A-29B9-4FA0-9C73-60B235A1F2A7.1;
	Mon, 24 Oct 2022 14:16:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2c5f5ff89d65.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 24 Oct 2022 14:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVFYiKrAyZuI4Bb1NjAru0vlX6zfnIdu5g2WnpWYH9DydsXvg114f7bjaYuDON0h7Ym3UAN4cRJSHO4w1FdYuJKdwB9oWGWrSHeuWC0fDoLCAyubYDxRvlzi3lJHZaJE3pqc16DOSfPZh28fQvhVRfnQNoiwF2zqr1nqpbZtqo+hr4xJw01/7uAJibzLAnHTA3ZHcnZOHHLRfuTH7dfFWt2E7vplju73xWNIcKRSxVtub+gRxS8cTNh69the59Pf5Z0jeEVMC+rE/k/TiNyrZQWFbax0K9vGpg04orziZbde2/qa4oGGChmmbrCuCR3HhjUcMxkG+yFvtPRdOdvKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e0S7V5YzJnb4QrPRGQMePtuO1i1L95dhUSrjGrEiaI=;
 b=e5WxveHpgmysotVux/Q/f7K5SmqGBXRPBL8AoRg83piAJ7HA54Zb+BF4z8/8MebcUXG34iOnAGWrmyqBBJSVlYg5ZXSsmtGI9d/zhCoqggJEwDzjgtRCeQw9EN/aaHp8NkwauSgowS6Lq9NCq/9EtH5IyLHeILd7d6HH/krDg+pdC1LOjet77crC4CclSsjML1fzjjD/tsgbKiCHtbPvuH1PJcXBa7iVwCMmIA9AUqN7S3qZAF14tD1won1wa5lNyg+WOy+Ovi4D61NTiQbGy76+qRtZSQZi+keduWAbxkw8wOYgmXrULer0ctFAR9orU6DpSBlOMxzk/r9l4gF0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e0S7V5YzJnb4QrPRGQMePtuO1i1L95dhUSrjGrEiaI=;
 b=rG/yLk7pKQexLAmrNPEGeScjFvNsm0jQPjXRsEwXEPcJ20nYebJThhNT4exL18/tHV9XsHp8EBG07MJI6H3zqAlfZ/LsQTHGN6jRXyVZ0u9T6kCbclxBgIgctTatR5bvBPK9c+UXTGA750yRyIPiU4phMzKKtlU1RuQnRLgl52w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7905.eurprd08.prod.outlook.com (2603:10a6:10:3b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 14:16:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 14:16:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 23 Oct 2022
 02:00:01 AM HST
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun 23 Oct 2022
 02:00:01 AM HST
Thread-Index: AQHY5tdvOqptg3gABk+rB3ZcJBN8f64dmK2A
Date: Mon, 24 Oct 2022 14:16:18 +0000
Message-ID: <C7D32E04-9415-42FC-A208-C70A726C2AEA@arm.com>
References: <20221023120302.93D7B96217C@nuc.router0800d9.com>
In-Reply-To: <20221023120302.93D7B96217C@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7905:EE_|VI1EUR03FT034:EE_|DU0PR08MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: 79538ce0-09a0-4353-ca5c-08dab5ca57dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +I358KrzNApLN0uN8Xp8dc5KkVJDo8hbGAOrMV4Ffzp6sq7Sjg3Cj94nAksMC9h7ROTfyQWfWxWVoYITpyph35IsyqT/5yJsWhr5MVG4r03GKn1U9gRJVUBKsZFYO5rFQ4lZpb7MOTiO1/MelmxDk4GUTvgF4u5w3uo6y1CwuyVJfnMjZnGVA7I7+SQC8u9H3ZEBLwxwVWg1WulIDNjx7LZ3CFrzDk/U4Yv7BjpQMmy1TQUSgZOXiSyZiyCCFLqQnOGP12Y/tFk50Z5ouweISzpYTGRpkX8krPhXZo7BSCEvVep6zeD8Ea0zXWILn2FEnR14HaJsuNLnwQQooKW+cxskhzimsXTreTnKbt3vUgsjf1BOsf5CaDi4xOJHhzbPpImoqHBWrfztLDfKQ+Qlnnon7nizzVLuOFaa68heeRkoawCW5lKUz5BYtESdmhNbCgdBoKyNfIbrce5ALhZycZlE8hxTvF0LWp12MZhR32jcu8JybKXguN6xLNLqCdF2+l7lU4cYSNo+V/ttGRX0DOdELKAU0wwJzl0gW9px6BgutCqJ5I7cwZiN3TxlT9DtAJ3uvt2OD9PMTErJK1fRh1TNl0XNatMsksF2+qBzqQh0EGOd7V3W9BkQmaOpUJnoaO/2sG3TOaM1ljItji5DVvxPGCQjq2jR5gkiBAoq02AC9dMQV8LClUB7oaUa0u2f4Q5+Ot65pLAKhIUk9QVtpMdQXB9SmqeLJE/WQ9f9rpp36WkDUFL+kdYYazjjVmcJRDhKIjuUZp+tgTtu4y3+D+uZf6nk6WzR+CPAdO7teY9FOqvUC1XyruS+PhVR2QLWA8iuvRGN/PXBG0+uGK+6Dw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199015)(86362001)(478600001)(6486002)(966005)(71200400001)(4326008)(76116006)(6916009)(91956017)(8676002)(6506007)(66446008)(64756008)(66476007)(66556008)(66946007)(316002)(53546011)(36756003)(41300700001)(5660300002)(8936002)(4744005)(26005)(6512007)(54906003)(38070700005)(38100700002)(2616005)(2906002)(122000001)(186003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <517AE19D430A6B47A30FB38FBF1FB98E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7905
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c69ba22a-c586-47bc-6f64-08dab5ca5170
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ES0C0uO6DbV17UUjIcb1BzLNew0istWwbWhR6k38QYqyq6ePb/G/bIqM5d/BJDrO6ZkK4cBkZ+1RmgPf5zFVmnkQiLEhMNpfciRUTeiCpoHfAGkK4zimTPd4aBttiaUpEQC6C78omDdUlfTK8Vv7uTk34zhtc7v3SOtxj0UZBtTdsCuzkDoPYLz10dcIjrZhQ8XJ5gs50aOQhcaeVbuaUNu2uisOxvCaQ/oEAcbrO3A7+Eb0wq25/QPdWA2i2gi9MD7AMTqXZX57oyTgQb+/+OOMleVHpMQqgfSzUXkO4XvHjgddQ71gqJx4fGda8ENHxXv5MRhndSd0RgupPKlLbMWUdPal2Bc5EsEjWtXdpbaprQwBYv58VJVi2/8PvvVWEDxGCnokEIC16dzaJmZB9zyiNWhCgzq3wDTSJIQdTBtGILHH57/jlEUlKIFWdDVEXeKHAaDgKcl3Xueb4BHPGnon/QKAe6+tGusl3B+vJwQyrwaC3h+u5zhqzEi35UjoX9JAxej72nRfoWCe4YCfassBNIFbBMtJU08iSqlwRb6CXweP+T8GWoh5GAd0umDNtZjoRSbaH7eoHUsaHiGmEDBdt2yXPPYuzHAYu2VHUNT5UJzfCALl787Ip5uAHiCuuK/2xtMjFBELM/y+8yUN9VGQjZEhkrp7tjiOZD/QSS+67CjyKruqqGO72/gvZzcgOXaPZh1AZIhCUuHt0JsVQU2uUUvTqgkQUbwOMM7UwyJkCrkgEVIfqy9QsOZz+/+abPNFnZyx1fAdl7tJ4x1tgLhoX101YpYp2vdnXk4kJ6M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(81166007)(2906002)(4744005)(40480700001)(8936002)(356005)(6862004)(82740400003)(41300700001)(8676002)(47076005)(70206006)(40460700003)(70586007)(4326008)(36860700001)(36756003)(86362001)(53546011)(54906003)(478600001)(336012)(33656002)(186003)(2616005)(6506007)(107886003)(26005)(6512007)(82310400005)(966005)(6486002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 14:16:28.7427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79538ce0-09a0-4353-ca5c-08dab5ca57dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172087

On 23 Oct 2022, at 13:03, Steve Sakoman via lists.openembedded.org <steve=
=3Dsakoman.com@lists.openembedded.org> wrote:
>=20
> New this week: 17 CVEs

!!!

> CVE-2022-3550 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2022-3550 *
> CVE-2022-3551 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-3551 *
> CVE-2022-3553 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-3553 *
> CVE-2022-3554 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-3554 *
> CVE-2022-3555 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-3555 *

Patches incoming for this bundle.

Ross=

