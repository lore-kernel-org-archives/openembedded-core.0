Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DE0CF6ABC
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:47:20 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3233.1767865636144465090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 01:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gIHgEmLd;
 spf=pass (domain: est.tech, ip: 52.101.83.5, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueNMn5pe9ezmNgIEmRKp0yaJA/m5xSiHe2MITYRabU+8BxODczR2DIAUecZmULFxtiRn8sYelNLKu33AR4m10EnBbu/Y6j5lNPrS7YWATdWcyCwX4IlRfZBf8k3Ju4L17QebHnEN/AYplbzfzYmbR8L1XJrALfefvswKAnyD2siuUTaheoK/hNIpTjjPRVK9BWExftd5l5+2EuqWXOjk7SFcrHLNPYFNFZTgZ3UjxWtkoK0l03edNASkAWgU+UU/IRk92+fLPeU3j+uaRoeUkP2tV89tmrPfw1lteDsXL3pvxhEBk1xnwjfGh5w9rLdKCnAYQeJtjeZbCKCsKNqz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFl5/Jx4S1HbPgFaPF/chERhJQvER/kIdzAokJQSmAc=;
 b=ADt+zMl8jJMG1x+4CQikxq5fKuER2F+ZYC19UeHX84eXFuomungZe4hmjbtEg+jR8AUWNS9DVaOYYk0Kn6FNtmWPfXQdfBqncPSF72blsiQx3WJYdrCTzQOPUdGl2kAdRe3hR9YYFNcGg5i/G0O6OXm4b09of1SsWYPxkm3cg/2CEK9U6PT+GO8K4srMXlcX1P8T+YD+jn9N2tWdlYxso5sYEqTRqvpE4r0UH7yxOBd+ehhg/CdWyWUEYwVuRHA/0Qu9LrWaIC5SwijPxKOlnhQ/nCrrYg9qmob8Wdp83wNX7mS8IqIV9nWbKVLt1Fkjh5sa/BYe1W1kFqKLaMtNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFl5/Jx4S1HbPgFaPF/chERhJQvER/kIdzAokJQSmAc=;
 b=gIHgEmLdjILAJMxifed57eU6ZsBJZQLbSLJOvE8mP5i7HQo4vBUVIZLw3ijIJsASO3k/1pLMzTS+ElWusvwFA1zmy39sy7VBEd3qY19D2ddvmmkD9HLqa+SYnrZS1Lb32lgopnyKvMXO8SVGewDWrxfS4/ypoVU1kA/bNVYXDPT4xCkz5eOk10hCfyfZr8BTDl24oTmVbT33R69abHy7/Vse8f8QlRvHM15Y/zSh4qyRl82LwJ6asLibcFAn6xCvTcmzrydkXUKTStOtsKAAqku0RH7T0LseMHw5FpNHBxLHIUPeVMgVxZwxllc10TKYKHj8urKEGirc0z/1s0wJIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GVXP189MB3401.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 09:46:57 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 09:46:57 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
CC: Amaury Couderc <amaury.couderc@est.tech>
Subject: [PATCH] grub: fix CVE-2025-54771
Date: Thu,  8 Jan 2026 10:43:28 +0100
Message-ID: <20260108094644.12175-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GVXP189MB3401:EE_
X-MS-Office365-Filtering-Correlation-Id: a03ae9e3-b56b-4588-0fee-08de4e9adcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1OPCSWgYuPG38MMCmX23AcnxRjQD2w1MivBQECLW1iStU9R4dvtHJ2kSM3lL?=
 =?us-ascii?Q?Ea/mp5SvTzog2FSpYcbs9LLhRbDKvvsLVuK+Y6E/QmLECwoHMQ2RHf04e59O?=
 =?us-ascii?Q?eynAtqXYyKlVV1LaT2NEtEdfxhcQmDVqg3DcvX6SG2hb1H7XYwq5TTbigfDz?=
 =?us-ascii?Q?4+D8Q5xqZOGg1ecqTrFm/JsopPimE80fnKaDICx6PuNwnjTzghGg+xziv9Ol?=
 =?us-ascii?Q?wvgssWtpmasyYqKRAIyE8tf3fCi0x3tK99AjCp6Bk9SMzENec32Oore4Okw1?=
 =?us-ascii?Q?AwiJC3R+iYVstRd+tGD0Q9gsZ1PmM16/1jZsDBOOPmslZ3HYYrhSwB710rmF?=
 =?us-ascii?Q?QzDRlKqrMf5an46p4CgHqEknD1AqCmYupvYKSjNjqCLTn5nmRdosJlPQ64Oh?=
 =?us-ascii?Q?al8NdkLLYNcu0Qd6ln27QHkh7rVi+WdVij+Hts70qYAWYahq4DBweqiEr/Vc?=
 =?us-ascii?Q?dMuCyUdiQmqYpHppkwFZr42FuEUnc4F5unj08wg5jULRMu475SS+RDFBtFGh?=
 =?us-ascii?Q?bIv1m4V2zWDvp82R+YVCYbV/u2+K6u1oHm2lQe7X8oS/gPjhU2aqh8WN7WO9?=
 =?us-ascii?Q?QQb1UnoCxW279yZFRTm8bJ3hbkPU6+tTQsVlrM/SmllbRmxVuGvDq6l29uZX?=
 =?us-ascii?Q?JEfmI4j+6EyIkZDnmel/b1wCZflFrCGogt7nvO+x7W4foqcmfHVoGblou7Z1?=
 =?us-ascii?Q?UVCLRFYpk5/fnkQcWS4DUwTFzDl2kQ/8owlQtnNImHITqc/a/atxhzsaDQDB?=
 =?us-ascii?Q?FUbbb9U+wTAJ0NgB0AXJZ6P0CEalEhhHQbZXocbMwQJiUGFr4a0Kf3NzXOlF?=
 =?us-ascii?Q?XfHqC+74eJINiCu/2yvADH8FzPmTb73vj+qaWuj9KzEKmrFFXPyzDZh0XNzu?=
 =?us-ascii?Q?4nQK4HFCyAsBN00qnBMOxaF/Q3MElxiN29SMgoYlY/tugLTT15HtXk55/2PD?=
 =?us-ascii?Q?mNeVlnU/zlolA/3AYyxWzzrF2t0uj2Ls2fBggTZT3KdbpXbAVgsPHnqxj+uW?=
 =?us-ascii?Q?vrlDeaiOtBME6CH/91Cv99io1a6PPw0N5Q7trG2AWUVy5apVWvHkiMT4uRnn?=
 =?us-ascii?Q?Y2maFJIZUbdwbpKtla478RLSghApOk9fMOAnDHj0etap1VoHRm/9KTOmIH4H?=
 =?us-ascii?Q?wSY5eXRd9I+MfadthNUtPXApZxkyhWSg366/u/psBtdm3a5/bBns8TSNU3b1?=
 =?us-ascii?Q?Jkdrw7J/oNXPL7Jj3u5ikYzGYrTiOIdQ00OjBmJX50c/HqUA6PJXxM29vLvU?=
 =?us-ascii?Q?vsWOFcUgAKXcYAvRUYMQbIrzgmQuXkN5srIXLoPmZw6ozvwgV7Qld67d59Uc?=
 =?us-ascii?Q?upcFW3mzg3AS5596NSVMcvcQvnh1ikQb9uwJ7ihMCjhqtRRJbx6XCpD31F7g?=
 =?us-ascii?Q?JrazsGz79G6BdXIw6S5i9TaGNZxoNlic7RpO7jSr3Q3QrghQD6NHvqRKhw4H?=
 =?us-ascii?Q?ne3wQbrUw2KrU/7XKvKkD4LHv2Q1IGe0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zKvTKlxC0oqXD20rls9elKMR4/MkCceaUsNlA6mF0BgFkIsOaCAL9goPcvzS?=
 =?us-ascii?Q?K4OgFszZ4Qi5aX4te78eWbf/82xt3SXlYlSTIvWGEfXHonUXytRtwbfrYZSa?=
 =?us-ascii?Q?DRxkFN26LQPIXRQe8P8AVeVJJLnnkxWzApS9GgmqNwv4SyM5WZawrDQr0eYZ?=
 =?us-ascii?Q?/CQwE6N3EUtfAE7aUNjvpOTqH1pHKZXvpD1VAgphjc5J6WqIpPbfLROqXBB3?=
 =?us-ascii?Q?+OYyFYanclXHtqVvnlpA2Onzq4ahKimMB7MifWoR1kt/iA9d2aExZqb7qp4Y?=
 =?us-ascii?Q?9AQXpXDKfjEeCdKy2MxYEwmWFpPOniSu4/CuZThoR3fMMPcuJq4dOXsa8gk+?=
 =?us-ascii?Q?0XYvOOCC85c9h/1VLEC6dpFmZebZcK2oce9eDvjZyGVYk4x1o97tfxnPAzCY?=
 =?us-ascii?Q?9llxKJp1OE4vqPJPEbTqciD7NqaD4Eu6NnLlwbjVK1BGpmob6ZW12lwQ8KVy?=
 =?us-ascii?Q?AFIA6aCIlqVART/glIHshiwzTWIH6m7F0f6/CK7oEMOgvesTg26PjBlHYhEl?=
 =?us-ascii?Q?3XhsN/9Y4iA99XHWI4v4mEtszPNtsJkd42Q4evWozissRF+5O7VQUOfxH23E?=
 =?us-ascii?Q?kj3xi2WaQUEY10jrwtFs1JX3WiTcbb9ghIFbU8y5dqmkWT+RWVbutKBStZbx?=
 =?us-ascii?Q?rBADJKuleyZzpqimEcgnFAtAouKMRid7MTHHmbQGCojW8UQ/TVr6D1p1+l0I?=
 =?us-ascii?Q?AZwdkhsTMMG4I8tVhRp7tfe0Usdwcz+r/q4iEnXi0H57rLDd/aBXtw3HWJ+o?=
 =?us-ascii?Q?VVTsU0LU59fG/STZqkdfAKn65hY8xiJ4512sFntnsEeLOnTDymobDDYEnq0f?=
 =?us-ascii?Q?PeJDVfjXJab/vf2EzhU868ZR4PobdhRLgMUfBfpqNQ8wndiyBV7B+fkMrXsH?=
 =?us-ascii?Q?Dw2i8s3BFVcWqqrb7oXjsxY2seH16DpSqNcyJcwTVm0o0zYK1SkynmOXpEsN?=
 =?us-ascii?Q?pauO0qB2AscuvEV9aO1m/XJCHd1rkHxv/pHtoTTUYuI4g+V3h/OCl9IL4i2M?=
 =?us-ascii?Q?jyNYdxqw+SUIQSmxZMPzsRoB2qDkQPlpwOgTaZEUzb1miiVEsHZjM4S1/+99?=
 =?us-ascii?Q?tgylyuEv9IAoHfDAqkAo5dS6i/wTf2ulmxjTX7pM1V56JG7Y/J3c+wiPL0L7?=
 =?us-ascii?Q?bBtDZPsDIpzQh0/+K6GfsBDtQMdqVN5yQb/lmhuwNfwsyrbgsFO3qObrYGGc?=
 =?us-ascii?Q?y5iyQ9RVq+1pm3qn3Ifz68ya1pL50r01IaiAKIBcsZhfMPdNMnhK986aYsZI?=
 =?us-ascii?Q?wk6xJUiCJO6+AbqzWGUSxlOeKesEYABiD5VTFnx29m2EUsC87odW6XU3QCzo?=
 =?us-ascii?Q?odlJmbsNCSsPDtgEDABCA670u8LfpPgqnU6mp9q0KX/mHVu/6bCXPI2qNbvR?=
 =?us-ascii?Q?DcTZkinX9Wgeex2MBg7+HA2T6EByAMgyHvHpaMAJpY2ehuDTbCSCWxfwgDhL?=
 =?us-ascii?Q?CplvaQh5r4dOUr2Szt+jGzesV+oLggVCrAJx4/RYU60OVqTk7CCCJoub/rM7?=
 =?us-ascii?Q?Ui0rMOFpXU/3aYjOey+Jw8tj/aHLiDFbvHrM3Y+Op6CyZYmowylYuVu76Jwy?=
 =?us-ascii?Q?HOjZXHgz2X45v5C9q8a2lhKog3MTF0e4jfDv/05TkuSDnGRmW/HNf0SBnWmi?=
 =?us-ascii?Q?pq+LP8sKYyNtl9mgxYMWPPOpnv2hjYT5uvd6079ttyGQnQLgpghp5dQe51Ik?=
 =?us-ascii?Q?1h1aGRJE1jZlzXelmQt6Mt/BRGnQT2tM7JZ4Si/nRtGKd+J/Dof7xpOeDCN1?=
 =?us-ascii?Q?P9bjhezjmA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a03ae9e3-b56b-4588-0fee-08de4e9adcfa
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 09:46:57.3420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ7fZP4GQWuUKzALvWllcP8WeneTwZgVqzJz17jozpeai2JBIk80wcWm9LZgfDhJA6DRCuC3X3i2hYndwLTaFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3401
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229050

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../grub/files/CVE-2025-54771.patch           | 65 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54771.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54771.patch b/meta/recipe=
s-bsp/grub/files/CVE-2025-54771.patch
new file mode 100644
index 0000000000..02beca45ad
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-54771.patch
@@ -0,0 +1,65 @@
+From d1553f532f6796578dc10809e3abc751c4e2d90f Mon Sep 17 00:00:00 2001
+From: Thomas Frauendorfer | Miray Software <tf@miray.de>
+Date: Wed, 7 Jan 2026 11:04:38 +0100
+Subject: [PATCH] kern/file: Call grub_dl_unref() after fs->fs_close()
+
+With commit 16f196874 (kern/file: Implement filesystem reference
+counting) files hold a reference to their file systems.
+
+When closing a file in grub_file_close() we should not expect
+file->fs to stay valid after calling grub_dl_unref() on file->fs->mod.
+So, grub_dl_unref() should be called after file->fs->fs_close().
+
+Fixes: CVE-2025-54771
+Fixes: 16f196874 (kern/file: Implement filesystem reference counting)
+
+CVE-2025-54771
+
+Upstream-Status: Backport
+[https://www.openwall.com/lists/oss-security/2025/11/18/]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ grub-core/kern/file.c | 3 +++
+ include/grub/fs.h     | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/grub-core/kern/file.c b/grub-core/kern/file.c
+index 750177248..81600527d 100644
+--- a/grub-core/kern/file.c
++++ b/grub-core/kern/file.c
+@@ -197,6 +197,9 @@ grub_file_close (grub_file_t file)
+   if (file->fs->fs_close)
+     (file->fs->fs_close) (file);
+=20
++  if (file->fs->mod)
++    grub_dl_unref (file->fs->mod);
++
+   if (file->device)
+     grub_device_close (file->device);
+   grub_free (file->name);
+diff --git a/include/grub/fs.h b/include/grub/fs.h
+index 026bc3bb8..d37f38e91 100644
+--- a/include/grub/fs.h
++++ b/include/grub/fs.h
+@@ -23,6 +23,7 @@
+ #include <grub/device.h>
+ #include <grub/symbol.h>
+ #include <grub/types.h>
++#include <grub/dl.h>
+=20
+ #include <grub/list.h>
+ /* For embedding types.  */
+@@ -54,6 +55,9 @@ struct grub_fs
+   struct grub_fs *next;
+   struct grub_fs **prev;
+=20
++  /* My module */
++  grub_dl_t mod;
++
+   /* My name.  */
+   const char *name;
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc
index 3160708113..876536e42b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -42,6 +42,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-61661.patch \
            file://CVE-2025-61662.patch \
            file://CVE-2025-61663_61664.patch \
+           file://CVE-2025-54771.patch \
 "
=20
 SRC_URI[sha256sum] =3D "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2=
b6f56154cb9c91"
--=20
2.52.0


