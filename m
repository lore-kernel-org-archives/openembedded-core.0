Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 403996065B;
	Thu, 23 May 2013 02:50:21 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id o10so2791635lbi.8
	for <multiple recipients>; Wed, 22 May 2013 19:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=4yij6AFdQMMpJJqCr9uVeXAWWHUqkyRX+FtJek9qHx8=;
	b=jEc/oxIOlkfgPbht859sW5/u1Lqyc0aPtNvaL8j1amt4TBIXMR2imAjIjakLPS3Emc
	Pi9O024m19Ipslyh49jbfTm93mL2D5S9fllrtN1FWdCLYiMSWDFqs9vquQ91QreDNg49
	C+HsksaqnXFI5fWdpMNScoF8lgHesT1hl3dFT+ssnC9K093OkGT35BHRqcOlhc4KvDVZ
	NCKWNTFfAbYuNvbok9HAGQKgjBF4PN2uITadKrLSthPQUPf0rD3dGRUnFdVoXaMZAeu9
	kFvVTu1spd9HINrZpj9F1CuKmprXkNrvhkSuojzZnatrQRH3z+dqVbTh5ch5UxuDCtyM
	mpPQ==
X-Received: by 10.112.202.105 with SMTP id kh9mr5248595lbc.120.1369277420739; 
	Wed, 22 May 2013 19:50:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.141.74 with HTTP; Wed, 22 May 2013 19:50:00 -0700 (PDT)
In-Reply-To: <1369217654.6695.62.camel@phil-desktop.brightsign>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
	<CANyK_8c4t0Oy1p8sktO-rxMfc1CR+-gbkXYH1RzDSTRy6qQORQ@mail.gmail.com>
	<CANyK_8cbVGMQkD7_KEd5KYTBxP+ZT5jY6VVVpdSAv_uY7JPY1w@mail.gmail.com>
	<1369217654.6695.62.camel@phil-desktop.brightsign>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 22 May 2013 19:50:00 -0700
X-Google-Sender-Auth: l1Tw370NTkEqOePp2NhIYOaRiFU
Message-ID: <CABcZAN=kxmSiDUGxgz0CWgmsr=Biwo9PiLf-inDeBwJhCGpzmA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 23 May 2013 02:50:21 -0000
Content-Type: multipart/alternative; boundary=001a11c36c944322e704dd59bed5

--001a11c36c944322e704dd59bed5
Content-Type: text/plain; charset=UTF-8

On Wed, May 22, 2013 at 3:14 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Wed, 2013-05-22 at 09:47 +0100, Paul Barker wrote:
> > I've just sent a patch to the yocto@ list to fix this but it's brought
> > up two things:
> >
> > 1) In openembedded-core/meta/classes/image.bbclass SPLASH is set with
> > '?='. I'm overriding this with '=' in
> > meta-raspberrypi/conf/machine/raspberrypi.conf which means it can't be
> > overridden further in local.conf. Is this worth changing to '??=' in
> > image.bbclass, '?=' in the machine conf so that it can be overridden
> > with '=' in local.conf? Is my understanding of the overrides correct
> > here?
>
> You can always override it from local.conf using a _forcevariable
> override (which used to be named "_local", in fact, but that terminology
> turned out to be a bit confusing), or a _MACHINE override of course.  So
> I don't think there is any major problem here.
>
> But, that said, it probably is true that the semantics of ??= are less
> surprising for users (since it isn't position-dependent in the way
> that ?= is) which might make it a better choice for image.bbclass.


??= is great in config files, but not ideal in classes that aren't globally
inherited. If bitbake.conf sets a ??=, and a distro .conf updates the
default by using ??= again, and then the class uses ??=, it'll replace the
latest default set by the config. So, I think for default values, classes
should use ?=, config files should use ??=.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c36c944322e704dd59bed5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 22, 2013 at 3:14 AM, Phil Blundell <span dir=3D"ltr">&l=
t;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</spa=
n> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2013-05-22 at 09:4=
7 +0100, Paul Barker wrote:<br>
&gt; I&#39;ve just sent a patch to the yocto@ list to fix this but it&#39;s=
 brought<br>
&gt; up two things:<br>
&gt;<br>
&gt; 1) In openembedded-core/meta/classes/image.bbclass SPLASH is set with<=
br>
&gt; &#39;?=3D&#39;. I&#39;m overriding this with &#39;=3D&#39; in<br>
&gt; meta-raspberrypi/conf/machine/raspberrypi.conf which means it can&#39;=
t be<br>
&gt; overridden further in local.conf. Is this worth changing to &#39;??=3D=
&#39; in<br>
&gt; image.bbclass, &#39;?=3D&#39; in the machine conf so that it can be ov=
erridden<br>
&gt; with &#39;=3D&#39; in local.conf? Is my understanding of the overrides=
 correct<br>
&gt; here?<br>
<br>
</div>You can always override it from local.conf using a _forcevariable<br>
override (which used to be named &quot;_local&quot;, in fact, but that term=
inology<br>
turned out to be a bit confusing), or a _MACHINE override of course. =C2=A0=
So<br>
I don&#39;t think there is any major problem here.<br>
<br>
But, that said, it probably is true that the semantics of ??=3D are less<br=
>
surprising for users (since it isn&#39;t position-dependent in the way<br>
that ?=3D is) which might make it a better choice for image.bbclass.</block=
quote><div><br></div><div style>??=3D is great in config files, but not ide=
al in classes that aren&#39;t globally inherited. If bitbake.conf sets a ??=
=3D, and a distro .conf updates the default by using ??=3D again, and then =
the class uses ??=3D, it&#39;ll replace the latest default set by the confi=
g. So, I think for default values, classes should use ?=3D, config files sh=
ould use ??=3D.</div>

</div>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics
</div></div>

--001a11c36c944322e704dd59bed5--
