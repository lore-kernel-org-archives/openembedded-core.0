Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032A8C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 07:36:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.37186.1681284961682789193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 00:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fmtQbQUz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ECD3124001A;
	Wed, 12 Apr 2023 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681284959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pn0tPft7LNeBEHSoEZ+YYwuLovfIxvgyaNV0GZ0jGwU=;
	b=fmtQbQUzd6jTQi7bpalX/caNvCs0xB1AJ8C9Q8edrV8TDUONJi1bwb1hR0+6V6BVhWp4YS
	UGZMU/96GuFLJH2vIEI68i1gh497WQi/HEeKpjHN1FK6qfQCvlhT793i/KeVQMynNEiu0S
	2vVAKE8nAB6NB4fveh1/VPliOTNEHIbZPi6AI0iwloYKsH669+0JXlITGn6hs8iQ1CuM7W
	jHsB6tpGR4E38S+yDJjY2Z7wPd1XN0J8fF8jmeRidSOwPIlntY7S0ClZwEutiriT57GR7v
	DlX/aZ/Yr1W7Z9+67HGLHWLifJTw9I9X/WOndqLnZi1Q8EcszzcGdixZTXnTlA==
Date: Wed, 12 Apr 2023 09:35:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] zstd: upgrade 1.5.4 -> 1.5.5
Message-ID: <20230412093556.56b79b0e@booty>
In-Reply-To: <1681119440-25219-5-git-send-email-wangmy@fujitsu.com>
References: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
	<1681119440-25219-5-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 07:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179940

Hello,

On Mon, 10 Apr 2023 17:37:20 +0800
"wangmy" <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ==========
> fix: fix rare corruption bug affecting the high compression mode
> perf: improve mid-level compression speed
> lib: deprecated bufferless block-level API
> cli: mmap large dictionaries to save memory
> cli: improve speed of --patch-from mode
> cli: improve i/o speed (+10%) when processing lots of small files
> cli: zstd no longer crashes when requested to write into write-protected directory
> cli: fix decompression into block device using -o, reported
> build: fix zstd CLI compiled with lzma support but not zlib support
> build: fix cmake does no longer require 3.18 as minimum version
> build: fix MSVC+ClangCL linking issue
> build: fix zstd-dll, version of zstd CLI that links to the dynamic library
> build: fix MSVC warnings
> doc: updated zstd specification to clarify corner cases
> doc: document how to create fat binaries for macos
> misc: improve seekable format ingestion speed (+100%) for very small chunk sizes
> misc: tests/fullbench can benchmark multiple files
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

It appears that this patch is also causing failures in reproducible
builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2694/steps/13/logs/stdio

Diffoscope:
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230411-mdixcwb8/packages/diff-html/

reproducible build succeeded after removing this patch as well as the
squashfs-tools patch.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

