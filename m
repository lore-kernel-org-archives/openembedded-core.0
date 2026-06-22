Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0719FCDB470
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 12:43:41 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36612.1782105943328641449
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 22:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=TDfJuSAU;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.62, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1IJE0MKQBojGuFMMqxZmTTjvvW388nH2CoH8i0O1Slw6R5lLb056HzDbhIlTDLwoP5VV0r3VPIPyGW3a7TQ+RdAlL9Akuev7feGgjA4cncR8GHsPoi9YfgaV51gKuqQznUFhoCbDwjGlcIHdlwOYfCJMUwSMZluSzAO7CXKKIbaw/D/cXlNs+aUGv7n9C3Qhqu525UzEDk3NZZDKTiOrFrTHGwJN1a1EEyKl79/whyoswyQhmDgDfKP2EaAt6sVckABZKg6fUUGoAvikEJhiJQgHj9PImJbCZ2oyd+D4IOFoMKFfXlEJksZcemowEzIONFZ0Xn3iO5r0h7+WYdncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34m1V+nVLw0WXegExVZq80iDm2GvCwOd73KD3WujcxU=;
 b=MS+if+FGAsKDXxaDoRDdi5eH0haPRkHLRnWTlzVHTVaSlS52oEMzDGGZtlqSqHsN8knXbZs/xF4mycwn5k9Iup0jAxmWTNI+06r3CLrK//e6LL7lmM6uq0XKlUJlG7OMkM3+1F5T0jAuFepbxYAvMUmXxkliGwYO1fKAeEahRHw2k2G+oHZpYCk3SqPbyeo9D0WpNJnQptWGX6vG74u+2hjwQoLoR370bkrfE3jjl/wgEzph3cUHMn3SPOuus5ZRy7KNoVVayrs+Qbovn/LQ6gHcgwjM5rLNoHyF4l5slMHA8JQRJgoJy057p1187Bd3v1R+VphNnujOLumOg9o5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34m1V+nVLw0WXegExVZq80iDm2GvCwOd73KD3WujcxU=;
 b=TDfJuSAUHpCSEM6z3W6nO8LQ9h4KxM65l3xH7VSRrLOtMDwUUm9lcEQ+JQKAB34Ye9T44OnwB13oxYc4NElYq/Vih0Mi7FKBpVp2wysCyF2WgOCmHZkzlUNJBg11crSwjvml0sN2tS5u12QP5DLkKu+Dld9tGZ07+GQrR0pv4Rt8wY0ZPoAXjyitqeJ4v6s0NyL1iKLfB4gTQFq7lWGpZAqhFiwZ5rmvySk4uIJ1mE6f/EMAYwTS/jwVE3BCQviTdVo09Bj0MArYNXWXg6AQn6WEk7gvFCpULNdDJLLirogjkLwJ4Hi4rLdg3c4toN4qw9BOcaRid4yCCYqK08G1FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN1P287MB3680.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.14; Mon, 22 Jun
 2026 05:09:29 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 05:09:29 +0000
