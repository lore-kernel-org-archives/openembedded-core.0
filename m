Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3563C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 10:14:40 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.21546.1680171279230562249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 03:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZaKv3dF6;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id y20so23870189lfj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 03:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680171277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xiFM8Mc/XpxCcXR8vJLnT8tC79ng2QS9mWNKExqR3wo=;
        b=ZaKv3dF6Eloy0GeviwmLGlEXZUKR1qzu78ZlCA4sv1mRMwSMLNAfaQN3n4oSuu7koh
         k7+3suamgjdPSCfOsx6F4eD5xL3RHAKLR1WFrJbuDLgoB7xtj43A8AIG/WM0cMUGor8Z
         XIvqTCiV5FWqEJRa2q72Da4jVvjSZdI4dDptZY4qXl5hBauEy/K4JHf588L3ZQ42EDQK
         w7DWTLtentVitvXMtF1NXTXWQ9YFb0kRuE9N8bniHJ0cWeZ3/PqUOg++6+OsgJg8SNin
         OZH+tA8+VPdKx4Hj0abEGDmDr5F7dOJTT2I2APXqU+Ts4JJmBmXgnnhT7TS9t5cq7qdA
         1fXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680171277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiFM8Mc/XpxCcXR8vJLnT8tC79ng2QS9mWNKExqR3wo=;
        b=XlTQQDy/zYwAvzlOIHYq0WAkk8GK7s+CcdLx8iSVJZBsry6oEqPK9c+2VwFF4s4Trw
         Wzh+2DPv09Rb8ZL6EV06VhXQDWB4exBBD7xmZSAV35hksV4/BHxq8XgGCklBhrnPGYQ5
         yRODSgUrZCKdTmNkDTuV4SYsYCsXuTqEOppf17YN2cFtQFT3Gpvi435fLkGxBHhiY/72
         Cwhsx+BJ7t5furwrddU7s4lteFwjPuJgVXAuS36vNXIE2yuLAfLdAE3JSX/Zq7xz7nyE
         G65euGNUnHQroXNC1F6I7dNbDVLbeP7p6n0CrlYtTP58+W40WorsQQgq6uQxfN2PfRQs
         wcvQ==
X-Gm-Message-State: AAQBX9fFXSq6QGnTSjnA0f2iYw6yFS5UN48VD/Mnhcm64RlV8112EoUA
	uOmv6EYuiXxEwNl6BUfFy2J1YLN422JNblKLumw=
X-Google-Smtp-Source: AKy350ZS/fnFs7fMIav1ZaeaodaP2P1ZY+zr/RKyL5RqdnkoKFrnIAeYgT4caR4Whh40UOj2RfxM2VNyYZG0vC8gOQ8=
X-Received: by 2002:a05:6512:23a3:b0:4d8:86c2:75ea with SMTP id
 c35-20020a05651223a300b004d886c275eamr2511428lfv.3.1680171277319; Thu, 30 Mar
 2023 03:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230329223355.2190782-1-raj.khem@gmail.com>
In-Reply-To: <20230329223355.2190782-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 12:14:26 +0200
Message-ID: <CANNYZj-n0LsnyXQ-9-9OFn3R9FzeMwaNh-AapzaJ_CWQnHwACQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gpgme: Use 64bit off_t consistently
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 10:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179313

On Thu, 30 Mar 2023 at 00:34, Khem Raj <raj.khem@gmail.com> wrote:
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 29 Mar 2023 15:31:20 -0700
> +Subject: [PATCH] Ensure 64bit off_t is used
> +
> +This ensures that consistent off_t is used across python modules and
> +main gpgme
> +
> +Fixes
> +| swig -python -threads -py3 -DHAVE_CONFIG_H=1 -DHAVE_DATA_H=1 -DIN_TREE_BUILD=1 -Ipython3-gpg -outdir python3-gpg/lib.linux-x86_64-3.11/gpg -o python3-gpg/gpgme_wrap.c python3-gpg/gpgme.i
> +| Deprecated command line option: -py3. Ignored, this option is no longer supported.
> +| python3-gpg/gpgme.h:111: Error: CPP #error "GPGME was compiled with _FILE_OFFSET_BITS = 64, please see the section "Largefile support (LFS)" in the GPGME manual.". Use the -cpperraswarn option to continue swig processing.
> +| error: command '/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux-musl/gpgme/1.18.0-r0/recipe-sysroot-native/usr/bin/swig' failed with exit code 1
> +
> +Upstream-Status: Pending

Please submit upstream first.

Alex

