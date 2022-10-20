Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E339C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 10:01:05 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.48])
 by mx.groups.io with SMTP id smtpd.web09.7921.1666260060133229571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 03:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=CaRVn6v7;
 spf=pass (domain: arm.com, ip: 40.107.6.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=epHDATuJnB+/njO8gMtvqEEJy6hWVDce6YvmZ90Lx8u/KT0k1KC7PlFyFKpy2yDBLLBnxpOWwyVjUD827sSwW9jG0wvluI27Z+soCY8zXrUp9vI+GCwOWBv+L9kl5N6WiXY61OoR7YcfRlxcXn/lZuO0P2SAcT4kxQsyjj6cQvxBqe5C0imQL+mboFc9D0a4G2sdWaEwqgGRkqQGAlvSrVzafELVHvFDVGxHDm+2Bc1parySmyr5Krw/Z4QecaDDaANthYEitxL1C7wzFgplsYzgq4U7DSvSAhYGcNG4giUfJH6yALBwKmuBB7tUor0TYJQcKAEXMGONmlh1i+tlCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIhAq9mNyrhoI7vG/2lNsd38KtffXgzVXtp3GjPahoU=;
 b=UMP9ZyZrC7oHikue79FfclTy9nfi62nJ3HmEJlSAsaqNg/QHz+GIJprRLNYBKMuFC6cLbK4iRVKooC+/C5ne1AWLX7Ks7GQ+qK0fS9ETjuOhu/Iu9RE0szTyqBUmHm0DRhGNH49YeX+W/nGChwrLSvaYFMpL/Np2PQnOddoxI1p5kFLtcpOqJOXZH3EZwaQ7PnEqvQQTZhVr3mPnVjbcNq+tTicGtd9NW3x43dOMZQXrgfSY8xF05I5m//d3R7Q42WD2Cc1u85rm61lGh0DK/8h/iMAVu2L9NDtugYvquDSctPc22NPb/cyuiSaT00K/i3IlngnLEm8MC2orYz4hQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIhAq9mNyrhoI7vG/2lNsd38KtffXgzVXtp3GjPahoU=;
 b=CaRVn6v7arPBm6b35fM8Znn+UfXJXL26debyQ774c5BdROgKQBr36/JL+19dGTF19H4Xkibjxxt4kRli/vMpSSCzMekGI95mAMxB3F5d1liSKhwRM1O9AvlhxKZ3js0purU6+9EKXedJXfNdbHvj9T0EkizEyPbqmecdaQDZNf4=
Received: from ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::17)
 by DU0PR08MB7836.eurprd08.prod.outlook.com (2603:10a6:10:3b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 10:00:56 +0000
Received: from VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:22:cafe::2e) by ZR0P278CA0084.outlook.office365.com
 (2603:10a6:910:22::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 10:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT024.mail.protection.outlook.com (100.127.145.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 10:00:55 +0000
Received: ("Tessian outbound 58faf9791229:v130"); Thu, 20 Oct 2022 10:00:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5b01528af9ab9ba
X-CR-MTA-TID: 64aa7808
Received: from 00914521a97f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F9702FC2-05A1-4BEB-B903-F96BF787E32C.1;
	Thu, 20 Oct 2022 10:00:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00914521a97f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 20 Oct 2022 10:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtdvSPp/NotjfaQtzEwI/Y+JjT72czhz4fbBwH57QcqocVgE6UxT5sAqaebloVZN2xlgenMRdIlhBz9+RQDeZ81Q990O5DBCW35nJAlg3I9l+klBumVBV9eRZO06l9wPK5Vuu/6Cr5DX9/Qh5PQyEl7/TZULu2EqRuQAqGqGkmL764exL0lfrmfp25HW31M9DQTNGei1rgOJHJx/jSIRjtCWg3DaHU2tIejSmmEgO2u6K5HgF9F71J/19yX0Dbarfqevg+bC1qx/Yxh1NByMzME2OXhyZoqncyF2f8PLK+dUtdb7KmjIe2+Zv1XpvE/c+nQIG2ZZ0YFriHCZc0ipJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIhAq9mNyrhoI7vG/2lNsd38KtffXgzVXtp3GjPahoU=;
 b=hMOIt/l9qZ/Q4PH89U/uOKsyxLxYL47Xyfdv2Jz6+YMeO2XcpFV7wtzUEGfIlLaGo05cYTWpFrVy3hmQqGdexyIg8IqhkD/OgScbr8LsC7KdtANgGUA5+OrmXLkM7fCbMjzu2S3J16lP+qlqHPJPTb7nT/UXLGi9Y9AKJC/Do9957P0lmMBTP29guABsw62NGljXOAt4ckeHSmdEuHCMGhXUUdI4TP7Yuis563cGlLLU7PMi75w6jqSpuhRgqttFUKmpXEHeGyXqRJ5zrXCh0KGsjUggKcQdnFXAvwQY18QzZywEPeymzZ9uWKKHmpbqv9Hq763pQvwSD3+PTanZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIhAq9mNyrhoI7vG/2lNsd38KtffXgzVXtp3GjPahoU=;
 b=CaRVn6v7arPBm6b35fM8Znn+UfXJXL26debyQ774c5BdROgKQBr36/JL+19dGTF19H4Xkibjxxt4kRli/vMpSSCzMekGI95mAMxB3F5d1liSKhwRM1O9AvlhxKZ3js0purU6+9EKXedJXfNdbHvj9T0EkizEyPbqmecdaQDZNf4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6097.eurprd08.prod.outlook.com (2603:10a6:20b:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 10:00:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 10:00:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hprajapati@mvista.com" <hprajapati@mvista.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][langdale][kirkstone][PATCH] openssl:
 CVE-2022-3358 Using a Custom Cipher with NID_undef may lead to NULL
 encryption
Thread-Topic: [OE-core] [master][langdale][kirkstone][PATCH] openssl:
 CVE-2022-3358 Using a Custom Cipher with NID_undef may lead to NULL
 encryption
Thread-Index: AQHY5DscnLPIqlEN9UG9UZ314uYSIa4XDS2A
Date: Thu, 20 Oct 2022 10:00:46 +0000
Message-ID: <E3D1FEC9-41F7-4808-95E3-2054A79622CD@arm.com>
References: <20221020041808.8356-1-hprajapati@mvista.com>
In-Reply-To: <20221020041808.8356-1-hprajapati@mvista.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6097:EE_|VI1EUR03FT024:EE_|DU0PR08MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b03dae4-0182-46a4-b550-08dab281fb06
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ROz9fEuHwZzbNnGF4wTzynCffcI6kNNUz4/PVgmyRd6kkRIO4iR53rs7LZxZvpBPR94dm9gvgbif2G6evjyhfcJuHkykxWhjrkn8vZkmk4OaTx3or4jjJRnriaq/no83phrISYlJLGOCXZPjXf0LS8L1OBYw18IzjDRzlfBMiJGEQu/+midwQa8hxp3rS/oM4FEm7RUxsHCpLojPfJdCucZ3C1C7meGEngsTPXulpC4vcHPcUZgjy1oWRUnLZ3lBqBCt3zMA9hCuhbLD3aVGedwelXNOaGx/vBdpWihbIC7V/xpYi2bz0PRBxtHw4iRgU5zo8PZvqbMuoWcLXb0cviLsxr+OdeKAxuqgHGB9xwHV51Dw8losRMB3+Gxcgz/E8t78mgcN1+eZQvfVJAWgcFNfEUR6YlUjcZzS4Hs+L3XRT0/7ew07pGMvtTBQx1VBFasYyrYjGow75gJ1Wgpu5TATyhBre3FESn1Ks+dLUY5gIiuzrjRJcha1BAkHO115jN+6cQq3uODDVK+0kG3Y/rOkwreO0kWU0Mqb4fRacjS/uLGR4+vA5aT/5sBuTBWZgzK+rTEi2FmCkiD6pvLbfsQxzff3ktIfOksnjTKlIcVkj9d0bGSGs87VNE9JtfucY+dBkVIsNjfKkTjfXdhi1DwFEzBLGxvo4XyYwB5vusBSh2BIJvgFSs86uz5arNr9QBIwGZ5Vv1UpswpMOmLZ1f/vorOqKIk8jJ3Z2j/AcgUT2Zlratqa92qll51IqzX6WyU03vOV0p1buJHJGNXQWOg0CUWdcNfosQPMotvD/k7QEq/YwiO82bL9eeScRBCmSTZTTHhhrXL9ATMfbXm9dg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199015)(83380400001)(6916009)(6512007)(86362001)(5660300002)(2906002)(26005)(6506007)(53546011)(186003)(36756003)(2616005)(8936002)(33656002)(66946007)(316002)(38100700002)(66899015)(76116006)(6486002)(91956017)(122000001)(966005)(38070700005)(478600001)(71200400001)(41300700001)(4326008)(8676002)(64756008)(66556008)(66476007)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4063DC24DF9A146BED97761A05B1F91@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6097
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	422ade21-8f36-4904-83aa-08dab281f542
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cqw5w3Q7UB+I949ke1pR0ZIRF3J/VzAWAIAXpDkavGeXyDdO4jgEiJQicbEjo+tm2DVCtQMMTZTZN2+BYw1nkfGHaK3exo33/YUWIbhh05ceqhcwWedaALRaRh6JlasbwrH0eZ+a5Y/iapbhZSxdXethp/pqWQHcj8JsxqnemU7w/fF6xeqD1m9F0AOSO5U7b80/cLJZlPMhDldjALuyFyW2XvgK3wAECHO4hnbjVIqWBGqSEWb0BbLCMvccCJgMrMFEJOmQlA8uR3NLnzby2KejxJpWyqhEUNRAH/GwiGMGvlhyh9RHDwCa6KrtSoWRUg8dfyKhBKLdpMdCkSMZBs8yJfjTycnDCj78dxbkOmWb9PD3hhskeaqE33LLiTv2hJl9PfwvIRnJUe4j2Lrs8hI5EIPxUpOvTPf/p2fvZjiXvbx07HCz5daF0/aX+9fWASEs+meYcaPkO79irlDAIbC2bRCmCE1BoCih5Dnr0Q9fnctsufjdxCtaf9pED0mqiC39OboDDLhTLpVUPgCOOplrHgISU5u6DpQPIE5AavaSxPBv6rR75tp7jlElQfY8c1r8HEriYzxJCh/9V4/edY8Ov58anFItz6+6D9fpVYVCslX25P+9ks2urju9glrbBbBlmJkRxh8VeJ6StGyUHSCFufrOqdEaDzB174v3NUdrLH9JpOin2w24aTG0VV+yOmgB8eRybI1Fw+8rZh2z5Yb2Tg8yS1HiWqiiZocI+56i/dIl0+XQHE65183jqSapkXxDottwrwctvZAggfXmE6Q5qa9Tmp/LnJbkS6yAgdg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(186003)(6512007)(53546011)(26005)(6506007)(2616005)(36860700001)(83380400001)(2906002)(41300700001)(336012)(5660300002)(47076005)(40460700003)(40480700001)(316002)(4326008)(82310400005)(8676002)(6862004)(8936002)(70586007)(478600001)(70206006)(966005)(6486002)(33656002)(36756003)(356005)(86362001)(66899015)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 10:00:55.6986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b03dae4-0182-46a4-b550-08dab281fb06
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 10:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171989

VG8gbWFrZSBwYXRjaGVzIGVhc2llciB0byB1bmRlcnN0YW5kIGluIHRoZSBmdXR1cmUsIHBsZWFz
ZSBpbmNsdWRlIGluIENWRS0yMDIyLTMzNTgucGF0Y2ggdGhlIGZ1bGwgY29tbWl0IG1lc3NhZ2Ug
ZnJvbSB0aGUgY29tbWl0Lg0KDQpJZiwgaW4gYSBtb250aCwgSSB3YW50IHRvIHNlZSB3aGF0IHRo
aXMgQ1ZFIHBhdGNoIGRvZXMgSSBuZWVkIHRvIGZvbGxvdyBsaW5rcyAoYnV0IHlvdSBkaWQgaW5j
bHVkZSB0aGVtIGluIHRoZSBiYWNrcG9ydCBzdGF0ZW1lbnQsIHdoaWNoIGlzIGFwcHJlY2lhdGVk
ISkgIElmIGl0IHdhcyBpbiB0aGUgZmlsZSB0aGVuIEkgd291bGRu4oCZdCBoYXZlIHRvLg0KDQpS
b3NzDQoNCj4gT24gMjAgT2N0IDIwMjIsIGF0IDA1OjE4LCBIaXRlbmRyYSBQcmFqYXBhdGkgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGhwcmFqYXBhdGk9bXZpc3RhLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgZnJv
bSBodHRwczovL2dpdC5vcGVuc3NsLm9yZy9naXR3ZWIvP3A9b3BlbnNzbC5naXQ7YT1jb21taXRk
aWZmO2g9NTQ4NWM1NjY3OWQ3YzQ5Yjk2ZThmYzhjYTcwOGIwYjdlN2MwM2M0Yl0NCj4gRGVzY3Jp
cHRpb246DQo+IAlDVkUtMjAyMi0zMzU4IG9wZW5zc2w6IFVzaW5nIGEgQ3VzdG9tIENpcGhlciB3
aXRoIE5JRF91bmRlZiBtYXkgbGVhZCB0byBOVUxMIGVuY3J5cHRpb24uDQo+IEFmZmVjdHMgIm9w
ZW5zc2wgPCAzLjAuNiINCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhpdGVuZHJhIFByYWphcGF0aSA8
aHByYWphcGF0aUBtdmlzdGEuY29tPg0KPiAtLS0NCj4gLi4uL29wZW5zc2wvb3BlbnNzbC9DVkUt
MjAyMi0zMzU4LnBhdGNoICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKw0KPiAuLi4vb3Bl
bnNzbC9vcGVuc3NsXzMuMC41LmJiICAgICAgICAgICAgICAgICAgfCAgMSArDQo+IDIgZmlsZXMg
Y2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvQ1ZFLTIwMjItMzM1OC5wYXRjaA0KPiAN
Cj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3Ns
L0NWRS0yMDIyLTMzNTgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wv
b3BlbnNzbC9DVkUtMjAyMi0zMzU4LnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjE4YjJhNWE2YjINCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC9DVkUtMjAyMi0zMzU4LnBhdGNo
DQo+IEBAIC0wLDAgKzEsNTUgQEANCj4gK0Zyb20gNTZlMWQ2OTNmMGVjNTU1MGE4ZTNkZDUyZDMw
ZTU3YTAyZjAyODdhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb206IEhpdGVuZHJh
IFByYWphcGF0aSA8aHByYWphcGF0aUBtdmlzdGEuY29tPg0KPiArRGF0ZTogV2VkLCAxOSBPY3Qg
MjAyMiAxMTowODoyMyArMDUzMA0KPiArU3ViamVjdDogW1BBVENIXSBDVkUtMjAyMi0zMzU4DQo+
ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0Lm9wZW5zc2wub3Jn
L2dpdHdlYi8/cD1vcGVuc3NsLmdpdDthPWNvbW1pdGRpZmY7aD01NDg1YzU2Njc5ZDdjNDliOTZl
OGZjOGNhNzA4YjBiN2U3YzAzYzRiXQ0KPiArQ1ZFIDogQ1ZFLTIwMjItMzM1OA0KPiArU2lnbmVk
LW9mZi1ieTogSGl0ZW5kcmEgUHJhamFwYXRpIDxocHJhamFwYXRpQG12aXN0YS5jb20+DQo+ICst
LS0NCj4gKyBjcnlwdG8vZXZwL2RpZ2VzdC5jICB8IDQgKysrLQ0KPiArIGNyeXB0by9ldnAvZXZw
X2VuYy5jIHwgNiArKysrLS0NCj4gKyAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2NyeXB0by9ldnAvZGlnZXN0LmMg
Yi9jcnlwdG8vZXZwL2RpZ2VzdC5jDQo+ICtpbmRleCBkZTlhMWRjLi5lNmUwM2VhIDEwMDY0NA0K
PiArLS0tIGEvY3J5cHRvL2V2cC9kaWdlc3QuYw0KPiArKysrIGIvY3J5cHRvL2V2cC9kaWdlc3Qu
Yw0KPiArQEAgLTIyNSw3ICsyMjUsOSBAQCBzdGF0aWMgaW50IGV2cF9tZF9pbml0X2ludGVybmFs
KEVWUF9NRF9DVFggKmN0eCwgY29uc3QgRVZQX01EICp0eXBlLA0KPiArICAgICAgICAgICAgIHx8
IHRtcGltcGwgIT0gTlVMTA0KPiArICNlbmRpZg0KPiArICAgICAgICAgICAgIHx8IChjdHgtPmZs
YWdzICYgRVZQX01EX0NUWF9GTEFHX05PX0lOSVQpICE9IDANCj4gKy0gICAgICAgICAgICB8fCB0
eXBlLT5vcmlnaW4gPT0gRVZQX09SSUdfTUVUSCkgew0KPiArKyAgICAgICAgICAgIHx8ICh0eXBl
ICE9IE5VTEwgJiYgdHlwZS0+b3JpZ2luID09IEVWUF9PUklHX01FVEgpDQo+ICsrICAgICAgICAg
ICAgfHwgKHR5cGUgPT0gTlVMTCAmJiBjdHgtPmRpZ2VzdCAhPSBOVUxMDQo+ICsrICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmJiBjdHgtPmRpZ2VzdC0+b3JpZ2luID09IEVWUF9PUklHX01F
VEgpKSB7DQo+ICsgICAgICAgICBpZiAoY3R4LT5kaWdlc3QgPT0gY3R4LT5mZXRjaGVkX2RpZ2Vz
dCkNCj4gKyAgICAgICAgICAgICBjdHgtPmRpZ2VzdCA9IE5VTEw7DQo+ICsgICAgICAgICBFVlBf
TURfZnJlZShjdHgtPmZldGNoZWRfZGlnZXN0KTsNCj4gK2RpZmYgLS1naXQgYS9jcnlwdG8vZXZw
L2V2cF9lbmMuYyBiL2NyeXB0by9ldnAvZXZwX2VuYy5jDQo+ICtpbmRleCAxOWEwN2RlLi41ZGYw
OGJkIDEwMDY0NA0KPiArLS0tIGEvY3J5cHRvL2V2cC9ldnBfZW5jLmMNCj4gKysrKyBiL2NyeXB0
by9ldnAvZXZwX2VuYy5jDQo+ICtAQCAtMTMxLDcgKzEzMSwxMCBAQCBzdGF0aWMgaW50IGV2cF9j
aXBoZXJfaW5pdF9pbnRlcm5hbChFVlBfQ0lQSEVSX0NUWCAqY3R4LA0KPiArICNpZiAhZGVmaW5l
ZChPUEVOU1NMX05PX0VOR0lORSkgJiYgIWRlZmluZWQoRklQU19NT0RVTEUpDQo+ICsgICAgICAg
ICAgICAgfHwgdG1waW1wbCAhPSBOVUxMDQo+ICsgI2VuZGlmDQo+ICstICAgICAgICAgICAgfHwg
aW1wbCAhPSBOVUxMKSB7DQo+ICsrICAgICAgICAgICAgfHwgaW1wbCAhPSBOVUxMDQo+ICsrICAg
ICAgICAgICAgfHwgKGNpcGhlciAhPSBOVUxMICYmIGNpcGhlci0+b3JpZ2luID09IEVWUF9PUklH
X01FVEgpDQo+ICsrICAgICAgICAgICAgfHwgKGNpcGhlciA9PSBOVUxMICYmIGN0eC0+Y2lwaGVy
ICE9IE5VTEwNCj4gKysgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJiYgY3R4LT5jaXBo
ZXItPm9yaWdpbiA9PSBFVlBfT1JJR19NRVRIKSkgew0KPiArICAgICAgICAgaWYgKGN0eC0+Y2lw
aGVyID09IGN0eC0+ZmV0Y2hlZF9jaXBoZXIpDQo+ICsgICAgICAgICAgICAgY3R4LT5jaXBoZXIg
PSBOVUxMOw0KPiArICAgICAgICAgRVZQX0NJUEhFUl9mcmVlKGN0eC0+ZmV0Y2hlZF9jaXBoZXIp
Ow0KPiArQEAgLTE0Nyw3ICsxNTAsNiBAQCBzdGF0aWMgaW50IGV2cF9jaXBoZXJfaW5pdF9pbnRl
cm5hbChFVlBfQ0lQSEVSX0NUWCAqY3R4LA0KPiArICAgICAgICAgY3R4LT5jaXBoZXJfZGF0YSA9
IE5VTEw7DQo+ICsgICAgIH0NCj4gKyANCj4gKy0NCj4gKyAgICAgLyogU3RhcnQgb2Ygbm9uLWxl
Z2FjeSBjb2RlIGJlbG93ICovDQo+ICsgDQo+ICsgICAgIC8qIEVuc3VyZSBhIGNvbnRleHQgbGVm
dCBseWluZyBhcm91bmQgZnJvbSBsYXN0IHRpbWUgaXMgY2xlYXJlZCAqLw0KPiArLS0gDQo+ICsy
LjI1LjENCj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NsL29wZW5zc2xfMy4wLjUuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wv
b3BlbnNzbF8zLjAuNS5iYg0KPiBpbmRleCBlNTBmZjdmOGM1Li5lZTA1MWVlN2Q0IDEwMDY0NA0K
PiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8zLjAuNS5i
Yg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8zLjAu
NS5iYg0KPiBAQCAtMTIsNiArMTIsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly93d3cub3BlbnNzbC5v
cmcvc291cmNlL29wZW5zc2wtJHtQVn0udGFyLmd6IFwNCj4gICAgICAgICAgICBmaWxlOi8vMDAw
MS1idWlsZGluZm8tc3RyaXAtc3lzcm9vdC1hbmQtZGVidWctcHJlZml4LW1hcC1mcm9tLWNvLnBh
dGNoIFwNCj4gICAgICAgICAgICBmaWxlOi8vYWZhbGcucGF0Y2ggXA0KPiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLUNvbmZpZ3VyZS1kby1ub3QtdHdlYWstbWlwcy1jZmxhZ3MucGF0Y2ggXA0KPiAr
ICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjItMzM1OC5wYXRjaCBcDQo+ICAgICAgICAgICAgIg0K
PiANCj4gU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBcDQo+IC0tIA0KPiAyLjI1
LjENCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUg
KCMxNzE5ODgpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzE3MTk4OA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC85NDQ0NzUyOS82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBb
cm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

