Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64988C021B5
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.127])
 by mx.groups.io with SMTP id smtpd.web10.1101.1739286068172146538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=J79WWgAH;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.127, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdAYJMIuBwEBNtO6/FBHh1npw9+BdLfWwu4Cx65B6bYKZOLVwB40iMfPTBWSxKGApcOABI5BIjvUh40Z/m+4zM17DcUv/wFL1fF0t2/XgN/UapWDUtotjtJG1RMEmUV6U4dCLZNDMtYo2U3oFfyUTNlCriYUhF5h2M1SaOP3N9ckyF5e67+CHByJ9+OHlvUt38e9aGg/bZAtJyAECrD0+9Q6gNkhIDtWP0e9xC//z7cO8mogrG3pa75vs7cPa6rbZskHGj+YT78NzmfI61D7BQMR7LHqDQ5RtwodNpvpBvu1TjHHZp03wABtGNTJJATA7StWMNv6a+HyAw174s3vSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNkf5BhJbf/gYgJNicNTJmId46lHF6p5nlnmEsni/j0=;
 b=aM/TIQkbqu9Qmh4ApsJplOrsazw3gxBjKLUhuhc1m4WfS3WU+OL9ASqOYND3yxeDy5lAFy1vYmqZkkLJHHhV2c0ZB1zEDpw67MolCYoNiFMejQrim4OkyjtDIcDsxQCmhs6m93YuIS9fFW/vkU+tTsR+8bjqeDkaDQ1Jh+tUtCeKVbRIJIvv+Cfhhh6StvI/GTpbxtOwbeMiNYQdHlBZGwE/nQv++jbRkeJd65tlBeewv2qeEuE6k+ZKPcKPw5GZJ8P/w3YyA+z+C3PCKPUat0WuJN0W4KVkvLf8ukGrbReX4bwwZWqT9Hf9lN9giFqQCXyDoqRsau+t8grIjaXSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNkf5BhJbf/gYgJNicNTJmId46lHF6p5nlnmEsni/j0=;
 b=J79WWgAHm7Vy4AoypljP8Qr5C1axfO20SRp3SnQDaSpW7daWiIM8lWqfw4HX7rywx5njEGP9npM6qAtoBlt1IAEvzw7wkGh92ATkKjGSL2n90Cm3/ny+tOJj0z9ajFzq1XCMBali2pkaXVa6/SidG8xXinMplaEiN9nL4+2jGJ/msn0H6wL4QpRzkGa5OzxFs3lUT4xbeQQXiBYF1C//JEHM9ZiI9mBAR9KIwmc3IRjsJrj9dszTyQrm1hJm8Swk8yMix3/O4292j1BxWtxBm35FarLVHDe0qGrEuPrpzXT8z7lbW2uYT3vvc2loomdlemcnv38hQ4E5/FNiAbVUgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:02 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:02 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor cargo class
