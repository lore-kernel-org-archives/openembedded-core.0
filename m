Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4BBD216A2
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 13:02:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12893.1728997354679824744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 06:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TCLqtJ18;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B490EFF809;
	Tue, 15 Oct 2024 13:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728997353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n039Nz5FBDZbxt2Ks83jadfvYkQFf267+1WHH9NH4Yo=;
	b=TCLqtJ18U8bk6tMchOhIjKKS9CzOCpq8QMNgAsGmB606oF7PLyYUBjpME4t9QuMLdqBHwc
	b/koHjfZhsAqEewvJQlW0FtEsJlVvGZ7mlM1mepD0jQb6nVe+6VfPU6Di7y44xo9LeoRr6
	g1Wh79hfn2qMWmpStY50D2oV/Oon6MdRtH4jzS0AmJkEGgUh7qGKmYRuQdfld+qiA6I49l
	CtUG6Xv923Cx+WfTvjQ58ra1Q6gp+BKu1jdpMSwmkAnAJPoqaHOuzJhM8UM86VqE+BQXhu
	NIOpzyQIaFnEdqJ1r5ZYfafHqgWdVsLMHAeaWdgSAmTFvBfqxxJGLWbSyvnvwA==
Date: Tue, 15 Oct 2024 15:02:32 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] kernel-yocto: remove deprecated variable KMETA_AUDIT
Message-ID: <weem25umxspvo77nyjtbypjqtc65qpmpidke6lzuy4bexhbzin@wkxppfgv7n7i>
References: <20241015-deprecated-kmeta-audit-v1-1-4a38514da362@bootlin.com>
 <CADkTA4MYpK7W1ctaUKP7Qg+t=ECOZa9Cx_GRM8+XH4yig3ojJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4MYpK7W1ctaUKP7Qg+t=ECOZa9Cx_GRM8+XH4yig3ojJA@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 13:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205916

Hi Bruce,

On 15/10/2024 08:21:13+0000, Bruce Ashfield wrote:
> On Tue, Oct 15, 2024 at 6:07 AM Antonin Godard
> <antonin.godard@bootlin.com> wrote:
> >
> > This variable has been introduced by commit
> > 1d4c120edeb6e45665eafd6962a10ebb89d758eb ("kernel-yocto: allow branch
> > auditing to be suspended") but its usage removed by commit
> > 0f698dfd1c8bbc0d53ae7977e26685a7a3df52a3 ("kernel-yocto: streamline
> > patch, configuration and audit phases").
> >
> > I haven't found any reference to this variable elsewhere... so remove it
> > entirely.
>
> I'm actually working on some code that will once again use that
> variable.
>
> Paul Barker submitted some changes that allow in-tree defconfigs
> to be applied alongside of the fragments that the project hosts. I'm
> enabling auditing of those fragments as part of that integration,
>
> That audit can be a bit noisy, so I'm using that flag to allow it to
> be disabled for some fragments.
>
> Bruce

Ok sounds good. I'm actually working on documenting some of the variables in
kernel-yocto.bbclass, which is why I noticed this.

By the way, it feels like the description of KCONF_AUDIT_LEVEL is a bit off
compared to what's done in the code.

Comment:

  # LEVELS:
  #   0: no reporting
  #   1: report options that are specified, but not in the final config
  #   2: report options that are not hardware related, but set by a BSP
  KCONF_AUDIT_LEVEL ?= "1"
  KCONF_BSP_AUDIT_LEVEL ?= "0"

Code:

		if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
			bbfatal_log "`cat ${meta_dir}/cfg/merge_config_build.log`"
		else
			bbfatal_log "Details can be found at: ${S}/${meta_dir}/cfg/merge_config_build.log"
		fi

I don't see the link between level 2 and the code here.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

