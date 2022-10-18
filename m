Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAEFC43219
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 09:52:09 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.40])
 by mx.groups.io with SMTP id smtpd.web11.4856.1666086725149155177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 02:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tbHdysLk;
 spf=pass (domain: arm.com, ip: 40.107.14.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KPh4Nl1SssmK5nKbZO4akAtAkERrCE9Pdpo236plyvFwPelNBZdZRs0c6PUW20FGhoRf1+44Vaw2s+JP1ldQlNC0K/vIH5LVTRsb7BoP+yuB0bKAupenZ76sO+AY7FkL6o8W3mo89ibIpLePqLiSaEyQnFSufFCqzwqCzas6AOKGlVsMFNXDtlyWfY7lpOvn5uMa1pMRbAXcNNBChjwhE6usJ5bKbLJTc8X/fZWk+mAo/ugkEb7URC3fcghbNcT0I7p7P026fdT/yGNNgb2Y6i48QdNnPkzKc63TsGHMFQU4vxgCFgG4/q15hXUM0/w1VVwbe7QRdgO+F+MisygLWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxQK7S/m9L1Rqy5wmDYNkE0YGAwKTFYTGZCoy2le+T8=;
 b=iv21yXyMD53kUPKJafRPk9IhvQbuvyIuIjv1ckL9XmRDku2oCNqXAnABNHTjab/kA+Q5gcRJ7fd1dPKt3R2pVF7AnS2nRed7mIvH8EY3eb9iNf7A33VgQgRYFElpPMTn8iBI7jEtPEbCo6TE7am4nqB+DkNwnuGfg3jkvvDM2g4hvIeonxWdlmmC4801OYqZEn5Ag0RhJW5eODqg6On6lpEvK2YIKLCgwIi+gSdW0Cm1NGW6CjIdXgJFTOfJ1bo0fvbCf29iOZ48/OwUwZkTE+nqRYj5d8Z0guCuyRG/bAzwE/r3JZCYHlg8tETpibPFjd+PuU90os5us6bujELEYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxQK7S/m9L1Rqy5wmDYNkE0YGAwKTFYTGZCoy2le+T8=;
 b=tbHdysLk6ymYUQiwJiDyvG0PHlwdigdHVVAbWVviqBnHhvuoS4NDokCH+1GHmFLzTdwQo0bZCl7oAFFv+jqh10lTv7mRjzOLtnTbe7ZCk/AUbc26PK9r8PcAcpO67mploYsLt3dun8lj8G5TFIpMGfDzGohfjBm+osSnweEwT04=
Received: from AS9PR06CA0104.eurprd06.prod.outlook.com (2603:10a6:20b:465::16)
 by AS8PR08MB6104.eurprd08.prod.outlook.com (2603:10a6:20b:299::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 09:51:57 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::d0) by AS9PR06CA0104.outlook.office365.com
 (2603:10a6:20b:465::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Tue, 18 Oct 2022 09:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 09:51:57 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Tue, 18 Oct 2022 09:51:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66a25e5cb8e8ab08
X-CR-MTA-TID: 64aa7808
Received: from a62ca63f7140.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 764905E5-CF34-400F-8E3E-14FC566F8330.1;
	Tue, 18 Oct 2022 09:51:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a62ca63f7140.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Oct 2022 09:51:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oS8v+TRULBVa06B87SkuYB4Uqv8bmkgm1k0DjzeR17F/G0FNZ9tZC5IslWEPt6yT5y0hOZNkPnUnFgc2eM/Nidt0Slyg5dHNkKZTUD0T2gGtkW2WAOuDjWO9Ryg9596UnB8W4ehLxr49Fy8nRBZGVbZfK4mMdLZbowTdt+Vlb9S92P4GgV5vHaSOo6/XiMTatHeMrhCNc12j/bocCbymwXrN7dO43KzcJ5z3zPvlAAqVfaIa7DYpm34IlIipRrmnyobJhiwgsyAimNlhX11gc4Qby3gZNyxQn3QmuuYauFtYQi6rQu4JdA6SU8lZIpiRWSuTnQNjec7JkPuEq5pqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxQK7S/m9L1Rqy5wmDYNkE0YGAwKTFYTGZCoy2le+T8=;
 b=mjrioWnrcVAJwbpGZu65ZnSuxSTwXTRqQHNdc2tXAiVPA0kC/UrdzSJ3dsJlagI7WB95CqoOR5sGsydX2ccC7ChL3PQZNutTQ8UYkQOaZ+xioT2u41wYnhdJakT1uYRmNwidjzwF76UW2jZKlH0uy+ZSsRRNVbfKXvXNjkTCibAk7QbNKun0h1v84v94AR4MEspOPO9F5K17mu3t2fYt8jifwLc/wLP/erLCrRJEhdThgNszs/cytZ7js1ezCdb1YCtNSLqLaePrjzPP/LrebToTsNqGuXQuayMsyTMidyH3Vt6V6inH0/8Cbj4UTMWXkY4/AeVLcT6mKhWcWtN3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxQK7S/m9L1Rqy5wmDYNkE0YGAwKTFYTGZCoy2le+T8=;
 b=tbHdysLk6ymYUQiwJiDyvG0PHlwdigdHVVAbWVviqBnHhvuoS4NDokCH+1GHmFLzTdwQo0bZCl7oAFFv+jqh10lTv7mRjzOLtnTbe7ZCk/AUbc26PK9r8PcAcpO67mploYsLt3dun8lj8G5TFIpMGfDzGohfjBm+osSnweEwT04=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 09:51:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 09:51:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
CC: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main
 package
Thread-Topic: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main
 package
Thread-Index: AQHY4ah+8Ri2p1RLAES4sRLEq+uqAK4Sf3KAgAAFVoCAAD5UAIABKAsA
Date: Tue, 18 Oct 2022 09:51:46 +0000
Message-ID: <B01C1FDC-2D0B-4D85-88B9-66DB5184A241@arm.com>
References: <20221016214357.596913-1-tom.hochstein@nxp.com>
 <8917BE00-005D-4ECE-BAB9-82EFC64F9544@arm.com>
 <CA+chaQewGSyDypShmVYKNBkcEZUHrNPQbmYpNfbn+Ph3g40bcg@mail.gmail.com>
 <PR3PR04MB730871C6334283026EF62346E2299@PR3PR04MB7308.eurprd04.prod.outlook.com>
In-Reply-To: 
 <PR3PR04MB730871C6334283026EF62346E2299@PR3PR04MB7308.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6556:EE_|AM7EUR03FT013:EE_|AS8PR08MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7be7cb-4c64-4e82-5587-08dab0ee6566
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XX7P1q+EbzVUKeHn7lL1xE8hWW5/yQA59xDZrtX/5i3xD8LpLNu3VVsCPTuqhE2Ow/ObktDGNvxgkAbYDxtQPoML01yBvUcI6MiBIuuCx7K5uDeShT7aWiD/RM2IoFcXn1WupCxhVul8mdOnKCOZ+IEgSTmzGZ+AWk2PpS2ZqCQbHEtu30uyS2sP3Jb5IJD15cG3/WRzYypyp2s0qlaYFl882MUDoyape/+Y0jFvkb4wj5LpOcpX7D/tjK2T4fFDzx1k3+8kNl10HvNMJx0yE6vEbn0jP3DQdAPjygLkO/JINjWHfXtKmMi7qp0w4lW1ouSwO/FLxc6/lDOsHBkw58eo71TobnKEfKJb7dhfhBd8+gJPkHPojHuQN7lMD9cvQnaC0ln5WoWeoNli6dGFpv8lnt/mC/2LJKw1xyOC9DvMApwXbIs1PG2CQh/CtW/f4NL7sPS0T/jSaywJ4jVLftgYaeKx52WOlwXtldzVYy+kl3JoQ+Ufr5iBfvfS8V4QULisIhQy0VJ9D3KpTMu/Ylv1eGpmlXpkHjXavcsyLXdbUPjocjyGF+AsVCxRhDRS0PmoIoQI2TXJUcIg7AHN+9/cQteQ7GU6B8+ACesyw4JQeJjuRCFH2ACExk2FEgh5JtzgieSyLiWlJ+rmWMpQgI4AVxPJ2lA7l0Pmvnd3nZ4KpR7+tMHC9o7NO40OjvbpOw40A4UZwf1IdQQ5WSsb/ewi+Wapz3j+Uv7JLepE68BTQUpSO7goH1VQRt8hHK/lczJl+ic5CzVFILvIUNSZ4pk/DjgqBpOfMZ2iHKgvCPb7xLMOU8ZYL7zCdtg4A4hK2lTwdBGtWnu/dUdtPbka1w94EevDXAQUVMB/ji0voLUxDn+fFWpcz2MtOBqQYYHX
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(6486002)(2616005)(186003)(83380400001)(38070700005)(86362001)(122000001)(38100700002)(5660300002)(2906002)(8936002)(4326008)(53546011)(64756008)(8676002)(41300700001)(478600001)(6512007)(26005)(6506007)(91956017)(316002)(66446008)(66476007)(66946007)(66556008)(76116006)(71200400001)(6916009)(54906003)(966005)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <12DA4C020F031C47BF7DDB59474AA75E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ef70461e-fd79-4540-863f-08dab0ee5ef8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lj7wVssFhFKWow/mmhQ4f9VAMja958Y9TNTETBCcDywI9k2yiWuA9Iyx3gnQZIQB8yhi66BLxB7CAbuxoRz3fPT16+tuutXht+n9cU3uwP/is6k6sJHX/4XF2cqwvoA3QQcp7xE4F6JB/R6tA+0wx3xM31cb9TpZ6CTst++YHVaaXUVu95lHFbLVE/p4zxiCydksPIhaUPZxJenxN+2z1OLLerHJye7JIK9TMZ37Z5OlDHp7yymXG0BI0N+//fRXrEWmREuL7II+cUeP0oCRXJrGj3YpayFsrwrE8fh6GmIwjjNrmwXMZMM/0qlGkhQquKOetEp5KPj2siUrqNOwpZ+n30cJ9HUQHWcMBAzqvma8147XtphYM0Ds6iDjiKDSKZuR4e2DFgWIwutrEbOoSDI83oicxdPhZzdQ216ZeW1lIXjlg4kMZi48J7h0T+oZOIv96ixlqO41ZyNlm2B2ovFos0qYs6HRTnCt+8UE64bBuWqguIm6v0qU9Wv0y7oUnDpIF8nfkX0qD5kyx9kBvGzhK3LQuXpMBWcn9U8n7nYLHLe49tqYH1dKRY8IwvIsMppxFJpHxigQr7/1+VfcmqU+DsNSSB7YpUTS6qTXBR4k0z1mzx9Mhmys7W8VUd9WIsQI96UCXkHcMILMFDt77GTjAcfiVcG4Obc4oIRIuVLrEkHrag9YWEv59dabgs8ZBS/D5X+l9pyHYqG1Be/uLEBQgNmti/Obg1p5ineMDBLkmVk9371ArRCV3QnLVGLdZEpGILPt+MlvqRccgUaBTsfrfNS1zvXjVhHVnpkxe/Fb+QazKJGnfpwAI7eahBG71JhKSxqyX4sGui7Ee9F3Ew==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(966005)(6486002)(70206006)(40480700001)(86362001)(54906003)(356005)(316002)(81166007)(70586007)(33656002)(2906002)(186003)(8676002)(40460700003)(4326008)(5660300002)(336012)(6506007)(2616005)(53546011)(47076005)(82740400003)(36756003)(41300700001)(83380400001)(478600001)(82310400005)(8936002)(6512007)(26005)(6862004)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 09:51:57.5788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7be7cb-4c64-4e82-5587-08dab0ee6566
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 09:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171937

T24gMTcgT2N0IDIwMjIsIGF0IDE3OjEyLCBUb20gSG9jaHN0ZWluIDx0b20uaG9jaHN0ZWluQG54
cC5jb20+IHdyb3RlOg0KPiANCj4gSSBmb3VuZCBhIGZldyBleGFtcGxlcyBvbmxpbmUgZm9yIGJv
dGggd2F5cy4gSW4gU2FzY2hhV2lsbGVtcyBleGFtcGxlcywgLnNvIGlzIHVzZWQ6DQo+ICANCj4g
aHR0cHM6Ly9naXRodWIuY29tL1Nhc2NoYVdpbGxlbXMvVnVsa2FuL2Jsb2IvbWFzdGVyL2Jhc2Uv
VnVsa2FuQW5kcm9pZC5jcHAjTDE0Mg0KPiAgDQo+IEluIFZ1bGthbi1Ub29scyB0aGVyZeKAmXMg
YSBtaXguIEhlcmUgdGhlIGltcGxlbWVudGF0aW9uIGZhbGxzIGJhY2sgdG8gLnNvLjEgaWYgLnNv
IGlzIG5vdCBmb3VuZDoNCj4gIA0KPiBodHRwczovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1
bGthbi1Ub29scy9ibG9iL21hc3Rlci92dWxrYW5pbmZvL3Z1bGthbmluZm8uaCNMMjU2LUwyNTcN
Cj4gIA0KPiBXaGlsZSBoZXJlIG9ubHkgLnNvIGlzIHVzZWQ6DQo+ICANCj4gaHR0cHM6Ly9naXRo
dWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tVG9vbHMvYmxvYi9tYXN0ZXIvY29tbW9uL3Z1bGth
bl93cmFwcGVyLmNwcCNMMjUNCj4gaHR0cHM6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxr
YW4tVG9vbHMvYmxvYi9tYXN0ZXIvc2NyaXB0cy9nZW5lcmF0ZV92dWxrYW5fd3JhcHBlci5weSNM
MjA0Mw0KPiAgDQo+IFdpdGggbm8gY29uc2lzdGVuY3kgb3IgZ3VpZGFuY2UgSeKAmW0gbm90IHN1
cmUgd2hhdCB0aGUgcmlnaHQgc29sdXRpb24gaXMuIEF0IGZpcnN0IEkgdGhvdWdodCBwZXJoYXBz
IGl0IGlzIGJldHRlciBmb3IgdGhlIGNhbGxlciB0byBiZSBtb3JlIHNwZWNpZmljIHNvIHRoYXQg
YSBjb21wYXRpYmlsaXR5IHByb2JsZW0gaXMgZGV0ZWN0ZWQgd2l0aCBhIGRsb3BlbiBmYWlsdXJl
LiBDb21wbGljYXRpbmcgdGhhdCwgdGhvdWdoLCBpcyB0aGF0IHZ1bGthbi1sb2FkZXIgMS4yIGlz
IG5vdCBjb21wYXRpYmxlIHdpdGggMS4zLiBQbHVzIHdoeSBkb2VzIFZ1bGthbi1Ub29scyB1c2Ug
LnNvLjEgc2Vjb25kPyBQcm9iYWJseSB0byBnZXQgYXJvdW5kIHRoZSBmYWN0IHRoYXQgdGhlIC5z
byBpcyBpbiB0aGUgZGV2IHBhY2thZ2U/DQoNCkkgZGlkIHNvbWUgcmVzZWFyY2guDQoNCmxpYnZ1
bGthbi5zbyogaXMgdGhlIFZ1bGthbiBMb2FkZXIsIHdoaWNoIGlzIHJlc3BvbnNpYmxlIGZvciBm
aW5kaW5nIHRoZSBjb3JyZWN0IGRyaXZlciBhbmQgYnJpZGdpbmcgdGhlIGFwcGxpY2F0aW9uIHdp
dGggdGhlIGRyaXZlci4NCg0KQXMgcGVyIHRoZSBkb2N1bWVudGF0aW9uIGF0IGh0dHBzOi8vdnVs
a2FuLmx1bmFyZy5jb20vZG9jL3Nkay8xLjMuMjI0LjEvbGludXgvTG9hZGVyQXBwbGljYXRpb25J
bnRlcmZhY2UuaHRtbCwgeW91IGNhbiBlaXRoZXIgZGlyZWN0bHkgZHluYW1pY2FsbHkgbGluayAo
LWx2dWxrYW4gdG8gdGhlIGNvbXBpbGVyKSB0byB0aGUgbG9hZGVyICwgb3IgaW5kaXJlY3RseSBs
aW5rIChkbG9wZW4oKSkgdG8gdGhlIGxvYWRlci4gIFF1b3RpbmcgZnJvbSB0aGUgQUJJIFZlcnNp
b25pbmcgc2VjdGlvbjoNCg0K4oCc4oCdIg0KT24gTGludXgsIGFwcGxpY2F0aW9ucyB0aGF0IGhh
dmUgYSBoYXJkIGRlcGVuZGVuY3kgb24gVnVsa2FuIHNob3VsZCByZXF1ZXN0IGxpbmtpbmcgdG8g
dGhlIHVudmVyc2lvbmVkIG5hbWUgbGlidnVsa2FuLnNvIGluIHRoZWlyIGJ1aWxkIHN5c3RlbS4g
Rm9yIGV4YW1wbGUgYnkgaW1wb3J0aW5nIHRoZSBDTWFrZSB0YXJnZXQgVnVsa2FuOjpWdWxrYW4g
b3IgYnkgdXNpbmcgdGhlIG91dHB1dCBvZiBwa2ctY29uZmlnIC0tY2ZsYWdzIC0tbGlicyB2dWxr
YW4gYXMgY29tcGlsZXIgZmxhZ3MuIEFzIHVzdWFsIGZvciBMaW51eCBsaWJyYXJpZXMsIHRoZSBj
b21waWxlciBhbmQgbGlua2VyIHdpbGwgcmVzb2x2ZSB0aGlzIHRvIGEgZGVwZW5kZW5jeSBvbiB0
aGUgY29ycmVjdCB2ZXJzaW9uZWQgU09OQU1FLCBjdXJyZW50bHkgbGlidnVsa2FuLnNvLjEuIExp
bnV4IGFwcGxpY2F0aW9ucyB0aGF0IGxvYWQgVnVsa2FuLUxvYWRlciBkeW5hbWljYWxseSBhdCBy
dW50aW1lIGRvIG5vdCBiZW5lZml0IGZyb20gdGhpcyBtZWNoYW5pc20sIGFuZCBzaG91bGQgaW5z
dGVhZCBtYWtlIHN1cmUgdG8gcGFzcyB0aGUgdmVyc2lvbmVkIG5hbWUgc3VjaCBhcyBsaWJ2dWxr
YW4uc28uMSB0byBkbG9wZW4oKSwgdG8gZW5zdXJlIHRoYXQgdGhleSBsb2FkIGEgY29tcGF0aWJs
ZSB2ZXJzaW9uLg0K4oCc4oCd4oCdDQoNCkFwcGxpY2F0aW9ucyB3aGljaCBkbG9wZW4o4oCcbGli
dnVsa2FuLnNv4oCdKSB3aXRob3V0IGEgdmVyc2lvbiBhcmUgYnJva2VuIGFuZCBzaG91bGQgYmUg
Zml4ZWQuICBUaGUgdnVsa2FuIHRvb2xzIGRvaW5nIGV4YWN0bHkgd2hhdCB0aGUgZG9jdW1lbnRh
dGlvbiBzYXlzIG5vdCB0byBkbyBpcyBqdXN0IGVtYmFycmFzc2luZyB0byBiZSBob25lc3TigKYN
Cg0KU28gbXkgcG9zaXRpb24gaXMgdGhhdCB3ZSBkb27igJl0IG1lc3MgYXJvdW5kIHdpdGggdGhl
IHZ1bGthbi1sb2FkZXIgcmVjaXBlLCBidXQgaW5zdGVhZCBmaXggdGhlIGNhbGxlcnMuDQoNClJv
c3M=

