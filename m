Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E66C38A2D
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.4404.1649886266198388719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 14:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=k+S37USv;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 21so4082923edv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 14:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z4P0lH/h0wR6Pv6BHpaZDPSv4rH3KRCfAP5IXPHuZtI=;
        b=k+S37USvkS1vWFqJ0DJpONH+cS/sWnkG2RFwEkriTLRzwwcCoL8KMTT1akBdAzlcIl
         GkT2QmfnoFhcyVFbrK5TRhPdxsTF2zR5s5NZMd79AXu4SuQDfEzkgYbz8CdqvBvh+OFm
         tC5jTV4L+BHfL3H1NxwLwktceqzUduGbtaVOQDGwbmJaB+WkeCcbER/DdjsLeXn7fJTL
         YOxug9UWO7C46mS8M2fWw7Y0p/L7/qUScm2w1hQrcCOh6BvasdqNlFSH02X5wwDnoW2T
         pWr74PPS/80Y3IahDpQBNac0GC42xpr5fqR4/6gUkC/7PG5S5yLWV7Dx/KZ7gYt+kwa0
         5ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z4P0lH/h0wR6Pv6BHpaZDPSv4rH3KRCfAP5IXPHuZtI=;
        b=kfVo/uM+wb0wkHyUT3lUOS1bwy0DGruXH5WI2Nk8KZ3ze9N+fgUWx0SvTkhVOlx1Yj
         vrXgpRzGFkFZ7W50bStvGJ1fySfSp+lCSVZGNI3OzLAzUHeysjHtB2bi3pLTXmJvYUbU
         5UGFdM3DdowTpHWlleS2oRpFSGrUUf4N/9/9BqDmYvRkf25krQo9zZuOosYzAlRiIv+4
         iEqGPc+AmkeuEGpGUAMgOjVYJCp8OCnDabS9sdvDsGU1iWqMoSH9R62pWD8aoFf+juS/
         YZ2n81SawNvqareB0flotIzumnefJgHA9sNYkQVRZNyK3r5BWlK0Vrt7rgIjXhlFEGoz
         sZBA==
X-Gm-Message-State: AOAM531jFr+uDo/D4zNQLpKm8k67TH6e9J4TzNIRUzfOxyba1b7uvobG
	6RjXt+SJx64qVl1AhEPpOnJ2JUoKwkrGPYCssmOBgQ==
X-Google-Smtp-Source: 
 ABdhPJz5S+A1j7kKDaPU1nHLuY+RDXdptpYuAX1gHNI/erU6S8t+QasccM/T+SiBibGawu3Qs/vRWS++jYE03TlX+Bw=
X-Received: by 2002:a05:6402:7d3:b0:41d:9152:cad with SMTP id
 u19-20020a05640207d300b0041d91520cadmr10881322edy.370.1649886264495; Wed, 13
 Apr 2022 14:44:24 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
 <Ylb9RoAyRpDHTaqe@mcrowe.com>
 <CANp-EDZbeheyJWo_xwqPa4A24PJJghfZOuqG7sJX2DC1UfAPEA@mail.gmail.com>
 <CAOSpxdYeNPZRo2LLZQ0-EZHoXmaSeXFHsONCTF+2MLwfZ_RO+g@mail.gmail.com>
 <CANp-EDbCsrFazNTjpYbvZx-eRKhQ8GJeZH0VkL8Hco8p2w9oug@mail.gmail.com>
 <CAOSpxdZXfKhnmJm3TsZkbNb=Mqkj2=W4F4SSAoq8ne=RyJRr2Q@mail.gmail.com>
 <a1cdc686221db8350663e75acd3ac1fb147d4599.camel@linuxfoundation.org>
In-Reply-To: 
 <a1cdc686221db8350663e75acd3ac1fb147d4599.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 11:44:13 -1000
Message-ID: 
 <CAOSpxdaQK3MxH_FHKVFC4ZtT-4yhgybKDqg+shmViABZh13E_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>, Mike Crowe <mac@mcrowe.com>,
	Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164373

On Wed, Apr 13, 2022 at 11:41 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-04-13 at 11:39 -1000, Steve Sakoman wrote:
> > On Wed, Apr 13, 2022 at 9:05 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> > >
> > > On Wed, Apr 13, 2022 at 2:19 PM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > > Yes, and it appears they had a quite similar bug in the past!
> > > >
> > > > https://lists.debian.org/deity/2006/07/msg00074.html
> > >
> > > Interesting find... though it seems that is in a different sha256
> > > implementation than the one being used here ("Gifford").
> >
> > I did another experiment, where I disabled generation of the sha256
> > entries in Release (by adding --no-sha256 to the apt-ftparchive
> > command)
> >
> > As a result we get past this first hash mismatch in Release, but then
> > get later hash mismatches when it tries to download .debs.
> >
> > https://errors.yoctoproject.org/Errors/Details/654717/
> >
> > So it really does seem that apt sha256 generation is broken on
> > non-debian distros.
> >
> > > The other factor is that it behaves on ubuntu, but not fedora. Do the
> > > native packages get built with the host gcc (11.2 on fedora 35,
> > > whereas 9.3 on ubuntu 20.x)? Or does yocto also build a native
> > > toolchain to build host packages with?
> >
> > Perhaps Richard can answer this question!
>
> Native recipes are built using the host gcc so this could be host gcc dependent.
> We do use buildtools-tarball on some hosts where the gcc is too old. You can see
> what is used where in config.json in autobuilder-helper near the end.

The issue is happening on Fedora 35 and Alma 8, so no
buildtools-tarball in this case!

Steve

