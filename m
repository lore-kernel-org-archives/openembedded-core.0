Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BA4CCF9F8
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 01:18:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1430.1761959910653563995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 18:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWOG0cjq;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so2696076a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 18:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761959910; x=1762564710; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0kneej0dAbNKaitTAmKSn/Yz0hLTcA0piaGj+G/EtAs=;
        b=aWOG0cjqTLsl6Lbtl0dobCSnZ5KK97rV5SOaov6YcVUHc3OKGQp7dAVAG2W0fJ1Hc+
         yLSFPRaeI0PkpwteQdHzATi7XNk4M46DC4GgeXSBlEps7fTuiNeUZ/oqBqo2q+RSeM5c
         /KEmBWC6nsIWVG88E/09KzwoGY6aKB7XVzuaw+Q5i6/f7DNFGg8/JwrnLm9yfgFqQMOD
         2Vyit7xzHADTlbgLhLRZ8ifRynU2T+gpXBo6gcehvR9d+zJdTTA4HxYIbn/ptyBEuhQD
         nxVwIywNtukpiQF/uEAUj8x9y08LWkh+E7VNhRlKaG/cso06Wtm7oqfyyS6OAsHje1BJ
         BSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761959910; x=1762564710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kneej0dAbNKaitTAmKSn/Yz0hLTcA0piaGj+G/EtAs=;
        b=jf2N2IpNmwEo0lCgkBUQiki4yGyqpwhIFDYw20rRS34FHr8XVst8zA5llG2Q0AKFdd
         vQRazLjlSiVVGAyqRs7tn5spKkDspGHUAQLI0MT+8WLjxNouRCWl20wKLblLUQDs3qGh
         FIvURV3W1sKQ2ARzjeN9tnhPy98mssnHmzRqPc3lOd0Nc6vti8Q5yxIGdwXGO1e85bgJ
         76ClNEBGMknKaNSTQ9vUhY53NpYbxN/Qd9Hy8ZVRMnR1oJcxxRURC4asccKJGXXf8aNJ
         /FeEVg/MJsIKFsXyaVDRQJqxZyW4vwpsZDkghu5vn7lQOw/Xg+exzY2R+DGGcSTcN37i
         dTAw==
X-Gm-Message-State: AOJu0YxiCKwsKuRySsN1Wqj/m09uUHQSGApGQjL+iPiAD4dJShm7YCJV
	ZAi8FNNYTx+cQzLWw/XSnUsIRIkzAwEFXFbGXY8zBjVkrSR2ZOiOlTVo7uS368+M/sZI0X3tJRz
	wRhEi9cUTfcYRMKJo04pYQLWHELC6cSk=
X-Gm-Gg: ASbGncsuAsDf4JY498lfwlGhsQBVVxbY/UcBdtwcxQ01BZ456sqbMHRBJd8eKaOj2Hh
	7iffah08kAKwwtAALyfeTxskwUIIe2nG6qWtEgCmFb7AEINr7FA368cd3Tzqd1Gp4AhIvXTE5x9
	30TTfrnYu/dpB+kuM3iJbnwGrGZfpTM3dKkPv1ify9tR27WO51/XZ9h6wS1JMSlO9HOxlKwM+GX
	age9/2UCXi8SiLUNgHHt46Md5stCKzx31N4fsUb9IjOIlDpkSWva8k8ApMEBA==
X-Google-Smtp-Source: AGHT+IFfpdyMCpCB7RZdCnJl45YgxtsEhdP7rrlOOiYU9oT9nYR7H3VQraVRI8v3imbqZ03vI8ALDhKrsVQACjn2wQU=
X-Received: by 2002:a17:90b:4c09:b0:32e:749d:fcb7 with SMTP id
 98e67ed59e1d1-34082fce094mr6417752a91.13.1761959909903; Fri, 31 Oct 2025
 18:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251031173559.1916806-1-johannes.schneider@leica-geosystems.com>
 <CADkTA4MqjYaf_3TbpqT53AkCcznuHfxbZ_S1eLDyRqozxKcPNg@mail.gmail.com>
 <CADkTA4Mz_-fJoWvHAUg4e9KFg4dMFcUG2UyMSkv=tp2wqemGrw@mail.gmail.com> <AM6PR0602MB3830F90DC703198C69C535A6BCF9A@AM6PR0602MB3830.eurprd06.prod.outlook.com>
In-Reply-To: <AM6PR0602MB3830F90DC703198C69C535A6BCF9A@AM6PR0602MB3830.eurprd06.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Oct 2025 21:18:18 -0400
X-Gm-Features: AWmQ_blhmePjdJu1hhqNwlWWBhFNvF31QMRNUkDXfaKRjXwZXpp75WWIQ20Wdo0
Message-ID: <CADkTA4PMMUHJO-Wea=v9UbKUCGmW7piYPyC+smsTPjp3Q1Guaw@mail.gmail.com>
Subject: Re: [scarthgap][PATCH v2] perf: add Kbuild file for unistd.h
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000089d30306427e420b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Nov 2025 01:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225561

--00000000000089d30306427e420b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 9:07=E2=80=AFPM SCHNEIDER Johannes <
johannes.schneider@leica-geosystems.com> wrote:

