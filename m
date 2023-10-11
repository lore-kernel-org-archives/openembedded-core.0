Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4648CCD6E64
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 12:28:01 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.15176.1697027273440414585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 05:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TFl3wh7t;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-49d39f07066so2286795e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697027272; x=1697632072; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8mni/lmRaQ18zE1U/M1cHyY0AuM2cwgXP+xxUNMXre8=;
        b=TFl3wh7tYQ+owwsc1NKXTX22Hv7kh+LUAm7ADR8DB6jSTY7Qq9zutwi2RohxY55Ipg
         OmJ2nchkLJtIlQYeXm5hTF0ybi73HSKl7Y1S7b2MnURCEQBzfF/0HbZvowRJ1wieJNCX
         yiR04MrJXvrEwtvtqFZDAYScgeD9wsArr+KZyskExBSPIOLipJsOcTZuOVQSh8YRu2bC
         /BFyVB3j4gu++XG/mcViHcop+xHneuOe1327Jvb/cdvsgF4kOj/KbeB4CqBpa8R/bHnE
         6fyboXByJySSuet3GiwbmdW+yyzHPRNyky6pBesE4wthMzm6RR1UDCkIssp34n8UZ3Ek
         bsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697027272; x=1697632072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mni/lmRaQ18zE1U/M1cHyY0AuM2cwgXP+xxUNMXre8=;
        b=hWhxQg2pcDDNMAlAjYAGXOnL3Zg3s0hwzbwKjwOKtfdbBY+ThePjH3G1QXvxOZJyJI
         cDVjiw/TL6JYQ76uGXO3uWtd+esQqM7R8rKB0k4lGYRR6ENz/oWw+FOfnzvmRmShIM8Z
         Z7MPEDaIJyUiBlOGEBsBhjLKtxZBSEHEpovhr3ZKjmn+ncX9atG2SUit+Ti07qbEHWiO
         AhI6cRfjR8WZx8Yy0ssdKYXthCjokDalAeaCFvhNaHT6fTF5Pq69FiDZtSC58wFVNhJd
         7jtqFURxHco67/PCh6crH6/FaiZt/FSCxtVkVHuABdsofhFg01OsY+lTndMQU5nAhiK5
         so3g==
X-Gm-Message-State: AOJu0YyTb6qQ6inig6WLyxZkumG20B/EVSevH+emZuFLfQPb7KHVYdvE
	+9rqGhioSYQR3cEhqx4gtMzo7hNU0VaG6i7RxkA=
X-Google-Smtp-Source: AGHT+IEFszPC6mxiS/vvBs8cbeqwDXDEPDv6y5M6U7mz8OHlKcitYMhLJ2Il9kVs4eefgL0Ax2UNN2W2/x+mgHqHiCw=
X-Received: by 2002:a1f:dfc1:0:b0:49a:56d2:562d with SMTP id
 w184-20020a1fdfc1000000b0049a56d2562dmr17587038vkg.4.1697027272433; Wed, 11
 Oct 2023 05:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com> <CAO5Uq5TK5W8SH5qO=Dc_GtVs+rL1RZNFokdkCaRxEa3nopjHjA@mail.gmail.com>
In-Reply-To: <CAO5Uq5TK5W8SH5qO=Dc_GtVs+rL1RZNFokdkCaRxEa3nopjHjA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 11 Oct 2023 14:27:41 +0200
Message-ID: <CA+cAkepxcxecGNQ6XFN2qBJH1De_0ccRSAFZ+-vHwQ2rW1SUhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org, 
	randy.macleod@windriver.com, naveen.gowda@windriver.com, 
	shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com, 
	deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com
Content-Type: multipart/alternative; boundary="000000000000bf66ef06076ff3fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 12:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188956

--000000000000bf66ef06076ff3fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

very great news to read !


On Wed, 11 Oct 2023 at 13:03, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Wed, Oct 11, 2023 at 5:06=E2=80=AFAM Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > [Yocto#14875]
> > The '--remap-path-prefix' option removes all references to build
> directory structure in the debug information within the compiled output f=
or
> Cargo dependencies and the project's binary.
> > However, some references to build directories remains in the final
> binary in .rustc section in the form of compressed metadata and this make=
s
> the build output dependent on the folder structure of the computer it's
> compiled on.
> > So, for reproducible builds, use the configuration option
> 'remap-debuginfo =3D true' along with the '--remap-path-prefix'.
> >
> > Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
> >  meta/recipes-devtools/rust/rust_1.70.0.bb    | 1 +
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> >
>
> Blimey, well done!
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188954):
> https://lists.openembedded.org/g/openembedded-core/message/188954
> Mute This Topic: https://lists.openembedded.org/mt/101890610/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bf66ef06076ff3fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">very great news to read !<div><br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 11 Oct 202=
3 at 13:03, Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex=
.kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, Oct 11, 2023 at 5:06=E2=80=AFAM Sundeep KOKKONDA =
via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;sundeep.kokkonda=3D<a href=3D"mailto:windriver.com@lists.openembedded.o=
rg" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; [Yocto#14875]<br>
&gt; The &#39;--remap-path-prefix&#39; option removes all references to bui=
ld directory structure in the debug information within the compiled output =
for Cargo dependencies and the project&#39;s binary.<br>
&gt; However, some references to build directories remains in the final bin=
ary in .rustc section in the form of compressed metadata and this makes the=
 build output dependent on the folder structure of the computer it&#39;s co=
mpiled on.<br>
&gt; So, for reproducible builds, use the configuration option &#39;remap-d=
ebuginfo =3D true&#39; along with the &#39;--remap-path-prefix&#39;.<br>
&gt;<br>
&gt; Signed-off-by: Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda=
@windriver.com" target=3D"_blank">sundeep.kokkonda@windriver.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/reproducible.py | 2 --<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://rust_1.70.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.70.0.bb</a>=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 2 files changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
<br>
Blimey, well done!<br>
<br>
-- <br>
Alex Kiernan<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188954): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188954" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188954</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101890610/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101890610/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000bf66ef06076ff3fa--

