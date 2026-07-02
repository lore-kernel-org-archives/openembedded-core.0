Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50743C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 12:19:41 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64322.1782980607850592018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 01:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZfwzRkVc;
 spf=pass (domain: linaro.org, ip: 209.85.214.174, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c9cb97e178so19513115ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 01:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782980607; cv=none;
        d=google.com; s=arc-20260327;
        b=B7vBYjXPRmwweos6L5TPzzmAGjGbfnF059Op1oJ+Mg0q5jD9Zx2enQlRp7gsn72YaD
         eCYmjqc1ABmzIYDqmaBUntQ92totyafen7kHlXTimNORKWMylWobOOWBouVP/nR4zTwS
         jRzuqM8iZl7PQD8DH7IMNDFJR3fqfSuSFRFNFDg/3uWk9kzwgFUM7kQ6jN5Qzvu7k8jG
         G6qts9VrzkpUnPa7Q9OVhwH1Wr9IvhkszM7Tn7f/nl8LneZMPRksSVraE/sfT/BxgKBF
         fjOYEd1qcNXx3MtRYDEW/wdzn/4Ncdkhv+fPG3xToLIuldmo+IXwTE1XidmCCQtHrj6e
         MVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cqCHGHxedByerfr5hEC0ULHHsL2Tt4OxrT4w682RpDk=;
        fh=0tZhTIUFj9+KEulSLSfuXCAk8dcHr/eFD5p12Rjg0tY=;
        b=XtaMgfjNUOUAS6F3X2R4hC/bUvq0ENJqY2CF9jUqe43GwPtnz+SXtEzCoD4eiJWOoK
         pBCrDFyy3zn1rRbFynSLswZNYqZU8xaaugcz/WbLYebKEXoIQzhSq4LbNHcOyyLhVMvP
         Kv9O0zIaYz6Z48pGownGm4EwnSs6gB8iZ/ZjSTKf73DrHnyNnwMioqOzR9fxybDZnog0
         0W+2PpdCqkBuIdaNleQsdAgzCDy8ImH+0Hs6Zv1zdc1HfrqUfVR5zKFnenQHPx29QlXJ
         1px9TPqxc1GT8PYeMWw19GIVdWyaPiffh92ubWjX7dONlCgkzCXA4pDd5V1Hfez75+3g
         +73g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782980607; x=1783585407; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cqCHGHxedByerfr5hEC0ULHHsL2Tt4OxrT4w682RpDk=;
        b=ZfwzRkVcOmh9nEGUpsgaZonC9Wz8/nOr/8+wSZy3bWwNjBvSGLPIrnoQHVlrxm7oY/
         degtmjs0QkFm1aceMeOz9EXdDbopPX0ikQV6Nn0/ggfumhFkOdev8E65wa8PGpjZ46X1
         x5fODKW8tSUZpTLeANU9c1FEvuUKBEy9Ycv1dVVM7oigPZssA960bRfJFHPCsewbUkz5
         QYq4DivJwkU80JN2BL+Q9klAiHR/QgPmdV2X0eLLWi/ss3ZqbklfH6rGfBvAPn+SigcY
         ZNx6nXmJeDbdXG1Z/11NFcE9N7klxQsiQZJRcUTVuH8RmvoumGdvnWa/s2QzEOsAREBN
         dDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782980607; x=1783585407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqCHGHxedByerfr5hEC0ULHHsL2Tt4OxrT4w682RpDk=;
        b=op2os6+ypl6WS1FZic/tARV5VVo/WITigbjOR/CnnWM8JyLacSdaRHaR99YjMbqBjM
         yEXzOFcs5CA+nj2OMhbfpZ7nXMeaX2UTtXYE8Qnk51JVzsNFYsUzNByzzGx1j+PUOv1v
         pR6UOM/hgK3RYpy9L2gS7j4KrIUISn4yQW1SoULB77uhMBDN7tOkBojiok6PbD7JHXd8
         fCNk11yWfmK2ZWEakRLbhe6e/rq0GK0DKMoOB8eNTZybRppNA8LMKIFCvShyJgOtTs3q
         fBlQ7yurLh2LEnZTxlBvbNz3XvhzxexjljixsvxCcGU5Hp0nZIujz1ZMyMN9js0qAWeU
         Eviw==
X-Forwarded-Encrypted: i=1; AHgh+RqdKeRTk1NaK7TCRXP5R5K7k+iCzbUXPBHZFrMjKn8CgAguntoPHC3dFakrIOIqt/WWFqAgQboHCcC2lMe81HbGLQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxPv4PyOni08ZTJ3+llIzVnJi0GJns/lK0c3XTqTAVUcgmXJ9HW
	WSq0420frviHeQBPAtR7wJLf+u33cXWg2HxlDVp4NIeB//NpQDxcDv0/VQj7lvRhLJ8ipd5wxYf
	GAoJ17Xm24T2G/mFFRVLMOuQ1jh+fOZTy5wWA47UBzK/XHbwiXh8KTgajlQ==
X-Gm-Gg: AfdE7cmbw/HJbfopRgbMi6fUk4EMxdLA5entMGacigHp6chUEAMGv3ERAQoJnxgYSF3
	8qVsol1YQuBTgq4/JjgnDfFEbWYW8UYogq9Qjjq12ZC6wIkQiIFX/V/ZvpOD9wZafqgP2tGkzi0
	saC2mvX7zYb0N6uYnc8fAG7Ame5i8RsJ+QlHEadDhBiwDSepthccpnmlOfg/z2HlXPaWOnG+4W4
	Qjn5lc8Ao37cETiNVVxlTceJ8EF0e37W7CP06xSYLo1b9xV///Ma/US3HCuvOZP4/mEht9dcida
	bR02GELYgh2fNHdPtMWtgTbJxZO+K7Q71fsE2IuakJyW7zFDem1O24pTrOVM70w9Pf6DeNWzHYI
	tmsoUq04AoqYo/y9LuZ05Sk7d6S/hNV9RYSD79Q0krHp1Eb5BWj5n9wv3gEeOTParbq0HYjOMiP
	DRAncx/n85gZEBc90QXCCCc1gciaDmdV27zXh8FxSo/pxmoV3mtWJKEP5Z2sp0uCISyw/x73tcI
	+I7FA1j1GnAITD3edjNcu1QKzalaiDVAiUSgQd0Rg9b1Di/2PA5llZ7p3Ngwi/qFuiMA2EfHXYw
	yYeV7c+9tidZa+Hls2vmNbe8bhtPgz4UbOBlHL0tI73JLauKgO8QCp5NctmZ9rr7JnNbZx4=
X-Received: by 2002:a05:690e:484f:b0:664:f064:f674 with SMTP id
 956f58d0204a3-665965d9cfbmr3105413d50.61.1782980135783; Thu, 02 Jul 2026
 01:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260609070105.525348-1-wojciech.dubowik@mt.com> <0ed97c95-dc99-4fd1-a0d8-5300085475d3@cherry.de>
In-Reply-To: <0ed97c95-dc99-4fd1-a0d8-5300085475d3@cherry.de>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 2 Jul 2026 11:14:57 +0300
X-Gm-Features: AVVi8Cc06GFxQ5vRH6Sp8a_tk437J0FNnW4pgjTbyEvW-qsYUgjhs33DUW6Dtt0
Message-ID: <CAC_iWjJGOeDaxRnqSOViU7=smWtTomFN2miY6G1DRCqKxC8-DA@mail.gmail.com>
Subject: Re: [PATCH v7] tools: mkeficapsule: Rework pkcs11 support
To: Quentin Schulz <quentin.schulz@cherry.de>, Wojciech Dubowik <wojciech.dubowik@mt.com>
Cc: u-boot@lists.denx.de, Franz Schnyder <fra.schnyder@gmail.com>, trini@konsulko.com, 
	"openembedded-core @ lists . openembedded . org" <openembedded-core@lists.openembedded.org>, 
	Francesco Dolcini <francesco@dolcini.it>, Simon Glass <sjg@chromium.org>, 
	David Lechner <dlechner@baylibre.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 12:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240035

Thanks Quentin

The patch overall seems reasonable, but shouldn't the same logic be
applied to gnutls_global_deinit() & gnutls_pkcs11_deinit()?

Thanks
/Ilias

On Fri, 26 Jun 2026 at 13:32, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> +Cc Heinrich and Ilias, maintainers of tools/mkeficapsule.c according to
> ./scripts/get_maintainer.pl
>
> On 6/9/26 9:01 AM, Wojciech Dubowik wrote:
> > From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> >
> > Some distros like OpenEmbedded are using gnutls library
> > without pkcs11 support and linking of mkeficapsule will fail.
> > It would make maintenance of default configs a hurdle.
> > Add detection of pkcs11 support in gnutls so it's enabled
> > when available and doesn't need to be set explicitly.
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> > Acked-by: Quentin Schulz <quentin.schulz@cherry.de>
> > Suggested-by: Tom Rini <trini@konsulko.com>
> > Cc: Franz Schnyder <fra.schnyder@gmail.com>
> > Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> > ---
> > Changes in v7:
> > - fixed return code in import_pkcs11_crt to restore the old
> >    behaviour, spotted by Simon
> > Changes in v6:
> > - removed return code check from gnutls_x509_crt_import_pkcs11
> >     sugessted by Quentin, to be sent in separate patch later
> > Changes in v5:
> > - removed more unrelated cleanup improvements spotted by
> >     Quentin, to be sent in another patch later
> > Changes in v4:
> > - abstract pkcs11 init function
> > - removed unrelated cleanup improvements, to be sent in
> >     another patch later
> > Changes in v3:
> > - remove config option for pkcs11 support and add auto
> >     detection in Makefile
> > - reduce amount of ifdefs by abstracting import pkcs11
> >     functions
> > - add missing free and deinit functions
> > Changes in v2:
> > - make use of stderr more consistent
> > - add missing ifndef around pkcs11 deinit functions
> > ---
> >   tools/Makefile       |  5 +++
> >   tools/mkeficapsule.c | 95 +++++++++++++++++++++++++++++++++-----------
> >   2 files changed, 77 insertions(+), 23 deletions(-)
> >
> > diff --git a/tools/Makefile b/tools/Makefile
> > index 1a5f425ecdaa..e85f5a354b81 100644
> > --- a/tools/Makefile
> > +++ b/tools/Makefile
> > @@ -271,6 +271,11 @@ mkeficapsule-objs := generated/lib/uuid.o \
> >       $(LIBFDT_OBJS) \
> >       mkeficapsule.o
> >   hostprogs-always-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
> > +GNUTLS_SUPPORTS_P11KIT = $(shell pkg-config --libs gnutls --print-requires-private \
> > +                      2> /dev/null | grep p11-kit-1)
> > +ifeq ($(GNUTLS_SUPPORTS_P11KIT),p11-kit-1)
> > +HOSTCFLAGS_mkeficapsule.o += -DMKEFICAPSULE_PKCS11
> > +endif
> >
> >   include tools/fwumdata_src/fwumdata.mk
> >
> > diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
> > index ec640c57e8a5..c3cf48f4cc1d 100644
> > --- a/tools/mkeficapsule.c
> > +++ b/tools/mkeficapsule.c
> > @@ -207,6 +207,71 @@ static int write_capsule_file(FILE *f, void *data, size_t size, const char *msg)
> >       return 0;
> >   }
> >
> > +#ifdef MKEFICAPSULE_PKCS11
> > +static int pkcs11_init(void)
> > +{
> > +     const char *lib;
> > +     int ret;
> > +
> > +     lib = getenv("PKCS11_MODULE_PATH");
> > +     if (!lib) {
> > +             fprintf(stdout,
> > +                     "PKCS11_MODULE_PATH not set in the environment\n");
> > +             return -1;
> > +     }
> > +
> > +     gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);
> > +     gnutls_global_init();
> > +
> > +     ret = gnutls_pkcs11_add_provider(lib, "trusted");
> > +     if (ret < 0) {
> > +             fprintf(stdout, "Failed to add pkcs11 provider\n");
> > +             return -1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> > +{
> > +     gnutls_pkcs11_obj_t *obj_list;
> > +     unsigned int obj_list_size = 0;
> > +     int ret;
> > +
> > +     ret = gnutls_pkcs11_obj_list_import_url4(&obj_list, &obj_list_size,
> > +                                              ctx->cert_file, 0);
> > +     if (ret < 0 || obj_list_size == 0)
> > +             return -1;
> > +
> > +     gnutls_x509_crt_import_pkcs11(*x509, obj_list[0]);
> > +
> > +     return 0;
> > +}
> > +
> > +static int import_pkcs11_key(gnutls_privkey_t *pkey, struct auth_context *ctx)
> > +{
> > +     return gnutls_privkey_import_pkcs11_url(*pkey, ctx->key_file);
> > +}
> > +#else
> > +static int pkcs11_init(void)
> > +{
> > +     fprintf(stderr, "Pkcs11 support is disabled\n");
> > +     return -1;
> > +}
> > +
> > +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> > +{
> > +     fprintf(stderr, "Pkcs11 support is disabled\n");
> > +     return -1;
> > +}
> > +
> > +static int import_pkcs11_key(gnutls_privkey_t *pkey, struct auth_context *ctx)
> > +{
> > +     fprintf(stderr, "Pkcs11 support is disabled\n");
> > +     return -1;
> > +}
> > +#endif
> > +
> >   /**
> >    * create_auth_data - compose authentication data in capsule
> >    * @auth_context:   Pointer to authentication context
> > @@ -229,9 +294,6 @@ static int create_auth_data(struct auth_context *ctx)
> >       gnutls_pkcs7_t pkcs7;
> >       gnutls_datum_t data;
> >       gnutls_datum_t signature;
> > -     gnutls_pkcs11_obj_t *obj_list;
> > -     unsigned int obj_list_size = 0;
> > -     const char *lib;
> >       int ret;
> >       bool pkcs11_cert = false;
> >       bool pkcs11_key = false;
> > @@ -243,19 +305,8 @@ static int create_auth_data(struct auth_context *ctx)
> >               pkcs11_key = true;
> >
> >       if (pkcs11_cert || pkcs11_key) {
> > -             lib = getenv("PKCS11_MODULE_PATH");
> > -             if (!lib) {
> > -                     fprintf(stdout,
> > -                             "PKCS11_MODULE_PATH not set in the environment\n");
> > -                     return -1;
> > -             }
> > -
> > -             gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);
> > -             gnutls_global_init();
> > -
> > -             ret = gnutls_pkcs11_add_provider(lib, "trusted");
> > +             ret = pkcs11_init();
> >               if (ret < 0) {
> > -                     fprintf(stdout, "Failed to add pkcs11 provider\n");
> >                       return -1;
> >               }
> >       }
> > @@ -301,14 +352,12 @@ static int create_auth_data(struct auth_context *ctx)
> >
> >       /* load x509 certificate */
> >       if (pkcs11_cert) {
> > -             ret = gnutls_pkcs11_obj_list_import_url4(&obj_list, &obj_list_size,
> > -                                                      ctx->cert_file, 0);
> > -             if (ret < 0 || obj_list_size == 0) {
> > -                     fprintf(stdout, "Failed to import crt_file URI objects\n");
> > +             ret =  import_pkcs11_crt(&x509, ctx);
> > +             if (ret < 0) {
> > +                     fprintf(stderr, "error in import_pkcs11_crt(): %s\n",
> > +                             gnutls_strerror(ret));
> >                       return -1;
> >               }
> > -
> > -             gnutls_x509_crt_import_pkcs11(x509, obj_list[0]);
> >       } else {
> >               ret = gnutls_x509_crt_import(x509, &cert, GNUTLS_X509_FMT_PEM);
> >               if (ret < 0) {
> > @@ -320,9 +369,9 @@ static int create_auth_data(struct auth_context *ctx)
> >
> >       /* load a private key */
> >       if (pkcs11_key) {
> > -             ret = gnutls_privkey_import_pkcs11_url(pkey, ctx->key_file);
> > +             ret = import_pkcs11_key(&pkey, ctx);
> >               if (ret < 0) {
> > -                     fprintf(stderr, "error in %d: %s\n", __LINE__,
> > +                     fprintf(stderr, "error in import_pkcs11_key(): %s\n",
> >                               gnutls_strerror(ret));
> >                       return -1;
> >               }
>

