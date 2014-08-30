Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 900AB70281
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 14:48:43 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id n15so3997562lbi.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hkK1obfSSOHDgBWIaIAVdVEyHj8gzS7mwhhlXd8Rb8Y=;
	b=HaZOevo6BazmmAepqm6Ovdm5793NXX0LPrk8kN/VGvLM8kJocA4EqddZ86a6MQR7jY
	F9faR50X6WTLNH0KGEp/h3WZKsq6VyV7aszw4gcNnv8fFNbBfG2jQgjtmFJh6QlTnuvB
	w+rsxQsHLCfWATQwYm6JS9yG53imTy/fH7q0aJHVvacZDSlKZ3wVV8/lxs+HNHjSuWCa
	TuUE0uZ5B5dOtJw/ZqePMwhIMHOPB/M5ZLMIqM3yTMR0m6PiH5NGMJj5bc1nrpv1iFRW
	Y7vMsZERtKSlUK3qcLkpNWiqHM8ZkfWb9OYofELVE1kp4+g7bVOedbYiRjs+9n2Adxs0
	BgMw==
MIME-Version: 1.0
X-Received: by 10.152.6.5 with SMTP id w5mr2171771law.94.1409410124076; Sat,
	30 Aug 2014 07:48:44 -0700 (PDT)
Received: by 10.25.170.142 with HTTP; Sat, 30 Aug 2014 07:48:44 -0700 (PDT)
In-Reply-To: <1408265720.24858.6.camel@ted>
References: <1406969694.6981.22.camel@ted>
	<CAPbeDCnE1f7Hcu7OpHWJFE=Jr6-_P7eowweAMvV2Cm0wvBCHNA@mail.gmail.com>
	<1408265720.24858.6.camel@ted>
Date: Sat, 30 Aug 2014 16:48:44 +0200
Message-ID: <CAPbeDCksNCXPrch9enks6Aux=UT_+WHqj-xntvkwhav-nAzaZA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] pixbufcache: Use sceneQueueComplete event to simplify usage
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
X-List-Received-Date: Sat, 30 Aug 2014 14:48:48 -0000
Content-Type: multipart/alternative; boundary=089e013d1e72c9dbac0501d9dd11

--089e013d1e72c9dbac0501d9dd11
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 17, 2014 at 10:55 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2014-08-17 at 10:33 +0200, Jacob Kroon wrote:
> > On Sat, Aug 2, 2014 at 10:54 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >         [This is an RFC which depends on a patch to bitbake to
> >         operate]
> >
> >         Currently, we have a mess of dependencies for pixbufcache and
> >         even then
> >         it breaks since they might be controlled by PACKAGECONFIG.
> >
> >         Instead, this patch proposes an alternative approach where we
> >         allow
> >         "fixups" from a sceneQueueComplete() event at the end of the
> >         setscene
> >         process. We signal the need for these using simply stamp
> >         files.
> >
> >         The one downside is that the processing code needs to be in a
> >         global
> >         event handler like base.bbclass rather than
> >         pixbufcache.bbclass but this
> >         is probably a price worth paying to avoid the dependency mess?
> >
> >         Signed-off-by: Richard Purdie
> >         <richard.purdie@linuxfoundation.org>
> >
> >
> >
> > Instead of having the sstate_postinst() touch "needpixbuf", could we
> > make it write out the actual script that needs to be executed ?
> >
> > Then base.bbclass could iterate over any scripts installed by any
> > sstate_postinst() and execute them. At least this would better isolate
> > the pixbuf-code to pixbufcache.bbclass, and make the snippet in
> > base.bbclass more generic.
>
> It does become trickier to avoid races when writing out that script.
> Touching the file is rather easy from a lock perspective :)
>
>
How about prefixing the actual written out script with "${PN}-" ? That
would prevent races writing the script.
Downside would be that the pixbuf-cache update would be run multiple times.

--089e013d1e72c9dbac0501d9dd11
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Aug 17, 2014 at 10:55 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On S=
un, 2014-08-17 at 10:33 +0200, Jacob Kroon wrote:<br>
&gt; On Sat, Aug 2, 2014 at 10:54 AM, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[This is an RFC which depends on a pa=
tch to bitbake to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0operate]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Currently, we have a mess of dependen=
cies for pixbufcache and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0even then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it breaks since they might be control=
led by PACKAGECONFIG.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Instead, this patch proposes an alter=
native approach where we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allow<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fixups&quot; from a sceneQueueC=
omplete() event at the end of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setscene<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0process. We signal the need for these=
 using simply stamp<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The one downside is that the processi=
ng code needs to be in a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0global<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event handler like base.bbclass rathe=
r than<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pixbufcache.bbclass but this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is probably a price worth paying to a=
void the dependency mess?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Richard Purdie<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Instead of having the sstate_postinst() touch &quot;needpixbuf&quot;, =
could we<br>
&gt; make it write out the actual script that needs to be executed ?<br>
&gt;<br>
&gt; Then base.bbclass could iterate over any scripts installed by any<br>
&gt; sstate_postinst() and execute them. At least this would better isolate=
<br>
&gt; the pixbuf-code to pixbufcache.bbclass, and make the snippet in<br>
&gt; base.bbclass more generic.<br>
<br>
</div></div>It does become trickier to avoid races when writing out that sc=
ript.<br>
Touching the file is rather easy from a lock perspective :)<br>
<br></blockquote><br></div>How about prefixing the actual written out scrip=
t with &quot;${PN}-&quot; ? That would prevent races writing the script.<br=
></div><div class=3D"gmail_extra">Downside would be that the pixbuf-cache u=
pdate would be run multiple times.<br>
</div></div>

--089e013d1e72c9dbac0501d9dd11--
