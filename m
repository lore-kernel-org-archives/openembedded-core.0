Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.5379.1622793502188362581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 00:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RqhfI3dI;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id p17so11967495lfc.6
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 00:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=geyibni7nzHd6rB1aYX6XUDl8y1wKsaucmRqOToKQsg=;
        b=RqhfI3dI3YW2epV/TtAYDw2X5mJYqPsda9cMhTAewencd9Sk6eFOi/tE3VO9LRSfDZ
         A0+3BZ7VKIQbfhsRGSiquJDxnjffmCyb3E4CojIsuxY7hG7g8xNwzCSPOUPCbP4/Xe8u
         NgyRVti7k//tFi97pYh04sP39D7CWj6eqewlTTPWDo5mU+We+Ee50saw0pO0zQwMvBbe
         T5NaRV6f2ct2Ev2gwLqfZgVOaPMWedOxkqAED72of8lmVTf/5IIzZ3si7xuTeqZbFAab
         nJGz4nVqF2neS0kv77vrXZ7x+CzOUCi7jZEWcBoNNxJGMKWJRfbUurSBte0iM46hMZKj
         RFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=geyibni7nzHd6rB1aYX6XUDl8y1wKsaucmRqOToKQsg=;
        b=CvPTziBK8tVEKCvhMzDkhOVTPz0ujrv7lJWDI1imNnw/Evb6neg0lzOT3xHQwjPL/r
         9ijnU4h2qKf5TYV1mry+RbPnCW2JI3VkF6Jl474LyI93JcrWSbYRnv2/Ssnmx7jK2byz
         Ze+5tQx76IN4iKrL6myYQhZ1XSuECRLEGnGJHJ4UPJYh1ocep2IRpfCnc6pNdLNxmmOn
         wpjzPcn7DntjGkX2hEQg2w7q2+fMS4PYr4kBGOND1ZeKO3+F8Hzpfndi3s85/kwkIYPO
         f56OzhgH5yPRkdlruFubYoqikVldkMvnt+Quqh+Gu6ynrlLdjuDPq5HOlegBRBzcOue6
         7o8A==
X-Gm-Message-State: AOAM530JiITCtKVrlgXi2H76dCeXvAAbHKauf+dCvhnf9RkI7ZRWTSK1
	NhcGL+PsP8r10abjPRMJ3/lzOr8eShloclYO/OA=
X-Google-Smtp-Source: ABdhPJzbhnEbhxIt5U+Bunv8YCxZoH2tgfyFIwCTv1lBSNua4iRk7u7DfK8PRvjzw+S2Ja9jjfmYfUX9JkFdn91fowA=
X-Received: by 2002:ac2:569a:: with SMTP id 26mr1979233lfr.257.1622793500199;
 Fri, 04 Jun 2021 00:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <b389383-5997-4638-97f-e6919364bda7@crashcourse.ca>
 <CAAQYJAveuBzyGwA4uh967Y=x0=TgFsdQzy4fnA8U64Xp2yBCLA@mail.gmail.com> <af372b1c-d83-8484-d4b0-c8d43c2375f6@crashcourse.ca>
