Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 894267E3E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 11:06:15 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id n134so4059573lfn.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 04:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=czoOpK7hx6vRpSRn8IJ8BPATv8tslJjnGi8mTKUjzXU=;
	b=dKgoPD4Kfo5xAeR10YsTrXMRKVjmcecr3Ctoe7qCMGtHF3hoa+D8wm0FCzjPHR+3fQ
	FaMky+tFW+FSQq01eu9hN6AUiX4GIVHD1Joaic5moEJHoK+Br1nMBKk9FR60Z6ZUNskg
	BM4Vf068ecyB8NLewaCIXLAhAGUGTPh/X8SJE3AsYYbw4F5qzCUsD8zEuil1AHnLvnKn
	hx9MrUHGHIb6lu7bmvsak7HgIi9EUX45kGEVeyqZqHhhdQqstTSIUHphRrDYz7V3xS9G
	0plsKtXjWDiNgtNEWCYm+LHmp8rAMZvVX5iGd9rtzLfxDRAyFebP6aHCXneHQrMQf+TG
	MC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=czoOpK7hx6vRpSRn8IJ8BPATv8tslJjnGi8mTKUjzXU=;
	b=NZaCSHX+2sscYYgADTC7+dtWnOR5I5aU9oGYqSufwa/OZ7BH+lCygjwom3bX0PE6Lh
	omf7LGuyW2XJh1h3x4BXk6Gw+CZFU27B3WLk4XwasYrDbSN9KYa3gno/17reyOXRxxVw
	eVEmlwI4MyOrcTay0CRUO3B1b9bCqb3KemKfi5Vec7bDnXdYKr33mo8sjR3HO6h4Nfzf
	zVos64WO/iodozGVt5EK1AknkrA8x0tcsNiV6vXT70cjn1NU2Ud5kinpvZYo2phkaQB2
	dllAgetV/ehH/mHiPI4FAMKEJMn78iS47pT4Mwo3FteXGWa7m3vSw+DbfZjLNWHpi8WO
	z08A==
X-Gm-Message-State: APjAAAUQWtUJdf5P2eyYo2ivMiGku9HM/s1aILhJeElHMauBJ2xyX/5r
	aUok0VrVNwpG8o6kxsVMtm90w/dd9tc5xiEbpHhlkXG0EuE=
X-Google-Smtp-Source: APXvYqy1TGw1vxu/JNXYw6D2RnafZ9kcaA+1XrWlSj2i87lfYdT3ZyRA3bJFnsVstq3RTPiWZv1y3FsSXU9YqLYy2wM=
X-Received: by 2002:ac2:5482:: with SMTP id t2mr3232715lfk.14.1558609575878;
	Thu, 23 May 2019 04:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190523074703.17145-1-nick83ola@gmail.com>
	<7193bf9fbc6d557744214a3dc82ded086f441f0d.camel@andred.net>
In-Reply-To: <7193bf9fbc6d557744214a3dc82ded086f441f0d.camel@andred.net>
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 23 May 2019 12:06:04 +0100
Message-ID: <CABPh3UNdOXZraHAurMyH+x3YSJbnQJif6Ff_oHTU2W+8t=0hDg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: fix segfault with musl >2.21
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2019 11:06:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

in glibc freeaddrinfo is checking for null

https://github.molgen.mpg.de/git-mirror/glibc/blob/20003c49884422da7ffbc459=
cdeee768a6fee07b/sysdeps/posix/getaddrinfo.c#L2663-L2674

void
freeaddrinfo (struct addrinfo *ai)
{
    struct addrinfo *p;

    while (ai !=3D NULL)
    {
        p =3D ai;
        ai =3D ai->ai_next;
        free (p->ai_canonname);
        free (p);
    }
}

that is why I put it into the musl specific patches.
But ok I will repost it putting it in the generic SRC_URI.

regarding the 2.21 -> yes is a typo.

Thanks
Nicola Lunghi


On Thu, 23 May 2019 at 10:18, Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> On Thu, 2019-05-23 at 08:47 +0100, Nicola Lunghi wrote:
> > musl > 2.21 changed the implementation of the freeaddrinfo() function
> > not allowing anymore to pass null pointers to it.
> > This was causing a segmentation fault in connman.
> > ---
> >  ...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 +++++++++++++++++++
> >  .../connman/connman_1.37.bb                   |  5 ++-
> >  2 files changed, 38 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-connectivity/connman/connman/0003-gweb=
-fix-segfault-with-musl-v1.1.21.patch
> >
> > diff --git a/meta/recipes-connectivity/connman/connman/0003-gweb-fix-se=
gfault-with-musl-v1.1.21.patch b/meta/recipes-
> > connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.p=
atch
> > new file mode 100644
> > index 0000000000..43b43bc9f8
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-=
with-musl-v1.1.21.patch
> > @@ -0,0 +1,34 @@
> > +From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001
> > +From: Nicola Lunghi <nick83ola@gmail.com>
> > +Date: Thu, 23 May 2019 07:55:25 +0100
> > +Subject: [PATCH] gweb: fix segfault with musl v1.1.21
> > +
> > +In musl > 1.1.21 freeaddrinfo() implementation changed and
> > +was causing a segmentation fault on recent Yocto using musl.
> > +
> > +See this commit:
> > +
> > + https://git.musl-libc.org/cgit/musl/commit/src/network/freeaddrinfo.c=
?id=3Dd1395c43c019aec6b855cf3c656bf47c8a719e7f
> > +
> > +Upstream-Status: Submitted
> > +---
> > + gweb/gweb.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gweb/gweb.c b/gweb/gweb.c
> > +index 393afe0a..12fcb1d8 100644
> > +--- a/gweb/gweb.c
> > ++++ b/gweb/gweb.c
> > +@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)
> > +     addr =3D NULL;
> > +
> > +     result =3D getaddrinfo(host, NULL, &hints, &addr);
> > +-    freeaddrinfo(addr);
> > ++    if(!result)
> > ++            freeaddrinfo(addr);
> > +
> > +     return result =3D=3D 0;
> > + }
> > +--
> > +2.19.1
> > +
> > diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/r=
ecipes-connectivity/connman/connman_1.37.bb
> > index 2cf904cd85..f52b21cae3 100644
> > --- a/meta/recipes-connectivity/connman/connman_1.37.bb
> > +++ b/meta/recipes-connectivity/connman/connman_1.37.bb
> > @@ -7,7 +7,10 @@ SRC_URI  =3D "${KERNELORG_MIRROR}/linux/network/${BPN}=
/${BP}.tar.xz \
> >              file://no-version-scripts.patch \
> >  "
> >
> > -SRC_URI_append_libc-musl =3D " file://0002-resolve-musl-does-not-imple=
ment-res_ninit.patch"
> > +SRC_URI_append_libc-musl =3D " \
> > +            file://0002-resolve-musl-does-not-implement-res_ninit.patc=
h \
> > +            file://0003-gweb-fix-segfault-with-musl-v1.1.21.patch \
> > +"
>
> This fix is not musl specific.
>
> Cheers,
> Andre'
>
> >
> >  SRC_URI[md5sum] =3D "75012084f14fb63a84b116e66c6e94fb"
> >  SRC_URI[sha256sum] =3D "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d=
185fab3a0c71946e16"
> > --
> > 2.19.1
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

