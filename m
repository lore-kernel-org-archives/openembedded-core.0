Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
 by mx.groups.io with SMTP id smtpd.web10.1313.1592607825920102371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 16:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GsLaQSw6;
 spf=pass (domain: gmail.com, ip: 209.85.161.65, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oo1-f65.google.com with SMTP id y45so2217133ooi.8
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DrB4VdvOiimpVY7ezAdGEE33lMIjHctZ0+77lWoj0EE=;
        b=GsLaQSw6IpxhV+UyWBYsvlXwtcWZFeWPZ/xZXT42Dt3bkWGz+02Ahtg3ODbVuqMNv3
         qDkwjsJ6lTJFQrsPZkauFHEqJuUTCYIXOOcKHkyRnBOMBQxDa6l+fG6NExfVVElivV8Q
         XGcpcATR8CUj3bxetzzTTEYQmjd+2v98liGV4w4ZViZtciJQrmmvyPwgQi7UqM6Zm+5U
         eSeUF4IKbWz9Cl7V5FsJxi0+a2/FwtJjKKplWQbeshKT1vGgsnXWJZClmh5XORLDGTx4
         CQK6KGnnbab8e7xoZL+r8AkfWITatlg3H87kE0BNsQ+iE/QnJ9zkW9AxvlHJ99uaGSbF
         zjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DrB4VdvOiimpVY7ezAdGEE33lMIjHctZ0+77lWoj0EE=;
        b=PxaNVuuFni5n1GZSkto+mNrJPYNgausoWh9nKQS4TKGPECVYu4beMQDKVjXN8LG6lw
         R3Vj5vtXMpT2xoSSTCLXxiqhYfwEBrjA35qvWgjpD4xQmQjY7x0ICyNLUZC2gV2x1zqf
         +J3h74cQ/a3G00tj9RwjswQbra/8Mt2sWJjM0lSTXVCjUR9PaVUtZOz4FTqaJi5qjjzB
         JRhgO4YGyKx89DSaZ9Ua9Tw4YuiH1o543vjvCxKAUWLkfuxktK/d2JHREbbF7tWxSvV2
         EgXuMq+h2mSUISElvzGkFY6L8ZDRvthy8N/hUM09TZQwSUb9hPXDOs5k6L36MxFJUJh5
         qTVg==
X-Gm-Message-State: AOAM533Rso8ML9+POXyzeGLjfSVfeJVx7aXF4YSE9dEajcPKPsCWmyX4
	aBWWoWd95VXDhUnBEc3TIjTI2uU1EU93D0TnX8U=
X-Google-Smtp-Source: ABdhPJxP6EzW8a0RKI4jZU7HJ9jUkNpVXXhHdmnFCwHhhxyjP/6CaJmPSqvUF0et+QnUwCz5MsCUIP4dkY65xTzb2HA=
X-Received: by 2002:a4a:2412:: with SMTP id m18mr5299217oof.36.1592607825173;
 Fri, 19 Jun 2020 16:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200617230710.9163-1-christopher.w.clark@gmail.com>
 <afb6222235af73893eb979a1f486108e902d4eaf.camel@linuxfoundation.org>
 <a2dcab79-dd9f-168a-c391-07897ad1b556@gmail.com> <CACMJ4GZGKQGGoZ=qA1SRvMuesRNDTkOVs4rcm_8xrU=Eur78nA@mail.gmail.com>
 <ca209cf1-0c89-634f-ff18-e1049e57034e@gmail.com>
In-Reply-To: <ca209cf1-0c89-634f-ff18-e1049e57034e@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Fri, 19 Jun 2020 16:03:33 -0700
Message-ID: <CACMJ4Ga4hQR-ptz_41O1TYmgZhfsRUWOQEPDU8H8POcT2PTQxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 19, 2020 at 12:35 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 6/18/20 11:58 PM, Christopher Clark wrote:
> > On Thu, Jun 18, 2020 at 1:27 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
> >>
> >> On 6/18/20 1:12 AM, Richard Purdie wrote:
> >>> On Wed, 2020-06-17 at 16:07 -0700, Christopher Clark wrote:
> >>>> Both grub-native and grub-efi-native included packaging for the
> >>>> grub-mkimage and grub-editenv tools, which prevented concurrent
> >>>> installation of both the grub-native and grub-efi-native packages.
> >>>> This caused errors on image generation with wic when populating
> >>>> partitions with both legacy and efi boot support, so resolve this by
> >>>> removing the duplicated tools from grub-efi-native and add a
> >>>> runtime dependency from it to grub-native.> >>
> >>>
> >>> I think we want to PROVIDES_append_class-native = " grub-efi-native" in
> >>> grub and then drop the BBCLASSEXTEND from grub-efi?
> >>
> >> Just for the record, I tested building grub-native (x86-64) both with
> >> platform "pc" and "efi", and in the same build directory, and all tools
> >> in ${bindir} were binary identical. Asking in #grub on freenode also
> >> confirmed this, apparently Debian packaging also assumes this.
> >>
> >> So no grub-efi-native required, and we can remove that
> >> _class_target/_class_native special handling as well.
> >
> > I'm not as confident as I was about the results of the binary
> > comparison that I did, since objdump definitely wasn't showing the
> > strings differences that were clearly present between those binaries.
> > I think that proposing this change was a mistake since there could
> > well be other layers that depend on core having separate packages with
> > behaviour specific to those that is needed. Sorry for the noise.
> >
>
> I dug some more into this. That GRUB_PKGLIBDIR define which references
> the recipe specific install sysroot is actually unused and could be
> removed. But there are 3 other values that contain the install sysroot
> being encoding in the binaries:
>
> GRUB_DATADIR =
> $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/share
>
> GRUB_LIBDIR =
> $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/lib
>
> GRUB_SYSCONFDIR =
> $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/etc
>
> But all three values refer to directories that are not expected to
> exists at the time they are executed, right ? At least not for me using
> rm_work.bbclass. Where grub-mkimage is used in the efi recipe, -d is
> passed to override the libdir.

grub and grub-efi are separate packages because they build different
software to build systems that boot differently, and are packaged that
way in multiple distros. It allows for one version of one tool to be
used and a different version of the other to be used in building the
same system, via Yocto/OE's flexible layer architecture. The same is
true when they are used natively during a build.

I don't know of a case where installing the native version of a
package would instead slipstream in the tools from the other in this
way, and I don't think it's right to do so: it would be
counterintuitive, and so potentially time-consuming to diagnose any
issues arising.

> So I'd still vote for removing grub-efi-native.

Please don't.

Christopher
