Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4188C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:03:06 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.53])
 by mx.groups.io with SMTP id smtpd.web09.35859.1656662583943531962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=axoZL1j9;
 spf=pass (domain: kpit.com, ip: 40.107.222.53,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhVUz9i8ic3zb4oyE9b7qYdBxxSp9Swu7anU72/SzvgtKm+oiw41JCKMMJQKMThHrjZy9NB1xDXFqc46+zmXPwtj8+amqnNH9dgd8JDknJ3Jg6g2fNlaFzWU2w11H31l7cPw5zcQYGgvKhe+9Z1CfBfSEhW0i2/5ga8AzrhoB/jQVMQ+N9Y0HQooRe7RbunWhmsFDVlKYaWKTstcWHbMc0yo6FznJIR1FJ89ecs4INnqa3aZnRDJbJCvP0k8kFZoCaK92+LAVWytrRDlRwgn3Hb8GhNMEHWnKDzIrMlkzuEzRKh8Ayd8NXTayuXd1g+RfVNBo+Sl/1ACDTpWgRJjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zC7WZlQLQH8ppwQmIyVSKsIzIzCmcTPsyj57EMv/jUc=;
 b=b4iloitYYpc9+VCEb4nstnTTY2wvxR3u7dglZnMB1C38G72Fr2rZrumqJwjjvOLPtg51JbsKHt4CUUm5JQSrEhB9xDHv1I9leYiC13h5CZyxbueZaP3h+qhKD1RkehwXs7tbrQ3LXWAbYUnHeGVmxJPCqmgaGru9UyJ5Fimx8BDimk3s4OuiT8ZbQr0Z4xhnBt4MaIE1mpCxoOHs6ip9EDdSx8ShrOGUaL62n/FO7wp95PwfmE3OMDpR6snlbW0y/ai0POruyFxT7OHmuOW/QL5iC6W1GtcjTWPoMC4CaxBTDEPut4upn4uFd5g25ROBy10krfeCCeSHy4VFLIUlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zC7WZlQLQH8ppwQmIyVSKsIzIzCmcTPsyj57EMv/jUc=;
 b=axoZL1j9/fwjP3arI9QLsN6Rcrp6vTynfqnYDKJ8xHYcygVBbAq7Jc7rQ0q8p8hnsEMG9V/nJCxzARPH1VtIP2iOz8Kw0n/Who84uFhTQNtk/4qHeErnydScz9+AIGz8boYJp1Hxvc1j+GgdgUhSMcgnT/icjwn09dC303cRxIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by BM1PR01MB2115.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 08:02:53 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:02:53 +0000
From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [OE-Core][dunfell][PATCH] openssl: Minor security upgrade 1.1.1o to
 1.1.1p
Date: Fri,  1 Jul 2022 13:32:36 +0530
Message-Id: <20220701080236.9886-1-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::16) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a12d14a5-7cae-4c58-ac47-08da5b38198b
X-MS-TrafficTypeDiagnostic: BM1PR01MB2115:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TPoFJQ4LFkGgh1mz2gSwilkRX5/S+0Jk6czIlOnDP7XXJQ7+/TtfG3ICAddzFmIyUQZMRLp67D9k2SCN7AtaijYhq4ik3hyl40IdYbDyLm+RXj8y66DtVY2efTJRTXfGlp44smkRaMh/E7UElWxBC2XNvtIcitwmEjpNJpb/ovzDt7fPgeuzEoz89KJXu8Id/uWpYjNfhBADn3G9ijsBUqomXO5C78g6HF8gTH6lD6X/+8SMWRNcULJNMcs50T3ZTEzjKY3luHU204UvHN4hNvWqjJANqJgi2adrQWGjWCLDlIIKn0LTCceJ60biuZyKCXCBBCGjb3XMzw1EgQJIU77r9E6mpOm7I7McaIYGaWIKj8wWnA9ktrzPKRHwqITDglRnZW6NUF5IVZ8HuAcgX+uNeWPp3swqIi3Fkd3ziR8P2FtJTTzuMQEAeoRA5rBe2140c6bQXvegR1Y6BOxBov6OhaovDQ0bWRt2DSC5f49iwFoAtfgE1kIUkDgszqbnR+bDBICoUuxYEALv9VHWuRLhrlIaAUKYY1hBFakzVQ3fUt+SDisSscCvmGYxj7aBcIaetR69ZT9sqJdGz2IwdFzpm8uoCpfkOL1LCGOfPjs7StxQzaITtsEhUZSaR1UhF3hbV7m1myw+OBdp85sOuMo1DAmH7GY6YU9VpTYWcBfLtEdqaflsY24OF8pQkHpMv3bR1so1MYRs7cETnb5v8yBfj/crdS1+LFPCHzi34yyGGWU21bqCFhPNBhq3R2CHU0RXIR7yo6iI239FtMsMR2jh7fix+zHcZyHaMsgaDvUpQUgm7ACqbYjNpCyiHOo07QL82RBaE6HCHViWVM54AgjU4MVLjyiwauOCiw7hzOjDT3CAt1SD5MEarVPT0ZUPtqLj4wJf3ZUi+mbKrpq9hh+xFuVwT8zhVil0lbCeTLE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(1076003)(41300700001)(6506007)(52116002)(26005)(30864003)(86362001)(83380400001)(38350700002)(2616005)(66574015)(186003)(6512007)(36756003)(6666004)(38100700002)(6916009)(966005)(6486002)(44832011)(15650500001)(2906002)(4326008)(8676002)(66946007)(66556008)(66476007)(5660300002)(8936002)(316002)(478600001)(171323001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SM9NHIKsHr4CKejGtb9vfxCADYtOdAKWaOaE6k7mpPr9RbvJRFMVxM4KgCG6?=
 =?us-ascii?Q?mkC8rA/GucTl1u3xRbFfem+Oqv+5hLNBBE5RxYirGcnZZXeypt/K6e5RjLC2?=
 =?us-ascii?Q?42rX1HOQ8nQ3/Xzxh4pnHGvTp8VI8DY9IdRGSTrS0QN7O0QTJBMk4XCcHa/E?=
 =?us-ascii?Q?TqAmtkZ7IkqyApCBGjwNPn7hjiVElT+HVvpf8gpw7m3u9YUEKGOcGm1pXXn8?=
 =?us-ascii?Q?8xADE/OBR3IkKLsWaTzA8GbSI9dyxhbegMBVN3hdKLR7pkY+CJgEOi8T/AM/?=
 =?us-ascii?Q?xXYnPkyj9PB0/ISGg68L8vkQTFnX1G6+gGPnqwWbL2aQMc2fbzoeNVn8UaKK?=
 =?us-ascii?Q?m1yNG/b/sM0KF3OEF5NHPJU8oA+3+nAunTmQt1zkfBk0wfl/6ID2IubhpWGY?=
 =?us-ascii?Q?/rEhVJ7wARqZ1lMduSxtqu1gSphqzkRVPKTaT1v6Pe7KRi+KIL4kJul41ePN?=
 =?us-ascii?Q?w9sBmbQaIFrpnjVJzO6VWgdKHTvaMOR4prQJ7EQzybPurXZrblysv+As0NTo?=
 =?us-ascii?Q?JQo12NrbGia/sUUcmklOBedm675SHDOrezVpZcar8jGjZ8F+15U3ybCkJTj4?=
 =?us-ascii?Q?+oY/lmGXJ6pajgJvv6Z7zdvxggsv4ZBQrmuzj5dHppSw4FG7JDBnRS7BPyqQ?=
 =?us-ascii?Q?2WRRRoMOi/7w1r4BrHtvrTpjyvKI36VSiO3zKlUs3GmCV1fNQeqDZ3Iz1mVn?=
 =?us-ascii?Q?8kXAFI7wHTmDDFwZaN08wz3mM4nf9CQOteBX1rYdvgxoX/wHsfpw1v0HpcfJ?=
 =?us-ascii?Q?iQHc9+khcJFbJbVlWF7JwI7l8JJIVwluAWr7XyR33VV3ErLb8/2103ws7LtK?=
 =?us-ascii?Q?VmxjhAHFhEJ/V1Ye8HlisBCvMUiyfO6h6uvjfMCJKAN+plls5YNYQ6sL2aw/?=
 =?us-ascii?Q?UEGXU3AEN8TP84q1ZUG8hwhp0SaXMRCG4yRP0ai5wrrThSciqWzXd33TMzK7?=
 =?us-ascii?Q?SJJJ45YpgeIVtk7wTNfpFhboLR7KU0JDx5p6lryWuUTlBeShuYwR3VyfYpUa?=
 =?us-ascii?Q?Shjsm04lpf8CBGeMdcZl8eIc9dbE1V62C4MbLSXqxN0AxsGdI6hPVFtFEkp2?=
 =?us-ascii?Q?jPRSHtRUl16PP84y3wCRhwrSax7C9G5t59bfGPNVAgYe4a20mKQK5YR9Z46q?=
 =?us-ascii?Q?h4ZdniaD+sHSKYTUdbNBaDOXCRW+ekgcUngrQibLq+SXLcfRbK7U7gqK8gnr?=
 =?us-ascii?Q?UFL04Tc1n8j0GpDaZfJ67xodfacCTqC7+DtnBX5LUxr3rykbvkF5clRSQFMU?=
 =?us-ascii?Q?5w3rfAcJyTn1u+ljCW3CFI9sIrMQNSkami2zlt1+hL67bzxuS2atMF1B/WqL?=
 =?us-ascii?Q?QJAyxAPxdDBpW1vL5BacEZXZ9b/PS6jJKiEX2whD2UEFZ6DMv73WFzY7MPm2?=
 =?us-ascii?Q?CIRV9vg2XGpjookhxo6+mUkROZO9nkkBaHvaWqXh/MsE0p02K2jQSHtatMwm?=
 =?us-ascii?Q?LkbWvDylPp/nZEry3tMGAWggM/Mg30zmhglaRmewaoSzV/LIJxShi98sS1g7?=
 =?us-ascii?Q?ZKvMHuD3n8q2UlRy3GYFWr6X7kEF0bzTMBrCmRHmxoTlYSeiLyASPi2MzY92?=
 =?us-ascii?Q?zLMf43xzE+z7IMAtMsMpYvm//8g2yXfPEgc/xqXM?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a12d14a5-7cae-4c58-ac47-08da5b38198b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:02:53.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W3NZSbbaIz1iuFc7XuvrTMaOWtIe7uuXhzkL6cN4Dw8CQcs8mtS599oP0Zwh7yKIT42/hAssk4SqnwUKcZHjLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 08:03:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167451

This security upgrade fixes CVE-2022-2068 as per below link
Link: https://www.openssl.org/news/cl111.txt
Also, remove 73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch and
b7ce611887cfac633aacc052b2e71a7f195418b8.patch as these two are part
1.1.1p now

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 ...5d82489b3ec09ccc772dfcee14fef0e8e908.patch | 192 ------------------
 ...611887cfac633aacc052b2e71a7f195418b8.patch |  29 ---
 .../{openssl_1.1.1o.bb =3D> openssl_1.1.1p.bb}  |   4 +-
 3 files changed, 1 insertion(+), 224 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/73db5d82489b3=
ec09ccc772dfcee14fef0e8e908.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/b7ce611887cfa=
c633aacc052b2e71a7f195418b8.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1o.bb =3D> openssl_1=
.1.1p.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc=
772dfcee14fef0e8e908.patch b/meta/recipes-connectivity/openssl/openssl/73db=
5d82489b3ec09ccc772dfcee14fef0e8e908.patch
deleted file mode 100644
index 438ecdcd32..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfce=
e14fef0e8e908.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From 73db5d82489b3ec09ccc772dfcee14fef0e8e908 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 1 Jun 2022 12:47:44 +0200
-Subject: [PATCH] Update expired SCT certificates
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
-(Merged from https://github.com/openssl/openssl/pull/18446)
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/73db5=
d82489b3ec09ccc772dfcee14fef0e8e908]
-Signed-off-by: Steve Sakoman <steve@sakoman.com>
-
----
- test/certs/embeddedSCTs1-key.pem        | 38 ++++++++++++++++---------
- test/certs/embeddedSCTs1.pem            | 35 ++++++++++++-----------
- test/certs/embeddedSCTs1.sct            | 12 ++++----
- test/certs/embeddedSCTs1_issuer-key.pem | 15 ++++++++++
- test/certs/embeddedSCTs1_issuer.pem     | 30 +++++++++----------
- 5 files changed, 79 insertions(+), 51 deletions(-)
- create mode 100644 test/certs/embeddedSCTs1_issuer-key.pem
-
-diff --git a/test/certs/embeddedSCTs1-key.pem b/test/certs/embeddedSCTs1-k=
ey.pem
-index e3e66d55c510..28dd206dbe8d 100644
---- a/test/certs/embeddedSCTs1-key.pem
-+++ b/test/certs/embeddedSCTs1-key.pem
-@@ -1,15 +1,27 @@
- -----BEGIN RSA PRIVATE KEY-----
--MIICWwIBAAKBgQC+75jnwmh3rjhfdTJaDB0ym+3xj6r015a/BH634c4VyVui+A7k
--WL19uG+KSyUhkaeb1wDDjpwDibRc1NyaEgqyHgy0HNDnKAWkEM2cW9tdSSdyba8X
--EPYBhzd+olsaHjnu0LiBGdwVTcaPfajjDK8VijPmyVCfSgWwFAn/Xdh+tQIDAQAB
--AoGAK/daG0vt6Fkqy/hdrtSJSKUVRoGRmS2nnba4Qzlwzh1+x2kdbMFuaOu2a37g
--PvmeQclheKZ3EG1+Jb4yShwLcBCV6pkRJhOKuhvqGnjngr6uBH4gMCjpZVj7GDMf
--flYHhdJCs3Cz/TY0wKN3o1Fldil2DHR/AEOc1nImeSp5/EUCQQDjKS3W957kYtTU
--X5BeRjvg03Ug8tJq6IFuhTFvUJ+XQ5bAc0DmxAbQVKqRS7Wje59zTknVvS+MFdeQ
--pz4dGuV7AkEA1y0X2yarIls+0A/S1uwkvwRTIkfS+QwFJ1zVya8sApRdKAcidIzA
--b70hkKLilU9+LrXg5iZdFp8l752qJiw9jwJAXjItN/7mfH4fExGto+or2kbVQxxt
--9LcFNPc2UJp2ExuL37HrL8YJrUnukOF8KJaSwBWuuFsC5GwKP4maUCdfEQJAUwBR
--83c3DEmmMRvpeH4erpA8gTyzZN3+HvDwhpvLnjMcvBQEdnDUykVqbSBnxrCjO+Fs
--n1qtDczWFVf8Cj2GgQJAQ14Awx32Cn9sF+3M+sEVtlAf6CqiEbkYeYdSCbsplMmZ
--1UoaxiwXY3z+B7epsRnnPR3KaceAlAxw2/zQJMFNOQ=3D=3D
-+MIIEpQIBAAKCAQEAuIjpA4/iCpDA2mjywI5zG6IBX6bNcRQYDsB7Cv0VonNXtJBw
-+XxMENP4jVpvEmWpJ5iMBknGHV+XWBkngYapczIsY4LGn6aMU6ySABBVQpNOQSRfT
-+48xGGPR9mzOBG/yplmpFOVq1j+b65lskvAXKYaLFpFn3oY/pBSdcCNBP8LypVXAJ
-+b3IqEXsBL/ErgHG9bgIRP8VxBAaryCz77kLzAXkfHL2LfSGIfNONyEKB3xI94S4L
-+eouOSoWL1VkEfJs87vG4G5xoXw3KOHyiueQUUlMnu8p+Bx0xPVKPEsLje3R9k0rG
-+a5ca7dXAn9UypKKp25x4NXpnjGX5txVEYfNvqQIDAQABAoIBAE0zqhh9Z5n3+Vbm
-+tTht4CZdXqm/xQ9b0rzJNjDgtN5j1vuJuhlsgUQSVoJzZIqydvw7BPtZV8AkPagf
-+3Cm/9lb0kpHegVsziRrfCFes+zIZ+LE7sMAKxADIuIvnvkoRKHnvN8rI8lCj16/r
-+zbCD06mJSZp6sSj8ZgZr8wsU63zRGt1TeGM67uVW4agphfzuKGlXstPLsSMwknpF
-+nxFS2TYbitxa9oH76oCpEk5fywYsYgUP4TdzOzfVAgMzNSu0FobvWl0CECB+G3RQ
-+XQ5VWbYkFoj5XbE5kYz6sYHMQWL1NQpglUp+tAQ1T8Nca0CvbSpD77doRGm7UqYw
-+ziVQKokCgYEA6BtHwzyD1PHdAYtOcy7djrpnIMaiisSxEtMhctoxg8Vr2ePEvMpZ
-+S1ka8A1Pa9GzjaUk+VWKWsTf+VkmMHGtpB1sv8S7HjujlEmeQe7p8EltjstvLDmi
-+BhAA7ixvZpXXjQV4GCVdUVu0na6gFGGueZb2FHEXB8j1amVwleJj2lcCgYEAy4f3
-+2wXqJfz15+YdJPpG9BbH9d/plKJm5ID3p2ojAGo5qvVuIJMNJA4elcfHDwzCWVmn
-+MtR/WwtxYVVmy1BAnmk6HPSYc3CStvv1800vqN3fyJWtZ1P+8WBVZWZzIQdjdiaU
-+JSRevPnjQGc+SAZQQIk1yVclbz5790yuXsdIxf8CgYEApqlABC5lsvfga4Vt1UMn
-+j57FAkHe4KmPRCcZ83A88ZNGd/QWhkD9kR7wOsIz7wVqWiDkxavoZnjLIi4jP9HA
-+jwEZ3zER8wl70bRy0IEOtZzj8A6fSzAu6Q+Au4RokU6yse3lZ+EcepjQvhBvnXLu
-+ZxxAojj6AnsHzVf9WYJvlI0CgYEAoATIw/TEgRV/KNHs/BOiEWqP0Co5dVix2Nnk
-+3EVAO6VIrbbE3OuAm2ZWeaBWSujXLHSmVfpoHubCP6prZVI1W9aTkAxmh+xsDV3P
-+o3h+DiBTP1seuGx7tr7spQqFXeR3OH9gXktYCO/W0d3aQ7pjAjpehWv0zJ+ty2MI
-+fQ/lkXUCgYEAgbP+P5UmY7Fqm/mi6TprEJ/eYktji4Ne11GDKGFQCfjF5RdKhdw1
-+5+elGhZes+cpzu5Ak6zBDu4bviT+tRTWJu5lVLEzlHHv4nAU7Ks5Aj67ApH21AnP
-+RtlATdhWOt5Dkdq1WSpDfz5bvWgvyBx9D66dSmQdbKKe2dH327eQll4=3D
- -----END RSA PRIVATE KEY-----
-diff --git a/test/certs/embeddedSCTs1.pem b/test/certs/embeddedSCTs1.pem
-index d1e85120a043..d2a111fb8235 100644
---- a/test/certs/embeddedSCTs1.pem
-+++ b/test/certs/embeddedSCTs1.pem
-@@ -1,20 +1,21 @@
- -----BEGIN CERTIFICATE-----
--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
-+YT6yTEIzJuO07Xp61qnB1CE2TrinUWlyC46Zkw=3D=3D
- -----END CERTIFICATE-----
-diff --git a/test/certs/embeddedSCTs1.sct b/test/certs/embeddedSCTs1.sct
-index 59362dcee1f4..35c9eb9e3bed 100644
---- a/test/certs/embeddedSCTs1.sct
-+++ b/test/certs/embeddedSCTs1.sct
-@@ -2,11 +2,11 @@ Signed Certificate Timestamp:
-     Version   : v1 (0x0)
-     Log ID    : DF:1C:2E:C1:15:00:94:52:47:A9:61:68:32:5D:DC:5C:
-                 79:59:E8:F7:C6:D3:88:FC:00:2E:0B:BD:3F:74:D7:64
--    Timestamp : Apr  5 17:04:16.275 2013 GMT
-+    Timestamp : Jan  1 00:00:00.000 2020 GMT
-     Extensions: none
-     Signature : ecdsa-with-SHA256
--                30:45:02:20:48:2F:67:51:AF:35:DB:A6:54:36:BE:1F:
--                D6:64:0F:3D:BF:9A:41:42:94:95:92:45:30:28:8F:A3:
--                E5:E2:3E:06:02:21:00:E4:ED:C0:DB:3A:C5:72:B1:E2:
--                F5:E8:AB:6A:68:06:53:98:7D:CF:41:02:7D:FE:FF:A1:
--                05:51:9D:89:ED:BF:08
-\ No newline at end of file
-+                30:45:02:20:7C:33:E8:F1:10:2B:9B:FB:DC:48:46:7A:
-+                D3:C4:35:BB:E5:D0:E7:94:01:BB:AE:D2:64:4B:99:C4:
-+                BA:5B:50:CD:02:21:00:D1:B2:07:13:B9:DE:0F:0F:2F:
-+                02:82:0F:A5:1D:E0:12:ED:4C:60:48:A0:5B:58:0C:E7:
-+                60:EB:A8:AF:03:5E:C3
-\ No newline at end of file
-diff --git a/test/certs/embeddedSCTs1_issuer-key.pem b/test/certs/embedded=
SCTs1_issuer-key.pem
-new file mode 100644
-index 000000000000..9326e38b1eb7
---- /dev/null
-+++ b/test/certs/embeddedSCTs1_issuer-key.pem
-@@ -0,0 +1,15 @@
-+-----BEGIN RSA PRIVATE KEY-----
-+MIICXAIBAAKBgQDVimhTYhCicRmTbneDIRgcKkATxtB7jHbrkVfT0PtLO1FuzsvR
-+yY2RxS90P6tjXVUJnNE6uvMa5UFEJFGnTHgW8iQ8+EjPKDHM5nugSlojgZ88ujfm
-+JNnDvbKZuDnd/iYx0ss6hPx7srXFL8/BT/9Ab1zURmnLsvfP34b7arnRsQIDAQAB
-+AoGAJLR6xEJp+5IXRFlLn7WTkFvO0ddtxJ7bXhiIkTctyruyfqp7LF9Jv1G2m3PK
-+QPUtBc73w/GYkfnwIwdfJbOmPHL7XyEGHZYmEXgIgEtw6LXvAv0G5JpUnNwsSBfL
-+GfSQqI5Z5ytyzlJXkMcTGA2kTgNAYc73h4EnU+pwUnDPdAECQQD2aj+4LtYk1XPq
-+r3gjgI6MoGvgYJfPmAtZhxxVbhXQKciFUCAcBiwlQdHIdLWE9j65ctmZRWidKifr
-+4O4nz+TBAkEA3djNW/rTQq5fKZy+mCF1WYnIU/3yhJaptzRqLm7AHqe7+hdrGXJw
-++mCtU8T3L/Ms8bH1yFBZhmkp1PbR8gl48QJAQo70YyWThiN5yfxXcQ96cZWrTdIJ
-+b3NcLXSHPLQdhDqlBQ1dfvRT3ERpC8IqfZ2d162kBPhwh3MpkVcSPQK0gQJAC/dY
-+xGBYKt2a9nSk9zG+0bCT5Kvq++ngh6hFHfINXNnxUsEWns3EeEzkrIMQTj7QqszN
-+lBt5aL2dawZRNrv6EQJBAOo4STF9KEwQG0HLC/ryh1FeB0OBA5yIepXze+eJVKei
-+T0cCECOQJKfWHEzYJYDJhyEFF/sYp9TXwKSDjOifrsU=3D
-+-----END RSA PRIVATE KEY-----
-diff --git a/test/certs/embeddedSCTs1_issuer.pem b/test/certs/embeddedSCTs=
1_issuer.pem
-index 1fa449d5a098..6aa9455f09ed 100644
---- a/test/certs/embeddedSCTs1_issuer.pem
-+++ b/test/certs/embeddedSCTs1_issuer.pem
-@@ -1,18 +1,18 @@
- -----BEGIN CERTIFICATE-----
--MIIC0DCCAjmgAwIBAgIBADANBgkqhkiG9w0BAQUFADBVMQswCQYDVQQGEwJHQjEk
-+MIIC0jCCAjugAwIBAgIBADANBgkqhkiG9w0BAQsFADBVMQswCQYDVQQGEwJHQjEk
- MCIGA1UEChMbQ2VydGlmaWNhdGUgVHJhbnNwYXJlbmN5IENBMQ4wDAYDVQQIEwVX
--YWxlczEQMA4GA1UEBxMHRXJ3IFdlbjAeFw0xMjA2MDEwMDAwMDBaFw0yMjA2MDEw
--MDAwMDBaMFUxCzAJBgNVBAYTAkdCMSQwIgYDVQQKExtDZXJ0aWZpY2F0ZSBUcmFu
--c3BhcmVuY3kgQ0ExDjAMBgNVBAgTBVdhbGVzMRAwDgYDVQQHEwdFcncgV2VuMIGf
--MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVimhTYhCicRmTbneDIRgcKkATxtB7
--jHbrkVfT0PtLO1FuzsvRyY2RxS90P6tjXVUJnNE6uvMa5UFEJFGnTHgW8iQ8+EjP
--KDHM5nugSlojgZ88ujfmJNnDvbKZuDnd/iYx0ss6hPx7srXFL8/BT/9Ab1zURmnL
--svfP34b7arnRsQIDAQABo4GvMIGsMB0GA1UdDgQWBBRfnYgNyHPmVNT4DdjmsMEk
--tEfDVTB9BgNVHSMEdjB0gBRfnYgNyHPmVNT4DdjmsMEktEfDVaFZpFcwVTELMAkG
--A1UEBhMCR0IxJDAiBgNVBAoTG0NlcnRpZmljYXRlIFRyYW5zcGFyZW5jeSBDQTEO
--MAwGA1UECBMFV2FsZXMxEDAOBgNVBAcTB0VydyBXZW6CAQAwDAYDVR0TBAUwAwEB
--/zANBgkqhkiG9w0BAQUFAAOBgQAGCMxKbWTyIF4UbASydvkrDvqUpdryOvw4BmBt
--OZDQoeojPUApV2lGOwRmYef6HReZFSCa6i4Kd1F2QRIn18ADB8dHDmFYT9czQiRy
--f1HWkLxHqd81TbD26yWVXeGJPE3VICskovPkQNJ0tU4b03YmnKliibduyqQQkOFP
--OwqULg=3D=3D
-+YWxlczEQMA4GA1UEBxMHRXJ3IFdlbjAgFw0yMjA2MDExMDM4MDJaGA8yMTIyMDUw
-+ODEwMzgwMlowVTELMAkGA1UEBhMCR0IxJDAiBgNVBAoTG0NlcnRpZmljYXRlIFRy
-+YW5zcGFyZW5jeSBDQTEOMAwGA1UECBMFV2FsZXMxEDAOBgNVBAcTB0VydyBXZW4w
-+gZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANWKaFNiEKJxGZNud4MhGBwqQBPG
-+0HuMduuRV9PQ+0s7UW7Oy9HJjZHFL3Q/q2NdVQmc0Tq68xrlQUQkUadMeBbyJDz4
-+SM8oMczme6BKWiOBnzy6N+Yk2cO9spm4Od3+JjHSyzqE/HuytcUvz8FP/0BvXNRG
-+acuy98/fhvtqudGxAgMBAAGjga8wgawwHQYDVR0OBBYEFF+diA3Ic+ZU1PgN2Oaw
-+wSS0R8NVMH0GA1UdIwR2MHSAFF+diA3Ic+ZU1PgN2OawwSS0R8NVoVmkVzBVMQsw
-+CQYDVQQGEwJHQjEkMCIGA1UEChMbQ2VydGlmaWNhdGUgVHJhbnNwYXJlbmN5IENB
-+MQ4wDAYDVQQIEwVXYWxlczEQMA4GA1UEBxMHRXJ3IFdlboIBADAMBgNVHRMEBTAD
-+AQH/MA0GCSqGSIb3DQEBCwUAA4GBAD0aYh9OkFYfXV7kBfhrtD0PJG2U47OV/1qq
-++uFpqB0S1WO06eJT0pzYf1ebUcxjBkajbJZm/FHT85VthZ1lFHsky87aFD8XlJCo
-+2IOhKOkvvWKPUdFLoO/ZVXqEVKkcsS1eXK1glFvb07eJZya3JVG0KdMhV2YoDg6c
-+Doud4XrO
- -----END CERTIFICATE-----
diff --git a/meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aac=
c052b2e71a7f195418b8.patch b/meta/recipes-connectivity/openssl/openssl/b7ce=
611887cfac633aacc052b2e71a7f195418b8.patch
deleted file mode 100644
index 832f651660..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e=
71a7f195418b8.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b7ce611887cfac633aacc052b2e71a7f195418b8 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 1 Jun 2022 13:06:46 +0200
-Subject: [PATCH] ct_test.c: Update the epoch time
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
-(Merged from https://github.com/openssl/openssl/pull/18446)
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/b7ce6=
11887cfac633aacc052b2e71a7f195418b8]
-Signed-off-by: Steve Sakoman <steve@sakoman.com>
-
----
- test/ct_test.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/ct_test.c b/test/ct_test.c
-index 78d11ca98cf7..535897d09a77 100644
---- a/test/ct_test.c
-+++ b/test/ct_test.c
-@@ -63,7 +63,7 @@ static CT_TEST_FIXTURE *set_up(const char *const test_ca=
se_name)
-     if (!TEST_ptr(fixture =3D OPENSSL_zalloc(sizeof(*fixture))))
-         goto end;
-     fixture->test_case_name =3D test_case_name;
--    fixture->epoch_time_in_ms =3D 1473269626000ULL; /* Sep 7 17:33:46 201=
6 GMT */
-+    fixture->epoch_time_in_ms =3D 1580335307000ULL; /* Wed 29 Jan 2020 10=
:01:47 PM UTC */
-     if (!TEST_ptr(fixture->ctlog_store =3D CTLOG_STORE_new())
-             || !TEST_int_eq(
-                     CTLOG_STORE_load_default_file(fixture->ctlog_store), =
1))
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1p.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1p.bb
index e24467739f..8916218c33 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1p.bb
@@ -18,15 +18,13 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
-           file://73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch \
-           file://b7ce611887cfac633aacc052b2e71a7f195418b8.patch \
            "

 SRC_URI_append_class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "

-SRC_URI[sha256sum] =3D "9384a2b0570dd80358841464677115df785edb941c71211f75=
076d72fe6b438f"
+SRC_URI[sha256sum] =3D "bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e4=
4644d9fc8ace6f"

 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

