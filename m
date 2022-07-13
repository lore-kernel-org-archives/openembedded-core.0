Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6638C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:30:48 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.55])
 by mx.groups.io with SMTP id smtpd.web10.35.1657729845398926048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=cnTb5R/D;
 spf=pass (domain: arm.com, ip: 40.107.6.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Dnt9sA6pD79QSWoTy0Lhoo3wkgn503QA92+MXxPOSjOVLpUhzxSNEg9scghYkkf9Zm7fw6dW4Sd+O1uRfnT21iQdjVZeuqWEdi/LD5AAjygwL4VaDVYfk+/U1q0s0DtR6GjyUh91ay9UL03udc1q0WRvifhwqTilPLrE8ijCxMeJWjbwHr16/yOYYmY2CFtYRoFOtyzkZ7Xy9CPKhP2F+DA/IwW0PSa5e5jWkbZURGnXoyAkovMVW26/bG9R8Vl3+zdwJow7DsoS9zL9moH6IrFZcRWayB2D78UHbXriDgtvpnNX2Blt4V/sJkF7NIIUkzguY/dkyi8tTReJH0Ab8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSiYt0PDVrzdrM1sFLBB4XbgY5aa2x2AAVAkUUxfLjI=;
 b=INlp1f/D2uhD7IS01Kn5e4LF4YmWZ8GBw7TVe+qH+RoH+eVThJvAShi7fzY4ea7oq+dNy9OkkddKQWzLx2OTXn8ZXUzPuj6kiYcnT3EP4hHXdRduq9+d1M9b/ajAAEYmR4TyrK9Bc6zpUbxWDZWHBd5FxUfsySTQlpd7Lk17uIlmZ3/HmIEiL0Be7a2f6CORvjM1GIrSM+8ttZ4Ot3q/OXq8nmagJ+jczs98inwQkP3oP0+wM0eBcqEt+MqMVevwczkylFbpl/OsjB3wsAqE2KWHiSCa568i5XtevTwpjBUf7+7TLbfAi0xu5eGLRkrWRHf+Z+zztrMhJTlNsNAH9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSiYt0PDVrzdrM1sFLBB4XbgY5aa2x2AAVAkUUxfLjI=;
 b=cnTb5R/DCCDFDAGSKDRIfWjTMQ16kSlL5UYrD8kVEmA1+R79mG+Tju3iaGTvjmPDP5S5zGlCWZ2kTDA414ACBjWa8HeKl09WQSnTxraiO3qfQUTJ7Iw8FEYbneboY9HEZuYLYwWg5/R0XdKcr+Ef1hIvbYQlAB7OjmO6WBy2RuA=
Received: from DB8PR03CA0006.eurprd03.prod.outlook.com (2603:10a6:10:be::19)
 by GV2PR08MB8076.eurprd08.prod.outlook.com (2603:10a6:150:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 16:30:41 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::2b) by DB8PR03CA0006.outlook.office365.com
 (2603:10a6:10:be::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Wed, 13 Jul 2022 16:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 16:30:40 +0000
Received: ("Tessian outbound 0ba541f03a2a:v122");
 Wed, 13 Jul 2022 16:30:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e96a4c9082bbe60c
X-CR-MTA-TID: 64aa7808
Received: from f4980688bd95.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24A05887-0FFA-4914-8EE3-C1CC83FC4EFB.1;
	Wed, 13 Jul 2022 16:30:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f4980688bd95.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Jul 2022 16:30:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3048NM+ANnciCxltuXLw4rNvyyH8qh8RT/lZ+ztItRCmQPUMUimn6lv8y6iyQexEUuLKVNmAdddKtUsiQnU3tn6h3lugI3wnAZlVNsVfPC2OLGOlPCoM3uZ0nHyf8bZ7MFNH2mjv1GowEWjAz+Hg3FfIK64BXOVlQmIWy7rj9+3chSNifzJz2r2V4igHDpU/z58vQLjWBq63Tp4xx+APPqcw6odT4ksgoobMeRbeRmgRyqJX/j6v/xS/7/+ehjCSDv7pIYPBqH+ODemPMX0aC8k8JCVc1Se/C6eg3VcYSGXBTV65yJLwOybmG/BYyui+zUIDiNXirwdeVkfiBHtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSiYt0PDVrzdrM1sFLBB4XbgY5aa2x2AAVAkUUxfLjI=;
 b=EGPSOIbEa7S993yrxUfdxqv4M0mhbjRjsQ/zE3AgdCJErGagk5ojST2Lqd9Cs48z4mwlC6n1+5aTWHoeAziDzLM53OsbjRb1ByGDnGT6DYMXrB6RqsMaRnFh8mz905tAQ4XEKe2DtN+KvaWAopzmuJ53RmGw/f0Nx3NiwS3jYrvbbz2MHRRJmLAIIsCcHYzHi0y6KNv++oCitUopsLdIj/xqxgrvkpM/KFyi47rrW1JHt1qdwUCpkGIuQMZO9xKI7Zz17/bbTk7Yqw9sV3mywjJSA9z+P4/sus4IxR4bwb6OIK9v7nPjJbv7Zi3M5kwRBt3or6f0miiX3WZKagCxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSiYt0PDVrzdrM1sFLBB4XbgY5aa2x2AAVAkUUxfLjI=;
 b=cnTb5R/DCCDFDAGSKDRIfWjTMQ16kSlL5UYrD8kVEmA1+R79mG+Tju3iaGTvjmPDP5S5zGlCWZ2kTDA414ACBjWa8HeKl09WQSnTxraiO3qfQUTJ7Iw8FEYbneboY9HEZuYLYwWg5/R0XdKcr+Ef1hIvbYQlAB7OjmO6WBy2RuA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by HE1PR0801MB2073.eurprd08.prod.outlook.com (2603:10a6:3:52::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Wed, 13 Jul
 2022 16:30:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926%2]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 16:30:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/8] python3-setuptools-scm: add missing
 python3-typing-extensions dependency
Thread-Topic: [OE-core] [PATCH 1/8] python3-setuptools-scm: add missing
 python3-typing-extensions dependency
Thread-Index: AQHYltWZQR4GV7FE00yclcBkabN5wa18fhGA
Date: Wed, 13 Jul 2022 16:30:31 +0000
Message-ID: <23CAFE66-DDD6-4846-BB56-8AC0BD222231@arm.com>
References: <20220713162821.974801-1-ross.burton@arm.com>
In-Reply-To: <20220713162821.974801-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f88fa055-a839-45f6-3622-08da64ed06b3
x-ms-traffictypediagnostic: 
	HE1PR0801MB2073:EE_|DBAEUR03FT036:EE_|GV2PR08MB8076:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zOt0BmD2DeUT3z9uSNZazUFig74xm1LUXo53RdwqfuXp9LrY23JBn5iWBKQ8u8Rp3dl5TitPF+PvBA+wUVcIRxg7fTL0hZ7RdlKhY43Q63apqq8lG5sujXw7z6UPp7n11dVU9pSWj2tuY6aGWxJolqDYRIzYTKr6r+Lm/GFafkt11jEyi0ZUQ4xBhsoYs2erkENn+ro35emDMiwirFFSaJGQpxIhvtHGaePE3tkjZcOEzwGDsVDNPqYdeJtqCQPm/w2I6QvgGUHqq+xBNCf+KtkksViSYO76AjsJ2oPsGaIXD8D7tFHl8vYjPGVa9KlA/bVvxduSNk9bVsLLawZ0B25/oz2Vx4pVYs7/ffQVo+Xjj7WHBZLaHbdh72l+/Ph3JeFYjd4lyakSs9vyD9b012wyl21MH/VeCq4ipPOssmefQA6iDRKKbt+fo0d3my1FzD6qOE5oMxkbvU2HU0cbtLq1hzEVBQ7xlTDGO6heJAhDP7ZdPSRjhXj7Nya1hERjancEgEN2nTh6nMoMkP5mYqw5VVX0IkNXLWd0jS6UzvTkn93zr/OvtBmo5/21WYR/5a01uNgesc6QAlc9lkhP+fAm/lZgn/hMSCUE/vWFTq7qWlcC1FIycAvqJQqkJWHPQ9880+mfVdWnrU3SvGB28Ko3pwckkXRuKSmYO6xSA2vtlmxBGRAsLWR0NAPMy3NarF0mpDF7mfJaNHTu4+1APN/Hr8IXPD9jrxY9+AUkTTPgpFkgOiBTjCRmxJZFafOxCByypaIItlVVd9L29GToZtgnkOl5Uq0etRd4m3u1NGhCZVzfk+OnJ3US7N7vv04+KjV+GHPY2FEbBRVAAESxEGVjBGw8gA359Jkk4cUAiaTS9rsYDJMMG/NJoDbHjoBo
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(2616005)(38070700005)(83380400001)(66446008)(38100700002)(122000001)(8936002)(5660300002)(316002)(2906002)(66556008)(66476007)(186003)(71200400001)(6512007)(53546011)(6916009)(26005)(91956017)(76116006)(6506007)(66946007)(64756008)(966005)(478600001)(41300700001)(86362001)(8676002)(33656002)(36756003)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBF83BD9FF77C84286D6A7BB2FD04929@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2073
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5acc4bbb-d0f4-4c46-78d0-08da64ed0133
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h1fFMze9dxsI689Axbj0RBP1lTVvsvKuMP+zODQExKjeYvqUhF0fZg5vPDtHhq96vd/cRkdxZLDY34D1XrNK/5LEEjMkh/uOen+3eL2H7UP8+o6x/Ag0sXHnqCamO8zhRBmVb9h344eUidPk8T4ltXooolvi0v/Z9cdny2X6VGragDvPI/2seMSwbHRa8ouwVe0efAI25JDmE1jS/sn7FVakEcFaEVKNeQDMylIFrDsUwutBOW8XDi66mG3FD5mhYk27MJcDcbJxhv1hRaxO1oafhuwrN6fv0Iqj+72qqbTRPBLS34NlOblh2IjmZnxIt77UgPSqFsAhIvgL28NEBckZfB2tG9mwO99iNrd7uEdjA+7NcnSSvoYImrqLprXXboJoXQdIEEvW2UOxkdMvuwuBFbPZ3vB4hJA3KrNKnUJw5Zm5whoEe78WSlXojBRAJ1kqF+EB5g1siOFOzs8aRvqv94XuvsNMqUFAkpy/k+EzYrbQKvWu431avwK1fljRQpdUqO3zneDAWHSV/eRWQepGGTIsQeQEc3ZMCdqWp/mrAAguPBC7qge4/Ci/xbJRI1Zf3zOjn3+d50l9lKdqnWxrnG9SC3PwRboaRbV3hXWhG9b0NeroIeJtnmVjQyW54YIK+Ct+tOkRQQA9ICyV5vfAwlNzFJ0270EEYeKBBs5EeQu7De+zTgLQikAJa6fgktDjARTB0cWr+iln7Tw5rUbcLzp1H7V2qiDpwYreUI+153InM7kashpyBACFCa56eTJv1B7vLjNOiGg2J4i0RWgC0igRpekGWUhjAJ1tdHOyfG2TznUeLgARBfRPy7KL3hXa6rXhMKYTjxqbeyHtXPd2FbdXYsXi7O33yIfhaYI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(40470700004)(46966006)(36840700001)(478600001)(40460700003)(6486002)(83380400001)(356005)(82740400003)(70586007)(70206006)(8676002)(316002)(966005)(336012)(6916009)(47076005)(2616005)(36860700001)(186003)(86362001)(41300700001)(26005)(5660300002)(6512007)(53546011)(8936002)(81166007)(6506007)(33656002)(2906002)(82310400005)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 16:30:40.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f88fa055-a839-45f6-3622-08da64ed06b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:30:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167973

SeKAmXZlIGRvbmUgYSBtb3N0bHktd29ybGQgYnVpbGQgb2YgY29yZSB3aXRoIHRoaXMgYnJhbmNo
LiAgQSBtZXRhLW9lIGJ1aWxkIGlzIGN1cnJlbnRseSBydW5uaW5nIG9uIHRoZSBBQiBhdA0KDQpo
dHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzg4
L2J1aWxkcy8xODQxDQoNCkZpbmdlcnMgY3Jvc3NlZOKApg0KDQpSb3NzDQoNCj4gT24gMTMgSnVs
IDIwMjIsIGF0IDE3OjI4LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8
cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPiAtLS0N
Cj4gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzcu
MC4zLmJiIHwgMiArLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1zY21fNy4wLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fNy4wLjMuYmINCj4gaW5kZXggMTE0ZTY4MjBhOWIu
LjcyNTI5MzUzZTU4IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2V0dXB0b29scy1zY21fNy4wLjMuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzcuMC4zLmJiDQo+IEBAIC0xMSw3
ICsxMSw3IEBAIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhDQo+IA0K
PiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJzZXR1cHRvb2xzX3NjbS0oP1A8cHZlcj4uKilcLnRh
ciINCj4gDQo+IC1ERVBFTkRTICs9ICJweXRob24zLXRvbWxpLW5hdGl2ZSBweXRob24zLXBhY2th
Z2luZy1uYXRpdmUiDQo+ICtERVBFTkRTICs9ICJweXRob24zLXRvbWxpLW5hdGl2ZSBweXRob24z
LXBhY2thZ2luZy1uYXRpdmUgcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9ucy1uYXRpdmUiDQo+IA0K
PiBSREVQRU5EUzoke1BOfSA9ICJcDQo+ICAgICAke1BZVEhPTl9QTn0tcGFja2FnaW5nIFwNCj4g
LS0gDQo+IDIuMzQuMQ0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzE2Nzk2Nik6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTY3OTY2DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzkyMzYxMzkyLzY4NzU4ODgNCj4gR3JvdXAgT3du
ZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5z
dWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1j
b3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiANCg0K

