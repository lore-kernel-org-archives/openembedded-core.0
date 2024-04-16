Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D12C04FF6
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 16:39:25 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.57])
 by mx.groups.io with SMTP id smtpd.web10.26051.1713285560433150969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 09:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KZ8mOsWb;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KZ8mOsWb;
 spf=pass (domain: arm.com, ip: 40.107.8.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fWbGq2elLy0+DQG/TZSBfFSX6G/uFpillIVbpLbbAncSZ9WMilSe0sM5pbMb2VmmlV8UvfIkSqZBDPO0XXuFmiWGzzTTJSe+q06iHrQlCCODzSHssxkQ9YMmC+4d3GK7Uqrry8nlIT81LQ9kaJ832KMCGD/H8KJL0GLtebppDRMJDCrJ1qn7S1TCfUClBasyAOli9BfAOprAs9rWuT6RajXit4f+JAeQsNfAwg6H8yP4CL3IwNYNSvFUhZ0tYUK99wfl5MLU1dnkJ+bdbbZrGurUAHyljTpcQahMps7AUdmnQPR4Eiz55EJr/h563yVE7xaHECOa5zxtbC5FPa10Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGkzhuoWhUWQb8wpL498uwTp1MxX8c63wtBLoMmn+NE=;
 b=CKJQoUZ4ZUcNhbHySPIXNI6GVrPy60EtAxYOVMf6MLSzSTnExIUFAZOHyoXqxLPu/w7gfi3dci3eBwHAbwo9/NPggmIWkN7pmJIMR9pxTYRxDyHNURMpZSIdMpppwJ1ZebQZkxmEKZr1S5Bl/rUCpu4UgvxjJc2QYxQeXYCELC69yDzfBMDmPlwrfVFX95UK6qhk3hqpV24BCHEf9oWUtiY+tSCBQULI/Xnts0H6d+EupnBf+yMAsWMcoJ+vhjvPuC6I9OBVqyPiKfe/6TeIucBli/4uBGYOccU29gLQb+R7BNY6qy5X6lN8NYXJimlZYuuy4DHzecxJX4+/AYITlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGkzhuoWhUWQb8wpL498uwTp1MxX8c63wtBLoMmn+NE=;
 b=KZ8mOsWb/tMDuxY6UQkRoGCB/u2DzW4XLSblZsjMlw3088GRZcVi+GUsVzUUzt44ndGw0C310DyLCyGWh5LalcAmIm54Kyp/GYPKQR2gy3xYMXaT8A6Mbbb2dKfeiJM1isc3QjcISp8tkNpqlzJaW2HHJ8S4+Jhu2N+BjHJFjWo=
Received: from DU2PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:3b::6) by
 PAWPR08MB9566.eurprd08.prod.outlook.com (2603:10a6:102:2e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 16:39:15 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::27) by DU2PR04CA0001.outlook.office365.com
 (2603:10a6:10:3b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28 via Frontend
 Transport; Tue, 16 Apr 2024 16:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 16 Apr 2024 16:39:15 +0000
Received: ("Tessian outbound caed45120527:v313"); Tue, 16 Apr 2024 16:39:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f77db0c88c06b4aa
X-CR-MTA-TID: 64aa7808
Received: from a457c648dc0c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 83E6F4F0-BCD8-4AA0-9FEE-07BA1E4856C9.1;
	Tue, 16 Apr 2024 16:39:09 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a457c648dc0c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Apr 2024 16:39:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuM+VuPLoDc0bB+ZAxo/NTC3SZWe9RSWmQDF6TQlLjtKfbVTsTZAEOMo5+8oQpLIp3PgIAMpkKZfbIJi6OsLOIQ2RR0iTbR9FCUH/vB3H3mPxMIP6ArDThry1D+Wwtu3/r6jeHVWmazpnCg0BRMFeb4eG8ckRiJTM2PczoLJCqqLjlN4HffOZl5Agy51QLG+zIE+574MjA5hx3PNfzBdkqiDO09/zpN3HFZNkkgyhp5QImgQkU/iY+ygQzLBOfhHco30EUVRtxeLddEETO0Onas8HOM8crHDrwIiEWwUsY0DIBoVkAzcHXLilS/ZJsa8JDYj7YNZH9itbIl82n1CRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGkzhuoWhUWQb8wpL498uwTp1MxX8c63wtBLoMmn+NE=;
 b=BPdq2ZUa1WqvCNYlKbIo/ZSqrD+iB7VV6/Fk6XeZ44OqPIql9PE2xkN3BNqv/70WeQmOUeJE2ABOdcsHC2yQmmqlpKMGmU+EXkCCHEKy+jTFDCN7jWAsM6yYxjGahWhh38OVIE+dxgQ/KIdhL4bEsDqYQ9b9MBEjyfKP3Oqbv7P0m4I0d50qDbGlaCV1pAgej0KLHSF3OTfdqZeYgROIOPna0fsXQ0ZYYz+7ttue8DC8XTlZs9YELI9Zs12d+gPiouzEflkNh31kfxKQwK75KQBWWo3lQJzx5d0TC7z41NGLE6IYKkPFHapjEY31f5KLB6fV0BtdiHPnYg5J74dKSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGkzhuoWhUWQb8wpL498uwTp1MxX8c63wtBLoMmn+NE=;
 b=KZ8mOsWb/tMDuxY6UQkRoGCB/u2DzW4XLSblZsjMlw3088GRZcVi+GUsVzUUzt44ndGw0C310DyLCyGWh5LalcAmIm54Kyp/GYPKQR2gy3xYMXaT8A6Mbbb2dKfeiJM1isc3QjcISp8tkNpqlzJaW2HHJ8S4+Jhu2N+BjHJFjWo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 16:39:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 16:39:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] oe-build-perf-report: Add apache echarts to
 make report interactive
