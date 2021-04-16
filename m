Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.2958.1618607834253631018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 14:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NON3th3y;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id r128so19837532lff.4
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qnKW3T0BMBhNEI5/z4q/4bt/l/PRiBoZBIPmvc51rEs=;
        b=NON3th3yZ9kW2VQwqUakmkJlcFnEQUW8JYO5CPJQ1rAJU464qTzh91Lch4Tvc+vtuZ
         byggLIVTaNm1X86oPECXSU5Qd7LjxE/ZjE7jI8HuhBFYci5HYVA17EPP+7hbU8qVyQep
         cpYUjjCVvlZFDRkDYdVTUajdGzDUQFJURWeuv6StJherXg+xkIavzThakrSvEmFzg2dd
         H/oF5xjCqyDdl3CsAFGrGnGa1bvW5X8QbtIM/8r0GMGEhmkqoiFrEf4SYcjiePik58Ki
         lfVgKxsSRQbXUzN1Jq1v9gY2hxkwTACPyz45pl6l+XSVIjk7LwAoV++0rUufWR9C0eqV
         IbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qnKW3T0BMBhNEI5/z4q/4bt/l/PRiBoZBIPmvc51rEs=;
        b=YbLAyrDtOoUwyPAs68Y0H4j4g6l5aK/+fsiyC5EL7Hw2WHMQWRrIkupHGcMl+oNCHB
         ZDcRwPHsuQYU0kHZQG0o1l5MuHFeAaE1ScApthNBa9lgp3hG+LxXSCM8zDd+0ATVd+f1
         JXSYlHJZocxhC3hQCcTbxQvqqbuTbWrRssEqvJng4sqnJN52Z0TDVouAMhiHVzjGwKUG
         e6swE89Ynym0jDbB4KgAC2R/5z6NMUktDc90jCJUh4Fsk7NhuZ9JxEK0cuXVl35ZlU0w
         SCgZOwRgACwTpMwJ+W4R8SvYu6ntjYxNeWBaRf1QQnVxC1EYq1FgsAzMvn8MN+h1xfhn
         Kqvw==
X-Gm-Message-State: AOAM531FJqh+y8ry7wIUzqhbFmbGdBoQfNO910nrJRg+bsSq3LpcbPWr
	M8w0RF32TbOoSJWclz0Fbbj8JQOYLBNva9YOhBA=
X-Google-Smtp-Source: ABdhPJyMB7qGNOkLUtwOos0sVQAw1D0UOzesh227gvN6tC900PV/0GIu1Hv1BE2uoBmvUbio00+OcrTkWJTOW6thass=
X-Received: by 2002:a05:6512:3e20:: with SMTP id i32mr4284578lfv.257.1618607832132;
 Fri, 16 Apr 2021 14:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210416053729.1021506-1-robert.joslyn@redrectangle.org>
 <20210416053729.1021506-2-robert.joslyn@redrectangle.org> <CAJ86T=VARprmYY1mPKa7uG0pNpzpdJXBXu_-PYtBPvDRaZqohQ@mail.gmail.com>
 <BF8F342D-3299-4781-8468-6C987F1703C0@redrectangle.org>
In-Reply-To: <BF8F342D-3299-4781-8468-6C987F1703C0@redrectangle.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 16 Apr 2021 14:17:00 -0700
Message-ID: <CAJ86T=VL4R8k0NPOgqLuX=Et599s_Dy4ZDGfXm-Wusdk3PQ8Hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] btrfs-tools: Add PACKAGECONFIG options
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 7:28 AM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
> > On Apr 16, 2021, at 12:17 AM, Andre McCurdy <armccurdy@gmail.com> wrote=
:
> > On Thu, Apr 15, 2021 at 10:38 PM Robert Joslyn
> > <robert.joslyn@redrectangle.org> wrote:
> >>
> >> Add options to make it easier to control which features are enabled. A=
ll
> >> of these default to enabled by upstream, so keep them enabled to
> >> maintain previous behavior.
> >>
> >> The convert option also supports reiserfs, but no recipes exist in the
> >> layer index. Limit the option to ext filesystems until someone cares
> >> enough to make reiserfs recipes.
> >>
> >> Remove acl and attr from DEPENDS, as they do not apper to be needed. A=
dd
> >> zlib since it is required.
> >>
> >> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> >> ---
> >> .../btrfs-tools/btrfs-tools_5.11.1.bb         | 26 ++++++++++++++++---
> >> 1 file changed, 23 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb b=
/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> >> index 2ab476a88e..b875ea1aa1 100644
> >> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> >> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> >> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
> >>     file://libbtrfsutil/COPYING.LESSER;md5=3D3000208d539ec061b899bce1d=
9ce9404 \
> >> "
> >> SECTION =3D "base"
> >> -DEPENDS =3D "util-linux attr e2fsprogs lzo acl"
> >> +DEPENDS =3D "lzo util-linux zlib"
> >> DEPENDS_append_class-target =3D " udev"
> >> RDEPENDS_${PN} =3D "libgcc"
> >>
> >> @@ -22,17 +22,37 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/ke=
rnel/git/kdave/btrfs-progs.git \
> >>            file://0001-Add-a-possibility-to-specify-where-python-modul=
es-ar.patch \
> >>            "
> >>
> >> -PACKAGECONFIG ??=3D "python"
> >> +PACKAGECONFIG ??=3D " \
> >> +    ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
> >
> > The largefile distro feature is for historical reference only. Recipes
> > should always enable largefile support regardless of the distro
> > feature (which will eventually be removed).
>
> Is it worth making it a PACKAGECONFIG at all, or is it preferred to just =
set =E2=80=94enable-largefile in EXTRA_OECONF? The upstream configure scrip=
t does enable this by default so it=E2=80=99s not strictly needed at all ei=
ther, but I usually prefer to be more explicit with configure options (as y=
ou can probably tell with this patch!).

