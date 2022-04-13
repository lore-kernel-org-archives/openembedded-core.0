Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58072C49ED8
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7816.1649863899883847038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WZ1OTHox;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id c64so2812798edf.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mygNnZOL03ldqD4RefCydGuf2MW0OzpiqOMsXFjYlfI=;
        b=WZ1OTHoxmTgmOylRnYlrxtZrxWz5veTjB9U2/fxrpdAA5ll7U8Xe1TQF8xX/6VEHrP
         sF9mxcZDmkShgufoZ0cNq++UN27xIV9bWb1EIrIsc/y6c/Ak4LbSuuqa3vFBwY/kdJhZ
         QUfJAGENOjFEFgsyPx0Vqs35Ei6szJaA0Id1+Zb5UORcqEnzz+N++oFtRL3qZbNK0cOZ
         wIVHRkhma55ekKHA/p8+tMHO3WKtEz9rGClh3NshsXmp+VUQG+uFxu6/4ZnBge/5zHD6
         9ParTG/ZTn5aCyFQrUwRd9fSF/biHYLQHMnx9JW9CwNxCn9ZAm7hDSkf13oYKZBft3y4
         B+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mygNnZOL03ldqD4RefCydGuf2MW0OzpiqOMsXFjYlfI=;
        b=jy5LIW+dREqYQ3wIs0ssT/Siw2J4p2s3PIvsp4AuowdjksKqmfoVVf/oWmm+F84E7I
         M7gC697jBD1jZSCAQPYwzoNSI1owmMwYV8iFXJrMFV6iuHKbqWSc4gmlrtgslVid144k
         0D9TCpT5yVfyfSyG0oJ5BuW/vmTWp6tP7s3XBAQiAkIAIcZYRE+UqFAXazNDWcSjtInZ
         spzC9n9J/pD0rz/+XBZKgzdofqqUhmL3Gn/VcyD0ItjhVLj6rLprrfR3Sg33/xZxbmj+
         mgchxlGP3LSOG3Inw/M0FbqVZI3rn4GkrdGx9DBdrVfvj4A65lCVDU2hebncRCCRQ7s4
         BTbQ==
X-Gm-Message-State: AOAM531r2hs8HSvwvaimJ3WdEwWJljcKw3HYJO/U3VKU1Y+J/kdfzeLp
	XsWDJrW4DgSdp2y25nD2bm4ikRP4O2y0HnW8ZcV5sQ==
X-Google-Smtp-Source: 
 ABdhPJzWDEhUN1HODl10pxdou5uNCb3mLd6YWEwE5QFo+lc/MvsU8M7Q7Goln35CFZTESNINhKHcCMRSDE5kvmVryM0=
X-Received: by 2002:a05:6402:43c4:b0:41d:9403:8dca with SMTP id
 p4-20020a05640243c400b0041d94038dcamr8591232edc.184.1649863898031; Wed, 13
 Apr 2022 08:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
In-Reply-To: 
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 05:31:26 -1000
Message-ID: 
 <CAOSpxdbqFdc1ts-xSAmh8uceYjo55VH3ppAuYnOw7RrUfKyEjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164332

On Tue, Apr 12, 2022 at 3:21 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Tue, Apr 12, 2022 at 5:49 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> > I added a debug option to the failing command and did another autobuilder run.
> >
> > You can see the output here:
> >
> > https://errors.yoctoproject.org/Errors/Details/654608/
>
> Okay, same error, "Hash Sum mismatch". And if I squint between all the
> URL-encoding, I can see the md5/sha1/sha256/sha512sum values.
>
> The "apt update" command is doing the following:
> - fetch the file called "Release"
> - fetch the file called "Packages.gz" --> error occurs here
>
> Looking inside the Release file, it is plain text, and contains the
> md5/sha1/sha256/sha512 sums of both Packages and Packages.gz (and also
> the first two lines of Release).
>
> Manually checking each of those sums reveals an inconsistency: all the
> sha256 values inside Release are incorrect, while all the other
> md1/sha1/sha512 values are correct.
>
> And when we look at the URL-encoded debug info... the sha256 value is
> the correct one for Packages.gz (as computed manually). However it
> does not match the (incorrect) value within the Release file. Thus it
> seems apt-get is justified when it complains about "Hash Sum
> mismatch".
>
> Going back to my Ubuntu system, and looking at the generated Release
> file... all the checksums are correct, including the sha256sum.
>
> So I am now looking into how Release file gets generated... as the
> problem appears to be there... and it happens on Fedora but not
> Ubuntu.

As far as I can tell it is done here:

https://git.yoctoproject.org/poky/tree/meta/lib/oe/package_manager.py?h=dunfell#n301

> One additional point to add: on the same Fedora 35 system, I did a
> full rebuild *without* with xz/gzip CVE fixes, and the apt failure
> still occurs. To be certain, I nuked cache, sstate-cache and tmp (so
> basically the entire build directory) and the rebuild took several
> hours.

Now that is really strange!  In my experience it has only appeared
after adding the zlib or xz CVE fix patches.

I just started two runs on the autobuilder, with the zlib patch as the
only difference.  Both on Fedora 35.

Let's see if I can confirm what you are seeing!  I don't have a local
Fedora 35 machine, so I need to rely on the autobuilder.

Steve

