Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B36CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 12:43:40 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36573.1782105820983998986
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 22:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=py/z2ec8;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.59, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPt7ScdK3Sn0RfKqJ2SO92SbPa58vlJBI7UarwLKzh+ev8W/QbnDTnUn5rloCTv+v+Dgu2cjH172BmYvlpEjvT1GF0uZykkHpXnpD42PkjcJCFUYlTzBGoGPl7sdt9bdN2TO5rjW4ymc+GS9QzyhvQhN9u08yl1eBxyKcClsgYHVtV9gn51smvle/jmIyj6mPyAHH6F09p4TIpWkAYnkknoevrxA2N18/r6RScUTg/zkkL0/cQ4unsMJ8RDQDyIrfvqe61KSEa17pdnC9EN0dsMMoh+fAPa8wl7awJHRcbQ+Cbn4CcEqDIe/z0F7qmh8GOWnbs83rznQaPo/gHES2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dldwBx62pGK2jAPEAixgiQaYtLJ/F0VH5ppCdAisNsg=;
 b=mdkidGl32K4CL3IbC5m1rhU1N2f3ruAeC2kDB2TJ8bphqOyRX7EOI3DFwcPLOJlW/NSkkft66DTrm96UWxLtwjeCIJ1MyBQs31vJN7B7X3zmBIUMvNo5MtdmHBzngRlktQZ97QqpI25rsHQq+wm7STkM94EK14N9dDHGz+86ZoUbyfDB7kMvGwoshnK6G5Vx8gOxJ78TnQEiTYp5zMULYnYCl+BSeUSNxaz7Km4BhNCEXVxCar3PJ86WRiE1j2yDF64H99ObMIhMyzNRyTYNLA0YHtOFeeGIQMTg6EFxdY2axgQ4qxUxbFMAPPvslyktCpM6E6Ns2pqc3dVkIt3Ofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dldwBx62pGK2jAPEAixgiQaYtLJ/F0VH5ppCdAisNsg=;
 b=py/z2ec8zj/JKW68YMyMk90obQhK9APGMrK7A707iFOaao9nemLbHEVuMW2lzKL6ak0wv1elPFm3Fd4YFzwbACB4CcG+lLKeS/LntSVBS/rbb6UyaneHqRqyEQ3af/WluKhw7ZJCDEkS7aMPUABPm6/szw7C6hhkOJeOymwi45jB0PQ9BuLMw0cDqbVrTDYuJ2aQp6kMRE+ePY9rTc4JgD/hbvCIzDwwOKk/PPofpHVm6Dwtm+IObZsss46SySY6jQYcexfkIbKeO0ddM30thtVhwuBcQmVcxr0kltrdiFLE5aCaFzuxX7S66HKlNxDuLUDdF9rEcbPwoKiYcCD4EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PNXP287MB4004.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:284::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 05:08:44 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 05:08:44 +0000
