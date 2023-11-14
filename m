Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F3FC4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:00:40 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.76])
 by mx.groups.io with SMTP id smtpd.web10.10162.1699959629235343840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=PzPgu629;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.76, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xaz9iNBAcZHE7fep8mhVojlhgmx+WFRwwDvXcaaoa1W3ylycV02bdD+rjIvQW/SOUl4RXtB+cqH5z7nmLiX4hwlGS3yGQnDVVoXkvsYIalaJkGszFkCKeTf1Xc+z6NT70gVzUGFHNK/s42HaUWJE/72ONbdk+RUbPj0rOXruRTEkl50KJxk0WsEI8LFvQq4nDyYZ5h3wuHtGgfeMzO8sG8pSJ6l+qnUn8beiMbLVzGoqyKlmQaXGEXgsEW6CWjh/6VTkPnDWLaicw3AkZOXkGzohEsj0QH2kbLAPjFgRrdvUN/6HYKWZodTHi6ubSAu6/4lHbdFLurP0jf7ub1eE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9Kkv30TF40fpMV9qQuoZsvddjjbZh4EdsAC5ksT7M8=;
 b=FRRyMHpYEWO59IUjBPwU2FP/gTQxX1zUZiXm1RGvkb1taniiVGIAo0Fe4CmBEGuHk+tnG+p/qwoIP2x6MU4tVHBUXIIJLdL8fMbGscpvEsX0FnujnpRP1VjjyVdF5AaX26YPsRyI+O7A+zKtPdxDpG2Dx4pMWVoYcdnnBjgjyPxSrLm48S/FUNTnd7viukYd8/sJu4jGui5yxetlnne9JPJH9Ifa4/14c3oEYB39Z+urgNjaGFmVW/4rA1hH5RZNDxB8weO4/9Yc8iPL1aveolkRr3hcZFxixAvCe+PvEtZ2MWAmvVSvU/3WHKXIemgBbz50S9ODcFv8T2aMzlbcGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9Kkv30TF40fpMV9qQuoZsvddjjbZh4EdsAC5ksT7M8=;
 b=PzPgu629Cz1FNOpckakxSWzqV6B6jpOZ+LmdrweFcRddbHaC1x8FHpiZm6F6H95vAWyetlqIBr5RHiS4GbS5/G3t+1mltXUKlzgu2yjQLD6dRRH5ZdrsY2qeXySS/+ieeHWrIbzZ+bi3bOy/5t58S085WWVHJ5IEsd1+mMZKmrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10797.eurprd08.prod.outlook.com (2603:10a6:800:212::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:00:25 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 11:00:25 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH 0/4] tmpfiles.d: use nonarch libdir
