Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94306FC5926
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 10:32:49 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67215.1772101962222388610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 02:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout08.t-online.de (Postfix) with SMTP id 6E981F009;
	Thu, 26 Feb 2026 11:32:25 +0100 (CET)
Received: from [192.168.178.36] ([79.219.225.199]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vvYfF-0dNICO0; Thu, 26 Feb 2026 11:32:13 +0100
Date: Thu, 26 Feb 2026 11:32:07 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] dbus: disable ptest if using dbus-broker
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <JLA2BT.T07GFLRURYD21@t-online.de>
In-Reply-To: <D5BYAT.10AVL7ICWFKN@t-online.de>
References: <20260218203844.2846590-1-f_l_k@t-online.de>
	<FB1758B8-BC23-4F97-9C11-DFA240E7FE77@arm.com>
	<D5BYAT.10AVL7ICWFKN@t-online.de>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6LW6bNx9utBkDr9U7hXK"
X-TOI-EXPURGATEID: 150726::1772101933-FCFC7FB0-91A919B0/0/0 CLEAN NORMAL
X-TOI-MSGID: 53498d94-05c3-4c38-9161-13435a0a848a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 10:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231997

--=-6LW6bNx9utBkDr9U7hXK
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Feb 24 2026 at 07:53:37 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> On Mon, Feb 23 2026 at 18:08:09 +00:00:00, Ross Burton 
> <Ross.Burton@arm.com> wrote:
>> So the situation is you have an image that uses dbus-broken but as 
>> that is just the daemon you also have libdbus

Resend this answer because it was bouncing back

The situation is that I want to use dbus-broker but not additionally 
libdbus. dbus-broker.bb adds a runtime dependency on dbus-common and 
dbus-tools.

<https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/dbus/dbus-broker_37.bb#n38>

Thats why dbus recipe is built despite setting VIRTUAL_RUNTIME_dbus = 
"dbus-broker" and because of that we end up with a runtime dependency 
on dbus if ptests
is in DISTRO_FEATURES.

<https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/ptest.bbclass#n26>

That causes an error at do_rootfs, because dbus-broker.bb makes dbus 
and dbus-broker mutually exclusive:

<https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/dbus/dbus-broker_37.bb#n37>

I dont know, if the dbus tests are meant to be run with dbus-broker but 
dbus-broker installs its own ptest. Shouldn't that be sufficient?


--=-6LW6bNx9utBkDr9U7hXK
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Tue, Feb 24 2026 at 07:53:37 +01:00:=
00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"cit=
e">On Mon, Feb 23 2026 at 18:08:09 +00:00:00, Ross Burton &lt;Ross.Burton@a=
rm.com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" sty=
le=3D"white-space: break-spaces;">So the situation is you have an image tha=
t uses dbus-broken but as that is just the daemon you also have libdbus</di=
v></blockquote></blockquote><div><br></div><div>Resend this answer because =
it was bouncing back</div><div><br></div><div><div>The situation is that I =
want to use dbus-broker but not additionally libdbus. dbus-broker.bb adds a=
 runtime dependency on dbus-common and dbus-tools.</div><div><br></div><div=
><a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/rec=
ipes-core/dbus/dbus-broker_37.bb#n38">https://git.openembedded.org/meta-ope=
nembedded/tree/meta-oe/recipes-core/dbus/dbus-broker_37.bb#n38</a></div><di=
v><br></div><div><div>Thats why dbus recipe is built despite setting VIRTUA=
L_RUNTIME_dbus =3D "dbus-broker" and because of that we end up with a runti=
me dependency on dbus if ptests</div><div>is in DISTRO_FEATURES.</div></div=
><div><br></div><div><a href=3D"https://git.openembedded.org/openembedded-c=
ore/tree/meta/classes-recipe/ptest.bbclass#n26">https://git.openembedded.or=
g/openembedded-core/tree/meta/classes-recipe/ptest.bbclass#n26</a></div><di=
v><br></div><div>That causes an error at do_rootfs, because dbus-broker.bb =
makes dbus and dbus-broker mutually exclusive:</div><div><br></div><div><a =
href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes=
-core/dbus/dbus-broker_37.bb#n37">https://git.openembedded.org/meta-openemb=
edded/tree/meta-oe/recipes-core/dbus/dbus-broker_37.bb#n37</a></div><div><b=
r></div><div>I dont know, if the dbus tests are meant to be run with dbus-b=
roker but dbus-broker installs its own ptest. Shouldn't that be sufficient?=
</div></div></div>
--=-6LW6bNx9utBkDr9U7hXK--


