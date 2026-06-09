Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769D5CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 11:51:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78032.1781005901911688023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 04:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MkLnpcVF;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490c1915793so36256335e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 04:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781005900; x=1781610700; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRNq3fJ5UKds8SA3UL5ZZ9fI3CKi4IFRrG4nnji5tTk=;
        b=MkLnpcVFVKbEQCEyPq+PIk9SG6c12/0xHIFsJUzS1+uMs6KBgNKScap2vsc8EdTJ55
         5tcMgO5EJdhkG8dDSDv9HCGXZgJVYGYoHJnOr9d+iOTSPEMXrXzeVEpDesuZIzIk6mab
         +5BaH7AVlYEDYP7DSjYKmQj3PqzwS1fIMAmpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005900; x=1781610700;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRNq3fJ5UKds8SA3UL5ZZ9fI3CKi4IFRrG4nnji5tTk=;
        b=dSPSfc0qcHcHz/WD2IBLRffoHxIdCb+lsu6NPx+DWqL/AQ4wuidivVUvjgTbeRYbgM
         TkFjpnasn7yw9g7+bDFc5qqAlw9xb2SCSzOles6LeY+ISVOeaFxfkwM6MHHdANcBaRw7
         xNkNWrihgrVhFyuTp7qjl/m/eDmLeEpZGd4LJ6z0MhZvW3keKnJlJ1wTEzdhsm2oKqd8
         keSzMz8tsvMHfGzgC9+dGPRR7zyFN1cFlh5MrTDUioDODonL6Ex2l7kTVUjHFXTM1POU
         C/ZIWk5w8vyYbemAu4yqHZu+HU3FUeK0rtdTVaB24px2EcY2LLWHufSHpk+y87fW+pY/
         xcAg==
X-Forwarded-Encrypted: i=1; AFNElJ83d4Ykltbe8owhvWYrIBcKwYHoA+jrtNdHL48zQdevPALRr0Imku4sC+oYSCB1Q+ppx3LbXkENvUSuzJnljM46Rg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFCs36tk/1t781vw99vu20O4C7PGM3nAkUDS0HBXv00pOhJ97T
	6rHOM49UaayoWu9UbUeGLqbpY6+23uvMNVYo7u+1SKZFdcCZRFOVcxDtI22BkpMoTw==
X-Gm-Gg: Acq92OFRGeE0IrmhKUOR9jct29esYKgrTBr0K7GIG9f0J9aigzCkmZ2efe57lIzfvqY
	XQ4EIYGsLFhvIpyyYiJOOR9iJP597dEEYE9/zFCaYs/FzdtCQnB12A65p6znEvL26CGO7fIDMzX
	ei8EiwFZX0zptJJnbrAtXXRU5htX9xsfMqz0G6EfwO676ylikpfhHFsySpj5RgLoIIcg1c+6jJ8
	dEICpQqI3fS8QHFgFVRxcaevN1lgX6K/Ta8vDDuBiyKa/VkhPRkWSHnu6jrBdhoWkeoMElt8Rq5
	rGtT7ODWUE4CAf29Qk7UiAbPuC2gGrXbR5zEqvThF66m16KINrXJHGx7LLqvSCkMhysGkTGtQ4e
	wHU3tlsNTZLwiNZWPjDSJ6GTH3Z0vL2XFR0rV79tW9a1MAmgrgCllcCT0aIvCFmrQzgMm70ciqE
	3lS9qh0zK6jH5TJoA2uyCs7T+S3IjUWY9b9yqH3QmfjCiJVSsfckfjoNLf+WjpfhRewrNfj2fgG
	m77Exo8s+BHPggj17VXYh+9gj4jz6Q=
X-Received: by 2002:a05:600c:3e0d:b0:490:a1dc:e542 with SMTP id 5b1f17b1804b1-490c25afe6bmr319501075e9.6.1781005900203;
        Tue, 09 Jun 2026 04:51:40 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm505212515e9.12.2026.06.09.04.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:51:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 13:51:39 +0200
Message-Id: <DJ4HWF2UB239.3QGU828HRDIIQ@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] libgcrypt: upgrade 1.10.3 ->
 1.10.4
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
To: <gudni.m.g@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260514133022.56169-1-gudni.m.g@gmail.com>
In-Reply-To: <20260514133022.56169-1-gudni.m.g@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 11:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238292

Hello  Gu=C3=B0ni

I tried to apply this patch but it broke the autobuild with a
compilation error

see
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3952
for an example of a failed build.

I am a bit suprised that a stable upgrade of a library would make nos
#error trigger at compilation time. I would be interested in any
investigation with that

for the time being I will drop this patch for scarthgap, please resubmit
once the compilation error is fixed

Regards
J=C3=A9r=C3=A9my=20

