Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFDEC56202
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 14:27:03 +0000 (UTC)
Received: from mx-relay117-hz1-if1.hornetsecurity.com (mx-relay117-hz1-if1.hornetsecurity.com [94.100.128.127])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40017.1771597613647926585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 06:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=rYcgB+eo;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.127, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate117-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.65.99, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=KeaCWfP7j82Fy2bPRgd5wBMFw5uZhy9lu9pu+HHdcpE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1771597611;
 b=id1/9JxyKNoFzls6vx1+HJItJ+9uFuv+OUCcv90/fx4EVShPB1P0wkteOovngZjs0R1IKpjN
 ApjTUe/sS+oAfgDVJuVEE6beSla6VGTdt05vpVHjIErtq/NytdfBStbgOVq3OweFNQDv0DbPc0J
 kImjm0yQs29KU4+D013lXQHsAaABdjoiJ4R8NC30vYA8lS/zqwNj6N1L0AttzVcmEwwv+UlkzBD
 rs/DOX9FBbyjVAUS7WQ5jhu5METXbmAjXmOfrwDDSjDtYQo15SAMQWDoHXvB9ittYbVlFgFfoVW
 o57eP46OJTbQUibfeLIH4qKYFJqb2dL4cza4VzyhEaJjA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1771597611;
 b=gOAG3Hjt7nJTprm6bSSgyqx7CKFm3SgNX7PhbJaHCM/fLMJM+/UPxp/G5dhc9RF9DWsqFIPt
 MLaOz5q53sGNcH3PP/hA+mKEZQ1P9ycamosK0vw0d1Ji1E4vKuw2lCDy0HhkDoh+/GNqU/5RjZk
 Q1wztG4U4T5TvVsgNAFWsJcjlswGVnm02erlnwVPDhUpZiu+wFP8NDhdCLPc5o8cuDX2FthXZP/
 qaOjkwCOKVNJi8MdwPP8Ljp42Aa6Re4Ebf1v8VSSvuYyL1GdtlURtZrY/Xo8UcvVAQRCsN01uWq
 qVsMEqVIj4f9B6d9MO4fqwssuEQ4m5BHXfK6DLCNq8B8A==
Received: from mail-northeuropeazon11021099.outbound.protection.outlook.com ([52.101.65.99]) by mx-relay117-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:26:51 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWAHVraIuD6MNWdKMB7GrWbagahH2PdjlxodepbaDcHHYB6dZtM1Ffzup7sYGBIvcpxrUKkMZLff18VyWRrSe8mmm7fMYg2gW9KzlIjExcxoMWFu00VUmVuViXPLOggl1PRRsvXabACFr2HLg0kzLDgE/a9k5888H1FUJjvshbJPqmnwSOcAfh84Ja1PlymlSFeXm2l+EVs0l3dDkls2p9fLOPo3yMicBQnI8O/CHBkw48mJm0tMYSN1KfR+InaH8Mb/fqbXZPyk4Nr7HRYJzAqJKS6WLKrV4LQo1T54EwsjHd0GfIdcGOHOR/XkFSe5zTbiXVazWIwiXv3/C/34hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeaCWfP7j82Fy2bPRgd5wBMFw5uZhy9lu9pu+HHdcpE=;
 b=wNNOtA9bk49cR5siwCuhHQUXEeBQ6IbzgBTACuS/KN1041n34x1+JP0dQLSkPCqJaZMSoBQa33ZzNPgjxNJR37c29xyslMMOAWUxkdAOq0uRK0yvHcAyRqpJGe5DW8tCjTkumFJLPm5MocQNzp0Chc76yZ0SRSDzMhN9ECHShLqO4+yoU48y4cJjNeL7/p9r2kUAd4C1Cq8Rl5DtNGSqS9cCIMarqQCgBwUuFAS1DbUI2Giz5eHjq8geQUJW8BRZsNYcZvnQMYvJyr00qLxKU7MdpstTUxsVNt7n+kqL61S08eJc6YHjDdmNSsclWKQKGPAmn7Xz1DSLdx9MqvmPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeaCWfP7j82Fy2bPRgd5wBMFw5uZhy9lu9pu+HHdcpE=;
 b=rYcgB+eoDKw+9PCVy5xvF2XJ/yhDhjPK6/9HW0Y7xnW3WaQQNYHK72OZEmflTaNkWoxDEQq+85nwnXWtPsQiEaCDQITPieNY23y7zpMPlfwbYSxfUcj237C1F1KQJrhuxyIduh2Vq7wR6zckNTL3/CK9PDWNJehACIEw/pW0kFZb+UkbWJH+1xJ7BtStPrETFc2iToTOiyPwjqSpf99h1p6JFGkn/3ak98Bq4SDr/I89yZk3KC2x3MVUXZsjoMUcu885h8rU6EAxUftxipDAR5L1lyOHGfba9al32rOz4J8Js2dPUB/r1haY2zE0bOmyfjpjOp7MlIUaaCTCO5+DsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 VI2P192MB3097.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2e3::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Fri, 20 Feb 2026 14:26:43 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:26:43 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] zlib: Fix CVE-2026-27171
