Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59027C982FB
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:07:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7001.1790024810388684263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pX2Hs7A8;
 spf=pass (domain: est.tech, ip: 52.101.72.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4MZym25L4hX3jX0o3YCEwRETe+YGeHN9RBBvn4nfmWLKe91bslr3bfJCE2puoAnmIFDmkFxE6oNzlEOXKLkzvmCkEPBrShVlNN1HH1hC+dGf6tvkZthrJe8roi9OSGO+KA+rEday53fyhTX5syj/JqIs0o2C53nsJokc9Ljo6xOfwnBdJui8IHEzTRV1+2gVCj0dswwKo2rtkTQvDv+sTsCvuSUTd/dcVT7Ou5BddszehLCNp9x2S7t0TMpFEtMgWM9OB1lSlfOpV0dW+yZOnZEs2WVV37ZAjrZEpVm+kY78UIIOFspHxEuiVXzPHVpYERXQpenjZ8tAJ+DgAaPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TkULppfy1udyQnwBR0+jVLA3e+9zShZXYRlTvnxP4I=;
 b=Liu81GRDrN8nwrhzYHBK47fH5YB2JHLYydZbIavsVtRRGjVVvEkqD/apdkWyftVtFVY+jfoljZZs/1VH4zilESfo4qGNzI++2xfylaNhk3k8wA6zCWNEwsIGx7wShSxkiGHGtlPEToq6TqjhRghtI12Bc+BuoJPorEm95uSzNAjw8uYmWBNYYpDuhaR+IHjWqiTrsmjdXc92Wyj5rPsUXp49rG+OC1enxp2NQI9AVYX25RAoirtu3u764zoa+Tsd87a3jGtd0pUAIwy/5+8jVtPMN6OSkl0UOpATtediMtdtGdlgO+XRIWl3g4LqOsdMPjL5JiV5HQ01neoIBp7dJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TkULppfy1udyQnwBR0+jVLA3e+9zShZXYRlTvnxP4I=;
 b=pX2Hs7A8/YVlwn5ErO0keeC9TViy0ut4Fb9Y83oKJQb+OUrpZChbGhYMI/bztkWUZ9/DVKZ4Y27qi1DrUBMnkVWjecDcdIoXbz1YxS1hzTh6ypYedP4Fkqj2ch1JDeZZptLPpkeEOUcT+oE603Ojdsf0nF+vIn1o8GJASNpnKHK3H1PaO/hDdyQVLvuMUuXoFGANFBN4nsp8SXXieSf5VybVYfYiUPVK2PH3sTz0tYeDOL+I8A4Znq0CHUMCDkjENQusyLiBsptedyZ0Hb4BIxnS5+M6GxbgaDHSNY1TV5CoRAh+pKeSCfkXA3U4LzzIV+hDaziPQl5rtibiw5xszA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3546.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 21:06:50 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 21:06:50 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] nfs-utils: upgrade 2.9.2 -> 3.1.1
Date: Mon, 21 Sep 2026 23:06:44 +0200
Message-ID: <20260921210644.85026-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921210644.85026-1-jaipaul.cheernam@est.tech>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
 <20260921210644.85026-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0638.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3546:EE_
