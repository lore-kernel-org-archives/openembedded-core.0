Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3912EC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 14:46:20 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.86])
 by mx.groups.io with SMTP id smtpd.web11.12671.1741358770801501618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 06:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Gx87z6Bp;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Gx87z6Bp;
 spf=pass (domain: arm.com, ip: 40.107.247.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wA5safE7qCEC5bW6MxuMvMAUPt2YqsV1UyDhPi5AlYacYT4vV/g7ZUJyXe8l3skNyR7ZeeLD04xWodv5lxzhXzaw4uTJcg8inrXrqJ0hdp8Fs8cWRMh2cFoErQeNeFgr9SR+ZASiyfoGLRi8Halg+kLPju0F6t6LLONmKNf0WKTtSM0mdnxlpGml9RMkvaJ9BLZPdAz8jAewELyv1pM5DpOeJ++qZ5Da/kJb+yu4vdDacOgKkFLqFnEJsfcI97UxOKZsZ7UKCdDg0w5QCazvgQKha20QjsCobqsT2ewKr8EgIJDKQAjfTZnyLpiQA0pQeDBQmo7R8LXnTz0IlUmlQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhncTwQCiQM8ChB/03I6AFp7QL7O84hz/cn8hZXou7U=;
 b=X7R6kWO6Qu9VeadpHPlRJpQe3YfQqseXC0Kd2vrlO7xZ8Hnxu9ckXriJ3mQLwWPBpdGxictLdRsD8HeyHXYYe69D6UD7EZLTWYaqp9ebCPwvbwwfoyT0TSK01u1tVHQ9v2eNb0Kq16qgd9gxvId3AgYERjXPWW9u8vRD/DPjugfGyyTSXnY+TsBY/8e39dskUEOOc+uVoWe8a+hicUpnMupWRCS27TsAj1Pz43RSuZ84C3g8SxzQWHmtU3RDUJ7pm+OkE8zy6pN+5kXPUAgHl3YMlOC5bwjytuOLWCF+9Lmb+oZhNzcxNq2zvIA510ge4UGrYw6TIFKa+ju+00lRBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhncTwQCiQM8ChB/03I6AFp7QL7O84hz/cn8hZXou7U=;
 b=Gx87z6BpCQcaGcBjr2pIBUs4xV6w0VZIxjgmt8QiYMDh8i9KV5EQPUYAvO4UXOFnZwjUr7Hi5KrJn8pkAFydvuXvBxYvJQo3lyYUyp4KDpNVA7vWs9UKohiYpc2F/U2s59uHOV/kXQ5SCTmx0hAo87w/zt0xkMK7fD6NKs/LkVk=
Received: from DUZPR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::20) by PAVPR08MB9308.eurprd08.prod.outlook.com
 (2603:10a6:102:303::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 14:46:06 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::7e) by DUZPR01CA0026.outlook.office365.com
 (2603:10a6:10:46b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Fri,
 7 Mar 2025 14:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Fri, 7 Mar 2025 14:46:04 +0000
Received: ("Tessian outbound a60532193129:v585"); Fri, 07 Mar 2025 14:46:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 905b2cc09172372c
X-TessianGatewayMetadata: 4N2vNXJKIo4EXZq3Av75APNWh9UMTqjFTNz9nCC6ySGyjEU80NQ6PaIt6jWFGHd/zc8t3QkaM+IHwYm+jQROdmLfKc/F4H/O1Sxu0VtPDxUe1tsM20O48apZkE/NVGZ6IRTtYukWyPHU9+e+tLpI3PQIGX84NRdxeXGNN8h6vLQ=
X-CR-MTA-TID: 64aa7808
Received: from L8ddf0c8fc9d5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81F4759E-04B9-4921-886E-BF43BCE7D090.1;
	Fri, 07 Mar 2025 14:45:56 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8ddf0c8fc9d5.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 07 Mar 2025 14:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALgF9esqJJvQa3Pv9gC7v5lhDuZV6TxkRm32ppAiCSJ4VuGmsuUn2+clKuE1piA2n/dap9jg1UbN9BerwchSUjoBl8JUNV9hVXw2SDqw5hdeY/5vjXKkdIyVVHHTNaFvUGh3B9MGGH92dgnvvhtF2vcuIuMkkvX6WoUvTjfuLS6/4QOQZ2OjNujY4zIENToe1ep8crAx/oZpJwdQa4vPS3mzwTPJ/sDypfLslUk9kXVUY3rJQ48zmOBPZ/aY6uRDNHl4fLykhWf+3XLyVrY3rKnCovD/WCJNEuI1hOvTccES1j8esRb2gND45u3wjSzqlM4UzIwjoW4t84rTMvXrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhncTwQCiQM8ChB/03I6AFp7QL7O84hz/cn8hZXou7U=;
 b=kWi/jKTecX429MlEeDlKRWuqlzm+iuDmYacaS5duJEb1YvCgYiJtL7/C94ZoU/N1XZysafNojY7dYQToa0O9SsiMnk2IEjcca3H9QM7N3MhidK1ZWn+7/3/Sq4tjt4Ftk96pXaxDgLynFIdrBHxenPkpK/50XWxLG4gtVq9sCv6uKDtQTUwevbQSoyLnzxlnnSvTDL9TJ+eKzaLxWc1AGzz9Iwaj1OuTKzhNA+Ea380AuosNYgkQhA+wRBLUffGdOQ+pQNVAtg/qMB9QeiEVY89jYaMKTyjKErbl92ZjcgB5trSGCSAW6vlyB8EqJ1uULo6OPAkGFC74Hty1EyCfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhncTwQCiQM8ChB/03I6AFp7QL7O84hz/cn8hZXou7U=;
 b=Gx87z6BpCQcaGcBjr2pIBUs4xV6w0VZIxjgmt8QiYMDh8i9KV5EQPUYAvO4UXOFnZwjUr7Hi5KrJn8pkAFydvuXvBxYvJQo3lyYUyp4KDpNVA7vWs9UKohiYpc2F/U2s59uHOV/kXQ5SCTmx0hAo87w/zt0xkMK7fD6NKs/LkVk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8752.eurprd08.prod.outlook.com (2603:10a6:150:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 14:45:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 14:45:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>
CC: "yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto-security] NVD feeds update
Thread-Topic: [yocto-security] NVD feeds update
Thread-Index: AQHbjyRuz1wvESZ/EE+DVTgoLY74/bNnwOUA
Date: Fri, 7 Mar 2025 14:45:48 +0000
Message-ID: <418B0FB3-24A8-4B32-AA92-4A3D9639835B@arm.com>
References: 
 <CAApg2=SEGPm6ne=yxB9E_U=je_A4x7brancJF2BZ3nY01aS0qw@mail.gmail.com>
In-Reply-To: 
 <CAApg2=SEGPm6ne=yxB9E_U=je_A4x7brancJF2BZ3nY01aS0qw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8752:EE_|DB5PEPF00014B8D:EE_|PAVPR08MB9308:EE_
X-MS-Office365-Filtering-Correlation-Id: 59579730-9c1e-4a97-8001-08dd5d86c961
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?K2GeCNZAmOfphL9LkhETlk3RqFBGF4pd3eZQiXueVAW70oAbralWS5NARhAO?=
 =?us-ascii?Q?33QoQHLUJ5M8gvtwE47dWp3PkJfBG87inth4xLxlWt6ZyD69d08fBuGaKBGv?=
 =?us-ascii?Q?YqO8C234s4mOluf5GOjJ8QhkHZkmb+LCkbjpkkDvoUvXinnx3KXqkt5nPiBP?=
 =?us-ascii?Q?yyPW2lAIydvqPF3cfBznNkkGDHEM4TEFKF6O0fIwlogmpK93rVgj+hbzt1F3?=
 =?us-ascii?Q?KNpYB/FxQL9B6jqspR/SjSVXM2ClBl2VmZnONUB2c2by9tR4cHhdBymuhrpG?=
 =?us-ascii?Q?NW75L6n2WYnPa1FZx2tcivPMLtziWQR+1X0qsRX1B7ddz3JV3zi6hrkByhHT?=
 =?us-ascii?Q?2+4eito6Q9EsTi2ht1EiVNkBdSWDPx5NlHKy5L1W3JIFe6/5AHb1dAE2svd5?=
 =?us-ascii?Q?oPOlRpi6jiZKEWE+YFQwu/9zalOlzXy14orghPyyVPK2JHowhkrXTfxcNoLN?=
 =?us-ascii?Q?wJzYqjXCVTqG2ty0YkEs67KtovIfrcTMQhTfFTNE4XT8JEktcmuPD04HfIAE?=
 =?us-ascii?Q?OhWKqTTB5ia5RSKHr86l8pyyOIuE/q02fuyOml6xqnju03U8YJO5AhgjCRu2?=
 =?us-ascii?Q?AeDWo63Hvsxkz4Dg+K2IzkTL7Qwpac6X6Stui2qwAAgUyaL/DDzz4zylDQN3?=
 =?us-ascii?Q?hDR5BLnwu2nLhbRD6jbdOET66q4J3jbFVBX/k07jaHwqwNe31lByBs4r6cfL?=
 =?us-ascii?Q?AfTDZTv7n428w2DfTwDTUs4O72v07i8EHq+Hca6Ou2eNLZsTFrIMqQOhPUwT?=
 =?us-ascii?Q?HSU+TfypuJZrKKd643o4gCp77xAJxKOlGRS/y4s7t8dkQDl9pURBVoKj4vEf?=
 =?us-ascii?Q?wUWAoXCn9iBfSzCG29dgEZSB1D2UzAL00V+Z/4uPSl2O1PB5rBHiMuMMvDAJ?=
 =?us-ascii?Q?sHux383kyxtGncIc8T5xcnk0BsUbaEdSo7otKkPHYy9KyoM/xXAGBV1G5Jhm?=
 =?us-ascii?Q?FI/Bp+ns40HCsXvPfcrq0/yeGUv7FcKsPQZyH2yY4My2/kwIrAn7XbI+MwTV?=
 =?us-ascii?Q?ChFXgaMxSTbWeDMMU18v2lyYkGu2me0PUeW0I/uaaEH3R8UwtZWzKqr8rclE?=
 =?us-ascii?Q?FEHy9iRjtN23h9NHbIOEdF1OQMt7rg35Ec6Ta/9i2NmjwuMeAxOwjwvAUwOz?=
 =?us-ascii?Q?IMLVbY5iTb5CZHROqZK4ERtoPvzbHqndcYSzPi9PDVVled1Prtk1yo0PqeNH?=
 =?us-ascii?Q?Fj6Wmmi9Kmh6Xp41PSsxcuM5diJD7Uz8ghiNhdLCLE/PrvfrKHDIkkQ4MHN1?=
 =?us-ascii?Q?3a5JSFgd0ALh/jc2qhRK2UhQmE3mgve6qJ53symF0lQrexgUqEq9kPllgGzl?=
 =?us-ascii?Q?1bRWFoXGqboz6hKtWoJ9ToBY3r1u++EjKnhmeZhnamFC/CZsLUAQx3qD9NlH?=
 =?us-ascii?Q?0y+F3jX1EjBW/fQ2f7B+uax0/YOpNVPp1HIK8cdV9z/OmplrxOxnEOJtuAcf?=
 =?us-ascii?Q?54xQPwhlKu2f/bfJT9j/UMTUJ1z3ew3k?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B29AC267DD823F4E87DF76E32BA8798F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8752
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f667a846-5978-4a52-ca57-08dd5d86c04d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|14060799003|376014|82310400026|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p+sNNKnzFPQKB6rSj/ywckJefUroLWZn+6w9OjwmmVcTE2ce8sh72Mkj98tR?=
 =?us-ascii?Q?SABEAouoZOBRMFA+Pr/DNQ7JHdxErkCVBYMk8ReEYy/89mA5hC568J80C3Li?=
 =?us-ascii?Q?X3BF3jGRqxa6DTcuXkMViiR34X1nvLlQ07VXVcv0ujOc5krKsU/cQPceZVXW?=
 =?us-ascii?Q?JOd/ht8EfG+xOTID+Z2iq+gmW8Gnljzlb/GKPByvS9nS6ZN/dr3HCHwShm1O?=
 =?us-ascii?Q?H8W3pEalszZrB0yLL60n5oDGdFeMqdwhu+1O0Uw8Wtn0HLiNIJzdAr8mdzHA?=
 =?us-ascii?Q?jtO/REEp2bAym7vIQlDxxoMG+TmjSO/PGLPGDZuGYslllg1sf3qLwem0hdPo?=
 =?us-ascii?Q?BDQEfRJoD/xLSoEu+kD3ZGjwm290Nca0S5wpiPVvLEDY38Rkm5nYf07J1GTt?=
 =?us-ascii?Q?m9ZaW59awdmpGKETwhFLaamWNBZn40buWYETVk5RpQQtPvajf1sPA/bZg8Sh?=
 =?us-ascii?Q?C4zaRpn4Xcm4qS52YX3ZH9shUtllLlTefQpuOCtgaRLi/T+ehxNq+mreReQ0?=
 =?us-ascii?Q?AvSIQJxGlnARmGQzIX2x0QYvdGoiPMKqaBpvEpAm21A0okFey9qMrO4r5tHC?=
 =?us-ascii?Q?ljw3U+pISsjlyQyETrR/6fcXkvhJ9rzAVfZsSPle3P/jGN8H1nAmjUAXSNT7?=
 =?us-ascii?Q?S89AXLehZql88AGbq84iF4Js4F3QmOAu3mx96Qv4lF3sEjBpjrP8BYEo4yL7?=
 =?us-ascii?Q?UmVQYOu+gMzMHnGi7OhkpkOUgsv6S19x3oX5VCYJ3PWRdE4ZZewni1ON9MQw?=
 =?us-ascii?Q?yQ79VqPrWKStzu8NCzbgiXETCJNjrC5x4h+CPtOmdq0enTpCe/s2bso/smGa?=
 =?us-ascii?Q?dECzwYnfpmBgH5mCxVsTSvu7Kr8xMVQwo/D7r0Z2BcQK6MiriNZIqp49/ecE?=
 =?us-ascii?Q?YNRnXnoydUevb/2Ly5cmYHdsn2jka6tkQVX/jfE/EqYA9bgGCIW3VjvWygXq?=
 =?us-ascii?Q?5oG10Z3/WDmdjHGY2oXI97pXS7ZLXFcU1tWwYOddIwNgL0uMF7GVJzysu2dD?=
 =?us-ascii?Q?05aqGOm94o/8Bc3/T/DQ3cGaMs4fF/lzFJ86UBsVWBJo9q4ETiyUQwBU+EJ5?=
 =?us-ascii?Q?FdMwm3bK6IF2iAmNSlQm24UPocbD3pn/Ku+5rvtC/dRFOIUM7abZQtb60agq?=
 =?us-ascii?Q?MixK9ZEt45MfnmRU52fd7PhVhq/od6d57Ycm13l7aX4E9YRm3YESi7w50PJr?=
 =?us-ascii?Q?zcQsGn8snoIRFTq02tNO+Tmp/O+VEPjYoEwZEBcJp7bCLhCYuNBvfxxxWDAs?=
 =?us-ascii?Q?9tNoP5cczUqXY9yl7fpTDTXBq9bVX6W/xAtt6oI5bh/cZujg2BlI++ErgERy?=
 =?us-ascii?Q?6tc+dM9fhLJEG66n9sfl8b/skYBx347bVysqntUJGsyB+nW5xSeNAmXN6+4P?=
 =?us-ascii?Q?HqKQPqNjMxbhu4/OwPZvo744P970l+AquUjzRVRNFot12AN9q2FjTYbiIDaP?=
 =?us-ascii?Q?J96WJPtmho3ODPwHV8jFMxOHkTww6W383PBTgcXW7y6ZF1LpoxZKUd5W8xQa?=
 =?us-ascii?Q?qqcraWwFGqjtO6A=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(14060799003)(376014)(82310400026)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:46:04.2089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59579730-9c1e-4a97-8001-08dd5d86c961
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212447

On 7 Mar 2025, at 05:47, Marta Rybczynska via lists.yoctoproject.org <rybcz=
ynska=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> Hello all,
> This has come somewhat unnoticed, but NVD has changed their mind about AP=
I usage vs feeds. In short, they plan to bring back bulk downloads.
>=20
> As a reminder, the old plan was to move all access to the NVD database to=
 an API. The migration to their API increased download times of the databas=
e by a factor of N.
>=20
> Now https://nvd.nist.gov/General/News/change-timeline they are saying tha=
t they will remove the legacy feeds only when bulk downloads are available =
(likely in a different format). With no timeline.
>=20
> That raises a question about what to put as the default feed. I _think_ t=
hat the FKIE feed might be a safe default.

The FKIE feed certainly fetches fast (unlike the new NVD API!) and is a rep=
utable source, so yes I think so too.

Ross=

