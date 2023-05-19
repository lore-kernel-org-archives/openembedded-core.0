Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2339DC77B7D
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 00:07:15 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.7936.1684454831904052149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 17:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KGDLqrLc;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561d5a16be0so38202937b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684454831; x=1687046831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C4BYQxVxNOnPsPb6haFUijd9KFb103ObslBAqQteni8=;
        b=KGDLqrLcZToSUs6kNY9MW6aKFPz0sFLZTs2uZ+hiDZFEr8Z7S7sgVzWC1596SldMk4
         AiizRt9W3VMFqsfOdXJ0Z0AM0m4uC4/B24REO3B0gQ75ETiKNeeTqVO+PZnsvXoBojNn
         kAfR+xd70gZJBA8f9rjUWgNZWjppeM2Qc70xznuzlkvJAaT+6+E8eiBc5P3JYkidZ/wJ
         YFxAcxVhR4aSjfHU9701rY2Bnzi1AYQoUXZD/zk7lxAu1/lx4IYx257/Aexl9r0eVMtO
         l770zBNbS2SKxY1CO2PDNBgRSagiOEvyjud0+3RTKNqrChCRkvQLjgKDvEofi+pdm7kp
         H2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684454831; x=1687046831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4BYQxVxNOnPsPb6haFUijd9KFb103ObslBAqQteni8=;
        b=CSGbL9/x3huRHnhAn5F+fKD3Sa7afS9AmUcrOB+wCN45EE1/IvDWtD+P3E8wds0TfE
         SPVRpySGLBopLHdJg3Su3v1op0/khfPSCZ7k+Wybf3ArYfNOAAUquEmIfS0yNsanFv97
         9/fASrBrl4Th75FTm/AKXFJ5wHT1OCeM4a28y7SRsXjcBl4ZZso8gd/d1W68+Z77RdHX
         J6m+EIqR/fwGtVGN7puh9pHyozC9tt0FCj4JjLzw7JbFnSQhdtgD13u0cX9HH4K6GN1v
         Y87XBsKy3mcQ3lOONdo+SO/McME0amjXhfWChOvvsSfkDelclKkUjM7g2y4w3exVCjsi
         A77g==
X-Gm-Message-State: AC+VfDwy5IZHdY01CU2tToM8s3eer0wTijd1rAhD/wcRoBJwJLfdSCcP
	Bm1rrrDIwcg8kI3q2KxNl7EF7JYZmCglz2A2kj4=
X-Google-Smtp-Source: ACHHUZ57gdQzf6ahQDTVtzwEwJbQmhzwKboZPX4X/3cKDLJWbHp8f0BT8qyL70f68PblJS/BXTEIjkHRzGkmlRh70K4=
X-Received: by 2002:a0d:cc48:0:b0:561:b26c:40c4 with SMTP id
 o69-20020a0dcc48000000b00561b26c40c4mr111908ywd.51.1684454830864; Thu, 18 May
 2023 17:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230517080639.9336-1-brgl@bgdev.pl> <CANNYZj94a42E=_X-JkZqHHBO7c4TOWKmgp_MrLxhuLUzkdYK1w@mail.gmail.com>
In-Reply-To: <CANNYZj94a42E=_X-JkZqHHBO7c4TOWKmgp_MrLxhuLUzkdYK1w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 18 May 2023 17:06:59 -0700
Message-ID: <CANx9H-CYp5GVzpvT2r=_TsgU3YW5Ao=+dXYmK-bQKepQnQAftw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 00/20] python3: fix run-time dependencies
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d57e8905fc00b319"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 00:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181529

--000000000000d57e8905fc00b319
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Bartosz. I didn't review in great depth, but others have done
so. This series looks like a
step in the right direction.

On Wed, May 17, 2023 at 1:39=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> Thanks for this work. Perhaps we could catch this easier if there are
> runtime tests for those items, maybe in the shape of ptest.
>
> Sometimes recipes have no longer needed dependencies too, and trimming
> those down is harder, but also appreciated.
>
> One challenge has been the additional dependencies that come in for
ptests. Another is that
many PyPi packages do not include their /tests/ directory, meaning we would
need to switch to
the git fetcher in many cases. My intent has always been "full" ptest
coverage, when practical.

