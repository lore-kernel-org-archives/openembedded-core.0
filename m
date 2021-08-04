Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web12.11102.1628092498117150910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 08:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.10.12] (unknown [10.0.12.135])
	by kozue.soulik.info (Postfix) with ESMTPSA id B6B87100D85;
	Thu,  5 Aug 2021 00:53:28 +0900 (JST)
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH] systemd-boot: use ld.bfd as efi-ld when gold is being used by default with ld-is-gold
From: "Randy Li" <ayaka@soulik.info>
X-Mailer: iPad Mail (16D57)
In-Reply-To: <CA+chaQd3Mf14rf1Ai-00yNTQjF_83Qzqyc8D47y-UvqmvY4H4Q@mail.gmail.com>
Date: Wed, 4 Aug 2021 23:54:53 +0800
Cc: Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-devel@lists.openembedded.org
Message-Id: <9D74C891-7B8D-42E1-8A01-5F8258C38D4F@soulik.info>
References: <1696468844291952.7588@lists.openembedded.org> <20210803190435.332065-1-Martin.Jansa@gmail.com> <CAJ86T=Ut+dDkAnFUNJec=4b9v0BbSz_u+3PVkmXmGpxuOxXLeA@mail.gmail.com> <CA+chaQd3Mf14rf1Ai-00yNTQjF_83Qzqyc8D47y-UvqmvY4H4Q@mail.gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-F24A4455-9A86-4381-A562-4F9B295F0860
Content-Transfer-Encoding: 7bit

--Apple-Mail-F24A4455-9A86-4381-A562-4F9B295F0860
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I found I sent this email to wrong list, let me CC to it.

> On Aug 4, 2021, at 3:28 AM, Martin Jansa <Martin.Jansa@gmail.com> wrote:
>=20
> Probably as lld isn't supported as well:
> https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9b=
f86a764e31
>=20
You can=E2=80=99t use systemd in Android of course, I decide to ignore tho=
se packages won=E2=80=99t be used for Android vendor partition.
>> On Tue, Aug 3, 2021 at 9:19 PM Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> On Tue, Aug 3, 2021 at 12:04 PM Martin Jansa <Martin.Jansa@gmail.com> w=
rote:
>> >
>> > * since the upgrade to 249.1 in:
>> >   https://git.openembedded.org/openembedded-core/commit/?id=3D323ec44=
5dfe22860cd450c303db5ed8fcb4e791c
>> >   the builds with ld-is-gold are failing with:
>> >
>> >   [17/21] Generating linuxx64.elf.stub with a custom command
>> >   FAILED: src/boot/efi/linuxx64.elf.stub
>> >   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249=
.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld -o s=
rc/boot/efi/linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work/core2-64-=
oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds -s=
hared -Bsymbolic -nostdlib -znocombreloc --build-id=3Dsha1 -L /OE/build/oe-=
core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/=
usr/lib /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249=
.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/string-util-fun=
damental.c.o src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/boot/efi/m=
easure.c.o src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/boot/efi/ut=
il.c.o src/boot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/efi/stub.c.o=
 -lefi -lgnuefi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-=
boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0/libgcc.a
>> >   /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249=
.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld: int=
ernal error in segment_precedes, at ../../gold/layout.cc:3721
>> >   [18/21] Generating boot.c.o with a custom command
>> >   ninja: build stopped: subcommand failed.
>> >   WARNING: exit code 1 from a shell command.
>> >
>> >   as reported in:
>> >   https://lists.openembedded.org/g/openembedded-core/message/154246
>> >
>> >   work around this by using ld.bfd when ld-is-gold is in DISTRO_FEATU=
RES
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta/recipes-core/systemd/systemd-boot_249.1.bb | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/systemd/systemd-boot_249.1.bb b/meta/r=
ecipes-core/systemd/systemd-boot_249.1.bb
>> > index d767b5bf8d..18f4fe55ce 100644
>> > --- a/meta/recipes-core/systemd/systemd-boot_249.1.bb
>> > +++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
>> > @@ -19,11 +19,13 @@ objcopy =3D ${@meson_array('OBJCOPY', d)}
>> >  EOF
>> >  }
>> >
>> > +EFI_LD =3D "${@d.getVar('LD').split()[0]}"
>> > +
>> >  EXTRA_OEMESON +=3D "-Defi=3Dtrue \
>> >                    -Dgnu-efi=3Dtrue \
>> >                    -Defi-includedir=3D${STAGING_INCDIR}/efi \
>> >                    -Defi-libdir=3D${STAGING_LIBDIR} \
>> > -                  -Defi-ld=3D${@ d.getVar('LD').split()[0]} \
>> > +                  -Defi-ld=3D${@bb.utils.contains('DISTRO_FEATURES',=
 'ld-is-gold', 'ld.bfd', '${EFI_LD}', d)} \
>>=20
>> Could this just be set to ld.bfd in all cases?
https://github.com/android/ndk/issues/1288
Android has dropped the support for gold linker and it has been marked as =
deprecated for a long time.
I just heard that Gstreamer doesn=E2=80=99t support lld linker but I prefe=
r to solve it in Gstreamer.
>=20
>=20
>=20