X-MS-Office365-Filtering-Correlation-Id: 896005b0-71ed-46ab-f731-08df18244105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	msKV7GEbVFcKrjSYxq6jCKAlz/x8OOJ1FHJs+H6jpE6WBFkkm9SnbvgstPRheyBwcOukfhvxGvm5Lf1FK6wEoHUgH5Cdi5Ipj/SZNX4bSzUElYkl0oQGuOp1VPT1hUPyVcatrPdHpNS5V7zxyJVJ7roZOK/2KCtB7NxVJS/5PHvInAg90984ygFHFnidTlenwdWuJfvqFOGYchFhya86bxOUSTvukfDfGVtU1X1dD+nxFHDVpBQ29hECu+8pJG3LtAbvrf8+Cbil1GxJI0DMvtAS8IiBIKAOaxSUfy/n73D4iFkzsDW19+jJeMkC2D/ZEKg13uexQdnIcsNcPTlU4slaOvw12mQ4J/puz2B5DO1WI98lWJdRJ+VD4Avu2mo+TVVjwS+6xl7ud8jBGpcC3LPuMfKJ/KEtJcPB2lVwWIk7D3qd3P6q+N2i16MZr+qWnHpYZaIxP8NlHAykKk7rLnSTB7Ul3598b4bEvGjuAg+eZ96NmZCmNqG+8kVhc7kj2DQQ+I9cWXkogtNQdygXqZ/XSiTcDVRx6l/5D/8CEheRK5Ea6wIIKN3q1ve43CFrzk6LguA5rxcyXYyJ2kIlJ4fCjuAfbqj3d6M5D8Fftjlk+3XYyQWmlmEGWcXxhVeu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HW2oKZo1Txyea/yG9vfVDg5ft11QxenCaAeFE70HpASJjbWzAXI1EbdJdJ8b?=
 =?us-ascii?Q?EkP3uDL6SkmEERcPdB+YLw4DF9l6lkW+VWDtTIN0aMjnLbEphaYRqg8m6uYu?=
 =?us-ascii?Q?0geTC1I0xH+3Rbgae23NOeo7TsxO+2gkcHagBuoSBlaTuSfzMQh7+s5AIe1k?=
 =?us-ascii?Q?uw7U/EMHDYBwsyVbwvrPKJkgmFstuJ9l259u6XOBiwvLTFNUG9uK27kGUKzS?=
 =?us-ascii?Q?AafDPaH9gXGzkuVcjf8EOZuimshA9BUoqU580iCf3/9iR80IA8dzhM9M4Ojh?=
 =?us-ascii?Q?7FP8rv8NtL+O6uij5xIoLJJbZSenL/AZdZSly5J80aoZQVjjNKp0LIfJ8aWe?=
 =?us-ascii?Q?pjTv6ZLVFbBfnJpfjDwgRfM8b+bxdn8AgMU2xyjv+d6kBBNHbyJGxqmTQnsN?=
 =?us-ascii?Q?J1g6opNM1Kw9IKMUeUYa/nwuzId0YUoZvQWTFhqIboq2ykSJyx7oRWBh6grA?=
 =?us-ascii?Q?eI4uBmsErf29Qgqi5/rs4L10G1S/3XlgB2tSY0vFIpGR960+C1x+8mkSy0jr?=
 =?us-ascii?Q?DpE4JFspYjUJu/Q4guziSIZfZW522kaoHn0sTD8QgLEM/am/0ECChZEGGfdD?=
 =?us-ascii?Q?cQieED9NQu7+s2AfHDrZlQMb6zyBa7dOWm0NK1eZ+PuL9AEv+NCTNLFvV3FZ?=
 =?us-ascii?Q?dAa4zDiKIdFEg83TFWsHtaf8aDjl143A/4vUubHyzDPCbpK4+PQIJrOV3PiT?=
 =?us-ascii?Q?fNg1+UOqn8T9BZoOr/11pMKemkgV4Am/DzwznGxqVn4kqo2J0HV4YHR505nH?=
 =?us-ascii?Q?xe6PqDPXjqFsoqpTMTc4zrU2FVtHQsfJpmna7mdBTIRUzKhnTOSrpoZmgGg2?=
 =?us-ascii?Q?leCfTvg2QZBCUgNLy0FD3B/T5YP2ZYFJ0rPXmBOGVQCr9GtHqxOtFCcfdH08?=
 =?us-ascii?Q?O62uV3nnAg9iip/4ipqYccNtSCNEvrh56B9FgWMFd+UvxJ6+uqXXRUWLoh0E?=
 =?us-ascii?Q?FM4t9uQmLpKxKP8IfR/nRCoWRPg9u/MHd5IoPALC7qXzTUS6cJ3iavSkjDTW?=
 =?us-ascii?Q?B/r8FtHDWN0WwPQN+eOZDRZnR5Eu23v4wpCcUSj9sXXtCSm6l7ctuW56hLHd?=
 =?us-ascii?Q?A3azwOpLzUfVyM6EEZA13hpJhTqFUBnTqvI8NX8n63huwlsqseV/BUfdkQPO?=
 =?us-ascii?Q?gtuh7Qw+Gcm7gcPoILd2mBgU2HOKbtX5O5tTuV2toaIX+fpX3LL69tpQBmoa?=
 =?us-ascii?Q?4hj/Ia2LOlsHulK+kIQEIeMCnTwwaXE6XxrEiklAOSpEtxQWVYLoSkgvEqee?=
 =?us-ascii?Q?5prIwDB1ynjOhyQdXYUIPQ9FywiuMMV8znrnZvmRTMWc962gxlxVGqNGFyj3?=
 =?us-ascii?Q?acDRa6ZI3AfnA2+mQkTJjZ2XFQCUSlG0Bz1LAZckbL7khSI5+HruAwlKumrP?=
 =?us-ascii?Q?vvunt2mc130B2Rz+pw+wTDnJvPVDh68FNlTHkYMc7l9dNN/ZNCmidRyyMoRB?=
 =?us-ascii?Q?CwOPiEYGktKysfFdMWzkVJhBmBgR/VtlqLsJNWveSInpENv9J4H+ekRHjOvN?=
 =?us-ascii?Q?1268Wi0XqM+7UAvuDXPNfSpYjMs5817N2MPI6czW7i/SV3s06H4kYq11MNtM?=
 =?us-ascii?Q?1nyIJK1LwL4+/3Tssg0BAOgTHbZZtw/SHG2eboGnS9v5dm7FimJi2iDFCAjC?=
 =?us-ascii?Q?DLZlPmTFgLJW40kjN3oJrzsS03Up31xIZXcfj0ECzBPG6NdFuYHJOgPeWqkK?=
 =?us-ascii?Q?FiIM0bk+t8x4qIZ9trXPXSPRoKmsFAMmH9H8hA11tW+sQtecKEbkOkNEjgRk?=
 =?us-ascii?Q?WWc6I12+LA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 896005b0-71ed-46ab-f731-08df18244105
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 21:06:49.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yCV4GQ4fhdMNzb0T+Lv8yELHxbUltmFXAn3krF9WqS6w6VjbaVViz5GKlTO3vfHAs2mP/wNBue/hoSj3QPrQ9gTf/nkEG2mpZPBnvxvCl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3546
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246361

