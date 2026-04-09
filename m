Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95755E98FDD
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:22:58 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.136757.1775751772590230569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 09:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YIHtTtfW;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YIHtTtfW;
 spf=pass (domain: arm.com, ip: 52.101.83.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q7lpyhe8lrNCQI6JCsgfSJYb86y6zjR0lJuZXh9HgQ196hwFtxjbOUsby5mZ2UrcnATI/JC5zYw2mKHemdDF3GxJTf5LG3vhcyhXbYX58+hNR0MoEEnGP9IVa/9fj/jI5E3/iUqbFA1nPgUZoU3wd/KSGCsVN6ycHSCmFVitHiJokVKpOwHs9wjirt/rQT7sHWS8HmwWcPAli0BEP5AxVKXX1hA1iGjHBAxNLn76AUGwKxpy9r+ArKG22QGQW9hocv20kHHeXEe13+/NbuLit4tQSWmazDXxsACXeWcioO3T4jiICqE0gLbGWGYGTXYbVNeVYuiJH6d3D2sqJE3xFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oinY4Y1ojGb+sbKjt/j3veND4DxCIFW3sTQECvMxiGY=;
 b=Le5DHM5wzDGJ/5WNA4HF6OTME4oDOlttbhQWTAFGCzXniLf0n4Xr1FFX/0sZiKMmq/nwHO+qqQAPPO0c3fcYDiyf1ujojAdGDtiBQGQFwJC0iMIDe7KW4Ffr1TwPDxckb1Std5boWmwtuci9NB41rxS6O9ihPcYU70vgo22am4OmikTOgY+ZMB5Z+L1HOEgQlukJaZHjkoapKtjpVGwvi77XcCHsxaXAT3Ll9EASxv3YhEbybXsbhuHIv2AOxKCKAAbbLittL5L15GieCcqeXBENdjP4QrxQwQrEAo518cTtIo+f5/poRNnHigvkHThXgvXhsyuWDziRbg4PG5LyCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oinY4Y1ojGb+sbKjt/j3veND4DxCIFW3sTQECvMxiGY=;
 b=YIHtTtfWSl/Tzm6LCcXVL/hsbkvlo89kuPgo+WZJnYkfnZIemPZA5xEhuaoeQ+RPytRWJ74dse2f7ENuAOBFqH+bwGmse9jndMHsvEkR6g7GdFBLgy/HOvb7aYl4w3pwydWHIMmtIXz3mxoz1IVQJ4CXbQ/NhbrY9KkpYm3tRVA=
Received: from DUZPR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::16) by DB9PR08MB6586.eurprd08.prod.outlook.com
 (2603:10a6:10:23f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Thu, 9 Apr
 2026 16:22:45 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::e6) by DUZPR01CA0131.outlook.office365.com
 (2603:10a6:10:4bc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 16:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 16:22:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDOanWBN9DlIlA7VLnf34uUM3DpJ0frMLXBEgfqUT61OsyBktyvjkUXvR/5oCnPJWXkhWA077iZXB/WtxR1iBYiNg88fYkdqEKl+pL3Qz53ygP2le1WwK6XnNmYrk0uHbQXSoTfM/LJ4gKY00+Ujx0kPMeXghIj8aKjdlquztgv1elsKvONVTcc2Wo9I9ITVWs2l7k/0SSGXgGj++N0/kYenUemfwaG9azyjBh0C7WC3evikqghjsqg3Q7/eum7rb9icOU+ZlBqHEHjtaTIfHDHJJC16RZH5MVNVmoUjf+LOqddG7RN1F5Q5OLBknXDM7u3zOePmeKCVP1P9QiGPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oinY4Y1ojGb+sbKjt/j3veND4DxCIFW3sTQECvMxiGY=;
 b=LsPs/LhwdTlj67ZHTmQohTLDiIf8m+DY55TW6iuNJeKJPAfyJKWv3yBSbisIQjTreBmmJ1M5V5UnIJxJ8DW6vtRGqxm2N9Ir3Oie6WH5YU92HtA1KXVF8snCfUyZ9kJyn3hvy5jxo7C3n3gf6j2OCJY1ImaS0qFlmkvOWu8f6aw8g548b13SBHxMbF/4O57eGY1EEYbcpfkiVpJqfKv/GJxJ7ROBd0ttIuQow0mXVWuWJy71H8PRJeKicN8ppmEMOfElMgxGy9Wj+bOeCtXBBm/+ijbvqwos3RfUfDTHQNesztiNLHYhYWGhwECjkpHZcJS9cmDtyVkfZEfaoPwtMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oinY4Y1ojGb+sbKjt/j3veND4DxCIFW3sTQECvMxiGY=;
 b=YIHtTtfWSl/Tzm6LCcXVL/hsbkvlo89kuPgo+WZJnYkfnZIemPZA5xEhuaoeQ+RPytRWJ74dse2f7ENuAOBFqH+bwGmse9jndMHsvEkR6g7GdFBLgy/HOvb7aYl4w3pwydWHIMmtIXz3mxoz1IVQJ4CXbQ/NhbrY9KkpYm3tRVA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6616.eurprd08.prod.outlook.com (2603:10a6:20b:319::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 16:21:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 16:21:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "xiao.zhang@windriver.com" <xiao.zhang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH v2] iptables: Use update alternatives for
 "ebtables"
Thread-Topic: [oe-core][PATCH v2] iptables: Use update alternatives for
 "ebtables"
Thread-Index: AQHcwzIdrgqG1FYOKUuneTlN+qXEw7XW83EA
Date: Thu, 9 Apr 2026 16:21:39 +0000
Message-ID: <342A9B49-0D94-4DE3-9397-FD257475967B@arm.com>
References: <20260403062107.2913612-1-xiao.zhang@windriver.com>
In-Reply-To: <20260403062107.2913612-1-xiao.zhang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6616:EE_|DB1PEPF000509FF:EE_|DB9PR08MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 2998a014-e684-43a8-2b80-08de96543ada
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 NQGeV2QEEWVubnrHoHzRKO/D7Cpsq88feyQTl9hxK5zI1+U2VTzEf0e9LotgtiLveMkti4NuuNq2tCoqrLjM3lSLQYMl3CIdJcI30pt2dRCCA0l/dcTnPXbHrzPBGwI+P0gTOb8L9NNrpufbNIiRNSnveEsURlLcUExFRy8PFJyZcBPAHpx/39akhP5ss5LSfclH9SPULv64tU6ZECVB0e/G32ZwCPRmpQvyiqMTwBMkXgxF0RYTkW8wgODJSxGpR71dpj3FmRlkPbajwslrshxZ0UrDbcnFwx+g1ITRwgjur73T7k7XvSSDEkrxtuJ0uimWJexUtrYEq2WAcXmhRZDsdda+L4odw/azJAzjBauS0UHrTC6RPVqf7UpMB7UpNDJ8ashiNcgP3gnGULksr9kXnkFQOz+Ae+Azy04+EQ0t5c8Cf7NcMw5A2IRLoBVAV6AVs02HjJoDWERKlg2B8t1J/6X6zmnv0V2f6dCg2q0B+3n0z9OIofHTWI1wqeZlAMPotvcQ8cZlr7bLaJH2fkRhxj3HVkyCbYheox87QSQtvowDjxih1oBJICALH1tzpB1T8qvpzyIZJVqpjAHSrg4IUk/i8phzdBWD9DDfr94a1pHCrTbvsI1GxWaqzuxGatrijfywYodHUf6ZSdeFkHs8XcWJDnUpD87gR7gsgXZGypc5kdimqwc2INCSuQdMsEGcmy8+g05BDDhzOrOg5hxo+7RILilfJn3eY+Jnw2I7+BLzXl33UB7eyEalzMTBTCNTopcd4Mlv1qA4S5j/z5j0egjFcZTkx0aEh2v7+fE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5270ECF312D904EBB7A56FEB3618951@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 o+Bd8RNG3hrzL3T87NihoYAWUjatG1n6iOcYMpH78J2dEyCTz+BqzHv1VTNOHP3VmfQxJ7KGSiNF3FUaLlxDtUq6V+P4XhG+H0wmPEYuv0Z/Fhlq4IKnPW3CXIS7j69wn0vzNfHXIo6fM7yBaTRDOnNdnIXPVke1jLFzq17ithBtTEbZ0ZJfuWEN/hbqcNmABqiHCwqN2C44HouuvK2XwWd8jRuhmcFkyCdhEF6mdFDDFnPexExgVd28B/caXslTAN+uG35dfnp1XfxJKbTtz1E3VIWofnvm6tyOnezRfIKzomRoDdY1MOOqmse1Z7gvbxn3RyvVVlf8usaZOZVIpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6616
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9be5f64c-14ab-4802-2eb7-08de9654140e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FKefsfthZc27QuKJY5oCJEAubYGvdBr3vBoy47BnHyVGVOF13rksQzVKrw4QbxRdMP16/OZ2VPuelSLtCB4N0TF/ST5EGfcQnqQjtJgkNANI2GmQXwkk/27WY+crVbXVglWfYPzVih3PuzLQ6UOsEjY4MFsIr27fpRCAbYtOMY0R3p0bOCOhY02N97owxE5+035KEHtyiWz+DWIkEYeclydv/0ep3dogZ2IDrOYtJzkYEIE21MQzzZ7EyeKqYVC6TTxaRqCto+KG5ZAj6ZMPyK/uIns4Mb88eS36bHcgYqXljtLoY7MPo11i6cqGbqoIuibqwXuaOFXW0v+YTZNuyRuSxSQaAgkELgVvVawx4BoqSOT8ovIW7zPUOR3v/CN5p66prfau1sTCG6vzlYv5wkm1HqKNiqWXcjT1xU6JzbMcZq40Mj04lhbYdwxppmplAdunr312UefTJuM824tmmf375hCoR4OPsKYrcr6CtWE9zjw3NKkI2tA+8qXdwebZVbyQ7BDcuNDxLtk4ElEcdavvZtHrUvDi/I0/Y76VbmeSbtoKvyRIMxynucun3Gr3meTshnPw4PZseM6S4vXnF+h/oRwRM/DvGF/l3w0yM2G5mDzzxOPg0axygOvnb/LC01Ecfrfx+ECUNtqeR25DBIacCmIDvRVgdjswebb0A9OX/q63en180umRcFe/VTUiq6p/R0CY9QkcLwQpyTIMCHaDan88w3srahAkQPEPNa9ieaFhJ7Z+2zza7qZIKLq2V4H1mHwNkIDDXvc8SbxjDg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pAz9ZVLEV8vCHjxtGM9kUA6cxT/Q3iCQJ5C2IhyxFwL4boi4645WLFdLGqfiFz7PxfW3Iqt58nJqbFslWxO4u8IxdHiDECoPvz37QR0XRsh0lk2eVeJhIiNRc43hnjXBwjvRVZDleljhbtjIRidBtTxcVmrfIL9pjPdXzZ+Ze9WfaUICJx/GKfD9PmW/a2WE/GSibnzhrlOHpGLg8hN7rCsK1VffOTWiXIUUuHzDGE+Pnb327f6V8hhtZSQToi1Q1tKG95qvQHPHc8LhE8+yEwTLt2kMutEdkgoLBNcREDWSDzmsFt8nSjuGUCfevhHUN4NzzI64eiuIgJxZd2oFcURmgB0NFzOk7Rl0CIKBcVet0FRWTo0kIFxU9p8lsoDsBdXDMaK17kKRuo6p/993bFzT8YrD4RtjRy+c7gb28pEmchMsHr4Y20TXk4D8KIV3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:22:44.1471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2998a014-e684-43a8-2b80-08de96543ada
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234933

T24gMyBBcHIgMjAyNiwgYXQgMDc6MjEsIFpoYW5nWGlhbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8eGlhby56aGFuZz13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiArQUxURVJOQVRJVkU6JHtQTn0gPSAiIg0KPiArQUxURVJOQVRJVkU6JHtQTn06YXBw
ZW5kID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ2xpYm5mdG5sJywg
JyBlYnRhYmxlcycsICcnLCBkKX3igJ0NCg0KQXNzaWduaW5nIHRoZSBlbXB0eSBzdHJpbmcgYW5k
IHRoZW4gcnVuLXRpbWUgYXBwZW5kaW5nIGlzIHdhc3RlZnVsLCBqdXN0IGRvIHRoaXMgaW4gb25l
IGxpbmU6DQoNCkFMVEVSTkFUSVZFOiR7UE59ID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNL
QUdFQ09ORklHJywgJ2xpYm5mdG5sJywgJyBlYnRhYmxlcycsICcnLCBkKX3igJ0NCg0KUm9zcw==