Alex
>
> On Wed, 17 May 2023 at 10:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I noticed that every now and then I import some python package into an
> > image only to find out the recipe didn't pull in all required run-time
> > dependencies. I would fix it whenever I noticed it but figured that I
> > could right a script that would go over all python packages, build a
> > minimal image and see that all its modules can be imported.
> >
> > The patches in this series are the result of that. Most simply add
> > missing RDEPENDS, some are additional tweaks to recipes and the last
> > three add new standard library packages to the manifest. These are the
> > ones for which simply adding python3-misc would still be insufficient i=
n
> > terms of run-time dependencies.
> >
> > I plan to do the same for meta-python but this will take more time and =
I
> > need to think of some automated way of updating the recipes first.
> >
> > Bartosz Golaszewski (20):
> >   python3-async: add missing run-time dependencies
> >   python3-attrs: unify RDEPENDS
> >   python3-attrs: don't use PYTHON_PN
> >   python3-attrs: add missing run-time dependencies
> >   python3-certifi: add missing run-time dependencies
> >   python3-libfdt: new package
> >   python3-dtschema: add missing run-time dependencies
> >   python3-hypothesis: fix run-time dependencies
> >   python3-tomli: add missing run-time dependencies
> >   python3-pathspec: add missing run-time dependencies
> >   python3-installer: add missing run-time dependencies
> >   python3-sphinx-rtd-theme: add missing run-time dependencies
> >   python3-setuptools-rust: fix RDEPENDS and allow target build
> >   python3-pyproject-hooks: add missing run-time dependencies
> >   python3-pycryptodome: don't use PYTHON_PN
> >   python3-pycryptodome: add missing run-time dependencies
> >   python3-pygobject: add missing run-time dependencies
> >   python3-manifest: cgitb: new package
> >   python3-manifest: zipapp: new package
> >   python3-manifest: turtle: new package
> >
> >  meta/recipes-devtools/python/python-async.inc |  5 ++-
> >  .../python/python-pycryptodome.inc            |  8 ++--
> >  .../python/python3-attrs_23.1.0.bb            | 15 +++----
> >  .../python/python3-certifi_2022.12.7.bb       |  2 +
> >  .../python/python3-dtschema_2023.4.bb         |  7 +++-
> >  .../python/python3-hypothesis_6.71.0.bb       |  2 +-
> >  .../python/python3-installer_0.7.0.bb         |  6 +++
> >  .../python/python3-libfdt_1.7.0.post1.bb      | 20 +++++++++
> >  .../python/python3-pathspec_0.11.1.bb         |  2 +
> >  .../python/python3-pygobject_3.44.1.bb        |  5 ++-
> >  .../python/python3-pyproject-hooks_1.0.0.bb   |  5 ++-
> >  .../python/python3-setuptools-rust_1.5.2.bb   | 17 ++++----
> >  .../python/python3-sphinx-rtd-theme_1.2.0.bb  |  5 ++-
> >  .../python/python3-tomli_2.0.1.bb             |  5 +++
> >  .../python/python3/python3-manifest.json      | 42 +++++++++++++++++++
> >  15 files changed, 121 insertions(+), 25 deletions(-)
> >  create mode 100644 meta/recipes-devtools/python/
> python3-libfdt_1.7.0.post1.bb
> >
> > --
> > 2.39.2
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181479):
> https://lists.openembedded.org/g/openembedded-core/message/181479
> Mute This Topic: https://lists.openembedded.org/mt/98943996/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d57e8905fc00b319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you, Bartosz. I didn&#39;t review in great dept=
h, but others have done so. This series looks like a</div><div>step in the =
right direction.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 17, 2023 at 1:39=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks f=
or this work. Perhaps we could catch this easier if there are<br>
runtime tests for those items, maybe in the shape of ptest.<br>
<br>
Sometimes recipes have no longer needed dependencies too, and trimming<br>
those down is harder, but also appreciated.<br>
<br></blockquote><div>One challenge has been the additional dependencies th=
at come in for ptests. Another is that</div><div>many PyPi packages do not =
include their /tests/ directory,=C2=A0meaning we would need to switch to</d=
iv><div>the git fetcher in many cases. My intent has always been &quot;full=
&quot; ptest coverage, when practical.</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Alex<br>
<br>
On Wed, 17 May 2023 at 10:06, Bartosz Golaszewski &lt;<a href=3D"mailto:brg=
l@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.golaszewski@li=
naro.org" target=3D"_blank">bartosz.golaszewski@linaro.org</a>&gt;<br>
&gt;<br>
&gt; I noticed that every now and then I import some python package into an=
<br>
&gt; image only to find out the recipe didn&#39;t pull in all required run-=
time<br>
&gt; dependencies. I would fix it whenever I noticed it but figured that I<=
br>
&gt; could right a script that would go over all python packages, build a<b=
r>
&gt; minimal image and see that all its modules can be imported.<br>
&gt;<br>
&gt; The patches in this series are the result of that. Most simply add<br>
&gt; missing RDEPENDS, some are additional tweaks to recipes and the last<b=
r>
&gt; three add new standard library packages to the manifest. These are the=
<br>
&gt; ones for which simply adding python3-misc would still be insufficient =
in<br>
&gt; terms of run-time dependencies.<br>
&gt;<br>
&gt; I plan to do the same for meta-python but this will take more time and=
 I<br>
