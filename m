Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id D44566BC9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 16:00:34 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id hl1so1749439igb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WC6ca0quqw6PuY2IB8n+bF6LWecInu3ulrJOrBpwYb8=;
	b=NwEQ9uhbwS5OEbtYkwMDNoDS3+muf55JUQ/4KD6PH0ZwwGJBG0zhbu13RMJ0AllZDS
	8X07Y4FztajViJL91mE4ucdz/3jdWttIVsFEfFFyvYL01IKRHGwd2N9NLaTNwI3CqsD5
	gv7DpX69uiSaJm+2jZCH8PnvPdaY+emsroAlqbEJQjYqv/gUAj0LdrO43slcZ37Acq/Z
	IGi8HB/NQNSr6A6KwJQbSp4IrAoQjbwk8n34WXsCo19miF04lxz9lAY8i+G7jvfyA/fh
	4mgTf3gRRi9l7IdvaYnXf6DY1Ul1mmMSBC4ZAiX4T+25mzheypYkkbchyxNA9CsywX4j
	xctA==
MIME-Version: 1.0
X-Received: by 10.42.203.202 with SMTP id fj10mr2583029icb.51.1395936034954;
	Thu, 27 Mar 2014 09:00:34 -0700 (PDT)
Received: by 10.50.224.136 with HTTP; Thu, 27 Mar 2014 09:00:34 -0700 (PDT)
Received: by 10.50.224.136 with HTTP; Thu, 27 Mar 2014 09:00:34 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7257@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A4C94@post.tritech.se>
	<532C6C96.7020901@windriver.com>
	<CAMKF1sopEU3L-ELyNw9FFMstLtayenJnq-f7W02j1LTX=1A_pA@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B3A7257@post.tritech.se>
Date: Thu, 27 Mar 2014 09:00:34 -0700
Message-ID: <CAMKF1soRgdOhPLj3s_A7RBu6yB4hv5Kf1dd10yr31s+_d44-Ag@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc -- solved
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
X-List-Received-Date: Thu, 27 Mar 2014 16:00:36 -0000
Content-Type: multipart/alternative; boundary=20cf303bf5687e22c604f598af7c

--20cf303bf5687e22c604f598af7c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mar 27, 2014 8:16 AM, "Mats K=C3=A4rrman" <Mats.Karrman@tritech.se> wrot=
e:
>
> Hi Khem,
>
> On Friday, March 21, 2014 6:06 PM, Khem Raj wrote:
> > On Fri, Mar 21, 2014 at 9:45 AM, Mark Hatle <mark.hatle@windriver.com>
wrote:
> >> On 3/21/14, 7:10 AM, Mats K=C3=A4rrman wrote:
> >>>
> >>> Hi,
> >>>
> >>> On: Thursday, March 13, 2014 11:36 AM, Mats K=C3=A4rrman wrote:
> >>>>
> >>>> My "home made" hard float tune for PowerPC looks like this:
> >>>>
> >>>> ------------------------------------------------------------------
> >>>> # Tune for the e300c3 core
> >>>> require conf/machine/include/tune-ppce300c3.inc
> >>>>
> >>>> # Use hardware floating point
> >>>> AVAILTUNES +=3D "ppce300c3hf"
> >>>> TUNE_FEATURES_tune-ppce300c3hf =3D "m32 fpu-hard ppce300c3"
> >>>> TUNE_PKGARCH_tune-ppce300c3hf =3D "ppce300c3hf"
> >>>> PACKAGE_EXTRA_ARCHS_tune-ppce300c3hf =3D
> >>>> "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce300c3hf"
> >>>> DEFAULTTUNE =3D "ppce300c3hf"
> >>>> ------------------------------------------------------------------
> >>>>
> >>>
> >>> I found the reason for the error (deviance) in the sqrt function.
glibc
> >>> has
> >>> special code for PowerPC 603e core (e300 is an optimized variant of
603e).
> >>> By adding the following line to the tuning I now get the same result
as
> >>> for all other environments that I've tried:
> >>>
> >>> GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES",
"ppce300c3",
> >>> "-with-cpu=3D603e", "", d)}"
> >>>
> >>> Does anyone know about the reason for having soft-float as the
default and
> >>> only available alternative for e300c2/3 tunings?
> >>
> >>
> >> My guess is because e300 e300c2 were both soft-float designs.  And
e300c3 is
> >> the first hard float design.
> >>
> >> The e300c3 should inherit and use the 603e directly.  This includes
> >> definiting the TUNE_FEATURES that the 603e does.  If it doesn't do
that, I'd
> >> suggest it's a mistake.
> >>
> >> The default 603e tune should include:
> >>
> >> GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603=
e",
> >> "-with-cpu=3D603e", "", d)}"
> >>
> >> or similar already -- and should already be hard float enabled.
 (ppc603e
> >> soft-float should be the alternative -- as it is significantly rarer
and the
> >> deviation.)
> >
> >
> > alternatively we should define fpu Iplies in glibc for e300c3,
> >
> >>
> >>
> >>> Would it be worthwhile to send a patch to add the hf tuning to
OE-core?
> >>
> >>
> >> As the e300c3 should be hard float, we shouldn't have the 'hf'
designation.
> >> Otherwise, we should ensure the e300c3 tune is correctly configured.
> >
> > may be for now controlling it in tune file is a quicker fix.
> >
>
> Adding "-with-cpu=3D603e" to GLIBC_EXTRA_OECONF proved to be problematic
> as it leads to contradictive --mcpu=3D args to gcc, both "e300c3" and
"603e".
>
> I solved that by using "-with-cpu=3De300c3" and by adding a patch to egli=
bc:
>
---------------------------------------------------------------------------=
---
> --- libc.orig/ports/sysdeps/powerpc/powerpc32/e300c3/fpu/Implies
> +++ libc/ports/sysdeps/powerpc/powerpc32/e300c3/fpu/Implies
> @@ -0,0 +1,2 @@
> +# e300c3 is a variant of 603e so use the same optimizations for sqrt
> +powerpc/powerpc32/603e/fpu

