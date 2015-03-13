Return-Path: <naresh.bhat@linaro.org>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id A98796013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 17:03:40 +0000 (UTC)
Received: by lbvp9 with SMTP id p9so24141889lbv.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 10:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=RwsO0zP47QnvZzEnGm1u/A9W3XvPB7ABTnIzR0ena3U=;
	b=PPe1ElNIiZWke/hsxgYRM0aglDE3wiVyryYujz2rgP0kI+ShzmO5IPzvcPFZEbFC2F
	rBAs4f0CQhsGcZQmgk3HjHcKiMruD1mx7W1B7RkpGvFoKOQ2/5jAd4beOmP4zm6de7Vq
	RZrQQs36+y87RNG2WLU6qQ7vn9mt6gRQV/f95HpvTjlPeL+3unXLce4hMD9mNmvabdPC
	KfY9KHNoOvbNeXSgayf9m59G8h3yRRO5XwQ8w/kaHct9vW66H+e9Yhn4ZqISzKnpsCM6
	4Uoe4xWR7P8Zy5xCqRwaEdwk6ff9Tzv5JHTlsnHFV11aD5fiZzj0SolH56VI1N6wAE2M
	3Wyg==
X-Gm-Message-State: ALoCoQmNKSvURyS9+FQq82OnpceUg5PHW2F2FSND8Nf2h0WYWANVvfPy8Ilh2cYfi200+gJY79ww
MIME-Version: 1.0
X-Received: by 10.152.204.42 with SMTP id kv10mr37425426lac.52.1426266220157; 
	Fri, 13 Mar 2015 10:03:40 -0700 (PDT)
Received: by 10.112.5.73 with HTTP; Fri, 13 Mar 2015 10:03:40 -0700 (PDT)
In-Reply-To: <1426262354.9114.211.camel@linuxfoundation.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
	<1426258527-2329-3-git-send-email-naresh.bhat@linaro.org>
	<1426262354.9114.211.camel@linuxfoundation.org>
Date: Fri, 13 Mar 2015 22:33:40 +0530
Message-ID: <CAFoFrHbdGXok2_q7tCLbPnf9gA9rx=L10ab4k74HR891UTtvag@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core v1 PATCH 2/5] syslinux: Remove bootimg dependency on aarch64
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
X-List-Received-Date: Fri, 13 Mar 2015 17:03:43 -0000
Content-Type: multipart/alternative; boundary=001a1135fae268729605112e7b26

--001a1135fae268729605112e7b26
Content-Type: text/plain; charset=UTF-8

On 13 March 2015 at 21:29, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2015-03-13 at 20:25 +0530, Naresh Bhat wrote:
> > Remove the bootimg dependency as syslinux for aarch64. The reason to
> skip the syslinux package
> > - syslinux package contains x86 assembly code. Hence it cannot be
> compiled on aarch64.
> > - There is no BIOS on aarch64 to answer syscalls.
> >
> > Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> > ---
> >  meta/classes/syslinux.bbclass |   10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/syslinux.bbclass
> b/meta/classes/syslinux.bbclass
> > index d6498d9..7bd8fed 100644
> > --- a/meta/classes/syslinux.bbclass
> > +++ b/meta/classes/syslinux.bbclass
> > @@ -17,7 +17,15 @@
> >  # ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot
> argument
> >  # ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments
> >
> > -do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
> > +def boot_image_depends(bb, d):
> > +         import re
> > +         deps = bb.data.getVar('TARGET_PREFIX', d, True)
> > +         if re.search("(x86_64|i.86).*",deps):
> > +                 return "${MLPREFIX}syslinux:do_populate_sysroot"
> > +         if re.search("aarch64",deps):
> > +                 return ""
> > +BIMGDEP = "${@boot_image_depends(bb, d)}"
> > +do_bootimg[depends] += "${BIMGDEP} \
> >                          syslinux-native:do_populate_sysroot"
>
> How about something simpler like:
>
> EXTRABOOTIMGDEPS = ""
> EXTRABOOTIMGDEPS_x86 = "${MLPREFIX}syslinux:do_populate_sysroot"
> EXTRABOOTIMGDEPS_x86-64 = "${MLPREFIX}syslinux:do_populate_sysroot"
>
> ?
>
Thank you very much.  Yes, it is more simple. I will test the same
implementation and make the changes in the next series.

>
> Cheers,
>
> Richard
>
>

--001a1135fae268729605112e7b26
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 13 March 2015 at 21:29, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Fri, 2015-03-13 at 20:25 +=
0530, Naresh Bhat wrote:<br>
&gt; Remove the bootimg dependency as syslinux for aarch64. The reason to s=
kip the syslinux package<br>
&gt; - syslinux package contains x86 assembly code. Hence it cannot be comp=
iled on aarch64.<br>
&gt; - There is no BIOS on aarch64 to answer syscalls.<br>
&gt;<br>
&gt; Signed-off-by: Naresh Bhat &lt;<a href=3D"mailto:naresh.bhat@linaro.or=
g">naresh.bhat@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/syslinux.bbclass |=C2=A0 =C2=A010 +++++++++-<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbc=
lass<br>
&gt; index d6498d9..7bd8fed 100644<br>
&gt; --- a/meta/classes/syslinux.bbclass<br>
&gt; +++ b/meta/classes/syslinux.bbclass<br>
&gt; @@ -17,7 +17,15 @@<br>
&gt;=C2=A0 # ${SYSLINUX_SERIAL_TTY} - Set alternate console=3Dtty... kernel=
 boot argument<br>
&gt;=C2=A0 # ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments<br>
&gt;<br>
&gt; -do_bootimg[depends] +=3D &quot;${MLPREFIX}syslinux:do_populate_sysroo=
t \<br>
&gt; +def boot_image_depends(bb, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import re<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D bb.data.getVar(&#39;TARGET=
_PREFIX&#39;, d, True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if re.search(&quot;(x86_64|i.86).*&=
quot;,deps):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
&quot;${MLPREFIX}syslinux:do_populate_sysroot&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if re.search(&quot;aarch64&quot;,de=
ps):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
&quot;&quot;<br>
&gt; +BIMGDEP =3D &quot;${@boot_image_depends(bb, d)}&quot;<br>
&gt; +do_bootimg[depends] +=3D &quot;${BIMGDEP} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 syslinux-native:do_populate_sysroot&quot;<br>
<br>
</div></div>How about something simpler like:<br>
<br>
EXTRABOOTIMGDEPS =3D &quot;&quot;<br>
EXTRABOOTIMGDEPS_x86 =3D &quot;${MLPREFIX}syslinux:do_populate_sysroot&quot=
;<br>
EXTRABOOTIMGDEPS_x86-64 =3D &quot;${MLPREFIX}syslinux:do_populate_sysroot&q=
uot;<br>
<br>
?<br></blockquote><div>Thank you very much.=C2=A0 Yes, it is more simple. I=
 will test the same implementation and make the changes in the next series.=
=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div></div>

--001a1135fae268729605112e7b26--
