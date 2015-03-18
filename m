Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6324B6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 12:42:51 +0000 (UTC)
Received: by obbgg8 with SMTP id gg8so30634030obb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 05:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Vf71AjhhT5t0Fh/S6eqEPYnvvOKVJzg4UPX4K+qFxJ0=;
	b=lPI7NqKFnp6zO3KZtTWITpO+XgQo5bHnNyKJZ43JuQuPgvHAKlvMIPK1dB69qra1WV
	c+LEB2R3xAT8vA05hkDNYZc6FV38zb0UzqM3i4Q9BKen0LOxHTGjdXzEWoT1qw+/SO0F
	FpgiTARLp3u4E+LbeiUHEmbkyM8bLrD23OX172C0gMlFnVrFwp90msGuP4WQNAxWDcwN
	RGZOp/IVvBXJr77giqROg7geWbqR7QScMXvy5tGsMF4oICbOO1qazH89l72L5mr8JDDD
	+jSr+gUWk7UsAggyR6X961X0fx44ruuFBsoXV7xUEt0csXbft09n8/ep8jilpkxENgyt
	M6Ag==
X-Gm-Message-State: ALoCoQk0tcNWiFM6Oo+WArEvTNkGcdYQ/4QWZAVvE7m1X11oORa8t6XmT7MAJLXM6bQmrsVCK/KW
MIME-Version: 1.0
X-Received: by 10.60.222.71 with SMTP id qk7mr57301547oec.37.1426682572225;
	Wed, 18 Mar 2015 05:42:52 -0700 (PDT)
Received: by 10.60.99.6 with HTTP; Wed, 18 Mar 2015 05:42:52 -0700 (PDT)
In-Reply-To: <CAC1BbcTHOXPNLyWBLYkNW5=4qMRGjF=XgMB=R-nZ=PSfCJA0hw@mail.gmail.com>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
	<1426678029-19516-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcTHOXPNLyWBLYkNW5=4qMRGjF=XgMB=R-nZ=PSfCJA0hw@mail.gmail.com>
Date: Wed, 18 Mar 2015 18:12:52 +0530
Message-ID: <CAFoFrHa4BC3yH4NmSyNqn_P1A64o+Xpja+HrcT3P_Zszn69s4Q@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core v2 PATCH 3/5] bootimg: Skip iso image build on aarch64
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
X-List-Received-Date: Wed, 18 Mar 2015 12:42:52 -0000
Content-Type: multipart/alternative; boundary=001a11c2a080ecd62805118f6b7f

--001a11c2a080ecd62805118f6b7f
Content-Type: text/plain; charset=UTF-8

On 18 March 2015 at 18:05, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
wrote:

> On 18 March 2015 at 12:27, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> > To generate bootable ISO image the x86 architecture uses syslinux
> package (syslinux/isolinux.bin).
> > We have already skip the syslinux package on aarch64.  Hence skip the
> iso image build on aarch64.
> >
> > Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> > ---
> >  meta/classes/bootimg.bbclass |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> > index ed7b32f..5a8e70c 100644
> > --- a/meta/classes/bootimg.bbclass
> > +++ b/meta/classes/bootimg.bbclass
> > @@ -33,6 +33,7 @@ do_bootimg[depends] +=
> "dosfstools-native:do_populate_sysroot \
> >
> >  PACKAGES = " "
> >  EXCLUDE_FROM_WORLD = "1"
> > +NOISO_aarch64 = "1"
>
> how does that help !COMPATIBLE_HOST (of syslinux) except aarch64?
>
> I meant you to
> def mycheck(d):
>   h = d.getVar('COMPATIBLE_HOST', True)
>   if h:
>     t = d.getVar('TARGET_ARCH', True)
>     if re.match(h, t):
>       return 0
>   return 1
>
> and use that to set NOISO ?= "${@mycheck(d)}"
> (modulo typos and testing)
>
> I think something like that should work and i think this would be
> preferable to adding all those upcoming NOISO_baz
> See what i mean?
>
Thank you very much.  I will do it right now, test with luvos distribution,
re-post this patch.

>
> thanks,
>

--001a11c2a080ecd62805118f6b7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 18 March 2015 at 18:05, Bernhard Reutner-Fischer <span dir=3D"ltr">&=
lt;<a href=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb"><div class=3D"h5">On 18 March 2015 at 12:27, Naresh Bhat &lt;=
<a href=3D"mailto:naresh.bhat@linaro.org">naresh.bhat@linaro.org</a>&gt; wr=
ote:<br>
&gt; To generate bootable ISO image the x86 architecture uses syslinux pack=
age (syslinux/isolinux.bin).<br>
&gt; We have already skip the syslinux package on aarch64.=C2=A0 Hence skip=
 the iso image build on aarch64.<br>
&gt;<br>
&gt; Signed-off-by: Naresh Bhat &lt;<a href=3D"mailto:naresh.bhat@linaro.or=
g">naresh.bhat@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/bootimg.bbclass |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbcla=
ss<br>
&gt; index ed7b32f..5a8e70c 100644<br>
&gt; --- a/meta/classes/bootimg.bbclass<br>
&gt; +++ b/meta/classes/bootimg.bbclass<br>
&gt; @@ -33,6 +33,7 @@ do_bootimg[depends] +=3D &quot;dosfstools-native:do_=
populate_sysroot \<br>
&gt;<br>
&gt;=C2=A0 PACKAGES =3D &quot; &quot;<br>
&gt;=C2=A0 EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; +NOISO_aarch64 =3D &quot;1&quot;<br>
<br>
</div></div>how does that help !COMPATIBLE_HOST (of syslinux) except aarch6=
4?<br>
<br>
I meant you to<br>
def mycheck(d):<br>
=C2=A0 h =3D d.getVar(&#39;COMPATIBLE_HOST&#39;, True)<br>
=C2=A0 if h:<br>
=C2=A0 =C2=A0 t =3D d.getVar(&#39;TARGET_ARCH&#39;, True)<br>
=C2=A0 =C2=A0 if re.match(h, t):<br>
=C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0 return 1<br>
<br>
and use that to set NOISO ?=3D &quot;${@mycheck(d)}&quot;<br>
(modulo typos and testing)<br>
<br>
I think something like that should work and i think this would be<br>
preferable to adding all those upcoming NOISO_baz<br>
See what i mean?<br></blockquote><div>Thank you very much.=C2=A0 I will do =
it right now, test with luvos distribution, re-post this patch. <br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
thanks,<br>
</blockquote></div><br></div></div>

--001a11c2a080ecd62805118f6b7f--
