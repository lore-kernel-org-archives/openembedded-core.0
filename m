Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0100ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 06:39:41 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.3223.1663137580900022466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 23:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ubr0U0iM;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id r20so4812947ljj.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 23:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=24vX9HU+aszlaxpjrV3vw6jbYD0vX1bTkUmQ2WuWpIs=;
        b=Ubr0U0iMOoEebQQmIlB9PELstXBTtcbzPQLUW7AIgJx3Xn8rVh2AH6AHHNrqent+mN
         AbtIA2FzR8j9+jt3/RwfwLC7MPC44czI+din4dhDXf36hfzPuAuU1saQWHZzwgX/NPIl
         85qsn6AmMJfylSSQctzLcMf45GR2CweAlsKGq2jCtALOTZNZZSvMTU1PTObgUOvxb3ba
         CRIqnTL5OjgrBi0oa0R3yUorRutOgpvSls3Afds+1AOl2g//HHl356wcB2yHfi2N1au7
         tqN9gF6CE64gbRzAVNyVpIMqQYf/OJN4BsoqL9fZHZ/THE3n2aT5f3Zcj3m8gKEp16tc
         tmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=24vX9HU+aszlaxpjrV3vw6jbYD0vX1bTkUmQ2WuWpIs=;
        b=1e9+fMMEVNBGXH0UqE8bpC2InAQm32PcDljkyi4fyGgW+8+7qNiE3dg3B4ec+dL4/0
         2iQ1kmbI1wdsCsITUk1vxQJi5Q5/M2Tx/8dPRCiIUkGsPqKof56W8hagoZ4sBGRzShwT
         faBPmg4Wj5dI+TeINBNa+8q4dYcIsmr8N3cFowWFgjaL+J5Jc+dldtFoFEX6ZhqPmH8H
         TBDyjE2O6brH7XgOnlOt2IcSupdINx7f/c6HCgiL5rgXFgN8NiSsA+psi8C/0AnJMV8L
         +TEagQfIbvXoPo741+AWuMZFjF1aeY60G4NapqZERrz3rBb4Q0okWXdIN6DwJD3XcnsO
         jWBQ==
X-Gm-Message-State: ACgBeo052KZSPlNJv1yLFcUYboWybMW4nyvSnPENj2ch7KLS3LV30tqy
	CR5VJg00R0DmMvUWS22sZfT3a3OUhkDcXARpPEM=
X-Google-Smtp-Source: 
 AA6agR7kYYg+9A6e7Q+aBfZJTQjRrMkYVUIES/Q6fbViniGFxt5/JIuQFUmCXJ9jdVx6+gGOqTyCsGUkgWNw1o/WAWc=
X-Received: by 2002:a05:651c:17aa:b0:26c:27cd:3fe3 with SMTP id
 bn42-20020a05651c17aa00b0026c27cd3fe3mr349170ljb.68.1663137579103; Tue, 13
 Sep 2022 23:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
In-Reply-To: <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 08:39:27 +0200
Message-ID: 
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 06:39:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170636

On Wed, 14 Sept 2022 at 07:49, ChenQi <Qi.Chen@windriver.com> wrote:
> I'm reluctant to agree that this is like machine and distro, because
> it's a hard requirement that machine and distro definitions be under
> some layer, otherwise how can bitbake get info about it? But
> TEMPLATECONF seems to be a different case, it could be everywhere
> because it's used by the project setup script.
>
> In our case, the TEMPLATECONF is <project_dir>/config/, and layers are
> <project_dir>/<layer>/. This directory hierarchy has been working for
> years until recent changes.
>
> Do you think such directory hierarchy makes sense? How about we deleting
> such check if there's no strong technical reason to do so? By 'strong
> technical reason', I mean that some codes in oe-core are written based
> on this assumption (this is the part I'm sure about).

Again, it's not about only code. It's about humans too: we benefit
from having things where we expect them to be. If your templates are
in meta-layer/conf/templates/ you do not have to document, explain or
support this; anyone new to the project will simply pick this up from
prior experience or official documentation.

That said, there is already code that makes this assumption too: both
'bitbake-layers save-template-conf' and upcoming 'oe-setup-build' (the
patch was sent for review here) consider only
meta-layer/conf/templates.

I have to ask the same question to you: is there a strong technical
reason that you cannot move the templates to the new standard
location?

Alex

