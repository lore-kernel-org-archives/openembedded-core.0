Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CF6C28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 07:56:03 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.8714.1741938956092299093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 00:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YDmHTdx6;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff4a4f901fso3056798a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741938955; x=1742543755; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/M60nSs/givJ3xcK5FNfEYhB8sc2gAPAVkcXu/10DaQ=;
        b=YDmHTdx6HM2UOU2XnaJZpLJ7Co7B+cvog+SLOIfjX/Yn0qJjuT6VI7zfD0gZ1S2fcm
         VA16aimT3ImT6JAejRXaHNcCilhOTSjQhT/NnmprgEuRp6Tj5XvAMQUEHqAmHTCqV3mz
         rnv5hLKTqhZrfB8IKLA+q3EpMK1kwV7Ps05RVRv5+M6G7/OtN7pcfSK7F7VMN+qbwhP4
         EXfAoZuqwcVxRJGPbHl6EdLDJPFza7VAPlTCZim2HXb9oj++evhtrCuEUu9FuFZowEXX
         3/LO6aCtlH0E32cdM/dY1y0HfUNS69IOYnpC8+l5dNmbRWzS2uf39epmbsygyiKVIvL7
         5zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741938955; x=1742543755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/M60nSs/givJ3xcK5FNfEYhB8sc2gAPAVkcXu/10DaQ=;
        b=vMdNb5pNuglQMLXg6H8oFEqeJCFZepSxVdEQcfLpMyMOnq8SiqWwwStlbPFkRsDXLx
         KlQcf+p/lTGGyWvlWSnhnkkvEqqDplyAE+T7kpz2cOHU41Pxvoeo9up330hogfZF1jdc
         P07arNib/ROIPFKG3MKq29w9K+u+CKCypqtunSVS0CU/4wzOSaf5mDaccbrnQabfv1qO
         mtbr7h/BSgxkRoyPLvHneTYOgpB5oqQ+QE5IDvaCACnysffT/Ray6XxNRXncHhrNM1ys
         t+elsELPqNF/Lb5Q6/CmwycJQ0rS/MPHtsX5HRrbUQvvFv3CGrVrBHbyBs2d5hnV+Ivl
         yKLQ==
X-Gm-Message-State: AOJu0YzEgJYvy9PdiZLtKDjMNPa1jXgbmNRljtuSO81J5Fq+0jj3NNMz
	51tuFAgS21JhKAnmqxsKaekUdfwFT3f40MDKpaUTlFHthY/kXZaQVKwFGXjGFPHmosOvbq6SVms
	z7m07RUF/9jCrMCaN3N2OTq13ANQ=
X-Gm-Gg: ASbGncuWmCIwFjrG3uJDv3a/JO9Ma9VQXClGAuEtqu4HYyN8QpvlI023neyzZNOY61W
	Xhp6TfGS5LjGTpEbFmIwx8rwjXfck4x5FYth/W9IhSgsJ7QMwJ1RLwOKwbHCqEdgHP4tLuHeIIF
	uz45hKnPJPZNN4rFiy2IJz6sEawIA=
X-Google-Smtp-Source: AGHT+IGmjee5Gjn0IrRyN9oapA+lDEfgvwtp2lQc37RNokroCIN/3xIF9JirRxmHIjUVV72iYbhuQhGzZHYQNyJVk9Q=
X-Received: by 2002:a17:90b:5405:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-30151d6e0b0mr2006037a91.28.1741938955307; Fri, 14 Mar 2025
 00:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250310094753.1985294-1-adrian.freihofer@siemens.com>
 <CAApg2=QPOhkVMQvKjKwNHaCrcjfkky3iuieZ+xRO6pCve4UDww@mail.gmail.com> <65909b2c17714f9e880e3efbef89f141ac0347cc.camel@gmail.com>
In-Reply-To: <65909b2c17714f9e880e3efbef89f141ac0347cc.camel@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 14 Mar 2025 08:55:43 +0100
X-Gm-Features: AQ5f1JpLttgntMgY-Dk2X3rjP-_yDUBgOosZhRpYstzN-RfLM2DdPtRsmzp-Xcs
Message-ID: <CAApg2=RGX9tm45up4bQwijxZDD3kCWbOmwgHrw6s2V2Z=6g=Ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-init-build-env: define umask
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a6d2e1063048c4a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 07:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212821

--000000000000a6d2e1063048c4a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 1:56=E2=80=AFPM Adrian Freihofer <adrian.freihofer@=
gmail.com>
wrote:

