Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D2DC43602
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:05:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37112.1782486309137871765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Ylq55cpy;
 spf=pass (domain: est.tech, ip: 40.107.159.58, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxMmmZ4hGh+5jcSNniLFpbcPKWgMLOiCx8hPp5gLPttW/hn/Et6B/Iw8GwG9SZGzZqgL5Sd9x+3hyerrTcmSW6to5JzQ9pcpLtDDDFd/3womW8b8LZZWB4r0y6xeGjE2cZn4qRWB26Kq5cOy+flmgZlxEQmOw8H5mwENRz2oW331JdLvZ3wpMgFrPby7CMV220q9g15ARUMQsv5qxNR5ao/oKRTwXHdif1WiRCTZbw3okO2MSEA2HiSP/sNoF2AboGXF9imvb4n87I6NVzj7+YPoCFz6cjUT51gqK5VnEgKcYulS7hIqLq+eKrbUDl+Q3oyENOe2/Wj4LAlG6C+jDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZieJdQvfy54emRwVsMAdwgxN7t+E/ILzNKuR/7z2ns=;
 b=E+82AcvP8By1T8wAt4j7YvtdbtSszjurZr/AO4aiGu+x8DmpA/ZqcczW0tPcPRPzuweyj/P2ER3jw3VIhoHp70rzJA8kaQLMr93MRYV0xTUQfReg3+DUCUOcrSZpPz10uFqAU+43/d4diniy0YiIdYRklqcY191/H4QovOfKX6P3XVLPD3kWuLDDWPVkIA2FOySl6JVa3mlLMIoT1iQtyY1NAxf0kgG5HbzNc+0Xy3O0+lEe8nH7FcBJNuFsWjY+kCtLpyEo20K+d5rIxeBM/FV+jhMyz/urp42JFltPIFKRhTNyPMx4T2YdpchXbEdxlqmpQFkvci8hL4z821bqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZieJdQvfy54emRwVsMAdwgxN7t+E/ILzNKuR/7z2ns=;
 b=Ylq55cpyqh2rFIc8fPhgtUXMea1+6+prXF2Nkkm7nlh99kqKWjU9l+Dd+7E0cGA84w9X80kMyPHUJeTuifIPMinPX5nuuOInJnF4wFX2tXUzTYgVVYTL3MXGxQKjH7Va5YlyqVsgOaJKGRToIBgx7bSGM/6Y5JMvnv9ZbrwJwq7XDq/ysVHkbxXb43P1qb6Yk06MLkpvmnin+MZbrA4fjHOekiW5IAJYgmOCr2wRRuj7q1V/nF7hk1F+9rotuTLHxi1PJZZNjQcxfZmD4nCaig5+c3MVGZ/rMHEM/gqF8dAEqvwtZyDD9EbXi6Gn8EfSMQvEA+ZW9OgVlnWwziNaYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AS1P189MB1912.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.16; Fri, 26 Jun 2026 15:05:04 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 15:05:04 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v5 0/2] package: replace copydebugsources shell pipelines
