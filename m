Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id A2D806B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 16:32:07 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id c11so1634503lbj.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 08:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Z9fV2B3HF0xmCiH4WRhWKEFGj7TCkVQys2myEY7kLOA=;
	b=AOLDOeojnvxK+eOABa0KWhk4EIuD7l/HueiWa+a5PGNKoCjROVMw2/+q6muvfE51mG
	s4rCld7dJRH4NQTQsji/VBbBTPaBdPFGItYm8mCnmZNLa162csiI06M5DvdBJrLWUjKS
	5Fl/E/YCmC6Ysnxab3hZ5ZROsiAEj2oguAryENriBhKnSbX5cei36IKuifjxPrOBWkqt
	/jinVWaiTH9F/WWMlkyNMA79S1LISNhFNwcz2goZWEqj5QHCMwSBbfdPHK589dU4o0PD
	mW4ERfGvd8xmCSqYS8D2S3pr+06v45NREkDwaSKu97F1pze/Imv7ijI25lROLoaCPeOV
	y4gA==
X-Received: by 10.152.8.47 with SMTP id o15mr5792969laa.20.1390494727581; Thu,
	23 Jan 2014 08:32:07 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.55.135 with HTTP; Thu, 23 Jan 2014 08:31:47 -0800 (PST)
In-Reply-To: <1760931.7HjZTF9m8R@leo>
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
	<1760931.7HjZTF9m8R@leo>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 23 Jan 2014 09:31:47 -0700
X-Google-Sender-Auth: 53CX3msh6c3-EjkyXlzp26xq0rs
Message-ID: <CABcZANk3D=dL=73=spKrnL-YeOmcxng1EN5ucQu0LD-O48Vd5g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Thu, 23 Jan 2014 16:32:10 -0000
Content-Type: multipart/alternative; boundary=001a11c364024cb4c804f0a5c8fc

--001a11c364024cb4c804f0a5c8fc
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 22, 2014 at 6:16 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Friday, December 06, 2013 05:42:26 PM Khem Raj wrote:
> > ??= does not react at all with
> > BOOST_LIBS += "${@base_contains('PACKAGECONFIG', 'python', 'python', '',
> > d)}"
> >
> > even though we have
> >
> > PACKAGECONFIG ??= "" it does not honor it and always add python to
> > BOOST_LIBS but the dependency is not added so it fails to build
> > complaining for missing python headers which is a understood outcome
> >
> > When converted to ?= it works as expected and only add --with-python
> > in bjam when python is specified in PACKAGECONFIG otherwise not.
> >
> > Is it a bitbake bug ? in anycase ?= should be enough of loose rope
> > to let user/distro configure the packageconfig policy
> >
>
> OK so the problem is that I have meta-ros in my layer-mix and in that layer
> it defines PACKAGECONFIG ?= "python" IMO it should have appended instead of
> redefining. Thats why I was seeing what I was seeing.


It's worth noting that recipes, in general, should use ?= rather than ??=,
but config files, in general, should use ??=. Otherwise it becomes
impossible for the config metadata to define an overriding default -- the
last ??= wins, after all, and that would always be the recipe. IMO default
values in the recipe are there to give sane behavior when there's no
configuration coming in from elsewhere, not to override configuration
defaults.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c364024cb4c804f0a5c8fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 22, 2014 at 6:16 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Friday, December 06, 20=
13 05:42:26 PM Khem Raj wrote:<br>
&gt; ??=3D does not react at all with<br>
&gt; BOOST_LIBS +=3D &quot;${@base_contains(&#39;PACKAGECONFIG&#39;, &#39;p=
ython&#39;, &#39;python&#39;, &#39;&#39;,<br>
&gt; d)}&quot;<br>
&gt;<br>
&gt; even though we have<br>
&gt;<br>
&gt; PACKAGECONFIG ??=3D &quot;&quot; it does not honor it and always add p=
ython to<br>
&gt; BOOST_LIBS but the dependency is not added so it fails to build<br>
&gt; complaining for missing python headers which is a understood outcome<b=
r>
&gt;<br>
&gt; When converted to ?=3D it works as expected and only add --with-python=
<br>
&gt; in bjam when python is specified in PACKAGECONFIG otherwise not.<br>
&gt;<br>
&gt; Is it a bitbake bug ? in anycase ?=3D should be enough of loose rope<b=
r>
&gt; to let user/distro configure the packageconfig policy<br>
&gt;<br>
<br>
</div>OK so the problem is that I have meta-ros in my layer-mix and in that=
 layer<br>
it defines PACKAGECONFIG ?=3D &quot;python&quot; IMO it should have appende=
d instead of<br>
redefining. Thats why I was seeing what I was seeing.</blockquote></div><br=
>It&#39;s worth noting that recipes, in general, should use ?=3D rather tha=
n ??=3D, but config files, in general, should use ??=3D. Otherwise it becom=
es impossible for the config metadata to define an overriding default -- th=
e last ??=3D wins, after all, and that would always be the recipe. IMO defa=
ult values in the recipe are there to give sane behavior when there&#39;s n=
o configuration coming in from elsewhere, not to override configuration def=
aults.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c364024cb4c804f0a5c8fc--