--Apple-Mail-F24A4455-9A86-4381-A562-4F9B295F0860
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body dir=3D"auto">I found I sent this email to wrong lis=
t, let me CC to it.<br><div dir=3D"ltr"><br>On Aug 4, 2021, at 3:28 AM, Mar=
tin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.=
com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div dir=3D"ltr">=
<div dir=3D"ltr">Probably as lld isn't supported as well:<div><a href=3D"ht=
tps://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf86a7=
64e31">https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e=
6c9bf86a764e31</a><br></div></div><br></div></blockquote>You can=E2=80=99t =
use systemd in Android of course, I decide to ignore those packages won=E2=
=80=99t be used for Android vendor partition.<br><blockquote type=3D"cite"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Aug 3, 2021 at 9:19 PM Andre McCurdy &lt;<a href=3D"mailto:=
armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, Aug 3, 2021 at 12:04 PM Mar=
tin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">M=
artin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * since the upgrade to 249.1 in:<br>
&gt;&nbsp; &nbsp;<a href=3D"https://git.openembedded.org/openembedded-core=
/commit/?id=3D323ec445dfe22860cd450c303db5ed8fcb4e791c" rel=3D"noreferrer" =
target=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=
=
=3D323ec445dfe22860cd450c303db5ed8fcb4e791c</a><br>
&gt;&nbsp; &nbsp;the builds with ld-is-gold are failing with:<br>
&gt;<br>
&gt;&nbsp; &nbsp;[17/21] Generating linuxx64.elf.stub with a custom comman=
d<br>
&gt;&nbsp; &nbsp;FAILED: src/boot/efi/linuxx64.elf.stub<br>
&gt;&nbsp; &nbsp;/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/system=
d-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-lin=
ux-ld -o src/boot/efi/linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work=
/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_=
efi.lds -shared -Bsymbolic -nostdlib -znocombreloc --build-id=3Dsha1 -L /OE=
/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recip=
e-sysroot/usr/lib /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/system=
d-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/strin=
g-util-fundamental.c.o src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/=
boot/efi/measure.c.o src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/b=
oot/efi/util.c.o src/boot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/ef=
i/stub.c.o -lefi -lgnuefi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.=
0/libgcc.a<br>
&gt;&nbsp; &nbsp;/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/system=
d-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-lin=
ux-ld: internal error in segment_precedes, at ../../gold/<a href=3D"http://=
layout.cc:3721">layout.cc:3721</a><br>
&gt;&nbsp; &nbsp;[18/21] Generating boot.c.o with a custom command<br>
&gt;&nbsp; &nbsp;ninja: build stopped: subcommand failed.<br>
&gt;&nbsp; &nbsp;WARNING: exit code 1 from a shell command.<br>
&gt;<br>
&gt;&nbsp; &nbsp;as reported in:<br>
&gt;&nbsp; &nbsp;<a href=3D"https://lists.openembedded.org/g/openembedded-=
core/message/154246" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/message/154246</a><br>
&gt;<br>
&gt;&nbsp; &nbsp;work around this by using ld.bfd when ld-is-gold is in DI=
STRO_FEATURES<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a> | 4 +++-=
<br>
&gt;&nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot=
_249.1.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a> b=
/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
&gt; index d767b5bf8d..18f4fe55ce 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
&gt; @@ -19,11 +19,13 @@ objcopy =3D ${@meson_array('OBJCOPY', d)}<br>
&gt;&nbsp; EOF<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; +EFI_LD =3D "${@d.getVar('LD').split()[0]}"<br>
&gt; +<br>
&gt;&nbsp; EXTRA_OEMESON +=3D "-Defi=3Dtrue \<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
-Dgnu-efi=3Dtrue \<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
-Defi-includedir=3D${STAGING_INCDIR}/efi \<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
-Defi-libdir=3D${STAGING_LIBDIR} \<br>
&gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -Defi=
-ld=3D${@ d.getVar('LD').split()[0]} \<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -<a h=
ref=3D"mailto:Defi-ld=3D${@bb.utils.contains">Defi-ld=3D${@bb.utils.contain=
s</a>('DISTRO_FEATURES', 'ld-is-gold', 'ld.bfd', '${EFI_LD}', d)} \<br>
<br>
Could this just be set to ld.bfd in all cases?<br>
</blockquote></div>
</div></blockquote><a href=3D"https://github.com/android/ndk/issues/1288">=
https://github.com/android/ndk/issues/1288</a><div>Android has dropped the =
support for gold linker and it has been marked as deprecated for a long tim=
e.</div><div>I just heard that Gstreamer doesn=E2=80=99t support lld linker=
 but I prefer to solve it in Gstreamer.<br><blockquote type=3D"cite"><div d=
ir=3D"ltr"><span></span><br><span></span><br><span></span><br></div></block=
quote></div></body></html>

--Apple-Mail-F24A4455-9A86-4381-A562-4F9B295F0860--
