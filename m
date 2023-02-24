Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E127C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 11:12:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.15231.1677237170540078305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 03:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xpmex71D;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id y14so6675860ljq.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 03:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677237168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WLsmmmuff0rHX8/q1fDrK7/iCQa3rGWihDvPP6WLX9g=;
        b=Xpmex71DYL0WxHjXJdnidCYSe/xRPYBxFMWjp9G4C1Yexlw2QIighq5HblyT8AC/Tl
         NTGfP2EO/QB7rkRBZbwd6cXlBdoizopO5s4/GRvKO2WFLzz3275iEdBaR0Gm+jdt38yF
         UCPEQDFMwH4H0P0emTc/OFzPTeJpsXhvPcEtpg7Xzde3mtHLQxHAYRi+GHP/zdrxJk0i
         KE6EL3DHTeHQCdA0vuIT5e35loEAr45DTaFAd2ZcDiGAh+Xe9iNkIlpraGW04dHuC2jp
         X4V+tno7v0gOYWIh0wXGQbBS1k/DjlEZstCGn4UBH4kv/tYlq0fDxgHZDzgaRpFmfuns
         WX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677237168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLsmmmuff0rHX8/q1fDrK7/iCQa3rGWihDvPP6WLX9g=;
        b=PJEbL1qxsV/3+1ehKkiSmkQGL8bSgPSYPPY6sLaHHMopfxQ5WjbPYu0EnHI7pJa6gL
         4XviaMdgYN0UbGgsVCVMe+c4eDj2ubv1ZV9c3eLJVhREEaPIExBUI4+28IuZn/K8eWif
         J6xuTrlJ/Fg/U0frGH+eWq+DTbBLun3Smk3me/x34C+w0wp0tlvle1mXtVcI1wpeRwNC
         VO5E1zZajBt19xG8WjnHHLYWX9q5p7GQYPY5YQpBltiUrn/B6IQCh60rWewzXstXIHqN
         /5PwjmI5Hc+kuNZopXvi3WZj3KIWgxPzQIqqBXoP7ZsY8ReLl3HulzfMRUs8KfFNWFRL
         3dXg==
X-Gm-Message-State: AO0yUKVMq95asrZRtQSTiUmCGcG1e0haCPUO4RdW3zTzFZdXUTBnEZyS
	eMGDypswswfcHwFRC4oa9WBLRhK+N8SdJO1Jrow=
X-Google-Smtp-Source: AK7set8nze37cy+Y0JE1mIg5aBGSI64oQ2OJpJJM+8ihxG+fxAAVtWCxVZ5+wAw9jOrTM0OwWmR5H/8tg135KWx1CW8=
X-Received: by 2002:a2e:8e32:0:b0:293:5f43:c7b0 with SMTP id
 r18-20020a2e8e32000000b002935f43c7b0mr4772592ljk.5.1677237168192; Fri, 24 Feb
 2023 03:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230224093850.3393567-4-zboszor@gmail.com>
 <3EE6D20C-8A7C-4772-BF56-E1CD25B12B6B@arm.com> <1746BAA6D62E4C0A.18951@lists.openembedded.org>
 <0dd9eb47-521e-7840-9196-f485f080b44c@gmail.com> <1746BD3631A1C7C1.29542@lists.openembedded.org>
In-Reply-To: <1746BD3631A1C7C1.29542@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Feb 2023 12:12:36 +0100
Message-ID: <CANNYZj-TwJHY4b6Ap8jaX3vw51VzQ06Dc5WGd7pAzFZ+k0vbOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] mesa: Add PACKAGECONFIG "rusticl"
To: alex.kanavin@gmail.com
Cc: Zoltan Boszormenyi <zboszor@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 11:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177680

On Fri, 24 Feb 2023 at 11:52, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> It also succeeds when there is no inherit rust at all, in the current
> master branch recipe.
>
> If inherit rust is conditional, and condition is false, then there is
> some other change that triggers the failure, and that change should be
> conditional as well.

Or is it the other way around - fails when condition should be true?
How did you write it?

Alex

