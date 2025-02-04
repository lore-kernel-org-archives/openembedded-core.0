Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5240C0218F
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 09:13:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web10.112315.1738660426343309037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 01:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=M9pYolBZ;
 spf=pass (domain: cherry.de, ip: 40.107.22.86, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaSmw4tnU/L2RH3CBr0extfHyeViQ3n0k6ZU04cF5KhXa5BzPBQ9y0zUAJQyNgFBMMMK59OaFeszBWgiTfaZ5xvIAwfqe4tv/U/4ICN1gDsFpT6Q9CWgctdgNccJ8KSCml/3ZUJrtLcI8VxByWN6BfW2Fsd8df3qHWol2JTnXzuYdz4GutUi72eE9V+5MptSp5sy25YZ8ZSLt9niCKVAWhOir2FUfNdfyAwxqJ8Wsq4lGAWedJOmExScMyqM5pbScy6XIRSk+y7K4yFw8jDdUvNfYjqbzndBSjt+6Oc55mClez19w4D1EU5iZKU0hJPSQhMijkFKDi3P+EhKIwz39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ak3gto6jdEZ0gfo0e2s68mwG7Tq1Yvn9QVlmRQtVf8=;
 b=kRLVTfnkf6Qdm8OaaK9KCK1bxZuMfivhB2c3Gv3zXYLrr4Bd8lm5iXYWEclc+XkJhSuQsU6zvoFy17x1BMrAa/+WG91PdBkJkU/+HTagrbpiklrNbFVt9F3QHQrf+3fNyxiwxRiTTmqbti4c8VPRmEhiKduKcp9Mj3HG+y6qx0ULvBBUbX2GfJgHyuxeteTNuLWzNgjdF5DoVXlVZmdTv8ClqjoYXZw2AQkypafbSnWOQ6s//in0hy3GqpgxUgwKBt/OQ27MvD2jlBzomRiNbFTE9S4I7Knv6LBRbOLZR4sWyYMjNYjBVBt9srUo1CliGjLq7fYsrrUxXXcuVTk71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ak3gto6jdEZ0gfo0e2s68mwG7Tq1Yvn9QVlmRQtVf8=;
 b=M9pYolBZh0nYBeP82pBgo3wutpG7v1PzxtM0AmiTQwGSecs46qTZ+N2BwxqtnIpSlW5RgppsqtQFAlCI8Iggdul5odOA+4DPJ7V7ftnFdubENcMiFre8+qXbt+UoUV1CVCBlgmdSGt2jxYW0XflP2IU1HCVUYIsfKG2JDU1MThg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 09:13:42 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 09:13:42 +0000
Message-ID: <cd355530-d72b-476e-9c99-bc53f0a3a337@cherry.de>
Date: Tue, 4 Feb 2025 10:13:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/2] add basic b4 config file
To: Khem Raj <raj.khem@gmail.com>, foss@0leil.net
CC: openembedded-core@lists.openembedded.org
References: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
 <CAMKF1sqh0VMORr2ivhz82XVt7EuZ_UmUgtFVHOXb0pQwDesnnw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAMKF1sqh0VMORr2ivhz82XVt7EuZ_UmUgtFVHOXb0pQwDesnnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: fc06d840-1174-4d31-e0af-08dd44fc385b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P3+tfsACtbeVsgQ88Dvwq2UopjSXMkJ7w8FY7Bn5Wt5SLYGMIrSZQKNzwRPF?=
 =?us-ascii?Q?LBKKeLJRaEfATHwRt3xF7ogpqWhJ/NlKwngvCHa4evS54LM0H8HRoZsIjCjd?=
 =?us-ascii?Q?IADmxXCU0mkX1HaXB4nidYRUkMH7WsbZOypjn1Yqgx/P3gatLYYJnGoXq4+i?=
 =?us-ascii?Q?g2ewf3d8ikWZEB856f29mCkWdPxBP3Gqc6LzMeHZlX8OahoWW+93M23uBFkB?=
 =?us-ascii?Q?ALUvhV0A8WnL+g1e7dlwILZ4XvP7p++HEtJa+sSeK2DI10Dw6AJPPHRLgoeA?=
 =?us-ascii?Q?qHyI+3tc8NOHCN6zqLc/ZY3PUi0GGEXTdY8+TRz2qRw1CXtseFtadU56QOOR?=
 =?us-ascii?Q?72eVFpf1Mar6LtJ9B2Ge1Sd1sNHckQRWF+GSVStSNv5o+muUwM4SX0NOf8Qo?=
 =?us-ascii?Q?mG/hsETbmGn7M+axo8h0/KUZlMs3VSEU2z6Bk5wEPbS2i9x4X8JMesq7jKKj?=
 =?us-ascii?Q?fY2yNwAQ0bGdnJZXGNGrtIE3abrta3HEdPGBwRWRsp3/IaLcCpCBGYtqtUmT?=
 =?us-ascii?Q?9zr6ZrROc12aYWLFyO/wm3sUFC3Nf51GvzrYKHaKnuBAbMgPGzp/PgeDgebw?=
 =?us-ascii?Q?xw2mfbI3HS3urraoLIlmpHn0iXcNfkF13dPQCLDYZC00MobXLCYBwb+jsQvP?=
 =?us-ascii?Q?RzVh3uhQKxFl7f28eV+5KQSj/ItX6diiqMd4OBxV3OQPLGfTTcouDTCSEQub?=
 =?us-ascii?Q?ffDbyZtARsTYlv7kYw/Tz2Sz64j58qMVdWilv2PeaFOU2hLyLWW9Zt1+z5xx?=
 =?us-ascii?Q?qwCSYTtlBGSPrdz/xXfZ2QrP0hgmcLBpcOqAWG6iHTudVlRdkE53zFIiIeVC?=
 =?us-ascii?Q?xIHnSVSUL0j50iGTNVdNDxRg6D/a4IQQWw1Ll/PQpKUusLO/aMcUMPaE8T24?=
 =?us-ascii?Q?E7vOHaM0caZrcKVqYHUY0rckRRQkL+QaTxiXRgUEkkz9pH5KfwJYB5GjFbUl?=
 =?us-ascii?Q?Lmu/26NvclJSb7FEu4P4kUfUHaBTBHIU4+eYwjBNmehUNlV8l24MXyNh10lM?=
 =?us-ascii?Q?INFtJby28D2n8qbhjRm0+U7CiN3MAb8xhfHHP/mC8U/OpOcvYIyTt3BV7kg5?=
 =?us-ascii?Q?TJhwooW05NYoakkfqB/cCCilzcaohASZNqYu4UVlGwhnE0T9qtbTgjLFSIz4?=
 =?us-ascii?Q?tkrFuNVYf8pVVO2Y4xyg122tpbJ7p0ov8h6GiZKhYfsHCaFnwlU4QJNBEAqp?=
 =?us-ascii?Q?Ne84BptsmZFkRfKo3CJ6z4NOxMGFKnUIpXMNlHcElqW+94c4jAgm0uBWLMC6?=
 =?us-ascii?Q?dznGHx9ZBZhb2ychnYEGcnbi2mh9XseuO80ZURNyojO4+wrTjeRH8GeEDOB0?=
 =?us-ascii?Q?5MY6JVlj7QYzvbsS31N+MWNg/lqFcusZ43JPco9EO82qgQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KMNOFqgPepcvgJYi7sH2vS6DY8Nj7W0dHBykNJhZ/2b0nCs2DvcjT2RHlLMI?=
 =?us-ascii?Q?B80Qp3+cNtGs2RIxOVA1sQs+Jr8REsXvUtkifcHjjGlXrewECuGNmbsImqCu?=
 =?us-ascii?Q?Rc9/N/TwmgcHIrA5+hHM2rkkOQtmuRfa6e7ZG9Juu5JjhsFFcMM70mex+LHp?=
 =?us-ascii?Q?IkKtZJhNMwIP2/eE4hYfCt5JuSjlRoKbhxZDVvIpIEQKLesKXr/lOjEU4nBu?=
 =?us-ascii?Q?r9WlR6vJvl6dvadg5PgbdHjtAqAjBkJX1Lb3EwZ+9lWLAUrrcq3NwT20O8a4?=
 =?us-ascii?Q?ybW0nvqjcb3J2Lk7GRAcr11UG+DqpyhcmEZ77huiNeik86JaMse78b8OwKek?=
 =?us-ascii?Q?JKFP1FYq43RP3OVnR6JqR9YUdMilF8A9BmUYRxmO8LnjFJgSxoc1u0NR29yZ?=
 =?us-ascii?Q?iVBgdthNuTSOX6SrYZZZDkiwnOPqIkzM9aHaOhorROruoJlZn3D4EPiSWVFP?=
 =?us-ascii?Q?N+XHerbZhcUMexbEGXhKkFizQCCIQhPoYk2gETB/8DjrATzYr7d8PUzL3H3U?=
 =?us-ascii?Q?OSZPRCxMetEvS2fdMsPHDnFxae4/oxrvTLJSq6/JUVTG+KlbBY331VD2KqRT?=
 =?us-ascii?Q?qtk8A39z2Q8S+aE5idP1g5h2GdTy8rg/e6lt7iFGw+Ue1/s6JOg93ZPkLnAN?=
 =?us-ascii?Q?IDEBCb04aUp6bxlgQnpGgOlDFiZOlcHiBeXjwwXZEz+sHKe2AamNtcnf55s/?=
 =?us-ascii?Q?49vwhIA6Klnz4+CGc+jJTauXbL/vg2ZWlyIaaw3ETI+sleTEtGi0tCpp2wg8?=
 =?us-ascii?Q?gi5XcaZMP5dmZ5FDLpZIiWA6e5Z0iEVGvhNBD32u9X3sgVAaleE5WgOwBQkT?=
 =?us-ascii?Q?8W3JVUjgiXN4nO+9TjDlbQ2s97OZDF/d/XE5txi/151XmIhEgxuYN0za3xm5?=
 =?us-ascii?Q?rDZrYz8j+um1mjE0Wi52kDxN+3xaSsKG+jbkLsuAhrxHtrVHd3V+2BRk51+R?=
 =?us-ascii?Q?TljZJSfktB0AqxAenzjI0P7IfbgALWebLxtYOkuXyVD7/OppYqq6pilmBMr8?=
 =?us-ascii?Q?v4DNgqVks+ZQvHxpttTrxwipXRf/axp73gsSReVLpJupZ1JFD5gC6QEy2KU4?=
 =?us-ascii?Q?ga1hoNUJuzIp4tXt+/4yS+Y9XJGzuepEZX121182Isz9lXhPgnE0cmLERxgT?=
 =?us-ascii?Q?a+Wx5S5twJysYjlfjj8wTUw5fDA/d58ol0J3g2pQmKG8aVwIuvlTBcjU4rqV?=
 =?us-ascii?Q?o5uL7VCzmkFb3ycBKrM7IOY8GuHspDoCtZSjsd5IeHTwsWPzEtqDhcCF+QQg?=
 =?us-ascii?Q?wDI3ZqJ1tZoIF19PTVjgqAV66hQ90LNttMU/d133zDx5m1bInLvHX/ye19iK?=
 =?us-ascii?Q?hsdGAAVMyAm3yGscV9mt6+8/Wc417DagkDkt3TODAo+gqg1kG3H9YT/AAox1?=
 =?us-ascii?Q?VSzwKMLxQnW0RSorpV9eHTgf57tvRpCzpUt//2TyM7yexsqKY/KGuHM1G+u/?=
 =?us-ascii?Q?7SCdAGbBEBFQNaK6iTv2SydgBdC83GIP4oRCHZEHqv4Ppx/jW/7NtJBHho1/?=
 =?us-ascii?Q?FRrFci+SsoTqahqMr9j+T+tE46wqLe3xlvT3wiczAy+VCrhXfBhT/qUwAlO0?=
 =?us-ascii?Q?qdzdmX3an9uUV4ZGBKk2Bs+x1tERt8N2L6fgZwGnVkov5GlWIxYYD+Zo3pbr?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fc06d840-1174-4d31-e0af-08dd44fc385b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 09:13:42.7039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQvopyZ9H1jGJKOrKbSqQniCXfBeHSV7fjqtzwVyNSgmfxt5Bk3ZtxAaB+KinF7GrZeEiQYSqL16QGDe8f0UhlZc2CkveAqbYSVvERYbLbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7874
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 09:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210753

