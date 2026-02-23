Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE30DE98DF6
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 08:01:33 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31267.1771833689209872913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 00:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MV60OMdD;
 spf=pass (domain: mvista.com, ip: 209.85.218.43, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8fa449e618so638185266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 00:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771833687; cv=none;
        d=google.com; s=arc-20240605;
        b=UPr065u612Tcmh2l++honD4AypvnZmKv0qmUE/sLunXOBbjroT5BhcZA79/FGUypJA
         g6UyBpyMOAUMVhzEoqOVrDVhDiIZEWnLNYIjlEB3vm/3lotQR6ZGUxXwn7/JMET0TYpH
         /j7GPyAE1+3BzR/DTltsqpEe0fwrj15b6NdBT7XJbcwzXe0PdoVpRksN4U8UZVpWkX5n
         UcfK5dBC2B+VprygEW9bPIvwZvQdazCjvTjh27F3uRQv2zHj+4H1kimy/lsKt+QVfNnR
         knopwNYOGTnJkz1JTlaxr4eBOKWEd5x4EDxdXV4M1PPWsB4sZ31QVRpzJcE4Qa2MkoQk
         6ETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SRDkIcI71D2IQYMY7Gby76suMZUo9XvOMFwu8PP3SG8=;
        fh=FPDICK+H57LCAtuxOr07gylTD6AKuEqmn4EHk7h25xE=;
        b=XalwKXgIpg/ZS0cAffVnk/WtFjXaTo9fyR+GscwCoqP764AJTrneQWKbERzGbUSfcy
         k6WFBjPU+gY0sRA0TMfLj4eG7HqtmI9OJpsS8cl6wzahNY9upVzkWrQqJYjtK836QHPd
         ek8FcxgI6C7Dgroj8Lwf2L3zEOwBqmABQUnT9PKheE+bZqh+6z3fjg14xlzOTre4Z2oW
         U07CiUJN7fV+raceybp4yYIHQhQbq4muctZ2C1q81vhnVymJ+GYRpwf2pNEjObul4l8s
         09wcS4haUxNywvmbanlTmqNvnaROoY4fQZTmFHJYuJZs6noVJdsVFOa4mW0G9ej5sXvw
         Yguw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771833687; x=1772438487; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SRDkIcI71D2IQYMY7Gby76suMZUo9XvOMFwu8PP3SG8=;
        b=MV60OMdD+UrX341kawRH7tT9BuprEK4+ACok6tYg5GuCpYrAQ9DhmYWuTentFRFN05
         S+MEBODVnhTgt8UzAzHRWC+2qRmi+H8gyNMsf8ERGy4wJWuk3q40WAqUtoqlFRChxdst
         4L6HxZ95YNTEBAY0QV6fdxcNdPKQlYFONLmW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771833687; x=1772438487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRDkIcI71D2IQYMY7Gby76suMZUo9XvOMFwu8PP3SG8=;
        b=RckVYnGh8GrdqCvgPR+0hbFAI2yPh2gMRI42t3d03wBuNaNp3PNuEkKo9Co+8Mq3wV
         WBaHBxNqB0112qWOIYmIpkHGImWl7FsezemLqSLQRcCQfDzYh7pSI+iXIpNXyP6V6Kga
         NerAP1USbZUpD06aPM5M1fLj2nuprH7+ANHdiLVqJ2A+JkLVUTbRECad/URKkPSoeA22
         VZgbzKReI5QJuVntXxJnRAQSp151x3v+ewgcpbF2/YHdEx2gyQQ3ecjEuH9X1bZdVt7e
         lUpmrzCjJ2lhNM1BHDjxjY0MS8TWTsF8DLBY0WKyoMKVplKQC3QiRbaLRYr9i2r052kK
         221w==
X-Gm-Message-State: AOJu0YwNm3AtJ/4avEfNiZVnihzLCbsrZUXpRW9T5M7aN83yGKZ4VwkQ
	wdMSnW75AnAKpzHhoj4EQgsDR0clbR4IxmYEoH6onmFvxvRUSGz/6NXjBGwHwJH+CygkOqJEExb
	4P3b71J4+I2lp1iOWnDHv23rgF/XuQHuULPF9p57WhA==
X-Gm-Gg: AZuq6aLmLlrmua7Q5GpoENdQ8gZBoZSUi/eTntH4/rbshBiufWxO0feMFJAeryK6afg
	xTnTsVZCNf3ezENGp37GjSycPMKcRJL2lu3idAFgw0nWIgFN5HLqBXi0lUyhOALKwAVL3ONR767
	zdZDArlxk6AvuG348gGRH/458dqgCalCOL53oGgLyEW2YNyFMdRvep402+vaUkOWjpJmOpPOZix
	NKRvep+1jBVw98MU/TcnHJ/7+tXCDIViz2I2YoIeqvYz7tDY0t3jHEuSGLTuKhFiapRgiPwxwWO
	tvUI7g0=
X-Received: by 2002:a17:907:3d4b:b0:b87:fc5:40ba with SMTP id
 a640c23a62f3a-b9081a025f1mr477257966b.20.1771833687028; Mon, 23 Feb 2026
 00:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20260217125830.2907750-1-vanusuri@mvista.com> <DGI6U5FIP17Y.25FAJDLCHRDY9@smile.fr>
In-Reply-To: <DGI6U5FIP17Y.25FAJDLCHRDY9@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 23 Feb 2026 13:31:13 +0530
X-Gm-Features: AaiRm51Hc1NngyO8rdUzHtyj3K4muirAVK9YJBYzMC_nqCF7pVX2MbaXXEwoslE
Message-ID: <CANQUz19QMndQqxGhGOPJqU+wU+XurSi46VuHDDHqD7eY-1vrog@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][patch 1/4] gnutls: upgrade 3.8.10 -> 3.8.11
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Peter Marko <peter.marko@siemens.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000844387064b792da6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231650

--000000000000844387064b792da6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Sorry for the delayed response =E2=80=94 I was on holiday. Thank you for yo=
ur
detailed notes. Please find my comments below:

