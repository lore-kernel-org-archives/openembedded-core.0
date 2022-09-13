Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98B6C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 19:43:26 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web08.2171.1663098196373372607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 12:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=co27ZZYB;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id
 a1-20020a4ab101000000b0044acf001f83so2106870ooo.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 12:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3q9ZzuI6PAsdmkjgrMbTogJANaIEeLSbYixG2LU/rDg=;
        b=co27ZZYB1ePFJgjKmpzVtwY6sHtOG0Bk7CG1yrpXibKqbGjOx3MXBr+IDqbnlie70h
         mDH6drbEqkc+ul4kmXzYi0v5DoAVf0NW2Cs221blQMZVA1ihA2wB53uGtlI5YbYOfPeq
         RBpZTqX+fNwD7pAEtreMqGlb+6aAsRnrm2ljjmOuuYRaV2cUYDgpFvoBxhoIcwdLlOA8
         +yWS6wUbXWep+9yWnEBu/3E2eFG2b08ZQRUjk2YOjfVqBIqE0iPnavZUpFgCYMKKztEu
         QJ/tRrgX8hDvfW4sK3Sccl+hgiWKbHm1j9K197kg6hzUaf5p61ABF3yzwjiGs1A5Q2yp
         uZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3q9ZzuI6PAsdmkjgrMbTogJANaIEeLSbYixG2LU/rDg=;
        b=KVdanyjY362g5TrXKpx51InFYR/vy0/ym6Jns3rZf4qH1vt9CXAvMoL8dj/y+XwWOj
         wLDCFNG2k3maanXcpfn+ppTg1+3qo3I+e7eWd4Q2f0vB4krOFY1t6bp1vQn/tj8hW2er
         DV3m8syyWXWAYRLojwK3RJsmKK6K6h/hwV8DTgh9Jtn+CRNkaEod0csACbX7ikNUOCVW
         a1BIPJC9vVxEqGeDm1JZ/Vb++PyQen0LinXNNSxfKpK3U6Hvg9kXlOCBf6aFY/2V5Typ
         QH5+FI+yf5StbQavT2uvDFJVfvwo/jvak31d0fk8kg7YV4rEd8ZbQX49JGjIcsrYeHva
         bj6Q==
X-Gm-Message-State: ACgBeo1wWvPp3wmuDKLSjrdLi4F/KqWlSWnJOXFmvS7liGXPLGHWaCbb
	U1pDBlld2EIzCT6HML/XmHbWNkxBL407P7iRo6c=
X-Google-Smtp-Source: 
 AA6agR6UEP27iAlQpsIauHaVboA5rEY0GmxK52t+PJ0F1STvuNAxo2x88NyQ1jtcHHvrnVepgR339iDQhAQkWV3uP1M=
X-Received: by 2002:a4a:d129:0:b0:475:62e0:d7fb with SMTP id
 n9-20020a4ad129000000b0047562e0d7fbmr4769421oor.9.1663098195665; Tue, 13 Sep
 2022 12:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
In-Reply-To: <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Sep 2022 12:42:49 -0700
Message-ID: 
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: enable zstd support
To: Alex Stewart <alex.stewart@ni.com>
Cc: ecordonnier@snapchat.com, openembedded-core@lists.openembedded.org,
	Etienne Cordonnier <ecordonnier@snap.com>, Alex Feinman <afeinman@snap.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 19:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170609

On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart <alex.stewart@ni.com> wrote:
>
> ACK from me - apart from enabling zstd by default.
>
> On 9/13/22 07:37, Etienne Cordonnier via lists.openembedded.org wrote:
> > This allows the use of zstd for opkg packages by using OPKGBUILDCMD:
> > OPKGBUILDCMD = "opkg-build -Z zstd"
> >
> > Signed-off-by: Alex Feinman <afeinman@snap.com>
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >   meta/recipes-devtools/opkg/opkg_0.6.0.bb | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> > index 7b351e8123..e38d9d6f3f 100644
> > --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> > +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> > @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
> >   target_localstatedir := "${localstatedir}"
> >   OPKGLIBDIR ??= "${target_localstatedir}/lib"
> >
> > -PACKAGECONFIG ??= "libsolv"
> > +PACKAGECONFIG ??= "libsolv zstd"
>
> Building in zstd support by default is a little suspect to me.
>
> Unless I'm mistaken, OE-core will only build xz-compressed IPKs by
> default. So zstd support would be unnecessary for a distro integrator
> who just uses upstream OE-core.
>
> For distros which use zstd compression in their packages, I think it
> would be more appropriate to overwrite the opkg PACKAGECONFIG in a
> .bbappend.
>

This is perhaps fine. I do wonder if there is some performance
comparison data between xz and zstd compressed ipks
with opkg, it might help users on making this choice and also if we
should consider using
zstd by default at some point or not.

> Is there something I'm not considering here?
>
> >
> >   PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
> >       gnupg gpgme libgpg-error,\
> > @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
> >   PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
> >   PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
> >   PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
> > +PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
> >   PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
> >
> >   EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
> >
> >
> >
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170608): https://lists.openembedded.org/g/openembedded-core/message/170608
> Mute This Topic: https://lists.openembedded.org/mt/93654146/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

