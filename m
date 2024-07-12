Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78CCC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 21:39:49 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.217.1720820386794317247
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 14:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kt2LWa1g;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240712213943fe889fd56982e8ffde-ln_otq@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240712213943fe889fd56982e8ffde
        for <openembedded-core@lists.openembedded.org>;
        Fri, 12 Jul 2024 23:39:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ndNN2puOSYccSAu37WPMinza/UZuhDZaT3tidm9bhVU=;
 b=kt2LWa1gwDTAGMJ9mU23mQiI9LW5pcm1Ok/ncxAeKB9t/GLsn2IsH1bzVHOJJ4z7/eH0Zc
 T04F5pzgIdNuQQ1kJN8E0oU5S8/WipCKhHCQGp7DjmI3V4CfmrJI+zu23q5A4o+9lPsjTWi9
 CAWBCmZvzlzYaC6HoCoIyVRh9raPE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][scarthgap][PATCH 1/2] busybox: Patch CVE-2021-42380
Date: Fri, 12 Jul 2024 23:38:53 +0200
Message-Id: <20240712213854.2554353-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 21:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201851

From: Peter Marko <peter.marko@siemens.com>

Backport patch for CVE-2021-42380.
Additionally backport clang regression fix caused by this patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-fix-segfault-when-compiled-by-clang.patch |  41 +++++
 .../busybox/busybox/CVE-2021-42380.patch      | 151 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   2 +
 3 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-segfault=
-when-compiled-by-clang.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42380.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-awk-fix-segfault-when-c=
ompiled-by-clang.patch b/meta/recipes-core/busybox/busybox/0001-awk-fix-seg=
fault-when-compiled-by-clang.patch
new file mode 100644
index 0000000000..3f6145b250
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-awk-fix-segfault-when-compiled=
-by-clang.patch
@@ -0,0 +1,41 @@
+From e1a68741067167dc4837e0a26d3d5c318a631fc7 Mon Sep 17 00:00:00 2001
+From: Ron Yorston <rmy@pobox.com>
+Date: Fri, 19 Jan 2024 15:41:17 +0000
+Subject: [PATCH] awk: fix segfault when compiled by clang
+
+A 32-bit build of BusyBox using clang segfaulted in the test
+"awk assign while assign".  Specifically, on line 7 of the test
+input where the adjustment of the L.v pointer when the Fields
+array was reallocated
+
+   	L.v +=3D Fields - old_Fields_ptr;
+
+was out by 4 bytes.
+
+Rearrange to code so both gcc and clang generate code that works.
+
+Signed-off-by: Ron Yorston <rmy@pobox.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=3D5d=
cc443dba039b305a510c01883e9f34e42656ae]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ editors/awk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index aa485c782..0981c6735 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -2935,7 +2935,7 @@ static var *evaluate(node *op, var *res)
+ 			if (old_Fields_ptr) {
+ 				//if (old_Fields_ptr !=3D Fields)
+ 				//	debug_printf_eval("L.v moved\n");
+-				L.v +=3D Fields - old_Fields_ptr;
++				L.v =3D Fields + (L.v - old_Fields_ptr);
+ 			}
+ 			if (opinfo & OF_STR2) {
+ 				R.s =3D getvar_s(R.v);
+--=20
+2.30.2
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42380.patch b/meta/=
recipes-core/busybox/busybox/CVE-2021-42380.patch
new file mode 100644
index 0000000000..3baef86415
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
+@@ -1931,9 +1931,9 @@ static void fsrealloc(int size)
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
+@@ -2891,6 +2891,7 @@ static var *evaluate(node *op, var *res)
+ 		uint32_t opinfo;
+ 		int opn;
+ 		node *op1;
++		var *old_Fields_ptr;
+=20
+ 		opinfo =3D op->info;
+ 		opn =3D (opinfo & OPNMASK);
+@@ -2899,10 +2900,16 @@ static var *evaluate(node *op, var *res)
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
+@@ -2921,8 +2928,15 @@ static var *evaluate(node *op, var *res)
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
+index bbf0fbff1..ddc51047b 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -485,4 +485,59 @@ testing 'awk assign while test' \
+ 	"" \
+ 	"foo"
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
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-cor=
e/busybox/busybox_1.36.1.bb
index 373a6b7781..46e719845a 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -49,6 +49,8 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters=
-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printabl=
e.patch \
            file://start-stop-false.patch \
+           file://CVE-2021-42380.patch \
+           file://0001-awk-fix-segfault-when-compiled-by-clang.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
--=20
2.30.2


