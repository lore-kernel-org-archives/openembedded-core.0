Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15270C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:21:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.2317.1706552460271594393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 10:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bnz7Jcx1;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bnz7Jcx1;
 spf=pass (domain: arm.com, ip: 40.107.22.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UDAekmDMvkke8ua+NC46mg5ZHBghdRQG8bhKSmOtZzuOJRfy/BxEdyMZmx4NSB4ueg7+DI6DWpfg98QeaO9//32aUPzAM4xqMr/OF6CuUO8/tuzKf0W+6ItqCUG+xvFmneQMHoeQQi9A1ReFwg+YyHfvLIFjroomu9qzU+PJHRh7/uJvh99TN+h0Xi5ABN8x/GFb0GrXx+zCb8L85zrJflVXqfM1nnCrjhyxBlLjt5W1fjD5Da5F0WnzvkXMtEVBPqMD9fRImEZhMjeGExEN7CKjx3l/gc3u4y7RUugkH5rQM/XKHNdEb3u8XZPfHNQL6f3VQykPeAah34KmBlarRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ek7tgY/0Zvhq7nrLrxyLpXWK7cmwlpdn2UhaYkz/gk=;
 b=fBR0yJ7UD5ekHtbuaPT5TWw7mG0NS32DS0cFba0YNBGaFshE5ExyUSu5fSLnqzSWkR6tBMqq7jVnRbep7JZ1TzvSDIr64Szyt7znIDgMR6HKxFd/HbJSlEXLyqHd9M8pgTU7OVJdHqGKWh8Lo5qH7/ItN2BG6fjwLIGnAVlmOXgt8XbTz5Tz29FzhVsJgQ93bxeVpBkfGgYwZwRreCIgtLiwXCu7a2/0Yv5WMm0Y5dY3AtQ8twn8M49JPnRJlpYOarw5Dxgc/XYiYdTau2QMud6gJbxtCh+sUZ0E4BMXAD5wSXcT8stPMw7XJRqH3jyDgpBxd7cgC8sDJMdRaDkffw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ek7tgY/0Zvhq7nrLrxyLpXWK7cmwlpdn2UhaYkz/gk=;
 b=bnz7Jcx1dhafzoJgSysy/SqaGYnoTqzVpQRpX+EimX1CKPqgYK6JSea7GEwpljgR5qO/J7pAflbyAVdoAiQT711NO1HHDdnp7kkQKoLBwQbs1YCiwJeWeJZ3grEcvkeXnghIRo2QJojMpnJQN9HMu0MGgS0V9hkZqm64dXpHAt8=
Received: from DB8PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:10:110::19)
 by AS4PR08MB7877.eurprd08.prod.outlook.com (2603:10a6:20b:51c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Mon, 29 Jan
 2024 18:20:54 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::2d) by DB8PR04CA0009.outlook.office365.com
 (2603:10a6:10:110::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 18:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 18:20:54 +0000
Received: ("Tessian outbound c4f080b252bb:v228"); Mon, 29 Jan 2024 18:20:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7102f7e230f053dd
X-CR-MTA-TID: 64aa7808
Received: from a0e8dfcdf21a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AFBED883-FC24-4CFD-87B0-2358BA89EB2C.1;
	Mon, 29 Jan 2024 18:20:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a0e8dfcdf21a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 29 Jan 2024 18:20:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8DxAa7rWcld7F2g5KmmBQdm2RtHcVRJYQRDv914rwvEODHDLHx4adZWsWka6R/0AoEZMvVdwk7C870MDLhbv+8FbhyPib/bzNviHy6Edhnl+dBSQUsi0Fj7NOpWVmbJ2jI/Jj81WyrYnisE9G8qH9vdqWZZMvwNAZb6Rz3qB4pCKhriHI0r2tpLNmYYAxQCuPWEeY0NLw5Z7Lk+zbNTxGRu2rXaWFEw1QS3dqjdgue0HbE+4bqEEMup4JIoRKU5kpiLksGbTCt0/Uku0GF6IZYF6jgjNfCFIKNc6mx3NEK3QNQXsYDWbOiro3sD3GDLCZdkD0sit7/66aJ7n/BNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ek7tgY/0Zvhq7nrLrxyLpXWK7cmwlpdn2UhaYkz/gk=;
 b=hLsdehzrgFXKAoNRqj+3N2ezwtfDgASVsrlRNr6nreaZIzROk8s1UXY7fKmr1reA2sUa+18zzGawsJ++d9QtQ30NL9rhJiqeMgaxmv/Yj6SkGPf0ewUky+EkEs8YaIpl9R7Idf3zYjSxSwvUjvMp+badGprs6ElAz9CMWiByjOfafTSl0QJZi2qOAoSXdnjR2Xx9z+zOL1TofniXUWZk4mBDYZhM5mzeWn6q0nOSmNQMn9cflWNknhg60Gbh1Dblobz6JwcnttniFJp9OsHPOYQvfYPZgWGYm3o8uNNl7b0ufR6YEFTyW9Rz0GoJrGdBu2cJEIlhA+7sEuYhuP57yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ek7tgY/0Zvhq7nrLrxyLpXWK7cmwlpdn2UhaYkz/gk=;
 b=bnz7Jcx1dhafzoJgSysy/SqaGYnoTqzVpQRpX+EimX1CKPqgYK6JSea7GEwpljgR5qO/J7pAflbyAVdoAiQT711NO1HHDdnp7kkQKoLBwQbs1YCiwJeWeJZ3grEcvkeXnghIRo2QJojMpnJQN9HMu0MGgS0V9hkZqm64dXpHAt8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5522.eurprd08.prod.outlook.com (2603:10a6:208:18c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 18:20:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 18:20:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 28 Jan
 2024 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 28 Jan
 2024 01:00:01 AM HST
Thread-Index: AQHaUdu8sj74V63IVUG5/qnl57TQqrDxG/sA
Date: Mon, 29 Jan 2024 18:20:45 +0000
Message-ID: <DA908433-CD5E-426B-9938-EFE244792C57@arm.com>
References: <20240128111816.A9A16106961@builder.sakoman.com>
In-Reply-To: <20240128111816.A9A16106961@builder.sakoman.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5522:EE_|DU2PEPF00028CFF:EE_|AS4PR08MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1c16f9-c894-4be3-a7c5-08dc20f70835
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ucIVmRt86yVSP1KFoH/LQwTMkxvpmSj7nSGxUwjY3nUPVjxQBp00fyRD2lUZmTY70NLFBzecgBnsX7UEfMw4j19dPyyqcJpheTmW/ZspQVBZxii4DdbRHp3mNe9g8MQNc5fsQ4lU1CP0LD0tzaux6ThwcnaBlBQLKm/8GrSlFZcf0kVPC9tPsZxGkoyzu4s5F9IOyTYt4vRdwCFaZLS9w9q+uhS4HUHtnFpyNJSMi8edGR5WtIpR0CJCN2Tirih1AxQ8Mz8wf+SZZSotukw9LJ98rILx6rkz1/Z6L9gv0wkVJXUAReG1/keXxjlIDg6CG6o7S8Z9IDcZ8RRGNL1qBO4csVSKeTfGUEMUe5nZZfeDmLJXQDt8luwBbW2NMA2lHEUSj6rADAJxdvxttK0waEAky/8CJ8H0Bdc9fWQvPwlUwq3+ScL5tjZGM4/Ct18d1AQn4OCJ9N7+KfC5Joax1dyw/5hXE2WZx/Tg1wKoicQo+fZZPBtwjd9wsR9RCdYz+rmML3UINyl7dl0FDoBAUoZzCIOge/S7oeXE28PA+BpuGazHb5PGBSL2PkDqay7YicBUHP9B8Z1H2ECPKvcu28d6X9CnmkzPoKegobI49W/LxnVmsIbLw9WxYNnJ+dwaj3XZWw0QfwAR4MAJBlhBDQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(83380400001)(6512007)(6506007)(53546011)(36756003)(33656002)(86362001)(38070700009)(8676002)(8936002)(41300700001)(4326008)(5660300002)(38100700002)(15650500001)(66946007)(122000001)(478600001)(316002)(66476007)(64756008)(6916009)(76116006)(54906003)(66446008)(66556008)(6486002)(966005)(71200400001)(2616005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBA304ACDEC06B43B1ED2B7D16E4472A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5522
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8bb0661f-689d-41c8-d087-08dc20f702d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uQ41U2C77gefF4KsqRb2oY4JRW+C/cmPk9iJx8luWV1ek7GPKRHrxVT8W0wqhfwlQ4PLj3Vwsdqgjm25+TC0+edD+bt/t6wQBz4mdPIvB7yMXFmjwZvfWxKdaUJSkUjgwJsxfwtgJAiwLRWZ/fN9Wx25v3E6We9V9KHEPXV66eQUNO6ZelsINkqKv8RQM1TFf/8v0AzIEUVzwbxMx8R2U6KOn9JT7X3TUfdT0YknqV3HD6VherPfYB7N48zCOkNMLINhASkSP4qMzMwgbise8FpGLX8723Ce+V6dQ+jaGz1mMQGT/0b+BWw35NfZBwOwy1TonlfZ0J++ARLFUHLBalVDQNHWfBV1VsaeZ/y+DVYytQe7TpriObNboANAN71/ijQ0c+TS02A4ERpXgOGH3coF1CZ+b26Nov+9OeCf1kpIpXQtKHAY2sFKM50Ei59hKoMHixuSnCScd+TjudQ8RSHJcVISsq0H7MYfEdxV8fJDXeuoDxgWT/T9Vit9iKo5lVjbQ1d0DXWstICoW+7bXvfwCpCleTsVgzBNpeA7KFjEYdQXYyd4VPtKYIZHaLIHfuX2xTgR7y2bGnm0ArPlTmcrFs3QXMRwd1CceUtF+mai2nhIZG7iUyOayCVJd6JDldAtX0S2kUbbij4h01EDsfGHGFzoHD1G97U6LDlSOH5wzr9K6SwiNUvXyr9kvVtatclEu4yzq9U/HttKH5uLKZHzIPCjo+saS/QrXzr4gEI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(82310400011)(451199024)(1800799012)(64100799003)(186009)(36840700001)(46966006)(40470700004)(356005)(107886003)(2616005)(336012)(6506007)(6512007)(36860700001)(53546011)(83380400001)(47076005)(15650500001)(5660300002)(41300700001)(2906002)(4326008)(478600001)(6486002)(70586007)(8676002)(966005)(316002)(70206006)(6862004)(54906003)(8936002)(36756003)(33656002)(86362001)(81166007)(82740400003)(26005)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 18:20:54.6200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1c16f9-c894-4be3-a7c5-08dc20f70835
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7877
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 18:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194477

T24gMjggSmFuIDIwMjQsIGF0IDExOjE4LCBTdGV2ZSBTYWtvbWFuIHZpYSBsaXN0cy55b2N0b3By
b2plY3Qub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90
ZToNCj4gQ1ZFLTIwMjMtNDAwMSAoQ1ZTUzM6IDYuOCBNRURJVU0pOiBncnViOmdydWItZWZpOmdy
dWItbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5J
ZD1DVkUtMjAyMy00MDAxICoNCg0KUmVkIEhhdCBzcGVjaWZpYywgcG9zdGluZyBhbiBpZ25vcmUu
DQoNCj4gQ1ZFLTIwMjMtNDY5MiAoQ1ZTUzM6IDcuOCBISUdIKTogZ3J1YjpncnViLWVmaTpncnVi
LW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9
Q1ZFLTIwMjMtNDY5MiAqDQo+IENWRS0yMDIzLTQ2OTMgKENWU1MzOiA0LjYgTUVESVVNKTogZ3J1
YjpncnViLWVmaTpncnViLW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxu
L2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtNDY5MyAqDQoNCkZpeGVkIGluIDIuMTIsIEnigJl2ZSBz
ZW50IHRoZSBtYWlsIHRvIHVwZGF0ZSB0aGUgQ1BFcy4NCg0KPiBDVkUtMjAyMy00ODc5NSAoQ1ZT
UzM6IDUuOSBNRURJVU0pOiBvcGVuc3NoIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1
bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy00ODc5NSAqDQoNCkZpeGVkIGluIDkuNiwgYW4gdXBn
cmFkZSBmcm9tIFRpbSBpcyBhbHJlYWR5IG9uIHRoZSBsaXN0Lg0KDQo+IENWRS0yMDIzLTYxMjkg
KENWU1MzOiA2LjUgTUVESVVNKTogb3BlbnNzbDpvcGVuc3NsLW5hdGl2ZSBodHRwczovL3dlYi5u
dmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtNjEyOSAqDQoNCkkg
anVzdCBwb3N0ZWQgdGhlIGJhY2twb3J0Lg0KDQo+IENWRS0yMDIzLTY2ODMgKENWU1MzOiA2LjUg
TUVESVVNKTogcWVtdTpxZW11LW5hdGl2ZTpxZW11LXN5c3RlbS1uYXRpdmUgaHR0cHM6Ly93ZWIu
bnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIzLTY2ODMgKg0KDQpQ
YXRjaGVzIHVwc3RyZWFtLCBidXQgbm90IHlldCBtZXJnZWQuDQoNCj4gQ1ZFLTIwMjMtNjgxNiAo
Q1ZTUzM6IDkuOCBDUklUSUNBTCk6IHh3YXlsYW5kIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92
aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy02ODE2ICoNCg0KVXBncmFkZSB0byAyMy4y
LjQgYWxyZWFkeSBvbiB0aGUgbGlzdCBmcm9tIEtoZW0uDQoNCj4gQ1ZFLTIwMjQtMDU1MyAoQ1ZT
UzM6IDcuNSBISUdIKTogZ251dGxzOmdudXRscy1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3Qu
Z292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI0LTA1NTMgKg0KPiBDVkUtMjAyNC0w
NTY3IChDVlNTMzogNy41IEhJR0gpOiBnbnV0bHM6Z251dGxzLW5hdGl2ZSBodHRwczovL3dlYi5u
dmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjQtMDU2NyAqDQoNCkZp
eGVkIGluIDMuOC4zLCBwYXRjaCBvbiB0aGUgbGlzdCBmcm9tIFNpbW9uZS4NCg0KSeKAmXZlIHF1
ZXVlZCB0aGVzZSBmaXhlcyBpbiBwb2t5LWNvbnRyaWI6cm9zcy9jdmUgZm9yIGFueW9uZSBwbGF5
aW5nIGFsb25nIGF0IGhvbWUuDQoNClJvc3M=

