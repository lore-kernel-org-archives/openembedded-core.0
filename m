Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48839C3DA7E
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 12:43:04 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.5278.1721479376637789235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 05:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ucZ0asuw;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-39943ace9a2so421035ab.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721479376; x=1722084176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDnJN5e1XnG88oqTK8c3esQheIi7DKaaKfO5u27LGOU=;
        b=ucZ0asuw2ma96Z4IpmLFl6kAA1jrtzrYz4lrJuZ5DA9yCG5NLri38Lw+T1M0NcYNvH
         LEh4n7HgMAM4H2hHBXF3xTcLjQbEh6ZXU9zXToaQTkCiNCT642HKVRGXu1C3DPd62cYc
         QDJ821hoPOZP/zuQ7aGq02c90v1Syz3CaxF16bBNczlwxGIZYfc5/mPu8sUG1Q9un6ZW
         UMlCawVYBWvLX9ouN/5jhtYkA29H9ZOrceBoDgg0Hlq9X/UUnCbwNUhuWQ31tWUHFz+V
         B2V1+Fu1vlvBGwHBc8UdNqZz4kgdkopY0uskQjBDX3uHbmla4aEE4ksvRbNOTRZ7g6cQ
         loRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721479376; x=1722084176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDnJN5e1XnG88oqTK8c3esQheIi7DKaaKfO5u27LGOU=;
        b=If6AryXa+L2TZCWqcj0bO53aBjJLYrkoHH7iCVytpdp0EACVmEux3JIgpNwB1uVz4M
         8A5D6JHF9VU68FAjtiEBbZEttqgqKQ7ZtHvMuDUCIWIg2yuopyuEpBDehRJiN8os/S13
         Tzq1ezuKQ9bJovpd+uT7ks1IdU2X5CZvmyq2o2PIYLUA4SWX40P7/OUzJ3I3Hv3maqos
         6UyZ7O/RGFVRONuDMqrnQcAEY2ei2q4bDHN7Exgz0NpxKKNzENWgTSLdS9StLXMJkUq4
         BD1wcV0c4ede7S+cIl9pLiAGvvz/KFiNQMHdCTjfNBGx0SIrseal3TEyliZ+ZxWvV87Y
         4kyA==
X-Gm-Message-State: AOJu0YyQg3Xzwg2mMWVf++aGpqUx9Cs0YdFNWcjYd45T7O1uW0GWDgJA
	P6s/ZymtRH36Vgo9C+L20DguYuZnKaIK1DLZF0PWL9/XoDOcbbK010s0O7VbRnIFif22FyTmIRv
	wd1Y=
X-Google-Smtp-Source: AGHT+IGL+BJFSehcKtOj0TtPTSXM7A8LjGD1+qlJIaTZ9LIXJQlits5vtG8yIsQIHhZ18VMjb6owvw==
X-Received: by 2002:a05:6e02:1945:b0:398:3f0e:8bd7 with SMTP id e9e14a558f8ab-398e8b652e4mr35485645ab.9.1721479375549;
        Sat, 20 Jul 2024 05:42:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d0fe2e2b4sm796604b3a.10.2024.07.20.05.42.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 05:42:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] busybox: Patch CVE-2021-42380
Date: Sat, 20 Jul 2024 05:42:44 -0700
Message-Id: <af3c8ff64054e131b009545883cb87454ce04b64.1721479252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721479252.git.steve@sakoman.com>
References: <cover.1721479252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 12:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202280

From: Peter Marko <peter.marko@siemens.com>

Backport patch for CVE-2021-42380.

