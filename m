Return-Path: <andrea.adami@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 89C8073E11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 09:47:34 +0000 (UTC)
Received: by iodv127 with SMTP id v127so105108523iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=06xWpayO1SOjaFQcTfQGMxuo97M26QcV46ccXZP/Cho=;
	b=ui7Elpda5kvoTdwCVZpJSmwS7k3R3iNpLnGHHkZU6IMf2+NCW8jsSysMzcU6yi4kKU
	yIjriRM6IJYDDRteFJnRRW4w32CyOG216opIZZ+CArUlJO9KCfPyGjTCqsunudPTwHkr
	JNVjN+4WGCUerDnqUxQ4OvBYb4RaSkzjval2RPWnBs+zxqVXfcy2gLgOhqd61bjjZ2g8
	DYh9DqpXsqeXfUqJFq/figu+MHTOoXntfg1GR3VO/VxCqupsGZcw5Q5QZDGD/4Gf2CYS
	uReqSSejNNdlLeqZogD2iLopdES2JXVyr5IdwVT/kysyg43ocu+SewgRQz7abGnBUf+H
	mOFg==
MIME-Version: 1.0
X-Received: by 10.107.168.40 with SMTP id r40mr10635286ioe.20.1440236854361;
	Sat, 22 Aug 2015 02:47:34 -0700 (PDT)
Received: by 10.36.158.5 with HTTP; Sat, 22 Aug 2015 02:47:34 -0700 (PDT)
In-Reply-To: <CAJ86T=XmEdEQWhpSR9nZsnqn+pZqBdZmNqtfnKfXDx52CGXaxw@mail.gmail.com>
References: <1440199709-23502-1-git-send-email-andrea.adami@gmail.com>
	<CAJ86T=XmEdEQWhpSR9nZsnqn+pZqBdZmNqtfnKfXDx52CGXaxw@mail.gmail.com>
Date: Sat, 22 Aug 2015 11:47:34 +0200
Message-ID: <CAAQYJAugiMk95tg9rKk1PXfWQ4HXZXZnHeyHbjvWSQgfJ9kAOg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: add dependency on acl
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
X-List-Received-Date: Sat, 22 Aug 2015 09:47:35 -0000
Content-Type: multipart/alternative; boundary=001a11425c5218c28d051de346b6

--001a11425c5218c28d051de346b6
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 22, 2015 at 2:44 AM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Aug 21, 2015 at 4:28 PM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
> > After commit 24fde4d do_compile fails:
> >
> > | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
> > |  #include <sys/acl.h>
> >
> > Adding acl to the list of dependencies fixes the build.
>
> Unconditionally enabling xattr and acl support is OK for the native
> build, but for the target both should probably be conditional on their
> respective DISTRO_FEATURES.
>

I can agree, acl is one distro feature but atm it is not used by nodistro
and poky.
So the patch unconditionally  -DWITHOUT_XATTR seems wrong...this should be
done only if acl is used.

Andrea



>
>
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> > index 8d4892a..72ce9ed 100644
> > --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> > +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> > @@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3
> \
> >
> file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
> >
> > -DEPENDS = "zlib lzo e2fsprogs util-linux"
> > +DEPENDS = "zlib lzo e2fsprogs util-linux acl"
> >
> >  PV = "1.5.1+git${SRCPV}"
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11425c5218c28d051de346b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Aug 22, 2015 at 2:44 AM, Andre McCurdy <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 Fri, Aug 21, 2015 at 4:28 PM, Andrea Adami &lt;<a href=3D"mailto:andrea.ad=
ami@gmail.com">andrea.adami@gmail.com</a>&gt; wrote:<br>
&gt; After commit 24fde4d do_compile fails:<br>
&gt;<br>
&gt; | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or director=
y<br>
&gt; |=C2=A0 #include &lt;sys/acl.h&gt;<br>
&gt;<br>
&gt; Adding acl to the list of dependencies fixes the build.<br>
<br>
</span>Unconditionally enabling xattr and acl support is OK for the native<=
br>
build, but for the target both should probably be conditional on their<br>
respective DISTRO_FEATURES.<br></blockquote><div><br></div><div>I can agree=
, acl is one distro feature but atm it is not used by nodistro and poky.<br=
></div><div>So the patch unconditionally=C2=A0 -DWITHOUT_XATTR seems wrong.=
..this should be done only if acl is used.<br></div><div><br></div><div>And=
rea<br></div><div><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; Signed-off-by: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.c=
om">andrea.adami@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git=
.bb" rel=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> b/meta/recip=
es-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mtd-utils_git.bb</a><br>
&gt; index 8d4892a..72ce9ed 100644<br>
&gt; --- a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;GPLv2+&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff0215e8d=
672dc4c32c317bb3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://include/common.h;beginline=3D1;endline=3D17;md5=3Dba05b07912a=
44ea2bf81ce409380049c&quot;<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;zlib lzo e2fsprogs util-linux&quot;<br>
&gt; +DEPENDS =3D &quot;zlib lzo e2fsprogs util-linux acl&quot;<br>
&gt;<br>
&gt;=C2=A0 PV =3D &quot;1.5.1+git${SRCPV}&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a11425c5218c28d051de346b6--