&gt; need to think of some automated way of updating the recipes first.<br>
&gt;<br>
&gt; Bartosz Golaszewski (20):<br>
&gt;=C2=A0 =C2=A0python3-async: add missing run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-attrs: unify RDEPENDS<br>
&gt;=C2=A0 =C2=A0python3-attrs: don&#39;t use PYTHON_PN<br>
&gt;=C2=A0 =C2=A0python3-attrs: add missing run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-certifi: add missing run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-libfdt: new package<br>
&gt;=C2=A0 =C2=A0python3-dtschema: add missing run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-hypothesis: fix run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-tomli: add missing run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-pathspec: add missing run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-installer: add missing run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-sphinx-rtd-theme: add missing run-time dependencie=
s<br>
&gt;=C2=A0 =C2=A0python3-setuptools-rust: fix RDEPENDS and allow target bui=
ld<br>
&gt;=C2=A0 =C2=A0python3-pyproject-hooks: add missing run-time dependencies=
<br>
&gt;=C2=A0 =C2=A0python3-pycryptodome: don&#39;t use PYTHON_PN<br>
&gt;=C2=A0 =C2=A0python3-pycryptodome: add missing run-time dependencies<br=
>
&gt;=C2=A0 =C2=A0python3-pygobject: add missing run-time dependencies<br>
&gt;=C2=A0 =C2=A0python3-manifest: cgitb: new package<br>
&gt;=C2=A0 =C2=A0python3-manifest: zipapp: new package<br>
&gt;=C2=A0 =C2=A0python3-manifest: turtle: new package<br>
&gt;<br>
&gt;=C2=A0 meta/recipes-devtools/python/python-async.inc |=C2=A0 5 ++-<br>
&gt;=C2=A0 .../python/python-pycryptodome.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++--<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-attrs_23.1.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-attrs_23.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 15 +++----<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-certifi_2022.12.7.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-certifi_2022.12.7.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-dtschema_2023.4.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-dtschema_2023.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-hypothesis_6.71.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-hypothesis_6.71.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-installer_0.7.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-installer_0.7.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-libfdt_1.7.0.post1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-libfdt_1.7.0.post1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 | 20 +++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pathspec_0.11.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pathspec_0.11.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pygobject_3.44.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-pygobject_3.44.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 5 ++-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pyproject-hooks_1.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pyproject-hooks_1.0.0.bb</a>=C2=
=A0 =C2=A0|=C2=A0 5 ++-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-setuptools-rust_1.5.2.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-setuptools-rust_1.5.2.bb</a>=C2=
=A0 =C2=A0| 17 ++++----<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-sphinx-rtd-theme_1.2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-sphinx-rtd-theme_1.2.0.bb</a>=
=C2=A0 |=C2=A0 5 ++-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-tomli_2.0.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-tomli_2.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++<br>
&gt;=C2=A0 .../python/python3/python3-manifest.json=C2=A0 =C2=A0 =C2=A0 | 4=
2 +++++++++++++++++++<br>
&gt;=C2=A0 15 files changed, 121 insertions(+), 25 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-libfdt_1.7.0.post1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-libfdt_1.7.0.post1.bb</a><br>
&gt;<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181479): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181479" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181479</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98943996/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
98943996/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d57e8905fc00b319--

