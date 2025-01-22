Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3401C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 20:07:26 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web11.3519.1737576110975411389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 12:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=duYI6aiO;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tagv6-0004fp-SW; Wed, 22 Jan 2025 15:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:References:In-Reply-To:Subject:To:
	From; bh=8YK1C9mlH1fM+CAvlxHO50xuHEz0q5F4K/DOagNYfJs=; b=duYI6aiOtkMZYTvGXNBH
	m8hibzcddn6B7LfVUb/00yjxJgAYoAOgkzFv6ZdKGXmSuRul7nnIsBaSmDtQ+8NjycuC8JB31H3rA
	gKNt6xZGSFCwNNnWYGCqqq2KbZzXQ4FWjlF3SDMgGuSvQOrSrXq+V5BK2swKwefVL41O00dX1PCDR
	BGO80gNZ1s228MNd5SOeGCMcsZSvzyeKPBAhq7fvcoX6v4qpmPYO++Q5IxcBWnBospKw7NvY4/Ipl
	x3pRuqslspIqsh2ulHFhR6tE+pFkRCFoC9NdXaY0he/HM1xpZUEaG5Xvf4VlTgJD8RzyWZGQaitoT
	j/sJDAmXcpD3DQ==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/oe/package: Add debug_frame support
In-Reply-To: <c80fe68f-2045-47c0-a2e8-076f23afcb3c@cherry.de> (Quentin
	Schulz's message of "Mon, 13 Jan 2025 15:07:50 +0100")
References: <20250108073921.15856-1-othacehe@gnu.org>
	<c80fe68f-2045-47c0-a2e8-076f23afcb3c@cherry.de>
Date: Wed, 22 Jan 2025 21:01:38 +0100
Message-ID: <87zfjiobx9.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 20:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210160


Hello Quentin,

Thanks for having a look!

> Would be nice to document this variable in the yocto-docs
> (https://git.yoctoproject.org/yocto-docs/). Would you mind sending us a patch
> once this lands (or if there's a v2, maybe alongside or at the same time?)?
> That would be for the variable glossary at the very least. Thanks!

Sure, I will send a documentation patch right after that one is merged.

> thought: would there be a use-case for keeping other sections?
>
> Therefore, instead of having multiple PACKAGE_KEEP_xxx variables, should we
> have PACKAGE_KEEP_SECTION = ".debug_frame"?

I guess you are right, and being able to keep some specific sections
besides .debug_frame can prove to be helpful in the future. I will
rework a bit this commit in that direction.

I think it would still be interesting to have a PACKAGE_KEEP_DEBUG_FRAME
variable around because that is more convenient for the user than
PACKAGE_KEEP_SECTION = ".debug_frame".

However, we can maybe keep both, by doing something like:

if bb.utils.to_boolean(d.getVar("PACKAGE_KEEP_DEBUG_FRAME"))
        d.appendVar("PACKAGE_KEEP_SECTION", ".debug_frame")

Would that be OK?

Thanks,

Mathieu

