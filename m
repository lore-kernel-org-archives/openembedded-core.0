Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4087C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web08.6874.1637765286114657847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=sRKm5ALc;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7OVYBdi5N5qO44RZApMTCywpLkQqI0lFBitkKNCPs2heztoZ3bjRDxcDlmc4d5djW9yhKEclIE/75q7Wl2HwAqCBSmItl9LkYZDaIVboV2XyOOSS9Nb5albLlCuNzWEggH5bpUc/BRkmbYVxppM+BBPu9uLnc7Prw7TYWTAhlvD5/R+s6c3VMgrALgaIX1+lakiA3RVuqDMuUvO0SE04eZNplHk4VpN/op6Sb64QLMGbuOhT6sqnL+dKQcaomN8nkkjJ5lk6vTzYZNL26DuMFiWRHNC/TB0F0hR6tooNxrMNPw1WWxpVcSwTRwbwF19tcGx7uor+jPTMlVcfonQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4aK2zT3YUBaI8kpiQhpgiMzQisK+tjjQdnPM72PzNI=;
 b=E9oIsO3EV4xAf0MrMUZQE0cd+R3GuUgv9Gl7B/v/XbBkL20ybWsc4HCEYFP+iu5u95aBFXIb326bCcLyE46A04ej9KxK4a25K9EUlmb0vs+TTG87ZWSSJ7ypWpW3+GfB3D6kE3CYX7253Tx2/gr9+rT5yuwAyzuBboZBH5UFr+dFBU+F5hOATiJsxRZgjRqUk26IWx3SdUWqiIftdahlwLMGwae+cuaVc5LPjgWk4JcQAAN28004T/8od15Yi6Azj/pRqqiqfFi9T6hHaqJJOoh6mTiplgrfV/mp9OPHbXdpEVPAmDyu+UonZoPLHc92WBrFNDtBY3q2DG3lGgFuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4aK2zT3YUBaI8kpiQhpgiMzQisK+tjjQdnPM72PzNI=;
 b=sRKm5ALcGxBDoxVFTHxnVYnEzT+ZdcZP8dyrreaq3/qfRejVty71P6/wNGm3D8r9QgocA31aJ6kiKq3xy214abXaYAOdq4dfIrvNMLQ3xWWaX8AqU2Y+5Z4epwdMvu1tsw3z2BUUgcqAZRTiWvLZMa9BEeWjVcezGam+TIF+eKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6447.eurprd08.prod.outlook.com (2603:10a6:102:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 14:48:04 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:04 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 02/15] recipetool: Skip hbs extension in guess license
