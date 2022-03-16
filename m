Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C21AC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:35:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.25933.1647441318024398241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=NmcdXoFq;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so3319981wme.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GfpsIvKkTnmGhW/eZRLACr8CBlzrC5/3i5QKbywyYyI=;
        b=NmcdXoFqInu9ThAcu2txl4MEou3bpgSpJM4nIsu3X/bWumhwAD7gpe3kTwFCVgcoMq
         t5DCqUGUGcbQ1WnkmY5Fk9YUxMv9BtRO521VVaXoYVZJ8pz1r+AUhRY+r2J3gT+iiDpd
         ugap/fQW5BajR3Ra8RmPop/lQ0PaWgsAgQOGSSfbeOCPFVRFDKcuSLZl4MPHXi1Fo95t
         7V5JDIFvtkML/0hzkZDIjxAolKVkv+edOh0n2NsiHxTV3l7An8JLU8qB7IvKVTj+0pVL
         tybTcHMVNzZs9FF6/YLkRxH37V8GMdXX8k6bV+OEY/0GSyK+SalvJ+IFmBdU82warQjh
         yu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GfpsIvKkTnmGhW/eZRLACr8CBlzrC5/3i5QKbywyYyI=;
        b=m40efmz/WtgrPeLUSfqvlNvrcfo7dVN2KBcBzqYoMACB5nNfukU8jHpQWxmUgA7zM8
         5xtjWzC+UY8SyeB3P9ktNF2OzIgfy27P362eCXidraZTvj9TM0ILvFl5dU38shtQLGDL
         uDxFkVqxd0ole+LfABloe24YonE8Wx8U6yHdnFuJrw44tVTE0q1KTlWLXrbLWTvVSN+k
         33G4/c1PgXO3ASAvsp77yrkvIn+mBsiJybu07tFI++DMhVSW2Iuhh0EwOx+vF0eX3XR1
         bW5n0JpsuMqIoPvNu7iHADSzRePxEeoyouqT7mkcvztiFrDwHUezJZR2Orj9GiEtqky7
         EdiQ==
X-Gm-Message-State: AOAM533G/fKb0AnqTwa9omWEqR1cMVD8prXpHHWiwsLJbq2wfbTcpBBo
	g3J/nbDfB8ZLfIu+asp5BHf/CED+/kqKpIWRVHrQjg==
X-Google-Smtp-Source: 
 ABdhPJyLHaUtyWfoyXrn2iXbJZv/0VkC+pKuKbahZV2I1xv0VoAD2xv5LdKsxsGtvlgL+fMc8iHe/FxixmTpxfUSEzo=
X-Received: by 2002:a1c:2b41:0:b0:380:e379:b8b0 with SMTP id
 r62-20020a1c2b41000000b00380e379b8b0mr63493wmr.87.1647441316096; Wed, 16 Mar
 2022 07:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220315162345.613041-1-ross.burton@arm.com>
 <20220315162345.613041-2-ross.burton@arm.com>
 <8096196d8428377e5c277ffab8be51dfb138d1b0.camel@linuxfoundation.org>
In-Reply-To: 
 <8096196d8428377e5c277ffab8be51dfb138d1b0.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 16 Mar 2022 14:35:05 +0000
Message-ID: 
 <CAAnfSTskU_LSgZmqqjPWKi1ySfEZsM8+=xkrGU5A1CEavJ=-=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] lttng-modules: remove redundant devupstream
 assignments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 14:35:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163336

On Wed, 16 Mar 2022 at 10:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> >  SRCREV:class-devupstream = "7584cfc04914cb0842a986e9808686858b9c8630"
> > -PV:class-devupstream = "2.13.1+git${SRCPV}"
> > -S:class-devupstream = "${WORKDIR}/git"
> >  SRCREV_FORMAT ?= "lttng_git"
>
> I think you need to leave PV?

devupstream should be setting PV automatically:

if proto_marker not in pv and not d.getVar("PV:class-devupstream"):
  d.setVar("PV", pv + proto_marker + "${SRCPV}")

I can double check shortly.

Ross