Date: Fri, 20 Feb 2026 15:26:35 +0100
Message-ID: <20260220142635.884746-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::8) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|VI2P192MB3097:EE_
X-MS-Office365-Filtering-Correlation-Id: 991b51dc-21bd-4959-0240-08de708c1209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|52116014|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tPg7s6br1pBRmoH/6wVCCjYzJbLveG9aeJPbIg9ffZFLGML6OfiJToawPEZt?=
 =?us-ascii?Q?Rd5fMqub9g8XOQlb6ixSvT9rI3tUx4XHZZ/MeHArKN2PNzFYbuDndMo2hgB3?=
 =?us-ascii?Q?Ev8+SBLVmocWcJRVXB2TKtYb2q8lPKtcBVOOtfGSASfN9C3jPXDo5AnIuVl1?=
 =?us-ascii?Q?Zn9SFrHLgFgN3b/ra+zdGIgT0VsYxHAfPL9NOx2kTd87ksckvalx49U93pJk?=
 =?us-ascii?Q?U/Ru8pm5SY+KZdbCcedKfwElbYtd3yTMEfJo8GSXTagL4Pq7KSLreWaGRE+B?=
 =?us-ascii?Q?6efKbyAS6TsDj54lNUQh6fy9RmUdC0LRDILkN3mU9fjb+jqW+hSXex+3uYOq?=
 =?us-ascii?Q?Aqq0M9XTZ8PhoSx9Sm8pfMjE//jecxXneoeA5Uq9FEg6FyDTSRNVQse4PGvp?=
 =?us-ascii?Q?zpFSkm7tGVDirqsx+wiURzokBxyR6/+XVeVOzY98RSNd8i0X6lVrtzisLLub?=
 =?us-ascii?Q?LAUGzedLRlCpWrDczvm3wbde9cJf1YBQRW6TnXBGacpUeonYrNY8v/UKLIvo?=
 =?us-ascii?Q?DOMywoYDEH8mxI4MVwwKe1d/kVJK7KPYFnO+S4Z9N1v9JQdgAlBp0vwNmflN?=
 =?us-ascii?Q?k5OkNvYVXfzB54J8IITcYM9MfUSl++JyKtJTUTDPZb2HDgtWZy8QzBtkDMH3?=
 =?us-ascii?Q?Q2EWprJFJC5f+67RWy9KBwNkUXUDBHaQoKuwZKM0qxAdnDJYMDcVHZKJooR6?=
 =?us-ascii?Q?6fjaTkMYmlMAu1qREjrVasQr9MHG6C1beE0tc32AjBvMCNJs6qlroUKJUfaK?=
 =?us-ascii?Q?CmrfAoXKRkt3SxXB1bUhSEhhPdQOhHoFKf9GrfQ0eolKAWsgs+ArMfB3ze7V?=
 =?us-ascii?Q?RknUfxzU450mIRoJuQloxjW2BgbbwDnFMi1m+CG/rAzu1Y+3SBjQcx7q7A5k?=
 =?us-ascii?Q?f/MjRuGbRAWuVd/Swe+uwweaMA1K9+JvVGDrOoaorQD2Tikrn8fvdelxVwLC?=
 =?us-ascii?Q?XEUvAwj8AHjU4UZ3yP+m3QLL7E4GannH9so6vbHy6AJc68cGiyc1O1UaQxt3?=
 =?us-ascii?Q?lvRaYnPqK8WOGZhyyD1tSpkaXPbuowy7L7F6rC6PV+2KbEoDwagURmCcMkFh?=
 =?us-ascii?Q?EzhsCZkiFIeQo74QLjMwghPmzRHodCyKn+F5YmPxTq7IR3pQw5QWOxOk02cS?=
 =?us-ascii?Q?hmSIbPGZ6IOk0MZEKaUBErR7G6bdILHE9q0XxP29FvwRwXZm9esH0a7PPTUP?=
 =?us-ascii?Q?o1QOFsRMOB8nGWN665UTLz5bJHNSnOJxk8xm1upnRpCbKuo6bqMu9i+j/kAs?=
 =?us-ascii?Q?hh+qJPijlGkXAOTz/hmDGewmop9K/rIZm4ZuB48fhFdHo1+lCGIbDFR5+ReL?=
 =?us-ascii?Q?/OWiEPazAfAfRv4a67tVraKeH48UidyuVSBlqttSKVqGNd/9oDY18/IKThfy?=
 =?us-ascii?Q?Lpjq2ifl155RZAI03STRtxfMRUDkHeG2rZ7S0JpxIz5ianpqBPiUn+vQVPvy?=
 =?us-ascii?Q?gHS8cwnHPwBvWcW93+sjGMEMoUwawfRT6/PggkjDsPwYPwBNo0phtmtqeLl6?=
 =?us-ascii?Q?TKItlaKMi/acsdWf4rgpcgIbNd5dNNJ7+SBV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(52116014)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w1jQgwOHs8UZD2M726T8Q/ruXa2Xp6rvp1d94OyxUsRVGvEajyLECbDOGPVH?=
 =?us-ascii?Q?IsqNyCUM/gVxvWFk898cKlwyUap1JZDl1vJhKFSB5NVLV0v12gO20JHPc1Ku?=
 =?us-ascii?Q?lTRshZKsA5P4RFzmAh7Tji9aFkDiD7i0f7ouXym+iiMvTe3lueT1vPWL5CLN?=
 =?us-ascii?Q?ndeRGm48LzgdRI/70QVokCxF1CHCki59O7u3MgQYh4FQoIa96RmOq39RriI3?=
 =?us-ascii?Q?gXP+kdjB6vK2lFEC9SoTtoVoQajoWaxrQ0Mw1xFcXYkWGYdENaDIJW0JXi5c?=
 =?us-ascii?Q?1V8Yh9ImY5kMFQ5tshQbJ5QONrakBHtZ1oIrMf7RxCCt+ioQTR2fN3e25QD5?=
 =?us-ascii?Q?CYqm9liR9TThjTjGVez31YpsmE6LBlTDVaSsBeLV0r4kSgqlH0Ao4gd9APf5?=
 =?us-ascii?Q?RFxcB8Kmj8QBjZhyDjp7ltaIkEy5D4UzCCJYQuM85O2D4s7YWSl5NCsFirAL?=
 =?us-ascii?Q?lN9J7NdlypX4LpUXRfYZNWolljxWAlixJkpubz72n1GbQ5LN99t93VVzi5q2?=
 =?us-ascii?Q?e8hbgO/FRHsqjgk7GG1Y99ZSrRB6oaPEgRviuWDZ/8hwTzvWr2UoAw2sXhPW?=
 =?us-ascii?Q?QxGEAJxvbVwyj2Hgl4FqVOUeDWiQd6HbXZVn4ffBpo/IFu+RZooVZt5xYopD?=
 =?us-ascii?Q?jeiIbXhsesScABVKUC41CLjKaf39BIafktqK3TtPk14Xx573Pc/vjnGoLPtJ?=
 =?us-ascii?Q?Py6RqwTF+eQFo14q5a0lLiXCSUyPe4MZF1jiKuN/fQC1q45vtmfK9xytZCu+?=
 =?us-ascii?Q?tC+8NuXDCIR0JX0jHWUm0wFxjena82fvtmXjxWLu/t8AVk5esdQ/SghMxzT9?=
 =?us-ascii?Q?cW4H2fZfWLGU30D47ndRxAOWh3Mk1fL5xSPnIvZ9qtbqUW3SeLLhnz1RBY5U?=
 =?us-ascii?Q?n15SVj/AsrZn5hzuO0EGvxyuuEkjenFisuCo3rG5jn8M5nRq6i60irvpcZbU?=
 =?us-ascii?Q?MmZk9nYgr4hPmZpxxYwRCVhLGS128peluEW5q63Aa1ETweVKkY9sKNBXXrn5?=
 =?us-ascii?Q?2IA/HFVMnNBEC1+6QiBOKe8NJ7PUomhoLaCX76xVNULZv583diUIjWaoYtHX?=
 =?us-ascii?Q?Ow75xxhkp0yCetMR6A2LDRjNUWCA+MD13Xe3OiDTkK3HVzkwE+z+fEHzFbBp?=
 =?us-ascii?Q?pl53B/M2VkhCpJDG9KlsyTSfXYrlUjQ+5YWipNHYLJN1JGAQJv3SwQH9Tpj7?=
 =?us-ascii?Q?SZ3PbrNE/9H1dxtsYmPcJiPGPSkryFS2aHPJfOjxyC6qSPOd9gKLx8tji7IY?=
 =?us-ascii?Q?M79gU6gRVpN/pNw/w6w7VEZwFCizxzIv869ShPc9n7JLriuMazF7xhr0eHRQ?=
 =?us-ascii?Q?jp1rLoa0zgTAhOAZ1jKAqyNfRmU5WSdUv1OipFlYbRq9GcUD9ciaNvFgQPhs?=
 =?us-ascii?Q?jsGaJJNIv87+a3odcwTdJRJxykJoBH3au5UbLKlFZeVR4T/hdz6pR2uDCwtf?=
 =?us-ascii?Q?kwJVs7Z+Ba349bIMYsaHqDK+fgvmGgORd4zePTdOjtlgpHO0C+mjvpXfG1Ds?=
 =?us-ascii?Q?9Uh4b7BPsh7kSvyFcCUiVq5txokrGuKR+XvkoJUowL9/S7fL96sa5nLhjZff?=
 =?us-ascii?Q?jTuHY73cpizahFXZD+1YR+3kBphUdDFOoU1fN8iEFh2qDi3IWXht9RYbAopj?=
 =?us-ascii?Q?l/ohGzoboBeTL4uVJbxi+VIq3SxOqrYaJLcOgniFooxA+KmfI3C+wNYH7n/N?=
 =?us-ascii?Q?wcIZVBjZhgDyccv9/Bw2KNB7tCspy804bsvF0vYJVz8PfctFUJnA1hYdy/Rf?=
 =?us-ascii?Q?CVFjqEgskZgGBeLIpVpzoNWYmx3H5UJxy8mmsMpuKXUecZWqKgd6EoNeG7Dc?=
