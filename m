Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6119C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.103])
 by mx.groups.io with SMTP id smtpd.web11.1181.1739286099230323204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=JoCP3rKy;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.103, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKP2MO6M0ZVQot071MviyJNjTrNtaLj46yoy8fFVkaQeleESYrP7RzQoBEgM2UBxTL18Elxh65u5phd4B/PbTCTBDZ63LEnfV/kXc5xmnJh349D4ggEsq/6vj9ajwKo4No/AFjRR0Z90gS8owSdU67KH72WZUgyIdSrKCF09336FYXRflWr6pj3S+8dLIE6DLmbFYIsI3WgL8XYgrBtqw1cBZ832dI0h9LVmEwn/ipWd9V9kWMD+uKjmOSUv1HvYM4O4YBWmZlSM+Pu9Vlgx92f6iQgwe3ZvVLB5Hiso80ytsgewqeeRkdcK0lDbqnuQhNJtleiYOPDODCbdsEX6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fW9n6oas1Bmzpj3XMoW8s+SdzCcYugdI8KFol4uQFb8=;
 b=k+GskH6bdFARmGevHUoTkJxMsXwV1STwtwbpLdPesxzIWDl7/xTLOxHfB3aI939JfYGF30M7YTOUYsmYlgoRUCrLGVqnGI2kuV4uHeVy9zTEgdmLsFy3FvkKiP/rLlzN8mtpDFrRR3GNWkCMdzzNJEjseb6nz8nOPy2tjQn4FS/ZiSN/RFZrG44jbaFX5DJ7bDqm7hsuhVVCsEl+lEubNcpTEG7jXiXXZqXZBnI0Ep3yx6SSYh9R9TCy+HBixG9e5L4i34oWIewb9GE9gxzsba0uKLO5ACDnGekMYh7PRg9byv4LziA01hHkcoJd9kq02PQSiIZpSN9qIkuQMYSt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fW9n6oas1Bmzpj3XMoW8s+SdzCcYugdI8KFol4uQFb8=;
 b=JoCP3rKyUS1FCPtQ9xcrWxEPWRZvUVlX7BsuC8gwA/FCVAftsrQ/ocq8XbBnapFGVwLJnbW9vHTazYdRv5s0FpAE2jyTVkuIU+0xWoaESs+1yTcVGfrhMxfXQQhiBGokyZc8QGCyl0aXqKWEBTn8dHDHXGM7glx3wO2BVk2bu9PhocOVqdRZ4eJZ0IqEjaMZObg16z4tU+MwfS0M8Ww0bqGt4aPYbqPQbtvUQdV90eWQfDthhMRZ6YMDSk5M4f5p/efIJOIJkUiM1OWqZ20RQMOj5qhowEnqSy927UWpfJxQKHsfkc5r1jCT4D3YzrgJXzNbXinpuR8LnsS7NgdNaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:37 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:37 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 30/30] [DO NOT MERGE] classes: spdx: use version 2.2
