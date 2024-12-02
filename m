Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A662D78306
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 10:37:18 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.170453.1733135832308277014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 02:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id 94B40A83;
	Mon,  2 Dec 2024 11:37:09 +0100 (CET)
Received: from [192.168.178.67] ([84.154.160.60]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tI3ng-09pMNU0; Mon, 2 Dec 2024 11:37:08 +0100
Date: Mon, 02 Dec 2024 11:37:05 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [oe-ore][PATCHv4] libsecret: add pam support depending
 on DISTRO_FEATURES
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <T54VNS.XA4ZGCLO7PS3@t-online.de>
In-Reply-To: <Z013Th944PYfoHa-@bootlin-mathieu>
References: <20241130085222.17448-1-f_l_k@t-online.de>
	<Z013Th944PYfoHa-@bootlin-mathieu>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-bnpr3ww1nMnvnWX1ihcj"
X-TOI-EXPURGATEID: 150726::1733135828-AE7FA459-994CF10B/0/0 CLEAN NORMAL
X-TOI-MSGID: 99ae4474-0730-4cb8-94ac-5a51163bae51
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 10:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208135

--=-bnpr3ww1nMnvnWX1ihcj
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Dec 2 2024 at 10:01:02 +01:00:00, Mathieu Dubois-Briand 
<mathieu.dubois-briand@bootlin.com> wrote:
> ERROR: Nothing PROVIDES 'libpam' (but 
> /srv/pokybuild/yocto-worker/check-layer/build/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb 
> DEPENDS on or otherwise requires it)
> libpam was skipped: one of 'pam systemd' needs to be in 
> DISTRO_FEATURES
> ERROR: Required build target 'meta-world-pkgdata' has no buildable 
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 
> 'pam-wrapper', 'libpam']
> 
> <https://valkyrie.yoctoproject.org/#/builders/27/builds/566/steps/11/logs/stdio>
> 
> Can you have a look at this issue, please ?

Hi,
I've been testing a patch for a few days that should also fix this 
problem. In libpam the autotools buildsystem was removed. This patch 
switches to meson. The pam recipe was split into two parts and now 
compiles twice. First only the libs are packaged and then the libpam 
modules. This breaks a dependency loop and it is now possible to link 
against systemd and enable 'logind' support for the modules.

The patch is invasive, but my tests so far are promising. It compiles 
for x86-64/arm/arm64 and mutlilib and it seems to fix the build for 
libpam-native (and this missing DISTRO_FEATURES issue). And, although 
not yet compilable, it also reduces the dependency loops between 
systemd<->shadow

One file is still packed into libpam-modules. This should be moved to 
the appropriate module, but I'm not sure what the /run/sepermit 
directory is needed for. There is also a patch added that fixes a 
problem in meson when checking for keyring. But when I wanted to send 
it upstream, I saw that the problem was already solved and submitted 
nicer by Alexander Kanavin

The ptest part is also still missing. When xtests is enabled, the tests 
compile without errors, but by default they are neither built nor 
installed. So I wanted to ask first, what of this is still needed? I 
will therefore send the patch as RFC for review


--=-bnpr3ww1nMnvnWX1ihcj
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Mon, Dec 2 2024 at 10:01:02 +01:00:0=
0, Mathieu Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt; wrote:<b=
r><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: =
break-spaces;">ERROR: Nothing PROVIDES 'libpam' (but /srv/pokybuild/yocto-w=
orker/check-layer/build/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7=
.bb DEPENDS on or otherwise requires it)
libpam was skipped: one of 'pam systemd' needs to be in DISTRO_FEATURES
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'pam-wr=
apper', 'libpam']

<a href=3D"https://valkyrie.yoctoproject.org/#/builders/27/builds/566/steps=
/11/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/27/builds/566/=
steps/11/logs/stdio</a>

Can you have a look at this issue, please ?</div></blockquote><div><br></di=
v><div><div>Hi,</div><div>I've been testing a patch for a few days that sho=
uld also fix this problem. In libpam the autotools buildsystem was removed.=
 This patch switches to meson. The pam recipe was split into two parts and =
now compiles twice. First only the libs are packaged and then the libpam mo=
dules. This breaks a dependency loop and it is now possible to link against=
 systemd and enable 'logind' support for the modules.</div><div><br></div><=
div>The patch is invasive, but my tests so far are promising. It compiles f=
or x86-64/arm/arm64 and mutlilib and it seems to fix the build for libpam-n=
ative (and this missing DISTRO_FEATURES issue). And, although not yet compi=
lable, it also reduces the dependency loops between systemd&lt;-&gt;shadow<=
/div><div><br></div><div>One file is still packed into libpam-modules. This=
 should be moved to the appropriate module, but I'm not sure what the /run/=
sepermit directory is needed for. There is also a patch added that fixes a =
problem in meson when checking for keyring. But when I wanted to send it up=
stream, I saw that the problem was already solved and submitted nicer by Al=
exander Kanavin</div><div><br></div><div>The ptest part is also still missi=
ng. When xtests is enabled, the tests compile without errors, but by defaul=
t they are neither built nor installed. So I wanted to ask first, what of t=
his is still needed? I will therefore send the patch as RFC for review</div=
></div></div>
--=-bnpr3ww1nMnvnWX1ihcj--


