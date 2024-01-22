Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85E0C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 12:50:50 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.83])
 by mx.groups.io with SMTP id smtpd.web11.72817.1705927849265753742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 04:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5QBZtV7H;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5QBZtV7H;
 spf=pass (domain: arm.com, ip: 40.107.104.83, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=S6oxUCAx8DDXm9zlljVQPxfTK24k8nzetkn6s0avto020WlwSabLoMTMHWpB20sejK7OmnaOQB2VGKBtvhQIaO/6rRal2llmgbJgw44zgJJI0hdicVxY+Ed1BAo8yWSjPxgBM6Vf8kROY3yxW8dqy9zLje/k4mMr9cmQlUnZNDC4cjXJudmn/3xwC5BayFApE30qBHsi/DpGg+yN/Nym2e5ZBmZkFPBNvHDg8WpefRS12fBmOVB4RU+7vCUOIke4wu+3ZKBNhSNHx2Jh+YY57VYnfua8cFmNpTKOAnsXU1OSvNvzDn3RffUApfwB+FDtYRDwPtPvYPAMfe5EvgRxig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2ClSIsISt/3TYoJAzuM0MYd8zowmSewGsJKNnqsRwY=;
 b=h/AxQ9o/obc1LIAqBMs1UFPvBiHjjxUO5j0t1WxuUKxXwoeI1QbrIjpMX51bruqnS+61c5whUrw3jbpIrO6g0711+QX/qIB5VX2ru4cwNQIDPX6Q5gXEhU9KRu8tuAUCJvdtq2AZUEPgp3N4Z863jg3yZ9kYFcNWnFk5FyVxXU3tWEWFKu8lS7nIvf5DjipRNCGUUWPqTYyRlOmI0R+nioYALddmcIlQLMmH72sjpP1v4h3D70KqywXWZuGaeG2X0Uh4qp8PjSlIZjzDfbZ/MtgTiINTWNqI5tbLkogzMkcXVTeiFlsABKohjvrtiH0cJSIXPEU6yWtmdGor0EImYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2ClSIsISt/3TYoJAzuM0MYd8zowmSewGsJKNnqsRwY=;
 b=5QBZtV7Hry6Zstf+/UXTmTAenAtWVTu+A/yrQuaZZ9IZt+WOgT1ijJcPJWrReE8MSjXFxABMXR/ks2OMImzgXkLXV27k5EWdvsN7uXBQ0YOrAVXMYtIE2s8/9gpel6CsBMCYJ2diuOq8rrtbT8HKapRfe1wID5hIqPZFo10HIS4=
Received: from AM0PR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::38) by DB4PR08MB9383.eurprd08.prod.outlook.com
 (2603:10a6:10:3f1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Mon, 22 Jan
 2024 12:50:42 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:208:10e:cafe::b6) by AM0PR01CA0097.outlook.office365.com
 (2603:10a6:208:10e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 12:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 12:50:42 +0000
Received: ("Tessian outbound 94d82ba85b1d:v228"); Mon, 22 Jan 2024 12:50:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6bb3b6c3d744513d
X-CR-MTA-TID: 64aa7808
Received: from b2e5f0149ea1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B57B8F34-B223-49D0-983F-E724ABA0164B.1;
	Mon, 22 Jan 2024 12:50:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2e5f0149ea1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jan 2024 12:50:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiILylsoODU5ZbRcZTW/j0oT5I9vdQuAltuEfFpcl3pH0lWRsW+3D9leUixi76sW8LtZPulBNoNu3+xsxT+vY7ZBU/YVp/K7hNqoX+RGO+ZsgqY8wPbNsIsymerlz36X/ikE8vVPq6g4le6bc5KcicX36vVGg0ZeHet4Pb1HXz+Y3T9pLYbSCFOw8W4CqjxW5EzBYm2amYoSpx56NyFjzV+qgpaC8RJ/2F73i+1ZeubJ5SwmLU2amJUO6KZa6Acnhhx/QI6lKmGlzs52fVbeP0ZxYkf7ugfU1xuBZiuOQ5iKO9mtffPBn33AiUO4h57FBLrcOdMeDdch0/vR4yYwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2ClSIsISt/3TYoJAzuM0MYd8zowmSewGsJKNnqsRwY=;
 b=gv7YUDJVoIZnNMbGv7L2LfEdfiQFj/aaESuSS1RfW8Du2e+wyh9LpiLbTY1zAarR/e9NYsRz6ncyiSQFcddK8j7r10PphP2H+Die0dOM5MKQrQOg78dME9h3px/efBA/lmpYSkvWJhp2qR3c9TOIIDR3DsKDH0dNxaNLeZZykq7dXmwsL/fc7iQDEeFiXMmsTlBKD8OgUxlp0JGUc0khN7ZpvFIN53tjGnSMcvcD5+PAUH6OhReCMG7PV9vb2AXrcUqbSNNghxeNxOr/HQzxrw8ZM/N1MzFZZYAnCXDzBSIgBFLHFUlW06d6hBkulKANuwCTdunOT+SuoB6XtM/ENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2ClSIsISt/3TYoJAzuM0MYd8zowmSewGsJKNnqsRwY=;
 b=5QBZtV7Hry6Zstf+/UXTmTAenAtWVTu+A/yrQuaZZ9IZt+WOgT1ijJcPJWrReE8MSjXFxABMXR/ks2OMImzgXkLXV27k5EWdvsN7uXBQ0YOrAVXMYtIE2s8/9gpel6CsBMCYJ2diuOq8rrtbT8HKapRfe1wID5hIqPZFo10HIS4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6499.eurprd08.prod.outlook.com (2603:10a6:20b:317::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 12:50:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 12:50:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libgcc-initial: Update status of CVE-2023-4039
Thread-Topic: [OE-core] [PATCH] libgcc-initial: Update status of CVE-2023-4039
Thread-Index: AQHaTJ7SsA5qPiFdTU+/ZYBGS5O5trDlyeEA
Date: Mon, 22 Jan 2024 12:50:33 +0000
Message-ID: <4F73FBA4-6180-442C-A81B-003C32A0AEDA@arm.com>
References: <20240121191935.738504-1-simone.p.weiss@posteo.com>
In-Reply-To: <20240121191935.738504-1-simone.p.weiss@posteo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6499:EE_|AMS0EPF000001B0:EE_|DB4PR08MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8c64ac-3013-48f8-90a5-08dc1b48be34
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IaRkamtupOZev8zDQ+omKOsrBjhyxEedPacnN7WMSwWdGIdQ7DrM/qdlrqDFXDupPGnRyWvmCzmbEByMA308mvmvyTS/rcR2sc02SSqWyCw1I4CnevQJxkaksHSscu2wnBHGOSLyJlstBHOhpIGDl+rtDY607xOY/Bb9cb7cJY/D8rnGnSCDgAqepbKyglLFwkymxWVhRJGKf2mWNjDA9njT3Amvy9WcDPQKe+QSzGzZErn29fx0l98cGxjpIN6RIJwLz8dk8JoI62mZqrd58cIHJDOgWQadEVoH7d6mvLrlTmZ5ie/Ngjw7B1uvRBdlTLGVy5oPTClwqlCu+NWKlvsUNqIr9gkS5zbZ87LtoZALAcRltrbG9hdYFfSpuc6rZxOcTzsjCtxuL+1XlsaXhLzh8A++wD6BOGzXhgqv3UbUc6p2GzS/+TKVE6/rA55yCzLI84LQuocoPSZxnfxHqqLpLtl9YsNp0g+TopJOkfGbw7zamYYLk4YG744cPFY6UiNU3BiykuhIpNSh6slQN6YzvIw1d8QwGmkeAj6CELwwfwWB+3V9ILPgQBLvIL6WWDSYRRbvC9fzKWXUMijJJvWWV+lu3gKCU/c7zMhAAjcG9PCDc28LwbLXiRBUpI4NBkA3sRhFa7qr9lZZpdN2aw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6506007)(2616005)(26005)(53546011)(71200400001)(6512007)(41300700001)(4744005)(5660300002)(66476007)(2906002)(478600001)(76116006)(8936002)(4326008)(64756008)(66556008)(8676002)(66446008)(91956017)(316002)(6916009)(66946007)(6486002)(86362001)(36756003)(38100700002)(122000001)(38070700009)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B153BF66BBE5B4C9C89752232DE6D23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4fbce8a9-eaa2-4a45-82f7-08dc1b48b915
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Onn0Cq7LA4QX3JnQhfqAz3L5mlmK/96rwPPuMXnxSDP49/Ls8JiOOdJn/P0EiqmwNN6Y31cBqnzGpGVOdYB4Pp0XsA8wU8CwYFrcCCdQA6jVwlpHqenkbe7E5/cz8ZTd0/MX9FB9R+xUmuHeyDsTjtdTtzGm7bEU6wrVqqSCotMHUlAibfch3WZwgynRdAXTbyef01R35SkC0elWN0xT2JHqIxEHt5gBr2QB7Gns+qMUxzfftjc2Z8FPA14TQtoc1RK4cFPrteiDHkMJ/6ega8ewecUuEyOx/yoyTRO6vvpG+NEcIqmbeiQTosuz6n1suWKAAyD2mMRWmSxpVfHIPXHoH9HBUJrO1I0LaEc/0JIG/wSeUMQptUUcil/og7888W+04KQvClBMwaEAP2i1GNr7YP38Tqb9/RNRZK/uUJpQLFhUef6XVTKABo9dfg0jHZcrtWH6vyD7RQU1ttjaX6Rpnw6+r1aaNSl/x7Mf6REB6KDqcv2bEiHMoR91ZvKu/LcXGjjSyMHJFkmXSvmHsOsX6nQa+EuahkgtlVqbtrGbX28gic9qlR5C5H01vD0ATljok/cR3pqhPMj9+s2LPXfPY8lH1SKc+qSLlX3A4buClLlrd4s19KS1t986pUOhpUN7dONn32XUkm/Rqwc/Er7dUaiS7JhnkBhbpvi2BbG3gf7tEd/KjlSo+2GBsfpwijf+rAyvFR/jhIQF4mUmLg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39850400004)(376002)(136003)(396003)(230922051799003)(82310400011)(1800799012)(186009)(451199024)(64100799003)(36840700001)(46966006)(4326008)(2906002)(86362001)(33656002)(8936002)(6862004)(8676002)(6486002)(4744005)(5660300002)(316002)(70206006)(70586007)(36756003)(82740400003)(36860700001)(47076005)(356005)(81166007)(6512007)(53546011)(478600001)(2616005)(6506007)(336012)(41300700001)(26005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 12:50:42.2010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8c64ac-3013-48f8-90a5-08dc1b48be34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 12:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194146

DQoNCj4gT24gMjEgSmFuIDIwMjQsIGF0IDE5OjE5LCBTaW1vbmUgV2Vpw58gdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHNpbW9uZS5wLndlaXNzPXBvc3Rlby5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+ICtDVkVfU1RBVFVTW0NWRS0yMDIzLTQwMzldID0gImZpeGVkLXZl
cnNpb246IEZpeGVkIHZpYSBDVkUtMjAyMy00MDM5LnBhdGNoIGluIGdjYy0xMy0yLmluYyB3aGlj
aCBpcyBhZGRlZCB2aWEgcmVxdWlyZSBoZXJl4oCdDQoNCknigJltIGd1ZXNzaW5nIHRoaXMgaXMg
YmVjYXVzZSBnY2MgYW5kIGZyaWVuZHMgYWxsIHVzZSBnY2Mtc291cmNlIHJlY2lwZSwgc28gZ2Nj
LmJiIGRvZXNu4oCZdCBhY3R1YWxseSBoYXZlIGFueSBzb3VyY2VzLg0KDQpUaGlzIENWRV9TVEFU
VVMgc2hvdWxkIGJlIGluIHRoZSBnY2MtMTMuMi5pbmMgZmlsZSwgc28gdGhhdCBhbGwgdGhlIEdD
QyByZWNpcGVzIHdoaWNoIHVzZSB0aGF0IHNvdXJjZSBnZXQgdGhlIGNvcnJlY3Qgc3RhdHVzLg0K
DQpSb3Nz

