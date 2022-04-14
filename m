Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2432C48BCB
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web12.7143.1649904454220658213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EFAbbjW/;
 spf=pass (domain: linaro.org, ip: 209.85.217.42,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f42.google.com with SMTP id e11so3299226vso.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=reiiEV0OmYj6W/QnZMRfrqJeDkMb6gaVIDSnpZsN7g4=;
        b=EFAbbjW/mFHTNkJwPKKhE96NCALEpDAe8rIq5xud1hl/jhF7lH39YDAv/UMu88A0Df
         GPuh/TDIqqGKDOmRuWR/NwUZ3HD7IzFL0GKkdPR/4BgUKQTQ9psqF4tH754QNSk9/mlt
         YYqCd3KW2o2kIyr7mrcRrrL64mXEqvKQSXEhg/Qa6Lk0mqW4iWQ6hhKMAcVMBdJf4L5J
         XrS4Iu918k5CY8+l+F6avRXS1scD5cEXcK+duQyrJFyLz3x6NS1MJX1g1MZK26w0kYc5
         AzgmA7IDq6iIDZBtatyKnpyMxBAW62yi62v+GCuT3ftPa47Gdp8Jt4BlFfIkVWOhcvVW
         MnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=reiiEV0OmYj6W/QnZMRfrqJeDkMb6gaVIDSnpZsN7g4=;
        b=XSPhUNxXBXWfqjvUrzmGpAdu4iXNQYvLeJjNBU4E7PPRyA2oTwjh+b0nz0TRXxvJ1k
         gKGs4MyDGh2EUMDsU14lnniEw11s/8essCFztJVaGx/c1OhNdKsO5g5DRMnaBobzua14
         Nrt+7veWfzdmlH34uYDYNd4pubB/XdxD+iyp9NMOqEBCzXH1vlRJDmYVTkgWlgsmSIHn
         K8iiNIwbYitmTDiQ6qcoZGUB7UqkUhRYAax+dF22ZpPSxbBlHP5XuNv9d0t8BfeN/X7C
         ILzD3F6QogPgYNV8LP6LfbUk4y/rl+5VehPO0TzWmsO+mD/66K0qW7CXarlVrq22S3c0
         Zwyg==
X-Gm-Message-State: AOAM530y7sbVOq3g4AE9ZRvhAkb7eurmvJ4JVGMsHOVtueM13xVUs9WF
	sN8SSvV3bDKgyGVYCJzKww5LgXw8gKnQ/vHTVdVPSw==
X-Google-Smtp-Source: 
 ABdhPJyaeY4jxV8u1AeS7q5QnBKf0L8M4gutYRUbmr0x7ppy1Y6TLleAj4qHt2Lw77cakh0ns3cJvgGfYoynxEdYPy4=
X-Received: by 2002:a05:6102:3206:b0:32a:1382:39ee with SMTP id
 r6-20020a056102320600b0032a138239eemr554131vsf.77.1649904453209; Wed, 13 Apr
 2022 19:47:33 -0700 (PDT)
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
In-Reply-To: 
 <CAOSpxdaQK3MxH_FHKVFC4ZtT-4yhgybKDqg+shmViABZh13E_Q@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Wed, 13 Apr 2022 22:47:22 -0400
Message-ID: 
 <CANp-EDZ1CmQLZWRHq8=s25YYuZ8au=G-JoC1MwEVygsrQzUoYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164377

On Wed, 2022-04-13 at 11:39 -1000, Steve Sakoman wrote:
> I did another experiment, where I disabled generation of the sha256
> entries in Release (by adding --no-sha256 to the apt-ftparchive
> command)
>
> As a result we get past this first hash mismatch in Release, but then
> get later hash mismatches when it tries to download .debs.

I am able to get past this, albeit with a hack. This fixes the sha256
sum in the Release file, as well as verification of the .deb files.
The original test then passes:

RESULTS - apt.AptRepoTest.test_apt_install_from_repo: PASSED (46.75s)

The hack to reduce the optimisation level for apt-native and apt. By
default it uses CXXFLAGS="-g -O2". Reducing this to -O1 fixes the
checksums.

> The issue is happening on Fedora 35 and Alma 8, so no
> buildtools-tarball in this case!

Fedora 35 is using gcc-11.2.1, could you check what Alma 8 uses?

Here are a few other things I checked, prior to noticing the
optimisation level issue:

1) we are using apt 1.2.31; the latest 1.2.y version is 1.2.35
- this still has the problem with bad sha256sums
- it does include several CVE fixes which we might want
- it added a new dependency on systemd

2) main branch version is 2.3.5
- it switched to CMAKE
- many new dependencies
- I got it to configure, but not compile
- custom crypto code seems to be dropped, in favour of gcrypt
- presumably this would fix the sha256 however I cannot confirm

Regards,
Ralph

