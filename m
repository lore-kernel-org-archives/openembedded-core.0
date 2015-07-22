Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id AD36E73CF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 15:36:53 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so112803251qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gJP7Gz7YOu+ag1rAE7HM1bXrjswQoI1D/nL4J4EPtx8=;
	b=cTVDvufRI5GIPl8vm/+5SYlET6fnOiylz3b5VvXcayv5Ag4Lxu3bBoBbPd5Xbvg8Ju
	ZLy6+BNlBIOAHsUOM074dGGLl78arMCd5YPCNTWT49reFpuTtTSXkFO/B/mCp12raZfd
	UR0lsus5Hm1inuX4dinw/QwXsVAWQXizTuFGcI8ncifF48u7lI8xnfS+kBqPR5d+9Jss
	BAEgtxj2R5OPzGQKGEOwLFD8ArtLUlKy5GPwIOwlIX5s6UoZFwqtRUQ/ZN8tszVskUpq
	uFqrjogLBvddZgHxpQLmIKz6ohd3D1d8kbmNWMNALVIfiqz81uxLg8+1V9F+tKLnRG4R
	uhpg==
X-Received: by 10.140.150.211 with SMTP id 202mr4873102qhw.42.1437579414074;
	Wed, 22 Jul 2015 08:36:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.108.55 with HTTP; Wed, 22 Jul 2015 08:36:34 -0700 (PDT)
In-Reply-To: <4892088.sb1qBAebDq@peggleto-mobl.ger.corp.intel.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
	<019657e96ff75872fb4bf93661118fcd3d670188.1437430369.git.chris_larson@mentor.com>
	<4892088.sb1qBAebDq@peggleto-mobl.ger.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 22 Jul 2015 08:36:34 -0700
Message-ID: <CABcZAN=ax2Jggw4wNtSDLcS9cVfxD=gEeub9ED8-TmLXfW2m6g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/6] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Wed, 22 Jul 2015 15:36:58 -0000
Content-Type: multipart/alternative; boundary=001a11356d524ffaa6051b788a7f

--001a11356d524ffaa6051b788a7f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2015 at 4:02 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday 20 July 2015 15:15:54 Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > This makes it easier to extend, as a layer can add its own sub-commands=
.
> >
> > tinfoil is now passed into the commands, as we needed to parse the
> > configuration metadata to get BBPATH, and we don't want to construct
> tinfoil
> > more than once, otherwise we have to deal with startup and shutdown of
> > cooker.
>
> Hmm, but tinfoil is being constructed twice, right? I think what you've
> implemented is correct (and the only way it can really work), but this
> comment
> doesn't seem to match up with the actual changes.
>

Yeah, that=E2=80=99s correct. My initial implementation did what the commit=
 message
says, but of course that=E2=80=99s a problem for devtool commands that call=
 out to
recipetool, since recipetool constructs its own, so needs to acquire the
bitbake lock itself. So I reworked it to construct and then throw away the
initial instance instead, and leave it up to the subcommands to control
whether they need a tinfoil instance the way they did previously. I=E2=80=
=99ll fix
the commit message.

> +    tinfoil =3D setup_tinfoil(config_only=3DTrue)
> > +    for path in ([scripts_path] +
> > +                 tinfoil.config_data.getVar('BBPATH', True).split(':')=
):
> > +        pluginpath =3D os.path.join(path, 'lib', 'devtool')
> > +        scriptutils.load_plugins(logger, plugins, pluginpath)
> > +    tinfoil.cooker.shutdown(force=3DTrue)
> > +    tinfoil.cooker.unlockBitbake()
>
> FYI I think Richard is about to add a shutdown method to tinfoil itself
> that

will do what's needed here; however we can tidy this up after that's added.


Cool, that would definitely be cleaner than poking into its internals.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11356d524ffaa6051b788a7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 22, 2015 at 4:02 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Monday 20 July 2015 15:15:54 Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; This makes it easier to extend, as a layer can add its own sub-command=
s.<br>
&gt;<br>
&gt; tinfoil is now passed into the commands, as we needed to parse the<br>
&gt; configuration metadata to get BBPATH, and we don&#39;t want to constru=
ct tinfoil<br>
&gt; more than once, otherwise we have to deal with startup and shutdown of=
<br>
&gt; cooker.<br>
<br>
</span>Hmm, but tinfoil is being constructed twice, right? I think what you=
&#39;ve<br>
implemented is correct (and the only way it can really work), but this comm=
ent<br>
doesn&#39;t seem to match up with the actual changes.<br></blockquote><div>=
<br></div><div>Yeah, that=E2=80=99s correct. My initial implementation did =
what the commit message says, but of course that=E2=80=99s a problem for de=
vtool commands that call out to recipetool, since recipetool constructs its=
 own, so needs to acquire the bitbake lock itself. So I reworked it to cons=
truct and then throw away the initial instance instead, and leave it up to =
the subcommands to control whether they need a tinfoil instance the way the=
y did previously. I=E2=80=99ll fix the commit message.</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
&gt; +=C2=A0 =C2=A0 tinfoil =3D setup_tinfoil(config_only=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 for path in ([scripts_path] +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tinfoil=
.config_data.getVar(&#39;BBPATH&#39;, True).split(&#39;:&#39;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pluginpath =3D os.path.join(path, &#39;li=
b&#39;, &#39;devtool&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 scriptutils.load_plugins(logger, plugins,=
 pluginpath)<br>
&gt; +=C2=A0 =C2=A0 tinfoil.cooker.shutdown(force=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 tinfoil.cooker.unlockBitbake()<br>
<br>
</span>FYI I think Richard is about to add a shutdown method to tinfoil its=
elf that=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
will do what&#39;s needed here; however we can tidy this up after that&#39;=
s added.</blockquote><div><br></div><div>Cool, that would definitely be cle=
aner than poking into its internals.=C2=A0</div></div>-- <br><div class=3D"=
gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<=
br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11356d524ffaa6051b788a7f--