Date: Tue, 14 Nov 2023 12:00:14 +0100
Message-ID: <cover.1699958492.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10797:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9cecf1-be57-4733-ebfd-08dbe500e789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k7t2/phebyCedT2sBjXOSwTygO3pw7RqSIIutMeMgI0e0v5yddFE1frR2d5aCj9AgseVwD59W00hV9nnwqyyn/HJ6hObKd6drFWmzM3FzGAoRztA3SBfTdKGhBcHtLq7LtiIjxR1uswVV6356c1Xws2ZoweWtBWjjB5IIJwBIV+xSBQ9LsFhgDgobgvLTIT7+7JkwbTaK5KlG9saK7OrLPUcqHp1qVkSjO3f4nkPAogAQ05N2ih066i148aCWNLzyihkjDG6xixfQnqUQLTp/tXPTmWeq1TMlN70Xyifg09GMKcOPkW0qpscKdQLtyI5WsEBb097Yv076ZsWM8HY++cOFR7jtxHoGVVZzgJ0BgHQTXUpg7AKw0zGQkkcuQh7zGOPmAbCeEIeJViga2wf3vWz1Uef+LP/iZebSmZfYAaurtEP0tOdpL+5tj1VwSl4UfWngll7fWtV4qcNj9WibQwWOJRiVnL5ScWfWb4RjA5DWYZIaikKWkSkwieeDqcKqWXxOS1hvejzCvSvhE0eK81KNO0YS9wIT5NFPXDUjIEy21HMN4UdFf/XTwYPXTV5VELVfHA+gq9zei7UaGwV68jmcX6oxe8Lu17aAOPBke4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(83380400001)(38350700005)(26005)(107886003)(2616005)(38100700002)(6666004)(5660300002)(86362001)(4326008)(8936002)(8676002)(966005)(6486002)(478600001)(41300700001)(66476007)(52116002)(66556008)(66946007)(6916009)(6512007)(9686003)(316002)(4744005)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2lSghTL+1OJwkwtgs0mAXFQYYjKfI6uqz4uJnaRn2a/7NvcCCOhH2Y417pOD?=
 =?us-ascii?Q?xTJFxa+YJE1uB8wdonsi+2qkc1rsKfhWI092zQmHR60PF9BuAddjoxZYGbnp?=
 =?us-ascii?Q?SE5EW34ex4QSg/MiJSZIgmpi7oehYlvCtIcNh2YoUnd4xZZuBcDiZDDweGbp?=
 =?us-ascii?Q?u1OoVYDtR71DlGJvoecIgZ+B6IIM/9eBg0DPHi/TiLUWjAQ8vSUhop7Iz08E?=
 =?us-ascii?Q?sznTC0RITVB0NEEqlD38D6Wq8gtx0/PnSOrajlxhIxbHK+HtYlH+WfA6it6E?=
 =?us-ascii?Q?EnEObSrWV+V1fQP8/PgOrpNkDq4np/Pprf8g2wTlJUWyucrsVmKb0pm+Yv13?=
 =?us-ascii?Q?EavoB54vHeQZ9lhZfjszEQ5bv1PuxvVUK2MflPvANO5mbvfjqGcu58y2cX0h?=
 =?us-ascii?Q?HViJ36WiuZDxLoFvi7hq4+yYT7SiJyPkpbgsGBlsuT3vixJFUooCTwGPxsEa?=
 =?us-ascii?Q?hFyBruxzYM1b9cwAf+E8XV7d/yTMAC1GYhjKO3wRBjJrNwN6BzntpyHD4BYb?=
 =?us-ascii?Q?Pf0WUywV9GJGicCWRojG1DU+SwmFMw0huwLa8iCLb9agojDpnUISYTGyT5kT?=
 =?us-ascii?Q?UBjEXManY1+igg9LI9OOceOHvKSJeYlE1n0AP19/FpMkVBVV4dO1p6U3gpjE?=
 =?us-ascii?Q?qEjfFut+gr2VXFY15oDU/g14k6b01+17UCEvl5elSFjHX6eDR5MfWMOQ1B8k?=
 =?us-ascii?Q?9xsdAwHA8Z3SZ0bk1mtMEC0vMede6WtiUjc6k11bd6yCqrpQ5/pQ8SpC+sAs?=
 =?us-ascii?Q?bAKaXwFpI7NzkFH/PFzudgRD3/e0I2FiTLHEYwv8C/RxO2i8Bv0TZjm/bO9v?=
 =?us-ascii?Q?g8rCvRNRiOWPc7USKg3dn2xNlABbs/ZobAPLEt80tdHLUbVjBhaITpx2OHoF?=
 =?us-ascii?Q?C2bRAeSlg+MwiMEJWkSCCpGKbnOu3oGpyPzX/+rITzbWCdUs5hH33RlTKdHy?=
 =?us-ascii?Q?jcXE+yjnGKqhoxXOHi3wQqzW0KyScC5wBWQrxPVB0P0oIilQqF7il4fu95Xp?=
 =?us-ascii?Q?Zwec7uSnM0TtLGZ5t98aXOf+cNEAnXiGB/wmxHfz0iPYwyw6MaXR+PiCXFAB?=
 =?us-ascii?Q?reOh90kMPGD/VC0xqNq6Iy7xXH3eF9eUb9Emh8iuvBP8qs4OE2/LAJeHfBRo?=
 =?us-ascii?Q?Est3YxNpRNB8CwKP4PiZAHhnEpCjXjFqYJEetX2t8lmOGt6McL0GI1xsSh+L?=
 =?us-ascii?Q?QuOOwXizB5JMJPA0HFbIsPAgu9YS4bzM7wQ3ts3OuXmdlahTnoWaPkvvCZpr?=
 =?us-ascii?Q?NXA1JfLU7kC1X8wViJIymMd1QHcBJUr39L+9YY8Ec1J/ZmKWHzNYqF711jlT?=
 =?us-ascii?Q?iXNckqwsyLLsvQ/BzhG/qHiLs+UTUrztgKcp+p/hDPiNbUSzpucdO8Uwko8v?=
 =?us-ascii?Q?cqTplXRHa01jDGgwheF21ddVMuHOU02EJjE5p1ReeMRFYXbX0rn43MoA15oI?=
 =?us-ascii?Q?Zt6ijkG34FuZ7M0GpkA/P/1H1LUOa0ClFO/Is63y9MGPkjpOS70ksmlcNXPi?=
 =?us-ascii?Q?zi4lGVe1lLta5GjF8bSr3CxmTl65SFYz+puvj65EX1Fw6t/1fzalGpM/0E9s?=
 =?us-ascii?Q?SjFc81R6OMF+UWKvCAwrmWud7ASNt5jqp0z/PoDSQFcCeAdcUqBRMN7ZifCX?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9cecf1-be57-4733-ebfd-08dbe500e789
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:00:25.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aO1RUvhD/JFiqMjodIO+kF4mEw6MRRxFeV8f737XoDTtbnm7WTb/z4L1yHmqWmcjO8DD/P7ONNpael2Rd6BI6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190492

From: Lukas Funke <lukas.funke@weidmueller.com>

The series intents to move tmpfiles.d configurations from /etc to /usr/lib.

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Malte Schmidt (3):
  systemd: use nonarch libdir for tmpfiles.d
  pam: use nonarch libdir for tmpfiles.d
  sysstat: use nonarch libdir for tmpfiles.d

Stefan Herbrechtsmeier (1):
  glibc: use nonarch libdir for tmpfiles.d

 meta/recipes-core/glibc/glibc-package.inc       |  8 ++++----
 meta/recipes-core/systemd/systemd_254.4.bb      |  4 ++--
 meta/recipes-extended/pam/libpam_1.5.3.bb       |  9 ++++++---
 meta/recipes-extended/sysstat/sysstat_12.7.4.bb | 10 +++++++---
 4 files changed, 19 insertions(+), 12 deletions(-)

--=20
2.30.2


