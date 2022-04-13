Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B28BC35295
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.1990.1649873974253784304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 11:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PzWwNFHY;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id bh17so5636760ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N4fVuzIhMWIewmkok8cvJQMgi7HGBaubYZBzAPBH9IE=;
        b=PzWwNFHYyho6HpX06I3ox5AMtGfyAmZ972G0so6w9YcZ0Igvv3RPhICdIUJFvWR2I+
         qpag8VHn8uVvf/gN/u6KM/iCT0Os0A5w2N/MaYx3dw8EdJFaTXEJYJ67yLAGfG7fWQkb
         5U9LcfIRrjNit+dOHkFbWL4g5qZ0/oKwIp1WjgmgMPwx4yHHir7ffsodIOP/hI6P2DNN
         qZlrLYIZC2OXIrBhshy0PRfBJXG0hZqd1mm8P9IDM37YXGwd3bRLAA5DHy9hyZxlOMl3
         1zC7lOWA+e8WX1I4aTTDrUsOoiXDvpRPObd6WAlKSNeJjQnrwssEPBK8RELUvK3f8UQV
         Otkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N4fVuzIhMWIewmkok8cvJQMgi7HGBaubYZBzAPBH9IE=;
        b=iBz4EqPoY014CdCrenGviSDeOPgTkhnFa7CO1xPH8LV6h2VQrKs2MpJm/P3PT9bH3M
         NNIjs3fZjtM0MkIFbWEk7Azhf4aZhHwtQXToX/kkMAeFsMMFFjP8MfMfTMCvn1cQzKog
         flQY44AeYEnmNA71OjBzKcm51/bTauMv4VJc3XSCg+LwxYG0++RSofS4eoKMJ5mQOBUz
         n7mmy0asuklLF/7afQPyT0p3Wqo6uzhpeVwvbdUZ0/rgm9uxV1F88QZaHkxybW3BS/lj
         zADJNS44vXm3P1h2nhQ9AF+2XGw8BBUJL6gODN4/DPiV92YlkxC43kkN73HhD5c+1vvG
         UQ5w==
X-Gm-Message-State: AOAM533bHe6hv5e3WYYKJ5dgnd6gVt1A7GGSIs9HOTt83bJiLIvfjh6S
	35jUExaquMH/Dg0EgxfNw5VFvJi3gKj24y8iNF0drw==
X-Google-Smtp-Source: 
 ABdhPJyFt48RdgfWaT37T5NHsv9N7GTXpSDSaPSc4Onq2HHTDc0iXtk7PAajJI6YgNcOj/52ZIclDwlJIBaByHbtrsA=
X-Received: by 2002:a17:906:4d1a:b0:6e8:8860:8a72 with SMTP id
 r26-20020a1709064d1a00b006e888608a72mr16244669eju.540.1649873972505; Wed, 13
 Apr 2022 11:19:32 -0700 (PDT)
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
In-Reply-To: 
 <CANp-EDZbeheyJWo_xwqPa4A24PJJghfZOuqG7sJX2DC1UfAPEA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 08:19:21 -1000
Message-ID: 
 <CAOSpxdYeNPZRo2LLZQ0-EZHoXmaSeXFHsONCTF+2MLwfZ_RO+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Mike Crowe <mac@mcrowe.com>, Ross Burton <ross@burtonini.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164357

On Wed, Apr 13, 2022 at 8:02 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Wed, Apr 13, 2022 at 12:41 PM Mike Crowe <mac@mcrowe.com> wrote:
> >
> > I believe that Ralph's reproduction of the test failure without the zlib
> > patch was from a complete rebuild without anything coming from the sstate
> > cache.
>
> Yes, just confirming the above. I wanted to be certain there was
> nothing left-over from a previous build, so I nuked everything except
> for downloads and my local.conf.
>
> I am quite certain the problem is with apt-ftparchive command, which
> is what generates the md5/sha sums in the Release file. It seems to
> behave differently under Fedora versus Ubuntu. Only the SHA256 is
> affected. It is worth noting that apt includes its own sha calculation
> code, they are not calling out to "sha256sum" or using an existing
> library.

Yes, and it appears they had a quite similar bug in the past!

https://lists.debian.org/deity/2006/07/msg00074.html

Bug#378183: apt: All SHA256 hashes generated/used by APT are wrong"

Steve


> Was busy with some other things this AM but am going to dive into
> apt-ftparchive source code next (which is C++, ugh...).
>
> Ralph

