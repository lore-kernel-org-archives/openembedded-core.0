Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E64C5DF80
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 08:33:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4212.1787041999230729989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 01:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oeaC8OyK;
 spf=pass (domain: est.tech, ip: 52.101.69.64, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx6ErGiL1yDzszFbyetlnVk/RIHgobtzoJ5lh4ne6PxrPmTC7Or5vLs2LO27kL4kDv5YMJzZqbYJNH+LAigQygEQmmR9/jEWcTESq3K8TG4PtbulwH+T/RB+1u/CedrLpXM1y0AX6LLgw5fhLP648fXgNMDUJ53PZhO7KahmhuiRsApaorZNvJhwOkeK9/tuRSy/w/4u989QNtTWUE8+ANkgYWC4rviByfEqZFaxidw/NvDEqvs65EaEzvA7sZmX26yMcb8cAEAroCsQRzz/XmEzSLL0GODDlHlsS0ZbrSPR/9ouSiAjWKo7cRvXYDf62WAxnu9cHaSajB4NuX+iSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnigTw1Dgq8K+KgoeKQM6bLX+dt1T9j1IY/av5xjI4M=;
 b=GF7uOt4NHzDh1Lp095JWvfJnh3p1IOxFS++pZbUKYxjLb9UMwIxWWxkJMmJMeIJ580PWWCDpoPHxWnIIeFXm2lHY9lJYrcwmUebzLvFZrFYNik6lI9iI+ZriWN27YjWYkgK1CMe2LYoPGHVLk4XtdhWxTiMXHPbrf6O6iDGHreiV2XT99A475j5p4wuhTPrW3fFZHQRr2Xm7KA3ccR7t+NBH6Z8RqsEy3URZldF2UpAtTCd6RvBePGcOaq2FVJSVGHONsobPseePokOa+N1s796VmTajcy283XxS0GIPQ7LSwELnNXy77n4LZNP7qcMRMKeImVzxQcqFrBAzLpGKzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnigTw1Dgq8K+KgoeKQM6bLX+dt1T9j1IY/av5xjI4M=;
 b=oeaC8OyKStSP50MoSqmpbHTikaXJLOOYe869PtwLjw2avqtXMs6Nw8VNqSttcvvG/L+BLsW0sBjukt4o9Iu+Aawsm++c+D/E7zUCeloJhwFmoOw6I36XgtokPQZi5yRTjX7FtPyof/TDCzy2NyjVzh8FDVPgzjWF26QpDuYjPvuzj/LO8heTJfMYVzWI+angzgZajhGCLMXkefdMJma0yWEQowBNxoBHtxj7d0M8SrYq1RmankCnxrDFqZ4QVNt54gQRoF8r3AjBCkTQdoXnbfZNj+Tk+YzplXXd28Vl/LU7vzKEsrucl5FkPeioPFKoCw24xMFjPfH61h/qi9jE1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS8P189MB2197.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:539::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 08:33:15 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 08:33:15 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] python3: ptest: skip flaky test_attach_to_process_with_colors
