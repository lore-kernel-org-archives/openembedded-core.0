Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B090C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 12:16:04 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.44786.1723464958260588339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 05:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RH4uLdmR;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-682ff2f0e67so37733437b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723464957; x=1724069757; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHcFLKCH+W6N/iVsGxLIGoWCGtFhkr9n01Z+6IhFG4o=;
        b=RH4uLdmRfMo8hprHS6KCnFLpMSbtCVvhwEh6sHt6p5W0Htk4ANYprlck8pmkwUCA3e
         HqHnI8A/LvxugyGPvaEV6KaJ4Tq4d1JAHZNN8zjQD9MLIXlmXOUaNmyg+DML31M3tjgJ
         QHfSsXpHsqdWHUs9O0Mb27OZphJ/eTvQjMZqXEQwmHWOmi7bBAPeWoUBye8IbxoieqLF
         Ev+3uorT6viaiaDzpJy1dC7LQDeffrXAXgh8vjmNNFh89QUVijZiByceJdaVFjhovd6x
         8A9mwAumS5hv3mxv9jmFx/aZKhiZJOFnnj8XbJzAj0ie0gy6mQQU+zI/LUNizBPZMtf4
         R2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723464957; x=1724069757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHcFLKCH+W6N/iVsGxLIGoWCGtFhkr9n01Z+6IhFG4o=;
        b=EWprabNcrd2pFxDjiqgQRr5zAlAPbOzdqniF3M7PNS+irfp3PBz06H6VlmCj1ArIow
         sRkUPxuLyH4kkGiQrP5i1/rrKyYEe5diayfXaNE2pGOxMT0pBklpyKUCAkQ1ukkL5+dp
         wFZwC0gRVo/frNp57GACUFA7YVdGa/yCF1H+YH0EJhUlL+Ic7v1MDcsZ2a78AzwJWIOc
         IgoTR8vrO/ZHUsiUXpd5+V+L3H2Z5VruCxJ0SjoWJ0330xR6QJ3A6YkDrSTlUw6qAkKx
         x18B6xFtvuBWk1xMYZSS2vCFJGodo0UQumN8KDiIcyAEVzQ/DC4z7kX0WI3LxNY6BjYY
         J/qw==
X-Forwarded-Encrypted: i=1; AJvYcCUu9AfW9yvNKC0Ex+9y4CxBhIsilkzbnjbAbSjJexs3yr46b7dwJwhlPmDhxdFf2LpleT0G75aj3JsIkl2f9Tsh4SB5QPApZ71Jc6DIgwHV3I6/wU7Wg3Cn
X-Gm-Message-State: AOJu0Yz6jnSNjF8eI7Ivc9GSz6A78CyXP45+uCAKeIaVk06C4KRy7piT
	w4q//VEpHBnGxZLWdbf4tW+TUHnpsF+ZHmcAD2chTxSCBMhBrCCl3q/uod3bMJD4oMNH0/GAwdi
	UVNKmaq2ZNR5IQAeRVqKT9/egZVKxsVVNmujNEw==
X-Google-Smtp-Source: AGHT+IHIaar5okTJZiBspNbZM/tpDST2c5OZZ8bP+8pGNMk1N4O2PgpHmOkLEIXZvVbEosKh6U/0qZO7fduqU433EPM=
X-Received: by 2002:a05:690c:2e85:b0:672:e49d:430e with SMTP id
 00721157ae682-6a97267079cmr1613567b3.15.1723464957314; Mon, 12 Aug 2024
 05:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240618033019.1181198-1-changqing.li@windriver.com>
 <17D9FBA631EBE6C1.1999@lists.openembedded.org> <2c71d621-6b84-4d55-8693-b1b0d6bbd3de@windriver.com>
 <06e377987b01e26fae310e29d571e01d2f1c5c48.camel@linuxfoundation.org>
In-Reply-To: <06e377987b01e26fae310e29d571e01d2f1c5c48.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Aug 2024 05:15:46 -0700
Message-ID: <CAOSpxdY2URM1OJyjfk+g_pcmmtsJYno8Ok7NUkvyynS5nmvxtg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH 1/2] apt-native: don't let
 dpkg overwrite files by default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Changqing Li <changqing.li@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203223

On Mon, Aug 12, 2024 at 3:54=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-08-12 at 16:32 +0800, Changqing Li wrote:
> > On 6/18/24 11:30, Changqing Li via lists.openembedded.org wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > >
> > > With --force-overwrite (implied by --force-all), dpkg will not
> > > abort
> > > when a package overwrites files from different packages. As this
> > > can
> > > also lead to "The following package disappeared from your system as
> > > all files have been overwritten by other packages: <package>" and
> > > subsequently broken dependencies, this makes the simple case of
> > > conflicting files hard to debug.
> > >
> > > Instead of finding all possibly required force options, only
> > > disable
> > > overwrite for now.
> > >
> > > Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >
> > > Take back from
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D4292387ef=
6c4e80428bad6a07c844a288b27d9a1
> >
> > https://git.openembedded.org/openembedded-core/commit/?id=3Df058272de9c
> > ba188d96940c8c921cf31727fe4d1.
> >
> > And apt still behaves like before,  it is possible to meet the
> > problem this patch try to fix, so take it back.
> >
> > And scarthgap merged this patch,  but master not yet.  So ping for
> > master.
> >
> > if master branch reject this patch,  should scarthgap revert it?
>
> This should never have merged to scarthgap before it was merged to
> master.

Sigh.  I did do a search in master and *thought* that this patch had been
merged:

https://git.openembedded.org/openembedded-core/commit/?id=3D4292387ef6c4e80=
428bad6a07c844a288b27d9a1

Sadly I didn't notice the date was 2020, just saw the identical short
and long log message :-(

So my bad!  Sorry.

Steve

> This is why we ask people not to send patches to multiple branches at
> once but to send to master, wait until it merges and that it is seen to
> be stable, *then* request a backport.
>
> > Sorry for sending the patch to both scarthgap and master at the same
> > time and cause this confusing,
> > Will send backport request after master merge the fix in the future.
>
> Thanks, that does help everyone.
>
> In this case I will test against master and see if we can sort this out
> there. If it doesn't merge to master, we will need to revert it in
> scarthgap.
>
> Cheers,
>
> Richard
>
>
>

