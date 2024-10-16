Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3BFD1AD40
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 10:15:26 +0000 (UTC)
Received: from mx-relay76-hz1.antispameurope.com (mx-relay76-hz1.antispameurope.com [94.100.133.238])
 by mx.groups.io with SMTP id smtpd.web11.19844.1729073716608667971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 03:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=DsHaCkHN;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=BOLt+Jfr;
 dkim=pass header.i=@aerq.com header.s=hse1 header.b=qtrbG/2Q;
 spf=pass (domain: aerq.com, ip: 94.100.133.238, mailfrom: alban.bedel@aerq.com)
Received: from mail-dbaeur03lp2172.outbound.protection.outlook.com ([104.47.51.172]) by mx-relay76-hz1.antispameurope.com;
 Wed, 16 Oct 2024 12:15:13 +0200
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=SjKmqHa1AZKBPui9b5FgaoohWtNdoDQpiKxvSZXflDn+f7tCskL7ylF0E2ILrBSFUY4Id3y8GoSh7k/VvWwNzENdGETXinaJmzy4HCKn3BS5GRaJEx8VG5Ibc7DMuX2dhL7QlliBPEn0ge0sdP4GFliRnrkutLpSY5XZxELkNMPfqAsZCt9vKyGz90Wl1ZXwnQM+CeCfFV0rxgnKzveri7acqJi30nAv/+aEfg1YXqKl6iLi65ctt2ukc1KM4FzWv+LPrey8RpuhAFMwGKpAq/u0NtKjzATEQY6WgPKIwY3AjUlnW1+uyRh5hYbs/VuaRT8IHA9hzn/4SAWbylfNxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0BHOO6oypyuppCLorUPqvMciabIO0CCi4ClViVEEAU=;
 b=vKBgXCchNWqvv7MTExgbf1fCS1081IH0ISTff0hcKmhk/up05efzRmVpomhEfmEBbWjNhlGrworw1zcWiRZZM33e2pHmjV30RlOFDCZF703qLrFKmNQw0Zx3+0me2GwpKNu/AOUjkEzi9ikRtieUekkZ2B+JtEozb5hr0eFW4qChfGd3prs5RZiJCCwTDGAzUKk23grPpNiGJoAcKxpGLElUUongeqxLMYKSGq5nBk7y4T0IZaupp3JHwofPV4h0q21PhJ+dmgoMhmF+27O6IDTSCedKfoheVIJXcb3UxJ6Ls/aoA9ho+5ShWRh5a/289SqyuzWF0LFMxnpvqGDtEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=aerq.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0BHOO6oypyuppCLorUPqvMciabIO0CCi4ClViVEEAU=;
 b=DsHaCkHN7roGl3X2TMx+XJbzDMfy8/OJiokndRYMvr2HHjQMsRZ23sguYiyBlpQWNkuDMPAJHUxvtypbAXkIzjQFM0B5TPSlndkYcEO3N13wCYGlew4R7gyIoMP7D3KBZ4YUdUQeLwRPQNSbxOSCPwgKVsonB6eD6ZEfvl+UR/M=
Received: from DB9PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:1d9::14)
 by AS5PR10MB8295.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:655::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 10:14:56 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::d9) by DB9PR02CA0009.outlook.office365.com
 (2603:10a6:10:1d9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17 via Frontend
 Transport; Wed, 16 Oct 2024 10:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 52.169.0.179 as permitted sender)
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Wed, 16 Oct 2024 10:14:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (104.47.11.234)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Wed, 16 Oct 2024 10:14:56
	 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 5895866