On Wed, Feb 18, 2026 at 8:50=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Tue Feb 17, 2026 at 1:58 PM CET, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Release information: [1]
> > Includes fix for CVE-2025-9820.
> >
> > Refresh patches.
> >
> > Backport commit to be able to build with gcc<11 (e.g. Debian 11).
> >
> > [1]
> https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906.html
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > (From OE-Core rev: 0224dd73d5e462e3ab0958a63d631aa32e330d6c)
> >
> > Dropped CVE-2025-9820.patch
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  ...ile-should-be-excuted-in-target-envi.patch |   2 +-
> >  ...dit-crau-fix-compilation-with-gcc-11.patch |  66 +++++
> >  .../gnutls/gnutls/Add-ptest-support.patch     |   6 +-
> >  .../gnutls/gnutls/CVE-2025-9820.patch         | 233 ------------------
> >  .../{gnutls_3.8.10.bb =3D> gnutls_3.8.11.bb}    |   4 +-
> >  5 files changed, 72 insertions(+), 239 deletions(-)
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with-g=
cc-11.patch
> >  delete mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
> >  rename meta/recipes-support/gnutls/{gnutls_3.8.10.bb =3D>
> gnutls_3.8.11.bb} (96%)
>
> Hello,
>
> Sorry, but it look like this release mixes enhancement with bugs and CVE
> fixes:
> https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906.html:
>
> >> As this is the latest branch, I sent the upgrade patch. It looks like
> there are some enhancements included apart from the security fixes. I wil=
l
> send a CVE-only patch separately.
>


> > ** libgnutls: MAC algorithms for PSK binders is now configurable
> > [...]
> >
> > ** libgnutls: Expose a new function [...]
> > [...]
> > ** libgnutls: Expose a new function [...]
> > [...]
> > ** libgnutls: PKCS#11 cryptographic provider configuration takes a toke=
n
> URI
> >    instead of a module path. [...]
> > [...]
> > ** API and ABI modifications:
> > gnutls_psk_allocate_client_credentials2: New function
> > [...]
> > gnutls_audit_current_context: New function
>
> I don't think it is suitable for stable inclusion. Same for patch 4/4 of
> this series.
>
> >> Understood =E2=80=94 I agree that 1/4 and 4/4 may not be suitable for =
stable
inclusion as they introduce new features or enhancements.

