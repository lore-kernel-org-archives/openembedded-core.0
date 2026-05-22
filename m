Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82FACD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 12:37:20 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15610.1779452975963838979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 05:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=d4DB+1j4;
 spf=pass (domain: est.tech, ip: 52.101.70.49, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erxK1Ss/HSbCxkfKGAvsw2jISZsfAT/rplR7mMOtRdcyowdmcnR44ILTSLnbFMES7XEpYQMwClGHrAWWK+uyPvPCqytJXFgc0NlLOI1bgBmOzZYOOfUshbfIzD+bpxPDy8jcey7RPtGr7lIE7gI7Ds4PHZCNvbkt1Sf+qWQfbFa6oFQxQlqbjfR5j29m074wGRPk0RBTjIRIyXyZuFGjBXJ6hAue1K+l04y6zyHMCCWgcTUldH/dP3Gc7itGlOQ4nYbxwf5yuFr9UUfzETo2CLMPHtK3JWTjKQJsAjAnzBr8QAkuGy3A0js8Mvefe7mzrR8Y7COk7Sj3umV+/HznUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH9iiVk7XT0ppYhmhSjaPDVuIko/KCC3wDDdH9fzy9o=;
 b=TjBxnucwfLbnoIEzZ/Jiyw19QIlWXTfo5TRabc4ir6ZhQT25XKL3z2Rwowacra3MLZ5wBmCSELq8cZ4Qvi/PZ/0A0knw7IqyHuG+Q+cFvWV8TtTBCPntguoLyUiYvPwIKboXcbyFPmc/vnT3o9iwCfl2ZKLnZWPg+3GW6fOUf2WPiwWwAOAZIK47qnj/QB/q/HhD5iaC21rfU8/8eyDEJUXJonv91XpndUWxTvFJFUvK8Q9hrFxv3MFTAhcAK5oYY1k59cjQpkOxnak5OOGpd6eaMRCBebcpGnA+kujejUAdwyDRDldT8hmx9H9q/VDKizSqCHxEfscPY/VOOjHOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH9iiVk7XT0ppYhmhSjaPDVuIko/KCC3wDDdH9fzy9o=;
 b=d4DB+1j43RkGlQ9X+2LBjiaQBbuRCaYRYOij1UhrH+O95u9ftsyaF/1nOzoOCqh3bC6VVulJZuafoJcjztZoTsr4sw/3eNthoeWRuCxGXcq9Wikb95ZsxxiMGNFNYW6wzU4PGdj2EinUqyXXk8h8nMrk7HBzhcfLBmT2h835v48KN3RhX2rSW1dQavn+7f94cLG36VmQ9ve4pmzgnQSn9Wn/er6MzdigCNi+Sc4iwXMgC1fRusmdUI+gsSFFKZBiGcugybrk6NZ9ElgCApTguPK7SscIQPylFcDFz/9t3iy/xbM7NdAIKdvoLqnmmXEBrO/25p4g/nLvdvECygvvRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS4P189MB1992.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:507::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:29:31 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 12:29:31 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] openssh: fix CVE-2026-35386
