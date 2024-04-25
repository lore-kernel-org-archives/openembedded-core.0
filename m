Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1846C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 00:26:36 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.5260.1714004788357373377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 17:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SZlrTp1E;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5878caeb9eso49758966b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714004787; x=1714609587; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uRFX5a3RSE/mn2VUqZr1SecDs14stYYFBz6z5ex+9S8=;
        b=SZlrTp1EtpgXoacfMV2cVzLoBk80C2c4fR0iE0NofWYdw7wUm4j00tL9W9vuIxeg3n
         tyunvZx1EczjoY/3Bnpiy5Me3I3dzhpBTiUSZgJ9aJhEcdSlkbn/cxIXnLlKypsxlg6V
         7fq8DDbCfLiJopTuLAvBkbDj7wWcGoiwjXE7tdz3dIkYSzax4JKb+NHjWSGr9Bl/gTiE
         YcOyCubPI+z9/tRVqMunG7OgQrwk4cvZOUQB15PNCXqVG+GJoi6ojsFOJNLnja8YoTWl
         hwyD1CxPbVDLGXjhkV5DCOJUnlqzjwazl5M/cwlsnlgSxxtvpNG6I83AjK3+UXcKADzf
         C4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714004787; x=1714609587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRFX5a3RSE/mn2VUqZr1SecDs14stYYFBz6z5ex+9S8=;
        b=Bx9rQZF92NHxhB7qBV3cqRQhIO6BwdXGGs072lyffUDItHbhVsiUIfNcmYzTdUwpbA
         qiKYXxkZ33PG4VZES51RErx7XUHomGTrJKt6EIYWvhxxdXOdGfnfOZu3t1rHVwAEeRym
         7xheliKYFVYd7kERlcuBGgcXPL4H5d6pvM7KlqVNDrBwHFP4KnZv82R+CAru6F1UVHtI
         J62Zt8HhCtn8eRjPEF03R6VtwYlBWhi1Pxc1aB5a4R+5Z8IB8mASOxBTq67Er2W3RyND
         uVIetF9txVJw3JViFaleeas+bZ9AAQZE3y38H9td59Cy64bz9yPZJBQ9CuFamtEsg4K/
         0UdQ==
X-Gm-Message-State: AOJu0Yx7cODK6cP8Nr3iPdm4DxBRRiEWjxeheWFhvMzGkhIHFpbJnyAM
	g/FIj6wEQv3BlL1R1dl0ddVVUxb5YW21AqCZJcQeyxSknFxBFqbSysREO+uUrB4ywXECwURD667
	u73q0efl/QwjTB4/2ulAf5qzU2/E=
X-Google-Smtp-Source: AGHT+IHdEnZuxgOsyqKHm454qQdD3W3TAo4oY6HLO2Ki2HOLZwigXXapcp+J5C5TugNPrABrykoM/sRMvite4sXX1w4=
X-Received: by 2002:a17:906:28c4:b0:a55:3f2f:4b40 with SMTP id
 p4-20020a17090628c400b00a553f2f4b40mr2502588ejd.68.1714004786460; Wed, 24 Apr
 2024 17:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <17C6E6A289A008EF.28114@lists.openembedded.org>
 <CALT56yMqnU_vndjxBiEttPQJd=3RForUGPeqKM7us9eGwLjJsg@mail.gmail.com> <CANNYZj-Y6ewMwQ7=y9PUavF2mKYKTeZECKC8FkmTrD=0Mry4_g@mail.gmail.com>
In-Reply-To: <CANNYZj-Y6ewMwQ7=y9PUavF2mKYKTeZECKC8FkmTrD=0Mry4_g@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 25 Apr 2024 03:26:15 +0300
Message-ID: <CALT56yO75k3w3V+n-gByiGUdv9g7m5oqQ4YLVjpd08pD7A_48Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: backport patches to use new Vulkan AV1
 codec API
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 00:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198692

On Wed, 24 Apr 2024 at 11:34, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> The patch is fine, and it's in abelloni's staging branch. There's no
> separate notification for that. Integration to master for now is a
> lesser priority than getting scarthgap out.

Ack, I'll be more patient then.

>
> Alex
>
> On Wed, 24 Apr 2024 at 04:03, Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> wrote:
> >
> > On Wed, 17 Apr 2024 at 02:31, Dmitry Baryshkov via
> > lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > Backport two patches from ffmpeg git to fix compilation with the newest
> > > Vulkan API.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Gracious ping. Otherwise ffmpeg is broken on vulkan-enabled distros.
> >
> > See https://storage.tuxsuite.com/public/linaro/nicolas/oebuilds/2fGSSDyVGWy5G5B5QwGHGAOYSlR/build.log
> >
> > --
> > With best wishes
> > Dmitry
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198636): https://lists.openembedded.org/g/openembedded-core/message/198636
> > Mute This Topic: https://lists.openembedded.org/mt/105567763/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With best wishes
Dmitry

