Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f178.google.com (unknown [74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCA66B15C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 23:48:16 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so10248550wes.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 16:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=p1HqMJSy1MOQ60ZRhjccPA2SlwfI38cDbFl3kJWRtS4=;
	b=MADgiC0dE2p6NAY+PqQ0rFwyolSvqi7htjwK9Ht8IM5rRuEJpYsLPabkBezYzYjIrM
	XvlYN1eCULkzgC/E8vA+gOXQ9V1shNtRxdhQBmbdVe2vtEn/CsPBnTTtnfwCgeASIXfk
	q9QRjRgm2umyhwj301KOclPNC2XtZd9xnhchkx7D7jtm+6kJpvgZoHgkAQWbQ3HDbN0u
	dquafDoceOTKyisMPgv2xB9dfChuPb0tnZuw06efTIkefUWIRD9WU6wAF2uE0hCrOKR4
	pXWNP+0NgwN0AvERXwKP4TM+keo/4Bkxq2AfXnVkgsPMCAJKk+MNOEoHwaS8LUCLfi4U
	w6zg==
MIME-Version: 1.0
X-Received: by 10.180.211.45 with SMTP id mz13mr18849685wic.32.1401234497184; 
	Tue, 27 May 2014 16:48:17 -0700 (PDT)
Received: by 10.194.34.65 with HTTP; Tue, 27 May 2014 16:48:17 -0700 (PDT)
In-Reply-To: <CABcZANkF=3tGK=LVYYMJrK2jQmP5BWGuJbRuL24heeEZ0Z46KQ@mail.gmail.com>
References: <5384DAE6.1030407@linux.intel.com>
	<CFAA456E.93E2C%dvhart@linux.intel.com>
	<CABcZANkF=3tGK=LVYYMJrK2jQmP5BWGuJbRuL24heeEZ0Z46KQ@mail.gmail.com>
Date: Tue, 27 May 2014 16:48:17 -0700
Message-ID: <CAOLEWZUK3oDi6MtbvzBqkXExKqAemO9T4HfqZG_NGkuUB3TEXQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 27 May 2014 23:48:20 -0000
Content-Type: multipart/alternative; boundary=001a11c268f673a94c04fa6a54c8

--001a11c268f673a94c04fa6a54c8
Content-Type: text/plain; charset=UTF-8

Actually, that's not bad either.  As long as the magic is documented, that
sounds pretty good too.

Steve



On Tue, May 27, 2014 at 1:44 PM, Christopher Larson <clarson@kergoth.com>wrote:

>
> On Tue, May 27, 2014 at 1:39 PM, Darren Hart <dvhart@linux.intel.com>wrote:
>
>> On 5/27/14, 11:35, "Saul Wold" <sgw@linux.intel.com> wrote:
>>
>> >
>> >Folks,
>> >
>> >We have had an open enhancement in the form of bugzilla #4011
>> >(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4011).
>> >
>> >I am currently working on this and want to get some feedback regarding
>> >the design, the below list of config files would move to one recipe in
>> >recipes-bsp, which will reduce the number of .bbappends that a BSP
>> >writer might need to create in order to customize the configuration of
>> >the BSP.
>> >
>> >Overall, my proposal is to move all the BSP related config files into
>> >one recipe directory tree. Create a recipe that can have a package or
>> >packages that are RRECOMMENDS on.
>> >
>> >We have 2 choices on the packaging side:
>> >
>> >1) 1 Package to rule them all (conffiles)
>> >   - RPROVIDES PN-conf
>> >   - conffile.bbclass
>> >       RRECOMMENDS = "${PN}-conf"
>> >       # Can be overriden in recipe
>> >       CONFFILES_conffiles ?= "${PN}.conf"
>> >   - Will provide files not needed on final image, small
>> >     amount of extra space used.
>> >
>> >2) 1 package / conf file (${PN}-conf)
>> >   - exactly what's needed will be installed
>> >   - no needs for additional RPROVIDES
>> >   - More packaging overhead, package data might be bigger than actual
>> >contents!
>>
>> The status quo would suggest that Option 2 is more consistent with what
>> people expect of the build system. However, if we were to do this, one
>> might question why we should bother at all and not just leave it in the
>> hands of MACHINE-specific overrides for the packages we're configuring, as
>> is done today with alsa-state/asound.conf (for example).
>>
>> What was your idea here - to replace the MACHINE-specific config for these
>> packages - or to augment it with an optional mega-config package?
>>
>> I think it would help to provide a bit of background/motivation regarding
>> what exactly we're trying to accomplish with this. That would help me form
>> an opinion on 1 vs 2 anyway.
>
>
> A third option would be to create a class which examines a path or paths
> to a directory structure containing just the config files, and injects a
> custom function into PACKAGEFUNCS which overlays the bsp-specific default
> configs into the original packages, obeying BBPATH to reflect layer
> priorities. It'd essentially be the same as what's done today, just a
> possibly more convenient way to do it, from a BSP maintainer perspective,
> and wouldn't even be terribly complex, but it might be seen as too much
> magic :)
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11c268f673a94c04fa6a54c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Actually, that&#39;s not bad either.=C2=A0 As long as=
 the magic is documented, that sounds pretty good too.<br><br></div>Steve<b=
r><br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">O=
n Tue, May 27, 2014 at 1:44 PM, Christopher Larson <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div class=3D"h5"><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, May 27, 2014 =
at 1:39 PM, Darren Hart <span dir=3D"ltr">&lt;<a href=3D"mailto:dvhart@linu=
x.intel.com" target=3D"_blank">dvhart@linux.intel.com</a>&gt;</span> wrote:=
<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div>On 5/27/14, 11:35, &quot;Saul Wold=
&quot; &lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@lin=
ux.intel.com</a>&gt; wrote:<br>



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
an opinion on 1 vs 2 anyway.</blockquote></div><br></div></div></div><div c=
lass=3D"gmail_extra">A third option would be to create a class which examin=
es a path or paths to a directory structure containing just the config file=
s, and injects a custom function into PACKAGEFUNCS which overlays the bsp-s=
pecific default configs into the original packages, obeying BBPATH to refle=
ct layer priorities. It&#39;d essentially be the same as what&#39;s done to=
day, just a possibly more convenient way to do it, from a BSP maintainer pe=
rspective, and wouldn&#39;t even be terribly complex, but it might be seen =
as too much magic :)<span class=3D"HOEnZb"><font color=3D"#888888"><br>


</font></span></div><span class=3D"HOEnZb"><font color=3D"#888888"><div cla=
ss=3D"gmail_extra">-- <br>Christopher Larson<br>clarson at kergoth dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Sen=
ior Software Engineer, Mentor Graphics
</div></font></span></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--001a11c268f673a94c04fa6a54c8--
