Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE308D10DC2
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 08:36:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.169802.1733128574874847436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 00:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XwPyoaUL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA73E1C000B;
	Mon,  2 Dec 2024 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733128573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJriwX8LNkCF9jxt5jMGlsEaE16hWHteN17BTCx5vco=;
	b=XwPyoaULCpgH6m78q0EvUFwLZWjTZ84vN+imI//gAWsv2icS7vG9shdaOLnxOjadjY0x7s
	UD+S8HF+CyervUiVJt7p8qdbzTHiZTHp58BNZkXtbDjrE5NmVwFVzNXcfEBewu4qgP6qBr
	psB/crnefVvXfJw6OUEqWXkDXHlTvLMtnSO57L67z74vBfQMx2yGT+Fb9ofu/+eFrXTt9q
	aUmWbRv3Nf/qreKOuCFN3kRLiNPJQbSLkmLU4sEq48/YQTMJYgxGkEZynYSQPetNoLFcoL
	8UOgS8GK+drV8qB5mquUarYVP0s6Hg7nApHgw35uxpmRsmuD41mYv8sI3pxuqQ==
Date: Mon, 2 Dec 2024 09:36:11 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, Randy.MacLeod@windriver.com,
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: Re: [OE-core] [PATCH V3 1/2] rust-cross-canadian: Fix environment
 setup script conflicts for multilibs
Message-ID: <Z01xe5AYXZr0A2vE@bootlin-mathieu>
Mail-Followup-To: Deepthi.Hemraj@windriver.com,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, Randy.MacLeod@windriver.com,
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241129080820.330411-1-Deepthi.Hemraj@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129080820.330411-1-Deepthi.Hemraj@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 08:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208127

On Fri, Nov 29, 2024 at 12:08:19AM -0800, Hemraj, Deepthi via lists.openembedded.org wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> 
> YOCTO [#15061]
> The target independent variables like CARGO_HTTP_MULTIPLEXING and
> CARGO_HTTP_CAINFO should be handled by the nativesdk-cargo recipe,
> rather than being managed within rust-cross-canadian.
> 
> The build section of the Cargo configuration file is also
> target-independent and hence moved to nativesdk-cargo.
> 
> The nativesdk-cargo recipe can then gather these entries from the individual
> target-specific files to generate the final cargo_home/config file.
> Target-specific configurations are specific to the rust-cross-canadian
> variant and should remain there.
> 
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---

Hi,

I believe these patches are breaking some builds on the autobuilder:

...
Caused by:
  could not parse TOML configuration in `/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0/testimage-sdk/sysroots/cortexa8hf-neon-poky-linux-gnueabi/home/cargo/config`
Caused by:
  TOML parse error at line 3, column 1
    |
  3 | [target.armv7-poky-linux-gnueabihf]
    | ^
  invalid table header
  dotted key `target` attempted to extend non-table type (string)

https://valkyrie.yoctoproject.org/#/builders/2/builds/558/steps/12/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/60/builds/558/steps/12/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/80/builds/488/steps/13/logs/stdio

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/environment-setup-core2-64-poky-linux > /dev/null; cd /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk//hello; cargo build;' returned non-zero exit status 101
Standard Output: warning: `/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/core2-64-poky-linux/home/cargo/config` is deprecated in favor of `config.toml`
note: if you need to support cargo 1.38 or earlier, you can symlink `config` to `config.toml`
warning: unused config key `build.linker` in `/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/core2-64-poky-linux/home/cargo/config`
error: process didn't exit successfully: `rustc -vV` (exit status: 1)
--- stdout
rustc 1.80.1 (3f5fd8dd4 2024-08-06) (built from a source tarball)
binary: rustc
commit-hash: 3f5fd8dd41153bc5fdca9427e9e05be2c767ba23
commit-date: 2024-08-06
host: x86_64-pokysdk-linux-gnu
release: 1.80.1
--- stderr
error: Error loading target specification: Could not find specification for target "x86_64-pokysdk-linux-gnu". Run `rustc --print target-list` for a list of built-in targets

https://valkyrie.yoctoproject.org/#/builders/4/builds/563/steps/12/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/19/builds/559/steps/12/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/31/builds/549/steps/13/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/32/builds/541/steps/13/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/39/builds/546/steps/13/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/41/builds/494/steps/13/logs/stdio

Can you have a look at these issues, please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