Hi Khem,

On 2/3/25 8:42 PM, Khem Raj wrote:
> On Mon, Feb 3, 2025 at 7:18=E2=80=AFAM Quentin Schulz via
> lists.openembedded.org <foss=3D0leil.net@lists.openembedded.org> wrote:
>>
>> This adds very basic support for using b4 in OE-Core. This essentially
>> just automatically adds the proper mailing list when running b4 prep
>> --auto-to-cc.
>>
>> This also adds the b4 wrapper script that poky will need to use in order
>> to identify which mailing list a patch needs to be sent to and do some
>> additional per-patch checks that aren't necessary when running from
>> vanilla OE-Core.
>>
>> Once this is merged, poky will need to merge OE-Core into itself and
>> override with its own .b4-config that makes use of that script.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>> Changes in v2:
>> - add mention to first patch that running patchtest for b4 prep --check
>>    is what we're eventually aiming for,
>> - add poky b4 wrapper script (it used to be in the patch series for
>>    poky, c.f. https://lore.kernel.org/poky/20250123-b4-support-v1-1-4841=
f52eccbb@cherry.de/T/#m95d6aa25cc42352416da477cf07d7b3cbd671231
>> - poky b4 wrapper script properly identifies patches with files modified
>>    in both OE-Core and other repos part of poky,
>> - poky b4 wrapper script pretty prints when there's more than one
>>    project modified by a script, instead of lazily printing a Python
>>    list,
>> - Link to v1: https://lore.kernel.org/r/20250117-b4-support-v1-1-fe74a5f=
50eb6@cherry.de
>>
>> ---
>> Quentin Schulz (2):
>>        add basic b4 config file
>>        scripts: add b4-wrapper for poky
>>
>>   .b4-config                 |   3 +
>>   scripts/b4-wrapper-poky.py | 170 +++++++++++++++++++++++++++++++++++++=
++++++++
>=20
> is there anything specific to poky in this script ? if not then it
> should not use that in name, it will

Yes it is poky specific...

> make it confusing. In oe-core we do not refer to particular distros if
> not needed.
>=20

...git-repo poky specific, not poky distro specific. Do you have=20
something better to suggest than this?

Cheers,
Quentin

