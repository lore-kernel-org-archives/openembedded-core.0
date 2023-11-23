Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32882C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:54:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.92491.1700751290009968194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VSD7h6nG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso6131155e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700751288; x=1701356088; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ejqUSbga4Dz31Pm862NhGuTgLVylteigx1OTCRT03A4=;
        b=VSD7h6nGljG5J+27NxGKpdu8NdwdwK/2ZBcD9tyTCURC7soT+/e0dUv/s9kemblQKe
         UULCdYSU4h7Uko3qLjX4I8PK3YJr2X8BaF6+mwtFbEC+Jjg+jzSdPNVUtJk2V3TLFK3t
         BFqhTH59WOhmaJUzGb3o4nzV0ejblAITXt0C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751288; x=1701356088;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejqUSbga4Dz31Pm862NhGuTgLVylteigx1OTCRT03A4=;
        b=UFlpF06XpbRNiOYGNV0zRqJLEaOCAwVydevJ5vYkli9y4rW/zQ0YXZBcf8+orjhwoX
         JGp48V+D0zNp29VUpgUV2I/TP1gPw9pPazjuCiwDjk9JOCNH7ICdo7WUQgwxRnL90Lx1
         mNNXUXWAapUwSf4NOic+sjFd/UlfrUkfOcrQTLlJ3jtoIZKOwld38K55E9uRUD8JaHyU
         n+rUxViynF+XGkPMx9hHIX/DNfsGE6elhA3WeXOTttqkGXLko14fqXaiiK9MPurBb8+W
         +SO29R5aWACcDHo3vDes+05aVHPsTAC/FuoIDm1WmBnhNZ7nNN27sH5Vnffo9Lr+t82A
         ggLQ==
X-Gm-Message-State: AOJu0YyBxYD/1c1GLxodZ3/5W2xzVaxrXAjg0v/EZIyYwM2ARGCVUFT6
	6GczYKl9y89J6+FcuhXgTb7Gc/dvrkRNkhu1zXc=
X-Google-Smtp-Source: AGHT+IGUzYPQDE3v4F1SwC03pkYakM4eIY1p0Peb3tLS4jdxCzfdN5yGDL0rTsUnJj4a0E6LQyh+ag==
X-Received: by 2002:a05:600c:310b:b0:40b:385f:24b5 with SMTP id g11-20020a05600c310b00b0040b385f24b5mr462195wmo.15.1700751288447;
        Thu, 23 Nov 2023 06:54:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b0040b338b055fsm2934430wmq.18.2023.11.23.06.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:54:48 -0800 (PST)
Message-ID: <e4abdda583ad11aaa70c2ee53e0c756547cbdb6b.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone 09/16] binutils: Fix CVE-2022-47007
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 14:54:47 +0000
In-Reply-To: <CAOSpxdbYSdnkLCb0Qyh9w1ZdwbZsEgsvKQfMCaNk8j=0d6d=7w@mail.gmail.com>
References: <cover.1700620126.git.steve@sakoman.com>
	 <03e6ea59d82e613ba3b5d388fa87317cef982f2b.1700620126.git.steve@sakoman.com>
	 <e41e538ce6ebbe4c30af4de9c6a1f4e02fd9f359.camel@linuxfoundation.org>
	 <CAOSpxdbYSdnkLCb0Qyh9w1ZdwbZsEgsvKQfMCaNk8j=0d6d=7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191166

On Thu, 2023-11-23 at 04:49 -1000, Steve Sakoman wrote:
> On Thu, Nov 23, 2023 at 2:41=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2023-11-21 at 16:31 -1000, Steve Sakoman wrote:
> > > From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> > >=20
> > > Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  .../binutils/binutils-2.38.inc                |  1 +
> > >  .../binutils/0033-CVE-2022-47007.patch        | 34 +++++++++++++++++=
++
> > >  2 files changed, 35 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/binutils/binutils/0033-CVE-=
2022-47007.patch
> > >=20
> > > diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/=
recipes-devtools/binutils/binutils-2.38.inc
> > > index 43cc97f1ef..dc29141812 100644
> > > --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> > > +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> > > @@ -67,5 +67,6 @@ SRC_URI =3D "\
> > >       file://0031-CVE-2022-47695.patch \
> > >       file://CVE-2022-48063.patch \
> > >       file://0032-CVE-2022-47010.patch \
> > > +     file://0033-CVE-2022-47007.patch \
> > >  "
> > >  S  =3D "${WORKDIR}/git"
> > > diff --git a/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47=
007.patch b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.pat=
ch
> > > new file mode 100644
> > > index 0000000000..cc6dfe684b
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.pat=
ch
> > > @@ -0,0 +1,34 @@
> > > +From: Alan Modra <amodra@gmail.com>
> > > +Date: Thu, 16 Jun 2022 23:30:41 +0000 (+0930)
> > > +Subject: PR29254, memory leak in stab_demangle_v3_arg
> > > +X-Git-Tag: binutils-2_39~237
> > > +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcomm=
itdiff_plain;h=3D0ebc886149c22aceaf8ed74267821a59ca9d03eb
> > > +
> > > +PR29254, memory leak in stab_demangle_v3_arg
> > > +
> > > +     PR 29254
> > > +     * stabs.c (stab_demangle_v3_arg): Free dt on failure path.
> > > +
> > > +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-=
gdb.git;a=3Dcommitdiff_plain;h=3D0ebc886149c22aceaf8ed74267821a59ca9d03eb]
> > > +
> > > +CVE: CVE-2022-47007
> > > +
> > > +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> > > +---
> > > +
> >=20
> > This has not merged to master yet. It probably will but...
>=20
> This CVE shouldn't affect master, it is for binutils versions 2.34
> thru 2.38, while master is 2.41
>=20
> See: https://nvd.nist.gov/vuln/detail/CVE-2022-47007

This was merged to master but clearly shouldn't be as it was reverted
upstream as part of:

https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D19cacf6=
72930cee20feaf1f3468e3d5ac3099ffd

Cheers,

Richard

