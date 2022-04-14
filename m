Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A45C49EA4
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.7281.1649905367525394579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pBJrC18R;
 spf=temperror, err=temporary DNS error (domain: sakoman.com,
 ip: 209.85.208.54, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id d10so4761469edj.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ZeNaJHDnPBQRmjSJCUlzClMEpK+akFpql+t1hL2Qek=;
        b=pBJrC18R70GaqDdcheBvbG5nEqmyEnBsYLF1P2wWtucILgK/i07PimFY6krA1A9fKf
         wHmOyyQIDRPZFvsOHIJ27KO6EFTh0sgETAPghgMF2lUMyjxLD8uFL9xBh2TrOs24bjHb
         dfxiWfmhXQ0/zMavs/7GOXxmkwDSk4fIW3nzmmbcdxtb0ORUn5RbkXKUHFGNOQJvPn05
         O2fHoGK8WH5W93bXl0IQ+qEXgoNWT3cNkJVGKCNvXrjvhHSe8ZCJoBYqW89a3V+y9XgF
         6E970GLci5YYKTctoeXxrCrQHzwd8Sl1kC2aDrQejkllOMdg5u6P0zF979Sc9RV7UwC5
         iS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ZeNaJHDnPBQRmjSJCUlzClMEpK+akFpql+t1hL2Qek=;
        b=2bSG+oElaZ91cWKW7I50UXgEvZktG+4KmoJ8pK9nSr22Lj8FjM6L/47+eR/TPFx3AB
         em6NCDM+bd8W0s3lpCPZ6/rCEcTtrQTcQPO/6nhVrPVU59eEPXYe/NWtcRD/6U2ULs79
         FgZOhJ1Ebe2sfKp/OrytW0XzPkPDJuDQWpkeEK77jA8YS2ip5f7WHV1ENoLUTMYIbCNY
         gDrEvoQlI13NQwAxqQ9vppgWUR0VZK2zUzMI7HXWfCMoJgE0QNEUVovygPG/6i+6hUvf
         NaU77YZcZ2YCvb2rwt5eUA4oCgqBD7u1u+oIeORy4QW88nL6M6+8c/v6Dh9cyxc35gON
         SA/A==
X-Gm-Message-State: AOAM531fEqdgG/vFcHSnr/uCjj8Am4y73vc5OM8/CnH+g6CCVGxSGOxo
	NRRhbpgU1RG5gLAI7xKCwFpqfeD95k/k5apSNtQbdQ==
X-Google-Smtp-Source: 
 ABdhPJz5/hDrBkpoOIbsOC38CI2wdRjctSRp9ukBqNuxVjR8B969jKIeX5b5/ikg+ORaHXo/2DIkt38Rc+c0SaGv4SY=
X-Received: by 2002:a05:6402:5193:b0:419:3d19:ce9e with SMTP id
 q19-20020a056402519300b004193d19ce9emr671910edd.199.1649905364960; Wed, 13
 Apr 2022 20:02:44 -0700 (PDT)
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
 <CAOSpxdaQK3MxH_FHKVFC4ZtT-4yhgybKDqg+shmViABZh13E_Q@mail.gmail.com>
 <CANp-EDZ1CmQLZWRHq8=s25YYuZ8au=G-JoC1MwEVygsrQzUoYQ@mail.gmail.com>
 <16E5A41A6E4FF34A.8845@lists.openembedded.org>
In-Reply-To: <16E5A41A6E4FF34A.8845@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 17:02:33 -1000
Message-ID: 
 <CAOSpxdZGm9Fjh=8fvS7GtG51ThmToA=8HiY3K1bFN=7FiY=DGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mike Crowe <mac@mcrowe.com>,
	Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164385

On Wed, Apr 13, 2022 at 5:01 PM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Wed, Apr 13, 2022 at 4:47 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> >
> > On Wed, 2022-04-13 at 11:39 -1000, Steve Sakoman wrote:
> > > I did another experiment, where I disabled generation of the sha256
> > > entries in Release (by adding --no-sha256 to the apt-ftparchive
> > > command)
> > >
> > > As a result we get past this first hash mismatch in Release, but then
> > > get later hash mismatches when it tries to download .debs.
> >
> > I am able to get past this, albeit with a hack. This fixes the sha256
> > sum in the Release file, as well as verification of the .deb files.
> > The original test then passes:
> >
> > RESULTS - apt.AptRepoTest.test_apt_install_from_repo: PASSED (46.75s)
> >
> > The hack to reduce the optimisation level for apt-native and apt. By
> > default it uses CXXFLAGS="-g -O2". Reducing this to -O1 fixes the
> > checksums.
>
> Nice work!
>
> > > The issue is happening on Fedora 35 and Alma 8, so no
> > > buildtools-tarball in this case!
>
> I've started a build that uses buildtools just to verify that fixes it
> and there aren't any other issues.

FWIW, here is the link to that build - still underway.

Steve

>
> > Fedora 35 is using gcc-11.2.1, could you check what Alma 8 uses?
>
> [sakoman@alma8-ty-1 ~]$ gcc --version
> gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-4)
>
> >
> > Here are a few other things I checked, prior to noticing the
> > optimisation level issue:
> >
> > 1) we are using apt 1.2.31; the latest 1.2.y version is 1.2.35
> > - this still has the problem with bad sha256sums
> > - it does include several CVE fixes which we might want
> > - it added a new dependency on systemd
>
> Urgh . . . this last part isn't good since it would be a behavior
> change which isn't OK for LTS
>
> It may be that the best solution is to change to -O1 :-(
>
> Steve
>
> >
> > 2) main branch version is 2.3.5
> > - it switched to CMAKE
> > - many new dependencies
> > - I got it to configure, but not compile
> > - custom crypto code seems to be dropped, in favour of gcrypt
> > - presumably this would fix the sha256 however I cannot confirm
> >
> > Regards,
> > Ralph
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164384): https://lists.openembedded.org/g/openembedded-core/message/164384
> Mute This Topic: https://lists.openembedded.org/mt/90107518/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