On Thu May 14, 2026 at 3:30 PM CEST, Gu=C3=B0ni M=C3=A1r Gilbert via lists.=
openembedded.org wrote:
> Fixes CVE-2026-41989
>
> Full changelog:
> https://github.com/gpg/libgcrypt/compare/libgcrypt-1.10.3...libgcrypt-1.1=
0.4
>
> Noteworthy changes in version 1.10.4 (2026-04-21)  [C24/A4/R4]
> -------------------------------------------------
>
>  * Bug fixes:
>    - Fix possible ECDH buffer overwrite with zeroes.  [T8211]
>    - Fix AESWRAP padding length check.  [T7130]
>
>  * Other:
>    - Handle HAVE_BROKEN_MLOCK for the case of building with ASAN.
>      [T7889]
>
>  Release-info: https://dev.gnupg.org/T8233
>
> CVE: CVE-2026-41989
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ---
>  ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
>  ...01-libgcrypt-fix-m4-file-for-oe-core.patch |  3 +-
>  ...m-fix-undefined-reference-to-pthread.patch |  9 ++-
>  .../libgcrypt/files/no-bench-slope.patch      | 12 +++-
>  .../libgcrypt/files/no-native-gpg-error.patch | 10 ++-
>  ...ibgcrypt_1.10.3.bb =3D> libgcrypt_1.10.4.bb} |  3 +-
>  6 files changed, 25 insertions(+), 76 deletions(-)
>  delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-buildin=
g-error-with-O2-in-sysroot-path.patch
>  rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb =3D> libgcryp=
t_1.10.4.bb} (92%)
>
> diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error=
-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-=
Fix-building-error-with-O2-in-sysroot-path.patch
> deleted file mode 100644
> index dee4969f35..0000000000
> --- a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O=
2-in-sysroot-path.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From b99952adc6ee611641709610d2e4dc90ba9acf37 Mon Sep 17 00:00:00 2001
> -From: "simit.ghane" <simit.ghane@lge.com>
> -Date: Tue, 7 May 2024 14:09:03 +0530
> -Subject: [PATCH] Fix building error with '-O2' in sysroot path
> -
> -* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
> -* random/Makefile.am (o_flag_munging): Ditto.
> ---
> -
> -Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
> -respectively when compiling cipher and random in the filesystem
> -paths as well if they happen to contain '-O2' or '-Ofast
> -
> -If we are cross compiling libgcrypt and sysroot contains such
> -characters, we would
> -get compile errors because the sysroot path has been modified.
> -
> -Fix this by adding blank spaces and tabs before the original matching
> -pattern in the sed command.
> -
> -Signed-off-by: simit.ghane <simit.ghane@lge.com>
> -
> -ChangeLog entries added by wk
> -
> -Note that there is also the configure option --disable-O-flag-munging;
> -see the README.
> -
> -Upstream-Status: Backport [https://dev.gnupg.org/rCb99952adc6ee611641709=
610d2e4dc90ba9acf37 https://dev.gnupg.org/rC5afadba008918d651afefb842ae123c=
c18454c74]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - cipher/Makefile.am | 2 +-
> - random/Makefile.am | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> -index 2c39586e..a914ed2b 100644
> ---- a/cipher/Makefile.am
> -+++ b/cipher/Makefile.am
> -@@ -168,7 +168,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
> -=20
> -=20
> - if ENABLE_O_FLAG_MUNGING
> --o_flag_munging =3D sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast=
/-O1/g'
> -+o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g=
' -e 's/[[:blank:]]-Ofast/ -O1 /g'
> - else
> - o_flag_munging =3D cat
> - endif
> -diff --git a/random/Makefile.am b/random/Makefile.am
> -index 0c935a05..340df38a 100644
> ---- a/random/Makefile.am
> -+++ b/random/Makefile.am
> -@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-bas=
e-user.h
> -=20
> - # The rndjent module needs to be compiled without optimization.  */
> - if ENABLE_O_FLAG_MUNGING
> --o_flag_munging =3D sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofas=
t/-O0/g'
> -+o_flag_munging =3D sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g=
' -e 's/[[:blank:]]-Ofast/ -O0 /g'
> - else
> - o_flag_munging =3D cat
> - endif
> ---=20
> -2.44.1
> -
> diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-f=
ile-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt=
-fix-m4-file-for-oe-core.patch
> index cbfa30f0ad..9206453d2a 100644
> --- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for=
-oe-core.patch
> +++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for=
-oe-core.patch
> @@ -1,4 +1,4 @@
> -From bcfd89abdb5110b93314297120412d4c7f2da313 Mon Sep 17 00:00:00 2001
> +From 17f9b99ec4d6db91180ed39641f27a7c66cfb412 Mon Sep 17 00:00:00 2001
>  From: Trevor Gamblin <trevor.gamblin@windriver.com>
>  Date: Tue, 29 Oct 2019 14:08:32 -0400
>  Subject: [PATCH] libgcrypt: fix m4 file for oe-core
> @@ -11,7 +11,6 @@ settings.
>  Upstream-Status: Inappropriate [oe-specific]
> =20
>  Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> -
>  ---
>   src/libgcrypt.m4 | 90 +++---------------------------------------------
>   1 file changed, 4 insertions(+), 86 deletions(-)
> diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-=
fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/f=
iles/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> index 4233fa7877..daf4d30b1f 100644
> --- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-und=
efined-reference-to-pthread.patch
> +++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-und=
efined-reference-to-pthread.patch
> @@ -1,4 +1,4 @@
> -From 9182bc2dc676858a823c477d8f45a578b8c4f69f Mon Sep 17 00:00:00 2001
> +From df905c6d2fcd5a8044e3ec9fcd5082b764540dd9 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Sun, 12 Jun 2016 04:44:29 -0400
>  Subject: [PATCH] tests/Makefile.am: fix undefined reference to
> @@ -9,16 +9,15 @@ Add missing '-lpthread' to CFLAGS
>  Upstream-Status: Pending
> =20
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
>  ---
>   tests/Makefile.am | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> =20
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index e6953fd..f47e1d3 100644
> +index 302d923..b302ad5 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -76,7 +76,7 @@ t_mpi_bit_LDADD =3D $(standard_ldadd) @LDADD_FOR_TESTS=
_KLUDGE@
> +@@ -87,7 +87,7 @@ t_mpi_bit_LDADD =3D $(standard_ldadd) @LDADD_FOR_TESTS=
_KLUDGE@
>   t_secmem_LDADD =3D $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
>   testapi_LDADD =3D $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
>   t_lock_LDADD =3D $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TEST=
S_KLUDGE@
> @@ -27,7 +26,7 @@ index e6953fd..f47e1d3 100644
>   testdrv_LDADD =3D $(LDADD_FOR_TESTS_KLUDGE)
>  =20
>   # Build a version of the test driver for the build platform.
> -@@ -95,7 +95,7 @@ else
> +@@ -106,7 +106,7 @@ else
>   xtestsuite_libs =3D ../src/.libs/libgcrypt.so*
>   xtestsuite_driver =3D testdrv
>   t_kdf_LDADD =3D $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS=
_KLUDGE@
> diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/=
meta/recipes-support/libgcrypt/files/no-bench-slope.patch
> index 8de3c6713b..0a8eb56f10 100644
> --- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
> +++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
> @@ -1,3 +1,8 @@
> +From 164870c01911c48a8f0ea4e93bff1f05ff5c13ca Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Fri, 9 Sep 2022 11:13:37 +0100
> +Subject: [PATCH] libgcrypt: disable bench-slope test case
> +
>  The bench-slope test appears to be aborting fairly frequently, which cau=
ses
>  failures on the autobuilder.
> =20
> @@ -5,12 +10,15 @@ Until this has been root-caused, disable the test.
> =20
>  Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + tests/testdrv.c | 1 -
> + 1 file changed, 1 deletion(-)
> =20
>  diff --git a/tests/testdrv.c b/tests/testdrv.c
> -index 0ccde326..d3455186 100644
> +index 6d6abd5..d345518 100644
>  --- a/tests/testdrv.c
>  +++ b/tests/testdrv.c
> -@@ -77,7 +77,6 @@ static struct {
> +@@ -76,7 +76,6 @@ static struct {
>      { "t-x448"      },
>      { "t-ed448"     },
>      { "benchmark"   },
> diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.pat=
ch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
> index b9a607863d..c6b40b04b5 100644
> --- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
> +++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
> @@ -1,11 +1,19 @@
> +From dedc54234af84503de085e5b04f2bfe2d5ec63b3 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Fri, 26 Aug 2022 15:23:37 +0100
> +Subject: [PATCH] libgcrypt: rewrite ptest
> +
>  Don't depend on a native libgpg-error to build the test driver, as it's
>  an optional dependency for some C annotations.
> =20
>  Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + tests/testdrv.c | 1 -
> + 1 file changed, 1 deletion(-)
> =20
>  diff --git a/tests/testdrv.c b/tests/testdrv.c
> -index 0ccde326..6d6abd57 100644
> +index 0ccde32..6d6abd5 100644
>  --- a/tests/testdrv.c
>  +++ b/tests/testdrv.c
>  @@ -32,7 +32,6 @@
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.4.bb
> similarity index 92%
> rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
> rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
> index 3d49d586bb..a3b5bd06cc 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
> @@ -25,9 +25,8 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.=
tar.bz2 \
>             file://no-native-gpg-error.patch \
>             file://no-bench-slope.patch \
>             file://run-ptest \
> -           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch =
\
>             "
> -SRC_URI[sha256sum] =3D "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60a=
f2a9eadc2a3272aa"
> +SRC_URI[sha256sum] =3D "d6d2f835a79711ceba54b53d1081d388d24fb0341d79a268=
a6557e12908a90a0"
> =20
>  BINCONFIG =3D "${bindir}/libgcrypt-config"
> =20


