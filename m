Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B380C3DA42
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 15:56:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.40])
 by mx.groups.io with SMTP id smtpd.web11.83481.1720454180483070982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 08:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JLvVw1E0;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JLvVw1E0;
 spf=pass (domain: arm.com, ip: 40.107.21.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=esX+dGFrePJ8B+X1FuQ+OrnMFBJsGjzTpKQUhzNSUIE0XBE4QQOwq3LJidWjLqNcelbqJMEFWdE0Kg2wVJjP5WkchBEVFiACXJF1f6TkqWJUJyNQ0XYDNNHxRYmNRoOF1XHOy2gx1DFXI5Irgv4wXGIDYpR8nWBB4Gd5VxR5SrNtxzfTggpbkzxG63waLRyuSEVax3zqWrNfPazeTOc3FIaY7avA52GU9+jjOuHr4I/uh6W1CAi+W49yJVj04OVEi0L9ZqKQDi/RC3y+t2P9AfeuOPiINKWxILkPBj31DdpHSMIMR268/6Xgct3CblaTzieRLSUaBuuZf07Qt4Na9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WD8K/XXYtL4QF0Bcuj3X2fTztH2soZNty/TBk61hj4g=;
 b=FZ8sRmFAVz6h3iNzX9v2lRJWBkXkL2R34YpbT+cSm7U+25dd/g68ADbvM/sqAh3G67vHs5mNrcvAg7H5kyUc0WJ7fY8k4VOG35+S+a5p67wmSaLBtFbpxYhmWtJlnc3AOcgaSqwhR/fSmlP08tsybLTY2C4j+5BPuW+r5svLserolbx01s8wMwjRJ3R0HLiUyPNN6Vyvt9Fe6MgNhCdVO47ii2QlWqp3yxTLguS2FJHmx1ZPch2P75U1755ZcHvD3OU5C/6Jnz87X7dPRSbex77V/dXjWJa4Fy7TTBEp+GwJsfdMaikkwgywcnRj68iIGLNdAUogZZUj9HLrmoS5yg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD8K/XXYtL4QF0Bcuj3X2fTztH2soZNty/TBk61hj4g=;
 b=JLvVw1E0JvxYdpQgGZvZNWEK2gfCrp3ZriQ9MP/XWj/4UIoTiA/rX/Ok0/iM/PGwTV0qVWagVGW9o9r8vBObySOXb6vD5u/7hCaDIhLalvpe4iqXSdgjQWSZsdxwa1lOhil1xTciAZRYWnUzty8ejIodEj7hnbb+BN6FZy9/dng=
Received: from DU7PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::11) by AM8PR08MB5714.eurprd08.prod.outlook.com
 (2603:10a6:20b:1dd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 15:56:15 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::f) by DU7PR01CA0016.outlook.office365.com
 (2603:10a6:10:50f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 15:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7762.17 via
 Frontend Transport; Mon, 8 Jul 2024 15:56:15 +0000
Received: ("Tessian outbound b2522d7cfa6f:v359"); Mon, 08 Jul 2024 15:56:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11d7ea567b29d5a8
X-CR-MTA-TID: 64aa7808
Received: from 952a4b0856a7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3762A342-CB72-4AB5-BA5A-E9E57099D66C.1;
	Mon, 08 Jul 2024 15:56:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 952a4b0856a7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Jul 2024 15:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xx+BcQaETPXwooY/dbg5vU5gSDoS/Jfo7Ty4DEawRlFqM3S+ue+KKeuG3GSpk/iB/LP/I1a2hBUdKsm7QP57ah3HLvCM7QOH8XCBnKlrcZ69t4FmmUs9UJL3Lze6FBtB5FAavakKR2R3grMbW/Irbzjy+wEOmo/sDWhF8s3SAh7i/MphgizKeBrnGiMh9ihTUyhejaT710KJUvfEZjFGsJJRQp+2SuLZnbtniqaUQR9GMLPf2/QOTxZp+gXp8BBM78DFBoWy7UtC1Sdh0Q6xLhVtU4w8Qqfy2oXNH8fxdFXR/x/J5hR0BFbEgwnM+6IHC1vZ9L5r0IyuiU5lFFxMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WD8K/XXYtL4QF0Bcuj3X2fTztH2soZNty/TBk61hj4g=;
 b=Qi6H1sxqmLzeii3cD/SqSwhc4JNtA11A4OUpzcofevp3A0OXpGoS0B5/L0VDbrDJzbRvWtcNwc9tpUJoTo6UWMjNX7j+PcIA4oscwSWAaR1CD/ZP5RunUM9jUHjrG8dKobcE5/xjZZvjWpAXN6fDbdbDtpsGpcUtoDdQq7Ax+/lsqmtxKUWApFuG5XKZBE6oxJcd+qU9bq6l8N7QDUlzifxih8NXfE5feWAYrqAtfc4l95ruqxPswceF6YBroInmL4vmlHViQGfZiS4kqHSYWisZIlDJ9dnBsQeVhhAY45IvpYDowOymshwiuM7qDmaKVEYv2RsWqxilC66ty+HOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD8K/XXYtL4QF0Bcuj3X2fTztH2soZNty/TBk61hj4g=;
 b=JLvVw1E0JvxYdpQgGZvZNWEK2gfCrp3ZriQ9MP/XWj/4UIoTiA/rX/Ok0/iM/PGwTV0qVWagVGW9o9r8vBObySOXb6vD5u/7hCaDIhLalvpe4iqXSdgjQWSZsdxwa1lOhil1xTciAZRYWnUzty8ejIodEj7hnbb+BN6FZy9/dng=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10889.eurprd08.prod.outlook.com (2603:10a6:150:1fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 15:56:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 15:56:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
CC: Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "mingli.yu@eng.windriver.com"
	<mingli.yu@eng.windriver.com>, ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] acl: Fix nfs ptest failure
Thread-Topic: [OE-core] [PATCH v3] acl: Fix nfs ptest failure
Thread-Index: AQHayGA3z8RAv1+afESYhNEs7qM4BbHb7NEAgAWi9gCAAIR3AIAAA6+AgAr17gA=
Date: Mon, 8 Jul 2024 15:56:01 +0000
Message-ID: <D541F29E-5518-4F7C-98C9-AD05E76E1F2B@arm.com>
References: <20240627070339.2066255-1-mingli.yu@windriver.com>
 <CAMKF1sqG1+_VGAFR9N8oaJqrniYoMC6LOWxrMsTadBuaDO9gEQ@mail.gmail.com>
 <7e47a093-f395-4413-a069-4435942c84bb@windriver.com>
 <CAMKF1srF+BXye5k9dGNVEvAj1D8Y3d9b8FXcU21-vCmWCC+31g@mail.gmail.com>
 <202407011633012c576264@mail.local>
In-Reply-To: <202407011633012c576264@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10889:EE_|DU2PEPF0001E9C1:EE_|AM8PR08MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 893fddb1-23bf-4765-7062-08dc9f667f9c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VXVwWktzTkZtNVN3aFBST05uR3J0ZEk5b0JUNThRcEN4V21zc0ZseDVqcVFG?=
 =?utf-8?B?UmFJRTF1TUdhb29KQnpZSUczNzlqa2loSTdVOGRDSmRxVkVmcis4SU9rVVk1?=
 =?utf-8?B?WEVsdWtLTXVNdGVmZHNzQXJMSDgwQW5XWTZZdWtheGlUNUx5bGxHK2Z4TEpk?=
 =?utf-8?B?QzBjU1JHdW9pcTVJMllvb0JtZTc4VjRSLy9nM2Z2bFNKaHFzWU02TWo4S1Qw?=
 =?utf-8?B?MDlNN0FKdUhudWIyTnFWSnFpRkt3SUVQWDMrT1BCbXh1bHZaSWloOGtjV09W?=
 =?utf-8?B?Vk5SQ25GWGdaMVA0ZmpkVVhHVUhZdEVHWmV6WEt6YVhFdDJiakY4L2lsOFM1?=
 =?utf-8?B?QUxIRU5HeTFSd2JFZHRTdEtOUHhBWDJETmpDUWptTVZaMFBaSklMRld1TGtZ?=
 =?utf-8?B?ZHhXMTN5enZFT1E2T0xKMlc0M25wZ1B0OGk1c2tFdWVlZnNmS0wvUWpzQitW?=
 =?utf-8?B?N2FkK2ZjRjBZVFBuVXpOeWs3UnBuMjA0cS9FTllGanF3TEhCeGMvRmxsbnVT?=
 =?utf-8?B?KzFicjVoQWFwVHpZYThMSDZSWGxWMEFCckViQnlPNldJVUN0WWUxQTFFSFpi?=
 =?utf-8?B?ZUk5dFQrWmdFdTNkdmYzM2tUVUxqeGJEUEtrMStpK1lRZEtSSDUwNms2ZHB3?=
 =?utf-8?B?RjFDenhoNC8wak1SY21EK1JWR01MS3ZMRGFjM2NtdDZkWTNVZVBKbHdxa2JQ?=
 =?utf-8?B?Y3lKSzVOL0RFOE1FT0xsSllHU05hczdQZTJ4MUdrenQxMksxQ2lsUmhlbytP?=
 =?utf-8?B?K3FKVjNkbUl1RXFDTW1IemdVelFKc2dBWVkvWE0rKzR4bWgyYkZjTlpPRXJa?=
 =?utf-8?B?akNSTWYzbHVNSW51cTk3Mk5obzZmUHlSL0RrOTNXcUdHVWxCNjRZbk9GSmln?=
 =?utf-8?B?M0l1Y2krajhqRkMrbHFZWFZGUDdDZ2M2VFkrT0VYdEVSOTJWTDFzejduaFNY?=
 =?utf-8?B?VVM2UUVDSUppZVYreGRHaWt1SlpPNnkrUVh0MVpaMVJBVFROSXQzU1JEeitp?=
 =?utf-8?B?SkpuTVc4M0E2eUxpZGd2SlNNZFBQMElBeCtnWTR0SkdjU1pOSjlEdGorOWFh?=
 =?utf-8?B?MFVRT3JobTh2SzZQOEdxV3JDMG92R0ZodzlBdUtNelZEaEpZOWdxc0hQcDRN?=
 =?utf-8?B?STNxWHhNZVkyazdmYU5BWERMYmlZc1BWM1pzZUpxUkl4dUcxcENjT3Q5OWl0?=
 =?utf-8?B?Y2krYU03YzErMnpsazBnRTROUjdyOWNKd3NLdFpWTXpzN0lLUGJqeUJYTzk2?=
 =?utf-8?B?clUwQnNwTkZXajU0MktQZkhIMkZ1UEc3T0hjbHE1K0NSNGJoZk9TdFNpZFVs?=
 =?utf-8?B?SmhCZFViVm5wc0dBZTFDcU1VV1l3ajdZWEZYUTBlOCtKKzBMTktxdGRBSUJi?=
 =?utf-8?B?Ym9SNU01WnlPU3N0azhDUW9uRkQrU1ViWkRIOThwVktvaXg2SkUraFJEekNT?=
 =?utf-8?B?dC9YODd2TjlBaU5pWTNuT3NYV2Y5TE5CMk5tVEdOZWtYclFWRDFPaHd4V1Jl?=
 =?utf-8?B?bDJUcDEwVmJUS3JLL3VVdnJUV1Z4RmdUaFZmNkVkYko5ekkxeW1adDNCNFlE?=
 =?utf-8?B?dWhtZVZKbkU0OVphM1JLYUJ0THdVSm1TdlNnMFVCOTZFeW1IZlhTUDdwMEhX?=
 =?utf-8?B?ZTFOclFac1NJOUN3OWpJMDY3M0FBQk50bTVpN2lybEs4MUZuNWxmVm9xTENQ?=
 =?utf-8?B?YnZoZFo2bVhxc3RIRDcrTzhUZTgra2p2dXpEM2d4Tkw1Y3RHSWt1NTNIRDZz?=
 =?utf-8?B?bjV6OXhrN2hBcUFFbkJRcjJxemF3WVdJODRraTdUdkJ2Q2NTWUhrdkp3Z21y?=
 =?utf-8?B?eFZ3ZEo5UnpLNnlMbVhwZz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C94A4E758C2A749B800DC4B331D6D4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10889
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bf01a549-cd2f-4e68-f36c-08dc9f6676fe
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MnBWOEUxVmlNTngvMWQ2TG9QMFhaOGNJTU9YY3VvVWpwK01TeGdaUjUwc2Ju?=
 =?utf-8?B?aFRNaDcrVTRVL1NMVm5YdFdwbmtaZHZqODY4MmVYVHV5TlZiNGd5czdpVG1K?=
 =?utf-8?B?REVMRlJRZDB0eFpVWUtjNzAvbTJTVXBQNnRtVjdySWdYM015NFR2aEdFVERL?=
 =?utf-8?B?NTBBU3k2SEJEM1FxbVhFYXpYV2JrWDB2QkpMczFSS1VoV3ZXVG9POE9LS1ZB?=
 =?utf-8?B?THhDUjdNdHRPSzllK0lpSzNIS1pSUWtMeWUwR1BIQmVRQVExdE0zb1VxRVZx?=
 =?utf-8?B?Z2srcURNellyRXRYbTR4K0w3WUppVmJFVWt0OHBUbHVkZ29HOGtWNEZxOWEz?=
 =?utf-8?B?eDZudXJFRFhIYkllcGNqWE9RT1UwaEJHOXYvcFR6enEvVXNReWFZU0NGTllz?=
 =?utf-8?B?MmRob0RFQUVWKzdvU2IyK3lDRXpMazl0bzJhVUN5bWpIRHJBK2RkblJVR2Y4?=
 =?utf-8?B?NlBYdkgxRWNNcXhzZ2RWVVlBamFZZlVSa3RXaVE4dktYYzd1eDVZY2s2UCtY?=
 =?utf-8?B?UjEwWldDd1dqZkRHZFZNMDVZNDlOTzBZVEZDbFRDaHhPeno0SWZSbU9CZUgw?=
 =?utf-8?B?MHIwMlFPYVU1c21BUWt4cmxya2N0NlpJMFpOcDZ5THphQWoyYTk0czFsVmlH?=
 =?utf-8?B?UUk3TXZnWXlQTFJuNWJ3ZHArNTJZOWlRS2x4N2I1a2cyM2dnMDUreXBSalIx?=
 =?utf-8?B?RUdXR1FXQ3JLaVRhRzgwVmIvK1FDS1dzRzcvcEhBNDgwbUEwWjJxUjd4cG9k?=
 =?utf-8?B?M1FYeDUxUk5DbjluNUFFb0hYOFJLYWgvVTJwUFRwbXJrdUh0ekJLMCtsTmdr?=
 =?utf-8?B?bzV3TnIyUGgxRHBIa281UmJZSmpUakN2SFlVWng5RTlnMHpONHRBQitXM0I1?=
 =?utf-8?B?RUdyemdWTkxEQjdwNWFrbTBxNWRSTWlueGtxbXFGN1lpbTlPRnBUQi9aaStw?=
 =?utf-8?B?TC8vU0NWRjJUYjRrajQ3Z1JRdXpjUDB2U2Y0RE9PVjdXd3pBdndkOFFFaE1I?=
 =?utf-8?B?R0dkZzlIMmFqVk9rTzZBeXQzK3pmUW5RTHFEcm5aWm01NTNDQUN4cDB3V0p2?=
 =?utf-8?B?eHk2M3Y5Qko3REVGZ01rRjdIMnNvTVh0U3lsekdmTXpSazh4WTBmcTRlU1Rs?=
 =?utf-8?B?a3MzcVBPcGE1bThiSDloM0oxdnNXMkhicHEvMkNIb3RJenhhQ3M0NFQ4WmIw?=
 =?utf-8?B?Z2Y2TzFtbHFaU2tOUnVNR3VhM2NiQ0VYTzNHZlFuTEt4WVpqcFN1S0pveEx0?=
 =?utf-8?B?SC9lNGw5bUFFcEdrbGpCclhlN1NseFFrYVJKRHgzam9qLzQ4SGRmWjgxQ3FG?=
 =?utf-8?B?cUxMZzE2ajlZYU82T2d1NWtxR1pYd1FveGp0eG1DMFF3eFIxcVFBRExobjhn?=
 =?utf-8?B?djJMM2k5azVobDF1VGpIaXpkMUZ2a3BHWVpMUU9xT3l2QUhsbisyaVFmWE1a?=
 =?utf-8?B?eUp6d1BiRU5XV0tKaEJhRU9ob2doV0lBa05IajFLUXRpcFdNRmJwYTJkQWZ6?=
 =?utf-8?B?Y21VTGYyd0NYV3g4eG9KVmNrYjhLNmg1bGh5YnVoL3pHVXBGQ1AySzZETjlz?=
 =?utf-8?B?R2p3bmhLa1VZaXFlT1RiNmJWWmFyVXNqSVRkMUc2cCs2RlRoQ0dxYWVPeHlB?=
 =?utf-8?B?RGdpbjB4Ti9ENk85U0g3c2Q3bHFRWTNmWmJvWjYxL3FZRm5aLzFHVFoyVW5m?=
 =?utf-8?B?WjZVdFJhaWluZks5VHpYYVBaemx3Y0pKN05YR1VDeU95d3VsYnN5MmZrM2FM?=
 =?utf-8?B?L0tXYXJqdnVTVlJYdEw4QVRKSEY1dDZ0ajJWcEN1MGU2T0R4UnhCUjZBRnpU?=
 =?utf-8?B?dnNCNjJwWDN0amN3SDB4MmxlNXBkNG5MMVFEcWVkRnV1MXpiSWpHN05lWmpz?=
 =?utf-8?Q?ymwdPI0Uw0wRQ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 15:56:15.5738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 893fddb1-23bf-4765-7062-08dc9f667f9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 15:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201633

T24gMSBKdWwgMjAyNCwgYXQgMTc6MzMsIEFsZXhhbmRyZSBCZWxsb25pIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4YW5kcmUuYmVsbG9uaT1ib290bGluLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIDAxLzA3LzIwMjQgMDk6MTk6NTAtMDcwMCwgS2hl
bSBSYWogd3JvdGU6DQo+PiBPbiBNb24sIEp1bCAxLCAyMDI0IGF0IDE6MjXigK9BTSBZdSwgTWlu
Z2xpIDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+PiANCj4+PiANCj4+PiANCj4+
PiBPbiA2LzI4LzI0IDAyOjIxLCBLaGVtIFJhaiB3cm90ZToNCj4+Pj4gQ0FVVElPTjogVGhpcyBl
bWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCj4+Pj4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUg
dGhlIHNlbmRlcg0KPj4+IGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pj4+IA0KPj4+
PiBJIGFtIHNlZWluZyB0d28gWFBBU1NlcyB3aGljaCBpcyBvayBidXQgdGhlIHRlc3QgcnVucyBy
ZXBvcnRzIGZhaWx1cmUNCj4+PiBiYWNrDQo+Pj4gDQo+Pj4gSXQgaXMgYmVjYXVzZSB0aGUgdHdv
IGNhc2VzIGRlZmluZWQgYXMgWEZBSUxfVEVTVFMNCj4+PiBodHRwczovL2dpdC5zYXZhbm5haC5u
b25nbnUub3JnL2NnaXQvYWNsLmdpdC90cmVlL3Rlc3QvTWFrZW1vZHVsZS5hbSNuMQ0KPj4+IGFu
ZCBwZXINCj4+PiANCj4+PiBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2F1dG9tYWtlL21h
bnVhbC9odG1sX25vZGUvR2VuZXJhbGl0aWVzLWFib3V0LVRlc3RpbmcuaHRtbCwNCj4+PiANCj4+
PiANCj4+PiBgYGANCj4+PiBJbiBjYXNlIGEgdGVzdCB0aGF0IGlzIGV4cGVjdGVkIHRvIGZhaWwg
ZW5kcyB1cCBwYXNzaW5nIGluc3RlYWQsIG1hbnkNCj4+PiB0ZXN0aW5nIGVudmlyb25tZW50cyB3
aWxsIGZsYWcgdGhlIHJlc3VsdCBhcyBhIHNwZWNpYWwga2luZCBvZiBmYWlsdXJlDQo+Pj4gY2Fs
bGVkIHVuZXhwZWN0ZWQgcGFzcyAob3IgeHBhc3MpLg0KPj4+IGBgYA0KPj4gDQo+PiANCj4+IEl0
4oCZcyBmaW5lIGhlcmUgd2UgbmVlZCB0byB0cmVhdCB0aGVtIGFzIHBhc3NlcyBzbyB0aGUgcmV0
dXJuIGZyb20gdGVzdHMgZG8NCj4+IG5vdCBjb25mdXNlIHRoZSBwcmVzZXQgcnVubmVyDQo+IA0K
PiBCdXQgaWYgd2UgZG9uJ3QgZ2V0IHRoZSBleHBlY3RlZCByZXN1bHQsIGlzbid0IHRoYXQgYSBm
YWlsdXJlPw0KDQpJIGp1c3Qgc3BlbnQgYSBmZXcgbWludXRlcyBkb2luZyBzb21lIGdpdCBhcmNo
YWVvbG9neSwgYnV0IG5vdGhpbmcgdXNlZnVsLiAgQm90aCB0ZXN0cyBhcmUgbWFya2VkIGFzIFhG
QUlMIHdoaWNoIGNvdWxkIG1lYW4g4oCcSSB3cm90ZSB0aGlzIHRlc3QgY2FzZSBidXQgcmlnaHQg
bm93IGl0IGRvZXNu4oCZdCB3b3JrIGNvcnJlY3RseeKAnSBvciBhbHRlcm5hdGl2ZWx5IOKAnHRo
aXMgdGVzdCBpcyBtZWFudCB0byBmYWls4oCdLCBidXQgdGhlcmXigJlzIG5vdGhpbmcgcmVsZXZh
bnQgaW4gdGhlIGNvbW1lbnRzIG9yIGdpdCBsb2cgdG8gY2xhcmlmeS4NCg0KVGhlIHBhdGNoZXMg
bG9vayBsaWtlIHRoZXnigJlyZSBmaXhpbmcgYWN0dWFsIGJ1Z3MgaW4gdGhlIHRlc3QgY2FzZXMs
IHNvIEkgc3VzcGVjdCB0aGUgdGVzdHMgd2VyZSBleHBlY3RlZC1mYWlsIGJlY2F1c2UgdGhleSBk
aWRu4oCZdCBhY3R1YWxseSB3b3JrLiBTbyB0aGVzZSBwYXRjaGVzIHNob3VsZCBmaXggdGhlIHRl
c3RzIGFuZCB0aGVuIG1vdmUgdGhlbSBmcm9tIFhGQUlMX1RFU1RTIHRvIFRFU1RTIGFzIHRoZXkg
bm93IGFjdHVhbGx5IHdvcmsuDQoNClJvc3M=

