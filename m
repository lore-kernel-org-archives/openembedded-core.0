Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BE6C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 10:50:48 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.84])
 by mx.groups.io with SMTP id smtpd.web11.4300.1665053438581040395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 03:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=4X84d3aG;
 spf=pass (domain: arm.com, ip: 40.107.13.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QJDQxYakvz/ouLM5q1rDH53tVvYr0Sjzv7mrjQyS5aHoIBsFsZeQQ1hETbdraDzk2kQtHFh8ni9VzvNrQc4APWwareJgT8pGbD/AL2+uCLZjl+/QbjIO9iOc/WckMSTkJWvnkIwNHTrbplylCIAHGJRsJjpwlUcHdAn5kfcIYsR3lCLeVdWf1BHfFnstbXBrXOX7lFoMWQ2w81gQI58rmcXPhWlqaRU00yUWBkJe8caKiu2iHyfGcVRifwnrsfH/VUD1s8iVcNHZ64XUYPHVQsI3GRb+e4VynRcIVH4M8AnFaDKOldk0jEjhkIJZNBzh2MaszbZ+r37wLxqoHv1Wxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zylu7SA7aMmID4DgJFdnDJIfo8ztjK+ohdwGeBgq5HY=;
 b=DjwopGM3JAilWZEQOvR4r1yht+dQFq7w+zjMxC/GEtvTpBSHBa94ikYqbgN0yk96Kr8xNjniMcEK6rpmEhrpc90rhYClrUc7MMmRx8Nx+77TWFMQwiwTX0xZAK282VjGZ5JeR2+8Kb7U8KWfrjSOOkUy5XWAZ8zvU8/BI2caFp24bla8HyDeSRgm/6YRrQCz0TCMShJxEso/yINguoyZGYdRHAkpoZHBbVAxAWtGG8LSqjvn5HsY6zT50uP1JPzmvOCEeUMV+QniqQv1/epNQAWrOqQY2wFMWOaUlR9gviEOqvm4lm4wjPvCgPN+VU86zKQy0CVp9POg7kF9XWYN+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zylu7SA7aMmID4DgJFdnDJIfo8ztjK+ohdwGeBgq5HY=;
 b=4X84d3aG7FpP7nuOTOlTMYRY+c9Hq4g5DjAA9VwmnA7jEVmOupkRif4XXAqW+TyQ/sTG9HsOFsLHHmMAd83pLFo1CSce35Z+jghaisvPiqUiKemwU1S6XBUV3naSy4jrOSmj2d1lzWvb/+5sE95XoXyS+k+zGRxWRFQfaS2wDRs=
Received: from DB8PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:10:110::12)
 by PAXPR08MB7382.eurprd08.prod.outlook.com (2603:10a6:102:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 10:50:34 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::ae) by DB8PR04CA0002.outlook.office365.com
 (2603:10a6:10:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32 via Frontend
 Transport; Thu, 6 Oct 2022 10:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 10:50:33 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Thu, 06 Oct 2022 10:50:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2fe1eab6e9b75bf9
X-CR-MTA-TID: 64aa7808
Received: from 5599b87cb734.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B402B15-66EA-419A-BBCC-63321F7FFB6D.1;
	Thu, 06 Oct 2022 10:50:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 5599b87cb734.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Oct 2022 10:50:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/aBsv17q6AlxvlrLMw5kf5qzyF6bFjNLmGwqgTXPiZxzyBPgXHgEQwOhDy9VHjBt90Q823lijfmW6greSMgAgFWOc8o8E55xY0WvRWDWZTUkEFsTJQ8sr0vb+pPuq7pzCKoAr4P3OkvHFapVBww+weLLE6svB14ESjfgvdqSWps/uvDmPHQk0km22kqT3OPAXuE4Vo2QN1YWKf9PC2Q6I1uBExJ2YGOOJbPlN2OCh5wwJIenPkGjOOFVmTimX7ECQqxRZGZ5g8izZZCVW9M2I93rZWRgRR4ytEO0zwro3oI7vwEKdp3nKPISrdBiQtPutewj3bRoApfwtpxz39PIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zylu7SA7aMmID4DgJFdnDJIfo8ztjK+ohdwGeBgq5HY=;
 b=aiuZTweDsTmymokb8ttZ1haF0IpIpvOrfGViH2lZTCgySgKgZPBFTVn/9yrMN3jWN5EpdT9NcfeVkt1d8yZekd3MLTNlmlSuN06zn9IUu1LWgBJH4gV4isk7sVdrlefb9+yWB+aX5zB3nl91YDoYiL6oGwgfLRaoZ6SzwSR3MV+XbP3YVVX/6t4EVcN2sO2KCtmsDB+DzX8EPvC3SqfA+k0f596uOSItJxMxJoA5AJDuifXwHkOI48XhWfEIKiHEyWY168z33ap+lrwm3Ir6NgmUQDPCBn9cmuG76MJUYlUm3L31L+LCVV2mXzt96vCdZH/Aod8zqcGmu5T3ePfJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zylu7SA7aMmID4DgJFdnDJIfo8ztjK+ohdwGeBgq5HY=;
 b=4X84d3aG7FpP7nuOTOlTMYRY+c9Hq4g5DjAA9VwmnA7jEVmOupkRif4XXAqW+TyQ/sTG9HsOFsLHHmMAd83pLFo1CSce35Z+jghaisvPiqUiKemwU1S6XBUV3naSy4jrOSmj2d1lzWvb/+5sE95XoXyS+k+zGRxWRFQfaS2wDRs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5370.eurprd08.prod.outlook.com (2603:10a6:10:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 10:50:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 10:50:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] kern-tools-native: don't pull the toolchain
 as it is not used
Thread-Topic: [OE-core] [PATCH 2/3] kern-tools-native: don't pull the
 toolchain as it is not used
Thread-Index: AQHY1PXRx4Czbv5HFUCBzhmRbp19A64BOPCA
Date: Thu, 6 Oct 2022 10:50:21 +0000
Message-ID: <95AC8980-2768-4D43-B50E-DD2AF76250A9@arm.com>
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <20220930175440.2168008-2-jose.quaresma@foundries.io>
In-Reply-To: <20220930175440.2168008-2-jose.quaresma@foundries.io>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5370:EE_|DBAEUR03FT038:EE_|PAXPR08MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc03d2e-0854-43d2-7988-08daa788984c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fHeY+A8p/jOU79yFwcy5ZmzrcUKKXf9RFdDU1xU4fPVfAF1Mg4B8jdkEvScXtSPHv+YtXn6gZSjg0RKZq5cGpQbrrm5g2KPF1Da1mcNhkNI5Kl7HXgY68njX8fRbY9ydTCTP/Wm8R7/tF5SLYZ++xKDDU9heAXoowaKbhofYIBPCI6uStRGgcSCs3D+K2OuRKs8kMm5MxvR4dEPs5bMFMTOzRt0IHPPiviZdVKGDEuiE6gMaRGAsRnazeDx98mw2rtdUljgvyrY4mFDVfco6KuMbaQ5eJw16V3ospFIluxnlVsWg0F1Qh1JexRqANRtutL88MGLk3xh+Do0wBuHjl86BBk0rR/7PEhCv1Yv4SFkbwIjgBu88ZS4ZiwqNKGx8PNab5ur79HHFaTCBcg2AQI+wxk0VmeGjlSDorVkvLA/7H4lRPmLB3O2teZifpMwr21Ckl17HWgZbHGpVLCXxyqFKFo42m7MIRRRvXR6BtoVbgLkViBScns3LLRqM8UyPud1NI2QfNhny/2+qmP/6ky39NE/6CaGMOR2A4teSiXSO0TOSLSMtvlzGKVuR6PGAzEaBqYqObzfM1YbNdXck0kiA3eMO6ny2utDsBscZZ6WTx1tDrrG6PoAdTJOyh2xxuK3dZ4M5FjOW4nxex+PV4apsQ40waINqljhYB6Yy52pEGd7YB6R35rghAF0AixcNDlNqCiuKj0NO2kZHKvDqasd5ZZbNNnzgk58t7FlrSqhCgdkaHdRJrV0FccQiAAKNoFJ1TKOt8nmbaSaDxJXx5MywbgbYX2DH5Y55vIIrf7w=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199015)(38070700005)(5660300002)(122000001)(36756003)(86362001)(38100700002)(8936002)(33656002)(53546011)(6486002)(4744005)(478600001)(6506007)(71200400001)(66476007)(4326008)(66446008)(66946007)(66556008)(91956017)(8676002)(64756008)(316002)(6916009)(2616005)(41300700001)(2906002)(26005)(76116006)(6512007)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <08F7E0658597534F976547F128FF8459@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5370
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8ca1342d-602c-4dfd-8b2a-08daa788912a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TvfYv/hFk/RcWSOKQDY9+VYy81JvUnMpUsq6TRnlLKKCpPTbxQeR9CVqXSuI88ftQL7IuImsSDqBay+uCPu/NQkSpCR4gu0XZuVzK6LGFuPzH97B6hpQwkV3SilNCI27FQqM16xxs/xsbHbem8BJZiHZJTZFuPGKnCZotKKLUFk4x6thZSclpo1E5tmSTSPk+ipv9MSpne3lRsN9b70zUGqEoIyF/QToOYUpqs2z17f91n0l7M3GeSW7tCWX1VB1FgebFZ2Ol4UKT/yuQDbr1XWsJ9a1PAJyj+w+hw1hFbgSWfEOEycQF1MUV3wRfejteEzhWws4fYSnbuTPtRUp5MMD7JR9GGYCR99J8qV8w+lm2JbPBxSAYmJgtXkV91S3mtKjcDBmKhwBf3ozRslGtwbgvzZgQKaOfnE99nDy6mAMKaEokE/mNvRj4QbhOc5puc9gm70kvXssPbfAW2s2dxYhfaNXO7/bko/IKUqQ2H/ZH5QP1N0raVYwxXKIdHAsYAXYUykESYDtc5pwuRH2xvSOQ4zKDvEj4m9E/JqC5BYJd07ggw3QFV+U77zQe6z1HBoESjca+9JkFdS1r33mNEz+CAY/2M0WZuVfTEtmi7uleQHnNU6qPHGmMZwIcaZdKbqeDgljtLKYKEpgMOijpOZPafgnzlGr/KnVroKhrTF4PhsKec4yztqhn8bXiIj/HAhqKnIX5gTNkMsiZuUImBdsnRarM8NIjCjpR7FanwO8AcoicudDfaWolLIsF3/CMzKhQOFaTK/NKAB2930NpA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(6506007)(26005)(53546011)(4744005)(6512007)(478600001)(2616005)(186003)(70586007)(2906002)(356005)(82310400005)(40460700003)(86362001)(41300700001)(5660300002)(33656002)(4326008)(40480700001)(316002)(6486002)(6862004)(81166007)(8936002)(8676002)(36756003)(36860700001)(70206006)(82740400003)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 10:50:33.8729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2fc03d2e-0854-43d2-7988-08daa788984c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7382
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 10:50:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171491

