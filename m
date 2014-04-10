Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3817A65D63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 17:36:27 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id w7so2563017lbi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 10:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=d8OSQR13NLPW33DmjlgyY+sDLfUyQNO/ZyFMzJIBc0Y=;
	b=zdX9Qis4D+G/nraX1mxiyzgnGe1pCJ5oLOsPWaPqPDWXPBnrweW0FbiOjRdZ1CZSTu
	+vHrfNcW2rWMiTMxkSFgCqzuWk46rR2r/2DvJhkTPgB4YDSSkmPDOBDKSsoC4MYL8usB
	xSPU4eprHbFP17GNP/EyB7/V8ZC95sHMOLDVSt6IsiDhjufGEhIvMe7VEedz8aL3r9Uv
	hiY7AemVwvNhI48WDRZLns0xZEmTnr/MOK7GedtixZa+goIYfuwVsrTk6l5WoHvWnWAO
	si6SpPT/G+jKd95cyESlsK9Msl2eZY5Xx3UpX9PipkHRxuPVqS0ZDHMwuxlIdk0lkOeZ
	nWuQ==
X-Received: by 10.152.246.43 with SMTP id xt11mr2916640lac.34.1397151387220;
	Thu, 10 Apr 2014 10:36:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Thu, 10 Apr 2014 10:36:07 -0700 (PDT)
In-Reply-To: <20140410161509.GA421@mcrowe.com>
References: <20140407155333.GA19351@mcrowe.com>
	<CABcZANkEyt9M=A0SEWBTGedh713vdYhgqJciKDvZeQ_f-NoLaw@mail.gmail.com>
	<20140407164951.GA20653@mcrowe.com> <20140410161509.GA421@mcrowe.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Apr 2014 10:36:07 -0700
X-Google-Sender-Auth: bhJdjOL5nNZWY_dnSOsaysj6inA
Message-ID: <CABcZANkvTa20djh3hNjg5rxx0kshbrDodQ3vjG2_uqW5ZP3JjQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: export TARGET_LDFLAGS and native sstate
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
X-List-Received-Date: Thu, 10 Apr 2014 17:36:30 -0000
Content-Type: multipart/alternative; boundary=001a1133a7742203ec04f6b3a8c1

--001a1133a7742203ec04f6b3a8c1
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 10, 2014 at 9:15 AM, Mike Crowe <mac@mcrowe.com> wrote:

