Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch [185.70.40.137])
 by mx.groups.io with SMTP id smtpd.web12.8659.1590658032239447453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 02:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.ch header.s=protonmail header.b=YYU3OPlI;
 spf=pass (domain: protonmail.ch, ip: 185.70.40.137, mailfrom: vygu@protonmail.ch)
Date: Thu, 28 May 2020 09:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail; t=1590658029;
	bh=TlzRzdes3UkrzAB6nMR+66xOb9q+lQd+RUKwqv9QwN4=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=YYU3OPlItPhjpeAlCNsfA8iKWU91X97XSXxrev6KV/vWOHZq4IHCiaHUjrhyd0ejr
	 BmHXwtpSIpKoSF9wEMo3hG/LBTW33nKfIDwpoYgsjG+SueQ19FVBdd2XPVKb21+77x
	 QLjSV3lKukqV9jNLBqVr0wzn/5oJD9VhmFVwALrY=
To: Andre McCurdy <armccurdy@gmail.com>
From: "vygu" <vygu@protonmail.ch>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Reply-To: vygu <vygu@protonmail.ch>
Subject: Re: [OE-core] Issue with qemu and a shared sstate-cache used by different linux distribution supported by yocto
Message-ID: <qa2uQ39nq-8kj3sx9Ukaq3AaW3rKr1FbMgEfr2RAEUFqnKWONV6HLOZB9Q4uB8lf1I7jZefSUFZlJ3pSuCJCEQeJkz2NLfbQ9mF4dw5GahA=@protonmail.ch>
In-Reply-To: <CAJ86T=Wbyg2DeYojcecH7OLwB-SJprXaZ3Nqha0+9t-gPjLn6Q@mail.gmail.com>
References: <qGlJFzBcawqf2UFr8E8EaYuftNrwyxaR9FaRpw7UDU7hVtXdCiCR9oZT9pWwRM-XXY-_OoOVLDeYazLfwnS7FbFIijyMlVVBGHDUc6R_EP8=@protonmail.ch>
 <CAJ86T=Wbyg2DeYojcecH7OLwB-SJprXaZ3Nqha0+9t-gPjLn6Q@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

After some investigation on the debian buildfarm, we can see in the build/t=
mp/work/x86_64-linux/qemu-system-native/4.2.0-r0/temp/log.do_configure  "li=
bnfs support    yes".
If we comment in poky/meta/recipes-devtools/qemu/qemu.inc all the prepend d=
o_configure_prepend_class-native(), we obtain "libnfs support    no".
The function do_configure_prepend_class-native, as written in commentaries,=
 is to find sdl. But we see now it adds more than just the sdl support.


Sent with ProtonMail Secure Email.

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Thursday 28 May 2020 03:17, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, May 27, 2020 at 5:29 AM vygu via lists.openembedded.org
> vygu=3Dprotonmail.ch@lists.openembedded.org wrote:
>
> > Hello,
> > Since the zeus serie (also with dunfell), we observe an issue with runq=
emu when we share the sstate-cache thanks to a mirror between different lin=
ux distribution supported by yocto.
> > If we build a sstate-cache on a debian 10 x86_64 buildfarm, and after t=
hat we use it on an ubuntu 18.04 x86_64, runqemu don't find several libs.
> > We have reproduced this problem on two different pc with ubuntu 18.04 a=
nd 16.04.
> > We don't have this problem, if we use the shared sstate-cache on anothe=
r debian.
> > In all cases, a ldd on the qemu binary shows us the use of local/host l=
ibs, not the yocto libs.
> > Is it an expected behavior? or not?
> > Runqemu's libs have to come from the linux distribution or from the yoc=
to build env?
>
> There are two cases, depending on whether you have uninative enabled
> or not. It's disabled by default in oe-core but enabled by default in
> poky (the distro aimed at testing).
>
> With uninative disabled, native binaries link with host libc. Other
> link dependencies are either native packages provided by OE or they
> come from the host. In this case, sstate for native packages is stored
> within a host specific subdirectory of sstate-cache (e.g.
> sstate-cache/ubuntu-18.04). It should be quite safe to share
> sstate-cache between different hosts (since different hosts should
> each use a different subdirectory of sstate-cache). The downside is
> that because different hosts don't share sstate, build times may be
> slower.
>
> With uninative enabled, native binaries link with uninative libc.
> Other link dependencies should only be native packages provided by OE
> (ie they should NOT come directly from the host). In this case, sstate
> for native packages is stored within a common subdirectory of
> sstate-cache (ie sstate-cache/universal). The assumption is that
> because native packages never link with libs from the host, sstate for
> native packages no longer needs to be host specific.
>
> Unfortunately problems happen if uninative is enabled but a link
> dependency is found from the host. That causes host dependent sstate
> files to pollute sstate-cache/universal, making it unsafe to reuse
> between different hosts. This doesn't happen often, but it does happen
> sometimes, e.g:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D4a99657446402=
8bd5d57b90920d0887d1a81e9e9
>
> It looks like maybe it's happened in your case too. If you want to
> share sstate-cache between different hosts the safest way is to
> disable uninative. If you are happy to test and debug uninative then
> of course give it a try, but be aware that it's not bug free.


