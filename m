Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E4ECD5BBF
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 01:47:41 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1275.1779500855187068332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 18:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AuokY5yR;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65e15fb394bso5685332d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 18:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779500854; cv=none;
        d=google.com; s=arc-20240605;
        b=gJ6xKJG6xPCtPEtAMDMIRkMl50ZNUmV9vSgtDjjwG1u58UnwoV8RVd6D383G7xNUwN
         bfjf5DWu7Clyg3S+PlAE7MbVkIggGmsEgKWIO9pebfCgba93KWGhOL1WUO+jaFuyvHTy
         KSCgYJhX2s+VVdSaoFHGVRO6JoDcGhAsXB5iC+lPMoftaJ0sygbcUnWv1dBeaKFSs/DF
         MtU5rMqdq8n8YrHTUwBqM9vHI/9bMGzLtA8PWaRy+FyyjpVAyb7KMfW55vSZl3VjZ7PK
         tYk0obktGKcJHNRr8U1tJyUa9YG5c5/pHoyyriPEIJDz8C71dmZ8QT8ohkFGrp4lCwaq
         iK2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NWSzfvTAFsnGEEagoxWjfID+9u6jQZENn0WToIDKWk4=;
        fh=lokdjCdjsyY6KjBfIJktI8BQ5vhRQ0H3tAEZGfjN5Hs=;
        b=IqfH3OEoZwVzuwwAvLP73Yqj4RNRqBfU2nmE6y74Wlf/10YAMIhDANxlMvyALKRlcQ
         xrsMHlt4verlPeVSHFfsSjY4T8ZUlJurIpyubbpVnCI7I4xJIkXb9+gkMBY+wt9dKmOD
         fwkSsbvpbIakOrnnBZmbHH69varQJhQ2R4MSPwQlvMghZ+PaVgbQJdh/mXyL7qEmXBmX
         HU3vApGHOGAYQFGXPutFVOZbiX1K835ZjP2W91Y4FJn4hCf9VeyMJXWKIywk8B7mPI8D
         XOoxteps+zCXn1BojqbAWe6FHGqB6lEFsZ30zEMa0PTtH45cciHD8gSaphinV+F5d5ie
         eovQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779500854; x=1780105654; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NWSzfvTAFsnGEEagoxWjfID+9u6jQZENn0WToIDKWk4=;
        b=AuokY5yR0/0wkf73UwLukRjkabTz0aGgptaMSBYltDnL4E1Ip5J1ouQ7yle96ups22
         V7u9RHwZhqRiyboEGl7sK0HygQwKKJ+mm3R+1A3u6wszgTGwNEcyDoexUmMQrYq0LiPf
         CecjvrfUeB5WfgdH0FNwERZKYpBTWE+a8khznzJDZ/zMj/wilUTdpMn/E/Hn7xJqjKht
         2Jzs3lueEMY7p29eA8MNvDUz1RxYZ0Yq8wsMA5qgz/BvY+50XGH/zew7fV9t3HtDgpeU
         NbGE7or5xGZ/M2kZBhkNzy7K0eaRzgyOTCNyU5Fx1pgJFvufdKoZdI0Ql3hazonignKh
         +CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779500854; x=1780105654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWSzfvTAFsnGEEagoxWjfID+9u6jQZENn0WToIDKWk4=;
        b=NPy5XQG9ndM4DzJSWfcPlrLgYU8HzLtuVDVzIohr6gvfTf0vyF6sG+py/p+ZhDH1Zc
         wgzNagiB07t5j9G7ixh5eY0QTYayHW2CG8GXwadGPxF6VN+9LjMthBS2otLaNl+EopcQ
         1paajfO3nlf+7kcEEUNcwFuEuCEPYD6q/HDe4TyUm77uLPw96Bgptqd1IZXrD4a2Zw9Z
         bAEtRIDn+XkG0cC1biNLMTFkMPSQBxr6BaNWHwkYwCGH+D3hWZiGUDvY3tXduXC8j+iM
         0QRweBTyBbI5B5jWrKS+VqfJwlc6l737aUcnXEhNDqwGVO8Gx0rmOE8I3r0t1QVyAsEH
         IGPA==
