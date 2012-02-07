Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ruqq5-00075r-Jf
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 20:36:29 +0100
Received: by eaal10 with SMTP id l10so2022267eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 11:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=syGRCZ/IdB24oVCxAix+wCSbCEz7qa3hxs6BEv95fdo=;
	b=mvK2qXFgZLy0laSlplxwDtMhLKG8eCKNdaGUtsu5CrtZIjbMfwwgq2afqri8wKkb6O
	MYogcLUp8CSqbRhWKNhSoaLHDUMvmgKlakJwhrN+NwLKPfz9Xn2wZ13BmutURIqVZKcF
	Qt+0stfQIhszy0UkhZ/tngSQEmnzx+kWeDrn8=
MIME-Version: 1.0
Received: by 10.213.113.143 with SMTP id a15mr2327874ebq.50.1328642907012;
	Tue, 07 Feb 2012 11:28:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 11:28:26 -0800 (PST)
In-Reply-To: <1323382168.5309.71.camel@ted>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<ce8ae4f8f6647b3b81e1346d43f0f785a9098425.1323358819.git.otavio@ossystems.com.br>
	<1323382168.5309.71.camel@ted>
Date: Tue, 7 Feb 2012 17:28:26 -0200
X-Google-Sender-Auth: ZXo78LHk_RFgEW-Oxs2KP91f2s0
Message-ID: <CAP9ODKqR2tbpxUp4yJg+cBtoXgWO_QNmm=ty8Y-coVs9QE-rJg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] cross.bbclass: add virtclass handler
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
X-List-Received-Date: Tue, 07 Feb 2012 19:36:29 -0000
Content-Type: multipart/alternative; boundary=0015174c3ce2817e1504b864c830

--0015174c3ce2817e1504b864c830
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 8, 2011 at 20:09, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > +            elif not dep.endswith("-cross"):
> > +                newdeps.append(dep + "-cross")
> > +            else:
> > +                newdeps.append(dep)
> > +        bb.data.setVar(varname, " ".join(newdeps), d)
>
> The logic here is just totally wrong. You can't ever hit the else case
> and the paths you do hit are nonsensical.


Fixed it.

> +    map_dependencies("DEPENDS", e.data)
> > +    for pkg in (e.data.getVar("PACKAGES", True).split() + [""]):
> > +        map_dependencies("RDEPENDS", e.data, pkg)
> > +        map_dependencies("RRECOMMENDS", e.data, pkg)
> > +        map_dependencies("RSUGGESTS", e.data, pkg)
> > +        map_dependencies("RPROVIDES", e.data, pkg)
> > +        map_dependencies("RREPLACES", e.data, pkg)
> > +
> > +    provides = e.data.getVar("PROVIDES", True)
> > +    for prov in provides.split():
> > +        if prov.find(pn) != -1:
> > +            continue
> > +        if not prov.endswith("-cross"):
> > +            provides = provides.replace(prov, prov + "-cross")
> > +    e.data.setVar("PROVIDES", provides)
>
> My suggestion is that you should just remove the DEPENDS and PROVIDES
> mapping code above and do it manually using the virtclass-cross override
> in the recipe. The above code can't have been doing much that is
> sensible anyway.
>

Right. I did it and will send an updated patch tomorrow after a from
scratch build.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015174c3ce2817e1504b864c830
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Dec 8, 2011 at 20:09, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">&gt; + =A0 =A0 =A0 =A0 =A0 =A0elif =
not dep.endswith(&quot;-cross&quot;):</div></div><div class=3D"im">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0newdeps.append(dep + &quot;-cross&quo=
t;)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0else:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0newdeps.append(dep)<br>
&gt; + =A0 =A0 =A0 =A0bb.data.setVar(varname, &quot; &quot;.join(newdeps), =
d)<br>
<br>
</div>The logic here is just totally wrong. You can&#39;t ever hit the else=
 case<br>
and the paths you do hit are nonsensical.</blockquote><div><br></div><div>F=
ixed it.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"i=
m">

&gt; + =A0 =A0map_dependencies(&quot;DEPENDS&quot;, e.data)<br>
&gt; + =A0 =A0for pkg in (e.data.getVar(&quot;PACKAGES&quot;, True).split()=
 + [&quot;&quot;]):<br>
&gt; + =A0 =A0 =A0 =A0map_dependencies(&quot;RDEPENDS&quot;, e.data, pkg)<b=
r>
&gt; + =A0 =A0 =A0 =A0map_dependencies(&quot;RRECOMMENDS&quot;, e.data, pkg=
)<br>
&gt; + =A0 =A0 =A0 =A0map_dependencies(&quot;RSUGGESTS&quot;, e.data, pkg)<=
br>
&gt; + =A0 =A0 =A0 =A0map_dependencies(&quot;RPROVIDES&quot;, e.data, pkg)<=
br>
&gt; + =A0 =A0 =A0 =A0map_dependencies(&quot;RREPLACES&quot;, e.data, pkg)<=
br>
&gt; +<br>
&gt; + =A0 =A0provides =3D e.data.getVar(&quot;PROVIDES&quot;, True)<br>
&gt; + =A0 =A0for prov in provides.split():<br>
&gt; + =A0 =A0 =A0 =A0if prov.find(pn) !=3D -1:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0continue<br>
&gt; + =A0 =A0 =A0 =A0if not prov.endswith(&quot;-cross&quot;):<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0provides =3D provides.replace(prov, prov + &q=
uot;-cross&quot;)<br>
&gt; + =A0 =A0e.data.setVar(&quot;PROVIDES&quot;, provides)<br>
<br>
</div>My suggestion is that you should just remove the DEPENDS and PROVIDES=
<br>
mapping code above and do it manually using the virtclass-cross override<br=
>
in the recipe. The above code can&#39;t have been doing much that is<br>
sensible anyway.<br></blockquote><div><br></div><div>Right. I did it and wi=
ll send an updated patch tomorrow after a from scratch build.</div><div>=A0=
</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--0015174c3ce2817e1504b864c830--
