Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665BACA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:08:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.43])
 by mx.groups.io with SMTP id smtpd.web10.58032.1758560900386000205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 10:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mBaR8Vyt;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mBaR8Vyt;
 spf=pass (domain: arm.com, ip: 40.107.162.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j56SJcy52UXgrd+uf8LPveZRE620DseA2tg9BCI9wwStGiwPv1r/9Bv+IeGMVPMKb9L5VFDhKAEy79AIInPmNsOprGQ8PakcsTYGT1IiD28isMhNqs3JP2rGOiYnDRspUNJg3dJgDffD9efi3yBFsyPJlsRqy/mCPbpaC7PFsxAercaVgAfL3WFbRNY9qnpAnOoNB03MfgSQe1AJWGXmSAs18pa+Hn8Ht1wLDjqcKWd7YULdzIGv0ni2bcPNIihvlpqandarbolcERj/Wjg10jc3Jv7ACoEMVnegfxzb76IYpP8zBB4EcjtNCymVrGu+xANQvS8T2LDMHvbg6LiFNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EArLQR6J9pyznUjcmcNY7fCicCfBJdmA34pQEKZdh9c=;
 b=kOGdojjzps9dZn2tnqkGV3AJShIRWwg2MAoHaSOXKUauVStI1O/3buRN7ISIvqHSa24UJQiQZqjZcIoUIKDRLW6fW4xlgY68dccK5dNaekIwn4nkCEnojxSNjU5fD3wTc5dPaj4wDGL1gh/Pvvu7GUE30yCzFbvuKlXlD6ehpes/NBlTh6y5qi8psrKQ5eqsuy8jfZSP8oy5YJ43nnx1JfKmoltPY+WNfPFyjItsGrwyFUUz2DJQonWt0G4IbIHPfdYwxm3Gyu362SMqkyM8Kke/AJI3NyKOFYdfn+/e440VURBPLbInq7LMQYzohGTUR6wYVEQwG1fSydbRfOHxgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EArLQR6J9pyznUjcmcNY7fCicCfBJdmA34pQEKZdh9c=;
 b=mBaR8VytHbGq+//RYaUZMbmBuCLGg49t2kcxvueLUd48/nr03cIiQCUKJsd90EWzitMFMiQMamFMn5JNiGzJCmb4flZlW1PsKZAJ0/K4yES1G3tj0J6pKpZLieDZ9Y3on+9y/dwgdiU/Bf4yRbos1qK9w28pEc4cWi8gjBQ5OyQ=
Received: from DU2PR04CA0338.eurprd04.prod.outlook.com (2603:10a6:10:2b4::8)
 by AS2PR08MB8311.eurprd08.prod.outlook.com (2603:10a6:20b:556::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 17:08:15 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::10) by DU2PR04CA0338.outlook.office365.com
 (2603:10a6:10:2b4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 17:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Mon, 22 Sep 2025 17:08:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3T+nRATMGjQyNXVDCrwYftveTwMx/DeEBFB+KdbyxwSiMf3weQO1oI7ALVeopOrMMQvkpXSHssBK2UuymTvYb15o3DWI1Eq5Rc3baip+1/3DpAeuFzPEyeyN3brkapEBhFgdL/AeaHsQTUe6CYsy7aKgBWzY085TH020tj0VaLfpYTAvCJaUKt6PmdreeZC+RmOgf8gjmLeNxVWNJ1grGE7/M0N9LH3hcZ9UZAHVDWdnoM9DR1YNfaVeS+okjDyBka2dXmtduDx83APle7QUSV9A/R0TXSQwELwyqzP3VBXXpzLLc/zW+P3p9z95a7jlDUArnF64G/D4lNbbuLi7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EArLQR6J9pyznUjcmcNY7fCicCfBJdmA34pQEKZdh9c=;
 b=Eo+SU7V1a54T1LHRPDRadYXsnMvTysfVQ+DlAYBEkmV4LeOLvJejGPvneckDatecLXAdDYGEjT3R1KzQNMEvu+O+1NK6mifAteEv4wVpRXBxLpRwoYRzNAfdP/kkH33WZ1tN1lYag+a0Fdv28y7NSMwwckmUJuBKlHUTeZdvXIKsH8+X1qp/aVthWf/WEzdd275vs407m9dmWnfa/APC1UyGks9wicm7X3YeSS9VUnXGmzz3aHCqF3ioM2ExiLoDG83+LvkyRXGBtVe2s/qjN/0aVHcJSKCIZ0Uup+K8ISexAEgbwJ3BYqHHHSA2IS1k5Sb92YWpQ7Vce+fhCcFkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EArLQR6J9pyznUjcmcNY7fCicCfBJdmA34pQEKZdh9c=;
 b=mBaR8VytHbGq+//RYaUZMbmBuCLGg49t2kcxvueLUd48/nr03cIiQCUKJsd90EWzitMFMiQMamFMn5JNiGzJCmb4flZlW1PsKZAJ0/K4yES1G3tj0J6pKpZLieDZ9Y3on+9y/dwgdiU/Bf4yRbos1qK9w28pEc4cWi8gjBQ5OyQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB8934.eurprd08.prod.outlook.com (2603:10a6:102:33e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:07:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:07:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "skandigraun@gmail.com"
	<skandigraun@gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-cython: make generated source file
 be reproducible
Thread-Topic: [OE-core] [PATCH v2] python3-cython: make generated source file
 be reproducible
Thread-Index: AQHcJ9oYBO1/mBmrhE6CrAP/xhwiGLSfdwyA
Date: Mon, 22 Sep 2025 17:07:40 +0000
Message-ID: <9E2FD19C-553A-489A-8296-1EB34F615591@arm.com>
References: <20250917135047.2957170-1-hongxu.jia@windriver.com>
In-Reply-To: <20250917135047.2957170-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB8934:EE_|DB1PEPF000509FC:EE_|AS2PR08MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 2541d6b8-346f-473b-4bdd-08ddf9fa9da5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YklST1A0bHIwVUcwYWFpb1g3WTVLQU9RbEI5K1krWjFUN3RIRExXdytRUncz?=
 =?utf-8?B?Rld4bitobTRLdFBnTjg1NWRqazIwN3A3U0Z4UEdQTkZETk43YTNnTXhtdlRP?=
 =?utf-8?B?YUpSblJHTHM4Vm9tRGs1NlpPa2VwTFYrWk0wVHZOVjY1RHNsQ2dielk0VGFN?=
 =?utf-8?B?SE9PM0RzQ1pYZE8yWEE5TlQ3V1E3cjh0anBHWDVtaVd5RXJlbDNNMS9WbUhq?=
 =?utf-8?B?Mjh0bGlnSFlVdW5yNE1nR3FkUXJoZUJseE1aelZVVWJBQkZnMzBwUzlERXRI?=
 =?utf-8?B?S3pFVUhoYTlqeW54QzN6aTFUclh6YkJWWVhJL2VHU0xJTHZMNHNobDV4UG5R?=
 =?utf-8?B?eUpxaWZBOGVUVkJmekFrZ2h4cU5YdkF1bjBEdVlYVkJVMm5RZnRqSlYyb3Av?=
 =?utf-8?B?bGxRKzBXeVN5MC9aQmF3UUVWaVhub3dtSXhMOEtlM2k0RmRhcjdZUlUydXla?=
 =?utf-8?B?RnNzbk5sQkgyalhINTFFVEd6c0JsdzJKSFVYMTI2Tm0xV3pReHFmZXFRbVpx?=
 =?utf-8?B?Vks0dGFyb0tMRTVEZzRUVS9yYTRXNXMvMjF2VDVOZ055Y1A4blJhdnVqNUQw?=
 =?utf-8?B?THZBK2l3Yjdlci85KzMyT2JzdktMSWliZ3djTkNSUitsZ3Bub25Fbm5FOTBl?=
 =?utf-8?B?aDBtYVFPaTN0b2RNZzBRNWM0MGZGSWN3ZjBtU0dXNktPNW91OFlvZ3laWFFR?=
 =?utf-8?B?NUxFSmFYc3J2eU82WHl4RjE5T01IV0dMZ2lxSGgvMmM5Zmt6WCtLNzduRWFL?=
 =?utf-8?B?TThYWVg2TlBVR050QmMxVDdwWk9HQURxMUFXcVBTV2Joa21jcWs4ajZBVElC?=
 =?utf-8?B?cFFiUTNObzVtbEJYODgzRHBrQzFqTVk5VnZoTHlzMU45a3UxMVFkbWoreXp2?=
 =?utf-8?B?Tm9WT2R2cUtaKzNkVWNzaURoQzNtd1NjR2ZKamVJMnY4SjVNdWJWWnFGeTVN?=
 =?utf-8?B?WEFwTFg5eEE5N25RSFE4SWc3d0E0aGRwNWtxSjQxZk1HdHowV1RTc3REWWxH?=
 =?utf-8?B?UkRrNVI0cHd2Z2g1TXdFNW5xaXh3TlRqMFA0ckdQdkNnQlpEbUtVN3g5eHRF?=
 =?utf-8?B?QWFYQWlsOTd0ZmJ6M3pGK2xNRUQzUFZ2V2tUWndPRFU0OEYrSUMrMERMTlQz?=
 =?utf-8?B?UkE5ZWpZSVFIeG5HU0pmdStwcjUrUEpYdW1Kd3Z1WnRXZVJhM0dPY2VjanB3?=
 =?utf-8?B?YVNYTm9ETXVoQ05rSzJNRHZraUdSbDNONFYzVzhWZ1JXcjgzWVhJSVpPUGcy?=
 =?utf-8?B?TVA1OTJmcCt5RTZmR2lBUHlGWDlCdkpuVmd1UG4xT2RsVU5NcmkrZXZ5RHRy?=
 =?utf-8?B?TnJWeVVueGhGUlRoOGppaFBsUWJYNGt4d2hneEduZHB4S24ybUVGU0l3U0xV?=
 =?utf-8?B?NWdrZ0kvaWxQV0kwbHd5aCtKSUsra0ZQY3hrRG1lc1UyUU5QaDhYWU95d3p0?=
 =?utf-8?B?UWpCWHN5dWNRYjZ4VVN6Y3owSG5PMkxvSm1tTXczM1VjYTczWlI5bnZRckVw?=
 =?utf-8?B?YURnUllCamVhSWRlcjcxckFYc3BnMmxHczd5dmFkaDNRR2U4V05ORVJjWXhI?=
 =?utf-8?B?clZwMzBFaVE5blRrN05hbEhPMVlaYlllQzd0VWo5LytZY1lmL1Q5Z0hXeHpE?=
 =?utf-8?B?SFpjWUs5UVM1T2g5L0ZMQXU3WHM5aEhUSExqVUhleUwvQXgxZzArNWN3VCsv?=
 =?utf-8?B?TmEyeXE1enF6RjBEM2dVV0JSck15djNwVnYrSzBYNm5GcXRla3dBcGVlTG5T?=
 =?utf-8?B?VG5hU1Q0MkpmSVZJM2VYU2pHU2JQSFIxWGxBc1pERHhFSDJza0tHMHpZNmlC?=
 =?utf-8?B?Wi9Ta0kzSlRncWhxS2NGTWtlY2J3ZTh0KzV5bFdPRFlRdTYwMHBna2lVYUps?=
 =?utf-8?B?aTAzRjRSSHhpcmtlcmJvbjFGNmZibTBKbUVJYjJ0Wk14MkRYVW4rUlU3cHpw?=
 =?utf-8?B?bUR1WHVoS29tdlRJZ0FLT1VyK1pRMEFkdW0yYnBVcGg1b09CcXIzd2ZYTmpa?=
 =?utf-8?Q?abya+g2SYeRA3NLQ6wMdgTkr200rRU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8DEE247450DC84BAAE499E41F07123E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8934
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aa4742a4-5e4c-4435-ad96-08ddf9fa8992
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|14060799003|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUhaSUxOc1M5VG1YNjZuMzRiTi92NUlidXZxOEV1ZzNXRDdsNWhWRjVjZ1Rr?=
 =?utf-8?B?VlYxK2JEZXpNOE9rZ1hpQmRxMWMrcUtZbWk4cXRQVkl4S3RhZWg4RVcwTW54?=
 =?utf-8?B?RmRaL0w5UVRWZUJQdUF5NzJvZHRPK2xKdTExakJKU1lPWFgwOCtkZ1FrSmZY?=
 =?utf-8?B?SmR1ckd2WWFIdStIK0VtWXdxR3ZEeG1jSlYvQVlLODRBZmRaMzVPSlpMVEhp?=
 =?utf-8?B?b3VBd3h2RDNMWno2MUdVdzJrdXlzcUhET0xUelNlY1J0QVdBQnVsOGhwVFBC?=
 =?utf-8?B?NDBVN3hUQW5hZEZOaVVnTVkzWVRSYmRRNUJWRmVTR1VhdmdkWVgySWhvY0xt?=
 =?utf-8?B?S0tEa1VIN2Rab3QwTFlFNkxhbW4vTlpud3oySFVlZGRzeDU3bnY4dWFwRWZx?=
 =?utf-8?B?QWthamg5QWQrSzJPcWtRdEl0OGgya0k3L1ZBMDJXSXNOZ05aVzJSajlEM1Bv?=
 =?utf-8?B?RW1MTStwMjFEbHdpbmN0UkY4VmZSVTRLL1hYZndDOUNNclArdDFzWnBsWTZn?=
 =?utf-8?B?SDhISjFlS3RQcC8vS1RNZXZtZ0RJRm1lbDIxUDZvL0J5Mng5RmF3Tml2SVly?=
 =?utf-8?B?UlprT0ZWd05Dc2lZcWhoUTRDOVJRMHRubUxYb054Vi9FQmlvY0pMM2FXYUJC?=
 =?utf-8?B?cC9aUlBrOGJHRkNBL0ZhWC95d0hXYnBadWZiVDRPbEYyU1hWQ08rT2N6WGRh?=
 =?utf-8?B?d0xlc21SVE9IdndLOS8wK3dnSkRjcWZqNGhjb0ZxQkdXQ3VYaXlsemxrL1pT?=
 =?utf-8?B?TWgvNFJzSlhtajFmcEcyRFR0cGd2bmYzUVQvdmxLKzNQSENhT243TlVBSGV6?=
 =?utf-8?B?RHVCR2xmd3lYaFBSMFUxSXhuaEFDbHlvcWZzMU44Wk5NSHRQbXYySFdtaXkv?=
 =?utf-8?B?cE5NNzRMZDdkc1lFZHE3bGFsVklRcmVBREhKbDVMdEFOTFZObXYzM2JwSUlF?=
 =?utf-8?B?TmZsYWdkanV1dnV0ZTFIVnB0TnFIMjFkOEVUT2F1NW1OVmlrVWFRZzNoTG1N?=
 =?utf-8?B?Ni83bjFwbE83ZmFGWUhPTGJ4MWw4aW9wR29jSlFOQVhZMTlzY2o5Tk1iWG5N?=
 =?utf-8?B?UHMxeEs1dkkzSlFjek9TYitYMnFaSDhhb0tpNUxUNVBiZGV0UG1wdmI1OEw5?=
 =?utf-8?B?ZGV4OXZrRXYwTlVaVDJRUzlvMmdFZG1XNnF4b0JDTnVWU2MvWnhKc1d1QW4y?=
 =?utf-8?B?SEM5S21XV01aZHdWeWpoaWp4Ui8rR3JOSjVrSEtqM216SjJPZ2NBVFYzNFMx?=
 =?utf-8?B?amUxRWxOQlZvc2hxUU41U2R6WDR4bWxrVGROTnhSclJDR0F1YWE3N1lFMjBJ?=
 =?utf-8?B?ajNNRHFDNGlSbExrZWNVSmRyWXViZVB6akRhT3BWYXd2Tm9mVHdXbGlRcHBn?=
 =?utf-8?B?UVo1SDhETTZYWDUrbVk4Rm9pOTd6QnNDODRtdVF2WXVHNFJMaFYzVTBDaHVN?=
 =?utf-8?B?cFBibHVDMmp2M0lpWS80QUl3bEpjNzRwMjhvUURrTTB4NjhTa29hd1J4Mytt?=
 =?utf-8?B?ZXpVdklGejcrTExkL1pIbjkydU5oWGhPKytjSXQrUmdCUVU1VFFHUjkxL0h3?=
 =?utf-8?B?RVphMGxYbWZTM1FOaTBBdUN4WDdEVFVOQWxVSVptUjdQeUY5YkRhbWpDa2ZF?=
 =?utf-8?B?WTV5eGJ5MlpqUkp6cm56K01pbzgzZmhkY1VDalE2dE1UK2s5ZjVvNHo3UVBC?=
 =?utf-8?B?TFJndGNQTStKZTZSeGw1ZVhBYkxiQU1CSmlzTzRncVp3N3pCT1JkdkxBN2FZ?=
 =?utf-8?B?S2NvdjVBL2Vsa2dwV3FvSnBMYVdsdkdSVEVjZ0dPbmZwc0cvRDBIZ080a0Fy?=
 =?utf-8?B?NVBEYno0UitpS0w0ZFJoaXVXNDFnU3BIbnhjWm5FTTFpNEVyZXMvcWsrM0k4?=
 =?utf-8?B?K0J2aXgwTDltT0UvZXNWVU1Id1k3NzBmU1YweXB0ZXZmVDM1RldOdEh0Nk5Q?=
 =?utf-8?B?Yi8yZ213K0E1TjdxclpqTDFOY2ZDTWZuWWg2SFZzZFo0NXJZTGc1Q0ovMEJU?=
 =?utf-8?B?MkxWRU5YTmgwdHlFUDhBY2NpK0k3dENhSXlGQ1dCMjd2aEJ5Uy9kd3crWUZx?=
 =?utf-8?B?b0lUdmR2K3M2QTlkSTJWeXRVUjJlVDVZN3lYQT09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(14060799003)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:08:13.7502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2541d6b8-346f-473b-4bdd-08ddf9fa9da5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8311
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223832

T24gMTcgU2VwIDIwMjUsIGF0IDE0OjUwLCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBXaGlsZSBweXRob24zIG1vZHVsZSB1c2UgY3l0aG9uIHRvIGJ1aWxkIGxp
YnJhcnksIHRoZSBnZW5lcmF0ZWQgc291cmNlIGZpbGUNCj4gaXMgbm90IHN0YWJsZSBhdCBlYWNo
IGJ1aWxkIGFuZCBtYWRlIHRoZSBnZW5lcmF0ZWQgbGlicmFyeSBub3QgYmUgcmVwcm9kdWNpYmxl
DQo+IA0KPiBUaGlzIGNvbW1pdCByZXBsYWNlcyB1bi1wcmVkaWN0YWJsZSBzdHJpbmcgd2l0aCBo
YXJkY29kZSBzdHJpbmcgaW4gZ2VuZXJhdGVkDQo+IHNvdXJjZSBmaWxlIHRvIGFzc3VyZSB0aGUg
Z2VuZXJhdGVkIGxpYnJhcnkgc2hvdWxkIGJlIHJlcHJvZHVjaWJsZQ0KDQpJIHNlZSB0aGF0IHB5
dGhvbjMtZnJvemVubGlzdCBhbHJlYWR5IGluaGVyaXRzIHRoZSBjeXRob24gY2xhc3MsIHdoaWNo
IHNob3VsZCBiZSBmaXhpbmcgdGhpcyBwcm9ibGVtLiBIb3dldmVyIHRoYXQgY2xhc3Mgc2VhcmNo
ZXMgZm9yIGp1c3QgLmMgZmlsZXMsIHdoZXJlYXMgZnJvemVucGF0aCB1c2VzIC5jcHAsIHNvIHRo
YXQgc2hvdWxkIGJlIGZpeGVkLg0KDQpJIGRpZCBzdGFydCB0byBzdWJtaXQgYSBjaGFuZ2UgdG8g
Q3l0aG9uIHRvIHN1cHBvcnQgcGF0aCByZW1hcHBpbmc6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9j
eXRob24vY3l0aG9uL3B1bGwvNjQ4OQ0KDQpCdXQgdGhpcyB3YXMgb2Jzb2xldGVkIGJ5IGN5dGhv
biB3cml0aW5nIG91dCBfcmVsYXRpdmVfIHBhdGhzIHdoZW4gYnVpbGRpbmc6DQoNCmh0dHBzOi8v
Z2l0aHViLmNvbS9jeXRob24vY3l0aG9uL3B1bGwvNjM0MQ0KDQpPZiBjb3Vyc2UgdGhlbiBweXRo
b24zLWJ1aWxkIGNhbWUgYWxvbmcgYW5kIHN0YXJ0ZWQgZG9pbmcgYnVpbGRzIGluIC90bXAgc28g
dGhlIHJlbGF0aXZlIHBhdGhzIGJlY2FtZSBhYnNvbHV0ZSBhZ2FpbiBhcyB0aGUgZmlsZXMgYXJl
IG5vdCB1bmRlciB0aGUgc291cmNlIGFueW1vcmXigKYNCg0KU28gSeKAmWQgc2F5IHdlIG5lZWQg
dG86DQoNCjEpIGZpeCBjeXRob24uYmJjbGFzcyB0byBhbHNvIGZpeCAuY3BwIGZpbGVzLiBUaGlz
IHdpbGwgcmVzb2x2ZSB5b3VyIHJlcHJvZHVjaWJpbGl0eSBwcm9ibGVtIGluIHB5dGhvbjMtZnJv
emVubGlzdCBhbmQgaG9wZWZ1bGx5IG90aGVycy4gV2FzIHRoaXMgcGF0Y2ggbmVlZGVkIGZvciBh
bnkgb3RoZXIgcmVjaXBlcz8NCg0KMikgRW5nYWdlIHdpdGggdXBzdHJlYW0gdG8gcmVzb2x2ZSB0
aGlzIHByb3Blcmx5LiBJ4oCZdmUganVzdCBjb21tZW50ZWQgb24gdGhlIG5ldyBQUiB5b3Ugb3Bl
bmVkIG1lbnRpb25pbmcgbXkgcHJpb3IgYXJ0LCBob3BlZnVsbHkgdGhpcyBoYXMgc29tZSB0cmFj
dGlvbiB3aXRoIHVwc3RyZWFtIHNob3J0bHkuDQoNClRoYW5rcywNClJvc3M=

