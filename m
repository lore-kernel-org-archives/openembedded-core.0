Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.24288.1585172288737984648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 14:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fKzF12EM;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: andrey.z@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id a81so4813055wmf.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EPrQSvDJsUai5GtNjjqIdzS7CZKes+cLg8LLVKVNO8s=;
        b=fKzF12EME9AwBkwMsg+4l7IqPeV+TZeLL/QKxwsMDEO7Ltj7lLjmXIhf99L4JHzZr0
         4MkXLil8bKk1MB9QukKXMK1aDd27DrgXCp6/ehczuw0b0DOpB0I3HvBR0LXRlkAkTllH
         yCAm4LVo6C4NP4+LSa5+Iw225OC25aet0fjviE26Fru1wji39/94/w3e1yVLS2tYIAFe
         UCa6866Aw+N7oCw4+7jFafmopX2pkMjQiePxsHiP77/8c8uadHgyywocMy1vYTFZj+60
         wWx1s/AxDbD9elu0e0rSY+Hxu/wrQ3n03jL0QZPWhekcYcIs6IsOUq/DMyXLz6eHqGlx
         qV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EPrQSvDJsUai5GtNjjqIdzS7CZKes+cLg8LLVKVNO8s=;
        b=s33UGI5mAaTrBlztvC8+gO+H/6c8BXPjB0iXVCK4p2GbACuVI1L0vG63HTIjOD9Cjv
         GoP4u3LRH8RdWO+WM9JipIgGq3HXCJZBADAWEjR5PUqkWZzc0LcWFNH1Ca36VlUD6da7
         Wwcj0H4Af1dkIKJvD9G9A50H+OYaD3XEZr4lCrUcFBu6Gddv6up2uzs4K52p9oA0d8ZI
         UBKp1siOJb2rydsFp5MKbxT/SsO0+i/BTjOYQedf64tRseWhch70q9tSKhU1eTW+bt+t
         8/SIiUSevGSND0pWUrMPkdWItr6An7eiwrkCGWzfb3F3huZSxWCx1F+kTjZXtpRbtI2u
         7v4A==
X-Gm-Message-State: ANhLgQ0wgXjXv1/+y4dz7c9G5SqptwqwMk4Xt600BcODvdQPdrmR9OPW
	lOHGlpcfGfW+vZU7a/qNu+wK/azDyh5jU8jFudI=
X-Google-Smtp-Source: ADFU+vuwiCVIcptN3WITzfoKXIuTb4PlNh1WGtmhUlAFhISdPZtV2x7vky6uDpyRGficNPHlf0OZ6ecMVMzDYylavN4=
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr5257440wmk.125.1585172287186;
 Wed, 25 Mar 2020 14:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
 <CAHtQpK7OJdEQCSY1wsKGKLoz1nQZ7SHCsj9ke_BjC=VWrYfX5Q@mail.gmail.com> <6502.149.199.62.130.1585168558.squirrel@gate.crashing.org>
In-Reply-To: <6502.149.199.62.130.1585168558.squirrel@gate.crashing.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 25 Mar 2020 22:37:55 +0100
Message-ID: <CAHtQpK7im-SixCXD-eUF3Q6z7_GNnopeAKme7hetXca-Umd7RA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Ross Burton <ross.burton@intel.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 9:36 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> > On Wed, Mar 25, 2020 at 7:15 PM Mark Hatle
> > <mark.hatle@kernel.crashing.org> wrote:
> >>
> >> Trying to build mesa-gl without X11 enabled, results in numerous errors
> >> about being incorrectly configured, such as:
> >>
> >>   ERROR: Problem encountered: building dri drivers require at least one
> >> windowing system or classic osmesa
> >
> > I believe I was fighting similar issue in meta-freescale layer for
> > imx8mm derivative [1], where the status of GPU support was not know at
> > the time. What I did back then is set the default configuration to
> > osmesa and used swrast in order to be able to use mesa on that
> > derivative. After that, when GPU support has been added into Mesa -
> > those modifications were reverted.
>
> Do you have a pointer to that anywhere?  I'm curious if any of it might
> still apply.. but I know nothing about mesa and what configurations are
> even possible.

I've included the link to my commit in meta-freescale layer, where the
PACKAGECONFIG is set to use 'classic' OSMesa and adds swrast to
DRIDRIVERS. This should turn the rendering to be performed in the SW,
effectively working for all backends (at the obvious performance
penalty). It took me quite some digging to figure this combination
out, as I also cannot claim myself an expert in mesa...

>
> > I guess turning to swrast in case if someone would decide _not_ to use
> > X11 - is not a bad option here, rather than enforcing the X11 for
> > distros which are using this recipe. Any thoughts?
>
> I don't know any any reasons we couldn't do this.. but like I said.. I'm a
> newbie when it comes to mesa.

Maybe something like this could be used (warning: untested):
PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
'x11', 'x11', 'osmesa',d)}"
DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
'', ' swrast',d)}"

>
> --Mark
>
> >>
> >> After consulting with the author of this recipe, it was clear that it
> >> was only intended for the X11 use-case, so requring X11 should avoid the
> >> error message above.
> >>
> >> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> >> ---
> >>  meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> >> b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> >> index d4b1c1c454..5674c6b1fe 100644
> >> --- a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> >> +++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> >> @@ -6,5 +6,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
> >>
> >>  S = "${WORKDIR}/mesa-${PV}"
> >>
> >> -PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES',
> >> 'x11', d)}"
> >> -PACKAGECONFIG_class-target = "opengl dri
> >> ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> >> +REQUIRED_DISTRO_FEATURE = "x11"
> >> +
> >> +PACKAGECONFIG ??= "opengl dri x11"
> >> +PACKAGECONFIG_class-target = "opengl dri x11"
> >> --
> >> 2.17.1
> >>
> >>
> >
> > --
> > Regards,
> > Andrey.
> >
> > [1]:
> > https://github.com/Freescale/meta-freescale/commit/9a2210d9ec707531436dc4b56ce655c0bf50a8a8
> > 
> >
>


--
Regards,
Andrey.
