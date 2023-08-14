Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EEEC001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 17:20:14 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.113594.1692033611769360646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 10:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=itPUR/yI;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99d937b83efso268667266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692033610; x=1692638410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ6Mr2ZDXldI8kaMvWgTsB1/5kLro/isFiuseJYzawU=;
        b=itPUR/yIbzfvV0OcVX77LCv+FbhGJb+FFobprWBjq5clkqZqLdaJebyLh5NiH0casA
         lGCa6uAekOpp8oqxIf1DPE5Jm28Ivq+hlbbH2ibL1RBmgAmeWEqq1xplC3pCDPy676Cm
         3sQtV3BgQEBGm+yk5Og3Qlae47/e2yALk0ex8ObqJIZA+E4XbbPo09/KPX1GGDmArUc1
         8uac62dCCJ4HBh+9GbptvEopzvvRBlwQb9eUL4r4qVWF8lxH5ijjfFzUSzMD2ZXgOyVJ
         AjtI8SYDVxyoGZYguidB+5tgb7Hkx2WmX28JjgZ2Jzk/7P2ECiPHul0ecxoGZROrwpgM
         Wg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692033610; x=1692638410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ6Mr2ZDXldI8kaMvWgTsB1/5kLro/isFiuseJYzawU=;
        b=F/XPoCmTDJgL+EYyi9Jqks3O6JMOP08EItfii9VLohG5vgIRqb/3AdPyMoYmg4GyA4
         fQOkiD0BhM6ilNuKx7+kx5E1r9+VddgczGMCg/Wx2ycYwumpVbMu262oW6IGGezm1KHo
         RX70zFAVrl770NrFt+1LgwC2lz+YhzVmjdWa0FS2V6dnJsafNwo4QB/pSOoAbq4jt1VR
         jnNIxbwcuAgdiqbkt2pwjvahOHELmlnBA/LoMDDPe5rKipGdGqg+EvAqCDByzE4RM7/K
         56PbOXq3QaCJHNdq7DKIC7lbJ0dUl7/EFZqNPm4MpczQfKuR5bLS2bSQmSu2PJq/THWY
         F/mQ==
X-Gm-Message-State: AOJu0YyAD4IFHNSUoNAOGQ5gRC82wMBTxMi2VHb6TSZ5ZpRCjU4RWsyH
	y3M1ENQ9GAnu8r9TChapIEpDoQxlG8M3aaimJlF0lERqUVRlRVxzcZk=
X-Google-Smtp-Source: AGHT+IFKmtQ8emUMgZpdmO3B8XhtNb0tWAS0Zv+0QVM3rqasuAgr4jxyYil24Xv5jFUZpj5+U9sJdp4SX2X2W6P8czw=
X-Received: by 2002:a17:907:1dea:b0:99d:9a14:4f1b with SMTP id
 og42-20020a1709071dea00b0099d9a144f1bmr4966005ejc.55.1692033609987; Mon, 14
 Aug 2023 10:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230814161637.4700-1-asharma@mvista.com>
In-Reply-To: <20230814161637.4700-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Aug 2023 07:19:59 -1000
Message-ID: <CAOSpxdZ1gTbZamakKLUScVa_wWeU50jwt8DxNx9OOA37hLA4fA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] openssl: Backport fix CVE-2023-2975
To: Ashish Sharma <asharma@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 17:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185942

Hi Ashish,

This CVE and a couple of others were previously fixed with a
bug/security fix version bump:

https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=3D9=
4ce10791ce10aa30d3a3bdef53f9b2f3c1b331a

Steve

On Mon, Aug 14, 2023 at 6:19=E2=80=AFAM Ashish Sharma <asharma@mvista.com> =
wrote:
>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../openssl/openssl/CVE-2023-2975.patch       | 61 +++++++++++++++++++
>  .../openssl/openssl_3.0.9.bb                  |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-29=
75.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch
> new file mode 100644
> index 00000000000..fe78e87a831
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch
> @@ -0,0 +1,61 @@
> +From 00e2f5eea29994d19293ec4e8c8775ba73678598 Mon Sep 17 00:00:00 2001
> +From: Tomas Mraz <tomas@openssl.org>
> +Date: Tue, 4 Jul 2023 17:30:35 +0200
> +Subject: [PATCH] Do not ignore empty associated data with AES-SIV mode
> +
> +The AES-SIV mode allows for multiple associated data items
> +authenticated separately with any of these being 0 length.
> +
> +The provided implementation ignores such empty associated data
> +which is incorrect in regards to the RFC 5297 and is also
> +a security issue because such empty associated data then become
> +unauthenticated if an application expects to authenticate them.
> +
> +Fixes CVE-2023-2975
> +
> +Reviewed-by: Matt Caswell <matt@openssl.org>
> +Reviewed-by: Paul Dale <pauli@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/21384)
> +
> +(cherry picked from commit c426c281cfc23ab182f7d7d7a35229e7db1494d9)
> +
> +Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=3Dopenssl.g=
it;a=3Dpatch;h=3D00e2f5eea29994d19293ec4e8c8775ba73678598]
> +CVE: CVE-2023-2975
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + .../implementations/ciphers/cipher_aes_siv.c   | 18 +++++++++++-------
> + 1 file changed, 11 insertions(+), 7 deletions(-)
> +
> +diff --git a/providers/implementations/ciphers/cipher_aes_siv.c b/provid=
ers/implementations/ciphers/cipher_aes_siv.c
> +index 45010b90db..b396c8651a 100644
> +--- a/providers/implementations/ciphers/cipher_aes_siv.c
> ++++ b/providers/implementations/ciphers/cipher_aes_siv.c
> +@@ -120,14 +120,18 @@ static int siv_cipher(void *vctx, unsigned char *o=
ut, size_t *outl,
> +     if (!ossl_prov_is_running())
> +         return 0;
> +
> +-    if (inl =3D=3D 0) {
> +-        *outl =3D 0;
> +-        return 1;
> +-    }
> ++    /* Ignore just empty encryption/decryption call and not AAD. */
> ++    if (out !=3D NULL) {
> ++        if (inl =3D=3D 0) {
> ++            if (outl !=3D NULL)
> ++                *outl =3D 0;
> ++            return 1;
> ++        }
> +
> +-    if (outsize < inl) {
> +-        ERR_raise(ERR_LIB_PROV, PROV_R_OUTPUT_BUFFER_TOO_SMALL);
> +-        return 0;
> ++        if (outsize < inl) {
> ++            ERR_raise(ERR_LIB_PROV, PROV_R_OUTPUT_BUFFER_TOO_SMALL);
> ++            return 0;
> ++        }
> +     }
> +
> +     if (ctx->hw->cipher(ctx, out, in, inl) <=3D 0)
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.9.bb
> index 849bd7e5a69..61e81cfa09d 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> +           file://CVE-2023-2975.patch \
>             "
>
>  SRC_URI:append:class-nativesdk =3D " \
> --
> 2.35.7
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185938): https://lists.openembedded.org/g/openembedde=
d-core/message/185938
> Mute This Topic: https://lists.openembedded.org/mt/100740204/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