Date: Wed, 24 Nov 2021 15:47:26 +0100
Message-ID: <20211124144739.2250-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8fb43a3-673a-40f9-028a-08d9af596b6c
X-MS-TrafficTypeDiagnostic: PAXPR08MB6447:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6447879624DDCE724E4A2706D7619@PAXPR08MB6447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ueeYy+lsz3iapJiASCf5gn4zAQjSBuXIUMBMXDbHqttjRLxsy6TC2BzvE+eWoK/Tb3MzwtQzEPLZce7W4NYFHo+gv1K0Z6NFxTlwmwxVxClGjyZUgC3NyBmwGAPmFX2yTOdJdx6iA0upd/V7jrYNIrOQTOlahULmxhrlL8xaUtxeKaXjDoddq4scIU33+dWH4k2FHmlx6L22cK84EgaQMru1gMKcwjDqzn8yeI4oUOGYL5kUfCvOVS1oePt4fgDtel4bFpiPQr5hj2dEN2HpLmrFTozeOLYK/pAkSUzek9+pqBhXmkg3HnciFdhttvpXIFD9J5xOhJsGsvblwQzG8LfEogS2cYGjtk4yqWb+pnRvDBRxVQq7KGiVj5owJ2ApLRoonu4YBYx1qYPYKIjeAPE2I9putt8Ke3b+Rp9ovysc/PBcXM405BAfT/VSVDbp6sKeJrng+T4yhQa21IDBg0zlzclbjlqtrrKkG9GmtmCLzWo10YMHbYlsv2jlax4KbePVw2di678MfWlZBuKeWKM1tO30xeZVRRlS+BEHXHAMfHfSJaqS4hmNvZhSFK5yfmq5r21U/34O2C+Z4zfQNOHWCdOQE4vzflsqgz5GmvAonQ21KcTZl4KgqP1CUOlix0miyHHCHcf5pBHuf/vZM+6mrTUferVzNjvfI/yjcS+eJnjhtDJAq/6MDo7E0RsClkU4ef+osXZpjIhTCVrtRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(7696005)(38100700002)(38350700002)(52116002)(110136005)(2616005)(956004)(66476007)(66556008)(4326008)(66946007)(36756003)(83380400001)(186003)(4744005)(26005)(316002)(8676002)(8936002)(86362001)(5660300002)(107886003)(2906002)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wOfe7dh9+oXRDyhMvhnXug5q/iC3WqR3IXbgyrfjlHkB0GR7lB0zLRzwkWL2?=
 =?us-ascii?Q?5u+loyI6GW7V5TpU9S52+llS3+uTyunwHwrMFN6GxEy5ipRHD+lEnjS2r/ii?=
 =?us-ascii?Q?EMMcLK/ttEUpPIypr7r/jXC0NSQ/DiUHauBqL68idnqdvUjgVHIKhegwtyHs?=
 =?us-ascii?Q?UAajvLdWjGVA2F9TCCxBaCTcx2YGi4CZ3+omaSdrjBX1w/lWpqnAKT7YFQgc?=
 =?us-ascii?Q?WluPa0DKGhmdFUkbi5LGk4UelY9eOqvMgNhjQKrRoYtM/RM7NC9ZpAbuofZR?=
 =?us-ascii?Q?z7qglupRXpZV5A7Xscy+eiiotZeoUQqc3V9h5eqp7faaU/IL+KwqyYCRuedJ?=
 =?us-ascii?Q?Fl86Oe/zMc4wqLsIaVYSexeRJI1OWKncnNeAr7z6bMeCjbfut4YtHusohvwy?=
 =?us-ascii?Q?IprwEb/rVuXDkjUIW0TO84EN72OA4oaJoLVl3mhTqN7sEV2ii2/9JZNgqN3g?=
 =?us-ascii?Q?KDK084SKeSQNCFRCYYnndkdDX+Q/2ggjxtwEDi6q0XKnnPbbwBNVmmPhKIIR?=
 =?us-ascii?Q?C8M2ffkfgmvFhegnhHSORbce1osM9lxUV4QUsuLgRMZ3qmNK/ucQkw9Ce+Xl?=
 =?us-ascii?Q?OZBs/6dXCb/1jklce92UNOqhB/JJmsaPBwOKjQzs/DIOu7RGJcy8+cHkMVSv?=
 =?us-ascii?Q?2vTBzjRZhIxD272fMtsqS6b/zjrfCGo2E1mUrxSTTWCA8xnMZJkCHNs1bcT4?=
 =?us-ascii?Q?jeXeN+8+WiXwb0ydz1xHLlUGj8xJ9ziK3MF7MPfWll5WU9fXrGKn8xnGDRU5?=
 =?us-ascii?Q?AcDpXtIw401TabzZV3RdSkvLYfIcL+mQdx4nKjJn87q7xXQ04Zfo0djNjvcW?=
 =?us-ascii?Q?zPIF3EDVZgfJ6DYrd+Xs+2btWLvTGxZYYDlh45DrgZYrboXrIBITQA5SNCOA?=
 =?us-ascii?Q?MYv9zWJAloxA280oZ/lILCT7b0RZUgM6ktN+VvLf97ERwo1v5+kbjU8CJBvG?=
 =?us-ascii?Q?3tQCC3Zsv9bFsdqGMZpQeuk2Wca9TTHbBYsREsPaqwdUFBfAn2CeLcDU5eNC?=
 =?us-ascii?Q?R+vNBSlKY4GCbka5w4lK33TMfK3h7rPbjbY4UqFnVxbIHWoZmEMFTy/P6YT7?=
 =?us-ascii?Q?unPTnmbPB6BA3IXto8VZ4kUmnwX1T6DKwo9tH6Mcwi4PWmuHUnj9b1+aFtln?=
 =?us-ascii?Q?8Wm1lwXFfC1ayjkNRilY07wYwlQgbJYdpoZTv8ja0J4QF7EN3rKHgn1sVHeM?=
 =?us-ascii?Q?J4k8ZiNyV64VYNaI/jO5a8mSoFzgGqGnM7V2dWK8bw6SYUjPg4Aso31LaFHA?=
 =?us-ascii?Q?wUirDH2mxp6kg0ntBaiPQQiSpip75jD1LT5jUEP9CT94BUzqG5VA0fcJIQFi?=
 =?us-ascii?Q?ay26iSyZLqfeztAz7cwdiycXMxZBhxN628TnfU5tcBHfp62iD9NvS1mDNIqK?=
 =?us-ascii?Q?k25UnO5waYlASyodEbtSngaUmeHPXaR2WBhAML9B6EVI9lDgr3BScA395HxF?=
 =?us-ascii?Q?JYY0SGd6SBzTIgnQMd7CdUg4Brfz2Eey73kONWSnq+FpYdbpL8DAbYM7AVQI?=
 =?us-ascii?Q?Qcl27mhENPUDxocp5pE6Yq2HYD7Ar08e/NxLdiRecz1KzzbVfwjnsSTCAbtY?=
 =?us-ascii?Q?44p+/qKzkoeL1QHYdWZ1KlN+qWgnWfc2LFafhExzS34j9bzBYug5u/VbLYSO?=
 =?us-ascii?Q?A8q5u7B8AU3NMhalITUZOfw=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8fb43a3-673a-40f9-028a-08d9af596b6c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:04.2311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 50Lo+r81GMzEYZaimIB5xnGdZ4lXdEbFpF1+tIbD0yaiVh6GuYpXMkC23yMUsI/y01bG/9nwgenbowvphyRJ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158698

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index b6c4564761..d41653e7ce 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1191,7 +1191,7 @@ def guess_license(srctree, d):
=20
     licenses =3D []
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[=
Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v=
10']
-    skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts")
+    skip_extensions =3D (".hbs", ".html", ".js", ".json", ".svg", ".ts")
     licfiles =3D []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
--=20
2.20.1