ChangeLog: https://www.kernel.org/pub/linux/utils/nfs-utils/3.1.1/3.1.1-Cha=
ngelog

Drop two local patches now merged upstream:
 - 0001-getport-fix-missing-stddef.h-inclusion.patch
 - 0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
   (upstream now gates HAVE_NFSD_NETLINK on --enable-nfsdctl)

Refresh the remaining local patches (0004, 0005) against the new source.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes in v2:
 - No change since v1.

 ...tport-fix-missing-stddef.h-inclusion.patch | 27 -----------
 .../0004-Use-nogroup-for-nobody-group.patch   |  4 +-
 .../0005-find-OE-provided-Kerberos.patch      |  2 +-
 ...e-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch | 47 -------------------
 ...{nfs-utils_2.9.2.bb =3D> nfs-utils_3.1.1.bb} |  4 +-
 5 files changed, 4 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getp=
ort-fix-missing-stddef.h-inclusion.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-conf=
igure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.9.2.bb =3D> nfs-ut=
ils_3.1.1.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getport-fix=
-missing-stddef.h-inclusion.patch b/meta/recipes-connectivity/nfs-utils/nfs=
-utils/0001-getport-fix-missing-stddef.h-inclusion.patch
deleted file mode 100644
index 1683e9692b5..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getport-fix-missin=
g-stddef.h-inclusion.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 6 Aug 2026 10:55:00 +0000
-Subject: [PATCH] getport: fix missing stddef.h inclusion
-
-getport.c uses offsetof() but does not include <stddef.h>. On glibc
-this works because offsetof is pulled in transitively, but on musl it
-is not available without the explicit include, causing:
-
-  getport.c:459:41: error: implicit declaration of function 'offsetof'
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/202608061120=
23.25090-1-jaipaul.cheernam@est.tech/]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- support/nfs/getport.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/nfs/getport.c b/support/nfs/getport.c
---- a/support/nfs/getport.c
-+++ b/support/nfs/getport.c
-@@ -27,6 +27,7 @@
- #include <config.h>
- #endif
-=20
-+#include <stddef.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #include <unistd.h>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup=
-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/000=
4-Use-nogroup-for-nobody-group.patch
index 7e63cb62826..1bc3fc832be 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-no=
body-group.patch
@@ -1,4 +1,4 @@
-From 5f4739475f3c01145174734ed8a3b31b3da99b77 Mon Sep 17 00:00:00 2001
+From f8407c33b26641c08ad76422ba2ff78214364b19 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
@@ -24,7 +24,7 @@ index 2a2f79a..e6f3724 100644
  [Translation]
 =20
 diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index 5231f56..e1aa8a5 100644
