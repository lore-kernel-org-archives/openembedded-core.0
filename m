Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C22C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 17:11:55 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26139.1782839511050262035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 10:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X9vvtiIf;
 spf=pass (domain: mvista.com, ip: 209.85.218.42, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c08acccf4a4so667163866b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782839509; cv=none;
        d=google.com; s=arc-20260327;
        b=IupfTcwnKToe/A3vdsQSPdN7Dc71gtOlTaNMUB9zbmbeJiWxfHVovhnJrQRHKqcyao
         NOYlM3h8ql7glK0y9mHQwM/8z8wVsud+jQ7qud2d4LtK4PgGNrINgPCoHjQQEZ2YmFqi
         mIj+pRvq/AbzSpfzOovzAqkp1YvX7vSiDWlJq+gIs+bvutrHMQQ/ScaZ1wlyuhvh7cEn
         Zn096p9J+DlMAENpUce0iFHIhjrPW6T9s3ZUy51ZSTjLy3dju/O1uVjmkfw0rAYbh/Aw
         Lcln/Lm/yMH4j6mmPxI8f03Tevwt08Ginu4oAphGMbpljByx+/rMKLV6f03chsIesQs6
         7Nxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u77ejUNo6KZxy+B3uPnQnSZxoXgU8tufYzbEXT5JLL8=;
        fh=N647RZAEAq0QEJ6mmY353qVQ3BU40Lxqmqa1Uk4oRhw=;
        b=g9m2xSXuz3JAKffQbdKKGgvrAkxMeeWPXCbzpD35vyg6hfXKRYAMs3D4tdA14Z9dj5
         Hk/RWSUbC0HmBH+zB0W6V0vpy+fuaaW9kAJRjiInh1stjPEaTm0Huc6CUWi3g3fPn3sA
         hhEF4STiqRKqheAcRsadYIH+ncU+6xI8KtySB3T1fQB8LTcycdEknNFaTgJ6AFTsERjK
         VCDb9qFIfF/XC1fu5ZcroXQd6zLCweAF9wtwWTccaFp3bRA461fQM4LJe8wQd2Lls6zY
         PcwYwcBM/x3okGYlLPqC3ZzWzhw2/AEexOFSeyOr29XC1wrzXVJWzgOy70zLrXi8+DvL
         DWGw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782839509; x=1783444309; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u77ejUNo6KZxy+B3uPnQnSZxoXgU8tufYzbEXT5JLL8=;
        b=X9vvtiIfJ3WqC+75U5oobGB3kZR5dN26V3PtcfGY1N7XZB3ZY29gUboK693vYFEqGK
         qQljrFXcfRCh2J/tjMtK3YB5m+G1mLZULVW9gdHLH8qg4/6v90TZoflp/1pGd5DLL4oY
         ExQT+ar8qA78Syu0UsTXCm2rKDWtTiEO08MuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839509; x=1783444309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u77ejUNo6KZxy+B3uPnQnSZxoXgU8tufYzbEXT5JLL8=;
        b=mZzRM5ZKZnY6IJib5kxY5gkTh8+ynzGed4IKnccZAEj4aRdHH8QtExkEYxRX0Byrp3
         venefk2An9Zggi7qacHcuEpQ97C0eh4o+qXmvCW67j8+yc11cRhp1PwoDjqdgKzlfSf8
         pcT4NTOXfvGkUmWrxRgo4xuOI7q+1hDdHQBa2h1JYD7T5NFAppIGLBf8wupCL6r60AwD
         9V3pWZRuoQWIRE6gMAirkFuVnBWLDzd4nuT7PelNffG2zS6ZMx+y99zlaUuJNvAJg1c7
         TWNwVYJhD5VkVgKsgkSoOp9DT3Y/NtBAmZL++mo+26eIZhJ6kb1V9Uj0/XnRMyXKPCAQ
         gTCA==
X-Gm-Message-State: AOJu0YzvnmsC4MhJdQ3LcXco0Y4dmXHC04nwdp9LfLrCiJOpsnI0eSEl
	fXb7f3COPkJvMtjuFKYwRIGc7RZlwZDOK+A1JUfqi1DmaCsFdqmgrVHx8r3D0uxC59wQ/BCWIVa
	EIZug37LidyTpFC4r5MZSg3mkdVhETp3g1tXx2awsYXDMJN3yhxXxQfA=
X-Gm-Gg: AfdE7cmPYHCQ9rvPFnQw++DL1utxdFdt9Xfz10J3LDQHkAx9jqh4kZbyGWbbAOMwwLf
	C0bwsMK+3vldlsFPT4IMtcTjx+RiFOT9btmEPe5HxILIRnZ14dC8lHCrdlKLQ8Q7wmbotdydOCy
	YchiHjbdNgU8YA/ekQMQIic4H51FNf7cq55eOKxeqUcRylSVTnQjTgnhgvw5f3HPzYMfXXCiyAh
	8A8ktoi9D/4n2ZhGchHjCKaGd8iP4L815r0mi8obkJpiis6c1aHanSYicGa26ZCJd0suF8GlMJA
	hlh3zVUdLrHv45/UBp97US2V2o0Gp0g=
X-Received: by 2002:a17:907:c24:b0:c12:63d6:d287 with SMTP id
 a640c23a62f3a-c12872f5a77mr214700966b.42.1782839508901; Tue, 30 Jun 2026
 10:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260629071648.1471849-1-vanusuri@mvista.com>
In-Reply-To: <20260629071648.1471849-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 30 Jun 2026 22:41:37 +0530
X-Gm-Features: AVVi8CdXLSHj5lV46L76eBvMkKFTg8haxuGbpcTT2v96KYw2hIdvDsjJ0BO7ico
Message-ID: <CANQUz1-0nv9S0QiempdvvcuxUwS2OMY14d=NjPhgvMp18vUMXA@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch] gnutls: upgrade 3.8.12 -> 3.8.13
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000009eb6ee06557babeb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 17:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239910

