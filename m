Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8BFD777323
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 10:26:35 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p63so19926078wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 02:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=F13nnVDuhBzFbqya+s6Dbmr8UpsGB3C82rRW+6wjxxs=;
	b=SsvbGwrihCs5FP8VyoBinl2+Em3LzTTWEr9KkibtIEbw1haT1VIQuoRdMHZ/ADZ8Dn
	a41l+jY/dcn41c4FTJIszmqGzzLwa9+wisH0HkWke5Yy2O961e/89i7RJ7/BFoxw+w3a
	5RqQe4XSHNdvLXHlObz3ZuNXFj67tPUgqrj4SJLyba8xJcMUbfd3zqZWwfbt7R4WV7FO
	q/5Xvq3MtfObVgF9rbOY/1kW11h7Fr3jpNRVgkNmChiP4+cvGGVu4Lc51B5CQapuS+EB
	7Nl67UD9cdQR7Rua/9yI2iEg/YSoD8IQ/4QNkCzyAm1UOGoZxma6pvMfG9LCJVLM6/c1
	eVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=F13nnVDuhBzFbqya+s6Dbmr8UpsGB3C82rRW+6wjxxs=;
	b=F9DJXYHvMicfqZCvMpuTcBZptd913Fm45BL9NBQXPNGz6ihQ7wajn1VQwGwfZZs1bT
	c/cxwlbVhGz6Fso6MJi76grGayR7M5xCyf3go8CUDmlFshZAcTLKt/cfiQp/J/i2NB5a
	kHPMZ2ov9p13jnvIHOBGzzt769Wqqn4MjlaVScSP9HpRomwCrTEp9XO58Wf4JOJ5LYmp
	4wnudVxoFbneOJy/gfe7HRWYqx8NB9tqAreMAr0QHtk4oGkitbGf9ohhJE7pnsP8l8g2
	K4Vwvja9eniVhszc/0bvdG703OgNHo8iKR5UvPvVdKYB8/dxqAxzzT6hmbeXPIZ/AxMy
	bTbQ==
X-Gm-Message-State: AG10YORfdzWM3knIFEx22Eudv4bid+t1lwmXLWsqJl3g4lUD6Z7N/gyeADw+YhjO9cqGSA==
X-Received: by 10.28.238.144 with SMTP id j16mr14746384wmi.43.1454667996445;
	Fri, 05 Feb 2016 02:26:36 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	c185sm30229106wma.5.2016.02.05.02.26.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Feb 2016 02:26:35 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Fri, 5 Feb 2016 11:26:35 +0100
Message-Id: <8B858EC3-8702-4A62-9CBC-35BBFCC634C9@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH][jethro] glibc: add patch from release/2.22/master fix memory corruption
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Feb 2016 10:26:36 -0000
X-Groupsio-MsgNum: 77598
Content-Type: multipart/signed;
	boundary="Apple-Mail=_40810EA0-E630-489C-8189-376F3E909973";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_40810EA0-E630-489C-8189-376F3E909973
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Since default fstab contains empty lines, this might be a reasonable =
patch
long running services using getmntent.

This patch is backported from:
=
https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;a=3Dcommit;h=3D3007f79=
7a1a596e954f44879a5a7267966186ba4

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...ntent-fix-memory-corruption-w-blank-lines.patch | 193 =
+++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |   1 +
 2 files changed, 194 insertions(+)
 create mode 100644 =
meta/recipes-core/glibc/glibc/getmntent-fix-memory-corruption-w-blank-line=
s.patch

