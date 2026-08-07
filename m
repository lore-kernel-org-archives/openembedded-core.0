Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B15C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:48:25 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37335.1786085299389873051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 23:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YLD8A4Us;
 spf=pass (domain: est.tech, ip: 40.107.130.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gj1P/8VGdGUQCNv/yKzJo7KP8uC5LWAr2wJZUyEOGqXEeEW/WfBfXg8Yk+x8+wOMeD5deEglkxmZhodFseVlTUtg44Qm+GKZIOnRaVV9HXTsKMyz6yrJCCWkTOnHeBTTkoYLjYKIoBo5WMauuMwtbX0H75OdQ1BqD2Y9nott65NeQoZ9ugeObpqxsJs3yUdrC2pAClQI8oLm6f3EDEOBHsOsffURHGZ91JsHtNkjUqsnmSqsXWmQhULeDE4mEokGbEvJvnBsumD3cyDN07eLi9XpB4PBgucniL7CxVc2Y6HHNuVXW5n9U8sCUrhYNXzfT2Kmc2xUXkcVvYOCuog4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVSdOD7+Q095LW9oSpMInnVFdp1kHSpkHs5pISaMoGM=;
 b=MrJQPf3zMOE0aHujjYJVX+xhZqrNlSl/Po9RjkB9cbBwMQCgp5w+gvKInVO6yLTEqfvVzWKJ84dUxO2Mdd1DxcbUGeOwJPm9ej6n7mr19PQO+ftaOv0mbKPGNeNO43vOKlPv0qL0hToxMB7+hNYlIYdztAtxekn0BJZHKeNDEeXrNUVNpMwGRmYKaZa2KklWiqnamI47W0MNOx9EfcI8XNjxLYygMoMMr0WlDDT782GdZ8SikeOcfsBQYW5kB9JP09w4EjLCqX6ABb0+qd8LcchCOx+TS5CGkImQ0YURdbQZB1GiyiwPG2BhA1YOH6/vnr3D3Z7AviDTXLUxWUzX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVSdOD7+Q095LW9oSpMInnVFdp1kHSpkHs5pISaMoGM=;
 b=YLD8A4UsvGHuXzRsv+2D4kmIBUHPhEOOElK9KDYJp+5PXzYmbFYM5LCZJJ9dDtHvKz6iotA3ml1VjOkhDKBJGh5ZpTlkPhvShJ5+7FP869lDrWaxArU1iIUrmJo/66zwNbfR5gMHHGE2nwfdx66j5arQpHOD1Q67GCGJmWfYq//dBpW+T1P8oOPYNFMIutxyAxVXuOw4zycnp3t854XU3/D/l0zi24KwtjSscGvJhyLIf7JWEGcRkV535L+pHw05Az339QYe1dHkr2cW/gI1Xr5nWOHHMMxLT3j8D2mP4DGVMPXxYgbmaOhix7xCkNEeZaqEBk4TxlUMufqghfj4RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB2765.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:253::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.9; Fri, 7 Aug 2026
 06:48:13 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 06:48:13 +0000
Message-ID: <1f8ebf00-f01c-4c40-bce0-bdf7b54beb85@est.tech>
Date: Fri, 7 Aug 2026 08:48:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3: upgrade 3.14.6 -> 3.14.7
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260806124246.26004-1-jaipaul.cheernam@est.tech>
 <AS8PR10MB507393BC59596DC2FE8311FEFDD22@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <AS8PR10MB507393BC59596DC2FE8311FEFDD22@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0274.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB2765:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4d453f-38ee-4771-6599-08def44fda39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|10070799003|1800799024|366016|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	bwF5Hw4idnxLCTjlycuPkpkZDo8bXTUyvhjMoWW4gNcuVLZ3+WUodJ/QgAQiTHb0Zn2CR3rI1SzMWpeh1i+ITijbaGRLI9/xy93V0ox1twgh7g6rqKry++2wkKniP4n2qFT9C3xgeobJISDa20Gz1X8loVCW4fYLmCwxf8pdH2TAhSp3342HTqqerrGMnL5wgsZjASFVEpEbvJNOxm2TyaiGqQHQKToDkCwIRdJx3qcMdVMo2mTAbrbh2yiQLAEDAlS4Y8IKIMd0yrfofeWEkIGilYbvusttxba+kpCiDXh/aKNhyEoNbG8vGFnnGHdgN3uPcXhewFDxTh3ETjB0iq3nuhdxlYM4H5cYntD5rpkiU0diVyYqMed7m57MvHh036Oq1ESulUZhaf4mBEHHichufVNSIKtaUcs8GpwiwCfF5b5lRGdJpxWEgubAf6k+1pXfWJqlwcw0t7mIm7yJsPBbg/uT5WqSLlc7tvjfsw+HZbBzZqn6zahi37GaXBXnHlO7oamYjqyBEVahi6qqX8B0FImJt8AFHuF+LQQ3LpycohSw7vyeetbor48+02z8XCkyaQe7q/iIj6qa28sIYQDVjpqU3cGkD+oAQ5rqxqhzuTHO5W7Ad5P5jBxpVcV+G4chtbe2uAxhVxUtqOrU9U7VjbHUhBgWG45B8fmDYCk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(1800799024)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oGubjKFMHMUrJYUmeREEe6EcTwPQOWje7X4D6k7ENZBAv4GLeb0wy4zZt/lP?=
 =?us-ascii?Q?r75MFUkDmwKvWAIG7qnij0mmdiIUjmbHmwmRshLUi6raZeDlxrRfbPGpYXLy?=
 =?us-ascii?Q?dC7oG569bDxFi+a0tEQZzQbCNDW6coVlH3+ay4YHGou55lA8nxXIlZ1PEn6P?=
 =?us-ascii?Q?5WZQz8eBP6iS42lFvitQ1bZMazPAKeapt0fqWPHiM09q/JD8AUTqZBKtpfcB?=
 =?us-ascii?Q?VZ2YCboLcH1A88igKP92A/8ly4ICGu+J6mJl6rYsiM2aRpySGmomLLR3eJMN?=
 =?us-ascii?Q?FT/L0b/GBwEj4nEfsFQ+i/F66a67nZrcipdkVXthaWf5khdHTg22zIAcj/u+?=
 =?us-ascii?Q?tmiZlP+73y4EdnJEAVmCk3Y+wu37Zc8CRq/sab7sQf0iTnJs5sKL3Z588hbF?=
 =?us-ascii?Q?X+KD9vJxQVQrNIROwwKahBFg09Gn5h4xBcOUOQ7hhqgOt8y9fQ72QjmvGw8L?=
 =?us-ascii?Q?BwCEPF4D/D3G3Fc/X8ZuewZjn6xteGPJbT/38wZ9XrINbbvxchgWmcwhQrGF?=
 =?us-ascii?Q?tVUC1Qof+A2WLHJaZzqqZCS8CCRbRj+01i/LbXMcZ16R/RXDYliwDg3UMNGu?=
 =?us-ascii?Q?k6LXDzt4/92aunUZXB6b1i8W51IhiwuwxsA11zzAQkZrETnt0EJm6GGTmfOy?=
 =?us-ascii?Q?OsjYYLd+Am3NW/lvPBBpw+Z2VH/vcZdAGLSAXOy4yLvV85Ic6xXmLaM7Vh/I?=
 =?us-ascii?Q?AD1tC3R2zn0IcA3c/+dHmcJyrtkvF1kF1OIcRqhSoXev0nWCvxBYsf0zCESz?=
 =?us-ascii?Q?G4tTCnFULTR7c/T6r8gpOX58Kx+jnluvgTbnTZZ5w8jdZByPMuLM6LaG0P6k?=
 =?us-ascii?Q?OikgfH66vAcNy3sqbhla7aqZ3L7hrLZpLbqqy4miLo5LPgHM9rP2jyPmDJwG?=
 =?us-ascii?Q?38YtQbSnRxQ2SMh0mifBuX6tsFojY3wvQC2xHGnA9rDmed/mQirN4nB8wNq9?=
 =?us-ascii?Q?O9yiC4RhcobffpNm2iSkm1HKk13m3cJMgaPlxemk8rkA4SZgCtijB+/J4R7u?=
 =?us-ascii?Q?DoDDpUJy2PZXMfuIRM7yA5so5o9OEx4ATHn3gFa3vtvzsfQ67xwV+UEuVA8L?=
 =?us-ascii?Q?txHyYQTx0E7dq2Ytt2HFWaqyAuJuSbb+tcPKEJufoO1M6nyojEK9/e4ZIs8m?=
 =?us-ascii?Q?q6K4ctvVLkx1INv0fq/4/gPbulw1+jLjGk4mxMUy0tw9mC0ypSvvVErF8SNW?=
 =?us-ascii?Q?gDyI7VSwd0yW9Xf0XOxl1oPyhq6gKQTEMNeDCipGcIS2cowKcyBL5Gc6W+K5?=
 =?us-ascii?Q?i+uaFM3ZeK6QlbivFXJIljSgDMTwaUosHOrFRw0mBDTIGdM6giJ5FdaimPDh?=
 =?us-ascii?Q?uab/i/8RLHz0spXy1B6gcdhFzh+wxeCoe6rDQsl3qatrwJxNCawh5AOJejzH?=
 =?us-ascii?Q?DI/+gr5oEJWdIqpOF75QP23Ny7jsnR1vo7KsOiVra/hsjyC7b546bLce6bjU?=
 =?us-ascii?Q?G4uHR2+dwfYXHEKzeYjKK0Kdk5Gm7wVlOw3w/3xUfzbIWpukxx49jj2wZxgH?=
 =?us-ascii?Q?r9koLmUhXlebZvsXLbhbpwjrkeqaJx7jzJcmFFicT1CY6IXYYEM0t2wBIh3B?=
 =?us-ascii?Q?T3RcDAy2ZiexL+z/U8Wuvk9de85Mm0b+5iSVtE9iPcjTz6oNm6qjndXes2HP?=
 =?us-ascii?Q?XRNOQGkyB8L2opJK7+KFdEsLYbpYO1ZJioOKNcbMnxoEv/DO1Si6EChI1qKR?=
 =?us-ascii?Q?LV/61fsRtVPgY9VaZQPkIPuuNGTV0T5w9I2cEoXkWG2tDW9Ra0+rtJ7Lwcht?=
 =?us-ascii?Q?M0AaedT7t4dIhjAr7WRl4DbBFHd7wqTkMzlycYJNFlqJolo+lcjw+MO1FD68?=
X-MS-Exchange-AntiSpam-MessageData-1: k+OT7tciXg4vPV/4AMxCNkA0WMbxZVQonyw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4d453f-38ee-4771-6599-08def44fda39
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:48:13.5031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNPi6x5e5+74ldFKG3+L6LbNfpEZz8yREI6pUgfrW4+9wglUWLsKR7yPdNyL5xd60bIkAIDi8/2BI5gFoSro+Hcwss/rv/jNux1mcJ9vX9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2765
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 06:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242984


On 2026-08-06 19:49, Marko, Peter wrote:
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Jaipaul Cheernam
>> Sent: Thursday, August 6, 2026 2:43 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> Subject: [OE-core] [PATCH] python3: upgrade 3.14.6 -> 3.14.7
>>
>> Release notes: [1]
>>
>> Resolves following CVEs:
>> * CVE-2026-4360
>> * CVE-2026-11940
>> * CVE-2026-11972
> Where is this list of resolved CVEs coming from? It looks like list of pr=
eviously manually patched CVEs.
> If I run sbom_cve_check_recipe on python 3.14.7, I get following CVEs wit=
h detail "fixed-version: Fixed from version 3.14.7"
>            "id": "CVE-2025-15366",
>            "id": "CVE-2026-0864",
>            "id": "CVE-2026-11940",
>            "id": "CVE-2026-11972",
>            "id": "CVE-2026-12003",
>            "id": "CVE-2026-4360",
>            "id": "CVE-2026-6879",
>
> Also note that the new CVE_STATUS entries added in this patch should be r=
emoved.
> The are resolved automatically and we should explicitly list only those w=
hich are not automated.
>
> Peter
Hi Peter,

 =C2=A0 Thanks for the review.

 =C2=A0 You're right =E2=80=94 the "Resolves following CVEs" is not the ful=
l list=20
fixed in 3.14.7.

 =C2=A0 I've also removed the CVE_STATUS entries since the scanner resolves=
 them
 =C2=A0 automatically.

 =C2=A0 Will send v2.

 =C2=A0 Regards,
 =C2=A0 Jaipaul