--0000000000009eb6ee06557babeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Any update on this ?

Thanks & Regards,
Vijay

On Mon, Jun 29, 2026 at 12:46=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com=
> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
> CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
> CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
> CVE-2026-5419.
>
> Release notes: [1]
>
> Rebase patches and drop patch included in this release.
> Add patches to fix linking with musl libc.
> Increase memory needed to successfully run test key-openssl.
> Drop code for previous release tarball problem.
>
> [1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-core/images/core-image-ptest.bb  |  1 +
>  ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++
>  ...ust-list-fault-fix-issues-in-linking.patch | 31 ++++++++++++++
>  .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
>  meta/recipes-support/gnutls/gnutls/c99.patch  | 41 -------------------
>  .../{gnutls_3.8.12.bb =3D> gnutls_3.8.13.bb}    |  9 ++--
>  6 files changed, 62 insertions(+), 49 deletions(-)
>  create mode 100644
> meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-=
gnulib.patch
>  create mode 100644
> meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix=
-issues-in-linking.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
>  rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb =3D> gnutls_3.8.13.=
bb}
> (93%)
>
> diff --git a/meta/recipes-core/images/core-image-ptest.bb
> b/meta/recipes-core/images/core-image-ptest.bb
> index c08561296f..008b5770a8 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -39,6 +39,7 @@ QB_MEM:virtclass-mcextend-python3 =3D "-m 2048"
>  QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 5100"
>  QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"
>  QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
> +QB_MEM:virtclass-mcextend-gnutls =3D "-m 1536"
>
>  TEST_SUITES =3D "ping ssh parselogs ptest"
>
> diff --git
> a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-t=
o-gnulib.patch
> b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-t=
o-gnulib.patch
> new file mode 100644
> index 0000000000..7f999c4b22
> --- /dev/null
> +++
> b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-t=
o-gnulib.patch
> @@ -0,0 +1,25 @@
> +From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Thu, 30 Apr 2026 13:08:01 +0200
> +Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +
> +Upstream-Status: Backport [
> https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f=
4910c01
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + tests/Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index f8797964d..1b27df751 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \
> + mini_dtls_fragments_CPPFLAGS =3D $(AM_CPPFLAGS) \
> +       -I$(top_srcdir)/gl      \
> +       -I$(top_builddir)/gl
> ++mini_dtls_fragments_LDADD =3D $(LDADD) ../gl/libgnu.la
> +
> + if ENABLE_PKCS11
> + if !WINDOWS
> diff --git
> a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-f=
ix-issues-in-linking.patch
> b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-f=
ix-issues-in-linking.patch
> new file mode 100644
> index 0000000000..b15a05d5b6
> --- /dev/null
> +++
> b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-f=
ix-issues-in-linking.patch
> @@ -0,0 +1,31 @@
> +From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001
> +From: Daiki Ueno <ueno@gnu.org>
> +Date: Thu, 7 May 2026 09:42:09 +0900
> +Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking
> +
> +This fixes the use of automake variables and also adds the linked mock
> +library in .gitignore.
> +
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +
> +Upstream-Status: Backport [
> https://github.com/gnutls/gnutls/commit/9c573a2a0e7473ab79c43a6d3ecb0ab68=
ce896dc
> ]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + tests/Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 1b27df751..f6a60a32b 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES =3D libpkcs11mock4=
.la
> libutils.la
> + pkcs11_os_locking_ok_LDADD =3D $(LDADD) $(LIBDL)
> + pkcs11_long_label_DEPENDENCIES =3D libpkcs11mock4.la libutils.la
> + pkcs11_long_label_LDADD =3D $(LDADD) $(LIBDL)
> +-pkcs11_trust_fault_DEPENDENCIES =3D libpkcs11mock5.la libutils.la
> +-pkcs11_trust_fault_LDADD =3D $(LDADD) $(LIBDL)
> ++pkcs11_trust_list_fault_DEPENDENCIES =3D libpkcs11mock5.la libutils.la
> ++pkcs11_trust_list_fault_LDADD =3D $(LDADD) $(LIBDL)
> + endif
> + endif
> +
> diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> index 398c0464e0..8c867a5a40 100644
> --- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> +++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> @@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
>  index 1744813..efb9e34 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
> +@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
>
>   AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" =3D "yes")
>
> @@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
>  index 189d068..8430b05 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -721,6 +721,12 @@ SH_LOG_COMPILER =3D $(SHELL)
> +@@ -745,6 +745,12 @@ SH_LOG_COMPILER =3D $(SHELL)
>   AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
>   LOG_COMPILER =3D $(LOG_VALGRIND)
>
> diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch
> b/meta/recipes-support/gnutls/gnutls/c99.patch
> deleted file mode 100644
> index 3f41241deb..0000000000
> --- a/meta/recipes-support/gnutls/gnutls/c99.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Thu, 5 Mar 2026 11:33:57 +0000
> -Subject: [PATCH] configure: make the C99 detection more resiliant
> -
> -autoconf 2.73 will default to C23 by default, which means that the >C99
> -detection logic in configure.ac will fail because it only handles c11
> -and c99.
> -
> -Instead of adding c23 to the list and then breaking again in the future,
> -flip the logic around (as suggested by Zack Weinberg) and check
> -explicitly for just c89.
> -
> -Closes #1806.
> -
> -Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/merge_requests/2081]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - configure.ac | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 740fb6339..c708d8f5e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS
> - # Require C99 support
> - #
> - AS_CASE([$ac_prog_cc_stdc],
> --  [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])]=
,
> --  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to
> compile the project.]])]
> --)
> -+  [c89],
> -+  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to
> compile the project.]])],
> -+  [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])
> -
> - AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" =3D yes)
> -
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
> similarity index 93%
> rename from meta/recipes-support/gnutls/gnutls_3.8.12.bb
> rename to meta/recipes-support/gnutls/gnutls_3.8.13.bb
> index 8554ab943d..943864d4ba 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
> @@ -23,10 +23,11 @@ SRC_URI =3D "
> https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>
> file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
>             file://run-ptest \
>             file://Add-ptest-support.patch \
> -           file://c99.patch \
> +
>  file://0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch \
> +           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
> +SRC_URI[sha256sum] =3D
> "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e"
>
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
>
> @@ -63,10 +64,6 @@ do_configure:prepend() {
>         for dir in . lib; do
>                 rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4
> ${dir}/m4/lt*.m4
>         done
> -
> -       # remove on next upgrade when release tarball gets fixed
> -       # https://gitlab.com/gnutls/gnutls/-/issues/1797
> -       cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
>  }
>
>  do_compile_ptest() {
> --
> 2.43.0
>
>

--0000000000009eb6ee06557babeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Yoann,<br><br></div>Any update on this ?=
<br><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Jun 29, 2026 at 12:46=E2=80=AFPM Vijay Anusuri &lt;<a href=3D"mai=
lto:vanusuri@mvista.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=
=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.c=
om</a>&gt;<br>
<br>
Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,<br>
CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,<br>
CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and<br>
CVE-2026-5419.<br>
<br>
Release notes: [1]<br>
<br>
Rebase patches and drop patch included in this release.<br>
Add patches to fix linking with musl libc.<br>
Increase memory needed to successfully run test key-openssl.<br>
Drop code for previous release tarball problem.<br>
<br>
[1] <a href=3D"https://github.com/gnutls/gnutls/blob/3.8.13/NEWS" rel=3D"no=
referrer" target=3D"_blank">https://github.com/gnutls/gnutls/blob/3.8.13/NE=
WS</a><br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-b=
riand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&=
gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb" rel=
=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a>=C2=A0 |=C2=A0 1 +=
<br>
=C2=A0...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++<br>
=C2=A0...ust-list-fault-fix-issues-in-linking.patch | 31 ++++++++++++++<br>
=C2=A0.../gnutls/gnutls/Add-ptest-support.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 +-<br>
=C2=A0meta/recipes-support/gnutls/gnutls/c99.patch=C2=A0 | 41 -------------=
------<br>
=C2=A0.../{<a href=3D"http://gnutls_3.8.12.bb" rel=3D"noreferrer" target=3D=
"_blank">gnutls_3.8.12.bb</a> =3D&gt; <a href=3D"http://gnutls_3.8.13.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.13.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 9 ++--<br>
=C2=A06 files changed, 62 insertions(+), 49 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini=
-dtls-framents-link-to-gnulib.patch<br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs=
11-trust-list-fault-fix-issues-in-linking.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch<br>
=C2=A0rename meta/recipes-support/gnutls/{<a href=3D"http://gnutls_3.8.12.b=
b" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.12.bb</a> =3D&gt; <a hre=
f=3D"http://gnutls_3.8.13.bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3=
.8.13.bb</a>} (93%)<br>
<br>
diff --git a/meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb=
" rel=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a> b/meta/recip=
es-core/images/<a href=3D"http://core-image-ptest.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">core-image-ptest.bb</a><br>
index c08561296f..008b5770a8 100644<br>
--- a/meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb" rel=
=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a><br>
+++ b/meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb" rel=
=3D"noreferrer" target=3D"_blank">core-image-ptest.bb</a><br>
@@ -39,6 +39,7 @@ QB_MEM:virtclass-mcextend-python3 =3D &quot;-m 2048&quot;=
<br>
=C2=A0QB_MEM:virtclass-mcextend-python3-cryptography =3D &quot;-m 5100&quot=
;<br>
=C2=A0QB_MEM:virtclass-mcextend-python3-numpy =3D &quot;-m 4096&quot;<br>
=C2=A0QB_MEM:virtclass-mcextend-tcl =3D &quot;-m 5100&quot;<br>
+QB_MEM:virtclass-mcextend-gnutls =3D &quot;-m 1536&quot;<br>
<br>
=C2=A0TEST_SUITES =3D &quot;ping ssh parselogs ptest&quot;<br>
<br>
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framen=
ts-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-min=
i-dtls-framents-link-to-gnulib.patch<br>
new file mode 100644<br>
index 0000000000..7f999c4b22<br>
--- /dev/null<br>
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link=
-to-gnulib.patch<br>
@@ -0,0 +1,25 @@<br>
+From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001<br>
+From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" targe=
t=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
+Date: Thu, 30 Apr 2026 13:08:01 +0200<br>
+Subject: [PATCH] tests/mini-dtls-framents: link to gnulib<br>
+<br>
+Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.c=
om" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/gnutls/gnutls/com=
mit/68b2fb63c8df61d1480121a859f8c955f4910c01" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f=
8c955f4910c01</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ tests/Makefile.am | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
+index f8797964d..1b27df751 100644<br>
+--- a/tests/Makefile.am<br>
++++ b/tests/Makefile.am<br>
+@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \<br>
+ mini_dtls_fragments_CPPFLAGS =3D $(AM_CPPFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)/gl=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(top_builddir)/gl<br>
++mini_dtls_fragments_LDADD =3D $(LDADD) ../gl/<a href=3D"http://libgnu.la"=
 rel=3D"noreferrer" target=3D"_blank">libgnu.la</a><br>
+ <br>
+ if ENABLE_PKCS11<br>
+ if !WINDOWS<br>
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-lis=
t-fault-fix-issues-in-linking.patch b/meta/recipes-support/gnutls/gnutls/00=
01-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch<br>
new file mode 100644<br>
index 0000000000..b15a05d5b6<br>
--- /dev/null<br>
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault=
-fix-issues-in-linking.patch<br>
@@ -0,0 +1,31 @@<br>
+From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001<br>
+From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_blank">uen=
o@gnu.org</a>&gt;<br>
+Date: Thu, 7 May 2026 09:42:09 +0900<br>
+Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking<br>
+<br>
+This fixes the use of automake variables and also adds the linked mock<br>
+library in .gitignore.<br>
+<br>
+Signed-off-by: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_b=
lank">ueno@gnu.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/gnutls/gnutls/com=
mit/9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/gnutls/gnutls/commit/9c573a2a0e7473ab79c43a6d3ec=
b0ab68ce896dc</a>]<br>
+Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
+---<br>
+ tests/Makefile.am | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
+index 1b27df751..f6a60a32b 100644<br>
+--- a/tests/Makefile.am<br>
++++ b/tests/Makefile.am<br>
+@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES =3D <a href=3D"http:=
//libpkcs11mock4.la" rel=3D"noreferrer" target=3D"_blank">libpkcs11mock4.la=
</a> <a href=3D"http://libutils.la" rel=3D"noreferrer" target=3D"_blank">li=
butils.la</a><br>
+ pkcs11_os_locking_ok_LDADD =3D $(LDADD) $(LIBDL)<br>
+ pkcs11_long_label_DEPENDENCIES =3D <a href=3D"http://libpkcs11mock4.la" r=
el=3D"noreferrer" target=3D"_blank">libpkcs11mock4.la</a> <a href=3D"http:/=
/libutils.la" rel=3D"noreferrer" target=3D"_blank">libutils.la</a><br>
+ pkcs11_long_label_LDADD =3D $(LDADD) $(LIBDL)<br>
+-pkcs11_trust_fault_DEPENDENCIES =3D <a href=3D"http://libpkcs11mock5.la" =
rel=3D"noreferrer" target=3D"_blank">libpkcs11mock5.la</a> <a href=3D"http:=
//libutils.la" rel=3D"noreferrer" target=3D"_blank">libutils.la</a><br>
+-pkcs11_trust_fault_LDADD =3D $(LDADD) $(LIBDL)<br>
++pkcs11_trust_list_fault_DEPENDENCIES =3D <a href=3D"http://libpkcs11mock5=
.la" rel=3D"noreferrer" target=3D"_blank">libpkcs11mock5.la</a> <a href=3D"=
http://libutils.la" rel=3D"noreferrer" target=3D"_blank">libutils.la</a><br=
>
++pkcs11_trust_list_fault_LDADD =3D $(LDADD) $(LIBDL)<br>
+ endif<br>
+ endif<br>
+ <br>
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/m=
eta/recipes-support/gnutls/gnutls/Add-ptest-support.patch<br>
index 398c0464e0..8c867a5a40 100644<br>
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch<br>
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch<br>
@@ -29,7 +29,7 @@ diff --git a/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac"=
 rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
=C2=A0index 1744813..efb9e34 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)<br>
+@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)<br>
<br>
=C2=A0 AM_CONDITIONAL(NEEDS_LIBRT, test &quot;$gnutls_needs_librt&quot; =3D=
 &quot;yes&quot;)<br>
