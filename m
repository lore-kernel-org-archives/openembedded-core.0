Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A61C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 18:41:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web11.14610.1700160068266317188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 10:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=s0S8wZ3D;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=s0S8wZ3D;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gLX2haft5dDXiC5R/VDdgOdKDTkDaRLO9TtBsxbjCycBS1+LDenUUHZo8MmV6dacX4p8WoJYJMgjLouQ5X1fwF2R7AUYmHMqfybjQ2Teh5KuQxth8joE/TVN1dUnX1Ndc0wSSOP0ggnPfhj8/ldkjf6BSHPQu3Vly5OZj1EohOceIgp6z9SFYEqLIQH2fRK1YKXtJqPzjWnRoqKy0HERbiQxAGZJu/1uVrGV081mBKDha3kySK+JUSstHOLdlgchopzRDUbIdMAtvmcLTwRvWZ1y+BnsP8LM6bI+BYT3SwyG6RqrgXI3yLNSGhUBygxRmbVSV2d6mgeY0c6QXRAfgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vgA0nWNPuaUh/3P+1b+kjAwDPrutK7g/nd/SOHmwRI=;
 b=EQ+vQiQpEibiw/8Ein1NtQrPA6teZtzZeymk3kDXA2Mrhx7jDpYUP9WJeBmfT1Jy1vx0gwZPxrDp5El0sRHLz+GlN7oJnAIG081qpNvv8UwlryVKE+6jezk3MAUEqwrl0iE9/cHmC9u0LFcsY+UA+iqHzf4qP7iLN46tfcUjmOiEmv+XagboLsAWE3r/NFFraGzeAJG0LEo3wCEEEIMdmvfzoRO1R2XlB5RAP0GqoleOyVuDwJoXzrJ/3Rp1U3KkQk8+9XcVl0l99YYQMl49MlniRfl+PAFQbyL6mRzr8VXarw/1S1B51CmAN+ffNy6XfSpWb/AcjTcEGgH8Fkwo+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vgA0nWNPuaUh/3P+1b+kjAwDPrutK7g/nd/SOHmwRI=;
 b=s0S8wZ3DnLmrnc8gLQuHp1BursQxYQPdeKPhEErEeAQ5C4DLTBiZoeEpx2G+/9M42zYGquwu9SHaA5wv1fAVbm/SanFC8PxCUzzrtjrRkbXtdPdfwEo2agASRp66DOJesZ+5V084DGL2DnXBmh9ntxYMdsA9nL1aZYkLM1aO8rQ=