From: Sana Kazi <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Subject: [oe-core][master][PATCH] nptl: open threads comm with O_WRONLY|O_CLOEXEC
Date: Mon, 22 Jun 2026 10:39:21 +0530
Message-ID: <20260622050921.985873-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN3PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::16) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN1P287MB3680:EE_
X-MS-Office365-Filtering-Correlation-Id: 43901e2e-51db-49d3-2937-08ded01c705a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|3023799007|11063799006|56012099006|18002099003|38350700014|55112099003;
X-Microsoft-Antispam-Message-Info: 
	rD3skXmJDKPFVKdjfPxiu+NI7WduY6YzzJZDfMJL9tmeI6EPoA+jK39qmfz9kfwc8pC5i24liRDCAYyMcU5gx7wC9HCxRNwcr3YyLn9Ya76Z/V3alKWhPCz8zhgNYUg6sz4EAo845IBssamJNIyxI/Axl5eAnshlaI/LigasQw6xBr8Z/RfH6wDirpKgIR8cQhy9HEBKZEpqGq6CemNN6OsBdxzamQ9kTlUqF+ZJweNUaTMqTW1jEHc0UwNq6V2OWhF4xBq1e8NNu5Vp/4kNhi/TtRMEwodb6VUR8TpvwhHfNP+21emtWLg+9Wkyamnzt0PaHiCihWqrLDG/W/JZu/1rYDz2aK/wVthec6+ssmgPlFLut7qX/kgGHR4Ok4B7yorcWdVATlI4Z/1yFnQGh5OAwJ6EVikvDJRFUZOSn/Z43XmP0vVSeFVsIrUyel1c95xULdTu1o/rLhfQCO58MRv+2pjOGYfZoWj5JZQYQS0NGsHsjr23nFSlPa71ppq5OqEk7IuWtT2whUptOzZMeQ53YWWm1VCd5qNlyR6yR6HdTHVai8Ubuu97f99K0Ujs2Hegn4zphiA2SpflcXJIIZRQOIWXfdQugyNKpAwzyta8gQzHkRfd+coFDLNrBk11Fp/mFtMjOlOWVdQgSERnzLsMRxq9/2LBv6lzqj1aB4XGoYJc0EJQOUZgeyyhpTt5QwC6V3CfktdQlxHJmLT1Tx0G9FrqMnUh8bAv4ZYxuFk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(3023799007)(11063799006)(56012099006)(18002099003)(38350700014)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dOCOZxx3uQ9IqNLzWL5AgnVYjvw80Io8y7+dZXuxZVMNAiqVJl0QaxUg15N6?=
 =?us-ascii?Q?yDGNRi3y6CcrPmumUVKy+nd6Bmh642/FEF3QaGdVQhg6WnjqNc8R6ba+XX2P?=
 =?us-ascii?Q?7NKCB4CZHQ5wI09Yl0PECNtDsJ+5ePG3DQFvwQtVlnAe3LZe67DYbQ5KJwbp?=
 =?us-ascii?Q?7aJWWnT0Vld+X9a3MXb0H95PmAHOxhp2Ax7DrLVBItklHyrs9ZdeiCM2NRLI?=
 =?us-ascii?Q?UDgX6n2SPFzkwKwvK8IIiQ1CWPSgZDC1afaaNKWeVgS7gtnGMTV8GajLOqeY?=
 =?us-ascii?Q?Wk5t6dHYf/9a/JjwoIdftXOzGFy3PMpzDgp2VZp72x/SULSoQekFMsF5jD22?=
 =?us-ascii?Q?tT+LS+Xt5bz6LHT8WPVv7ohFg0jrZDLFZW0pukXvd103P2SnkVmoGIeHtLta?=
 =?us-ascii?Q?CSOaSr/plZE9tIB/ZQTgpOXGRcRv5E89GtVSbwzMkzSAHn5FSiGv5q0S/ZYw?=
 =?us-ascii?Q?oS/EkV+4oVcJS/gmpV0nQDvljrET5fBaSjuidrBwYYOVPe/qmZBatDBxzQAY?=
 =?us-ascii?Q?FTKH8CtEC4UjTsm0WNR5BTxkdf//GApuTOfAiWjOFDgKs8v2shNgdJfaRrJi?=
 =?us-ascii?Q?BVjKbSnMSIf/3oaF284UQkPJuuyS9olIEaAHddrcxoefqOBxJEh3hygwtH7P?=
 =?us-ascii?Q?OE64GcauJnVHdiR/49nan98K39S5G+YW/fHGzGGCiJ8UZRRYUMfX7DTWwP3R?=
 =?us-ascii?Q?rD6PweWxqB9xDpKNNh+m7pbZcIQPjTBBP+Ui9dLzX708cFXZzTzgCJBtDyW5?=
 =?us-ascii?Q?0RDNy4torTsXqp4RNz70+fV2skwrYbVRXFWirY67Aaa2+33h9JVlsmVdj710?=
 =?us-ascii?Q?vu1GOeQVveIN7cOj3Pe7fdTfsqsMIPpAfM/o90Em538aOXqvaPiMBLI+S4ZM?=
 =?us-ascii?Q?9IRuPjG54kEdBCuhW40N+Bcy/fwsZlSdFcIcqNa242vTe4BRVwxEOP9fkW4g?=
 =?us-ascii?Q?igsa4ZYERo8Sk33KM1J8na/cfouWp77gkmXvIRlX0oPINGLh2Klz5W4AIFWL?=
 =?us-ascii?Q?VxBhD/l6hGKU2FRuWwmVu5yq//lE8zPn+Y5NU/n/Jf8BUJR1XkBDLGh00WTQ?=
 =?us-ascii?Q?fGbHldB3aYVmLJSrWUih0Gaf5okAEr01U7Zi67VbFX7O1YT02NzqFRxjqy+I?=
 =?us-ascii?Q?QGkP6gpJEH5qNDqTcmO2fHBmpEZPzTjME+smfU7TlH8AkIAM+Wva/ptSqpkb?=
 =?us-ascii?Q?pmukuT0F9cogymd4QB96SG3EJH5GZBg/SS/5JFuxDcj2MP3SKvqSEl0SXL7z?=
 =?us-ascii?Q?lwoCGvjRYATlqfWRGrh6oLfXT4n7nvHXLElcKrL2vHAVsjwhlZzaKfZzb6ht?=
 =?us-ascii?Q?9gfv0iT4yUY/D+X459nHnnUh387Vuduv+yiVbaZR8MAXVmjPxHvH/+KhgLdh?=
 =?us-ascii?Q?DHdy/ilfpe0E6gxb8ZPdGJ5j6WQWADRw3/s91sXdsLjkLPhm3ewabO9Z9l9u?=
 =?us-ascii?Q?fICiylghrzl3O/87I4nGYXaUI/M5vajusO+bB2b4Wz98EcgoDIU/Z5oK1dmE?=
 =?us-ascii?Q?xH9BJnE1EgOdSiL2mgToFDgQapTo/e9TWBjjTKAT3T/YguqMC0hPQ3R/OkKs?=
 =?us-ascii?Q?Uu4R5z5Q4CoXT6IVjoWjPMi7II1cmafYWHJTJyBzmYmeCMfehz8tCxAtUkFd?=
 =?us-ascii?Q?5l94ZiKwASTUd8OtBvxt+gWZG+E5gCx4yK8KRvTP4xoCrHCE4gUmkTax6a2n?=
 =?us-ascii?Q?zjs4MSfhKtbOp2j3P5HU2iOzQ4rv+jNLSYVe4xPJcvnKG9bsRNnjSZ4q9Whf?=
 =?us-ascii?Q?bqoT+DdDj67iZrmsnIhlyS3ztTZLDi0=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 43901e2e-51db-49d3-2937-08ded01c705a
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 05:09:29.6521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgvaVfHw3MEN7I/X/tIujhVx2Ccr7c3IjnOo2HaB3ynCtnOcaVEXMbPkgMjD7XiSm9PNvGO7eou0IWUJ7xDNAxUYvokC10C/bIHjt3ptga8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3680
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 12:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239286

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
 meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-fix-fd-leaks.patch b/meta/r=
ecipes-core/glibc/glibc/0024-fix-fd-leaks.patch
new file mode 100644
index 0000000000..d2f8231c02
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
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dp=
atch;h=3D1cba6073e500c7bde9322a2f536fc0c308846c61]
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
index a52dcfd364..8cfce51ec5 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -55,6 +55,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftes=
t.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.p=
atch \
            file://0023-CVE-2026-5450.patch \
+           file://0024-fix-fd-leaks.patch \
 "
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
=20
--=20
2.43.0


