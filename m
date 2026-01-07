Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1D6CF6BE9
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 03:29:52 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7652.1767756583382686659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 19:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gZ+dNMUz;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64472ea7d18so1141930d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 19:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767756582; x=1768361382; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vFX5IzOq96ZlT3fZR/CS24gR929kzL7uDfl/4at5Jkw=;
        b=gZ+dNMUzIGynfUoRbhh6+9EVI8eVrkxmEX8psKKcAjEZJGKnZBtsGneRAd0BYQsyn6
         ZFshkpSGlwKl6Wbt50N9R82cXhUyP4v0aT9CzHM+owdst/lsiYfleE0eOloOVB6SfRBa
         zp3YJ80SV2DzeheIr9ajembmUckzL7/Uaz2BT8C3z7wY3vrVTlMhCUSN3UG2tbUm9N8S
         2smrU/aRhxS0Ua9P9k7y/yyywf4ouY004hL2/wezdWewpZqdNPq9pP2qLeE5q29+OQ3q
         TdN6h8kx9KQvWDzcCHWCIJ+ByQ3grVEdoNVGzcsvL3VS1FuFvBp9uPSDdj8gf5/TrO1z
         EK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767756582; x=1768361382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFX5IzOq96ZlT3fZR/CS24gR929kzL7uDfl/4at5Jkw=;
        b=bGWbQdRH5fNnAb92FgT7O/BMSPJpHS7k1a9Rd6sJIM1nHRTgWbVkgZw6FyU99cHVJE
         qTUnRYQbcgT49svpHrLQ1ViF5J8lDvSQYK3zPgTmxrlMYuKGNPSZAAWt0Wes+aeWZTYC
         zw4MWEtfvvvA4mxle4+zb8TGhwGD2RjpjWw6epZRmnFsZ267PCNbdCWfODDfph70ZOtE
         D5LG794Z/s3naSMg34JFERA/qwtg3zNw16FlhCNciKoBDprXC1CHfIvBZM9OB4bJllLN
         eTwjzdFyJ+G3A++8wxpnjvPqyhKmQx5jIaNcdfl3nJiljiqC8ogaIR3tSXGtCzbFRXgK
         Qs8w==
X-Forwarded-Encrypted: i=1; AJvYcCVqjbnyQIRk9idoM7PadobQiGbr3kDN2mDxiL0fK6ra58/zH+w3yKg6cdKeo3G4GKfv6GCVozTlqEmhIXEnm35o8A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzj3xiwfY4KaU0Wn9iRr53Wy01OYheOU/rzmRBS947rUaNwJSa1
	tGfPtRDOaeF/gZ2IjdxyknsyCtMOlyYEJuVJhO5zDOkz9AGR8tE+bWWm8vYnMosCTblTWfTBPOH
	iRs8OX61FyxjHPqFVA/3Bmg3oHr4BfkM=
X-Gm-Gg: AY/fxX5PREes1R67/Yt56oWt/5osjFYt9XuJuT4vx/VBtWF/c50O4D4fuDljzsssQhO
	13kAklpsjD5V5MuvUJkib5Iqg9S8jpGv541FL6V5KMC6erEb0nXu865wTdvvOsk8kAXggGEwKqB
	+zkTRZqPvqxHoFcEG0wbxQ8AnYXX6Eo/Cjg5qVeJOyRRqqfXGF+x4JKaTduk79jBtEJZbxVfAqb
	myLhnPqlJ0YVs7AZdypzvCdMSdf5yegdDOLCF7kLH4LQMkuA5hsjNhoJEwoRGoQhqfJ7YZibsla
	WpfgzScKzgHq2m4p6geoAHiWGR9ilhs8FRsiC3YjnImVEMTtcs3bSPH+XbTaqQGkBGrpCwrGrnM
	Xsiax7gIVpJbZJ/wUEgRI9gjCGt8bnaITcS8es7taSVu9Kw==
X-Google-Smtp-Source: AGHT+IEM/XsswYLqZsOGuwgW8To/Ze9dBFi+nnYVcGo9Yc97tImUk2ANrONaNL+rumm8Fq5gQYQP2+dTQTR1BReX76U=
X-Received: by 2002:a05:690e:134c:b0:640:dd02:a777 with SMTP id
 956f58d0204a3-64716c13555mr1076007d50.69.1767756582265; Tue, 06 Jan 2026
 19:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20260106221016.3504565-1-thomas.perrot@bootlin.com> <CADySD0GKQiq_jM=M57_A-6cwe-=xd8bukZH_3p1AzhuWLrmQfA@mail.gmail.com>
