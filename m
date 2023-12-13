Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0191AC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 11:24:12 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.79])
 by mx.groups.io with SMTP id smtpd.web10.34020.1702466647657047222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 03:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hyXV6AKh;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hyXV6AKh;
 spf=pass (domain: arm.com, ip: 40.107.249.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SsCj10CLfGG7fhdVrrS46sG/1B+3/td7ydovMdx0uCodn3rHtJGNV8VtqgUHC78bUYCo0Kf/SH7ECwYZemwDZDD7CP8qcwni+XDq9gH34jOPSZyqYgk9k9sQ2GAAl9kbt0cs+lK1I03/gSBOGOBbvZ7Hzf4f4652xVWju+5wDiMVz+MTbweOXNn/If1IwL7eGwt6EBcquBycAsUEK3FnHU5Iqgwi4s5zbAkui04qnWDHo7RpU+8BffHgEUJ+fZIECn3o+1xB2jZ21x72tVCPJuu2w/xU7fPOGKu5JjkiDbNsOSEUitFwKDWmcYTKJyKtDgRfZgetWpxm7gNOyDWdeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZBZMbr33R8jVHsgH63PZAV/tXXBuwYno0TzYcnPvWg=;
 b=CwsDi67mxVn29s5S0mJu23CPZ2t7ylEtEoz7sERCAZiZRS9BXgJHsXeue34nnijL4E4UTb2i0h9/PXOsivv4AIim7mkQOvZBdWLekcQNRmiAsEvuedwTt7PJesurwNrUP10DCME9Bd3UaA0s3bE+GXfAN+dSnzlG08vDt4mZImHZrVa32Fw1IsDrMLAhm2lu8xJESMw8l0V1SZzE2jN2t0KiTpw7KkqRw+Y+2DpINuTifvSWSR/Iloco6usB3QR5Mx52Xw6VHBcKWbgErHrgV2O3MZgTxWOojvpIvRvjP+GahWqvec0yDtNNUrBEkMrEl1Nb0tm+RG4qOX3dQfcKmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZBZMbr33R8jVHsgH63PZAV/tXXBuwYno0TzYcnPvWg=;
 b=hyXV6AKhlMseFjpDx+NVSlyweJz0DwiSrZdNhwrzmkIcAttSGgI7rFo9V2QgMtvy6lrPR8fqh9WHxOp9+S81XBHiC+SdIpi0LV+KRSwgRekWza2nwl2AIoN5X3R7Xnr4bbf/qOxSP/zbIjs/wfzgutgACG8yC/kiNbaz0I4+EiM=
Received: from DU7PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::16) by PA4PR08MB6062.eurprd08.prod.outlook.com
 (2603:10a6:102:ee::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 11:24:02 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::e) by DU7PR01CA0035.outlook.office365.com
 (2603:10a6:10:50e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 11:24:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 11:24:02 +0000
Received: ("Tessian outbound 8289ea11ec17:v228"); Wed, 13 Dec 2023 11:24:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d065e177fbf315d1
X-CR-MTA-TID: 64aa7808
Received: from d83d628fc025.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0BE7545D-1DFD-42CB-AE9D-4207E08D4532.1;
	Wed, 13 Dec 2023 11:10:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d83d628fc025.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Dec 2023 11:10:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgbjQwZs6bxvuZiZlFEDt8UhUB2Jtie6g4I+Y8iySeIDOASM3+gl/1FK7fOHz5hTVJ2gSx4quK9M/8KM4OMh72T0YeLPNzPNENsUq18dPfFeOKC61rPIz0X1oQBVsnioofjN7NTX6Vx1ykxzlKR8XnQhQ3yw/lJJFpj07legt2QzhXFYrrliGZVh8sU8sQV5MaaiC3l6h5jWtxqWdjGZRQq2zfNppz9CpgO3JjJaYK35bngao2aQMfKzeRWW8sOMY5fRaMIs1HeI4jMmJ64uuAqWA+ecusv5fFI+Ip7ZPHrluDP/F38wUUFfhroKmaDBERpSXL8sT9lLBX0l8XxOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZBZMbr33R8jVHsgH63PZAV/tXXBuwYno0TzYcnPvWg=;
 b=hmgOdPLKRKUrMmxGB15w4rzuvD5r0Lx3Vvcst91/Vw0sAbDlcBrwrjMZN+ITP8s4t3Gde/I3fC20htcHFydxI0jxfgRcdJRk1CFaJ8xxo16SEOG3I9Kf3/WT/ATiwxfOdlAzkP6uANCGAojbs9/s4Sx7OGkCL4cViaicbj7lrDr6xpZXj0WVLceTn5TibBoWteh23spC0DdNfNYqpnyGs2KhzUAImH95DAQq8L3hCxmOnw8DIMuWW1WeOoNiq0ZzZgpYgc/wSN+q7Upg3Nh56Gv2Jbahzp+aZ4LF8aRXxL2FrdkYuRSCy+iLbxlQK0wvqRE4DO6TNLHUplkRziBqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZBZMbr33R8jVHsgH63PZAV/tXXBuwYno0TzYcnPvWg=;
 b=hyXV6AKhlMseFjpDx+NVSlyweJz0DwiSrZdNhwrzmkIcAttSGgI7rFo9V2QgMtvy6lrPR8fqh9WHxOp9+S81XBHiC+SdIpi0LV+KRSwgRekWza2nwl2AIoN5X3R7Xnr4bbf/qOxSP/zbIjs/wfzgutgACG8yC/kiNbaz0I4+EiM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9807.eurprd08.prod.outlook.com (2603:10a6:102:2ee::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 11:10:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 11:10:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/4] oe-selftest: add a cpp-example recipe
Thread-Topic: [OE-core] [PATCH 2/4] oe-selftest: add a cpp-example recipe
Thread-Index: AQHaKU988Vk9QBl0h0ubIbnDg2Bn+rCnF2QA
Date: Wed, 13 Dec 2023 11:10:50 +0000
Message-ID: <4835257B-EEB2-4772-AA64-B787E99CFC8B@arm.com>
References: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
 <20231207205251.4152034-2-adrian.freihofer@siemens.com>
In-Reply-To: <20231207205251.4152034-2-adrian.freihofer@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9807:EE_|DU6PEPF00009527:EE_|PA4PR08MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4ffeea-dd20-4c5a-0dee-08dbfbce0261
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mjXVoqpz3ixuNlesaHiG83Xj46wrJ1UtB+iZVgGwjsrH476Oqzy/jRcr8iJFhJAHeOHGaDRy4cqBCMKbqlBvKJAKPtybS+A47xa/s7cqh9ukcSEMpI25P7DSaEsprqYcOFL+KBTzxg2bzdq13vJLJsVbIX8MW+VAwn8gW95LJrWhvhmG9Wv/izi0zpXYixRbUmW6VxlArYMZQUeRKQMvY/RxLQHwmsSok97bIBuPhpdeQzNx/ToJ9/5L3B0kS+U/0/6g2aIDskSZEwHfbeo+jC9ymlU+xLNIO28V/PwlhLTCl9/1njxN531N8k6g+T0riyTt9FPlweyIw7SvOOPRr85tctHHt2Ll2pwmfNsNxoQWLtyBlK/1h4fCXar+kZLBxQpJr+RS66OS4Qjy2X3jpf1Lsa+E5i2KvNDD8gpq/VLUVLUigUaYUBg7yZ84uZl2xje+GC4MDhWawzKOGwHvIK5KTs2UYobWHhgJd1r0I0rIGdtc3f5KVUJWoKUrVaGerh7thJino51CUewEyjnBjtBFXj6ja9bHthEy3lgg/J9YWWmNWKGSEHrMQLRT3EXMoYMoEP1nAhv8kweS+YKCOq/l+wdJvxZV4UexrRPOdJqgS660rbMB8DMowQhnjs9rSAFkej772L8xwX7pItwy1A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(122000001)(38100700002)(83380400001)(71200400001)(26005)(2616005)(36756003)(86362001)(41300700001)(33656002)(38070700009)(6506007)(6512007)(478600001)(316002)(6916009)(76116006)(66446008)(91956017)(66946007)(64756008)(66556008)(66476007)(8936002)(8676002)(4326008)(5660300002)(4744005)(2906002)(53546011)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8910A91FF2070644A3136E9AF2230B94@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9807
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	da848b70-4db7-487f-9549-08dbfbcc2a71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BhnF3Z5PJLQtCIkLuvvLWwGK2/CPCRrQjBt6W3UHSkzqa/O/Y2LrV4VCfuscRMtksFJ9532Q/+jWyUPwAmaxt0LVt54LFnniMsehWKMPDTEWw2JoDMgQ+ESlgMRN1yYDwDrsv1IUdc43lUfK4O4ZzOaYXZ90scOAHxxI8a3vYv8Ba1nu/ApWtBRftIFyVYSwEuYXf8iVsMbBWpxWFc0jb6enhaeLw7qmq8Me0SEhLKG5tgb0UTaVjVnDNVc0gqvyxuLSg59KYQYPRiKsIFDpa9RPfOAo57W7Fv5RoyhWAsQHSEPVJfKBZFoj1NnXL8AGr2jTdfZtUeKEdjWIW/Jpo0rXub95JivVNfo+o9fsgXhI/UXtodwpdHvfj5pVdlm6pE8sFdIfrhs/PCXlk3+s69dmxX5Yiru9sOtoQIDSBE1wKDMHjPnei3iUH3B90wZZv6bHLrQeW8HYM41TWJoQmh13y9550tl0cwV7tB9iZ0xotTUQ+7vjg9yPFyMKv80G5xgkEwG16jKFykG4QLHYJFI+ErT9lPwAH+VlVDpLMUzP2lGCG6OVbfm8YWMM4W20AcRI5d9E2oR2F8NR/3gqpgXct/xfrDTKpQS+b+AWfWjgE+ghxkieRJVxWXYgfkdza+wwZIGTO7PaXp6br0vO8cp9euTfkL8p40B4L44+a1hrMf98CrA3v8FBe2hN/SeG5RWZW8ea2nzYHgAiW7mQNKx+YBbhcN8gIc4IoTg4vsv/Ji8cyD1Jq6hFKFZb/Z9a
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(82310400011)(1800799012)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(70586007)(70206006)(356005)(82740400003)(81166007)(33656002)(36756003)(86362001)(47076005)(36860700001)(26005)(336012)(83380400001)(6506007)(6512007)(2616005)(2906002)(4744005)(6486002)(316002)(478600001)(5660300002)(6862004)(8936002)(8676002)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 11:24:02.4806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4ffeea-dd20-4c5a-0dee-08dbfbce0261
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192286

DQoNCj4gT24gNyBEZWMgMjAyMywgYXQgMjA6NTIsIEFkcmlhbiBGcmVpaG9mZXIgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPGFkcmlhbi5mcmVpaG9mZXI9Z21haWwuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gK2RvX3J1bl90ZXN0cyAoKSB7DQo+ICsgICAgbWVz
b24gdGVzdCAtQyAiJHtCfSIgLS1uby1yZWJ1aWxkDQo+ICt9DQoNClNvbWV3aGVyZSBpbiA8Z2Vz
dHVyZXMgYXQgMTAwKyBmZWF0dXJlIGJyYW5jaGVzIG9uIHBva3ktY29udHJpYj4gaXMgYSBwYXJ0
aWFsIGltcGxlbWVudGF0aW9uIG9mIGEgZ2VuZXJpYyDigJxydW4gdGhlIHRlc3Qgc3VpdGUgYXQg
YnVpbGQgdGltZSBpbiBxZW11LXVzZXLigJ0gd2hpY2ggZmFpbGVkIG1pc2VyYWJseSBiZWNhdXNl
IHFlbXUtdXNlciBpcyBwcmV0dHkgbGltaXRlZC4gIEkgc3VzcGVjdCBpdCB3YXMgX3Rvb18gZ2Vu
ZXJpYywgYnkgdHJ5aW5nIHRvIHJ1biB0aGUgdGVzdHMgdmlhIOKAmHFlbXUtdXNlciBtYWtlIGNo
ZWNr4oCZLg0KDQpIYXZlIHlvdSBoYWQgc3VjY2VzcyB3aXRoIG5vbi10cml2aWFsIHRlc3Qgc3Vp
dGVzIG1hbmFnZWQgYnkgY21ha2UvbWVzb24gd2hlcmUgdGhlIHRvb2xpbmcgaW52b2tlcyBxZW11
IGRpcmVjdGx5PyBHZW5lcmFsaXNpbmcgdGhpcyB3b3VsZCBiZSB2ZXJ5IGludGVyZXN0aW5nLg0K
DQpSb3Nz

