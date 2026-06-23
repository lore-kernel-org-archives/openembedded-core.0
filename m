Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E60CDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 21:21:42 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14731.1782193378568821489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 22:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=ZDxTn+vB;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.61, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXL41Qv+P4AdOSNVzdRJF6PoclhOIjdDhlV5wzpUstXyDZWXdybU4ViaYh8Lah8rumEX9xeM5GhOy/VtKxDqlal1soYuo5lgl5ntQAkLu9e3n4gWnM5ZXV4cPxNjJMPnyE18OS/rmFk0tizbgCt/BI8LGyzAAedg0+nzYZzcGqDF0TK6ehweoFvP+L0Pdl3oM+sahThdV9unjtZ+9Nw4+4E4+IiSP+rvSDfww9xwwJYV87IbR/9Lz2f9f6XnTQ7qAnUG3jloAFkc7EllYEvon/Lxkm5b1HYkMGm9l5evlQyLTdn4+PmjwJoA84Aumyl0hD6K7YB5eK86Y0YdX0CKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQ2IzTMwxFMI+DpL/9YWQKwMnBdM8zTjxnuogV2H7Zc=;
 b=oeeyacYkxBfHEmXf5k829CD0MtTMMRq5zQDDWy8U7BQAJDQ/3QQ3bCed5yPmIXKehiUcMHUx2vVp8dtIfDvSrFfUf5sC+f8z5uxDU9ny2/7g5s2ZDgs5WKDonbTluuoY6FaqfpRwzaw4n+533r2GM1AUJlbjdo2d7d6KCaRg2k5IUUFO9l9cUjtTp0kk3GF8vCsqYXC50Hrutrpf5kRVmGikpnPBgcLcF/+mshMLDSYed57mfRnw6BfeiK2SseG8I5/lME4ZUwNhO+3KOY2llHsKKQDtZmHfHH2iE6YedQVlwoQnkgzLxfBJp+xTHzpkuOLEUmbysV+4bvrw9AZblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQ2IzTMwxFMI+DpL/9YWQKwMnBdM8zTjxnuogV2H7Zc=;
 b=ZDxTn+vBmGifjbX4VqUcytv0/vIhlhE8kaBNqKxwHhWVQ2oeCjHOr+YGfGS9uSwL2KEHbIiDq9mCtljOkqk4BcYjEzcutTmQvlZ7K9qI88x1wGmqEp12waR1DQbmbBVNpP7ZQmlHbTXq/OYgwl8C0GDrDmWp4406WumUah9JhBsxthWoSCkcSbeFoew8K9qL6xxa3EtsLm8RKcZ6GaDYNWWLzUR0X/LgvVuR0NriSFbmRzzblWO7WRRzS5nPPT6YVPOLP55rQFJu9hWDrSEnGQtTtactgdXUYdoeXzma6THf0krzFr8mzgaH+wuf1b5EpehstLawP8IyVdFdJ/7tzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN3P287MB1980.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d2::13)
 by PN2P287MB1140.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:132::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 05:42:48 +0000
