Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23D6C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 12:56:20 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web12.6427.1666097775272749847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 05:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2nU73NOk;
 spf=pass (domain: arm.com, ip: 40.107.8.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GMQ2vjKUb/rwZW7mDygLHtxJBHu2Bh9wEOAy7fmXYHSRzzytvxSJfR0JUbKJU2UNv+CBi72cxVm7jRhidkiK3h5nFTtbxIDI/0kNhwnonOkYtdstzdqCxCan9+DXcRXafDluSSuMkuDb6OPEKxgG2wP/O+7W+r5p/TmL8awOystdHWsjTnffjyPzTTb8x0YwRTolBcpxcPTlfL82YxHIEY3d6QF+jtla7nMgEv3ySytUOgHjMg26B3YMEGZVS9bDn5ZIWLc9tfZ3yNFXmimStuBAjtlRjz/EUPSGJUisY7joDuaB92ePw9tmpallHG8FgesSYf5kasQp5eGDmP8rxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eurWO7kES+ZC7DetvhNaEGkZZNW7yQmHwimIVQsLpt0=;
 b=Joz0dmIxLosTLPw7UF6PrLlaj15X0VK1hkZWuklgKyqRmZ6wJMt0kY2kuSP72jCY6Kbgr/Vpt4YyMnJ6cu8diQIAYqDvIfFWzM4KhlE4P+yUs2WkYL0aFNBDLv7TZHWIWGiHH/V7uUu1zj7wf7kokqxMgBYM/SxqUUVJ89/JSdYJ8DrQZCp0p88yOWCB8newkxBBmfu/LpxLUWtUtP4bHA2nz4KgBGbsuFRNRthiNRQO+ARtiUdTWlZd6aiMmxoOkCV2lTJBgWWD0+PHHEJVqb0xcne+Yhy7AUYizo2hs/Sexn7UFWd3qrxPpl6FBm46OeXyrQVk1bAYmsV1/TgLMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eurWO7kES+ZC7DetvhNaEGkZZNW7yQmHwimIVQsLpt0=;
 b=2nU73NOkK6Yl5SO5HYnrRlrkEK/UGnuXCulLGubU4tcxpvItbETp3ZR4nqdtKW9O3XHPlmcfIiTaTjDY5KIn5eoGR0FyrgshP+vuHUWIiTWNrYRfQcGiUQLq+BBtYwkBCRgXx6GqmCFluXMLfoGAVDMhbRsyo3iYtRrgHYqa9xI=
Received: from AS9PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:20b:46a::22)
 by AM9PR08MB6241.eurprd08.prod.outlook.com (2603:10a6:20b:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 12:56:11 +0000
Received: from VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::33) by AS9PR04CA0044.outlook.office365.com
 (2603:10a6:20b:46a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Tue, 18 Oct 2022 12:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT061.mail.protection.outlook.com (100.127.144.125) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 12:56:10 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Tue, 18 Oct 2022 12:56:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1ca8949debb667b
X-CR-MTA-TID: 64aa7808
Received: from 05a9ff723fce.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 43C1FCD3-CB67-4EE3-AFF2-902FE69DED04.1;
	Tue, 18 Oct 2022 12:56:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05a9ff723fce.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Oct 2022 12:56:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8iO07WUZ2p6fFfQxWFSWXiTEfxjnIkQktpHdWL1g4Kvv/oAvpzqaSjGRM325O5bFi7EoRht9VoZZNtuviVHFYhPDxAvcw5LjQtDyzrpZZTGKyFppR+IALydFTvub33IsMFlhoCZfOA9zv96dJJqKnony/Y5cw8k92wDbzNmbHviX3Ee4e0Vu+GR1hOK5lYcRKrDknmhV99EkbrXgtkQm6c52EkwE3d66Re7yx2c4mJ68P7AH91lkYK+xkQNGsWxp0egHXspPQ1rYCdm7PGYftpl4/SMx6VRlPcwRCeE4OkODTRxdru9lOHERQLIYPkVd5NQYaDYlsfI+yukgsPtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eurWO7kES+ZC7DetvhNaEGkZZNW7yQmHwimIVQsLpt0=;
 b=II3WqT5S+HjvUI5MCluv5fUAjkXveZ99wwcefaE0A44JrXfJmR0dm6rmFJLuCurYEWBVdGt/5+Ew7us+hNvVqJsDpYkJN+gVM/GAY/dU9uFm/aYyX9/pUUQbSWg3Cd3y1r5tfkJGTiYAG0qemLUCZ5UndxYV7391GJUxXty8YRG2HQ9/GqiihJsv2JSHaj+AArITWk66L90d4p16WEmyYp2hHI5C4FHfIKADzO1tnOWlGaMQRnOu1fxUo2k5+WrzbcLT22/+iXnpWTNKOJpioHGiAWI43hBWv/BC8g5XJm4Z5YlVZ/v1bmQzEKH6CjwfnDam3JInBHpzQ5JZvBMBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eurWO7kES+ZC7DetvhNaEGkZZNW7yQmHwimIVQsLpt0=;
 b=2nU73NOkK6Yl5SO5HYnrRlrkEK/UGnuXCulLGubU4tcxpvItbETp3ZR4nqdtKW9O3XHPlmcfIiTaTjDY5KIn5eoGR0FyrgshP+vuHUWIiTWNrYRfQcGiUQLq+BBtYwkBCRgXx6GqmCFluXMLfoGAVDMhbRsyo3iYtRrgHYqa9xI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9632.eurprd08.prod.outlook.com (2603:10a6:10:447::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 12:56:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 12:56:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Andrej Valek <andrej.valek@siemens.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Peter Marko
	<peter.marko@siemens.com>
Subject: Re: [OE-core] scripts: include all dependencies in eSDK
Thread-Topic: [OE-core] scripts: include all dependencies in eSDK
Thread-Index: AQHY4rzNVlDUMhbffUmdqRh1DsazEa4UHHcA
Date: Tue, 18 Oct 2022 12:56:01 +0000
Message-ID: <56065A30-1F82-4EDA-9162-40C8843644F9@arm.com>
References: <20221018064148.10638-1-andrej.valek@siemens.com>
In-Reply-To: <20221018064148.10638-1-andrej.valek@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9632:EE_|VI1EUR03FT061:EE_|AM9PR08MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: ab37e5a9-649d-4e99-87e2-08dab10821be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jGSAjO9yvw1pGxlnsKvmaRDKek+FyhNottTiFnbDPJXMpErqdEQnxCgufoqVEaagVbWBbn0lFpZnturPuHgWKCAU8vLcNnxgCbNGIq/j6E+T7mAOq+EFF1J5tOnO+ygH/cXKL+jbfzWTJbrCy/MKRyldH1Z+FNA9809SDE4m4wJjt6U4ACBq1wvPF+jz1z44z9FkejprDbCf1W+lGcSyZm+PypFfexJoYazj5OTUSumv4jK0wmxk86zB5EXMYhdEeqWhNKzH4sJKvNj3bSlBJOuNP0WfpSjfvnitSeIDICzEVnY8eM7aNiLQTHxaQ3s/oRPOSol/NFpdrH+ISsVbH+Kc5L9BltyqHapKyl0PBlEfPfHSA1xZs9oG7DGYCF9afxiuxbula72Tt0brPffYRGFCZM98Z8ZzwZb2eRcnHngUB8bn8VUFnY2cpHteqgOWG5hzSefL0IGsVs7jZS+9jEycEKNH5TFTJe9IJkJfgMDojSlLl1xUIJEgHL/4CkLeT+CQZbKX9N8WSn9ur23oUDTWgdPTGCvuMyP5Muoky4YUV3/L5xQwO2eQQA1Re5cnZkhVyxqa9Yg87Pv4Yh3lcJffHkRn+ULR0dxM6kEAWDXxkHPrLtV8jREOUv3hZHef2FZV3JQRXADBVNMzb/6NDgKdncwYsXX5xtDs9HfmJz1XCr/2OMaINNGTaNu/1FmVAdz9Z495eh9xf8P5quL8xYabeUQF1B6VgzPxrbSY7CFW7B4BDOS0ZjhwVYHkwrTuBjEaUqynAVgfrVC5sN3X0hnZvloG1HtUvOqBIt/r4Uc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199015)(36756003)(86362001)(33656002)(38070700005)(122000001)(38100700002)(2906002)(5660300002)(4744005)(6506007)(26005)(2616005)(186003)(6512007)(53546011)(83380400001)(6486002)(316002)(478600001)(6916009)(54906003)(91956017)(66476007)(76116006)(71200400001)(64756008)(8676002)(4326008)(66946007)(66446008)(66556008)(41300700001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <894A0229EBD0574E98628C5BA70447B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9632
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd2adb3d-6aa2-46ca-88a9-08dab1081bf7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jhYfZVXHMHqp02izIsHO3zCtzZ3TAKEHUE1Uw2D95AXaUSSzK/pOPeW4JSM2zHaBahio0BbEfaTxQcfahO+nJtczKNY1CGj6VILWg61HAmMHdZdBT+1kJsBNw4NPdthABvluDDba87Uu3Q9zT1oiZvNTRLKfuews0GsCxh+ENhRarp2euMIkDTh+yF+vQIFpqZIYlpk6sK2BGakwWyiscSeNwU26Nr51hakajbNkM9hUVtgOZpfpbaMRvk0I2i3wCJLOtZ60djO+HKGZHFhRGg6YRxsO+vOBqXZ37hk6yGx+Lbd/MVLHK7MnWlYoPjYVRg5BqI/6jiOTDJsQQwUBf0nj2LNptSxjtgpZ9axqWdbl1MAi0ZFd0g6iKOZ804xlA+sLChFWUBObzEnGhWnQXssX6LWW+xoVlxxIfka1ahJqI3NJa8V86zAxc3xfh+cJBBrjrMvPLe/PkSLUvzwqJTUDR/QMp00F22ApFIbpbtAaCDdvHplaKn5ZoWwdOI7vEoE/Xi32e3ykCyjFlDAWtIeAxkDtrR8A2ZjemW3h89no++6HAwEr2jpXFVT0Dy4oqSpVXdYyZ9tMCQU6HPBZQBsknH4qLdQO7MfWWa5p11GNFSJm4UtAxDDdPU+AzqB3bDZm2FD+6eoR3pfcR+DFFS3+xE7KASgnEQUypCG5jxf2HOUpRppNFviypAP1idBAF54Ol1+hnmOJ427jgqq/cPcC7Ysv9gxbCv6biVVRONuegh/SjL7LKejjslJtaHHxgxarWgCty7X/OdfZNo9OlQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(6486002)(356005)(478600001)(81166007)(82740400003)(82310400005)(54906003)(8676002)(40460700003)(186003)(33656002)(2616005)(316002)(107886003)(4326008)(70206006)(70586007)(86362001)(6506007)(5660300002)(36756003)(36860700001)(26005)(53546011)(41300700001)(6512007)(6862004)(8936002)(40480700001)(2906002)(47076005)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 12:56:10.9242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab37e5a9-649d-4e99-87e2-08dab10821be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6241
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 12:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171940

VGhhbmtzIGZvciB0aGlzLCBidXQgSeKAmXZlIGEgdmVyc2lvbiBsb2NhbGx5IHdoaWNoIG1ha2Vz
IGEgZmV3IG1vcmUgbWlub3IgY2hhbmdlcyBhbmQgc2hhbGwgYmUgcG9zdGVkIHNob3J0bHkuICBJ
IHdpbGwgYWRkIHlvdXIgVGVzdGVkLWJ5IHRvIHRoZSBtZXNzYWdlLg0KDQpSb3NzDQoNCj4gT24g
MTggT2N0IDIwMjIsIGF0IDA3OjQxLCBBbmRyZWogVmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5z
LmNvbT4gd3JvdGU6DQo+IA0KPiBXaXRob3V0IHRoaXMgcmVjdXJzaXZlIGRlcGVuZGVuY3kgb24g
ZG9fYnVpbGQgdGFzaywgZVNESyBpbmNsdWRlcyBvbmx5DQo+IGRpcmVjdCBpbWFnZSBkZXBlbmRl
bmNpZXMgYW5kIHRoZXJlIGZvciBkZXZ0b29sIHJlY2lwZSBoYXMgdG8gcmVidWlsZA0KPiB0aGVt
IGFsbC4NCj4gDQo+IFJlc29sdmVzOiBbWU9DVE8jMTQ2MjZdDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZWogVmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiAtLS0NCj4gc2NyaXB0
cy9vZS1jaGVjay1zc3RhdGUgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvb2UtY2hlY2stc3N0
YXRlIGIvc2NyaXB0cy9vZS1jaGVjay1zc3RhdGUNCj4gaW5kZXggZjRjYzU4NjlkZS4uNWMxODVm
YTg1ZSAxMDA3NTUNCj4gLS0tIGEvc2NyaXB0cy9vZS1jaGVjay1zc3RhdGUNCj4gKysrIGIvc2Ny
aXB0cy9vZS1jaGVjay1zc3RhdGUNCj4gQEAgLTUyLDcgKzUyLDcgQEAgZGVmIGNoZWNrKGFyZ3Mp
Og0KPiANCj4gICAgICAgICB0cnk6DQo+ICAgICAgICAgICAgIG91dHB1dCA9IHN1YnByb2Nlc3Mu
Y2hlY2tfb3V0cHV0KA0KPiAtICAgICAgICAgICAgICAgICAgICAnYml0YmFrZSAtbiAlcycgJSAn
ICcuam9pbihhcmdzLnRhcmdldCksDQo+ICsgICAgICAgICAgICAgICAgICAgICdiaXRiYWtlIC1u
IC0tcnVuYWxsIGJ1aWxkICVzJyAlICcgJy5qb2luKGFyZ3MudGFyZ2V0KSwNCj4gICAgICAgICAg
ICAgICAgICAgICBzdGRlcnI9c3VicHJvY2Vzcy5TVERPVVQsDQo+ICAgICAgICAgICAgICAgICAg
ICAgZW52PWVudiwNCj4gICAgICAgICAgICAgICAgICAgICBzaGVsbD1UcnVlKQ0KPiAtLSANCj4g
Mi4zNC4zDQo+IA0KDQo=