I could take patches 2/4 and 3/4, but do they make sense without 1/4?
>
> >> I believe 2/4 and 3/4 can be taken independently as 3.8.x supports fip=
s
> mode.
>
> Regards,
>
> > diff --git
> a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-e=
xcuted-in-target-envi.patch
> b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-e=
xcuted-in-target-envi.patch
> > index 2dccea7859..0847dde8a9 100644
> > ---
> a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-e=
xcuted-in-target-envi.patch
> > +++
> b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-e=
xcuted-in-target-envi.patch
> > @@ -14,7 +14,7 @@ diff --git a/lib/Makefile.am b/lib/Makefile.am
> >  index a50d311..193ea19 100644
> >  --- a/lib/Makefile.am
> >  +++ b/lib/Makefile.am
> > -@@ -272,8 +272,7 @@ hmac_file =3D .libs/.$(gnutls_so).hmac
> > +@@ -275,8 +275,7 @@ hmac_file =3D .libs/.$(gnutls_so).hmac
> >
> >   all-local: $(hmac_file)
> >
> > diff --git
> a/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with=
-gcc-11.patch
> b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with=
-gcc-11.patch
> > new file mode 100644
> > index 0000000000..60960dad6f
> > --- /dev/null
> > +++
> b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilation-with=
-gcc-11.patch
> > @@ -0,0 +1,66 @@
> > +From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
> > +From: Julien Olivain <ju.o@free.fr>
> > +Date: Sun, 23 Nov 2025 18:17:19 +0100
> > +Subject: [PATCH] audit: crau: fix compilation with gcc < 11
> > +
> > +If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
> > +automatically detect an appropriate value for it.
> > +
> > +This autodetection is using the cpp special operator
> > +`__has_c_attribute` [1], introduced in gcc 11 [2].
> > +
> > +When compiling with a gcc older than version 11, the compilation fails
> > +with the error:
> > +
> > +    In file included from audit.h:22,
> > +                     from audit.c:26:
> > +    crau/crau.h:255:23: error: missing binary operator before token "(=
"
> > +         __has_c_attribute (__maybe_unused__)
> > +                           ^
> > +
> > +This has been observed, for example, in Rocky Linux 8.10, which
> > +contains a gcc v8.5.0.
> > +
> > +The issue happens because the test for the `__has_c_attribute`
> > +availability and the test for the `__maybe_unused__` attribute
> > +are in the same directive. Those tests should be separated in
> > +two different directives, following the same logic described in
> > +the `__has_builtin` documentation [3].
> > +
> > +This issue was found in Buildroot, after updating gnutls to
> > +version 3.8.11 in [4].
> > +
> > +This commit fixes the issue by splitting the test in two.
> > +
> > +[1]
> https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
> > +[2] https://gcc.gnu.org/gcc-11/changes.html#c
> > +[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
> > +[4]
> https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f8=
96198d13455df50e548
> > +
> > +Reported-by: Neal Frager <neal.frager@amd.com>
> > +Signed-off-by: Julien Olivain <ju.o@free.fr>
> > +
> > +Upstream-Status: Backport [
> https://github.com/gnutls/gnutls/commit/2bbae7644a2292410b53f98fd0035c40b=
f8750a5
> ]
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +---
> > + lib/crau/crau.h | 7 ++++---
> > + 1 file changed, 4 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/lib/crau/crau.h b/lib/crau/crau.h
> > +index 0d4f9f13e..53d33555b 100644
> > +--- a/lib/crau/crau.h
> > ++++ b/lib/crau/crau.h
> > +@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st
> *stack, ...)
> > + # else
> > +
> > + #  ifndef CRAU_MAYBE_UNUSED
> > +-#   if defined(__has_c_attribute) && \
> > +-    __has_c_attribute (__maybe_unused__)
> > +-#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
> > ++#   if defined(__has_c_attribute)
> > ++#    if __has_c_attribute (__maybe_unused__)
> > ++#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
> > ++#    endif
> > + #   elif defined(__GNUC__)
> > + #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
> > + #   endif
> > diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> > index 339d3d2f9e..d8b5035b38 100644
> > --- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> > +++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> > @@ -15,7 +15,7 @@ diff --git a/Makefile.am b/Makefile.am
> >  index 843193f..816b09f 100644
> >  --- a/Makefile.am
> >  +++ b/Makefile.am
> > -@@ -194,6 +194,9 @@ dist-hook:
> > +@@ -197,6 +197,9 @@ dist-hook:
> >   distcheck-hook:
> >       @test -d "$(top_srcdir)/po/.reference" || { echo "PO files are no=
t
> downloaded; run ./bootstrap without --skip-po"; exit 1; }
> >
> > @@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
> >  index 1744813..efb9e34 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -1491,6 +1491,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
> > +@@ -1447,6 +1447,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
> >
> >   AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" =3D "yes")
> >
> > @@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
> >  index 189d068..8430b05 100644
> >  --- a/tests/Makefile.am
> >  +++ b/tests/Makefile.am
> > -@@ -678,6 +678,12 @@ SH_LOG_COMPILER =3D $(SHELL)
> > +@@ -719,6 +719,12 @@ SH_LOG_COMPILER =3D $(SHELL)
> >   AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
> >   LOG_COMPILER =3D $(LOG_VALGRIND)
> >
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
> > deleted file mode 100644
> > index e4f97500ee..0000000000
> > --- a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch
> > +++ /dev/null
> > @@ -1,233 +0,0 @@
> > -From 19ad448d0cc3dd6857b553a47728eead3ea8f445 Mon Sep 17 00:00:00 2001
> > -From: Daiki Ueno <ueno@gnu.org>
> > -Date: Tue, 18 Nov 2025 13:17:55 +0900
> > -Subject: [PATCH] pkcs11: avoid stack overwrite when initializing a tok=
en
> > -
> > -If gnutls_pkcs11_token_init is called with label longer than 32
> > -characters, the internal storage used to blank-fill it would
> > -overflow. This adds a guard to prevent that.
> > -
> > -CVE: CVE-2025-9820
> > -Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/1d56f96f6ab5034d677136b9d50b5a7=
5dff0faf5
> ]
> > -Signed-off-by: Daiki Ueno <ueno@gnu.org>
> > -Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ----
> > - lib/pkcs11_write.c        |   5 +-
> > - tests/Makefile.am         |   2 +-
> > - tests/pkcs11/long-label.c | 164 +++++++++++++++++++++++++++++++++++++=
+
> > - 3 files changed, 168 insertions(+), 3 deletions(-)
> > - create mode 100644 tests/pkcs11/long-label.c
> > -
> > -diff --git a/lib/pkcs11_write.c b/lib/pkcs11_write.c
> > -index f5e9058e0..64b85a2df 100644
> > ---- a/lib/pkcs11_write.c
> > -+++ b/lib/pkcs11_write.c
> > -@@ -28,6 +28,7 @@
> > - #include "pkcs11x.h"
> > - #include "x509/common.h"
> > - #include "pk.h"
> > -+#include "minmax.h"
> > -
> > - static const ck_bool_t tval =3D 1;
> > - static const ck_bool_t fval =3D 0;
> > -@@ -1172,7 +1173,7 @@ int gnutls_pkcs11_delete_url(const char
> *object_url, unsigned int flags)
> > -  * gnutls_pkcs11_token_init:
> > -  * @token_url: A PKCS #11 URL specifying a token
> > -  * @so_pin: Security Officer's PIN
> > -- * @label: A name to be used for the token
> > -+ * @label: A name to be used for the token, at most 32 characters
> > -  *
> > -  * This function will initialize (format) a token. If the token is
> > -  * at a factory defaults state the security officer's PIN given will =
be
> > -@@ -1210,7 +1211,7 @@ int gnutls_pkcs11_token_init(const char
> *token_url, const char *so_pin,
> > -     /* so it seems memset has other uses than zeroing! */
> > -     memset(flabel, ' ', sizeof(flabel));
> > -     if (label !=3D NULL)
> > --            memcpy(flabel, label, strlen(label));
> > -+            memcpy(flabel, label, MIN(sizeof(flabel), strlen(label)))=
;
> > -
> > -     rv =3D pkcs11_init_token(module, slot, (uint8_t *)so_pin,
> strlen(so_pin),
> > -                            (uint8_t *)flabel);
> > -diff --git a/tests/Makefile.am b/tests/Makefile.am
> > -index c8de4494b..f64f7b1c0 100644
> > ---- a/tests/Makefile.am
> > -+++ b/tests/Makefile.am
> > -@@ -503,7 +503,7 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \
> > - if ENABLE_PKCS11
> > - if !WINDOWS
> > - ctests +=3D tls13/post-handshake-with-cert-pkcs11
> pkcs11/tls-neg-pkcs11-no-key \
> > --    global-init-override pkcs11/distrust-after
> > -+    global-init-override pkcs11/distrust-after pkcs11/long-label
> > - tls13_post_handshake_with_cert_pkcs11_DEPENDENCIES =3D libpkcs11mock2=
.la
> libutils.la
> > - tls13_post_handshake_with_cert_pkcs11_LDADD =3D $(LDADD) $(LIBDL)
> > - pkcs11_tls_neg_pkcs11_no_key_DEPENDENCIES =3D libpkcs11mock2.la
> libutils.la
> > -diff --git a/tests/pkcs11/long-label.c b/tests/pkcs11/long-label.c
> > -new file mode 100644
> > -index 000000000..a70bc9728
> > ---- /dev/null
> > -+++ b/tests/pkcs11/long-label.c
> > -@@ -0,0 +1,164 @@
> > -+/*
> > -+ * Copyright (C) 2025 Red Hat, Inc.
> > -+ *
> > -+ * Author: Daiki Ueno
> > -+ *
> > -+ * This file is part of GnuTLS.
> > -+ *
> > -+ * GnuTLS is free software; you can redistribute it and/or modify it
> > -+ * under the terms of the GNU General Public License as published by
> > -+ * the Free Software Foundation; either version 3 of the License, or
> > -+ * (at your option) any later version.
> > -+ *
> > -+ * GnuTLS is distributed in the hope that it will be useful, but
> > -+ * WITHOUT ANY WARRANTY; without even the implied warranty of
> > -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > -+ * General Public License for more details.
> > -+ *
> > -+ * You should have received a copy of the GNU Lesser General Public
> License
> > -+ * along with this program.  If not, see <
> https://www.gnu.org/licenses/>
> > -+ */
> > -+
> > -+#ifdef HAVE_CONFIG_H
> > -+#include "config.h"
> > -+#endif
> > -+
> > -+#include <stdbool.h>
> > -+#include <stdio.h>
> > -+#include <stdlib.h>
> > -+
> > -+#if defined(_WIN32)
> > -+
> > -+int main(void)
> > -+{
> > -+    exit(77);
> > -+}
> > -+
> > -+#else
> > -+
> > -+#include <string.h>
> > -+#include <unistd.h>
> > -+#include <gnutls/gnutls.h>
> > -+
> > -+#include "cert-common.h"
> > -+#include "pkcs11/softhsm.h"
> > -+#include "utils.h"
> > -+
> > -+/* This program tests that a token can be initialized with
> > -+ * a label longer than 32 characters.
> > -+ */
> > -+
> > -+static void tls_log_func(int level, const char *str)
> > -+{
> > -+    fprintf(stderr, "server|<%d>| %s", level, str);
> > -+}
> > -+
> > -+#define PIN "1234"
> > -+
> > -+#define CONFIG_NAME "softhsm-long-label"
> > -+#define CONFIG CONFIG_NAME ".config"
> > -+
> > -+static int pin_func(void *userdata, int attempt, const char *url,
> > -+                const char *label, unsigned flags, char *pin,
> > -+                size_t pin_max)
> > -+{
> > -+    if (attempt =3D=3D 0) {
> > -+            strcpy(pin, PIN);
> > -+            return 0;
> > -+    }
> > -+    return -1;
> > -+}
> > -+
> > -+static void test(const char *provider)
> > -+{
> > -+    int ret;
> > -+    size_t i;
> > -+
> > -+    gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);
> > -+
> > -+    success("test with %s\n", provider);
> > -+
> > -+    if (debug) {
> > -+            gnutls_global_set_log_function(tls_log_func);
> > -+            gnutls_global_set_log_level(4711);
> > -+    }
> > -+
> > -+    /* point to SoftHSM token that libpkcs11mock4.so internally uses =
*/
> > -+    setenv(SOFTHSM_ENV, CONFIG, 1);
> > -+
> > -+    gnutls_pkcs11_set_pin_function(pin_func, NULL);
> > -+
> > -+    ret =3D gnutls_pkcs11_add_provider(provider, "trusted");
> > -+    if (ret !=3D 0) {
> > -+            fail("gnutls_pkcs11_add_provider: %s\n",
> gnutls_strerror(ret));
> > -+    }
> > -+
> > -+    /* initialize softhsm token */
> > -+    ret =3D gnutls_pkcs11_token_init(
> > -+            SOFTHSM_URL, PIN,
> > -+            "this is a very long label whose length exceeds 32");
> > -+    if (ret < 0) {
> > -+            fail("gnutls_pkcs11_token_init: %s\n",
> gnutls_strerror(ret));
> > -+    }
> > -+
> > -+    for (i =3D 0;; i++) {
> > -+            char *url =3D NULL;
> > -+
> > -+            ret =3D gnutls_pkcs11_token_get_url(i, 0, &url);
> > -+            if (ret < 0)
> > -+                    break;
> > -+            if (strstr(url,
> > -+
>  "token=3Dthis%20is%20a%20very%20long%20label%20whose"))
> > -+                    break;
> > -+    }
> > -+    if (ret < 0)
> > -+            fail("gnutls_pkcs11_token_get_url: %s\n",
> gnutls_strerror(ret));
> > -+
> > -+    gnutls_pkcs11_deinit();
> > -+}
> > -+
> > -+void doit(void)
> > -+{
> > -+    const char *bin;
> > -+    const char *lib;
> > -+    char buf[128];
> > -+
> > -+    if (gnutls_fips140_mode_enabled())
> > -+            exit(77);
> > -+
> > -+    /* this must be called once in the program */
> > -+    global_init();
> > -+
> > -+    /* we call gnutls_pkcs11_init manually */
> > -+    gnutls_pkcs11_deinit();
> > -+
> > -+    /* check if softhsm module is loadable */
> > -+    lib =3D softhsm_lib();
> > -+
> > -+    /* initialize SoftHSM token that libpkcs11mock4.so internally use=
s
> */
> > -+    bin =3D softhsm_bin();
> > -+
> > -+    set_softhsm_conf(CONFIG);
> > -+    snprintf(buf, sizeof(buf),
> > -+             "%s --init-token --slot 0 --label test --so-pin " PIN
> > -+             " --pin " PIN,
> > -+             bin);
> > -+    system(buf);
> > -+
> > -+    test(lib);
> > -+
> > -+    lib =3D getenv("P11MOCKLIB4");
> > -+    if (lib =3D=3D NULL) {
> > -+            fail("P11MOCKLIB4 is not set\n");
> > -+    }
> > -+
> > -+    set_softhsm_conf(CONFIG);
> > -+    snprintf(buf, sizeof(buf),
> > -+             "%s --init-token --slot 0 --label test --so-pin " PIN
> > -+             " --pin " PIN,
> > -+             bin);
> > -+    system(buf);
> > -+
> > -+    test(lib);
> > -+}
> > -+#endif /* _WIN32 */
> > diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
> b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
> > similarity index 96%
> > rename from meta/recipes-support/gnutls/gnutls_3.8.10.bb
> > rename to meta/recipes-support/gnutls/gnutls_3.8.11.bb
> > index b07c166c0e..faeb1a4ede 100644
> > --- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
> > +++ b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
> > @@ -21,12 +21,12 @@ SHRT_VER =3D
> "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> >  SRC_URI =3D "
> https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz =
\
> >             file://arm_eabi.patch \
> >
>  file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
> > +           file://0001-audit-crau-fix-compilation-with-gcc-11.patch \
> >             file://run-ptest \
> >             file://Add-ptest-support.patch \
> > -           file://CVE-2025-9820.patch \
> >             "
> >
> > -SRC_URI[sha256sum] =3D
> "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
> > +SRC_URI[sha256sum] =3D
> "91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20"
> >
> >  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
> >
>
>
> --
> Yoann Congal
> Smile ECS
>
> Thanks & Regrds,
> Vijay
>
>

