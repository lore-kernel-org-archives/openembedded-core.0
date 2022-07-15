Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8853CCA480
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:01:14 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.977.1657900870779320539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dyQF0H1I;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id y11so8516454lfs.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2EFkcLjUslZL1DYoF9w9phPln1TXP0+mf53IjAgcM0=;
        b=dyQF0H1IYUVglK3pYQS+5FnEdqYIPWd1R1G1M9wkUoB6WNbvrwCr2zVx4JV+u272/1
         uFPBOJS/GrsxqeTBOUTcBdttxWXbNQMi4flUntiI+98BsVcEHXIk3XC1bapF8HUmyj5T
         k9s5AYOx2ZlrHHITpCNtVe8NHz1XLAkRdd7XJJf8x83vPDYKQrqRuDsQA+8RK/1fE7Fm
         mOVNcMUCBGVs3wEZdvE3+UIXtvpHw4U7pvQlOYSGsgqFi1P7GKRb1h0bsapl5UgvjyKY
         zKOkzqdG133AoSoB8h2NWalnHUDjuwDJIngt7MwCVaAY28gySeu6rPFW33+2OeGORBTb
         G37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2EFkcLjUslZL1DYoF9w9phPln1TXP0+mf53IjAgcM0=;
        b=RalmHJczZnosbhT6H7fyzicSRNBSeRUwYikauaPwY76TY5dcA8MG1SZZ19s6VAlmov
         S10F70U61eYZuKCZnXnxFiQuXznJgmrPfjNefTHzSe25KmAl9n2xxqa5wdkmmGRPajA/
         UO+yiA5tYfNIoh4tLlI1lsB7hRtyKiOVcrabivySpcnCMOIdT/5s3ViY1PDIU0I42Ti5
         ctoZNC2f5RjxTTAq/eW5TfLwR9dCtu/e6eaw5Y5Bq7QFgSqPbKwxYmkyhnShzT3dqHNr
         SvaVgJyM2Powdn7vcINPjkhzpleGQevxeuvOTl1OSbl0zKS0fousMzPgvh215ALNpsPp
         qWbg==
X-Gm-Message-State: AJIora/sI1LjK9nTGnUyXrdVeya02OyIWvmaiQ2nnAq+pntlBut6cTyB
	plna/qASicgSj5GBGR//mAYODqljkC2bzyqmORI=
X-Google-Smtp-Source: 
 AGRyM1vInv8TN5/323PGi4G80KkGqsgJFW0Fsg7Ay3wV7zNBBLx6jjju/LsxvrGx9P+ef0jzDP6Woqvh6Z/8FdKiD7o=
X-Received: by 2002:a05:6512:1050:b0:48a:2319:59bc with SMTP id
 c16-20020a056512105000b0048a231959bcmr1983716lfb.665.1657900868984; Fri, 15
 Jul 2022 09:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182329.3085564-1-alex@linutronix.de>
 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
In-Reply-To: 
 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Jul 2022 18:00:57 +0200
Message-ID: 
 <CANNYZj_fo5_KbvnXvCqPvoPiy6wgNr+By8Xf724aQm70xxCpkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:01:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168121

On Fri, 15 Jul 2022 at 16:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We'd always intended that site.conf was more something the user would
> setup once for their environment and not need to change. It was
> therefore deliberately left out of the auto-setup piece.
> I hadn't remembered we have an sample version of it. I think a sample
> is fine as an example of how a site might setup a shared downloads
> directory or common proxy information but I don't think the layer
> should be installing it, particularly if it can trample an existing
> file which I think the patch could as it stands.

Ah I see where the problem is: the sample file is installed subject to
existence of local.conf in the destination build directory, which is
ok most of the time, but not all of the time. It should check for
existence of site.conf.

The idea is to serve two use cases:
- when setting up a build from the poky template, there's a sample
file installed. Same as local.conf.sample, we give users something to
play with via commented out examples. They'll never find it in
meta-poky/conf, even you had no idea it's there :)
- when setting up a build from an organizational template, the right
servers get configured without any extra steps. Ross pointed out that
can be achieved with 'meta-product/conf/site.conf', but that can't be
edited when needed, and can't be used to configure different settings
for different builds (e.g. where the caches are - such things can be
under access control restrictions).

I think this is worth reworking and making the commit message clearer.
Or we should come up with a different way to provide 'official' way to
set up site.conf, because otherwise it's back to 'write a custom
script'.

Alex

