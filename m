Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4453BC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:43:39 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.44692.1747993418050707519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W94ovyU9;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fa980d05a8so2319426d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747993417; x=1748598217; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6auQOyXw4U8y8j9HLZUt01TvNxgQUu8eDxALj1zF0AY=;
        b=W94ovyU9QOUu9qP/K6LVqCX3FVTxmsFkwmLvU0OQI2DJZTdbBQN+ykJJy4Bodb2DDi
         O+3Zn5nRBB8W8h3WnaV8ypm9+3nZ3kCJ5NbN3Le8/6F78u46fDgWj+qg1FwzIQA2AoL9
         L61DVxXEG+XML/0whAVy22EPN1AG2zhNb15oyiUrTNg6cgE3oIV8h3Z7xqEjmehfSC5r
         +dB7LpFG/W553MAAXp9LlHzK2bFUIPkgVOkSaAdU2w2RnFbtpvhmZYVfKDVMAuWOf3xR
         QpjuEw+3fx7xG6pURljOX5bOjGImhfpqU7C5bS0pxm5Z3ZBmW1pn8zp3OGQWAm04uhUm
         rjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993417; x=1748598217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6auQOyXw4U8y8j9HLZUt01TvNxgQUu8eDxALj1zF0AY=;
        b=FF1mU0Nf6+aV/AbbYYSr7EhDF4EENVi73kYQ2b2ki+Da9XO9bsIlLPN/BPjY8O0U6q
         2aypc6U97WVprwtTt8cCqwekXMFKR+VX+o6LE6zGzDkl3v+J8qDzbpOK97UpB2KNnMAf
         ur7vPnDn9GOqHqZglRARNjnCZ8pFimlvUoT2IeUvU7XsrtotC8vInThOdxZPNDI9/Kp7
         LdOGEgG5GqkRmiI8b5mwl9YN6EErnEsksaJDbUgP6e7ss9V2lZDdxOlzw5vVWukqN7XB
         3vqFCtJ9ECUqcEKGIgUEGtTyxqPXJjxCxt6yyuAl5QOt4y9HVnjUUPakMvXcjJfxsfI4
         7Cow==
X-Gm-Message-State: AOJu0YzECvnlTiLRaUTtCHeFl2jVFS2otK+tI6nTQ6wQTt6B7RKwd2VE
	epLq43VK/RGGt+9t3CB4ahXGA7nu/MxlD4qhl0I5TFnADznAXKpAcQ+o3bbY/9j+TRpPczoG1F/
	qXJ3Sg8wFTjnGED63scBiBbslR/Am+ug=
X-Gm-Gg: ASbGncu+s6wjczlmfRBfiPGsu4MsIdo7sCBtPtqIaSIlrkYlXx0yx4gZNU+atNGRsHw
	CC7yiBC2IKaqPb11kxNWTzudtek0AQLzDTO1/M8CglM2roPdS9qJ9sseBTIkwZk8D8exHPGOd9r
	8kSEznOYXVkchWyYVRNLQmeTQIfeMFOuOB3A==
X-Google-Smtp-Source: AGHT+IEIGp0qttwDWGczCYxflVGQFSQtpOlM5Xit5mbt0cZ3GiyRZ1XlOMqOqWdHqoiMMkEqsE6eaMyh7T6/QeW83LA=
X-Received: by 2002:a05:6214:5182:b0:6f8:a667:2957 with SMTP id
 6a1803df08f44-6f8b0841277mr452580236d6.10.1747993417070; Fri, 23 May 2025
 02:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <HrS5.1747939211095331723.J22A@lists.openembedded.org> <f48d6366-07bf-442c-8d2f-96a826faf946@gmail.com>
In-Reply-To: <f48d6366-07bf-442c-8d2f-96a826faf946@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 May 2025 11:43:26 +0200
X-Gm-Features: AX0GCFsK-gpwlCy1nB8Icz6XZRK3zkjLA1WnKHadg-TCrLd8osaMio-rA0UX5OE
Message-ID: <CANNYZj94XmoK1iec4mcJhEiArQJ22RGRpFE2EvjX_2JMBP81MA@mail.gmail.com>
Subject: Re: [OE-core] ca-certificates: postinst shift count out of range error
To: wxbet@proton.me
Cc: openembedded-core@lists.openembedded.org, skandigraun@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217203

On Fri, 23 May 2025 at 11:41, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
> I think it should be either the slash at the end, of maybe something
> like this:
>
> [ -n "$D" ] && sysroot_args="--sysroot $D"
> $D${sbindir}/update-ca-certificates $sysroot_args
>
> To me, the below conditional shifting seems a bit like hiding a user error.

Yes, we should fix the postinst. Can you prepare a patch?

Alex

