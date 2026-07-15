Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BA4C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:20:37 +0000 (UTC)
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com [205.220.161.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8025.1784128832593602004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=Jrj4LvdW;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=WBw7HCTr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.161.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FDeQYY136804
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 08:20:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfeb2020; bh=
	BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=; b=Jrj4LvdWvT/9H3wJ
	eFMrbSj1H8fTaFrD7x8pvyenPus92TNuGbTs0A5BW6zCKgLq8iUW+lLP40r7WeSI
	RieqQRTwAou5etwm28qM33HYfmgg3dE38iRZBCiL25B3lGlQodEXNBeS0HzEU0U8
	QAlVsAmbehP8VynYUcUqh+F8O1tuRb+/2rswyxv1PWlgX1NGo8fn4sR4Ob+g+uZN
	mv4D5yDsq8NdUzud4he9brqLyzvYrkU5yppirJ4Dgku/heYvQhUPfmYwIRTsNCc1
	Q7UOmKibtkDdzc2GP9HJqPRXMroPlgzOXa0IQ35BdOkTfKnR2KklnT6JSF7wQDAR
	fi2kyQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4fe11ha1qe-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 08:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLZTwWaEUIwFBeNaTLEGfFjjFjcd5CgQYVm3lYaI2hOH1CqIa1KOv1BJymW1tkffeLbT9yTI6PsdiAAWDMLlXVC8C7eibL9vlQpxVcpI/F5fqxoTWHjgeugNlkifwGh4WzusM0PsGizVGosJuml2LLoBrNE5Lhd3rfb2b3pZC+lmVvK478d7n3zB/dLDaTB/knBO9FlcxholinfzI3yzeDhiDrW/2wb9ZYrXlcWkmnsW4hD5/Iz7jQPxsIp9DimwisgJLrEXELtr+Sf6aG5oytUKPaLfGIXQPLOPVo+Nmq+Vs0acflmgGzNTh4pp2UGkX6IKxaT4Vou4GXInSiRkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=;
 b=qdfPiEgyIMKjxxLaxuvLgFndHMbAUxciUR3VNYt8PYXdLPjkgeu0JtVyNsd5h8oPjzH9Eu8gVJUsAhpEj05mLGbRw/iRLr/oa94F9QsthLqvABHHVCM2EtS03u1HqAKC6vW3zzqLIS576L9mJfTxK6XXzW2E2PIBpYX80VWnLURQ9nh/dDBcj9efqeMpcUaObJ61rW53YYYpw8JdEtqf/aheda3/W+kzrrFRxcnzcEG/ywDah/bnT1XTqLdNgN7/aIO23F57G5lrdhDPy+BxKRsh+ZPOEv74bGqhyayIj6NuuC1kSx1jF5ctbScKQiVztgcShydGznq39kCGOCTDNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWWsER/kwfPrEcsGmnNyqFw6OymwiyPT60cmW0uoOMc=;
 b=WBw7HCTr2f1ZzIjB9OygGgL1Auj5QvNUjyeLj0qKnLDZLJTHy3ipTwdDYlqssm+CZh2+Z8pPVfXwdZ47jnIlLbnKTU7wMHZ7LziSGO3NDweDJ3UGnI1ZyTjkPY8rtvIA3sG0/+H0FqBpK7ZCGSNlXtR5Wb1nZNmWMDIHFUwdRIA=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SA1PR17MB5717.namprd17.prod.outlook.com (2603:10b6:806:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:20:29 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 15:20:29 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v2 3/3] go-vendor.bbclass: Run vendor_unlink task under fakeroot
Date: Wed, 15 Jul 2026 09:20:09 -0600
Message-ID: <20260715152011.3542412-4-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715152011.3542412-1-john.ripple@keysight.com>
References: <20260715152011.3542412-1-john.ripple@keysight.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0077.namprd22.prod.outlook.com
 (2603:10b6:930:80::29) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|SA1PR17MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: fcaa0953-f9ce-4c8d-9379-08dee28498bc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	oanJFMZ8Z7jaQowlkTw+UnImiXFU1Q4KpXFtgNF7FqVkHt0rx+hUAKRWpdi8sFoLNi0mAsaTCH4VJ1nJbvgjcmRRs/ICB+BJ41yhm1dUQkHurmKFFFjZG7uiLcAGmm+ml+n+2stRIZF8BxZibjnmK626ilLgiwVDyUTuhouXKDfmZoq2Hg0sloCzrAI9vnsnvOXI6At4bGDYyCShAoylnVJiL0KFeHo5Nt2+6F/ktdEbUY8mG7WrObJSUpdEIAgaEmn1rKH0IyvycTJt1I3YNB2Gc4zlsABYcjkFYepE0i5dtRXlybbZLorkr9J6jEAOi4JmFIyZBG2X5TtF3AYHODNd0wADSG+PpxHTEgazO7EOgyvv7DRNmAN9wrXays4kmDd3cUwPh1rJsNs+HwqNXmUCvbrMCiIjLsE5JFTvrJAAhFWYwgOnsRDKM/2HsX/UwyGQ4lIyTzEaUX7b5MctYmN1b4n7Dbql/yA3fvwK4epEkw6KNTofv+9MtNFShiZXtueoQ1nBC0gPXrpFLYdzHFv8HmZwf1M8ZJwqWI0mJz/c94a4meqS6r6S307B0zkg9U4riWAIYT1TOyil6PZi3xRTJ0LEKfQ6pZoVVOVcScctNYwpasJd5K5gMxKxHptVI9kxoZovSYo5MhDisUBd6RoSaiN36X63m8XPFTHxzo0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+aXsGMQol+Ql6Iqs4k2hXNwVo6BprxDdr+1fNFEdtJHFdSfs1feKI90QloXc?=
 =?us-ascii?Q?OsIEyY2TFvQEhc27UkFJJCBn/AKSoNtuARHGiycBBDc+NWOTl0hOBO13AUE4?=
 =?us-ascii?Q?QPLxfZF90uLx3k08NiC9MawoTLbuGMtQJKxzRlJRUZ+K445iVEUb4qsSfl5U?=
 =?us-ascii?Q?7GMro8a1eacOe5H8Yw25mMu1WCU9avwJWZszdn+bAC/+BHH7/9g+7FoeZU4U?=
 =?us-ascii?Q?7WqYCF9z1n3TQI8GM9e63juYoyoONmXAg1JQS4yUS9pqawwL2y7S8O5dtWf1?=
 =?us-ascii?Q?y/9I9HsA7AZ0tGnYxwpkOqn0+luzZ941qhLgSTn6h4Cs94OS/YG0P3lVy/LS?=
 =?us-ascii?Q?mGG5ccV/Tkbq05uXvdi70FSVKprdql/Gh3AaEv79gR8g0Hsj8yZaHWleCbFC?=
 =?us-ascii?Q?Cmd/MEmFE/GMw1cMnl6ARENE1lFibDZBye6asR4k7PaUS+PeiMLnWz5//d9s?=
 =?us-ascii?Q?KkokMbiDMy6HZ0K3/gAkheP3VVXsHVvqPrtiakEDKP2F2xXL9erJ+HD7Q8YG?=
 =?us-ascii?Q?2HWMyFaqpFv5lTWxiqNtzn1wqM0jL2jO7mYCtw3UQMxdAtcwfnKbMkj2z9mB?=
 =?us-ascii?Q?gbLzAagDC+S4rfqmiXVGxu5Wsg2nvH+LD/UCF4M+M2AJl/0gyQ2wL6Y2f4NI?=
 =?us-ascii?Q?TrKtftRfjkbhqwfo4pPQoMDuRivjVbcFBhoEEEtO1wZpvR6SxPdxt1dUprUx?=
 =?us-ascii?Q?JFg7UD/wgRlX+17gfaCbCpSTFV2XcNzPeIyl6uY66vDJ4Y527lkeDnR6O8pH?=
 =?us-ascii?Q?+Uxkc7wi4PGVI6jlT4ZKkB+nFnhyQ5lfsv5zv/deckaASur3pm+vRLgIUH3P?=
 =?us-ascii?Q?pms2Bs747s7eU39hGNKhqHMY4i6sVP20BNoQEVH9BYVz0H4lR0hwxWIw92M2?=
 =?us-ascii?Q?bUzTbvpbL6/nL85Va1IU5uRzrv0bHeDEkK1/ZKBFyxOrkcudtB7vQfAgI9ob?=
 =?us-ascii?Q?Bcn3uOTf1xa76SYxRYV5MI86DNmM/X6LYyq6wsAI5PR+qIgVDpNbGmwXdBGt?=
 =?us-ascii?Q?j3YYSJL2iZsAGYYQ1mrq1poH8DCfdwahcWSnlNhgtv0HhhB2TMNCgULBOC3I?=
 =?us-ascii?Q?FTAX7MWeT2SfH0xu/vCJKILwxJ1NOdEo0Y+4HLiL2tGdJcVL0M7fSG93AXQ1?=
 =?us-ascii?Q?Viw2kAUIY77unp43oLIL6LvhgZS2jGXTkeSyHPn5ryvhaj/5leW77XwBMMjg?=
 =?us-ascii?Q?oHBTJHWWKEX8+AT8faMoFhVM3gMQSaJUcf11RbiJutL5dEmx+9JCfsLvKSBZ?=
 =?us-ascii?Q?tySvnsN75xDiqY9OYbdaTkPRkktshyclX/8v/Z/H94UMjjt9JViwO5b6kfHr?=
 =?us-ascii?Q?O2pNkFdiaz+xATtXgAVd9ZL52HlSRtvQ2o5Exhag9HTySBKBzRzY/lcdlKAW?=
 =?us-ascii?Q?ufzu1qLw78PIHUk21Q4Tq3cP0yHWH1THfW29cFpWcCSWro/QSteCQFhrlQQg?=
 =?us-ascii?Q?GbjGKjBgMQTlEZthER46894+eC5jujVbwTAxCAjQdquIVW2EJwXT/e3fQXXI?=
 =?us-ascii?Q?yPa84aBYTtyvcaZ/K1IYkMgBiVf8f2FZ+x3ReH3KkaE6EUHwUOFhdYgQXF+L?=
 =?us-ascii?Q?lmjUmuAaTl8mXDkMWNS47yDga5XuXTM7i7PxMMpITQH0xBN7xSrnyVvpzP6d?=
 =?us-ascii?Q?dFBBr8iP1LSLMZ27hOhwvqq2gf7Q/NqJ3pX/YDTRub5bDpPtmt0sMaWvINxf?=
 =?us-ascii?Q?25/S77KC9wWzQvCYmeFv5ZNnkojO34egIsjQcRt7kJqXnoff3zNmbG+secUz?=
 =?us-ascii?Q?qIgD8+mr6Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	JB33/0zvJhI04hVWFwITHlWhTQnqkqTeHqXUiSbdioMBX09Zep4ByHYvC5baAJGMG730g5v+7P09MnyiEp/XlgqY2HEjfLxfTI/1N/xcrSvrwTQzUv6JzVW/UhlxDmz0zi61gwDqES49qDNAVp+TEkhraGWX0OG3w19Bekeufjlc0VHZg4Sr0kebl5/RkdWquv+yoq6gT2nZ/8UTsYhagOzk0in8yVKmAZ7W1CZUB98oXUhyl2/L3HZTxxXoQqF2dBcsav0H4bmBj2qwuYavdrM7oMTJUi1kSIeXYeTQMtsEuZzQc6zfdxhX8RFm/JYDZIPV5SbP0t0Li3jRm+BYRg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Kt27unHn4wIawJcv2jV4FaoJRTAhn79jrlLzU2N74XhuRLvqFXNJkpbnVC98aA/mEWsoUPVI9Cgd8Sojk94CtwCodsp/qyo78VX3j78LQdwtwczddELDfgZEk0XYqyyiJm6zcvlMiSYFdZASmKz+YXapXpHOI+L8NrHEPtNCSxATcESrVLGSJ+JV1yGbfBiuf5YgacVjMr3mY7fzc4KGupY8rmMs8MgUCKDW2d7wm61ReqZww6ABufGhEEbufclQLTvkKaOa75KB7Al5w9aL9dIqjDUZb6teJFAcvO+dmu4sQyvmQ+G5aSk8sNVICQIgMMMjj+WA/OmvL46OhDft7ekpqEqU1/Jw3fKt+GWf621M4Su+lmlKIQg2aPPSS+OadOtH0qMo6qOSAiisT7HLw3Fx0izikPJbtdqvXbUCpvcec/bca0IDD7Wkx9PKRb3WdaunMiiSEfifo30wdEJGiMAbXcjdLxuvSXDNurZOJIwlorxndlfJfUGVM5Kitkoga4qiaW322r9lATO2+G6k7qzSfi+NRJ261U5zcloW2lQ7DQSmek/IJ2cZu7EQuYTnzryrGb4dhqHabhsfFGQaoBY8qDjf5E1CUuInGbOFShTCsGTnh7zxwh2wFNPtMek6
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaa0953-f9ce-4c8d-9379-08dee28498bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:20:26.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2M6AppCI0IlAJvg7m9XQGTMlmy7whiM1+utCN2Xv8YpuwrX8mHpsOJTkxE39DT0boBrUD6nwGRsb6LYTMdritz9Jp8Ym0DRnSuQsG521NX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB5717
X-Proofpoint-ORIG-GUID: fdrxZjvsXFWxq386E8tMpSzexfLcub-J
X-Proofpoint-GUID: fdrxZjvsXFWxq386E8tMpSzexfLcub-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE1MiBTYWx0ZWRfXxkpUaf352oB0
 0J5KGbuPWpwGiv8Y8YmNY1BSiCBgrhlMcahB6A5CiBltJhTGW76bfwKGDfOT0DsFb0EyGwXVjfc
 z5OcQE7fPTTmCB+9yxg0D7+bGfunOQSbKPg411SM4eLb6y5/IT3NM2WRYCYWvgc0+gE8EnNWaaV
 /7l6XACdTgUT/06uOSBZrqZqpGofs74C2+EfMW48oHbCQM+FRWnlgkybV9nZ+vPVPSIf6o2evjZ
 4+KZC2KJgIz494/SsHXf9hzi9z4gHceUVFpWXyyimW3bV74WDcz5Oj9/oCs9bun2ez1RH87ndZ9
 IBtpIAA5dUADiSfXOZ56qgciwxbO3R6Fd3sK0QlN2gmw91197pAASiAjItOqpTDsTotxD/ibYus
 T9d1sE/XGgBUsg3PKARs2wetAsiQWUik1jg29zu5CkOrxvlhmGfZG2R0gGtKKsOSbWhS4OQvpwt
 YsLoqocVHks/cJKRcDA==
X-Authority-Analysis: v=2.4 cv=DKa/JSNb c=1 sm=1 tr=0 ts=6a57a540 cx=c_pps
 a=air8cPz1/yJpzemNVwtxUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=mOSSRekXLlsqcmK058qe:22
 a=F6MVbVVLAAAA:8 a=Yyp9YMqRlRMKTZWmAgcA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE1MiBTYWx0ZWRfX4Qgggnce5ydJ
 rP7DQOxM0Cb5xVde2H8HE8LQBDvMb9ZkihS86W9KsZCR6tBW5saeq/KIjElMuKJxPbztRskOWc0
 6WbB6j11QwLLzMi5+Gp1/h478R6rxxK08p4OKTzcu2HJ3vxlUYAr
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11847
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240979

do_install and do_package both run under fakeroot (pseudo), which keeps
pseudo's ownership/inode database in sync with what is actually on disk
under D. do_vendor_unlink runs between them but was never marked
fakeroot, so its os.unlink() of the vendor symlink happened outside of
pseudo's view: the file disappeared from disk but pseudo's database
still held a stale record for that path/inode.

The next fakeroot task to touch that path (do_package) then finds the
on-disk state and pseudo's database disagreeing, and pseudo aborts with
"path mismatch" / "inode mismatch" errors, failing do_package.

Mark do_vendor_unlink fakeroot, matching do_install and do_package, so
its filesystem operations are tracked by pseudo consistently.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 85a3c1b586..5bb4e8e876 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -40,13 +40,14 @@ def go_src_uri(repo, version, path=None, subdir=None, \
 
     return src_uri
 
-python do_vendor_unlink() {
+fakeroot python do_vendor_unlink() {
     go_import = d.getVar('GO_IMPORT')
     linkname = os.path.join(d.getVar('D') + d.getVar('libdir'), 'go', 'src', go_import, 'vendor')
     if os.path.islink(linkname):
         os.unlink(linkname)
 }
 
+do_vendor_unlink[depends] += "virtual/fakeroot-native:do_populate_sysroot"
 addtask vendor_unlink before do_package after do_install
 
 python do_go_vendor() {

