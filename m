Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7F5C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 14:52:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.10349.1651848720222326119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 07:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KCQwB7lj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E1E7F60003;
	Fri,  6 May 2022 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651848717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pjkOapbEB9uzEc4Ykp278fN66W8ju1Ek7Hdsuyzbitc=;
	b=KCQwB7ljjl0ZKN0JH+fd0yUekGm5ihAYSH0bD7yBM44ogb5QLdjCWlfbMPKgtEZlvqsVRU
	q6C9+hxVN5G/DQXWaWphSW/T87ACnhRaH6N4m2pJLcdK/YfEeZd4jMc+Usf2CMjkAoou+8
	+U31gC81ghM6a9VnRA+8xFIcwaA4ifOpJzlJsegYk9Bwjp0jMruo0iOuqUbNkNDVzj9wZ8
	hJw2S9688oTAmJdoIFtqWZz6bwj0mDeO1YlZAxw+hrxDB1X+Vq3A5Ubhf2QSvP6TC6/dId
	H29fAAd88w7xpMAAD6Aua3CTq5gFGEX8xluilQ3Y2PfSExVh8xRUVfpYJlJrHg==
Date: Fri, 6 May 2022 16:51:55 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/3] python3-setuptools: upgrade 59.5.0 ->
 62.1.0
Message-ID: <20220506165155.1b255652@melee>
In-Reply-To: <20220506064155.2106140-2-alex@linutronix.de>
References: <20220506064155.2106140-1-alex@linutronix.de>
	<20220506064155.2106140-2-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 14:52:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165338

Hi Alex,

Il giorno Fri,  6 May 2022 08:41:54 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> ha scritto:

> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> This was held by numpy rejecting setuptools >= 60.x,
> however they added a workaround in recent point releases
> and so the upgrade can proceed.
> 
> Drop 0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
> as changed code completely removed upstream.
> 
> Add a tomli build dependency to python3-setuptools-scm as new
> setuptools exposes:
> 
> |   File
> "/srv/work/alex/poky/build-64-alt/tmp/work/x86_64-linux/python3-setuptools-scm-native/6.4.2-r0/setuptools_scm-6.4.2/src/setuptools_scm/config.py",
> line 59, in _lazy_tomli_load |     from tomli import loads |
> ModuleNotFoundError: No module named 'tomli'
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

This patch causes many AB failures like this:

| error: #error "LONG_BIT definition appears wrong for platform (bad
gcc/glibc config?)

and this:

| checking for Python.h... no
| configure: error: python version 3 probe support requested but not
found

Some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/5159/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/45/steps/20/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5204/steps/15/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

