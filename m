Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE80EE49A3
	for <webhook@archiver.kernel.org>; Sat, 19 Aug 2023 19:41:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.16556.1692474090206472137
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Aug 2023 12:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZCPObgKJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32B2040005;
	Sat, 19 Aug 2023 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692474087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ORkAp62ldBFNM+vqzVo90u8IvhXOooNt6QXmkrHVWJ4=;
	b=ZCPObgKJbW0Jc7uN1t43g+usH9IqdZ2aY0RxhGas4hKJ0q3dYZ2StnVviA0PrGOF6/+b4w
	HTXKeP4vYeKesTuYjH83rJDZwv36bWRqrczbWrUk7TphxiHCVUjDRWmjlkXjWYdEIRk9yo
	js0dCJpg7tjO8l6rWiWUKZd4Uwcn4Kak+HQ6J0eSXLMlqLhl8xL5dDP6qst1frpnY0jC8c
	LdaB/08jcAVCN+5oJfqIXA/uJMw5457xxkLdJaP+qQRJkO7aRAiUkC3ExUxIQiHSl+znm+
	gnidGRIVCzrzf9xJ3jZFb+jx5M+8EFXgv/xkCZrV5M026FCrgVN75iKh+d7kFg==
Date: Sat, 19 Aug 2023 21:41:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH v3 0/8] Add new packagefeed recipe class
Message-ID: <2023081919412685e9d8cb@mail.local>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Aug 2023 19:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186401

Hello,

This seems to cause a check-layer failure with meta-mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/7667/steps/15/logs/stdio

AssertionError: Adding layer meta-mingw changed signatures.
2 signatures changed, initial differences (first hash before, second after):
   packagefeed-core-rpmtest:do_packagefeed: 8af5d3caf528efaeaa6469c7350fc323affe0ac7684e660b66a4b1d88a5bfb72 -> 289f357ebf8cb3ef7670a2857d63640381ce812de7abe333d3fb7fb9abecbc29
      bitbake-diffsigs --task packagefeed-core-rpmtest do_packagefeed --signature 8af5d3caf528efaeaa6469c7350fc323affe0ac7684e660b66a4b1d88a5bfb72 289f357ebf8cb3ef7670a2857d63640381ce812de7abe333d3fb7fb9abecbc29
      NOTE: Starting bitbake server...
      Taint (by forced/invalidated task) changed from nostamp(uuid4):4a1257f0-298a-43ab-ac44-3808649481a1 to nostamp(uuid4):f6871f5b-5790-4e6b-8079-db9e13bce98d

On 18/08/2023 12:44:49-0500, Charlie Johnston wrote:
> Currently, the only way to build a feed natively in OE is to build all the desired packages
> and then manually run bitbake package-index. This approach has a few drawbacks:
> - The index creation methods ONLY work on the package deploy directory. If there are
> packages that are not meant to be in the feed in the deploy directory, they will be included
> in the package index. Also, multiple feeds cannot be built in one command due to this limitation.
> - If a package feed depends on another package feed being side-by-side to it (that is, if
> packages in Feed A depend on packages in Feed B and users of Feed B are required to use Feed A) a
> user would have to manually remove duplicate packages from the deploy directory before making
> Feed B's index.
> 
> To address this, this patch set creates a new packagefeed.bbclass that enables the creation of
> feeds in a new deploy directory location for feeds. The patch set updates existing logic in the
> package_manager class that was previously used to create a temporary feed when building a rootfs.
> That logic is then used to create a feed and exclude any packages which might be included in any
> provided side-by-side feeds. 
> 
> Note that currently the class does not make use of sstate. Since the individual packages are
> cached, there did not seem to be anything to be gained from the extra effort required to cache the
> feed. Caching the whole feed was not space efficient, and reworking package index creation to be
> compatible with caching didn't seem worth the effort given that operation is fairly inexpensive.
> 
> I've tested this in oe-core by creating a few sample recipes and running with each combination of
> the PACKAGE_CLASSES variable. The testimage cases for dnf were also updated to use the new packagefeed
> creation mechanism and several images were run with testimage to confirm proper behavior.
> 
> Changes since v2:
> - Added Summary to packagefeed-core-rpmtest.bb for recipe_qa.
> - Updated do_recipe_qa to not require a maintainer on packagefeed-* recipes.
> 
> Changes since v1:
> - Added example of implementation to bbclass comments.
> - Updated testimage to use do_packagefeed for dnf tests and ran testimage on several images with and
> without dnf tests.
> 
> Changes since RFC v2: 
> - maps used to look up configurations for each package class have been updated to use nested dicts
> to clarify what each item is.
> - DEPLOY_DIR_FEED_<pkg type> definitions now include the ${PN} in the paths instead of relying on
> adding it in the bbclass.
> 
> Regards,
> Charlie Johnston
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186383): https://lists.openembedded.org/g/openembedded-core/message/186383
> Mute This Topic: https://lists.openembedded.org/mt/100825496/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

