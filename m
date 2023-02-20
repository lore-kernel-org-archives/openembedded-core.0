Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F624C64EC7
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 13:45:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.13091.1676900733386777146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 05:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout01.t-online.de (Postfix) with SMTP id 576B315CC;
	Mon, 20 Feb 2023 14:45:30 +0100 (CET)
Received: from [192.168.178.83] ([79.219.230.185]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pU6Tx-298Q6K0; Mon, 20 Feb 2023 14:45:29 +0100
Date: Mon, 20 Feb 2023 14:45:23 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH] libportal: add opengl to
 REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <NVSDQR.03I27GMPVEFZ@t-online.de>
In-Reply-To: <17458AD9A0A7A5BC.676@lists.openembedded.org>
References: <20230106100806.838732-1-mingli.yu@eng.windriver.com>
	<CANNYZj_cxDBBbe3mz3R5qiiqeSaiQp-Q6Sj_druYWbXcxeFDVQ@mail.gmail.com>
	<44949595-157b-943d-f248-43b65c1e0d9f@windriver.com>
	<CANNYZj87-0q6qg19Ph_Tkhu5cF_n=Gw1AMVRb+_ch=1Eac+3RA@mail.gmail.com>
	<19896460-7a11-629a-2483-634db3530d56@windriver.com>
	<17458AD9A0A7A5BC.676@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-rfPi/Wz8EUAKgmnN12f5"
X-TOI-EXPURGATEID: 150726::1676900730-412BF378-7049628F/0/0 CLEAN NORMAL
X-TOI-MSGID: 55b0fa72-d27e-4d0f-8de7-cb22c44105b2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 13:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177404

--=-rfPi/Wz8EUAKgmnN12f5
Content-Type: text/plain; charset=us-ascii; format=flowed

Since this needs to be reworked for the next libportal version anyway, 
maybe we could do it just like that for now?

diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb 
b/meta/recipes-gnome/libportal/libportal_0.6.bb
index ca58ef4138..bf38fc85fd 100644
--- a/meta/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
@@ -15,6 +15,6 @@ GIDOCGEN_MESON_OPTION = 'docs'

 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"

-DEPENDS += "glib-2.0 glib-2.0-native gtk+3 gtk4"
+DEPENDS += "glib-2.0 glib-2.0-native gtk+3 
${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)}"

-EXTRA_OEMESON = "-Dbackends=gtk3,gtk4"
+EXTRA_OEMESON = 
"-Dbackends=gtk3${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 
',gtk4', '', d)}"


Am Mo, 20. Feb 2023 um 14:18:13 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> I guess this commit will fix the issue for libportal, because we 
> would then be able to remove the gtk+3 and gtk4 dependency as both 
> are now optional.
> 
> <https://github.com/flatpak/libportal/commit/333a299a3c7580de3a8fbbe882ab28f5666338bd>
> 
> Am Mo, 20. Feb 2023 um 16:36:53 +0800 schrieb "Yu, Mingli" 
> <mingli.yu@eng.windriver.com>:
>> Ping.
>> 
>> Thanks,
>> 
>> On 1/9/23 17:10, Alexander Kanavin wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the 
>>> sender and know the content is safe.
>>> 
>>> On Mon, 9 Jan 2023 at 10:02, Yu, Mingli <mingli.yu@windriver.com 
>>> <mailto:mingli.yu@windriver.com>> wrote:
>>>> Sorry for noise!
>>>> 
>>>> Originally, the patch is used to fix the yocto compliance issue. 
>>>> The
>>>> libportal depends on gtk4 and there is a line 
>>>> "REQUIRED_DISTRO_FEATURES
>>>> = "opengl"" as [1] in gtk4_4.8.2.bb. If not make opengl mandatory 
>>>> for
>>>> libportal, how to solve the below yocto compliance issue?  Any 
>>>> hints?
>>>> 
>>>> 
>>>> ERROR: Nothing PROVIDES 'gtk4' (but
>>>> /build/layers/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb
>>>> DEPENDS on or otherwise requires it)
>>>> gtk4 was skipped: missing required distro feature 'opengl' (not in
>>>> DISTRO_FEATURES)
>>>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
>>>> providers.
>>>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>>>> 'libportal', 'gtk4']
>>>> 
>>>> 
>>>> [1]
>>>> <https://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb#n55>
>>> 
>>> Thanks for clarifying. Meanwhile there was a discussion in a 
>>> different
>>> thread about this, so the patch is fine.
>>> 
>>> Alex
>> 
>> 
>> 