+index c41ae1f..7339a88 100644
 --- a/utils/idmapd/idmapd.c
 +++ b/utils/idmapd/idmapd.c
 @@ -89,7 +89,7 @@
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-pro=
vided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-f=
ind-OE-provided-Kerberos.patch
index bb152c2754b..e88608bd376 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-K=
erberos.patch
@@ -1,4 +1,4 @@
-From a1759d9079a436096be5ce44622a3a5a85ec9faa Mon Sep 17 00:00:00 2001
+From 43a992e7bb491fd6e7e50861c9eaf0c549e98293 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.a=
c-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch b/meta/recipes-connectivity=
/nfs-utils/nfs-utils/0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfs=
dct.patch
deleted file mode 100644
index d15ea1ac5dd..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-configure.ac-gate-=
HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Wed, 5 Aug 2026 06:55:00 +0000
-Subject: [PATCH] configure.ac: gate HAVE_NFSD_NETLINK on --enable-nfsdctl
-
-HAVE_NFSD_NETLINK is currently defined unconditionally, but the
-implementation of nfsd_nl_cmd_str() in support/nfs/nfsdnl.c is only
-compiled into libnfs when CONFIG_NFSDCTL is true (--enable-nfsdctl).
-
-This causes a link failure when building with --disable-nfsdctl:
-
-  ld: exportfs-exportfs.o: in function `unexportfs_parsed':
-  exportfs.c:491: undefined reference to `nfsd_nl_cmd_str'
-
-The callers (exportfs.c) guard their usage with #ifdef HAVE_NFSD_NETLINK,
-and nfsdnl.h provides a static inline stub returning -ENOSYS when the
-macro is not defined.  So the correct fix is to only define
-HAVE_NFSD_NETLINK when --enable-nfsdctl is in effect, keeping netlink
-support as an opt-in feature consistent with the CONFIG_NFSDCTL guard
-on nfsdnl.c.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/9fec9f1b-1c1=
0-4a20-8282-dfc9addb4ee8@est.tech/T/#u]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -256,8 +256,6 @@
- PKG_CHECK_MODULES(LIBNLGENL3, libnl-genl-3.0 >=3D 3.1)
-=20
- AC_CHECK_HEADERS(linux/nfsd_netlink.h)
--AC_DEFINE([HAVE_NFSD_NETLINK], 1,
--	  [Define to 1 if nfsd generic netlink support is available])
-=20
- # ensure the system netlink headers have the latest features
- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <linux/nfsd_netlink.h>]],
-@@ -279,6 +277,8 @@
- 	enable_nfsdctl=3D"yes")
- 	AM_CONDITIONAL(CONFIG_NFSDCTL, [test "$enable_nfsdctl" =3D "yes" ])
- 	if test "$enable_nfsdctl" =3D yes; then
-+		AC_DEFINE([HAVE_NFSD_NETLINK], 1,
-+			  [Define to 1 if nfsd generic netlink support is available])
- 		PKG_CHECK_MODULES(LIBREADLINE, readline)
- 	fi
-=20
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb b/meta/=
recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
index c2017a14ef3..89a69ca72c1 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_3.1.1.bb
@@ -23,11 +23,9 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/nfs-utils/$=
{PV}/nfs-utils-${PV}.tar.x
            file://nfscommon \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
-           file://0006-configure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdc=
t.patch \
-           file://0001-getport-fix-missing-stddef.h-inclusion.patch \
            "
=20
-SRC_URI[sha256sum] =3D "e1dd8a9c95af15492065942cc3b52b1339ffd586baa2280ed8=
6c9d3dc4097e8c"
+SRC_URI[sha256sum] =3D "7dbc05eb8b32828b322872b759a62cb3979cb4118f344dd861=
6813d1390e84e0"
=20
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nf=
sd module will
 # pull in the remainder of the dependencies.

