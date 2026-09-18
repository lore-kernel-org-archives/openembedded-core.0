Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C94C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 10:29:37 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7882.1789727369708926714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 03:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wKK+Q3i2;
 spf=pass (domain: est.tech, ip: 52.101.84.29, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIdLgxTebRbD7+m4uc+LNIlOp6wWAZjyg25FYaIyuhfPL5zdCrU7S6B85+RLKjaXoAs1yXm//ZjoK+q+582NpPdkYfS8Gqb2F9eU4NR7xmgMnu8TPKpEyKFzurbvNWpG5k0V9OJbT9xwF77AtGlyaS9fBtg0y8948uthLSKGP7sbkIWGmER7fKCUBunVq0k6AvCDuhe1mcJrIVxTOxIJvOvYn53A9L5G3lKuh8V/+V7wSCsIUVyq2Oi33bZEyOUr7iV4PDPxAT3viyfxpvCA1FclfqRaGJQrIfn1eKHwlZtKRcmlAeKzRxUVcYfdbJFOzKbxCCDR4W0tThYFwp82QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZAZ5j8WVbIhf4oPrhQM6QSPfWEAPMyc9UGdPu84LO4=;
 b=qZGKO1O8Vntoshbs0MwJHKvY9VuXApcNkkBfx+jt2PS8ClI98zWZdPW5Dl/Q/grjniN3op9zSvQEZ1cqLEhfcpVYp0DsnD9e3cYZgGpmZ4gq3IrcwHHLt2Pmxl4dvNw03RWsX7SWsbuloCY/QAvVScW5UuTOfp5q+UFGKsHaY05EGlR85OqnhI46yEdW6+UWLR1YJc5WHKzGna30X7J2g8NvvLVJimAw/ESkAvGcXZmD+3Xqjz/5rrHoIanrrT57QIfzPHfOtU/Gmzcq78kDVuOI4buw9PNsPD9wC/o2PC5Ro/GG/eSfMbB2hBl2NGhA+eg8+BypIeLAyscVJpJWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZAZ5j8WVbIhf4oPrhQM6QSPfWEAPMyc9UGdPu84LO4=;
 b=wKK+Q3i2tILKp7w3qVmqMzhnlwnP3NuOIk0wwnDRUFuGe5EtOOip06LLORW2zm8kgodqLVGWHu+w81/Mj9YB4ZcjncolI7FHoeOk3C5uWiKCg1QNKo8foPAZF0WjZXa6nTvyy2qJBsr8Ri7/H4nPeGeFIlsgOIkjR7a7+jBLcFJUnfrx5xJ/zJHYLynd7xhpxM0aRGCuOZcFFi5YQ6TrsKsJ1Y/3qo0IXAdGL/IsuBKhXBQi7Rz1nrla5c4/URIQSZpYo6Z6QhT6pxAlxHYUlY7oBIO/A9CHHCwtAQddQD6RrROBByiazuaJatDC78fzYuaZKqFetbQEerKZifNZmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS1P189MB1838.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 10:29:24 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:29:24 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] core-image-ptest: raise ptest timeout for openssl
