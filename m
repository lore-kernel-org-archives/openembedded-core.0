Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ACAC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:08:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6527.1786536534869300291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0pAeC12Z;
 spf=pass (domain: est.tech, ip: 40.107.159.3, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOZEXZj40XEIYSrFl9aWlBCHtHyGXmQRHtAtDt7cBWZWhHlM/EpptYmclc4ANOc64BY7k14JmHCnCdvE8i9dQDdt5FZAZiTSSbqe9LtG6hdaOpf/YXXH3tDD4s7xXnpNsdgRofJky1eYJ6V0+pRIDTFGMX5eT97p0EnNqWKZhCXfG+H7G3OR8obfO88GeBKjdfU3LBH/nAbnQkz+hkyTmlX7NIomUToiLfWUvHRfUSbDkwyeyFzxOTHuSv2gNhAuJc8XIxWxypOxhLu7V8hsJE0ACCB1Prwrki84V/rUPlul6x5XqQRccK4kbqcD1GQf/LgXgz/CF+3QTsra8w8tjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoQyAs8EQTd0hq8ofa0fLTMYY4FW/SXWam/YUSg2vVk=;
 b=siqHqz1L9F4NAuxJzStanYa0wxjhhFH3m4q9PpsgQOIWzjX4pL14vFg0L4uqLwYzZiGV16hNlfMWe5VI8P5R5CU5h6cxSATAiensASuFKnMej3o8wxavhEg9u794kfl6rXSofehHRknnuWDPggHh4tFU5BWWZbTVGAgD/cJNYh/fa/XTsI3jUJ2ddLzf3UNuzCa3IandDDqf4TvL/IcKHMWcmqSaeZQ66hTit9Wb/uZaMgHqq3qEliDJ1+JwkfkWhVbbfA5dvRieOeD42cPjOktN+iH5x0Nldt+ds62BkPafgDkFqkHgZuQnTPSTcjaMLuldZM08/NZ88bTqIHIIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoQyAs8EQTd0hq8ofa0fLTMYY4FW/SXWam/YUSg2vVk=;
 b=0pAeC12ZGtDbP7iyqWVQ5Xk5N4JBD2UZG4bYmSO8TEL6P+fE0yYIdZReJKzqXyFU0uHR/SdILetu2iFy3IFqESccQPngUwR0QLsxOky/R0XL39jhhd5Io2UA7NwdJwueb/aq4YQ0MvbUEcCXiWVq2nRqSJ0BldJzsTHPoKvVm/R4XYvilI5cXdkp2r+l979Gnjv9P8gmaz6BNlprAL0lcWS82o3VmWxMHqkp23WrYoLkLVjMALzNUfZVrG5PKUUu1+f2lLKMbWpBcNBVEENKQ0v+mmvZddUhlLydfOd3o+gZLtjatm42wHJ9xs3r5ZNBEEIWOwDb3Y/F9JNBseLzyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3248.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ae::10)
 by PAXP189MB1928.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 12:08:48 +0000
Received: from AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
 ([fe80::6d90:c2bd:e57d:e6a6]) by AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
 ([fe80::6d90:c2bd:e57d:e6a6%3]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 12:08:48 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] openssl: ptest: skip test_quic_multistream due to intermittent timeout
