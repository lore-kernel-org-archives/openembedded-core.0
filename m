Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id E2E7960125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 18:00:05 +0000 (UTC)
Received: by iggf3 with SMTP id f3so87731755igg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rVGWA6uGT9Tm6vZMub/cimPAcKv2DUrfM/4ggp3Bceg=;
	b=wjgmJHbbhVJRl8w6bZnVoqnx5ELNa54FycxmxO8uvjiKpfH71yMg4MlLhXLBeJhpIu
	pV91uFBmneW1gCaKqy4boM/Ba2a880Y5m34zb0xmZRpME4UHblspdImE8dfEttyf+PKK
	YYnPPIoERy4ftooXq+3kY6rcr67SifTfqSv9+u3kploPhpAF9eVRUq69ncl4Ln5ZvDpM
	Te8FC0lFZAtzG42lL103JshLi+AvwNSuLuBBDWxmNO4hK9/P/e8iyuzSInHh+6LkatOE
	50ItJD/G7Xh8OQpYsQBko25kVzDHR+36OP4RBCMtNdutB7cp+Pn5VeUOWZoI3NngrJpf
	C8/A==
X-Received: by 10.107.134.83 with SMTP id i80mr42362729iod.123.1438020005871; 
	Mon, 27 Jul 2015 11:00:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.199 with HTTP; Mon, 27 Jul 2015 10:59:46 -0700 (PDT)
In-Reply-To: <1437999406.821.240.camel@linuxfoundation.org>
References: <cover.1437663603.git.chris_larson@mentor.com>
	<1437840549.821.171.camel@linuxfoundation.org>
	<CABcZANnnqTczLS4B=663mrPOG7i3WoKXdkPONu0wScxgHdSMGw@mail.gmail.com>
	<1437999406.821.240.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 27 Jul 2015 10:59:46 -0700
Message-ID: <CABcZANk-jUDs1qba5Giggdu8BWkhCfc1Xn5CBM42b6-hzCbPjw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Mon, 27 Jul 2015 18:00:09 -0000
Content-Type: multipart/alternative; boundary=001a113fe07aa148ee051bdf1f6a

--001a113fe07aa148ee051bdf1f6a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2015 at 5:16 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2015-07-25 at 12:18 -0700, Christopher Larson wrote:
> >
> > On Sat, Jul 25, 2015 at 9:09 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >         however when I apply this and your other series, the
> >         autobuilder
> >         oe-selftest does this:
> >
> >
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/bu=
ilds/92/steps/Running%20oe-selftest/logs/stdio
> >
> >         which is substantially worse. I can't immediately see what the
> >         issue is
> >         but the two runs above pretty much bisect this down to the
> >         patch series.
> >         I'm therefore reluctant to merge these until we can figure out
> >         what is
> >         going on...
> >
> > Given that both failures have nothing to do with devtool, recipetool,
> > or oe-selftest and are simply bitbake build failures as called by
> > tests, I don=E2=80=99t really see how these could have anything to do w=
ith
> > that, but understood.
>
> FWIW, the issue is that you use the "xxx:do_unpack" syntax in one of the
> tests. This breaks toaster.bbclass and once its broken, it stays broken
> as its doing a split(":") on data in a file it never cleans up if the
> function fails.
>
> I've taken a fix which should avoid these issues. Will rerun a build
> with that applied (and various other fixes) and hopefully we can then
> get things merged.
>

Ah! That explains it. Thanks. Obviously I could have used -c, but I=E2=80=
=99m a fan
of the new syntax, it gives some nice flexibility :)
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113fe07aa148ee051bdf1f6a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jul 27, 2015 at 5:16 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Sat, 2015-07-25 at 12:18 -0700, Christopher Lar=
son wrote:<br>
&gt;<br>
&gt; On Sat, Jul 25, 2015 at 9:09 AM, Richard Purdie<br>
</span><span class=3D"">&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0however when I apply this and your ot=
her series, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autobuilder<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe-selftest does this:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://autobuilder.yoctop=
roject.org/main/builders/nightly-oe-selftest/builds/92/steps/Running%20oe-s=
elftest/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/main/builders/nightly-oe-selftest/builds/92/steps/Runnin=
g%20oe-selftest/logs/stdio</a><br>
&gt;<br>
</span><span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0which is subs=
tantially worse. I can&#39;t immediately see what the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0issue is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0but the two runs above pretty much bi=
sect this down to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patch series.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;m therefore reluctant to merge =
these until we can figure out<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0going on...<br>
&gt;<br>
&gt; Given that both failures have nothing to do with devtool, recipetool,<=
br>
&gt; or oe-selftest and are simply bitbake build failures as called by<br>
&gt; tests, I don=E2=80=99t really see how these could have anything to do =
with<br>
&gt; that, but understood.<br>
<br>
</span>FWIW, the issue is that you use the &quot;xxx:do_unpack&quot; syntax=
 in one of the<br>
tests. This breaks toaster.bbclass and once its broken, it stays broken<br>
as its doing a split(&quot;:&quot;) on data in a file it never cleans up if=
 the<br>
function fails.<br>
<br>
I&#39;ve taken a fix which should avoid these issues. Will rerun a build<br=
>
with that applied (and various other fixes) and hopefully we can then<br>
get things merged.<br></blockquote></div><br>Ah! That explains it. Thanks. =
Obviously I could have used -c, but I=E2=80=99m a fan of the new syntax, it=
 gives some nice flexibility :)<br>-- <br><div class=3D"gmail_signature"><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics</div></div>
</div></div>

--001a113fe07aa148ee051bdf1f6a--
