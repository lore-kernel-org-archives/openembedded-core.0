Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D389CE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 07:52:19 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.56144.1695628333124459149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 00:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=POrOKNs7;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so9088511e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 00:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695628331; x=1696233131; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EnuTIlConb0dylserNVWT7k5YIDAxniH9heGAafugxg=;
        b=POrOKNs7A1AJymSrwj4Mm8IDOL/tk0PioNzYwhWVy3jKJgyFxzfkB3zDBjdpmVhrKW
         JGcD/sZ09Nlcg9eFGrVsxcYZchq8YmyCkg7PYbfsO3owtbWMbjtPpOc2tBwM7FXZowzO
         pxJ3CimKeuBxcDCeN24q8lccOuDm+Lb86DyzjMIya3GJeHsRClRT2y52FNWhx2LuD0n/
         MXjRp+w6DmQIgbeO6WpEjwRBNf/Sx0DCO9wXUPKJELwN55exxWwVUXEXkb3OR7ta2XOh
         HTh+2McBZfggdq9/DyOB1c5hPRW3qbTdft1mW7568XgBX06x8aBB8SJW1yQBgjCXJoVV
         /7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695628331; x=1696233131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnuTIlConb0dylserNVWT7k5YIDAxniH9heGAafugxg=;
        b=wG7J5anfWhnKXZ6KeqbFd0jfQP3lMoIqjZOMBourz+vBnTTRCkkPuB6wcAX0WKq8a4
         jaYHftt55EpRfV1w/XZAtIkRXiuOdljn39P2JUjr628nkZVw7JM+Pi2LrgDall3hARWS
         8U8274oYhGF7gBVsx59ta5BRKCFBKiaMOJKvv7Av6lsIhudfqGht/DDrC4sjQppFBYmd
         2KZ+ktB3Fg6havjWwtx9E6UqAH58G7qDlzLXnDUbpfRULIgUKqaynJ+yhR4cQ5pPU6Dz
         K/T0zPmcNl2y1GlK5hw/9ExBiauiUjGAQyMFhVyqIbF2LRdlz+jDij3No6P/g88flslU
         x+sg==
X-Gm-Message-State: AOJu0Yx07/7hlz3PL4P93RtzFpUoaPL7Glm4/omPXP4F+1Mdu+dackjI
	vSugk6UOECDUzJ9FwDEDl8NHVFtd1uTSmEMifIY=
X-Google-Smtp-Source: AGHT+IFSnXGN3r3zT+4mqxYE2wOP1g1pvXnVrWCrgaoQ1FD5J7XhaAd6tYAmeSnfUvPlHHW4X2QcT2k7Gvt+6tFVLvE=
X-Received: by 2002:a05:6512:781:b0:500:98ff:4162 with SMTP id
 x1-20020a056512078100b0050098ff4162mr4312441lfr.40.1695628330963; Mon, 25 Sep
 2023 00:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <1695620101-2866-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1695620101-2866-1-git-send-email-qiutt@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Sep 2023 09:51:59 +0200
Message-ID: <CANNYZj-DUDDx6e5F6XGQeqG1XDNN2w+oQWck03pDWV_aWOr0=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] tar: add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org, Yan <yanxk.fnst@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 07:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188173

On Mon, 25 Sept 2023 at 07:35, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
> +tar: Fix bug of compiling testsuite
> +
> +Del exclude17.at and exclude18.at from testsuite.at,
> +because these files are not exist in tarball.
> +
> +Upstream-Status: Inappropriate [oe specific]

Thanks for persevering with this, we're nearly there.

When adding 'Inappropriate' patches, it is important to check if this
issue has been resolved in upstream git, or if there's a ticket for it
(and add a ticket if needed).
In this case, there's a fix, so please add the link to this patch:
https://git.savannah.gnu.org/cgit/tar.git/commit/?id=39849e9d91f477d3fb839f93cd0815d0cb3273e9

Upstreams should be notified of the problems when we add
'Inappropriate' patches to work around them.

Alex

