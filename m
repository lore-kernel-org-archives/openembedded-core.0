Received: from mail-qa0-f51.google.com ([209.85.216.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUL5W-0002ZU-Rm
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 20:03:40 +0200
Received: by mail-qa0-f51.google.com with SMTP id g10so400744qah.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 10:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=EJBnkau9TUUzRO754QxT3RloOiiFet/opeKpYuna91g=;
	b=Ur+Li/MK/RbzFpYxCsAIMILLbWrjQeLqBHt9U5rDfRCG2prgN03Sy7JgJjS2n6KS9Q
	mY3KbMdLzjDJ8+V2OlCPgbciW03g+dTa1v5bmC5cAJx/ExuUAOlRtSSucUQkCu5PA10u
	Jk49L7yka50qS3RyteKbJm3vq+s8p//mJdvFR+ZW86zwcLRdM1yVOA1QU6E/aizQUsfh
	0tqv/aAUOy9uyQNQeYbLs/3p0qoLs3qg48LkYHAS4qTbVj9RBuS+dFUcyP4NJiSxzBE9
	ElHiPtz3BXB4vXFeZ6sWdU9U07DckLBOC3ZnzgNfAqpwZt7UBqom0xGqBpZPB/9iWndb
	6E9w==
MIME-Version: 1.0
X-Received: by 10.229.72.72 with SMTP id l8mr572236qcj.98.1366652759336; Mon,
	22 Apr 2013 10:45:59 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Mon, 22 Apr 2013 10:45:59 -0700 (PDT)
In-Reply-To: <CADkTA4ORJX1i2jsnULdTp3ju_j56hYZ+AVtQXh6=pZLwUJbi4w@mail.gmail.com>
References: <CADV-EXGNZgnsD6wXM2AFLANZ43G4hpP2BL0=Kys5JnbAh88Gzg@mail.gmail.com>
	<CADkTA4PVBZEMERZaxqzPyb3WAS-XKxLE6_PCZZSto07-LO4R-g@mail.gmail.com>
	<CADV-EXFMz=FZq5Y25gf-eKi8JZTwXk78LNhZP+DHVFAeQN5y5Q@mail.gmail.com>
	<CADkTA4ORJX1i2jsnULdTp3ju_j56hYZ+AVtQXh6=pZLwUJbi4w@mail.gmail.com>
Date: Mon, 22 Apr 2013 20:45:59 +0300
Message-ID: <CADV-EXGqbfS0GR9v6D-CP7qYmWh649gEpq5WiZYf3dq7iivPkw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Embed initramfs into kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 18:03:40 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2013/4/22 Bruce Ashfield <bruce.ashfield@gmail.com>
>
> On Mon, Apr 22, 2013 at 10:11 AM, Yevhen Kyriukha <kirgene@gmail.com> wro=
te:
> > Thanks!
> >
> > I was trying to build the kernel and I got the following error:
> > Aborted dependency loops search after 10 matches.
> >
> > I copied core-image-minimal-initramfs and changed IMAGE_INSTALL:
> > IMAGE_INSTALL =3D "initramfs-live-boot busybox udev base-passwd".
> > Also I added
> > INITRAMFS_IMAGE =3D "custom-initramfs"
> > to my kernel recipe.
> >
> > As far as I understand initramfs image depends on the kernel that depen=
ds on
> > initramfs image.
>
> Correct. That's something that commonly happens in my experience. You can=
't have
> anything in your dependency chain that causes that circular depend .. whi=
ch is
> what the boot tasks will pull in.
>
> We are working to enhance / fix this in yocto 1.5, but for now, that
> is the restriction.
>
> Have you looked at: classes/image-live.bbclass ? Which is a current user =
of
> core-image-minimal-initramfs and gets around the circular dependency prob=
lem.
>
> Cheers,
>
> Bruce
>
> >
> >
> > Best regards,
> > Yevhen
> >
> >
> > 2013/4/22 Bruce Ashfield <bruce.ashfield@gmail.com>
> >>
> >> On Mon, Apr 22, 2013 at 9:14 AM, Yevhen Kyriukha <kirgene@gmail.com>
> >> wrote:
> >> > Hi!
> >> >
> >> > I have a custom kernel recipe and initramfs image recipe.
> >> > How can I embed initramfs into kernel?
> >> > Is there any example available?
> >>
> >> The support is in oe-core, so checking the yocto docs is a good starti=
ng
> >> point:
> >>
> >> http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html
> >>
> >> And in particular:
> >>
> >> "core-image-minimal-initramfs: A core-image-minimal image that has the
> >> Minimal RAM-based Initial Root Filesystem (initramfs) as part of the
> >> kernel, which allows the system to find the first =93init=94 program m=
ore
> >> efficiently."
> >>
> >> There is also meta-initramfs:
> >>
> >> https://github.com/openembedded/meta-oe/tree/master/meta-initramfs
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >> >
> >> > Best regards,
> >> > Yevhen
> >> >
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e
> >> >
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

I looked at image-live class but it's only image class without any dependen=
cies.
As far as I understand if for example we building busybox than we have
to build kernel first.
Is there any chance to accomplish this task if we'll have 2 kernel
recipes - one for bootstrap (for compilation of initramfs) and the
second with embedded initramfs?

Best regards,
Yevhen