X-ExclaimerImprintLatency: 763747
X-ExclaimerImprintAction: 40c9736084b646bfad1eeb32e5fb7f6d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTJD2fit6NY/ryAjkBb0RdLnuA+O3VRUUDzM5pURseSxI7v7jHU9rol/UW4v6LDETId+druYBHk4/MBQTolnv6XJb1LQ92AMM95hlDnFdKem8tHOuqkj8q7XN78VdNovlYwGm/6eo0fejt0JK0VW/XHaQdCUT/aROL0ZRrd1omTjc33ugalBWPE3RUPGzUr5zGgWiVLZuwQmRiBOoiKUfSS9WHTWeemgPTBoTewwRwHdVYOSVQ0ENNOaDIGaV7X6D6E1xexSFESGkVSs2oikE58lOwXSTy82sYHhPwHrAIORZll5L4ZD+tYdG/L5SpQCDuhvrKJahQ1MPPnyKaZxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBV7INMkQd7z6baE3mLnxR/kA82ZK2gDvJsOEMcoud0=;
 b=n1kg7A+OQqUNH1ihuWINsyIfZqaCnOhLOxGGp8yfCD6MFD9Xd7RUa9uEFpO2xLfymb5xojUXqnJeHfNoGF1Y31TRKaP/Y8K4cDoCB5rz1w65mQ9J6+NK6vHmCc0WgOTU27gxAuiG0rzJdxo2mqa9dul0B22kmqYTOMsIhOrpgrcRM8RKYR/VWAOUNY+AWgJ+gUurCyAfQqguw7vfNSu91gs4K1SSxUY9WXOf1LcyAcm5mo0Fp8ifZQuU6W8PJwkukQEOBw/fd12kSovPwywupFO8Cl9rL3t9dlaKLFy1Xs4RqQRmz63onmfhgnHVvMNmOfzDMEm2mRXY6zogxw9orw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBV7INMkQd7z6baE3mLnxR/kA82ZK2gDvJsOEMcoud0=;
 b=BOLt+JfrhTWKmtf7zwX4FlYzobev35DMm1mpvQLl1EMObfv5OU8R3ckK238+1ev5VvOffBOisaP4JSJQ3xLIfXlhyEHAVZN4a1bg88zNxR9MEo907LG9eLtNcxTtmEVgJRd8dThWW9k0daZw2AB5SiceZeVANJl2VuNif/vdZ7g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
Received: from PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:208::13)
 by DU4PR10MB8830.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:567::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 10:14:53 +0000
