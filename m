Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F5CC433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 03:07:42 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web12.2870.1666408058014385964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 20:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AuRhPIbN;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-12c8312131fso5836652fac.4
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 20:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0uvcnVTH0rfEk17YOwMclGdpDJSy6zWmcXhV6GImQeU=;
        b=AuRhPIbNs7FG+E+GTf48dKUTvjo4u5aD6f/zi7JEH5Ag2loNiy4mpx2t2T+SW3T7QW
         4pe2WI1WAi/OV4IO+fPT7XzKeCO4W0eU1PmnyjCU3Kd9fZImbhv1wKEb0RsbIXUh7d0z
         ll8+fhXt4QBVLgnhbHrS4zJgyRdhfWQLdyb5P02ma4s1+tDB5iKSovBeNiBgYK1SmjIS
         84S7CKxgU0xvWhn32tMwklndQtQ3ADw9I1v6ujXtO0dKn+1Qgmw3mydxPYNXJBoaitbw
         hw4dOD/B/WIJaZGZVWiO08lTWMe7K+Ci9QgQ+ikddCvLg9bVE2NyMpJyfhG6CYwGsnb+
         6QaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uvcnVTH0rfEk17YOwMclGdpDJSy6zWmcXhV6GImQeU=;
        b=vXR1Tu4x5GTNxD7ORfQEP+Pyk2d0beDmLcfOsaKgD054H6bz2U3RH+4PkrOtTdg+3s
         uCT61JArraUTg+dSkhce0eSsptxwczNuVy4+UyUNyETmtjjpnTYv28TUcxRTNQhZ/xb7
         9xmmTtG3biIsN3dHxTJqCmBE1XVQNCWJgO74crWUT4Qfx/FnVHhSxLvmmHXlh2veKwiB
         Nt85nUgzj3poaLg064DZbjzPdqZb5UaElFX4MBZUWOjaMGqVSP3m/qtzm0Tt3RIYKY06
         dyUIni62PLP/csgbwviyIhPsv0/IW16tLn03cSCoADO8xHqzqO/5iPi1QJxoywsaddO5
         umMg==
X-Gm-Message-State: ACrzQf1wkwq4J/WmybHH1uXEe/UDMU0bHj/6Sa/IbLcXQVDyEfnPOdHT
	JFohKY1vtRuCZbpOfzcXc05z0QXPPgqkGB98xwQ=
X-Google-Smtp-Source: AMsMyM6WPHHGJBWFzOeTgnIeDxd9Xya+3X5IosjEVpjvnJrzpHsbOZ6KHxwIKNnTUN3+lSL42HT9TiS5YHCQTu7GkyY=
X-Received: by 2002:a05:6870:d1c8:b0:132:1239:2550 with SMTP id
 b8-20020a056870d1c800b0013212392550mr30288608oac.55.1666408057218; Fri, 21
 Oct 2022 20:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221021200514.1918359-1-raj.khem@gmail.com> <CANNYZj9X45DmDddF=p=4ZVkwAN5q2a8TB3ref27_rj1YiRFhYQ@mail.gmail.com>
 <CAMKF1spDPVJXLmWdz=FiG19AAgUcThRfee8JOdBXiS=EYpwW2A@mail.gmail.com> <CANNYZj8saTph1iKeu+SeQzaEVjHQNxw3Z-TsY8JXNs3FugF2WA@mail.gmail.com>
In-Reply-To: <CANNYZj8saTph1iKeu+SeQzaEVjHQNxw3Z-TsY8JXNs3FugF2WA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 20:07:26 -0700
Message-ID: <CAMKF1spc-WB976e+cVLKSf-TQir6GD+jMyHQWxu-xQXGmX8SwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004d2acd05eb96dc9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 03:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172058

--0000000000004d2acd05eb96dc9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 7:58 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

>
>
> On Fri 21. Oct 2022 at 23.49, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Fri, Oct 21, 2022 at 2:01 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > On Fri, 21 Oct 2022 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
>> > > Update the arch part of tuple to consider OE's names
>> > > for riscv32
>> >
>> > > +--- a/vendor/crossbeam-utils-0.8.8/no_atomic.rs
>> > > ++++ b/vendor/crossbeam-utils-0.8.8/no_atomic.rs
>> > > +@@ -49,6 +49,8 @@ const NO_ATOMIC_64: &[&str] =3D &[
>> > > +     "powerpc-wrs-vxworks-spe",
>> > > +     "riscv32gc-unknown-linux-gnu",
>> > > +     "riscv32gc-unknown-linux-musl",
>> > > ++    "riscv32-unknown-linux-gnu",
>> > > ++    "riscv32-unknown-linux-musl",
>> > > +     "riscv32i-unknown-none-elf",
>> > > +     "riscv32im-unknown-none-elf",
>> > > +     "riscv32imac-unknown-none-elf",
>> >
>> > No. Updating this patch with every rust upgrade is already a pain in
>> > the ass due to rust checksumming, it needs to be upstreamed in some
>> > form rather sooner than later, and you just made it worse. Please
>> > let's do a proper arch re-mapping.
>>
>> we should apply the v1 of patch and move on.
>
>
> No again. Riscv32 is already listed so it=E2=80=99s on you to use existin=
g mapping
> to use those entries, and not add new ones.
>

?
v1 is passing the needed options via cflags. No patching needed. If you
have better suggestions come up with a better patch


> Alex
>

--0000000000004d2acd05eb96dc9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 21, 2022 at 7:58 PM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)"><div dir=3D"auto"><br></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 21. Oct 2022 =
at 23.49, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto=
">On Fri, Oct 21, 2022 at 2:01 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 21 Oct 2022 at 22:05, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; Update the arch part of tuple to consider OE&#39;s names<br>
&gt; &gt; for riscv32<br>
&gt;<br>
&gt; &gt; +--- a/vendor/crossbeam-utils-0.8.8/<a href=3D"http://no_atomic.r=
s" rel=3D"noreferrer" target=3D"_blank">no_atomic.rs</a><br>
&gt; &gt; ++++ b/vendor/crossbeam-utils-0.8.8/<a href=3D"http://no_atomic.r=
s" rel=3D"noreferrer" target=3D"_blank">no_atomic.rs</a><br>
&gt; &gt; +@@ -49,6 +49,8 @@ const NO_ATOMIC_64: &amp;[&amp;str] =3D &amp;[=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;powerpc-wrs-vxworks-spe&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32gc-unknown-linux-gnu&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32gc-unknown-linux-musl&quot;,<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 &quot;riscv32-unknown-linux-gnu&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 &quot;riscv32-unknown-linux-musl&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32i-unknown-none-elf&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32im-unknown-none-elf&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0&quot;riscv32imac-unknown-none-elf&quot;,<br=
>
&gt;<br>
&gt; No. Updating this patch with every rust upgrade is already a pain in<b=
r>
&gt; the ass due to rust checksumming, it needs to be upstreamed in some<br=
>
&gt; form rather sooner than later, and you just made it worse. Please<br>
&gt; let&#39;s do a proper arch re-mapping.<br>
<br>
we should apply the v1 of patch and move on.</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">No again. Riscv32 is already listed so it=E2=80=
=99s on you to use existing mapping to use those entries, and not add new o=
nes.</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">?</div><div dir=3D"auto">v1 is passing the needed options via cflags.=
 No patching needed. If you have better suggestions come up with a better p=
atch=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><div clas=
s=3D"gmail_quote"><div dir=3D"auto"></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Alex</div></div></div>
</blockquote></div></div>

--0000000000004d2acd05eb96dc9e--

