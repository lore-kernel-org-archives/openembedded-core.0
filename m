Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7BEC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 18:18:55 +0000 (UTC)
Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [136.144.136.9])
 by mx.groups.io with SMTP id smtpd.web10.2180.1747678711237238472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 11:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=jv48M+uz;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.9, mailfrom: jeroen@myspectrum.nl)
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound5.mail.transip.nl (Postfix) with ESMTP id 4b1Qsw6QwszHXBD;
	Mon, 19 May 2025 20:18:28 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission4.mail.transip.nl (Postfix) with ESMTPSA id 4b1Qsv5yVKz2pRDkJ;
	Mon, 19 May 2025 20:18:27 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 59C1720071;
	Mon, 19 May 2025 18:18:26 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Mon, 19 May 2025 20:18:20 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster -M <akuster808@gmail.com>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [PATCH] gcc 15: fix ldrex r1, [s14] on ARM
Date: Mon, 19 May 2025 20:18:15 +0200
Message-ID: <20250519181815.2536332-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1747678707; h=from:subject:to:cc:date:
 mime-version; bh=2c8elHcLU7nYnqRe5G2GfbyFlAIT46Ii2cRJJj5S2A0=;
 b=jv48M+uzMHGmBu0g1HSCOgfX80/zMolQ30RUb1Igdif8mgcnvIbI8IL38q6KtbOHHGBPfN
 ytsXOKR1bn/TldP6beEgIGUdjfm+aIFF2nAmtaLr2EtN0z3At3oj2ZNUP4xqQxo/13SbeX
 tRILQLOdsjTqRd1gbEdOuFDIHzytoeyxt0EdMdsM+++iQgyRCc3raZbFIH3hEj+mMhXI+T
 wvPuP0yy4/iJaCCqpCtbZ1x1p5scDqWi/k/0kltC+2KP9HJptzH2TtwGtG5yDNV6TgWdup
 h7BGqUlQzQuzrJMfUcbTvnJOuEzXoeQE3UlQz8/hLPYx2eNCcql5G8v94uxuKw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 18:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216865

From: Jeroen Hofstee <jhofstee@victronenergy.com>

cherry-picked from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120351
---
 meta/recipes-devtools/gcc/gcc-15.1.inc        |  1 +
 ...-validate-mem_noofs_operand-PR120351.patch | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-arm-fully-validate=
-mem_noofs_operand-PR120351.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.1.inc
index 864c6091a6..f88c9c4ff8 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -69,6 +69,7 @@ SRC_URI =3D "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+           file://0001-arm-fully-validate-mem_noofs_operand-PR120351.pat=
ch \
 "
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0001-arm-fully-validate-mem_no=
ofs_operand-PR120351.patch b/meta/recipes-devtools/gcc/gcc/0001-arm-fully=
-validate-mem_noofs_operand-PR120351.patch
new file mode 100644
index 0000000000..3fa0b5edac
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-arm-fully-validate-mem_noofs_ope=
rand-PR120351.patch
@@ -0,0 +1,97 @@
+From 840140fd8af7549e535530fc9ee2d87b533f26c1 Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <rearnsha@arm.com>
+Date: Mon, 19 May 2025 16:19:39 +0100
+Subject: [PATCH] arm: fully validate mem_noofs_operand [PR120351]
+
+It's not enough to just check that a memory operand is of the form
+mem(reg); after RA we also need to validate the register being used.
+The safest way to do this is to call memory_operand.
+
+	PR target/120351
+
+gcc/ChangeLog:
+
+	* config/arm/predicates.md (mem_noofs_operand): Also check the op
+	is a valid memory_operand.
+
+gcc/testsuite/ChangeLog:
+
+	* gcc.target/arm/pr120351.c: New test.
+
+Upstream-Status: Backport [WIP, https://gcc.gnu.org/cgit/gcc/patch/?id=3D=
e5bb7a328eb71daa02d15b48d3a6c6b8cd24abc5]
+---
+ gcc/config/arm/predicates.md            |  3 +-
+ gcc/testsuite/gcc.target/arm/pr120351.c | 47 +++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/arm/pr120351.c
+
+diff --git a/gcc/config/arm/predicates.md b/gcc/config/arm/predicates.md
+index 75c06d9be25..655f60312de 100644
+--- a/gcc/config/arm/predicates.md
++++ b/gcc/config/arm/predicates.md
+@@ -907,7 +907,8 @@
+=20
+ (define_predicate "mem_noofs_operand"
+   (and (match_code "mem")
+-       (match_code "reg" "0")))
++       (match_code "reg" "0")
++       (match_operand 0 "memory_operand")))
+=20
+ (define_predicate "call_insn_operand"
+   (ior (and (match_code "symbol_ref")
+diff --git a/gcc/testsuite/gcc.target/arm/pr120351.c b/gcc/testsuite/gcc=
.target/arm/pr120351.c
+new file mode 100644
+index 00000000000..d8e9d73275c
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/pr120351.c
+@@ -0,0 +1,47 @@
++/* { dg-do assemble } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-add-options arm_neon } */
++/* { dg-additional-options "-O2" } */
++
++
++typedef struct A
++{
++  int f1;
++} A;
++
++__inline void ref (A* x)
++{
++  __atomic_fetch_add(&x->f1, 1, 0);
++}
++
++typedef struct B
++{
++  A *d;
++  int *ptr;
++} B;
++
++void insertOne (B*, B*);
++
++void init (B *);
++__inline void copy (B *p, B *q)
++{
++  p->d  =3D q->d;
++  p->ptr =3D q->ptr;
++  ref (p->d);
++}
++
++__inline void emplace(B* x)
++{
++  B dummy;
++  B _tmp;
++  init (&dummy);
++  copy (&_tmp, &dummy);
++  insertOne(x, &_tmp);
++}
++
++void testing ()
++{
++  B test;
++  init (&test);
++  emplace(&test);
++}
+--=20
+2.43.0
+
--=20
2.43.0