Received: from PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bf5b:5ee4:7d6f:7e4]) by PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bf5b:5ee4:7d6f:7e4%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 10:14:53 +0000
From: Alban Bedel <alban.bedel@aerq.com>
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] bluez5: Fix the files installed in the obex package
Date: Wed, 16 Oct 2024 12:14:42 +0200
Message-ID: <20241016101442.1566155-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:208::13)
X-MS-TrafficTypeDiagnostic: 
	PAXPR10MB4996:EE_|DU4PR10MB8830:EE_|DB1PEPF0003922E:EE_|AS5PR10MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: a641ad32-3960-4044-9d48-08dcedcb6226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|10070799003|366016|376014|52116014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?yXTDVKQDv3Hd9g0dhur6+N0EsHEYgSv4UUaMNvbywxqlTLGr+GZTgCj+UEoG?=
 =?us-ascii?Q?rQ284xHLL4h+b0ehboZ34cBhJEgNgYReGQyD4AYVdmDKjv7XYgGv2sBrdI1d?=
 =?us-ascii?Q?DAGUrHFcuBOWhT8v9x6D7GCL9GbwXGSEze/n6hAKjAe9/wU5uE8dedTAScg7?=
 =?us-ascii?Q?NExtBtnWo5vSnJPzW+nS8kxW14c6mvxjpntiJiCFXbFAIahU3ZN7Zm1OWtYq?=
 =?us-ascii?Q?xoYdcN4g2Bx4NmXRUiRVIEPUL0tOog5Ar8xGk1UICEj797eM0ae9VElu4A5S?=
 =?us-ascii?Q?IAD+X5RCHZMAqdIzZe6nddi9UNGnHiIjEVHDisCam7M1cR25slImyu3mMOQI?=
 =?us-ascii?Q?t3coutYE+8nKQ/KlWZi2SAHgUzd87X/oCkkBoFQ9AFWz+FU8FQpedqCiv3rH?=
 =?us-ascii?Q?JdlZ7U3d70VnhaqTWfvWOrJolDceOoHlkvxUYA4Gd0ZHCiycuI5Ei0vn76oy?=
 =?us-ascii?Q?wWYAdEJTzg0QivwvCgt7yv7qmGf9C5FYS0LfHxRJgDVy1jdeTpvm2ItTnd+Z?=
 =?us-ascii?Q?D2v+BarJfJ9OqjSBHPnGTXHCkc6KibWbArhECuDNfU1X3zGxx89HHZABZGSC?=
 =?us-ascii?Q?bj9HVL4OAVprDqwW7EmnqEq2ORHroKM/JNjV49wtDWFF39NtK3ZnHl2XawZG?=
 =?us-ascii?Q?70VNRllUjKPFsph/5L1ctxtENCJ2Rwdqv3vrQFnktT21MxDtnKgSSFQmBXf0?=
 =?us-ascii?Q?bmmFzw8/FJrQiqNleAvESRIHdzzSS+2OyMgJnVP2bCCuYdeJAtwAZfAZ5HsP?=
 =?us-ascii?Q?DGFjf3tIsH0DModjGLOXJxqOWA+GY1TweVtFMhGRJ+tOsKaOPZmoY5qSB4zg?=
 =?us-ascii?Q?xe1h5BX2fcC/K7n0oQKSImSFRcQtSifS/MbVAmHeWlBn0zms1e5yeXwovBk1?=
 =?us-ascii?Q?w7ullvENDk4Vgf1N0NR6eaTFbVEeDmB4sFiRMO66unsbEW1c6MrRT57wWNUl?=
 =?us-ascii?Q?Y/f3wPx7Tz4qY31X8KH/o0dcSX/e0VGLm6f28pCBWm8ijVQH67cy6PXhEovA?=
 =?us-ascii?Q?vqrmRHc/QKcH0eA4yHoO3V4BV4jBfTYf3aFSgeVbKjWATNFHWN/IXyA4pLUX?=
 =?us-ascii?Q?ULIb3D2mghtIBj8TFMWP+CisMNEvZ/KT5uuk1vTGyQUmUAOrp/eezWPIgYyb?=
 =?us-ascii?Q?xsQR5TY9qmS4dlNQ6Dr+O04CUI2SG7IDC9EWd7YOredMKOK05OxKfHfRPyAJ?=
 =?us-ascii?Q?uCMwc9LXVILjv1RiPfAKBRdMMZ4Lqjoz0OJ8SKC/1yyVXKX8uvT+/6B2MokK?=
 =?us-ascii?Q?zdSw6La8IFRAqx7151MIwR6g4WAaoT9F7YTsqE0sCQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB4996.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(52116014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8830
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	43175868-d337-4a66-d2bc-08dcedcb604d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oz7elfyZ4heVLncarvjrRqAAhp5PfxXFpvcFzwYcgwQFYCMNWdc/BBLLRKwG?=
 =?us-ascii?Q?go+3B3kZ5bKL52K3s4S8cZEHcNJ22TmEwfYBz6Ho4igXTBeWywz/0EEPglEP?=
 =?us-ascii?Q?BzzKCEHyKY97YcDRiYzJaf8y9zGj0g93h9LelnIXBWkISfmPRx8fG324ok+j?=
 =?us-ascii?Q?YeZ+7d9wsm52tfSpyeHiyJdjJiLhbzafIBcy1315fo4SifbQO/hRjYjOjUEa?=
 =?us-ascii?Q?mSSF2LCfyJav9BNy2l4r9XlQQNx7tDRxfATK7C5eLw29ezkbIpcyeg2sVBxN?=
 =?us-ascii?Q?eOTTav/XKMXXO23yTajpwSuTw7nXj3j7Hy/NfjC273p5uJHgrXbKR+ecfAZE?=
 =?us-ascii?Q?p/LMXYzpqd9Q8yJX6j1svi8yv/4Tr4ITqgNs4tKt7vfGKF/XOMAfwzW9aFro?=
 =?us-ascii?Q?4nCOg44m6EV01hlCWMVTLaOiib3TZWmxx/uglOS8AxoEugnf9SfOTpAYUFWC?=
 =?us-ascii?Q?duuF9jw5F0yWWKTtuQby0iBbtgeVPDef9cIqCgpjaeSqMURctOr6Z5qk5C/y?=
 =?us-ascii?Q?nbVTGzUp+zP6uNvEO0qgl8loET/IicqmLVmrsKCFgYzaY/AFbV95THvkbICq?=
 =?us-ascii?Q?JHU7kim08WEZaGJ5Lv4M4Yqc5sd7x/xVDuhgIlbidZwRBb9ahFuKIdbiLAx+?=
 =?us-ascii?Q?EPT0s5lDxKTgYwjYdb7R85pLZVRBZ7kjiqR0PiQ1V7taC4tqCWe+JFdxgUWT?=
 =?us-ascii?Q?t+FUTFkadCNUW5ln71WoJsykJcCKcaUiaLLj1fjJ7lSZpFmvD/EB9xQL4CCg?=
 =?us-ascii?Q?7Aj2DjXBiw/SVgw2qlLw9Dsx+FzwpNqwQul4GOMF/U7Fwo87nPFpQEuPefnS?=
 =?us-ascii?Q?kq+sJRqFjp+qmRMxE00yaB2x0gNbEBgjwPt2X4JlowMuU1Qk/ZTXp2ZPZFh4?=
 =?us-ascii?Q?Z6yusyelSV2GOkiR2tpUVA6ArhaYmxyruZDgItxlBRxZsJFx5k4WzWg5RnIg?=
 =?us-ascii?Q?TCT3Q6wGA6X+wCYlOFUQmTqQmntB4nTV4b1na+PbN/Hluo8kaHvAc6DYTzGf?=
 =?us-ascii?Q?ticNKbel2oUlztXpLfZNSH8NfxAiQ7HfIRNlLHgfi/ZiaXJzPmS385dhe2oD?=
 =?us-ascii?Q?WQkw+VFPRCvdmwyCApPQIB8xj0J74a2cEdNMXuApVeHeXW9lTpCeKhJiWP2y?=
 =?us-ascii?Q?mDhK4OvR9/zXSBWb50vTo+23hefQNhx/2VforFpYYjEV6shu2mjI0P4Ab5EM?=
 =?us-ascii?Q?nXnq8lF2GSwXDTGRxbsNBd9CCSHnP53aRq94qeHNLfpH/sWc5qEvbeYKUfMz?=
 =?us-ascii?Q?U6qVvzto1Ghx0yEf6x9OruDP1+Tm0vX/zDBpVcug8YSFv0wlWvz4vEcfPiaO?=
 =?us-ascii?Q?8BxzmpD3dTXJDbKqUh2cutX6mf8qZAzbV8GaWbDZkZZvIMj8lR4nvkYlWn8H?=
 =?us-ascii?Q?beje5LKRR3L/gJdgP7LBPn/G1QB1?=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 10:14:55.9515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a641ad32-3960-4044-9d48-08dcedcb6226
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8295
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----82B842D64C56D3D008CF6EE628164FCF"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay76-hz1.antispameurope.com with 4XT6KR0MtJz4PLKf
X-cloud-security-connect: mail-dbaeur03lp2172.outbound.protection.outlook.com[104.47.51.172], TLS=1, IP=104.47.51.172
X-cloud-security-Digest: 7ec386e5ba1b799eb419f75a71f953b9
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:1.945
DKIM-Signature: a=rsa-sha256;
 bh=dJkLet2NgkeS8bE78VZtGuEvTjth/EgExqRCuNCyi2s=; c=relaxed/relaxed;
 d=aerq.com; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1729073713; v=1;
 b=qtrbG/2Q8UT+MIQkggua3G9CjOa4UeLxyUHORKCQl2vpReS22Uq7F8fkbdogszw/dMs97qTb
 bk8wbIyJRAVrnEAtVJePnx8TmseR1eyzdojWifG6EkvRNazYzxCjNnhh9UyiKYpUs8o0fB6mxwh
 ub2SUWtBF7c21tHLWeBu/aiWmTXLBc/gH8Hrk8pjLw8iVCiPqlQ/HCvx4vxjPciERl23+nrS0E+
 EHn3ex7Exe/9PW9GOdZHEZF90v0PhufioYvU5liN5HUhuiBwX2qmVGLmR5GxOdEYCf22nKDMKUz
 sZOpmJ3jG4fuS/zQhTBBOShefNmo3yrPaooLgLqKWkeYA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 10:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205960

This is an S/MIME signed message

------82B842D64C56D3D008CF6EE628164FCF
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] bluez5: Fix the files installed in the obex package
Date: Wed, 16 Oct 2024 12:14:42 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

