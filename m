Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DD8CD6E74
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 17:26:46 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.190.1780592312023040590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 09:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@chromium.org header.s=google header.b=ia5bZ8U+;
 spf=pass (domain: chromium.org, ip: 209.85.218.48, mailfrom: sjg@chromium.org)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bec449cf976so131809066b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 09:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780592310; cv=none;
        d=google.com; s=arc-20240605;
        b=S7hFsovh7ja/VNrbC10OgQxifc7O/GHTLN9Z9S+YZXTM6iMNysWQfDbJjTBTiQ+806
         zQrkAmuaStajPgEbbZr8G63nC97vnRnTpzy3fsfNOIcdt+TD0u/Q2O1ImVem3JDiiKZI
         ZQy85UGGkC7YcUKmeeSc/0dQOaE6LOF2UZknmm/Oxc2VbOTLg2O29hFYGVDOS/87n6bP
         rrmLWFph+1r3Cyv/iICLBHKwHEpITETTUKvMs0wBp9xOYVb5I/gPvHfmax4afaaTRBHr
         9n+lQgtCJ4VsZCzIf3jP8uBBhYof/+0givUP1ioA7Lhxj9MAjdgACCngzSoYAFsHQT9Z
         LoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JOGsE8z/zdxeMVLYmq7Bk1XR9OO7NUyVYoegHNHY+Cg=;
        fh=rOztQ+GOyFjKgYbVEdwB2ZCt0pURPRWs0cmzMZQoSDE=;
        b=HnKIINUgYG0uZHb4XYikODRM0oTfw32G0n6txqdSeBgnf3ErUjqjkJd9zoGZj4bVGr
         IF1llzdaNJSHtGUTZWrjDbufiO2H6fPHNcvURd9J4Jc7/nW1/cphy4atPy6wzB5yOQzv
         zOF21cL5agzDtaIBWUYjPw3RATTCE5zGLSqBLkyzEf0BNope4nj5Hd4jj6655mh09PuL
         hDe3hmDP8ZR+pFaBipjytIauY2jC5wF5kTjZ064HNdK9m+cVxJv5t92bodKM6kLuGJe5
         ERdxvkHvXFoeS9msu9gCQBZvWMSz7qcOHVpS914kVAKvGtylBvpMeUN9ZUNdi+FAOvMr
         696g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780592310; x=1781197110; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JOGsE8z/zdxeMVLYmq7Bk1XR9OO7NUyVYoegHNHY+Cg=;
        b=ia5bZ8U+7Mry9U+j636eRtnU9U28gvoC/vzYNJyaOHFgGXsV6zz9dd3R8jyb22NW89
         NGCgvK61S4M5RBgMy1tRdZHMVr+ZSDIc4/D1iCfeivPt4Py65w56VLZJU0XNZGd5cgEQ
         qJ9vRazKccv5uS7v6FaqhYmHrnE5XrLpdShEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780592310; x=1781197110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOGsE8z/zdxeMVLYmq7Bk1XR9OO7NUyVYoegHNHY+Cg=;
        b=s9mJDbRL7IIlGcswLqadNJ6iEVGYg4dwpePVIj2FLJ9eSZ7rc46AyZoHY0WUeyMZDB
         M0uZ7B9o/L1Xx1S5n5UUt5DD2L/9M/p4sQ82f80pw93zzhSnQAVat4fBIM0wGAySUrL7
         aImdTLp5to4WYpd0GYTEx9aeN3JZtyAjIjr3EAg2FbvlI6vqLyD2gmqxhk3T5ARkMTu5
         W2ihu4j2UVhi39WAvYDuBhpbvOivlgL051Wx7xnkCs3pow4InTQ8LgTU77SxGpNKvcON
         1/iIAopchouVyEChK76s/1KTNXdgTBxAu8sz7tQ/QggTci4MCDP33+rwaWmJxcLVdOGA
         vxvA==
X-Forwarded-Encrypted: i=1; AFNElJ+gdk0nR701jAREMq5aRdAOVk8ZUioO/ZkRDSHxj2MBsST8wVJvfaYN4RS4nu4K3u+TDBnVgNmWA1ghxBA2E+AnfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWJVvjkDKkcVi7tPSv3xf8CeUosnY2PH13eK5eFKMpJYk9xHDS
	SmKh5IGgTW+aI+wP4DwyheFCj/B0YUDxUFMH66jQIhd04HZ8yUx56OZbnXoyyAFXZhLmjI4/xdY
	dxrdn1SxIXzZTws7ppy6zhaEnyLHUb/UTiMqPYnEy
X-Gm-Gg: Acq92OFFmT95khfBTrMLQWgfriGXIdliJ8eNWKPeJeAp/tqR6VbrxE2MTSrJHx/WR8N
	hAbVQQcflP8mYPZRG+thfwxIFPF+BXQuNbSW4zUYphz/4IvMK9luM1qk6TUiCmxuL63pen4gIEn
	qLY/VNudhDDOM31NP7bdre8Qf/Emdqa+nT6Z6NHE0dB2CxeE18zVTmUV3tLqlb07QjegkHmAS2p
	Ycmz/d0fzePBUTCmbPFc1yutC4jn04rmrrCWTsjn88KJ2mZvXDL2+YOgPrvdxHMVhp6j4BSIuLy
	zGkIAZP5qR/20B04
