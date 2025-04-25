Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6DDC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 11:29:18 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.4437.1745580554998200568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 04:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCeU5oFl;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso2680663e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745580553; x=1746185353; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05Jmn1lX8Vfh5cBfHPGxkZuVLIc7zJw6FPo0SGDIzek=;
        b=bCeU5oFl8hAGsqOxMFzAvqR6tASt78EFIB0qfMspL1WLlj1NKpoZCcBZd0Hv4X7lWR
         DgXCrzIZ84JrgJpi6VZuDezaumOWY4WT7OksjlHc/bXUFppq+HfjC8ZlKRVsCXEoEccI
         00y/WEaLiQh5IcRxGsZ0tRyc+H2PpcQzP7XEpZZhhApsfrpxQgP27Ox+oiO6q8z5sD9U
         wyZ6rAzo2lmrsqAFll8n28exPiLoQeu9MMHtNGjOy3hccRbPSTN6BqGO9fa+Pad/IO9G
         j2olK4ucE1SwoM8ty7ZvFB3tFCaVTMrYaLxcQp7eNmx20U0DcJ4at4VDfWHgSRe5BBoF
         QvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580553; x=1746185353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05Jmn1lX8Vfh5cBfHPGxkZuVLIc7zJw6FPo0SGDIzek=;
        b=RloxOflVdVzxZxdT4jxdbHotkR8GBwzNfj7SxNHgfwocqLsY7nL3qIIzhG0uW15ZYH
         qXaiRPC3/NqWpqMXNwtueToJorEF3AqQwH2s5BjEJRNnHNVkabrQ7P7DBhLYhHrxqxJl
         8Dj938o91LjPn7D3/kTabzeG4i0utgdelHLn3CGFyxWe6a4Bh9R2D7D/X816Af4lONSx
         Am8Tz2bhCFWu68wG6alJU4prN0aBE+s8ygZge4Dmi8rI91Zdw/XroKibzl05NucilSge
         rwFb5UG/ez4ImTvUp/UFAmSQfwifgyKvH25rbY1MBXc88uZWsc/ChTy2XM0yy4NaYJDo
         8E1w==
X-Gm-Message-State: AOJu0YwNlEyp7qWl328FfTg3Brju10EIpoMoyhbDlsAtgEbfdKzZ7a9x
	p4SeRUvDCmu6ajFUfFx8KtdKt2xk40/NRLF532HRVISyzkEZKD78QuZif/srSGxJoNfAPcLuTBU
	1BJGNijeq0ftjIfX5Qpntyg1F8+E=
X-Gm-Gg: ASbGnctPpLqVi5PLUTBwVwPWi+jmZY3q+rnuAyU7qxsk4J55apEgKLSjOJne9lrzgi/
	Y+woYKAcRYezrxbRHqDZ6SL7nyeku/4BvGAjEFbdvJ/1kSTNIHughcVq7gfYD3vXdSUEbCivUUe
	9lPsdtVzvBWSW/Zy0FvvOLWC9b
X-Google-Smtp-Source: AGHT+IGJ/vt8TJ7wZTJE+4L5zjxIBw80SnLU3vZtWel1MsKD1vBIsMx/NrxX18kub7PLP8Wzve/gboLmpmTzr4Z4PDc=
X-Received: by 2002:a05:6512:1389:b0:549:6759:3982 with SMTP id
 2adb3069b0e04-54e8cc0a0a0mr575221e87.37.1745580552844; Fri, 25 Apr 2025
 04:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250411122926.706371-1-adriaan.schmidt@siemens.com> <20250411122926.706371-2-adriaan.schmidt@siemens.com>
In-Reply-To: <20250411122926.706371-2-adriaan.schmidt@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 25 Apr 2025 13:28:57 +0200
X-Gm-Features: ATxdqUGqbaZj1F8qBwBpgG1yDNoKJkG8yZio-Qk0ghCzF1mS1EKzbll-9HCG_SM
Message-ID: <CA+chaQd9qFEXem+k9sbyWHU71k-ijTmZC-XHXUMHt8ibA_o8Kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/1] libunwind: 1.8.1
To: adriaan.schmidt@siemens.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	richard.purdie@linuxfoundation.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 11:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215457

On Fri, Apr 11, 2025 at 3:03=E2=80=AFPM Adriaan Schmidt via
lists.openembedded.org
<adriaan.schmidt=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> * change download location to GitHub
> * refresh patches
> * on ppc32/musl we need to link with -latomic
> * make the -Wno-error more specific (only ppc32/musl)
>
> Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
> ---
>  ...-Gtrace-remove-unguarded-print-calls.patch |  52 ----
>  ...t-sve-signal-check-that-SVE-is-prese.patch |  73 ++++++
>  ...c-or-musl-register-names-as-appropr.patch} |  23 +-
>  ...compilation-of-unw_getcontext-on-ARM.patch |  27 ++
>  ...ork-inline-aarch64-as-for-setcontext.patch | 163 ++++++++++++
>  .../libunwind/0005-Handle-musl-on-PPC32.patch |  88 +++++++
>  ...context-mismatches-between-glibc-and.patch | 247 ------------------
>  .../libunwind/libunwind/mips-byte-order.patch |   2 +-
>  ...{libunwind_1.6.2.bb =3D> libunwind_1.8.1.bb} |  25 +-
>  9 files changed, 377 insertions(+), 323 deletions(-)
>  delete mode 100644 meta/recipes-support/libunwind/libunwind/0001-src-Gtr=
ace-remove-unguarded-print-calls.patch
>  create mode 100644 meta/recipes-support/libunwind/libunwind/0001-tests-G=
arm64-test-sve-signal-check-that-SVE-is-prese.patch
>  rename meta/recipes-support/libunwind/libunwind/{mips-coredump-register.=
patch =3D> 0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch}=
 (86%)
>  create mode 100644 meta/recipes-support/libunwind/libunwind/0003-Fixed-m=
iscompilation-of-unw_getcontext-on-ARM.patch
>  create mode 100644 meta/recipes-support/libunwind/libunwind/0004-Rework-=
inline-aarch64-as-for-setcontext.patch
>  create mode 100644 meta/recipes-support/libunwind/libunwind/0005-Handle-=
musl-on-PPC32.patch
>  delete mode 100644 meta/recipes-support/libunwind/libunwind/0005-ppc32-C=
onsider-ucontext-mismatches-between-glibc-and.patch
>  rename meta/recipes-support/libunwind/{libunwind_1.6.2.bb =3D> libunwind=
_1.8.1.bb} (45%)
>

Hi, with gcc-15 I'm seeing:

In file included from ../../libunwind-1.8.1/tests/Ltest-nomalloc.c:4:
../../libunwind-1.8.1/tests/Gtest-nomalloc.c: In function 'malloc':
../../libunwind-1.8.1/tests/Gtest-nomalloc.c:49:12: error: too many
arguments to function 'func'; expected 0, have 1
   49 |     return func(s);
      |            ^~~~ ~