--000000000000844387064b792da6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yoann,<br><br>Sorry for the delayed response =E2=
=80=94 I was on holiday. Thank you for your detailed notes. Please find my =
comments below:</div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 18, 2026 at 8:50=E2=80=AFP=
M Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@sm=
ile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue Feb 17, 2026 at 1:58 PM CET, Vijay Anusuri via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> wrote:<br>
&gt; Release information: [1]<br>
&gt; Includes fix for CVE-2025-9820.<br>
&gt;<br>
&gt; Refresh patches.<br>
&gt;<br>
&gt; Backport commit to be able to build with gcc&lt;11 (e.g. Debian 11).<b=
r>
&gt;<br>
&gt; [1] <a href=3D"https://lists.gnupg.org/pipermail/gnutls-help/2025-Nove=
mber/004906.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnupg.=
org/pipermail/gnutls-help/2025-November/004906.html</a><br>
&gt;<br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; Signed-off-by: Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dub=
ois-briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com=
</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt;<br>
&gt; (From OE-Core rev: 0224dd73d5e462e3ab0958a63d631aa32e330d6c)<br>
&gt;<br>
&gt; Dropped CVE-2025-9820.patch<br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ile-should-be-excuted-in-target-envi.patch |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 ...dit-crau-fix-compilation-with-gcc-11.patch |=C2=A0 66 +++++<b=
r>
&gt;=C2=A0 .../gnutls/gnutls/Add-ptest-support.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2025-9820.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 233 ------------------<br>
&gt;=C2=A0 .../{<a href=3D"http://gnutls_3.8.10.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gnutls_3.8.10.bb</a> =3D&gt; <a href=3D"http://gnutls_3.8.11.=
bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.11.bb</a>}=C2=A0 =C2=A0=
 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 5 files changed, 72 insertions(+), 239 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-audit=
