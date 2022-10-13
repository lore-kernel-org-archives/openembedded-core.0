Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476F3C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 07:53:01 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.4973.1665647579102055694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 00:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ngBxnFJl;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id b1so1242580lfs.7
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 00:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mZmMMxhX8fpn+oKOjZQKAhLrbn++/f/tAPCNaKvnhkk=;
        b=ngBxnFJl1luU7MSr1JZqdwWpXLYDelrtvfnv2ZEPM5aXER20FoaA1kJ7OUEsF/YHJF
         i6t47Ggk7mioOF5FssX4CxGCewa1myBsE3PWPxnaOIUn39e7GUw9wj+iZ0PzeW7S5eUw
         iHRNriKuXYodpIngYl1qB37/IFW8zSiotfnvbonY4WD4XN+LQECthPCE0ONx1h/nfH/9
         Znim9v0TWJ2Pn8u9G73T078qEpPUr81ya2lmzlmeCKSvaPqD0BuVhRS3qK5SrCiHLf9L
         dsgjA0D/88+/GbXQ/c7aWGcMAnueKPYGi4HdXMVtz+kQ62HYYC1jmlmSdW4u4CG+mgMr
         TKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZmMMxhX8fpn+oKOjZQKAhLrbn++/f/tAPCNaKvnhkk=;
        b=UFOdJMtrq//lrnuVASgv7kIxdy0rTgXzYaVSBRu2D/ek1d2P08UvhUs8S7ef7/BoV1
         vuEv3xpW5qVhjWh5pj/3EyVXAv9JFydPYRR/l0vd5jq+lIvye78RqZiYZkyBa9STWctP
         qXYO7Ozsr6wy3GuY4KKui2nYVTjvJYDM3a6jJ7Q8tgtuwUHWm7qQPwUdWHwxTl4pM6Sq
         0TG26Ld7CaPChikLTvh8kOnq+8IWFfzO1Z6NhkTPt97+D0Y75pGyYoWLMlqQwDQ4J5AC
         GGZl7baanSN5kf3ti2H/Vxkk/liwjO9nsMU/2T5X4Mt1gI9xkJp6VZh3y48MrbOdD15V
         MLYw==
X-Gm-Message-State: ACrzQf1pOopSh03uLfAwU9egUiY+dYRUj1vC+EyhABjelnzLp4bTckTy
	EHMsQjOfjiNPtl2iprrmbd4GrKYBUvittKg7qWLhoyXuIYI=
X-Google-Smtp-Source: AMsMyM7BFQ/bsTkuhlMMaL8p5G4J+h9T6Fc6QrbJXeCcM/C+LPoOZad4qjhOlKEAUcKpU0B3U0nbQfVyW+uAO8ZjREM=
X-Received: by 2002:a05:6512:12c9:b0:4a2:6fcd:4e5c with SMTP id
 p9-20020a05651212c900b004a26fcd4e5cmr11700030lfg.327.1665647576443; Thu, 13
 Oct 2022 00:52:56 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 13 Oct 2022 09:52:44 +0200
Message-ID: <CAApg2=TmNEnu+KQTz9iJ72LaduRoHQh_YwevzJgpROj5C8qJew@mail.gmail.com>
Subject: [kirkstone] core-image-weston doesn't build
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 07:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171685

Hello all,
I'm trying to build the core-image-weston in kirkstone to look into
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14926

It turns out that the image does not build (oe-core
e728d0965d6fda8ac54e065ca7bf7eb9da9a8170 with bitbake
6603c3e39f1cf746669ec6c9f0be8c6e6ece426e). I'm getting:

$ bitbake core-image-weston
Loading cache: 100%
|###################################################################################################################################|
Time: 0:00:00
Loaded 1640 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'weston-xwayland' (but
/oe-standalone/oe-core/meta/recipes-graphics/images/core-image-weston.bb
RDEPENDS on
or otherwise requires it)
NOTE: Runtime target 'weston-xwayland' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston-xwayland']
ERROR: Required build target 'core-image-weston' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-weston',
'weston-xwayland']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

I can't find this one in bugzilla. Is it a known issue?

Kind regards,
Marta

