Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD4FCE7AB1
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 17:53:24 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.68090.1695664394130099589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 10:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGR+ndJe;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b962c226ceso118243471fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695664392; x=1696269192; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sbCmUc7eka4GJjc1fe5+wqtvFLy3clMrXUQ1BNPobrs=;
        b=WGR+ndJeVSaRQAFAxlpgX7CZOtVdzKCCEoJYhQujrpbYA8yR3bJc+x7vQbnyrdT0Fx
         E3gCpGvHrooyZKMU6awm1JrasbgqWfTmr1iyJ1kBkg5+vcBpUrWaL9S17UC5NtS5zD+A
         3Q0iUESysLYXwagV//jfmvfpadE3IN/f82D7H2/0+XPE143hSP5plf0MGOI0RZQCvLL4
         1sO48RcSmFtO7o1l0svp+ywv2TzMPSinObb3Z8r2jhVyP+3bW797hYN/bWfR4faT0HRL
         FF5Ml2H4xcifpRHr8IqUBa5xWrnHcTy02H13IM1rE/EIQkim3//852zusIrTDQi0IGNY
         V0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664392; x=1696269192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbCmUc7eka4GJjc1fe5+wqtvFLy3clMrXUQ1BNPobrs=;
        b=f+GZa2SbtcI6QMU6Zc5Wao9/xWV1Uoks1pV8MFaDirR+48+bKAyLwMGJZOAUsUgQro
         CbQMKIiuoqzw7IMSWLWiknYZXNO4qlwNhmNCZvyC9VCP2zB3OU6TCX7gUh1b2hiIyIgx
         YjEm28dlKpNpoSXbsVVAs0ImSq7Se2JvnJS1TuSsjOjgewizdaZxHPpZH3pX42ZGo77D
         RSeT50WRecnWof2OwV1zF5mnL1PcdIlCQcVSXnpOyzYdae0jlMh5+9sA0CInaNFHJR4J
         DWGuF5l/4VoOLSpSgXnt+GLMoa9dmV8K51gau6uH6j2j0muvuUHb4jKr5upHN8kB9s3r
         df4g==
X-Gm-Message-State: AOJu0YwLVXfpWS7BEOVsfB2HkWC0CYLaXqZSEE9mwWF3y9LfNcq01tJ1
	VFEh8KztEaS8eD5twpHZOePGpMBy8j+lVa+wFV8=
X-Google-Smtp-Source: AGHT+IE899se1M5k/2LSRL+M0W3gUPwwKi0TKwHr4TSF6/yayW20L6Ryr7arZnvgUsGM6fsYu0gMmP9t/kazKxtjYs0=
X-Received: by 2002:a2e:90d7:0:b0:2bf:f17d:c834 with SMTP id
 o23-20020a2e90d7000000b002bff17dc834mr5995351ljg.29.1695664392124; Mon, 25
 Sep 2023 10:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230923204507.882395-1-raj.khem@gmail.com> <20230923204507.882395-2-raj.khem@gmail.com>
 <CANNYZj-9wiNejuCKxtcT5_Dp9uG8y54E+qV_RBD1SCCd-HcF9A@mail.gmail.com> <CAMKF1sqzGZTZj7CfrkZPf=C=H4wDYMV1fs3PLo4AKZ2DW2kV=Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqzGZTZj7CfrkZPf=C=H4wDYMV1fs3PLo4AKZ2DW2kV=Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Sep 2023 19:53:00 +0200
Message-ID: <CANNYZj8fv9T5qRyuZ=OHSH-zdfJinKXF4XRW2H8DSpvGFMCo2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: Remove failing ptests on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 17:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188201

On Mon, 25 Sept 2023 at 19:21, Khem Raj <raj.khem@gmail.com> wrote:
> They are not triaged so no root cause reason is mentioned.
> The failures are listed in commit with some details that ptest shows.

I still don't understand why the failing tests should be removed. Just
let them fail, or exclude glib ptest from musl CI altogether. No one
wants a fake green status.

Alex