Date: Fri, 26 Jun 2026 17:04:44 +0200
Message-ID: <cover.1782486000.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AS1P189MB1912:EE_
X-MS-Office365-Filtering-Correlation-Id: baff8c07-b28c-4302-8fd5-08ded3944d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	fPRnqHBlKZ2uvKFFEL3kLugpCOqv4CXnatZYwvjwD4mgzLwSMwpCXl95DhI0GAPPTjyjxXbIUwjrEHCCBWoZ38HUbQXjYPgUWsLvejIJ8BuWS7PTrID1HOPH1NTLLo4kZ6Xt5fv9aVZSgADhh1H/vi9RLN6nHF7stsIv7+Zfosdy+/78WaNjyTkuRPfwT/dpwCvK45/LLwUyts4Sbxv40orC8DThvtwQDSqFiTMZSqEsgY9DJdms9wB6PSBAAj4INFnU5dGoTC1Qmz/KAX9IkHIalR/052w0Hrb203Sw0B6q115r5Uso/9+scpNYlJDuV1CswxdZroH75GXQwofUpgSGpD9pqADdvnlRZH45UTb4vbPiS9zXGtk22UM3ajCE4Cdt4GD4U8USqdTViin6inwux2uXLfXhv7PFgk2FnilkN4Nbbz+6u92tMQCBsXExH5wnuLpYz763GmgQlYOuWqnStdkPwEbqqZAHrU5QydgTzQzNPrsZ0jp1qBtiXNeIz3g6RjHTocgmlhy8v5G/CiENGMQY0zGKw7HF9+iM4UbZ/nhxToGTDqpv62fEjaV7ZyDgmFVTx/HTF5lgy65MX3z/uCmiuU76TFeIrd0mi00sMpXYmLqFcCOLpG3eWizuurVuZyenuEDMiMfskpmzGTgROw8jPYuWOTYQx8avX7A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Mx4IvDxF7PaS6H9gxdGHP2K0iUWb2K1PTUHFmUal4Ux2KneW2S3I8fM2NlK?=
 =?us-ascii?Q?/ycIcBL7OLBZobRDUFy6y1sF0GaFL4T6F7jqS1eLubfiJOZ9gTr7ktRvl72k?=
 =?us-ascii?Q?+WElhr1/0BJT7OmqCyDr/maQfbK3jbrFZig3exu2w1Z1rKvH83s6p/nlgMBc?=
 =?us-ascii?Q?JpbHdxjBc3ZH5o6qnLjw1umkXE/1DW/zWJn4OVfxr0D0eV4hVbbUNxhSuDd1?=
 =?us-ascii?Q?SJnxrSiT0dGWhHFiiacPL2DHD4J2g9PR7KzFBwOGtpE1ciATNgLbhlDlz7Al?=
 =?us-ascii?Q?/gJ6gSkAmw/75zIR+NIMeHp13rXHoRhC8IEpXy2phuBHgSlSozY3eKvoDO3P?=
 =?us-ascii?Q?sH03O/Kfh/E9fWZiCJvHXOjtLYs/U9it3fOrtmTJrvUHPmoqGwXDeDyB0tqD?=
 =?us-ascii?Q?JbdL4pDNQ7bxnCKYyqb+64THLevz1vnzPE9hxVk/QDyzJOFZ9gqwOeF5TFsW?=
 =?us-ascii?Q?LdFTOh4B3BJpBtOo22PhxYYetS1b7/SnKwTDJ8pZxYgFGI9aVguLGfgJCj3C?=
 =?us-ascii?Q?KNFNMUnpH0MaSnS2Mr0kNhLTgG+ZZh95J8j0OoV4kRMHju3psGGM/NI5Tir5?=
 =?us-ascii?Q?+1sTqZTW/eJyGbtsfo2lWc+xpXSqH5ZpgVYh9nsykGSkZNk/e8yiyTM+9N3X?=
 =?us-ascii?Q?1ckK+gUvws9zb+PhBoZwnIjzvdPe4yP9Anq65Kkgc56ZOaqcGM7cu0nJp8TG?=
 =?us-ascii?Q?/qWUI+K2XNhtbXIIrMeAe55i13l0lWQncnVV6wa0YAh3VLS09i482vZGhv+2?=
 =?us-ascii?Q?bGNDJxX1mDFl6oVLtUNaZkBbEMQGty0rxyDMCLNLQoFG2HIG1U8ixnww850i?=
 =?us-ascii?Q?pEOqVgelexOZW1XM3c2mT0uCNBX+LCQRL+9JCcBCpJLsqRenp1M04lpXW04R?=
 =?us-ascii?Q?QLFNLuhR09SKdjC+I9D4RXm+vEPN7zg2mvXrtftpfz3m1TTWi6JIap8oapN2?=
 =?us-ascii?Q?U3EsTIRgjugMF83tY2/vG5nQEH+K11Znw7mts4NtdgMF2pzxuLatpal/Wba8?=
 =?us-ascii?Q?ff5O5UJOGifXyfgZ7UlWD+vuxbv5P9pZUFf1JeldNmGLVPcPhCJi6VIBgSIg?=
 =?us-ascii?Q?WRKHx0PiDgB3T+dSvLu7/gLUaEvw78QPWWjbRBsF2NVVS2j1fNqqdxjRlImY?=
 =?us-ascii?Q?pYGiIUKhPOKGw2hu4dya61Gu0EozykCacoB2oengUX2Onoo1GB0uMnrTGRuO?=
 =?us-ascii?Q?x0BFfQukq0wxvngcK2XGg1w6hVxK+2KLAdQfGFBWHSPY13kR1kLuGoua/j3M?=
 =?us-ascii?Q?rcocCqPgae0Xqm7XDfyMvi+6+cSwP0vr2Z3KHUSr8JsmfgMwhh6l8LoqE27+?=
 =?us-ascii?Q?bzOmXBjXZ+XCEqQeuXVAjyocXHE8ELL+PtnHQJuHPsubtcGA6qyWeiigH5Y3?=
 =?us-ascii?Q?rcnFE0HRi8mTyqSPxmNudabQn4lDDTfRnYlc4XcOiNgjvg9B6bss6FkqaniH?=
 =?us-ascii?Q?X5qwaIGq1ss/3vomxdv3hzpljKb3WXsDaaWWtPHe0Q+3I5BsIiqe/PxnYiXg?=
 =?us-ascii?Q?5C6ayInO22j3/0XT0tTK98uMHI6W5WY0e5QtWHKDcJpU641SETn3M0qWxZZH?=
 =?us-ascii?Q?9OUTFt2eEDo76jMwfOHFhzAdsMQXoKz+NY+HBFevbAgFKQwbRbBzckv0Q/W/?=
 =?us-ascii?Q?bSUrtEd4g2JIdbqT4EAUd/yOltbrPXWfrnr50LzjV11c2JoUBAvJJgyQhtDC?=
 =?us-ascii?Q?G4P4gxq7fy2uuHojmtbrdfx9Clm0nQidQnKuBKBEPg4rFg+p3R3L1aMB6zWt?=
 =?us-ascii?Q?gyAiOjnQ9g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: baff8c07-b28c-4302-8fd5-08ded3944d5f
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 15:05:04.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gmi/Io2KfYBV+h/AyFfP+WMYOvKKFOpkVXcn4kCAqO4520ScAb+G7jt6VX4jeUiFHB/ft/07ce30U8daVc5kOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239643

Replace the copydebugsources() sort/grep/sed shell pipeline with Python
filtering over the NUL-separated source list while keeping cpio for the
copy pass. Use an explicit prefix + "/" match before stripping the mapped
debug source prefix, replace the symlink fixup pipeline with os.walk()
plus cpio, use an argv-list mv for externalsrc relocation, and pass the
empty-directory find command as an argv list.

The externalsrc relocation keeps mv, but now with an argv list and
glob.glob(glob.escape(...)). This preserves the old shell "*" and mv
overwrite semantics.

The first cpio copy pass keeps the previous failure-tolerant behavior,
while the symlink fixup copy still reports cpio failures.

Benchmarks did not indicate regression.

Changes in v5:
  - Use oe.path.join() in the copydebugsources tests when joining PKGD
    with absolute debug source paths, as suggested by Ross.

Anders Heimer (2):
  package: replace copydebugsources shell pipelines
  oeqa/selftest: add copydebugsources tests

 meta/lib/oe/package.py                        |  72 +++--
 meta/lib/oeqa/selftest/cases/oelib/package.py | 272 ++++++++++++++++++
 2 files changed, 322 insertions(+), 22 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py


