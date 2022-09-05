Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5BBECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 13:06:43 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.48])
 by mx.groups.io with SMTP id smtpd.web12.24576.1662383191255423790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 06:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=jL6f7zek;
 spf=pass (domain: kpit.com, ip: 40.107.222.48,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TszW2Zt2iFS3wu2aYUyVBfN8mIMfDI5a9IZxpEXXqy+NWgsmCe0LdZTwI8GE+NcOoBUFxFYxDN8F05AljKcudXvxM7IsYRo/h1PnQidjAL/m661+DodBs/ZGSb74rxsZX079OnVHzDR7wRJz3wfM2UtVew+XzRCQVn4E7X9tSoXmJYfBaKP0suNbU2DDKQzarjT9lhOTwGJGSA9JkVbQHXASmP4+CC1ai0CYOf7IwZrDmXv40UDGRV05dZRD2/jyupDSg54T8XgQx3yJdaIqwTpGYG22Qm6tSAp8KJi54iWyDasYuVZFUm2R423ma7RhGIT1KJ/v9IatoRjrf3OkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYjvtHZqC+Sg2aSLjpAL7gAsaHlFPQjDvwQpJ4gatV8=;
 b=fXqWite5VBTut2xn1vZft1hTnUhBCAKKS3BLB3tp3Yyj+c/W4iEknNhSneGwfXptrGha8w+5hz+K4YTZRrYSgqhUPNrnj6RRx5yUP4YW7lsRfWoGhcBdzp6skeARLo1aqzGSiYhXTr9gl7nuATKtzWcXJ0MH3QsVXowY2PzGtTeV8oRlukv/CxykmDPZfDv37E9LUDvEl3LUujfXZSWBajOIT6HTgnD7d57hgoSIWTNRuX+FXqwqNlMmjyd720CLohjX2EeGe7c5kIug8YkWmRA5EmyG/JBuXp/m2Wo5esNn+yGQHodzpjtY5pyecLpeW/h68Jh/1JpV3Jm/o6YAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYjvtHZqC+Sg2aSLjpAL7gAsaHlFPQjDvwQpJ4gatV8=;
 b=jL6f7zekTz6FvpipvHpFqyFbPWWotq3qn0Ljz51Am/631zzihG1urq0eKo9gvk+MCEOl/dDchb/GFki7MB8mmEIYZjM0ha89oauZfPx8V73lI3V0z5FBUtpn+COhkm0/89Zt1UxlpuJKrudApw1SzuICno0s4Vx3bZA3oaGiqJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA0PR01MB8086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 13:06:26 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::60d3:f910:6940:626a]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::60d3:f910:6940:626a%5]) with mapi id 15.20.5588.017; Mon, 5 Sep 2022
 13:06:26 +0000
