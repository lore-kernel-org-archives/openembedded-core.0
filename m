Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121FBC47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 19:54:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.23115.1704657259898401592
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jan 2024 11:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NgF4sMf6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 726FC60002;
	Sun,  7 Jan 2024 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704657258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=figDVFCNk3ArhFNikYjkUpHPwKfwEV8Pd96b23G1c58=;
	b=NgF4sMf637C9iD0XsOLoCnNALBueA6OrQ+vr4h8e1fjD/CFge5INyqWt29O6AHCCtKpue9
	3+hK0YacOBUrSu7qCCOa8wTH40djlqBCO6fRoWUQzJS09ozEpJeyozjAaZasEpJ/0sNCMI
	H6itQ501VRKxn8pEFUAt86veBahna6U7QPRAyrsYXzjd7E1rEFV4IpJoQKWMsEgSVYedjc
	Ohlcr9gmOLfgd/pfviVdgSC2YPIbISHv5k4j6ht1JF3LjufZ4rg9nTmw4NDp+61syTPqgu
	hvUykSc5L+Yq/aa0903GeRphoi1/t5mkcY5RLq8AfCXNaSfgMRD9rS+4de3BiA==
Date: Sun, 7 Jan 2024 20:54:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 3/3] python3-cython: update 0.29.36 -> 3.0.7
Message-ID: <20240107195418f0ae009a@mail.local>
References: <20240105133543.3017997-1-alex@linutronix.de>
 <20240105133543.3017997-3-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105133543.3017997-3-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 19:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193390

Hello,

I believe this causes those failures on fedora, oe-selftest passed on
the other hosts:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6287/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6288/steps/14/logs/stdio

Or maybe fedora38-ty-4 is the issue, I've started a build without the
patch on this worker now.


On 05/01/2024 14:35:43+0100, Alexander Kanavin wrote:
> pep517 build backends require cython 3.x when
> python is at 3.12, so we can't hold this update any
> longer. There are only a few things in meta-oe
> and meta that break anymore, and fixes for them
> are provided at the same time as this patch.
> 
> License-update: http -> https
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/python/python-cython.inc             | 7 +++++--
>  .../{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} | 0
>  2 files changed, 5 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
> index 6aec6b012f1..bc1953c5045 100644
> --- a/meta/recipes-devtools/python/python-cython.inc
> +++ b/meta/recipes-devtools/python/python-cython.inc
> @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
>  and the messy, low-level world of C."
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
>  PYPI_PACKAGE = "Cython"
>  BBCLASSEXTEND = "native nativesdk"
>  
> -SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
> +SRC_URI[sha256sum] = "fb299acf3a578573c190c858d49e0cf9d75f4bc49c3f24c5a63804997ef09213"
>  UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
>  
>  inherit pypi
> @@ -39,4 +39,7 @@ do_install:append() {
>  	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
>  		sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
>  	done
> +
> +        # remove build paths from generated sources
> +        sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/*.c ${S}/Cython/Plex/*.c
>  }
> diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.7.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
> rename to meta/recipes-devtools/python/python3-cython_3.0.7.bb
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193357): https://lists.openembedded.org/g/openembedded-core/message/193357
> Mute This Topic: https://lists.openembedded.org/mt/103542146/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

