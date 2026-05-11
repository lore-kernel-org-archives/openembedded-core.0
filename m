Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4144CD3427
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:03:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47033.1778493805001275464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=OSsaK3a7;
 spf=pass (domain: cherry.de, ip: 52.101.66.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wate/2/Lffu2dqpdvhDseSKGxCFgnMXKkk/tz/VNQ0kBjwIsofWUILOhlEIQzlMrD5d0tINbwVGM+h8HtXE54nImxSSNw2z6/LrvNxgQwcCICoMSIls5m4zvYa4ywAymVOvVHyEI7NkgdQj2SiQzaSEvd+LVGLSVxiDFGooDnoXnxrADkvlrYkfGbqCZFQaC9uzy3rIKI4wPglvdMUw/Cijmw7G3Cvc74xDsZ+lDVxbNqH69LJH3XAigruW7dok2O8mXeVBra1IKGVbA/cUcefyDzP8z+jewZnXxRS6G3EsqanlMYh645hmbiA7tBrZn7P7EzbREB0fbRuOtVTgVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51uie+pVk1gfVXO6pah49sB2bqR6sFpokng3p2yysYU=;
 b=QtLiQbOI6n8D2fwy7kBOlmqEj1AYDQES/giG1FVmoE891RiPkqhxN9NaZKZ2oA6u1J0qpmLtssyrJ2ExrYeE39dZJhf0W0NnI1hWZ8HWABV0z3SWE+bG5HYqZsG73A36AUPp7X0QAliNbPXUFEf3hUQ4LjrUyLQMEGCgjNnTZOuFe5FEMnru9hAbQCw8NXQbZ1g8u11t+pT/FgM2jOFaIQ1KEsp/5wOUwt4rRG+JAYCtGNWt9H0/ocQTJsevHnWn3M5CNyP3sVfeMWVCpQkLr/LkHpckBXqF1vsO8nv0wHIEEJtxdeYw5Au+5J1YNyVdDYWZkYIMaBNDqBR9MgmEzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51uie+pVk1gfVXO6pah49sB2bqR6sFpokng3p2yysYU=;
 b=OSsaK3a7jH8uE8YRSe6hpcXDahLhjAQv3rfvJYi/v1N0My4NTC0oUWchMskd4Xp+RyD0IWlOH+J8BZrYeyhwpmbmqSBfIzNvnPhw8XGTQba0o0TpxT/Uembki2zJC+zWpbgXkUSgf9kJR6CR4HzvZHHZbV+wJAPeO/YXJPNotsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM0PR04MB12075.eurprd04.prod.outlook.com (2603:10a6:20b:740::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 10:03:21 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:03:21 +0000
Message-ID: <257f886d-2be0-4af7-9233-716a68ce038a@cherry.de>
Date: Mon, 11 May 2026 12:03:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Split vim and xxd in different recipes
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com, paul@pbarker.dev,
 mathieu.dubois-briand@bootlin.com
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::11) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM0PR04MB12075:EE_
X-MS-Office365-Filtering-Correlation-Id: 63544a27-2b00-4545-523c-08deaf44882a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	21WyyW3dnHUTz86RKkLj0GEdTdtfljZYKrz7c6YBbAZyrmmZfiauxeBUFW3qG2VljCDMfg2LnY8fwRek2widcbeQXzFvv2/4gvNX3SIj1E9/D7s/UXt06pWe21rE2kzKnE9Q/n4o1MM7/IMx7dWFnLcKvirTSLEW1P2BZHH9faAYj8vJItWKu5MwEoemqgG3z0kr/yNO55gqcdrbgDc4LvVEaNvveql/IMRuWwvoyhRrJfzjhiGf9sxkulmktzR7H6aDfQzzbfeaP+7IPwhXElihHrm4Sx9kjqxUOdSfDnr3cWfcxw0VlcephECbK33dxQhCPJZ+bX3Jb0kW8ixpjGAgUkKMRGAHaRKmV2i9NKfxV5xc0jUL9IqBzeFcyOaVDgt2w1Y5Dl4YUl7fTGYNvaL1tTC/Fz/Om83Uob64sC49oLEcNwwbanvOqYebXH6KBoaZR7amLI2NPhtV7kGSdfnzI6PAIhKgLNziR9DS10VmjoHBEWAabJmz7WK3wtx+b2IK0Og7QdU6yZayuOt6nQfau8BBIsnKEpCrGVzclrUDTMkr9PtZ3dQ2cQ5qcI8YKqE+6Jn03fNJ1ZJ2ijUib5D8bmuxL6Pij2JA0HbTJmb35QptwAny0iYdG+0t5o+gnEbrplL3NfNoOV+NlEJcQFUa9SKrcBxyCC3w3ftO+ELXocuBqtWUTmSX4oCp2t80
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fGdgyxmpfxhr1GvgkOEHfvNNnXk3BJc+1dC6z7UWBp2awdDp2tvs0yqx53bz?=
 =?us-ascii?Q?QKOgFy8EDEBEiiroYifXn4Gi8ad+pDKw4nbN3UfbJIYWSuYIv45uiAE+Eukg?=
 =?us-ascii?Q?B6Rs6rEdiYwdGgeEcH/gx3u8PQYHT5VnR3kT7jqvAMM/01vjBCvnsChOsnyI?=
 =?us-ascii?Q?VJ5l6gc+px/mAPcgywqTyHnM9yJOFMnBpsA0rCbqQjk72uflswNzuivPipvl?=
 =?us-ascii?Q?+MLqx+nzNOR1TGIiSgqV+yFIpXV/rCBAiixd7ygsBoieghsfZMKFVCGIopTG?=
 =?us-ascii?Q?t1ak+sD5+BpiUvl/brfESeAOLBF/k66nhWEbYhSuC5Ba1k0jhPkLhINFK1xt?=
 =?us-ascii?Q?smamvfUaWxeG6BRFTk5UFgYxU7IYzUa26tdyl2gTsS5c+NWbeEfQV+xNLwO1?=
 =?us-ascii?Q?kkLsXwblKr/o3TaZufoOHMiqDOinJZeC9IaieZ3cOkkWPNEzs7Ykm2MlxTwq?=
 =?us-ascii?Q?a0TvfScAdbeBjUxQcwCaW7A8lbNS/uMP1FhyBz9DMpQeNegk/Zy6HCQWz47k?=
 =?us-ascii?Q?3pgHPlaQe2/JbjrZekGbJFMcoLjD7R1NrB/WriZIpn0JymBytGUKbvZxmXJL?=
 =?us-ascii?Q?At6XEHVHxCaYF/ybNqCZT3A3t8LotvAoyea/g9h/NC0QBLIBobQqtpsN8ALI?=
 =?us-ascii?Q?Kr+2tjqRQr1jjMzYWd5PZHZDr7hLZdr1cI3TGlPPWyZqlgPW2E2TCNr33TB0?=
 =?us-ascii?Q?QArRCb/aA8N1Nc9q4PhA/s6RoffzwiyGZQOREUcJ3mZHqdvqFZX+tZH8+VIi?=
 =?us-ascii?Q?dPFJNfmLkc9YL8RxsXesyhBLMQOHsxStT5b2HnhzHUdRgke8sw5nG2eNRSrJ?=
 =?us-ascii?Q?7uM0x6B1dxThvK+JRW53wxRYH/zMRewmiex3oeCcpANO1pQrxgpgNUQUx5j4?=
 =?us-ascii?Q?1MIekqg26JPzT1FI2ABzX9WSyeiPxmzD7WpKT+WdMbOBZmzwj78lwEnVs4b8?=
 =?us-ascii?Q?JR44oS2VwyPCjkINp8TquucyX6QFVQRcrGo0CpG9BaNANMP6Nfg/ecjZfxlt?=
 =?us-ascii?Q?B8vMDTprY7HQGlCFhuQE3ge9K6wa7ugx2b2e9TQSeNc1r7PNR0fPtuxR9hOa?=
 =?us-ascii?Q?RyiHBUcVSpHm+SFjJWHmlHOSKff+Xr15Qaf1KujxOQS4ig+9ENHtmbAQ1YZG?=
 =?us-ascii?Q?I0U3e0alLiMoHjTxMknxcC6tnHJuFhgH8cDRa8Dr6eMaH+9AMaYBYr8vB6CI?=
 =?us-ascii?Q?LyMe14Nbpqr7HSpmAZGT7WR1br4RsRRX1PUOUHx+L4Q4WxXyomN4yg5mlT/k?=
 =?us-ascii?Q?52+Ia9DIcAR1TAC2W6+3xgVVn8QfZ6X8NOogUdAaFLRkaLcUQDoOYCg4aYTi?=
 =?us-ascii?Q?fBF7xQU8n3pfjBXY/jToS8yDqZrbhnCsZOawZreUewkV3BbRhGehwGDcQPGv?=
 =?us-ascii?Q?SntpA1+kkz+9Gpm86RA/Z5zhzyajA3YajXhObHQSa6tkVL4wXSPGlAGTfOhv?=
 =?us-ascii?Q?BhgeCPp+mlg11rtcA+8VT4vmw+5hgN1HYFehi77JhsiNxfkQkZP2A7M7ka58?=
 =?us-ascii?Q?HpQSVgxo/jACsobNtyhaooZSNjk3Gn1x6iV8bOp6AdR48BKx8TdC67WIPzvp?=
 =?us-ascii?Q?y3BFX2Wt7Gd9vpfLhGqZ4MJNo+R72avML/EwTRGCOi4XBR0Hjb1yRYmbAIMa?=
 =?us-ascii?Q?D5SgDQ1N++BK0V4Qz8hG71DiHzvqtv3th+jj+5jxNzqCxdIo1EYiHj6n4bjB?=
 =?us-ascii?Q?StXvHiBIw3bpCQxzsxJlUHRI/RUglqYBFdvDtr746IHPF9UIW527HB6ANJ4/?=
 =?us-ascii?Q?xWZN8Ntudg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 63544a27-2b00-4545-523c-08deaf44882a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:03:21.1279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2iotsKvWpb+yJIM8unz4qFFhTsrm8VgfdUCOha85QPM9zDeASGdWmLsJYhBT8ICCy97kvB2a8+aDpWlJCZigP/Ilz36CVMhPPjYxsLlEVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236797

Hi Jo=C3=A3o,

On 5/8/26 11:40 PM, Jo=C3=A3o Marcos Costa wrote:
> Hello,
>=20
> Honestly, my main motivation to send this series comes from a time when
> I was building u-boot (meta-freescale) and I saw vim-native in Bitbake's
> tasks. It blew my mind that a bootloader somehow dependend on a text
> editor (yes, only to be built, not to be executed, I know), and the whole
> text editor was being built to provide nothing more than xxd.
>=20
> Just to be clear, what bothers me is NOT u-boot depending on xxd. It is
> actually configuring and compiling Vim (considering the overhead this
> represents) only to use a single tiny piece of it.
>=20

What's the build time impact? Because it may not be worth it in terms of=20
complexity.

Note that you also need to specify how much it impacts a build in which=20
both vim and vim-xxd are brought in the final image, which will result=20
in a biggest build time.

Cheers,
Quentin