From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][dunfell][PATCH 2/2] libarchive: Fix CVE-2021-31566 issue
Date: Mon,  5 Sep 2022 18:36:08 +0530
Message-Id: <20220905130608.9341-2-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220905130608.9341-1-ranjitsinh.rathod@kpit.com>
References: <20220905130608.9341-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5588582-a1a9-4324-5650-08da8f3f70e2
X-MS-TrafficTypeDiagnostic: MA0PR01MB8086:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vgRiaxq39q35MDg4+kxh18YmSXZHCCYpCnD3QWiKkGvsm9tFTUHMz7/7+H4H0q7bn0C7j5zSMtMkTPsu5KZcIaRoAnqDosIqbQQ0sl6B3dRazyzLXnQ22BvNdAENh1qQ8og7P9Fpk7Zkp7JDjhuD5zJivpALxE6SOcy6/UD7OBnpXN+DdSyxTuV05WOlvBYzwvvKfqfzh7V/Kz64gKC2v2xiwqJeQK1gMXGO1syeb4lgfQgmoN9EuEZPjX75BR071MPC7rp1o2FuBksJ7+Q9aiBTJa8LEN1hqocSBXznj51LYP67QTPyNS8YGllQkqd7E3+WjtdDbqmXcip5mcn/f25J/wLJH05bTgasoS+5foPKXdNPzoOceISFCXXqKINdIe+J69cy/2Hr7jLR2Nzg2NtcFgHMspLpmMTxkDaGKcyhLShT6xaWOcmj8lZYASG2drmoe5WHuD0bb5RITduM4jkk7LUuJV9MUDIhsqGLCPVB4hCh+N6pvCZUmTsfeFgBo7A3pDa25UTOLjwvnRxOWDeXSiUbG9gE/FDgiVhQRcPap2eBv4zDj4kTbtVM1/v1ReloSCCNEtxbJi88OLMIJboExx6g7Td7utPc8KVJGYmemalNI1OBiGSpccEUr/Gd9TT7uBClWgdtGrrtDx57kH+k3utotiBHN1uC/bVpacDMYtK9yZq6ih5ti87+/CYyza5S5KUvJa++DjvJr6RkK81/5B9xhSny1hGs47rTmJvd0Gs9Jr+CUh0eQMsWuaIOTiwIeyHulSGL6YRQyhsNrYCfJLDTILiceKuPniHQAfIoiNzld4zYlxtjiVxK7I6VVIdCGYkKANonCfvUn4QZPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(186003)(1076003)(2616005)(26005)(52116002)(6666004)(6512007)(41300700001)(6506007)(4001150100001)(8676002)(66476007)(66556008)(66946007)(44832011)(5660300002)(2906002)(66574015)(8936002)(478600001)(966005)(6916009)(6486002)(38350700002)(83380400001)(38100700002)(316002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eDTtvfr8rc8NHms7/07mG2Zhc1kwNlfTEuxUAMth19jIoXIIc03FZhdpcDd7?=
 =?us-ascii?Q?DMJrIVvPvEP1DckeHbXQFTnRUP/QhNLj2HE8JyuJrV5OdrON68oQIpmtj2Af?=
 =?us-ascii?Q?oGW/qANKdE0H5F60g8KBlz9v0c1xc5VDrXD2NuOzFGf7lk558zfuTx1LGOh1?=
 =?us-ascii?Q?tppri1e923H45GctSLLFqVMxfmWLvDIjCNGgS5LyiO2hTThyMbqMZUUoNBE8?=
 =?us-ascii?Q?nOWjKWg5KFLKEfRmaUhE545xkLJR0qcdX0tLQLllDe/kOjGYKQNMWe43NoaH?=
 =?us-ascii?Q?0k0dL7flxygMC15GV225iQpttVvuOgBR5tHdakY8EJL2sZdAIQdXdjViHR+R?=
 =?us-ascii?Q?jMf4QePh1ZoXRUJLe5sm8RAHWlt8vIsJrF+jAL6d1RVZoRjGta44M/KgnGpG?=
 =?us-ascii?Q?L3tAvOej//iAryLbqNfqyd0GEb+TmQL7slhKpwd3WCf9/DOgkcyjj2/0sHiM?=
 =?us-ascii?Q?t79Zk3cERTkoIcqA+u4ruIiZjVdkLR1vF9MjaysDT1aaTVEad1t2pPBd5sSG?=
 =?us-ascii?Q?5ySAZlO3dSUV57RRiVYoTt0CW6IFcTdlOZtcR3DxIgBLT/iTSaHcAy3KawjW?=
 =?us-ascii?Q?DJtYFn+RKBLqW5JoGL2uaeQL6mcVj9dPPDk91zDW5skuQiZno3z53yrkbcyl?=
 =?us-ascii?Q?vW4R1XxgERN2Mkn3nqR3SoKNcjNF/JiMYvB3UZ+dsvKSTs6UTn8iNK0g7Pw1?=
 =?us-ascii?Q?AHTH5dJg7M0u6E5nO3w5K8c25dvcR4sbXW6+oDn6AXJa4T0shll+KfuLiW0b?=
 =?us-ascii?Q?6DneqpraULx2F2Ok2z6YGHvpuzb0ycpvFe5ovUBtvipQD2ldLO9DcO9zgnJN?=
 =?us-ascii?Q?MXtfGE3j7R49rPz8+VFTzTFtIylhVoZzZ9vRkvDa7/a+p7V205teYpfaX381?=
 =?us-ascii?Q?U63B36TlitGHqs/sY0+KeKM/FQcHBWz3CE36ySfNBWfXbIS0q9mPlMNdQMhc?=
 =?us-ascii?Q?VzjFEnIsv3tfvQMqv1ZBZo2bRsQv52UQztFRAdct+Aixrq5arBgMrXg9k7kl?=
 =?us-ascii?Q?gUri28C2yalj6DHHwkF/FXzp0ywSfH9sehh1U76YQcvUFIOat0sJ5xoPqGog?=
 =?us-ascii?Q?D3Y5FsRt+0saLSkg3f5TBv+lgjNaL8EE6zig7aAosC1mSVhlHNbYQOlSssYx?=
 =?us-ascii?Q?2wXBXw1LZNBvG01CMY1XD6o97vegQ7nA5PxKVDd8f4vumXe0ceWA4TSDm2zl?=
 =?us-ascii?Q?fMnHPT5EciuoJzMLc+Pzuam9WMKZS7rWwuCoQF69Mru+V6fnppBKLJrGOO+a?=
 =?us-ascii?Q?Cq+8D5o15d6ukS9JF3fw4xd82JnQ0DIo9R+sswIXvVie9oFXZLPw6RyKaSWn?=
 =?us-ascii?Q?8+OIhBMV42QFVs7Vy/H6THixye37jiGcaBOzYEKL6E12paF1zAR9HSp1i4t1?=
 =?us-ascii?Q?JLVOmnK05OeQqom02XpkvK30XvfkEdYHoASDzGMe92Hd3NOmi5PWuYNEaQwi?=
 =?us-ascii?Q?RnMhrMWFKwMRtIOE0sZAyqgrUnfzjxn6xkbj1Eu1xEtjFEffQFY+8qbjOFL6?=
 =?us-ascii?Q?dQ2YdsFVUZlUaM4aIcjDsFih/80KgUTPwj4efHWh7QKpsf3F2wnWfEcuUb/2?=
 =?us-ascii?Q?fr6cHbs3CmB/76oJqRyTOwDmWgNQ2c8i+XJQ3Kl2?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5588582-a1a9-4324-5650-08da8f3f70e2
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:06:26.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VDrZc5S+O4VpOKEixs9bo9DHpYAno71Aj9Pt0yoE/AJz/QIKvvqmK/tQX4wAhpn1RIhvg1UYPPoFjYWCivmqMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 13:06:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170315

Add patch to fix CVE-2021-31566 issue for libarchive
Link: http://deb.debian.org/debian/pool/main/liba/libarchive/libarchive_3.4=
.3-2+deb11u1.debian.tar.xz

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../libarchive/CVE-2021-31566-01.patch        |  23 +++
 .../libarchive/CVE-2021-31566-02.patch        | 172 ++++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |   2 +
 3 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-31=
566-01.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-31=
566-02.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.=
patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.patch
new file mode 100644
index 0000000000..c4a2fb612c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.patch
@@ -0,0 +1,23 @@
+Description: Never follow symlinks when setting file flags on Linux
+ Published as CVE-2021-31566
+Origin: upstream, https://github.com/libarchive/libarchive/commit/e2ad1a2c=
3064fa9eba6274b3641c4c1beed25c0b
+Bug-Debian: https://bugs.debian.org/1001990
+Author: Martin Matuska <martin@matuska.org>
+Last-Update: 2021-12-20
+
+CVE: CVE-2021-31566
+Upstream-Status: Backport [http://deb.debian.org/debian/pool/main/liba/lib=
archive/libarchive_3.4.3-2+deb11u1.debian.tar.xz]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -3927,7 +3927,8 @@
+
+       /* If we weren't given an fd, open it ourselves. */
+       if (myfd < 0) {
+-              myfd =3D open(name, O_RDONLY | O_NONBLOCK | O_BINARY | O_CL=
OEXEC);
++              myfd =3D open(name, O_RDONLY | O_NONBLOCK | O_BINARY |
++                  O_CLOEXEC | O_NOFOLLOW);
+               __archive_ensure_cloexec_flag(myfd);
+       }
+       if (myfd < 0)
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.=
patch b/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.patch
new file mode 100644
index 0000000000..0dfcd1ac5c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.patch
@@ -0,0 +1,172 @@
+Description: Do not follow symlinks when processing the fixup list
+ Published as CVE-2021-31566
+Origin: upstream, https://github.com/libarchive/libarchive/commit/b41daecb=
5ccb4c8e3b2c53fd6147109fc12c3043
+Bug-Debian: https://bugs.debian.org/1001990
+Author: Martin Matuska <martin@matuska.org>
+Last-Update: 2021-12-20
+
+CVE: CVE-2021-31566
+Upstream-Status: Backport [http://deb.debian.org/debian/pool/main/liba/lib=
archive/libarchive_3.4.3-2+deb11u1.debian.tar.xz]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -556,6 +556,7 @@
+       libarchive/test/test_write_disk.c \
+       libarchive/test/test_write_disk_appledouble.c \
+       libarchive/test/test_write_disk_failures.c \
++      libarchive/test/test_write_disk_fixup.c \
+       libarchive/test/test_write_disk_hardlink.c \
+       libarchive/test/test_write_disk_hfs_compression.c \
+       libarchive/test/test_write_disk_lookup.c \
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -2461,6 +2461,7 @@
+ {
+       struct archive_write_disk *a =3D (struct archive_write_disk *)_a;
+       struct fixup_entry *next, *p;
++      struct stat st;
+       int fd, ret;
+
+       archive_check_magic(&a->archive, ARCHIVE_WRITE_DISK_MAGIC,
+@@ -2478,6 +2479,20 @@
+                   (TODO_TIMES | TODO_MODE_BASE | TODO_ACLS | TODO_FFLAGS)=
) {
+                       fd =3D open(p->name,
+                           O_WRONLY | O_BINARY | O_NOFOLLOW | O_CLOEXEC);
++                      if (fd =3D=3D -1) {
++                              /* If we cannot lstat, skip entry */
++                              if (lstat(p->name, &st) !=3D 0)
++                                      goto skip_fixup_entry;
++                              /*
++                               * If we deal with a symbolic link, mark
++                               * it in the fixup mode to ensure no
++                               * modifications are made to its target.
++                               */
++                              if (S_ISLNK(st.st_mode)) {
++                                      p->mode &=3D ~S_IFMT;
++                                      p->mode |=3D S_IFLNK;
++                              }
++                      }
+               }
+               if (p->fixup & TODO_TIMES) {
+                       set_times(a, fd, p->mode, p->name,
+@@ -2492,7 +2507,12 @@
+                               fchmod(fd, p->mode);
+                       else
+ #endif
+-                      chmod(p->name, p->mode);
++#ifdef HAVE_LCHMOD
++                      lchmod(p->name, p->mode);
++#else
++                      if (!S_ISLNK(p->mode))
++                              chmod(p->name, p->mode);
++#endif
+               }
+               if (p->fixup & TODO_ACLS)
+                       archive_write_disk_set_acls(&a->archive, fd,
+@@ -2503,6 +2523,7 @@
+               if (p->fixup & TODO_MAC_METADATA)
+                       set_mac_metadata(a, p->name, p->mac_metadata,
+                                        p->mac_metadata_size);
++skip_fixup_entry:
+               next =3D p->next;
+               archive_acl_clear(&p->acl);
+               free(p->mac_metadata);
+@@ -2643,6 +2664,7 @@
+       fe->next =3D a->fixup_list;
+       a->fixup_list =3D fe;
+       fe->fixup =3D 0;
++      fe->mode =3D 0;
+       fe->name =3D strdup(pathname);
+       return (fe);
+ }
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -208,6 +208,7 @@
+     test_write_disk.c
+     test_write_disk_appledouble.c
+     test_write_disk_failures.c
++    test_write_disk_fixup.c
+     test_write_disk_hardlink.c
+     test_write_disk_hfs_compression.c
+     test_write_disk_lookup.c
+--- /dev/null
++++ b/libarchive/test/test_write_disk_fixup.c
+@@ -0,0 +1,77 @@
++/*-
++ * Copyright (c) 2021 Martin Matuska
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution=
.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS O=
R
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANT=
IES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED=
.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, B=
UT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF U=
SE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE =
OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++#include "test.h"
++
++/*
++ * Test fixup entries don't follow symlinks
++ */
++DEFINE_TEST(test_write_disk_fixup)
++{
++      struct archive *ad;
++      struct archive_entry *ae;
++      int r;
++
++      if (!canSymlink()) {
++              skipping("Symlinks not supported");
++              return;
++      }
++
++      /* Write entries to disk. */
++      assert((ad =3D archive_write_disk_new()) !=3D NULL);
++
++      /*
++       * Create a file
++       */
++      assertMakeFile("victim", 0600, "a");
++
++      /*
++       * Create a directory and a symlink with the same name
++       */
++
++      /* Directory: dir */
++        assert((ae =3D archive_entry_new()) !=3D NULL);
++        archive_entry_copy_pathname(ae, "dir");
++        archive_entry_set_mode(ae, AE_IFDIR | 0606);
++      assertEqualIntA(ad, 0, archive_write_header(ad, ae));
++      assertEqualIntA(ad, 0, archive_write_finish_entry(ad));
++        archive_entry_free(ae);
++
++      /* Symbolic Link: dir -> foo */
++      assert((ae =3D archive_entry_new()) !=3D NULL);
++      archive_entry_copy_pathname(ae, "dir");
++      archive_entry_set_mode(ae, AE_IFLNK | 0777);
++      archive_entry_set_size(ae, 0);
++      archive_entry_copy_symlink(ae, "victim");
++      assertEqualIntA(ad, 0, r =3D archive_write_header(ad, ae));
++      if (r >=3D ARCHIVE_WARN)
++              assertEqualIntA(ad, 0, archive_write_finish_entry(ad));
++      archive_entry_free(ae);
++
++      assertEqualInt(ARCHIVE_OK, archive_write_free(ad));
++
++      /* Test the entries on disk. */
++      assertIsSymlink("dir", "victim", 0);
++      assertFileMode("victim", 0600);
++}
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.4.2.bb
index d8ed80686b..7d2e7b711b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -37,6 +37,8 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive-$=
{PV}.tar.gz \
            file://CVE-2021-36976-2.patch \
            file://CVE-2021-36976-3.patch \
            file://CVE-2021-23177.patch \
+           file://CVE-2021-31566-01.patch \
+           file://CVE-2021-31566-02.patch \
 "

 SRC_URI[md5sum] =3D "d953ed6b47694dadf0e6042f8f9ff451"
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

