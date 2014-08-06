Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id C493065DAC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:28:31 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id a108so2696403qge.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4Q0q54RLIEuUEgIGAzswifMq1HUn+HxwA9UhDsahNr4=;
	b=MTJTgNTuqY1QgNsqctCFTv4bXwRLiue/Lkg7m/pJ7r1Fu9DPurbK/7Ke/VDyC2WkMs
	R7yJ2MaNEsX2sYZtB4yNfHwYxTJZgMniB/WElM9vhkh2yD54a0xhMuT/K9WgsMwtTYph
	4Wb+6+gruQn2q0OO6fFRt3NxilBJnHxnrpvMDNxulkKdM4B2p5Ll5orwvkMBaW6nuzxI
	V06ifhGPBM2fiYpe2X+s98V3yXPKkqeNsBWqgzxjjPtN39mCopLZuDhIST2V5EIPmsXf
	mcR2iFdGC0zPCn21RLsqpZ2sGRk4pdcv5yGjPje5wemF2MsdO7ctlfaHNUNbxCTdA57O
	N+xA==
X-Received: by 10.224.128.9 with SMTP id i9mr17208719qas.50.1407331712015;
	Wed, 06 Aug 2014 06:28:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Wed, 6 Aug 2014 06:28:11 -0700 (PDT)
In-Reply-To: <11634411.QS1iMaReBX@peggleto-mobl5.ger.corp.intel.com>
References: <1407326649-7117-1-git-send-email-sujith.h@gmail.com>
	<11634411.QS1iMaReBX@peggleto-mobl5.ger.corp.intel.com>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 6 Aug 2014 18:58:11 +0530
Message-ID: <CADyYWLmvBukjOops+sxjbSB_zMj0B8qZu42bwiEAQXVn+xgPzw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: allow disabling update-alternatives
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
X-List-Received-Date: Wed, 06 Aug 2014 13:28:34 -0000
Content-Type: multipart/alternative; boundary=001a11c2cafcc6a5df04fff5f297

--001a11c2cafcc6a5df04fff5f297
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2014 at 6:08 PM, Paul Eggleton <paul.eggleton@linux.intel.co=
m
> wrote:

> On Wednesday 06 August 2014 17:34:09 Sujith H wrote:
> > From: Sujith H <Sujith_Haridasan@mentor.com>
> >
> > This is needed to deal with the situation where we're using ipk
> packaging,
> > so opkg-utils must be built regardless of what update-alternatives
> provider
> > we prefer. The downside to the current implementation is the need to
> adjust
> > PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit th=
at
> > way.
> >
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> > ---
> >  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb index
> 693c216..952fce4
> > 100644
> > --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > @@ -19,11 +19,17 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
> >  PYTHONRDEPS =3D "python python-shell python-io python-math python-cryp=
t
> > python-logging python-fcntl python-subprocess python-pickle
> > python-compression python-textutils python-stringold"
> > PYTHONRDEPS_class-native =3D ""
> >
> > -PACKAGECONFIG =3D "python"
> > +PACKAGECONFIG =3D "python update-alternatives"
> >  PACKAGECONFIG[python] =3D ",,,${PYTHONRDEPS}"
> > +PACKAGECONFIG[update-alternatives] =3D ",,,"
> > +
> > +PROVIDES_remove =3D "${@'virtual/update-alternatives' if
> > 'update-alternatives' not in PACKAGECONFIG.split() else ''}"
>
> If we have to do this, rather than using _remove here could we simply mak=
e
> adding it conditional?
>

Isn't _remove itself conditional? Pardon me if my understanding is wrong.


>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11c2cafcc6a5df04fff5f297
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Aug 6, 2014 at 6:08 PM, Paul Eggleton <span dir=3D"ltr">&lt=
;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eg=
gleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ednesday 06 August 2014 17:34:09 Sujith H wrote:<br>
&gt; From: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">Suji=
th_Haridasan@mentor.com</a>&gt;<br>
&gt;<br>
&gt; This is needed to deal with the situation where we&#39;re using ipk pa=
ckaging,<br>
&gt; so opkg-utils must be built regardless of what update-alternatives pro=
vider<br>
&gt; we prefer. The downside to the current implementation is the need to a=
djust<br>
&gt; PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit t=
hat<br>
&gt; way.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com">kergoth@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.=
com">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_gi=
t.bb" target=3D"_blank">opkg-utils_git.bb</a> | 8 +++++++-<br>
&gt; =C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-u=
tils_git.bb" target=3D"_blank">opkg-utils_git.bb</a><br>
&gt; b/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb=
" target=3D"_blank">opkg-utils_git.bb</a> index 693c216..952fce4<br>
&gt; 100644<br>
&gt; --- a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_gi=
t.bb" target=3D"_blank">opkg-utils_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_gi=
t.bb" target=3D"_blank">opkg-utils_git.bb</a><br>
&gt; @@ -19,11 +19,17 @@ TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
&gt; =C2=A0PYTHONRDEPS =3D &quot;python python-shell python-io python-math =
python-crypt<br>
&gt; python-logging python-fcntl python-subprocess python-pickle<br>
&gt; python-compression python-textutils python-stringold&quot;<br>
&gt; PYTHONRDEPS_class-native =3D &quot;&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG =3D &quot;python&quot;<br>
&gt; +PACKAGECONFIG =3D &quot;python update-alternatives&quot;<br>
&gt; =C2=A0PACKAGECONFIG[python] =3D &quot;,,,${PYTHONRDEPS}&quot;<br>
&gt; +PACKAGECONFIG[update-alternatives] =3D &quot;,,,&quot;<br>
&gt; +<br>
&gt; +PROVIDES_remove =3D &quot;${@&#39;virtual/update-alternatives&#39; if=
<br>
&gt; &#39;update-alternatives&#39; not in PACKAGECONFIG.split() else &#39;&=
#39;}&quot;<br>
<br>
</div></div>If we have to do this, rather than using _remove here could we =
simply make<br>
adding it conditional?<br></blockquote><div><br></div><div>Isn&#39;t _remov=
e itself conditional? Pardon me if my understanding is wrong.<br>=C2=A0<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">


<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>=E0=B4=B8=
=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=
=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&g=
t;Contributor to KDE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-D=
RM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign<=
/a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div>

--001a11c2cafcc6a5df04fff5f297--
