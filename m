Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C14C61D97
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 15:49:28 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.93777.1700754561583675392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 07:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 8A58C45F3;
	Thu, 23 Nov 2023 16:49:19 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.134]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6Bx8-3vu6Yy0; Thu, 23 Nov 2023 16:49:19 +0100
Date: Thu, 23 Nov 2023 16:49:40 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv3] cups: Allow to be controlled by root and users
 in wheel
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <SM2L4S.0RPFX8B9ALQ@t-online.de>
In-Reply-To: <46771525c2282f66edbf766d3b9c7dd8abbc2147.camel@linuxfoundation.org>
References: <20231120161848.1461683-1-f_l_k@t-online.de>
	<aa9e1e82072027c73d4ce2b787a0a2cc9e4ada79.camel@linuxfoundation.org>
	<7NWK4S.WL0GC9LYMOPE3@t-online.de>
	<46771525c2282f66edbf766d3b9c7dd8abbc2147.camel@linuxfoundation.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-q3pRWddoOiLQT0KPAPpw"
X-TOI-EXPURGATEID: 150726::1700754559-5081A95D-C652C561/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e32d064-c7eb-4720-9df9-277da92daa79
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 15:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191170

--=-q3pRWddoOiLQT0KPAPpw
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Nov 23 2023 at 03:03:39 PM +00:00:00, Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> I'm guessing lpadmin is removed as it is unneeded but it does mean you
> lose the ability to control printers separately from complete wheel
> access.
> 
> Could we not allow wheel access to lpadmin instead?

The Cups documentation states: The default contains "admin", "lpadmin", 
"root", "sys" and/or "system".
<https://www.cups.org/doc/man-cups-files.conf.html#:~:text=SystemGroup>

sys and root should be included by default, I assume? Additionally, I 
looked at the cups-files.conf from my Fedora install and it includes 
root, sys, wheel, so that seemed like a good setting to me and 
immediately solved the permissions problem. Adding wheel made quite a 
bit of sense to me as it is widely used as a prioritized group. Not 
only sudo, but also flatpak and iwd, for example, use wheel as a 
prioritized group by default.

Probably shouldn't be a problem to add the lpadmin group as a system 
group in addition to the others, so as not to lose the ability to 
control printers separately from wheel or root. I can run some tests, 
but that will take some time. It's a busy week.

I just figured, that in the interest of simplicity,  because it hasn't 
been used before either and because fedora did the same, the lpadmin 
group wouldn't be missed .  And in case of a system that has polkit 
support cups can be configured with fine-grained privileges using 
cups-pk-helper



--=-q3pRWddoOiLQT0KPAPpw
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Nov 23 2023 at 03:03:39 PM +00:=
00:00, Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<br>=
<blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: br=
eak-spaces;">I'm guessing lpadmin is removed as it is unneeded but it does =
mean you
lose the ability to control printers separately from complete wheel
access.

Could we not allow wheel access to lpadmin instead?</div></blockquote><span=
 style=3D"orphans: 2; widows: 2;"><div style=3D"font-family: &quot;lucida g=
rande&quot;, geneva, helvetica, arial, sans-serif; white-space: break-space=
s;"><br></div><font face=3D"lucida grande, geneva, helvetica, arial, sans-s=
erif"><span style=3D"white-space-collapse: break-spaces;">The Cups document=
ation states: The default contains "admin", "lpadmin", "root", "sys" and/or=
 "system".</span></font></span><div><span style=3D"orphans: 2; widows: 2;">=
<font face=3D"lucida grande, geneva, helvetica, arial, sans-serif"><span st=
yle=3D"white-space-collapse: break-spaces;"><a href=3D"https://www.cups.org=
/doc/man-cups-files.conf.html#:~:text=3DSystemGroup">https://www.cups.org/d=
oc/man-cups-files.conf.html#:~:text=3DSystemGroup</a></span></font></span><=
/div><div><span style=3D"orphans: 2; widows: 2;"><font face=3D"lucida grand=
e, geneva, helvetica, arial, sans-serif"><span style=3D"white-space-collaps=
e: break-spaces;"><br></span></font></span></div><div><span style=3D"orphan=
s: 2; widows: 2;"><font face=3D"lucida grande, geneva, helvetica, arial, sa=
ns-serif"><span style=3D"white-space-collapse: break-spaces;">sys and root =
should be included by default, I assume? Additionally, I looked at the cups=
-files.conf from my Fedora install and it includes root, sys, wheel, so tha=
t seemed like a good setting to me and immediately solved the permissions p=
roblem.
Adding wheel made quite a bit of sense to me as it is widely used as a prio=
ritized group. Not only sudo, but also flatpak and iwd, for example, use wh=
eel as a prioritized group by default.</span></font></span></div><div><span=
 style=3D"orphans: 2; widows: 2;"><font face=3D"lucida grande, geneva, helv=
etica, arial, sans-serif"><br></font></span></div><div><span style=3D"orpha=
ns: 2; widows: 2;"><font face=3D"lucida grande, geneva, helvetica, arial, s=
ans-serif"><div>Probably shouldn't be a problem to add the lpadmin group as=
 a system group in addition to the others, so as not to lose the ability to=
 control printers separately from wheel or root. I can run some tests, but =
that will take some time. It's a busy week.</div><div><br></div><div>I just=
 figured, that in the interest of simplicity, &nbsp;because it hasn't been =
used before either and because fedora did the same, the lpadmin group would=
n't be missed . &nbsp;And in case of a system that has polkit support cups =
can be configured with fine-grained privileges using cups-pk-helper</div></=
font></span><div><br></div></div></div>
--=-q3pRWddoOiLQT0KPAPpw--