> On Monday 07 April 2014 at 17:49:51 +0100, Mike Crowe wrote:
> > On Monday 07 April 2014 at 09:17:38 -0700, Chris Larson wrote:
> > > On Mon, Apr 7, 2014 at 8:53 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > >
> > > > We're building for both ARM and MIPS-based MACHINEs in a single
> source
> > > > tree. This seems to result in us compiling (or luckily most of the
> time
> > > > resurrecting from sstate-cache) two different versions of all -native
> > > > packages due to different base hashes.
> > > >
> > > > It seems that this difference in base hashes is due to the exported
> > > > variable TARGET_LDFLAGS being different between the two CPUs:
> > > >
> > > > < export TARGET_LDFLAGS="-Wl,-O1  -Wl,--as-needed"
> > > > ---
> > > > > export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu
> -Wl,--as-needed"
> > > >
> > >
> > > Heh, this i another case of a likely completely unnecessary export.
> > > Software we build expects LDFLAGS to be used, not TARGET_LDFLAGS, so I
> > > can't imagine that anything is using this export. Of course, it's
> > > non-trivial to confirm that this is the case :)
>
> My git archaeology shows that this dates from the very first import from
> svn back in 2005. Back then it looks like it was necessary for
> wpa_supplicant which used it in its defconfig file. This is no longer the
> case.
>
> I didn't look at any other layers.
>
> > It did strike me as an odd thing to be exporting. Given the name I
> assumed
> > it had something to do with building the toolchain. I notice though that
> > the gcc recipes explicitly export LDFLAGS_FOR_TARGET inside tasks based
> on
> > TARGET_LDFLAGS anyway so the toolchain "should be fine". :)
> >
> > I'm happy to try our complete build without exporting TARGET_LDFLAGS as a
> > first step but I realise that probably wouldn't be enough proof.
>
> I've tested our build without the "export" in front of TARGET_LDFLAGS in
> bitbake.conf and saw no problems at all so I'm in favour of doing that.
>
> Would a patch for this be acceptable? It does cause the world to be
> rebuilt. :(


I'm a fan of this, personally, but you'll likely need to check with folks
like Richard Purdie for a final call, and this particular fix would have to
go in post-1.6, into the 1.7 timeframe (1.6 isn't branched yet) since we're
in the release candidate phase, and this has inherent risk. So, it might be
worth pursuing the merge of the workaround with alters TARGET_LDFLAGS in
native.bbclass to improve sstate reuse for 1.6, then pursue the unexport of
TARGET_LDFLAGS for 1.7.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1133a7742203ec04f6b3a8c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Apr 10, 2014 at 9:15 AM, Mike Crowe <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">

<div class=3D"">On Monday 07 April 2014 at 17:49:51 +0100, Mike Crowe wrote=
:<br>
&gt; On Monday 07 April 2014 at 09:17:38 -0700, Chris Larson wrote:<br>
&gt; &gt; On Mon, Apr 7, 2014 at 8:53 AM, Mike Crowe &lt;<a href=3D"mailto:=
mac@mcrowe.com">mac@mcrowe.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; We&#39;re building for both ARM and MIPS-based MACHINEs in a=
 single source<br>
&gt; &gt; &gt; tree. This seems to result in us compiling (or luckily most =
of the time<br>
&gt; &gt; &gt; resurrecting from sstate-cache) two different versions of al=
l -native<br>
&gt; &gt; &gt; packages due to different base hashes.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It seems that this difference in base hashes is due to the e=
xported<br>
&gt; &gt; &gt; variable TARGET_LDFLAGS being different between the two CPUs=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &lt; export TARGET_LDFLAGS=3D&quot;-Wl,-O1 =C2=A0-Wl,--as-ne=
eded&quot;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; export TARGET_LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Heh, this i another case of a likely completely unnecessary expor=
t.<br>
&gt; &gt; Software we build expects LDFLAGS to be used, not TARGET_LDFLAGS,=
 so I<br>
&gt; &gt; can&#39;t imagine that anything is using this export. Of course, =
it&#39;s<br>
&gt; &gt; non-trivial to confirm that this is the case :)<br>
<br>
</div>My git archaeology shows that this dates from the very first import f=
rom<br>
svn back in 2005. Back then it looks like it was necessary for<br>
wpa_supplicant which used it in its defconfig file. This is no longer the<b=
r>
case.<br>
<br>
I didn&#39;t look at any other layers.<br>
<div class=3D""><br>
&gt; It did strike me as an odd thing to be exporting. Given the name I ass=
umed<br>
&gt; it had something to do with building the toolchain. I notice though th=
at<br>
&gt; the gcc recipes explicitly export LDFLAGS_FOR_TARGET inside tasks base=
d on<br>
&gt; TARGET_LDFLAGS anyway so the toolchain &quot;should be fine&quot;. :)<=
br>
&gt;<br>
&gt; I&#39;m happy to try our complete build without exporting TARGET_LDFLA=
GS as a<br>
&gt; first step but I realise that probably wouldn&#39;t be enough proof.<b=
r>
<br>
</div>I&#39;ve tested our build without the &quot;export&quot; in front of =
TARGET_LDFLAGS in<br>
bitbake.conf and saw no problems at all so I&#39;m in favour of doing that.=
<br>
<br>
Would a patch for this be acceptable? It does cause the world to be<br>
rebuilt. :(</blockquote></div><br>I&#39;m a fan of this, personally, but yo=
u&#39;ll likely need to check with folks like Richard Purdie for a final ca=
ll, and this particular fix would have to go in post-1.6, into the 1.7 time=
frame (1.6 isn&#39;t branched yet) since we&#39;re in the release candidate=
 phase, and this has inherent risk. So, it might be worth pursuing the merg=
e of the workaround with alters TARGET_LDFLAGS in native.bbclass to improve=
 sstate reuse for 1.6, then pursue the unexport of TARGET_LDFLAGS for 1.7.<=
br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a1133a7742203ec04f6b3a8c1--
