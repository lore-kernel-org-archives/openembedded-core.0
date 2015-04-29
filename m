Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAF872A78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 15:11:39 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so50058564ied.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=loUGjOfOMK+zUp8MSBAmnjSSB93Brx01etNM4buVUW0=;
	b=DFXU+BPFBx4590bfVt0Mz9NVwhsqre8RPAFTX9YCVoZC42MZRwWU92eqwBhP8prxmc
	bCIqJoz/ycUUlBrlqPywuRXrcf7n+rRNEby9/gJ9iDka79wJItCvgtJoNQ6Vgdvd81wC
	pjZ1xtWL0Sdeof2TbzeROpW5CBwBIAms+nnTphWpaMKw76HiduxbENxjWn9tgqy5g2lV
	/4dK+hXDfIJeYHvOAQDH9SS2XovjPOnKgSwaxIb77aH8e8gywUtMiRj0SYFhWRkBf6My
	q6ObJGNcp41Sq5779dVSbYxSRpUY0ex3iSjZhnKzw4tJDmO+yA1JL3Ft9wPx1IMmpad2
	AUPQ==
MIME-Version: 1.0
X-Received: by 10.107.30.10 with SMTP id e10mr28960037ioe.72.1430318623093;
	Wed, 29 Apr 2015 07:43:43 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Wed, 29 Apr 2015 07:43:43 -0700 (PDT)
Received: by 10.50.230.178 with HTTP; Wed, 29 Apr 2015 07:43:43 -0700 (PDT)
In-Reply-To: <1430295059.19130.3.camel@linuxfoundation.org>
References: <9594a8c72803b604619bc23672e227ec29b239f6.1430285475.git.raj.khem@gmail.com>
	<c908ef675077815a75f8dbe800a9e9208d80737f.1430285475.git.raj.khem@gmail.com>
	<1430295059.19130.3.camel@linuxfoundation.org>
Date: Wed, 29 Apr 2015 07:43:43 -0700
Message-ID: <CAMKF1sqbgPnikNbTP-M-QVb9CQ2zdHxGzW70M1BFYA2-APSECg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glibc: ignore for musl/uclibc but only for target recipes
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
X-List-Received-Date: Wed, 29 Apr 2015 15:11:42 -0000
Content-Type: multipart/alternative; boundary=001a1140f33c72065c0514de01a3

--001a1140f33c72065c0514de01a3
Content-Type: text/plain; charset=UTF-8

On Apr 29, 2015 1:11 AM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2015-04-28 at 22:34 -0700, Khem Raj wrote:
> > we still need nativesdk  or native recipes for libc to come
> > from glibc, but only be ignored for target recipes types
> >
> > Change-Id: Ibaf8114f2aef63f1eadf493b264e78cd928535a0
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc-collateral.inc | 3 +++
> >  meta/recipes-core/glibc/glibc_2.21.bb        | 9 +++------
> >  2 files changed, 6 insertions(+), 6 deletions(-)
>
> I'm getting *really* frustrated with the continual changes to these
> lines of code. Can we please figure out something that works, test it
> and make sure that it is the right thing to do, then be done with it.
>
> I'm not merging this for at least a couple of weeks so that we can see
> if it is right or not. I'll revert the last set of changes if that helps
> though.

Revert makes it worse. This makes it better to what we have. World builds
did not show issue. But it shows as we start to build sdk and lsb images
for non glibc systems. It's ok to wait but I have made sure it does not
break glibc. I will run a parse of all possible images in oe-core for musl
and see it works in all cases.
>
> Cheers,
>
> Richard
>
> > diff --git a/meta/recipes-core/glibc/glibc-collateral.inc
b/meta/recipes-core/glibc/glibc-collateral.inc
> > index f82db06..60655eb 100644
> > --- a/meta/recipes-core/glibc/glibc-collateral.inc
> > +++ b/meta/recipes-core/glibc/glibc-collateral.inc
> > @@ -17,3 +17,6 @@ do_compile[noexec] = "1"
> >
> >  do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
> >
> > +COMPATIBLE_HOST_libc-musl_class-target = "null"
> > +COMPATIBLE_HOST_libc-uclibc_class-target = "null"
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.21.bb
b/meta/recipes-core/glibc/glibc_2.21.bb
> > index 58a9601..5295ddd 100644
> > --- a/meta/recipes-core/glibc/glibc_2.21.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> > @@ -64,14 +64,11 @@ TARGET_CPPFLAGS =
"-I${STAGING_DIR_TARGET}${includedir}"
> >  GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET
gez_ER bn_BD te_IN es_CR.ISO-8859-1"
> >
> >  #
> > -# We will skip parsing glibc when system C library selection is not
glibc
> > +# We will skip parsing glibc when target system C library selection is
not glibc
> >  # this helps in easing out parsing for non-glibc system libraries
> >  #
> > -python __anonymous () {
> > -    if d.getVar('TCLIBC', True) != "glibc":
> > -        raise bb.parse.SkipPackage("incompatible with %s C library" %
> > -                                   d.getVar('TCLIBC', True))
> > -}
> > +COMPATIBLE_HOST_libc-musl_class-target = "null"
> > +COMPATIBLE_HOST_libc-uclibc_class-target = "null"
> >
> >  EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
> >                  --without-cvs --disable-profile \
> > --
> > 2.1.4
> >
>
>

