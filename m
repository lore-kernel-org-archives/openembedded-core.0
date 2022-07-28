Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E62EC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 18:44:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web11.36609.1659033895805876143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 11:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=FuwTfMJN;
 spf=pass (domain: nxp.com, ip: 40.107.7.75, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxqK1grpcoL/VgTXDnQ54wZ3MT5pZnjlfLOuYVir7VwMVOqPOQ1IACXTF9rejsVP/dwL5ua9m9ah08YuQAnoup7KSmct3eZZh+HufOpQzqyhgFjyo44SQVzfa6vvmb2Tkx/xP82wwmA876ifSkfTu2LjIKai0PSuPrgzqHIQHv9W8oVbdthf9o0VT0XqTv32tKeYwQ7nxI1tGeai5xFKe8nx381kjMdBzTZCImuGL8/2D2YsbrvhPlTuaJUtcWcdCxcritK06OZa9gH095sjMXbBeA6bU659UP59l57+zUYXC1jus8oduWB4Ne2bkfPe1tKJPP3u5KkIriB0YxR7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrHkSbozYCODdLucLZlgwE+CC3bvLV1kI9+4KKLAak4=;
 b=j784KJ2HB+J69/6Ikn4pcld64ByH1bXXcjgJLNe2x7X0X/pp1ZHqxZYBdwKgk0HW724B/2wVasYfQTBtSzKA7DIwSJfFTI2WPOFhOyFykPUsDUxfPzu7+33xFjaFvAmjgF+WyKPRyWmp5xz/dOBS6TjHyMsMY4BngEVKR6h60QV/G0Eu82n5NmgBa92bp/im9tX67ELUhIv861bU3SvXLwA8WeBLiKh+nwSgajhwlwgcqf+e7BX/Y6DmDJcWraDlLDbS4Is6ry7b9Et8lJk5CLBqrQh2z5ZkgG72WBwlgXG3otVx3kMEVyqQa7mhvJSYdhXhXKAOATaAwplTqQq6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrHkSbozYCODdLucLZlgwE+CC3bvLV1kI9+4KKLAak4=;
 b=FuwTfMJNcfJZ4b9qm8dsJv8etgYIauQTt+7WLwXYpbwUwGImA8iHuFApb58ZuGJ8qYNb2ylR/cStcbqOi37cskmei1hnfvb5CxeiLtXtqpmsy7J2ggNb/1Nq8rFF0BC07Hdr6gk4SFt7umiT8n2PJwUjy0+WngyXc6d15HGNrZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 by AM6PR04MB5255.eurprd04.prod.outlook.com (2603:10a6:20b:5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 18:44:52 +0000
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::c081:1ff7:5db:5b62]) by PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::c081:1ff7:5db:5b62%9]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 18:44:51 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] uboot-config.bbclass: Raise error for bad key
Date: Thu, 28 Jul 2022 13:44:36 -0500
Message-ID: <20220728184436.1866411-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::32) To PR3PR04MB7308.eurprd04.prod.outlook.com
 (2603:10a6:102:80::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3cb0140-7950-4c67-2ac3-08da70c9417a
X-MS-TrafficTypeDiagnostic: AM6PR04MB5255:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x+xD1l6IAYrNYbVKg1He9ICRSFHfuDXfGKHWlxq/cmQRnbi5TTLTIBredyAVepz2nUaWivI3ZanFqnSm/A1lXbTsJ9yrpuLI9jPR1Qmtw9uFU9rLMWhL72Hv/orKDzE9aVX8/2zu+ud3wAzqRQBixWM2WX5nTuKjVwcO3r/HmprgTE3bLUTuJeEcMUwbW9h9dL2CZndUEEkSCVa7QrOuERWbJo0eCBp3XIeS0UQS2Bdf3sRY2aOs6UbLETrKIf+BZ6a21XGNmkmnPqb6bMiTrmGnIKbsrlRucs9Go6xQPN/cTMUsftcsJrQIU/4PBM5M4y8n/XS/9XxKChwi9rkmwytfk8qELElb0Kdin9izTm29tbUjnE4LODeTXaIa56DuKyX6o5lRLkyAq711lKvSysquVnx/s8u/d1UpjFl8LJTj3082fUS9nuvI18E+sNEQuwBAHRTky3AGbIN611HqxfGt6giT6+jCkwuuGQTSwqWHYlmrUMpKY3r/WQbISkS3t/j83nLpyiEcUiik0gc9N3stAADDaCcLFHJV9sr6KPtYOaUbSnvgvX0THI9KVte6B3PvQ0q+KVXQzvJZt0SqFSp6tyYAweKgLjFEvp4y7fsOkDCeEZENndcESnPiWCGJDKBC8XDd2mdUvoyEVZfHo3CPWN7894mArhvHPELjPFYCltjOAjUSCXGPLSC8vW8DNj3Yvy7VctLXLqbxTs+RLrGAHtZdN8JpqmmMl64DEDhq3o1l2l0WQrDXlIxiLQYvPIN5dr0oRNK3OEHC3iBtAAEM4SoYLOW/R9FO6fTSYtU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(86362001)(38350700002)(6486002)(38100700002)(478600001)(5660300002)(8936002)(316002)(44832011)(6916009)(66946007)(66476007)(4326008)(8676002)(66556008)(83380400001)(2616005)(186003)(1076003)(6506007)(41300700001)(52116002)(2906002)(6666004)(26005)(36756003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PlVSzv13pLQBYxoIkV1Lzvk+BN5eiZmbLOsCc++mvG5klgGdSfmVivtfYwEx?=
 =?us-ascii?Q?zk1uiuvqridz9t2XtU0IkQeR8iRS4QIsAVeR0NUJ5tnLxX09U99hOGGz2e6+?=
 =?us-ascii?Q?pWqZaF7cUfO0sbzVjppKbM3xAym8kz69RZvJ3arQjP2xxLP33AZhC+QqB3M5?=
 =?us-ascii?Q?LruK9dfRXJyXt9L/lRqmgU6y5SiWb58aKVJGxC0WIbvRn7Swky8LqMku1xrv?=
 =?us-ascii?Q?TgbVI8rsHrmizZGaeeNIcB0sN3XEt72wvhtcMV8pw961p13ExUnyyPb3ZqBJ?=
 =?us-ascii?Q?LRUUvrdrg2Z1nrUt/23nITD+Tj/8RUc7tWEn/rkR+GLVjXJq7Sm1HoqNfiDw?=
 =?us-ascii?Q?GnYJ/QEbnXZfkwgT6ClCbzCUq4hNQ2HmHlmwpTAYScn3o9c9EEZ8CuoabVnp?=
 =?us-ascii?Q?nWBeed8yg6ZJBgRCCIJT8AyOB1uakJPLCNgT56HyzqO6CbSlER70f23gz0T/?=
 =?us-ascii?Q?rNR5rhrRKLHBlgA8x/zo27L5f27l+OHcQiLbjg2+acGnkzBezjRPsZ1NK8XS?=
 =?us-ascii?Q?9XS/ti5QByPAkTD4Etflf/Es/AQG6jk2v9beBqWAl+bKS5TkZ1Ykp/Nd7Vay?=
 =?us-ascii?Q?0lc5S5GXTDgHrX08jquI2fXz5/FrH0mZuhSTH/z3iO+eKjlsGB/A3Ob5ekyc?=
 =?us-ascii?Q?8NaR3fXFA0IbkdvnsrhRAc/osdoRvVn86gQEO3xHwJnPbRmL+NaXw2jaSPtD?=
 =?us-ascii?Q?FylyfUc71bcKqE6JpmJ+MJjBtDFEJRuj6ummKjlgKOPC7jZJhtUIEoLbb7Hf?=
 =?us-ascii?Q?HQHI5QGW5NUUIYiwtqEaCEmJjNw0n2gjvRZW5x8T0hQjyiKydz8NeZRm7CtP?=
 =?us-ascii?Q?KijAffnNKziZH4OBUDGSWKgIfM14l3x7N1eM/bEN9Fs0xMH+WKRiDXsv0OT/?=
 =?us-ascii?Q?zJA+3Ftrra+1DK3vUlFxrGKZiPuWzRSrqfJ5E/zOBTMelkiGK33H/MiilVsr?=
 =?us-ascii?Q?QBd73yGzU2YoUid/mxct70AvUnMOVdWesjt1TUXWO/21mmWIYoaSKed/UM/z?=
 =?us-ascii?Q?9zCp5Cp+dloJQiBfP+AM57+e8zMAIQqZX/2mp0ID1SdjFR8NFrPhcDEtfNvv?=
 =?us-ascii?Q?Sb9w0KG8edKHGaw7BAO2n2QewgfLOhfW6hqQLQtnTH8uqndCDowrnZrevy0M?=
 =?us-ascii?Q?qyF9J7ES3R8KE3rcEmPRCOkpaXHdHZnFXqXD+Je3wNzK1V6lz5jgaCVuqiuz?=
 =?us-ascii?Q?gUu9PG9JccqtNxWLv94iyLZgoGrJAtZQf6lzYhMWpDSzqQE+yZk0RrY88QIo?=
 =?us-ascii?Q?Ic7GtpsDqk2ufh9GVhdkbvkNtJ1nMhrG4zn9EnR0T3oJ0xG0e8OmPrs57Txq?=
 =?us-ascii?Q?HPftxiTy8OviV5RjOOSfQyAt/Tcyz5Cjg9osmYOQEgvugRB3vbcERGIujWpL?=
 =?us-ascii?Q?H3I7lVtmNFLT/CZ3cpcSg59YO5ZMTmt5lvHylat6WvrosIAWfYVtf2kKklgj?=
 =?us-ascii?Q?J1jtFsrM1nID4a/+ZgPtTRTQquzpNGFILvWGS3HSsAXUr41XevlcSmoHOtsx?=
 =?us-ascii?Q?LMXUook2FkxeAqLa7iHRH6Uzwqi5siPbqY5Xa4Pp/IGGu5AsyYI/sSHY6xZM?=
 =?us-ascii?Q?BUmJ8zxElg7cGJU6fbgIpimNyHvVp896xVKIPPZV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f3cb0140-7950-4c67-2ac3-08da70c9417a
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:44:51.7483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ntwah6QsO52+liTbX/bJvmbTwlZ3szyxqWfPs6y7cHCeLqSR1/dMM80JPEmoN8dFLr4JCiBYkNLT8GfchGJbow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5255
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 18:44:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168614

If an invalid key is used, the class ignores the error, with an
indeterminate result. In my case, the problem surfaced in do_deploy:

```
| cp: cannot stat '/.../build/tmp/work/imx6qdlsabresd-fsl-linux-gnueabi/u-b=
oot-imx-mfgtool/2022.04-r0/deploy-u-boot-imx-mfgtool/u-boot.imx': No such f=
ile or
| directory
```

The root cause of this was that the uboot config key did not match
a valid option. With the fix, the error is caught by the class:

```
ERROR: Nothing PROVIDES 'u-boot-imx-mfgtool'
u-boot-imx-mfgtool was skipped: The selected UBOOT_CONFIG key ['mfgtool'] h=
as no match in dict_keys(['sd-fslc', 'sd-imx', 'sd-optee-imx', 'sata-imx', =
'mfgtool-imx']).
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/classes/uboot-config.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.=
bbclass
index b9ad35821a..e8da8c7452 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -125,5 +125,6 @@ python () {
                     else:
                         bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % =
ubootbinary)
                         d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
-                    break
+                    return
+        raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %s has no=
 match in %s." % (ubootconfig, ubootconfigflags.keys()))
 }
--=20
2.25.1