yes thats ok

>
---------------------------------------------------------------------------=
---
> Does this seem correct to you?
>
> Initial tests shows that at least the sqrt test now works. The reason
> I'm holding back on patches to the tune file is that I still have trouble
> with time related syscalls, see [1].
>
> >>
> >>> In that case what tests should be performed before that and what
(related)
> >>> tests are performed by the OE auto-builder?
>
> BR // Mats
>
> [1]
http://lists.openembedded.org/pipermail/openembedded-core/2014-March/091011=
.html
>

--20cf303bf5687e22c604f598af7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Mar 27, 2014 8:16 AM, &quot;Mats K=C3=A4rrman&quot; &lt;<=
a href=3D"mailto:Mats.Karrman@tritech.se">Mats.Karrman@tritech.se</a>&gt; w=
rote:<br>
&gt;<br>
&gt; Hi Khem,<br>
&gt;<br>
&gt; On Friday, March 21, 2014 6:06 PM, Khem Raj wrote:<br>
&gt; &gt; On Fri, Mar 21, 2014 at 9:45 AM, Mark Hatle &lt;<a href=3D"mailto=
:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt; &gt;&gt; On 3/21/14, 7:10 AM, Mats K=C3=A4rrman wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Hi,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On: Thursday, March 13, 2014 11:36 AM, Mats K=C3=A4rrman =
wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; My &quot;home made&quot; hard float tune for PowerPC =
looks like this:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; -----------------------------------------------------=
-------------<br>
&gt; &gt;&gt;&gt;&gt; # Tune for the e300c3 core<br>
&gt; &gt;&gt;&gt;&gt; require conf/machine/include/tune-ppce300c3.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; # Use hardware floating point<br>
&gt; &gt;&gt;&gt;&gt; AVAILTUNES +=3D &quot;ppce300c3hf&quot;<br>
&gt; &gt;&gt;&gt;&gt; TUNE_FEATURES_tune-ppce300c3hf =3D &quot;m32 fpu-hard=
 ppce300c3&quot;<br>
