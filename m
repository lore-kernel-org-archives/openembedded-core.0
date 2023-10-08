Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE193E95A8E
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 21:02:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.46918.1696798946825586654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Oct 2023 14:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X4YF79kf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A3BD1C0005;
	Sun,  8 Oct 2023 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696798945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZI+Xj/YdeS1FONAUc+CtXmT0s4KCLaK8sFR2a+9lXuI=;
	b=X4YF79kf245eWeL03IhK7g5lpJ1sXOVoWoofAZ0QNpu7r1Cvrg6G/Ub0YU7S4OgtSvdL3A
	TOC4EvGGVn2KRZhAy8dBbyRD/yiPfKlkwxv4K4oRRBvjj6N2Nz/kr4cJaFSHaJx2pMjdOj
	2B7XgH96GQNk1gJnw4qo9DunqLXOZXRTXJXQK6EU5ATs4+lk1Kk27HAyGdZt1MlJvLwC5Y
	4aTKmb5kmmUb1Q/nSdAai9oIfs/Jaf+azBSNePTQ/ZI4unTQqEIOzZS1AzupNrIVXEY9Eg
	LTJ0MQqNp50bJ3FSkJ6K0/c4imMadkY+sCfkCbk7pOH/notScAMqMgERxErbSA==
Date: Sun, 8 Oct 2023 23:02:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: chris.laplante@agilent.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] recipetool: use context manager for
 tinfoil to avoid hang
Message-ID: <20231008210224afa31dbd@mail.local>
References: <20231007174701.1890063-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007174701.1890063-1-chris.laplante@agilent.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Oct 2023 21:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188826

Hello Chris,

Thank you for your patches!

Could you remember changing your git config for your next submission:
https://docs.yoctoproject.org/next/contributor-guide/submit-changes.html#fixing-your-from-identity

Thanks!

On 07/10/2023 13:47:00-0400, Chris Laplante via lists.openembedded.org wrote:
> If you individually run some of the devtool selftests, e.g. with:
> 
>     oe-selftest -r devtool.DevtoolAddTests.test_devtool_add
> 
> then you bypass the sanity check in test_create_workspace that checks
> for an existing workspace layer. Eventually, recipetool will be called
> in a test, and tinfoil.prepare will fail. But because tinfoil.shutdown
> doesn't get called, the thread spawned by bb.server.process.BBUIEventQueue
> spins forever and recipetool never exits, hanging the test.
> 
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  scripts/recipetool | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/recipetool b/scripts/recipetool
> index e2d585d2c5..9eaecfbde6 100755
> --- a/scripts/recipetool
> +++ b/scripts/recipetool
> @@ -22,13 +22,6 @@ logger = scriptutils.logger_create('recipetool')
>  
>  plugins = []
>  
> -def tinfoil_init(parserecipes):
> -    import bb.tinfoil
> -    import logging
> -    tinfoil = bb.tinfoil.Tinfoil(tracking=True)
> -    tinfoil.logger.setLevel(logger.getEffectiveLevel())
> -    tinfoil.prepare(not parserecipes)
> -    return tinfoil
>  
>  def main():
>  
> @@ -67,8 +60,11 @@ def main():
>  
>      scriptutils.logger_setup_color(logger, global_args.color)
>  
> -    tinfoil = tinfoil_init(False)
> -    try:
> +    import bb.tinfoil
> +    with bb.tinfoil.Tinfoil(tracking=True) as tinfoil:
> +        tinfoil.logger.setLevel(logger.getEffectiveLevel())
> +        tinfoil.prepare(True)
> +
>          for path in (tinfoil.config_data.getVar('BBPATH').split(':')
>                       + [scripts_path]):
>              pluginpath = os.path.join(path, 'lib', 'recipetool')
> @@ -100,8 +96,6 @@ def main():
>              ret = args.func(args)
>          except bb.BBHandledException:
>              ret = 1
> -    finally:
> -        tinfoil.shutdown()
>  
>      return ret
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188797): https://lists.openembedded.org/g/openembedded-core/message/188797
> Mute This Topic: https://lists.openembedded.org/mt/101820642/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

