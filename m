Return-Path: <kergoth@gmail.com>
X-Greylist: delayed 499 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 20:53:12 UTC
Received: from mail-lb0-f179.google.com (unknown [209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAF965E05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 20:53:12 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id c11so5339263lbj.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Jc7BNg54o2DNVE7TMvP/QxqDIrfKKDEuLVo8WXugg8E=;
	b=F5B0JU01G8QCBv/J5jLMLiMMiIaN6goDDeQq1epzPJye30fMuDEs0F8+VAfwB+CCcg
	k2Gtrku5DXXhkPOkPYYN2yp++KC53oIUZ/XH3Uw0pYM3rVGgiWQM11unx+dHMY6+wmjK
	XZ60sUBRKZIEjoj6tw6NwKcogXtj3Gu2CSzN5pXtVahcGDYy0f5LjQ3nXvUHdPe0gMEC
	m7bHXTG6k5xFFnd/GoIzUXc+Exhzv/gYjyylVIqHdGkgPV5vy2eGntYCDja4UXcj+KDZ
	eUCB492lE95Pb2lw9dHMU2wewlAmlDoHiR6tyRebUXbDfbNVW4zP5ABVr9/McEeWhaxf
	vwlA==
X-Received: by 10.152.20.99 with SMTP id m3mr4729702lae.80.1401223493203; Tue,
	27 May 2014 13:44:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Tue, 27 May 2014 13:44:33 -0700 (PDT)
In-Reply-To: <CFAA456E.93E2C%dvhart@linux.intel.com>
References: <5384DAE6.1030407@linux.intel.com>
	<CFAA456E.93E2C%dvhart@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 27 May 2014 13:44:33 -0700
X-Google-Sender-Auth: 2JRBlh3jIOAE0eCtGxLRI-l8hr4
Message-ID: <CABcZANkF=3tGK=LVYYMJrK2jQmP5BWGuJbRuL24heeEZ0Z46KQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Creating a machine specific recipe for config file
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
X-List-Received-Date: Tue, 27 May 2014 20:53:16 -0000
Content-Type: multipart/alternative; boundary=089e013d1924903ccb04fa67c4dc

--089e013d1924903ccb04fa67c4dc
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 1:39 PM, Darren Hart <dvhart@linux.intel.com> wrote:

> On 5/27/14, 11:35, "Saul Wold" <sgw@linux.intel.com> wrote:
>
> >
> >Folks,
> >
> >We have had an open enhancement in the form of bugzilla #4011
> >(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4011).
> >
> >I am currently working on this and want to get some feedback regarding
> >the design, the below list of config files would move to one recipe in
> >recipes-bsp, which will reduce the number of .bbappends that a BSP
> >writer might need to create in order to customize the configuration of
> >the BSP.
> >
> >Overall, my proposal is to move all the BSP related config files into
> >one recipe directory tree. Create a recipe that can have a package or
> >packages that are RRECOMMENDS on.
> >
> >We have 2 choices on the packaging side:
> >
> >1) 1 Package to rule them all (conffiles)
> >   - RPROVIDES PN-conf
> >   - conffile.bbclass
> >       RRECOMMENDS = "${PN}-conf"
> >       # Can be overriden in recipe
> >       CONFFILES_conffiles ?= "${PN}.conf"
> >   - Will provide files not needed on final image, small
> >     amount of extra space used.
> >
> >2) 1 package / conf file (${PN}-conf)
> >   - exactly what's needed will be installed
> >   - no needs for additional RPROVIDES
> >   - More packaging overhead, package data might be bigger than actual
> >contents!
>
> The status quo would suggest that Option 2 is more consistent with what
> people expect of the build system. However, if we were to do this, one
> might question why we should bother at all and not just leave it in the
> hands of MACHINE-specific overrides for the packages we're configuring, as
> is done today with alsa-state/asound.conf (for example).
>
> What was your idea here - to replace the MACHINE-specific config for these
> packages - or to augment it with an optional mega-config package?
>
> I think it would help to provide a bit of background/motivation regarding
> what exactly we're trying to accomplish with this. That would help me form
> an opinion on 1 vs 2 anyway.