In-Reply-To: <CADySD0GKQiq_jM=M57_A-6cwe-=xd8bukZH_3p1AzhuWLrmQfA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jan 2026 19:29:30 -0800
X-Gm-Features: AQt7F2oxcJpAbMo-YYot0Qw5I1Uh3A1RrItya7zjHK9n10t2oNkhVtPykv469WQ
Message-ID: <CAMKF1sqQWFBJdyYTsVLU7iQiaGrQF4ebGue0Q2+=wxtx_JdWEA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.8
To: ankur.tyagi85@gmail.com
Cc: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="00000000000022a7120647c3e7dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 03:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228942

--00000000000022a7120647c3e7dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 2:30=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> On Wed, Jan 7, 2026 at 11:12=E2=80=AFAM Thomas Perrot via
> lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >
> > This release has:
> > - Safe and reverse list iteration
> > - Stack protector support
> > - Allocate heap housekeeping nodes dynamically
> > - IPI device ratings
> > - Andes QiLai SoC support
> > - SpacemiT K1 SoC support
> > - ESWIN Computing EIC7700 SoC support
> > - Moved Ariane and Openpiton to generic platform
> > - SiFive CLINT v2 support
> > - Simple FDT based cache library
> > - SiFive PL2 cache controller driver
> > - SiFive Extensible Cache (EC) driver
> > - SiFive TMC0 based HSM driver
> > - SiFive SMC0 based system suspend driver
> > - MPXY RPMI mailbox driver for voltage service group
> > - MPXY RPMI mailbox driver for device power service group
> > - MPXY RPMI mailbox driver for performance service group
> > - HART protection abstraction
> >
> > Overall, this release has various domain related improvements and
> > also adds multiple platform support.
> >
> > Also switch Qemu -cpu parameter to rv64 because rva23s64 and rva22s64
> > profiles lack PMP entries, causing hart isolation configuration to fail
> [1].
> >
> > [1]
> https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg00048.html
> >


Is this change temporary ? This change to rva23 is intentional and we want
to continue to use it so we can use rvv 1.0 switching back in a less than
ideal
Can you explore more



> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> >  meta/conf/machine/include/riscv/qemuriscv.inc               | 2 +-
> >  meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb}
> (97%)
> >
> > diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc
> b/meta/conf/machine/include/riscv/qemuriscv.inc
> > index b755d32c9d1a..45fcf36e62d9 100644
> > --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> > +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> > @@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
> >  # qemuboot options
> >  QB_SMP ?=3D "-smp 4"
> >  QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> > -QB_CPU:riscv64 ?=3D "-cpu rva23s64"
> > +QB_CPU:riscv64 ?=3D "-cpu rv64"
> >  QB_MACHINE =3D "-machine virt"
> >  QB_DEFAULT_BIOS =3D "fw_jump.elf"
> >  QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downs=
cript=3Dno"
> > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > similarity index 97%
> > rename from meta/recipes-bsp/opensbi/opensbi_1.7.bb
> > rename to meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > index a460062e9398..f2d3e9f20082 100644
> > --- a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> > +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > @@ -8,7 +8,7 @@ require opensbi-payloads.inc
> >
> >  inherit deploy
> >
> > -SRCREV =3D "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
> > +SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
> >  SRC_URI =3D "git://
> github.com/riscv/opensbi.git;branch=3Dmaster;protocol=3Dhttps"
>
> Can you please also try including tag=3Dv${PV} in the SRC_URI ?
>
> >  TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
> > --
> > 2.52.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228936):
> https://lists.openembedded.org/g/openembedded-core/message/228936
> Mute This Topic: https://lists.openembedded.org/mt/117115594/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000022a7120647c3e7dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, 2026 at 2:30=E2=80=AFPM =
Ankur Tyagi via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)">On Wed, Jan 7, 2026 at 11:12=E2=80=AFAM Thomas Perrot via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;thomas.perrot=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org" t=
arget=3D"_blank">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com" t=
arget=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt;<br>
&gt; This release has:<br>
&gt; - Safe and reverse list iteration<br>
&gt; - Stack protector support<br>
&gt; - Allocate heap housekeeping nodes dynamically<br>
&gt; - IPI device ratings<br>
&gt; - Andes QiLai SoC support<br>
&gt; - SpacemiT K1 SoC support<br>
&gt; - ESWIN Computing EIC7700 SoC support<br>
&gt; - Moved Ariane and Openpiton to generic platform<br>
&gt; - SiFive CLINT v2 support<br>
&gt; - Simple FDT based cache library<br>
&gt; - SiFive PL2 cache controller driver<br>
&gt; - SiFive Extensible Cache (EC) driver<br>
&gt; - SiFive TMC0 based HSM driver<br>
&gt; - SiFive SMC0 based system suspend driver<br>
&gt; - MPXY RPMI mailbox driver for voltage service group<br>
&gt; - MPXY RPMI mailbox driver for device power service group<br>
&gt; - MPXY RPMI mailbox driver for performance service group<br>
&gt; - HART protection abstraction<br>
&gt;<br>
&gt; Overall, this release has various domain related improvements and<br>
&gt; also adds multiple platform support.<br>
&gt;<br>
&gt; Also switch Qemu -cpu parameter to rv64 because rva23s64 and rva22s64<=
br>
&gt; profiles lack PMP entries, causing hart isolation configuration to fai=
l [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://lists.nongnu.org/archive/html/qemu-riscv/2026-0=
1/msg00048.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.=
org/archive/html/qemu-riscv/2026-01/msg00048.html</a><br>
&gt;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Is this chan=
ge temporary ? This change to rva23 is intentional and we want to continue =
to use it so we can use rvv 1.0 switching back in a less than ideal=C2=A0</=
div><div dir=3D"auto">Can you explore more=C2=A0</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootl=
in.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/machine/include/riscv/qemuriscv.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta/recipes-bsp/opensbi/{<a href=3D"http://opensbi_1.7.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.7.bb</a> =3D&gt; <a href=3D"htt=
p://opensbi_1.8.bb" rel=3D"noreferrer" target=3D"_blank">opensbi_1.8.bb</a>=
} | 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-bsp/opensbi/{<a href=3D"http://opensbi_1.7.b=
b" rel=3D"noreferrer" target=3D"_blank">opensbi_1.7.bb</a> =3D&gt; <a href=
=3D"http://opensbi_1.8.bb" rel=3D"noreferrer" target=3D"_blank">opensbi_1.8=
.bb</a>} (97%)<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf=
/machine/include/riscv/qemuriscv.inc<br>
&gt; index b755d32c9d1a..45fcf36e62d9 100644<br>
&gt; --- a/meta/conf/machine/include/riscv/qemuriscv.inc<br>
&gt; +++ b/meta/conf/machine/include/riscv/qemuriscv.inc<br>
&gt; @@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D &quot;0x80200000&quot;<=
br>
&gt;=C2=A0 # qemuboot options<br>
&gt;=C2=A0 QB_SMP ?=3D &quot;-smp 4&quot;<br>
&gt;=C2=A0 QB_KERNEL_CMDLINE_APPEND =3D &quot;earlycon=3Dsbi&quot;<br>
&gt; -QB_CPU:riscv64 ?=3D &quot;-cpu rva23s64&quot;<br>
&gt; +QB_CPU:riscv64 ?=3D &quot;-cpu rv64&quot;<br>
&gt;=C2=A0 QB_MACHINE =3D &quot;-machine virt&quot;<br>
&gt;=C2=A0 QB_DEFAULT_BIOS =3D &quot;fw_jump.elf&quot;<br>
&gt;=C2=A0 QB_TAP_OPT =3D &quot;-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=
=3Dno,downscript=3Dno&quot;<br>
&gt; diff --git a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.7.bb=
" rel=3D"noreferrer" target=3D"_blank">opensbi_1.7.bb</a> b/meta/recipes-bs=
p/opensbi/<a href=3D"http://opensbi_1.8.bb" rel=3D"noreferrer" target=3D"_b=
lank">opensbi_1.8.bb</a><br>
&gt; similarity index 97%<br>
&gt; rename from meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">opensbi_1.7.bb</a><br>
&gt; rename to meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.bb" r=
el=3D"noreferrer" target=3D"_blank">opensbi_1.8.bb</a><br>
&gt; index a460062e9398..f2d3e9f20082 100644<br>
&gt; --- a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.7.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.7.bb</a><br>
&gt; +++ b/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.8.bb</a><br>
&gt; @@ -8,7 +8,7 @@ require opensbi-payloads.inc<br>
&gt;<br>
&gt;=C2=A0 inherit deploy<br>
&gt;<br>
&gt; -SRCREV =3D &quot;a32a91069119e7a5aa31e6bc51d5e00860be3d80&quot;<br>
&gt; +SRCREV =3D &quot;e7fa66c2160ec139de1853a00f669c09320a9256&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/riscv/opens=
bi.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">github.com/riscv/opensbi.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<=
br>
<br>
Can you please also try including tag=3Dv${PV} in the SRC_URI ?<br>
<br>
&gt;=C2=A0 TARGET_DBGSRC_DIR =3D &quot;/share/opensbi/*/generic/firmware/&q=
uot;<br>
&gt; --<br>
&gt; 2.52.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228936): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228936" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228936</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117115594/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117115594/1997914</a><br>
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

--00000000000022a7120647c3e7dc--