Date: Tue, 11 Feb 2025 16:00:34 +0100
Message-ID: <20250211150034.18696-30-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: f03dc36e-acfd-4117-4d75-08dd4aace5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9YhJOANMiylMMDuBCOcSadA2Dkdj89MtN5e4IyHlwrdwQzXqt+5AM02lh1i1?=
 =?us-ascii?Q?Q0W83NK1VXAk4laOybIoZy1AvkDjIuq4MJGe5j39C8siwqHkvRwTu0XmV0Qa?=
 =?us-ascii?Q?gZyCLeaaHz71GYS0hmnEPmI6T3YQW36wfdTjAbHP+9wzs5qIJcngcGqsVY5l?=
 =?us-ascii?Q?ClJTr+fwXd3tlLAE0rHuf37/iZdJwHEU0nHrhqvQT8pUbZlEpsUCc/rFX5gB?=
 =?us-ascii?Q?8op0DOJRhN2sWiAYarOYhHmjgHf0GPNloGTj7hHgeHcEhcn5v1ErCsMGnmCh?=
 =?us-ascii?Q?om+pCFdmTKXZpQGQ/dcn5lDrzsOkGU1xXBjIwEp8xTtiHYmLCaxJ7G1Zenrr?=
 =?us-ascii?Q?iXxTx0iA91l8cXudV8GxOTc0ZMhAdn7uI3XDqMBrCF/n6EiIqZ0p3UQ38btx?=
 =?us-ascii?Q?q07/4TKwo3oMtmXJfvr79t5EQ8IQxlueDTY44bBoUGHIpAXEC1GThNKrMjQg?=
 =?us-ascii?Q?XT02zNIy50BwtSMFkkHOXkvEp4ySh0oSTib09BYPe0tk1L+JzcjV10LjoqI/?=
 =?us-ascii?Q?GIXbzlOsjQq/XUl5SIbmA1V3kEpgWBB8hIvYEmXND2WMuecM7oZAhYl44KJY?=
 =?us-ascii?Q?3y1B3gcCSEY88cNyPow4vYHCyNicg6WzyblcB359Ho+JbToe9LW6ARxjodTS?=
 =?us-ascii?Q?jX2lOIikk9xmV8k5X66Fc9x6R3XVoufqJoiH9ftf69BkvyXSF3W7YqG+Ngjw?=
 =?us-ascii?Q?W4t1v6Q8cIS4zPNwsBcNQM6PgZD6Ma78NxV6n94pc5J630EfMeSWj9wsNAJi?=
 =?us-ascii?Q?4sjYNCe2VdB2VMFTK6hxsGR0okMFYlshlg1tGszwPLKlKMqWI/UTCt1yCTsQ?=
 =?us-ascii?Q?I+WcA4yW685HtQ5r9zQ4IzLAWQaGz42nMzE7pSMXwR4dxTRYij1mO4HWtbvh?=
 =?us-ascii?Q?7I7/OMEpjqTjXuVjEYOrGtbVSdE447oAdfXmq87HMeW3nfIpJhq80C1qY9Be?=
 =?us-ascii?Q?RNeNytwRckOGs/lL+xtYz97YcA9ZLuzSnWoemQPaq3Tu6GyIYOvdE5RloiAB?=
 =?us-ascii?Q?HmaKuLvyWw/bK2N7Qv11dE59nE3wu6Wc728N8oKJaoCqtyYvgcfFLMX07coU?=
 =?us-ascii?Q?VLRIy8M3kVhb8W95Vm3skBYoDsq/qKCMcbFLTFu0xpA1GTpH/Y42VLx1yPDg?=
 =?us-ascii?Q?LwAT5EPOsKwMx/EmunWTUkYvR+WD4/oV6Kp5O9aqt+9F4ipOTi9U9ViTyjm1?=
 =?us-ascii?Q?dqhdhgUGN+BkYAPWl9i3+rMErFx988fkmddSO67Nz+Fhu/biFKyXI1wQEVji?=
 =?us-ascii?Q?cQErr5UDeCaPdFUl5ldR4k/TD0W2PjBzIWXuyKqG2+KgvshXnnZQA04HlXtQ?=
 =?us-ascii?Q?kqq85QyOWG36clnMJ93FzZ1sviaAJFBfZfJBahVW1PNeAArjfjVqfJls0pHZ?=
 =?us-ascii?Q?4i1F71WUf6NtEwCBunq9Mek7so9vHCTNvUs5hOZQbVeu76boTxhfV63VeaC0?=
 =?us-ascii?Q?GZ7YeCstL2IcF8CqtrPLH0QMUBhioHki?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VH3KJDdpkY7uHc3RcB+BkzyurndS0CeZ5RgCU8KlBM+6ps3Er0TnZQwDHsJV?=
 =?us-ascii?Q?1WxZYbWApdAs821X3uM5ZkWp+68a73H3vteXwHTQr9qS5QfM6kkgn/CFOHOL?=
 =?us-ascii?Q?YMHtuIIxkiVbyQznBBDt1YYszyM+kI5YPYf4f3OLejMx7aySfUA/EIu/vQsZ?=
 =?us-ascii?Q?FxzGyk+e0ATqxYn6JcW2dWggtn5E4rHVQDwrGY2I6HNhJKKT8nfGtrb1VIls?=
 =?us-ascii?Q?fSu4gW3N0l9DMyInTktDWcbeaJO5PIrlMzkqAlGOlFoEPyhW0bX7gfQYk5AC?=
 =?us-ascii?Q?IOiM3GoHPYHymM+L9eQ+Df4cVpzUn+DbQtrSTADvUazNX6KAKg/PJOXAfpod?=
 =?us-ascii?Q?dpXcScKLPA5Lt4eokl+d1M4gOjYnloK+zio8XSEU+QDXO1vPYnsjwSLZD0aW?=
 =?us-ascii?Q?7ON0ub+x405Gj6ggJu2BRdEpnEfImBP0p3beiyksVqKGpPolFxX3p6/GkBc/?=
 =?us-ascii?Q?NN4CiLCQ8wIw555lWJmhqRDDQuqSJMZ5iwWCp1NP/kHjnstKXvNqHJ3n7kAx?=
 =?us-ascii?Q?eJsv8F5vXPEuyNmF6JVZHnNJMixcdQ7Ds9TyigqoOjFrn0UWoITC3vHcfvyE?=
 =?us-ascii?Q?1Z2gTEf/EDK0QyL5CoAEFKKwNhEwtbRsES6GDWKvh3kOLRXMikTc0kJSg3Ha?=
 =?us-ascii?Q?6zrGJ7lrHd4jVIoH9whPLkIhSzIACkRjQgynIcGoqaFXq6mAojiDcKLlM8xL?=
 =?us-ascii?Q?jmM+axpSmH7e06mfhCbtsFbCs3QS5JN6y5gKF2K4U/FC0sCo7736K4C9L24x?=
 =?us-ascii?Q?L3d0SVsfjT1LRplkXmenwdofN4pN3hzMc70ztp7b5Jsze1mYcK+rK6vodArs?=
 =?us-ascii?Q?yNJmIvf8tyqEf1QRlHVhhWUkk7jtezeuXpRjUXmJA01scv4nxyLv1irQDv3T?=
 =?us-ascii?Q?S+Cke5KWQzWHHbnApRXXJGkJ7fTb7TxFj/JF2Vu//YQTGjaGoauu0t3qoLms?=
 =?us-ascii?Q?BDHEApAYZ4BQUp3jFdc1mktuLazqx6tU04rf5Y8Bd7ybTXa2EQ/UX8nBH1w3?=
 =?us-ascii?Q?T0E01XaTSY4zHHluRtmmmxSQDYMbRIt+jPrXLJKIQcI6yyRYk8pwg0e9E3Wi?=
 =?us-ascii?Q?/wytTXKTwMv/UyhXzXzfAdnPNSJH/IWRd9K6AG4U3n8pdJSWxtG3RkpwQ7L9?=
 =?us-ascii?Q?8L4FMe+SDDO4rje2/cn+VV8WlZ6wJIcFIyQC+0KWGGs6QaV6mHNTEz9n8wzJ?=
 =?us-ascii?Q?EL9MriwPsC9PKDCN+XXIUCKNDoOpC8/dS1Z3vbThLhPtpM3i2jkd2Nus1whJ?=
 =?us-ascii?Q?Gy8Zw/cV7AN8ThMDsyRfQGgm1ytCKeoo6+2EXmZY7fax66T0N8h2QnpxuZfs?=
 =?us-ascii?Q?jKus2PfiLLPFJeV2RjvJSGYIjmW3iypxWtq2Q/BJPe/U7SiZWSbifzym/1sh?=
 =?us-ascii?Q?nmGqkab+poIFoX3rNiEXheTIBztiBkEaNYx6HuhM6lHUCKM7RXH65V4adzjx?=
 =?us-ascii?Q?DOVMkDVqA/RevCthRJXyZGm0Kym502GjvKNQgI87GWEJi7u0goKUQbEnJXgy?=
 =?us-ascii?Q?iMT8tpCoSWo1w0G1AwL/eXAWdIHdpaA9uoYGp8ZpBgfnShYaCHmz7MhhASZo?=
 =?us-ascii?Q?+DHR2Z5hnb1XeSMHjF0tARsNtu2jNznpmuzrQcycdSmUoXU/B80Z7MYhsGxJ?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03dc36e-acfd-4117-4d75-08dd4aace5f0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:01:01.1376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfHU8z1QYIMpvBT2YD/7xRODIeKiMeoWAxOK4iWzKngtzXg8tOuLQ3Eao8ZrxZfiNf6hCquCxFH9XRdIEs6rrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211156

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bb=
class
index b604973ae0..19c6c0ff0b 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -5,4 +5,4 @@
 #
 # Include this class when you don't care what version of SPDX you get; it =
will
 # be updated to the latest stable version that is supported
-inherit create-spdx-3.0
+inherit create-spdx-2.2
--=20
2.39.5


