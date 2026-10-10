Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B988DCA9EC5
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 22:01:02 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17331.1791669656650679781
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2026 15:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M/2hm4Up;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67718201466so449996d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 15:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791669656; cv=none;
        d=google.com; s=arc-20260327;
        b=HW/zOJZIwj4JTkDIn+AMa/aSl3ooysEplDeqDYGT8O54geCYMcMQgd8xF83tVzVXWy
         chjd1hCjwdBYYYqrfHooFVXCOOcD7EfVGWKKSD4aPd3IiJSUet+oXZHrGWeRlC0DDmjW
         y+IOEeq7WlX8XFZIeyJE+3uX0WJTT03aOmP5R3NxrZ2aJd3/VO7361yDQHnjdoGCUUb4
         /rMZTCYQ5z4UwPGbin6bycURo37SxalRwVK6JpEzqfat+0wx0VlvSS1ouFsBtIBXZyBS
         Ai66lmLRZZmHmTQwbrcXpQMc8MZ1AGD/r8K5Top60Yo9m5V+LN2cXNvQAZNDbDnEH2E1
         Hfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9FVRTThVd8HjfLXqBbbSUcCsJ98Ki4jjK9ZtlVm+rUA=;
        fh=2xdA28mwox/TgWPx/kDxWnZtV+esHH2tBoOHJo78oCo=;
        b=fcW/MeiBKYl7MWOJj47IyLU6sHKo799K/yPXJ1zeMz5IEj/CGn/ug4o/WJov9tgk6t
         shX5J3yDxZxOjBqGhxs8cKHdW0vNOOzj2YFlinsS/EqiMcMR370cZzWJQgVGtozaM3G6
         vraCbES58C6THEZ1RYM413juCqqdY5jXmz7KMJ1xY8T45oVjfjZ7ohF/p22T4bMxTybC
         MDi2HbPnXHtjn/npms9tIlBDK+Tm5AUpPyWOx7ovyu+Ivho1DXLZW3CFmGCKhotbhLVp
         VI5vSfmGyGCbBhDknGkHA/80lUxAnWfjNBtSrNZ0Mzz8/OmyYHgI91xJTFlsLY5ej/DK
         fveA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791669656; x=1792274456; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FVRTThVd8HjfLXqBbbSUcCsJ98Ki4jjK9ZtlVm+rUA=;
        b=M/2hm4UpiFAUQq62GvmLv+3ah+FfUoosqlU6Ak2Gnfwcc+ucs2kLrwn1DL//DMwzeF
         TyK78uDvcLxQ6AvQlSR7Vlgp5/kT+QsTuaN4CMpSBxeD12zMEBvazGYq7oA9BnRALvAk
         nnqVjxFDWnhTNlAxRGjWXV83w7Bd+PDH8o4FxR1iyDISddlVUMxj0g0WDe8JzxKkXJ8U
         H7OcMdZEk5ekZRe/nyMVY9EIzhHX53O5b9z6s9vOgvvtuD70m69tYR9gVpY/mN6Yf3K1
         OUVHHX9zpEO2wGnCQyZY7cPd3y6qCJnXEqbrMhVh4yLXcqFCZ8y88MI3lkpy655t+qxO
         vJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791669656; x=1792274456;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9FVRTThVd8HjfLXqBbbSUcCsJ98Ki4jjK9ZtlVm+rUA=;
        b=HcZuhv9OHBOi+VxiR+6P3+LMpvp5tByonbc8Zk1QAutsSz8Lr6FrpHt5hyG7aHpaUD
         DlByUlKSmzmH5Sh2zEQ4oParTe9PTWytykhuc2Xdp45PD+qWChAx7Hy1M2oqwCHNpQsf
         xsISShhbAlWlzEr96T1wL9xRP9JoMqG6NI8Y1oKbbbS9PcMMbOdv9LNd7d75rfzgbSc1
         FBKEUri6mN6ViQNAqt14zFURnEzZ6Mw2rudcev1oTtGsRofYdfl5FNnND6oy7qA099jP
         ap7po06CdHlL+5+JKJxNm+chnQIDXEcEy5SNsQkl3Xn7RIH40JMUMwfmwI2nh/paqWl3
         C/Rw==
X-Gm-Message-State: AFq9FYImKSDh/OoMuz4lMTmKEpHRxYKTWwUwJUm9FHOtNtD4rNQzd+Ll
	uDfj5guVuzNyg2hrLubcjd5wQXe6OHeehyYWz+ZlX6yEnNijYWRWCDNL441Tgdu1/PTxdedzLyH
	sklJ0PBS4XStT+dS+S1zrkuKnOYdqrlE=
X-Gm-Gg: AYBFou3OY4SjgQ/Cu8jbvagwAc9egLEMR9qXQmI28peMe1nRBZsrnq608N5RQGfjYSm
	l5GO8NIo0Ge0OIkDjJVXkP8Joe8nc9pGgOXad9JydwBWyiR7VMJQ69cXagt4+cWg0vQV/Lx+6j5
	VyZq7x/tC9mwIyamb9ux/BVvqq+0MJDbr1UShO/NXrt3AkLcN+aB9BI/ucKmVXrQBmdn/jDcmWG
	OyQTzRzoDcJbnJ49FtzvDnV8sDweNH7+ow5T5Bwv7ZtUrYd4b/09vE7IlMIoS+SyKl5CcWV5+CG
	zu12lF4PrXlbTRV7O0fFDMrERk932oBYKmp1qwVqe7Gno02M8b1OPMRPHM3d8dJmdOTYmAhJp/S
	MWElGotfHyf+LKJIvzKxkaPvabPw/wE6y1pOu8KvdKMwMhHEpq/i+TIlz2G0zalFech9vAkd9Ej
	g3naVn4Z8DbY8UnrLqS6o0IqQRuAKUDLElEgHCGIno+NpCUK0SdXtVTkKNh3CUYp1Uyg02DRpBx
	V4+KhqHm+POUn2FJHlVXE+hb0TTVZPLofvn42eaCP5tpt/PdKvnsnD+sAt064ckRLfexwbUZVDE
	BH8rfC0=
