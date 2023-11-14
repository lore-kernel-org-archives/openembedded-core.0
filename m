Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89134C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 13:27:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.12447.1699968466738286276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 05:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CQjN+YQk;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5099184f8a3so7649876e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 05:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699968465; x=1700573265; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TioNahbCSy1ubadoiUJ2jfQB/Eg83Pp2ECw8VzWGf1k=;
        b=CQjN+YQkELOKRGobww5UdgcQPAL/WsqmCE7LLxsxQ9jT9cG/6VhJ2Kn5rAjHTMfhFy
         jk0OnSI1GyTPsjx0oWmM58xVKi4eQTh+RbUjL5lHRg4iPjAGvIaB+J+WXE7/fHDR55qZ
         DSlKfT/liQS8v8O6H1ujj0sNzGb19enGHpObf8aelXou3LGK08ZcNNy2odHqtuQjNHVm
         zciavPbRh4GP7oshaXL4thEZVBD8kNE6/3DkcD7RT1i0thVr6KQjat6WX++VR6cCIim4
         OZXjgkTQpbm7oN9r1U1hDdtZInY9kzasLLY9K9Hgn2BV5ixHJ5TC5PevEESCx7w69bBS
         XIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699968465; x=1700573265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TioNahbCSy1ubadoiUJ2jfQB/Eg83Pp2ECw8VzWGf1k=;
        b=vMyusJzmomYVVb0XPlIEHLtmv6wWwL6iPti0DzpxFJUEVz1CgyMOx/szXhG90rvgLG
         fMM9O3spBgZXTvI55l568YX7qylEc7waMo9X6hDeHApaaYy2dWtKU2o/5LgYvkni52lE
         G6J/thRw/vGjHKh/6fbYc4Ia7a6vQXzeSoIrbbnEg54z5UMOKjxpo3L38WpszbjaVes2
         JRJNvfcNW8oRncX9x+nP3qb9zxm72Bu4pTJKdEIZjXsLXbL3AQBsw8pfIcRMsh6ThgFR
         f97hIztcuEuxMBoBMxBim7j8iWCnEU5CmO4DABHf+tWfWWIBXxjprIzDYoojHhgMT/G1
         1atA==
X-Gm-Message-State: AOJu0YwjjRnBCtX2DLmIrqW4EPZ6wliaNtSO1Pt3d79rME3cHzepu5+j
	X/CvVjkhQyvShcm0EKFs94PIHYS891Gf4frdaRw=
X-Google-Smtp-Source: AGHT+IHmEN9z2cLmQCxcCj5VgKroye2JxqQnLOEYDbTLnYkJxn1Ku6Wl8vY5topivOcZsGpeNPdNvlliavjM7UP8akY=
X-Received: by 2002:a2e:8013:0:b0:2c5:1640:3c97 with SMTP id
 j19-20020a2e8013000000b002c516403c97mr1945021ljg.22.1699968464584; Tue, 14
 Nov 2023 05:27:44 -0800 (PST)
MIME-Version: 1.0
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
 <20231107152641.1043-8-jermain.horsman@nedap.com> <CANNYZj_KbgyoEnXe1F815bcjMO+H_s9k1RbPzbpcxOxfNwpQBQ@mail.gmail.com>
 <VI1PR10MB3182C867637E593F93D86C67F7A8A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB3182C867637E593F93D86C67F7A8A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Nov 2023 14:27:33 +0100
Message-ID: <CANNYZj9TbFnsh5C2ntG_POMd-Npsj2a0AgU2GF3tVEBqaJgEFw@mail.gmail.com>
Subject: Re: [OE-core] [RFC 6/7] bitbake-layers: Add default remote to layers-setup.json
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 13:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190505

On Wed, 8 Nov 2023 at 16:03, Jermain Horsman <jermain.horsman@nedap.com> wrote:
> This is certainly a possibility, there isn't really any issue with this,
> however, it will checkout using a detached head which can be a
> bit of an annoyance if you do a subsequent create-layers-setup
> as all the branches will have changed to 'HEAD' instead of their
> previous <branch> value.
>
> One could argue that the branch field could be dropped as well,
> it isn't really used currently, nor would it be used if we decide to
> use remote/branch.

I'm fine with that. Can you tweak the tools?

Alex

