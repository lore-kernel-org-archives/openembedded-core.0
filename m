Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB3F614F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:40:25 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so4222517wes.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 05:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=heOOl/hmyuF11KhBWrMjlV59UiTJqaPLVqEN/eI6/GQ=;
	b=dVGckEgC/l/Rw39QvNmlG4PCPh5Vbz9VFP/PDD+7eL1y8X/U3mKdXIeCrhUOmiGDjg
	wzIH5JDgHPvqm8O2TAFtxlACI3Yqdgn6iO/X8aGQg39J0dUAKHmx1D7GXzI8yYa/7BzQ
	ICZTJmP/PEgcMxbMB1rgOVqYcw3Ses7E1545uyQkQiMPtYcXYwZJze3Rl2c47BwzDNIf
	LHraZYsYncQLptRReLVenfY3knbuIT5C8xytHBLUpRxKOAFYe097jZhLJGr4omRfnylQ
	YRncTe/YWhHhcITDSik3EzdzvKRIC5gppmvzbh0Peojr8WI70bieeH4kZLJ6PoNaeYvm
	yrXg==
X-Gm-Message-State: ALoCoQlZDpylTKmqUiLDUJ7lf50TBUI6Ge/TBqwGZGMcDljQR4qEdBGZUOwirFrYQn86zbn8N2Wi
X-Received: by 10.180.160.229 with SMTP id xn5mr8366751wib.62.1378730426430;
	Mon, 09 Sep 2013 05:40:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.218.200 with HTTP; Mon, 9 Sep 2013 05:40:06 -0700 (PDT)
In-Reply-To: <CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 9 Sep 2013 14:40:06 +0200
Message-ID: <CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Mon, 09 Sep 2013 12:40:25 -0000
Content-Type: multipart/alternative; boundary=047d7b60408a4f074c04e5f2b139

--047d7b60408a4f074c04e5f2b139
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 9, 2013 at 2:12 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 9 September 2013 13:08, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> +REQUIRED_DISTRO_FEATURES = "opengl"
> >
> > Is this really needed? I was building mesa in distro without opengl for
> > long time and was considering (probably incorrectly) opengl
> DISTRO_FEATURE more
> > like sign of proper hw GL libraries.
>
> I'd always understood the "opengl" DISTRO_FEATURE to mean "give me GL
> support".  *What* that means depends on the target hardware, could be
> entirely software rendering through Mesa or binary HW drivers.


how about gl vs gles?

i have been trying to understand over the last couple of days whether or
not 'opengl' in DISTRO_FEATURES means OpenGL and OpenGLES. I don't think
it's clearly indicated anywhere.

in libsdl recipe, we have this:

DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '',
d)} \

           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
'', d)} \

and in EXTRA_OECONF we add this:
${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl',
'--disable-video-opengl', d)} \


which tends to make me think that 'opengl' means 'OpenGL', not OpenGLES. I
am building for ARM platforms with GLes support, but no GL support. I
initially had 'opengl' in DISTRO_FEATURES, but we ended with mesa being
pulled in because of libsdl, which was wrong. So we now removed 'opengl'
from our DISTRO_FEATURES list. (note we have our own EGL/GLes library for
GPU, so we don't want mesa at all).

In weston recipe, we have this:
${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)}

so, that seems to imply that opengles2 is now a 'new' DISTRO_FEATURES, but
it's only used once (looking at oe-core and meta-oe).

To me having 2 different flags for opengl and opengles in DISTRO_FEATURES
does make sense...  but i could be wrong..

what do you think?

--047d7b60408a4f074c04e5f2b139
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Sep 9, 2013 at 2:12 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On 9 September 2013 13:08, Martin Jansa =
&lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt=
; wrote:<br>


&gt;&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt;<br>
&gt; Is this really needed? I was building mesa in distro without opengl fo=
r<br>
&gt; long time and was considering (probably incorrectly) opengl DISTRO_FEA=
TURE more<br>
&gt; like sign of proper hw GL libraries.<br>
<br>
</div>I&#39;d always understood the &quot;opengl&quot; DISTRO_FEATURE to me=
an &quot;give me GL<br>
support&quot;. =A0*What* that means depends on the target hardware, could b=
e<br>
entirely software rendering through Mesa or binary HW drivers.</blockquote>=
</div><br>how about gl vs gles?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">i have been trying to understand over the last co=
uple of days whether or not &#39;opengl&#39; in DISTRO_FEATURES means OpenG=
L and OpenGLES. I don&#39;t think it&#39;s clearly indicated anywhere.</div=
>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">in libsdl r=
ecipe, we have this:</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra"><div class=3D"gmail_extra">DEPENDS =3D &quot;${@base_conta=
ins(&#39;DISTRO_FEATURES&#39;, &#39;directfb&#39;, &#39;directfb&#39;, &#39=
;&#39;, d)} \ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>

<div class=3D"gmail_extra">=A0 =A0 =A0 =A0 =A0 =A0${@base_contains(&#39;DIS=
TRO_FEATURES&#39;, &#39;opengl&#39;, &#39;virtual/libgl&#39;, &#39;&#39;, d=
)} \ =A0 =A0 =A0 =A0</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">and in EXTRA_OECONF we add this:</div>

<div class=3D"gmail_extra">${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39=
;opengl&#39;, &#39;--enable-video-opengl&#39;, &#39;--disable-video-opengl&=
#39;, d)} \ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>

<div><br></div><div class=3D"gmail_extra">which tends to make me think that=
 &#39;opengl&#39; means &#39;OpenGL&#39;, not OpenGLES. I am building for A=
RM platforms with GLes support, but no GL support. I initially had &#39;ope=
ngl&#39; in DISTRO_FEATURES, but we ended with mesa being pulled in because=
 of libsdl, which was wrong. So we now removed &#39;opengl&#39; from our DI=
STRO_FEATURES list. (note we have our own EGL/GLes library for GPU, so we d=
on&#39;t want mesa at all).</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">In weston r=
ecipe, we have this:</div><div class=3D"gmail_extra">${@base_contains(&#39;=
DISTRO_FEATURES&#39;, &#39;opengles2&#39;, &#39;gles&#39;, &#39;&#39;, d)}=
=A0<br>

</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">so, t=
hat seems to imply that opengles2 is now a &#39;new&#39; DISTRO_FEATURES, b=
ut it&#39;s only used once (looking at oe-core and meta-oe).=A0</div><div c=
lass=3D"gmail_extra">

<br></div><div class=3D"gmail_extra">To me having 2 different flags for ope=
ngl and opengles in DISTRO_FEATURES does make sense... =A0but i could be wr=
ong..</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
what do you think?</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra"><br></div></div><div class=3D"gmail_extra"><br></=
div></div>

--047d7b60408a4f074c04e5f2b139--
