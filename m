Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DC1C05052
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 08:40:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.6985.1692348009247532094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 01:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mA/VmBxn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BFBC20007;
	Fri, 18 Aug 2023 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692348007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cTHVr5HYDFfns83JyLx92cnvKOPlgXYmnpt1OksDWeA=;
	b=mA/VmBxnZDF4ZvHCzpM5XXMV300OCK8Y+zgjexmaQDqXA2haIbRDZ4ys1x0wXGNxebTiJ2
	FIpvOWPbbANxvtOfbXHYktyHCrpFb/NJsRjpPfwNdc603IZa7kcQYqXHhnWx7Gq4JdOYQJ
	zGBumq/4SHm4hd7UWK1ALPFJF0FuHN3MM/725ZzDIeif1jgBsSqXi2QZFEjyG+5TZ1bUVu
	D/wW9aYG3kg7Gl7l91lnsh/EgzYrXWVHtaFIt2DvwRh33wP22PMVoZmV70GvlRAh6oCIm6
	lrcBWsHQQhaYcLzVcRhhDiMqxhTxcLtBHuxgjB1XkzwkZFj5LQgG2t5CTmnknA==
Date: Fri, 18 Aug 2023 10:40:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH v2 7/7] testimage.bbclass: Update rpm dnf tests
 to use do_packagefeed.
Message-ID: <202308180840062b5ac1f7@mail.local>
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
 <20230816200931.2577181-8-charlie.johnston@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816200931.2577181-8-charlie.johnston@ni.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 08:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186352

Hello,

On 16/08/2023 15:08:37-0500, Charlie Johnston wrote:
> To test the new packagefeed.bbclass, the testimage case for
> testing on rpm images has been updated to use a newly added
> packagefeed (packagefeed-core-rpmtest) instead
> of manually moving the feeds from DEPLOY_DIR_RPM, removing
> unwanted packages, and building the indexes manually. The
> new logic creates the feed in DEPLOY_DIR_FEED_RPM via
> building the packagefeed and links to it from the location
> expected for the tests to run.
> 
> The resulting feed is technically bigger than before but is
> still smaller than creating a feed with all packages present
> in DEPLOY_DIR_RPM without the manual removal step.
> 
> These changes were tested against testimage runs of the
> following images:
> - core-image-minimal
> - core-image-full-cmdline
> - core-image-sato
> - core-image-sato-sdk
> 
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
>  meta/classes-recipe/testimage.bbclass         | 57 +++----------------
>  .../packagefeeds/packagefeed-core-rpmtest.bb  | 14 +++++
>  2 files changed, 22 insertions(+), 49 deletions(-)
>  create mode 100644 meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb

This causes:

WARNING: packagefeed-core-rpmtest-1.0-r0 do_recipe_qa: QA Issue: Recipe packagefeed-core-rpmtest in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb does not contain a SUMMARY. Please add an entry. [missing-metadata]
WARNING: packagefeed-core-rpmtest-1.0-r0 do_recipe_qa: QA Issue: Recipe packagefeed-core-rpmtest in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc. [missing-maintainer]


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

