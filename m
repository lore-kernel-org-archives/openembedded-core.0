Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D586CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:49:02 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.5472.1758653334077684378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 11:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TNM8OYv4;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b55562f3130so1498726a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758653333; x=1759258133; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cbExkDQMFtWYt5su5MQG0q2o+Rdtll9qxru9zdetR8o=;
        b=TNM8OYv46Vi8v9RJeAm7FR3Tp4COt4npg0SlGXYei+lJsKTL6nap7sH4MbuFDs/bSz
         OkwVLQ6j8RQc7faSe+GD61uCPxCrtXJyaR2xxCMrajv3nZJMM6ehsTWe5LSuUl74J7i3
         BnE2T4m327wa0aJ0hWtqnMpC/vkWNpdhF/jkOPU1AG9RHj4oRRMh6bhDla7emoIoRxIR
         z4GeGuZfNISC6/ZNP1LA70TjF7ivSWyqivtybokbhp0Pqm4J0nEUXElFtpvLcGyNdqLj
         IQlPDWW0hWHV+Yla7TVjU74f/HLE6EE/JHVtkcoxA16u5xUCSEyKZZD2JQ5R0svNTv04
         IejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653333; x=1759258133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbExkDQMFtWYt5su5MQG0q2o+Rdtll9qxru9zdetR8o=;
        b=f532K25h7nVPhtIcQODulWmUoDM3kvWYDBFFqWv2wI7QLKjDFBelEb4bpqXUlllvH8
         4wVHeV6f0CbrQvgLKsqO7/lj489T/dSG73kBPPyWeBOQeYj9Q0R/debNcsB9xe+kue6y
         2dA9/kO0FuNjYA10yvAA1b8IncVbYR4WCAX5YLSRl2cTpZF65bdxOil53NjsJlFAXDna
         GO++PPmEdLUsYgxiJHULOGU7YmotmsrW6rJD5fwzKkJ6m5E3yo01moAWB2aHJEFg4Tb2
         BH7C/FO4FA6lMYPXgHrv97TvZqiNj3kOXNnMf7b+EFva5y6Gjuv8XJFkJD+axWfSFoIs
         TirQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnANU8QpKTt8Zaaolql+izJPsOYUEuz0ib2r9V190lG0fVJv2Fp0z+FKGSUCzdWqe2QIFsfdLX6Sd1YOGGC33LsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5hT4eB2eMbpZWTzLCN5y87CBq34a/VhDsiNlAGubF5Yv1BXGh
	GgvfZyMXIWJUsDyfM1zGBidytVgXv/ATzR+cgP6pJIB74se0zYSjtYBHRz37rMFYXs36em+ijpV
	qFaA2FkAZwq7WVvJXASRhZNcQAN39TV0=
X-Gm-Gg: ASbGncuSswfKX96JWSYMtEcL6gWT7DLABWfF4Ln9/17l5ISZ0aXJmmLfY8XrxfCmnHP
	ybvT+n4HhrZt73Q22odfOrSAGxy5LuEioXLmdQaoaW5eZ11hv1xkLtZU6hgCHKjCFquJIpiEozc
	nQLJJv+YAmunxWaO7zgNBQFRDYR1umD3GTvUz3JRwMraq07/Tp89IJPdmkGZB0OHs0hzZ8Pli0Q
	Q5zb0M+NoZVtRFWbAhYStFjK3j5RInQic6lvlsnSB057/yR1Ps=
X-Google-Smtp-Source: AGHT+IEfUd2zRJczRv7CuMcil/jBEV6CaoSj7zfFws6kVJRy0ERsfyWmgqPtxq3rwvNlW6Ga2bjq5CuVTgQs4OhtYZQ=
X-Received: by 2002:a17:90b:540f:b0:327:734a:ae7a with SMTP id
 98e67ed59e1d1-332a92da6ebmr3967384a91.11.1758653332461; Tue, 23 Sep 2025
 11:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250804164100.9355-1-peter.marko@siemens.com> <DB5PR02MB102136F23FE32048C946C6102EF1DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102136F23FE32048C946C6102EF1DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 23 Sep 2025 20:48:40 +0200
X-Gm-Features: AS18NWBNelkC40JG98pA49E8hNuTB0A4Glahi5pNA-x9nh6M5UKZ91aLi7AuRyI
Message-ID: <CAApg2=SX2-2FoL6F-v9d0DFBq-2FVzkH=y9paKWw6xM0reBF5w@mail.gmail.com>
Subject: Re: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965
To: peter.kjellerstedt@axis.com
Cc: "peter.marko@siemens.com" <peter.marko@siemens.com>, Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002a1ad3063f7c63e3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 18:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223911

