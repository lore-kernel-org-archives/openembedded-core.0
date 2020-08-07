Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.2633.1596824254031739980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 11:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=IK60KPxg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.68, mailfrom: brgl@bgdev.pl)
Received: by mail-io1-f68.google.com with SMTP id a5so2783144ioa.13
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 11:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4GM0YlVaV6oHYxLJPn/F+AT/vzQ1BGEtJYK6FlgJZiQ=;
        b=IK60KPxgX/1sGCtB2sbfL/Hf2s/iddR9FiWORit1Alz+ouL/KUFAUwqm1ElqPd4wdd
         DQ1RMV+l27Qt3Qu6mUq0VahwoB/u8RxOcqtWBejUZa0ZG1HDG+YbbQhwmUVFh9G/ZW+L
         w55UahcMoYXVfrr9lgn53Ht5Ls+msVdmFUfyZnA3fQDRPEs30H0suzgmkZNjlDMJlRMr
         jYrXvvYRnwkZherMj2oIPrJtMiIKwQ1Ixi8BuKy+WV0KxcHHQDG7S5L+JnLw9ohNHUYO
         EjH4lCaWuaF2wcLWTi5Ph2EJzmbX8yGUG+JyNxoz9YlWmJeeIaGmnJwMRWLxver1jf60
         LoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4GM0YlVaV6oHYxLJPn/F+AT/vzQ1BGEtJYK6FlgJZiQ=;
        b=XT1e9wTqjZv5i3iihY3aVX1deUHgt6TzDpKRUA+boiko+iVk5xICf3kgkWqwrgpcJN
         V3+F83KK/jUMwbly4evAZhckRCpS49qv9SQVV12xdJg6qTLqKqPvjY+YOh+/VLDySNEU
         n8wAVQ/jvCwcBfb0zGp4CDdz/uD1lfx5s5fzx6RR6AHHyRYQAVlVgQ0umlIKXDVBuhGt
         0rujYeLzDOD5K6mtKdseXdDJlLqHYpNtEsiN52NPdy+rmZxnHtS7/QfAFxiudYtCujkc
         b3sGUtpwO4Yr6JuMJJv0sA9tSP3jZY1NT5+JJIzDT1uxrCGPflUcbjYwcv7ywG1c7VFM
         0o9w==
X-Gm-Message-State: AOAM530NuHYUyw1hUTbmyYzMW2ZXPOyFVhdyvEW7+DwrVhg0U7NFJl/l
	WQjjwARq7AAoBBgAqLVboyj2go2vXjUxXojJdYZG+A==
X-Google-Smtp-Source: ABdhPJxGtaAueJsELDqgWxB+ZFFb2Ppni5w0JS5sd18jy8MD8kmMmUbzlEwvrqat5+4vNsvazYO1bkLT37ACJLmhHTI=
X-Received: by 2002:a5d:9586:: with SMTP id a6mr5640900ioo.131.1596824253102;
 Fri, 07 Aug 2020 11:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200512140529.27606-1-brgl@bgdev.pl> <7fbf9d94860522944c8764760b717a0524bf20b5.camel@linuxfoundation.org>
In-Reply-To: <7fbf9d94860522944c8764760b717a0524bf20b5.camel@linuxfoundation.org>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Fri, 7 Aug 2020 20:17:22 +0200
Message-ID: <CAMRc=MfFFmMdcsSihz3fgi2fzrAL+PSc03wVmTfxb3XVHrExyA@mail.gmail.com>
Subject: Re: [meta-OE][PATCH v3] image.bbclass: deploy image artifacts in stages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	Jerome Neanne <jneanne@baylibre.com>, Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 7:56 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-05-12 at 16:05 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
> > override. This way each generated set of artifacts is deployed as soon
> > as it's ready instead of the do_image_complete task handling the entire
> > deployement. This allows us to better fine-tune dependencies e.g. we
> > can make do_image_wic depend on fitImage task which can in turn depend
> > on do_image_ext4.
> >
> > We need delete the IMGDEPLOYDIR variable from the data object passed
> > to each image task so that it gets expanded with the correct override.
> >
> > In order to make sure that tasks added to SSTATETASKS in anonymous python
> > functions are correctly setup, move the code that assigns pre- and
> > postfuncs to an event handler invoked on bb.event.RecipeTaskPreProcess
> > in sstate.bbclass. This event is fired right after the anonymous
> > functions.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> > Changes since v2:
> > - dropped the qemuboot patch (already upstream)
> > - switched to % string formatting instead of using .format() for consistency
>
> Thanks, I included this in automated testing and its shown a few
> issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/943
>
> "oe-selftest -r
> sstatetests.SStateTests.test_sstate_nativelsbstring_same_hash " should
> reproduce
>
> I think multiconfig.MultiConfig.test_multiconfig and
> multiconfig.MultiConfig.test_multiconfig are also related but its
> harder to be sure.
>
> package.PackageTests.test_gdb_hardlink_debug isn't related in there.
> runqemu.RunqemuTests.test_boot_deploy_hddimg and
> runqemu.RunqemuTests.test_boot_machine_iso could be, not sure.
>

Hi Richard,

I've been trying to figure out what's wrong on and off for some time
now but I'm afraid I don't get the idea behind the NATIVELSBSTRING
variable and how it affects generating the hashes. Could you maybe
point me in the right direction because so far I've been unable to
find a way to fix these tests.

Best regards,
Bartosz
