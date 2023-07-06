Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED46EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 09:54:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.18522.1688637265422576192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 02:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OWx0QqDq;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso633208e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688637263; x=1691229263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcNxzsuYxg1tp3KHHarN0KSsngHDtoIFuV3wNsLps7k=;
        b=OWx0QqDqYIcJ2OI8txojulndV1EcIW9IUjwKBFkiBEY2cJ7rJd8Uscva7k3N0APGz9
         QaSuRkgMtL7F03MVixRvAHGtRJYe/hfNffR2RfostP2JuoA9j0MQmTuqvAojlM972D3e
         9wBTIMre+TX6fuH0+eRtwsH0mgdgjRPkxdL5vE29SZldVNh8p6SrRwZ3DrE48RM9XkrS
         ha/XaVR7904QwMrswLs7vtj5bKjyZzd7I0eiFF67ivsDG95dzLq7EEvWwdTCi8QjHdTp
         KWo3J78FlUD/dsHWg1hAlWpVO8XujNhsJmt6onFlcQO35yE4qXI1KWA3av3A4uo1HUYx
         Kzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688637263; x=1691229263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcNxzsuYxg1tp3KHHarN0KSsngHDtoIFuV3wNsLps7k=;
        b=P0eRYiCXh5SnX7oR6WWT7MSa6XEGY7EJqp44gQk+g1A9ZUylmz4X1AsxuPpu1Y4QRO
         cWRs0PfMWkj8TYur/u4ix3Zox7y6eWe1yl9X66gPfwp3tILzIf2qPH5TDk8WMD+itPlt
         ZLVbH911JwwaZvpnIRf9SXSGMTYy9GxHpjzq97FlcnIMMlgUPvnKl6pJX1hjGCsnmv/C
         wD9TGoDXORmesA90ZRYv2YiVKAGOys9BvvpuZHe5Nnk1K9kYeqspSeXGqcQvjmRK7Icj
         s8W0lHRfxEJdAGjt8SheMV8PvBSRWGvafruyaRNHSdG/8UpmIvRWcpoFE4YbaHj5xo67
         aJ6w==
X-Gm-Message-State: ABy/qLZHs9JCEM6xxfbz5EI/15e90JZNuaSRDdaKNygtxK/cHGoLNWrH
	IKk+BcjMJi//BtHr/D21mv1sldmZEjqjHLYBOIw=
X-Google-Smtp-Source: APBJJlESZYk8H0NQgpmkFi4AI3VInRSrt75ZfJuuN6Xx3QbYRVfN2BEe1RkmDN1LrrFl2ZbT9YOWkceCcBIzrFkQajA=
X-Received: by 2002:a05:6512:694:b0:4f8:5e49:c610 with SMTP id
 t20-20020a056512069400b004f85e49c610mr1304902lfe.35.1688637263248; Thu, 06
 Jul 2023 02:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
 <1687850250-20040-15-git-send-email-wangmy@fujitsu.com> <833c9684091b2d7ec5326e00a6f76a7aa2c4baf2.camel@linuxfoundation.org>
 <OSBPR01MB184540732F25FAE632D72885DC24A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB184540732F25FAE632D72885DC24A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Jul 2023 11:54:11 +0200
Message-ID: <CANNYZj87q8Xxo+mzC-BWtr_SHP-97ZmBEc1nFcXTcWX-8yOhOw@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH] gettext: upgrade 0.21.1 -> 0.22
To: wangmy <wangmy@fujitsu.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 09:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183923

I have reworked the gettext-minimal recipe to get the needed files
directly from upstream tarball:
https://git.yoctoproject.org/poky-contrib/commit/meta/recipes-core/gettext/=
gettext-minimal-native_0.21.1.bb?h=3Dakanavin/package-version-updates&id=3D=
1f9b5e0b158f18d2e66337b1e902977fcd072d5a

You are welcome to cherry-pick this, and verify that it still does the
right thing with the updated gettext.

Alex

On Wed, 28 Jun 2023 at 10:53, wangmy <wangmy@fujitsu.com> wrote:
>
> Sorry, I didn't notice that the files in the minimal directory need to be=
 updated based on the source code.
