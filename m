Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED5ED609AF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:24:56 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25177.1765898696194763154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKH0dnvJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-65b85d140c8so141872eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898695; x=1766503495; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUaGewOmqL346FrUbWusiTKoH9hKDh8KzFq0h4ukHZc=;
        b=AKH0dnvJ1uwNqqqbicFuDFCBr2SICK8y4o6O/ghZJsdGQMqbzEcKCsGLOtHGJzb4Bs
         gDFri35m7lDkAxY75p8C225PSASqh+r1d6p3qVEuphy1FGZkOnZSH1BxMh4NHCOnAf0i
         hqVpQZnRQlgBUCJ4Dh+WYPSsb9pY99Klo3If7poheIL5AA8E1hC7AtpNiC6D8C96ES1X
         Ov0AtOMyDqjnPFSP/F5gAhzmEmiF5iCAeOP2f30jiAUv7gX1HiIeKMXMl0wCVsI5fJ0V
         dFHjMpjL6sZQ0MV+lDnq8qOim+oW4p9P/HYcIDwMw/NsBIFk1Qu6NwF+nuAEmhmm36Wk
         sw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898695; x=1766503495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qUaGewOmqL346FrUbWusiTKoH9hKDh8KzFq0h4ukHZc=;
        b=kkHLTmmU4n8OFfVWwIX94yZPNw+68YT2Ydznltt9ous6gYPHunSy3XDeJzTVFEgS6y
         jFeunLvgNBymHWVvxYC/Cl2Kos50nPXV9rCikCQXdFrkeqqMXMCWTGE5CUgaE0AI830W
         1WF7cpOMYH8eqliCBQGMGGrkqXmvGZhxSiIlHC6JbkJaiYADgNx5szYIUvAXWyB7YG5b
         +u5lmQ1l2U6+zNAwjZrHvWSpkitoXkEaKdDIysCcPC22s4/yUMC/px+NqTbz+VgJnhmT
         kfMGZycrDYbydzRJ4HZcGrWho3JFJDDad0O5e9TagYbsRmWPrzDQuE1YmYRZPWdKuKAZ
         P7MQ==
X-Gm-Message-State: AOJu0Yw+R1r6igUaQSdQCtZycZIm2sJ0gXMCnB/AvxKXjYeb5aqszwNt
	C3hGGBLQ7903TStZpensi2GkSosE/eW0w4ndLPuPjqWmB9a4XL2BN/LBWkzYGwR1+E6PwHhsZu5
	EdGI26cyYrEc7J7Ydvw4b+LulCcZxJsC9dhdr
X-Gm-Gg: AY/fxX44iXLf2l2uKyRv/Li0tsiG1wANLskf9xFM8DMspXCTpaEbLCIt0CzOs+8JSV3
	AgQbdlaMaYl2crR+feeHbSaR0Iy3MVYbfyYS+Yo1d/CGqeVf+315/+aqQSiVsTGIrweVERV09Cs
	W+LY809fh70ZMIC9ojE0LJ6uuK8WcsbzuuRU5gF+Ju66NcClxI82bz2jMXWUo2mjLY1K2H5B9Aw
	UHaxIMZnnTvZENgbY4ZoGsGlbNR+WZ9SMv+QAap0W2jjLHZDuztWsawQnluOpmNcHSY/OtRtg==
X-Google-Smtp-Source: AGHT+IG79pXwyDysQxicAgv1BWDGGG2EoTVufjTbYnwdbNVjWnx66y3btcwtUuojLgq2A+1HINgfVRWhI0r+dgy9ccg=
X-Received: by 2002:a05:6820:829:b0:65b:865e:36f0 with SMTP id
 006d021491bc7-65b865e3a1bmr381856eaf.25.1765898695273; Tue, 16 Dec 2025
 07:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com> <20251213095931.2571498-7-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-7-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 20:54:43 +0530
X-Gm-Features: AQt7F2qnKP0Gau49DIh9jn8rsjzzywQ8CeIVUq7u6ItWXtXV6RabeG2tBDi4Fj0
Message-ID: <CADySD0G+B+mgaM6qtCf-EraZa-GKKu8TFAaeQHmFMzf0ADHBZw@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 07/67] nfs-utils: remove obsolete
 'make clean' call
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227969

This patch doesn't bring any critical bug fix, hence can be dropped.

On Sat, Dec 13, 2025 at 3:29=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> The 1.2.8 release did indeed ship binary .o files, such as:
>
>   nfs-utils-1.2.8/support/nfs/conffile.o
>
> No recent release has done this though.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit 2751280d2d6238839aa5c7f5624a63fcfc9f8a85)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> index 08e7dd8900..65970f58e8 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
> @@ -123,12 +123,6 @@ do_configure:prepend() {
>                 ${S}/systemd/Makefile.am ${S}/tools/nfsrahead/Makefile.am
>  }
>
> -# Make clean needed because the package comes with
> -# precompiled 64-bit objects that break the build
> -do_compile:prepend() {
> -       make clean
> -}
> -
>  # Works on systemd only
>  HIGH_RLIMIT_NOFILE ??=3D "4096"
>

