Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBE0C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 18:31:45 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.71.1646418704245803541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=At5lIN8m;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id s6so4786789qtc.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hvWCxCVux+xV8ZUNLYpuPHzVxzrWb92pJQxSlB0cL90=;
        b=At5lIN8maTmCfsNn750uejoFfU0KgM16/fyckVmHUK54FcbLWukV4RNyCoqWo5noa/
         7yj7vorYCj169GwFGicsEAnx07R3w0HYTCXv0ktm/Aifc3xai/nLtVDGerYC9/LoBSBh
         yKXgueanD+upJjM+bmnIS7iAChV7f9QQaV7222cuRV1I1qgIe2aVGOEgD8O0rEGqTy62
         TJD04QeOxcegR3BZoW7L7zGMNqkhZ3ABA5OuzxDWYFxn12K+VL+f7r2+RZuN06QVvMS4
         DQmdvfg33cebpR73vvpNNRshkr3p8VqPSQxqisCh+qN8WYoKcv+h1scCMJU4VNErQvbw
         sI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hvWCxCVux+xV8ZUNLYpuPHzVxzrWb92pJQxSlB0cL90=;
        b=1uGfwAfa4WQeZeYoU7q7Z7EjHm9bl+ExVYGEM0+DmnZn9AMVC4cW5n7CZhC/43GM8x
         n308UnQkAoQbRWktTGHOFF1KR6ewxJ4GlE75s7Mhdhum36k/GnamF+TPz0Ijt9jt0t9a
         8SKRTLimisQ0mzZmzLm4+P2LipgTnja86C+0BDHiu4OtJCt47t6tEu+CUoCnIwBE1MGs
         mJVBNKOZbvryO30hv/NTp2NlDdx3l3jHj8wBv/dRYaJVamo5LRtKrg3ywx+/e16mz0TI
         jWJixU90JzjlbS/etddVdXyJBmhwsen2oawFTclSFh2lPkI8LSBU03UkBsWmqPxSKGfh
         op2Q==
X-Gm-Message-State: AOAM533I24lr2dIDkGGYkCT+2S6KkKms+qNQTY3nqTDa1gWMtmm/+IyR
	MEB8PqcjUSzdjr8ETBrmY9D4/Nzph+ra4AYKai0=
X-Google-Smtp-Source: 
 ABdhPJzw3KVzRWozE8H4+mG+woM/tISxyjZSXdgKX6HttfUKmj0W9cbA6ghpp2adE0fJ/QKuznYMPPC2bQ6/dEC5vmY=
X-Received: by 2002:ac8:7dd1:0:b0:2de:600:a5ab with SMTP id
 c17-20020ac87dd1000000b002de0600a5abmr35070qte.532.1646418703349; Fri, 04 Mar
 2022 10:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20220304115525.2240283-1-ross.burton@arm.com>
 <AM9PR09MB4642E1F4D179551C41AB9217A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTugRrDfDxwEKXfbHRM5DznThMN3_jiiTLZ4Nr6J5o_M+Q@mail.gmail.com>
 <AM9PR09MB46429EC89803B44A66B82D44A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1spt8JqUnosr8n6T2bja9BRvvoH6KKJn7rNLjaBgi0UsEQ@mail.gmail.com>
 <CAP9ODKrZT9A=fdjUekvAHEch9LFjNt3mnH+jnGXGK0DR0BOvww@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKrZT9A=fdjUekvAHEch9LFjNt3mnH+jnGXGK0DR0BOvww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 10:31:17 -0800
Message-ID: 
 <CAMKF1sqTJVCRTVKAUmLR3=wT835FB2QGhnnZZBwQ33q4FandQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add setuptools3_legacy
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Konrad Weihmann <kweihmann@outlook.com>, Ross Burton <ross@burtonini.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 18:31:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162753

On Fri, Mar 4, 2022 at 10:01 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
>
>
> Em sex., 4 de mar. de 2022 =C3=A0s 13:56, Khem Raj <raj.khem@gmail.com> e=
screveu:
>>
>> There are recipes in meta-oe and meta-python which would need this
>> and both layer only list core as sole dependency, if we put it in either=
 of
>> these layers, then one will depend on other which is not nice, so I rath=
er
>> would prefer it in core.
>
>
> Couldn't those recipes (depending on Python) go to meta-python?

not without making meta-python as core dependency for meta-oe, its
better to keep them
independent.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

