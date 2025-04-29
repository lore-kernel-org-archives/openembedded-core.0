Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664A5C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 10:10:36 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.15982.1745921429988606782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 03:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJlHnLj5;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499659e669so6875681e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745921428; x=1746526228; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4QcWE5pD68L5mC+xA1wjF9MqKOoFxpyFx0wILUxtJ4=;
        b=VJlHnLj50uqvyfTu3mM5RpWr4Ya0jaMI/BddBuZQy4mxpBJj0GMIMC7kDnkipvYCN7
         AwZdr+/n9HL3YgYSuVGyvtxVkZg1zsd70f3zEExo7ifBRwEZ8qZLlJiFSnl96G5e93yD
         aeSkhVYkb0yIdvOab3VNdY4D/RbHVUqn1lI+nbpd+rA4Dw1fAc40En+1JpEi5QzTil9g
         a+mv1NI1KaW50DI1lb65YD97I8QfxCp8El3WUPRkf4555vjK7bkiA6f+XNE0AcGcXFyr
         6zuM6U7SpenpreH+2gePMTwMWSfplaNhp6Q6VmevFeb0Upc9fDHgf/nKp5EZOHdjGrro
         mU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921428; x=1746526228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4QcWE5pD68L5mC+xA1wjF9MqKOoFxpyFx0wILUxtJ4=;
        b=wjBTcyXkU7NqVCkxRzEAAPb29lW915fMn2Zuno7nmyisBIbQaZUcdhkfMb0NSdVykc
         RN8DB3swTrjvNvzT4cUf0m7fDS5V8NhGBU0Hh9ErO9Mo6gsd49RO4qwIJVwc45XKxTkg
         d93bLDRIDc/1hpEonXjz7hxbOI15Bw5Rdv98FtPWptNHrBHmidZFvU9Y1ns//7uVtagf
         P9eTOd+z6M5DtkD41kFAg8r8h5rjpG4x+dlP1YWcAlBivf7JIKKlk6fOiOcdhTe/juds
         RVhKMTCnOdoQ/J1m+1/K89bInZ5hFVzIpeeAWSOTXbq7UNW00Cw+DMjoJwH68Sn+0apc
         Ohcg==
X-Forwarded-Encrypted: i=1; AJvYcCXbpoR2A+VX5PH+yY/Z4u2Nh9Dtwut9m4UncZZiGzqlOll0YbBmiSAksO02nRbflinDHfpE0cAvn3s52JwQ8PoTBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxpXqGg4cBgMiT0PX5TsNVUDCbwdBLvFCjh9XXWmgo7+abvv7SA
	ci1QR6/E7WUP43BK680T0wousfIrqBvuwxYP7UaTsVjUQhkFOMeR114QXLikXcHfe8wg3weMASS
	gJtzJFlxpJJmqzS8Jx08xqp3YJ0E=
X-Gm-Gg: ASbGncsjsKtXnJpzSd8TAoWzRwBjONYcot6x1uI9sxeCM8i+MYHQtyY1LkwhGz1BscA
	Kaiu14aB1wcdvQby6lYL7bZpMAjLHM2LzgC/zV0HlI7UzIv2h1eKQBWmxUM+s+MJeSRsLRIr5+n
	4YGouo3ry9ciKW51WT8dQmUwCf
X-Google-Smtp-Source: AGHT+IFMceeQt/i5xMkQ6m8y9sb+7eaKFtG++l3IDFqxn2JLfvZAZvpgJD7MF+KRufURKqdSkfMIAWwsEU3Us5rP0QE=
X-Received: by 2002:a19:8c1d:0:b0:545:225d:6463 with SMTP id
 2adb3069b0e04-54e9e560686mr471421e87.42.1745921427823; Tue, 29 Apr 2025
 03:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250426233051.4169011-1-raj.khem@gmail.com> <aa23d298b8b9f09372b417efa00547e4a42d432f.camel@linuxfoundation.org>
In-Reply-To: <aa23d298b8b9f09372b417efa00547e4a42d432f.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Apr 2025 12:10:09 +0200
X-Gm-Features: ATxdqUFEf_nlWa3sePJzebP41yE7u1_2Awrwsfl7YJpQA1gut-1gDdc1OLkw2Yk
Message-ID: <CA+chaQchL+vr2WSLtvoxRLTeEVb0Rk3wsrAQ4tNYYAY5aRdncA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade GCC to 15 release
To: richard.purdie@linuxfoundation.org
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 10:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215656

On Mon, Apr 28, 2025 at 10:54=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Sat, 2025-04-26 at 16:30 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > * Nios2 has been removed and aarch64/ilp32 is deprecated
> > * Default C dialect is switched to C23
> > * {0} initializer in C or C++ for unions no longer guarantees
> > clearing of the whole union
> > * Compile speed improvements with LTO
> > * Vectorizer can support loops with early exists but it is limited to
> > loops
> >   with fixed vector lengths
> >
> > This is major release of gcc, the changes are noted [1]
> >
> > [1] https://gcc.gnu.org/gcc-15/changes.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Drop musl headers ordering patch
> > v3: Rebased patches
>
> We're getting much closer. My selftest-ed change nearly worked, I'll
> try a new version of that. If that works, we have left:
>
> util-linux ptest regression:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1396
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1393
>
> meta-mingw failure in libiconv:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1521
>
> meta-intel failure in intel-mediasdk and intel-media-driver:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/1389
>
> meta-virtualization in ipxe:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1402

I'm seeing few more failures from meta-virtualization with gcc-15:
http://errors.yoctoproject.org/Errors/Build/205175/

I've sent fixes for ipxe, irqbalance and work around for libvmi, which
leaves dev86 from meta-virtualization (where the repo from SRC_URI
doesn't even exist anymore).

Cheers,