A third option would be to create a class which examines a path or paths to
a directory structure containing just the config files, and injects a
custom function into PACKAGEFUNCS which overlays the bsp-specific default
configs into the original packages, obeying BBPATH to reflect layer
priorities. It'd essentially be the same as what's done today, just a
possibly more convenient way to do it, from a BSP maintainer perspective,
and wouldn't even be terribly complex, but it might be seen as too much
magic :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013d1924903ccb04fa67c4dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 27, 2014 at 1:39 PM, Darren Hart <span dir=3D"ltr">&lt;<a href=
=3D"mailto:dvhart@linux.intel.com" target=3D"_blank">dvhart@linux.intel.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On 5/27/14, 11:35, &quot;Saul Wold&quot; &lt;<a href=3D"mailto:sgw@linux.in=
tel.com">sgw@linux.intel.com</a>&gt; wrote:<br>


<br>
&gt;<br>
&gt;Folks,<br>
&gt;<br>
&gt;We have had an open enhancement in the form of bugzilla #4011<br>
&gt;(<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4011" t=
arget=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4011</=
a>).<br>
&gt;<br>
&gt;I am currently working on this and want to get some feedback regarding<=
br>
&gt;the design, the below list of config files would move to one recipe in<=
br>
&gt;recipes-bsp, which will reduce the number of .bbappends that a BSP<br>
&gt;writer might need to create in order to customize the configuration of<=
br>
&gt;the BSP.<br>
&gt;<br>
&gt;Overall, my proposal is to move all the BSP related config files into<b=
r>
&gt;one recipe directory tree. Create a recipe that can have a package or<b=
r>
&gt;packages that are RRECOMMENDS on.<br>
&gt;<br>
&gt;We have 2 choices on the packaging side:<br>
&gt;<br>
&gt;1) 1 Package to rule them all (conffiles)<br>
&gt; =C2=A0 - RPROVIDES PN-conf<br>
&gt; =C2=A0 - conffile.bbclass<br>
&gt; =C2=A0 =C2=A0 =C2=A0 RRECOMMENDS =3D &quot;${PN}-conf&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 # Can be overriden in recipe<br>
&gt; =C2=A0 =C2=A0 =C2=A0 CONFFILES_conffiles ?=3D &quot;${PN}.conf&quot;<b=
r>
&gt; =C2=A0 - Will provide files not needed on final image, small<br>
&gt; =C2=A0 =C2=A0 amount of extra space used.<br>
&gt;<br>
&gt;2) 1 package / conf file (${PN}-conf)<br>
&gt; =C2=A0 - exactly what&#39;s needed will be installed<br>
&gt; =C2=A0 - no needs for additional RPROVIDES<br>
&gt; =C2=A0 - More packaging overhead, package data might be bigger than ac=
tual<br>
&gt;contents!<br>
<br>
</div></div>The status quo would suggest that Option 2 is more consistent w=
ith what<br>
people expect of the build system. However, if we were to do this, one<br>
might question why we should bother at all and not just leave it in the<br>
hands of MACHINE-specific overrides for the packages we&#39;re configuring,=
 as<br>
is done today with alsa-state/asound.conf (for example).<br>
<br>
What was your idea here - to replace the MACHINE-specific config for these<=
br>
packages - or to augment it with an optional mega-config package?<br>
<br>
I think it would help to provide a bit of background/motivation regarding<b=
r>
what exactly we&#39;re trying to accomplish with this. That would help me f=
orm<br>
an opinion on 1 vs 2 anyway.</blockquote></div><br></div><div class=3D"gmai=
l_extra">A third option would be to create a class which examines a path or=
 paths to a directory structure containing just the config files, and injec=
ts a custom function into PACKAGEFUNCS which overlays the bsp-specific defa=
ult configs into the original packages, obeying BBPATH to reflect layer pri=
orities. It&#39;d essentially be the same as what&#39;s done today, just a =
possibly more convenient way to do it, from a BSP maintainer perspective, a=
nd wouldn&#39;t even be terribly complex, but it might be seen as too much =
magic :)<br>

</div><div class=3D"gmail_extra">-- <br>Christopher Larson<br>clarson at ke=
rgoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer =
- Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e013d1924903ccb04fa67c4dc--