The obex package is missing the `dbus-org.bluez.obex.service` symlink
which then ends up in the main package. While at it also make use of
the `${systemd_user_unitdir}` variable for systemd user services and
remove dead entries.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index b3bcd278e626..34115626bf01 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -130,11 +130,9 @@ FILES:${PN}-dev +=3D " \
 "
=20
 FILES:${PN}-obex =3D "${libexecdir}/bluetooth/obexd \
-                    ${exec_prefix}/lib/systemd/user/obex.service \
-                    ${systemd_system_unitdir}/obex.service \
-                    ${sysconfdir}/systemd/system/multi-user.target.wants/o=
bex.service \
+                    ${systemd_user_unitdir}/obex.service \
+                    ${systemd_user_unitdir}/dbus-org.bluez.obex.service \
                     ${datadir}/dbus-1/services/org.bluez.obex.service \
-                    ${sysconfdir}/dbus-1/system.d/obexd.conf \
                    "
 SYSTEMD_SERVICE:${PN}-obex =3D "obex.service"
=20
--=20
2.34.1

------82B842D64C56D3D008CF6EE628164FCF
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIOJwYJKoZIhvcNAQcCoIIOGDCCDhQCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggstMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkq
hkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkx
FDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqS
vysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEib
ivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHK
RhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFb
me/SoY9WAa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManR
y6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMC
AwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0G
A1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMCAYYwEgYD
VR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwu
dXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcw
AYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEA
QUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFu
SUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN5yFT
vSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav2VuQVHwp
Tf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn
2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZG
Xq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMG
quITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmd
WC+XszE19GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4
hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svq
w1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggUVMIID/aADAgECAhAV
Bbr0bzRtpXqrU7KDa4UuMA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEb
MBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgw
FgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIxMTIw
NzAwMDAwMFoXDTI0MTIwNjIzNTk1OVowJTEjMCEGCSqGSIb3DQEJARYUYWxiYW4u
YmVkZWxAYWVycS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDD
bGac2SHb2eIa+m3KUo/AJiZDcBR5eFitNMqkBYGzLH3NwmL+2qbl5vKerZ+M3jaS
sFeMmr6P9lXTjSR4Qkcdv+ZmTUNTaJ/vLFqEgWx+sCszay9KK5TM5w4tpkCQLX1T
4Fiuans6EUUPZETMfjKBjLafMenQuGZdn/ul9a0DrkgsEe/qJUNnhsRXzY8zd4mm
mcTaiqI7elLXQelS7FUaWh/BTSjd6c+hFW8YvYxFLEsTp1di/PcBOlb9VgD4+/D4
zxHDQkfsJ7xiy/Xig3PbZmmhF/T4d9hab1YrVv1rXJqKbtjZyG7Cfsdwfz9Tsodj
HEFItk2dLR5ROV6LRWR7AgMBAAGjggHNMIIByTAfBgNVHSMEGDAWgBQJwPL8C9qU
21/+K9+omULPyeCtADAdBgNVHQ4EFgQU7sc2WNoWAgmlONb7GCP/BCyMuEwwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQG
CCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUH
AgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0
dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0
aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEF
BQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0
aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0
cDovL29jc3Auc2VjdGlnby5jb20wHwYDVR0RBBgwFoEUYWxiYW4uYmVkZWxAYWVy
cS5jb20wDQYJKoZIhvcNAQELBQADggEBAF9U2htHftfPRwJwvN9bFBpXNA69+Em1
a4zxDLR77PMBkmc8pwgbl12rBuwJ9BzUsOgeCLfdCmQiurLsnGhrvGj1JV7L1s8e
S5vKKemLAnPZJ0czTzQeIGlLY0ZAvBWbgkjmWLpsOjeZmLOOMFLTDa/5QZzDXo/E
ZmvxqRqsfirSYWVzKWdIoIbpfBIdqMM5sj/p+L9vXDle3143c+orA+1L6tp/7Mw6
tFIzedrBWu4wv4XgGb5OuouhiBL8+fzVlsY67M04A/6lQ83eJXEn3JM7GCMIPIdj
N7fLO4fWbhwndi+1xdmlTY679FwT+mpoPXVARs7OOLxuuitpqPdw4jwxggK+MIIC
ugIBATCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVk
MT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQQIQFQW69G80baV6q1Oyg2uFLjANBglghkgBZQMEAgEF
AKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0y
NDEwMTYxMDE1MTJaMC8GCSqGSIb3DQEJBDEiBCDvQtNsah9CFiJXaqha8jCDnEjo
KaZCu/lDr9zXS/GSqzB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQBqrZBLoTMtJXCBy/vCUk1yLDFBuiKfbEY6Fp0i6vzZ8wl8DpSo
2fd6ZLMYVVS87DQ3ZjoME+GV1vtJTgZGoUgWcT/2WhSxjU1PMqnkdy1wMJoA2FlH
M5IhOul+kBpb0i4G1fGr1Uk+o3+CqRd84G/dBEx6n+Dh611j2IjXyWcf8EEh2lcW
6mrZvZLN23TXRZicuKP40It7XEpGBD4wXw+9/1sf68/VnYQYQY/jGZe+bWF8+LVU
924gnq9u7rR1Y4LWd8DYX7RkSLZwanDqdrjiIFF3xnjqS0tpiTlUTWWN6kdqQjz4
bFGhKeB7l6iiukFJPfFdk+CCu8/eYxkJhXj1

------82B842D64C56D3D008CF6EE628164FCF--