X-MS-Exchange-AntiSpam-MessageData-1: pwGaF7fuZReIpg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	W6tJPVi4otRcfSrhTOM2qI5mbuJxX96XsKSCDcbvEfGQa4zXrslDxlmw/rhcpvky2KcAb2QU1TQn7VtZEcR9bvBN19RQUzdzxe7ZAc9pRT4eBBTZFBWsmAme4yxAheZPJ7SbIxF7y1VLuxTugBS3Nbz1gb/h319F94v2uXxfQ/NVQzna6X3vgaW09m/R7JnjxifrifYo0XCci9ZhLYj8KuS7lnzBVwZmt1uAOjejAvH0qWKWAeqgCQJTTsLmDQQ8qE0QezAPbHc2/DpHD6TDbfBe9tGMWfMM7RsViIfxwO+VnzRfDEplAU0+fxRYgym6iHghfzz6p+Pfr2tsw6r50ZUxukLGucrbgtDXEm9Fzi6Fd2hpBjBWvfePncwfMjHq+9TdjnC3OkXCYRWA/j0yUjpp7j3afqJpghNZG/570L0aHYYjRHO4+p9l2N0gGdQEVnMfiewA9J5vV6Ee3H5nIFDTCMrlQM3EeT8Ih1yk/rb0Y2Qivxsjb+SZ1fEzQ+hO2pEdZukBFtG3iZh5LaFiPCwOk/c+Q9cXvwzXCblKI5lNir5UmsFfW7X6a5pTv2EuvBBgl/CYkQ08H7wppqjRmmhyjpu/kfiPLW32qlnNgG5zTOAWiWExQC64cFtRVZmZ
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991b51dc-21bd-4959-0240-08de708c1209
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:26:43.4081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLgjZDOHpRZ1nA+Q8YmeLOEx6Ka6WQ+QR1zVsmCMo00UV3yNy0Pjdgu5Rh8Ht3snId4V3vBY4xl2QV0kFS0WvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P192MB3097
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay117-hz1.antispameurope.com with 4fHXck1Q5fz4Ff0Q
X-cloud-security-connect: mail-northeuropeazon11021099.outbound.protection.outlook.com[52.101.65.99], TLS=1, IP=52.101.65.99
X-cloud-security-Digest: 9b3a8a9053e2ff9efc454770a75c457c
X-cloud-security: scantime:1.644
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 14:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231516

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../zlib/zlib/CVE-2026-27171.patch            | 63 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
new file mode 100644
index 0000000000..e6a8a3eac5
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
@@ -0,0 +1,63 @@
+From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Sun, 21 Dec 2025 18:17:56 -0800
+Subject: [PATCH] Check for negative lengths in crc32_combine functions.
+
+Though zlib.h says that len2 must be non-negative, this avoids the
+possibility of an accidental infinite loop.
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77]
+CVE: CVE-2026-27171
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ crc32.c | 4 ++++
+ zlib.h  | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crc32.c b/crc32.c
+index 6c38f5c..33d8c79 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, const unsigned char FAR *buf,
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2) {
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+diff --git a/zlib.h b/zlib.h
+index 8d4b932..8c7f8ac 100644
+--- a/zlib.h
++++ b/zlib.h
+@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2);
+    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
+    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC-32
+    check value of seq1 and seq2 concatenated, requiring only crc1, crc2, and
+-   len2. len2 must be non-negative.
++   len2. len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ /*
+ ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
+ 
+      Return the operator corresponding to length len2, to be used with
+-   crc32_combine_op(). len2 must be non-negative.
++   crc32_combine_op(). len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 4992f83463..e42578fd7e 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
+           file://CVE-2026-27171.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.43.0