Date: Tue, 11 Feb 2025 16:00:25 +0100
Message-ID: <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb9172b3-cb45-436d-4075-08dd4aace2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gktWW8+c8YJRo7xe2J7IRIFkEO7aZm4c/EcFyo5VXqMAnXrJvN2mQOsbqJIC?=
 =?us-ascii?Q?FAXnxIuwaU1iGZ5OwxjF6TQxaMUfLYpkV/y59Fa2XErt0N3otdkmNENHCtAf?=
 =?us-ascii?Q?kGMJYSeEvnehi6ZTK5c3YOud6x0PXoLT9o8clCvF05M6qo8Y/o4PhRcC7TOG?=
 =?us-ascii?Q?zDJosxHyrx42qcshZAbzc/r5CBHNHd29a/yBYtTzIPKOewJuMFBVEGQ9p/2w?=
 =?us-ascii?Q?i6A7jb47vnRzzRi1Key3BRoqbo5RY3/ApR7vJVA2R24c+9BCcZ/P36Elb7IN?=
 =?us-ascii?Q?/h1qgasj8FNY4BspvwA5Yf1yekmdZgqpwcACHw0A7sxyIJhncvEnFEaqx1pD?=
 =?us-ascii?Q?bkBN2nlcQaXcAslQ5fO6sO0JcskoNJNPsNJohD3e0jLopdjl7s9J0o4Zyy/x?=
 =?us-ascii?Q?3yjeb0kqoNxPCoHS3Qsw3cOHvV0abSz0/P0WWXpOKtGX27HsTmiQwgTNtmWA?=
 =?us-ascii?Q?s+zHkVlt9K6VHAghSK24OLKZc6hFlEORRQmpPC41VNtyE6VhG5PD4wgxa4T/?=
 =?us-ascii?Q?fOmQGfTSsH1qiUq0qDaNGqXt5VtQxqbWU6nhqZH+6y/0/A/oC500J3jmVMPP?=
 =?us-ascii?Q?LyOIvl2gBKYjLXN93d46PiNanXi6yqVSeAWAtve6oRynZc1cvZwE6JIacAU8?=
 =?us-ascii?Q?pEYO3joow4/kbCiIBdrJ8HPhTNSKV2tHYesHKb9N6H/Ks+Q8qWot4wFHKKAY?=
 =?us-ascii?Q?/DR79ozRDiblgJe6w6W+vpyai/QTcD1q8JiDE05s9GcgYEDxT1F6Dv4kj1qh?=
 =?us-ascii?Q?ER6BMVEi8DukMP8fiDnrwW42NVIain5EaiRQSKWGLZgdfUMTdE1a9BllwoXU?=
 =?us-ascii?Q?iHewy3mr8fI3ld67+So88UeUtGmpKMa0VrXKUQ/veJHUY9RuzDAzZGffUQQU?=
 =?us-ascii?Q?dtT5YPoxuxUqrVTPanEbX5ZX88lzgd+PXFCyqP5p5NUffZtnJZ7n3UtLaT+o?=
 =?us-ascii?Q?rsf9O7LBGWYEKB6oc4a6waIS1vAFr5Ygtf7ONprDVzvMYMVnEfvBbAMTzvAz?=
 =?us-ascii?Q?oR8Ps8/hSndiIbDhAR9XAHvyBP7eiuMqve9aDdLrvSN/CbWVJ9yJgHR6VT8U?=
 =?us-ascii?Q?jDzjbeAmim0YbkXxXYxvGtFlUD1+0KqplUM7YqVweZGkJ6HfXOuy7wzHV/hY?=
 =?us-ascii?Q?dXBB1SR5XIZ1MUYYX2OTcHegqxhtcDq15MOL5EhgzjFSX+FbVy4P3MVOlK3A?=
 =?us-ascii?Q?GSYODpFYO4lxgCaiKKYXbI8eS7YtFRgdb8VAFbiruJw6Bi5Ehj+W2qCp43pL?=
 =?us-ascii?Q?7ZeqMtrXw//toaAUP4N/Zsf9dmGtFsGbN0E6Fp5dx2d4isR/3WRWdi43Qxpq?=
 =?us-ascii?Q?6X/ejuyNgVYBIxLOio97QMzbma8NWOIl4Nr3z+hl/AwjtW14x+HblGG2ddaL?=
 =?us-ascii?Q?Tlb4pf1q+MUdZdoU4BG4t/hCSy9jK051a2/Y8I2/3JtynjmyI12qzzs74D7G?=
 =?us-ascii?Q?DCUfSro5BNavQcetY7zN3M5MDtJY2GAY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:sl;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3z9hCJVlqJ5mHLhnREvZjEqKJeIw/1MGub42q3y+m9RWnRYHnps49qRbEEbb?=
 =?us-ascii?Q?Yudqi4T0iIxH6/bYXHhotgUo4Xuam8rIQs1PLjX6F8ejAxXz8tZtPukxur6u?=
 =?us-ascii?Q?O1svljmQ+jCC2ZG55pKcixuw08Rd5dqLArg443PH3kPYy13rUwfZJfrIjxrF?=
 =?us-ascii?Q?DYcCEIbROyNGf69s+f7Xrb9Vti76o1eDu3pVbH/zBbvY51e+/YWh3PJoU35p?=
 =?us-ascii?Q?/LSJ/mnarF49JQemq9RR9iXquvY1j715n3fRS14704TVfBSUYRSgek/ikHik?=
 =?us-ascii?Q?rLWZr7EsF80h7NfoWtQSVm3wUjJApTZvJo9zG9WFIFVx1Z4NEistqdEiRLuh?=
 =?us-ascii?Q?Z41wmXDNrHifbN1pgOcdM63Xt5/6v/f9k3ega0J02d6Bz/Bc/leLoBQ66pwF?=
 =?us-ascii?Q?XZaiMVqEYZhwrx6FhIy+jxJWZDB0a/i+aYOjdIUQdxX2uHDLVsEjyyueH33a?=
 =?us-ascii?Q?pOFhL/Sq+89HzuiRYsL/ZFbyddeMYz11oYbt7rMKsiL1chb3saYi+owfsAOv?=
 =?us-ascii?Q?5UDoZ/1P0LOjUzXN+WPKWzoUHmfdOk7sm6JFirtYTNkz85iKTik+dQjtHW9H?=
 =?us-ascii?Q?rLOa1QpJ45CBjqoVH4cEdvjT81qmqhhL4jk058AR7Yo4bR3oN7WGNAtnyDso?=
 =?us-ascii?Q?8GZYdlcs+A69btEUIu9GWASZ3YAD2nWuhuOmYxJ/b7Avw2SfM3xUK3pbekVV?=
 =?us-ascii?Q?5TjH2J6aVxySwT2dK6SbuHqG8zXEAs4EwOgtSs4GSP2TuL4tLXvnTdNZdjKA?=
 =?us-ascii?Q?z0NXVBPKtHBUXYp5ZXm4qdrcvKqj2SNUrO7sP805xd56dgb+CrXqRvqBa1pN?=
 =?us-ascii?Q?bi0kSSQih6KK7BWCtbeaoJ3TcBUGf8aygRyC81Ae36uRf0MyeBDQzkbSUbhY?=
 =?us-ascii?Q?ChpQf8r5TDbbOUTcZ4YCanRvtk+1q7+mljozmNML5WfsY9cGTFBk4M3lVLmQ?=
 =?us-ascii?Q?b742RFFstQ4QUT5hK47mtPf3OJ/a1tDsCEjquh8eaX+eAxaLGxP5ENkSRcq6?=
 =?us-ascii?Q?GKsSt9Sdl8nKEmgOGk0aP1QG2rttHnni+qn6Ut/I09DHu4reb+Ruvsi1T6Tf?=
 =?us-ascii?Q?xlgqAKw5Q8VW2iEDeWCx+vEfctvM7L8d5uLCQZhhfDTMxnX6ShetIAc0a7Q+?=
 =?us-ascii?Q?c831pnYWkgEfdaoLVi6w9P6Dzilbhk2KsulRzX1c0qGFouOZ4LNjP6kjxSz/?=
 =?us-ascii?Q?GofEfJj83cIJ7JkLdMLo/BXEn1QsFyrHZj/NSkpe1hjN6MJHoQDaow1cksjU?=
 =?us-ascii?Q?wdFqZdtNwl39J3S/b3ZlV5B+zUIahWniYfgInpjaRILHY1Q1tFEI2XRCLr6z?=
 =?us-ascii?Q?5aEp8LgZL+Uyuj/H17lxb6H8qWfB3HCtpJ8stM8ovGtVGtp/ZkUvMgKsBW02?=
 =?us-ascii?Q?YQuSrGcOoWujwtzcJA3YxQ5dwwQ+SwWH1WJq4aii4fRR9VUKIAymiptjX28W?=
 =?us-ascii?Q?Dk9qbkA4NrTuf5DJ6B2gdwDIyr/vuSu8PPEaZSBfqyIo/7pYZWzmbjBKMPWh?=
 =?us-ascii?Q?HplumzNO3I4mpFpqhiCW6Sw8sswEzXcIM311rUf0ECh2wo2aka9gO4tl1jc0?=
 =?us-ascii?Q?WofHyg/fSY3dgl/zkQmMAbo0jQhyNKsFOjchi4iH/90g/vc3DUtS59uLMHFZ?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9172b3-cb45-436d-4075-08dd4aace2fc
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:56.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhV543jztu/DUnx3p1ca17ANeHQExM1Wt4e5h0LjEx7hjBPc0FTblktzPjl//UP4Rx/r6S1b72s84X81ZzVRxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211149

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../python/python3-bcrypt-crates.inc          | 84 -------------------
 .../python/python3-bcrypt_4.2.1.bb            |  4 +-
 2 files changed, 1 insertion(+), 87 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.inc

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/=
recipes-devtools/python/python3-bcrypt-crates.inc
deleted file mode 100644
index 576abcd7cb..0000000000
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ /dev/null
@@ -1,84 +0,0 @@
-# Autogenerated with 'bitbake -c update_crates python3-bcrypt'
-
-# from src/_bcrypt/Cargo.lock
-SRC_URI +=3D " \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bcrypt/0.16.0 \
-    crate://crates.io/bcrypt-pbkdf/0.10.0 \
-    crate://crates.io/block-buffer/0.10.4 \
-    crate://crates.io/blowfish/0.9.1 \
-    crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/cpufeatures/0.2.15 \
-    crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/digest/0.10.7 \
-    crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.15 \
-    crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/inout/0.1.3 \
-    crate://crates.io/libc/0.2.164 \
-    crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/pbkdf2/0.12.2 \
-    crate://crates.io/portable-atomic/1.9.0 \
-    crate://crates.io/proc-macro2/1.0.89 \
-    crate://crates.io/pyo3/0.23.1 \
-    crate://crates.io/pyo3-build-config/0.23.1 \
-    crate://crates.io/pyo3-ffi/0.23.1 \
-    crate://crates.io/pyo3-macros/0.23.1 \
-    crate://crates.io/pyo3-macros-backend/0.23.1 \
-    crate://crates.io/quote/1.0.37 \
-    crate://crates.io/sha2/0.10.8 \
-    crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.87 \
-    crate://crates.io/target-lexicon/0.12.16 \
-    crate://crates.io/typenum/1.17.0 \
-    crate://crates.io/unicode-ident/1.0.13 \
-    crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/zeroize/1.8.1 \
-"
-
-SRC_URI[autocfg-1.4.0.sha256sum] =3D "ace50bade8e6234aa140d9a2f552bbee1db4=
d353f69b8217bc503490fc1a9f26"
-SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bcrypt-0.16.0.sha256sum] =3D "2b1866ecef4f2d06a0bb77880015fdf2b89e=
25a1c2e5addacb87e459c86dc67e"
-SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] =3D "6aeac2e1fe888769f34f05ac343bbe=
f98b14d1ffb292ab69d4608b3abc86f2a2"
-SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa394996=
acacc5cbc91c5a20d8c658e77abd503a71"
-SRC_URI[blowfish-0.9.1.sha256sum] =3D "e412e2cd0f2b2d93e02543ceae7917b3c70=
331573df19ee046bcbc35e45e87d7"
-SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886acf35=
3beff7305ebd1ae69500e27c67f64b"
-SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee582e=
bb74b53b4efbf79117bd2da40fd"
-SRC_URI[cipher-0.4.4.sha256sum] =3D "773f3b9af64447d2ce9850330c473515014aa=
235e6a783b02db81ff39e4a3dad"
-SRC_URI[cpufeatures-0.2.15.sha256sum] =3D "0ca741a962e1b0bff6d724a1a0958b6=
86406e853bb14061f218562e1896f95e6"
-SRC_URI[crypto-common-0.1.6.sha256sum] =3D "1bfb12502f3fc46cca1bb51ac28df9=
d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[digest-0.10.7.sha256sum] =3D "9ed9a281f7bc9b7576e61468ba615a66a5c8=
cfdff42420a70aa82701a3b1e292"
-SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51fd72272d7821adaf274a=
d91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.15.sha256sum] =3D "c4567c8db10ae91089c99af84c68c38da=
3ec2f087c3f82960bcdbf3656b6f4d7"
-SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.5.sha256sum] =3D "b248f5224d1d606005e02c97f5aa4e88eeb230=
488bcc03bc9ca4d7991399f2b5"
-SRC_URI[inout-0.1.3.sha256sum] =3D "a0c10553d664a4d0bcff9f4215d0aac67a639c=
c68ef660840afe309b807bc9f5"
-SRC_URI[libc-0.2.164.sha256sum] =3D "433bfe06b8c75da9b2e3fbea6e5329ff87748=
f0b144ef75306e674c3f6f7c13f"
-SRC_URI[memoffset-0.9.1.sha256sum] =3D "488016bfae457b036d996092f6cb448677=
611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.20.2.sha256sum] =3D "1261fe7e33c73b354eab43b1273a57c8f=
967d0391e80353e51f764ac02cf6775"
-SRC_URI[pbkdf2-0.12.2.sha256sum] =3D "f8ed6a7761f76e3b9f92dfb0a60a6a6477c6=
1024b775147ff0973a02653abaf2"
-SRC_URI[portable-atomic-1.9.0.sha256sum] =3D "cc9c68a3f6da06753e9335d63e27=
f6b9754dd1920d941135b7ea8224f141adb2"
-SRC_URI[proc-macro2-1.0.89.sha256sum] =3D "f139b0662de085916d1fb67d2b4169d=
1addddda1919e696f3252b740b629986e"
-SRC_URI[pyo3-0.23.1.sha256sum] =3D "7ebb0c0cc0de9678e53be9ccf8a2ab53045e6e=
3a8be03393ceccc5e7396ccb40"
-SRC_URI[pyo3-build-config-0.23.1.sha256sum] =3D "80e3ce69c4ec34476534b490e=
412b871ba03a82e35604c3dfb95fcb6bfb60c09"
-SRC_URI[pyo3-ffi-0.23.1.sha256sum] =3D "3b09f311c76b36dfd6dd6f7fa6f9f18e7e=
46a1c937110d283e80b12ba2468a75"
-SRC_URI[pyo3-macros-0.23.1.sha256sum] =3D "fd4f74086536d1e1deaff99ec038748=
1fb3325c82e4e48be0e75ab3d3fcb487a"
-SRC_URI[pyo3-macros-backend-0.23.1.sha256sum] =3D "9e77dfeb76b32bbf069144a=
5ea0a36176ab59c8db9ce28732d0f06f096bbfbc8"
-SRC_URI[quote-1.0.37.sha256sum] =3D "b5b9d34b8991d19d98081b46eacdd8eb58c6f=
2b201139f7c5f643cc155a633af"
-SRC_URI[sha2-0.10.8.sha256sum] =3D "793db75ad2bcafc3ffa7c68b215fee268f5379=
82cd901d132f89c6343f3a3dc8"
-SRC_URI[subtle-2.6.1.sha256sum] =3D "13c2bddecc57b384dee18652358fb23172fac=
b8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.87.sha256sum] =3D "25aa4ce346d03a6dcd68dd8b4010bcb74e54e62=
c90c573f394c46eae99aba32d"
-SRC_URI[target-lexicon-0.12.16.sha256sum] =3D "61c41af27dd6d1e27b1b16b489d=
b798443478cef1f06a660c96db617ba5de3b1"
-SRC_URI[typenum-1.17.0.sha256sum] =3D "42ff0bf0c66b8238c6f3b578df37d0b7848=
e55df8577b3f74f92a69acceeb825"
-SRC_URI[unicode-ident-1.0.13.sha256sum] =3D "e91b56cd4cadaeb79bbf1a5645f6b=
4f8dc5bde8834ad5894a8db35fda9efa1fe"
-SRC_URI[unindent-0.2.3.sha256sum] =3D "c7de7d73e1754487cb58364ee906a499937=
a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f283853=
ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a3b=
4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[zeroize-1.8.1.sha256sum] =3D "ced3678a2879b30306d323f4542626697a46=
4a97c0a07c9aebf7ebca65cd4dde"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb b/meta/re=
cipes-devtools/python/python3-bcrypt_4.2.1.bb
index 004e8ce8b1..9117637744 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
@@ -8,12 +8,10 @@ LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pt=
est', '-fuse-ld=3Dbfd', '',
=20
 SRC_URI[sha256sum] =3D "6765386e3ab87f569b276988742039baab087b2cdb01e809d7=
4e74503c2faafe"
=20
-inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-pyth=
on-pytest
+inherit pypi python_setuptools3_rust ptest-python-pytest vendor_cargo
=20
 CARGO_SRC_DIR =3D "src/_bcrypt"
=20
-require ${BPN}-crates.inc
-
 RDEPENDS:${PN}:class-target +=3D "\
     python3-cffi \
     python3-ctypes \
--=20
2.39.5


