Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530F9C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 17:15:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1064.1783962928302944973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 10:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RP9eDDdu;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RP9eDDdu;
 spf=pass (domain: arm.com, ip: 52.101.83.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D9WxCVlhrjcDYMTFJ7YwzhIK+8I+tPDtr5gjNaVRN/uklAIt908CjS6vfMmH4oJAC6/HvlcTcMZX9dxwrovD7/H7ow2z8Kzr8/87tszppSyIM9c6r60M3NXysfw2uKyX8Sl/BB7/coSe7dJIc3iIXWWffUOXy5pwKsTtQOv5cGjrCNaIfbA+iNygEuYctOUt8CvDI/bzxgJ5+yu/NJzRSDqU8FxHVTe4EPL55Z4wLTWEORIUadDZrwZltetJk3ub3TeGpp1AbFRJNPDHjM4h0T6cNeXkR25Qfw//7y+4xMd6JWmY8i0SOfkvcOFcg+6QmroN+wKMiJAg3P0KUjmJ4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFf557LvUzRJwuqWPKS3ciM+7kPcq+/6/96gpkoKAcU=;
 b=Tt6soc8v82QYGzkl7YAyNIe47B/zW7aOBYO6cdxSDAhhmZZamoXzqG1nhQviivFCMypn75sjW8GogZlayPiHFOZU0cjQqmdtfiFMQMXh/6poHLunJTDuXgbNfQsiWnpQEShjGJ5ZeSFembERAl7E8XZ9Z3l5YZ44mIMBJhucIsCVX/O7vYEaCaPTyk+7OazhD1GNCMMQHaQeqd6MGAP38ktnKzeR0K5OQrpON3ZtstGVU9k03x7ATr+j15WsLtbA8DLfFykOjJu1R1TySVVRLBzx+1M7/ZdyTEzZoiVMS6lKoIWDun9289gmcPEotlKkIC1uBw1i/C8SmD3RgS3Iiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lge.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFf557LvUzRJwuqWPKS3ciM+7kPcq+/6/96gpkoKAcU=;
 b=RP9eDDdu+isC4P/pcn/uBZyEmPHO7LkOE+KqqtpG0DDW1UGtrzztpaVr/mJoklGkdrkwtsZFLOGQq5kPvNquJKUqsut9YBZ7Q00wjgZWHEqVitmjeaQjXZdWDHo1NXThyEgA94lkQ4ttNYWD/Q6TYSlTVwPtSJJFvjP4uXKXqRs=
Received: from AS4PR09CA0021.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::19)
 by GV2PR08MB11465.eurprd08.prod.outlook.com (2603:10a6:150:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:15:20 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::77) by AS4PR09CA0021.outlook.office365.com
 (2603:10a6:20b:5d4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 17:15:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 17:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxxbEEuRiL+zQzNDNV3r3ViBEy6i+ndShMBv02RKy3QTyGruOXoEGODWtoLcgTgbt6wBRHZY7AI5P1nAzyn6hvyzFBwhncwtkWGAQwoHfqp99GjtGkocEYZEXnDTnCHLOEd9j8DMkXxwtm3i31bqL8QhsCpbRukebM1ldomk9kqiq4swv9ppyI2XHNngdA3ambYzrq+XfA5YT2axgtEAeJQaGc58BbBCAJsVmvsywlCi7sdcYJvOsAO1c5A3Cptw1VK4QT0rOXEvNu4mEx1AlbvALraYgi17QP0SOx5A2i9tkmXiSZc1omS0AiCOKQ+omJCpiin5xO9zGVC94NLpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFf557LvUzRJwuqWPKS3ciM+7kPcq+/6/96gpkoKAcU=;
 b=y2DLZlBMuv1Zls1ZbwSdXdQX1doJI7eGdYb1BqimP7woKZHJzsm4Wh8NfmE82IoFSS4F4oWKsG4HL6rPHzRpRWEgvQv3CGQdFLwsaW1HcnJTV54haaSE0s5AnK+iE6VQkQLQKufegoq1TICselw05kShQetNpacnTTDRPtKeqYTofMvUfJoyYdskSdRZbFPuV0QOgIKyFreQJkaWilTZoDVzqY0QGx2gUmjR7vncYdrR36cDsov3jhCORM0pSTaroXbScZ2rC2sVgcN0y47Jys8CAHWAPJPJmvRQPps+E0zZHZlABctC3O94DDpKIt/DZObjyLb7uYgRtwXp2D2ajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFf557LvUzRJwuqWPKS3ciM+7kPcq+/6/96gpkoKAcU=;
 b=RP9eDDdu+isC4P/pcn/uBZyEmPHO7LkOE+KqqtpG0DDW1UGtrzztpaVr/mJoklGkdrkwtsZFLOGQq5kPvNquJKUqsut9YBZ7Q00wjgZWHEqVitmjeaQjXZdWDHo1NXThyEgA94lkQ4ttNYWD/Q6TYSlTVwPtSJJFvjP4uXKXqRs=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AMDPR08MB11368.eurprd08.prod.outlook.com (2603:10a6:20b:71c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:14:17 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 17:14:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mark.yang@lge.com" <mark.yang@lge.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/4] python3-pyasn1: set CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 3/4] python3-pyasn1: set CVE_PRODUCT
Thread-Index: AQHdEEAQBmdFo8+fxU6gJihAv2QIebZrtYQA
Date: Mon, 13 Jul 2026 17:14:17 +0000
Message-ID: <0A31F9E4-47BD-4651-893F-D2AE04DC5F3D@arm.com>
References: <20260710074415.3341616-1-mark.yang@lge.com>
 <20260710074415.3341616-3-mark.yang@lge.com>
In-Reply-To: <20260710074415.3341616-3-mark.yang@lge.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AMDPR08MB11368:EE_|AM3PEPF0000A799:EE_|GV2PR08MB11465:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fa0c3d-e2cd-49e6-3d27-08dee10250fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|4143699003|38070700021|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 UjZuqR/VSaMrO5s7JVzCdEettq8z2D1n7R5WSpVzMAp1bay0AqDaYVOOUvwyhtiF0lzNjRnDbgvZsUzWs2Q0UBbiXOFt0yMqMMfBPTDaXWlS5tHI07h7oDXATwMeTy7ikWufi8w6TfxvjkYgmTlPXZmXN5LNJ8VKxyjHBZGIpD+omF+tX3sumfjL6hL8ry8OplunduPrfAsaKo8hToWY0k8+lUmSEFpyMyS9hUBxI7KW5yID0QQgBt4PPDnOiILWoneTB7GATvfmG4gomHnQzmecrxDI4CqrmbVelKWXQtzt+JCYmXsUGZjQFXoMD9HBaAGER5xMJJqH72kZdZsWTDxU9+ql53sPGph0eryNfIbpd7VEbw3Jgzu3A6apR6EfJEJLFjCsXT5LHlvp1AmjFEmezX2aQ6Zpa+NgVY0jRVoEDlswapx8rIBZQjLwkfr2rUbP1xKmeU1EUPB5TG7iKaXn2AshjQbSaGJGSRkJ9lBS2xLy0kxsIRLUvnCdWvakyoFuiOQjrF8Pd1bJMIgy/X1loclDnTzLR9r+t+mig8YnXC5Chh6kO1MkcbZ++1cxxKv9xvliYNCL8vJecaU58JVAoe4+euV1fy2w5FtErKQqeCq3TRAKhZWQ4U4rc68PcLX4ljpmziEmhcIj4OAjrtsXDauDTREs18WLcpQZeiYcBEi07moSeDi5I4/OGEO88SlEpLRgbC3RSNMZAf2YBdy0k455A7TsE3VPr9rRHPE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7E5DAC766FA3234FAB748C02CBC272A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 WJPVAATBch7WWZFjzNQlaI20mUGomYQyQnNw3drjrdlag9Zdxp1rD3jKAp0E8Yjy3E5U8wnY5+R5hVeCYjg9IdBbxxaMeCnOmWp5IGq5a/VOzgkhzp4d/S5Ajsbs5w0u29QlCrggrW02NneP1Ap6lk6815dmKcILKCQa4lE/r+xpIebJ+DQAaCWItMdCzE5VA4tyVVsCa7OMmdP71bb9Uv7u499bRg6gtlTIYTBz+8/Av/i68leQSmPUrnqT4G9hVUYJpsBrAZyYD8c3ErrdNjaa0YSyRW2hWEbEUQ8fxnP5xURQd41btS5uWQbH2QCGts3wQbnNcaand5XqkHGTdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11368
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	50c43247-5835-479a-32fc-08dee1022ba6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|35042699022|14060799003|376014|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	EMznW02blRyERNe0KmMEyIVbFpaJnZYrnlUkP7VuQHpJ02DM3ON8LSzfhvjYmCBtnwjGzs4DTV6jZz9S2bRgo8gvHBeMsPUjTH6mUEEi2dP9sX0GZxoxj4ahHjF8AYyTKz9/GoncIAc80h0YsxDQo03aiYoa9CJ1xGfqB5LhYhnTAR/IOwIsXbhw2aluflZp6FF+R7BeGj/6ZOV/qJL6J7UlHlCo6slqU07CfC7v/gAeLJQ70y1YYVJZfsiu5WHZf9B6xzh3NKG0Ov4ohJvf8QHXhsg3WWii3QgJfjwuQjoOfn30sLH+cssJqhPmzdhLwimNRcndNBMjVpO5xPP+jzH2pMrSugi9bRz2GAgUDEtTJyY/xM7LVvcbcNQbujv/G1F7fYMHjFWIog9P3F8RLBSAy3kWD56CXb9At9CWgckUjx20UUYqk8NAyyvnwbYAsUoXxHdJwsgEXToSJLl5gG/B2QywxhORMxDrN92PXC5aDzwc5JGUypZMBcrFC0fR7NPl0vepMPDAOQ0f16jEFCw+Senw607yR9FIuE9UJLVWrENTqUIHdhSWq5h25oOt8F6MDoik9eFTwtbuxufcZSObF3ZQgGj5P1+NIUP8xHl2tgJWVj+uhoQ6o2Ge8twlrWOKWYm7wx7DQSbCsCsg8xo8enRlvNYI5BFig9vLBS5rYuLivmLUywwFH4mfTZDusyjr/vl456TuYYyIhTw0AA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(35042699022)(14060799003)(376014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T6TTSiJe+pLjYhm5i7Y97naUfHMsV3MuX+BdvtWjhxLjisDw9Hly6azn7tMlIAWhozGD6J57Mkyml0RMfQZPCsw/qPHMrPmPEWvNnolfWnzN9rxHM7dkl8fs3jQwW+bSmw3mU1oyJ7eewz+n0bHMNQsY3PhZ11pCefispfleEDmA3W2o9dW363Qs5v3HKkAA/lRpRnM7g/gxHES9Sa5PLPKivAB3T5874Nv9cXIdzLNtuBWYVUqd0k7TwX+hcQpnbhLyBY7FuvldCwDntDk9hKdLqONe89O+YbCvrYSkeOA4TwJUO6wBfsoSS6UYFgxtg2jVz9LukzUimzkn8EFb3zPAQISZS/9Z29y7zzx5CsqqZiy9wK02wsq1uWM7yIzjIHFXyrTSNFAQYFqYYOXLpLUa6BHi0PEP/lAh0VyTfW3n4vArNEMTTIPKvFYExhEY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:15:19.7665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fa0c3d-e2cd-49e6-3d27-08dee10250fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11465
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 17:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240849

On 10 Jul 2026, at 08:43, mark.yang via lists.openembedded.org <mark.yang=
=3Dlge.com@lists.openembedded.org> wrote:
> The default python:pyasn1 does not match the NVD/CNA entries which use py=
asn1 as vendor, so CVEs like CVE-2026-30922
> are never reported.

Where we know the exact CPE that is used, we should use it.  Can you set CV=
E_PRODUCT to pyasn1:pyasn1 instead.

Ross=

