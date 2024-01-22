Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B350C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:27:12 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.75283.1705933630189184779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jrpp9qQO;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jrpp9qQO;
 spf=pass (domain: arm.com, ip: 40.107.249.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=k6b/oyLla2P25JeIOw5GBPHLRzqrxaKaHQCXnG4NQfN5liraeS7mhmPi3yksA6Kx88ZO1AN1GYUhEfiepWp5TLWtBPQ2WJgN+HPjXY1Meh2BUdcCBV2K+0mZEPRyzfuSnGidcbU/BLX266xjpl8QboKwi3DYtQQFkYGVuQukwkpSlVWEcuWRYfOSyOMjSAtotswPlRrm7cav2YWfDyJUmnBP9yU2GSfxhzj7gRyzqenoOaW0nXbpVkQ346m9dCmG1LnlLfncy7ffmKYZtqQdk+SbQ7iPxNcTfSXgrbIaoG9vqYF2qfSIpHfPizfYhOjNOOI8J0bIviD+vs/JGFPvrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OL2cT4d909W/+ZmvSSjFOyXG3P3hTNa9nSPx/MT/DrI=;
 b=c533bqe5ouHq5j7Iy6gtDiQCvNH3ZaAGTvBsYY1kRUoUu1baarsWpxuCWa787PfnGAlP8RDvbcdTsj8tuTIY9VG9VBcsWG5YIm/eQBFjiXgOZxgq7GhS23pJyqyHNZPdNPNOIhDM+exKOPZvrwBUskvg7VVhnqRPujowv8eRdBT6k00joOdSwZK36A1gld96QvQ0R0M5XO7a1HgW2XQNqQgzD2RcvU1QMq1LSiGWDzJOFnNX/u1Zo787+9e10RUZEufFKD2gbbPUc27zZprsTtjN21zNiiwKXOZEFLP5U7nF3Jm6JFL9sMdk7pdow4Vx80hNWcO6u5wfswF36NURKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OL2cT4d909W/+ZmvSSjFOyXG3P3hTNa9nSPx/MT/DrI=;
 b=jrpp9qQOKW3oImVckOLQXUSnLlZ9v2AjaxJ24AetefqQPue8UIFTG78OP/eJ7cYlLaEVvSQihLpZtM5PQIY4vbwkBn/jrFUc1/Qlqi39DbUdgide57rt6eEjADtq+SH8ub2TjaWbTAW+DEvHAAIluAvYFz9RIYd4n84MLrKRCtc=
Received: from DU2PR04CA0321.eurprd04.prod.outlook.com (2603:10a6:10:2b5::26)
 by AS8PR08MB10193.eurprd08.prod.outlook.com (2603:10a6:20b:63e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Mon, 22 Jan
 2024 14:27:06 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::2d) by DU2PR04CA0321.outlook.office365.com
 (2603:10a6:10:2b5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31 via Frontend
 Transport; Mon, 22 Jan 2024 14:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 14:27:06 +0000
Received: ("Tessian outbound c4f080b252bb:v228"); Mon, 22 Jan 2024 14:27:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9ec3639aa1e47d9
X-CR-MTA-TID: 64aa7808
Received: from 89d22973b0d9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 651659EB-39A6-48D2-98D1-5445063E8D99.1;
	Mon, 22 Jan 2024 14:26:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89d22973b0d9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jan 2024 14:26:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA5mO4p5v0R62K5BUqk1GsvnjT/S3PlPk3wOA8ic2jB7+G3eq3UVtfxICaaS9o2TerJNaO/ZZyDu6Bp6QYJZOFhVcZrb/WC9faEucOmcOv/Gnmkf973D2ck/4SQGcZlMBn1iRpjNTui4oZCcWh0KSTBkSnivN2GVMJ5aXUupCFG+PnvAk8uvoQFxeq5HarbGPH7K/Vkq62eTNCPQA2/81X9DDrIzpHlDlTxjjnvsA0mcVrSOQH2HLLDizUmwkhOzCQ7h7XMXD/i+azMNHEnnXLXm+60aopixCLDU/Op9gL790Kf6APnkQqIOfejCqbvJ4NBVYybuQmLfVygxasMJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OL2cT4d909W/+ZmvSSjFOyXG3P3hTNa9nSPx/MT/DrI=;
 b=Xfw62IUjQdvTdWrUlTTbcOID3SNcRtUmyd0O+IC8UgN9Q1pTXsWUkpFHAN952twUTisCBvHjAEl+qxrNza+CFKCh4/mIkOm0mZJCdnJOSnsHjoZQFjETqvf7XHCDGWSp2dwuMobX7Nu30wqz44fjLkXd3T531y/i3CWoQqUSPMXH9xlmMhbQEGV3Kdi0Nz75HqhNMdEO/BiCLLRHrpecoFCHFafi++cWYGcbCuSEd2yU7A2kKi1jc8pRk7wo5d0wC5mvpKxfwp4Jlg7K2WtDtfqZ/yBxuvi3QPoDEnb1MWMNq2i2iZ3oC1O3+QwQ+fHRN0PUkHVA83xg0jWU4BJugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OL2cT4d909W/+ZmvSSjFOyXG3P3hTNa9nSPx/MT/DrI=;
 b=jrpp9qQOKW3oImVckOLQXUSnLlZ9v2AjaxJ24AetefqQPue8UIFTG78OP/eJ7cYlLaEVvSQihLpZtM5PQIY4vbwkBn/jrFUc1/Qlqi39DbUdgide57rt6eEjADtq+SH8ub2TjaWbTAW+DEvHAAIluAvYFz9RIYd4n84MLrKRCtc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9874.eurprd08.prod.outlook.com (2603:10a6:10:422::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Mon, 22 Jan
 2024 14:26:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 14:26:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/5] zlib: ignore CVE-2023-6992
Thread-Topic: [OE-core] [PATCH 3/5] zlib: ignore CVE-2023-6992
Thread-Index: AQHaTTv2XHukj8Pso06QQZdBkYEP4bDl4J+AgAAC9wA=
Date: Mon, 22 Jan 2024 14:26:56 +0000
Message-ID: <E01A3F45-0755-4500-8CA6-D9F9F0C49534@arm.com>
References: <20240122140406.3837333-1-ross.burton@arm.com>
 <20240122140406.3837333-3-ross.burton@arm.com>
 <AS1PR10MB5697D9500BD9ACE6C5006C54FD752@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697D9500BD9ACE6C5006C54FD752@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9874:EE_|DU6PEPF0000B61D:EE_|AS8PR08MB10193:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bc1393-96e3-4542-9919-08dc1b5635c4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 G+sw5jJFeQ8xu9L5LiP88Qlq2eISxdCHXKlef+EeeQX4TcjeHwoFhuMxm4dB20OQGOqGO0DT8TzqbkuRyY5rR+cSTdKybVRXx1/4gMun4mPq4bhK6Qyce4veDeZrEb3LDwND9fX3yweCe5D2XAjVN2NoCZ8VbGzsJyCICD8vbn8IhzgaVNIi/b7MLf+5HLKCQPXZVJLGWbdBfrkowIw8hjLIvG/oYD4hIKslZToSec6V87/IJpVd24U14eIAT+OtnX7NEUbH2htVO0VRVCR4rJfUwcNjZYQOiJWQiLhnxgEE59U2KCiQ/vUnwtw0APzD+ciDnLi55XAWCqiphlYCAdBXfx2gp0sB1FRuVsWLZL+ydqrRJOzeVDVQcF1qGVPFqRg8ysGmV2Cz+Y9/FIKlgOAdlSNPAY7UCbjvw4Dr5GFyh2JvopMDhb2DiRcdfR+wf4yOAwTBHb56Ob0e5iG99Bz9/IOmG5PsRfeSa4eWfu4KmV4CrzUfPhp5zHFPv3zskiMvR7E9xnAhXl1nCSTAJ/PlT9NqjKiWaAIULnnxCGdFOmwRu6gPtQduShjKvO2CulQ2DS7BA11CB8bcM9m6niPbbY3m84LQJtaf2M4V38Pbnb3djVW5O74bFIbrOFT4ERuUC0jgzk9sZXoAtSp7XA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(2906002)(26005)(966005)(64756008)(66476007)(66946007)(76116006)(6916009)(4744005)(71200400001)(8676002)(8936002)(316002)(91956017)(66556008)(6512007)(6486002)(4326008)(478600001)(5660300002)(6506007)(2616005)(53546011)(122000001)(83380400001)(38100700002)(36756003)(66446008)(41300700001)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <55DAC540D37B46408DF89FE37F6FEBE4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9874
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	096ddcd3-b16f-4490-4a71-08dc1b56302f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hxjz5EsYR/DUuJ1qPvrY7gz8TvrfO0f/XZEFqM3iR7SfohVzF9GmzJJ9DU/xz8KPQDc4t6crnamlstAnTyTA2hk2ENt2XBF2ojk9AIVP/IJwULEuT9Nuuv5p20YDwL76WTDx7ld0yJ641YruBKixdy5y55RvACAj4gQ08G/qB9bFDxmgT+on3V7T6Re1V4xhxkl+yJe6wA2Q7Yl0IFq0LMV4jBpnZIkEeEFID8eFnpt4J2Ennpk98UKLJUWC1OQFKaejpV0hArwm9b9b+nwKSPHSvP6kcyHg5b2BqVHdkWXe77Iu5KB/mTHKc6f4vX9DBSSNgP28YCAdZpJbkaZpzzIRWXrD1b+BVSsjcZM/fxw5wxD/3l1/PMm07oy3AHOgDvkimv2oVz71WF9Bb0YHat4ub2AtgjfKdGZPQysnAHp2Nss/9XGpGWTWUILXGtQD+HZxz7kjaw6rnogOMFIE6N+alO65AyOrNzpBizRzD8ZoPIhdMNKcb4ktALGN7OYXvuxaSTJOI3IMJAhR3prwJKWr9Iv7fv9KTjrldKeQ71Xesd/BKFLlkypWrwqWae4lfgN3XJEuaRKuAsbXHEMKOq/w7dO8xYG+IYK4SHYJdeSaPAyKlgIp0Ge+bkYri47XgqFIwkxh4L+/rXrPxvARv3BVGAulkHL3GYmls2F5DPE2GmAdnDQ6OPS92WsKYazoghwLbVtL5Pw0cgR9RIjntJifeGSTwtf8xCwmtq1qJXs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(36840700001)(46966006)(40470700004)(33656002)(356005)(40460700003)(40480700001)(86362001)(81166007)(36756003)(26005)(2616005)(47076005)(82740400003)(36860700001)(83380400001)(336012)(70206006)(6486002)(6506007)(6512007)(8676002)(8936002)(53546011)(70586007)(316002)(966005)(478600001)(5660300002)(4744005)(4326008)(2906002)(6862004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 14:27:06.2981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bc1393-96e3-4542-9919-08dc1b5635c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194170

T24gMjIgSmFuIDIwMjQsIGF0IDE0OjE2LCBNYXJrbywgUGV0ZXIgPFBldGVyLk1hcmtvQHNpZW1l
bnMuY29tPiB3cm90ZToNCj4gDQo+IEhpIFJvc3MsDQo+IA0KPiBJIHRoaW5rIHRoaXMgb25lIGlz
IGJldHRlciAtIGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1j
b3JlL21lc3NhZ2UvMTkzNjAzDQo+IEknbSBub3Qgc3VyZSB3aHkgaXQgd2FzIG5vdCBwaWNrZWQg
dXAgeWV0IGFmdGVyIDkgZGF5cywgYnV0IEl0J3MgQ1BFIHdoaWNoIGlzIG5vdCBtYXRjaGluZywg
bm90IG91ciBjb25maWd1cmF0aW9uIG9wdGlvbnPigKYNCg0KQWggSSBkaWRu4oCZdCBzZWUgdGhh
dC4NCg0KSG93ZXZlciB0aGUgQ1BFIF9pc18gY29ycmVjdCwgaXRzIG91ciBtYXRjaGluZyB3aGlj
aCBpcyBub3QuICBJIGFzc3VtZWQgdGhlcmUgd2FzbuKAmXQgZW5vdWdoIGNvbnNpc3RlbmN5IGlu
IHRoZSB6bGliIENQRXMgdGhhdCB3ZSBjb3VsZCBzZXQgb25lIHdpdGggYSB2ZW5kb3IuDQoNClJv
c3MNCg0K

