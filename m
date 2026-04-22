Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A19F9B5F7
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:33:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76982.1776850386210607868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 02:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GqG9zs0n;
 spf=pass (domain: smile.fr, ip: 209.85.208.43, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so7634284a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 02:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776850384; cv=none;
        d=google.com; s=arc-20240605;
        b=b4Bfbth73rSH89HvpAb3uIlM1L2iULWU7hZccUlQuHUWCGuAwy1ZTGevFRpTUzXaf7
         +AtfmVQi8COcJNYEaBq5eyv+4Oh4b8S9K8XnHxpZpAv/XbwApVvezlzGAw1I9F+VeAKN
         Wd9r3cbUwJgCsX96hGChLfu55T7u/wCCdvQ1d5xUvko/yk1HLTm0dVKzKgGKImmIcatp
         wyC112k70NKUIHAfoREfP2Y+VEQWYTpnrQtMQk8c6jQkNJK9sZQdKhPJmLssevKGq9x0
         /q2+fe+C0nlO2FozrXGE9GoE0zeRx3LaLuELCuiopmfXwlM2ukITFp6kYUG5E5FrQnIJ
         WlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W+QGYEzdCyc96eJ95GltOerFKbGfcc/AvXcX04mQkX8=;
        fh=iuh7a7WO4MHJcgXMAsTgtgz6Gu8xH5WATMAPKsgVKvk=;
        b=B45cFlg+YNp9l07WSEfjxWdQNQwosyEO8BoRddeBYzo0rsQWStRZwDngIKTeqfKcWt
         FNDrw8HRsxrNpF2//B77zEuRaHf6FTS+7FGcpQv4kkZyogrDWWEwOYYJQV138Bbn6xsn
         9rPF6OeMpWYOyzaeC1zAeb8lTc+Mgn9W/KkSNlnTBCA8Sdom55o5vXxto830l9Su5pE6
         HYaBCeA2mWZDL3RnW0Jt4huNCfudIJEFntRgSxdXaDrjHD1ZmDYivgTpmTXzyc7LHd6t
         GiYtHrM0c8z1eDjqsJ41PnNNQMcQUM3GYGXdztS2Qw4Z1Ysu5g7Ke7wiQjQq7bWnJlh+
         hQbA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776850384; x=1777455184; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W+QGYEzdCyc96eJ95GltOerFKbGfcc/AvXcX04mQkX8=;
        b=GqG9zs0nZwqWUyi19OPiUC3uM+9dlVLbGt8kDjBtA5V4TujQKY0lbFr8yJGKrPFj4u
         ro7IXYvUCP987wlhj7uar4/SmewVwANkcYQ9r/5NtwyJtd0k3UTOJw92XcaPQiabVGBi
         cgNmY73JjcAN5Q5jAsYJeviQG302mKGtadUZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850384; x=1777455184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+QGYEzdCyc96eJ95GltOerFKbGfcc/AvXcX04mQkX8=;
        b=VW4OWG9D4Z8kHTqTSNqa4VAI8uuyPLNdWP9Ybs8PgIOorOpy6XDyMy3SwEq5riJz3T
         HfkLk4j2UsAeHWX4oekzk/jfJvZHUVUk2Q9XpBPiAGZ7tb7ADRDAyW54Nmsl75EuQNK3
         xLdJnmR4Urs5XINk3UEGCK+2uLCozGXq3Wu+8w7GY7MFaMHekYFgxia7b1ZHqTyYAXVD
         QqZ1lIPrtaUKgGTcvAeCZxnjxsgRgamn6aKiX72UeYa11onccU2B6vcVgQM+yhK7S+pi
         7omg4ogriUiIxLV7ybAIJUQrB84lH1CNwudnedDvUGqSCXOdCXXu6CwOvV2rJYZwsGk5
         lPuA==
X-Gm-Message-State: AOJu0YwB5AV47fHktdM+CmzopxZ3MMHtp7ucIBhNcjfZUGCy0svrPZfF
	wDXQ0tFTr4S85jG1wOGioefQxHjZBPaieRfuvDdeGvVqFadsBJUXc5voXv3ODPKZp8DSz1Le+lN
	+IXIeXAi38VYP3FLShxjwN5NOaOMqx9uB+AbbfdSaTQ==
X-Gm-Gg: AeBDievn3KkwZPh23zort1nFn9it35+M3RUboQhYTUkPceGmATGqqeV4vQLJx+Tlu4k
	qVoWDz4YWNHvQKHow0jxS4aeK4f6XLLkfFk0NNaaehld7/zlLLJvadJHh2O/Sc8RuW0ekjjHKpk
	sMosipyzK6Op5JmktAAK00jcC7UXY+3r3qzl6eutHaDxRn1AIDdCylTOjiEzsSZa9QCu64owoZ2
	neUjuJIXG/6ukNZUrRAnXecM3jFZ7GC8RzJR/5AoF794hoOQ/1kI/MQCtSq8wcaa3HWj2nHXz9d
	SIIBl50HIyNf2LtdmVQJRf1d5POfEz/VdFIh9xZXlOOfP8Pk
X-Received: by 2002:a05:6402:46c5:b0:672:c1d6:6855 with SMTP id
 4fb4d7f45d1cf-672c1d66a46mr7192423a12.3.1776850384361; Wed, 22 Apr 2026
 02:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260420143154.452247-2-corentin.guillevic@smile.fr> <DHY27VP0PXS1.3BCMSWT6AHOW9@bootlin.com>
In-Reply-To: <DHY27VP0PXS1.3BCMSWT6AHOW9@bootlin.com>
From: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
Date: Wed, 22 Apr 2026 11:32:52 +0200
X-Gm-Features: AQROBzAb4svpS81uG2Q5bodtRQV8kHnFiFgB0WCix2uOvxF6q1EH0laevLwg7tg
Message-ID: <CAMFqQmo=Sngdi4Tbsnhs+UYXtmt4_FL8jzdqw7jag6RzzVqbYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] sanity: add check for own-mirrors/SOURCE_MIRROR_URL
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fab0b40650093710"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235704

