Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6E2CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 05:06:46 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.26435.1759727202930608474
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 22:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KXMcNUKB;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d603b60cbso46444667b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759727202; x=1760332002; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8B15nWoRBAiQJkoGuuiQMW9AxTFZ1IGAC77IMBgMFg=;
        b=KXMcNUKBjuWvU5rghUvUlWv0c6LCIKjTNMVhIjkTWi9SkuDWSCGoZl+6HNy9W3xL3Z
         sI+8goOSqx3PhF76HlauLO3mkcR3MG9vGqP7r/CScys8kFQtiMwUVmMFfKD3bzn7G9Z2
         W+d7eFD2XKrUUZom5RdHaUNmrI7dmi5wlx0/Wh7yjntx16VCSbd4k2+9vTV7ukavsMux
         O9p1OgU8rdIRcitCfAVQN4iwexc7pFkUpV/fFeaPGCcHkJNYP1Qw8mRKLQyVI4RO5pdW
         JwnR0yWgxYTMf07G65a9TvKnRpaNU/HbsmdNufqSEiePc6sNik+B8kckcYmZH1ETAcNy
         NaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759727202; x=1760332002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8B15nWoRBAiQJkoGuuiQMW9AxTFZ1IGAC77IMBgMFg=;
        b=Ov581HtsTiOvBeCHLvF3guy1EQr2slrCE32YFiL0yFpUPwI0twIToi6331vhfF4kBr
         z4/uk7gVFE3RTqzPB2RQARbb1XvEH5mOAm0ziMCIw45xhXmzwugSDEd9yQpNWh9Tuv1c
         valxanS1ywdyoxOY1CPNom6KqnQY2cwSNRR37X14DGohAv42Iv1dRHcOHBb+sXz/c8y4
         u/DXL8BzOmQN1M/NBhl97q7PW83mzskWhSdzl82zz+ENRSRxQ9ggsffHk5jXG5hg6/7G
         vtLeMeG9cIc3juSux2H3D4sok8JoLRGdoyOSbK4c5GdzPVH3M639LALLfZB/m+O8mG1C
         imkw==
X-Gm-Message-State: AOJu0YxC9Kmrtmcgh71bY3C7QiNoAu8eNKy32w3PS3+Ke1314/LSs40O
	2CMkk/+aGmykUO9DyA9YsgVTzY+0L0mqjf2exu9/vdGhY3BWELw/BVO1f9t5xiC4eXeNiYNRDEI
	KNU2wyDyXLcl+5JxT9MTvYVA9VpGLSsg=
X-Gm-Gg: ASbGncsFJhvmddtbPhMcD2zTXphnsPl5M0Mk7XtWOr9HO/bJRBwd2pzOw5PDABXeI+B
	8zRuIlHMvWkq6hwF2vTa2xmkLd/OkA3Ltg3rPSzKusM1qxJrebKLwLuo/95LeEet6R0yZ2xONPG
	K9Xd5U6Eyw/S/vTQeulNq6cVf3W8JzaqK7TIIIk6HGdjJETHQWNmBawbG9m4h4TSUyGah0jzWzU
	z3NQ0jqYvGLEN0hbkj7hhAzTTL1VCr4Pd/qOg1i2BbkRL+UFFGnARsvuyrIkQw5Hlup6MjxaQsD
	sQAf6pB4s/Hz8MNFHGxOurtvECKcJ+emYMO/U0ZQN7EyxyiftGUQ186ei0pzDjXtvnqmcfxzzQ=
	=
X-Google-Smtp-Source: AGHT+IEmw847HGoi6Yyke8O3hEuPwF/iE2QI8oLdhodlHDzgMyFjTWSO1piqVEW6b638t341oj1yDn2gszCWdFBfGIo=
X-Received: by 2002:a53:d790:0:b0:633:b6b5:ef2c with SMTP id
 956f58d0204a3-63b9a0e2014mr9134660d50.27.1759727201874; Sun, 05 Oct 2025
 22:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251004155957.1013969-1-jon.mason@arm.com>
In-Reply-To: <20251004155957.1013969-1-jon.mason@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Oct 2025 22:06:15 -0700
X-Gm-Features: AS18NWBdAyEZ8cufppGhP-R0k7MnTeqoZLd7YI4ud9kdOCygxXn9sBgPrwFTEms
Message-ID: <CAMKF1spufmrq2HTgEWiBK7oNC_KLtZsQFrbJKzrGSqN1kDBLWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gn: remove gcc override
To: jdmason@kudzu.us
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 05:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224457

