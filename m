Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B434AE7D0A8
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 20:25:12 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.6204.1695327909421280564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 13:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout04.t-online.de (Postfix) with SMTP id 65A341B5E9;
	Thu, 21 Sep 2023 22:24:54 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.174.95]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjQEG-2JMFpg0; Thu, 21 Sep 2023 22:24:52 +0200
Date: Thu, 21 Sep 2023 22:24:47 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v2] adwaita-icon-theme: 43 -> 45.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, Kai Kang <kai.kang@eng.windriver.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <BDRC1S.9ON3267ENA9Q@t-online.de>
In-Reply-To: <CANNYZj9qZX1yH4aH922Xb8fiM2U_Q57R8UQJiVfS73xn1BvJ3A@mail.gmail.com>
References: <20230921064727.1260198-1-kai.kang@windriver.com>
	<CANNYZj8wjdTa=thJu9sKzjnvmofbYx7xCHTOz-azeccq=0PFfQ@mail.gmail.com>
	<f43296e9-d416-8697-198b-fd24a491f0f9@windriver.com>
	<VGUB1S.EQNLFG4U297D@t-online.de>
	<CANNYZj-Hv9fRO4rVW4h_R3DdHiNPYQUeQuRcvVdKaBMoYrVqmg@mail.gmail.com>
	<3SXB1S.VJD0PU0SDSPS1@t-online.de>
	<CANNYZj_zWqLUdoO7PNWJU139y4T6icZeaFOfxUFVK1D-PzihBQ@mail.gmail.com>
	<V3DC1S.GMOO9XQMVAE72@t-online.de>
	<CANNYZj-JBgC0NQGcjhV_h-EETBp0i59AhvpGVc8fHyxvU3bbxg@mail.gmail.com>
	<EPEC1S.ET9N9UD2HEU43@t-online.de>
	<CANNYZj9qZX1yH4aH922Xb8fiM2U_Q57R8UQJiVfS73xn1BvJ3A@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nG/KxbPrLRjWeBA7WoOI"
X-TOI-EXPURGATEID: 150726::1695327893-39C74192-1A26A3D0/0/0 CLEAN NORMAL
X-TOI-MSGID: 3ff1ab01-f4d1-4509-a990-6c8db1265f3f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 20:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188023

--=-nG/KxbPrLRjWeBA7WoOI
Content-Type: text/plain; charset=us-ascii; format=flowed

The refmanual says about allarch:
Unlike some distro recipes (e.g. Debian), OpenEmbedded recipes that 
produce packages that depend on tunings through use of the RDEPENDS and 
TUNE_PKGARCH variables, should never be configured for all 
architectures using allarch. This is the case even if the recipes do 
not produce architecture-specific output.

gtk-icon-cache.bbclass adds RDEPENDS and that probably makes the 
package incompatible with allarch
'gtk_update_icon_cache' is run in meson automatically:
<https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/blob/master/meson.build?ref_type=heads#L89>

I patched meson to not run gtk_update_icon_cache and the test also 
passed.
But this brings me back to my first idea, that it might be the right 
thing to do to remove inherit allarch?

On Thu, Sep 21 2023 at 07:36:39 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> On Thu, 21 Sept 2023 at 17:51, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>>  How did you trace it? That doesn't make sense given what the test 
>> does, and the task where diverge begins.
>> 
>>  but still the test failed. In the next step I excluded inherit 
>> allarch and the test succeeded
>> 
>>  Looking at allarch.bbclass, this was the most suspicious part to me 
>> and first thing I tried was commenting out
>>  #addhandler allarch_package_arch_handler
> 
> I see, thanks. Unfortunately I think you went down the wrong path.
> 
> The recipe is meant to be allarch since it doesn't build anything for
> the target and only installs pre-built data which is identical on all
> targets. This improves sstate reuse for one thing. This worked fine
> until this version update, but after the version update the signature
> for the newly added task write_config (which I think comes from meson)
> differs depending on target. Something creeps in there which varies
> between targets, so you need to for example use bitbake-diffsigs to
> compare the signatures (the test prints what they are, and
> bitbake-diffsigs will tell you what changed).
> 
> Alex


--=-nG/KxbPrLRjWeBA7WoOI
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>The refmanual says about allarch:<=
/div><div>Unlike some distro recipes (e.g. Debian), OpenEmbedded recipes th=
at produce packages that depend on tunings through use of the RDEPENDS and =
TUNE_PKGARCH variables, should never be configured for all architectures us=
ing allarch. This is the case even if the recipes do not produce architectu=
re-specific output.</div><div><br></div><div>gtk-icon-cache.bbclass adds RD=
EPENDS and that probably makes the package incompatible with allarch</div><=
div>'gtk_update_icon_cache' is run in meson automatically:</div><div><a hre=
f=3D"https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/blob/master/meson.=
build?ref_type=3Dheads#L89">https://gitlab.gnome.org/GNOME/adwaita-icon-the=
me/-/blob/master/meson.build?ref_type=3Dheads#L89</a></div><div><br></div><=
div>I patched meson to not run gtk_update_icon_cache and the test also pass=
ed.</div><div>But this brings me back to my first idea, that it might be th=
e right thing to do to remove inherit allarch?</div></div><div id=3D"geary-=
quote" dir=3D"auto"><br>On Thu, Sep 21 2023 at 07:36:39 PM +02:00:00, Alexa=
nder Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type=3D"c=
ite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">On Thu, =
21 Sept 2023 at 17:51, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de"=
>f_l_k@t-online.de</a>&gt; wrote:
<blockquote> How did you trace it? That doesn't make sense given what the t=
est does, and the task where diverge begins.

 but still the test failed. In the next step I excluded inherit allarch and=
 the test succeeded

 Looking at allarch.bbclass, this was the most suspicious part to me and fi=
rst thing I tried was commenting out
 #addhandler allarch_package_arch_handler
</blockquote>
I see, thanks. Unfortunately I think you went down the wrong path.

The recipe is meant to be allarch since it doesn't build anything for
the target and only installs pre-built data which is identical on all
targets. This improves sstate reuse for one thing. This worked fine
until this version update, but after the version update the signature
for the newly added task write_config (which I think comes from meson)
differs depending on target. Something creeps in there which varies
between targets, so you need to for example use bitbake-diffsigs to
compare the signatures (the test prints what they are, and
bitbake-diffsigs will tell you what changed).

Alex
</div></blockquote></div>
--=-nG/KxbPrLRjWeBA7WoOI--


