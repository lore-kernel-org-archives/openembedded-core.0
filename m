Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C7DC36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 16:45:37 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.1172.1743093933293473184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 09:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dzSf1r+l;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f6ae4846c7so13548947b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743093932; x=1743698732; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHyL785eKz2IZUT5T3oTgn+TB1LmNocorBpsWFf4p+4=;
        b=dzSf1r+lUsbPl26bYT3FTnoJRz7lHhWYP1MdfyB/dzB9NMCruMUux5zSOZ3Uza9o4V
         XcOm2VyIsuI3R94AWyIJipe6P3x1hTKEJnp9KMvfNWJReU/HurNMmIPtjTfA9aS+3X4z
         ckGOZFzuaZqxDhPYm4FLbf4JkPLUkFx1+7/91R/xwU3YHix81NWUux/Nn+7DlstaAnUG
         E4ZSTzf/we7i9WxdcDOu+QMuOw/mobjFaL884s/tYPGAn5DWamTRiW3hhR98JkP990po
         2K4g2t4LQ+/NtAsEj7XowBgKGhFl7Fs6WC692BplxFElQETTpafiB78/4g452oANb1QX
         cZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093932; x=1743698732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHyL785eKz2IZUT5T3oTgn+TB1LmNocorBpsWFf4p+4=;
        b=edLOm/TEMx8s1nOum2kjIyTPPcnh3fsBDCs8jhlqSTkHzv6d+VLWiH37QO5Kc94kn0
         7dp0fssotJRNBOKOCoKYgKf9iKUa0RaB2v+dTYEW9PgCa9kk3vEOOPpJ6SP0p8A4Ttj1
         GMR7vf3yUHoo5h+jXNx9kTzXfiDnddZ1pURIe14otALTASi1RRe0kTf1fj6uvAmDJHER
         L/eJu6s09SkFpttjiuHsU3g3n6dPKPDoJFfncNVfPi3IvfkeaWvE46XMA7DCYolIYPtT
         unzf/0lsCvfjmrPaF45pVRS0f3HNcW+kZrE9zRn6L7B1bBJquRQfNmDIgb0V/125yve+
         8A1w==
X-Gm-Message-State: AOJu0Yw1D+7hHN/Ui9ECm0rwQ5zwx/FxxZNp9xKKd6X+AnIO1NmPcIwA
	uK8EXoQAT5Fo7/gDTkD8K+p9QTmnUDFlvOhLl+b4IO4/kayaQOJObY8UqIAclxnMFW1zK6NxeBe
	qnQARF+7PSPri9T3F2kGYrTGnP8uG45NkMb7qSg==
X-Gm-Gg: ASbGnctKYgESOvYvITj3By3JavVR/Zsw3wNb7s9C9dkL28CYmIrrom8GITAcw8F1gmN
	3ekJqJdkAFEmh82We2R1ZUbhivkd8Yy834JxLdZp7XDLph64kEWoOjQt6ngTxhgw4XLkvjdhnMw
	8YCHP9N6H1OpjxCw1FlRuFFv2QCqTpq3xp7sXMFRq8YVWVp/RnD4lhG3d/
X-Google-Smtp-Source: AGHT+IH8oVf3qQsZ4JRlh34eyJjXz4GI4Fi37w3i5AYsSNoYbmfG++9V//ZzwGIjCEWDkQQlcS08HRjwV1Oz/K3/J5k=
X-Received: by 2002:a05:690c:6f89:b0:6ef:8dd0:fff9 with SMTP id
 00721157ae682-70224ef9a35mr56570647b3.8.1743093932286; Thu, 27 Mar 2025
 09:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250326202817.64437-1-hiagofranco@gmail.com> <CAOSpxdZR3JA-h_4ujbOzDK2YaX=9pBztTp-O3R111JE6DYK77Q@mail.gmail.com>
 <20250327161904.hjqfngvg4irhrk7e@hiago-nb>
In-Reply-To: <20250327161904.hjqfngvg4irhrk7e@hiago-nb>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 27 Mar 2025 09:45:21 -0700
X-Gm-Features: AQ5f1JqFOs25z029cFuf4584NwJ19f6UfSmv0ATAgpRf4OlRAyR2nwEJ8bA97kM
Message-ID: <CAOSpxdajP0E0uVMR3QmRCqqmmRMAMnXiZM3bPmOXHGyRrVTfDw@mail.gmail.com>
Subject: Re: [styhead][PATCH v2 00/31] linux-firmware: upgrade 20240909 -> 20250311
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: openembedded-core@lists.openembedded.org, quentin.schulz@cherry.de, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 16:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213767

On Thu, Mar 27, 2025 at 9:19=E2=80=AFAM Hiago De Franco <hiagofranco@gmail.=
com> wrote:
>
> Hi Steve,
>
> On Thu, Mar 27, 2025 at 07:54:53AM -0700, Steve Sakoman wrote:
> > On Wed, Mar 26, 2025 at 1:29=E2=80=AFPM Hiago De Franco <hiagofranco@gm=
ail.com> wrote:
> > >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > Update the linux-firmware recipe to the most recent upstream tag.
> > >
> > > This is basically a backport of the commits from master into styhead,
> > > related to the linux-firmware recipe.
> >
> > Sorry I missed seeing this yesterday.
> >
> > The final release of styhead is now in QA, there are no further
> > releases planned.
> >
> > If this changes for any reason I will consider this series.
> >
> > The project weekly status report publishes the complete schedule of
> > releases for all branches.
>
> All right, thanks for letting me know. I did not realise that.
>
> I think the real work is on scarthgap and kirkstone, which I will send
> another series. Can you comment if this is the right approach for
> kirkstone and scarhgap as well?
>
> From what I understood, I need to backport these patches for the other
> LTS branches as well, without breaking the compatibility. Is this
> correct?

In theory, yes.  However after seeing the extent of changes required
to bring styhead up to date (31 patches!) I fear that the changes for
older releases will be way more extensive than I feel comfortable
with.

I don't see how we can assert that compatibility will be maintained
with that level of change.  Especially since our automated testing of
the linux-firmware package is pretty minimal :-(

So I'm not inclined to take such a patchset, since I think the risk
outweighs the benefit.

Steve

