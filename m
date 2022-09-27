Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58724C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:05:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.13585.1664298302803295788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iRl6idJN;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id a8so16621594lff.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xLw6loSFGSUPhDSIZJmfSrG5K3OXBcMN5tXwS/r7unw=;
        b=iRl6idJNcuhQlko8fFpk/3E+FkbGSe8r2dJZtyAIRKNYrO8m1nX88BONlqyiBAq7cc
         4By7XutGh91qezmQlHu3c8Ogfsza95C5/wmw1s/CR/eOs/ZZKCelUb5zCCKISmw+gHbg
         tAwV+cggxlUkCSeCHdI9Ao52hBkTndMwFn5xzwKIDZpO9xDF4cIw61hhwKRrAERTWsDv
         Xt3Eb+SsCh8iOB3zShoxT6OsE8BkNK5iblIlPeHfdlpsW/ZIdHjMjuHcP6JTEqoJuZwd
         UAca/s0O/Oq3ws6Mm52JOpnynr/em+uaBOALre0WkMKcA0SCVZpMHtCuerxnMf7NFjto
         bAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xLw6loSFGSUPhDSIZJmfSrG5K3OXBcMN5tXwS/r7unw=;
        b=X2CnxCaw+Lt/MnWFtFEPKESVXfrwrePnVdWY6ZeziLguwcX4SZaHQIJay20LSy6dUn
         pE+JpHXMOmWwNu9qqNuJshpP8+MGu7/00nwXzk7LSXzcLmN76j5pPJwSkQtX6Q6WIO4X
         2cepZvdxKrvKe6DTN39n6feS5KLpVFnKrc34pn8PGsGlCmKRbbwO2AHDHgfScxzM4AgY
         VIpGIdPEx54ePcv4kw6KbWH2ljVEgvpkwZyHUE+jE4hGZ5Usnxz9at4FXmqmkaLpqaFD
         aDX4KCDl4Bo7uPAqeIk+7fjVS8HlEEefeqZZGZ3AKf+CsJ153TkF1XKylapYPdfMeubL
         OEIA==
X-Gm-Message-State: ACrzQf0Q7IdIMShxtcbqFWT7M3gVEVOYE46jrTpp+RTrGbs7R+CLuoDk
	OlEfyCR4L3tzw+6auDsgJI5MiHS+h8D+ZghkPZY=
X-Google-Smtp-Source: 
 AMsMyM7e4aoCLLRd09+A5SgBaQ2g+vHf5opzuuzVytxvb9TmNOCbHd4xQDailRL0fW7cson5AmSWjpm1V+iBPelWTY8=
X-Received: by 2002:a05:6512:1283:b0:499:d0a3:3ca8 with SMTP id
 u3-20020a056512128300b00499d0a33ca8mr11156378lfs.665.1664298301022; Tue, 27
 Sep 2022 10:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
 <faab0d74b95849bdb1d39ac0146dd523@axis.com>
In-Reply-To: <faab0d74b95849bdb1d39ac0146dd523@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 19:04:49 +0200
Message-ID: 
 <CANNYZj-c_z73wttGbAUv7FyKA5oGW6AaohuxMjoV6vEnmPg2wQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:05:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171114

On Tue, 27 Sept 2022 at 18:06, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> I (and the small team I am part of) is the proxy between them and Yocto.
> Thus I try to address their needs by making sure new versions of Yocto
> continues to work for them without having 500+ developers facing the
> same problems. I.e., it is my job to work with upstream, which is what
> I am trying to do here.

Excuse me, but your job is not to 'work with upstream'. Your job is to
make damn sure 'upstream' continues to exist. Which means: go to your
management, describe the situation we're in (you have the numbers),
and ask that they allocate at least one developer to work in upstream
full time. Not drive-by patches to fix your specific product problems,
but upstream proper: something that makes the project sustainable,
e.g. fixing medium+/high bugs, working on new features, upgrading
recipes, sending pending patches upstream. This works never ends, and
no one wants to do it.

If you can do this, I promise to be more sympathetic to your
particular issues, but as things stand, it's rather difficult.

Alex

