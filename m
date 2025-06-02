Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD519C5B559
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:18 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.7932.1748902334873400735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 15:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mO3S4/KJ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad1b94382b8so869403966b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748902333; x=1749507133; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=65dHQ/UcJLJ+EvQmMCFFB6uE4GEcOj9T9h3I+zjHiPw=;
        b=mO3S4/KJuezrsKFagIbNX11VlnaCAt2IoGQFyR0Wd6KcU+QlWiwVY32IT814ORexyJ
         aIAteg/C+WYVlw0c/jXNUxv6dy82xqskHC6NamgcKfj+Pd5enzZF+TgBSTihvIpdr2ZD
         2jPkJhuxANontUaIqd4jqh3hI8r8raO92i+sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902333; x=1749507133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65dHQ/UcJLJ+EvQmMCFFB6uE4GEcOj9T9h3I+zjHiPw=;
        b=lc+9xlg2uxzqlK8L3dxTmJpMbhKDy4dV0HH6hr7Kp597srh06zlwhpiTLt4x8Jav7Q
         wtBfJxQyJ8aVIt6a5Mgag/6fsH1U83HiUOuVuNHgSyu0zKj6sc9rYdB0cg4NXPJOvEFX
         ZkS/KZ7q9HnCMHrAZl64wQFeV3k9/kB87wUBcMObL86SCc4Pdf3ufPmf86MNjPsIA7WZ
         +YkDSUdHPM9SbMoV7nSoPb+dielWsc6IkJGyFzFWElGDIYu1WVECQL6tOu4XRcfItYV4
         E2krDJdlWsBeXpn9l2uuMlX/OfV1+qlE1aAN+Zf+zAylu7/ZnVYDfGbsFCkBT20+FKyI
         IrqA==
X-Gm-Message-State: AOJu0Yy6w35sUs3Z6yCty8FHJR+zJbF9iD32FF/P3v6N2rykQ7dk1Aow
	UzrBeNLdEq5QFzkNjESclvlzXfrtAoa9Ratoxte7IJ7/Kr4f/yzpakoP75NGPglW8YIJcgBGCLN
	MeJYcMR7BffONRixIpC/rA08/ERH0EsUwV7s5LkX82GzDw0GLl37TDYDixA==
X-Gm-Gg: ASbGnctOYLHuRHPX8dokbkL3SxTJS4L88Fj1GOOvKX4+6mQauNvNJl3MYGaUeNN/4I5
	z0g40dyC+85NoMyhzgLX+EHz9bbxvoq/dIjPHIZNf58H+xaT1+Xj+85YFrkfOdjKwoAfDh8WsaZ
	CzD9nePgKEzgodGCPKhQau8YCsQweI1Oz2fRrKiE+DlaM=
X-Google-Smtp-Source: AGHT+IFNaK5ojov1BuapPCSAw1uTXpEy7RECpStQt7CxRUn9H+qb/wXY1l7olKc115QOVmfjNCMquYY8XdP6LwdGfqs=
X-Received: by 2002:a17:906:f5a3:b0:ad8:9b5d:2c1c with SMTP id
 a640c23a62f3a-adb32285212mr1505878566b.19.1748902333265; Mon, 02 Jun 2025
 15:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748816484.git.tim.orling@konsulko.com> <09d7e38bfe20f3de0e2489d52305c81be2975d4b.1748816484.git.tim.orling@konsulko.com>
 <CAMKF1sprSxJnkOkM+v_k6tmwtPOiq26_A1AU0RikUrRfTN5NWA@mail.gmail.com> <CAOyo-86pp7rnKLBLDrUj6P5q3vZqJnwkSgQTXPWNNG36LC5Nzw@mail.gmail.com>
In-Reply-To: <CAOyo-86pp7rnKLBLDrUj6P5q3vZqJnwkSgQTXPWNNG36LC5Nzw@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 2 Jun 2025 15:12:02 -0700
X-Gm-Features: AX0GCFtvqTqfwrZu0oz--3VSClTI36QdI_aGuqiDwWKApJKpJ9aPwJXMCQ54Jjw
Message-ID: <CAOyo-86KG7Nc2zPxZn+G1H25oDZGnLZsr_a9yaF2BD2gD_b=YQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/8] python3-maturin: upgrade 1.8.3 -> 1.8.6
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000524a3a06369e0e02"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 22:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217743

--000000000000524a3a06369e0e02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 2:48=E2=80=AFPM Tim Orling <tim.orling@konsulko.com>=
 wrote:

