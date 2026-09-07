Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17A1C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 09:13:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30926.1788772407365025863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 02:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FPW8qBbM;
 spf=pass (domain: est.tech, ip: 52.101.66.48, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROEu57KLH8E4xZA/04e3RZqtB51R9atKMrMKCa/ZgFE5AGh84a5qQB3zvwgXxiXRYR9fP8aKz6iqefhGFAuK2/ArE57PLOmXBgFDMrdrOIPIMDjXSG/X6Yvc60P1EgZvzEd1MIIPo8Zm4sltSCYDvsxXYEBPmYmakDUWjGW3xZqfAeGjmOaiMJrC/xXrzBYzrWu1Huh0hnFRQwSpdxtVwl+R8r48F7XlQ4tM9f4GS3/qxCpy0at595wLWKMsLgWGR92WRf4g3Y1v9eaE0lXX9YdMG47JZ2U26aQIJ2I6G9fT9pxPX5NRQOVZC2ra0l7YzzEOwuScUGUkY+jXvoeL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3H6tHyq0jN15DTiZJ9DPPyqFa4yKLqD7XDhCRyyBZE=;
 b=SAumvhNDm/M8qPRZmGiYlzCSNg/By7/glJMON+aZsePq4KJIB/eraC3DoOlidpYQV12FAq9EWu5y7wKhe7Re/N1xP/xS/XARDKU9S7N2ZXAUzkxzaNSd7amjo/emFMjjPY+MgG6as1I2i1n45cSgCWSLx9HlK1/BrkYsDs82QzkAsBebw1CA6agbE1dYmlkz9H5UmKCIBH54u8kN9FEVs4wiUIUhzbK+GJGJlXbMomq/Q/zfJqvDCMuIVyryrTfH+5LsgnUtBD8vUQS9S7wDUkMlFNIP4IaEEl1ClH7UZTTO2VGCdDi3E7cawIgnT0uFpLujQwyHRSA72QDYpUvvMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3H6tHyq0jN15DTiZJ9DPPyqFa4yKLqD7XDhCRyyBZE=;
 b=FPW8qBbMq33dQ0KeViGkvzdTnnQC3o4OQEgDJO59wBPaTTK9gsXcQMPSI0x1VeCWTX7pEy7CVcMf08x45L4P158w+dOBdMFwjrZI4CIPV24j8cmw5GCmFnxLN8OGA5QfH6uueVXuC1UykOibMzcHyj5eApZBbVqpOX6+Mr8dGebLmJrBREBZ2KNouMlmYbE+FDnZEFFrcKmU0A+F203ypVnV86T92NLHi5w6X7EywYKOAHM45QZ2sQTmxlOJPwrJU9ostLpPRLY/1ChLmPw+Cqx8FPQyss4GOlRDzJDM4c1o4ztZrcA0qzfpZhyhuB7CLZeh3ahCh0GvPEDhZR/iiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by VI1P18901MB0782.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:13:21 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:13:21 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] python3: ptest: skip flaky test_taskgroup_23
