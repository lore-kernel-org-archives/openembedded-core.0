Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC4CCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 17:01:41 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24763.1780505514570645091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 09:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@chromium.org header.s=google header.b=Rrm7UwKS;
 spf=pass (domain: chromium.org, ip: 209.85.218.45, mailfrom: sjg@chromium.org)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so152315866b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 09:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780505513; cv=none;
        d=google.com; s=arc-20240605;
        b=aVm9Ie0ida+aIE9GHd9la7qChiDbjg68PypeAnUlsBzGquRrCF1d2wdXloJbQi5ve3
         FSxg+HIzcRrvRxTPwSFM8CMfPlgF2qfGwrKONWGGD2zVFUI4M22xXPz/OasOKSlH/klb
         imsE0NaLHG5R2JXQE5cfdqgYZCFAu1LLoz9ABy1TrOg595pxjoAzhKnuUNZiwrz1NUQ0
         jH132h+TxHMPuNf40AgtgnATt5BblawGQyakG+40MtQIPhvVXDcMtA2obVybKDNiOOZO
         m8BaQSSZRN9sEGX7xo3ewPZ/z+TkxO7OWbPFrSv8I4LMuAOozoNG4RJAzw3Klcoh3GlY
         rPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DUlmzIN/0RPQ+249f2ZZ84EK2MT5Ti3W8RmNCR6zK9U=;
        fh=4g32b9bV3OXCssbsd5Z4ayDUxBFK595DFV6wgBPdieE=;
        b=gKSdGNbgjKu1WFW5bzlwIWz+ucNnrWEbI/+M2Rj8oJvI8rXBwL/9W8LwiQ9CK7QmoA
         KBuL3DSqHpR6GjyWghFyor7jwwQn9xoCOI0AOUTWU+g07ZoGw80lUS1/3E6NHx7ZOf2b
         yazbF/PFcNm6G7WOGiifzyP1EXJSzUPE8FTD15imoR/f24sT8pIrgq4dQPd9ZTRfMKci
         fyh3fYMyYjAwoWtIVyWGVBpL/23nvp0PGBfzjmft0WDs5JkTssp4/NVUmwP69CdUhcf2
         HWhNg0fTDGo7NWHjObda1MkrLEUE2iGYuYubGaO1R5DyVVVVcwPcvcyDKfSeOYM04eNP
         qqKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780505513; x=1781110313; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUlmzIN/0RPQ+249f2ZZ84EK2MT5Ti3W8RmNCR6zK9U=;
        b=Rrm7UwKSyW50WEvMMZH8A2945YPhQ198W8A1/lQ2ppj0GXN4zGQtK6SM9e+sMqNicB
         jLjenxW1ng/l8dZXqPW3Swfhmc3VkKi+Bym6AEF7iPDSsRjX7qtXitK5nuiaNb7RKvc5
         YsS4QX+Qf+gOETfrMoHLtcakMgmftQ8nERd50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780505513; x=1781110313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUlmzIN/0RPQ+249f2ZZ84EK2MT5Ti3W8RmNCR6zK9U=;
        b=Ywu7J4IORLR6JHGD+QcIl+hfhSiyvyT6+wvU7CbaN095tRs+nTg/nGfEmrZTRqWHAN
         cuNKWKro1YmU1Nu6nQNZZ2yoAnfz+KOOxE26mbQ4cF5jAWZzWI9czEBpRcE2t/ej8/kX
         jPG9vlDIBdxAzG0Y3kAq7PArm/JoPNgmt2Mw1nhkPZX9rOn5jrRdElPXu/eRz42rniM5
         mxMT2Dh5HFvDHnRW2fqwBAgS5+buNlK9gyzqF7N8RevcbHX3NDLs5A5/7JKIJTqNNzfS
         CV9j73nkiD+Dz12Qq1spxjWZuNIF7fYgrOogNWoDHiUDBwQQRDoaRHlR0VlGxgNoGa0d
         Ty+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6c4naAnfWqUxe7a9yzHnfY1xFC62Wexat/j91rGQHEbiT24MGIHqkwbS/Vi9chzaCgSarroyT6UaEKtUT9Vpi8w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywy4/5K4aoqu6nCo6EBYW2F6Hmo3lGDhtZsDjQ9WMvU2J8zL9rw
	tO+1iundVZdB7GMWBrQGMPMDsmiDKKZNZQ3LeRuyhVMz5BFGJliqTqcoi4SVLXv8eFkgt/gLEB4
	lmW5W828zpc53HxVFURkMVlWbo/FIG4yNTWas+WpHrrk3oObtwlWn8g==
X-Gm-Gg: Acq92OFbFE1gvqQwAhIRPY41xUxkpNf09MOoHbFsqog4NXArJd5EkGfx4MDMA/rJvzH
	QDRmhrrpXMiIxVq55azx7/KuKQbTPChOZr4KcWLiSOU+fqd7qD55xrTUu+CvuF/9QohYp5z8zDb
	hz7sAJA2EyKStxKkwxiJUoI2j1m2WjoateQ1+onFnlY/ZWq3BZpRvPbBIBB3ZHlzQP2ZkEfKNTI
	L2fa8kVGhVE02SNP95+cTwFlTlfM7eh69ovVVoIT9c+kQwg4Hixb6vTbp7m4yMqQiWremqhNpQd
	6lL9uLGS1QKNqhQo