X-Received: by 2002:a05:690e:bc4:b0:66d:1877:121b with SMTP id
 956f58d0204a3-67936984466mr2172039d50.32.1791669655596; Sat, 10 Oct 2026
 15:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1791224526.git.marcel.ziswiler@codethink.co.uk> <51ce6c98f2f466092ba077da44f0232bbcc16366.camel@ziswiler.com>
In-Reply-To: <51ce6c98f2f466092ba077da44f0232bbcc16366.camel@ziswiler.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Oct 2026 15:00:29 -0700
X-Gm-Features: AclHuK_ZVrqVcvOFgrEmOQ1zGyuRrCVQl3teA9QvsFLpuuL9Ng2roNHeoU4LNYM
Message-ID: <CAMKF1sp_VNWppn=cDfFOh=DTSkeB_iJ0ZmmWqFc64+tTSmJ_Xw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] mesa 26.2.4 upgrade and gallivm llvm 23
 build fix
To: marcel@ziswiler.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Zoltan Boszormenyi <zboszor@gmail.com>, 
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>, 
	Antoine Gouby <antoine.gouby@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000607578065d839948"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 22:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247502

--000000000000607578065d839948
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 1:00=E2=80=AFPM Marcel Ziswiler via lists.openembed=
ded.org
<marcel=3Dziswiler.com@lists.openembedded.org> wrote:

> On Mon, 2026-10-05 at 20:36 +0200, Marcel Ziswiler wrote:
> > This series upgrades mesa to 26.2.4 and fixes a gallivm llvm 23 build
> issue.
> >
> > Build tested on x86_64 and run tested on LicheePi 4A.
>
> Any comments anybody? Thanks!
>

Looks ok. Its already staged in
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmathieu/mas=
ter-next


>
> Cheers
>
> Marcel
>
> > Marcel Ziswiler (2):
> >   mesa,mesa-tools-native: upgrade 26.2.3 -> 26.2.4
> >   mesa: gallivm llvm 23 build fix
> >
> >  ...uiltin_cpu_supports-for-avx2-detecti.patch |  2 +-
> >  ...on-t-encode-build-path-into-binaries.patch |  2 +-
> >  ...gallivm-adapt-for-JITLink-in-LLVM-23.patch | 51 +++++++++++++++++++
> >  ...sdetects-64bit-atomics-on-mips-clang.patch |  2 +-
> >  ...er-jay-jay_ir.h-do-not-used-typed-en.patch |  2 +-
> >  ...c-do-not-use-arm-fpu-instructions-if.patch |  2 +-
> >  meta/recipes-graphics/mesa/mesa.inc           |  5 +-
> >  7 files changed, 59 insertions(+), 7 deletions(-)
> >  create mode 100644
> meta/recipes-graphics/mesa/files/0001-gallivm-adapt-for-JITLink-in-LLVM-2=
3.patch
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#247500):
> https://lists.openembedded.org/g/openembedded-core/message/247500
> Mute This Topic: https://lists.openembedded.org/mt/121599185/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000607578065d839948
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 10,=
 2026 at 1:00=E2=80=AFPM Marcel Ziswiler via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;marcel=3D<a href=3D"mailto:ziswi=
ler.com@lists.openembedded.org">ziswiler.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
2026-10-05 at 20:36 +0200, Marcel Ziswiler wrote:<br>
&gt; This series upgrades mesa to 26.2.4 and fixes a gallivm llvm 23 build =
issue.<br>
&gt; <br>
&gt; Build tested on x86_64 and run tested on LicheePi 4A.<br>
<br>
Any comments anybody? Thanks!<br></blockquote><div><br></div><div>Looks ok.=
 Its already staged in=C2=A0<a href=3D"https://git.openembedded.org/openemb=
edded-core-contrib/log/?h=3Dmathieu/master-next">https://git.openembedded.o=
rg/openembedded-core-contrib/log/?h=3Dmathieu/master-next</a></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers<br>
<br>
Marcel<br>
<br>
&gt; Marcel Ziswiler (2):<br>
&gt; =C2=A0 mesa,mesa-tools-native: upgrade 26.2.3 -&gt; 26.2.4<br>
&gt; =C2=A0 mesa: gallivm llvm 23 build fix<br>
&gt; <br>
&gt; =C2=A0...uiltin_cpu_supports-for-avx2-detecti.patch |=C2=A0 2 +-<br>
&gt; =C2=A0...on-t-encode-build-path-into-binaries.patch |=C2=A0 2 +-<br>
&gt; =C2=A0...gallivm-adapt-for-JITLink-in-LLVM-23.patch | 51 +++++++++++++=
++++++<br>
&gt; =C2=A0...sdetects-64bit-atomics-on-mips-clang.patch |=C2=A0 2 +-<br>
&gt; =C2=A0...er-jay-jay_ir.h-do-not-used-typed-en.patch |=C2=A0 2 +-<br>
&gt; =C2=A0...c-do-not-use-arm-fpu-instructions-if.patch |=C2=A0 2 +-<br>
&gt; =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-<br>
&gt; =C2=A07 files changed, 59 insertions(+), 7 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm=
-adapt-for-JITLink-in-LLVM-23.patch<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#247500): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/247500" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/247500</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121599185/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121599185/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000607578065d839948--