On Sat, Oct 4, 2025 at 9:00=E2=80=AFAM Jon Mason via lists.openembedded.org
<jdmason=3Dkudzu.us@lists.openembedded.org> wrote:
>
> When compiling gn with clang, the following errors are being seen (with
> qemuarm64-secureboot machine, possibly others):
>
> In file included from /usr/include/c++/12/string:40,
>                  from ../sources/gn-0+git/src/base/strings/string_number_=
conversions.h:11,
>                  from ../sources/gn-0+git/src/gn/operators.cc:10:
> In static member function =E2=80=98static constexpr void std::char_traits=
<char>::assign(char_type&, const char_type&)=E2=80=99,
>     inlined from =E2=80=98static constexpr void std::__cxx11::basic_strin=
g<_CharT, _Traits, _Alloc>::_S_copy(_CharT*, const _CharT*, size_type) [wit=
h _CharT =3D char; _Traits =3D std::char_traits<char>; _Alloc =3D std::allo=
cator<char>]=E2=80=99 at /usr/include/c++/12/bits/basic_string.h:421:23,
>     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, _T=
raits, _Allocator>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::_M=
_replace(size_type, size_type, const _CharT*, size_type) [with _CharT =3D c=
har; _Traits =3D std::char_traits<char>; _Alloc =3D std::allocator<char>]=
=E2=80=99 at /usr/include/c++/12/bits/basic_string.tcc:532:22,
>     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, _T=
raits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::assign=
(const _CharT*) [with _CharT =3D char; _Traits =3D std::char_traits<char>; =
_Alloc =3D std::allocator<char>]=E2=80=99 at /usr/include/c++/12/bits/basic=
_string.h:1647:19,
>     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, _T=
raits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::operat=
or=3D(const _CharT*) [with _CharT =3D char; _Traits =3D std::char_traits<ch=
ar>; _Alloc =3D std::allocator<char>]=E2=80=99 at /usr/include/c++/12/bits/=
basic_string.h:815:28,
>     inlined from =E2=80=98Err {anonymous}::MakeOverwriteError(const Binar=
yOpNode*, const Value&)=E2=80=99 at ../sources/gn-0+git/src/gn/operators.cc=
:202:17:
> /usr/include/c++/12/bits/char_traits.h:354:16: error: =E2=80=98((const st=
d::char_traits<char>::char_type*)((char*)&empty_def + offsetof(std::__cxx11=
::string, std::__cxx11::basic_string<char, std::char_traits<char>, std::all=
ocator<char> >::<unnamed>)))[2]=E2=80=99 may be used uninitialized [-Werror=
=3Dmaybe-uninitialized]
>   354 |         __c1 =3D __c2;
>       |                ^~~~
> ../sources/gn-0+git/src/gn/operators.cc: In function =E2=80=98Err {anonym=
ous}::MakeOverwriteError(const BinaryOpNode*, const Value&)=E2=80=99:
> ../sources/gn-0+git/src/gn/operators.cc:198:15: note: =E2=80=98empty_def=
=E2=80=99 declared here
>   198 |   std::string empty_def;
>       |               ^~~~~~~~~
> In static member function =E2=80=98static constexpr void std::char_traits=
<char>::assign(char_type&, const char_type&)=E2=80=99,
>     inlined from =E2=80=98static constexpr void std::__cxx11::basic_strin=
g<_CharT, _Traits, _Alloc>::_S_copy(_CharT*, const _CharT*, size_type) [wit=
h _CharT =3D char; _Traits =3D std::char_traits<char>; _Alloc =3D std::allo=
cator<char>]=E2=80=99 at /usr/include/c++/12/bits/basic_string.h:421:23,
>     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, _T=
raits, _Allocator>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::_M=
_replace(size_type, size_type, const _CharT*, size_type) [with _CharT =3D c=
har; _Traits =3D std::char_traits<char>; _Alloc =3D std::allocator<char>]=
=E2=80=99 at /usr/include/c++/12/bits/basic_string.tcc:532:22,
>     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, _T=
raits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::assign=
(const _CharT*) [with _CharT =3D char; _Traits =3D std::char_traits<char>; =
_Alloc =3D std::allocator<char>]=E2=80=99 at /usr/include/c++/12/bits/basic=
_string.h:1647:19,
>     inlined from =E2=80=98constexpr std::__cxx11::basic_string<_CharT, _T=
raits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::operat=
or=3D(const _CharT*) [with _CharT =3D char; _Traits =3D std::char_traits<ch=
ar>; _Alloc =3D std::allocator<char>]=E2=80=99 at /usr/include/c++/12/bits/=
basic_string.h:815:28,
>     inlined from =E2=80=98Err {anonymous}::MakeOverwriteError(const Binar=
yOpNode*, const Value&)=E2=80=99 at ../sources/gn-0+git/src/gn/operators.cc=
:205:17:
> /usr/include/c++/12/bits/char_traits.h:354:16: error: =E2=80=98((const st=
d::char_traits<char>::char_type*)((char*)&empty_def + offsetof(std::__cxx11=
::string, std::__cxx11::basic_string<char, std::char_traits<char>, std::all=
ocator<char> >::<unnamed>)))[2]=E2=80=99 may be used uninitialized [-Werror=
=3Dmaybe-uninitialized]
>   354 |         __c1 =3D __c2;
>       |                ^~~~
> ../sources/gn-0+git/src/gn/operators.cc: In function =E2=80=98Err {anonym=
ous}::MakeOverwriteError(const BinaryOpNode*, const Value&)=E2=80=99:
> ../sources/gn-0+git/src/gn/operators.cc:198:15: note: =E2=80=98empty_def=
=E2=80=99 declared here
>   198 |   std::string empty_def;
>       |               ^~~~~~~~~
> cc1plus: all warnings being treated as errors
>
> Remove the toolchain-gcc override to allow the cflag
> -Wno-error=3Dmaybe-uninitialized to be applied.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta/recipes-devtools/gn/gn_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/g=
n/gn_git.bb
> index d8896609b193..87ccfe370456 100644
> --- a/meta/recipes-devtools/gn/gn_git.bb
> +++ b/meta/recipes-devtools/gn/gn_git.bb
> @@ -49,4 +49,4 @@ BBCLASSEXTEND =3D "native"
>
>  COMPATIBLE_HOST =3D "^(?!riscv32).*"
>
> -CFLAGS:append:toolchain-gcc =3D " -Wno-error=3Dmaybe-uninitialized"
> +CFLAGS +=3D "-Wno-error=3Dmaybe-uninitialized"

This is not a valid option with clang, I can see the error in report
is seen with gcc ( cc1plus being called there )
Why is it choosing gcc to compile when you selected clang as your
default compiler ?
. I wonder why it is not getting applied when toolchain-gcc OVERRIDE
is applied ?

> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224432): https://lists.openembedded.org/g/openembedde=
d-core/message/224432
> Mute This Topic: https://lists.openembedded.org/mt/115588441/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

