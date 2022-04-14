Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEA1C49EA2
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.7257.1649905261530251150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bKh2d2gT;
 spf=temperror, err=temporary DNS error (domain: sakoman.com,
 ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id k23so7545228ejd.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j2FpVJakaAK1N0tzau+RA0xBPq1EinEXbB31RoJGGu4=;
        b=bKh2d2gTHt7T5gnsL6TYxYzbVgOXSE5D7fbRw/As+NPhdbP33Pr6GC0wG14x1zw/H9
         2VqeSl29rLmN4DGX09qsgQyCRMbuhAm09j5HHQaneTR3OPlHpfMTm59v+0b7mLcg2gdU
         Vi0vLcAr/D23djQcmVGAK0xith+q6z/L1iUno/D9hLFmcoZtowa/wUCDKmT1BHa5seGj
         XCiKRkVyiiH1CiecYLGflNENgDpiACqUrrw2m4Pv0BQVaNWJ9sGCgO/82ctrYQHffUCc
         OEi55mQE5KRSuc3GVvNePXpV0WBdIXky3z3Dxaz95M30ryJ/RR2F/siLudVIFbN1x/uz
         wPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j2FpVJakaAK1N0tzau+RA0xBPq1EinEXbB31RoJGGu4=;
        b=JwPJTo+8FOg3vP3K5qzzeB46vzjaLCX1MwEj2pJs2eI8h6x20vGUX8IT9sEr1DZ95o
         F8Oj7t+UVx0rZyObVRF8DtbRVe+WytyrFI9LlbSotiRv1E8227ODKbKeiATg88U5EQDn
         E5izelm0TZUU0MJ80+WvWYHxYPnsh7R2XzekUPLcIzIdJ6A7pv+Vlkmx7zWu2WWYtwzg
         gdMDw0fjW2aKc+EzT/ahi5YV3NhXJON67yxlq0LVXX/EXMMTIPiYGcTmATwveyZk4Uoc
         wXQhK4IcwsoqqwBKcuvxgRmPkiLU33tHDYO6vQioBXIUEUl4RISQqL0I2CqvB0KVayLA
         /jKA==
X-Gm-Message-State: AOAM530rUwRI+Fwav80ibmTGki+V+TUvKFWKDmyq1Dl7TTN9OJQCVVs0
	YBCiTOrAfWoEJTc9Gz/xt8IHJtiBjSVrrHc1+qu7yw==
X-Google-Smtp-Source: 
 ABdhPJx4Zd42X2HMB6ukbyjZIj/MHHdC7bzsUfXUgrHkus08ovqyaAXkwiWOwgNgwcXQuXOuYJ5b6Hal3bO3MkDFgFs=
X-Received: by 2002:a17:906:a1c8:b0:6da:a635:e402 with SMTP id
 bx8-20020a170906a1c800b006daa635e402mr563746ejb.598.1649905256941; Wed, 13
 Apr 2022 20:00:56 -0700 (PDT)
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
In-Reply-To: 
 <CANp-EDZ1CmQLZWRHq8=s25YYuZ8au=G-JoC1MwEVygsrQzUoYQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 17:00:45 -1000
Message-ID: 
 <CAOSpxdZtqaLMFR5nS5_pUNSk0Wt46fM1ZY=0hFY_mAzyaHYwhg@mail.gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164384

On Wed, Apr 13, 2022 at 4:47 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Wed, 2022-04-13 at 11:39 -1000, Steve Sakoman wrote:
> > I did another experiment, where I disabled generation of the sha256
> > entries in Release (by adding --no-sha256 to the apt-ftparchive
> > command)
> >
> > As a result we get past this first hash mismatch in Release, but then
> > get later hash mismatches when it tries to download .debs.
>
> I am able to get past this, albeit with a hack. This fixes the sha256
> sum in the Release file, as well as verification of the .deb files.
> The original test then passes:
>
> RESULTS - apt.AptRepoTest.test_apt_install_from_repo: PASSED (46.75s)
>
> The hack to reduce the optimisation level for apt-native and apt. By
> default it uses CXXFLAGS="-g -O2". Reducing this to -O1 fixes the
> checksums.

Nice work!

> > The issue is happening on Fedora 35 and Alma 8, so no
> > buildtools-tarball in this case!

I've started a build that uses buildtools just to verify that fixes it
and there aren't any other issues.

> Fedora 35 is using gcc-11.2.1, could you check what Alma 8 uses?

[sakoman@alma8-ty-1 ~]$ gcc --version
gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-4)

>
> Here are a few other things I checked, prior to noticing the
> optimisation level issue:
>
> 1) we are using apt 1.2.31; the latest 1.2.y version is 1.2.35
> - this still has the problem with bad sha256sums
> - it does include several CVE fixes which we might want
> - it added a new dependency on systemd

Urgh . . . this last part isn't good since it would be a behavior
change which isn't OK for LTS

It may be that the best solution is to change to -O1 :-(

Steve

>
> 2) main branch version is 2.3.5
> - it switched to CMAKE
> - many new dependencies
> - I got it to configure, but not compile
> - custom crypto code seems to be dropped, in favour of gcrypt
> - presumably this would fix the sha256 however I cannot confirm
>
> Regards,
> Ralph
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164377): https://lists.openembedded.org/g/openembedded-core/message/164377
> Mute This Topic: https://lists.openembedded.org/mt/90107518/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