>
>
> On Mon, Jun 2, 2025 at 2:32=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>> On Sun, Jun 1, 2025 at 3:26=E2=80=AFPM Tim Orling via lists.openembedded=
.org
>> <tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
>> >
>> > From: Tim Orling <tim.orling@konsulko.com>
>> >
>> > Comparing changes since 1.8.3:
>> > https://github.com/PyO3/maturin/compare/v1.8.3...v1.8.6
>> >
>> > Changelog:
>> >
>> > 1.8.6
>> > * Print a message when overriding platform tag from
>> _PYTHON_HOST_PLATFORM
>> >   in #2594
>> > * Use the current python interpreter's version when the abi3 feature i=
s
>> set
>> >   with no explicit version in #2597
>> >
>> > 1.8.5
>> > * Fix release CI build
>> >
>> > 1.8.4
>> > * Install a Rust toolchain into a temporary directory when building
>> maturin
>> >   itself or a package and a Rust toolchain is missing. Set
>> >   MATURIN_NO_INSTALL_RUST to disable this behavior. #2421
>> > * Fix broken maturin develop with latest uv in #2584
>> > * Add PYO3_PYTHON env var support in #2534
>> > * Sort RECORD file in wheel archives to make them deterministic in #25=
50
>> > * Publish wheel for loongarch64 in #2548
>> > * Add --compression-level option to build command in #2572
>> >
>> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> > ---
>> > oe-selftest for maturin passes
>> >
>> >  .../python/python3-maturin-crates.inc         |  20 +-
>> >  ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----
>> >  .../python/python3-maturin_1.8.3.bb           |  43 --
>> >  .../python/python3-maturin_1.8.6.bb           | 405 +++++++++++++++++=
+
>> >  4 files changed, 415 insertions(+), 163 deletions(-)
>> >  delete mode 100644
>> meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-code=
s-on-riscv32gc-unknown-linux-g.patch
>>
>> Please keep this patch, this version of maturin still uses libc
>> 0.2.167, it breaks riscv32 builds without it.
>>
>
> Yes, I caught that with v2. But thank you for the confirmation.
> https://lists.openembedded.org/g/openembedded-core/message/217722
>

I filed a bug with upstream
https://github.com/PyO3/maturin/issues/2627


>
>> >  delete mode 100644 meta/recipes-devtools/python/
>> python3-maturin_1.8.3.bb
>> >  create mode 100644 meta/recipes-devtools/python/
>> python3-maturin_1.8.6.bb
>> <snip>
>
>

--000000000000524a3a06369e0e02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, =
2025 at 2:48=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulk=
o.com">tim.orling@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jun 2, 2025 at 2:32=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Sun, Jun 1, 2025 at 3:26=E2=
=80=AFPM Tim Orling via <a href=3D"http://lists.openembedded.org" rel=3D"no=
referrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org" tar=
get=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;<br>
&gt; Comparing changes since 1.8.3:<br>
&gt; <a href=3D"https://github.com/PyO3/maturin/compare/v1.8.3...v1.8.6" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/PyO3/maturin/compare/=
v1.8.3...v1.8.6</a><br>
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; 1.8.6<br>
&gt; * Print a message when overriding platform tag from _PYTHON_HOST_PLATF=
ORM<br>
&gt;=C2=A0 =C2=A0in #2594<br>
&gt; * Use the current python interpreter&#39;s version when the abi3 featu=
re is set<br>
&gt;=C2=A0 =C2=A0with no explicit version in #2597<br>
&gt;<br>
&gt; 1.8.5<br>
&gt; * Fix release CI build<br>
&gt;<br>
&gt; 1.8.4<br>
&gt; * Install a Rust toolchain into a temporary directory when building ma=
turin<br>
&gt;=C2=A0 =C2=A0itself or a package and a Rust toolchain is missing. Set<b=
r>
&gt;=C2=A0 =C2=A0MATURIN_NO_INSTALL_RUST to disable this behavior. #2421<br=
>
&gt; * Fix broken maturin develop with latest uv in #2584<br>
&gt; * Add PYO3_PYTHON env var support in #2534<br>
&gt; * Sort RECORD file in wheel archives to make them deterministic in #25=
50<br>
&gt; * Publish wheel for loongarch64 in #2548<br>
&gt; * Add --compression-level option to build command in #2572<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; oe-selftest for maturin passes<br>
&gt;<br>
&gt;=C2=A0 .../python/python3-maturin-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 20 +-<br>
&gt;=C2=A0 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-maturin_1.8.3.bb" rel=3D"no=
referrer" target=3D"_blank">python3-maturin_1.8.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 43 --<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-maturin_1.8.6.bb" rel=3D"no=
referrer" target=3D"_blank">python3-maturin_1.8.6.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 405 ++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 415 insertions(+), 163 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3-maturin/=
0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch<br>
<br>
Please keep this patch, this version of maturin still uses libc<br>
0.2.167, it breaks riscv32 builds without it.<br></blockquote><div><br></di=
v><div>Yes, I caught that with v2. But thank you for the confirmation.</div=
><div><a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/217722" target=3D"_blank">https://lists.openembedded.org/g/openembedded-co=
re/message/217722</a>=C2=A0</div></div></div></blockquote><div><br></div><d=
iv>I filed a bug with upstream<br><a href=3D"https://github.com/PyO3/maturi=
n/issues/2627">https://github.com/PyO3/maturin/issues/2627</a></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-maturin_1.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-ma=
turin_1.8.3.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-maturin_1.8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-ma=
turin_1.8.6.bb</a><br>&lt;snip&gt;</blockquote></div></div>
</blockquote></div></div>

--000000000000524a3a06369e0e02--

