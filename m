Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f182.google.com (unknown [74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF3A6FAEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 20:07:32 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id t60so10313887wes.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LXhMvXGfqgUu0WqRfic9IbNVMED/CbJpo5jTzKw0CLE=;
	b=vG3ixxTPOiF5HCJw+0QDGZacK682mCzN5jYZwDmuhLOoCMFQCJOGIvsezQAkF8s+ML
	a1BbxeDgXW7XJxA5AEW59EbRqSiIlWKiblhM+aqRlXmi+rACAx/6G888j0gRRHJvasjW
	uGiWep8lyq3NEtdXOngNxAxWDSNCpBb0iITJes7ilhO03tG3N5uBO715NOiQulym3ij9
	p5/0QNgaVcn6hn11SGPQSYKFGOm9dz4cF60Jc3tVR8XUEyS+C+7OtE+IgTmTP7bQ31j0
	V01/wgjTiskUL6s9T7PRjl/OTsbVSKqShqxRgjtP6USjFY0U7z/XiRPJ0N3jWVsfEUZM
	wrYg==
MIME-Version: 1.0
X-Received: by 10.194.8.170 with SMTP id s10mr43662450wja.6.1401221252806;
	Tue, 27 May 2014 13:07:32 -0700 (PDT)
Received: by 10.194.34.65 with HTTP; Tue, 27 May 2014 13:07:32 -0700 (PDT)
In-Reply-To: <5384DAE6.1030407@linux.intel.com>
References: <5384DAE6.1030407@linux.intel.com>
Date: Tue, 27 May 2014 13:07:32 -0700
Message-ID: <CAOLEWZWn2N7C_CEvYrAA1XxQZ95e8kZTqeT_KgfURxWW0Ghn6Q@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 May 2014 20:07:34 -0000
Content-Type: multipart/alternative; boundary=047d7b5d5b9e06809004fa673f22

--047d7b5d5b9e06809004fa673f22
Content-Type: text/plain; charset=UTF-8

Package management overhead seems like a small-ish price for being able to
manage/coordinate custom configs with real depends.  Did I mention I like
2) better?

Steve


On Tue, May 27, 2014 at 11:35 AM, Saul Wold <sgw@linux.intel.com> wrote:

>
> Folks,
>
> We have had an open enhancement in the form of bugzilla #4011 (
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4011).
>
> I am currently working on this and want to get some feedback regarding the
> design, the below list of config files would move to one recipe in
> recipes-bsp, which will reduce the number of .bbappends that a BSP writer
> might need to create in order to customize the configuration of the BSP.
>
> Overall, my proposal is to move all the BSP related config files into one
> recipe directory tree. Create a recipe that can have a package or packages
> that are RRECOMMENDS on.
>
> We have 2 choices on the packaging side:
>
> 1) 1 Package to rule them all (conffiles)
>   - RPROVIDES PN-conf
>   - conffile.bbclass
>       RRECOMMENDS = "${PN}-conf"
>       # Can be overriden in recipe
>       CONFFILES_conffiles ?= "${PN}.conf"
>   - Will provide files not needed on final image, small
>     amount of extra space used.
>
> 2) 1 package / conf file (${PN}-conf)
>   - exactly what's needed will be installed
>   - no needs for additional RPROVIDES
>   - More packaging overhead, package data might be bigger than actual
> contents!
>
> Currently the list of recipes/config files affected include:
>
>
> meta/recipes-bsp/pointercal/pointercal/*/pointercal
> meta/recipes-bsp/formfactor/files/*/machconfig
> meta/recipes-bsp/alsa-state/alsa-state/asound.conf
> meta/recipes-graphics/xorg-xserver/xserver-xf86-config/*/xorg.conf
> meta/recipes-bsp/keymaps/files/keymap.sh
> meta/recipes-graphics/xinput-calibrator/pointercal-xinput/
> pointercal.xinput
> meta/recipes-graphics/tslib/tslib/ts.conf
>
>
> Possibly also:
> meta/recipes-core/init-ifupdown/init-ifupdown-1.0
> meta/recipes-connectivity/connman/connman-conf
> meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
> meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd_proxy.conf
>
> Comment, thoughts, ...
>
> Thanks
> --
>     Sau!
>
> Saul Wold
> Yocto Component Wrangler @ Intel
> Yocto Project / Poky Build System
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b5d5b9e06809004fa673f22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Package management overhead seems like a small-ish pr=
ice for being able to manage/coordinate custom configs with real depends.=
=C2=A0 Did I mention I like 2) better?<br><br></div>Steve<br></div><div cla=
ss=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Tue, May 27, 2014 at 11:35 AM, Saul W=
old <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"=
_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
Folks,<br>
<br>
We have had an open enhancement in the form of bugzilla #4011 (<a href=3D"h=
ttps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4011" target=3D"_blank">=
https://bugzilla.<u></u>yoctoproject.org/show_bug.cgi?<u></u>id=3D4011</a>)=
.<br>

<br>
I am currently working on this and want to get some feedback regarding the =
design, the below list of config files would move to one recipe in recipes-=
bsp, which will reduce the number of .bbappends that a BSP writer might nee=
d to create in order to customize the configuration of the BSP.<br>

<br>
Overall, my proposal is to move all the BSP related config files into one r=
ecipe directory tree. Create a recipe that can have a package or packages t=
hat are RRECOMMENDS on.<br>
<br>
We have 2 choices on the packaging side:<br>
<br>
1) 1 Package to rule them all (conffiles)<br>
=C2=A0 - RPROVIDES PN-conf<br>
=C2=A0 - conffile.bbclass<br>
=C2=A0 =C2=A0 =C2=A0 RRECOMMENDS =3D &quot;${PN}-conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 # Can be overriden in recipe<br>
=C2=A0 =C2=A0 =C2=A0 CONFFILES_conffiles ?=3D &quot;${PN}.conf&quot;<br>
=C2=A0 - Will provide files not needed on final image, small<br>
=C2=A0 =C2=A0 amount of extra space used.<br>
<br>
2) 1 package / conf file (${PN}-conf)<br>
=C2=A0 - exactly what&#39;s needed will be installed<br>
=C2=A0 - no needs for additional RPROVIDES<br>
=C2=A0 - More packaging overhead, package data might be bigger than actual =
contents!<br>
<br>
Currently the list of recipes/config files affected include:<br>
<br>
<br>
meta/recipes-bsp/pointercal/<u></u>pointercal/*/pointercal<br>
meta/recipes-bsp/formfactor/<u></u>files/*/machconfig<br>
meta/recipes-bsp/alsa-state/<u></u>alsa-state/asound.conf<br>
meta/recipes-graphics/xorg-<u></u>xserver/xserver-xf86-config/*/<u></u>xorg=
.conf<br>
meta/recipes-bsp/keymaps/<u></u>files/keymap.sh<br>
meta/recipes-graphics/xinput-<u></u>calibrator/pointercal-xinput/<u></u>poi=
ntercal.xinput<br>
meta/recipes-graphics/tslib/<u></u>tslib/ts.conf<br>
<br>
<br>
Possibly also:<br>
meta/recipes-core/init-<u></u>ifupdown/init-ifupdown-1.0<br>
meta/recipes-connectivity/<u></u>connman/connman-conf<br>
meta/recipes-connectivity/<u></u>bluez5/bluez5/bluetooth.conf<br>
meta/recipes-bsp/apmd/apmd-3.<u></u>2.2-14/apmd_proxy.conf<br>
<br>
Comment, thoughts, ...<br>
<br>
Thanks<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
=C2=A0 =C2=A0 Sau!<br>
<br>
Saul Wold<br>
Yocto Component Wrangler @ Intel<br>
Yocto Project / Poky Build System<br>
<br>
-- <br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinfo/o=
penembedded-<u></u>core</a><br>
</font></span></blockquote></div><br></div>

--047d7b5d5b9e06809004fa673f22--
