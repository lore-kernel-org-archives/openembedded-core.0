Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D32A10F6FAD
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:40:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14889.1775054424599274553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l8n1kyU8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6BD314E42897;
	Wed,  1 Apr 2026 14:40:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A2A0602BF;
	Wed,  1 Apr 2026 14:40:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5FE9104505DF;
	Wed,  1 Apr 2026 16:40:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775054421; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WfdfGH7/9tx36xuMu57SvOms1azvWXf647bKD5c/J9Y=;
	b=l8n1kyU8+TSlejltvpkbRtRYWxpZiZwUsXpdpd6LHnW/QjqinmLqIbYFPYalE0TGKuSRad
	HcBX/rO3BWifkPPUhrm05zmxXfGxDcVNlAgcielBRUoFEw8tuq/V2lbpwFHImlcodvjZa1
	3gXLSsF4aBJ5vzQ2pk+T9Wnad7z9A3svYVMrggC6tXogS/bT0XFN8otQEdD8yEtzpXik/9
	KWiQwZIDLWJ8UgJUEtJoNE9Hn+c1g4V6ojRJSnYLc14QcDYwknNtD4HgJAWWwfVstbW5/0
	7uz9h2X6SKnYkClhLHGN0eybUp7ucB07xmZSCh+Ob5HgxsdSr/BBOpNwSNjm+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:40:20 +0200
Message-Id: <DHHW9Z7VY9QK.21JDBWP884LXH@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/4] meta: Support opting out of any distro
 features
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
 <20260331-default-features-v2-2-f73b43d8bd57@pbarker.dev>
In-Reply-To: <20260331-default-features-v2-2-f73b43d8bd57@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234440

On Tue Mar 31, 2026 at 9:29 PM CEST, Paul Barker wrote:
> Add default values to DISTRO_FEATURES using the new
> filter_default_features() function.
>
> This change obsoletes the variables DISTRO_FEATURES_BACKFILL and
> DISTRO_FEATURES_BACKFILL_CONSIDERED. Instead, all defaults are added via
> DISTRO_FEATURES_DEFAULTS and users can opt out of any of these using
> DISTRO_FEATURES_OPTED_OUT. Hopefully the variable naming here is easier
> for people to understand and remember.
>
> Migration notes:
>
> - If you have previously assigned DISTRO_FEATURES without using
>   DISTRO_FEATURES_DEFAULT, you will now get the default features added
>   automatically. You will need to review these and add any features you
>   do not want to use to DISTRO_FEATURES_OPTED_OUT.
>
> - DISTRO_FEATURES_DEFAULT is now unused, the new variable name is
>   slighlty different to ensure that it is not accidentally used if a
>   layer hasn't been modified to adapt to the new naming.
>
> - If you previously set DISTRO_FEATURES_BACKFILL_CONSIDERED, use the new
>   variable DISTRO_FEATURES_OPTED_OUT instead.
>
> - If you previously modified DISTRO_FEATURES_BACKFILL, don't do that.
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---

Hi Paul,

I believe this is failing in some cases:

ERROR: libtasn1-4.21.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/libtasn1/4=
.21.0/temp/run.do_compile.3668072' failed with exit code 1
...
| gtkdoc-mkhtml 2>&1 --help | grep  >/dev/null "\--path"; \
| if test "$?" =3D "0"; then \
|   mkhtml_options=3D"$mkhtml_options --path=3D\"/srv/pokybuild/yocto-worke=
r/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/libtasn1/4.21=
.0/build/../sources/libtasn1-4.21.0/doc/reference\""; \
| fi; \
| cd html && gtkdoc-mkhtml $mkhtml_options  libtasn1 ../libtasn1-docs.xml
| warning: failed to load external entity "http://docbook.sourceforge.net/r=
elease/xsl/current/html/chunk.xsl"
| compilation error: file /srv/pokybuild/yocto-worker/qemux86-world-alt/bui=
ld/build/tmp/work/x86-64-v3-poky-linux/libtasn1/4.21.0/recipe-sysroot-nativ=
e/usr/share/gtk-doc/data/gtk-doc.xsl line 11 element import
| xsl:import : unable to load http://docbook.sourceforge.net/release/xsl/cu=
rrent/html/chunk.xsl

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3345

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


