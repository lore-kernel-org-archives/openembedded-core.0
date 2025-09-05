Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52570CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 10:43:06 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.18569.1757068983305731195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 03:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qabs6qyC;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7f04816589bso211789785a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 03:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757068982; x=1757673782; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AH6se/I4q1XSSd7dSYGQDNR45cbScdl1EVQvqtkNoMM=;
        b=Qabs6qyCLnj7An26j39z034ForjyOesGIDxNvEQMhQDl80JjbZ8v4uigDJS2ZhnAL9
         6OnGsC7S9cbQOMvvwLK1GGzfja5PwiNEUYFoWOqh5WshKIBCXH5w+qo8qqKDOAVw97E9
         Pwgi581B7xZgRbAdcz3trNZ7d/mG3Q3HAPRC7jTFEycitq8vsD0NjpnKQXmoa6pL2z95
         1qSJf4a6eRVyFs7bZ7c7ZEXWv0VkraHDIWCBcATSeucCGpMFwVOj2QR6+nCrD8jvUODy
         rItcMqaDQKg7L4Lmb/vGiFITLBdVlYrtnCTSfuucYsQlXOfZIRLFGMfwenOA6NDf8nqi
         0Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068982; x=1757673782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AH6se/I4q1XSSd7dSYGQDNR45cbScdl1EVQvqtkNoMM=;
        b=kqwC15vCKHZlAcvrSJPCyacMQvFsixWRJ6+nJ0w9nM4sgWE2tHzevOCg/osolJao07
         RCpBhussE6hqwpvb0825+2oZQcQiI3Kov5ImwNkkZj+a0wwObIUqY05UeEkB+vE4El5t
         emovkEUNnSJQKO7jSY6Uq6Gc/n5YZvaabJgvlAfak5xhT3Oq3PhZYzqm1N2cKV5fGrGK
         0GKkgzDYuH8L+soL4tQ90/Ud1D6B9n4ZWTTjDBUTeO43x+ICblOF9kLZi4Gvfoedh3Wk
         JukTPeMB4y41VQbttw5BXYGDeiHXlKuoKank0q1bMeCQ50ZwvH7hvCiptkFlhUio0J7f
         zzQg==
X-Gm-Message-State: AOJu0YzVAgXn7WZvgyq0NgeOz5klYWQEEduWAQFm8HsDS2i22LY4hVPN
	gIcR8Us6cP+mAxG/MHBidrbmY0iOv7PAna/z+/EpFGHjXmQ6rzSWLtPy5CIDEuDG0c7eZivIkJM
	NGRqniezNtQMkdjzwVop/V1afs5WTHfU=
X-Gm-Gg: ASbGncur6Eb9SGIMjz8mnS9Aqgo67qrAnHQUhsrhYHUDE4jLnFtv4DpKADKMcOL8qEW
	SMCiwZjUt+DVoeUpHULdFPetgzG0s7daxigIGJBqpapP7PQEoDRnipFY1S4X4xyivoeJ+DQXmZg
	5npd/Luh4tggrLRpDXZmqh/qTGffmMCBz4vDxuGEIR+H8fo8Sz7huDo/76413o7WcWwQTWm2tCJ
	W0ZJUUNlJgqSLSk8GnGmmblQJHhryRIqtAVQw86Xi4b/xrY2Yh23cgJlehcJG/aWLTKfxIkeUoY
	afj1sZ0USA48MLTlwvUkX+syICobvhkr4T+pY+4fgVk9iKLM97I=
X-Google-Smtp-Source: AGHT+IHgKVP7mF1SyS5LxaNv7yeVlqbLN6PBtP8VA5mPtuBe2bZ2nV+W4mzzWeoyFXq3dMwK1IQF3yypE4cDOuvkneA=
X-Received: by 2002:a05:620a:1a21:b0:7e8:74d:fdf5 with SMTP id
 af79cd13be357-7ff26f9fd2fmr2515385385a.4.1757068982236; Fri, 05 Sep 2025
 03:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
 <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com>
 <108f0edd-3a59-4b2f-86a0-7afc439c884f@windriver.com> <CANNYZj_z3UwqgYqmvUYBG+c2iANjib9=6CZYapi1zCjycN_4cA@mail.gmail.com>
 <e038f529-1c06-408a-8d28-b2ec6bc6d17f@windriver.com> <CANNYZj-5sNQq04T5fBj92TSUDdcLT3+_u+uvDveO1g-ZJNL+wQ@mail.gmail.com>
 <485684fb-3efd-4563-b9f7-395002c85d58@windriver.com>
In-Reply-To: <485684fb-3efd-4563-b9f7-395002c85d58@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Sep 2025 12:42:51 +0200
X-Gm-Features: Ac12FXwQ8zGsMcPBDdyxTpJhuSmfYM-GXDN2LSqf2QrPkUAmaAi-WNcDvaWhL7U
Message-ID: <CANNYZj-qwsXYwkThcwytee7v44wtZdEJ58Wj1QDWzR__k4rLXg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 10:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222985

On Fri, 5 Sept 2025 at 12:38, Yan, Haixiao (CN)
<haixiao.yan.cn@windriver.com> wrote:
> > Thanks. But why set -eu is used to begin with?
> We are following the industry best practices for example
> https://sharats.me/posts/shell-script-best-practices/ =E2=80=94 The Shara=
t's
> points #4 and #5.

Right. But then why not also add 'set -eu' to the beginning of all of
these scripts, so it's enforced, and prevents future regressions? If
you agree, can you add a second commit and resend?

Alex

