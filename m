Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1C2C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 11:50:49 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.9087.1690372245269169324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 04:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P36l5kg2;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso8973401fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 04:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690372243; x=1690977043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XBCiLFJvJDHpzOSW4QEZVpNuUMyAmuVvrzr9Cx1eX58=;
        b=P36l5kg2njd9mt+I/YPAWew77hE6/Z1DbBOGb+N14/qS5HfJBH3WmS8UIv7svGIkDQ
         6CsDynsAOqfulM/7v1GJzP/bgACUBJ5MPBpSNyrCA9t9hxTJUFnliRytD8VsAt2786H6
         su+D0YrFfhjYT+GLqCbNbMAX5qWTrUOu0ok7ozcmbLx9BSEEHt0ya0XlAauPpUURJMQF
         nKWJTUfwQfmDqE3ezQxXjg8fq2QVtxzAC8rjPxRhexxGNPch1bNghq2Hyycu46bOHYXh
         K47bTqpMzRTKCMgxkyfy0fCPXSoYhhZvASLZVWa5oalcNt8XYVVLq67sx21k8YM+oiM5
         6gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690372243; x=1690977043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBCiLFJvJDHpzOSW4QEZVpNuUMyAmuVvrzr9Cx1eX58=;
        b=QDUkztzeL++3RANU/fR70TrlQohy2thiwdPB3rywdlpHMHokvOYKEQ5tw4XGj7F4nK
         xlksQfnnZrdAGhJUV5i4AzvZMKusXAcHRwoxYjvCoSvFq9EBXgxFW5wq5MK1uo3hIlTJ
         Fnq4n94cfNuOB8T/LyXk7BoDhDMQk9eAl7aXvcFucAESC3cDagQoCJj66+N4vP3eZEs0
         b+dTz8zg65x1Ptkx5BS3flc+nS38pWeGwjDV+1/+NLT/wp1vC1MvvHLq97C+hYDaCBiR
         7/B+wZQGIdRPJoME0zSCMh/I+D0u1ARhrX1ODBhpExBlZ7ZHBiqtDXPeaGRzhnl6HFG8
         9lIw==
X-Gm-Message-State: ABy/qLatJ8NTZVkX0HcmxX3DZRdttlvYT9OflDvz+gH5qUwXmuNEbffr
	cV1HPjfra3S29+QeYCEG+i6Y3g2DE5ewyqq8vjQ=
X-Google-Smtp-Source: APBJJlE+6+75Hsk/bPnjKOPa+7niGZd+J+lAb06XUSAUpxxmmjZNhJzTtmbslgMf2WzQzOhGQQ71WML/+VIH+kXyEuU=
X-Received: by 2002:a2e:8455:0:b0:2b9:3883:a765 with SMTP id
 u21-20020a2e8455000000b002b93883a765mr1326849ljh.31.1690372242916; Wed, 26
 Jul 2023 04:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230726110946.129932-1-enrico.scholz@sigma-chemnitz.de>
 <CANNYZj_kQcXA6hfDJBCMrE9DjP5dkoHsFwozzM5oKpuMzecNyw@mail.gmail.com> <ly1qguvr0c.fsf@ensc-pc.intern.sigma-chemnitz.de>
In-Reply-To: <ly1qguvr0c.fsf@ensc-pc.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Jul 2023 13:50:31 +0200
Message-ID: <CANNYZj_AoYEoVWgJ35mxMKj=xgcysP9HzVQT39DG=HFYcR6rNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe.data: allow to mask out secret variables
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 11:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184880

On Wed, 26 Jul 2023 at 13:42, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:> > it's better to just scrub
them prior to publishing with a post-script.>
> Else, there are sometimes not many ways to work without them.
> E.g. SSTATE_MIRRORS has contain the secret token because it is used
> directly by bitbake; perhaps I could use a wget wrapper and write a
> custom curl python class...

Yes, the secret needs to be in a file (or other access-controlled
facility), and read from it by the process that needs it, and only
directly prior to using it. Having it in a bitbake variable which gets
passed through a million tasks and components is a terrible idea, and
I do not want to validate it by having a 'secret' flag. Sorry, still
no.

Alex