&gt; &gt;&gt;&gt;&gt; TUNE_PKGARCH_tune-ppce300c3hf =3D &quot;ppce300c3hf&q=
uot;<br>
&gt; &gt;&gt;&gt;&gt; PACKAGE_EXTRA_ARCHS_tune-ppce300c3hf =3D<br>
&gt; &gt;&gt;&gt;&gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce300c3hf=
&quot;<br>
&gt; &gt;&gt;&gt;&gt; DEFAULTTUNE =3D &quot;ppce300c3hf&quot;<br>
&gt; &gt;&gt;&gt;&gt; -----------------------------------------------------=
-------------<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I found the reason for the error (deviance) in the sqrt f=
unction. glibc<br>
&gt; &gt;&gt;&gt; has<br>
&gt; &gt;&gt;&gt; special code for PowerPC 603e core (e300 is an optimized =
variant of 603e).<br>
&gt; &gt;&gt;&gt; By adding the following line to the tuning I now get the =
same result as<br>
&gt; &gt;&gt;&gt; for all other environments that I&#39;ve tried:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; GLIBC_EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&quot;=
TUNE_FEATURES&quot;, &quot;ppce300c3&quot;,<br>
&gt; &gt;&gt;&gt; &quot;-with-cpu=3D603e&quot;, &quot;&quot;, d)}&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Does anyone know about the reason for having soft-float a=
s the default and<br>
&gt; &gt;&gt;&gt; only available alternative for e300c2/3 tunings?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; My guess is because e300 e300c2 were both soft-float designs.=
 =C2=A0And e300c3 is<br>
&gt; &gt;&gt; the first hard float design.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The e300c3 should inherit and use the 603e directly. =C2=A0Th=
is includes<br>
&gt; &gt;&gt; definiting the TUNE_FEATURES that the 603e does. =C2=A0If it =
doesn&#39;t do that, I&#39;d<br>
&gt; &gt;&gt; suggest it&#39;s a mistake.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The default 603e tune should include:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; GLIBC_EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&quot;TUNE=
_FEATURES&quot;, &quot;ppc603e&quot;,<br>
&gt; &gt;&gt; &quot;-with-cpu=3D603e&quot;, &quot;&quot;, d)}&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; or similar already -- and should already be hard float enable=
d. =C2=A0(ppc603e<br>
&gt; &gt;&gt; soft-float should be the alternative -- as it is significantl=
y rarer and the<br>
&gt; &gt;&gt; deviation.)<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; alternatively we should define fpu Iplies in glibc for e300c3,<br=
>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Would it be worthwhile to send a patch to add the hf tuni=
ng to OE-core?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; As the e300c3 should be hard float, we shouldn&#39;t have the=
 &#39;hf&#39; designation.<br>
&gt; &gt;&gt; Otherwise, we should ensure the e300c3 tune is correctly conf=
igured.<br>
&gt; &gt;<br>
&gt; &gt; may be for now controlling it in tune file is a quicker fix.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Adding &quot;-with-cpu=3D603e&quot; to GLIBC_EXTRA_OECONF proved to be=
 problematic<br>
&gt; as it leads to contradictive --mcpu=3D args to gcc, both &quot;e300c3&=
quot; and &quot;603e&quot;.<br>
&gt;<br>
&gt; I solved that by using &quot;-with-cpu=3De300c3&quot; and by adding a =
patch to eglibc:<br>
&gt; ----------------------------------------------------------------------=
--------<br>
&gt; --- libc.orig/ports/sysdeps/powerpc/powerpc32/e300c3/fpu/Implies<br>
&gt; +++ libc/ports/sysdeps/powerpc/powerpc32/e300c3/fpu/Implies<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +# e300c3 is a variant of 603e so use the same optimizations for sqrt<=
br>
&gt; +powerpc/powerpc32/603e/fpu</p>
<p dir=3D"ltr">yes thats ok<br></p>
<p dir=3D"ltr">&gt; -------------------------------------------------------=
-----------------------<br>
&gt; Does this seem correct to you?<br>
&gt;<br>
&gt; Initial tests shows that at least the sqrt test now works. The reason<=
br>
&gt; I&#39;m holding back on patches to the tune file is that I still have =
trouble<br>
&gt; with time related syscalls, see [1].<br>
&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; In that case what tests should be performed before that a=
nd what (related)<br>
&gt; &gt;&gt;&gt; tests are performed by the OE auto-builder?<br>
&gt;<br>
&gt; BR // Mats<br>
&gt;<br>
&gt; [1] <a href=3D"http://lists.openembedded.org/pipermail/openembedded-co=
re/2014-March/091011.html">http://lists.openembedded.org/pipermail/openembe=
dded-core/2014-March/091011.html</a><br>
&gt;<br>
</p>

--20cf303bf5687e22c604f598af7c--