X-Received: by 2002:a17:907:cf87:b0:bdd:52ef:73e3 with SMTP id
 a640c23a62f3a-bf0a8d277c9mr515951066b.12.1780592310373; Thu, 04 Jun 2026
 09:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260528080356.399082-1-Wojciech.Dubowik@mt.com>
 <CAFLszThvtrgFCdvOa1-QYYcrefW=vt95jwMfr+QQykE8E1hg-g@mail.gmail.com> <549986cc-e647-4f7b-8bd9-8747f04d9789@cherry.de>
In-Reply-To: <549986cc-e647-4f7b-8bd9-8747f04d9789@cherry.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 4 Jun 2026 10:58:18 -0600
X-Gm-Features: AVVi8CdEMRP9jJpJ9xuOcVl_rP0bYRY8z0qgFXwodNOojEsFBkHOT9rmDDCiWoM
Message-ID: <CAFLszTgW51om6z4nfaW10r8CDDKmibbapwQSPfXMwpACzU4McQ@mail.gmail.com>
Subject: Re: [PATCH v5] tools: mkeficapsule: Rework pkcs11 support
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Wojciech.Dubowik@mt.com, u-boot@lists.denx.de, 
	Franz Schnyder <fra.schnyder@gmail.com>, trini@konsulko.com, 
	"openembedded-core @ lists . openembedded . org" <openembedded-core@lists.openembedded.org>, 
	Francesco Dolcini <francesco@dolcini.it>, David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 17:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238134

Hi Quentin,

On Wed, 3 Jun 2026 at 11:16, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Simon,
>
> There's a v6 already, please post your reviews there again if applicable.
>
> On 6/3/26 6:43 PM, Simon Glass wrote:
> > Hi Wojciech,
> >
> > On 2026-05-28T08:03:54, Wojciech Dubowik <Wojciech.Dubowik@mt.com> wrote:
> >> tools: mkeficapsule: Rework pkcs11 support
> >>
> >> Some distros like OpenEmbedded are using gnutls library
> >> without pkcs11 support and linking of mkeficapsule will fail.
> >> It would make maintenance of default configs a hurdle.
> >> Add detection of pkcs11 support in gnutls so it's enabled
> >> when available and doesn't need to be set explicitly.
> >>
> >> Suggested-by: Tom Rini <trini@konsulko.com>
> >> Cc: Franz Schnyder <fra.schnyder@gmail.com>
> >> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> >> Acked-by: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> tools/Makefile       |  5 +++
> >>   tools/mkeficapsule.c | 95 +++++++++++++++++++++++++++++++++++++++-------------
> >>   2 files changed, 77 insertions(+), 23 deletions(-)
> >
> >> diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
> >> @@ -207,6 +207,71 @@ static int write_capsule_file(FILE *f, void *data, size_t size, const char *msg)
> >> +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> >> +{
> >> +     gnutls_pkcs11_obj_t *obj_list;
> >> +     unsigned int obj_list_size = 0;
> >> +     int ret;
> >> +
> >> +     ret = gnutls_pkcs11_obj_list_import_url4(&obj_list, &obj_list_size,
> >> +                                              ctx->cert_file, 0);
> >> +     if (ret < 0 || obj_list_size == 0)
> >> +             return ret;
> >
> > !obj_list_size
> >
> > Behaviour change: when obj_list_size == 0 but ret >= 0, the caller's
> > 'if (ret < 0)' check passes and execution continues with an empty
> > obj_list. Please return -1 explicitly in that case.
> >
>
> Yes, good catch, we can have ret == 0 here when obj_list_size==0 and
> thus return 0.
>
> >> +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> >> +{
> >
> > ...
> >> +     ret = gnutls_x509_crt_import_pkcs11(*x509, obj_list[0]);
> > ...
> >> +static int import_pkcs11_key(gnutls_privkey_t *pkey, struct auth_context *ctx)
> >> +{
> >> +     return gnutls_privkey_import_pkcs11_url(*pkey, ctx->key_file);
> >> +}
> >
> > gnutls_x509_crt_t and gnutls_privkey_t are already pointer typedefs
> > and neither function reassigns the handle, so the extra indirection
> > buys nothing. Please pass the handles by value and drop the '&' at the
> > call sites.
> >
> >> +#else
> >> +static int pkcs11_init(void)
> >> +{
> >> +     fprintf(stderr, "Pkcs11 support is disabled\n");
> >> +     return -1;
> >> +}
> >> +
> >> +static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
> >> +{
> >> +     fprintf(stderr, "Pkcs11 support is disabled\n");
> >> +     return -1;
> >> +}
> >> +
> >> +static int import_pkcs11_key(gnutls_privkey_t *pkey, struct auth_context *ctx)
> >> +{
> >> +     fprintf(stderr, "Pkcs11 support is disabled\n");
> >> +     return -1;
> >> +}
> >> +#endif
> >
> > "PKCS#11 support..."
> >
> > import_pkcs11_crt() and import_pkcs11_key() are only reached after
> > pkcs11_init() has already failed with the same message, so these two
> > stubs look like dead code.
> >
>
> How do you compile the code if you don't have those stubs?

I haven't tried building it, but just from the look of it, it seems
that the procedure will fail if pkcs11_init() is called. So why do we
need stubs for the other two functions, which are called later?

I suggest putting the #if inside the functions rather than having
entirely separate stubs.

But anyway as this is already on v6, my feedback is minor and I should
have noticed this earlier...

Reviewed-by: Simon Glass <sjg@chromium.org>

Regards,
Simon

