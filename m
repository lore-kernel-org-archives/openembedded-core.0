Return-Path: <martyn.welch@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7D5C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:21:15 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web08.10774.1635247273643801718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: collabora.com, ip: 46.235.227.227, mailfrom: martyn.welch@collabora.com)
Received: from [IPv6:2a00:23c6:c31a:b300:6338:938c:ab16:fa48] (unknown
 [IPv6:2a00:23c6:c31a:b300:6338:938c:ab16:fa48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6D95A1F434A3
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 12:21:11 +0100 (BST)
Message-ID: <63d5cd9f7264871df79099b1831d5a8a85ca34b1.camel@collabora.com>
Subject: Fwd: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
 IMAGE_QA_PROHIBIT_PATHS variable
From: Martyn Welch <martyn.welch@collabora.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Oct 2021 12:21:09 +0100
References: <e133da623f5a357c570efc036daa84098dbc691c.camel@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 11:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157387

Note to self - remember to reply to list...

-------- Forwarded Message --------
From: Martyn Welch <martyn.welch@collabora.com>
To: Konrad Weihmann <kweihmann@outlook.com>
Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
IMAGE_QA_PROHIBIT_PATHS variable
Date: Tue, 26 Oct 2021 12:12:11 +0100

On Tue, 2021-10-26 at 12:56 +0200, Konrad Weihmann wrote:
> 
> 
> On 26.10.21 12:50, Martyn Welch wrote:
> > From: Martyn Welch <martyn.welch@collabora.co.uk>
> > 
> > Add a default IMAGE_QA_PROHIBIT_PATHS variable containing paths
> > known to
> > be mounted in the default fstab, which are known mount points or
> > directories which should be populated at runtime.
> > 
> > Suggested-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> 
> That can't be true - or the initial idea is very very old :-) pls use
> Alex's gmail instead

It's a very old patch series, originally posted in 2017 (as mentioned
in patch 1/2). Just noticed it never got applied...

> > +# IMAGE_QA_PROHIBITED_PATHS
> > +# Ensure images aren't including files in places that will be used
> > as mount points or that are
> > +# reserved for runtime data.
> > +IMAGE_QA_PROHIBITED_PATHS ?=
> > "/dev/pts/*:/media/*:/mnt/*:/proc/*:/run/*:/tmp/*:/var/run/*:/var/t
> > mp/*:/var/volatile/*"
> 
> I like the idea, but wouldn't make more sense to do that on a package
> level, as here the user is more or less left alone in guessing where
> the 
> file actually does come from

I like that idea, however it would make to assumption that there wasn't
any tweaks being made as part of image generation that would end up
violating this. A quick check suggests the "build-appliance-
image_15.0.0.bb" image does this kind of thing in the core image types.

Martyn


