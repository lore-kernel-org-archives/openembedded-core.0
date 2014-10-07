Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id B60E471775
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 10:40:45 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id id10so4515221vcb.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6aPRc2Xc7+4FVI/7AcwN+8oADkKTYTOKsn+Zw6lH+8E=;
	b=fmb5JkMKCGq7YG/oc4YSrO1+TaruTnb43JuUd8P4to6qsimISxcI16/l03a+HWFgkC
	7ftcwtN7xozjc6bJ/XPlR96JjctkMqnLw1chtZqWSjWd4VMATe6L4CTKaLSC+mFMQ8zT
	c2i4+wz/ZsDFvybbeQm2DuomRVlsU0fMYpJSuPYOXaLp3S5cF2iTfC44o3qKPiEJSgSA
	kt6pyzxbut88Rh9oa2+Hh8LkrW4a2dWRRJWiBM+HYydXDFbAEUQFkHPLPyy7rzAAH0AT
	4JGo8xd9DAd7O2DHibENTesMo9nMKYyysO9qedn6o00hlTm24uVKJfaX5lmdnl7fXl1y
	IUJg==
MIME-Version: 1.0
X-Received: by 10.221.62.133 with SMTP id xa5mr2392825vcb.41.1412678446153;
	Tue, 07 Oct 2014 03:40:46 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Tue, 7 Oct 2014 03:40:46 -0700 (PDT)
In-Reply-To: <CA+AhUGw=iumQ49Y-kshAM5R8zqww+vL7ADErTN-Ywtq+PYq9ug@mail.gmail.com>
References: <1412633433-23255-1-git-send-email-ross.burton@intel.com>
	<CA+AhUGw=iumQ49Y-kshAM5R8zqww+vL7ADErTN-Ywtq+PYq9ug@mail.gmail.com>
Date: Tue, 7 Oct 2014 12:40:46 +0200
Message-ID: <CALbNGRRiHL6P_2PuHPz=6evNKrbYdku71o0z0y=KjHsrzh_a8w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: don't add files and dependencies from units Conflicts
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
X-List-Received-Date: Tue, 07 Oct 2014 10:40:49 -0000
Content-Type: multipart/alternative; boundary=001a11347a0af7068b0504d2d4d1

--001a11347a0af7068b0504d2d4d1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2014 at 9:18 AM, Erik Bot=C3=B6 <erik.boto@pelagicore.com> w=
rote:

> This patch works well for me. Any chance of it getting cherry-picked
> into Daisy as well?
>
> Cheers,
> Erik
>
> On Tue, Oct 7, 2014 at 12:10 AM, Ross Burton <ross.burton@intel.com>
> wrote:
> > Adding dependencies and moving files based on Conflicts tags in unit
> files isn't
> > right, mainly as it means that systemd depends on systemd-binfmt,
> because the
> > latter ends up containing the shutdown.target unit.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/classes/systemd.bbclass |    5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclas=
s
> > index 708ba89..c34884b 100644
> > --- a/meta/classes/systemd.bbclass
> > +++ b/meta/classes/systemd.bbclass
> > @@ -143,10 +143,7 @@ python systemd_populate_packages() {
> >          if has_exactly_one_service:
> >              has_exactly_one_service =3D len(get_package_var(d,
> 'SYSTEMD_SERVICE', systemd_packages).split()) =3D=3D 1
> >
> > -        keys =3D 'Also' # Conflicts??
> > -        if has_exactly_one_service:
> > -            # single service gets also the /dev/null dummies
> > -            keys =3D 'Also Conflicts'
> > +        keys =3D 'Also'
> >          # scan for all in SYSTEMD_SERVICE[]
> >          for pkg_systemd in systemd_packages.split():
> >              for service in get_package_var(d, 'SYSTEMD_SERVICE',
> pkg_systemd).split():
> > --
> > 1.7.10.4
> >
> > --
>
What other packages are missing after this change? Any buildhistory on this=
?

Andreas

--001a11347a0af7068b0504d2d4d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Oct 7, 2014 at 9:18 AM, Erik Bot=C3=B6 <span dir=3D"ltr">&lt;<a href=3D=
"mailto:erik.boto@pelagicore.com" target=3D"_blank">erik.boto@pelagicore.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This patch works =
well for me. Any chance of it getting cherry-picked<br>
into Daisy as well?<br>
<br>
Cheers,<br>
Erik<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Tue, Oct 7, 2014 at 12:10 AM, Ross Burton &lt;<a href=3D"mailto:ross.bur=
ton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; Adding dependencies and moving files based on Conflicts tags in unit f=
iles isn&#39;t<br>
&gt; right, mainly as it means that systemd depends on systemd-binfmt, beca=
use the<br>
&gt; latter ends up containing the shutdown.target unit.<br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/systemd.bbclass |=C2=A0 =C2=A0 5 +----<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbcla=
ss<br>
&gt; index 708ba89..c34884b 100644<br>
&gt; --- a/meta/classes/systemd.bbclass<br>
&gt; +++ b/meta/classes/systemd.bbclass<br>
&gt; @@ -143,10 +143,7 @@ python systemd_populate_packages() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if has_exactly_one_service:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 has_exactly_one_servic=
e =3D len(get_package_var(d, &#39;SYSTEMD_SERVICE&#39;, systemd_packages).s=
plit()) =3D=3D 1<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 keys =3D &#39;Also&#39; # Conflicts??<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if has_exactly_one_service:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # single service gets also =
the /dev/null dummies<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 keys =3D &#39;Also Conflict=
s&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 keys =3D &#39;Also&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # scan for all in SYSTEMD_SERVICE[]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg_systemd in systemd_packages.=
split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for service in get_pac=
kage_var(d, &#39;SYSTEMD_SERVICE&#39;, pkg_systemd).split():<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt; --<br></div></div></blockquote></div>What other packages are missing a=
fter this change? Any buildhistory on this?<br><br></div><div class=3D"gmai=
l_extra">Andreas<br></div></div>

--001a11347a0af7068b0504d2d4d1--
