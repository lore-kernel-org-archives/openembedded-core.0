Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66030CAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 14:17:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9994.1759587441533750315
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Oct 2025 07:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HPrdVNBH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso2330887f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Oct 2025 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759587440; x=1760192240; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knN++2RB2B8eYCmad0gEAJT3YMj16EzdFt9vtePZH90=;
        b=HPrdVNBHsoHUfoM6holnO4e3Jtyx54ij3uhaFu52y7Bj06mpidOhD2/IWqQBQfjRxj
         i3GP/Zt6wQUMQJgNKAnVG9JXn5ughIUDF/WfSE73mlCXKrAFHLLLibE0JrCJHxsrt4Je
         BiGkJPK6bIaEvR3XcdUTSZ9GQzS6yFj3JhTqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759587440; x=1760192240;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=knN++2RB2B8eYCmad0gEAJT3YMj16EzdFt9vtePZH90=;
        b=blpZWUZef9v5/5MGZoe7Og4Y52m47TDjf6fWSCFZZecejw24z53N0YP1E0GGbTwqb2
         lMM8w4mB+lGv9R5U34C6wKcOmQT8RbnunKl9FuzRNazgekQJxyINan6X9AKfos1HM9Mt
         sMevtn2tm/Yl1zPyUsGpTrcyWBaX9YQfg6Z9IetB6wAq6Rc2mH6lctlkSGZ0anOxNc14
         9cbNs35oe3BFb83KdazgAyQrSSzQUKeWFcboWs8sYsYJ0wMIorhW1Z9vzKXUp7UBZKR/
         BwldcuOwn9zXLUK2BLnXndE+kjJBETLz4imQUFZC/p6H3qkic6Dnc51fVGEuSmju15xP
         rr7A==
X-Forwarded-Encrypted: i=1; AJvYcCWnS4zzOKbG3I8vAAFv4h/X+Qjx8dLbK9loERxXwpaAtbQycahxhunyhonYNtirtkob89d4rPADrHBbhjxXU1MP7Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxw8u3QHW3Zk2u5WOzGAfOmUj9cidE2+92FF33uMVTeiIsJq8/W
	fIZ+DwsbqdR7bvPNy7zAsVY2mn+B/qi8oZ3xDF6+5nOJmK/go4tKSWF31z0ZFhyxsvs=
X-Gm-Gg: ASbGncuAX8S+uPHMKDZRGD0soErALwsL5TjqcsdXCVXjdg+DNMCRpsYsZRWkPmORVwr
	yOEePlt9N7OV4dk/n9E1RU9Hz8XPecbUO4AJiyf7RvYHmPd7O6KhBp0PZNkPZWvYwj1Wh+6aWTd
	Vhtl+0sXJrHRnMARNAzCEj0HreFE7ZpghAL2Qei8gAhdlxZ3xEmYZD0ds26wPF+iwBsarQD6Wbp
	z6AEIXzB9lcDoI35QVFCboTynEYNIeTRKHvauy309ZCTm2ZTxLiVNfvXJtMUMtm9ICe3LzuH892
	CYKrPEl+4ybsF9t261epcKJGbr0wtXq9SCZyv11vLWBW9Apx9J3fQrEYDvsAByk4w4X4dHrXFXp
	V1KgGioGgRMMPupnEJD+G0PcFqkgdwbZ49Fuq1FqXclZ1/+AjzA6+gNZiEPcD6N/S73THgJcocf
	Ov0/ghgrk1Jc9462S256U6ac5Oe/v5uNf10B8=