--000000000000fab0b40650093710
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

Sure, but my test has been added to the sanity class. The
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/qa-ch=
ecks.rst
doc
is related to the insane class. Is there a document relating to the sanity
class in which I can document the new test?

Corentin

Le lun. 20 avr. 2026 =C3=A0 16:42, Antonin Godard <antonin.godard@bootlin.c=
om> a
=C3=A9crit :

> On Mon Apr 20, 2026 at 4:31 PM CEST, Corentin Guillevic via
> lists.openembedded.org wrote:
> > From: Corentin Guillevic <corentin.guillevic@smile.fr>
> >
> > The SOURCE_MIRROR_URL variable belongs to the own-mirrors class.
> However, the
> > user may forget to define it. This will cause the class to inject
> incorrect
> > content into PREMIRRORS, resulting in the following error:
> >
> > ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error:
> MalformedUrl('${SOURCE_MIRROR_URL}')
> > ERROR: Logfile of failure stored in:
> /path/to/tmp/work/x86_64-linux/gettext-minimal-native/1.0/temp/log.do_fet=
ch.258066
> > ERROR: Task
> (/path/to/layers/poky/meta/recipes-core/gettext/gettext-minimal-native_1.=
0.bb:do_fetch)
> failed with exit code '1'
> >
> > Add a check to the sanity class, to detect this case and raise an error=
.
> >
> > Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> > ---
> >
> > Notes:
> >     Changes in v3:
> >     - Unused variable removed.
> >
> >  meta/classes-global/sanity.bbclass | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/classes-global/sanity.bbclass
> b/meta/classes-global/sanity.bbclass
> > index 1a490f8d61..3142ff61f2 100644
> > --- a/meta/classes-global/sanity.bbclass
> > +++ b/meta/classes-global/sanity.bbclass
> > @@ -984,6 +984,10 @@ def check_sanity_everybuild(status, d):
> >              "Please set TMPDIR to a clean path with no trailing slash
> or "
> >              "consecutive slashes (e.g. %s).\n" % (tmpdir,
> os.path.normpath(tmpdir)))
> >
> > +    # Check whether the SOURCE_MIRROR_URL variable, belonging to the
> 'own-mirrors' class, is defined
> > +    if oe.utils.inherits(d, 'own-mirrors') and not
> d.getVar('SOURCE_MIRROR_URL'):
> > +        status.addresult("own-mirrors is enabled, but SOURCE_MIRROR_UR=
L
> is not defined")
> > +
> >      # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
> >      import re
> >      mirror_vars =3D ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
>
> Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
>
> This should be added to
>
> https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/qa-=
checks.rst
> if merged and if you have some time and can send a patch to
> docs@lists.yoctoproject.org :)
>
> Thanks,
> Antonin
>

