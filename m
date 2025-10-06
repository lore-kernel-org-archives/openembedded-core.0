Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33716CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 05:10:36 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.26588.1759727433847847111
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 22:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIrCbuxg;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71d60504bf8so45081737b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759727433; x=1760332233; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2WNGgn+JpIL6RnqXkZG66ZPrA/+fETg8lT7K9tINRU=;
        b=TIrCbuxgu3xUEadx9lvSt5Eo0OKgazejF4N4iFXTv3XbMlCkaZF9fV9mHBfTGn64Wv
         MyfBjeLWw/RgqqJ3FzSO4/rWhO0VIxvf7ETDQCm8xrNfQswxaywVoFD567ijlzmt7doZ
         +VgUDYLpv3mn92Ml0XcQk+EvORkyw37dXPvxTH2bYVfKFPrW8R8UFKpXMaT73hyy4X8K
         B1ylw14Hxx3R2hUpnyrGaUQTdE3lpdC40HgtEtod07gpHdXfyfjhrOefr5X9A9OhMWHM
         7wxqlaGmotjyvmx+orOJJIdDnk4WbXL+Jh4yF1N/dHY0riN3x+qMeY+c0xEwL55I5N1k
         DluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759727433; x=1760332233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2WNGgn+JpIL6RnqXkZG66ZPrA/+fETg8lT7K9tINRU=;
        b=jZBsxmQH+ZsEYx69f+6Kc0W+2FkQmp2RgQDeSHUK61ImqPMENX1kQIM4WQ42QiY7v4
         K5A3oap3r/OpBLAJMLbHCf9GOh1SDZVfctw3tZQfGDKr7qtC0PBGqeuVUIUQ0WqPYt9p
         YREGtZXJWOSc4MazwD+iPF2/BZyFZyY7ZE/6DuftlGbGzaEvZch2xz8PTPK/t33LW27t
         TBlvO5ieMKsuOIkByuwx2FWKeFhM6jH8u1ExIfmUGKcsRYu3sb2HGsoDCJE67aC9sK6y
         mGSanKf3CPdM1V0IIelgNAjwxgS6ckTRjA2Ib/qEds+H0LV8lJQlsKG22g2WiqUDJvag
         hkIg==
X-Gm-Message-State: AOJu0YyeNsET4E9G1ecXHMnvo1bCtbCAXEXOCYdTEZQJYgaRlQ2/vH2O
	Nc4IYgj2u6oOZ7E8jV+alGskMDfigUKEZKAk9BYEl/j4MxXALjwUjDyeUlwUnU9/ss905lDGgjN
	+tVLzBPOvBNjzLCH3OX4OPmjCwewdrhft7DOzWrw=
X-Gm-Gg: ASbGncv37EZ9vHgFvI9PLtMmE6pEZKOQzW5JwP5DWwPD9D/ywtbVF9/XdeC5/gD6cF6
	ret7F1HGxfGiftVYX9p0IS1tKQvpWsZ1VWWZEmIok32jDwGRSJ133z+ecUcr+KYx3dPpnhJ8AP4
	tl+IMReFWKYrMXZ6Cmue6bOLy1JzVni8ldsGGAlf4NhnnB/4t9QO0NcdwjhQbSob+Vg/4MVo+ol
	UIoGyy+HMCTuuGPOgEx22pmnAHMAxJ0jvMfgqU0Xa1X2O6PxZy37uAut7Ybwcof9I4BowHiYvqh
	CWAR2syhHf7o9HTqflv3EtSJ4Ix0OB3kqBfHcyFlwkdeRjExKObMHZlNZCvCjJs=
X-Google-Smtp-Source: AGHT+IHW4rontFnYLnYzFk5W3zB9fS5iHr0SW/P0MFWToo/RDe1JmnHt9fPwRwREslEjz70e4cet4VYYaAyYN//8z8o=
X-Received: by 2002:a53:a10f:0:b0:633:a95e:ef08 with SMTP id
 956f58d0204a3-63b9a05f5e8mr8685447d50.5.1759727432713; Sun, 05 Oct 2025
 22:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251004155957.1013969-1-jon.mason@arm.com> <CAMKF1spufmrq2HTgEWiBK7oNC_KLtZsQFrbJKzrGSqN1kDBLWg@mail.gmail.com>
