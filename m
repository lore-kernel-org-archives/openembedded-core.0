Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id AA654760F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 15:32:28 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so104727940wic.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=C/S5JygkXLJHcXFRcRV86SMstfdR7F2sT+Lyi/ena4w=;
	b=DFt1CjbP/NZCSPtc8oQU12rU0iGWQAuc9OpP8Ci90v5RgZY8H0A6RBKa/1uH0Ebd9U
	Lnm878aVDuLHduBJ61pb34sbL5JkK9OtqdpcNvkUs7IGos451SwUQuM/CA6Coabhxron
	z9441YqE2vAwxSTeA/MCDwpXPl/jjve+8SRqaRRFygRZj/hhjY8aaEw6BTpmuuCaZAFv
	Vv/HbfeISAPXKoRqanbeOobZGcwKuDvio7ux7zMToARLdnLSy4hUR/FjRKuODt1+y04b
	A0ToCL0kKz3TquJoxyMoUXZu1C5Byji+1LZ+JYhSB90xU9j8oPjhyvX99XrapIXXxcJD
	Unpw==
X-Received: by 10.180.12.195 with SMTP id a3mr4886686wic.71.1444491147946;
	Sat, 10 Oct 2015 08:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
	<561900D1.5060906@igalia.com>
In-Reply-To: <561900D1.5060906@igalia.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 10 Oct 2015 15:32:18 +0000
Message-ID: <CA+chaQffPJOrTzmZRoxUAJ1LnixtbJHLtJ5wm7eJAWGiZxnpXg@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Sat, 10 Oct 2015 15:32:31 -0000
Content-Type: multipart/alternative; boundary=001a11c3516ec130260521c1cd58

--001a11c3516ec130260521c1cd58
Content-Type: text/plain; charset=UTF-8

Did you enable thumb in that build? It's not enabled by default.

ARM_INSTRUCTION_SET is for recipes to use arm when distro selects thumb by
default.

On Sat, Oct 10, 2015, 14:13 Carlos Alberto Lopez Perez <clopez@igalia.com>
wrote:

> On 09/10/15 17:11, Martin Jansa wrote:
> > * gcr, libsecret are new since switch to gcc 5.2
> > * webkitgtk is old but it was removed while migrating from
> >   webkit-gtk to webkitgtl (like REQUIRED_DISTRO_FEATURES were) :/
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
>
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> > index f14c868..e29666a 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> > @@ -70,3 +70,5 @@ FILES_${PN} +=
> "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbu
> >  FILES_${PN}-dbg +=
> "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/libwebkit2gtkinjectedbundle.so"
> >  FILES_${PN}-dbg += "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
> >
> > +# http://errors.yoctoproject.org/Errors/Details/20370/
> > +ARM_INSTRUCTION_SET = "arm"
> >
>
> I tried to build webkitgtk using current master of poky for machine
> qemuarm and it built fine:
>
> Build Configuration:
> BB_VERSION        = "1.28.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Debian-8.1"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "qemuarm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.0"
> TUNE_FEATURES     = "arm armv5 thumb dsp"
> TARGET_FPU        = "soft"
> meta
> meta-yocto
> meta-yocto-bsp    = "master:ceeb52a2544045fe8432e36307a321f6e934de49"
>
>
>
>
> Can you tell me how to reproduce this failure?
> Also, what the ARM_INSTRUCTION_SET = "arm" line does?
> Thanks.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c3516ec130260521c1cd58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Did you enable thumb in that build? It&#39;s not enabled by =
default.</p>
<p dir=3D"ltr">ARM_INSTRUCTION_SET is for recipes to use arm when distro se=
lects thumb by default.</p>

<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Oct 10, 2015, 14:13=
=C2=A0Carlos Alberto Lopez Perez &lt;<a href=3D"mailto:clopez@igalia.com" t=
arget=3D"_blank">clopez@igalia.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On 09/10/15 17:11, Martin Jansa wrote:<br>
&gt; * gcr, libsecret are new since switch to gcc 5.2<br>
&gt; * webkitgtk is old but it was removed while migrating from<br>
&gt;=C2=A0 =C2=A0webkit-gtk to webkitgtl (like REQUIRED_DISTRO_FEATURES wer=
e) :/<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.8.=
5.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.8.5.bb</a> b/meta/re=
cipes-sato/webkit/<a href=3D"http://webkitgtk_2.8.5.bb" rel=3D"noreferrer" =
target=3D"_blank">webkitgtk_2.8.5.bb</a><br>
&gt; index f14c868..e29666a 100644<br>
&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.8.5.bb" r=
el=3D"noreferrer" target=3D"_blank">webkitgtk_2.8.5.bb</a><br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.8.5.bb" r=
el=3D"noreferrer" target=3D"_blank">webkitgtk_2.8.5.bb</a><br>
&gt; @@ -70,3 +70,5 @@ FILES_${PN} +=3D &quot;${libdir}/webkit2gtk-4.0/inje=
cted-bundle/libwebkit2gtkinjectedbu<br>
&gt;=C2=A0 FILES_${PN}-dbg +=3D &quot;${libdir}/webkit2gtk-4.0/injected-bun=
dle/.debug/libwebkit2gtkinjectedbundle.so&quot;<br>
&gt;=C2=A0 FILES_${PN}-dbg +=3D &quot;${libdir}/webkitgtk/webkit2gtk-4.0/.d=
ebug/*&quot;<br>
&gt;<br>
&gt; +# <a href=3D"http://errors.yoctoproject.org/Errors/Details/20370/" re=
l=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/De=
tails/20370/</a><br>
&gt; +ARM_INSTRUCTION_SET =3D &quot;arm&quot;<br>
&gt;<br>
<br>
I tried to build webkitgtk using current master of poky for machine<br>
qemuarm and it built fine:<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.28.0&quot;<br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Debian-8.1&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-poky-linux-gnueabi&quot=
;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;qemuarm&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2.0&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv5 thumb dsp&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;soft&quot;<br>
meta<br>
meta-yocto<br>
meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;master:ceeb52a2544045fe8432e36307a321=
f6e934de49&quot;<br>
<br>
<br>
<br>
<br>
Can you tell me how to reproduce this failure?<br>
Also, what the ARM_INSTRUCTION_SET =3D &quot;arm&quot; line does?<br>
Thanks.<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a11c3516ec130260521c1cd58--
