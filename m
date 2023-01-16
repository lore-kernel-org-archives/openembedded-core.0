Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1351C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 17:00:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.172297.1673888403630579427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 09:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bwnGMGHG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id b7so2095071wrt.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 09:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRRvLYq+u6j0GAzNJXIPhEGkuol1x3qO/HbvKlbJN98=;
        b=bwnGMGHG5wa4uTym7Bq+m3tW9bPBkvOA8IYOlqfR2BLOuNooWMzb7piELpk1vbMY6k
         xOGvZRtM0nrXS6LrGLT3qn9REsrjMy1QKImnkiyxUdgBGcoB7zauuxDaoI3nvsSEabms
         i2mQCjKBzfhGSMN13po1JhRedRMiaT80p3sus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRRvLYq+u6j0GAzNJXIPhEGkuol1x3qO/HbvKlbJN98=;
        b=6R710CZOGub85EV2JyvrEpoPlflAGKWSuvA4Z/5pM4c81FSzTZxRKBgrblT8Mo9rAX
         DW1Qmd6YatSh/lymfecQh580Umeob1W8TtKrLQoCahcEWtKYbkmK9FTN/pbvIFUUWCIt
         nXGgZUDlULc3uvOMnqeWlwIwOCJGKcthJ8aYExDRFuMvP8pj5IxH6Saz4ho4SOgPYke2
         jtafGcX5Iqxnh4OVTSgTnEh4VDyf5MWF6+JtcPJFl6KC2PuAjQk7UwvLAksCLNuA4ese
         eZtJPkq/FKFWtiCPccuqFpP52b0xZs52sizQfrD4dLY/7xjx/8SR3jwE/M1mrVngEaso
         anag==
X-Gm-Message-State: AFqh2kp8nR4sXs7bAMlFaE2yKM5Zs74NevQwOn6zLQTzV9DQi2JazqJU
	Lwmh1Fxk/qRPZnjjn7AfJ6zi2A==
X-Google-Smtp-Source: AMrXdXtdAAVJjHnz9pAYJjglHX3J1S4QiLlkGEuO6UgvmvvE+8P6RrUenZmaoeYS3Bm5arnHh8kt3A==
X-Received: by 2002:a5d:4849:0:b0:2bd:d966:7ffd with SMTP id n9-20020a5d4849000000b002bdd9667ffdmr164730wrs.9.1673888402049;
        Mon, 16 Jan 2023 09:00:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003d1e1f421bfsm17943800wmo.10.2023.01.16.09.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 09:00:01 -0800 (PST)
Message-ID: <e1e0131232041a5a03757390091b94bab2e8239c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Make oe-setup-layers efficiently idempotent
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chuck Wolber <chuck.wolber@boeing.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 17:00:01 +0000
In-Reply-To: <1673744037-3484-1-git-send-email-chuck.wolber@boeing.com>
References: <1673744037-3484-1-git-send-email-chuck.wolber@boeing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 17:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176007

On Sat, 2023-01-14 at 16:53 -0800, Chuck Wolber wrote:
> The effect of subsequent setup-layers executions is now either a NOOP
> or the minimal set of changes required to ensure layers precisely match
> the JSON configuration.
>=20
> This change allows setup-layers to be incorporated into a team's
> configuration management strategy. In particular, the configuration
> JSON manages a "pinning policy" that documents the oversight of sources
> of change (a requirement for embedded development in highly regulated
> industries).
>=20
> One model for this strategy would work as follows. Team level policy is
> developed to regularly review upstream commits that occur between the
> current upstream HEAD and the previously pinned revision. The JSON
> configuration is periodically updated after a review, test, and approval
> process. In the rare instance that an upstream change is considered
> problematic, the bbappend mechanism can be used to make relevant
> changes in the team's project repository. This approach also requires
> that team developers regularly run the project repository copy of
> setup-layers. This is most easily accomplished by including setup-layers
> in a wrapper script that all team developers use to interact with the
> bitbake tool suite (e.g. "bb bitbake foo-image"). Project level policy
> and oversight is effectively "contained" within this wrapper script,
> thereby reducing a significant source of human error.
>=20
> It is also worth noting that, where project level policy cannot be
> asserted on layers with the bbappend mechanism (e.g. bbclass files), a
> patch set can be checked in to the project repository and automatically
> managed by the wrapper script. Patch management against local layer
> clones would be superficial in nature (not pushed upstream). This
> enables projects to "pull in" functionality and manage bug fixes on an
> as-needed basis.
>=20
> Left unstated, but acknowledged here, are a number of nuances required
> to successfully implement this strategy e.g. setup-layers does not work
> so well if your layer clone is dirty from locally applied patches, etc.
> The details are out of scope for this explanation. What should be
> clear is that a larger configuration management strategy can now benefit
> from the utility provided by setup-layers.
>=20
> Note: Neither the above configuration management strategy example nor
> the change itself is intended to alter the original intent to use
> "bitbake-layers create-layers-setup destdir" to keep pace with upstream
> activity for those who wish to use it that way.
>=20
> Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
> ---
>  scripts/oe-setup-layers | 55 +++++++++++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 46 insertions(+), 9 deletions(-)

Thanks for the patch!

Making the script rerun successfully seems sensible so the change
itself is reasonable. I was a little confused by some of the comments
in the commit message as oe-setup-layers doesn't apply patches as far
as I know. Is that something you're thinking of adding?

One small cosmetic issue is that the area of code the patch changes
should be as a prefix in the shortlog, e.g. "scripts/oe-setup-layers:"
in this case. It means people can understand the rough scope of the
patch from a glance.

Whilst not essential, I do like Alex's suggestion about improving the
tests too, not sure if that is possible.

I also noticed the patch is against master-next, which usually would be
fine except I did drop a patch there which means this one no longer
applies. If you could rebase it for the v2 with the shortlog fix that
would be much appreciated.

Cheers,

Richard