diff --git =
a/meta/recipes-core/glibc/glibc/getmntent-fix-memory-corruption-w-blank-li=
nes.patch =
b/meta/recipes-core/glibc/glibc/getmntent-fix-memory-corruption-w-blank-li=
nes.patch
new file mode 100644
index 0000000..f08fb4a
--- /dev/null
+++ =
b/meta/recipes-core/glibc/glibc/getmntent-fix-memory-corruption-w-blank-li=
nes.patch
@@ -0,0 +1,193 @@
+commit 3007f797a1a596e954f44879a5a7267966186ba4
+Author: Mike Frysinger <vapier@gentoo.org>
+Date:   Fri Aug 28 17:08:49 2015 -0400
+
+    getmntent: fix memory corruption w/blank lines [BZ #18887]
+
+    The fix for BZ #17273 introduced a single byte of memory corruption =
when
+    the line is entirely blank.  It would walk back past the start of =
the
+    buffer if the heap happened to be 0x20 or 0x09 and then write a NUL =
byte.
+    	buffer =3D '\n';
+    	end_ptr =3D buffer;
+    	while (end_ptr[-1] =3D=3D ' ' || end_ptr[-1] =3D=3D '\t')
+    		end_ptr--;
+    	*end_ptr =3D '\0';
+
+    Fix that and rework the tests.  Adding the testcase for BZ #17273 =
to the
+    existing \040 parser does not really make sense as it's unrelated, =
and
+    leads to confusing behavior: it implicitly relies on the new entry =
being
+    longer than the previous entry (since it just rewinds the FILE*).  =
Split
+    it out into its own dedicated testcase instead.
+
+    (cherry picked from commit =
b0e805fa0d6fea33745952df7b7f5442ca4c374f)
+
+diff --git a/misc/Makefile b/misc/Makefile
+index aecb0da..2f5edf6 100644
+--- a/misc/Makefile
++++ b/misc/Makefile
+@@ -76,7 +76,8 @@ install-lib :=3D libg.a
+ gpl2lgpl :=3D error.c error.h
+
+ tests :=3D tst-dirname tst-tsearch tst-fdset tst-mntent tst-hsearch \
+-	 tst-pselect tst-insremque tst-mntent2 bug-hsearch1
++	 tst-pselect tst-insremque tst-mntent2 bug-hsearch1 \
++	 tst-mntent-blank-corrupt tst-mntent-blank-passno
+ tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) +=3D tst-error1
+ tests-$(OPTION_EGLIBC_FCVT) +=3D tst-efgcvt
+ ifeq ($(run-built-tests),yes)
+diff --git a/misc/mntent_r.c b/misc/mntent_r.c
+index 6159873..4f26998 100644
+--- a/misc/mntent_r.c
++++ b/misc/mntent_r.c
+@@ -136,7 +136,9 @@ __getmntent_r (FILE *stream, struct mntent *mp, =
char *buffer, int bufsiz)
+       end_ptr =3D strchr (buffer, '\n');
+       if (end_ptr !=3D NULL)	/* chop newline */
+ 	{
+-	  while (end_ptr[-1] =3D=3D ' ' || end_ptr[-1] =3D=3D '\t')
++	  /* Do not walk past the start of buffer if it's all =
whitespace.  */
++	  while (end_ptr !=3D buffer
++		 && (end_ptr[-1] =3D=3D ' ' || end_ptr[-1] =3D=3D '\t'))
+             end_ptr--;
+ 	  *end_ptr =3D '\0';
+ 	}
+diff --git a/misc/tst-mntent-blank-corrupt.c =
b/misc/tst-mntent-blank-corrupt.c
+new file mode 100644
+index 0000000..92266a3
+--- /dev/null
++++ b/misc/tst-mntent-blank-corrupt.c
+@@ -0,0 +1,45 @@
++/* Make sure blank lines does not cause memory corruption BZ #18887.
++
++   Copyright (C) 2009-2015 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be =
useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <mntent.h>
++#include <stdio.h>
++#include <string.h>
++
++/* Make sure blank lines don't trigger memory corruption.  This =
doesn't happen
++   for all targets though, so it's a best effort test BZ #18887.  */
++static int
++do_test (void)
++{
++  FILE *fp;
++
++  fp =3D tmpfile ();
++  fputs ("\n \n/foo\\040dir /bar\\040dir auto bind \t \n", fp);
++  rewind (fp);
++
++  /* The corruption happens here ...  */
++  getmntent (fp);
++  /* ... but trigers here.  */
++  endmntent (fp);
++
++  /* If the test failed, we would crash, and not hit this point.  */
++  return 0;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+diff --git a/misc/tst-mntent-blank-passno.c =
b/misc/tst-mntent-blank-passno.c
+new file mode 100644
+index 0000000..fc04291
+--- /dev/null
++++ b/misc/tst-mntent-blank-passno.c
+@@ -0,0 +1,53 @@
++/* Make sure trailing whitespace is handled properly BZ #17273.
++
++   Copyright (C) 2009-2015 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be =
useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <mntent.h>
++#include <stdio.h>
++#include <string.h>
++
++/* Check entries to make sure trailing whitespace is ignored and we =
return the
++   correct passno value BZ #17273.  */
++static int
++do_test (void)
++{
++  int result =3D 0;
++  FILE *fp;
++  struct mntent *mnt;
++
++  fp =3D tmpfile ();
++  fputs ("/foo\\040dir /bar\\040dir auto bind \t \n", fp);
++  rewind (fp);
++
++  mnt =3D getmntent (fp);
++  if (strcmp (mnt->mnt_fsname, "/foo dir") !=3D 0
++      || strcmp (mnt->mnt_dir, "/bar dir") !=3D 0
++      || strcmp (mnt->mnt_type, "auto") !=3D 0
++      || strcmp (mnt->mnt_opts, "bind") !=3D 0
++      || mnt->mnt_freq !=3D 0
++      || mnt->mnt_passno !=3D 0)
++    {
++      puts ("Error while reading entry with trailing whitespaces");
++      result =3D 1;
++    }
++
++  return result;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+diff --git a/misc/tst-mntent.c b/misc/tst-mntent.c
+index 876c89f..820b354 100644
+--- a/misc/tst-mntent.c
++++ b/misc/tst-mntent.c
+@@ -73,26 +73,6 @@ main (int argc, char *argv[])
+ 	  puts ("Error while reading written entry back in");
+ 	  result =3D 1;
+ 	}
+-
+-      /* Part III: Entry with whitespaces at the end of a line. */
+-      rewind (fp);
+-
+-      fputs ("/foo\\040dir /bar\\040dir auto bind \t \n", fp);
+-
+-      rewind (fp);
+-
+-      mnt =3D getmntent (fp);
+-
+-      if (strcmp (mnt->mnt_fsname, "/foo dir") !=3D 0
+-	  || strcmp (mnt->mnt_dir, "/bar dir") !=3D 0
+-	  || strcmp (mnt->mnt_type, "auto") !=3D 0
+-	  || strcmp (mnt->mnt_opts, "bind") !=3D 0
+-	  || mnt->mnt_freq !=3D 0
+-	  || mnt->mnt_passno !=3D 0)
+-	{
+-	  puts ("Error while reading entry with trailing whitespaces");
+-	  result =3D 1;
+-	}
+    }
+
+   return result;
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb =
b/meta/recipes-core/glibc/glibc_2.22.bb
index e512672..7183f46 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -46,6 +46,7 @@ SRC_URI =3D =
"${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
            file://CVE-2015-9761_1.patch \
            file://CVE-2015-9761_2.patch \
            file://CVE-2015-8776.patch \
