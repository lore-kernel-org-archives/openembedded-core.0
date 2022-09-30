Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BFBC4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 09:50:38 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web10.3788.1664531433864423092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 02:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=F2j35uVY;
 spf=pass (domain: arm.com, ip: 40.107.14.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nBtoH7fznhP+v/pDOic3zY5IHAQHm/ATXQdg/4vAQGXndoUAeLZOW8HeaB5YutbL9Rn5HBZMUOEeGqeANwvI4EWSo6IDxI71L8gPu77pjY3wHj1c9rgcM9doRGiVbmynkGYRQewYt2vAXRPO2lp8ETNfXOyNzO8lnUgwq/jJ1Sl6Gj4rIA8O3+336LvOwBebKz4h4Lp8l0WXUBNNa/9Ppdhbwz4TbcAmjPYeKVV0JbOGYiPUmSZcPQdBJ35QmNz21EJFWupmOTrEowB7Prak+Mz2GiEfsXVRl+qNZl3kVFJoccCU8K2K6sIbqTknrLwZUdxyRdYFOv/tL6hTOle0ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3YrBH57iAJFuA4AJD/p55iphPqxpIVrD9gVglrSois=;
 b=H+Nj0H0XFG/IsO6C7mSFxtWPnqHUtvwLwhBRqYynm8jxmfBe9FrlVzJoSzOquAHX/5trIsBaATVhzSnheY1lu17NMvB3shArif3vGR4AdnCx2gvG6hzZfBUjppUR2Q1KUkT1bY7v+4xkJ8caS4a04TcrPUFD4EcBO9AG9ri04vHPNBZNAov53TdA0Z2yHQz7OSuT213zxHAPPQ0xHTW3ShU9rTajAx1cVBLQt3vgyzm5r/EVNovaec9FnPhYdRlch47vp0ChMZnD2Pqp/KiigdgSAHoxJQrSYNhqaO0mYthOpNfxgwqiBZDlm64SSFbdK8MoCcWN82n7hEMLySDgCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3YrBH57iAJFuA4AJD/p55iphPqxpIVrD9gVglrSois=;
 b=F2j35uVY9Nb4axq96Ut0cLhzwbJ4Ia6BJU0XDPKQ5d4VdKPH+NJoGlAJWQVlQzvepzEKC19JwRhM5LBxgIoj6irF6pzfe7yzQOggLfyZw8dmumswUORITOQBtWnv+gJ52fC95L9amKUol73bGP260oay2U9rvvMsKlLjaUQgkzM=
Received: from AS9PR06CA0750.eurprd06.prod.outlook.com (2603:10a6:20b:487::29)
 by PAWPR08MB9543.eurprd08.prod.outlook.com (2603:10a6:102:2f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 09:50:22 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::94) by AS9PR06CA0750.outlook.office365.com
 (2603:10a6:20b:487::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 09:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 09:50:21 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128");
 Fri, 30 Sep 2022 09:50:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45e658334a774b52
X-CR-MTA-TID: 64aa7808
Received: from 7a5495647fca.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7AE1978C-3659-4D24-AC54-77FDE84B3084.1;
	Fri, 30 Sep 2022 09:50:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 7a5495647fca.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Sep 2022 09:50:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjeEOyyCJpsT+f5OYwiQnlgLvmoWYxLfdHEbBBwlV5qXT6ENv3yzDddKBTFKCgDdVGYufL0o+13S0sdruO22MKfUw2d55M0Xn1qZf+J5o806u4nsxJjiQ8x11FNAlSjeGXgRF0y+6Vtm+MFF2YKz+cDMJ16bQ0t+MLPjM6s4FQKOVH3QLroYUfZXyLuON3h3uaC2XXixINf5khxPWBqkXdG2Me/WoqROu4pwL9qPCndu/wPxNHiPUZdDpSA4Up+JS0SFIVXEKrCixcBeoBAz4D5kNwOpM8DDbGbuFaqMRMQIMS3JPDGVl+UFULJKk6JDNE91USKPBbSdbAdsfIDJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3YrBH57iAJFuA4AJD/p55iphPqxpIVrD9gVglrSois=;
 b=VEpi5YMr0uqTes92nWBmReZQlPpY9J5wJf9zPGlcJztTKZwMhO3EK5mpILPu2Sm6v+k2y2O1sw9I1m4+ArQ3mNldYqrhBaLU9XwBBdJeHWof/4rg2dqqRSZN/VF5cVcy6ttCwjaCdXk77Xe/Oo9pg6sEI3cPOuXNky8dZvqAE2Q3KIvYSiTCcdPSxZhDSAG5VGPbRJi6TRMrg45w0+9D5mxHU3DylstjmY/geRF7W0SOZax+p+477gw+dW5CymLbupiOnVk4BYsHLOx4xoc3dGvEB+F1+0Kxg8+wr6xEz4WVgktmI6DeJAQu75CD60Kg6QBY5AUJ4DcN0Rq85Ot0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3YrBH57iAJFuA4AJD/p55iphPqxpIVrD9gVglrSois=;
 b=F2j35uVY9Nb4axq96Ut0cLhzwbJ4Ia6BJU0XDPKQ5d4VdKPH+NJoGlAJWQVlQzvepzEKC19JwRhM5LBxgIoj6irF6pzfe7yzQOggLfyZw8dmumswUORITOQBtWnv+gJ52fC95L9amKUol73bGP260oay2U9rvvMsKlLjaUQgkzM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB5936.eurprd08.prod.outlook.com (2603:10a6:102:f1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 09:50:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 09:50:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] fix close_range fails unexpectedly in
 unprivileged process
Thread-Topic: [OE-core] [PATCH] fix close_range fails unexpectedly in
 unprivileged process
Thread-Index: AQHY1KlxMJ4VtyOUyki/BddAxDxGra33ur2A
Date: Fri, 30 Sep 2022 09:50:11 +0000
Message-ID: <16B6F015-6AEB-4374-B680-21AA22A1131C@arm.com>
References: <20220930084823.2772546-1-changqing.li@windriver.com>
In-Reply-To: <20220930084823.2772546-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB5936:EE_|VE1EUR03FT020:EE_|PAWPR08MB9543:EE_
X-MS-Office365-Filtering-Correlation-Id: 85859a6e-43d8-496d-e99f-08daa2c930d3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Y493Ftu8hK6V1TfFbUApzeqMh8MOXGhEuzbaAH5NstZiyi812YA2h4sC3pgEYvJzm+GfXFQB9giHQ63IMBTj6wVFJaDNwkavAbtrJdFmKFwTH5NI0qRn7w2TeMyM5EKIeBrzHbE9NEHhNS5oyUWznE6OUxVkpNMsNAa2gKgTsdLQ9oFputDPix5je9yawfsf+dkJUrwUFcCu47WtgGQuwn3/FOvd9dqNpWOGNcIktYizLmS7mN2XfulA2RRXiI35tlx6H2Qq5D8sO+x0sTdBX5DEMUa0/kkGUyIdTBIISkOb2wm11gJYmFO6df2C+WQh0RRX6j0VzD9+QxNDv+p4+z7uqXNnx1JwxZfSIrtmJEVQwecBQWMWrRY2VmBprgOgj8cJPr2rGCSX9ETAyiN0utope37RVNJO9B3QYgDro6OHEz+68kokjyxUX3CtGPpSHCW6uZ1NDud2Fu/OK59OaQVGGjLTOs5EUnFtK+IB64mdgBcqvNRh64lvsLEYDvinMDPapUjDgX3NnY94OUWr8UAq459bcd+BKotdjTsTkZYRraAfNVT7sD29WA7owOCzf4SVvSYe+S0zMu6nmSG5zJMzhR2iXoQs3j8c6B7YKJ6k2ks6Y2aomhlczPCD4fU2Ziw7wYoaQsrndNTcKRvkNCI6iJte875DddJqPs3NaH8if867uWqBXmbtzpixG1csj3/whxnIhCa+ht/wYmwNfSpNFmKH/u0pFpJ0WLz0+9q/VtYjF2iCxyNBNAj5Z44l/6FkHT8z4aW6NpswjZolBxOHCN6fdR3H8CDCwcD+BvLabaScgnQ68Esp0osII8FDMBnZQfMWoG3kf2DvOm9CPg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(2906002)(66899015)(71200400001)(122000001)(36756003)(26005)(8676002)(41300700001)(33656002)(6506007)(4326008)(38100700002)(38070700005)(86362001)(83380400001)(2616005)(186003)(6916009)(66476007)(966005)(6486002)(478600001)(5660300002)(6512007)(53546011)(64756008)(8936002)(91956017)(66556008)(66446008)(66946007)(316002)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <16D3345616A19844903BB214497B1828@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5936
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	734bfcc9-8422-437a-17a5-08daa2c92b01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Fx9kP3eK6sg1AUzR10Y4Hx0Rv0LXt0ISKILVqOpD6III9VjxkXfEo4KsXnuxW0GvjSnGNy1iCDB3O8WDk1glf/onMW9LiKoNktu6otMjrsoAKyRId95RCmgqCHD8GQtcF1uyDtKnkQvahqsu1XLJpgQcnk+/9om5/YoZPpcgi8T+jbEmwBvHUeHQmwXPyaU1GjheX8La+97zUti8SYSvHbteq+3aJBdhanoayOmUJ1zn+0eaY0+ZxFiKHdlaVsLvrHOoQNR0/WLTEAew1nH68EbBSS/849ti98uK6tjipWxvPYWHxcOBYBUu3O+7pHm1cJiqa/46G+GyV61Ht3IOpPOntiZ31iRffKSql0RVzM8NHfkLoZ6+IAQffsGYwifqAHxOdk1ckK+5NqGxjN8pcRiMm33frPI2WCBcpBNMy0p6BVpM9f/YJZMkzg76hvX2570tzWgw+4rMQfHMe0wY2AWeinXVQgCm2PVSf8i6KwSrc5d5v9vhQR3eHU7NvPvvz9cSc3V+xM2WzTgVLo+WalzkMk9U+y82w0PRy9C1sp+wRvRlKvbFf5MqAH0RPrdjx6IEkKMt03Q1CsWbASkyRiXoMCEjk3fPoJB6KYDaOWW9KBNX9FO7am6KUn1lFL/2rjEB6SDQ0SmnQ1DcjbfsenSGc8ikJ/OMP7yaGsl169WgvbPJkHrXWvYiuDOKWBBh2ml62elS/i8nGZTp7B/1zSKRE+MbmdUTW/BTulcfOSssbdwBQ+V4YRDiX6q+N7WbO+rwI5wYaTIpnQbAcOQqC5EEP/kTm/oflmwnSaSyGU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(66899015)(47076005)(336012)(2906002)(356005)(82310400005)(81166007)(36756003)(40460700003)(26005)(8676002)(6506007)(41300700001)(33656002)(4326008)(36860700001)(478600001)(86362001)(40480700001)(316002)(82740400003)(83380400001)(2616005)(186003)(70586007)(6486002)(966005)(53546011)(6512007)(5660300002)(8936002)(6862004)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 09:50:21.6104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 85859a6e-43d8-496d-e99f-08daa2c930d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9543
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 09:50:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171217

WWVhaCwgdGhpcyBpcyBhIERvY2tlciBpc3N1ZS4gRml4IHlvdXIgZG9ja2VyLg0KDQpSb3NzDQoN
Cj4gT24gMzAgU2VwIDIwMjIsIGF0IDA5OjQ4LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2lu
ZHJpdmVyLmNvbT4NCj4gDQo+IEFmdGVyIGNvbW1pdCBbMV0sIHN0YXJ0IGEgdW5wcml2aWxlZ2Vk
IGNvbnRhaW5lciAoZG9ja2VyIHJ1biB3aXRob3V0IC0tcHJpdmlsZWdlZCksDQo+IGNsb3NlIGZp
bGUgd2lsbCBmYWlsLg0KPiANCj4gVGhpcyBpcyBhY3R1YWxseSBhbiBkb2NrZXIgaXNzdWUsIHNl
ZSBbMl0uIEJ1dCB0aGlzIGlzc3VlIHdpbGwNCj4gYmxvY2sgeW9jdG8gYnVpbGQgaW4gZG9ja2Vy
IHdpdGggZ2xpYmMyLjM1Ky4gc28gYWRkIHRoaXMgbG9jYWwgcGF0Y2guDQo+IA0KPiBbMV0gaHR0
cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9jb21taXQvY2UwNGExMjQwNDBiZTA5
MTQwN2UwNzAyODBkODZjYTgxMGJhY2I4Yw0KPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL21vYnkv
bW9ieS9pc3N1ZXMvNDM1OTUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYW5ncWluZyBMaSA8Y2hh
bmdxaW5nLmxpQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiAuLi5mYWlscy11bmV4cGVjdGVkbHkt
aW4tdW5wcml2aWxlZ2VkLXAucGF0Y2ggfCA0NiArKysrKysrKysrKysrKysrKysrDQo+IG1ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzIuMy5iYiB8ICAxICsNCj4gMiBmaWxl
cyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLWZpeC1jbG9zZV9yYW5nZS1mYWlscy11
bmV4cGVjdGVkbHktaW4tdW5wcml2aWxlZ2VkLXAucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLWZpeC1jbG9zZV9yYW5nZS1m
YWlscy11bmV4cGVjdGVkbHktaW4tdW5wcml2aWxlZ2VkLXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMC8wMDAxLWZpeC1jbG9zZV9yYW5nZS1mYWlscy11bmV4cGVj
dGVkbHktaW4tdW5wcml2aWxlZ2VkLXAucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXggMDAwMDAwMDAwMC4uMjEzZWU3YjExZg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtZml4LWNsb3NlX3JhbmdlLWZh
aWxzLXVuZXhwZWN0ZWRseS1pbi11bnByaXZpbGVnZWQtcC5wYXRjaA0KPiBAQCAtMCwwICsxLDQ2
IEBADQo+ICtGcm9tIDBmYjI4M2IzYjFlM2I0OTU4Yjk4NTgwNGNiYzQwYjdiZmY4YjBlNjUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxDQo+ICtGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5s
aUB3aW5kcml2ZXIuY29tPg0KPiArRGF0ZTogRnJpLCAzMCBTZXAgMjAyMiAwODoyOTo0MSArMDAw
MA0KPiArU3ViamVjdDogW1BBVENIXSBmaXggY2xvc2VfcmFuZ2UgZmFpbHMgdW5leHBlY3RlZGx5
IGluIHVucHJpdmlsZWdlZCBwcm9jZXNzDQo+ICsNCj4gK0FmdGVyIGNoYW5nZSBbMV0sIHN0YXJ0
IGEgdW5wcml2aWxlZ2VkIGNvbnRhaW5lciAoZG9ja2VyIHJ1biB3aXRob3V0IC0tcHJpdmlsZWdl
ZCksDQo+ICtjbG9zZSBmaWxlIG1heSBmYWlsLg0KPiArDQo+ICtUaGlzIGlzIGFjdHVhbGx5IGFu
IGRvY2tlciBpc3N1ZSwgc2VlIFsyXS4gQnV0IHRoaXMgaXNzdWUgd2lsbA0KPiArYmxvY2sgeW9j
dG8gYnVpbGQgaW4gZG9ja2VyIHdpdGggZ2xpYmMyLjM1Ky4gc28gYWRkIHRoaXMgbG9jYWwgcGF0
Y2guDQo+ICsNCj4gK1sxXSBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ2xpYi8tL2Nv
bW1pdC9jZTA0YTEyNDA0MGJlMDkxNDA3ZTA3MDI4MGQ4NmNhODEwYmFjYjhjDQo+ICtbMl0gaHR0
cHM6Ly9naXRodWIuY29tL21vYnkvbW9ieS9pc3N1ZXMvNDM1OTUNCj4gKw0KPiArVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtSZWplY3RlZCBieSB1cHN0cmVhbV0NCj4gKw0KPiArU2ln
bmVkLW9mZi1ieTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4NCj4g
Ky0tLQ0KPiArIGdsaWIvZ3NwYXduLmMgfCA0ICsrLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvZ2xpYi9n
c3Bhd24uYyBiL2dsaWIvZ3NwYXduLmMNCj4gK2luZGV4IDBhMmNiZTUuLjgzNTUzYTEgMTAwNjQ0
DQo+ICstLS0gYS9nbGliL2dzcGF3bi5jDQo+ICsrKysgYi9nbGliL2dzcGF3bi5jDQo+ICtAQCAt
MTU0NCw3ICsxNTQ0LDcgQEAgc2FmZV9mZHdhbGtfc2V0X2Nsb2V4ZWMgKGludCBsb3dmZCkNCj4g
KyAgICAqIGZhbGwgYmFjayB0byBzYWZlX2Zkd2FsaygpLiBIYW5kbGUgRUlOVkFMIGluIGNhc2Ug
YENMT1NFX1JBTkdFX0NMT0VYRUNgDQo+ICsgICAgKiBpcyBub3Qgc3VwcG9ydGVkLiAqLw0KPiAr
ICAgaW50IHJldCA9IGNsb3NlX3JhbmdlIChsb3dmZCwgR19NQVhVSU5ULCBDTE9TRV9SQU5HRV9D
TE9FWEVDKTsNCj4gKy0gIGlmIChyZXQgPT0gMCB8fCAhKGVycm5vID09IEVOT1NZUyB8fCBlcnJu
byA9PSBFSU5WQUwpKQ0KPiArKyAgaWYgKHJldCA9PSAwIHx8ICEoZXJybm8gPT0gRU5PU1lTIHx8
IGVycm5vID09IEVJTlZBTCB8fCBlcnJubyA9PSBFUEVSTSkpDQo+ICsgICAgIHJldHVybiByZXQ7
DQo+ICsgI2VuZGlmICAvKiBIQVZFX0NMT1NFX1JBTkdFICovDQo+ICsgICByZXR1cm4gc2FmZV9m
ZHdhbGsgKHNldF9jbG9leGVjLCBHSU5UX1RPX1BPSU5URVIgKGxvd2ZkKSk7DQo+ICtAQCAtMTU5
Nyw3ICsxNTk3LDcgQEAgc2FmZV9jbG9zZWZyb20gKGludCBsb3dmZCkNCj4gKyAgICAqIEhhbmRs
ZSBFTk9TWVMgaW4gY2FzZSBpdOKAmXMgc3VwcG9ydGVkIGluIGxpYmMgYnV0IG5vdCB0aGUga2Vy
bmVsOyBpZiBzbywNCj4gKyAgICAqIGZhbGwgYmFjayB0byBzYWZlX2Zkd2FsaygpLiAqLw0KPiAr
ICAgaW50IHJldCA9IGNsb3NlX3JhbmdlIChsb3dmZCwgR19NQVhVSU5ULCAwKTsNCj4gKy0gIGlm
IChyZXQgPT0gMCB8fCBlcnJubyAhPSBFTk9TWVMpDQo+ICsrICBpZiAocmV0ID09IDAgfHwgIShl
cnJubyA9PSBFTk9TWVMgfHwgZXJybm8gPT0gRVBFUk0pKQ0KPiArICAgICByZXR1cm4gcmV0Ow0K
PiArICNlbmRpZiAgLyogSEFWRV9DTE9TRV9SQU5HRSAqLw0KPiArICAgcmV0dXJuIHNhZmVfZmR3
YWxrIChjbG9zZV9mdW5jLCBHSU5UX1RPX1BPSU5URVIgKGxvd2ZkKSk7DQo+ICstLSANCj4gKzIu
MzQuMQ0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGli
LTIuMF8yLjcyLjMuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjcy
LjMuYmINCj4gaW5kZXggZGQxZWE1MDhkMi4uYmJhYWNjNjRhNCAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43Mi4zLmJiDQo+ICsrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzIuMy5iYg0KPiBAQCAtMTYsNiArMTYs
NyBAQCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS9nbGliLyR7U0hSVF9WRVJ9L2dsaWItJHtQ
Vn0udGFyLnh6IFwNCj4gICAgICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGly
LWludG8tcGtnLWNvbmZpZy1maWxlcy5wYXRjaCBcDQo+ICAgICAgICAgICAgZmlsZTovLzAwMDEt
bWVzb24tUnVuLWF0b21pY3MtdGVzdC1vbi1jbGFuZy1hcy13ZWxsLnBhdGNoIFwNCj4gICAgICAg
ICAgICBmaWxlOi8vMDAwMS1naW8tdGVzdHMtcmVzb3VyY2VzLmMtY29tbWVudC1vdXQtYS1idWls
ZC1ob3N0LW9ubHktLnBhdGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTovLzAwMDEtZml4LWNsb3Nl
X3JhbmdlLWZhaWxzLXVuZXhwZWN0ZWRseS1pbi11bnByaXZpbGVnZWQtcC5wYXRjaCBcDQo+ICAg
ICAgICAgICAgIg0KPiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly9yZWxv
Y2F0ZS1tb2R1bGVzLnBhdGNoIg0KPiANCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE3MTIxNSk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTcxMjE1
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzk0
MDEyNTQzLzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29t
XQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