T24gMzAgU2VwIDIwMjIsIGF0IDE4OjU0LCBKb3NlIFF1YXJlc21hIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxxdWFyZXNtYS5qb3NlPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IFByZXZlbnRzIHRoZSBkZWZhdWx0IGRlcGVuZGVuY2llcywgbmFtZWx5
IHRoZSBDIGNvbXBpbGVyIGFuZCBzdGFuZGFyZCBDIGxpYnJhcnkgKGxpYmMpLA0KPiBmcm9tIGJl
aW5nIGFkZGVkIHRvIERFUEVORFMuIFRoaXMgdmFyaWFibGUgaXMgdXN1YWxseSB1c2VkIHdpdGhp
biByZWNpcGVzIHRoYXQgZG8gbm90DQo+IHJlcXVpcmUgYW55IGNvbXBpbGF0aW9uIHVzaW5nIHRo
ZSBDIGNvbXBpbGVyLg0KPiANCj4gVGhpcyBhbHNvIGltcHJvdmVzIHRoZSBzcGVlZCBhcyBpdCB3
aWxsIG5vdCBwb3B1bGF0ZSB0aGUNCj4gbmF0aXZlIHN5c3Jvb3Qgd2l0aCB0aGUgdG9vbGNoYWlu
Lg0KDQpCdXQgdGhpcyBpcyBhIG5hdGl2ZSByZWNpcGUsIHNvIGl0IGRvZXNu4oCZdCBkZXBlbmQg
b24gYSBjcm9zcy1jb21waWxlcjoNCg0KJCBiaXRiYWtlLWdldHZhciAtciBrZXJuLXRvb2xzLW5h
dGl2ZSBERVBFTkRTDQpERVBFTkRTPSIgZ2l0LW5hdGl2ZeKAnQ0KDQpSb3Nz