--001a1140f33c72065c0514de01a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 29, 2015 1:11 AM, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Tue, 2015-04-28 at 22:34 -0700, Khem Raj wrote:<br>
&gt; &gt; we still need nativesdk=C2=A0 or native recipes for libc to come<=
br>
&gt; &gt; from glibc, but only be ignored for target recipes types<br>
&gt; &gt;<br>
&gt; &gt; Change-Id: Ibaf8114f2aef63f1eadf493b264e78cd928535a0<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/glibc/glibc-collateral.inc | 3 +++<br>
&gt; &gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.21.bb">gl=
ibc_2.21.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 +++------<br>
&gt; &gt;=C2=A0 2 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; I&#39;m getting *really* frustrated with the continual changes to thes=
e<br>
&gt; lines of code. Can we please figure out something that works, test it<=
br>
&gt; and make sure that it is the right thing to do, then be done with it.<=
br>
&gt;<br>
&gt; I&#39;m not merging this for at least a couple of weeks so that we can=
 see<br>
&gt; if it is right or not. I&#39;ll revert the last set of changes if that=
 helps<br>
&gt; though.</p>
<p dir=3D"ltr">Revert makes it worse. This makes it better to what we have.=
 World builds did not show issue. But it shows as we start to build sdk and=
 lsb images for non glibc systems. It&#39;s ok to wait but I have made sure=
 it does not break glibc. I will run a parse of all possible images in oe-c=
ore for musl and see it works in all cases. <br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/=
recipes-core/glibc/glibc-collateral.inc<br>
&gt; &gt; index f82db06..60655eb 100644<br>
&gt; &gt; --- a/meta/recipes-core/glibc/glibc-collateral.inc<br>
&gt; &gt; +++ b/meta/recipes-core/glibc/glibc-collateral.inc<br>
&gt; &gt; @@ -17,3 +17,6 @@ do_compile[noexec] =3D &quot;1&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 do_install[depends] +=3D &quot;virtual/${MLPREFIX}libc:do_p=
opulate_sysroot&quot;<br>
&gt; &gt;<br>
&gt; &gt; +COMPATIBLE_HOST_libc-musl_class-target =3D &quot;null&quot;<br>
&gt; &gt; +COMPATIBLE_HOST_libc-uclibc_class-target =3D &quot;null&quot;<br=
>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.21=
.bb">glibc_2.21.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.=
21.bb">glibc_2.21.bb</a><br>
&gt; &gt; index 58a9601..5295ddd 100644<br>
&gt; &gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.21.bb">gl=
ibc_2.21.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.21.bb">gl=
ibc_2.21.bb</a><br>
&gt; &gt; @@ -64,14 +64,11 @@ TARGET_CPPFLAGS =3D &quot;-I${STAGING_DIR_TAR=
GET}${includedir}&quot;<br>
&gt; &gt;=C2=A0 GLIBC_BROKEN_LOCALES =3D &quot; _ER _ET so_ET yn_ER sid_ET =
tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt; -# We will skip parsing glibc when system C library selection is =
not glibc<br>
&gt; &gt; +# We will skip parsing glibc when target system C library select=
ion is not glibc<br>
&gt; &gt;=C2=A0 # this helps in easing out parsing for non-glibc system lib=
raries<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt; -python __anonymous () {<br>
&gt; &gt; -=C2=A0 =C2=A0 if d.getVar(&#39;TCLIBC&#39;, True) !=3D &quot;gli=
bc&quot;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;inc=
ompatible with %s C library&quot; %<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39=
;TCLIBC&#39;, True))<br>
&gt; &gt; -}<br>
&gt; &gt; +COMPATIBLE_HOST_libc-musl_class-target =3D &quot;null&quot;<br>
&gt; &gt; +COMPATIBLE_HOST_libc-uclibc_class-target =3D &quot;null&quot;<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 EXTRA_OECONF =3D &quot;--enable-kernel=3D${OLDEST_KERNEL} \=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --w=
ithout-cvs --disable-profile \<br>
&gt; &gt; --<br>
&gt; &gt; 2.1.4<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
</p>

--001a1140f33c72065c0514de01a3--
