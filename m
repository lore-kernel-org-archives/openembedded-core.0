Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoKtR-0002s1-Li
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 22:49:17 +0200
Received: by yenl13 with SMTP id l13so9841950yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 13:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=uGVtGTcyDdcZQJpXzH6WkoBptUdTO9VJxO8baRG8jIg=;
	b=Txj2+sRkCyMVnJdV99jsWpPNm+XyG7zG/Mm83cxl8hB6is5KabcJ8iXm+C9jw9ntfH
	xhDrz1jtIGG8/J0ZusfCeJE/X+upIT3CzYc2sIa+3s4iqcZgsT/MsvbeiScf7mK7QXXD
	5gn7ahm6sH1puYcWWgUQeKwVbLcVoOFLqBwzZqCf8JMbyvvodAxZ3tR7dVhSF0c+89Bb
	GanwpjU4xyr9dbAaPeYKBA36eD7dFMKAkz1ZigcQvLlr6/gKl2loDTIXAQf06eKK8yw4
	LjITYknsg6Iwv/enkeSLSKBU9dw6B7O4beThYMDQYSdp0oSU8bL9r7+3xrJs0K6zU3t0
	FkWg==
Received: by 10.50.87.138 with SMTP id ay10mr9489016igb.43.1341866287369; Mon,
	09 Jul 2012 13:38:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 13:37:47 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <alpine.DEB.2.02.1207091630380.24097@oneiric>
References: <alpine.DEB.2.02.1207081227430.27741@oneiric>
	<CAK18fxFD1X6tPLsXG-vwRFu-EeEZDTdeKoTKRYAvYrKJfd-_mQ@mail.gmail.com>
	<alpine.DEB.2.02.1207091630380.24097@oneiric>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 23:37:47 +0300
Message-ID: <CAK18fxE=rCL_A6=WRGHRgqFWRwB5hKMJmDcj2t8y1GzNyU+y3w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl6mtKVc+LVzhQhQocaFOPaC4YrG08bAXRZzLmVsTZA89YksR5ofNfl8ZVDulH9a0zcLe2z
Subject: Re: more pedantry -- looking to clarify layers definition, BBPATH, BBFILES, etc.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 20:49:18 -0000
Content-Type: multipart/alternative; boundary=e89a8f3ba673650eff04c46b976c

--e89a8f3ba673650eff04c46b976c
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 9, 2012 at 11:34 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Mon, 9 Jul 2012, Andrei Gherzan wrote:
>
> >
> > On Sun, Jul 8, 2012 at 8:59 PM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
> >
> >         (most of this is sort of self-evident but it's not documented as
> >       well as it could be so i just want to make sure i have it exactly
> >       right.)
> >
> >         snippets of some layer.conf files:
> >
> >       oe-core:
> >
> >       BBPATH .= ":${LAYERDIR}"
> >       BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
> >
> >       meta-hob:
> >
> >       BBPATH := "${BBPATH}:${LAYERDIR}"
> >       BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
> >
> >       meta-yocto:
> >
> >       BBPATH := "${LAYERDIR}:${BBPATH}"
> >       BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
> >                   ${LAYERDIR}/recipes-*/*/*.bbappend"
> >
> >         note how meta-hob *appends* itself to BBPATH, while meta-yocto
> >       *prepends* itself.  is there no possibility that this will cause
> some
> >       confusion based on how BBPATH is used to resolve the location of
> class
> >       or conf files?  i realize you should try to avoid that sort of
> >       conflict but it still seems possible that someone might choose the
> >       names of some files badly and the unpredictable ordering in BBPATH
> >       will cause grief, no?
> >
> >
> > I don't think this can cause any problems.
>
>   are you sure?
>
>
As i said, as long as PRIORITY is set accordingly.

@g

--e89a8f3ba673650eff04c46b976c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Jul 9, 2012 at 11:34 PM, Robert P. J. Da=
y <span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"=
_blank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">

On Mon, 9 Jul 2012, Andrei Gherzan wrote:<br>
<br>
&gt;<br>
&gt; On Sun, Jul 8, 2012 at 8:59 PM, Robert P. J. Day &lt;<a href=3D"mailto=
:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 (most of this is sort of self-evident but it&#39;s not=
 documented as<br>
&gt; =A0 =A0 =A0 well as it could be so i just want to make sure i have it =
exactly<br>
&gt; =A0 =A0 =A0 right.)<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 snippets of some layer.conf files:<br>
&gt;<br>
&gt; =A0 =A0 =A0 oe-core:<br>
&gt;<br>
&gt; =A0 =A0 =A0 BBPATH .=3D &quot;:${LAYERDIR}&quot;<br>
&gt; =A0 =A0 =A0 BBFILES +=3D &quot;${LAYERDIR}/recipes-*/*/*.bb&quot;<br>
&gt;<br>
&gt; =A0 =A0 =A0 meta-hob:<br>
&gt;<br>
&gt; =A0 =A0 =A0 BBPATH :=3D &quot;${BBPATH}:${LAYERDIR}&quot;<br>
&gt; =A0 =A0 =A0 BBFILES :=3D &quot;${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb=
&quot;<br>
&gt;<br>
&gt; =A0 =A0 =A0 meta-yocto:<br>
&gt;<br>
&gt; =A0 =A0 =A0 BBPATH :=3D &quot;${LAYERDIR}:${BBPATH}&quot;<br>
&gt; =A0 =A0 =A0 BBFILES :=3D &quot;${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb=
 \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${LAYERDIR}/recipes-*/*/*.bbappend=
&quot;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 note how meta-hob *appends* itself to BBPATH, while me=
ta-yocto<br>
&gt; =A0 =A0 =A0 *prepends* itself. =A0is there no possibility that this wi=
ll cause some<br>
&gt; =A0 =A0 =A0 confusion based on how BBPATH is used to resolve the locat=
ion of class<br>
&gt; =A0 =A0 =A0 or conf files? =A0i realize you should try to avoid that s=
ort of<br>
&gt; =A0 =A0 =A0 conflict but it still seems possible that someone might ch=
oose the<br>
&gt; =A0 =A0 =A0 names of some files badly and the unpredictable ordering i=
n BBPATH<br>
&gt; =A0 =A0 =A0 will cause grief, no?<br>
&gt;<br>
&gt;<br>
&gt; I don&#39;t think this can cause any problems.<br>
<br>
=A0 are you sure?<br><br></blockquote><div><br></div><div>As i said, as lon=
g as PRIORITY is set accordingly.=A0</div><div><br></div><div>@g=A0</div></=
div>

--e89a8f3ba673650eff04c46b976c--