X-Gm-Message-State: AOJu0YxMHnmKRinT1hjALLFnepcbZkmpuGGVaI993A361gLgQ5WpDuAC
	2oeWXHK53/7OCwZiw9Yko1SbulxrZYaPXv4ZwlFQXh0RLXwxvFwBTFQG5ztxZcOAjilbDQB/O9g
	4/NCcNuWDrhDZUiYNvBbhVxVQOiahbKbhRpLQ
X-Gm-Gg: Acq92OENeSLTCbEi5FxsiL/n2KgJha1Cz+L9WTkLfU2cSkcREK9hCEt1jlNmAZCB0Zn
	cES+QzyruAYb1x5EQOxNHqThYn6MChgLIrru3zriQylen+Dv95AdnfoQHzx4S14dH94L7dPzSyw
	PS20uPl3H5mlXyLW/19yREVPDfd9jKes0Xe0e3dLKejLwbV1Z11/gJB+TWZnp+oWclzZXUfgVGQ
	VWOk+1fsATWAfxt0lbe0NkC3ETfuHmIdz45NabKLYwJtE/8mDIlgELNjtUjM2d29kAZ+647kC/o
	UCbox9ievwLNia0khwGv+T8eYyM7Nr6c4mNaqMs634k6oQpuGLcPze7UREE4olusyO6gvWdtg6N
	QNbl6zeHoB2UNsYLm0SpG4Jyx0GpUdVz/7ohjGcVLEfLKOFAQSEW8dnaW3/SXRGhhW8pTh4/Fx/
	sPEr9v
X-Received: by 2002:a05:690e:441c:b0:651:b2a3:89da with SMTP id
 956f58d0204a3-65ec95f1448mr4255090d50.7.1779500854197; Fri, 22 May 2026
 18:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 May 2026 18:47:08 -0700
X-Gm-Features: AVHnY4JPOs317CkOwgIRSrHEPBASXNbfts-iKPsv9eCqz9PP3aTnGrMMt2iCmZA
Message-ID: <CAMKF1src=8s_+rLOF79n6SqW1iWWni+2mbZtcqL3Jk-JChR3gA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 00/12] gcc: Upgrade GCC to 16.1 release
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000004ac35806527254c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 May 2026 01:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237561

--0000000000004ac35806527254c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have some comments for compiler portability; it almost looks ok.

On Tue, May 19, 2026 at 12:25=E2=80=AFAM Hemanth Kumar M D via
lists.openembedded.org <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.=
org>
wrote:

> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> This patch series upgrades GCC to 16.1 and includes the required
> runtime and compatibility fixes identified during testing in OE-Core.
> The series also includes fixes for packages failing to build with
> GCC 16, updates for libatomic runtime handling, and packaging
> changes for newly generated libatomic_asneeded files.
>
> Changes in v3:
> - Fix missing Signed-off-by in gn and gcc inner patch files
>
> Changes in v2:
> - Add libatomic-dev to elfutils ptest RDEPENDS
> - Add libatomic-staticdev to libc-test ptest RDEPENDS
> - Package new libcaf_shmem.a static library in libgfortran
> - Fix gn build with GCC 16 on musl
> - Backport GCC i386 ICE fix with -ffloat-store and SSE [PR125308]
>
> Summary of patches:
> - Patch 01: Backport piglit fix for building with GCC 16.
> - Patch 02: Backport rxvt-unicode fix for building with GCC 16.
> - Patch 03: Disable automatic libatomic linking in glibc.
> - Patch 04: Upgrade GCC to 16.1 release.
> - Patch 05: Disable automatic libatomic linking during gcc-runtime build.
> - Patch 06: Package new libatomic_asneeded runtime files.
> - Patch 07: Avoid passing MULTIBUILDTOP to libatomic in OE builds.
> - Patch 08: Package new libcaf_shmem.a static library in libgfortran.
> - Patch 09: Fix gn build with GCC 16 on musl.
> - Patch 10: Add libatomic-dev to elfutils ptest RDEPENDS.
> - Patch 11: Add libatomic-staticdev to libc-test ptest RDEPENDS.
> - Patch 12: Fix ICE on i386 with -ffloat-store and SSE [PR125308].
>
>  meta/conf/distro/include/maintainers.inc      |  2 +-
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  meta/recipes-core/glibc/glibc.inc             |  3 +
>  meta/recipes-core/musl/libc-test_git.bb       |  1 +
>  .../elfutils/elfutils_0.194.bb                |  2 +-
>  .../gcc/{gcc-15.2.inc =3D> gcc-16.1.inc}        | 18 ++--
>  ...ian_15.2.bb =3D> gcc-cross-canadian_16.1.bb} |  0
>  .../{gcc-cross_15.2.bb =3D> gcc-cross_16.1.bb}  |  0
>  ...-crosssdk_15.2.bb =3D> gcc-crosssdk_16.1.bb} |  0
>  meta/recipes-devtools/gcc/gcc-runtime.inc     | 18 +++-
>  ...cc-runtime_15.2.bb =3D> gcc-runtime_16.1.bb} |  0
>  ...itizers_15.2.bb =3D> gcc-sanitizers_16.1.bb} |  0
>  ...{gcc-source_15.2.bb =3D> gcc-source_16.1.bb} |  0
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  2 +-
>  ...sroot-gcc-version-specific-dirs-with.patch |  4 +-
>  ...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++--
>  ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 +++++++++-------
>  ...6-fix-ICE-with-ffloat-store-PR125308.patch | 89 +++++++++++++++++++
>  .../gcc/{gcc_15.2.bb =3D> gcc_16.1.bb}          |  0
>  ...initial_15.2.bb =3D> libgcc-initial_16.1.bb} |  0
>  .../gcc/{libgcc_15.2.bb =3D> libgcc_16.1.bb}    |  0
>  ...ibgfortran_15.2.bb =3D> libgfortran_16.1.bb} |  1 +
>  ...001-gn-fix-build-with-gcc-16-on-musl.patch | 33 +++++++
>  meta/recipes-devtools/gn/gn_git.bb            |  4 +-
>  ...h-rename-local-lerp-to-linear_interp.patch | 46 ++++++++++
>  meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
>  .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
>  .../0001-rxvt-unicode-fix-gcc16-c-20.patch    | 61 +++++++++++++
>  28 files changed, 323 insertions(+), 63 deletions(-)
>  rename meta/recipes-devtools/gcc/{gcc-15.2.inc =3D> gcc-16.1.inc} (88%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb =3D>
> gcc-cross-canadian_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb =3D> gcc-cross_16.1.=
bb}
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb =3D>
> gcc-crosssdk_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb =3D>
> gcc-runtime_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb =3D>
> gcc-sanitizers_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb =3D>
> gcc-source_16.1.bb} (100%)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR1=
25308.patch
>  rename meta/recipes-devtools/gcc/{gcc_15.2.bb =3D> gcc_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb =3D>
> libgcc-initial_16.1.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_15.2.bb =3D> libgcc_16.1.bb}
> (100%)
>  rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb =3D>
> libgfortran_16.1.bb} (51%)
>  create mode 100644
> meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patc=
h
>  create mode 100644
> meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-le=
rp-to-linear_interp.patch
>  create mode 100644
> meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c=
-20.patch
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237275):
> https://lists.openembedded.org/g/openembedded-core/message/237275
> Mute This Topic: https://lists.openembedded.org/mt/119387073/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004ac35806527254c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have some comments=C2=A0for compiler portability; it alm=
ost looks ok.</div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19, 2026 at 12:25=E2=80=AFAM=
 Hemanth Kumar M D via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;Hemanth.KumarMD=3D<a href=3D"mailto:windriver.com@list=
s.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Hemanth Kumar=
 M D &lt;<a href=3D"mailto:Hemanth.KumarMD@windriver.com" target=3D"_blank"=