Thread-Topic: [OE-core] [PATCH 1/3] oe-build-perf-report: Add apache echarts
 to make report interactive
Thread-Index: AQHaj0MX1AS28JXzrUGKDPtFbybsFLFrGqCA
Date: Tue, 16 Apr 2024 16:39:08 +0000
Message-ID: <14BFCF16-AF38-43A8-95C2-EDDDFF5A98BA@arm.com>
References: <20240415144129.92641-1-ninette@thehoodiefirm.com>
 <20240415144129.92641-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240415144129.92641-2-ninette@thehoodiefirm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5868:EE_|DB1PEPF000509E7:EE_|PAWPR08MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a27972-3492-43d0-51f0-08dc5e33c12d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TNwjZAJ+SWLCvmpSg8/828NcSVEE03Nq30f+ISawXoZR/E8qx7TySkrwN2WtXQKbI8cA4C0MbWtPhyjK5uiZBGxSd7W8JaClBn4c1vXMSo51jjjkhHwalOSwASkgmS4iD7+d9LALUxFymNRD1nZvVxq0DhhV1Cj+C+n4LxZsSJVEYh7O+En0ffZfQtQLOuIlwuQ84i4aXabvmIh4K5sulJSNWLslRJNYbFbVaoobovuYcpBmDUG4VVj3VC8W8pE2R2MleCuFxHFLkm8NMUAYWDuMGud5E/z7C7wqltPajcW8mDKMPewr3+PChbouS+hPU9plgUt769NDQ981r/6ZdsgR4FiXnDAhlV6rkIc+whR61/wiAWjoZBk9UUlqMzgACaH2EkyWolbSalWAEiUo7eogt2SIkhn94o+VUIZydj8qVOnhvs32pZ8lcFZAF74zYctww6hhYKnuVuZmhb56/blwuqocyYSEAl2Ffdf3LiFe466aNnf+HzpmoI+3aFpJHjEQyGGmQATQyU28uc35naFbFmvZq9ndfiv2OrrgIG7z8cCxG+QIVi4JWEyDN8CnrzgYzyxE3OOJyh9cD805FEUcawOq10FNmoocn8ouXaiDQ+IUM5hJ7lBL6cld4x8xPjLur5OZiGgjufAZhsjFBiieCA7Aa3YaXp6G8SGY2I4y/f3hb0ZeuaOOk7RRpetqWFZRLJPzlDhs/ZNFxlevI7hsaOUqfqwlP/K2XmtsjSc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA55125F9C4D0445991633709F30E271@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	79d3a702-b910-41b4-f94d-08dc5e33bcb1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HwQqP609S2WJKsf3jPpyNnDXyS2ROFuEqqPsXZ8keN0Txd6zqUE60h9bA8vr9dJswxW0CVIH04TXsX3LJiX/cYQ9OiXMhVKt46G+m9LI6JPOAlSpVsmSwNu21ShXeavpaR8YtP5BIKupdEJOpMOlkUS9fB/4xFXYEzUhycaMZ4CwK0SFxIDCTA0u+jsiiom+2bmEtg/oGT9oRaVqfemG1QSGS5i/vdUXb8y9JfkFRjG/bbjq5WrG182aalqCxK1cZ0Qeu4/NkTKu/C55TbfWDgc9RJjoL0kCsPtKoCdQ5LSuQDEymrdCLWFgcxDtJp73oShqMewwDP6dlEMd7KctJGnK391Fsicig1FEyjlaHEZhwYfmsgFqT7H4sy583ntLuUdDL5R7c065WQZYksIrSGVH17N0EtelCTnn00KjBXFDQpexJC7i5YECLaNPwKsIKwI0Qcmm4ozOzqiLqcsUxoDPea0um2dR8onfTmFTdooby9X4wAV9RZlAvVfks7YQUKctN2xP0StBWlM8MatTiUd/54EUNnX/tKQtXOAPfS3N/ijbI1S0HWEb6tBcC71j4dEUhDjP2PFsUZuN1pzyHcQ/HIQGCn3LKBn36F2eXfSZS3knhMXhBBwhTcq3PnJvlgaDAUf3XVLLSh0sHaFnJrwVeGMvP6tzbjMug4YS3cgSGEo4sFdA5znCgUQknWb3K8iWZ+fvm4DgeQWMVLF1pO4nhqmL8arHVvM1UQZTA760q1bSSiFrXqI9IUfBp5DI
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 16:39:15.7083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a27972-3492-43d0-51f0-08dc5e33c12d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9566
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 16:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198455

SGkgTmluZXR0ZSwNCg0KRmlyc3QsIHRoaXMgaXMgYXdlc29tZSwgdGhhbmtzIHZlcnkgbXVjaCEN
Cg0KT25lIHRoaW5nIEkgbm90aWNlZCBpcyB0aGF0IHRoZSDigJhyb290ZnMgc2l6ZeKAmSBhbmQg
4oCZdG1wZGlyIHNpemXigJkgdG9vbHRpcHMgYXJlIHRyeWluZyB0byBmb3JtYXQgdGhlIGRhdGEg
YXMgYSB0aW1lc3RhbXAgaW5zdGVhZCBvZiBhIHNpemUuDQoNCkNoZWVycywNClJvc3M=