--0000000000002a1ad3063f7c63e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In my opinion master should go to 3.50.4, there are other commits that look
like potential vulnerabilities.

M.

On Tue, Sep 23, 2025 at 8:34=E2=80=AFPM Peter Kjellerstedt via
lists.openembedded.org <peter.kjellerstedt=3Daxis.com@lists.openembedded.or=
g>
wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> > Sent: den 4 augusti 2025 18:41
> > To: openembedded-core@lists.openembedded.org
> > Cc: Peter Marko <peter.marko@siemens.com>
> > Subject: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Pick patch [1] mentioned in NVD report [2] from github mirror [3].
> >
> > [1]
> https://www.sqlite.org/src/info/5508b56fd24016c13981ec280ecdd833007c9d8dd=
595edb295b984c2b487b5c8
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-6965
> > [3]
> https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4=
b419703
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  .../sqlite/sqlite3/CVE-2025-6965.patch        | 112 ++++++++++++++++++
> >  meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
> >  2 files changed, 113 insertions(+)
> >  create mode 100644
> meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
> >
>
> [cut]
>
> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> b/meta/recipes-
> > support/sqlite/sqlite3_3.48.0.bb
> > index 11f103dddc..6c9f1ed5d9 100644
> > --- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> > +++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> > @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D
> > "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f4fd9e4a77ed0
> >  SRC_URI =3D "
> http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> >      file://CVE-2025-3277.patch \
> >      file://CVE-2025-29088.patch \
> > +    file://CVE-2025-6965.patch \
> >  "
> >  SRC_URI[sha256sum] =3D
> "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
> >
>
> Why aren't these three patches on master? It still uses the same version
> of sqlite3 as Walnascar so they should be needed on master as well.
>
> In my opinion master should go to 3.50.4, there are other commits that
look like potential vulnerabilities.

M.

--0000000000002a1ad3063f7c63e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In my opinion master should go to 3.50.4, there are o=
ther commits that look like potential vulnerabilities.</div><div><br></div>=
<div>M.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Sep 23, 2025 at 8:34=E2=80=AFPM Peter=
 Kjellerstedt via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.opene=
mbedded.org">axis.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&gt; -----Original Message-----=
<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Peter Marko via <a hre=
f=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a><br>
&gt; Sent: den 4 augusti 2025 18:41<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=
=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; Subject: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965<br>
&gt; <br>
&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" targe=
t=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; <br>
&gt; Pick patch [1] mentioned in NVD report [2] from github mirror [3].<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.sqlite.org/src/info/5508b56fd24016c13981ec2=
80ecdd833007c9d8dd595edb295b984c2b487b5c8" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.sqlite.org/src/info/5508b56fd24016c13981ec280ecdd833007c9d=
8dd595edb295b984c2b487b5c8</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-6965" rel=3D"=
noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2025-696=
5</a><br>
&gt; [3] <a href=3D"https://github.com/sqlite/sqlite/commit/c52e9d97d485a3e=
b168e3f8f3674a7bc4b419703" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a7bc4b419703</a><b=
r>
&gt; <br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../sqlite/sqlite3/CVE-2025-6965.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 112 ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.48.0.bb</a> |=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 2 files changed, 113 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-=
6965.patch<br>
&gt; <br>
<br>
[cut]<br>
<br>
&gt; diff --git a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.4=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">sqlite3_3.48.0.bb</a> b/meta/r=
ecipes-<br>
&gt; support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">sqlite3_3.48.0.bb</a><br>
&gt; index 11f103dddc..6c9f1ed5d9 100644<br>
&gt; --- a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.48.0.bb</a><br>
&gt; +++ b/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.48.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.48.0.bb</a><br>
&gt; @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f4fd9e4a77ed0=
<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.sqlite.org/2025/sqlite-a=
utoconf-$%7BSQLITE_PV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2025-3277.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2025-29088.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2025-6965.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;ac992f7fca3989de7ed1fe99c16363f8487=
94c8c32a158dafd4eb927a2e02fd5&quot;<br>
&gt; <br>
<br>
Why aren&#39;t these three patches on master? It still uses the same versio=
n <br>
of sqlite3 as Walnascar so they should be needed on master as well.<br>
<br></blockquote><div><div>In my opinion master should go to 3.50.4, there =
are other commits that look like potential vulnerabilities.</div><div><br><=
/div><div>M.</div></div></div></div>

--0000000000002a1ad3063f7c63e3--