>Hemanth.KumarMD@windriver.com</a>&gt;<br>
<br>
This patch series upgrades GCC to 16.1 and includes the required<br>
runtime and compatibility fixes identified during testing in OE-Core.<br>
The series also includes fixes for packages failing to build with<br>
GCC 16, updates for libatomic runtime handling, and packaging<br>
changes for newly generated libatomic_asneeded files.<br>
<br>
Changes in v3:<br>
- Fix missing Signed-off-by in gn and gcc inner patch files<br>
<br>
Changes in v2:<br>
- Add libatomic-dev to elfutils ptest RDEPENDS<br>
- Add libatomic-staticdev to libc-test ptest RDEPENDS<br>
- Package new libcaf_shmem.a static library in libgfortran<br>
- Fix gn build with GCC 16 on musl<br>
- Backport GCC i386 ICE fix with -ffloat-store and SSE [PR125308]<br>
<br>
Summary of patches:<br>
- Patch 01: Backport piglit fix for building with GCC 16.<br>
- Patch 02: Backport rxvt-unicode fix for building with GCC 16.<br>
- Patch 03: Disable automatic libatomic linking in glibc.<br>
- Patch 04: Upgrade GCC to 16.1 release.<br>
- Patch 05: Disable automatic libatomic linking during gcc-runtime build.<b=
r>
- Patch 06: Package new libatomic_asneeded runtime files.<br>
- Patch 07: Avoid passing MULTIBUILDTOP to libatomic in OE builds.<br>
- Patch 08: Package new libcaf_shmem.a static library in libgfortran.<br>
- Patch 09: Fix gn build with GCC 16 on musl.<br>
- Patch 10: Add libatomic-dev to elfutils ptest RDEPENDS.<br>
- Patch 11: Add libatomic-staticdev to libc-test ptest RDEPENDS.<br>
- Patch 12: Fix ICE on i386 with -ffloat-store and SSE [PR125308].<br>
<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0meta/recipes-core/glibc/glibc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://libc-test_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">libc-test_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
=C2=A0.../elfutils/<a href=3D"http://elfutils_0.194.bb" rel=3D"noreferrer" =
target=3D"_blank">elfutils_0.194.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../gcc/{gcc-15.2.inc =3D&gt; gcc-16.1.inc}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 18 ++--<br>
=C2=A0...<a href=3D"http://ian_15.2.bb" rel=3D"noreferrer" target=3D"_blank=
">ian_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_16.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_16.1.bb</a>} |=C2=A0 0=
<br>
=C2=A0.../{<a href=3D"http://gcc-cross_15.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-cross_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross_16.1.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_16.1.bb</a>}=C2=A0 |=C2=
=A0 0<br>
=C2=A0...-<a href=3D"http://crosssdk_15.2.bb" rel=3D"noreferrer" target=3D"=
_blank">crosssdk_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk_16.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_16.1.bb</a>} |=C2=A0 0<=
br>
=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 =C2=A0 =C2=A0| 18 +++=
-<br>
=C2=A0...<a href=3D"http://cc-runtime_15.2.bb" rel=3D"noreferrer" target=3D=
"_blank">cc-runtime_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-runtime_16.1.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_16.1.bb</a>} |=C2=A0 0=
<br>
=C2=A0...<a href=3D"http://itizers_15.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">itizers_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-sanitizers_16.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_16.1.bb</a>} |=C2=A0 0=
<br>
=C2=A0...{<a href=3D"http://gcc-source_15.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-source_15.2.bb</a> =3D&gt; <a href=3D"http://gcc-source_16.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_16.1.bb</a>} |=C2=A0 =
0<br>
=C2=A0...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |=C2=A0 2 +-<br>
=C2=A0...sroot-gcc-version-specific-dirs-with.patch |=C2=A0 4 +-<br>
=C2=A0...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++--<br>
=C2=A0...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 +++++++++-------<b=
r>
=C2=A0...6-fix-ICE-with-ffloat-store-PR125308.patch | 89 ++++++++++++++++++=
+<br>
=C2=A0.../gcc/{<a href=3D"http://gcc_15.2.bb" rel=3D"noreferrer" target=3D"=
_blank">gcc_15.2.bb</a> =3D&gt; <a href=3D"http://gcc_16.1.bb" rel=3D"noref=
errer" target=3D"_blank">gcc_16.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 0<br>
=C2=A0...<a href=3D"http://initial_15.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">initial_15.2.bb</a> =3D&gt; <a href=3D"http://libgcc-initial_16.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgcc-initial_16.1.bb</a>} |=C2=A0 0=
<br>
=C2=A0.../gcc/{<a href=3D"http://libgcc_15.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc_15.2.bb</a> =3D&gt; <a href=3D"http://libgcc_16.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libgcc_16.1.bb</a>}=C2=A0 =C2=A0 |=C2=A0=
 0<br>
=C2=A0...<a href=3D"http://ibgfortran_15.2.bb" rel=3D"noreferrer" target=3D=
"_blank">ibgfortran_15.2.bb</a> =3D&gt; <a href=3D"http://libgfortran_16.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_16.1.bb</a>} |=C2=A0 1=
 +<br>
=C2=A0...001-gn-fix-build-with-gcc-16-on-musl.patch | 33 +++++++<br>
=C2=A0meta/recipes-devtools/gn/<a href=3D"http://gn_git.bb" rel=3D"noreferr=
er" target=3D"_blank">gn_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 +-<br>
=C2=A0...h-rename-local-lerp-to-linear_interp.patch | 46 ++++++++++<br>
=C2=A0meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">piglit_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +<br=
>
=C2=A0.../rxvt-unicode/rxvt-unicode.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A0.../0001-rxvt-unicode-fix-gcc16-c-20.patch=C2=A0 =C2=A0 | 61 ++++++++=
+++++<br>
=C2=A028 files changed, 323 insertions(+), 63 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-15.2.inc =3D&gt; gcc-16.1.inc} =
(88%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-canadia=
n_15.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_15.2.bb<=
/a> =3D&gt; <a href=3D"http://gcc-cross-canadian_16.1.bb" rel=3D"noreferrer=
" target=3D"_blank">gcc-cross-canadian_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross_15.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-cross_15.2.bb</a> =3D&gt; <a hre=
f=3D"http://gcc-cross_16.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cro=
ss_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk_15.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_15.2.bb</a> =3D&gt; =
<a href=3D"http://gcc-crosssdk_16.1.bb" rel=3D"noreferrer" target=3D"_blank=
">gcc-crosssdk_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-runtime_15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_15.2.bb</a> =3D&gt; <a=
 href=3D"http://gcc-runtime_16.1.bb" rel=3D"noreferrer" target=3D"_blank">g=
cc-runtime_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-sanitizers_15=
.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_15.2.bb</a> =3D&=
gt; <a href=3D"http://gcc-sanitizers_16.1.bb" rel=3D"noreferrer" target=3D"=
_blank">gcc-sanitizers_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-source_15.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-source_15.2.bb</a> =3D&gt; <a h=
ref=3D"http://gcc-source_16.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-=
source_16.1.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-IC=
E-with-ffloat-store-PR125308.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc_15.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc_15.2.bb</a> =3D&gt; <a href=3D"http:/=
/gcc_16.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc_16.1.bb</a>} (100%)<=
br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc-initial_15=
.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_15.2.bb</a> =3D&=
gt; <a href=3D"http://libgcc-initial_16.1.bb" rel=3D"noreferrer" target=3D"=
_blank">libgcc-initial_16.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc_15.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libgcc_15.2.bb</a> =3D&gt; <a href=3D"h=
ttp://libgcc_16.1.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_16.1.bb</=
a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgfortran_15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_15.2.bb</a> =3D&gt; <a=
 href=3D"http://libgfortran_16.1.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibgfortran_16.1.bb</a>} (51%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gn/files/0001-gn-fix-build-w=
ith-gcc-16-on-musl.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/piglit/piglit/0001-fbo-blit-=
stretch-rename-local-lerp-to-linear_interp.patch<br>
=C2=A0create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-r=
xvt-unicode-fix-gcc16-c-20.patch<br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237275): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237275" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/237275</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119387073/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119387073/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004ac35806527254c6--