Date: Wed, 12 Aug 2026 14:08:37 +0200
Message-ID: <20260812120837.35922-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::20) To AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ae::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3248:EE_|PAXP189MB1928:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cb3aeb-6c70-45f2-1c8e-08def86a7738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|11063799006|56012099006|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	buRlePwmZb45VFGJ0XUAAMG6Efe4lEnDN2Yhwzx6ut1SdqXkqYsmPKn3K+kdWunP9gBvusIU4FynMkTpf3ns+0xaxeRKx5BGl3YzRyFTcSQuELLfqFTbSoU3x4BxdbOGutUHIadbjSxshOVuvQSCJHeFTK3o9biUH4ZDCGlvoODq4RCizUwoM2kfvZcXODW4la62D4iR/rcygoJ7RjagOX1uOSyimWPY76aPD6JZce16G2IOCUmNWVnHvJMvvtXS26lCW/mXw40bGZWVfrg5UHTMqsOEfKnUO1JCXclFiZQS0sJyLWzI0ikRpuySyEW5ntsBwS3fAKownB9LhHFPsEdo/zHONT3c+VSBO2OuAqQrRo5RD52un6MvvUIewNzQZt9kvcI5Vrzo0UqMEwYBQ66JHIiaaICdxeOGLvxG7NbfrSPi9a434MjNvTwp59c9zzOmYHIILhT7/6+BEiIVztJ+DZGvDId4Il+8bHAvrpQvwuteQIxAiMeic11TFSdW+Uc6c3QHUjT1Hm0dat/VYWDk0Gvr3Dp0EEcbDV+9UdwdpOnwWo2ZL/vmaGnmt1SwVRgnT5Vmc/mYZV/hZpBCqPROQ0nZfw4s4iTY5fTt/KlE3lSSkiq4VwjxxNvkZXyn6tmUtWalpWjeSvVlQqqLsD82OhkcyYQajkxyGT+a2cY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3248.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?svd9niZYk5bvFy5z6a+VB73JGxe60uCmXOEuGsIloO1XlBByFsDqygxff45N?=
 =?us-ascii?Q?qISrAMsUBJWMHMguCMmCftO5xenj6EV2SLgfz7pSCRjEW05Jh9d58sCvLcWa?=
 =?us-ascii?Q?h4EUplBfzVHDOtlZVocb3u19I+EYHxkHks9nbRgA4VONL6zY1L1lZOIrQJ5R?=
 =?us-ascii?Q?/C+m6J5L7LMjD+vqbTvoFefgPGl9EiKHRDUY4Q9Xqs3j60LlynsOCBANvPn1?=
 =?us-ascii?Q?VkXKB+Rbl1MSeSwZrtkewogeBr+ZlEYJoaC4cq6zIZGP4oReRUycqJbd+lLy?=
 =?us-ascii?Q?YBRksJVYiMjr0v5dWI8sXIvm81E26K9iuhoRvXoAvcgVMG54mfln6yUOFo67?=
 =?us-ascii?Q?vYRHJ8nlajX0DRWgX2Rar8u6K/ULu9NsXEJrrM4VlhrB4/GW3rmu7GON4mpe?=
 =?us-ascii?Q?hZF5arOAakB+5SiNuXOmJjR4hhjIqS4LoZJHG46chNb2GxzMBg3KOjrUX0lq?=
 =?us-ascii?Q?Cv7ztiTKwRgX3QZP/HeXmHdDa0iLYjugISypzUk2lXpeYgL9iZd24e0/aNUZ?=
 =?us-ascii?Q?31boWW7IoB7WzvAu0yeJI16OE5fl0nIa+sAfji4e0I4QIdnlaU3G76y7mHmd?=
 =?us-ascii?Q?3XzZ+GC9XQpfQPp/4W9vUHxcCMQLzNmUlGJ6IRNVArcp8DIPby41UVb/6ZE/?=
 =?us-ascii?Q?HDqczHjXH+nSI4KtgMuJSOOxM8b/RPoWv+qX28jzPi1NRExeXtB9RVFlwdTh?=
 =?us-ascii?Q?JwOehqMe6uG4VG8R1AGWJ64wGYCTqYpcSAYJXXL3XfFRhloB80ndmPFTe+sJ?=
 =?us-ascii?Q?mkVYQJQfyc3rEyOD02MbF/5PF0RWR8ZqV9sd3YBuzKgj1dUZbKeMNyUj2Za7?=
 =?us-ascii?Q?ZoDVIyClDHR+4kXfpWuGRv4X6lzCGKdVpWwZ6Bn/QaTP9smzh3laZMpbqwBl?=
 =?us-ascii?Q?mVF4Gp10mBvHscY5sPqLer94Uh9EI35U035soHSOrgmlTMSQPYOeXIleahg5?=
 =?us-ascii?Q?4QZ1OmPCUPHhdINXXOLapszFHd0S8HF6S4W67pQ9yTVg4nVg0gblbDyd6Ore?=
 =?us-ascii?Q?1Er8n9LeY2jkuNg94uPIWilUfEYkHQBVITN6BJoogqvsgZz6rht/Ue6snyUJ?=
 =?us-ascii?Q?ItZpmbLI1ggLm7NBjcCtlO9o/a5aIKlgnFj9l1X99RHHVcKj3E8VqhIy7OIL?=
 =?us-ascii?Q?UKxn5qDB82ALybFd8b77Ru+DH8qpZb4Ej2l/tzHpygFQAGCKP5QJ1gkheibd?=
 =?us-ascii?Q?b6IHeeZykzRZCT4PicfgFZVV6aL7ngdzWE5M2Ar6M6oJrpH6avgGQ5VUN694?=
 =?us-ascii?Q?oqY8FLXqagLn21m2SUh5eI0OtwHqUnl9vat0rgqEHEmIzqtqACxVO7xUwSUK?=
 =?us-ascii?Q?5KJ0TSFEh50XOJJpiehKImpyxLpqMFHGaDENRv8gRfcuGfUf9oSBn06ilScV?=
 =?us-ascii?Q?VTTbeYO4ks3dEKcIMTwQh6Clhom1bVAQYuhKCnAVEx6ivvk8NTqV0wuH9AEf?=
 =?us-ascii?Q?1Afipydvg3wqXjlW4KeHwDCkSaqUD0Pf2mEBtqGIi0ArdcieTONDkZRXtiMF?=
 =?us-ascii?Q?KqxBj0oQaN3T2XqyNlf7jpiebZG7S1QjsM7oLpzFvcr+W5w/8VaH9Mag6nGY?=
 =?us-ascii?Q?pXv1dBW3+Rpees5d4TpoSEHNrBwGCerYOCL3LSDcS5q/gmgMfFz5k/u901Gu?=
 =?us-ascii?Q?5NyDJzCCp4wltJb8LMzLl9dZZ8PcePwmx8I2zrBlBVJruCMnabC1VQp9VYhr?=
 =?us-ascii?Q?dWo4JTEWtoGBUkdd3/YngrMBoIRnlpvjcv68z6O7KPxA72OChTg59EFI0My7?=
 =?us-ascii?Q?3xcIaHY80Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cb3aeb-6c70-45f2-1c8e-08def86a7738
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:08:48.4061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGOLqHAXJXYWGIJjg+TfN8cp8oal5RM8bHIm5sYaA/plDvBPdAPW1H0bLeEyFBYYtFFgHLCftnCaYjniNHOCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1928
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 12:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243283

The quic_multistream_test has a 60-second internal per-operation deadline
that is too tight under QEMU emulation on loaded autobuilder hosts. The
test creates 200 server-initiated streams in a loop, and if any single
operation exceeds 60s due to scheduling delays, the test fails with a
timeout error.

It is tracked upstream as : https://github.com/openssl/openssl/issues/27104

[YOCTO #15357]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-connectivity/openssl/openssl/run-ptest | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/rec=
ipes-connectivity/openssl/openssl/run-ptest
index cd29bb1446..aac0c5b55f 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -8,8 +8,11 @@ set -eu
 if test $# -gt 0; then
     TESTS=3D$*
 else
-    # Skip test_symbol_presence as this is for developers
-    TESTS=3D"alltests -test_symbol_presence"
+    # Skip test_symbol_presence as this is for developers.
+    # Skip test_quic_multistream as it has a 60s internal timeout per
+    # operation that is too tight under QEMU emulation on loaded hosts,
+    # causing intermittent failures (upstream: https://github.com/openssl/=
openssl/issues/27104)
+    TESTS=3D"alltests -test_symbol_presence -test_quic_multistream"
 fi
=20
 export TOP=3D.
--=20
2.43.0


