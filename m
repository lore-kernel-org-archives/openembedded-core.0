Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id DC55F6AE37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 15:36:21 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id ec20so2837021lab.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ONMpfW9/FnLhHG0zwE8VMlTce3YbGfS1sZV51sJfrOE=;
	b=fYAe5UEOKKjcDpNtcruv5RefjuEvdBc8jY7V9zP0sf2/aFsbWvs8yG+SPq46yLKWVQ
	bUWHbzMpcHAJO/UYeTgrGZg0Hph63rD5zXekHoW7oPHT0yOWWfFdX2BNxCZpYPHTVrNm
	xGERTOsiGvz14ttTgw4hh0GRCa4tFhWTEWxufQDaZ2bOJDgoy5eLFIB2yHSNOWQEQvGt
	WHGCu6cDfZT3DYi+XI+g8l6myiVLz+3Ywcfu8FayoZ7scMXC+5hpWbrsLxc+m3jidUEH
	8oGdxroIiVG8stUP1bv7hFMU7eLlU8QEPDZke1QY640MH5AC0Olr0u0y7MLGRrHD4Qfg
	05rA==
X-Received: by 10.152.6.201 with SMTP id d9mr8676809laa.25.1386689780810; Tue,
	10 Dec 2013 07:36:20 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.22.169 with HTTP; Tue, 10 Dec 2013 07:36:00 -0800 (PST)
In-Reply-To: <20131210143234.GE3721@jama>
References: <52A6B861.30104@topic.nl> <20131210143234.GE3721@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Dec 2013 08:36:00 -0700
X-Google-Sender-Auth: cnANvaI_TV7q8slzBCWvxu1G8hg
Message-ID: <CABcZANkdwxyr-VUNtv8p_6LRUsgAmQfA0s67zPH9TN-K6sFw0g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Figuring out why sstate-cache is no longer used for a package
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
X-List-Received-Date: Tue, 10 Dec 2013 15:36:22 -0000
Content-Type: multipart/alternative; boundary=089e013d1a94cc8cc604ed2fdf19

--089e013d1a94cc8cc604ed2fdf19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2013 at 7:32 AM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> On Tue, Dec 10, 2013 at 07:44:49AM +0100, Mike Looijmans wrote:
> > I've been struggling with this for a few days.
> >
> > We have a build server that build various images overnight. One of the
> > packages in that image is "fpga-image", which takes more than an hour t=
o
> build.
> >
> > We have been sharing the the build server's sstate-cache via HTTP and
> this has
> > worked excellently up until yesterday.
> >
> > The current situation is that a client will grab everything from the
> > buildserver's HTTP sstate-cache, potentially finishing a build from
> scratch in
> > about five minutes. However, for some reason, the fpga-image does not
> fall
> > into this category, and eache machine insists on re-building it from
> scratch.
> > I've been trying to debug this, but the sstate-cache is on another
> machine. I
> > tried copying part of the build server's sstate-cache onto my machine,
> but
> > that only results in "bitbake-diffsigs -t fpga-image .." yielding
> "ERROR: No
> > sigdata files found matching fpga-image .." so that apparently is a dea=
d
> end.
> >
> > How can I determine what is causing the system to think that it needs t=
o
> > rebuild this package?
>
> I use this script:
> openembedded-core/scripts/sstate-diff-machines.sh
>
> to create "backup" of sstate signatures and when some next build
> unexpectedly doesn't reuse some sstate packages I use the script again
> and compare new and old signatures to see why.
>
> As bonus each build which populates out SSTATE_MIRROR also creates tarbal=
l
> with these signatures, so I can easily download one tarball and compare
> what and why won't be reused from sstate.


You can also directly use bitbake-whatchanged -v <target>, with STAMPS_DIR
set to the automated build=E2=80=99s stamps directory w/ sstates included.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013d1a94cc8cc604ed2fdf19
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Dec 10, 2013 at 7:32 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, Dec 10, 2013 at 07=
:44:49AM +0100, Mike Looijmans wrote:<br>
&gt; I&#39;ve been struggling with this for a few days.<br>
&gt;<br>
&gt; We have a build server that build various images overnight. One of the=
<br>
&gt; packages in that image is &quot;fpga-image&quot;, which takes more tha=
n an hour to build.<br>
&gt;<br>
&gt; We have been sharing the the build server&#39;s sstate-cache via HTTP =
and this has<br>
&gt; worked excellently up until yesterday.<br>
&gt;<br>
&gt; The current situation is that a client will grab everything from the<b=
r>
&gt; buildserver&#39;s HTTP sstate-cache, potentially finishing a build fro=
m scratch in<br>
&gt; about five minutes. However, for some reason, the fpga-image does not =
fall<br>
&gt; into this category, and eache machine insists on re-building it from s=
cratch.<br>
&gt; I&#39;ve been trying to debug this, but the sstate-cache is on another=
 machine. I<br>
&gt; tried copying part of the build server&#39;s sstate-cache onto my mach=
ine, but<br>
&gt; that only results in &quot;bitbake-diffsigs -t fpga-image ..&quot; yie=
lding &quot;ERROR: No<br>
&gt; sigdata files found matching fpga-image ..&quot; so that apparently is=
 a dead end.<br>
&gt;<br>
&gt; How can I determine what is causing the system to think that it needs =
to<br>
&gt; rebuild this package?<br>
<br>
</div>I use this script:<br>
openembedded-core/scripts/sstate-diff-machines.sh<br>
<br>
to create &quot;backup&quot; of sstate signatures and when some next build<=
br>
unexpectedly doesn&#39;t reuse some sstate packages I use the script again<=
br>
and compare new and old signatures to see why.<br>
<br>
As bonus each build which populates out SSTATE_MIRROR also creates tarball<=
br>
with these signatures, so I can easily download one tarball and compare<br>
what and why won&#39;t be reused from sstate.</blockquote></div><br>You can=
 also directly use bitbake-whatchanged -v &lt;target&gt;, with STAMPS_DIR s=
et to the automated build=E2=80=99s stamps directory w/ sstates included.<b=
r>-- <br>

Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Men=
tor Graphics
</div></div>

--089e013d1a94cc8cc604ed2fdf19--