+	   file://getmntent-fix-memory-corruption-w-blank-lines.patch \
 "

 SRC_URI +=3D "\
--
1.9.1


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_40810EA0-E630-489C-8189-376F3E909973
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWtHjbAAoJEESZlq7c5QqdeigQAJQ0wXumBBW7OX+Zn124TAgD
yhswmmDmGhEMbyLVUWQSBFiGIAYu9E1vF4ZZ++9U7Itvkpusm1iWKlYATFv/ymrj
s3yhQlh+ano6oQsLvaghxeY2mxEU+x7uFe25+wxJvaYIrsAJgeZy4pEzaAuCTr7X
IZCDtlq21/P7S1OrOeEaHKFOp6gua2aEZVY96XafgovgqpAPan/rI4gKNiYbsvcr
b2oLWLxUt/C66O0by5qi5wgjR4vwcj++3sOoNSKYFZXC3fHny3r87Yg+dscVKxD4
Wm6ZR+EP1QdnqKihuwXte2CDvPfOapgVwjQN5pgSv2PuE4IWDbJjvwQXuzOU8fw9
xqnjvbe71qZIVzGSYF8it1NVfnCTaKj6zPpdxpItShW8VVfaZBoUNU2xklYzIBY3
WF7ab+dCEFEeWkUsLX6j9iEnZP3yFWP+XJci8P1PYWEguBThLrihPmNoZjpXtNvI
0uyQoDivpAHtNAgsmOCX0/3a5lSP/O1IZmvH/a/jiYE+75RlDFkJhQP5COaxY9gr
xRYUsM/WRHqlWLU+fvnwJh6iqitdyqpZ/Q15j8brHbwJweLH1bvUqnn8c6KtZVK/
D1JYjRLEnjd+4ULkkZ7A86/yUa36iIQZlhIFd31PV3Ycwl74DfDvzk13FAEtncmr
u3/jixWsAqEOooPagYV3
=9Sbb
-----END PGP SIGNATURE-----

--Apple-Mail=_40810EA0-E630-489C-8189-376F3E909973--