--=-rfPi/Wz8EUAKgmnN12f5
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Since this needs to be reworked fo=
r the next libportal version anyway, maybe we could do it just like that fo=
r now?</div><div><br></div><div><div>diff --git a/meta/recipes-gnome/libpor=
tal/libportal_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.6.bb</div><=
div>index ca58ef4138..bf38fc85fd 100644</div><div>--- a/meta/recipes-gnome/=
libportal/libportal_0.6.bb</div><div>+++ b/meta/recipes-gnome/libportal/lib=
portal_0.6.bb</div><div>@@ -15,6 +15,6 @@ GIDOCGEN_MESON_OPTION =3D 'docs'<=
/div><div>&nbsp;</div><div>&nbsp;ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFE=
ATURES}"</div><div>&nbsp;</div><div>-DEPENDS +=3D "glib-2.0 glib-2.0-native=
 gtk+3 gtk4"</div><div>+DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 ${@bb.=
utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)}"</div><div>&nbs=
p;</div><div>-EXTRA_OEMESON =3D "-Dbackends=3Dgtk3,gtk4"</div><div>+EXTRA_O=
EMESON =3D "-Dbackends=3Dgtk3${@bb.utils.contains('DISTRO_FEATURES', 'openg=
l', ',gtk4', '', d)}"</div></div><div><br></div></div><div id=3D"geary-quot=
e" dir=3D"auto"><br>Am Mo, 20. Feb 2023 um 14:18:13 +0100 schrieb Markus Vo=
lk &lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"cite"><div id=3D"geary=
-body" dir=3D"auto"><div>I guess this commit will fix the issue for libport=
al, because we would then be able to remove the gtk+3 and gtk4 dependency a=
s both are now optional.&nbsp;</div><div><br></div><div><a href=3D"https://=
github.com/flatpak/libportal/commit/333a299a3c7580de3a8fbbe882ab28f5666338b=
d">https://github.com/flatpak/libportal/commit/333a299a3c7580de3a8fbbe882ab=
28f5666338bd</a></div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am Mo,=
 20. Feb 2023 um 16:36:53 +0800 schrieb "Yu, Mingli" &lt;mingli.yu@eng.wind=
river.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;">Ping.

Thanks,

On 1/9/23 17:10, Alexander Kanavin wrote:
<blockquote>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon, 9 Jan 2023 at 10:02, Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@win=
driver.com">mingli.yu@windriver.com</a>&gt; wrote:
<blockquote>Sorry for noise!

Originally, the patch is used to fix the yocto compliance issue. The
libportal depends on gtk4 and there is a line "REQUIRED_DISTRO_FEATURES
=3D "opengl"" as [1] in gtk4_4.8.2.bb. If not make opengl mandatory for
libportal, how to solve the below yocto compliance issue?  Any hints?


ERROR: Nothing PROVIDES 'gtk4' (but
/build/layers/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb
DEPENDS on or otherwise requires it)
gtk4 was skipped: missing required distro feature 'opengl' (not in
DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'libportal', 'gtk4']


[1]
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-gnome/gtk+/gtk4_4.8.2.bb#n55">https://git.openembedded.org/openembedded-co=
re/tree/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb#n55</a>
</blockquote>
Thanks for clarifying. Meanwhile there was a discussion in a different
thread about this, so the patch is fine.

Alex
</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">


</div></blockquote></div>
</blockquote></div>
--=-rfPi/Wz8EUAKgmnN12f5--