Date: Tue, 18 Aug 2026 10:33:10 +0200
Message-ID: <20260818083310.15613-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0021.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::26) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AS8P189MB2197:EE_
X-MS-Office365-Filtering-Correlation-Id: acd8c0d8-8a88-417d-abf3-08defd0358c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|6133799003|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xWbKVlpoIei8QK6pIEfqtgvZaaVY22EULRsY55YEB6CR1EaBnHpwixz9BzyYES35peamgKmg9vGDEIbIqIhD9PWogfLh9+rjHCU3ppbwARvQV3w6wiFVJmInppvtRWMAMwwS5CxAhCgCxhe9mOa/5N+0wX3g5yqm0Y5Uq9qe1c3lV4SqxT0vInh0uEAc8QB/s081590YAGl80Y7VhJ4CByjNco2AWWmLZ52SxoDa3QbUvDmsLfX3yOsFUtcophbv2H2J1RZD6PthzpNSTibrMfg3KuX2242fetCq6mtob3F9WJR7Sw2KfgZDSgRI4CuLkNuTyjJHHgxV2U1XOXglKy0cCsL0dwUe1eANr/reuSvHB4bLnLOqMoK8rCUJnVE1zLs2jJ9GctE+qdNnVDHzsj2PIKKQS5hNvqZIG12tttb85PWU7Av/cBMIjLWXB4+s7H/6MKvAQa0c7nI0iyeFEHlVUOTRN6quK+buLX7tRb+V1Srax5KBKmrlmED+zn5J0zzMxAgX6u5ueVMi153LkfB5Qk/qgiMIFYHa2cswG6VpaecW2eARE7D/M9O+wejE7c430UIUeVix/WYjcv++Th24Vt7WieNOM/al3oikHCEUrudnJEaUeqaw5E8u5R7XEWQLZEKFQS0a/DDsPv/77EggfZaUuK4/+E45forUyQ0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(6133799003)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P5SIS1ZdjnTCLf8zjEHrPx6j/uNHYFP1p3BudLA7cr0E477RFpObAlruCBfF?=
 =?us-ascii?Q?vuFBvTrqoG1lrYum9hQdsj8YgXJ50QcSez0ExFF/z4VzL64lSAFTDSj2dGqb?=
 =?us-ascii?Q?k0uSw4m0QuSv/nIh5WAovECJeW47Wth3wuXoKaBA5eAleParuLPjVEJUG5m2?=
 =?us-ascii?Q?BTu8UrPAnSvCb+la+B71rDpcLJjqkm1Yv8dWdV9DjLN9urDScIitQY52qHBL?=
 =?us-ascii?Q?bbprK2ipEP4sePvAwJ/kmzcQMU4ma8OdRSWNU0l+3jpa1aU6g1xuKF74O8HT?=
 =?us-ascii?Q?Zn62lGZBsu6AMwkqY4NJFvESZvkfN2eaUlomDZTrkH41fA70BhGY5p3VWkTw?=
 =?us-ascii?Q?FfyLhRE4oPk65kY+FqzLHnC5j2sxwp1EwdU2SCjcB9xtfYUyz1Lp36wVZuBK?=
 =?us-ascii?Q?8CfrGoEecH2sUPmPepxHNQIXA7PJfsRMNb3NYy3DIZfjrK9DpqrWYGUV2tmI?=
 =?us-ascii?Q?D8CkmZlWMDJ7/IRbWiYyR786bTS4NJNtBUqTKBwSFLFXNxh6nYJY6lXny+Cr?=
 =?us-ascii?Q?k+pEs21uvUzlFubV/h1QtlrKwk7shyo2ROkkYT+Knd8L8v38jK7SxIB0Gvya?=
 =?us-ascii?Q?qG28BiBn5SBHqhVRGJT5wkQJLHp3O5qjqQPqxKQeK6wQRGEYWIeKwM4gSW1t?=
 =?us-ascii?Q?iXy1l8tU4BdRfkEe/N5lmFM37rTlnLXrVwmOj4ZiRhoEzQinJO73e1+FZqxk?=
 =?us-ascii?Q?LDHWZes4dA3vQlh9MsU2WV6fZd1CLpK5cWqBcHxy1g9BJPHhWMZrhfPhDKqW?=
 =?us-ascii?Q?iF6u7XojjwKsYYBzf60MPwrOH6hAhsnaVpXymEfqvossgbcZvd1vX/LhrAVA?=
 =?us-ascii?Q?Vz+Xg5SUw52Zi+KurLYDZO9lMTqgJ6tqa7ce1ZMvwbjm7jfADnWmedx/A7dU?=
 =?us-ascii?Q?qPsmq2lDNqzABHdgVljxu0wMOKl8R8w2lpdiAE8s8nP7zv0CLHKeC+d6N++W?=
 =?us-ascii?Q?CyTxAgnyNEWCeGO0//6XAumEl2QM0sDv5TaUTqgoD+8nSFlTwdYl+nR+wRD9?=
 =?us-ascii?Q?+gHHMbCPd1JsHsAmPztCe3pVlakhlQSE6zFy3VA40fiBp6SUJumRx94UksPr?=
 =?us-ascii?Q?g5mVfy7RnxOV2ua/atwjBC3eG4u1w2NejUEPm5jgO03KvpKMm9qYrFN1FaiI?=
 =?us-ascii?Q?5S2TpcBbXD/M+ZgSnaaaEVOiXdzCbHFa/P/uatPxPF4xlUZp0h0j3JAP6Nv+?=
 =?us-ascii?Q?vxZJttb+dCPe4KKuxaVOvyL6SuabZolPRFoyV2pzk/Al9dcfOdv50MJJvmYM?=
 =?us-ascii?Q?lTqHNGXQcbGGUFPZ8bMUnqEDV2Zj0+mRUtyd1FRpNHcp1xfxIn9OvFIQWu/B?=
 =?us-ascii?Q?Zkj8lQJLX1VLkWAV3K1cwzU312pL5cLgW4VAQJ2izzWeZGkxW6lAFYW8CdR0?=
 =?us-ascii?Q?mSmaB2XEtuRXsrOXR68Dd6BdNWxgjVpNomgjxDFG3Sjc5y6ayimDC/kGe/mS?=
 =?us-ascii?Q?9Qz2ZE+c1s0owXtNSNll+tYo6meHIJCeMensniputNai4DRn6JU1W4nbEBpf?=
 =?us-ascii?Q?zpoQimw8emtAXMu2ucogXzjj5cFOnBz2KL9tEt7KF/7QioOZi21oTF/Pv4AR?=
 =?us-ascii?Q?FMEwCd53rzd2vZ5dQWyu9N/98VYiBHkrtN9ZYEezAQsnGAfgHc5+xPhgcXb4?=
 =?us-ascii?Q?oNespXeKHPX5+SyNAhA7xTw64J3H8SkekfvMydRbf4Y38J/YJTDQYRbw2vYv?=
 =?us-ascii?Q?q8s3m9oE4TTjAd/AX3NGsYFG/BmHczfHdMA4+ERzSfOoUWCD+hrwFtvF9G83?=
 =?us-ascii?Q?RzynTgfRig=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: acd8c0d8-8a88-417d-abf3-08defd0358c6
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:33:15.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUOU6y7l820LodGZN7+L/QPv5hnkoCddEG+YbNP8cA4IWGZlhf3Fi8V4ttRtUxipp0VXiioucHzxWFV6gjuFHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2197
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 08:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243669

The test_attach_to_process_with_colors test in test_remote_pdb is timing
sensitive and fails intermittently on loaded autobuilder hosts. It
attaches a debugger to a running process and expects specific output
within tight time constraints that are not met under QEMU emulation
with host load.

This is part of the broader class of timing-sensitive CPython tests
tracked at https://github.com/python/cpython/issues/130363

[YOCTO #16201]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index 1eef256a83..53a9ca59b5 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -319,6 +319,13 @@ SKIPPED_TESTS +=3D " \
     --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
 "
=20
+# Intermittent failure under load - the remote pdb attach test is timing
+# sensitive and fails on loaded autobuilder hosts (CPython #130363)
+# Bugzilla YP 16201
+SKIPPED_TESTS +=3D " \
+    --ignore test.test_remote_pdb.PdbAttachTestCase.test_attach_to_process=
_with_colors \
+"
+
 SKIPPED_TESTS:append:libc-musl =3D " \
     -x test__locale \
     -x test_c_locale_coercion \
--=20
2.43.0