-crau-fix-compilation-with-gcc-11.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9=
820.patch<br>
&gt;=C2=A0 rename meta/recipes-support/gnutls/{<a href=3D"http://gnutls_3.8=
.10.bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.10.bb</a> =3D&gt; <=
a href=3D"http://gnutls_3.8.11.bb" rel=3D"noreferrer" target=3D"_blank">gnu=
tls_3.8.11.bb</a>} (96%)<br>
<br>
Hello,<br>
<br>
Sorry, but it look like this release mixes enhancement with bugs and CVE<br=
>
fixes: <a href=3D"https://lists.gnupg.org/pipermail/gnutls-help/2025-Novemb=
er/004906.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnupg.or=
g/pipermail/gnutls-help/2025-November/004906.html</a>:<br><br>&gt;&gt; As t=
his is the latest branch, I sent the upgrade patch. It looks like there are=
 some enhancements included apart from the security fixes. I will send a CV=
E-only patch separately.<br></blockquote><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; ** libgnutls: MAC algorithms for PSK binders is now configurable<br>
&gt; [...]<br>
&gt; <br>
&gt; ** libgnutls: Expose a new function [...]<br>
&gt; [...]<br>
&gt; ** libgnutls: Expose a new function [...]<br>
&gt; [...]<br>
&gt; ** libgnutls: PKCS#11 cryptographic provider configuration takes a tok=
en URI<br>
&gt;=C2=A0 =C2=A0 instead of a module path. [...]<br>
&gt; [...]<br>
&gt; ** API and ABI modifications:<br>
&gt; gnutls_psk_allocate_client_credentials2: New function<br>
&gt; [...]<br>
&gt; gnutls_audit_current_context: New function<br>
<br>
I don&#39;t think it is suitable for stable inclusion. Same for patch 4/4 o=
f<br>
this series.<br>
<br></blockquote><div>&gt;&gt;=C2=A0<span>Understood =E2=80=94 I agree that=
 1/4 and 4/4 may not be suitable for stable inclusion as they introduce new=
 features or enhancements.</span><br> <br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div><div>
