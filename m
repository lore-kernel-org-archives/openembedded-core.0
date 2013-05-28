Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1140E6A4D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 15:18:21 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i10so10257586oag.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=CppRS0ATfuDVEs/asuhSDbemlVo6yO7dLaIR4u+h6uM=;
	b=fGRfqMV94JvD3W1tRaFDDrIcJY0uw7sVpNf5kcdvPpuI0MO/EwU/1Ll3PveyJ3sXza
	U12+W42KRD9gfulVAuRJL5dpavqBQ/HPb0ucJztmbZ5Xj/OOA5vdCvwKPp7nIhRIjU12
	9sjHVk/n3UShvj9SQnwt9S5amVPZIfNVdTWQs+O2k2xs8N4KBrWYof2t5GbYECsPlSy3
	kETRDlzLW5+yCtprHe9UcBUHKVwKUJr/D7tDqtfS/yGluZffsDp4rYboq9liAgT+lGCJ
	Dwk0AgvEAvH/7O+OyGAFGCjzx1r68TNMNiBY4T1hR2Bx7b2KKT5ed3NTewjDM1Fpa28q
	NEzQ==
MIME-Version: 1.0
X-Received: by 10.60.125.201 with SMTP id ms9mr20958369oeb.65.1369754301906;
	Tue, 28 May 2013 08:18:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Tue, 28 May 2013 08:18:21 -0700 (PDT)
In-Reply-To: <1369753938.8846.8.camel@phil-desktop.brightsign>
References: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
	<1369753938.8846.8.camel@phil-desktop.brightsign>
Date: Tue, 28 May 2013 12:18:21 -0300
X-Google-Sender-Auth: 65n0y2cidNGbPgIF01bCXHgl58o
Message-ID: <CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
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
X-List-Received-Date: Tue, 28 May 2013 15:18:22 -0000
Content-Type: multipart/alternative; boundary=047d7b5d2392984b0304ddc8c631

--047d7b5d2392984b0304ddc8c631
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 28, 2013 at 12:12 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Tue, 2013-05-28 at 12:04 -0300, Otavio Salvador wrote:
> > This add support to list compatible distro feature for a recipe; this
> > is important for example when you have two different recipes which
> > should be choosen depending on the distro features set.
>
> The terminology used here seems to be wrong/misleading/confusing:
>
> > +        need_distro_features = d.getVar('COMPATIBLE_DISTRO_FEATURES',
> True)
> > +        if need_distro_features:
> > +            need_distro_features = need_distro_features.split()
> > +            distro_features = (d.getVar('DISTRO_FEATURES', True) or
> "").split()
> > +            for f in need_distro_features:
> > +                if f in distro_features:
> > +                    bb.note("here")
> > +                    break
> > +            else:
> > +                raise bb.parse.SkipPackage("incompatible with distro
> features %s (not in DISTRO_FEATURES)" % need_distro_features)
>
> Calling the variable "COMPATIBLE_DISTRO_FEATURES" implies that the
> recipe won't work with any features not in the list.  But the actual
> implementation shown above is that the recipe will be skipped unless all
> of the features listed are present in DISTRO_FEATURES.  If those are the
> intended semantics then it seems as though the variable ought to be
> named REQUIRED_DISTRO_FEATURES or something.
>

Done.


> Similarly, the error message "incompatible with distro features %s (not
> in DISTRO_FEATURES)" is, at best, confusing.  This message seems to be
> staying that the recipe won't work if the named features are set, but it
> then goes on to say that they are not in fact set.  Plus, it lists the
> entire contents of COMPATIBLE_DISTRO_FEATURES rather than just the items
> that are causing a problem.
>

Done.


> Also, you seem to have a spurious bb.note() call in there.
>

Arrg, done.


> Also also, we've managed without this functionality in oe-core for some
> time which makes me wonder how widely useful it would actually be.  If
> it's only going to be used by a few recipes then it could go in a class,
> or in in the recipes themselves, rather than adding parse time and
> memory footprint to every recipe.
>

Right; let's first agree in the code so we can discuss where to put it:

