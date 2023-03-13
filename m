Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56E2C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 17:38:41 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.491.1678729118965644601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 10:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eM06Ff/8;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id f16so13428077ljq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 10:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678729117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfW9/VCF8l9+STxDNEf/UO7SaUt7qOELtk9D/Ei+0+g=;
        b=eM06Ff/8NwvLRrGyv3WIoVe7yxZ3INngLljo9TTdN225hXDMPIf2/o8T0A+ebudrHA
         muYWOnHjXCQ/SowpVs2+HNgkgDZ+pjeBdQXTSv1WAymja37e42xOVzn0qXiwZsZzGrO+
         zf4LtSt6/snzECMkTtMyrTUn0hbk14acE+tWrkezu5bKIR+VPZMZBPE3B/4C3p+QDntD
         niGBXjL9CXnXGS9+L5ALGRoMze2UfjJb8P5hODUQ+HN6HsCHmdnwlOCCfbgfJX1+TX94
         bt/0psgncdi9Kxto/TlO6ZM0jskP3wgJZor04295qMQAtfq+4Hst+tP9G7ZQ/3sjU161
         7dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678729117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfW9/VCF8l9+STxDNEf/UO7SaUt7qOELtk9D/Ei+0+g=;
        b=e/0A2gR8LifU4ueoQSPj2xsjHOk6nt3cyLha9uQ8CQPCCUWvUFl5UxAI6WqdH2mErg
         R9nSZipGMkgHTWcnQ1oQIoB/PhX/1K33Ln+pvbE6mEW527wcO4WT3ggrjZlO91xa1wmA
         eUR7K1nRURaVKZbMAwjHoV7a+sBeDa7nD9zVFUZ3eIwwKfp2ElSwqP36eg7UXCQO/2jF
         2qKy/nZyvh2HLAdA9CW+6ivyVFj0RUWVuzA33T3nLp2taOrShd83SbNQShxwdGYNQZdI
         qwbRfYjuNe8z9nSQ0+HFYxLMDqfSgRpAKxXoJeHSsxVw3nazR4NcSxkAlk7FTS2GNxCk
         cq5g==
X-Gm-Message-State: AO0yUKVQL43UNxzZXg5RqYpibeHEnQ+hbx6zvGevFjqe2VomjlqYxv1N
	l91AEJ0VfWAck9wmLNNQ/ZLQPFBuFuAQFZYIxFo=
X-Google-Smtp-Source: AK7set9Er1yA2bt86CNqzE2GQAcQOAdQTWZPT1ZI8ddxWKGkgOO2fymSvAaPG4Te4LpV792LB+vjXoBf6Ge0u+xp6E4=
X-Received: by 2002:a2e:a912:0:b0:293:4ba5:f626 with SMTP id
 j18-20020a2ea912000000b002934ba5f626mr4623768ljq.2.1678729116967; Mon, 13 Mar
 2023 10:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678705654.git.Martin.Jansa@gmail.com> <CANNYZj_h7MMWxUpsiGre0Gn4_y_BB7qEfXNTotq-NjNYaB2OcQ@mail.gmail.com>
 <CA+chaQekyms-tvqDqAmMPqFcwHFqQFTTqYH+Vj=wmUdTR35gLQ@mail.gmail.com>
In-Reply-To: <CA+chaQekyms-tvqDqAmMPqFcwHFqQFTTqYH+Vj=wmUdTR35gLQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 18:38:25 +0100
Message-ID: <CANNYZj-7wgKRe1yNexHFM4xUTfSgA0Z79Fh4G5FURD638TsvvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/14] selftest improvements to respect IMAGE_LINK_NAME
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 17:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178461

On Mon, 13 Mar 2023 at 18:28, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Mon, Mar 13, 2023 at 6:26=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>>
>> Tests in distrodata that contact upstream servers had to be disabled
>> because it's not possible to tell what is a real failure, and what is
>> a transient upstream issue (with expired certificates or other network
>> issues). To ensure upstream version checks don't regress, I run them
>> manually every now and then.
>
>
> Thanks, can you confirm that git-submodule-test is currently failing for =
you (and probably was for long time) and
> that binutils is often reporting failure?

I run the check (basically 'devtool check-upgrade-status' with a
manual review of what it prints) without meta-selftest included into
the build, but I can try that if you want.

binutils is flaky, yes. The server is contacted mutliple times for
various flavours of it, and some kind of silly rate limiting kicks in.
If you run a standaline 'devtool check-upgrade-status binutils', it
will work.

Alex

