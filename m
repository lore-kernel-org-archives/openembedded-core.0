Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793ADD5CCB2
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 14:23:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16150.1730298179834580767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 07:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gRMz2WJv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D4C61BF203;
	Wed, 30 Oct 2024 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730298177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jwsW3j946pnKnUGnwYxnkXZPuNXquQQGHwWj07qUoa4=;
	b=gRMz2WJvCQb/7BENUHVoBAPpo6NFMcduKgH0sGxm2jFUXNx3MLLdNGVHKqwAoB2O3USvPy
	Y6c7YxeNZJ842me8OWukh5nzpH3jTCsRAQ0k70CZkHATjW9Tyz73Uq3rmW8+qMC6I6PVwq
	dP5E36Np/XotY5/QVF5I5dPJ6b3u/jWc+selFKE64Bsq3V2pCXVKUcnKwy6uUOqXi4d18c
	8wfvzt/ehh3+7sWRY3a9bxNzWglON6vujl5JgiFIHe+giIF2VkCIGPZx22HYwV8NByDpDl
	IrS6N0oMP4ZKaDVX7Dag54raHS3FQMeRlglr5mlf5n+BGUG9r9ZxM+2MfbcPLw==
Date: Wed, 30 Oct 2024 15:22:56 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
Message-ID: <ZyJBQBRRsLFov02a@bootlin-mathieu>
Mail-Followup-To: Trevor Gamblin <tgamblin@baylibre.com>,
	openembedded-core@lists.openembedded.org
References: <20241029193745.2919129-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029193745.2919129-1-tgamblin@baylibre.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 14:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206550

On Tue, Oct 29, 2024 at 03:37:45PM -0400, Trevor Gamblin wrote:
> - This release contains numerous API changes and bug fixes.
>   Changelog: https://github.com/numpy/numpy/releases
> 
> - Notably, the build backend has switched to mesonpy since 1.26.4.
> 
> - Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated
>   to change the paths for the target files. It has now been merged
>   upstream, but isn't included in any release yet. PR for reference:
> 
>   https://github.com/numpy/numpy/pull/17780
> 
> - Builds OK and seems to be compatible with current piglit and pandas
>   (meta-python), which was not the case for the previous upgrade attempt
>   to numpy 2.0.1.
> 
> - For numpy, add 'pkgconfig' to inherit to avoid errors like this at
>   do_compile:
> 
>   | Found Pkg-config: NO
>   | Run-time dependency python found: YES 3.12
>   | Has header "Python.h" with dependency python: NO
>   |
>   | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot compile `Python.h`. Perhaps you need to install python-dev|python-devel
>   |
>   | A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log.txt
> 
> - Also modify the FILES:${PN}-staticdev line to fix a QA issue.
> 
> License-Update: Change copyright year to 2024
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Hi Trevor,

It looks like this is breaking reproducible autobuilder:

AssertionError: The following deb packages are different and not in
exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/python3-numpy-dbg_2.1.2-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/python3-numpy-src_2.1.2-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./core2-64/python3-numpy_2.1.2-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/python3-numpy-dbg_2.1.2-r0_core2-64.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/python3-numpy-src_2.1.2-r0_core2-64.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./core2-64/python3-numpy_2.1.2-r0_core2-64.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/python3-numpy-2.1.2-r0.core2_64.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/python3-numpy-dbg-2.1.2-r0.core2_64.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./core2_64/python3-numpy-src-2.1.2-r0.core2_64.rpm

https://valkyrie.yoctoproject.org/#/builders/37/builds/369/steps/12/logs/stdio

Differences can be seen here:
- https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20241030-a5e77d8y/
- https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20241030-a5e77d8y/packages/diff-html/

Can you have a look please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