--000000000000fab0b40650093710
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Antonin,</div><div><br></div><div>Sure, but my tes=
t has been added to the sanity class. The=C2=A0<a href=3D"https://git.yocto=
project.org/yocto-docs/tree/documentation/ref-manual/qa-checks.rst" rel=3D"=
noreferrer" target=3D"_blank">https://git.yoctoproject.org/yocto-docs/tree/=
documentation/ref-manual/qa-checks.rst</a>=C2=A0doc is related to the insan=
e class.=C2=A0Is there a document relating to the sanity class in which I c=
an document the new test?</div><div><br></div><div>Corentin</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lu=
n. 20 avr. 2026 =C3=A0=C2=A016:42, Antonin Godard &lt;<a href=3D"mailto:ant=
onin.godard@bootlin.com" target=3D"_blank">antonin.godard@bootlin.com</a>&g=
t; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Mon Apr 20, 2026 at 4:31 PM CEST, Corentin Guillevic via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; From: Corentin Guillevic &lt;<a href=3D"mailto:corentin.guillevic@smil=
e.fr" target=3D"_blank">corentin.guillevic@smile.fr</a>&gt;<br>
&gt;<br>
&gt; The SOURCE_MIRROR_URL variable belongs to the own-mirrors class. Howev=
er, the<br>
&gt; user may forget to define it. This will cause the class to inject inco=
rrect<br>
&gt; content into PREMIRRORS, resulting in the following error:<br>
&gt;<br>
&gt; ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error: =
MalformedUrl(&#39;${SOURCE_MIRROR_URL}&#39;)<br>
&gt; ERROR: Logfile of failure stored in: /path/to/tmp/work/x86_64-linux/ge=
ttext-minimal-native/1.0/temp/log.do_fetch.258066<br>
&gt; ERROR: Task (/path/to/layers/poky/meta/recipes-core/gettext/gettext-mi=
nimal-native_1.0.bb:do_fetch) failed with exit code &#39;1&#39;<br>
&gt;<br>
&gt; Add a check to the sanity class, to detect this case and raise an erro=
r.<br>
&gt;<br>
&gt; Signed-off-by: Corentin Guillevic &lt;<a href=3D"mailto:corentin.guill=
evic@smile.fr" target=3D"_blank">corentin.guillevic@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Notes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Changes in v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Unused variable removed.<br>
&gt;<br>
&gt;=C2=A0 meta/classes-global/sanity.bbclass | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/=
sanity.bbclass<br>
&gt; index 1a490f8d61..3142ff61f2 100644<br>
&gt; --- a/meta/classes-global/sanity.bbclass<br>
&gt; +++ b/meta/classes-global/sanity.bbclass<br>
&gt; @@ -984,6 +984,10 @@ def check_sanity_everybuild(status, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Please set TMPDI=
R to a clean path with no trailing slash or &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;consecutive slas=
hes (e.g. %s).\n&quot; % (tmpdir, os.path.normpath(tmpdir)))<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 # Check whether the SOURCE_MIRROR_URL variable, belongi=
ng to the &#39;own-mirrors&#39; class, is defined<br>
&gt; +=C2=A0 =C2=A0 if oe.utils.inherits(d, &#39;own-mirrors&#39;) and not =
d.getVar(&#39;SOURCE_MIRROR_URL&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&quot;own-mirrors is ena=
bled, but SOURCE_MIRROR_URL is not defined&quot;)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Check the format of MIRRORS, PREMIRRORS and SSTA=
TE_MIRRORS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mirror_vars =3D [&#39;MIRRORS&#39;, &#39;PREMIRROR=
S&#39;, &#39;SSTATE_MIRRORS&#39;]<br>
<br>
Reviewed-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.co=
m" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
<br>
This should be added to<br>
<a href=3D"https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-m=
anual/qa-checks.rst" rel=3D"noreferrer" target=3D"_blank">https://git.yocto=
project.org/yocto-docs/tree/documentation/ref-manual/qa-checks.rst</a><br>
if merged and if you have some time and can send a patch to <a href=3D"mail=
to:docs@lists.yoctoproject.org" target=3D"_blank">docs@lists.yoctoproject.o=
rg</a> :)<br>
<br>
Thanks,<br>
Antonin<br>
</blockquote></div>

--000000000000fab0b40650093710--

