Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F58CC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 16:32:06 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.50497.1736872325344007160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 08:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e/jAeTTZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5f2ed0b70d6so2191674eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736872324; x=1737477124; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Juh+Jd997X72BbvpfiTamhvWFxwGa6Gv38o1FYIIYsY=;
        b=e/jAeTTZfokOlAuZAeCbYC94d0a+tHfZVtjvU0NkZ5p+2OwmZRt1BGrDfzCXJ+YUZL
         8my1DrO0drxsDGF+85CfA8cKMzGclO7a2cxmL17n9T4fVkA4DegaY5GzXW5LF4DKaolc
         uKyua4jFrWBXcpdO70+CmqKff1YPdFUKZQPqd8R2cG9QIaac+cmZd6vZlYAxeTKj/lQ3
         wjNKDmHN/jCpKQPriIFcOXQMGwMmqLbIzqrsl8nGcgqpTxytbrbQktmy2CPKl5IKBcpM
         bnq41qr/4cIOM1u34QKETTl54Ob3te8zAeXZnGis0usiIL1sBhgesrrMMF6HK9V70iqp
         J+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736872324; x=1737477124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Juh+Jd997X72BbvpfiTamhvWFxwGa6Gv38o1FYIIYsY=;
        b=a91mAfTmfIuYIHLB/H/F+j0YpIxRU0fnM/wvcP3V/Mz0MUcMXohWxIKoIw+E450DWb
         M3/lQ6/nbIg+T/SELgHCB3Bq6xqaDmtKTBss9PRM+oeXwwPoiPBaXtiFAZqtjIgmGNSQ
         n3bVgM6KfOgYLGaSucOF2X538jw8pBXRT99YYeeorNaWUBM+wj7qFm1hbMTqbgmaCJy8
         zMUV86RvEsLaEAJs7oJPWKL0km22mmGnvUH1Zyob1e+oKh3izlogUn16XFZs4a0/h2Oj
         04seaLRKxk9z/0fkfP/3okggIxk1QrhiMDClJFl8T/SrsKIWPtC44A2PehyabWSBCQlf
         6znA==
X-Forwarded-Encrypted: i=1; AJvYcCX7hCYpSYnu7vUOyp4PgeH6Hf3+hJXmpGz3ieQZzsSBrrcHQdgTH/0J2TERLij4iLuTYIMr4LqHP7aaL6cqp01fjw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBX5H7Xv9+WlyQMPFejz2g5Pb69zSYvblu6+tVPbaXbAbcjb3L
	0rr4HSmGsPGCJqsVN1gsHiHM7YqBB5NkuCK32iMSO7p8BJgSk6HRvB2RWKdwHx7kLZ8tNcgMpxg
	mBuMZbmHMN8QBz3gLmk5mw219sD8=
X-Gm-Gg: ASbGncvCwyDnD+Rf2ZjEIJCw+KCUPdrLx0H094p3VW19UZkF0pvt3BoJX5fY6/Ymfr2
	Ld7F6N7P3N9p3o26NDfwcYx0C4sZ5AxaMUKT9oUg=
X-Google-Smtp-Source: AGHT+IG1lSTw3vhkjaR10Cs/1RUk2dg4rOFzQUH8Vg3YOoulYQDPoBXIiWk9lHKxb6Ovv8OD1EtKfvvi3sbwJQYBGI4=
X-Received: by 2002:a05:6871:7882:b0:29d:c764:f873 with SMTP id
 586e51a60fabf-2aa0694cdacmr15710349fac.31.1736872324439; Tue, 14 Jan 2025
 08:32:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1736801113.git.steve@sakoman.com> <27315.1736807544501527525@lists.openembedded.org>
 <CAOSpxdaY3X4xrcS6gbcBGL6E+=ejXay3HebikWXb1YLK5HgUgA@mail.gmail.com>
In-Reply-To: <CAOSpxdaY3X4xrcS6gbcBGL6E+=ejXay3HebikWXb1YLK5HgUgA@mail.gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Tue, 14 Jan 2025 17:31:53 +0100
X-Gm-Features: AbW1kvZYpu4mHnJj7MPlI1jML6xtrrG8RYBq4XlmnvVufJc3RDlahPI676b48-4
Message-ID: <CAB3asfiv9rgh_e67kT9Ekyt9bF4VXnvpvZYDgu6OPe9gR5OS0g@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap 00/15] Patch review
To: steve@sakoman.com
Cc: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eb2c3a062bad19fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 16:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209810

--000000000000eb2c3a062bad19fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve

This patch is still looking for its way into the master branch:
https://patchwork.yoctoproject.org/project/docs/patch/20250113233736.418120=
1-3-adrian.freihofer@siemens.com/
I hope this will happen soon.

Thank you and regards,
Adrian


Am Di., 14. Jan. 2025 um 16:57 Uhr schrieb Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>:

> Hi Adrian,
>
> Will these changes break any existing workflows or require
> documentation changes?
>
> Thanks,
>
> Steve
>
> On Mon, Jan 13, 2025 at 2:32=E2=80=AFPM Adrian Freihofer via
> lists.openembedded.org
> <adrian.freihofer=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > Hi Steve
> >
> > Would it be possible to cherry-pick also these poky commits:
> >
> > a3c51794144 oe-selftest: devtool ide-sdk use modify debug-build
> > 92a4abac54a devtool: ide-sdk recommend DEBUG_BUILD
> > 71acb3b781d devtool: ide-sdk sort cmake preset
> > 1f7eb26c947 devtool: modify support debug-builds
> >
> > respectively these OE-core commits:
> >
> > fc17808799d2b667afbe4ea9837b66af70d47007
> > b886c26bf893878ba8eb6bee80dd0507e5cb0d2d
> > 65950eb601c6c8aac0e4bc8683e544305346229d
> > a3c5179414410ba8ccf40c7ec168ffbbf73a9096
> >
> > These patches fix some bugs. They also restore compatibility with the
> latest version 2.8.0 of
> https://marketplace.visualstudio.com/items/yocto-project.yocto-bitbake/ch=
angelog.
> Without these patches, the user has to configure the
> bitbake.disableDevtoolDebugBuild setting, which is not intuitive at all.
> >
> > Thank you anyway.
> > Adrian
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209808):
> https://lists.openembedded.org/g/openembedded-core/message/209808
> Mute This Topic: https://lists.openembedded.org/mt/110595467/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eb2c3a062bad19fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve</div><div><br></div><div>This patch is still=
 looking for its way into the master branch: <a href=3D"https://patchwork.y=
octoproject.org/project/docs/patch/20250113233736.4181201-3-adrian.freihofe=
r@siemens.com/">https://patchwork.yoctoproject.org/project/docs/patch/20250=
113233736.4181201-3-adrian.freihofer@siemens.com/</a></div><div>I hope this=
 will happen soon.</div><div><br></div><div>Thank you and regards,</div><di=
v>Adrian<br></div><div><br></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 14. Jan. 2025 um 1=
6:57=C2=A0Uhr schrieb Steve Sakoman via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com=
@lists.openembedded.org">sakoman.com@lists.openembedded.org</a>&gt;:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Adrian,<br>
<br>
Will these changes break any existing workflows or require<br>
documentation changes?<br>
<br>
Thanks,<br>
<br>
Steve<br>
<br>
On Mon, Jan 13, 2025 at 2:32=E2=80=AFPM Adrian Freihofer via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;adrian.freihofer=3D<a href=3D"mailto:siemens.com@lists.openembedded.org=
" target=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Steve<br>
&gt;<br>
&gt; Would it be possible to cherry-pick also these poky commits:<br>
&gt;<br>
&gt; a3c51794144 oe-selftest: devtool ide-sdk use modify debug-build<br>
&gt; 92a4abac54a devtool: ide-sdk recommend DEBUG_BUILD<br>
&gt; 71acb3b781d devtool: ide-sdk sort cmake preset<br>
&gt; 1f7eb26c947 devtool: modify support debug-builds<br>
&gt;<br>
&gt; respectively these OE-core commits:<br>
&gt;<br>
&gt; fc17808799d2b667afbe4ea9837b66af70d47007<br>
&gt; b886c26bf893878ba8eb6bee80dd0507e5cb0d2d<br>
&gt; 65950eb601c6c8aac0e4bc8683e544305346229d<br>
&gt; a3c5179414410ba8ccf40c7ec168ffbbf73a9096<br>
&gt;<br>
&gt; These patches fix some bugs. They also restore compatibility with the =
latest version 2.8.0 of <a href=3D"https://marketplace.visualstudio.com/ite=
ms/yocto-project.yocto-bitbake/changelog" rel=3D"noreferrer" target=3D"_bla=
nk">https://marketplace.visualstudio.com/items/yocto-project.yocto-bitbake/=
changelog</a>. Without these patches, the user has to configure the bitbake=
.disableDevtoolDebugBuild setting, which is not intuitive at all.<br>
&gt;<br>
&gt; Thank you anyway.<br>
&gt; Adrian<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#209808): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/209808" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/209808</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110595467/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110595467/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofer@gmail.com=
" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000eb2c3a062bad19fc--