> Please ignore this patch and I will investigate before considering whethe=
r to resubmit it.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: Tuesday, June 27, 2023 10:25 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [PATCH] [OE-core] [PATCH] gettext: upgrade 0.21.1 -> 0.22
> >
> > On Tue, 2023-06-27 at 15:17 +0800, wangmy wrote:
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Changelog:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > * PO file format:
> > >   - When a #: line contains references to file names that contain spa=
ces,
> > >     these file names are surrounded by Unicode characters U+2068 and
> > U+2069.
> > >     This makes it possible to parse such references correctly.
> > >
> > > * Improvements for maintainers:
> > >   - The AM_GNU_GETTEXT macro now defines two variables localedir_c an=
d
> > >     localedir_c_make, that can be used in C code or in Makefiles,
> > >     respectively, for representing the value of the --localedir confi=
gure
> > >     option.
> > >
> > > * Programming languages support:
> > >   - C, C++:
> > >     o xgettext now supports gettext-like functions that take wide str=
ings
> > >       (of type 'const wchar_t *', 'const char16_t *', or 'const char3=
2_t *')
> > >       as arguments.
> > >     o xgettext now recognizes numbers with digit separators, as defin=
ed by
> > >       ISO C 23, as tokens.
> > >     o xgettext and msgfmt now recognize the format string directive %=
b
> > >       (for binary integer output, as defined by ISO C 23) in format s=
trings.
> > >     o xgettext and msgfmt now recognize the argument size specifiers
> > >       w8, w16, w32, w64, wf8, wf16, wf32, wf64 (as defined by ISO C 2=
3)
> > >       in format strings.
> > >     o xgettext and msgfmt now recognize C++ format strings, as define=
d by
> > >       ISO C++ 20.  They are marked as 'c++-format' in POT and PO file=
s.
> > >       A new example has been added, 'hello-c++20', that illustrates h=
ow
> > >       to use these format strings with gettext.
> > >   - Java:
> > >     o The build system and tools now also support Java versions newer=
 than
> > >       Java 11. This is known to work up to Java 20, at least. On the =
other
> > >       hand, support for old versions of Java (Java 1.5 and GCJ) has b=
een
> > >       dropped.
> > >   - Tcl: xgettext now supports the \x, \u, and \U escapes as defined =
in
> > >     Tcl 8.6.
> > >
> > > * Portability:
> > >   - On systems with musl libc, the *gettext() functions in libc now w=
ork
> > >     with MO files generated from PO files with an encoding other than
> > UTF-8.
> > >     To this effect, the msgfmt program now converts the messages to U=
TF-8
> > >     encoding before storing them in a MO file.  You can prevent this =
by
> > >     using the msgfmt --no-convert option.
> > >   - On systems with musl libc, the *gettext() functions in libc now w=
ork
> > >     with MO files generated from PO files with ISO C 99 <inttypes.h> =
format
> > >     string directive macros.  To this effect, the msgfmt program
> > pre-expands
> > >     strings with such macros.  You can prevent this by using the msgf=
mt
> > >     --no-redundancy option.
> > >
> > > * xgettext:
> > >   - The xgettext option '--sorted-output' is now deprecated.
> > >   - xgettext input files of type PO that are not all ASCII and not UT=
F-8
> > >     encoded are now handled correctly.
> > >
> > > * The base Unicode standard is now updated to 15.0.0.
> > >
> > > * Emacs PO mode:
> > >   Fix an incompatibility with Emacs version 29 or newer.
> > >
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../0001-init-env.in-do-not-add-C-CXX-parameters.patch          | 0
> > >  .../0001-tests-autopoint-3-unset-MAKEFLAGS.patch                | 0
> > >  .../gettext/{gettext-0.21.1 =3D> gettext-0.22}/parallel.patch     | =
0
> > >  .../gettext/{gettext-0.21.1 =3D> gettext-0.22}/run-ptest          | =
0
> > >  .../{gettext-0.21.1 =3D> gettext-0.22}/serial-tests-config.patch  | =
0
> > >  .../{gettext-0.21.1 =3D> gettext-0.22}/use-pkgconfig.patch        | =
0
> > >  .../{gettext-minimal-0.21.1 =3D> gettext-minimal-0.22}/COPYING    | =
0
> > >  .../Makefile.in.in                                              |
> > 0
> > >  .../aclocal/gettext.m4                                          |
> > 0
> > >  .../aclocal/host-cpu-c-abi.m4                                   | 0
> > >  .../aclocal/iconv.m4                                            |
> > 0
> > >  .../aclocal/intlmacosx.m4                                       |
> > 0
> > >  .../aclocal/lib-ld.m4                                           | 0
> > >  .../aclocal/lib-link.m4                                         | 0
> > >  .../aclocal/lib-prefix.m4                                       | 0
> > >  .../aclocal/nls.m4                                              |
> > 0
> > >  .../aclocal/po.m4
> > | 0
> > >  .../aclocal/progtest.m4                                         |
> > 0
> > >  .../config.rpath                                                |
> > 0
> > >  .../remove-potcdate.sin                                         |
> > 0
> > >  ...-minimal-native_0.21.1.bb =3D> gettext-minimal-native_0.22.bb} | =
0
> > > .../recipes-core/gettext/{gettext_0.21.1.bb =3D> gettext_0.22.bb} | 2=
 +-
> > >  22 files changed, 1 insertion(+), 1 deletion(-)  rename
> > > meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> > > gettext-0.22}/0001-init-env.in-do-not-add-C-CXX-parameters.patch
> > > (100%)  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> > > gettext-0.22}/0001-tests-autopoint-3-unset-MAKEFLAGS.patch (100%)
> > > rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> > > gettext-0.22}/parallel.patch (100%)  rename
> > > meta/recipes-core/gettext/{gettext-0.21.1 =3D> gettext-0.22}/run-ptes=
t
> > > (100%)  rename meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> > > gettext-0.22}/serial-tests-config.patch (100%)  rename
> > > meta/recipes-core/gettext/{gettext-0.21.1 =3D>
> > > gettext-0.22}/use-pkgconfig.patch (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/COPYING (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/Makefile.in.in (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/gettext.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/host-cpu-c-abi.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/iconv.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/intlmacosx.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/lib-ld.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/lib-link.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/lib-prefix.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/nls.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/po.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/aclocal/progtest.m4 (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/config.rpath (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-0.21.1 =3D>
> > > gettext-minimal-0.22}/remove-potcdate.sin (100%)  rename
> > > meta/recipes-core/gettext/{gettext-minimal-native_0.21.1.bb =3D>
> > > gettext-minimal-native_0.22.bb} (100%)  rename
> > > meta/recipes-core/gettext/{gettext_0.21.1.bb =3D> gettext_0.22.bb} (9=
9%)
> >
> > When you upgraded this recipe did you check if there were changes to an=
y of
> > the files in gettext-minimal in the new version? I'm a little surprised=
 none of the
> > files change at all...
> >
> > Cheers,
> >
> > Richard
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183548): https://lists.openembedded.org/g/openembedde=
d-core/message/183548
> Mute This Topic: https://lists.openembedded.org/mt/99805170/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