> Hoi Bruce,
>
>
> > > On Fri, Oct 31, 2025 at 1:45=E2=80=AFPM Bruce Ashfield <
> bruce.ashfield@gmail.com<mailto:bruce.ashfield@gmail.com>> wrote:
> > >
> > > > On Fri, Oct 31, 2025 at 1:36=E2=80=AFPM Johannes Schneider <
> johannes.schneider@leica-geosystems.com<mailto:
> johannes.schneider@leica-geosystems.com>> wrote:
> > > > Building 'perf' with/against newer kernels (>=3D6.14) would fail
> because
> > > > of a missing 'Kbuild' in the folder created when manually installin=
g
> > > > the 'unistd.h' header from libc.
> > > >
> > > > Add a oneliner that creates the missing file, with the relevant
> > > > content taken from the kernels Kbuild file.
> > > >
> > > > Tested with kernel version: 6.16.4
> > > >
> > > I wasn't clear.
> > >
> > > You also need to test this with the older kernel versions and let us
> know that it worked.
> > >
> > > Not just "it should work", we can't let the infrastructure pick up an=
y
> failures, it needs to be tested before submission.
> > >
> > > But thanks for not just saying you tested it (if you haven't). if you
> have done those tests and I'm just misunderstanding, a quick v3 with
> confirmation would be great.
> > >
> > I hit send too soon.
> >
> > The reason that we really need those tests is:  if you've noticed on
> master we had significant reproducibility issues with perf, which you'd
> also have when building a 6.16 perf on that old release.
> >
> > So once we add the support for building it all, there will be
> expectations that it passes testing on all versions.
> >
> >
>
> thanks for pushing in the right direction ;-)
>
> as i was putting up a plain oe-core build, to test more kernel versions
> than just our project constellation (scarthgap + 6.16 kernel)
>
> i've noticed that on master it is already fixed - slightly differently
> though:
>
> https://lists.openembedded.org/g/openembedded-core/message/217991
>
> what is the process to get this fix backported/applied to scarthgap? :-)
>

The easiest way is to cherry-pick the branch into your local scarthgap
branch,
git format the patch out, add [scarthgap] to the prefix and add a comment
in the
patch below the --- (so it will be thrown out on application) that this is
a cherry-pick
request from master.

Then send it to oe-core and the stable maintainer will see it and pick it
up.

Bruce



>
>
> gru=C3=9F
> Johannes



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000089d30306427e420b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 9:07=E2=80=
=AFPM SCHNEIDER Johannes &lt;<a href=3D"mailto:johannes.schneider@leica-geo=
systems.com" target=3D"_blank">johannes.schneider@leica-geosystems.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hoi B=
ruce,<br>
<br>
<br>
&gt; &gt; On Fri, Oct 31, 2025 at 1:45=E2=80=AFPM Bruce Ashfield &lt;<a hre=
f=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmai=
l.com</a>&lt;mailto:<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_=
blank">bruce.ashfield@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt; On Fri, Oct 31, 2025 at 1:36=E2=80=AFPM Johannes Schneider &=
lt;<a href=3D"mailto:johannes.schneider@leica-geosystems.com" target=3D"_bl=
ank">johannes.schneider@leica-geosystems.com</a>&lt;mailto:<a href=3D"mailt=
o:johannes.schneider@leica-geosystems.com" target=3D"_blank">johannes.schne=
ider@leica-geosystems.com</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt; Building &#39;perf&#39; with/against newer kernels (&gt;=3D6=
.14) would fail because<br>
&gt; &gt; &gt; of a missing &#39;Kbuild&#39; in the folder created when man=
ually installing<br>
&gt; &gt; &gt; the &#39;unistd.h&#39; header from libc.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Add a oneliner that creates the missing file, with the relev=
ant<br>
&gt; &gt; &gt; content taken from the kernels Kbuild file.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Tested with kernel version: 6.16.4<br>
&gt; &gt; &gt; <br>
&gt; &gt; I wasn&#39;t clear.<br>
&gt; &gt; <br>
&gt; &gt; You also need to test this with the older kernel versions and let=
 us know that it worked.<br>
&gt; &gt; <br>
&gt; &gt; Not just &quot;it should work&quot;, we can&#39;t let the infrast=
ructure pick up any failures, it needs to be tested before submission.<br>
&gt; &gt; <br>
&gt; &gt; But thanks for not just saying you tested it (if you haven&#39;t)=
. if you have done those tests and I&#39;m just misunderstanding, a quick v=
3 with confirmation would be great.<br>
&gt; &gt; <br>
&gt; I hit send too soon.<br>
&gt; <br>
&gt; The reason that we really need those tests is:=C2=A0 if you&#39;ve not=
iced on master we had significant reproducibility issues with perf, which y=
ou&#39;d also have when building a 6.16 perf on that old release.<br>
&gt; <br>
&gt; So once we add the support for building it all, there will be expectat=
ions that it passes testing on all versions.<br>
&gt; <br>
&gt; <br>
<br>
thanks for pushing in the right direction ;-)<br>
<br>
as i was putting up a plain oe-core build, to test more kernel versions tha=
n just our project constellation (scarthgap + 6.16 kernel)<br>
<br>
i&#39;ve noticed that on master it is already fixed - slightly differently =
though:<br>
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/21799=
1" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/217991</a><br>
<br>
what is the process to get this fix backported/applied to scarthgap? :-)<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">The easiest way is to cherry-pick the branch into your local =
scarthgap branch,</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">git format the patch out, add [scarthgap] to the prefix and add a commen=
t in the</div><div class=3D"gmail_default" style=3D"font-size:small">patch =
below the --- (so it will be thrown out on application) that this is a cher=
ry-pick</div><div class=3D"gmail_default" style=3D"font-size:small">request=
 from master.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Then send i=
t to oe-core and the stable maintainer will see it and pick it up.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
gru=C3=9F<br>
Johannes</blockquote></div><div><br clear=3D"all"></div><div><br></div><spa=
n class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"=
gmail_signature">- Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf,=
 Star Trek II<br><br></div></div>
</div>

--00000000000089d30306427e420b--

