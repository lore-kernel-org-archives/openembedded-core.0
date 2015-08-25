Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2D327766DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 14:27:10 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so13745250igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ixrN9P3QMHMErmeBk5N3SpHMIszSk6fUXcDeM0z3h+E=;
	b=GhKf7w0cPkwWtDRIdF1L9C89LAQwVFtHCugb/ok5u0Fm/+l1m1QbyNAJ1Qax1FNBNi
	AG0H+jXS3z2wHSikAs7IhsDs5x3UcTY27E9jvOE1BO0fR29wwoCKg0cvLPrSML4Sn6XM
	FCiH0ji/6QpDO3cB6tNUibicO0XgX/RDuypj/37FBZ4NcnRDOiBNAvxCZGorfsLHSVYt
	NMBfMFiZW3MajIqKrMUCJfBYua7bt4lWlKcOaIiM1SlN0x0AcXnXIXkzAHHJaDoHMaUA
	qRbJXP34UnFEO5QDfZzWdWPwVzYLwXW7Ep+FdvqdX9rttMKaveIOQlfnZ+XorzmZh5dS
	Mqdg==
X-Received: by 10.50.103.71 with SMTP id fu7mr3057390igb.38.1440512830571;
	Tue, 25 Aug 2015 07:27:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.71 with HTTP; Tue, 25 Aug 2015 07:26:51 -0700 (PDT)
In-Reply-To: <1440491751.5373.27.camel@iki.fi>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
	<b22733643db015ebedf00241ab7ef40a0ee50a7b.1440454579.git.chris_larson@mentor.com>
	<1440491751.5373.27.camel@iki.fi>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 25 Aug 2015 07:26:51 -0700
Message-ID: <CABcZANk9XTsf7km9HYK_NYv_MpfE3LkkgvFyWXTjRQjmb+yY4A@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] pulseaudio: add 'autospawn-for-root' PACKAGECONFIG
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
X-List-Received-Date: Tue, 25 Aug 2015 14:27:11 -0000
Content-Type: multipart/alternative; boundary=047d7b2e11e78fae34051e2387a4

--047d7b2e11e78fae34051e2387a4
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 25, 2015 at 1:35 AM, Tanu Kaskinen <tanuk@iki.fi> wrote:

> On Mon, 2015-08-24 at 15:19 -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Since many embedded systems don't have non-root users, it's useful to be
> able
> > to use pulseaudio autospawn for root as well.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 18
> > ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > index 6199dcd..70009d0 100644
> > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > @@ -47,6 +47,11 @@ PACKAGECONFIG[systemd] = "--enable-systemd-daemon
> --enable-systemd-login --enabl
> >  PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst
> libice libsm libxcb"
> >  PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
> >  PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
> > +# Since many embedded systems don't have non-root users, it's useful to
> be
> > +# able to use pulseaudio autospawn for root as well. Autospawn will
> only be
> > +# used if the systemd packageconfig is not enabled, otherwise it will
> rely on
> > +# systemd's user services to spawn it.
>
> The latter sentence is incorrect. Having systemd enabled does not
> currently have any effect on autospawning. The systemd service and
> socket files get installed, but not enabled by default, because the D
> -Bus session socket is not available to services that are started by
> systemd, which causes some trouble for PulseAudio. Once D-Bus works
> better out of the box, systemd socket activation will be enabled for
> PulseAudio, but until then we will rely on PulseAudio's own
> autospawning.
>

Ah, thanks for the clarification. I'll just remove the second sentence
entirely.

> +PACKAGECONFIG[autospawn-for-root] = ",,,"
> >
> >  EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES",
> "neon", "", " --enable-neon-opt=no", d)}"
> >  EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES",
> "neon", "", " --enable-neon-opt=no", d)}"
> > @@ -59,6 +64,19 @@ export TARGET_PFPU = "${TARGET_FPU}"
> >  OE_LT_RPATH_ALLOW = "any"
> >  OE_LT_RPATH_ALLOW[export]="1"
> >
> > +set_cfg_value () {
> > +     sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"
> > +     if ! grep -q "^$2 = $3\$" "$1"; then
> > +             die "Use of sed to set '$2' to '$3' in '$1' failed"
> > +     fi
> > +}
> > +
> > +do_compile_append () {
> > +     if ${@bb.utils.contains('PACKAGECONFIG', 'autospawn-for-root',
> 'true', 'false', d)}; then
> > +             set_cfg_value src/client.conf allow-autospawn-for-root yes
> > +     fi
> > +}
>
> I think a configure option like --allow-autospawn-for-root-by-default
> would be nicer than patching configuration files like this. What do you
> (and others) think? I'm not against applying this patch for now, but if
> I'm not alone with this preference, I'll add the configure option later
> myself.


