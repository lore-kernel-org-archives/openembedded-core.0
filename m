Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6A8C44512
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 02:30:04 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5429.1784255398796892249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 19:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WurGhYxV;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81e69a2db34so19095507b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 19:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784255398; cv=none;
        d=google.com; s=arc-20260327;
        b=T1IrvuIFCiCU1NJ/Ur/8DPVVsEu24zCUWahGi34+dwC6IPgeZKldjB3UcgF8XCEgY5
         /vSlwGcTXzM9QY3QzME2XcsYjnqpqlnoFRn/CQOG7tzFPcEdnoPXTF/4ziJUNj5zPPFR
         M9jHNUeBlpnO2eEz5+ARHOcJiMMraKB0ckLXTdk0/WmIoIbYaMpilmahL7euE2xgv2aZ
         lh31/wd5VS8Bs+0MyGYfsXhp5/X2r2YqeHLvg3mpvpTiiDdVH0FSpI32DD4j2xCPp++J
         vYmq82SeDh78cpaA+fXGo6VuU4xfFRS6cQP8ClvrzSm7JtHiG+EW3osnJ3kP+BXNT5RJ
         ozHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zIP3Jpo+5m6R15gFFY5OOkw2saofKhWnC2zZhNz0va0=;
        fh=iLKbi4EtRTLXj0PDlEuSSUEfvrkxWxR6BFalA3Tc2xg=;
        b=V5AjC4iGwjAEcYZITIysM5QLfkxDwB6bUciLHTWvbkVutBW66x9dkcnqRP/k+hjp2Y
         +pvHBNeKSFn74MBSxtxG051P9SfZuAH7HqELjrUVNcu2PtkKbGLTH+XRYmtsbTBiIWwd
         TMhE+ZHBZMB+3WPKaZMXHxsi9KrXGhWfFYkHz/nu0ELB9/Ite9xq6E1wYzL1jKmoBEzd
         1p8GjlqFEo7GqqWReiK6VGw3wtiuSxdypD69zOH+g3mc5H49+AKxIiipfRBFdaYRc0/u
         vHGmnfQEZZrRnN9ywBnUK3HRbQySDrewUoYgB50BHfupakUzMqPD65TwBPJCKHW8WER1
         3Wyg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784255398; x=1784860198; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIP3Jpo+5m6R15gFFY5OOkw2saofKhWnC2zZhNz0va0=;
        b=WurGhYxVi+C6/XvsaMBorWIVkEWg2ylt+kq27YMbXGs05pqzDFl3Kdb2gPr/Vapb7B
         0mrhQ1T67TN6tAVcDJpnkJZQ85CpeVQf8+hZN5WjrRo1X4z6oUZ1htYwVkARocS2ac6j
         paQ3fyrCY9T0tub0jgbyosFETvauYxHRwP6x2spfS4hvRduHdaD562ziS/EjoKzZ3C8r
         yE/JGabhuBvCzEbxZY3gZmqfrI/8dQ4zGFE0k+fqlVxsWZesG6mX9LFjEUDHRGI1g4rs
         P6vhyXgQAcTWw0TtbiwO6Wk3iJTJFqGHT8hxxOQxbgdpNm6tQoeSQjRjKp5HzKQhNTFY
         mmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784255398; x=1784860198;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zIP3Jpo+5m6R15gFFY5OOkw2saofKhWnC2zZhNz0va0=;
        b=RDXAx4Qm5PF7QpvuNLYkfgfd1tlXL0U02eFKKg6R4O50NtLlxcTly0qtAVWDl1iT6B
         49YUMMSonFqOcvdfDlx8pNfoZiToGBkX8df2hMkcWSFIpntFApSizQJnQW9MCk1evkND
         PZ2I3OOMzrE/dQr/YbPT74jhJizD23X88Cmja80FZ1ZJRv5nn3cfn+I820VqAoDZBpyI
         O2AaN4zAZV/23oQBEtxwOjHhKJKo21p7ejmUUZJbcJEjX9OAo+CADGxBIoSSr7ZhBKd5
         GM3268G6XT7I0YUQsdDPnagM8LbnbBR5JCkzgXiCkBlV9n4I5FQsTWci1rJoBvRRxPDf
         Yedg==
X-Gm-Message-State: AOJu0YzZ8nqsNy+JxcK+TSQvRFDVCQ2agcMrQefm8ZqqLIKuW5Bbpa0S
	6sg20cZZyRyY6c+M7S8sL9r8B4JnVoTwxGEGdEMxIRXij2snP9nEOL/+U7ponkUAd+V/aOMRE78
	ikNRqlrelUfYALXiUF+o9T7jV9uq90UVuLA==
