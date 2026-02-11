Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6167E9E2EF
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 11:55:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17321.1770810937973415265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 03:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xc1dmGhN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 87A684E40C5E
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 11:55:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D592606BE;
	Wed, 11 Feb 2026 11:55:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD0E311948D79;
	Wed, 11 Feb 2026 12:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770810934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7PQ+mXuWPAAFnFMYjcyWmh9NtVXnPlxAEwND6SMcQjo=;
	b=xc1dmGhNkb5GoAXdqxt6dCKOc9+heQuo3wQch44FNIQPjJlaRKgDw+NQWX28Z6QRba3ZSX
	yjQmQjscpZl0ee83QuFfhN3k6gLBivMgYx95nMLiGTi6jbqkU8z9lZ7pkuKCkx67EgGAYz
	+nq19U6xiZm3B5HEjxhOrGo4Yx8R+rnNBTWvaypSN6MXk6LwrKRyJ3Cqp43YiZ0tQf4nkF
	6vOceJZ2I72YTCMJvDNVlFE0L/KLntGq9bov35DphWiE63JhXXKujqyJAm59hpIQke1rmF
	NOO3Aq/glWutCybNlPYtGl37OkL4OLEN6xcVi9zpkoh+pP9X4cRdYoY9riUFkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 12:55:32 +0100
Message-Id: <DGC433PUWA1C.2BFX9T2ECNBRH@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?Jan-Simon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] systemd: upgrade from 258.1 to 259.1
Cc: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260209080214.1738300-1-Qi.Chen@windriver.com>
In-Reply-To: <20260209080214.1738300-1-Qi.Chen@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 11:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230980

On Mon Feb 9, 2026 at 9:02 AM CET, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Changes with v259:
> https://github.com/systemd/systemd/releases/tag/v259
>
> The 'iptc' PACKAGECONFIG is dropped, because:
> """
> systemd-networkd and systemd-nspawn no longer support creating NAT
> rules via iptables/libiptc APIs; only nftables is now supported.
> """
>
> Add 'empower' group for systemd. See commit below:
> https://github.com/systemd/systemd/commit/3150c342705f4ac27f2b3299ac0961e=
7a70e4451
>
> This new version has big change on musl support.
> """
> Incomplete support for musl libc is now available by setting the
> "libc" meson option to "musl".
> ...
> This support for musl is provided without a promise of continued
> support in future releases.
> """
> See https://github.com/systemd/systemd/blob/main/NEWS#L562 for more detai=
ls.
>
> Here are some examples:
> - The musl specific '-D_LARGEFILE64_SOURCE' could be dropped because:
>   https://github.com/systemd/systemd/commit/fb33d20c072f2e7c3d500f00f8c04=
c99271f34c1
> - The 0017-Always-include-netinet-if_ether.h-first.patch and '-D__UAPI_DE=
F_ETHHDR=3D0
>   could be dropped because:
>   https://github.com/systemd/systemd/commit/8324ef421373c84b5034bf47b84fe=
42d84b1032f
> - The 0015-Avoid-sequence-point-error.patch could be dropped because:
>   https://github.com/systemd/systemd/commit/ebbc0ea7fd764c870bb8689111138=
b4f73854d42
>
> With the above musl support, here are the changes for this 259.1 recipe:
> - Add '-Dlibc=3D${TCLIBC}' configure option.
> - The musl warning, do_warn_musl, is removed.
> - *ALL* musl specific patches are dropped.
>   Any further fix for musl should be sent to systemd upstream.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi Jan-Simon,

Please note this commit will break meta-agl, as iptc PACKAGECONFIG is
being dropped:

ERROR: systemd-1_259.1-r0 do_recipe_qa: QA Issue: systemd: invalid PACKAGEC=
ONFIG(s): iptc [invalid-packageconfig]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2997

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


