Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C8ECA5FCE
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 18:50:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18616.1790880640284775454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 11:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y4DOn4Nx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE8F04E41120;
	Thu,  1 Oct 2026 18:50:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0B726035C;
	Thu,  1 Oct 2026 18:50:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 053C110328410;
	Thu,  1 Oct 2026 20:50:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790880633; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d/9Vq6iZBmt0ozklDtghaLUFqKSJ74BUjsgw3k2xYD4=;
	b=Y4DOn4NxCik1oz0fGC1kXoUi6fqV3HbjNqPsvRLYX1Syh3tcyQBB4aywAopkb5YCST8sIK
	LfcnfbY/C0StDXaMiiDZofcIOQKznKC7ZCEKhuS9zN/c3EhffXeETJ4CmH/Bblh5ybIbZz
	sDPkZj8ydyRwfO7Tq/xfVCWJvSD+oYE3PSHT0TqjMWmHxGPtb7Ccd09ykHy+EljTCujLXq
	9ZPGwlerA3+VJnGvCS4t6F792nOerU+ui1flLJf2nYBk8Js8iNXyr+aKCJo30c2fi8AWvI
	E4ytAv4LGB2E1BExSRGBfjw+sp4c7gCBmUHwn0fhEaPUAQH9pX6q+qyBPWPwMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 20:50:30 +0200
Message-Id: <DLTQ77V2KN0T.2RKW1BZSWGKCG@bootlin.com>
Subject: Re: [OE-core] [PATCH] gtk4: upgrade 4.22.5 -> 4.24.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261001115440.669670-1-ross.burton@arm.com>
In-Reply-To: <20261001115440.669670-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 18:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247051

On Thu Oct 1, 2026 at 1:54 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
> Hightlights from the upstream release notes:
>
> * GtkSvgWidget is a widget to display SVG, with some support for
>   interactive aspects of SVG
>
> * Wayland:
>  - Version 3.2 of the text protocol is supported
>  - xdg-session-management-v1 is used
>
> * GSK:
>  - A number of 10bit image formats are supported
>  - We are now using clip masks to reduce the number of offscreens
>
> * The gtk4-encode-symbolic tool for producing symbolic png icons has
>   been dropped.
>
> * Snapping: GTK can now snap contents to device pixel boundaries,
>   for better control of rendering with fractional scales
>
> * GTK now respects the reduced motion setting in various places
>   and avoids animations (GtkSpinner, GtkStack, GtkRevealer)
>
> * New GtkShortcutTrigger functions it easier to handle synonymous
>   keys (in particular keypad keys).
>
> * Type-to-search (in particular interaction with input methods)
>   has been redone, switching from a "pull" to a "push" approach.
>
> * The first part of ongoing frameclock work has landed, improving
>   our ability to deliver frames on time
>
> * GTK supports the ext-background-effect Wayland protocol to allow
>   blurred background behind windows
>
> * The visible focus timeout can be changed with the new
>   gtk-keyboard-focus-visible-timeout setting
>
> * The GDK frameclock has been reworked to improve precision and reduce
>   frame drops
>
> Add a hook to rewrite the content of the meson-generated unity sources,
> as these contain absolute build paths.  Manipulate the file during the
> packaging process so that the actual build tree isn't altered, meaning
> rebuilds are not affected.
>
> Based on work by Markus Volk <f_l_k@t-online.de>.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

We might have some reproducibility issue here:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/5098
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20261001-l7m_wa7_/=
packages/diff-html/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