Received: from PN3P287MB1980.INDP287.PROD.OUTLOOK.COM
 ([fe80::5556:96e5:3fc:b04f]) by PN3P287MB1980.INDP287.PROD.OUTLOOK.COM
 ([fe80::5556:96e5:3fc:b04f%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 05:42:48 +0000
From: Sana Kazi <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Subject: [oe-core][wrynose][PATCH] nptl: open threads comm with O_WRONLY|O_CLOEXEC
Date: Tue, 23 Jun 2026 11:12:39 +0530
Message-ID: <20260623054239.1039073-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: BM1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::36) To PN3P287MB1980.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1d2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1980:EE_|PN2P287MB1140:EE_
X-MS-Office365-Filtering-Correlation-Id: d289b577-32e0-492b-9444-08ded0ea424f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|18002099003|3023799007|55112099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Rr8HRLRLB+8vQl8sinIFkeUQltQ2k0PB7V0x787srsKDN0Lf+op75FGTiBDARxQj4sMHgzbbOr7KsKfvFWyXQcjGkVKA2DlD0RsBAVrPscD2ma36UviQO4xLrEk3RPGBDqNaHoL7dfsKLIP60FYWZWCZuSr5W8yc8PZWyjGgg4/7rJb/aec1fA0DeoC/L/OJUf0zD0BmY6S2jTzI2hovtGyqiZh37DtzaeaM9jZZkKwrZ9x+BIO5sX5adxg2a5ug7StI6hKDC8FO2/FfbMAHvLmdX02zqeVl5HSokG1XJt2JnInCJfqt3mPJeyqTlNSww7UmO2+B9IbCo4PPUqYJV9G6nReItnk8huY5KiJ/H3BDxxJcURI0Im0o9+H82kQ90CwUK3dnKmnACEW3McPPbaauugLvReIstYigeMxAXqpb817PgauinKRzEGokH5uoNJ0crhR9cVBxtfuOLa5fSmjlgbiRXzzA03AEdzYeG3aM1ut9qb3pQuO/TBzI+ZmYYoUK053Kfi0htJ8r1RGx4ushpzGM0Q2fQnXj++X8bMNnoMUevmFC4jufG7UgnGxk9RFSAydBKIHfnrgMdoW0VlppJMFH69oVxUWitpE+E1OgcuaRoiML/487y7vZDNtT5wDlG6CUlcDXzL5PvMjj4T4yjBIkZB4iXPdVLpeSrx7l7aWicnj95vzD7gtRdkVq0SoMpPVfxWtRYUjFNv3y/LTmNuTwibEGeUO+2Ooj4KU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1980.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(3023799007)(55112099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4RZneYsLa0joiVHFFrTIXjFB8gZ2PPPR8Eosn4xJVGLjc9c63/2XizuNkmnT?=
 =?us-ascii?Q?jYJn+xeUcNk6+qj3UDDRWpRGPNsKP5P3yW8n4/41LSW1Jcnk8v6hPHbv6R+p?=
 =?us-ascii?Q?w2r5ZDdNfOT2uVhJ3rWVG7nQafnOsGIwVilu0uvDn6CjviyKKywepEbe+zH8?=
 =?us-ascii?Q?M0Zpf1O5MYvdPnoUqv+sDgXxJ/xkFDZj4TAtLhN2H9QkuZOVwyDNlvQTBJcD?=
 =?us-ascii?Q?BIL0emSRyhrnb1uTMx14eeuc1NRGIwHjFQOP+L8cSQ7KaFXsmX3tByyVhFe9?=
 =?us-ascii?Q?5JDDWcvr76ORFbmOMegAhaXXL+ZHAI8784YnQsqBF2zXIfMsMGv9HIbQd0HU?=
 =?us-ascii?Q?LsKUgMfNmMaQMC37JUvglrC18mihP26gwGzGEL/+gskCteG4GrpnSVosRxVD?=
 =?us-ascii?Q?ApXpcOxS24LVO1YPU0gyCq8CXCwY6GPZxlT6YBmVdLLfkpT0cavvzkuZ+HG2?=
 =?us-ascii?Q?qd+X97ASZtgFzCsUjcgSjrUvRgW/CdXgp18AeKZ1HCPEu0h0d5+gkzyC/uMJ?=
 =?us-ascii?Q?mXYaSpRUyvzfhk14ZM387ml5q0LbcifPCk3D+0fVFilEY+Zo4pypiXrp52lY?=
 =?us-ascii?Q?0OXHB+XRnIwGSI3Yy663Ljdo0H8gvUBD+29/nArPy0quynX2cjO/ZShQPONH?=
 =?us-ascii?Q?uGhsY89ycx4wEuewIkEwgHs4tq31wE+MpKosfXIRlaUtz5XehCRARJOlY/EV?=
 =?us-ascii?Q?LNptb3cIdxgiWl9uDg0Gs5iXA/3X+8+7K3JmdOWdqSja3h5APSDT9sh9u7Dc?=
 =?us-ascii?Q?m+6gxHkIBQp0KGSGuoJhv7E8VG4LNMYqLtDmU5q+Ffm8KxIxsKpNu+hqFKKC?=
 =?us-ascii?Q?285DI7y/P9H+fDhZ9qv3pIdRRBwAyOXpcKGwuLAk03F+rkBCY/565LGYkCbL?=
 =?us-ascii?Q?y6jqWWIZpcjj1Nk/o9+oKzytvTLXCDCHF/PilkUYcT2l8UlabKNSSIdgoeQz?=
 =?us-ascii?Q?ciHQQnI/x+MtVMKU/lv9aMNVRSUaqnshoHhSYEE6AWMgvRFid98tmelr9vKa?=
 =?us-ascii?Q?u/e8gYYGddHuTo8um97bbvNTWGmh4FVcnmlfyim+9GlUG3XW8t7cg80Vjk+A?=
 =?us-ascii?Q?N0bovKspHX8ifIR/GKwPpP+2ghRZKJ48Bw2sOrvs8P2rQ12IijQ/j/i5kp0K?=
 =?us-ascii?Q?Y9KsPY3OZAZO8T6py0w8BqiuGAiqEM0F7ZZ7QsrykWwdl33GwQpN+yRnQrxx?=
 =?us-ascii?Q?I2yjRlEr8JS25Z8fm+X+YuIFQBJRLGP4DMYhFp9Z6CIJrI5DJmnJdHhcQS5h?=
 =?us-ascii?Q?5QACpKi2p5Ubs0RKfucIh6iePP1U9ZVZ7VNpy61H5pJhPmMxhEAlQojj729W?=
 =?us-ascii?Q?1WJuBhbdb01zos4wTnvqN8lTbP5fvIevgrOZD/lMgLHSxtwyuSW/vnuIuoqo?=
 =?us-ascii?Q?rTaYFoZmd0lCwNqm0uZpFXuAB3u/4qfWxKvJRhQm+A18uTh2x8uQTAa7T2lr?=
 =?us-ascii?Q?O0nry6GcnNSfCh/9V+JHgA7YoSJ+Vd32hZJyAzeXsEkzOipcztFQX3c0zqim?=
 =?us-ascii?Q?gMgjkVk96mr6eNf74dejxA0UiAMRKk5I72Kt0EMCIodHwIqUoTmjZ0wQdNUP?=
 =?us-ascii?Q?nzqd7yLRA42YTdxW6cOmi/qseFFSdtDbNuwLWvnSGLOmKEXUVp3tRQFfudnT?=
 =?us-ascii?Q?zsZ72ulrOnt49r2XSnKvrrHwOjYxVa23OfqzlhcugAaQcUyN+Y+GUIzaJxSG?=
 =?us-ascii?Q?a3vooEyUyddFLWaSh6kP8/G07j15do/wnD81gk5KCWCSQlpBx8yNFMf2XkT/?=
 =?us-ascii?Q?sYYvaGeAFW5vvB8f2ZwzplzXrTtx3dA=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: d289b577-32e0-492b-9444-08ded0ea424f
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1980.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 05:42:48.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0TOUP0wIiB5Dva+1u5gBeBc7rwfjHzqd3RBBilpKWukhMW/HvZUQz8F3HfOBK1eDknZF1mV2mTHtix784d2K79ptva/Niw2MWcm3+ErGvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1140
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 21:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239419

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
 .../glibc/glibc/0024-fix-fd-leaks.patch       | 59 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch b/meta/r=
ecipes-core/glibc/glibc/0024-fix-fd-leaks.patch
new file mode 100644
index 0000000000..989e55d473
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch
@@ -0,0 +1,59 @@
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
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glib=
c/glibc_2.43.bb
index b84c55ca17..d1892075ad 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -54,6 +54,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ=
-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftes=
t.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.p=
atch \
+           file://0024-fix-fd-leaks.patch \
 "
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
=20
--=20
2.43.0