X-Received: by 2002:a17:907:6d11:b0:beb:2980:e2d2 with SMTP id
 a640c23a62f3a-bf1d1c83194mr15779166b.8.1780505026677; Wed, 03 Jun 2026
 09:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260528080356.399082-1-Wojciech.Dubowik@mt.com>
In-Reply-To: <20260528080356.399082-1-Wojciech.Dubowik@mt.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 3 Jun 2026 10:43:34 -0600
X-Gm-Features: AVHnY4LEQqHrCfrkAR4qrUE3iuTMiG7crq-6jGiVCZGYhGs9A6gobyy10Txe_OY
Message-ID: <CAFLszThvtrgFCdvOa1-QYYcrefW=vt95jwMfr+QQykE8E1hg-g@mail.gmail.com>
Subject: Re: [PATCH v5] tools: mkeficapsule: Rework pkcs11 support
To: Wojciech.Dubowik@mt.com
Cc: u-boot@lists.denx.de, Franz Schnyder <fra.schnyder@gmail.com>, trini@konsulko.com, 
	"openembedded-core @ lists . openembedded . org" <openembedded-core@lists.openembedded.org>, 
	Francesco Dolcini <francesco@dolcini.it>, Simon Glass <sjg@chromium.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 17:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238104

Hi Wojciech,

On 2026-05-28T08:03:54, Wojciech Dubowik <Wojciech.Dubowik@mt.com> wrote:
> tools: mkeficapsule: Rework pkcs11 support
>
> Some distros like OpenEmbedded are using gnutls library
> without pkcs11 support and linking of mkeficapsule will fail.
> It would make maintenance of default configs a hurdle.
> Add detection of pkcs11 support in gnutls so it's enabled
> when available and doesn't need to be set explicitly.
>
> Suggested-by: Tom Rini <trini@konsulko.com>
> Cc: Franz Schnyder <fra.schnyder@gmail.com>
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> Acked-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> tools/Makefile       |  5 +++
>  tools/mkeficapsule.c | 95 +++++++++++++++++++++++++++++++++++++++-------------
>  2 files changed, 77 insertions(+), 23 deletions(-)

> diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
> @@ -207,6 +207,71 @@ static int write_capsule_file(FILE *f, void *data, size_t size, const char *msg)
> +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> +{
> +     gnutls_pkcs11_obj_t *obj_list;
> +     unsigned int obj_list_size = 0;
> +     int ret;
> +
> +     ret = gnutls_pkcs11_obj_list_import_url4(&obj_list, &obj_list_size,
> +                                              ctx->cert_file, 0);
> +     if (ret < 0 || obj_list_size == 0)
> +             return ret;

!obj_list_size

Behaviour change: when obj_list_size == 0 but ret >= 0, the caller's
'if (ret < 0)' check passes and execution continues with an empty
obj_list. Please return -1 explicitly in that case.

> +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> +{

...
> +     ret = gnutls_x509_crt_import_pkcs11(*x509, obj_list[0]);
...
> +static int import_pkcs11_key(gnutls_privkey_t *pkey, struct auth_context *ctx)
> +{
> +     return gnutls_privkey_import_pkcs11_url(*pkey, ctx->key_file);
> +}

gnutls_x509_crt_t and gnutls_privkey_t are already pointer typedefs
and neither function reassigns the handle, so the extra indirection
buys nothing. Please pass the handles by value and drop the '&' at the
call sites.

> +#else
> +static int pkcs11_init(void)
> +{
> +     fprintf(stderr, "Pkcs11 support is disabled\n");
> +     return -1;
> +}
> +
> +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> +{
> +     fprintf(stderr, "Pkcs11 support is disabled\n");
> +     return -1;
> +}
> +
> +static int import_pkcs11_key(gnutls_privkey_t *pkey, struct auth_context *ctx)
> +{
> +     fprintf(stderr, "Pkcs11 support is disabled\n");
> +     return -1;
> +}
> +#endif

"PKCS#11 support..."

import_pkcs11_crt() and import_pkcs11_key() are only reached after
pkcs11_init() has already failed with the same message, so these two
stubs look like dead code.

> @@ -243,19 +305,8 @@ static int create_auth_data(struct auth_context *ctx)
>       if (pkcs11_cert || pkcs11_key) {
> -             lib = getenv('PKCS11_MODULE_PATH');
...
> +             ret = pkcs11_init();
>               if (ret < 0) {
> -                     fprintf(stdout, "Failed to add pkcs11 provider\n");
>                       return -1;
>               }
>       }

Single-statement block, drop the braces. Or fold to 'if (pkcs11_init()
< 0) return -1;' since ret is not used afterwards.

> @@ -301,14 +352,12 @@ static int create_auth_data(struct auth_context *ctx)
>       /* load x509 certificate */
>       if (pkcs11_cert) {
> +             ret =  import_pkcs11_crt(&x509, ctx);

Double space after '='.

Regards,
Simon