Received: from DU2PR04CA0290.eurprd04.prod.outlook.com (2603:10a6:10:28c::25)
 by GVXPR08MB7893.eurprd08.prod.outlook.com (2603:10a6:150:1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 18:41:04 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::46) by DU2PR04CA0290.outlook.office365.com
 (2603:10a6:10:28c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 18:41:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 18:41:03 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Thu, 16 Nov 2023 18:41:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9635af7ae099196c
X-CR-MTA-TID: 64aa7808
Received: from 7a11bea1f0b0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F02462B5-8435-464C-9D70-5B827E8AB63F.1;
	Thu, 16 Nov 2023 18:40:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a11bea1f0b0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Nov 2023 18:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMyc2ZEkRTeMJeJAEerQmCdx3iamViUru3/ao+ym5UuGM21MbZEGnSd89+VaRM475y4F1BrpACXBFIoQqDmhgWKA+2/wNwzd+UuTk48oC2Xggy7r4RIrssfpsAsli4k0005w62Hjy12S5dv8a5E5/LH2mUdnyQvTyiZA5VZ2lNl988GjpovxUutc9jl84YV7lcLBTilO11bDuxlHZuhYtgDLQIC2Ck6hGqFmiUJwqas7pkFvNdy4evzOWUR1IRFjbNISJDE4l1jdSo7wbCtCzFQEOAfW7pqrTXdaHvpqeKRxpIaBKku6LamZiTOdzllqbWeLiRt7R0LMlKlgR0hEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vgA0nWNPuaUh/3P+1b+kjAwDPrutK7g/nd/SOHmwRI=;
 b=Svh1YDfg0wmjEj6bsEH/mDkuDhjfVGo94D4CXB7UdI/eQxi8sbAQ3T0oyxrTa1tMjPk0n+Msh4FnUS46/F4zXXPP5NNkcc4CCspe/UrQ5Ozm1gr8DfTN4zKv/BAvHHD7lz63thFscAT31Liv6Y3DVe65YzQKtGB+/rk6tS5LzqreCZ/+SJmMsuOqT9y22Y1fHOxCT/K87JqTzUHFZNDvNOwuu0OscI3gkOMG/+V6zSZ2aMmvHQDTj/I/mCuHcAxjiUTaeawhC+fEKcb5V14vfDPEKNuIlKAe50ZIf4NO3LxbGsmx3IcJvnGcCJWkdURHN+iDsaKpLeyO2lTN9aA5Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vgA0nWNPuaUh/3P+1b+kjAwDPrutK7g/nd/SOHmwRI=;
 b=s0S8wZ3DnLmrnc8gLQuHp1BursQxYQPdeKPhEErEeAQ5C4DLTBiZoeEpx2G+/9M42zYGquwu9SHaA5wv1fAVbm/SanFC8PxCUzzrtjrRkbXtdPdfwEo2agASRp66DOJesZ+5V084DGL2DnXBmh9ntxYMdsA9nL1aZYkLM1aO8rQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7871.eurprd08.prod.outlook.com (2603:10a6:150:17::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 18:40:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 18:40:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] rust-android-sparse: add lightweight
 simg2img/img2simg implementation
Thread-Topic: [OE-core] [PATCH v2 1/2] rust-android-sparse: add lightweight
 simg2img/img2simg implementation
Thread-Index: AQHaFz4xs+l9VLj0R0+wiz1bWy79tbB9SlEA
Date: Thu, 16 Nov 2023 18:40:52 +0000
Message-ID: <7C3ECD47-77A8-433B-8697-3324C36EBB2C@arm.com>
References: <20231114210418.1323819-1-dmitry.baryshkov@linaro.org>
 <20231114210418.1323819-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231114210418.1323819-2-dmitry.baryshkov@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7871:EE_|DU6PEPF0000952A:EE_|GVXPR08MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 101df9db-7685-4d1c-797a-08dbe6d3964a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FAQQosz1Nv9v+L+8p6jq+0TyMnwosCF++/Oannaa+9dIkb0jkvm5iRPo3MW/5Vh94r7wSBOWnjaDMSsJeJxZB46W3qOL9KQCgQ72W/e7CpyOMjABA/PTQ/3kykKTfwvnNI4U4xDrXriSK7rNMmbc7kt8mQWfR2Cc2ICZ+6Qvkf5rjq7ZarGU+wzqbJyhSXxnneYcKY/Jae9alKsTk2bfP7LTuS5nbiCglaPnUO+q3LVCw9T/fCt6Wsc+Co4FvuJPLYia6CP66+VhjaC/V8cwn4IAV/jSN+eVtczP+fSH+2s+70u0LKPapmp3joepDTWjf+JJBFrprBY0iBzCvYAGFaOp3X+qoLbDa6YS9dF4Rk0kg6b/qtuIlr9P5bS9x6pxmcLyKej5YLZWeh1D6w9NxjbdH9KotrZZnXZHBpcb66gFPNsnTjtrsEOrmQojiUlYlWKH/uSXL4kd1TZ8ntIqaU5HcjLnLbS3xrnl6bRbbXcQ2Qqg4jPdG1V/U1YDoeplpB3D8SWa6Jomf32PAit6ICxOVOoM/OqMwFSjUTWx02skJ3qz3CANOY0vy4JSFh4YJlAQdEW/oECBVKxWfpBuBPhuKHoNuw0uR24pU3Daf789IKV5iRXVf46T0K/EqNObrXKHJlSiGHFp0whE9VMmeF7NVy7IGVb8D710/1t0m/4mikSD5ga5ZoUaapQVRhuZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38070700009)(41300700001)(36756003)(122000001)(38100700002)(6506007)(5660300002)(53546011)(2616005)(316002)(4326008)(6916009)(8676002)(66476007)(26005)(8936002)(66556008)(6512007)(64756008)(76116006)(33656002)(66446008)(66946007)(91956017)(478600001)(71200400001)(86362001)(2906002)(4744005)(6486002)(16393002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B512CB70304354E93E8E657AEE5FA7E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7871
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	09a96f3d-3485-4ae2-b88a-08dbe6d38f82
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4RloCsno9/X8ttyNQX7ccYjMTX7rm2wcUBV3v7L8GABAa4+R9hnzMKMx6vn58AF/iilm9THFjJlE14bMxYwkDEVWT24JiZ68o3k7+i7nION9g1kR7XY+vn4CIph3Ki4A0y+iztX43ZUrd2yppQKIYEtoYaJ0wEL1Z+RAnCs8dwrSSf3WLl6EUtDfWvKh2H1VQMqSEly/Ud+Jc+YLAQeym/e6W3M8wzWlIo+DkZ/9lSNzc9U8zW8gm8pEnoGk8wYGkcjbA5/gkkjxnBsig7Yw90w6Gi7tZWcIaZ6rdkiUaipR1JKjc7asj295Muj3OagT7HnR6FRAb19VQ8053EheP4MNptSvnMLCey83r7w16OwIoEhSCNBE0lLy2NTxGPPy5rKCkkjIi8CPYQD8XdP9WLFxeZgzxJDXrCfkuMwGdZUfFTM6LrgXqbyNpj8e3X5i84sg1IKLKM0laMkzu+31bAPTM0tobVo9mX/FaCwRMnzqktIQZQa4QNNi8IuxCh8bqzOAenT7NcpFQwWk4F+sl79YLpTvHuMNmMUVqadHOLx/QgLppt6TpPI7kYuKI/5scdEqeI5ZTw3L9iPX6np3daaMuae2c/kWTWZVXqUcD26bl8KECFvGsX2vrtWehIr6Ye4rAVeEDErKm48NKV+xxIlV76ZjdCbGRRPWM/ey3+ltyAOUfuqo3H4PxITL0M5SjFHCDAFRLb+bExriukkJL9zsDqsCTsHuunqc6s912UDDk8AI90SpgN0/Pfft4FytPvZYcy33nSLQ0b/URLY2FQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(82310400011)(186009)(46966006)(36840700001)(40470700004)(8676002)(53546011)(8936002)(6862004)(4326008)(6506007)(40480700001)(6486002)(70206006)(70586007)(86362001)(316002)(478600001)(6512007)(82740400003)(2616005)(33656002)(26005)(336012)(47076005)(36860700001)(2906002)(4744005)(40460700003)(5660300002)(41300700001)(81166007)(36756003)(356005)(16393002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 18:41:03.7008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 101df9db-7685-4d1c-797a-08dbe6d3964a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7893
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 18:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190809

T24gMTQgTm92IDIwMjMsIGF0IDIxOjA0LCBEbWl0cnkgQmFyeXNoa292IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxkYmFyeXNoa292PWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IFRoZSBBbmRyb2lkJ3Mgc2ltZzJpbWcvaW1nMnNpbWcgY29tZXMgZnJv
bSBhbmRyb2lkLXRvb2xzLCB3aGljaCBpcyBhDQo+IGh1Z2UgcGFja2FnZSB3aXRoIGxvdHMgb2Yg
ZGVwZW5kZW5jaWVzIG9uIGl0cyBvd24uIEl0IHJlc2lkZXMgaW5zaWRlDQo+IG1ldGEtb2UgcmF0
aGVyIHRoYW4gT0UtQ29yZS4gQWRkIGxpZ2h0d2VpZ2h0IHRvb2wgdG8gaGFuZGxlIHNwYXJzZQ0K
PiBpbWFnZXMsIHdoaWNoIGlzIHNtYWxsIGVub3VnaCB0byBiZSBwdXNoZWQgaW50byBPRS1Db3Jl
Lg0KDQpBbXVzaW5nbHkgSSBzYXcgdGhpcyBiZWZvcmUgdGhlIG90aGVyIHBvc3QuDQoNCldoeSBz
aG91bGQgdGhpcyBiZSBpbiBjb3JlPyAgV2UgYWxyZWFkeSBoYXZlIGJtYXAgZm9yIHRoZSB1c2Ut
Y2FzZSBvZiDigJxzcGFyc2UgaW1hZ2Vz4oCdLiAgV2hhdOKAmXMgdGhlIHJhdGlvbmFsZSBmb3Ig
YWRkaW5nIHR3byB0b29scyB0aGF0IGRvIHRoZSBzYW1lIHRoaW5nPw0KDQpSb3Nz

