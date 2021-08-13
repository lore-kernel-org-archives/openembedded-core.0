Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.31025.1628816619816487823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 18:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hNAhFwg9;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id j18so9092177ile.8
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 18:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Gae7+FDDfjOuO6KlZkLOx5hHyWhp7/UBSMdK+a+W6o=;
        b=hNAhFwg9ZUTc5TeTb7lXRm1MUm8TjO57pWP8dlMWMSQz7G7JJhdpBw++8O16K+jNGk
         iabjTISfJoXWo1lUw9HlEwZuwrKebsM8v/8zIB0R6phrsH598Hvmi3kA6wgyiVlucLF2
         r5HWylD127KEDTi8AkeU4hH4USDqvy/qNNKuKmw+DnWi5exefnn0XCQFUgFf/IKaFPKS
         uuFkCqOqHamVxIc+r3C20zIbYpQtBOvTLMJUkvIyaiDAvP/XvRoBNaly6650igJme168
         m+L839BWViI4/19D9SWLOp8A/0hthAru2OaKKiyC94MQg3o2hPPspFIbtTzWhSSzEFBV
         HBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Gae7+FDDfjOuO6KlZkLOx5hHyWhp7/UBSMdK+a+W6o=;
        b=NHkO4S1eLuvJ8lCNltpvZkorp9yYImskq9CbWAfnS0ql6+5wVqzseRrobtwf/OqEo6
         vxKiejolOe5CY5ul+AT43bqVoEzlO2tDm40Xx6pyUaO1c1vC0ACBRSlCozrei/V1/1I/
         cNz0UscKiL3ENmvbBSce+Yvw9zIX/4hkduyYE+j+RJVsjXv+aSfR+xK6fv80b2fGTTW7
         MJcq2xJtJsJ0LaplOCqj0k2walchFKD0+ixz0K31cs68dM7k8Vjbz+n6Jlv0SKg9RADj
         8e6JCWkoN/+BPxeImDAeMAnbs5RARR0awyY7J6r6pvA+mu1bhayPcJCm+pFlJI7dyrip
         GTxQ==
X-Gm-Message-State: AOAM530n5jM1QflgA0doKACqt8nVQXFspak3xkYoIeXMg1fJJ35Zrapm
	GM9IN562GAw6rjvG/+mdNGVb8NcSigIQNSm45vk=
X-Google-Smtp-Source: ABdhPJxGfslC5nn3jfTgm+DOcYmg2iSryJRlKrZo2ewlYp+UfdiDQEE5NJDsYnmCdPGrv/Zs/P+TmSXbisC/0ivD8JM=
X-Received: by 2002:a05:6e02:1bac:: with SMTP id n12mr926090ili.151.1628816619059;
 Thu, 12 Aug 2021 18:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210810110350.7078-1-paul@pbarker.dev> <fe659534-214a-0c7e-f407-2da6c3dfb59b@gmail.com>
In-Reply-To: <fe659534-214a-0c7e-f407-2da6c3dfb59b@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 12 Aug 2021 18:03:28 -0700
Message-ID: <CANx9H-AEeTat=C916jiEDc1jpcKr-8YirOfSTVCj2fnP7eUoyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi: Allow override of PyPI archive name
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fbbc8505c9666bb0"

--000000000000fbbc8505c9666bb0
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 12, 2021 at 5:58 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/10/21 4:03 AM, Paul Barker wrote:
> > Some packages on PyPI don't follow the usual expectations for archive
> > naming. For example, the archive for asyncio-mqtt 0.10.0 is named
> > asyncio_mqtt-0.10.0.tar.gz (with an underscore instead of the dash used
> > in the package name).
> >
> > To handle these edge cases a new PYPI_ARCHIVE_NAME variable is
> > introduced. By default this is set to the expected archive name based on
> > the PyPI package name, version and extension but it can be set to a
> > different value if needed in a recipe which inherits the pypi class.
> >
>
> how many such packages are there roughly ? does it deserve to be
> addressed via introducing another variable I wonder.
>

There are 29 packages in meta-oe/meta-python that fail to check latest
upstream version and so far (13/29) it has been for very similar dash vs.
underscore in the SRC_URI (from local AUH run). Not sure it is the complete
solution, but it might help. Might need to apply to the upstream regex too
in that case?


> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >   meta/classes/pypi.bbclass | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> > index 272c220bca..9405d58601 100644
> > --- a/meta/classes/pypi.bbclass
> > +++ b/meta/classes/pypi.bbclass
> > @@ -8,12 +8,12 @@ def pypi_package(d):
> >
> >   PYPI_PACKAGE ?= "${@pypi_package(d)}"
> >   PYPI_PACKAGE_EXT ?= "tar.gz"
> > +PYPI_ARCHIVE_NAME ?= "${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}"
> >
> >   def pypi_src_uri(d):
> >       package = d.getVar('PYPI_PACKAGE')
> > -    package_ext = d.getVar('PYPI_PACKAGE_EXT')
> > -    pv = d.getVar('PV')
> > -    return '
> https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' %
> (package[0], package, package, pv, package_ext)
> > +    archive_name = d.getVar('PYPI_ARCHIVE_NAME')
> > +    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s' %
> (package[0], package, archive_name)
> >
> >   PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
> >
> >
> >
> >
> >
> >
>
> 
>
>

--000000000000fbbc8505c9666bb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 12, 2021 at 5:58 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br>
<br>
On 8/10/21 4:03 AM, Paul Barker wrote:<br>
&gt; Some packages on PyPI don&#39;t follow the usual expectations for arch=
ive<br>
&gt; naming. For example, the archive for asyncio-mqtt 0.10.0 is named<br>
&gt; asyncio_mqtt-0.10.0.tar.gz (with an underscore instead of the dash use=
d<br>
&gt; in the package name).<br>
&gt; <br>
&gt; To handle these edge cases a new PYPI_ARCHIVE_NAME variable is<br>
&gt; introduced. By default this is set to the expected archive name based =
on<br>
&gt; the PyPI package name, version and extension but it can be set to a<br=
>
&gt; different value if needed in a recipe which inherits the pypi class.<b=
r>
&gt; <br>
<br>
how many such packages are there roughly ? does it deserve to be <br>
addressed via introducing another variable I wonder.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">There are 29 pac=
kages in meta-oe/meta-python that fail to check latest upstream version and=
 so far (13/29) it has been for very similar dash vs. underscore in the SRC=
_URI (from local AUH run). Not sure it is the complete solution, but it mig=
ht help. Might need to apply to the upstream regex too in that case?</div><=
div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev" tar=
get=3D"_blank">paul@pbarker.dev</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/pypi.bbclass | 6 +++---<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass<br>
&gt; index 272c220bca..9405d58601 100644<br>
&gt; --- a/meta/classes/pypi.bbclass<br>
&gt; +++ b/meta/classes/pypi.bbclass<br>
&gt; @@ -8,12 +8,12 @@ def pypi_package(d):<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PYPI_PACKAGE ?=3D &quot;${@pypi_package(d)}&quot;<br>
&gt;=C2=A0 =C2=A0PYPI_PACKAGE_EXT ?=3D &quot;tar.gz&quot;<br>
&gt; +PYPI_ARCHIVE_NAME ?=3D &quot;${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT=
}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def pypi_src_uri(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0package =3D d.getVar(&#39;PYPI_PACKAGE&#39;)=
<br>
&gt; -=C2=A0 =C2=A0 package_ext =3D d.getVar(&#39;PYPI_PACKAGE_EXT&#39;)<br=
>
&gt; -=C2=A0 =C2=A0 pv =3D d.getVar(&#39;PV&#39;)<br>
&gt; -=C2=A0 =C2=A0 return &#39;<a href=3D"https://files.pythonhosted.org/p=
ackages/source/%s/%s/%s-%s.%s" rel=3D"noreferrer" target=3D"_blank">https:/=
/files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s</a>&#39; % (package[=
0], package, package, pv, package_ext)<br>
&gt; +=C2=A0 =C2=A0 archive_name =3D d.getVar(&#39;PYPI_ARCHIVE_NAME&#39;)<=
br>
&gt; +=C2=A0 =C2=A0 return &#39;<a href=3D"https://files.pythonhosted.org/p=
ackages/source/%s/%s/%s" rel=3D"noreferrer" target=3D"_blank">https://files=
.pythonhosted.org/packages/source/%s/%s/%s</a>&#39; % (package[0], package,=
 archive_name)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PYPI_SRC_URI ?=3D &quot;${@pypi_src_uri(d)}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000fbbc8505c9666bb0--