From: Sana Kazi <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Subject: [poky][scarthgap][PATCH] nptl: open threads comm with O_WRONLY|O_CLOEXEC
Date: Mon, 22 Jun 2026 10:38:35 +0530
Message-ID: <20260622050835.985725-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PNXP287MB4004:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0ee552-6802-4c2d-fa7c-08ded01c558d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|55112099003|3023799007|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	y7XO0D/IVUMu8eIaGSG8z/dVY7V6eSQlYL9frGEuntL66BCkoWGz4zXFUfA8eprv97Z3ncHfoGjx+psvY7n14P5+ovSROa7087jx72l23TTuOTZLKhbZ5deOZb+4atDgJmcWBJI8aBgDMM7PLwak5Zmo1obrWbSvfYJZOI7rIdZk4tVfFVdaGDnu6uPYmn/PyJcQ9ZRB2lqbFIY9s0jtMd8Ojrb4VNmh13tCsjdlnfIB17Fz6ghzsGF0d2f0+M5emybF4y7hqllM1rnkGjJuGdVLgrLqAiGovLd8mFNt9YnAT/+bfHyPzbpz+0Q000Bi3Yh3nHFTqAYbdmt3nRU7oYMFceWi14F3CGVwXEkI10/1fd3PCf7xez18ZX7nLPHs5x/dkTa1EfFhSV7F+igiAj5FisxmadMLSrlS/gOE8Pq8CPnWyAxHHBk3VQr9xSnTQdnFw8yxmimAHstF6T+vAJ9KHrUeOxPvN+ST7hTjiFuHEaAbQqmhMNN67gUP479wmwTUqLcsfCmiDoUBjxcguAmoUfH+WrCoCdAzFiJLTL/c9VRNx5kZbhD1jyo2u8X67oh++UHfIIKU6FZdTwhINedM1z9ZcunplmXb6MMVJoY0D1C/O+5iKZxT6xpFbbstRCatvlv5qeDObOIxsbThapBkVj0qWoA0yO1Ho7yQL3XDNwWvu+gotIbNyIvVFle9unbJblYi7EdUB5BZ3khuUoPUkhR33PZC0NxTpyLK0Vs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(55112099003)(3023799007)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vbGXZsMRzzMeSJhUc2b/A0xFReNMSQEHjWgqibcj0PGQv0nWJHR4vhO3YerB?=
 =?us-ascii?Q?dLGvOtkiHmjdoG1Tgx5bXRz6pBWajFT71kCo/n0Ha33rTonqGsY1PSQS7pd0?=
 =?us-ascii?Q?EVpvb0h7n0GaQS/FtixpN7BMTVjHqdEdF0voFNVgIMxw+cKj6Pv207JRp9BP?=
 =?us-ascii?Q?eXs/naZ5Db9u/IOqZ7aOlTFhpUgVB0GiH0p4MlomHrSP6o+CFSfjkxM8SE1S?=
 =?us-ascii?Q?OusAHNU9lXm7R7ShjnBiAo2+LPrdOn3ZSYFZPdVfUe1srBgbSeosxJl1uaKQ?=
 =?us-ascii?Q?MHKSc/5zHNZwZIHzTcvsjJ2HSpILte/JppEWbC76QD1YHdBwLAnSKzE9Vobt?=
 =?us-ascii?Q?d2hzDn7F7tI0dHwXime4j/me1ljvTVcbZyoMChFmO+MPvhpTR5fHnbNsBFYf?=
 =?us-ascii?Q?wR1DLtL1H1hp6QZslaP/Zg/KCP54xO/Tg6zOuJPzrjDEvhvR8PxKVvgsmU5K?=
 =?us-ascii?Q?ck/D1tha6lwg1vFmSANdJwRcNwLuf/CPYjnu9RPgsVl2+b26UxlMFYNwBpKP?=
 =?us-ascii?Q?3nTgrsArgg4WS823bXbNupTVgJvbQOeCLq/+atLeF9Ias0fAdhZZABImbG0V?=
 =?us-ascii?Q?NoNACqrEZsahpSxk59p21C+/G8nlqQqBl6IjOJUNlkGISa4b+qviSArJXYs8?=
 =?us-ascii?Q?IT0Q6v49e4EeCtV9YT/NAj6NJu7e4C3exdaKH48buiFJMNvoI+foPgnHZ+m+?=
 =?us-ascii?Q?UcBcGNjmu3yKuoYB5+NTg2FC3rRu/BmqrWy7qyDMJF9FqNhMaFZl3qB6jrGL?=
 =?us-ascii?Q?8GOYjUq4B1zGH+QamCFV6WzImLVrA1M6uiJ4ShHiV5DKu/pfYP3evhzvUw4D?=
 =?us-ascii?Q?ZzfHZlgb/vxeDL285yVPQ/ZyGlQktmDrZ8yFBHft71EpJzUNUX5zsk8o/o1C?=
 =?us-ascii?Q?nF1KEDVlm6qiq1ge6jdwDGT/cOizQM2mcuWWWtnMf0jvGYh92lLXr/bIVbO1?=
 =?us-ascii?Q?eODieXmMwbKSTrsSYdqyajtF0NIZD9l/AhnRzGwKk7IXiKQYQJWZvg5yCxVm?=
 =?us-ascii?Q?7gvAM8kPs39lFVH94t2GkIdStUocQ/tEXb8ezdftjYxug6NNYz9OrsLAKL09?=
 =?us-ascii?Q?gEbBEByHErbWKMEyHrLYvPg659jAYQlK9Khy2qRjnnYZcJGvi4vWHjXc1Pf/?=
 =?us-ascii?Q?rcZj4y2eKAIfTNtxw46nnIjRnJ5gZbeKFnkREN+9RitVUpBOLQQPtMEIJHj4?=
 =?us-ascii?Q?9lQF65pkCbLGN+cyhJXqlJPN4OuOg/nj1+RYWyX7oQrMfgs2qwFgx4uqkIHt?=
 =?us-ascii?Q?5qvlH4dyldHvX+bEjODKkrJyKRwBrVWRSWiTEQeKzlh69Lwzt3RSsnkWhoLj?=
 =?us-ascii?Q?hsp3APGKscupLWZqkc3jUc+vSlCPpPYFzOAbI8OnRuQTzyqps7B6l06bjpiH?=
 =?us-ascii?Q?tdaFbRw2fzf4xmmF3H+ui7pgf1Uz5T3LgzpLNl7C63HNjfaI0k2EkAuJb8F5?=
 =?us-ascii?Q?ww+8/no2g6qBexgGPIh55iFC2C00yJFv864sk2MHmVvE5F6kJe6i2Tk5Octd?=
 =?us-ascii?Q?CAO04MJugHbBbPWojwVk8AqGMM+syKm6kwI7Iy8rMqOt4b1nKaG4TAiNToZ1?=
 =?us-ascii?Q?aG/okT5jnTvNwu13Bwe0Pcmb1qoL/OIK7Z5flUYfPADB16Ibs8yTM0sY6Phl?=
 =?us-ascii?Q?bAXE4A1X9nTn16sqbMOFlnpNcS7aPb/DlTXZGADPkqcY4Riy7aF79xA0I+fT?=
 =?us-ascii?Q?9tzQBJ9ZTk7/kXxmPPTWgOWFXimor/i/XHUMyFvIzBvW8EOfyX1dsFTaqEcq?=
 =?us-ascii?Q?Rj3RW5JBtvOTXHSzxU1AoAj6n19GR7I=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0ee552-6802-4c2d-fa7c-08ded01c558d
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 05:08:44.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz0Uq4AMe3G5p3jUU17Kzh7WRZONBglSCCMeZAHFXmrZqdkxtZ0T/AwwcpbK5tjRc9zHG4lkmFK6Hlwa41O0RVGP/DxCLoYj7ds2L5rAQxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4004
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 12:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239285

