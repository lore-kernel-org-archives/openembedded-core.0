Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.8369.1622729727951808357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 07:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RravxYL3;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id c10so9426982eja.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HBUzjXlSFzqvqcOYsIEC8PFJhhsSI35sif42OGyHUec=;
        b=RravxYL3h74VO/1taq5097ON1A0PW4tjgQjl0DRNe8m8MR4m237YVlHYHggeVC+fhZ
         x/R+PQug7Y4/0Qm4ZIOCSemUrYqkOfO0g8qRlz1WDb0ekqAW0/IMolVRxNB5F/M2kgS6
         a8FqHICvp8zXQxjMM9Bl8LL2lExXjv01mOnUDcGnn0lpIdODIvrpm2r13d9mz97i6JCT
         vQcsYi48RZtmWaWP+pEMq9JhbTBHrX5C1PEo4Mn8XfZo6rv9/d4yGZqT0WHNgb6rRpda
         bSeVvMVpAaXaEjvzz9ffHqkoASs7/iQTbwppOOf1zUB1f7+8/uH3GHANfdwuLUFv75AQ
         TqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HBUzjXlSFzqvqcOYsIEC8PFJhhsSI35sif42OGyHUec=;
        b=KDVFiRNGn7slnp53943sUfO49QfoMnKrgjmkWFJv40ki02knQwIOhJAhlJIp7I5Ep1
         cbx+Ol9DtOmuuI1q3lnvamuKozz0H2SvLbQfH3iWosa4LvJm9KmsiUq1ZXQ8Hnz0C/bm
         6MmWfUxh2csfK2O3mLDTS6pvWoo0+docmW8w3lFzrdBhX5e7wYr9XKa/OEETuWVuw2W3
         6pum6QmDYIV0oTxV/70AvTshQE5l7g1RcqBmH+B1aVlFZtCWKvf3i1l//Qy0U3+5vQYX
         6+QotwEdr+27bIO2k9DkE10W0Brjtw/6NJdtxOoQ183zhOPYQNhvGMYrHsF//n085dxm
         eTjA==
X-Gm-Message-State: AOAM530Bh2sEyHc1cUAKYWPWQwyaxwjDV/50rapNAVARnSif2bZ1Tu63
	zJ7HBpwwlcJfjtWMAMBPNihCWlOSb7I6DPLHvII=
X-Google-Smtp-Source: ABdhPJw3etxgKAS+OANRL7MJTcHUZ1Z/IkFPDmlZas7OaWFEM7Fa0U+9dyIRXe2O3fbd3BmU4wubxFQDLB0XFw/exjc=
X-Received: by 2002:a17:906:4f10:: with SMTP id t16mr23834536eju.337.1622729726137;
 Thu, 03 Jun 2021 07:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <b389383-5997-4638-97f-e6919364bda7@crashcourse.ca>
In-Reply-To: <b389383-5997-4638-97f-e6919364bda7@crashcourse.ca>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Thu, 3 Jun 2021 16:15:14 +0200
Message-ID: <CAAQYJAveuBzyGwA4uh967Y=x0=TgFsdQzy4fnA8U64Xp2yBCLA@mail.gmail.com>
Subject: Re: [OE-core] want to clarify proper approach to shared lib (.so) installation
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 4:01 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   sort of a 2-part soliloquy. in current YP code base i've inherited,
> most of the internal (local directory SRC_URI-based) recipes inherit a
> proprietary class that, among doing other internal, proprietary
> things, totally redefines PACKAGES as:
>
>   PACKAGES = "${PN} ... ${PN}-dev ..."
>
> i had never really noticed that before, but it's pretty obvious that
> that's not a great idea, as it allows what i call the recipe "base"
> package (${PN}) to gather up everything that matches its standard
> wildcard pattern before moving on, in effect "stealing" content from
> subsequent packages they would normally get if the base package was at
> the end, not the beginning.
>
>   somehow, this has worked all this time, but it's clear(?) that what
> would be the "normal" contents of the various packages isn't going to
> be what one would expect; in particular, the base package is going to
> be what i call "overpackaged", with lots of stuff it doesn't really
> need so i'm guessing what's going into the image is more than is
> really necessary. somehow, though, it's worked all this time until
> recently, when i noticed this quirk was causing some Q/A issues, so i
> took a deep breath, commented out that line from the class file to use
> the default packaging approach and re-tried the build, which is when
> all hell broke loose.
>
>   it turns out that these internal recipes use local Makefile-based
> source directories, which build, then install their generated
> artifacts in a temporary (non-YP) staging area per recipe, *then*
> manually (little by little) install stuff in ${D} via a general
> do_install() routine, at which point the regular packaging and
> subsequent steps kick in, but it's what now gets copied into ${D} that
> is causing grief.
>
>   apparently, many of these recipes generate a shared library, and i'm
> well aware that the *normal* packaging involving a shared library is
> like this example from libidn2 (snipped for brevity to show only
> shared lib stuff):
>
>  libidn2/
>   usr/
>    lib/
>     libidn2.so.0 -> libidn2.so.0.3.7
>     libidn2.so.0.3.7                    [actual library file]
>
>  libidn2-dev/
>   usr/
>    lib/
>     libidn2.so -> libidn2.so.0.3.7
>
> so the *normal* packaging for a shared lib is that the lib itself and
> a symlink to it go into the base package, while another symlink goes
> into the "-dev" package. i'd never really paid that much attention to
> that until i reset that PACKAGES variable, as all of these internal
> recipes end up installing into ${D} nothing but the shared lib file
> itself under /usr/lib, and why this has worked all this time is a
> mystery, but having made this change is generating all sorts of Q/A
> diagnostics as this is what ends up in ${D} using a "fubar" recipe
> example given the manual installation being done using normal
> packaging:
>
>  fubar/
>   usr/
>    bin/
>     ... snip ...
>    no lib/ directory
>
>  fubar-dev/
>   usr/
>    lib/
>     libfnvcma.so            [actual shared lib]
>
> unsurprisingly, there are QA issues with the above:
>
> ERROR: fubar-1.0-r0 do_package_qa: QA Issue: -dev package contains non-symlink .so: fubar-dev
> path .../packages-split/fubar-dev/usr/lib/libfnvcma.so'[dev-elf]
> ERROR: fubar-1.0-r0 do_package_qa: QA Issue: fubar rdepends on fubar-dev [dev-deps]
>
>   *sigh*.
>
>   in short, because these internal recipes generate only the single
> shared lib file itself and that's all that's copied into ${D}, the
> regular Q/A tests will naturally barf, and i could use INSANE_SKIP all
> over the place to get around this, but it seems to me that the proper
> approach is to tell the developers that they need to start generating
> the appropriate symlinks for all of their recipes so packaging is done
> properly.
>
>   i'm just about to check if there is a switch or class i can invoke
> that will "fix" this issue (as in, set up the shared libs in ${D}
> properly), but apart from that, am i correct in thinking that the
> developers need to do this correctly from the beginning?
>
> rday
>
> 
>

Hi,
in the latter example you are packaging an unversioned shlib:

libfnvcma.so            [actual shared lib]

In this case you might play with
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""

Please have a look at
https://wiki.yoctoproject.org/wiki/TipsAndTricks/Packaging_Prebuilt_Libraries

Cheers
A.A.