+        need_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES', True)
+        if need_distro_features:
+            need_distro_features = need_distro_features.split()
+            distro_features = (d.getVar('DISTRO_FEATURES', True) or
"").split()
+            for f in need_distro_features:
+                if f in distro_features:
+                    break
+            else:
+                raise bb.parse.SkipPackage("missing required distro
feature %s (not in DISTRO_FEATURES)" % need_distro_features)



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b5d2392984b0304ddc8c631
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, May 28, 2013 at 12:12 PM, Phil Blundell <span dir=3D"ltr">&=
lt;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On Tue, 2013-05-28 at 12:04 -0300, Otavi=
o Salvador wrote:<br>

&gt; This add support to list compatible distro feature for a recipe; this<=
br>
&gt; is important for example when you have two different recipes which<br>
&gt; should be choosen depending on the distro features set.<br>
<br>
</div>The terminology used here seems to be wrong/misleading/confusing:<br>
<div class=3D"im"><br>
&gt; + =A0 =A0 =A0 =A0need_distro_features =3D d.getVar(&#39;COMPATIBLE_DIS=
TRO_FEATURES&#39;, True)<br>
&gt; + =A0 =A0 =A0 =A0if need_distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0need_distro_features =3D need_distro_features=
.split()<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0distro_features =3D (d.getVar(&#39;DISTRO_FEA=
TURES&#39;, True) or &quot;&quot;).split()<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0for f in need_distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if f in distro_features:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.note(&quot;here&quot;)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0else:<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0raise bb.parse.SkipPackage(&quot;inco=
mpatible with distro features %s (not in DISTRO_FEATURES)&quot; % need_dist=
ro_features)<br>
<br>
</div>Calling the variable &quot;COMPATIBLE_DISTRO_FEATURES&quot; implies t=
hat the<br>
recipe won&#39;t work with any features not in the list. =A0But the actual<=
br>
implementation shown above is that the recipe will be skipped unless all<br=
>
of the features listed are present in DISTRO_FEATURES. =A0If those are the<=
br>
intended semantics then it seems as though the variable ought to be<br>
named REQUIRED_DISTRO_FEATURES or something.<br></blockquote><div><br></div=
><div style>Done.</div><div style>=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

Similarly, the error message &quot;incompatible with distro features %s (no=
t<br>
in DISTRO_FEATURES)&quot; is, at best, confusing. =A0This message seems to =
be<br>
staying that the recipe won&#39;t work if the named features are set, but i=
t<br>
then goes on to say that they are not in fact set. =A0Plus, it lists the<br=
>
entire contents of COMPATIBLE_DISTRO_FEATURES rather than just the items<br=
>
that are causing a problem.<br></blockquote><div><br></div><div style>Done.=
</div><div style>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex">

Also, you seem to have a spurious bb.note() call in there.<br></blockquote>=
<div><br></div><div style>Arrg, done.</div><div style>=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:=
1ex">

Also also, we&#39;ve managed without this functionality in oe-core for some=
<br>
time which makes me wonder how widely useful it would actually be. =A0If<br=
>
it&#39;s only going to be used by a few recipes then it could go in a class=
,<br>
or in in the recipes themselves, rather than adding parse time and<br>
memory footprint to every recipe.<br></blockquote><div><br></div><div style=
>Right; let&#39;s first agree in the code so we can discuss where to put it=
:</div><div><br></div><div>+ =A0 =A0 =A0 =A0need_distro_features =3D d.getV=
ar(&#39;REQUIRED_DISTRO_FEATURES&#39;, True)</div>
<div>+ =A0 =A0 =A0 =A0if need_distro_features:</div><div>+ =A0 =A0 =A0 =A0 =
=A0 =A0need_distro_features =3D need_distro_features.split()</div><div>+ =
=A0 =A0 =A0 =A0 =A0 =A0distro_features =3D (d.getVar(&#39;DISTRO_FEATURES&#=
39;, True) or &quot;&quot;).split()</div>
<div>+ =A0 =A0 =A0 =A0 =A0 =A0for f in need_distro_features:</div><div>+ =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if f in distro_features:</div><div>+ =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0el=
se:</div><div>+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0raise bb.parse.SkipPackage(&=
quot;missing required distro feature %s (not in DISTRO_FEATURES)&quot; % ne=
ed_distro_features)</div>
<div><br></div><div><br></div></div><div><br></div>-- <br>Otavio Salvador =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a =
href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems=
.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" tar=
get=3D"_blank">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b5d2392984b0304ddc8c631--
