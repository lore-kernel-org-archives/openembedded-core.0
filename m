Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C92EF0719
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 07:10:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42288.1770621014472520782
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 23:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yVYr2omF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10FA2C250FF;
	Mon,  9 Feb 2026 07:10:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CC696074B;
	Mon,  9 Feb 2026 07:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C05F5119D1CC2;
	Mon,  9 Feb 2026 08:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770621011; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s2PVD6nrkZ4MUfJYQMFif55d0FGx5Dvn6n1hYsgvDZw=;
	b=yVYr2omFjAGkdSw5nebnnVUHF7Mf8ZwnSk8jVkZvXmd8ivDLN/61hzETHCaRlfp8ygc9MT
	aKXyw2dXyhK0RqEfsml0EdrxtUDn8OGhH8FczQYCDcEdq8hHPRVI5MtCj2NfSYq1nOVbQ5
	86wqzKXiXrQt+CNnA1EU0hqPnmcIBZJ+AJPUiLe4aJnNBUeGMQy5zUsw/6rJNvcL6xmZN7
	c6n56MusXtPvk9/k7PK1yppE3L+6xjqZAuI2OpSDRmDH6UniyIwPid4Q0YEdT+WU1ioX7E
	PZPQo1CgilLnBTTGxaKQy/FhNNRnV9f9tSD8O+7DVSDKcdbIAO87MMGASd81zQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 08:10:09 +0100
Message-Id: <DGA8RIOG0T4P.23RGH6T3W1KT3@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/1] wic: remove
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260209041637.2690868-1-twoerner@gmail.com>
In-Reply-To: <20260209041637.2690868-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 07:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230709

On Mon Feb 9, 2026 at 5:16 AM CET, Trevor Woerner via lists.openembedded.or=
g wrote:
> Previously (Feb 2, 2026) a v2 set of small RFC patches was sent to
> the oe-core mailing list for review[1]. Those emails provided a set of
> small, more easily reviewed, broken-out patches which have the same
> effect as this patch... with one exception: the wic recipe in the RFC
> set of patches pointed to a test wic repository on my personal github
> account and retained none of the wic git history from oe-core. With this
> patch the standalone wic tool has been pushed to git.yoctoproject.org
> and includes the full git history (thanks to git-filter-repo[2]).
>
> No comments or reviews were given on the RFC set, therefore no changes
> have been made since the RFC set except for an update to the wic recipe
> as noted above.
>
> Unfortunately the broken-out RFC patches can not be merged to oe-core
> since individually they will cause build failures. Only once the entire
> set of patches have been applied will everything work again. Therefore
> all of those patches had to be squashed into one larger patch to avoid
> any build breakage.
>
> This patch splits wic out from oe-core into its own standalone tool. The
> wic utility will continue to fall under The Yocto Project umbrella, but
> will no longer be integrated into the project as part of oe-core. The
> ultimate goal is to make wic a completely independent tool, hosted on
> PyPI, with its own tests, development roadmap, and releases.
>
> Some benefits include:
> - relieving the oe-core maintainers from having to review, understand,
>   merge, or reject wic patches
> - allow the tool to be used outside of The Yocto Project for generating
>   Linux images
> - provide more flexibility to explore other features, libraries,
>   mechanisms, etc
>
> The initial task of splitting wic out into its own repository was
> performed with the help of AI. It was checked, and subsequent work was
> done without AI.
>
> These changes have been tested with oe-selftest as follows:
>         $ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <=
my numeric group id> 4
>         $ oe-selftest -v -r wic
>
> The RFC set was run on The Yocto Project AutoBuilder and only one test
> failed: a test from the meta-yocto/meta-yocto-bsp layer. A fix was
> created and sent to the appropriate mailing list for consideration[3].
>
>
> [1] https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_v2=
_0_9/117600021
> [2] https://github.com/newren/git-filter-repo
> [3] https://lists.yoctoproject.org/g/poky/topic/meta_yocto_bsp_patch/1176=
34997
>
> Trevor Woerner (1):
>   wic: remove
>

Hi Trevor,

Thanks for your patch. It is conflicting with a few changes I have in my
mathieu/master-next branch currently, so I can not easily pick it right
now:

39c72286dab9 wic: extra-partition: introduce variable matching sourceparams
799346240452 oeqa/selftest: wic: improve extra-partition plugin tests
2a2085d1d1c2 wic/engine: warn about old host debugfs for standalone directo=
ry copy

My opinion is we should try to either drop or merge these patches
quickly, so you can easily rebase on top of master. I will suggest this
during the next patch review meeting, this evening.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


