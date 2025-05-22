Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD26C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:55:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.53])
 by mx.groups.io with SMTP id smtpd.web11.20466.1747907742756182241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 02:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hjHb83Ey;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hjHb83Ey;
 spf=pass (domain: arm.com, ip: 40.107.21.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=muY64Raweoyi7POtDvFJXzmpVJNEbnGQ4wyb7m6xnJjqPckmqyc02fdpWNKz76boAx8nC8Q/+DXTPpnEaEkcUXvVHuumjbfNd0PYL2fotM/yte5rNZshJIk7h4/lYwqAwaMSc1j5WL+Oh6tz81aHNnhOwstLZPJSk2EQ4bPTwG6eY5woc1/rVRRAgY65RxvKSpLS426IAiNvR2//oKOK4QcexuWu2FRPKF27T4KEokeYxEb0NhjVc83IGcmiZAI7yaClWK+nZKc+bsYrC4EShY6JL8OFETdnLtDuvcYEWtybydP6pgT5wSd38EtkwzP0Us3FlFICJfiS4budRnZkqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onJhxnRuuevbUbHA+PqczWYwFfeCUvTnIgvouFjk2nQ=;
 b=QXsc6rmp6VR1DAyVTZmeayoyuPX93BrVRA6M0fCD4MU5N/fkhVNhKH+WbG5/3du1pXLbc+ZDlRKitl9dq/rIBIiTcbfI74PBXxB20VMgh4DY5HrpR2vJxsHashF/mpVw4XYBvPvsRT0CXl1dU8J3BAoUMq6jEZeSlKKAwVqBSUpjbGDfLu7aA9H8YItXnHWDvjApC7O4wlw15jMQtzicsLTdPSC26UtCH7tmWbaZxEyl/E39HY692N9DrjpNRhWcbNMxc0GqKxP4A6wSYTx3dEa2eVQ/W1FPxTt9T464Xu+kVKoS4+NA1AHNKJE4t7NKlenYajuS5VbDqihHX753GQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onJhxnRuuevbUbHA+PqczWYwFfeCUvTnIgvouFjk2nQ=;
 b=hjHb83Ey9Te5apyG+7A8MIOpb8sSblBLNQM5QINFAzISJmakACHQtggPupjlWSyJg5R1qZ37g+Par0q1WY7xpNRdkPb6G3HTSKrmZPI72dji9UkWaV3f6IDm1tADIYpy83XRoyl+njkuOUFPdWZ6WfaxsGlLxmkWhWEq0K4qe5I=
Received: from DU2PR04CA0154.eurprd04.prod.outlook.com (2603:10a6:10:2b0::9)
 by DU5PR08MB10659.eurprd08.prod.outlook.com (2603:10a6:10:51b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 09:55:39 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::b7) by DU2PR04CA0154.outlook.office365.com
 (2603:10a6:10:2b0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Thu,
 22 May 2025 09:55:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 09:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnMCoqizpcvhM7d1GqLD4AT9XYjgm/KSfaz+qpSak6DtsZvxNUqNVxwBPXohIxCDWHD3VAI7hIv3vnCcWNCEUtxkwapZfZnhG8TADiS/rgsj5OHJVwX49R+9m0plsd7cfzxYsfkIk/Z/zK/YYY2Xxq8dvYsJk5zvnCnc4IFEawNDltG5aJ4FbCePZFcGbler8u2q0z1G7CbC5gtFH74BwyHEUWaTVkl7F7Tu78OH3dlsaCuU0THJVffQaqoguiND0irqEHdQUcBU81FaUUKwJooncfwUpu1BfuTqqaRPjx44FgMMf2qgzV4shuNNZ/emBOpqHzXmATEbOnibeOGIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onJhxnRuuevbUbHA+PqczWYwFfeCUvTnIgvouFjk2nQ=;
 b=f/cFowLEbJV7ICr7e4eHWw4EXEoTyX3M+dSjfboAuvobkrjpDNRp+NwvDsu9c0edoJOKIXtQ7Vr5YOoARzwH6X2pRNf6mD1FI/aD/lwlO17Yv9ek1re1G/5ZccoaDaOm1NdAJXYW8wXUNMY0fjr9qRhyAJ79Z6KH79IwXBB/ZPjyK3gVo3ZpGcEzLgCVMqX8oVoo1SJC7MjxjB3Zjh7NmYR+rkJI+VTOwiLQyQDg0iHq9TAivECUtXV+nF0uOMdX5GigObuYS9LoqZi1n13buQSsMLAhgxLLjwbApDJ8fOGiy+88ZCO2xpkhYyaJmNLuh6PnQ9oGLyR5A6aZHU6M0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onJhxnRuuevbUbHA+PqczWYwFfeCUvTnIgvouFjk2nQ=;
 b=hjHb83Ey9Te5apyG+7A8MIOpb8sSblBLNQM5QINFAzISJmakACHQtggPupjlWSyJg5R1qZ37g+Par0q1WY7xpNRdkPb6G3HTSKrmZPI72dji9UkWaV3f6IDm1tADIYpy83XRoyl+njkuOUFPdWZ6WfaxsGlLxmkWhWEq0K4qe5I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9836.eurprd08.prod.outlook.com (2603:10a6:20b:603::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 09:55:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 09:55:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 11/28] vulkan-samples: Disable
 overriding-option as error
Thread-Topic: [OE-core] [PATCH v2 11/28] vulkan-samples: Disable
 overriding-option as error
Thread-Index: AQHbyhiu0u1myUVoSEahlqTrYmxwpbPeavSA
Date: Thu, 22 May 2025 09:55:07 +0000
Message-ID: <BC7C69FC-ABCD-4A5F-9405-BE36F857F193@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-11-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-11-db97c2eb3756@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9836:EE_|DB5PEPF00014B97:EE_|DU5PR08MB10659:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a99530-5a5e-47a6-439c-08dd9916cedd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?SYc/NOgU27+Rs4WxM4SOtq1UYtc4KmOnR64G7mZ/DNXf8NK1MAM8pqzn/JAL?=
 =?us-ascii?Q?jPEm8uDT7ct7hHL7ShBH5CIIIsD+EX4Ma/APVSIB6A+TxS5wVqQQtrWYSqHE?=
 =?us-ascii?Q?VHYk22IjroZSKdku0D48JKW4I8nbeXbxYqCjqxQtnx+IL8h+E65uyeLo3fA5?=
 =?us-ascii?Q?+yLStbB6sVmamzZ++UHKFe/+3xFrjKXgBbAfoOmXRdi3Kk9rc31bZA36gU0j?=
 =?us-ascii?Q?0PoyTPoJoKLHVQPpfIEPqxW1u4mTzLnjWe6y+Z5+Kfy8OZuCvCfs3wwH7rl+?=
 =?us-ascii?Q?1wqpbIwnaFX0/D9SUmLRPffNK1Xdct+3R0Szvz8Egbxq31vJc9cODnuG7MUg?=
 =?us-ascii?Q?Olz5Hn46uXmum2PdSy/cHNLWnKwissqK6/PRtAZjYR4YYdOyCmrB9EtEsrJw?=
 =?us-ascii?Q?n/O1ymqdhIoc6j8eXUGqhIsN+UERHOVXJUP+USXs5Wjwq1hp6PLLbamsjFTA?=
 =?us-ascii?Q?eeleO6JT3tLKle5lji2OVcmozHAzg5mLUO7/lRIQ4vBpPkeOvn5hDToPCNDf?=
 =?us-ascii?Q?ro541VP048uZK9FfSu4P5+SuViFJzyvRbmTA+WXpVhA9bFJXsbhD9/FZhHEz?=
 =?us-ascii?Q?QSIxbs2PD5JqySCJjXnv9oQFJ7roVueWiAh2JHoLIqvQfq+PZPIwt5NnMNSa?=
 =?us-ascii?Q?Ay2I1DVNZ8yvQL5wNfqoyLHLCN66IA3bu4rFMbdRdoHo4rhnjtMAFjA0EV+L?=
 =?us-ascii?Q?fdzu+v9EQLbNpX0LcWTh01ovuPQM4pWcqxNCbP/Um176EBkzOfPPnp9N/eUO?=
 =?us-ascii?Q?oAREc3tSnfl/2KreFpC7FYvmGWUYopVxvlKnftaDjWITtJ57W48m1+L8VcRx?=
 =?us-ascii?Q?dXzPPv8QIcG9DHToOUFFkgVPCngrLY/KJITjWNwAGYee+biILvFtUiR1Hmem?=
 =?us-ascii?Q?HcaRGrDRQ+WfU7KKDXgQ/KpM/B3R9b7L85wrEVi+z2N1VDg1IS9kht2tUXbA?=
 =?us-ascii?Q?hKiaANaFOoWvWYxn1ebhaq2CuaUgZ3s6vkAlReM19jY7t5Db+j53jzcYB+Yo?=
 =?us-ascii?Q?P/Syw7SzyROADqHLJZhnJdMjokGi0Jr9cHv4qhEQ9GwwcFWf1uUZEPilg3i6?=
 =?us-ascii?Q?zqh2p8KahSqIGHd2WOVdg9x1f+KhuVTEsPmQ9mvcTxLScR6AaglarcQCqeud?=
 =?us-ascii?Q?Ul6QFk1AYknlMDwxlcagNk5HihYrA5DdeeAoTVFY34ddsMXhnCc2FSGrANin?=
 =?us-ascii?Q?brX30JPRQz1k7NfzrZgel59NnemxZD3zJZo8FN61cijI90pWid/kL6YM8kX3?=
 =?us-ascii?Q?bglNGtbzSTmVWr8Fa0VWisg57Qe9bGtbPpuRLMF7hIJjmoSMVqdtZA76ul19?=
 =?us-ascii?Q?K3c+NQhDV2oesOfmPJt4uLemrzWl586VWG02cEkBDw3eZJsZ1Mm1a1QYCPuD?=
 =?us-ascii?Q?YGBaoE/dTW4m7DBidrN5ltkr+5ld4q3hTT7+NFTx9TThP1ETp8Akp0El7Ex+?=
 =?us-ascii?Q?36NQmbGL+nnJ8uuRT19iGKTlchPtPgRwfR1mnCgx3u2+FDr1Dydl9Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD004F9B95A0454B86591C3652CDA29D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9836
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1f7ae905-d9aa-437b-2b8a-08dd9916bbc4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sqTh96ttSGRJ9f4I71xBMm41jBwTZInYVXb+i0fq5EhLz+GJuJXEvfxPPTCl?=
 =?us-ascii?Q?HcFEuxwtf4WWn9qlO0g9kjrbLqvcgFk77oN/dVmLRSISmmrntVv6ioHbYQJf?=
 =?us-ascii?Q?JqT9F2hHz1fKaAVn/1VHT94TWUtwKO5Hq5Nf0QJMF1/iEeISI+8/JDrJOOFs?=
 =?us-ascii?Q?m0HmeMw7bYwegXrw1ORrV4EGHbocsjPwcAoqjqI9NPGa59jnYpYCBEQsCmd0?=
 =?us-ascii?Q?0iqXqoujPIkKLPNdqhZATF2na+fvJLyF9phPDYyEj2Ds/RX4EyB7QVjNsnJi?=
 =?us-ascii?Q?LcA/kO50f36sA1Ryam0w4Q+GWh+7bKRQh7LhQyO8sGrIMKIjCytNksxgKP1+?=
 =?us-ascii?Q?C4vHBPkfTmcMZF6SKCzEMEqvvuHpQKhr7i8CAWYr8oNDtO+5viBi6lCqFfoQ?=
 =?us-ascii?Q?EKHidqKAdg8nYsUykFaOnUeB6VcgCW31qdZT7GKByud768sbsxsmEf6yk3F2?=
 =?us-ascii?Q?gPZdGAEyhvgzjcIfNJXT2p0yb7CsII7o9OvtKpTc+LhqrlZLLsQ0rD+nM+vY?=
 =?us-ascii?Q?mtbF1nRAq3sYAA0JlzAjzLotUeC6B7SA0lcVHnVvbWCNJz1DMAkw8gmiXMjx?=
 =?us-ascii?Q?iyEl3Zb3s8LeplwghOwRHfTEke3ievjrLwEbCIQh7hLvNLpfMZOczFEV1yjr?=
 =?us-ascii?Q?mgQdpmsdfVnGF+EwHrqy+8RLGDf27nknLTrksn+LYLYmAYzMzc/q3lvJWfbn?=
 =?us-ascii?Q?sM2QhH2DatpaApSZ5bpAlyompTwPGKMScmWlFg+sn5wLvWkEmD71gCJy5PaY?=
 =?us-ascii?Q?n2+3IZH7tuXCFs9aqim75B28L7HN5g0K9cOKe4GaGZ6GL4Q0RHYJnhQItwHd?=
 =?us-ascii?Q?Mbdv8yyEooBT6cxgGJA1U7dgt6LV45du6O5JboSnaBreQW+7425JJYt0xqcS?=
 =?us-ascii?Q?68mjZR74TFY8ulsGBgCL5qVE7TEi+cN4aqlywMEe2ZwqTVGcnZeFG4DfGwnu?=
 =?us-ascii?Q?L1dUOiShNyePsd+9pB1GELFQZ5GfEpedE0mPzTF/BQjC0GkJu3+0MbrkHEea?=
 =?us-ascii?Q?BkYlK4WFO9GH7ITGz+No/OdppzdfNey+sOAKBF/S1K34f2bdIgVx6O3AvHRg?=
 =?us-ascii?Q?xQj1B7f1RJOQO7sRgk1HYpmTG/MJJtxau0EGxtT1Rqo5OlvhFuHbOJQg9TCz?=
 =?us-ascii?Q?6UzotWQWVPDV1X8KiE/BDwQknjKQdys+QpuUtHNMVNbMnG0CZuLXBMDT6OSd?=
 =?us-ascii?Q?Xwfb8nC9P1uzyxknResbMfVjv2qJsY2h53Ej9SdqRUswujzzIyiSz00C37Mk?=
 =?us-ascii?Q?OeERUO1Boz086TR7fz/0lB4hzVsTxXCGiGyrevglSRtgLSOsW/k3NUNP8zrO?=
 =?us-ascii?Q?xFz+ELrXUZEVpo3O+edhilwKvy3xtkA5BBlCfTgrYBMn0sIfiV4IHNRjBR7Q?=
 =?us-ascii?Q?cbZvx6sstus6exl0cnWKNywqe4jXamlWB/q1KCuM8IpiWpASBVy3Ho1OsGwc?=
 =?us-ascii?Q?xXJde3tis2h1nY3Bmtw+Xk5Awn/v6LsGHOjTnUccf0pq6PUhpTDREZw0KKEM?=
 =?us-ascii?Q?rj7C6CTuAvRulExxBCM6r+USWS0NabRMjpEK?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:55:39.4956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a99530-5a5e-47a6-439c-08dd9916cedd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 09:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217074



> On 21 May 2025, at 07:19, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> +# Clang is fussy about incompatible options on aarch64/x86_64
> +# x86_64-poky-linux-clang++: error: overriding '-ffp-model=3Dprecise' op=
tion with '-ffp-contract=3Dfast' [-Werror,-Woverriding-option]
> +CXXFLAGS:append:toolchain-clang =3D " -Wno-error=3Doverriding-option"

Where are these conflicting flags coming from? Feels like we should be fixi=
ng the upstream Makefiles instead?

Ross=