In-Reply-To: <CAMKF1spufmrq2HTgEWiBK7oNC_KLtZsQFrbJKzrGSqN1kDBLWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Oct 2025 22:10:06 -0700
X-Gm-Features: AS18NWAAJ7WfW-WiHvzG56CV_B66SXck-Ro9ye2x4iRZFdKlKEKpLBYjx4lKdNI
Message-ID: <CAMKF1srM=HfTrfjq4Lvv_2Fr2neYQ9Xbfg6xJO313or3vBsOXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gn: remove gcc override
To: jdmason@kudzu.us
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 05:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224458

On Sun, Oct 5, 2025 at 10:06=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sat, Oct 4, 2025 at 9:00=E2=80=AFAM Jon Mason via lists.openembedded.o=
rg
> <jdmason=3Dkudzu.us@lists.openembedded.org> wrote:
> >
> > When compiling gn with clang, the following errors are being seen (with
> > qemuarm64-secureboot machine, possibly others):
> >
> > In file included from /usr/include/c++/12/string:40,
> >                  from ../sources/gn-0+git/src/base/strings/string_numbe=
r_conversions.h:11,
> >                  from ../sources/gn-0+git/src/gn/operators.cc:10:
> > In static member function =E2=80=98static constexpr void std::char_trai=
ts<char>::assign(char_type&, const char_type&)=E2=80=99,
> >     inlined from =E2=80=98static constexpr void std::__cxx11::basic_str=
ing<_CharT, _Traits, _Alloc>::_S_copy(_CharT*, const _CharT*, size_type) [w=
ith _CharT =3D char; _Traits =3D std::char_traits<char>; _Alloc =3D std::al=
locator<char>]=E2=80=99 at /usr/include/c++/12/bits/basic_string.h:421:23,
> >     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, =
_Traits, _Allocator>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::=
_M_replace(size_type, size_type, const _CharT*, size_type) [with _CharT =3D=
 char; _Traits =3D std::char_traits<char>; _Alloc =3D std::allocator<char>]=
=E2=80=99 at /usr/include/c++/12/bits/basic_string.tcc:532:22,
> >     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, =
_Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::assi=
gn(const _CharT*) [with _CharT =3D char; _Traits =3D std::char_traits<char>=
; _Alloc =3D std::allocator<char>]=E2=80=99 at /usr/include/c++/12/bits/bas=
ic_string.h:1647:19,
> >     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, =
_Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::oper=
ator=3D(const _CharT*) [with _CharT =3D char; _Traits =3D std::char_traits<=
char>; _Alloc =3D std::allocator<char>]=E2=80=99 at /usr/include/c++/12/bit=
s/basic_string.h:815:28,
> >     inlined from =E2=80=98Err {anonymous}::MakeOverwriteError(const Bin=
aryOpNode*, const Value&)=E2=80=99 at ../sources/gn-0+git/src/gn/operators.=
cc:202:17:
> > /usr/include/c++/12/bits/char_traits.h:354:16: error: =E2=80=98((const =
std::char_traits<char>::char_type*)((char*)&empty_def + offsetof(std::__cxx=
11::string, std::__cxx11::basic_string<char, std::char_traits<char>, std::a=
llocator<char> >::<unnamed>)))[2]=E2=80=99 may be used uninitialized [-Werr=
or=3Dmaybe-uninitialized]
> >   354 |         __c1 =3D __c2;
> >       |                ^~~~
> > ../sources/gn-0+git/src/gn/operators.cc: In function =E2=80=98Err {anon=
ymous}::MakeOverwriteError(const BinaryOpNode*, const Value&)=E2=80=99:
> > ../sources/gn-0+git/src/gn/operators.cc:198:15: note: =E2=80=98empty_de=
f=E2=80=99 declared here
> >   198 |   std::string empty_def;
> >       |               ^~~~~~~~~
> > In static member function =E2=80=98static constexpr void std::char_trai=
ts<char>::assign(char_type&, const char_type&)=E2=80=99,
> >     inlined from =E2=80=98static constexpr void std::__cxx11::basic_str=
ing<_CharT, _Traits, _Alloc>::_S_copy(_CharT*, const _CharT*, size_type) [w=
ith _CharT =3D char; _Traits =3D std::char_traits<char>; _Alloc =3D std::al=
locator<char>]=E2=80=99 at /usr/include/c++/12/bits/basic_string.h:421:23,
> >     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, =
_Traits, _Allocator>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::=
_M_replace(size_type, size_type, const _CharT*, size_type) [with _CharT =3D=
 char; _Traits =3D std::char_traits<char>; _Alloc =3D std::allocator<char>]=
