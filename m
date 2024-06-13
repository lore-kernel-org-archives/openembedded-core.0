Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE29C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 12:22:12 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.7182.1718281325234701898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 05:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDcWxt1o;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-48a39b54e22so392794137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718281324; x=1718886124; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+m+ynUujSGkpiCuXb9i1h0WNHiikUo+h3HVTiZUXfo=;
        b=nDcWxt1ooAxDtubH95QQBTDVFdUIbarcKHQKMtCJCaHslcElEuWjHWrMGze9Kh8ujb
         QQhsARjbxWA9zzgRmB7zpZRiyIjEv7PnOtyMgRm9MJeemclKzAXiWjLZZD9SpRXunO7j
         36oABUiaeNzKKKjoWs8DqjhsSY0pJ1SweJVH+JfTsgnECHjZKgkK4hJ013kWUAB+bNl5
         V6qYh+LH+/nTQzgvg31BiW2H8lgcvLupt0zXQD4PwcQmeGJHXkJbwmwoE+j60P3VQKDN
         tBr1Ni+RpaqDJNotKJeCAM7tyPaE5TPFXvatXjUOmDNopVPXRlzoSSiNFP5ZZJizVxVR
         GFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718281324; x=1718886124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+m+ynUujSGkpiCuXb9i1h0WNHiikUo+h3HVTiZUXfo=;
        b=g0HsMlz1oNqwDCIV1LIJA9tC8IykLCLMpA0KJ5zhgJ1mRLfC+jpZ0SZLGynKlIZ+8/
         r0ITFKisbjYz1S2XCwmWcrYSthPOnsvJojmAEk1kdA9jKpHqV+WyWLz5QPAHoKKInVcF
         7qHU/DDkL5+hiH0j/SCV9tQbbWE2Y7/u0oXvxFYa6sjX/KVsyLrvTKb2ofrsMP/kPq6D
         5xsHKCOoW8gWEBCxc6frDIniGRzyV0XPsaTjs5VdAahjg2Ax20XJPBZcDLK0kBXGicec
         1nsmv74HMqFY5lIE46V2+hCxXJoFjNEgloFzSbU0fNqNphR0/9LObUX/WPzpJRfbutLI
         FgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiN7dnHSPZDqVZ+pI3wNBnGrvlc8gMO/RrstWOP4RcgrMOHf0rbrWEBblnq6yYuWUBENWD+X9OVQrCRjjw03PYcFRiTZ6FWEE2Qu0ElpG2sYycYDbujHaw
X-Gm-Message-State: AOJu0YwU0PMOenCexHedUyzIIxiQDCq6hkFMlpaYWpEsv+4YCGz0Oz+V
	Y6/bGX1XmP3Vaj32XSua202NTCfq7zceCwD3baEePHzZPRvtioIQBY1/BC5qRnik8kDa2xgqS1n
	Ef3PBXeHtumQEXyBY+eNqJJCDZBA=
X-Google-Smtp-Source: AGHT+IFkx3dAc8nBnsNBRsq1AM8bTkimBjDuzxSCbpPTeW11/r5qxHqz31iaf3jBn7HiI9MOoXseJDtQyUiKbf1N1To=
X-Received: by 2002:a05:6102:c7:b0:48c:4734:1e2e with SMTP id
 ada2fe7eead31-48d91e9526cmr4880990137.29.1718281323354; Thu, 13 Jun 2024
 05:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <23837.1718148644454631767@lists.openembedded.org>
 <Groupsio.3.23837.1718148644454631767@lists.openembedded.org> <17D837E52ADBFC1B.19992@lists.openembedded.org>
In-Reply-To: <17D837E52ADBFC1B.19992@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 13 Jun 2024 13:21:52 +0100
Message-ID: <CANPvuRkbE9joqaM3=Lhxy3csBbQCH8h1bhK6fBU19fDJF5yC6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] archiver.bbclass: Fix work-shared checking for
 kernel recipes
To: quaresma.jose@gmail.com
Cc: egyszeregy@freemail.hu, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e7235d061ac48bcc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 12:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200598

--000000000000e7235d061ac48bcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (quarta, 12/06/2024 =C3=A0(s) 10=
:32):

> Hi Livius,
>
> In reality, although the kernel has its code in S =3D "${WORKDIR}/git" it
> ends up being moved to ${STAGING_KERNEL_DIR} in the do_symlink_kernsrc
> kernel.bbclass function.
>
> https://github.com/openembedded/openembedded-core/blob/07b4c7a2bd23f86458=
10e13439e814caaaf9cd94/meta/classes-recipe/kernel.bbclass#L182C8-L199
>
> After this, the source S becomes a symbolic link for STAGING_KERNEL_DIR
> so I think if we check the real path following the symbolic link we solve
> the problem.
>
> - return d.getVar('S').startswith(sharedworkdir)
> + return os.path.realpath(d.getVar('S')).startswith(sharedworkdir)
>
> Could you try using os.path.realpath in S to see if it works?
>

I have tested the os.path.realpath and it fixes this issue when S is a
symbolic link pointing to STAGING_KERNEL_DIR.
I also have sent a follow up fix to meta-freescale [1] so the master branch
should work now without this change.
[1] https://github.com/Freescale/meta-freescale/pull/1843


