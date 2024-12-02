Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1941DD10DD0
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 09:01:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.169395.1733130066170270428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 01:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HTqTdwG4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FC05FF80F;
	Mon,  2 Dec 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733130064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w+l7j8szLd0UikbNzRUAtE9/ZAiE/GpbG1KjTimezhI=;
	b=HTqTdwG4uFnnk4RoRwFOa9SzKk5WIUWxoSamx6limX2lUF41qR7/CMhnRw2T7a/4rvwtVC
	tYRJDaUlQoy79MGMWCFR5ODzl66qgHZloZa2n8PiuiTrjQjpU1IjUlBPWfUujhFeVrzbn3
	kB23qgacAecOTGeVfBsQHYF+9n/dNe1FfRhE1sgT/szvlWw29zz0ihUeLIY+Cabw0ruF1n
	HOTJk1noyVYe/BuZO6ffmwV6z6y5lpw89Rwq7YC5Gwo9jUYHFrjblaadlenzqnmEJHK2lc
	Xmgj3/fQmNFCUwBh+MDFj+Cw2UUh+z1CyJMUE8Nv8AQ4dDWV2I72e7BV7N65Yg==
Date: Mon, 2 Dec 2024 10:01:02 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [oe-ore][PATCHv4] libsecret: add pam support depending
 on DISTRO_FEATURES
Message-ID: <Z013Th944PYfoHa-@bootlin-mathieu>
Mail-Followup-To: Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
References: <20241130085222.17448-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130085222.17448-1-f_l_k@t-online.de>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 09:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208129

On Sat, Nov 30, 2024 at 09:52:22AM +0100, Markus Volk wrote:
> pam module has been ported from gnome-keyring to libsecret
> [https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb647d9f82b6ef1cd0893]
> 
> Add a PACKAGECONFIG for pam and enable it if pam is in DISTRO_FEATURES
> 
> Add a recipe for pam_wrapper, needed to build the tests
> 
> [https://gitlab.com/cwrap/pam_wrapper]
> 
> Import cmocka recipe from meta-oe
> [https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb]
> 
> (From OE-Core rev: 3ef7f9650df0d99cd3a25ad470ac67aed1351d11)
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

Hi,

I believe this patch is causing the following errors on the autobuilder:

ERROR: Nothing PROVIDES 'libpam' (but /srv/pokybuild/yocto-worker/check-layer/build/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb DEPENDS on or otherwise requires it)
libpam was skipped: one of 'pam systemd' needs to be in DISTRO_FEATURES
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'pam-wrapper', 'libpam']

https://valkyrie.yoctoproject.org/#/builders/27/builds/566/steps/11/logs/stdio

Can you have a look at this issue, please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

