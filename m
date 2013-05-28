Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id D98E26A59B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 15:26:02 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so1813965obq.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=b2CFDilSt1Q2Xd6EDOb/lNdVkFcOCwhnp8JmAm1o0ys=;
	b=E4Y1s69f/VxQhDdmCi3kpY2sR+k7sx/B8ZQAzEQPf1bzb3vnxl0GHxnLScHA55kEGc
	gr1/ufB7iv9EZ57NdroFrGDXvHbw8tbBWn6Bm9/ZcaEGy16vUPI70rar7u8OP1QF3KWT
	uDLbsAc3SQ7wNlfhGSRnSymXXGm1c82EF+aAH3UEvwY90L1bZf+yCiaStH/8yIVXHytu
	ondk2k0Dpaj2wTqsLtmvgrE428up9gr6lB3I24M6HuotT5PUJz4ja/S8bhnRulZS3X/u
	wxM6UjYCyBuSEfSxbrv5s9qXL/rTP7h+UPssS/zxVk5meCmg5x3cGRQinTs3FMj8U+Nu
	q40g==
MIME-Version: 1.0
X-Received: by 10.60.94.70 with SMTP id da6mr43480oeb.63.1369754763483; Tue,
	28 May 2013 08:26:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Tue, 28 May 2013 08:26:03 -0700 (PDT)
In-Reply-To: <20130528172135.187001c7@e6520eb>
References: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
	<1369753938.8846.8.camel@phil-desktop.brightsign>
	<CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
	<20130528172135.187001c7@e6520eb>
Date: Tue, 28 May 2013 12:26:03 -0300
X-Google-Sender-Auth: 0r3J0UBWp3vYMypcWcYn_ZNKobA
Message-ID: <CAP9ODKqxoAU=5iaCo=XcotJg_yOto8sDbSQpvdym3AqYZ5uUng@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add COMPATIBLE_DISTRO_FEATURES support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 May 2013 15:26:03 -0000
Content-Type: multipart/alternative; boundary=089e012287c01b66b004ddc8e21c

--089e012287c01b66b004ddc8e21c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 12:21 PM, Eric B=E9nard <eric@eukrea.com> wrote:

> Hi Otavio,
>
> Le Tue, 28 May 2013 12:18:21 -0300,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>
> > On Tue, May 28, 2013 at 12:12 PM, Phil Blundell <pb@pbcl.net> wrote:
> > > Also also, we've managed without this functionality in oe-core for so=
me
> > > time which makes me wonder how widely useful it would actually be.  I=
f
> > > it's only going to be used by a few recipes then it could go in a
> class,
> > > or in in the recipes themselves, rather than adding parse time and
> > > memory footprint to every recipe.
> > >
> >
> > Right; let's first agree in the code so we can discuss where to put it:
> >
> > +        need_distro_features =3D d.getVar('REQUIRED_DISTRO_FEATURES',
> True)
> > +        if need_distro_features:
> > +            need_distro_features =3D need_distro_features.split()
> > +            distro_features =3D (d.getVar('DISTRO_FEATURES', True) or
> > "").split()
> > +            for f in need_distro_features:
> > +                if f in distro_features:
> > +                    break
> > +            else:
> > +                raise bb.parse.SkipPackage("missing required distro
> > feature %s (not in DISTRO_FEATURES)" % need_distro_features)
> >
> >
> If I follow you want that to avoid this line in a recipe :
> COMPATIBLE_MACHINE =3D "{@base_contains('DISTRO_FEATURES', 'x11', (mx5),
> '', d)}"
> maybe there is a more clean way to exclude this recipe when x11
> is not present without impacting the whole build system ?
>

This is one place it'd be used. Wayland support is another.

It can be placed in a class, no problem ... I just want people to agree in
the code so I  can send a v2.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e012287c01b66b004ddc8e21c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, May 28, 2013 at 12:21 PM, Eric B=E9nard <span dir=3D"ltr">&=
lt;<a href=3D"mailto:eric@eukrea.com" target=3D"_blank">eric@eukrea.com</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Otavio,<br>
<br>
Le Tue, 28 May 2013 12:18:21 -0300,<br>
Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossys=
tems.com.br</a>&gt; a =E9crit :<br>
<div class=3D"im"><br>
&gt; On Tue, May 28, 2013 at 12:12 PM, Phil Blundell &lt;<a href=3D"mailto:=
pb@pbcl.net">pb@pbcl.net</a>&gt; wrote:<br>
</div><div class=3D"im">&gt; &gt; Also also, we&#39;ve managed without this=
 functionality in oe-core for some<br>
&gt; &gt; time which makes me wonder how widely useful it would actually be=
. =A0If<br>
&gt; &gt; it&#39;s only going to be used by a few recipes then it could go =
in a class,<br>
&gt; &gt; or in in the recipes themselves, rather than adding parse time an=
d<br>
&gt; &gt; memory footprint to every recipe.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Right; let&#39;s first agree in the code so we can discuss where to pu=
t it:<br>
&gt;<br>
&gt; + =A0 =A0 =A0 =A0need_distro_features =3D d.getVar(&#39;REQUIRED_DISTR=
O_FEATURES&#39;, True)<br>
&gt; + =A0 =A0 =A0 =A0if need_distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0need_distro_features =3D need_distro_features=
.split()<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0distro_features =3D (d.getVar(&#39;DISTRO_FEA=
TURES&#39;, True) or<br>
&gt; &quot;&quot;).split()<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0for f in need_distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if f in distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0else:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0raise bb.parse.SkipPackage(&quot;miss=
ing required distro<br>
&gt; feature %s (not in DISTRO_FEATURES)&quot; % need_distro_features)<br>
&gt;<br>
&gt;<br>
</div>If I follow you want that to avoid this line in a recipe :<br>
COMPATIBLE_MACHINE =3D &quot;{@base_contains(&#39;DISTRO_FEATURES&#39;, &#3=
9;x11&#39;, (mx5),<br>
&#39;&#39;, d)}&quot;<br>
maybe there is a more clean way to exclude this recipe when x11<br>
is not present without impacting the whole build system ?<br></blockquote><=
div><br></div><div style>This is one place it&#39;d be used. Wayland suppor=
t is another.</div><div style><br></div><div style>It can be placed in a cl=
ass, no problem ... I just want people to agree in the code so I =A0can sen=
d a v2.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e012287c01b66b004ddc8e21c--
