Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.7716.1593081641608142920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fugQ5myg;
 spf=pass (domain: konsulko.com, ip: 209.85.210.48, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f48.google.com with SMTP id k4so1628427otr.7
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tHH9IT+CjdDfg0P2MyBJ9/ofBBQkfxanKg4Y5X/gdF0=;
        b=fugQ5mygbh5xr/jYpjHflFxQPebD/8IbvVVgszupzWf8E65wnIHBqCHzM72l5RkwD+
         qybzvRy7HJrncGr47Y/MdE0gNtZ4y4QJ2JmQMkF2f5StQR5mtBJRNQzITUkZHo5zzDv7
         zj1Qy1qJStu8o+ILIztg+Tapel05r3RcBb958=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tHH9IT+CjdDfg0P2MyBJ9/ofBBQkfxanKg4Y5X/gdF0=;
        b=G1siicB18i57Ozueur0u4rehg9jupz7HR3FB1Ni7YhTQHMvwhXHWHjFblDxj8DUgJ9
         /x36gsP1gfSoVL+75tTv69RUcfOUqKZop3ID1+wcQrwNbDbnmWAKJjy/aVTjGI3hqhrq
         3iG3oDs5hidZ8dHpImvpGOXkKfJaQ5gC344OtNQlMnOCr0cxTgo5MWkgVnKMj065VGYS
         LtDSV1N7yC7aHgpAeeTPNLCYLzzRuMln1tUZxMYzucKZ9ChYiJBXrYKhV5z1oufAn2Q+
         GVKmqUxdOJ9fMyAN5dwJNqTDivPfOYotMb8mOZcXeQ347mNwzKp9Vw1/d8RKA0BssD0r
         2fHQ==
X-Gm-Message-State: AOAM5303o/YdjehNekXVEKe7amzxN/a+wzz+xlXwPzHFF/7VanIgRbfw
	RAdJ03sSkfKDKi41EtIkyHiX9PO42XVawR+LGLulNTB0
X-Google-Smtp-Source: ABdhPJyiwiN8UV0RiAxWoZEdj4/SZSlpDuP05HQZET1s0BxRKBIJEUckBpo3YDmjUQeFPBBGtbnkTM5TKWgbi++fBDE=
X-Received: by 2002:a9d:6c02:: with SMTP id f2mr11486479otq.258.1593081640802;
 Thu, 25 Jun 2020 03:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:40:30 +0100
Message-ID: <CAM9ZRVu8BD9QuDh-RM_HxJQujQk9Qg4g+ENg2KFBvoYoMeJoQA@mail.gmail.com>
Subject: Re: [OE-core] Add package managers as a plugin
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:21, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Poky today has three different package managers, the well-known formats deb
> and rpm is supported as well as ipkg that is good for embedded devices.
>
> When building and having a good cache hit, a significant amount of time is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. ipkg is way slower than deb or rpm. To
> save build time and also get a package manager that is suitanle for use on
> targets where flash memory is a concern, support for apk is suggested.
>
> However, it might or might not be what's wanted for Poky since it increases
> the test matrix. Therefore this patch series refactors the package
> management code so that it's possible to add more package managers in other
> own layer. I will send another patch serie that will add apk.
>
> Perfomance metrics below, (note that this includes build times).
>
> APK
> ===
> bitbake core-image-minimal
> 15.84s user 2.60s system 0% cpu 1:26:19.21 total
> 16.01s user 2.58s system 0% cpu 1:26:03.72 total
> 15.69s user 2.61s system 0% cpu 1:26:45.45 total
>
> bitbake core-image-minimal -c cleansstate
> bitbake core-image-minimal -c clean
> bitbake core-image-minimal -f -c do_rootfs
> 0.55s user 0.06s system 4% cpu 14.236 total
> 0.54s user 0.08s system 4% cpu 15.247 total
> 0.52s user 0.15s system 4% cpu 15.143 total
>
> RPM
> ===
> bitbake core-image-minimal
> 18.57s user 3.09s system 0% cpu 1:31:29.09 total
> 18.58s user 3.08s system 0% cpu 1:30:53.80 total
> 18.20s user 3.31s system 0% cpu 1:31:06.69 total
>
> bitbake core-image-minimal -c cleansstate
> bitbake core-image-minimal -c clean
> bitbake core-image-minimal -c do_rootfs -f
> 0.58s user 0.10s system 3% cpu 19.470 total
> 0.57s user 0.09s system 3% cpu 19.480 total
> 0.60s user 0.07s system 3% cpu 20.381 total

Some initial review comments incoming on all these patches. I've just
done a surface level reading, I think the way you're submitting this
still needs some work before it's in a state where we can properly
review the changes in detail. Right now it's too big and too easy to
get confused when looking through 26 large patches.

I'm very supportive of tidying this up and making it more dynamic, we
just need to make sure we don't break things along the way.

Thanks,

-- 
Paul Barker
Konsulko Group