X-Gm-Gg: AfdE7cmPVepe7hY6N81WYkIQnsd4iooplHqq9OwSVg9Q7959J0mC6YazJ0Xu2mkMgMz
	nggXcSWLKb7avooWTglIrkHVwgoAgPq4rxIw3htxWrIa988102o2LdJUKALVOYxs0gvPHxxT0er
	+EV+72RMqZv+eNVV9aTUfqd9xhaapYX2/BJ3cjXv5gKeLsKnP6nw0Wp0f4GrWaphyetcPG9uCGe
	b8l0TZlb4u29p6fOdRJZmjUxiFQhQ8TIrigh9xd4H9zjF2YGLKstK29uxUduWzAqDN+W9JkP/JA
	Oe4qjy4WhMa6I628RjtOZ22sz5omfhOF+5eygMCQwOWIeAiZaQF5XKMXT4fuP/pypXDMzYumke2
	LhZug2J456lMZyV7J05I8MbGpzIKAc/1PxPfPA2q0T+hVQCSoCjoE8Ncd80zVvbYkQkWLL0t01L
	IYQYQeJO1G4nitPEa5lW2mBqdQi9Es
X-Received: by 2002:a05:690c:c4cc:b0:814:3d8f:7ae3 with SMTP id
 00721157ae682-81ef28589bemr1124317b3.39.1784255397651; Thu, 16 Jul 2026
 19:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260715140507.2329605-1-ross.burton@arm.com> <20260715140507.2329605-4-ross.burton@arm.com>
In-Reply-To: <20260715140507.2329605-4-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Jul 2026 19:29:46 -0700
X-Gm-Features: AUfX_mxyB0NBBoVB6jbay9hXI5cw8zot1HvW3WzsoCZDc1_Qz2sbTD7Ky7zYKQs
Message-ID: <CAMKF1soJNFHLg3ChGnfT7DHNdR8XF9WeTrHqLVxY5e48a_Q4Eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/12] patchelf: build with meson
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002a6a410656c555e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241113

--0000000000002a6a410656c555e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

README "Compiling and Testing" documents them in order: Autotools first,
then CMake, then Meson. It seems meson is still work in progress
E.g. tests support is TODO I wonder if its too early for distros to use it

On Wed, Jul 15, 2026, 7:05=E2=80=AFAM Ross Burton via lists.openembedded.or=
g
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Upstream has meson support, so use it.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/patchelf/patchelf_git.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/patchelf/patchelf_git.bb
> b/meta/recipes-devtools/patchelf/patchelf_git.bb
> index 6c88da1b098..adc1198937d 100644
> --- a/meta/recipes-devtools/patchelf/patchelf_git.bb
> +++ b/meta/recipes-devtools/patchelf/patchelf_git.bb
> @@ -4,15 +4,14 @@ HOMEPAGE =3D "https://github.com/NixOS/patchelf"
>
>  LICENSE =3D "GPL-3.0-only"
>
> -SRC_URI =3D "git://github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dm=
aster \
> -"
> +SRC_URI =3D "git://github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dm=
aster"
>  SRCREV =3D "7688b17c18d16f67fa8d5a82a2404c2e3a18648d"
>
>  PV =3D "0.19.1"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e"
>
> -inherit autotools
> +inherit meson
>
>  PACKAGES +=3D "${PN}-zsh-completion"
>  FILES:${PN}-zsh-completion =3D "${datadir}/zsh"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240963):
> https://lists.openembedded.org/g/openembedded-core/message/240963
> Mute This Topic: https://lists.openembedded.org/mt/120281290/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002a6a410656c555e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">README &quot;Compiling and Testing&quot; documents them i=
n order: Autotools first, then CMake, then Meson. It seems meson is still w=
ork in=C2=A0progress<div dir=3D"auto">E.g. tests support is TODO I wonder i=
f its too early for distros to use it=C2=A0</div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Jul 15, 2026, 7:05=E2=80=AFAM Ross Burton via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"ma=
ilto:arm.com@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upstream=
 has meson support, so use it.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/patchelf/<a href=3D"http://patchelf_git.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">patchelf_git.bb</a> | 5 ++---<=
br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/patchelf/<a href=3D"http://patchelf_git.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">patchelf_git.bb</a> b/m=
eta/recipes-devtools/patchelf/<a href=3D"http://patchelf_git.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">patchelf_git.bb</a><br>
index 6c88da1b098..adc1198937d 100644<br>
--- a/meta/recipes-devtools/patchelf/<a href=3D"http://patchelf_git.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">patchelf_git.bb</a><br>
+++ b/meta/recipes-devtools/patchelf/<a href=3D"http://patchelf_git.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">patchelf_git.bb</a><br>
@@ -4,15 +4,14 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/NixOS/pa=
tchelf" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
NixOS/patchelf</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;GPL-3.0-only&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/NixOS/patchelf;protoc=
ol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dmaster</a> \<br>
-&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/NixOS/patchelf;protoc=
ol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>github.com/NixOS/patchelf;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
=C2=A0SRCREV =3D &quot;7688b17c18d16f67fa8d5a82a2404c2e3a18648d&quot;<br>
<br>
=C2=A0PV =3D &quot;0.19.1&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc678957b0c8e964aa6c70=
fd77641a71e&quot;<br>
<br>
-inherit autotools<br>
+inherit meson<br>
<br>
=C2=A0PACKAGES +=3D &quot;${PN}-zsh-completion&quot;<br>
=C2=A0FILES:${PN}-zsh-completion =3D &quot;${datadir}/zsh&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240963): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240963" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/240963</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120281290/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120281290/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002a6a410656c555e1--

