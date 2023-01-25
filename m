Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76E1C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 15:47:37 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.48500.1674661654049581977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 07:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FWLJ44Xi;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id m12so2049454edq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 07:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7eqZf4LkB8XWbJjrAvgCi1tMOhBGbsirPBlguKKGQLo=;
        b=FWLJ44XiKklQ2bct5352DEsrDAZZp4wQ4NErNtksNNugBKKLUpO2mnSoh+KNgeqmR+
         Bg/6jNXV+rF4jkcP8HV5pNfO4LHG2w1nUcwdXgRGbmVtevEGwYIxdLD+esW0IGhuC7mM
         jP085fUahDhq2USCYPYZ/A4FRMF+vM0waBmOZm6Wp9XogUCvfE/aWV3GXsSHpVycrHgD
         gY/ifMXc9MEJvoyRE5SG/1wzHXnF1oIpTVN/f2Eh5z7LPBBDBecG78rJHjvkX0l65UHU
         gGDBK7Ll4KgmXIWFp+IqFzEM09twx46gOatn4tAwQ6MlGQxFa0JZtDWM0c85lQzS6M3O
         3wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eqZf4LkB8XWbJjrAvgCi1tMOhBGbsirPBlguKKGQLo=;
        b=jXbNxhFC2AceQj167KpngNGSt31vGmvFEWDW3mqvvbZOUlLuscF4LlUoXZQ2/C4gzm
         h8Wq2kq/naaI4eLS68Vq2xgb2cTfssBw/kmLnJWBXh8sAv5vtcyySLvCXUEzjqavHrBa
         hTMO+hUJ5Bdtz45O15F5+kM91adBNjpjIGOCEoiZ4hE1HnIFChUyDNloY5ZaZDBwvukh
         TwTHQ6vqDUOIrXUOYC4d3mXhjDjIFmJXYsztB8HDjirohvD1W1PoA56gROvjRJVGteb0
         1upcw+wIUizYN3AKazy6i2iX9mYwnfqDHlJhBgNQZ5RyCvpHaDI5KJHPHzYBG+YfpfQd
         2o/g==
X-Gm-Message-State: AFqh2krxL7m32sa1YCPYxKGR4aTiyZeh46KZJVJiCPGstGKMP+UDazaD
	EtdD7HyhiewSEiPfkgBMaVZNitR/OfKNf73sVzcB1A==
X-Google-Smtp-Source: AMrXdXvt+GzXxydC+aAAsvfr+G2v8lfdqtWwjQHt1husV2bJiGaDBAosq6bsznEtCHpOT4Kxpo1Fi+me0kF1uF+Iqtw=
X-Received: by 2002:aa7:de87:0:b0:495:daa9:b0f9 with SMTP id
 j7-20020aa7de87000000b00495daa9b0f9mr3792965edv.3.1674661652223; Wed, 25 Jan
 2023 07:47:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1655666951.git.steve@sakoman.com> <5e6f4d0d3d314897b8ab2f45b3a78b0da9df99ab.1655666951.git.steve@sakoman.com>
 <5a4d1a0a-b0ae-efdb-c12e-05d1a98f6f44@kontron.de>
In-Reply-To: <5a4d1a0a-b0ae-efdb-c12e-05d1a98f6f44@kontron.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 25 Jan 2023 05:47:21 -1000
Message-ID: <CAOSpxdZvYJ3h6JBpVCz0UhDYrqFPs2MN89NARr_80HsPmZAKkA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 04/15] devtool: Fix _copy_file() TypeError
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 15:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176369

On Wed, Jan 25, 2023 at 4:49 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Steve,
>
> On 19.06.22 21:30, Steve Sakoman via lists.openembedded.org wrote:
> > From: Xiaobing Luo <luoxiaobing0926@gmail.com>
> >
> > when devtool finish, the _copy_file() failed.
> > --------------------------------------------
> > TypeError: _copy_file() got an unexpected keyword argument
> > 'base_outdir'
> > --------------------------------------------
> >
> > Fixes: 05f2d5d2ce00 ("devtool: finish: add dry-run option")
> >
> > Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit a45d9dc089fb2719ca69b92870917f8c0925f632)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>
> Could you also apply this small fix for dunfell?

Yes, I will add this to my test queue.

Thanks!

Steve

