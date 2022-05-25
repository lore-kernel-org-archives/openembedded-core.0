Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68593C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 09:38:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.4866.1653471493919027329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 02:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g/uzhTke;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id a17so2032073plb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 02:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ARBjgJCX7Ie87zGTlqgpuAWQC4S1sW34P+zYeVpeGnU=;
        b=g/uzhTkeBFM+bnvmHOLQMFX1vf6I2I5DlWz1jwuNefNitcJZtWNHaQmPvZx6yiD3EX
         n8cwusp2gHIXHbhnHFslyFOR7vYmxWS49Xd4kT9Flx19DdYGDq+JiHwZjWmwwU55tnAY
         KtULwhUK+a0jGjysBQ2M1nujIF/R4nG/oym0NlcyXgU30Tier5gbFZcK0Bg0QAFlrZSe
         Y4YsR9pzxj60JxhR9hz1PRiVGlAbMqyRD5eYPn0XBebJONiAe5gJbpsWqIIz0cyduFFR
         ke+UhYYOUFhmzz5ea9axzpCSO9Rwzug/GIgioIqmCWgDe7Lm4GnhTLpPZnz65buKm7dD
         68yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ARBjgJCX7Ie87zGTlqgpuAWQC4S1sW34P+zYeVpeGnU=;
        b=6tGgppwLQfbbe0oK4SNU6XkhA5Mhliu/KukFwmLeOW164/QMVor/r3mM5h9TxCGCNo
         nn2ocCuCnHqGrIxpSPb0mqKCMHRz5q0k3UTxOHKZhNeZFPyPaLrOZzSSETvbDAtvevvo
         gJpGwrrT4ncdFm6oRIM+MZSBTwudczzwNVmQQ85aUAGk7GwteV1XqYmgghTrJbHoqnTa
         1BmYNkaR8U2OxDN6CfKy6jKy/O8QHudNnwjnYgURgOCt1OcrU318EgNrPPE4MmiRTtoe
         OqiBhURo9W3JcRJuTv/stX6rqM+U7c3ThH1SmWgeNKWadL67NXlwI/49q2G1/WAFlPfV
         DCmA==
X-Gm-Message-State: AOAM533O4q7+z7NeoDbgbD2J0hh+xgP04woKykZRkGnWOL6HMtC8rySt
	SUmNOrlAxukEd4TSpVjp8oR4gKo9IZ6RqsyYqbE=
X-Google-Smtp-Source: 
 ABdhPJxd504MFoTRxuAR/SrwxjSQfu/MN9tv8OB6RJn7IqSSp+N64Hadu2F/c+Q3IWIvV16cF7gygKLNms4Q6VfxFEg=
X-Received: by 2002:a17:902:cf4a:b0:161:64f4:52d8 with SMTP id
 e10-20020a170902cf4a00b0016164f452d8mr31393615plg.83.1653471493312; Wed, 25
 May 2022 02:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220524130724.15435-1-mikko.rapeli@bmw.de>
In-Reply-To: <20220524130724.15435-1-mikko.rapeli@bmw.de>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 25 May 2022 11:38:01 +0200
Message-ID: 
 <CAApg2=RDpk2JJZR+sFDQcDh6xuknt3UqSuDxNAmG55fw54PPHg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] cve-check: Fix report generation
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Marta Rybczynska <marta.rybczynska@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 09:38:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166110

On Tue, May 24, 2022 at 3:07 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> From: Marta Rybczynska <rybczynska@gmail.com>
>
> The addition of summary output caused two issues: error when building
> an image and the fact that JSON output was generated even when
> CVE_CHECK_FORMAT_JSON.
>

Hello Mikko,
This patch has been already picked up by Steve. We're waiting for
the final review now. It should land in dunfell (very) soon.

Kind regards,
Marta