It needs to stay a runtime configuration file option for administrators,
no? We're just changing the default. So I'm not sure that having a
configure option do it or us do it really changes all that much,
particularly since it's probably unlikely that upstream would be interested
in such a patch.

That said, I don't feel at all strongly about it, so if others would rather
see a configure option, go for it.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b2e11e78fae34051e2387a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Aug 25, 2015 at 1:35 AM, Tanu Kaskinen <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, 2015-08-24 a=
t 15:19 -0700, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; Since many embedded systems don&#39;t have non-root users, it&#39;s us=
eful to be able<br>
&gt; to use pulseaudio autospawn for root as well.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 18<br>
&gt; ++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 18 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/=
recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; index 6199dcd..70009d0 100644<br>
&gt; --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; @@ -47,6 +47,11 @@ PACKAGECONFIG[systemd] =3D &quot;--enable-systemd-d=
aemon --enable-systemd-login --enabl<br>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;--enable-x11,--disable-x11,virtual/=
libx11 libxtst libice libsm libxcb&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[avahi] =3D &quot;--enable-avahi,--disable-avahi,av=
ahi&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[jack] =3D &quot;--enable-jack,--disable-jack,jack&=
quot;<br>
&gt; +# Since many embedded systems don&#39;t have non-root users, it&#39;s=
 useful to be<br>
&gt; +# able to use pulseaudio autospawn for root as well. Autospawn will o=
nly be<br>
&gt; +# used if the systemd packageconfig is not enabled, otherwise it will=
 rely on<br>
&gt; +# systemd&#39;s user services to spawn it.<br>
<br>
</span>The latter sentence is incorrect. Having systemd enabled does not<br=
>
currently have any effect on autospawning. The systemd service and<br>
socket files get installed, but not enabled by default, because the D<br>
-Bus session socket is not available to services that are started by<br>
systemd, which causes some trouble for PulseAudio. Once D-Bus works<br>
better out of the box, systemd socket activation will be enabled for<br>
PulseAudio, but until then we will rely on PulseAudio&#39;s own<br>
autospawning.<br></blockquote><div><br></div><div>Ah, thanks for the clarif=
ication. I&#39;ll just remove the second sentence entirely.</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><span class=3D"">
&gt; +PACKAGECONFIG[autospawn-for-root] =3D &quot;,,,&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF_append_arm =3D &quot;${@bb.utils.contains(&quot;TUN=
E_FEATURES&quot;, &quot;neon&quot;, &quot;&quot;, &quot; --enable-neon-opt=
=3Dno&quot;, d)}&quot;<br>
&gt;=C2=A0 EXTRA_OECONF_append_armeb =3D &quot;${@bb.utils.contains(&quot;T=
UNE_FEATURES&quot;, &quot;neon&quot;, &quot;&quot;, &quot; --enable-neon-op=
t=3Dno&quot;, d)}&quot;<br>
&gt; @@ -59,6 +64,19 @@ export TARGET_PFPU =3D &quot;${TARGET_FPU}&quot;<br=
>
&gt;=C2=A0 OE_LT_RPATH_ALLOW =3D &quot;any&quot;<br>
&gt;=C2=A0 OE_LT_RPATH_ALLOW[export]=3D&quot;1&quot;<br>
&gt;<br>
&gt; +set_cfg_value () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s/\(; *\)\?$2 =3D.*/$2 =3D $3/&qu=
ot; &quot;$1&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ! grep -q &quot;^$2 =3D $3\$&quot; &quot;$1&qu=
ot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die &quot;Use of sed =
to set &#39;$2&#39; to &#39;$3&#39; in &#39;$1&#39; failed&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_compile_append () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, =
&#39;autospawn-for-root&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_cfg_value src/cli=
ent.conf allow-autospawn-for-root yes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
<br>
</span>I think a configure option like --allow-autospawn-for-root-by-defaul=
t<br>
would be nicer than patching configuration files like this. What do you<br>
(and others) think? I&#39;m not against applying this patch for now, but if=
<br>
I&#39;m not alone with this preference, I&#39;ll add the configure option l=
ater<br>
myself.</blockquote></div><br>It needs to stay a runtime configuration file=
 option for administrators, no? We&#39;re just changing the default. So I&#=
39;m not sure that having a configure option do it or us do it really chang=
es all that much, particularly since it&#39;s probably unlikely that upstre=
am would be interested in such a patch.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">That said, I don&#39;t feel at all strong=
ly about it, so if others would rather see a configure option, go for it.<b=
r>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson=
<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus=
<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></=
div>
</div></div>

--047d7b2e11e78fae34051e2387a4--