X-Google-Smtp-Source: AGHT+IFqUZ0dukHgZBxgAVSaeMmtzumTv6eM0JcbMXZ9UM46dwtoGGLOEOL5odouYDxIU9irXRwC+w==
X-Received: by 2002:a5d:5f47:0:b0:415:7a6c:6a38 with SMTP id ffacd0b85a97d-425671c3bcdmr4308292f8f.59.1759587439771;
        Sat, 04 Oct 2025 07:17:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b8a:9e39:3d77:530c? ([2001:8b0:aba:5f3c:4b8a:9e39:3d77:530c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b5csm12500952f8f.5.2025.10.04.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 07:17:19 -0700 (PDT)
Message-ID: <f66ecf89fde642336b3d454f38acab28ebe8ad11.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gn: remove gcc override
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jdmason@kudzu.us, openembedded-core@lists.openembedded.org
Date: Sat, 04 Oct 2025 15:17:18 +0100
In-Reply-To: <20251003200206.1201180-1-jon.mason@arm.com>
References: <20251003200206.1201180-1-jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Oct 2025 14:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224431

On Fri, 2025-10-03 at 16:02 -0400, Jon Mason via lists.openembedded.org
wrote:
> When compiling gn with clang, the following errors are being seen
> (with
> qemuarm64-secureboot machine, possibly others):
>=20
> In file included from /usr/include/c++/12/string:40,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ../sources/gn-
> 0+git/src/base/strings/string_number_conversions.h:11,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 from ../sources/gn-0+git/src/gn/operators.cc:10:
> In static member function =E2=80=98static constexpr void
> std::char_traits<char>::assign(char_type&, const char_type&)=E2=80=99,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98static constexpr void
> std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::_S_copy(_CharT*,
> const _CharT*, size_type) [with _CharT =3D char; _Traits =3D
> std::char_traits<char>; _Alloc =3D std::allocator<char>]=E2=80=99 at
> /usr/include/c++/12/bits/basic_string.h:421:23,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98constexpr std::__cxx11::basic_st=
ring<_CharT,
> _Traits, _Allocator>& std::__cxx11::basic_string<_CharT, _Traits,
> _Alloc>::_M_replace(size_type, size_type, const _CharT*, size_type)
> [with _CharT =3D char; _Traits =3D std::char_traits<char>; _Alloc =3D
> std::allocator<char>]=E2=80=99 at
> /usr/include/c++/12/bits/basic_string.tcc:532:22,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98constexpr std::__cxx11::basic_st=
ring<_CharT,
> _Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits,
> _Alloc>::assign(const _CharT*) [with _CharT =3D char; _Traits =3D
> std::char_traits<char>; _Alloc =3D std::allocator<char>]=E2=80=99 at
> /usr/include/c++/12/bits/basic_string.h:1647:19,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98constexpr std::__cxx11::basic_st=
ring<_CharT,
> _Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits,
> _Alloc>::operator=3D(const _CharT*) [with _CharT =3D char; _Traits =3D
> std::char_traits<char>; _Alloc =3D std::allocator<char>]=E2=80=99 at
> /usr/include/c++/12/bits/basic_string.h:815:28,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98Err {anonymous}::MakeOverwriteEr=
ror(const
> BinaryOpNode*, const Value&)=E2=80=99 at ../sources/gn-
> 0+git/src/gn/operators.cc:202:17:
> /usr/include/c++/12/bits/char_traits.h:354:16: error: =E2=80=98((const
> std::char_traits<char>::char_type*)((char*)&empty_def +
> offsetof(std::__cxx11::string, std::__cxx11::basic_string<char,
> std::char_traits<char>, std::allocator<char> >::<unnamed>)))[2]=E2=80=99 =
may
> be used uninitialized [-Werror=3Dmaybe-uninitialized]
> =C2=A0 354 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __c1 =3D __c=
2;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
> ../sources/gn-0+git/src/gn/operators.cc: In function =E2=80=98Err
> {anonymous}::MakeOverwriteError(const BinaryOpNode*, const Value&)=E2=80=
=99:
> ../sources/gn-0+git/src/gn/operators.cc:198:15: note: =E2=80=98empty_def=
=E2=80=99
> declared here
> =C2=A0 198 |=C2=A0=C2=A0 std::string empty_def;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
> In static member function =E2=80=98static constexpr void
> std::char_traits<char>::assign(char_type&, const char_type&)=E2=80=99,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98static constexpr void
> std::__cxx11::basic_string<_CharT, _Traits, _Alloc>::_S_copy(_CharT*,
> const _CharT*, size_type) [with _CharT =3D char; _Traits =3D
> std::char_traits<char>; _Alloc =3D std::allocator<char>]=E2=80=99 at
> /usr/include/c++/12/bits/basic_string.h:421:23,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98constexpr std::__cxx11::basic_st=
ring<_CharT,
> _Traits, _Allocator>& std::__cxx11::basic_string<_CharT, _Traits,
> _Alloc>::_M_replace(size_type, size_type, const _CharT*, size_type)
> [with _CharT =3D char; _Traits =3D std::char_traits<char>; _Alloc =3D
> std::allocator<char>]=E2=80=99 at
> /usr/include/c++/12/bits/basic_string.tcc:532:22,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98constexpr std::__cxx11::basic_st=
ring<_CharT,
> _Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits,
> _Alloc>::assign(const _CharT*) [with _CharT =3D char; _Traits =3D
> std::char_traits<char>; _Alloc =3D std::allocator<char>]=E2=80=99 at
> /usr/include/c++/12/bits/basic_string.h:1647:19,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98constexpr std::__cxx11::basic_st=
ring<_CharT,
> _Traits, _Alloc>& std::__cxx11::basic_string<_CharT, _Traits,
> _Alloc>::operator=3D(const _CharT*) [with _CharT =3D char; _Traits =3D
> std::char_traits<char>; _Alloc =3D std::allocator<char>]=E2=80=99 at
> /usr/include/c++/12/bits/basic_string.h:815:28,
> =C2=A0=C2=A0=C2=A0 inlined from =E2=80=98Err {anonymous}::MakeOverwriteEr=
ror(const
> BinaryOpNode*, const Value&)=E2=80=99 at ../sources/gn-
> 0+git/src/gn/operators.cc:205:17:
> /usr/include/c++/12/bits/char_traits.h:354:16: error: =E2=80=98((const
> std::char_traits<char>::char_type*)((char*)&empty_def +
> offsetof(std::__cxx11::string, std::__cxx11::basic_string<char,
> std::char_traits<char>, std::allocator<char> >::<unnamed>)))[2]=E2=80=99 =
may
> be used uninitialized [-Werror=3Dmaybe-uninitialized]
> =C2=A0 354 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __c1 =3D __c=
2;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~
> ../sources/gn-0+git/src/gn/operators.cc: In function =E2=80=98Err
> {anonymous}::MakeOverwriteError(const BinaryOpNode*, const Value&)=E2=80=
=99:
> ../sources/gn-0+git/src/gn/operators.cc:198:15: note: =E2=80=98empty_def=
=E2=80=99
> declared here
> =C2=A0 198 |=C2=A0=C2=A0 std::string empty_def;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
> cc1plus: all warnings being treated as errors
>=20
> Remove the toolchain-gcc override to allow the cflag
> -Wno-error=3Dmaybe-uninitialized to be applied.
>=20
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
> =C2=A0meta/recipes-devtools/gn/gn_git.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-
> devtools/gn/gn_git.bb
> index d8896609b193..2443ea7139f4 100644
> --- a/meta/recipes-devtools/gn/gn_git.bb
> +++ b/meta/recipes-devtools/gn/gn_git.bb
> @@ -49,4 +49,4 @@ BBCLASSEXTEND =3D "native"
> =C2=A0
> =C2=A0COMPATIBLE_HOST =3D "^(?!riscv32).*"
> =C2=A0
> -CFLAGS:append:toolchain-gcc =3D " -Wno-error=3Dmaybe-uninitialized"
> +CFLAGS:append =3D " -Wno-error=3Dmaybe-uninitialized"

In that case can you drop the append and just make it a +=3D please?

Cheers,

Richard