Adding =E2=80=94enable-largefile to EXTRA_OECONF would be fine.

In general the goal of PACKAGECONFIG is not to expose every possible
configure option, but only the ones which we want to encourage people
to experiment with or use to control high level functionality. An
option to break support for large files doesn't fit into that
category.

> >> +    backtrace \
> >> +    programs \
> >> +    shared \
> >> +    convert \
> >> +    python \
> >> +    crypto-builtin \
> >
> > This is not conventional formatting for a list of PACKAGECONFIG
> > options. Maybe have a look at some other recipes in oe-core to get a
> > feel for the typical style.
>
> I=E2=80=99m not sure what you mean. Would you prefer them on one line rat=
her than split? In a specific order? There seems to be a lot of different s=
tyles in use, so I tried to follow the OE style guide, which suggests split=
ting lists like this, but maybe I=E2=80=99m misunderstanding.

My preference doesn't matter much :-) I was suggesting that you look
in oe-core to get a feel for the typical style. Note that the OE style
guide mostly predates PACKAGECONFIG and hasn't been updated to cover
it in any detail.

> >> +"
> >> +PACKAGECONFIG[largefile] =3D "--enable-largefile,--disable-largefile"
> >> +PACKAGECONFIG[backtrace] =3D "--enable-backtrace,--disable-backtrace"
> >> PACKAGECONFIG[manpages] =3D "--enable-documentation, --disable-documen=
tation, asciidoc-native xmlto-native"
> >> +PACKAGECONFIG[programs] =3D "--enable-programs,--disable-programs"
> >> +PACKAGECONFIG[shared] =3D "--enable-shared,--disable-shared"
> >> +PACKAGECONFIG[static] =3D "--enable-static,--disable-static"
> >
> > The choice to build shared and/or static libs is not something which
> > is typically controlled by PACKAGECONFIG options.
>
> Some recipes do use PACKAGECONFIG, such as ffmpeg, but in grepping the re=
po it seems more common to use EXTRA_OECONF. Is there a reason not to use P=
ACKAGECONFIG here? Just that building the static libraries is uncommon? I d=
on=E2=80=99t mind changing it, just curious.

See the comment above about the goal of PACKAGECONFIG not being to
expose every possible option. However, there are no well defined rules
about it (and in general in OE, what rules there are are not
consistently enforced) so patches like the one to ffmpeg which
converted a lot of inappropriate configure options to PACKAGECONFIG
options do sometimes get merged.

Specifically for shared and static libs, shared libs are generally
enabled by default but if a particular component didn't do that then
the normal approach would be to add a configure option to enable them
to EXTRA_OECONF. Static libs are generally unused but harmless, so
don't justify a PACKAGECONFIG option to control them. The only real
downside of enabling static libs is the wasted build time. If that
concerns you then you can try including
conf/distro/include/no-static-libs.inc in your distro config file.

> >> +PACKAGECONFIG[convert] =3D "--enable-convert --with-convert=3Dext2,--=
disable-convert --without-convert,e2fsprogs"
> >> PACKAGECONFIG[python] =3D "--enable-python,--disable-python,python3-se=
tuptools-native"
> >> PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd"
> >>
> >> +# Pick only one crypto provider
> >> +PACKAGECONFIG[crypto-builtin] =3D "--with-crypto=3Dbuiltin"
> >> +PACKAGECONFIG[crypto-libgcrypt] =3D "--with-crypto=3Dlibgcrypt,,libgc=
rypt"
> >> +PACKAGECONFIG[crypto-libsodium] =3D "--with-crypto=3Dlibsodium,,libso=
dium"
> >> +PACKAGECONFIG[crypto-libkcapi] =3D "--with-crypto=3Dlibkcapi,,libkcap=
i"
> >> +
> >> inherit autotools-brokensep pkgconfig manpages
> >> inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-ba=
se', '', d)}
> >>
> >> CLEANBROKEN =3D "1"
> >>
> >> -EXTRA_OECONF_append_libc-musl =3D " --disable-backtrace "
> >> +PACKAGECONFIG_remove_libc-musl =3D "backtrace"
> >
> > Use of _remove in core recipes is discouraged.
>
> I wasn=E2=80=99t sure the best way to handle this. I can put it back the =
way it was, where the configure script enables the feature by default and i=
t=E2=80=99s disabled only for musl. I could keep the packagconfig and appen=
d only for glibc:
> PACKAGECONFIG_append_libc-glibc =3D =E2=80=9C backtrace=E2=80=9D
> I could also disable the feature by default. I do disable this in my prod=
uct layer, but I don=E2=80=99t know if that is a good default.

I don't think backtrace justifies a PACKAGECONFIG option, especially
if the default value for the option is problematic (as it seems to
be). The original approach of appending --disable-backtrace to
EXTRA_OECONF for musl builds looks fine.