Date: Mon,  7 Sep 2026 11:13:02 +0200
Message-ID: <20260907091302.15611-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0128.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::21) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|VI1P18901MB0782:EE_
X-MS-Office365-Filtering-Correlation-Id: da6ee046-a05d-45cf-5249-08df0cc04366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	W+4Ih9kjJ1wYhvvUu1OWbSiFvv/n6CAimY+R5udnpsyTRGWim/9AzZWVhNjvLzxQY4bIGkQ0/jiM0KPESW45Ho9nAU1SheDPFWygeejvzq9R0o6gATmrx6b1HnV5ywPB5u6ZeOI+VbCnANZFWtfHb5R5n7L7BNtJB2rwyC5TkJGfCUu/Ip/G7+cT6BeqyrtPN6BZCHff0TaedUoqkj26IKsnTYBARs+WDdOG/T3b8oICwfkXpiqmKK01q1jX/S4XwkeofPoKrax7b3axUE3EPKV5HU8gGmYa4dhnXfX7CPNSo9UFJDmg+tifGoZBzG37deYiFfbMQ7E3qgXTKuuhSVRiUsXLJdK5l+3J85jQmN5mhnHiyZ22WQ+Z03xCup+lw4nn7Xpy2PPGltftkvbOgZ18CUF1g0669X/7P16YB2seSazRYg26Y0EhVjo+KAOfbKMdypR+6GTok/SoGzAaJhYWc3l9F9+orV3cjcRP29Qprr3/780OkNxhPekCQFBpzmvpfu4G/WgJqvDCCRXkDkY0ZSSIBTfhTnjwWp/QDBZZmSfp3QFt5OK5H2h9G1gW3hZybrw6qs0dY+yoN/jylOwVG9KAyYx/q+3TnMOmy3qEiUh7UEV1WBMuT8Q5DLzNWHDfsirxEpoIyS5iGYpcw0jedDert6NS/CBNECl+xTo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6HnMpaYcMMxilFk6e7ipdBjozvocW/jCFJrTWmwxoBG4cMEz5KlaKoC6hNGs?=
 =?us-ascii?Q?UnmilNrbVfy3PwbHLked3h5DdBBlOLTrTOgc9V/GKPV6SFxC52bEBMvNaWLB?=
 =?us-ascii?Q?6q0Y0sq1d0WOL4BREsSwlXlKyXOiDYjV+tsF72M4cZLW2lyGvUb1K4x0K2iE?=
 =?us-ascii?Q?WOlP1N7ldDqwFWoaLOmrFe2q3mVCNv2M8pWIhIJ6sk/jbA27n+Sn1qZ94RF9?=
 =?us-ascii?Q?bIWxwQHLLrE5JYqMQHRn80q0rGNZWQDiG8YBXYn9CJVNJIagZnzW8QEs6VNc?=
 =?us-ascii?Q?LNyU6SdRIj5gZ7BsBu+Vx8uiDAr6GtLRzSviHRbehyYMXw3Aza2CKpUgY9NS?=
 =?us-ascii?Q?jJgzTnfCwpuoOKW1DbSOMaEikoR9QTC4F30mjATl6AnpaQqR457gzcuj//YT?=
 =?us-ascii?Q?z4t4DSpOfh5oHdeEqmiMdUu8olVSmQ9Wgm9onfcjmhSiH0iggq9kPv3kio6I?=
 =?us-ascii?Q?0H7VXP0X0GsmJcACWtVFnvQ0BL72OfWW2Y70gLwNCxvey/CeVCKLfLNPcNLo?=
 =?us-ascii?Q?aipGrpZpjh/rJzhctVPxZ0pX0XwmaMeTm00W3F/11eBSwPtYzoJxS1r81SGI?=
 =?us-ascii?Q?Ofkb+/kaD+TEnvQjxbHauhH/2o2TUBd0yMYML7xGctBpa/8BBXDcxELl1cD/?=
 =?us-ascii?Q?tb2OLuuOSR7IpNEcohpchTiWy/YZ5lgrBpYKRtwNG6VB8xSJaB6iiuZjEyit?=
 =?us-ascii?Q?q6AGlzs2jrLE+xJb4BvOom/fkePCjRs31mJT6S9UBDdF5oIGeywNq914VZSQ?=
 =?us-ascii?Q?zJlB8iFUVqL1imV4apn4+/C/1ejQUYuXGIadTtvI9s54rj+hVjL7B4QaJPyc?=
 =?us-ascii?Q?+khya1utgd6WMqrWdkTLkoyHjJgbrtyCNItHa+0ZlhgeoyAPmayWJomKxEfr?=
 =?us-ascii?Q?QZS00hHVXFY26pGVSEkLmSGtn7bNtl/m3YldDgaL5IkIjVHpSKoVG2iXl8QA?=
 =?us-ascii?Q?UQFKRir+X+qLwHEUtt5JSMMvkmPd8asrSo1CaXtjhAk00Yd6PQOsbhlZcWcQ?=
 =?us-ascii?Q?6Fq6tk/Z5bhTEQ7FpLlRVsgpvmP6s8nb6V1J03AyCOzgWTJDIFQbB8VdP3rr?=
 =?us-ascii?Q?Om4IuztMM4QTezhQImamnOqqRWFoxDZJ4VVWTF50HshKRUCyVNERHwylwt83?=
 =?us-ascii?Q?jAQ1nC+FAs7Rmr9enSN2qFvF5XD9UqpoKo8NANj2QoI/8J55S3Zv4QeQG/a2?=
 =?us-ascii?Q?jNoRMKOLCT4J2/Dl6hA4aThVQjsN4rwib8etRMlt7O0xhhobKqn7sCQezBke?=
 =?us-ascii?Q?A96P1RnrPkoK2+mO1hnhZswQxHUr2lkhkdFzukWgLX8AHy4UJjzzUqNnBlhD?=
 =?us-ascii?Q?WxnLu8aCK92oH+DKU7ZNsPIykISUSOUgyObFtY6shyogDg6NWNIw1EUEsfyK?=
 =?us-ascii?Q?O1iiuTJuVRVALzqL3CHvKsjmMxUiddC1T96LgdvIsudL5+UEI5jGUWTinLDR?=
 =?us-ascii?Q?aoydoeKeWD5ldX+0TIjfsRDr/imZNC/7mHYCvujnEzv1ysQqpTX0KWpeS6cw?=
 =?us-ascii?Q?nFoHBfSAzLhOgSYhILJ//T/I32wOlfyTIk6fPrmrU1K//Sz5KdAHtC3HqU0X?=
 =?us-ascii?Q?Z+Wt5gpIUa8yOzvyrSbT8l4HynJFAceWb+oBsxIIfZALgOP+R3YxXgsQYtNQ?=
 =?us-ascii?Q?n3gTLIhYuDjuc1fmDaLkAEXwpBXewGXgOQoVi58WJDHlj4wDuYLfY9rNfzSo?=
 =?us-ascii?Q?f8MR+gHmldk3F8kFFflJ+r5LuKJr3UDtdDOfb25iMAJq/fAhO7xLtrrfRI3t?=
 =?us-ascii?Q?RXE5aoYDkA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: da6ee046-a05d-45cf-5249-08df0cc04366
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:13:21.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEu0NNff6Vljob8mdz8EkKcgtVkckenEDwCBVWfXGhkI+mkuoLWdXihgtVHg1Tr/kMga3hohPDwEQBzGVUP6tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0782
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 09:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245241

