Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B54C3271E
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 19:00:29 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.24420.1720206026477368876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 12:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fqGBZxJO;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7eeea388a8eso77872639f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720206026; x=1720810826; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayGyyqWcCJe6mJdLMxEH7OFhK7QkKrhp888GWgVdlis=;
        b=fqGBZxJOaLuf78TPl6kUt4TPPTYwnGbcbNZlrs/9WM6BOkuVj82xEJHdW7eNEOSps6
         6QYbazLZQy2W6rIEr9sW0aivl/sgLZKVaUbLr4iGOaJMUmtpNwMjcj/M/zFd+I+zqSSm
         JWQciNiuo7mdrWpn5rNZAQLGLmkxheiVrzSCVtgTKdPiTlDqS1AovMZeGm63RLfV6NfL
         MRX7X2mkF/ltqPy3dPYu0fwFLbBquYbt8qQWm9THesPs3KQ7xVx32d6g+Y76bgH7ml3+
         aEUukv3GYaWuZ2PgKOE0XpU5w474WkNzdnHsA+V8z+I/e90CSesokahTw4JolFKwm9JA
         Dncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720206026; x=1720810826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayGyyqWcCJe6mJdLMxEH7OFhK7QkKrhp888GWgVdlis=;
        b=cVcupGQ8+Ez5nxX4kk/pEIoNH9+5k7udP9vAG5zvNUu6oCwX6uDpttut/rTWJbWRW8
         vvwZX3DlKv88YETFNy2dzYVJ8BEbdZO7A0AC7lFxNjOUIs1aP6SDa+rGDmi6YO1Flt9f
         CXSaPtz/PoQ+lbc2kGVIJguqm7Tb78NosOmvXtT6Jf4Hit6wCb4bLZpXRYGtJZCzFWGq
         9sK7FFHPdMSDm//Dro0Fs4ugY7iZxyzfoJycM/DD14dslOjozhCGVYPQcYF4VKy5U4qX
         1X9zNX1J79uT272245951HlGWh/D+UxKj+7LyyrEd/IH3iBhJvldPnFpDo1rmx+ScBJf
         PiJQ==
X-Gm-Message-State: AOJu0YzExE7kn31J+WW/3vet1eZdo69kbsMMGrvK5+oYb21EbF+5e7DR
	6jzX5OcVgjJtJ9TvoBCZh6CPj1EO/ohorwvHeM+J+lzqb0RrOzSv+Q6HkB/uXTtmp/VVcbCWWnJ
	4yN+GItVN0qt6VdhRt5hUZ/5XjV4E4lk+
X-Google-Smtp-Source: AGHT+IGVnOLfqJ4EgXVSZXdlEX6+ETTjTHshmm7meD+JiTNMyXw3Cwr2fyKTeIqHftA7qugUqEqvprQX+4LgqbvaHkQ=
X-Received: by 2002:a6b:7712:0:b0:7f6:2e72:e81b with SMTP id
 ca18e2360f4ac-7f66de8d0b3mr606104039f.4.1720206025363; Fri, 05 Jul 2024
 12:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <bc15a9ebae0ad3841ac2be887c288b451426e69b.1720185337.git.joerg.sommer@navimatix.de>
 <CADkTA4O-jWiZHHy4h4qw6TN=HZdvLSs2vdD80pqCjA8CFwnJaA@mail.gmail.com> <6ualexsmklcjl6ez6m6knrkntqzc3jix4lgpo5yoi3k5kh2tio@iynnmkehphry>
In-Reply-To: <6ualexsmklcjl6ez6m6knrkntqzc3jix4lgpo5yoi3k5kh2tio@iynnmkehphry>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Jul 2024 15:00:13 -0400
Message-ID: <CADkTA4OtwW6E5CH9qUGsk=cCdHynfZHEu11Q6Gw7EFe+H1zE1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/kernel: Delay module signing until
 after strip
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 19:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201615

On Fri, Jul 5, 2024 at 2:35=E2=80=AFPM J=C3=B6rg Sommer via lists.openembed=
ded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> Bruce Ashfield via lists.openembedded.org schrieb am Fr 05. Jul, 10:08 (G=
MT):
> > On Fri, Jul 5, 2024 at 9:19=E2=80=AFAM J=C3=B6rg Sommer via lists.opene=
mbedded.org
> > <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> > >
> > > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > >
> > > The current do_package does not strip the kernel modules, if they are
> > > signed. Hence, the files in a release image stay very big and the deb=
ug
> > > information are not split into the kernel-dbg package.
> > >
> > > The idea of this change is to suppress the signing of the modules on
> > > `modules_install` and run `modules_sign` after the debug information =
was
> > > striped.
> > >
> > > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > > ---
> > >  meta/classes-recipe/kernel.bbclass | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > >
> > > Another idea would be to move the code to split the debug info in pac=
kage.bbclass to a
> > > stand-alone tool and inject this in the kernel's modules_install.
> > >
> > >
> > > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe=
/kernel.bbclass
> > > index 89badd90f1..96e40be085 100644
> > > --- a/meta/classes-recipe/kernel.bbclass
> > > +++ b/meta/classes-recipe/kernel.bbclass
> > > @@ -461,7 +461,8 @@ kernel_do_install() {
> > >         #
> > >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > >         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > > -               oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_=
libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_base_libd=
ir}/firmware modules_install
> > > +               # don't sign now, it's down after extraction of debug=
 information
> > > +               oe_runmake CONFIG_MODULE_SIG_ALL=3Dn DEPMOD=3Decho MO=
DLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=
=3D${D}${nonarch_base_libdir}/firmware modules_install
> >
> > This isn't a good idea, since it both hardcodes the option name, and
> > it doesn't allow any method of overriding the setting.
>
> The option name is also hardcoded in the kernel Makefile and drives this
> feature. I would threat it the same as DEPMOD and MODLIB.

Sure, but that's actually specific to a single kernel and kernel version, a=
nd
isn't spread from the kernel source to the meta-data coupling the two.

And I can easily configure that in, or out of, my kernel.

I'd absolutely not treat it the same as those two tools.

>
> > > +PACKAGEBUILDPKGD +=3D "sign_kernel_modules"
>
> > But even if those other variables are used, this seems to force the ext=
ra
> > signing step, which I can say for certain that not everyone wants.
>
> What would be the other option? Having an anonymous python function to ch=
eck
> the .config if signing and debug information are enabled and configure th=
e
> process accordingly?
>

You definitely do NOT want to grep the .config unless absolutely
necessary. That's fundamentally the same binding as putting the
option directly in the command environment.

I'd make it optional via a distro feature that enables signing (or
maybe there already is one for that ? I don't sign modules, so
I'm not familiar with what goes on in that area).

I don't have a specific problem with the implementation, I'm a kernel and
containers maintainer .. not a packaging expert. My issue is that it didn't
look like there was a way to disable the extra processing.

> As I said, the other way would be to create a stand-alone tool to split t=
he
> debug information and feed this as STRIP into modules_install. But this
> would alter the process too, because the stripping happens during
> do_install.

As long as it was optional, I wouldn't be adamant one way or the other.

But if it was passed into STRIP via a variable definition, someone
could set STRIP to whatever value they wanted and avoid the extra
processing or signing.

Bruce

>
> J=C3=B6rg
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201614): https://lists.openembedded.org/g/openembedde=
d-core/message/201614
> Mute This Topic: https://lists.openembedded.org/mt/107053401/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

