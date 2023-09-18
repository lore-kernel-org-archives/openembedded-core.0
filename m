Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023E1CD13D2
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 16:42:37 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.56744.1695055350791706951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 09:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E1rNZ0m9;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.170, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bfb17435e4so76605321fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695055349; x=1695660149; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PzcKlq/sMKJH7yxy/Gqb06U/LTtaoJs4h6l4CPPAUw=;
        b=E1rNZ0m9Nan87qMDdeVVmq9yq1wi7pC87mQBBMURyQAyInTX5lSe8YEmiPPM99DmTl
         FsDCJCQCyvJGlDiTaWS0VjJy28fP0V9Y9tmbO9tJUSynPufpu0ZL5ItSKV/hp5hzCQ8a
         eyEAVCq3P8WsIUCLn/7Y3Ay9RIi5BxlUjGiZ7FKA3PX/8VVxHx4Sfu1lvoXxtfeE4PH8
         O/6xoGAEQ/XogkVc8rCfD8aqY5LtMSMtRd8XLhN4+TPzPgP72pkXBIAEQZq0trQbmtxk
         FlDSog+xaHQGNl5zisPs36nN7OaYEth201psHfbfUebbTVjcBJwGRcUMvhiHY1MHowN0
         /wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695055349; x=1695660149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PzcKlq/sMKJH7yxy/Gqb06U/LTtaoJs4h6l4CPPAUw=;
        b=At2PTzbkmpnAzqPn+Rbxe4dWP4K1vnDFb7fMPhLeQjGeT16EoFRm2VGzn9twITYMef
         sUTmenXturZXpcpvE1NgPUhbqyRI0JVt391vjK2MyRVrIi4+MC2VokOU/rv13iW7qUyW
         9lYU+tdZRjdD/nyA2cgRfthCyUpqWyEAh8Gqx/DVxn55imdVWZ8UTfMhXMPL7Sfaw82D
         dokDFCgS6FdVNhw1qhaVr6RF78lwCj2CdInAqRPglqv7PEF3fnczo/h6dU5pz+FEYLtl
         Zcz1+wPO9iQGg52uU6CV249WwNqUf7XqbdZge8Kf6k/2dWmFlR9Nnx7DoNrP1xaieOO5
         uoyA==
X-Gm-Message-State: AOJu0Yz8OclhIbVnPCuYbymwS2dMQxRw5geY2YXKqk+acLPUrP2n5nG1
	lCBSFiJFNJOAip6Izk6iT9ZcxZ75mpntPsGn9FJWKg==
X-Google-Smtp-Source: AGHT+IEcDzL4Rg6Jr2QMe16xYVFCAgoa1aYWkEhWmnz3TKc7J+yaQ4lE9LkPJNxVD1AKnypviFobqFC0AsBmN1jDsv4=
X-Received: by 2002:a2e:9d90:0:b0:2b7:11f8:27d with SMTP id
 c16-20020a2e9d90000000b002b711f8027dmr8497396ljj.7.1695055348895; Mon, 18 Sep
 2023 09:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230915204234.3547739-1-martin.jansa@gmail.com>
 <CAOSpxda40yQJrJCXhS-rtQ9T89auc52zwibD6qjCWYKSLZfB5g@mail.gmail.com> <DC0F0107-7850-4099-A201-6F6C1DB5D0CB@arm.com>
In-Reply-To: <DC0F0107-7850-4099-A201-6F6C1DB5D0CB@arm.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 18 Sep 2023 06:41:37 -1000
Message-ID: <CAOSpxdYY8WWTknuN8Dayi8Q1fF1Q_=gJ67E7W3gJDEbx_eNG3g@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
To: Ross Burton <Ross.Burton@arm.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 16:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187837

On Mon, Sep 18, 2023 at 6:08=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 18 Sep 2023, at 16:48, Steve Sakoman <steve@sakoman.com> wrote:
> >
> > The CVE-2023-4039.patch was also submitted for kirkstone and dunfell.
> > Should I attempt to cherry-pick this fix for those branches too?
>
> The bug says that the patch only applies cleaning to GCC 12/13, I=E2=80=
=99m seeking clarification as to whether that means it=E2=80=99s not releva=
nt for older branches or whether a proper backport will be needed.

I did a quick experiment with kirkstone and there were two issues with
cherry-picking:

1. The test suite hunk failed since the test file doesn't exist in gcc 11
2. The first hunk fails to apply since the file name being modified in
gcc 11 is a .c, apparently it was changed to .cc in later releases.
You took this into account in the CVE patch file

Removing the testsuite hunk and hacking the filename allowed the first
hunk to apply (but with fuzz errors).

So I'd say we definitely need a proper backport if the issue is
relevant for older branches.

I'll pull CVE-2023-4039.patch from kirkstone and dunfell until we have
clarification.

Thanks!

Steve