=E2=80=99 at /usr/include/c++/12/bits/basic_string.tcc:532:22,
> >     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, =
_Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::assi=
gn(const _CharT*) [with _CharT =3D char; _Traits =3D std::char_traits<char>=
; _Alloc =3D std::allocator<char>]=E2=80=99 at /usr/include/c++/12/bits/bas=
ic_string.h:1647:19,
> >     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, =
_Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::oper=
ator=3D(const _CharT*) [with _CharT =3D char; _Traits =3D std::char_traits<=
char>; _Alloc =3D std::allocator<char>]=E2=80=99 at /usr/include/c++/12/bit=
s/basic_string.h:815:28,
> >     inlined from =E2=80=98Err {anonymous}::MakeOverwriteError(const Bin=
aryOpNode*, const Value&)=E2=80=99 at ../sources/gn-0+git/src/gn/operators.=
cc:205:17:
> > /usr/include/c++/12/bits/char_traits.h:354:16: error: =E2=80=98((const =
std::char_traits<char>::char_type*)((char*)&empty_def + offsetof(std::__cxx=
11::string, std::__cxx11::basic_string<char, std::char_traits<char>, std::a=
llocator<char> >::<unnamed>)))[2]=E2=80=99 may be used uninitialized [-Werr=
or=3Dmaybe-uninitialized]
> >   354 |         __c1 =3D __c2;
> >       |                ^~~~
> > ../sources/gn-0+git/src/gn/operators.cc: In function =E2=80=98Err {anon=
ymous}::MakeOverwriteError(const BinaryOpNode*, const Value&)=E2=80=99:
> > ../sources/gn-0+git/src/gn/operators.cc:198:15: note: =E2=80=98empty_de=
f=E2=80=99 declared here
> >   198 |   std::string empty_def;
> >       |               ^~~~~~~~~
> > cc1plus: all warnings being treated as errors
> >
> > Remove the toolchain-gcc override to allow the cflag
> > -Wno-error=3Dmaybe-uninitialized to be applied.
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta/recipes-devtools/gn/gn_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools=
/gn/gn_git.bb
> > index d8896609b193..87ccfe370456 100644
> > --- a/meta/recipes-devtools/gn/gn_git.bb
> > +++ b/meta/recipes-devtools/gn/gn_git.bb
> > @@ -49,4 +49,4 @@ BBCLASSEXTEND =3D "native"
> >
> >  COMPATIBLE_HOST =3D "^(?!riscv32).*"
> >
> > -CFLAGS:append:toolchain-gcc =3D " -Wno-error=3Dmaybe-uninitialized"
> > +CFLAGS +=3D "-Wno-error=3Dmaybe-uninitialized"
>
> This is not a valid option with clang, I can see the error in report
> is seen with gcc ( cc1plus being called there )
> Why is it choosing gcc to compile when you selected clang as your
> default compiler ?
> . I wonder why it is not getting applied when toolchain-gcc OVERRIDE
> is applied ?

So I guess you are seeing it with gc-native ?
in that case your patch should not only add this warning but also
remove it when toolchain is clang
add

CFLAGS:remove:toolchain-clang =3D "-Wno-error=3Dmaybe-uninitialized"

as well. so it works with clang and gcc both
>
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#224432): https://lists.openembedded.org/g/openembed=
ded-core/message/224432
> > Mute This Topic: https://lists.openembedded.org/mt/115588441/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