Date: Fri, 18 Sep 2026 12:29:21 +0200
Message-ID: <20260918102921.20511-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::17) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AS1P189MB1838:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d18f0d8-c29d-4608-d9bf-08df156fb5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0rkCm+QK7BhB+bypamSJtI3e71mk2G/VVr+/X6b0Dac21dljISCtP9Ey0UdfNurkxeS92cVC2oGLkWJZ2pQr/57SRpiU7FhQ0BQRBejrxeI2GKQzfZ4ZTw09zxjW5vLRbOh6MdNfbnLLcyAy8QtdaRHKc4v/QQeXlunC4tzqEoonL4BTPybU3/Vg1W5KojGJur/ngFlWjgQznvWS4qZuP9RavWTTmBR4F1XT/Do+7ys+UUmgRShiDuSM823JuUna+y1mhZmHyX0i8/iX4GlWF6kDqL+CNTRUrvgsd4dt6r0tFnKWmVpGogFoxKrbqzliD5WzpMf5Pswge2ZRRpcCl2Xi3rGrEOXEcVP+0oCN2ldfSLmhbiDGAmSXPqsDhKcYsWnx+9tdLJPc7FQL+NlpbAvf/GCKXgRhnJy+5vnYya5nqsL63JbDN3DX0PlqJyLhvcX6DhmHaO75pv1qFISMj0poeKwRsF1hg2A675A8y6byx7BwTOhi5tKxUEr2EFh+AeD9tSprvz/buS6/rzSnp8MPdk7F4tb4wT16/bidufTdeoRz+JWZVukrIAi1JuHzn5ZdQu1SoNguUFUY2tYucKds8w4y5zJSkgYmzsSIqyE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G/3UyVfvRhOWVV47T8xGwyrTjM4IcuJ1g6LaGHx8Lcu+5WpaE9n/eL57iG3r?=
 =?us-ascii?Q?ht6fYXvpvZJSHU+CxE3OVQYvxYEYE8slP7qr2vyFnpVx9VVT0VblsvT/3HrY?=
 =?us-ascii?Q?ZJTe0o4DyfGPeToA/oEE6v+9ikiWAm4nG8SARCvx6WiuXcsc6N9iy/N2jxuQ?=
 =?us-ascii?Q?XqK725xV2yvEXqca1hVW0fOKxWg25vZ+T3xv3UAFT9PdC2y5CNbodE0J03Jb?=
 =?us-ascii?Q?RtmNwPHtjNO3l9I37cJexEs9NnWmb0KdyioQgCt2O0daUdOj4eP+LLL4jf8y?=
 =?us-ascii?Q?JQ8z2NZfrd6LBoVPi4WcP3R/Nnz/Z/z6niSm2ht2FSXQz99r6eZLH2uZ22F4?=
 =?us-ascii?Q?TikbdmX8RZfJvSInXS30QOg1Vg1YoLcfvuZhSoLCAKgJC7bNynYao7q56tDK?=
 =?us-ascii?Q?H8Y/sJbHBeSThGDAPMvWvwITA41FFteTDK10Sj6kc1+V4wPh3Fl8cBQIE3BV?=
 =?us-ascii?Q?vnJSP3jFgcOI4xxPxbhRbDelL5Lm7bJq2WpIoikxvzRkEltj30x2Efdp/LYC?=
 =?us-ascii?Q?M0D6NCq5SiB2WIKXW4dipnNSizsGhgj9Y2COdlU552NLWF2DOkpcc9NxS35g?=
 =?us-ascii?Q?g9RHtzG5NweKTY0vLWeU+QGIAjpei8L8eDVotgnWjxvaHzoroSKcRSFH83xk?=
 =?us-ascii?Q?sJu8AvximjaRMyqJkJ+0qDGvRbVEMmpepNkYUnY+4BsQKWOhgjI6BKZ7mwS0?=
 =?us-ascii?Q?Ixv/HEnCafDMTrng6SBZ+fkw5riOiHo3BZGymAoB5xvcZ0WzDSXUwald/dKc?=
 =?us-ascii?Q?hVo1vjamldfBgIgKVr8V87Ds5aawJPwMGIKcilWVg7w5fVIZR2D6G2iio6Ds?=
 =?us-ascii?Q?RtSeDB2qwnndJ0XtIh7vh2+U4mh1SrbjFdQQR1rFIebjiljvxaTvFnLAxgy/?=
 =?us-ascii?Q?gAjHCJtYS/7Yrpj8uDpqtL4eDJfIF8oviP2+d9n8r0uARNaqVt6m/zYhSbhT?=
 =?us-ascii?Q?7mUqcbYBEHJUa2h9ucfpdodGHSOSmbIH44SHYSJc+tJczVrJ+Ivtfe+xMs0n?=
 =?us-ascii?Q?BM/4+HGdzu91vdNSXmfdiWYI12BpbB/zdyF7gCZE1wbWQ2GqCGiDUGVugmKV?=
 =?us-ascii?Q?jgquAwJdcu/uWaxbRckTX1X8sPbdGB688WLC5IvotqkvFznQKarW4wmnQ95B?=
 =?us-ascii?Q?RnQP+8s16BYFF5FLqVWdE20jpVNyuZYI7PlQEkRj7/SvKsrWCHQtH+2VoG6b?=
 =?us-ascii?Q?VBB2yGnAsLmwU/lKptxAiLWTTYJ4JF79g6TLOJFgC+ncyjdqFFWFIL3iA3FO?=
 =?us-ascii?Q?Pj1dZQr3BXOIfFLk4yvpKCkYDx3Me5CvQ8LqKfWwFRb9UQ0AhZtbBwT1bm+A?=
 =?us-ascii?Q?LLUa3mGYmq/eT8vcQ9YJul/6MSuk+PNs+9w7kxGTl4pZ8vsi/dKLewue5hVH?=
 =?us-ascii?Q?aOIYp3CRTXuaoexiigSU1tH1GeIk7GO8hM36H4jbucsE8+tNDMUe8hVKg8kL?=
 =?us-ascii?Q?mdjB7Euiwa5LnvyBcW8t/2ilHhnKwQWxnIcrXdAT1EPsFAQOO1GDtFoGA8RQ?=
 =?us-ascii?Q?Tqno+b5/kwfWrNjAIDFwfrJs3YZ2QVKVF/B/ijjsX967Iif/IZXT0/TYm/d7?=
 =?us-ascii?Q?z+zIp18PVH9vx6hP2q9+bTABmLXaLFgkuEq2Z926WlIbrxKgHfb1abnnbyN/?=
 =?us-ascii?Q?xBylRbPfzZEU5GR5MD129gM8hG7WWQ1zhF6fAI1iRR6r7GT6HcwOKOTo7iRD?=
 =?us-ascii?Q?ryVH9TjxiGcd28QTG+/c4C/iO/teeh52+FlKpatxa3vXVCik3dfY2pUFKiqf?=
 =?us-ascii?Q?IDEbrvdgyw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d18f0d8-c29d-4608-d9bf-08df156fb5e8
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:29:24.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRLh5MBD3p1iQ1TefBRlj84/sdsTu3iYMGAQ1obtAvcgjFJf0Mxso2hfzqug6XNa95Mkj+y5Bvcn1KaCqUvxRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246209

The openssl ptest suite passes but its total runtime can exceed the
default 450s ptest-runner timeout on loaded autobuilder workers
(observed DURATION 566s on qemux86-64-musl), so ptest-runner kills the
run with "Timeout!" and it is reported as a failure even though no
individual test failed.

[YOCTO #16430]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-core/images/core-image-ptest.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index 22bb23c0e7..f61399abe5 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -11,6 +11,10 @@ HOMEPAGE =3D "https://www.yoctoproject.org/"
 PTESTS =3D "${PTESTS_SLOW} ${PTESTS_FAST}"
 PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600"
 PTEST_RUNNER_TIMEOUT:virtclass-mcextend-go =3D "4800"
+PTEST_RUNNER_TIMEOUT:virtclass-mcextend-openssl =3D "700"
=20
 IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
=20
--=20
2.43.0


