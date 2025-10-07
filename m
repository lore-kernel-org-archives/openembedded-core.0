Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE15CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 10:34:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.web10.15305.1759833274946950276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 03:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FUF+E8vE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FUF+E8vE;
 spf=pass (domain: arm.com, ip: 52.101.65.1, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KJA5BHtBG9p4A6XfTgz2y5PM9nKheJHrTPSNeiyERLuTKIgKftiUPzaqSd8rq1QRvG4mRNNa4wOr25fxHOf/vQj1ThuHILOpTHpJfM03M/VXQZV0ZnQwyZhWkJx3vGJWGOWSL94RNXWeNmmX34SvPUb5Ng9Gltug8ckNFkBaGv8qgRcRUPaKyg35XdKX+wHHUhfe0sKHPGS7nlDfDPkef8flyKYZc/EAJizybFWIBW7cJwf9/HKeTPq/6T3pTeLnvSv8pyJlsWQGM+PzFASYw4zWkvr0CTxK/UBzxdChcj/CD6Au2EXWL6W1rqYbde314eOhjW+I5eN3rfRvDpP41g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRZ/r1p6WOMpRCCqG+gno84O2xApYjwjkZfx/3figik=;
 b=NqY2uukyJd6ymjkBCClGSVI90IuYbmaPw+l/jxnard09SEg7YQaZIhZMBm7M+W9OFodCtMs6SGQv6a/rOfPPH1VjpHDH+EJ7sjyxoW+ecDMNk/RAGgAMj4RPCErWECiBStWc0ITFvC01KIGwtmMJxlq0FMvsOhLh92eZN1zllZnGap8VGjKS3PBmqTtdLwAAxX+CecJoPoFf1Z6LjYYtVOAtMjqnbXYXohhVYkIupZH2ipNUoEOIAVXWFHZaUaF03BW8EJReCDiMOBTTZN4qkomcigfo2bfGhxtEYvO06Wxuc0z9V5R7ZoxyC7AcBUNMXOkvFRwORBhY/+dXrZFALg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRZ/r1p6WOMpRCCqG+gno84O2xApYjwjkZfx/3figik=;
 b=FUF+E8vEZz9meWc7Yfpgp6JuMzIOyKA9uul9ley9jQ0sdEjyN3jFEHkGz/91nL7Z2A9L+V9HMTCqs0Z4nziSAj48TkdXVIQv6TaNvo8LGLOfvvm1ZmxC596vTO3r0gFWShSKQWxdij/Y34B+HZME+TnvBTGeZGqzMqQKQ/is1cs=
Received: from DB9PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::16) by AS2PR08MB8973.eurprd08.prod.outlook.com
 (2603:10a6:20b:5f9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 10:34:21 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::51) by DB9PR01CA0011.outlook.office365.com
 (2603:10a6:10:1d8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 10:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Tue, 7 Oct 2025 10:34:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhJZHY5X+J49YnEa7WtM9yUTcHdC9Mr28G2bEkFQRHM7RHWGkLTiXn2V580SmV+SWaHqZY6+NNDiSuwefdRaZh2sjmC5QxnOxPJ4Q9c9sRs+j4b7XrJzSm/M6Vjy162nBEDSGuuq1YmpuQAx0OhVO+vp69/zXYsI2h4h/QeYLZdGJF2skeK4ivL+IeAHvp8zGC/1Aw6VY29+72y9rzFKU82T81tSu+6d+3yMEcvJI795jyOM5brVLUn3vZQS6onGJhS9P/sQI2pA5MtpTFZ4keKQu/pdoWFtXsuDqdSnMiQJwKo8qESd6tTmxrSuUzF8laeIqBdYxSfryLpmARcvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRZ/r1p6WOMpRCCqG+gno84O2xApYjwjkZfx/3figik=;
 b=X+vK0UR+Sl9lpQSrN2mGrFqXCLLkT2Y7b+mICa7Ljo+svT4V+W7TvBT4HclheqclK5cVXlyT9fJFvO5iGWaI0Lw4UVECWYAMbe5hjywSIW00CQ22nJCuJs5KuEYc7jzS3LukS+rhGx192pz4mxZ49mnUtDeEAvmv+NoW5ty/mC28H7K5nFvI4C+FaaTZqpaf7HcDYdVod0OZVfQx5wDvreuxgHvccewZ0LW6ZaE+60xVk4ib19vV6Hj077GS17Ceoqh83cakY/Ws6fOzDKF0GMHlbAHLBwufJIBjxZPRdzFtufEumdl27bAVnH0sKYvyqNLqvTNoN2sdZHZJU2C5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRZ/r1p6WOMpRCCqG+gno84O2xApYjwjkZfx/3figik=;
 b=FUF+E8vEZz9meWc7Yfpgp6JuMzIOyKA9uul9ley9jQ0sdEjyN3jFEHkGz/91nL7Z2A9L+V9HMTCqs0Z4nziSAj48TkdXVIQv6TaNvo8LGLOfvvm1ZmxC596vTO3r0gFWShSKQWxdij/Y34B+HZME+TnvBTGeZGqzMqQKQ/is1cs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9598.eurprd08.prod.outlook.com (2603:10a6:20b:61a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 10:33:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 10:33:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "Adam.X.Nilsson@axis.com" <Adam.X.Nilsson@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Adam Nilsson <adamni@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
Thread-Topic: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
Thread-Index: AQHcMu1bm4eWL7OysEKcbvVDSC82UbS1lGkAgAAV64CAANt6gA==
Date: Tue, 7 Oct 2025 10:33:43 +0000
Message-ID: <BF7A5C48-4C48-40E4-B846-486473FE2D01@arm.com>
References: <20251001160212.2588471-1-Adam.X.Nilsson@axis.com>
 <FF7BA9D0-A09D-4D43-9CBB-5CA991E825BF@arm.com>
 <CAMKF1sp1hb6ZSr=B6iAThoXcRQFD+h7vKxVcmPq2RoqeF2in0A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp1hb6ZSr=B6iAThoXcRQFD+h7vKxVcmPq2RoqeF2in0A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9598:EE_|DU2PEPF00028CFE:EE_|AS2PR08MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e21c09-ea61-4414-c9c0-08de058d13db
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RGZIU0FtVytUb3UrbzFWMml5cVBVN082S1ZIcllEdi9rcXZOYXAxY2FOZkRq?=
 =?utf-8?B?cFJkdERtNVM5S0JQcEpxWnRWT0JBZ04yU2FKKzR3MFVySHZGTXZSUmtXVXR2?=
 =?utf-8?B?NngzWm1aRHE1eUtjYWUrZ0ppc3UvRmJvaGV3WEdaTVZhdW0wNDNmMEVOd2xI?=
 =?utf-8?B?THNwVWR1dkdISys4MS8rNUQ5d1pyYnNNQmNwTHZyWTNnd3JqSk0yL29zRUV6?=
 =?utf-8?B?dWhNUnRwWTZFSHErS2xzRCtrbTU1eHRBc2tSS1ZTc0x2bHFhZHVoQjRQOUwr?=
 =?utf-8?B?cDB3bWZpOVVtaCtsRjhRY2F0OS91ejdONkRwQXVKSTFYUWxZQktGS0NMYzZs?=
 =?utf-8?B?K0trYjNXaVE1bDF1WmkyRlJFSDNSWFhuRmtPcCtaL3dpT3c5R1hRKzZLTlVK?=
 =?utf-8?B?dEVvQk9BcUdHMHkxVEZhd3BuRUNvdkZYdSsxb1V1TFNtMjBVV2hBdmVMOHpV?=
 =?utf-8?B?OWhmVkFxNjlJWVBkRGM3eTlrby83clJReFNPRGhXNWJseGJZcUJRUEFTVEc4?=
 =?utf-8?B?eUQwd3Y0ZWdTRFhVcUZwRWtIbklvdGJYbkhscnBNVm5UUTBEUXhveE92cWR6?=
 =?utf-8?B?cGNjT1k1cy9lNllCZUVsSU80NzgyK2M5MnpMVG9FaHpJei9FZjNLRkFBZEUz?=
 =?utf-8?B?aHhXSTV0QTMxcys1RzVDZU95RkFCcXBiYkRiUG52T1RyY0JTdS85V2N2OS9X?=
 =?utf-8?B?UzRIckZqT1ovRHpSN1YxYzdZclhtZjRabGQvbHZ4cTNLQkNINWtkbkFFcnh5?=
 =?utf-8?B?WXpadXo5OG1NTFRUa0dFSEZ2TE50eHVsbFVpSnVEeDhxeGtCbkYvUnliOXpq?=
 =?utf-8?B?ZDFTYTUwRzZlU1FvbGVnd2wzNmdCeENxem1sTDlyYXVNbEg0clNRb004YnFN?=
 =?utf-8?B?ZnQ2aTZmSkI2bWp2UjNJSEdmUnJEZGRiS0lrYVM3dXkwcmt6cWIvSHh0K0tR?=
 =?utf-8?B?WkFldnJhOVA5VmI5OXhEeWR4cmwvOU4zVHB5Q2xOSm5kTndUL1AvcmRVanBr?=
 =?utf-8?B?YnlxYlFURGZFWGFLa2tEOFVyVHZSdXhrTEhQQzR0VHAzeHJDZVIwVnRXM2lD?=
 =?utf-8?B?VzZMbllYTmhZRTNFSnFqZk16R083ZVJjZzhldGF3SE52QjF6c3J0dUgrYjNC?=
 =?utf-8?B?eTFWdEZDZVh0UXFLbGpzRTZPZlBJcHFKRldnTkYvOE1hYzV0b1lkbm1SRGhp?=
 =?utf-8?B?N3NRc1ZBU3E2eW5OcWZaVE45WFBpWlIvOXRGWVlMYjBzeXdOUmRRMHNyMkVJ?=
 =?utf-8?B?UEhTb3JLSTczV0JtaHRYR3dXd2trbFNMQzNKQlluWTk3SzVXV1BpSUc1Rmpa?=
 =?utf-8?B?MWtjSGxGZ1RWVS8xTGRzR0twcVlhK09qUlR6eWtIVXZGaDFlaDRqL0lVUy9z?=
 =?utf-8?B?U1VrWURONGtVT1NnL2VZVmlyQ0E3M0RGN3cvR01hdEpqVS9EZlcxekpxSTBC?=
 =?utf-8?B?RmFwQktrUGt5amVNYUVmSjg1dzdmUVJCRWE3N05nWVRPdE9lVFlCcGFKSTE1?=
 =?utf-8?B?Nlh5M0kvdHNLMGg5b3RMT1N1R3IrMnI5Z0hFcDhNMkR3TTNCVXFTZDlmZnVz?=
 =?utf-8?B?Wmg2SUF1ZE9sdkhkVFk1cGI0ZmlkaG4zK0N0Yzh3c05KOUtBL1p1QWRTcEc2?=
 =?utf-8?B?Nkhwd0doemw0bFlFZndFMmlhWnBGdjhUM1RKWmU5TVpDOXlQMkl5cm1mYmJY?=
 =?utf-8?B?MGc3bmNlZ3J5WEFNRmtLWWRMR2twRWVjc3d0VTBaazlpaEdlSzlMOXZCTkJw?=
 =?utf-8?B?aWh3Z2JJMTJtdk93bk16clBvT05GT2xqVjdZMkRVRU1jNVRNaW4vNy9UQmNZ?=
 =?utf-8?B?ZzV4Z1RFOERLenBZT2JXS29vWHZxWXRwTkZxaGdReGw5eWJYVEMrUHpSNDgy?=
 =?utf-8?B?Vmkvc3NIZHF4aHZUUkVoT2VJcW9wQUt2ZHBWTVhsWXJmb0x2dDI0RG5PeDlk?=
 =?utf-8?B?NWtmQlVvRFlzcWVLNkxUZXAzYmFOYi9WOE5ENnM0UkVqd2RXOWpDWUxVK1Bp?=
 =?utf-8?B?WEtFcVZ4SEYzQ3RlaEQwUlA1NDJTaEFnQnBKM2dTRVNEbUttSFplWUxRRkNj?=
 =?utf-8?Q?Ry+1Py?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FBFC5FAA71BA24E86417EB087994114@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9598
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2fef3648-799f-4468-aaaf-08de058cfd65
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|14060799003|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZnJEWHA5ZTJGWThNbnd5dml2Nm5MOGRvdy8rbWRxcmZoT0xkZkdRK0Nuc3BH?=
 =?utf-8?B?OGIvcFQ2TVIyaDQrVWVZaE56anR6UzRtemZEN3BqRk50UTQ1eW50d1NiMEJN?=
 =?utf-8?B?QTFFMW5XamxIY25KWEtSWmRXL20wUFp4Nk13YWZGN21iZnV3clZUb256eU9N?=
 =?utf-8?B?T0FURkxPNTRLL3BCUDhMR25tcWFqRjJTT29kNWdQTHhtdHowRWZUU3JwY1A2?=
 =?utf-8?B?akliZkNrak9SdjFGQUZKUEJQSVcxT0Z5M1NmQktwYnV0OE9LVXBjNWlKR01y?=
 =?utf-8?B?eDdIZUdPdWhFSGo1SUF2ZDNPZUpNeEVZQTRrNlZnbWFzSW1GdUpwK3JlWWov?=
 =?utf-8?B?SkVpd3gxNVc5THVCVUpwa05NMXJPUm5ZTlR0VFNpR0kvOEViY1hYMU1kK0E1?=
 =?utf-8?B?NmRvaUt0MVhpUFB0R2crKy9WdHJscTVTUWJnT08xRG4raVBkT2g2d3RyWGZq?=
 =?utf-8?B?M3ltTmRMLzRqWHgwUmxZcVBIWEdHcjJ6TU80WDh5eVM1NmpuQ21YRzdTS3dl?=
 =?utf-8?B?R2tPbXhERlFpeGJHc2ZucjExV2kzN3hIck1Ucnd3VEJCY0orUHQrdUFoVWtE?=
 =?utf-8?B?dTJlejZGRUl2YkUveHBETkZjQU96SzRHKzNtei9tYXBZT1dTbi9kbEVoRUF2?=
 =?utf-8?B?dTZPRm5OZmxXZXZweGtGZGkzYmNabEdUV28yc3gyWVU0eUsySzZ1QVhUZEFV?=
 =?utf-8?B?bXFYODExeVkzNjBveWxrVm51Mnd2RHl6Mk9QM3BvTVdUYWkvREZSbVd3SUhq?=
 =?utf-8?B?WVZtdEo5U1AwV1kyWk1MQmNQV3VobnpLQkxMWS8rWDV0VUxtYXI5TmoreGFF?=
 =?utf-8?B?b3E4NUw0TVIzOElsa3g4SVpGeTJ6M1oycmExUkM1OVFzaVNKU0lNSHZXUHZ3?=
 =?utf-8?B?enFURGg1MUpGZTFpR3hiTlFzdHlCOHBESU9Dam01RkowTTVNMExDbldIckd4?=
 =?utf-8?B?ekJGcUpHeXZsM2xLZkxpYU5MSWNxWEZxLzF5dW80QVRvc3phaXhLQ3VGenln?=
 =?utf-8?B?NHRRNWRjUk84WWNpaE8rczFjYWJEL0pWV3hDRmFYYXEvdFNSQks5dW9Oazdx?=
 =?utf-8?B?OWJuTUlyVFBhdnJVZmJEeHVMZXZpc1JBdUhLZ1EwUjI2Z2FjemQ1L3d5MXlq?=
 =?utf-8?B?MW5yVWRGYXFIdENFUU9lN3FMTXpKd05GUXFhKzhrN1V6V1crTmkyREJQNnVI?=
 =?utf-8?B?ai8vbTBMQi9jbDhGOWF0SUc3d0RqQ3ZURzg4dEVlanRqSmNaSW95T1FFbWRv?=
 =?utf-8?B?S0pJOHcrQm1NYnBEamdmNVlCQVBFbHJNMlhybndvWUpnLzAyR2xWVU95bS9S?=
 =?utf-8?B?OFZaMFJnS2tWOGpicG9iSVc3TUdKL1M1MnpCSzRXNUkzcC9ZajkxbDlqaCsr?=
 =?utf-8?B?WDdmaGJOV0E4U210a2xzRzM4SzJEVU8zdTZGSGNKaHFoNXVIS2FCZnFzNlg4?=
 =?utf-8?B?dUZOeURLUW5oUTdxbjhXNU9lS2x6U2FGMEFXZW04R01aVjFVNjdMVVVsblJF?=
 =?utf-8?B?ZVlubS9lQWZiVHVkbHZVamJpUFpWRW5kQ3FZNzlocitUR3ROcVAvVVAxb2Jm?=
 =?utf-8?B?UTJjTmQ2R0V2TW90SDJqdlBWWVdRT2t5Wmc1T0NkVi9KU1lJRzFqb3c3RVJh?=
 =?utf-8?B?eVNZYnluUVFPeGZBRFNDVVNaWEpJUlA1RXkyNUpXUFVQcmUwRFN0Ty9DNEtl?=
 =?utf-8?B?L3BRelN6a00vdVJlYVBVKzdpUytjZnZLS3NUS0FTaTROOWNmalhSa1BLRnNH?=
 =?utf-8?B?MUZmNkdFOUZZTm9zYTdJVUd4eWNKUTlsSVFydFYyMUg2QTB1NHJ1YjV6SHpD?=
 =?utf-8?B?ZW9lbU4wVnkxaGR0L3NPUUxkVkp1c29zOUhKKzJTSHJ0RDhMZEY5M2xYcWcw?=
 =?utf-8?B?enlDTnljSTV3U00yTFJSYU5kcjlrV0daSWphMFlmSjZMdzBXUVVhUkIzVTdD?=
 =?utf-8?B?VnFCd1VQY2F1b2VmcG5nTE43bkEwb0VIT2pkcFhzQkJ1ZnJmcmgvNDRleFQ1?=
 =?utf-8?B?N1c2eWVBc1I5ZjNVbVprNEsrWnllSUJDU1NTeHB6ZDV0NjVrYWRKVXBuYm5C?=
 =?utf-8?B?QzM2cVpKbkFiL3U5V2RHdFZpTk5sMmhDaU1wSUFqT2VDOEVpNytZTmNDRVFj?=
 =?utf-8?Q?JB0I=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(14060799003)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 10:34:21.3866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e21c09-ea61-4414-c9c0-08de058d13db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 10:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224518

T24gNiBPY3QgMjAyNSwgYXQgMjI6MjgsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gT24gTW9uLCBPY3QgNiwgMjAyNSBhdCAxOjEw4oCvUE0gUm9zcyBCdXJ0b24g
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHJvc3MuYnVydG9uPWFybS5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+PiANCj4+IE9uIDEgT2N0IDIwMjUsIGF0IDE3OjAy
LCBBZGFtIE5pbHNzb24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPEFkYW0uWC5OaWxzc29u
PWF4aXMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEZyb206
IEFkYW0gTmlsc3NvbiA8YWRhbW5pQGF4aXMuY29tPg0KPj4+IA0KPj4+IEFkZCBhIHpzaC1jb21w
bGV0aW9uLXBrZ3MgaW1hZ2UgZmVhdHVyZSB0byBpbnN0YWxsICotenNoLWNvbXBsZXRpb24NCj4+
PiBwYWNrYWdlcyBpbnRvIGFuIGltYWdlLiBUaGlzIGlzIHNpbWlsYXIgdG8gdGhlIGV4aXN0aW5n
DQo+Pj4gYmFzaC1jb21wbGV0aW9uLXBrZ3MgZmVhdHVyZS4NCj4+IA0KPj4gQnkgbXkgY291bnQg
dGhlcmXigJlzIGp1c3QgdGhyZWUgcmVjaXBlcyBpbiBjb3JlIHRoYXQgaGF2ZSAtenNoLWNvbXBs
ZXRpb24gcGFja2FnZXMuICBVbnRpbCBpdOKAmXMgbW9yZSBjb21tb24sIEnigJlkIHN1Z2dlc3Qg
cHV0dGluZyB0aGUgQ09NUExFTUVOVEFSWV9HTE9CUyBhc3NpZ25tZW50IGluIHlvdXIgb3duIGlt
YWdlIHJlY2lwZSBpZiB5b3Ugd2FudCB0byB1c2UgaXQuDQo+IA0KPiBJdCBkb2VzIGhlbHAgcGVv
cGxlIHVzaW5nIHpzaCBhcyBkZWZhdWx0IHNoZWxsIGFuZCB3b3JraW5nIHdpdGggeW9jdG8gU0RL
cy4NCg0KRG9lcyBpdCB0aG91Z2g/DQoNCiQgZ2l0IGdyZXAgRklMRVMuKnpzaC1jb21wbGV0aW9u
DQptZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfMjU3LjguYmI6RklMRVM6JHtQTn0t
enNoLWNvbXBsZXRpb24gPSAiJHtkYXRhZGlyfS96c2gvc2l0ZS1mdW5jdGlvbnMiDQptZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfMC4xOC4wLmJiOkZJTEVTOiR7UE59LXpz
aC1jb21wbGV0aW9uID0gIiR7ZGF0YWRpcn0venNoIg0KbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9k
L2ttb2RfMzQuMi5iYjpGSUxFUzoke1BOfS16c2gtY29tcGxldGlvbiA9ICIke2RhdGFkaXJ9L3pz
aOKAnQ0KDQpIb3cgbWFueSBTREtzIHNoaXAgd2l0aCBuYXRpdmVzZGsgYnVpbGRzIG9mIHN5c3Rl
bWQsIHBhdGNoZWxmLCBvciBrbW9kPw0KDQpSb3Nz