I could take patches 2/4 and 3/4, but do they make sense without 1/4?<br><b=
r>&gt;&gt; I believe 2/4 and 3/4 can be taken independently as 3.8.x suppor=
ts fips mode.<br>
<br>
Regards,<br>
<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-fi=
le-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnu=
tls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch<br>
&gt; index 2dccea7859..0847dde8a9 100644<br>
&gt; --- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-shou=
ld-be-excuted-in-target-envi.patch<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-shou=
ld-be-excuted-in-target-envi.patch<br>
&gt; @@ -14,7 +14,7 @@ diff --git a/lib/Makefile.am b/lib/Makefile.am<br>
&gt;=C2=A0 index a50d311..193ea19 100644<br>
&gt;=C2=A0 --- a/lib/Makefile.am<br>
&gt;=C2=A0 +++ b/lib/Makefile.am<br>
&gt; -@@ -272,8 +272,7 @@ hmac_file =3D .libs/.$(gnutls_so).hmac<br>
&gt; +@@ -275,8 +275,7 @@ hmac_file =3D .libs/.$(gnutls_so).hmac<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0all-local: $(hmac_file)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-co=
mpilation-with-gcc-11.patch b/meta/recipes-support/gnutls/gnutls/0001-audit=
-crau-fix-compilation-with-gcc-11.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..60960dad6f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/0001-audit-crau-fix-compilati=
on-with-gcc-11.patch<br>
&gt; @@ -0,0 +1,66 @@<br>
&gt; +From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" target=3D"_b=
lank">ju.o@free.fr</a>&gt;<br>
&gt; +Date: Sun, 23 Nov 2025 18:17:19 +0100<br>
&gt; +Subject: [PATCH] audit: crau: fix compilation with gcc &lt; 11<br>
&gt; +<br>
&gt; +If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to<br>
&gt; +automatically detect an appropriate value for it.<br>
&gt; +<br>
&gt; +This autodetection is using the cpp special operator<br>
&gt; +`__has_c_attribute` [1], introduced in gcc 11 [2].<br>
&gt; +<br>
&gt; +When compiling with a gcc older than version 11, the compilation fail=
s<br>
&gt; +with the error:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 In file included from audit.h:22,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0from audit.c:26:<br>
&gt; +=C2=A0 =C2=A0 crau/crau.h:255:23: error: missing binary operator befo=
re token &quot;(&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__has_c_attribute (__maybe_unused__=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; +<br>
&gt; +This has been observed, for example, in Rocky Linux 8.10, which<br>
&gt; +contains a gcc v8.5.0.<br>
&gt; +<br>
&gt; +The issue happens because the test for the `__has_c_attribute`<br>
&gt; +availability and the test for the `__maybe_unused__` attribute<br>
&gt; +are in the same directive. Those tests should be separated in<br>
&gt; +two different directives, following the same logic described in<br>
&gt; +the `__has_builtin` documentation [3].<br>
&gt; +<br>
&gt; +This issue was found in Buildroot, after updating gnutls to<br>
&gt; +version 3.8.11 in [4].<br>
&gt; +<br>
&gt; +This commit fixes the issue by splitting the test in two.<br>
&gt; +<br>
&gt; +[1] <a href=3D"https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc=
_005fattribute.html" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.o=
rg/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html</a><br>
&gt; +[2] <a href=3D"https://gcc.gnu.org/gcc-11/changes.html#c" rel=3D"nore=
ferrer" target=3D"_blank">https://gcc.gnu.org/gcc-11/changes.html#c</a><br>
&gt; +[3] <a href=3D"https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fb=
uiltin.html" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/onlin=
edocs/cpp/_005f_005fhas_005fbuiltin.html</a><br>
&gt; +[4] <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/81=
dbfe1c2ae848b4eb1f896198d13455df50e548" rel=3D"noreferrer" target=3D"_blank=
">https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f8=
96198d13455df50e548</a><br>
&gt; +<br>
&gt; +Reported-by: Neal Frager &lt;<a href=3D"mailto:neal.frager@amd.com" t=
arget=3D"_blank">neal.frager@amd.com</a>&gt;<br>
&gt; +Signed-off-by: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" tar=
get=3D"_blank">ju.o@free.fr</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/gnutls/gnutl=
s/commit/2bbae7644a2292410b53f98fd0035c40bf8750a5" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/gnutls/gnutls/commit/2bbae7644a2292410b53f9=
8fd0035c40bf8750a5</a>]<br>
&gt; +Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.=
com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/crau/crau.h | 7 ++++---<br>
&gt; + 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/crau/crau.h b/lib/crau/crau.h<br>
&gt; +index 0d4f9f13e..53d33555b 100644<br>
&gt; +--- a/lib/crau/crau.h<br>
&gt; ++++ b/lib/crau/crau.h<br>
&gt; +@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *sta=
ck, ...)<br>
&gt; + # else<br>
&gt; + <br>
&gt; + #=C2=A0 ifndef CRAU_MAYBE_UNUSED<br>
&gt; +-#=C2=A0 =C2=A0if defined(__has_c_attribute) &amp;&amp; \<br>
&gt; +-=C2=A0 =C2=A0 __has_c_attribute (__maybe_unused__)<br>
&gt; +-#=C2=A0 =C2=A0 define CRAU_MAYBE_UNUSED [[__maybe_unused__]]<br>
&gt; ++#=C2=A0 =C2=A0if defined(__has_c_attribute)<br>
&gt; ++#=C2=A0 =C2=A0 if __has_c_attribute (__maybe_unused__)<br>
&gt; ++#=C2=A0 =C2=A0 =C2=A0define CRAU_MAYBE_UNUSED [[__maybe_unused__]]<b=
r>
&gt; ++#=C2=A0 =C2=A0 endif<br>
&gt; + #=C2=A0 =C2=A0elif defined(__GNUC__)<br>
&gt; + #=C2=A0 =C2=A0 define CRAU_MAYBE_UNUSED __attribute__((__unused__))<=
br>
&gt; + #=C2=A0 =C2=A0endif<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patc=
h b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch<br>
&gt; index 339d3d2f9e..d8b5035b38 100644<br>
&gt; --- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch<br>
&gt; @@ -15,7 +15,7 @@ diff --git a/Makefile.am b/Makefile.am<br>
&gt;=C2=A0 index 843193f..816b09f 100644<br>
&gt;=C2=A0 --- a/Makefile.am<br>
&gt;=C2=A0 +++ b/Makefile.am<br>
&gt; -@@ -194,6 +194,9 @@ dist-hook:<br>
&gt; +@@ -197,6 +197,9 @@ dist-hook:<br>
&gt;=C2=A0 =C2=A0distcheck-hook:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@test -d &quot;$(top_srcdir)/po/.reference&q=
uot; || { echo &quot;PO files are not downloaded; run ./bootstrap without -=
-skip-po&quot;; exit 1; }<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -29,7 +29,7 @@ diff --git a/<a href=3D"http://configure.ac" rel=3D"=
noreferrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configur=
e.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 index 1744813..efb9e34 100644<br>
&gt;=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; -@@ -1491,6 +1491,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)<br>
&gt; +@@ -1447,6 +1447,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0AM_CONDITIONAL(NEEDS_LIBRT, test &quot;$gnutls_needs_librt=
&quot; =3D &quot;yes&quot;)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am<b=
r>
&gt;=C2=A0 index 189d068..8430b05 100644<br>
&gt;=C2=A0 --- a/tests/Makefile.am<br>
&gt;=C2=A0 +++ b/tests/Makefile.am<br>
&gt; -@@ -678,6 +678,12 @@ SH_LOG_COMPILER =3D $(SHELL)<br>
&gt; +@@ -719,6 +719,12 @@ SH_LOG_COMPILER =3D $(SHELL)<br>
&gt;=C2=A0 =C2=A0AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressio=
ns.valgrind<br>
&gt;=C2=A0 =C2=A0LOG_COMPILER =3D $(LOG_VALGRIND)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch b/=
meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e4f97500ee..0000000000<br>
&gt; --- a/meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,233 +0,0 @@<br>
&gt; -From 19ad448d0cc3dd6857b553a47728eead3ea8f445 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=3D"_blank=
">ueno@gnu.org</a>&gt;<br>
&gt; -Date: Tue, 18 Nov 2025 13:17:55 +0900<br>
&gt; -Subject: [PATCH] pkcs11: avoid stack overwrite when initializing a to=
ken<br>
&gt; -<br>
&gt; -If gnutls_pkcs11_token_init is called with label longer than 32<br>
&gt; -characters, the internal storage used to blank-fill it would<br>
&gt; -overflow. This adds a guard to prevent that.<br>
&gt; -<br>
&gt; -CVE: CVE-2025-9820<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/1d56f96f6ab5034d677136b9d50b5a75dff0faf5" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/1d56f96f6ab5034d67=
7136b9d50b5a75dff0faf5</a>]<br>
&gt; -Signed-off-by: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org" target=
=3D"_blank">ueno@gnu.org</a>&gt;<br>
&gt; -Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.=
com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - lib/pkcs11_write.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt; - tests/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +=
-<br>
&gt; - tests/pkcs11/long-label.c | 164 ++++++++++++++++++++++++++++++++++++=
++<br>
&gt; - 3 files changed, 168 insertions(+), 3 deletions(-)<br>
&gt; - create mode 100644 tests/pkcs11/long-label.c<br>
&gt; -<br>
&gt; -diff --git a/lib/pkcs11_write.c b/lib/pkcs11_write.c<br>
&gt; -index f5e9058e0..64b85a2df 100644<br>
&gt; ---- a/lib/pkcs11_write.c<br>
&gt; -+++ b/lib/pkcs11_write.c<br>
&gt; -@@ -28,6 +28,7 @@<br>
&gt; - #include &quot;pkcs11x.h&quot;<br>
&gt; - #include &quot;x509/common.h&quot;<br>
&gt; - #include &quot;pk.h&quot;<br>
&gt; -+#include &quot;minmax.h&quot;<br>
&gt; - <br>
&gt; - static const ck_bool_t tval =3D 1;<br>
&gt; - static const ck_bool_t fval =3D 0;<br>
&gt; -@@ -1172,7 +1173,7 @@ int gnutls_pkcs11_delete_url(const char *object=
_url, unsigned int flags)<br>
&gt; -=C2=A0 * gnutls_pkcs11_token_init:<br>
&gt; -=C2=A0 * @token_url: A PKCS #11 URL specifying a token<br>
&gt; -=C2=A0 * @so_pin: Security Officer&#39;s PIN<br>
&gt; -- * @label: A name to be used for the token<br>
&gt; -+ * @label: A name to be used for the token, at most 32 characters<br=
>
&gt; -=C2=A0 *<br>
&gt; -=C2=A0 * This function will initialize (format) a token. If the token=
 is<br>