Move if before patch for CVE-2023-42363 because they touch the same code
and they are in this order in git history so we avoid fuzz modifications.
This will remove fuzz modifications from CVE-2023-42363 and both will
apply cleanly without modifications (except line number changes and the
first one also has little fuzz fix in tests).
This will also make it equal to master/scarthgap patch order/content.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2021-42380.patch      | 151 ++++++++++++++++++
 .../busybox/busybox/CVE-2023-42363.patch      |  11 +-
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 3 files changed, 158 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42380.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42380.patch b/meta/=
recipes-core/busybox/busybox/CVE-2021-42380.patch
new file mode 100644
index 0000000000..f40fe582c5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2021-42380.patch
@@ -0,0 +1,151 @@
+From 5dcc443dba039b305a510c01883e9f34e42656ae Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 26 May 2023 19:36:58 +0200
+Subject: [PATCH] awk: fix use-after-realloc (CVE-2021-42380), closes 15601
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2021-42380
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D5d=
cc443dba039b305a510c01883e9f34e42656ae]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ editors/awk.c       | 26 ++++++++++++++++-----
+ testsuite/awk.tests | 55 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 75 insertions(+), 6 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 728ee8685..2af823808 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -555,7 +555,7 @@ struct globals {
+ 	const char *g_progname;
+ 	int g_lineno;
+ 	int nfields;
+-	int maxfields; /* used in fsrealloc() only */
++	unsigned maxfields;
+ 	var *Fields;
+ 	char *g_pos;
+ 	char g_saved_ch;
+@@ -1917,9 +1917,9 @@ static void fsrealloc(int size)
+ {
+ 	int i, newsize;
+=20
+-	if (size >=3D maxfields) {
+-		/* Sanity cap, easier than catering for overflows */
+-		if (size > 0xffffff)
++	if ((unsigned)size >=3D maxfields) {
++		/* Sanity cap, easier than catering for over/underflows */
++		if ((unsigned)size > 0xffffff)
+ 			bb_die_memory_exhausted();
+=20
+ 		i =3D maxfields;
+@@ -2877,6 +2877,7 @@ static var *evaluate(node *op, var *res)
+ 		uint32_t opinfo;
+ 		int opn;
+ 		node *op1;
++		var *old_Fields_ptr;
+=20
+ 		opinfo =3D op->info;
+ 		opn =3D (opinfo & OPNMASK);
+@@ -2885,10 +2886,16 @@ static var *evaluate(node *op, var *res)
+ 		debug_printf_eval("opinfo:%08x opn:%08x\n", opinfo, opn);
+=20
+ 		/* execute inevitable things */
++		old_Fields_ptr =3D NULL;
+ 		if (opinfo & OF_RES1) {
+ 			if ((opinfo & OF_REQUIRED) && !op1)
+ 				syntax_error(EMSG_TOO_FEW_ARGS);
+ 			L.v =3D evaluate(op1, TMPVAR0);
++			/* Does L.v point to $n variable? */
++			if ((size_t)(L.v - Fields) < maxfields) {
++				/* yes, remember where Fields[] is */
++				old_Fields_ptr =3D Fields;
++			}
+ 			if (opinfo & OF_STR1) {
+ 				L.s =3D getvar_s(L.v);
+ 				debug_printf_eval("L.s:'%s'\n", L.s);
+@@ -2907,8 +2914,15 @@ static var *evaluate(node *op, var *res)
+ 		 */
+ 		if (opinfo & OF_RES2) {
+ 			R.v =3D evaluate(op->r.n, TMPVAR1);
+-			//TODO: L.v may be invalid now, set L.v to NULL to catch bugs?
+-			//L.v =3D NULL;
++			/* Seen in $5=3D$$5=3D$0:
++			 * Evaluation of R.v ($$5=3D$0 expression)
++			 * made L.v ($5) invalid. It's detected here.
++			 */
++			if (old_Fields_ptr) {
++				//if (old_Fields_ptr !=3D Fields)
++				//	debug_printf_eval("L.v moved\n");
++				L.v +=3D Fields - old_Fields_ptr;
++			}
+ 			if (opinfo & OF_STR2) {
+ 				R.s =3D getvar_s(R.v);
+ 				debug_printf_eval("R.s:'%s'\n", R.s);
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index bcaafe8..08afdb2 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -469,4 +469,59 @@ testing 'awk printf %% prints one %' \
+ 	"%\n" \
+ 	'' ''
+=20
++# User-supplied bug (SEGV) example, was causing use-after-realloc
++testing 'awk assign while assign' \
++	"awk '\$5=3D\$\$5=3D\$0'; echo \$?" \
++	"\
++=E2=94=80 process timing =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 =E2=
=94=80 process timing =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 overall =
results =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 results =E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90
++=E2=94=82 run time : =E2=94=82        run time : 0 days, 0 hrs, 0 min, 56=
 sec      =E2=94=82  cycles done : 0     =E2=94=82 days, 0 hrs, 0 min, 56 s=
ec =E2=94=82 cycles done : 0 =E2=94=82
++=E2=94=82 last new find =E2=94=82   last new find : 0 days, 0 hrs, 0 min,=
 1 sec       =E2=94=82 corpus count : 208   =E2=94=82 0 days, 0 hrs, 0 min,=
 1 sec =E2=94=82 corpus count : 208 =E2=94=82
++=E2=94=82last saved crash : =E2=94=82last saved crash : none seen yet    =
                 =E2=94=82saved crashes : 0     =E2=94=82 seen yet =E2=94=
=82saved crashes : 0 =E2=94=82
++=E2=94=82 last saved hang =E2=94=82 last saved hang : none seen yet      =
               =E2=94=82  saved hangs : 0     =E2=94=82 none seen yet =E2=
=94=82 saved hangs : 0 =E2=94=82
++=E2=94=9C=E2=94=80 cycle progress =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=AC=E2=94=80 =E2=94=9C=E2=94=80 cycle progress =E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 map coverage=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4 coverage=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
++=E2=94=82 now processing : =E2=94=82  now processing : 184.1 (88.5%)     =
 =E2=94=82    map density : 0.30% / 0.52%      =E2=94=82 (88.5%) =E2=94=82 =
map density : 0.30% / 0.52% =E2=94=82                                      =
                                                                           =
                                                         =E2=94=82  now pro=
cessing : 184.1 (88.5%)      =E2=94=82    map density : 0.30% / 0.52%      =
=E2=94=82
++=E2=94=82 runs timed out =E2=94=82  runs timed out : 0 (0.00%)          =
=E2=94=82 count coverage : 2.18 bits/tuple    =E2=94=82 0 (0.00%) =E2=94=82=
 count coverage : 2.18 bits/tuple =E2=94=82
++=E2=94=9C=E2=94=80 stage progress =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=BC=E2=94=80 =E2=94=9C=E2=94=80 stage progress =E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80 findings in depth =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4 in de=
pth =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=A4
++=E2=94=82 now trying : =E2=94=82  now trying : havoc                  =E2=
=94=82 favored items : 43 (20.67%)         =E2=94=82 =E2=94=82 favored item=
s : 43 (20.67%) =E2=94=82
++=E2=94=82 stage execs : =E2=94=82 stage execs : 11.2k/131k (8.51%)     =
=E2=94=82  new edges on : 52 (25.00%)         =E2=94=82 (8.51%) =E2=94=82 n=
ew edges on =E2=94=82 stage execs : 11.2k/131k (8.51%)     =E2=94=82  new e=
dges on : 52 (25.00%)         =E2=94=82 52 (25.00%) =E2=94=82
++=E2=94=82 total execs : =E2=94=82 total execs : 179k                   =
=E2=94=82 total crashes : 0 (0 saved)         =E2=94=82 =E2=94=82 total cra=
shes : 0 (0 saved) =E2=94=82                                               =
                                                                           =
                                            =E2=94=82 total execs : 179k   =
                =E2=94=82 total crashes : 0 (0 saved)         =E2=94=82
++=E2=94=82 exec speed : =E2=94=82  exec speed : 3143/sec               =E2=
=94=82  total tmouts : 0 (0 saved)         =E2=94=82 =E2=94=82 total tmouts=
 : 0 (0 saved) =E2=94=82                                                   =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
    =E2=94=82  exec speed : 3143/sec               =E2=94=82  total tmouts =
: 0 (0 saved)         =E2=94=82
++=E2=94=9C=E2=94=80 fuzzing strategy yields =E2=94=9C=E2=94=80 fuzzing str=
ategy yields =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 item geometry =E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4 item geometry =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
++=E2=94=82 bit flips : =E2=94=82   bit flips : 11/648, 4/638, 5/618       =
          =E2=94=82    levels : 4         =E2=94=82 4/638, 5/618 =E2=94=82 =
levels : =E2=94=82   bit flips : 11/648, 4/638, 5/618                 =E2=
=94=82    levels : 4         =E2=94=82 =E2=94=82
++=E2=94=82 byte flips : =E2=94=82  byte flips : 0/81, 0/71, 0/52          =
           =E2=94=82   pending : 199       =E2=94=82 0/71, 0/52 =E2=94=82 p=
ending : 199 =E2=94=82
++=E2=94=82 arithmetics : 11/4494, =E2=94=82 arithmetics : 11/4494, 0/1153,=
 0/0                 =E2=94=82  pend fav : 35        =E2=94=82 0/0 =E2=94=
=82 pend fav : 35 =E2=94=82
++=E2=94=82  known ints : 1/448, 0/1986, 0/2288                =E2=94=82 ow=
n finds : 207       =E2=94=82 known ints : =E2=94=82  known ints : 1/448, 0=
/1986, 0/2288                =E2=94=82 own finds : 207       =E2=94=82 0/19=
86, 0/2288 =E2=94=82 own finds : 207 =E2=94=82
++=E2=94=82 dictionary : 0/0, =E2=94=82  dictionary : 0/0, 0/0, 0/0, 0/0   =
                =E2=94=82  imported : 0         =E2=94=82 0/0, 0/0 =E2=94=
=82 imported : 0 =E2=94=82
++=E2=94=82havoc/splice : 142/146k, 23/7616 =E2=94=82havoc/splice : 142/146=
k, 23/7616                    =E2=94=82 stability : 100.00%   =E2=94=82 sta=
bility : 100.00% =E2=94=82
++=E2=94=82py/custom/rq : unused, unused, =E2=94=82py/custom/rq : unused, u=
nused, unused, unused       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98 unused =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
++=E2=94=82 trim/eff : 57.02%/26, =E2=94=82    trim/eff : 57.02%/26, 0.00% =
                    =E2=94=82          [cpu000:100%] =E2=94=82 [cpu000:100%]
++=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98^C    =E2=94=94=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98^C
++0
++" \
++	"" \
++	"\
++=E2=94=80 process timing =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 overa=
ll results =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
++=E2=94=82        run time : 0 days, 0 hrs, 0 min, 56 sec      =E2=94=82  =
cycles done : 0     =E2=94=82
++=E2=94=82   last new find : 0 days, 0 hrs, 0 min, 1 sec       =E2=94=82 c=
orpus count : 208   =E2=94=82
++=E2=94=82last saved crash : none seen yet                     =E2=94=82sa=
ved crashes : 0     =E2=94=82
++=E2=94=82 last saved hang : none seen yet                     =E2=94=82  =
saved hangs : 0     =E2=94=82
++=E2=94=9C=E2=94=80 cycle progress =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=AC=E2=94=80 map coverage=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=A4
++=E2=94=82  now processing : 184.1 (88.5%)      =E2=94=82    map density :=
 0.30% / 0.52%      =E2=94=82
++=E2=94=82  runs timed out : 0 (0.00%)          =E2=94=82 count coverage :=
 2.18 bits/tuple    =E2=94=82
++=E2=94=9C=E2=94=80 stage progress =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=BC=E2=94=80 findings in depth =E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
++=E2=94=82  now trying : havoc                  =E2=94=82 favored items : =
43 (20.67%)         =E2=94=82
++=E2=94=82 stage execs : 11.2k/131k (8.51%)     =E2=94=82  new edges on : =
52 (25.00%)         =E2=94=82
++=E2=94=82 total execs : 179k                   =E2=94=82 total crashes : =
0 (0 saved)         =E2=94=82
++=E2=94=82  exec speed : 3143/sec               =E2=94=82  total tmouts : =
0 (0 saved)         =E2=94=82
++=E2=94=9C=E2=94=80 fuzzing strategy yields =E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80 it=
em geometry =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
++=E2=94=82   bit flips : 11/648, 4/638, 5/618                 =E2=94=82   =
 levels : 4         =E2=94=82
++=E2=94=82  byte flips : 0/81, 0/71, 0/52                     =E2=94=82   =
pending : 199       =E2=94=82
++=E2=94=82 arithmetics : 11/4494, 0/1153, 0/0                 =E2=94=82  p=
end fav : 35        =E2=94=82
++=E2=94=82  known ints : 1/448, 0/1986, 0/2288                =E2=94=82 ow=
n finds : 207       =E2=94=82
++=E2=94=82  dictionary : 0/0, 0/0, 0/0, 0/0                   =E2=94=82  i=
mported : 0         =E2=94=82
++=E2=94=82havoc/splice : 142/146k, 23/7616                    =E2=94=82 st=
ability : 100.00%   =E2=94=82
++=E2=94=82py/custom/rq : unused, unused, unused, unused       =E2=94=9C=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
++=E2=94=82    trim/eff : 57.02%/26, 0.00%                     =E2=94=82   =
       [cpu000:100%]
++=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98^C"
++
+ exit $FAILCOUNT
+--=20
+2.30.2
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch b/meta/=
recipes-core/busybox/busybox/CVE-2023-42363.patch
index b401a6e3e5..08e41415df 100644
--- a/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
+++ b/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
@@ -14,6 +14,7 @@ Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
 Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3Dfb=
08d43d44d1fea1f741fafb9aa7e1958a5f69aa]
 CVE: CVE-2023-42363
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
  editors/awk.c | 21 +++++++++++++--------
  1 file changed, 13 insertions(+), 8 deletions(-)
@@ -22,10 +23,10 @@ diff --git a/editors/awk.c b/editors/awk.c
 index 654cbac..4fbc11d 100644
 --- a/editors/awk.c
 +++ b/editors/awk.c
-@@ -2889,19 +2889,14 @@ static var *evaluate(node *op, var *res)
- 			if ((opinfo & OF_REQUIRED) && !op1)
- 				syntax_error(EMSG_TOO_FEW_ARGS);
- 			L.v =3D evaluate(op1, TMPVAR0);
+@@ -2896,19 +2896,14 @@ static var *evaluate(node *op, var *res)
+ 				/* yes, remember where Fields[] is */
+ 				old_Fields_ptr =3D Fields;
+ 			}
 -			if (opinfo & OF_STR1) {
 -				L.s =3D getvar_s(L.v);
 -				debug_printf_eval("L.s:'%s'\n", L.s);
@@ -45,7 +46,7 @@ index 654cbac..4fbc11d 100644
  		 * R.v points to Fields[NNN2] but L.v now points to freed mem!
  		 * (Seen trying to evaluate "$444 $44444")
  		 */
-@@ -2914,6 +2909,16 @@ static var *evaluate(node *op, var *res)
+@@ -2928,6 +2923,16 @@ static var *evaluate(node *op, var *res)
  				debug_printf_eval("R.s:'%s'\n", R.s);
  			}
  		}
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-cor=
e/busybox/busybox_1.35.0.bb
index 842562c4c4..1c7fe2f43e 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -52,6 +52,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://CVE-2022-30065.patch \
            file://0001-devmem-add-128-bit-width.patch \
 	   file://CVE-2022-48174.patch \
+           file://CVE-2021-42380.patch \
            file://CVE-2023-42363.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
--=20
2.34.1