Date: Fri, 22 May 2026 14:29:20 +0200
Message-ID: <20260522122927.530024-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0388.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::15) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS4P189MB1992:EE_
X-MS-Office365-Filtering-Correlation-Id: a352580f-f2d3-49e8-17ee-08deb7fdc5fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|18002099003|56012099003|25016099003|12006099003|3023799007|29003799003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Fkogj02aVbEwLJcrkVquAilEUsL8xKmqwDJ11sUTRRQk+LHrWZ7238wV3CkiiKz8K8XoP5++DUbcjykVRyVkPBpT6w47agWBhNmPwDJKTDFdHcN17jC5SLS86a2BqAWUL2kYBxx3eBs7eHQU2db3mxysOWlUUwS8O+LgaD/3xyt5QqOiiY4JNVw22YvvheJPsduR8VzgHgyJF1jXOef86zkpzuDOCVaHkeKJzIPn14dmf3wPgi3MiD7y+Qoxrj7gYlVAYlWJQQIs9UScR8DXC8k69IHCIcBdptI/8EZTvIsXSJl3SMUP/uTqeVpEu6RYIkMLzsyumhoa39EVYs8fTDuparZyOkGSpHB9UkzgR+iahLPTmZjZyy9Do4QNbDv8RsObFI7jzjMmrCmcDFv0sTY+sxh+gYT1ggdgiz8RBtvDHBdEWfIFzXkTQF6uVQFSqAlxJyFn18mgHZRvJiqThaO4ac47PxulXmzuVqYGnHwEsEHYT5xS1p6wMWxnC4C5TH266Omb4nKXEjaR9EN1NO1PwGVosLfFeciSEEFJOdBZ13+lNwqMDCDHFbw7tQMLGUO90/zJzmwfk2S6eXsEXxDiXqHhvuZak6R9cXYQ9ZotEczKsI21UrOBMgOD+puIUdGRn8tVwnd6CNNZ4Frf7lOJ3ziIx2lpPXmQPiTgdsneSVHZKoVbnzrMUlO3xEs2XAgbzrOyTgq5o+hdqJ4NSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(18002099003)(56012099003)(25016099003)(12006099003)(3023799007)(29003799003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bpcPK0g5eXO+CmpRYWV8hc2Sn71qX30U7OFomp1ZkZNp9mN6Um5xGhtIAWPc?=
 =?us-ascii?Q?8/nSbxykH5q4KJTgFeulANJW/ziNNpd+9mYk14VZ/vzctrEprCu9+pp2uZzj?=
 =?us-ascii?Q?oS3XKo7ZeUbZ8RqaKFxfGYcimJ66tjQcs3UG8tycAJg9LFVx0ri4V0KOUE+S?=
 =?us-ascii?Q?FIK+f1c5nCIz47GLOJAT522glQi0ZjteOxEXusI9AZVX50yaXnSexAWkXL1Z?=
 =?us-ascii?Q?U5gDO9R7v1swQm3SF/RiviOrMcZNXfF7mjLH/+1w8xzTzyy06OP9XwdwG3ST?=
 =?us-ascii?Q?AxmGVFRQuxdVoV51cW9fYYOmc5Rx5YaTy13hLF0vwDmJ/PY37qM/So9wgOsL?=
 =?us-ascii?Q?/4q9Pafov5ThV67SIYEHIlLuxBvdQevheK7C3+Y3qMaiVXvEO9Xw3xEupNwo?=
 =?us-ascii?Q?sqJv1zx6FKg3mNzh6vyBoVPVTlbTKZ8mJserefHmK864tMwNwvyOjgQXKsH4?=
 =?us-ascii?Q?hcM4yxFSlRvHvcTkm96zIna5agKm5WKgsKtJ402qczpBNQ/w4Izmffy6LtmJ?=
 =?us-ascii?Q?5tgwwbytGwrkoKsAchpfusLvGPELHNC6PEsHF0Ztz5hw46ejNbzMd83xKbwg?=
 =?us-ascii?Q?XTCobZZiG3+pzjqF8SVtApio/g363S36GXuc5HtWAHMSOiLrbbOYvbnk88n3?=
 =?us-ascii?Q?JC5dRJL6JQPtTKbPO3u1E898eXv7BMARqOIuNlqOgHumv7xLBfA4ISkwxU7/?=
 =?us-ascii?Q?NpP78gG8F3bDn90lvy4vMdxKlNYBRPxYUwbXg334fSxcPYVWHh6tvVU+ucX3?=
 =?us-ascii?Q?JiP/e2oGTRaUPingdP5AqmKvjteStWLWA6ab2/m4ZEIBQ+k/OOGE86zDaLeN?=
 =?us-ascii?Q?G9+54petaoJZxlM5O001BbkW9czpj27N0jyD2griwTBUtrbwsegiQqOTLtud?=
 =?us-ascii?Q?HU40uR5jyfebfRyLd1QInJnBN8/OdvXrvQMN7s+O+4o5xdhzMBF35Z3vdFXQ?=
 =?us-ascii?Q?GB7UveN1K/1h4xMWwV+HuO5ljKuHqsEllMb/DrGAJm/TGyIKzTTSKhEYI8ww?=
 =?us-ascii?Q?Kna/0xMnKNlxdzfHTSCNFxREAAJWArtffgOk8rdsnvysVT3pWQIz2k8sFr/6?=
 =?us-ascii?Q?WImkzOwE4ID7rLRrCezafPjb/LxalzZkmdFWdKpoTNUccHjq68I0RnhIdGGd?=
 =?us-ascii?Q?ofYIlAOgTWVxBz4LVigDNJR3Z+mhnIWtWx4FYahTd6ZNuwFb5XoieZe7dpTE?=
 =?us-ascii?Q?Ou9o7pP4X5FbY9zNOzIUTJa7rcNX+0aWz4afdao1BEpKuVlbH7lzA9fv+nRS?=
 =?us-ascii?Q?gc9aGqGr50uL588TvV3olX3ANhx+OBnvsY8blMaHNQo99WYIx1F/OcCLWkW8?=
 =?us-ascii?Q?0DiiobDOxtZhPA3WxjBIUaNOKDD1MDwOoo4KhLLC5F0eDfVx4WUG3amyLLDf?=
 =?us-ascii?Q?ZCE7CPm7cNtUHbs4123MALCc+ire1gAR12bt+dyMaK+nfyHYMfTn8FJC/Oe0?=
 =?us-ascii?Q?HauyfaEU/lelsGJ+xwDga38WZCP1M82PiQXa6NejqOYlKUpw18pOrH2PnOzU?=
 =?us-ascii?Q?ASalYxQwPGhKrvtoFNtcts1IAq0sfUjI9QeUrHCUIhAapz9rym1qqno++ZaW?=
 =?us-ascii?Q?OSOmiO6YAkNBBRJoQlFCRf0uCAoK7jhSvEnSqilO4GMByapKE1oQ7wy4WJDP?=
 =?us-ascii?Q?QoPnEXOF/5yoTOKHMDDJIyIAB4VVQrbKQj9n8lvLTKuImkLRvOZZKbX/hSo8?=
 =?us-ascii?Q?RNKQRLhfU0SEAyShsrjgna5k4FJ09E9KOjo9VLUYti0YImt0uRNCAeVwE436?=
 =?us-ascii?Q?dLkpsFnPIvnX0jxYFl7E4vGuiejT/8Q=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a352580f-f2d3-49e8-17ee-08deb7fdc5fc
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:29:31.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qchmyg3Ih5zJgzMqy8hzQ7SQXtEuRfVK/+HtIZUpGJmlwkVqceKQDrKmRbBMv4pT5Nd3xQujrgLPRdlYzM/zSsKdRpFxo04WliWgK/hhK2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1992
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 12:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237545

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-35386.
https://nvd.nist.gov/vuln/detail/CVE-2026-35386

Upstream fix:
  https://github.com/openssh/openssh-portable/commit/76685c9b09a66435cd2ad8=
373246adf1c53976d3

Tested with openssh ptest suite via do_testimage on core-image-minimal.

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../openssh/openssh/CVE-2026-35386-1.patch    | 65 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-3538=
6-1.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.pat=
ch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.patch
new file mode 100644
index 0000000000..a4b81bf407
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35386-1.patch
@@ -0,0 +1,65 @@
+From 96968048d6bb9a3183882b7af0630895bd4e7059 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:50:55 +0000
+Subject: [PATCH] upstream: move username validity check for usernames
+ specified on
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+the commandline to earlier in main(), specifically before some contexts wh=
ere
+a username with shell characters might be expanded by a %u directive in
+ssh_config.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+We continue to recommend against using untrusted input on
+the SSH commandline. Mitigations like this are not 100%
+guarantees of safety because we can't control every
+combination of user shell and configuration where they are
+used.
+
+Reported by Florian Kohnh=C3=A4user
+
+OpenBSD-Commit-ID: 25ef72223f5ccf1c38d307ae77c23c03f59acc55
+
+Backport notes: The upstream commit uses renamed functions
+(ssh_valid_hostname, ssh_valid_ruser) that don't exist in 9.6p1.
+Adapted to use the existing function names (valid_hostname, valid_ruser).
+
+CVE: CVE-2026-35386
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/com=
mit/76685c9b09a66435cd2ad8373246adf1c53976d3]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ ssh.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index 9c49f98a8..951da74fa 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh.c,v 1.599 2023/12/18 14:47:44 djm Exp $ */
++/* $OpenBSD: ssh.c,v 1.630 2026/04/02 07:50:55 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -1160,10 +1160,14 @@ main(int ac, char **av)
+ 	if (!host)
+ 		usage();
+=20
+-	if (!valid_hostname(host))
+-		fatal("hostname contains invalid characters");
++	/*
++	 * Validate commandline-specified values that end up in %tokens
++	 * before they are used in config parsing.
++	 */
+ 	if (options.user !=3D NULL && !valid_ruser(options.user))
+ 		fatal("remote username contains invalid characters");
++	if (!valid_hostname(host))
++		fatal("hostname contains invalid characters");
+ 	options.host_arg =3D xstrdup(host);
+=20
+ 	/* Initialize the command to execute on remote host. */
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb
index 1cdd888ccb..98176a971b 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984.patch \
+		   file://CVE-2026-35386-1.patch \
            "
 SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd5362d=
e09385aa7a777c"
=20
--=20
2.34.1