<br>
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
=C2=A0index 189d068..8430b05 100644<br>
=C2=A0--- a/tests/Makefile.am<br>
=C2=A0+++ b/tests/Makefile.am<br>
-@@ -721,6 +721,12 @@ SH_LOG_COMPILER =3D $(SHELL)<br>
+@@ -745,6 +745,12 @@ SH_LOG_COMPILER =3D $(SHELL)<br>
=C2=A0 AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrin=
d<br>
=C2=A0 LOG_COMPILER =3D $(LOG_VALGRIND)<br>
<br>
diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-su=
pport/gnutls/gnutls/c99.patch<br>
deleted file mode 100644<br>
index 3f41241deb..0000000000<br>
--- a/meta/recipes-support/gnutls/gnutls/c99.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
-Date: Thu, 5 Mar 2026 11:33:57 +0000<br>
-Subject: [PATCH] configure: make the C99 detection more resiliant<br>
-<br>
-autoconf 2.73 will default to C23 by default, which means that the &gt;C99=
<br>
-detection logic in <a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> will fail because it only handles c11<br>
-and c99.<br>
-<br>
-Instead of adding c23 to the list and then breaking again in the future,<b=
r>
-flip the logic around (as suggested by Zack Weinberg) and check<br>
-explicitly for just c89.<br>
-<br>
-Closes #1806.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutls/-/m=
erge_requests/2081" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com=
/gnutls/gnutls/-/merge_requests/2081</a>]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 6 +++---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 740fb6339..c708d8f5e 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS<br>
- # Require C99 support<br>
- #<br>
- AS_CASE([$ac_prog_cc_stdc],<br>
--=C2=A0 [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported=
])],<br>
--=C2=A0 [AC_MSG_WARN([[Compiler does not support C99. It may not be able t=
o compile the project.]])]<br>
--)<br>
-+=C2=A0 [c89],<br>
-+=C2=A0 [AC_MSG_WARN([[Compiler does not support C99. It may not be able t=
o compile the project.]])],<br>
-+=C2=A0 [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])<br>
- <br>
- AM_CONDITIONAL(CROSS_COMPILING, test &quot;$cross_compiling&quot; =3D yes=
)<br>
- <br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.12.bb=
" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.12.bb</a> b/meta/recipes-=
support/gnutls/<a href=3D"http://gnutls_3.8.13.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gnutls_3.8.13.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.12.bb</a><br>
rename to meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.13.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.13.bb</a><br>
index 8554ab943d..943864d4ba 100644<br>
--- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.12.bb" rel=
=3D"noreferrer" target=3D"_blank">gnutls_3.8.12.bb</a><br>
+++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.13.bb" rel=
=3D"noreferrer" target=3D"_blank">gnutls_3.8.13.bb</a><br>
@@ -23,10 +23,11 @@ SRC_URI =3D &quot;<a href=3D"https://www.gnupg.org/ftp/=
gcrypt/gnutls/v$%7BSHRT_VER%7D/gnutls-$%7BPV%7D.tar" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-=
${PV}.tar</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Creating-.hmac-file-s=
hould-be-excuted-in-target-envi.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Add-ptest-support.patch \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://c99.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-pkcs11-trust-li=
st-fault-fix-issues-in-linking.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-mini-dtls-frame=
nts-link-to-gnulib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd79=
2b2bf470bea012b8e51&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ffed8ec1bf09c2426d4f14aae377de4753b53e537d685=
e604e99a8b16ca9c97e&quot;<br>
<br>
=C2=A0inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest=
<br>
<br>
@@ -63,10 +64,6 @@ do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in . lib; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${dir}/acloca=
l.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# remove on next upgrade when release tarball g=
ets fixed<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://gitlab.com/gnutls/gnutls/-=
/issues/1797" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/gnutl=
s/gnutls/-/issues/1797</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error=
_codes<br>
=C2=A0}<br>
<br>
=C2=A0do_compile_ptest() {<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--0000000000009eb6ee06557babeb--