From: Sana Kazi <sana.kazi@bmwtechworks.in>

pthread_setname_np opens the thread's comm file using O_RDWR, but the
function only ever writes to it.  This causes two distinct problems:

1. Missing O_CLOEXEC: the file descriptor is not marked close-on-exec,
so it remains open across fork+exec.  A child process that audits
its inherited file-descriptor set will encounter an unexpected /proc
fd it did not open and may treat this as a security violation and
abort.
2. Unnecessary O_RDWR: requesting read+write access when only write
access is needed can cause open() to fail under security policies
that permit writing to /proc/<tid>/comm but deny reading it.

Fix both issues by replacing O_RDWR with O_WRONLY|O_CLOEXEC
Similarly, updated pthread_getname_np to use O_CLOEXEC.

Signed-off-by: Sana Kazi <sana.kazi@bmwtechworks.in>
---
 .../glibc/glibc/0024-fix-fd-leaks.patch       | 61 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch b/meta/r=
ecipes-core/glibc/glibc/0024-fix-fd-leaks.patch
new file mode 100644
index 0000000000..633e52a8f9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch
@@ -0,0 +1,61 @@
+From 1cba6073e500c7bde9322a2f536fc0c308846c61 Mon Sep 17 00:00:00 2001
+From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
+Date: Mon, 15 Jun 2026 16:37:59 +0200
+Subject: [PATCH] nptl: open threads comm with O_WRONLY|O_CLOEXEC
+
+pthread_setname_np opens the thread's comm file using O_RDWR, but the
+function only ever writes to it.  This causes two distinct problems:
+
+1. Missing O_CLOEXEC: the file descriptor is not marked close-on-exec,
+   so it remains open across fork+exec.  A child process that audits
+   its inherited file-descriptor set will encounter an unexpected /proc
+   fd it did not open and may treat this as a security violation and
+   abort.
+
+2. Unnecessary O_RDWR: requesting read+write access when only write
+   access is needed can cause open() to fail under security policies
+   that permit writing to /proc/<tid>/comm but deny reading it.
+
+Fix both issues by replacing O_RDWR with O_WRONLY|O_CLOEXEC
+
+Similarly, updated pthread_getname_np to use O_CLOEXEC.
+
+Bug-Id: 34192[https://sourceware.org/bugzilla/show_bug.cgi?id=3D34192]
+
+Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+---
+ nptl/pthread_getname.c | 2 +-
+ nptl/pthread_setname.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3D1cba6073e500c7bde9322a2f536fc0c308846c61]
+
+diff --git a/nptl/pthread_getname.c b/nptl/pthread_getname.c
+index da23a13ba5..5261993d1f 100644
+--- a/nptl/pthread_getname.c
++++ b/nptl/pthread_getname.c
+@@ -44,7 +44,7 @@ __pthread_getname_np (pthread_t th, char *buf, size_t le=
n)
+   char fname[sizeof (FMT) + 8];
+   sprintf (fname, FMT, (unsigned int) pd->tid);
+=20
+-  int fd =3D __open64_nocancel (fname, O_RDONLY);
++  int fd =3D __open64_nocancel (fname, O_RDONLY | O_CLOEXEC);
+   if (fd =3D=3D -1)
+     return errno;
+=20
+diff --git a/nptl/pthread_setname.c b/nptl/pthread_setname.c
+index 62f4964fcc..f9a528c3d8 100644
+--- a/nptl/pthread_setname.c
++++ b/nptl/pthread_setname.c
+@@ -46,7 +46,7 @@ __pthread_setname_np (pthread_t th, const char *name)
+   char fname[sizeof (FMT) + 8];
+   sprintf (fname, FMT, (unsigned int) pd->tid);
+=20
+-  int fd =3D __open64_nocancel (fname, O_RDWR);
++  int fd =3D __open64_nocancel (fname, O_WRONLY | O_CLOEXEC);
+   if (fd =3D=3D -1)
+     return errno;
+=20
+--=20
+2.43.7
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
index 7958d64eed..4681ac427d 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -55,6 +55,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bina=
r.patch \
            file://0023-qemu-stale-process.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch =
\
+           file://0024-fix-fd-leaks.patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.43.0