> On Thu, 2025-03-13 at 11:51 +0100, Marta Rybczynska wrote:
> >
> >
> > On Mon, Mar 10, 2025 at 10:48=E2=80=AFAM Adrian Freihofer via
> > lists.openembedded.org
> > <adrian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:
> > > If umask is not suitable for bitbake it terminates with:
> > >   ERROR:  OE-core's config sanity checker detected a potential
> > >     misconfiguration.
> > >     Either fix the cause of this error or at your own risk disable
> > >     the checker (see sanity.conf). Following is the list of
> > > potential
> > >     problems / advisories:
> > >     Please use a umask which allows a+rx and u+rwx
> > >
> > > Set the umask flags in the oe-init-build-env script to prevent from
> > > this
> > > error.
> > >
> > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > ---
> > >  oe-init-build-env | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/oe-init-build-env b/oe-init-build-env
> > > index 82382f27078..5d830455f74 100755
> > > --- a/oe-init-build-env
> > > +++ b/oe-init-build-env
> > > @@ -57,3 +57,5 @@ unset OEROOT
> > >
> > >  [ -z "$BUILDDIR" ] || cd "$BUILDDIR"
> > >
> > > +# explicitly set relative umask to deal with security hardening
> > > +umask u+rwx,g+rx,o+rx
> > >
> > >
> >
> >
> > Hello Adrian,
> > Could you explain what situation it is needed?
>
> Hi Marta
>
> Some host distributions or some build machines with additional
> hardening policies set the system-wide umask more restrictively than
> usual. This is not compatible with OE/bitbake. Bitbaking requires files
> to be built with the umask u+rwx,g+rx,o+rx by default.
>
> We've had this patch for a while now. There is already a check that
> tries to protect the user from calling bitbake in such an incompatible
> environment. That tells me we are not alone in this, as the check is
> not from us, as far as I know. So why not just change the umask if a
> user obviously wants to use a shell to invoke bitbake?
>
> A more restrictive umask setting might make sense for other
> applications where sensitive data is processed and even users who are
> members of the group should not have access by default. But I don't see
> any risk if we automatically switch to an umask configuration that is
> useful for bitbake.
>
>
Thanks for the explanation Adrian.

The need to set up the umask for all users doesn't seem right to me in the
first place. Richard et al, do you have any idea why there's such a
requirement? Is it related to
https://git.openembedded.org/openembedded-core/commit/?id=3Db07b7deeae3d519=
d9998d583592f3e4f8f2802b3
?

Kind regards,
Marta

--000000000000a6d2e1063048c4a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 13,=
 2025 at 1:56=E2=80=AFPM Adrian Freihofer &lt;<a href=3D"mailto:adrian.frei=
hofer@gmail.com">adrian.freihofer@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Thu, 2025-03-13 at 11:51 +010=
0, Marta Rybczynska wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Mar 10, 2025 at 10:48=E2=80=AFAM Adrian Freihofer via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;adrian.freihofer=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; If umask is not suitable for bitbake it terminates with:<br>
&gt; &gt; =C2=A0 ERROR:=C2=A0 OE-core&#39;s config sanity checker detected =
a potential<br>
&gt; &gt; =C2=A0 =C2=A0 misconfiguration.<br>
&gt; &gt; =C2=A0 =C2=A0 Either fix the cause of this error or at your own r=
isk disable<br>
&gt; &gt; =C2=A0 =C2=A0 the checker (see sanity.conf). Following is the lis=
t of<br>
&gt; &gt; potential<br>
&gt; &gt; =C2=A0 =C2=A0 problems / advisories:<br>
&gt; &gt; =C2=A0 =C2=A0 Please use a umask which allows a+rx and u+rwx<br>
&gt; &gt; <br>
&gt; &gt; Set the umask flags in the oe-init-build-env script to prevent fr=
om<br>
&gt; &gt; this<br>
&gt; &gt; error.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.frei=
hofer@siemens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<b=
r>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0oe-init-build-env | 2 ++<br>
&gt; &gt; =C2=A01 file changed, 2 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/oe-init-build-env b/oe-init-build-env<br>
&gt; &gt; index 82382f27078..5d830455f74 100755<br>
&gt; &gt; --- a/oe-init-build-env<br>
&gt; &gt; +++ b/oe-init-build-env<br>
&gt; &gt; @@ -57,3 +57,5 @@ unset OEROOT<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0[ -z &quot;$BUILDDIR&quot; ] || cd &quot;$BUILDDIR&quot;<br=
>
&gt; &gt; <br>
&gt; &gt; +# explicitly set relative umask to deal with security hardening<=
br>
&gt; &gt; +umask u+rwx,g+rx,o+rx<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Hello Adrian,<br>
&gt; Could you explain what situation it is needed?<br>
<br>
Hi Marta<br>
<br>
Some host distributions or some build machines with additional<br>
hardening policies set the system-wide umask more restrictively than<br>
usual. This is not compatible with OE/bitbake. Bitbaking requires files<br>
to be built with the umask u+rwx,g+rx,o+rx by default.<br>
<br>
We&#39;ve had this patch for a while now. There is already a check that<br>
tries to protect the user from calling bitbake in such an incompatible<br>
environment. That tells me we are not alone in this, as the check is<br>
not from us, as far as I know. So why not just change the umask if a<br>
user obviously wants to use a shell to invoke bitbake?<br>
<br>
A more restrictive umask setting might make sense for other<br>
applications where sensitive data is processed and even users who are<br>
members of the group should not have access by default. But I don&#39;t see=
<br>
any risk if we automatically switch to an umask configuration that is<br>
useful for bitbake.<br>
<br></blockquote><div><br></div><div>Thanks for the explanation Adrian.</di=
v><div><br></div><div>The need to set up the umask for all users doesn&#39;=
t seem right to me in the first place. Richard et al, do you have any idea =
why there&#39;s such a requirement? Is it related to <a href=3D"https://git=
.openembedded.org/openembedded-core/commit/?id=3Db07b7deeae3d519d9998d58359=
2f3e4f8f2802b3">https://git.openembedded.org/openembedded-core/commit/?id=
=3Db07b7deeae3d519d9998d583592f3e4f8f2802b3</a> ?</div><div><br></div><div>=
Kind regards,</div><div>Marta<br></div></div></div>

--000000000000a6d2e1063048c4a8--