>
> Jose
>
> Livius via lists.openembedded.org <egyszeregy=3D
> freemail.hu@lists.openembedded.org> escreveu (quarta, 12/06/2024 =C3=A0(s=
)
> 00:35):
>
>> [Edited Message Follows]
>>
>> S =3D "${WORKDIR}/git" does not contain "${TMPDIR}/work-shared" path,
>> therefore "def is_work_shared(d):" will be returned with False and archi=
ver
>> is failed for linux kernel recipe (somewhy unpack is broken and kernel
>> source is missing in work-shared folder in this situation).
>> https://github.com/openembedded/bitbake/blob/master/conf/bitbake.conf#L4=
5
>>
>> In default S =3D "${STAGING_KERNEL_DIR}" is the source path for a kernel=
.
>> Now, archiver works only in this case when it is not changed to
>> "${WORKDIR}/git" symbolic link folder. We can see
>> "bb.data.inherits_class('kernel', d)" was in the old code for checking i=
t
>> because of this situation, when somebody like to use this kind of symbol=
ic
>> link git source solution. This should not have been dropped in last comm=
it.
>>
>>
>> https://github.com/openembedded/openembedded-core/commit/5fbb4ca8da4f4f1=
ea426275c45634802dcb5a575#diff-7a2ccc0d645ec49c87c4956f90ab24ace5292140dff6=
65459bbc94e4e72a8e07L473
>>
>> https://github.com/openembedded/openembedded-core/blob/master/meta/class=
es-recipe/kernel.bbclass#L26
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200569):
> https://lists.openembedded.org/g/openembedded-core/message/200569
> Mute This Topic: https://lists.openembedded.org/mt/106531570/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e7235d061ac48bcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openemb=
edded.org" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gm=
ail.com@lists.openembedded.org</a>&gt; escreveu (quarta, 12/06/2024 =C3=A0(=
s) 10:32):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr">Hi Livius,<br><br>In reality, although the ker=
nel has its code in S =3D &quot;${WORKDIR}/git&quot; it ends up being moved=
 to ${STAGING_KERNEL_DIR}=C2=A0in the do_symlink_kernsrc kernel.bbclass fun=
ction.</div><div dir=3D"ltr"><a href=3D"https://github.com/openembedded/ope=
nembedded-core/blob/07b4c7a2bd23f8645810e13439e814caaaf9cd94/meta/classes-r=
ecipe/kernel.bbclass#L182C8-L199" target=3D"_blank">https://github.com/open=
embedded/openembedded-core/blob/07b4c7a2bd23f8645810e13439e814caaaf9cd94/me=
ta/classes-recipe/kernel.bbclass#L182C8-L199</a><br><br></div><div dir=3D"l=
tr">After this, the source S becomes a symbolic link for STAGING_KERNEL_DIR=
</div><div dir=3D"ltr">so I think if we check the real path following the s=
ymbolic link we solve the problem.<br><br>- return d.getVar(&#39;S&#39;).st=
artswith(sharedworkdir)<br>+ return os.path.realpath(d.getVar(&#39;S&#39;))=
.startswith(sharedworkdir)<br><br></div><div dir=3D"ltr">Could you try usin=
g os.path.realpath in S to see if it works?<br></div></div></blockquote><di=
v><br>I have tested the os.path.realpath and it fixes this issue when S is =
a symbolic link pointing to STAGING_KERNEL_DIR.</div><div>I also have sent =
a follow up fix to meta-freescale [1] so the master branch should work now =
without this change.<br>[1] <a href=3D"https://github.com/Freescale/meta-fr=
eescale/pull/1843" target=3D"_blank">https://github.com/Freescale/meta-free=
scale/pull/1843</a>=C2=A0<br>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"></div><div><br></div>Jose=
<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Li=
vius via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.=
openembedded.org</a> &lt;egyszeregy=3D<a href=3D"mailto:freemail.hu@lists.o=
penembedded.org" target=3D"_blank">freemail.hu@lists.openembedded.org</a>&g=
t; escreveu (quarta, 12/06/2024 =C3=A0(s) 00:35):<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">[Edited Message Follows]<br>
<br>
S =3D &quot;${WORKDIR}/git&quot; does not contain &quot;${TMPDIR}/work-shar=
ed&quot; path, therefore &quot;def is_work_shared(d):&quot; will be returne=
d with False and archiver is failed for linux kernel recipe (somewhy unpack=
 is broken and kernel source is missing in work-shared folder in this situa=
tion).<br>
<a href=3D"https://github.com/openembedded/bitbake/blob/master/conf/bitbake=
.conf#L45" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembe=
dded/bitbake/blob/master/conf/bitbake.conf#L45</a><br>
<br>
In default S =3D &quot;${STAGING_KERNEL_DIR}&quot; is the source path for a=
 kernel. Now, archiver works only in this case when it is not changed to &q=
uot;${WORKDIR}/git&quot; symbolic link folder. We can see &quot;bb.data.inh=
erits_class(&#39;kernel&#39;, d)&quot; was in the old code for checking it =
because of this situation, when somebody like to use this kind of symbolic =
link git source solution. This should not have been dropped in last commit.=
<br>
<br>
<a href=3D"https://github.com/openembedded/openembedded-core/commit/5fbb4ca=
8da4f4f1ea426275c45634802dcb5a575#diff-7a2ccc0d645ec49c87c4956f90ab24ace529=
2140dff665459bbc94e4e72a8e07L473" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/openembedded/openembedded-core/commit/5fbb4ca8da4f4f1ea42627=
5c45634802dcb5a575#diff-7a2ccc0d645ec49c87c4956f90ab24ace5292140dff665459bb=
c94e4e72a8e07L473</a><br>
<a href=3D"https://github.com/openembedded/openembedded-core/blob/master/me=
ta/classes-recipe/kernel.bbclass#L26" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/openembedded/openembedded-core/blob/master/meta/classes-=
recipe/kernel.bbclass#L26</a><br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200569): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200569" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200569</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106531570/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106531570/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000e7235d061ac48bcc--