In-Reply-To: <af372b1c-d83-8484-d4b0-c8d43c2375f6@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 4 Jun 2021 00:58:09 -0700
Message-ID: <CAJ86T=WtkkUjFHQiY1a-+4-7-JxTZcdTM+6aHJ+FYc5o1hzHzg@mail.gmail.com>
Subject: Re: [OE-core] want to clarify proper approach to shared lib (.so) installation
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Andrea Adami <andrea.adami@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 7:26 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Thu, 3 Jun 2021, Andrea Adami wrote:
>
> > On Thu, Jun 3, 2021 at 4:01 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >
> > >   sort of a 2-part soliloquy. in current YP code base i've inherited,
> > > most of the internal (local directory SRC_URI-based) recipes inherit a
> > > proprietary class that, among doing other internal, proprietary
> > > things, totally redefines PACKAGES as:
> > >
> > >   PACKAGES = "${PN} ... ${PN}-dev ..."
> > >
> > > i had never really noticed that before, but it's pretty obvious that
> > > that's not a great idea, as it allows what i call the recipe "base"
> > > package (${PN}) to gather up everything that matches its standard
> > > wildcard pattern before moving on, in effect "stealing" content from
> > > subsequent packages they would normally get if the base package was at
> > > the end, not the beginning.
> > >
> > >   somehow, this has worked all this time, but it's clear(?) that what
> > > would be the "normal" contents of the various packages isn't going to
> > > be what one would expect; in particular, the base package is going to
> > > be what i call "overpackaged", with lots of stuff it doesn't really
> > > need so i'm guessing what's going into the image is more than is
> > > really necessary. somehow, though, it's worked all this time until
> > > recently, when i noticed this quirk was causing some Q/A issues, so i
> > > took a deep breath, commented out that line from the class file to use
> > > the default packaging approach and re-tried the build, which is when
> > > all hell broke loose.
> > >
> > >   it turns out that these internal recipes use local Makefile-based
> > > source directories, which build, then install their generated
> > > artifacts in a temporary (non-YP) staging area per recipe, *then*
> > > manually (little by little) install stuff in ${D} via a general
> > > do_install() routine, at which point the regular packaging and
> > > subsequent steps kick in, but it's what now gets copied into ${D} that
> > > is causing grief.
> > >
> > >   apparently, many of these recipes generate a shared library, and i'm
> > > well aware that the *normal* packaging involving a shared library is
> > > like this example from libidn2 (snipped for brevity to show only
> > > shared lib stuff):
> > >
> > >  libidn2/
> > >   usr/
> > >    lib/
> > >     libidn2.so.0 -> libidn2.so.0.3.7
> > >     libidn2.so.0.3.7                    [actual library file]
> > >
> > >  libidn2-dev/
> > >   usr/
> > >    lib/
> > >     libidn2.so -> libidn2.so.0.3.7
> > >
> > > so the *normal* packaging for a shared lib is that the lib itself and
> > > a symlink to it go into the base package, while another symlink goes
> > > into the "-dev" package. i'd never really paid that much attention to
> > > that until i reset that PACKAGES variable, as all of these internal
> > > recipes end up installing into ${D} nothing but the shared lib file
> > > itself under /usr/lib, and why this has worked all this time is a
> > > mystery, but having made this change is generating all sorts of Q/A
> > > diagnostics as this is what ends up in ${D} using a "fubar" recipe
> > > example given the manual installation being done using normal
> > > packaging:
> > >
> > >  fubar/
> > >   usr/
> > >    bin/
> > >     ... snip ...
> > >    no lib/ directory
> > >
> > >  fubar-dev/
> > >   usr/
> > >    lib/
> > >     libfnvcma.so            [actual shared lib]
> > >
> > > unsurprisingly, there are QA issues with the above:
> > >
> > > ERROR: fubar-1.0-r0 do_package_qa: QA Issue: -dev package contains non-symlink .so: fubar-dev
> > > path .../packages-split/fubar-dev/usr/lib/libfnvcma.so'[dev-elf]
> > > ERROR: fubar-1.0-r0 do_package_qa: QA Issue: fubar rdepends on fubar-dev [dev-deps]
> > >
> > >   *sigh*.
> > >
> > >   in short, because these internal recipes generate only the single
> > > shared lib file itself and that's all that's copied into ${D}, the
> > > regular Q/A tests will naturally barf, and i could use INSANE_SKIP all
> > > over the place to get around this, but it seems to me that the proper
> > > approach is to tell the developers that they need to start generating
> > > the appropriate symlinks for all of their recipes so packaging is done
> > > properly.
> > >
> > >   i'm just about to check if there is a switch or class i can invoke
> > > that will "fix" this issue (as in, set up the shared libs in ${D}
> > > properly), but apart from that, am i correct in thinking that the
> > > developers need to do this correctly from the beginning?
> > >
> > > rday
> > >
> > >
> > >
> >
> > Hi,
> > in the latter example you are packaging an unversioned shlib:
> >
> > libfnvcma.so            [actual shared lib]
> >
> > In this case you might play with
> >  SOLIBS = ".so"
> >  FILES_SOLIBSDEV = ""
> >
> > Please have a look at
> > https://wiki.yoctoproject.org/wiki/TipsAndTricks/Packaging_Prebuilt_Libraries
>
>   excellent, i was sure there was a simple solution to this.

Just a warning, but if your Makefiles are not generating versioned
shared libraries then they are probably not setting a soname either...
and that really messes up OE's automatic runtime dependency tracking
for shared libraries.

If OE is your main build environment for these components it's usually
better in the long run to just update your Makefiles to create
versioned shared libraries (using simple version .0 and a single
symlink is fine) and setting a soname than to use the above trick to
force packaging of an unversioned .so and manually defining runtime
dependencies everywhere.
