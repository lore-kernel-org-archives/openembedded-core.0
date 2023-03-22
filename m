Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F45C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 07:55:22 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.37240.1679471713945322086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 00:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9slBXNW;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id s20so10762079ljp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 00:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679471712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDJd0fXFFT83S3g6FLMtwZYsh7WVP6Kim0itl6Opiik=;
        b=G9slBXNWMkg4iMrZxfzVYRRdumor1CZVCKFISPD/ict2GlQQOTyP1bbn7NKZJ0j/SY
         2ikfVOvQR40VMJjgGzAm+pfqgDsX14+JyWsJquqmcnXM9ojq7llU4YSBqANc9tW7jU8M
         dkAX7IScM+I7QXjSLnGqA3RovnfV5NP47AxyY2RC3hA4XLbj38jf0asWPEIymzWl+2HM
         1darKufYlzvZ7snLdK2dCibhM/RNeqJVlvlUoonEvgq/nfSkvXV3sdNYFTN01HCqog1I
         758Y0Z/usD8/QfSlbEXe5O9OMNIMj0vTvg92GMWDLrwBpqqI2m8onjSHo3kG+52FCEbO
         6zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679471712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDJd0fXFFT83S3g6FLMtwZYsh7WVP6Kim0itl6Opiik=;
        b=qu5q0lMv9r+NrUpxbC0geCRDSk2w0CAV05e/UGyJZ0oN7LVJX3vXmU40a0qBEy9xrJ
         tLP1zl4kA24Ttve2QMzFxwdYcE6rDR6FzbhdEMNXslOG+YfLMgKX1LyrrU1OoNcBLGXf
         N/D3OrC99zDyPcssaofowEXEPyRg6HAtyDiDKlzEdbOdQPBxmvPfJ3HsRapyv3a2hLy+
         jI/0e8LZf6ksDspdEJgIn1XFHKVhcPdz4zHGsHnaVjIHx36kKPtUZwwVpTrr3kbjv3CP
         uukbCeZfh9rvWcXB8SIjExjJlgNIxGgOYhxgO4HgVoGF7BcMkZ9VN2TB7XZ6q6FZ2qqr
         fngw==
X-Gm-Message-State: AO0yUKU/OqbyZI7lf/FooTCZcAmxg5Kz/9VWWoeHplahR3g0LJPvixDd
	JjOYTdYBe4ITTOrywykcInwXeVl3zeVbyQhb9Uk=
X-Google-Smtp-Source: AK7set+887/Fdotw/K8elJyH3mwEwHDpwcli9JQreO7Wiq88c5k5PVnosYBGQ0dEnAPjJdgRI1J8C1xqmR+tRJGVOBw=
X-Received: by 2002:a2e:2c05:0:b0:299:9de5:2f1c with SMTP id
 s5-20020a2e2c05000000b002999de52f1cmr1719275ljs.7.1679471711965; Wed, 22 Mar
 2023 00:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <1679451626-10625-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj-owD5bU9BSZmWPz2jDbddFBZXcuFvR5MzAR8MuzaP_QA@mail.gmail.com> <OSBPR01MB18453A677D39C2D3DC071B5ADC869@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB18453A677D39C2D3DC071B5ADC869@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Mar 2023 08:55:00 +0100
Message-ID: <CANNYZj8nzn1y5bbyyUcgV1vw2oDzSOckJ6F7uPpgE=yBOFuOxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] xcb-proto: Fix install conflict when enable multilib.
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178919

I would suggest you open a pull request anyway, it just needs a clear
explanation why xcb-proto is in fact arch-specific (because it builds
and installs python bindings).

Alex

On Wed, 22 Mar 2023 at 08:52, wangmy@fujitsu.com <wangmy@fujitsu.com> wrote=
:
>
> In xcb-proto's commit history, the previous commit changed libdir to data=
rootdir.
>
> So maybe it's not appropriate for me to directly change it back.
>
> I'am discussing this issue with the community.
> https://lists.freedesktop.org/archives/xcb/2023-March/011429.html
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Alexander
> > Kanavin
> > Sent: Wednesday, March 22, 2023 2:18 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH V3] xcb-proto: Fix install conflict when =
enable
> > multilib.
> >
> > On Wed, 22 Mar 2023 at 03:20, wangmy <wangmy@fujitsu.com> wrote:
> > > +Subject: [PATCH] Fix install conflict when enable multilib.
> > > +
> > > +Upstream-Status: Pending
> >
> > Please send this upstream first:
> > https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/merge_requests
> >
> > There should also be a better commit message, something like "install .=
pc file to
> > $libdir, as it refers to it.
> >
> > This is needed in particular for systems with multiple sets of librarie=
s (i.e. 32/64
> > bit).
> > "
> >
> > Alex

