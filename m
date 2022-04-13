Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C493AC38A2B
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.4345.1649885997196619569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 14:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6ZBpPjQK;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id c6so4013710edn.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8am+rZsFxw3AE1fEwHjvVMnVp5cioz3xiYJKp89QCpo=;
        b=6ZBpPjQK8RfzeYUYpohAZQKosxMmDAZatHhsikr8UvlyTYSabKimEGaTA8Oh7DI3u3
         ldlEKvPM8pQ6NyvDzLbm6QKDl15tj8oUvM3V2vUxMXGi02Ishwxh2Z4lDLuFgSSYPaQy
         qpxPkBujuTdn3wVv9SrlP5YfQZZsQe8JYUOVFSn/v6HseULJ6ct/0SDeDv3F1hfuXoTr
         LA6KNsKTax7m/cDsu5WJyqkOazZKXcSGdePWIZMD+y3KJ95lGMLkJL0WUTtxagl7rSsV
         uSxWDygyLikRR2uaCs4xh1CbEYWAte4/DxT6iTo9P6eFCb7cNfKpEK3pdWZ5Nbl4qjDD
         Z1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8am+rZsFxw3AE1fEwHjvVMnVp5cioz3xiYJKp89QCpo=;
        b=XvvIt4iDz/Kcz0N2HeYrVQYw6fIH4pD78RfLgULy/v8N6GTxeKTFXM1Bkf0QQ453fI
         vDHuP9lsCv+3KgpwdRs6HKLetM4RPuvw9tSUOUjsSpz+o+Ql/HHLtqM7MlHjEAsTOCsb
         mRIdsi9VaZFgX6JfphqyVwBcPQdBf7b5nWQppoIW2J5Mf03Mw5F1ZoSdaoCVctzVipkT
         YW5/G2F83NPdiRpLbouu5+oJudsqlRsNf97y2Y/5ELyAg5ZZnBVDWpinwxRCTL21Y0L1
         +Z1ahstzl/PmfGw0ApSp4lkFQcnHVDsAh+I2JBQ521XuEtBKrVw4fcbFb9b6pUKlNuZ3
         Y1Qg==
X-Gm-Message-State: AOAM532Zhdhj9JPnS166E2RC8nY+Tos9JmeNzL78HJ5suO7dPqJWYDYa
	xc9GTt3JUBMaogzLI6+pyxHplMMCdKRJ6weKDsLDiA==
X-Google-Smtp-Source: 
 ABdhPJwF7706ounaRkYOFKskPdAE3AE/wLw6xgufoAf8noXzW8VifBleehgTrxpaQAqoozJj7LqOb9HenjlP9fqyx34=
X-Received: by 2002:a50:871e:0:b0:41d:77c0:6927 with SMTP id
 i30-20020a50871e000000b0041d77c06927mr19783270edb.354.1649885995486; Wed, 13
 Apr 2022 14:39:55 -0700 (PDT)
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
In-Reply-To: 
 <CANp-EDbCsrFazNTjpYbvZx-eRKhQ8GJeZH0VkL8Hco8p2w9oug@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 11:39:44 -1000
Message-ID: 
 <CAOSpxdZXfKhnmJm3TsZkbNb=Mqkj2=W4F4SSAoq8ne=RyJRr2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/164371

On Wed, Apr 13, 2022 at 9:05 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Wed, Apr 13, 2022 at 2:19 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> > Yes, and it appears they had a quite similar bug in the past!
> >
> > https://lists.debian.org/deity/2006/07/msg00074.html
>
> Interesting find... though it seems that is in a different sha256
> implementation than the one being used here ("Gifford").

I did another experiment, where I disabled generation of the sha256
entries in Release (by adding --no-sha256 to the apt-ftparchive
command)

As a result we get past this first hash mismatch in Release, but then
get later hash mismatches when it tries to download .debs.

https://errors.yoctoproject.org/Errors/Details/654717/

So it really does seem that apt sha256 generation is broken on
non-debian distros.

> The other factor is that it behaves on ubuntu, but not fedora. Do the
> native packages get built with the host gcc (11.2 on fedora 35,
> whereas 9.3 on ubuntu 20.x)? Or does yocto also build a native
> toolchain to build host packages with?

Perhaps Richard can answer this question!

Steve