The asyncio test test_taskgroup_23 creates tasks that each sleep for a
fixed time, then sleeps 1.35s and asserts all tasks have completed. On
loaded autobuilder hosts under QEMU emulation the event loop timers are
delayed, so tasks are still pending when the assertion runs and the test
fails intermittently (AssertionError: 2 !=3D 0).

This is part of the broader class of timing-sensitive CPython tests
tracked at https://github.com/python/cpython/issues/130363

[YOCTO #15564]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index 18373e5b5e..997a1ef48c 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -329,6 +329,15 @@ SKIPPED_TESTS +=3D " \
     --ignore test.test_remote_pdb.PdbAttachTestCase.test_attach_to_process=
_with_colors \
 "
=20
+# Intermittent failure under load - this asyncio taskgroup test assumes
+# scheduled tasks finish within a fixed sleep, which does not hold on
+# loaded autobuilder hosts under QEMU emulation where timer callbacks are
+# delayed. Part of the broader timing-sensitive test class (CPython #13036=
3).
+# Bugzilla YP 15564
+SKIPPED_TESTS +=3D " \
+    --ignore test.test_asyncio.test_taskgroups.TestTaskGroup.test_taskgrou=
p_23 \
+"
+
 SKIPPED_TESTS:append:libc-musl =3D " \
     -x test__locale \
     -x test_c_locale_coercion \
--=20
2.43.0


