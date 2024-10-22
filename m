Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9747BD2CDF8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 15:57:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web11.22006.1729612641691123730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pn/3G7jl;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pn/3G7jl;
 spf=pass (domain: arm.com, ip: 40.107.20.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YO69ZssafEAGTqYSSEgTYpIHr5u35rxTtWLzBFgkMxrIgsxLoltSyFiorkE5mNCHifPlrTKJq2/u5IfJ0NDbfEfXWIm2L3GCZ1eweJ9Iqe4QrOnWfu9bYbwzIq3qlGGNudvp/oQVuWpeaz7vjZh8hKZOlShz5BixwuW5ktbvzQftn4HDhc1rmwie+Dm1lCDVPncr6EV7Kw/ZGwMmzJZJzrcgDyLqp8PRXyWvCcqC3olVIRzYTXYA5dp17+oVAZ82u70Lv6RHQRSq6jltBN44NvEUvWBCUwnD32EpT+2LHX9bgJQKtfZEpHnKDtQl6REKQde5ZGUEiW9t3enOtqP+iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZ/EUi21IVL4dFiC0gdjAP5MP2s/NnF6jn5X4xkuT2Y=;
 b=fZr8fYw33xAK+HbSZkEaZ2lrCmlBOCNDrLAKr79/F544cJUNipVpEA1YlWUEUWIFwNVonpU8tvt0X7TBLJTOAV61NyJHhEJrYCBcu+JvaWBpEmTx13PmHfqBZDCXwWxgmJzVso/ENy165kdvC5vTPpbdB69rBkwv1hY41/94D43tP+L04uxvjSsCsHpHK0iw1DauTv8RKlMawGWLSjbaIqDRT42xGMBlOZTLmCoqp57QrTMV1UoHA6kMJIzVZobu/Vcmj7n0dU2P29fkHBXkZ4vXPcj0ZMX7XJT6SbHnhEa7F5XNLImTIYBAMhEuluBGjQC2rNGHFeVABPCzalqncQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZ/EUi21IVL4dFiC0gdjAP5MP2s/NnF6jn5X4xkuT2Y=;
 b=pn/3G7jltb6aq3DUREXblb8Req57v+Vs34DL83oPUealmyy2Oa4dbNvFtSc8MlUkmfrry8hWfxr/c9UCmnAqPQt49SWLcvrwVO6X6qh3PkjDDgwweJHug1nMzUIX+YKfUhLr8LQ5bEA4gl0i2UOTR7UM7WGrPo9OSoF281SnZRg=
Received: from DU7PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::17) by VI0PR08MB10620.eurprd08.prod.outlook.com
 (2603:10a6:800:1b8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 15:57:17 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::27) by DU7PR01CA0003.outlook.office365.com
 (2603:10a6:10:50f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Tue, 22 Oct 2024 15:57:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Tue, 22 Oct 2024 15:57:16 +0000
Received: ("Tessian outbound 60a4253641a2:v473"); Tue, 22 Oct 2024 15:57:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f07029a700358f71
X-TessianGatewayMetadata: Kzz+Q88eIllOEgqt70q2xB6Ag7kailhEjVYY/2+RoCHczHaL4mM4qQw9qMbhUk++bGPsVTDvOU6TTBnibr71LCVoXIeErxT/XfVBb5Vo/g6kfaJ3fGz/05y1xNN3PiqPGzW/xayfmrYWjrymbrENAnNDUUuiklXBhYGwY7yTr0o=
X-CR-MTA-TID: 64aa7808
Received: from L9206ffaf759d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 92146367-29F3-4F0E-B0BC-25CE9DD471BC.1;
	Tue, 22 Oct 2024 15:57:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9206ffaf759d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Oct 2024 15:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJGgHz/vuyZd+yWOyXcg514levXieiYPtoWtNGndhYoaZt9wNoiBV8EI97dlCwhl4c10EgMicqpOxhwKyTxbmTYLrGfZl3dE9F3v0/D4nKhfleD6ImMPMHqQVsWOcEnqQk0l6hRzx6ND7KITwZlTeLT6QW8/8M4JU+07V2gT08/oZcEAmkOTF6HF164pl3gSey4WOe/OjJD5uLcxmNm0ry4RZ1/UEgEVnTNFXFG0Drm5fuBQC+9iaaSZzsRkCXOO4lkfV+sBsWKUl2JAHjj5KsJzwp1QB/XXWKT+XvEHfEc58mqdS2YFbDvN4GAIpCfJoJl0dSxmjVW8mQsw2JorWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZ/EUi21IVL4dFiC0gdjAP5MP2s/NnF6jn5X4xkuT2Y=;
 b=CnXY0RtrHGePCp++j5ctCWkOCJn1pPHXfnnyFjSMNAPmTyWfghAbvwanXICdWFiKep4Mf3eKLRUnLZRe5tE4YvXydS8g7yYXiC228Yk3a+EDBsNkPIHQ+JC9wx81g/NjLjMrpMjJL6OAC7y6Vu/IUXwml51kqxxDIMwWkZdPb8Ff4whJKTZk/dXwkEaP6KXG5Rkz/WWy0IMkGVqoCiEWZhLS3RKteHoXzTtImS3i4lL/Qycq38pH1Ua88dNSqgJ1FFdh7sVnaY4Dt21Ad7OuoDHSvHqj9fSE8C3p2BbcltDuCybIwqK4SOrpUZD7qpA7LhXk4nP9LCEMzwbmnScpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZ/EUi21IVL4dFiC0gdjAP5MP2s/NnF6jn5X4xkuT2Y=;
 b=pn/3G7jltb6aq3DUREXblb8Req57v+Vs34DL83oPUealmyy2Oa4dbNvFtSc8MlUkmfrry8hWfxr/c9UCmnAqPQt49SWLcvrwVO6X6qh3PkjDDgwweJHug1nMzUIX+YKfUhLr8LQ5bEA4gl0i2UOTR7UM7WGrPo9OSoF281SnZRg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by FRZPR08MB10927.eurprd08.prod.outlook.com (2603:10a6:d10:137::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 15:57:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 15:57:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 5/5] python3: update 3.12.6 -> 3.13.0
Thread-Topic: [OE-core] [PATCH 5/5] python3: update 3.12.6 -> 3.13.0
Thread-Index: AQHbIAN1oFdO6tLnakyuUJvS7GzXs7KS9gSA
Date: Tue, 22 Oct 2024 15:57:07 +0000
Message-ID: <21294B27-3875-41E3-9A81-A02A8DE8E66E@arm.com>
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
 <20241016193606.3459951-5-alex.kanavin@gmail.com>
In-Reply-To: <20241016193606.3459951-5-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|FRZPR08MB10927:EE_|DB5PEPF00014B8E:EE_|VI0PR08MB10620:EE_
X-MS-Office365-Filtering-Correlation-Id: 608f6af5-12de-419d-6e42-08dcf2b233c9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?b0NkTkR0WDEvd2ZIMXIyUTdEQ0VwQmFWdjdPdFZ0RDhLNWxKcU9ZUnJyUXlT?=
 =?utf-8?B?ck9CaFN5VjNPdTJ6QStxUTNIQ1IxTjh2d080WGxmTmZ4T1gvYTBtdGJKYjdX?=
 =?utf-8?B?KzhhNDdaMTJsQ1UzbFA0ak54NGFSSWV1WFF0YmtuNVRNM2U4RVU3SXBMaHFq?=
 =?utf-8?B?dUk5SEljdkJPUHdkNWZoKzRDY1hoWWl1WU5pQloyaVlRZHNHMzNTNm8wcTVP?=
 =?utf-8?B?cVB3Q3ZiMHIyNWNwdGRSNkgxcElJV0tGSE5oV3ZtVkErZmdGbnNtZWwvOUNQ?=
 =?utf-8?B?TzVKYXIyYTVEd2lLTTZ4QjIvZHRId01EblN6aFdZMVNiUnRVRnFUdktwQ1VN?=
 =?utf-8?B?NGhqY2hqSjJBUUsrOHR1T1BUWVJVWnlhVGFXcHZaZElxemJTaS9TcERkdjg1?=
 =?utf-8?B?TjR3RnF4ejJITTgxRERXcGRFYmM3bHlMYy9lR2dCODFJbHJ4QTVOeDhZTXU5?=
 =?utf-8?B?Q1d4dFJ5UnJDV2JsRUdRUXBDdzF5NlVzaGpib2IvRUNPb1dFN21PYjdiUmpU?=
 =?utf-8?B?RXdhVVZ6eUMyK2s4djRBQlNjWGw4ZFNpQ3F0OER3elI0WmQrNFlOc2tMWW9R?=
 =?utf-8?B?U0dBS0NoMTF2T1pyN2lKckZCc3haeEJvL010RStNdUhoV2EvaHA3MmNUR2l6?=
 =?utf-8?B?TkFsbjJlamIrYTB5YkFtNWNpajRPVENSQ2JRWVJWUmtLblBZclFwdFBUVU43?=
 =?utf-8?B?ZitzZFhBMjErbXUwVEhXMGJJKzF4enVSSVVFdWRzMXdmemQzV3Z3bm1tbzRG?=
 =?utf-8?B?MEpUKyt1MWEvOWdFa3cybVV2WDlGY1hVQ3BoUk52RjN6SEYvUWl2T28wZVVB?=
 =?utf-8?B?UlVNTkpDa1d0Zk9VaXVMZk50N0FXajBlenZyL2lrVElpMWhZUEZyMUljSGoz?=
 =?utf-8?B?OFVvTnF5SFBySUNsV3R5R0U2TllTYUxacTN3M3FlbEM4aEtpVElDU1JIT2x2?=
 =?utf-8?B?Sng1eXhyZERTV0FSMmZIZjRYOVl1eWxDZmZTc2ZxcmVKdTBFbnhpRGtLdVg3?=
 =?utf-8?B?alUzcHBMNmp5dHVYdFBjUkxuWmxzZjhoY3kvYWFnZjh2UlNWMkxzNnZ6OGIw?=
 =?utf-8?B?MjN0TGNwM1FmUzgwY1J4c0pBN2VKWVhEQmdpTWtuQWhWMkxINys1Q2pTdmZh?=
 =?utf-8?B?bUFRdnRHVHNYRGw2UStvcFdHVDUvdU9zN1k5clpCRktFbHlPdWxiR0VEc1pL?=
 =?utf-8?B?RkE5S1RjMHFDS1lwYWhDU1JUUG9Fb0R5dFRiYXRFRXJmd1FPWXMydSttWWJR?=
 =?utf-8?B?cjg4WWRhUzZ1Ym0vbmZENWJkcG1KR0hGV1pYa01KZlk5RkljYmtHK091OTFJ?=
 =?utf-8?B?eEZqemFVSStIUithNUVtZTJtMUFSR0NpUmgySDc2VFhiYjZiZCs5YlhCTldj?=
 =?utf-8?B?MGlBMnhRMlROTWVVaUdKNlRkaGFWbzRaOTBqUnlzR1psVTdQaFN3alhaVGEx?=
 =?utf-8?B?SDB4NXA4MjZmNDlSRjJCbjBFV2JPUzVaZ2t6SFFaZ1h5aFVJU1pRR0RpVkpj?=
 =?utf-8?B?L0xOZnkrNVM0Y25NM3AvZFdROVBXb3JiYi9ub2h4MFJBbGdaTFBhWnNUNERX?=
 =?utf-8?B?bVYxOFJqNmloaWtrbEZTbzZuUVM4ZWMwNjRPeGtlamQyenRPUElBSmNXRnFl?=
 =?utf-8?B?V21USXAvZitsYnVFRFhsK0ZuUVZIV3JaUWZPVlVRUzNYenlNUWg1UHhYN2Nv?=
 =?utf-8?B?WFVyWjRGeXVia2M1Y2RsdzBsazFlQnZBeGxxTFl0TmJqMWt1LytkVXFQeEJZ?=
 =?utf-8?B?UDhnUXg0d3NQUFJzaG9XNHA5UXVwUFhTUGhCUDkwK3ErQ1g1MFFmNlU1c0NR?=
 =?utf-8?Q?A2kSf0cW+47Au1v6+8fXIIjyZOUQ07/3DsaS0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FA4DCBF8C044944914C0F6417D17018@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10927
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f49236c2-fb3a-42e7-d0e4-08dcf2b22e7f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGxqcVQ0V2Jyd2RDRWhFbFZybldiZUZyR2hjcFYzYWFyd3A4S2E1UG11ZFh4?=
 =?utf-8?B?YXp1NUFtVnluZXhLbUJYbXYxVjNEd0J1THZtQzhFbDFpZ3ZSamI3Z2pDMkNY?=
 =?utf-8?B?YWZyUHRnRlprWUE3M2N2QVRjLzY5T0JIZGFpajJZL3YyQTMvcnBGc2l3U0xl?=
 =?utf-8?B?SkkxYkp3S3lOVTlscFpwU2doRFRQMXJjU2V6U2ZsVmJPaVZtM04rb0owOWNC?=
 =?utf-8?B?bGFqUWVnL2szTmtaRzVDNm1ITW5zeFVlWWxjeUpQTzQyQUZqdkVwamU0SGxs?=
 =?utf-8?B?WTFmVTlta0xUaFlibCtYMXdheUlieiszYlhOL09FZ3M0NzNITDZiSXNOaExk?=
 =?utf-8?B?Z2ljUTljQjFyNmJxOFJIYi96ZUFJQ1g1RXZJOGpQdjk4eVVQMzc4dXNaNUkx?=
 =?utf-8?B?c3NETW5GRlpXUUhidm1PNCs4Wk1rck1RdGNoaFVEZ0g2bkdJVFA5WDBWSG5h?=
 =?utf-8?B?aTJsOFF3ODkyTGlUb3lnTUhCWFF6TXNzcE5Ca2h0SUkwZGlEbThSd0E0a1V4?=
 =?utf-8?B?MUpxbnQ5VjlpTktUOEdRaFhLZUNLSGNyM0xxYzBOYkV6NGN6bzdVYTdFOG1Z?=
 =?utf-8?B?R2hCdkhBU1JGMUhjTXlmdGVJU25nM0cwOGpmNmN0czlONnhhRXlMampMOTIz?=
 =?utf-8?B?Q3FsL2JsUUhZbktCeVU4T0llVkJZd0lGWGRCZ2s3cG5oTEhIdER5bm1XeUh3?=
 =?utf-8?B?bXRoK0dWSmY1cWc0YVJ2ZXBETTFwWTdVTzVXUkVBd1ZyRUxIZzdPSG96TW9u?=
 =?utf-8?B?cm5Hdmp2a0hhUXRQZmZ6ZmdoYXhhNlhUT2FvYkZPdEtyOUFKSUMxSGxRb3Y1?=
 =?utf-8?B?Z0VidHRCNTlDamZndDNTYUh1WGxMYnhTN2ZNZE5KNnZoTk9JMG5YVnh6TkFr?=
 =?utf-8?B?eVhRUlBFaVZFWXdJRFRmZ1RhdXZYeWt0TzlyQ2IzdEFyZm1oNUEzR2JpWWdD?=
 =?utf-8?B?dWdMaWdBQ0t0KzJFSDNnS0toM1pYWGIzZ1RNQkdnakdIcTVFRTgvWXVMSUdE?=
 =?utf-8?B?a0luTTFxQml1ZzVlNkF3MG5sRVAyK05CWlQ0c1htZ1ExRSsycnpxblVkY1Jj?=
 =?utf-8?B?eE5MMmVXWUJpMWd5NEFYS3ZrdDE4ODNzb2xwbisrNW9rbm1NSWE2K21ZZFM1?=
 =?utf-8?B?OUk2bVVORzRpWDFOK0ppc2psTG1GV0tEWmJqMUI5Tk5iZ1c0Y0pnQ0syaWVT?=
 =?utf-8?B?NDVWNWVwNnZKTDlFUUdZeU16NnJmaFk4OHZnRVBKdzlwaHVoaW9ybXhnSFRN?=
 =?utf-8?B?VGNoL2hZazVQb3dyZHRDOGxkTWkrM0h4VGlZdVhIamRzbFk4UXU1dHJOeGhx?=
 =?utf-8?B?LzMrKytYN1JlK1JabG9Bb3B6bENPc3gxczF3TFplc280WFB5WFJsOCtoOENL?=
 =?utf-8?B?cUVnY1FPRmpVeGxMcXhpUWlpL1FWUVhsUFI2WGRqbGtITXBVWnR3UHd3cnBF?=
 =?utf-8?B?dnowYm5za0hlRENzWjFtVGxjZDhOWHNqdGwyaUtxZzZ3YlM2aEFKYlBZQ1BZ?=
 =?utf-8?B?YUtCNzA4SDhkZlRRZ1hrMllHa1E2dWxKd3d5dkRGKzFlZlhGZWEwL3I5UDQ4?=
 =?utf-8?B?MzkvZ3dMVnJaT1FnL1pkcFV1MXg1Um1lMjJRK3dKb2s3b0ZhZ3M2ekZBcVNB?=
 =?utf-8?B?TGlQU1ByMUdvdGFSWkhZQWNnVmgwbFYySkJFT0dwRnNIWGs0VFUwRFJFNytU?=
 =?utf-8?B?bzY0b1hldXl1cHQ0bjh3c05xenNaVkJMS2s3aWNIdVdqZW81VnRGM0JNMm5v?=
 =?utf-8?B?V0ErSlV2VTRmNGFJejZWMk1OS0g0ZXAwLy9PNlVqbE9lcWgyZGV0c0F5Q2Zy?=
 =?utf-8?B?RzVITGZTdjd5Uk9pVnRSeHJka3YyVjNSZFI0dUhrV0dnMC9VaUE4a002WVFC?=
 =?utf-8?B?TjRBaElPdEdhb05zZWhQWGtaQ3hXSnV3SFpSSjhNOHU0Z0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 15:57:16.6551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 608f6af5-12de-419d-6e42-08dcf2b233c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 15:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206159

T24gMTYgT2N0IDIwMjQsIGF0IDIwOjM2LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy9maXgtYXJtdjUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMvZml4LWFybXY1LnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQoNClByb2JhYmx5
IHdvcnRoIG1lbnRpb25pbmcgdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCj4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy9weXRob24zLW1hbmlm
ZXN0Lmpzb24gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvcHl0aG9uMy1t
YW5pZmVzdC5qc29uDQo+IGluZGV4IDI5MmM1YmJjNWRhLi40YjdmOWNjN2UzMyAxMDA2NDQNCj4g
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zL3B5dGhvbjMtbWFuaWZl
c3QuanNvbg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvcHl0
aG9uMy1tYW5pZmVzdC5qc29uDQo+IEBAIC0xMDMsMTcgKzEwMyw2IEBADQo+ICAgICAgICAgXSwN
Cj4gICAgICAgICAiY2FjaGVkIjogW10NCj4gICAgIH0sDQo+IC0gICAgIjJ0bzMiOiB7DQo+IC0g
ICAgICAgICJzdW1tYXJ5IjogIlB5dGhvbiBhdXRvbWF0ZWQgUHl0aG9uIDIgdG8gMyBjb2RlIHRy
YW5zbGF0b3IiLA0KPiAtICAgICAgICAicmRlcGVuZHMiOiBbDQo+IC0gICAgICAgICAgICAiY29y
ZSINCj4gLSAgICAgICAgXSwNCj4gLSAgICAgICAgImZpbGVzIjogWw0KPiAtICAgICAgICAgICAg
IiR7YmluZGlyfS8ydG8zKiIsDQo+IC0gICAgICAgICAgICAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlU
SE9OX01BSk1JTn0vbGliMnRvMyINCj4gLSAgICAgICAgXSwNCj4gLSAgICAgICAgImNhY2hlZCI6
IFtdDQo+IC0gICAgfSwNCg0KV2FzIDJ0bzMgcmVtb3ZlZD8gIFRoaXMgaXNu4oCZdCBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UuDQoNCj4gICAgICAgICAiZmlsZXMiOiBbDQo+IC0gICAgICAgICAgICAi
JHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0vY2h1bmsucHkiLA0KPiAtICAgICAgICAg
ICAgIiR7bGliZGlyfS9weXRob24ke1BZVEhPTl9NQUpNSU59L2xpYi1keW5sb2FkL2F1ZGlvb3Au
Ki5zbyIsDQo+IC0gICAgICAgICAgICAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0v
bGliLWR5bmxvYWQvb3NzYXVkaW9kZXYuKi5zbyIsDQo+IC0gICAgICAgICAgICAiJHtsaWJkaXJ9
L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0vc25kaGRyLnB5IiwNCj4gLSAgICAgICAgICAgICIke2xp
YmRpcn0vcHl0aG9uJHtQWVRIT05fTUFKTUlOfS9zdW5hdS5weSIsDQo+ICAgICAgICAgICAgICIk
e2xpYmRpcn0vcHl0aG9uJHtQWVRIT05fTUFKTUlOfS93YXZlLnB5Ig0KPiAgICAgICAgIF0sDQoN
ClRoZXJl4oCZcyBiZWVuIGEgbG90IG9mIGRlcHJlY2F0aW9uIG1vZHVsZXMgdGhhdCBhcmUgYmVp
bmcgcmVtb3ZlZCBpbiB0aGlzIHJlbGVhc2UsIG1pZ2h0IGJlIHdvcnRoIGxpc3RpbmcgdGhlbS4N
Cg0KPiAgICAgImNyeXB0Ijogew0KPiAgICAgICAgICJzdW1tYXJ5IjogIlB5dGhvbiBiYXNpYyBj
cnlwdG9ncmFwaGljIGFuZCBoYXNoaW5nIHN1cHBvcnQiLA0KPiAgICAgICAgICJyZGVwZW5kcyI6
IFsNCj4gLSAgICAgICAgICAgICJjb3JlIiwNCj4gLSAgICAgICAgICAgICJtYXRoIiwNCj4gLSAg
ICAgICAgICAgICJzdHJpbmdvbGQiDQo+ICsgICAgICAgICAgICAiY29yZSINCj4gICAgICAgICBd
LA0KPiAgICAgICAgICJmaWxlcyI6IFsNCj4gLSAgICAgICAgICAgICIke2xpYmRpcn0vcHl0aG9u
JHtQWVRIT05fTUFKTUlOfS9jcnlwdC5weSIsDQo+ICAgICAgICAgICAgICIke2xpYmRpcn0vcHl0
aG9uJHtQWVRIT05fTUFKTUlOfS9oYXNobGliLnB5IiwNCj4gICAgICAgICAgICAgIiR7bGliZGly
fS9weXRob24ke1BZVEhPTl9NQUpNSU59L2xpYi1keW5sb2FkL19ibGFrZTIuKi5zbyIsDQo+IC0g
ICAgICAgICAgICAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0vbGliLWR5bmxvYWQv
X2NyeXB0Liouc28iLA0KPiAgICAgICAgICAgICAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01B
Sk1JTn0vbGliLWR5bmxvYWQvX2hhc2hsaWIuKi5zbyIsDQo+ICAgICAgICAgICAgICIke2xpYmRp
cn0vcHl0aG9uJHtQWVRIT05fTUFKTUlOfS9saWItZHlubG9hZC9fbWQ1Liouc28iLA0KPiAgICAg
ICAgICAgICAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0vbGliLWR5bmxvYWQvX3No
YTEuKi5zbyIsDQoNClRoaXMgZXhwbGFpbnMgdGhlIGJ1aWxkaGlzdG9yeS1kaWZmOg0KDQpwYWNr
YWdlcy9jb3J0ZXhhNTctcG9reS1saW51eC9weXRob24zL3B5dGhvbjMtY3J5cHQ6IFJERVBFTkRT
OiByZW1vdmVkICJsaWJ4Y3J5cHQgKFsnPj0gNC40LjM2J10pIHB5dGhvbjMtbWF0aCBweXRob24z
LXN0cmluZ29sZOKAnQ0KDQpJcyB0aGF0IHBhY2thZ2Ugbm8gbG9uZ2VyIGJ1aWxkaW5nIG5hdGl2
ZSBjb2RlLCBvciBpcyBpdCBmYWlsaW5nIHRvIGJ1aWxkIG5hdGl2ZSBjb2RlPw0KDQo+IEBAIC05
MDksMjIgKzg2NywxMiBAQA0KPiAgICAgICAgICJzdW1tYXJ5IjogIlB5dGhvbiBJbnRlcm5ldCBQ
cm90b2NvbCBzZXJ2ZXJzIiwNCj4gICAgICAgICAicmRlcGVuZHMiOiBbDQo+ICAgICAgICAgICAg
ICJjb3JlIiwNCj4gLSAgICAgICAgICAgICJjcnlwdCIsDQo+IC0gICAgICAgICAgICAiZGF0ZXRp
bWUiLA0KPiAtICAgICAgICAgICAgImVtYWlsIiwNCj4gLSAgICAgICAgICAgICJodG1sIiwNCj4g
LSAgICAgICAgICAgICJpbyIsDQo+IC0gICAgICAgICAgICAibWF0aCIsDQo+IC0gICAgICAgICAg
ICAibWltZSIsDQo+IC0gICAgICAgICAgICAibmV0Y2xpZW50IiwNCj4gLSAgICAgICAgICAgICJz
dHJpbmdvbGQiDQo+ICsgICAgICAgICAgICAiaW8iDQo+ICAgICAgICAgXSwNCg0KVGhhdCBkZXBl
bmRlbmN5IGxpc3QgY2hhbmdlIHNlZW1zIHN1c3BpY2lvdXNseSBsYXJnZS4NCg0KPiBAQCAtMTE0
Nyw3ICsxMDkyLDYgQEANCj4gICAgICAgICAgICAgImNvcmUiDQo+ICAgICAgICAgXSwNCj4gICAg
ICAgICAiZmlsZXMiOiBbDQo+IC0gICAgICAgICAgICAiJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9O
X01BSk1JTn0vbGliLWR5bmxvYWQvX3RraW50ZXIuKi5zbyIsDQo+ICAgICAgICAgICAgICIke2xp
YmRpcn0vcHl0aG9uJHtQWVRIT05fTUFKTUlOfS90a2ludGVyIg0KPiAgICAgICAgIF0sDQo+ICAg
ICAgICAgImNhY2hlZCI6IFtdDQoNCkkgc3RpbGwgc2VlIGEgX3RraW50ZXIuYyBpbiB0aGUgY3B5
dGhvbiBzb3VyY2UgdHJlZSwgc28gdGhpcyBkb2VzbuKAmXQgc2VlbSByaWdodD8NCg0KPiArQ0FD
SEVEX0NPTkZJR1VSRVZBUlM6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgXA0KPiArICAgICAgICAg
ICAgICAgIGFjX2N2X2xpYmF0b21pY19uZWVkZWQ9eWVzIFwNCg0KV2h5IGlzIHRoaXMgbmVlZGVk
Pw0KDQo+ICsgICAgZC5zZXRWYXIoJ0FMTE9XX0VNUFRZOiR7UE59LWZjbnRsJywgJzEnKQ0KDQpM
b29rcyBsaWtlIHlvdSBtb3ZlZCBmY250bCBpbnRvIGNvcmUsIHRoaXMgc2hvdWxkIGJlIG1lbnRp
b25lZC4gIElzIHRoaXMgYW4gYXR0ZW1wdCBhdCBwcmVzZXJ2aW5nIHRoZSBuYW1lIGZvciBjb21w
YXRpYmlsaXR5PyBNaWdodCBiZSBuZWF0ZXIgdG8gaGF2ZSBpdCBhcyBhIFJQUk9WSURFUyBvbiAt
Y29yZSBpbnN0ZWFkLg0KDQo+ICsgICAgY3AgJHtVTlBBQ0tESVJ9L3B5dGhvbjMtbWFuaWZlc3Qu
anNvbiAke1dPUktESVJ9DQo+ICsgICAgY3AgJHtVTlBBQ0tESVJ9L2dldF9tb2R1bGVfZGVwczMu
cHkgJHtXT1JLRElSfQ0KDQpEaWQgdGhlIG1hbmlmZXN0IHVwZGF0aW5nIGp1c3Qgbm90IHdvcms/
IFdvdWxkIGl0IGJlIG5lYXRlciB0byBqdXN0IGNoYW5nZSB0aGUgc2NyaXB0IHRvIHdvcmsgaW4g
dW5wYWNrZGlyIGluc3RlYWQgb2YgY29weWluZyB0aGUgZmlsZXMgZnVydGhlcj8NCg0KUm9zcw0K
DQo=

