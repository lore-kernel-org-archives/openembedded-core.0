Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58582D2503E
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:25:54 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36986.1768235144175866232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 08:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXiUKnII;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78c6a53187dso31119427b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768235143; x=1768839943; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wKP8OdpJ47cQhPKKYqX1VJOPI6cnCfq7rHuT7qbCS44=;
        b=DXiUKnIIwFEvV37yFllQ8rAznqI/xOKN+T8vVpmYYbuPWywBS+yuLaZTxXk5JSwXdZ
         dAwaH3UK3/7S82V/DZY21mhvauCYUVSJkjpyfznOcaFxpWniCDty1rQtepd7h7UDuzG+
         oJrx6wnvkjIUF1q2baltVzt5Fp3hUwMWafUJM8z/6RQ3O8NxoHsspCmD4S5nYbD+jlMa
         dBR/VGnWqt2NpAMAC8RK/r90h99syyUGETkufqnkNvE9nkA1kTYc4/vHJiV/dDbavH/S
         Grv02aLAIBtKBf4xKorm4SoD6S+fROOPulh+Cah/xxfUTSxqn5Guwzo/G0DhCBIjhF5S
         U+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235143; x=1768839943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKP8OdpJ47cQhPKKYqX1VJOPI6cnCfq7rHuT7qbCS44=;
        b=Z8/T+Ol7IEI1jr9My7HuQSiOvhKlo6qK8+QU9K3mdB3TT3aNY3DuOq7g4kL3UTi73h
         wYSufv64zBMwjvXBGp/ZqtDkwQScQV5un+kMn3kQohml9sg2QdIkfbxDpVhGwV+tTsVS
         KN81jm4NwFm3b3wSaxwb0qREtWameWnqfcai0LX+kSuj74QUjVgvWvd2E1zMzZpiF0KP
         mEQZb6HUGA29LWyrVaV0ZkNFQYH5BMmbLxEiD5v8IeMfuYdIwc4Gt0wCznrBYc87+dj+
         /H0rxfEyFfrPjlW3mbPe+Gc2An9A8wjDzAmnp6sOquULFy+kDvR7gEsB0DSwZ3Ey6L0J
         zwJQ==
X-Gm-Message-State: AOJu0YzwKFVkbzztAvX6PVD+ZaLppaSn76NQs2taoX5OAq4rwHzWz/tz
	zXVN4t0fOqtJy85IhKbK3WYbDuEy6/SR/RzcHOhsXM56KbYakehvnAZMa8T5XVGEpYFR5dKPJvg
	fE+z5cEyCk9LfxDko7BPtUxy5FDNxh2k=
X-Gm-Gg: AY/fxX4iJ3GandPAOcRPcvbQl03v10GFvF4FUWnRXmEE0Sro7sxYuNauw1YrTqB1ZNx
	uSw8t/qQiB9rykJtHwMoNK0tWN8HOZK57t8JUKIw1kkQTaw1XO2d05HUU3gosu++Gvej+h7rNqt
	zsXkMwEauaHWtyncPk+UG1D6kDQtLW/5JBMnBYCXhRHoRM8v/dBUIwhSBUFSvGNdDrC+MWr0S7c
	To3ZFHtEP8XFfLqIAqRXREGvQCWDjNr5t2eSLERvEny+QLr4LXxR6oj1mbgv01EBX59oJPOXyts
	ZClwIdRMzf6mkV49IMINcA4RKkeFW9Xc30lvn19udu5vHQpSDTPUao8x3ulLNmP2C+3ttALvDNC
	H7z7WAqjBtPmYNFA/wQDIajLl73YRxOYe4ExShNkEYfjoaqk=
X-Google-Smtp-Source: AGHT+IGl2G+5bv0VUFhkCcaDs445y1+PpmJQVZ7OKYLVw49NylZcly+fNiDTJYsUsrq9kXk8zGhva4Zgn+Dr/eWxvK8=
X-Received: by 2002:a05:690e:4085:b0:645:5297:3e65 with SMTP id
 956f58d0204a3-64716b35ea6mr15844610d50.11.1768235143117; Mon, 12 Jan 2026
 08:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20251230064832.2257911-1-raj.khem@gmail.com> <03D1C411-B650-46E3-9644-7FDB94DF8CBC@arm.com>
In-Reply-To: <03D1C411-B650-46E3-9644-7FDB94DF8CBC@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jan 2026 08:25:31 -0800
X-Gm-Features: AZwV_QiSoBTHZjp-zI8km9UbqH6_O4kibX9VQ2PB6idmyireMjNfFJNGSg-3hyw
Message-ID: <CAMKF1spRcwtF9nCm=HzhEQmivQZC5xZhCYM3bwnJrD1feU2tnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] toolchain/classes: Add lld-native dependency
 when using lld as system linker
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000095c0c906483353ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229216

--00000000000095c0c906483353ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 8:18=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

>
>
> > On 30 Dec 2025, at 06:48, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > This was not an issue before lld split from clang, but now its an
> independent
> > recipe and needs to be brought into dependency chain, otherwise clang
> fails to
> > build with -flto as it does not find gold or lld plugins.
>
> Conditional python in a very core variable like this isn=E2=80=99t ideal,=
 and the
> clang-cross recipe already has this dependency. Is that not sufficient, o=
r
> is there some edge case where that dependency isn=E2=80=99t enough?


Yeah I am also troubled by this. It shows up when enabling LTO since gold
linker is gone clang would work with LLD but it does not find it in rootfs
I will dig recipe that shows it but generally I think clang expects lld
when lto is enabled. Cross clang would pull it into its own build but not
into systoots its building packages in somehow


>
> Ross

--00000000000095c0c906483353ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 12, 2026 at 8:18=E2=80=AFAM=
 Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; On 30 Dec 2025, at 06:48, Khem Raj via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; This was not an issue before lld split from clang, but now its an inde=
pendent<br>
&gt; recipe and needs to be brought into dependency chain, otherwise clang =
fails to<br>
&gt; build with -flto as it does not find gold or lld plugins.<br>
<br>
Conditional python in a very core variable like this isn=E2=80=99t ideal, a=
nd the clang-cross recipe already has this dependency. Is that not sufficie=
nt, or=C2=A0 is there some edge case where that dependency isn=E2=80=99t en=
ough?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah I am a=
lso troubled by this. It shows up when enabling LTO since gold linker is go=
ne clang would work with LLD but it does not find it in rootfs I will dig r=
ecipe that shows it but generally I think clang expects lld when lto is ena=
bled. Cross clang would pull it into its own build but not into systoots it=
s building packages in somehow=C2=A0</div><div dir=3D"auto"><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Ross</blockquote></div></div>

--00000000000095c0c906483353ab--

