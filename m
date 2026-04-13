Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455B1F34C67
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 17:01:43 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.277876.1776099702243111878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 10:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ioDrLLpq;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ioDrLLpq;
 spf=pass (domain: arm.com, ip: 52.101.66.1, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TuBzJ5pHMHg6N8LJMCMx8vrQzuAJdMBIfAi0V9j5TVsJ6csm440qpr0VvWGi4xZSvinTr3QezNdfe/O56o9TwIAnR4TMJ0glz3H5tLr+AxJNpadFhkrPo/0NCQ8CJvjTZAbGj+ukoBfWzVqBdiC/AvNGB2nxH0l0KUDDaDf1DeWqyaKd6/yJJcbzqZzcZ3vOR1D7+NTdIeRWLlP4jogTkfOUgfHAKM8MdxfbzY78Wt/QZ0TDMgJZGYHkBNhXKCnqj7hTdgiarmvJLBY6vYYV/GXVsOHVHGr9d6DsGyRjMQxLjQWO0ngKWIjAftmd7LMAOk8FsQTEUh4xE3RIRuLbVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiwlwztS28Q+lV5lKG2QJmp0vpF2WAEVLIxE5H+kAxU=;
 b=jXvrrIHkGQx0+fzFi72LZQrGromej5GXYKa5gRZMIm4x7rpMMO6w3tNklEtLEK67hYy8Dq9OhxjaW7hq7M+SnBfqQ3nfvNzHQbImULVlho9AZLcNhMpZCMzc6e91v/cfr62/ItCj8yOXIW5Lw99gaDDAMmctthzR7KZ4IBKo2nm6ckYrAWTkpNAPz9ISf6/QWp5qbqorYZVSRL59Q9+tmKINuUDstBinvVL+jZUT8Egm6F82G/JwdXYBMI/ADI1iI2e0k4ibmgUvxgWBbLqZKOzEU6wyKllGfhuWOqBNNmg3X5SPjCFPy6dVED17C0JOvL/NSnHeQUGqkcIprySiEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiwlwztS28Q+lV5lKG2QJmp0vpF2WAEVLIxE5H+kAxU=;
 b=ioDrLLpqFi1yqgY/It7RBDfiD08G/LDTiLyB0M4XHnkgc7+Uj1BoYul8EHsmT3/0NVmj/fBR7Z4JfBIKH2FjAQmpbbb7UTgejmkb9xpWsgIn2pUe/CCjZbAP8RCPpSJAqX5gWc9FdnonnV7kCTrSjMpZ6dxRPv0d7lijK28JAN4=
Received: from DU2PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:10:3b::32)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 17:01:36 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::b3) by DU2PR04CA0027.outlook.office365.com
 (2603:10a6:10:3b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 17:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 13 Apr 2026 17:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU46DE07eiaArPViHAcD9qr8YU6lRjUNzU/TXvf/uw91uIuPXFLUa6eopJZv5SJfjtVkGZb2XGzjL76E1piLAqDC6jwk+HFyClGoEWukbhMaUGsclPQ5SmwiOB4vLM57P2SXhV/tJ/9YIFrMxoVpOsq9lap9KiZKVYHcGMY22fro+n4P+P48Gdsy8OcTOoecYjwLn5EiQuOgUKmKW+6Lvl+38mKelzIhglsiC1+Y6l/VPPKUxApAia8d9LTQnk8IsmIJdI0x07BNoZ44ojNUvfW5e3HNmig1vpMQlALNQLuqqOYvmWCb9+Q8HBqAPbsAckar+ZqccbLhnsUavx/FJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiwlwztS28Q+lV5lKG2QJmp0vpF2WAEVLIxE5H+kAxU=;
 b=wIeUwCgWGJy+usMI6BgyLbjyVZM6zDLdZFLKK5R8WeZ+Q141JftbKuz2WqeUzGdre8NHydE2HZT+yNV0rteq2IPU1vGN1El6xnHimexCNgQzs4O4+LUlzJE0vFO+H+BRNQEI6XQ4LDHzHif7fI849Uhb8QIP/EZ79OAchjfSTzmD3to2wSPzWG0O9raSyHO/T5301+rkUbcOGHtuBsq1UflSyHaXIepf2r7wyFS6aLnCD6aJT18y73qhWY99v6Kpo47cu+/7KzYhNHsOGCd6UFQRuwWJ+gq5DuM2JnWhcyCOHkSkVHozfAG6wtdHdPnr5jZDo60NmcRpUmsfl1ymLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiwlwztS28Q+lV5lKG2QJmp0vpF2WAEVLIxE5H+kAxU=;
 b=ioDrLLpqFi1yqgY/It7RBDfiD08G/LDTiLyB0M4XHnkgc7+Uj1BoYul8EHsmT3/0NVmj/fBR7Z4JfBIKH2FjAQmpbbb7UTgejmkb9xpWsgIn2pUe/CCjZbAP8RCPpSJAqX5gWc9FdnonnV7kCTrSjMpZ6dxRPv0d7lijK28JAN4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7437.eurprd08.prod.outlook.com (2603:10a6:10:354::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 17:00:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 17:00:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "thomas.perrot@bootlin.com" <thomas.perrot@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core][PATCH] lto: disable LTO for e2fsprogs
Thread-Topic: [OE-core][PATCH] lto: disable LTO for e2fsprogs
Thread-Index: AQHcwJp/pcXptxbCakaO0aQXT4PgALXdTNGA
Date: Mon, 13 Apr 2026 17:00:31 +0000
Message-ID: <EA8519B2-D26B-471E-B9B0-840C8B559622@arm.com>
References: <20260330230727.1380122-1-thomas.perrot@bootlin.com>
In-Reply-To: <20260330230727.1380122-1-thomas.perrot@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7437:EE_|DU2PEPF00028D0C:EE_|DU4PR08MB11174:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba92c65-65ed-4558-e579-08de997e5230
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 5mUWfBDK9mPCmWGQliLJu2fFQILrMQ1RuL/EaTcC85Wcc10lfH+VmK2lEZne5lRMR7xim57H9QVMECJVw0ZRLDd/H7e4mwXrSltebJRqHQcD+cEgsJrHTvyNdxr8mdMx5au5/owwHPSelQp4pSt3sxchc7bQU3F92letXqzSqjCjDUQBRIQW8Fq9NOyiOcQ9RJqA7GiZtxhBcaZ1fWXEZmlHOEFg13wpzb3p0a987GSVgsphGbRGf43gQ913yyuYMAjr19CpaKytTlI0w/rEMIt3/QeJHRQ8UvgXjD4JMPxhcgxdhqL/ZQAxj001qFtrV8nCS833ApChINXsyZFwV5gZl7EIT0Labo7AQN9MAT+AO7Czr5zWkT/qPnwHs1W9Y5MMbc34mAY89FFznGTsbPWlh2oXlPY6v9Rf9DYDbR6MgWcbytDhYdHyMV9Z9UgQkUW+mDv85/7BFICIUsddeaKKpuV6aDNk5tlcyFvTDbyCEOIfHegwynRn1zcP+pUpt95gBLLU4Xj7I2Y47Aq0W4EskyfpDpo8JS/yNfg1+kSA4Bw0V8ruoSU3A5j7eg9h8nEORO7bKo/x1eK8gtQA82kmQi/9Lr3wCY1py7i8TiM6ov41hlEYGiQkjZdRmjAOtSF+XAsTNxsdQLNpk6BZvr/2BLbTy1tDuCj2Mxw0/GyBbQ8ZgbAdmGsA4/nkiMHS+3NIJLVJLGy/dlrX6lYLL+vuo1hI8q0RZEkl7Ee6rpMQ26QalS8bwJSx2TYLtDP5oBDLvPvl909fRql3icqL+T4iR7YU1VQlkIpU6na52h0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C6AD047B5DF61045AED879E662483223@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 OVt5GHjZS32gtYG1j1b9Btl02/Zq4hw3/SNMRvcHrRnkqhxx/M49htXND9oRR+4Pyu7n94kZEBKDdjnTBwhgBMIlhjZdb055xKHKGSiFQSszDEZXREfAdQP7DctgmaMxZ1G3jGQlAqfz8gz8A8nvoaGKQWi8Qi4YDMaNJ908yNL6aNFVMtl6tLNjz/L1HPLtNqiCH9sC9FU23KvnFVVMVyWa+ZMBXqdmZWdZz8s+a1FqQxBPMLMR1Yfk3RYUgRy7RbXBCk+4omUq9dyKKCcTf3koglo/YiRButsmDr2izhJkyITFeAI3as2XhdnhT14FU7oeQ8LKjqt+ZNyeQ1Nqaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7437
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6fa94f89-4095-4966-9a4f-08de997e2bde
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700016|376014|1800799024|82310400026|35042699022|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Lckhfq299TdRmNB8GkrJpQ+08G/Ml7l2v0k0yaKgdryVqvwuaNBl+GkFl/zOjdWwGpdTyH2j7FwE6luRMBPXSt19uDRyQcuB/qb3XTJfWG8DiYpehN4AjGhioyWgLU2cIEymh2f31JaIUZrdq3ZeFIy/vQ8xpQuMW3F3HFkrvhdWUecpVZ2uljThOcNCdivs2B/yGOIWiAd91RUGTmxVWn7ChO3LfvDc6NUcg8W/sToVFsF22DPlyZbmQ5dm8YxvFO7VWcIAqA2U2KbS/+K9B6ih1Q25klk9jzroDKM0kd7i4MhFB1yG/bauESryyaI99III+JUZTLZoy3l+S0Wq38ePTJm3rYYeu8+Q2Nxl5RrWSkt9P+E3ZEiQehM8Mm24OoksUozLTtCM98jsnm5ijGTmOKWi+beqVUQrJiDBtTGMlXczmXDV6r0/1IZMvCIl7kxwXU3+xWtFDg00pG80h0ywonvPcxNo/mOpfszOcKQHFqn/w5tleg7tsOgIXQFy2HrmC8dhbFP6dhgBLY2BJvRAYzrk6PofpFl64SJ9gP6KL4C1MKAVp/8Tvzpjs2o1Prwz4JEmx93OeREyQTRzYHU4h3gpkfzdZD1gF/W1t5FWTi/WHn6cTF1u/gUN+JCKwhfJQ0TXFH63XY7OdEdgsSgRzAyAnGidiL82ODZrjscF0uDiI3vOryjbvqVR9pLoQfFqRCBcdwD6WxxIvbZYU3QlYMDms3pFMt81k7zi2xf7eqWjOY/5Yfo4qjRDJRfZLa9MyBdlnEnS5z6NciHjhA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(376014)(1800799024)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pRkh9SI+1hAUTewlGnUzHKG3NSw4qM/t7Ur6b4zBC8hcA6aKTuLa9nQQms+tSkc7942Plupneb7Mmh6D8koRE0WwOgXe9ZN0BEid2qI2u4iPQ4B56JjpBtL8gcFDXgVT4RN+DPsELXFi2rdy+YAiYbtmUsKGaEHn85i8/kpBV+n5Va9RUMJvmiKqcxllWdp1aLZ0txpIlBcx3vL+toPehbp19nb7mf4KQzTCRyFMgkMIjAVG5/PBNRBX8KOaiws085X5y82exAN2icJpgQIOx2fFeiWEE6X4fBom6UUU530cfzNxtPZqdnsamt1VusYmIhH5oG9jjFKs9XvvcPpNx1QXw9vJIuvTMl9ce6lY65gDo+4cACIBYZDP25TQ2csOxMeZLLVKZ7upVyhS2e44YBDa4MYtwcWhcyk2BxacCuYTBJUR4vKlNxMe/XMBRIE1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 17:01:35.6043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba92c65-65ed-4558-e579-08de997e5230
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 17:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235118

On 31 Mar 2026, at 00:07, Thomas Perrot via lists.openembedded.org <thomas.=
perrot=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> Fat LTO objects embed original source paths in .gnu.lto_* IR sections
> which are not remapped by -ffile-prefix-map. This causes buildpaths QA
> failures for libss.a and libext2fs.a in the e2fsprogs-staticdev package.

As this is a GCC-specific issue, can you add a toolchain-gcc override to th=
is too?

Thanks,
Ross=

