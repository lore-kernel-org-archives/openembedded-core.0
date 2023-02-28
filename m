Return-Path: <geoffrey.giry@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D09C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 09:05:27 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.19219.1677575120496682961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 01:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=gz1+ePdX;
 spf=pass (domain: smile.fr, ip: 209.85.208.41, mailfrom: geoffrey.giry@smile.fr)
Received: by mail-ed1-f41.google.com with SMTP id i34so36858998eda.7
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 01:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FN/Cz8NpttBVJzqx4pjr/mVKx7H0UkScHWQcCVpAfQ4=;
        b=gz1+ePdXtBMXR9fUnP/dXF9WmxLaHWdRKZgwV0a0ZUFwLdoG+4i0BzqFotGFenwOMW
         LbGXi3rV27nxguQCMG3HCgiw16VL72Fe/xLJObSodcH166UDBUOifCt+Bx4dJ1LHTi+x
         Wq/BjpHRvdpFLfbsk8y63Lbd7oVxNCeIHW1WuuGZgL5bJ1FAYxeXCyZyvjgh0Y3id8BG
         D0i7EFYveCnxXfnffr0+oVjXYRQzP57RuRMQjmwyzZHk25eEhcoCf4PLFftgUStoBtdt
         Mqq4nro9ncEX05W6WT+mHGk2mHFq8tJs+TnFchAxPGUT5Z9I5qKP992aFVG5xLu2Ea8K
         HVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FN/Cz8NpttBVJzqx4pjr/mVKx7H0UkScHWQcCVpAfQ4=;
        b=iUmTRfzhVQrA1T7GirOcFTTAbGvzcH/C9J02KtuRAR7RjX/mgxywP/4WbnaC5EtL5q
         GGgwXrccSjw4olRiHcf5OvNZYzpYUFOs4NrKq4CgL3dYj7saEjZ21MkgP1uGMXFcJKEE
         OlC5Klp/gWaQirTuN0Jt1Hjx8gHhZpZzkZ/mqitYGLtMmkVRwoZYHIUorpGPwqhMe9pA
         t+fpcE8PxBo4mNopMXHhnvw9C5LLgiq8Df2srg2lWfsWBJExbPAc3RaO6wyA2cIzdZgQ
         bfWb8ZluMrFnsXXHVM8hMtnZ+3eQzdRy9vvwXlJ9RTQUQ2IkxLhsWCS9uGFFErJEfdT/
         SLHQ==
X-Gm-Message-State: AO0yUKW6S2hJVFt4HFEoAJ6AparNmdpfXdKZ+OWOhGuGmObh+pgA5MlR
	gAYRhAEF85o59r3LHlCaMzrobod6hk2AjvsKasap8w==
X-Google-Smtp-Source: AK7set9gZDeIrHtMFEKx5VuUODrU4rpH5LaXIAUHbWYKxnW095tlcQRhvA/ynIGVcsl48LugZvkHMMoEmnsaymNbgGA=
X-Received: by 2002:a17:906:c08c:b0:8f1:4cc5:f14c with SMTP id
 f12-20020a170906c08c00b008f14cc5f14cmr908718ejz.0.1677575118754; Tue, 28 Feb
 2023 01:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
 <CAApg2=RSgsbVjjeepNJg_=rMZqf-n-fQwWtYPVufUgG-D74p2Q@mail.gmail.com> <b746ce640228f72ad3cabcc39ae2992305dd4a0e.camel@linuxfoundation.org>
In-Reply-To: <b746ce640228f72ad3cabcc39ae2992305dd4a0e.camel@linuxfoundation.org>
From: Geoffrey GIRY <geoffrey.giry@smile.fr>
Date: Tue, 28 Feb 2023 10:05:08 +0100
Message-ID: <CAGwXbzboSNk=8rAsQDHOnmWhBEtjt2VW0YG3i__2OjkL+3=AOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions: ignore inapplicable
 linux-yocto CVEs
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177825

Hello Marta, Richard,

We sent to NVD an update for one CVE (CVE-2020-27784) 14 days ago, we
are still waiting for an answer.
This is the first time we ever do this, so we did send only the first as a =
test.
When the change is accepted, we will send updates requests for each
already patched CVE.

Richard, thank you for the details provided.

Regards,
Geoffrey GIRY
Research and Development Engineer
SMILE



Le lun. 27 f=C3=A9vr. 2023 =C3=A0 23:02, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Mon, 2023-02-27 at 18:49 +0100, Marta Rybczynska wrote:
> > Thank you for the work. Have you contacted NVD to update the database
> > instead? What did they say?
>
> Ideally a large portion of these should be sent to NVD but we did talk
> a little about the on the call last week. We agreed that it will take
> time and it was better to document this and fix our reporting in the
> meantime as well as share these useful details more widely. I'd suggest
> that as things are submitted we could document that, hopefully we'll
> also be able to remove many of these entries.
>
> I'm sure Geoffrey can provide more status but I wanted to update on why
> this was sent and why I think we should take it.
>
> I will drop the kernel filtering so new kernel CVEs then show up in all
> our metrics going forward.
>
> Cheers,
>
> Richard
>
>