&gt; -=C2=A0 * at a factory defaults state the security officer&#39;s PIN g=
iven will be<br>
&gt; -@@ -1210,7 +1211,7 @@ int gnutls_pkcs11_token_init(const char *token_=
url, const char *so_pin,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* so it seems memset has other uses than zeroing=
! */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0memset(flabel, &#39; &#39;, sizeof(flabel));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (label !=3D NULL)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(flabel, label, strl=
en(label));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(flabel, label, MIN(=
sizeof(flabel), strlen(label)));<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0rv =3D pkcs11_init_token(module, slot, (uint8_t *=
)so_pin, strlen(so_pin),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint8_t *)flabel);<br>
&gt; -diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
&gt; -index c8de4494b..f64f7b1c0 100644<br>
&gt; ---- a/tests/Makefile.am<br>
&gt; -+++ b/tests/Makefile.am<br>
&gt; -@@ -503,7 +503,7 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \<br>
&gt; - if ENABLE_PKCS11<br>
&gt; - if !WINDOWS<br>
&gt; - ctests +=3D tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkc=
s11-no-key \<br>
&gt; --=C2=A0 =C2=A0 global-init-override pkcs11/distrust-after<br>
&gt; -+=C2=A0 =C2=A0 global-init-override pkcs11/distrust-after pkcs11/long=
-label<br>
&gt; - tls13_post_handshake_with_cert_pkcs11_DEPENDENCIES =3D <a href=3D"ht=
tp://libpkcs11mock2.la" rel=3D"noreferrer" target=3D"_blank">libpkcs11mock2=
.la</a> <a href=3D"http://libutils.la" rel=3D"noreferrer" target=3D"_blank"=
>libutils.la</a><br>
&gt; - tls13_post_handshake_with_cert_pkcs11_LDADD =3D $(LDADD) $(LIBDL)<br=
>
&gt; - pkcs11_tls_neg_pkcs11_no_key_DEPENDENCIES =3D <a href=3D"http://libp=
kcs11mock2.la" rel=3D"noreferrer" target=3D"_blank">libpkcs11mock2.la</a> <=
a href=3D"http://libutils.la" rel=3D"noreferrer" target=3D"_blank">libutils=
.la</a><br>
&gt; -diff --git a/tests/pkcs11/long-label.c b/tests/pkcs11/long-label.c<br=
>
&gt; -new file mode 100644<br>
&gt; -index 000000000..a70bc9728<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/tests/pkcs11/long-label.c<br>
&gt; -@@ -0,0 +1,164 @@<br>
&gt; -+/*<br>
&gt; -+ * Copyright (C) 2025 Red Hat, Inc.<br>
&gt; -+ *<br>
&gt; -+ * Author: Daiki Ueno<br>
&gt; -+ *<br>
&gt; -+ * This file is part of GnuTLS.<br>
&gt; -+ *<br>
&gt; -+ * GnuTLS is free software; you can redistribute it and/or modify it=
<br>
&gt; -+ * under the terms of the GNU General Public License as published by=
<br>
&gt; -+ * the Free Software Foundation; either version 3 of the License, or=
<br>
&gt; -+ * (at your option) any later version.<br>
&gt; -+ *<br>
&gt; -+ * GnuTLS is distributed in the hope that it will be useful, but<br>
&gt; -+ * WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See th=
e GNU<br>
&gt; -+ * General Public License for more details.<br>
&gt; -+ *<br>
&gt; -+ * You should have received a copy of the GNU Lesser General Public =
License<br>
&gt; -+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"https:/=
/www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gn=
u.org/licenses/</a>&gt;<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+#ifdef HAVE_CONFIG_H<br>
&gt; -+#include &quot;config.h&quot;<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; -+#include &lt;stdbool.h&gt;<br>
&gt; -+#include &lt;stdio.h&gt;<br>
&gt; -+#include &lt;stdlib.h&gt;<br>
&gt; -+<br>
&gt; -+#if defined(_WIN32)<br>
&gt; -+<br>
&gt; -+int main(void)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 exit(77);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+#else<br>
&gt; -+<br>
&gt; -+#include &lt;string.h&gt;<br>
&gt; -+#include &lt;unistd.h&gt;<br>
&gt; -+#include &lt;gnutls/gnutls.h&gt;<br>
&gt; -+<br>
&gt; -+#include &quot;cert-common.h&quot;<br>
&gt; -+#include &quot;pkcs11/softhsm.h&quot;<br>
&gt; -+#include &quot;utils.h&quot;<br>
&gt; -+<br>
&gt; -+/* This program tests that a token can be initialized with<br>
&gt; -+ * a label longer than 32 characters.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+static void tls_log_func(int level, const char *str)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 fprintf(stderr, &quot;server|&lt;%d&gt;| %s&quot;, lev=
el, str);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+#define PIN &quot;1234&quot;<br>
&gt; -+<br>
&gt; -+#define CONFIG_NAME &quot;softhsm-long-label&quot;<br>
&gt; -+#define CONFIG CONFIG_NAME &quot;.config&quot;<br>
&gt; -+<br>
&gt; -+static int pin_func(void *userdata, int attempt, const char *url,<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
label, unsigned flags, char *pin,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t pin_m=
ax)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 if (attempt =3D=3D 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcpy(pin, PIN);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 return -1;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+static void test(const char *provider)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 int ret;<br>
&gt; -+=C2=A0 =C2=A0 size_t i;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);<b=
r>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 success(&quot;test with %s\n&quot;, provider);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (debug) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_global_set_log_func=
tion(tls_log_func);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls_global_set_log_leve=
l(4711);<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* point to SoftHSM token that libpkcs11mock4.so inter=
nally uses */<br>
&gt; -+=C2=A0 =C2=A0 setenv(SOFTHSM_ENV, CONFIG, 1);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 gnutls_pkcs11_set_pin_function(pin_func, NULL);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 ret =3D gnutls_pkcs11_add_provider(provider, &quot;tru=
sted&quot;);<br>
&gt; -+=C2=A0 =C2=A0 if (ret !=3D 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail(&quot;gnutls_pkcs11_a=
dd_provider: %s\n&quot;, gnutls_strerror(ret));<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* initialize softhsm token */<br>
&gt; -+=C2=A0 =C2=A0 ret =3D gnutls_pkcs11_token_init(<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SOFTHSM_URL, PIN,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;this is a very long =
label whose length exceeds 32&quot;);<br>
&gt; -+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail(&quot;gnutls_pkcs11_t=
oken_init: %s\n&quot;, gnutls_strerror(ret));<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 for (i =3D 0;; i++) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *url =3D NULL;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D gnutls_pkcs11_toke=
n_get_url(i, 0, &amp;url);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strstr(url,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;token=3Dthis%20is%20a%20very%20long%20label%20whose&=
quot;))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail(&quot;gnutls_pkcs11_t=
oken_get_url: %s\n&quot;, gnutls_strerror(ret));<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 gnutls_pkcs11_deinit();<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+void doit(void)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 const char *bin;<br>
&gt; -+=C2=A0 =C2=A0 const char *lib;<br>
&gt; -+=C2=A0 =C2=A0 char buf[128];<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (gnutls_fips140_mode_enabled())<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(77);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* this must be called once in the program */<br>
&gt; -+=C2=A0 =C2=A0 global_init();<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* we call gnutls_pkcs11_init manually */<br>
&gt; -+=C2=A0 =C2=A0 gnutls_pkcs11_deinit();<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* check if softhsm module is loadable */<br>
&gt; -+=C2=A0 =C2=A0 lib =3D softhsm_lib();<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* initialize SoftHSM token that libpkcs11mock4.so int=
ernally uses */<br>
&gt; -+=C2=A0 =C2=A0 bin =3D softhsm_bin();<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 set_softhsm_conf(CONFIG);<br>
&gt; -+=C2=A0 =C2=A0 snprintf(buf, sizeof(buf),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s --init-toke=
n --slot 0 --label test --so-pin &quot; PIN<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; --pin &quot; =
PIN,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bin);<br>
&gt; -+=C2=A0 =C2=A0 system(buf);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 test(lib);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 lib =3D getenv(&quot;P11MOCKLIB4&quot;);<br>
&gt; -+=C2=A0 =C2=A0 if (lib =3D=3D NULL) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail(&quot;P11MOCKLIB4 is =
not set\n&quot;);<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 set_softhsm_conf(CONFIG);<br>
&gt; -+=C2=A0 =C2=A0 snprintf(buf, sizeof(buf),<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s --init-toke=
n --slot 0 --label test --so-pin &quot; PIN<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; --pin &quot; =
PIN,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bin);<br>
&gt; -+=C2=A0 =C2=A0 system(buf);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 test(lib);<br>
&gt; -+}<br>
&gt; -+#endif /* _WIN32 */<br>
&gt; diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.=
10.bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.10.bb</a> b/meta/rec=
ipes-support/gnutls/<a href=3D"http://gnutls_3.8.11.bb" rel=3D"noreferrer" =
target=3D"_blank">gnutls_3.8.11.bb</a><br>
&gt; similarity index 96%<br>
&gt; rename from meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.10.bb</a><br>
&gt; rename to meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.11.=
bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.11.bb</a><br>
&gt; index b07c166c0e..faeb1a4ede 100644<br>
&gt; --- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.10.bb" =
rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.10.bb</a><br>
&gt; +++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.11.bb" =
rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.11.bb</a><br>
&gt; @@ -21,12 +21,12 @@ SHRT_VER =3D &quot;${@d.getVar(&#39;PV&#39;).split=
(&#39;.&#39;)[0]}.${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[1]}&quot;<br=
>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://www.gnupg.org/ftp/gcrypt/gn=
utls/v$%7BSHRT_VER%7D/gnutls-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D=
"_blank">https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.=
tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://arm_eabi.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Creating-.h=
mac-file-should-be-excuted-in-target-envi.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-audit-crau-fix-c=
ompilation-with-gcc-11.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Add-ptest-suppor=
t.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-9820.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;db7fab7cce791e7727ebbef2334301c821d79a55=
0ec55c9ef096b610b03eb6b7&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8=
f84266d0faec6e29f17baa20&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc =
ptest<br>
&gt;=C2=A0 <br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br><br></div>Thanks &amp; Regrds,<br></div>Vijay<div>
<br>
</div></blockquote></div></div>

--000000000000844387064b792da6--

