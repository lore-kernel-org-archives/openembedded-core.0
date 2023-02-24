Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126FCC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:13:39 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.14486.1677233612378400168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 02:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kFFsVSLR;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id z5so13656953ljc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677233610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9+PqAvmynW/CQHpCHDhD+MQmpdP07pJXvvqCz4uq3s=;
        b=kFFsVSLRJoRaOzfyLh6gH3t0ae64I5VjmczWrqDmPd8176LyhQqx0rjsCQFaheHPGK
         WmMfiUsvjx2OCA7jIAQxo8Gg7eZBNkICi0EuvsQylQyeMwL0Hl5Fi/iBIIoMcVyYfn1U
         pxgU0GodKhW8f5DOhTd5EFaXlm8ZdavsY/eWEwoR0PchfQSgvsBH3lqCL6qw0GrHbE2V
         baa0mr8gjok8cJee5Qvv+mzWLAMscC458hFRcGPqqs+4t2iSipNFFZM3DEVPz+U2Hvn5
         0o06zRC4u6cVHv87cOgz2ivqqYGx21YbUlIESM6gqAprHFTren8zJa3zMFtd+Uwbdcyz
         ROzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677233610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9+PqAvmynW/CQHpCHDhD+MQmpdP07pJXvvqCz4uq3s=;
        b=3tPSRoNf3v2QgzUe1IS6SJnnjQRoPnmAvNi0bHtyz8qYNSrgO22+Yj9/V4mp7cJtG4
         HdK+pGoGMGWU08LVfT33juaBsnsTohs+gXW+XsiLYZM6/ug8FAj4+EYrHPuL29yTPgQM
         7Gwq+UfgL74+SULDZAZ9h5s8ugrRYu/RbyZ0toDftRYyijbL0JPm87r2lMNLrJpHNg7C
         jlnBlVsRvC8IsULUyE8JuKhUb+1W+y2cot20+CDgs5ogj5QTEY+Fg1O88pH4Xo4MALia
         voH761qhara2KTC3NG8IxChdAe/sd+AHADG5w3SrFOWI1H99wYf/qozcgzOQ9fgSg+vl
         K9vg==
X-Gm-Message-State: AO0yUKV9O/9nO8pvq3ICUDgTf0jke2pM4C+SOKJtr4IgjVhcs1QVGD7d
	MallB4I16R2hm5WLLHwbgWmo9u+xhQ2AMDuMEYQ=
X-Google-Smtp-Source: AK7set8bUzI8ULjoq7mF6cjisGR0t/UnfUDB7kYiFc0CE4LkKpJkJ8eXHYV2VoWIiL9Cm/FQ50vTpoSTDzLDQhEvaA4=
X-Received: by 2002:a2e:aa1f:0:b0:295:a32a:3664 with SMTP id
 bf31-20020a2eaa1f000000b00295a32a3664mr983780ljb.5.1677233610514; Fri, 24 Feb
 2023 02:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <CANNYZj-Cuande0w6CpviwoKWO4wT2pu6JOjzKPaCGAxLkFNatg@mail.gmail.com>
 <af312db7-d1cb-499f-4574-1a13da64d01c@gmail.com>
In-Reply-To: <af312db7-d1cb-499f-4574-1a13da64d01c@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Feb 2023 11:13:19 +0100
Message-ID: <CANNYZj_0+y46d7k8xkXAmhi8sHfi37YjG=PuSR37mqzHqFbA7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] bindgen-cli: Add new recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 10:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177673

On Fri, 24 Feb 2023 at 10:59, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2023. 02. 24. 10:44 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > As this is needed only for rusticl, and that is switched off by
> > default, there is no need for the recipe to be in core. I'd say
> > meta-oe is a better location.
>
> Why?
>
> Rust itself is in OE-core for a while now and
> bindgen is practically an integral part of Rust
> if it's to be interfaced with C/C++.

That is not enough for inclusion into core. It either needs to be
useful in a typical, common embedded use case, or be a hard depenency
of such an item. So it has only one consumer, rusticl, and even that
is not enabled by default or broadly useful.

Keep in mind that maintainer capacity is not infinite, we're all
volunteers except RP.

Alex

