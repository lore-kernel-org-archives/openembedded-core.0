Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFEAC35FF3
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 14:52:32 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.302.1742309547101933922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 07:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JT3lvJcR;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8f6970326so49411436d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742309546; x=1742914346; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Deuzggcr+AeI4e4xH+qY61p8HSC4Yh8k3rYwTRB1qig=;
        b=JT3lvJcRXcDzvp1j4Xz/QpPtQmvPm4n9szwmLFZpHN/E135VZ28w/cmr1OHmdvfihf
         XNh3oqQhRop4CZQr6e8hy5GEdK8cCR7d4jtrmwRcro8YWhj7PQ8oSvL7qrB4KhoOFgQC
         3ucTLcZjeiQQmhxAXul1IUf+FM7wFhPYh3pDUaYahoPV2MvGswDfxe786qj0ueM2MdeB
         ycyEk/jFOpO4H0zkCIL4SoZiPOj+/O3PX0iQPhvsTRYmEqFP0z9aGNoYlIA3Q5ScvhQW
         eyM6H5KemD34T3uz2KWzLYpEQSo7vJ2Qch8kBRXg/im17hQT+PBW8n3RAB13jJXihX7c
         LbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309546; x=1742914346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Deuzggcr+AeI4e4xH+qY61p8HSC4Yh8k3rYwTRB1qig=;
        b=RIBTe7w2YHbvkg2fmnhNCjBDpHH7VCUfoXwcUivmaw4uLEQ/xlHrKchZCTcJxcv19N
         H6DAvl880ezxR371NocsS7J7N8uvg4z2uMl2MBkbKPIt1UJVwKu++TEy5En6w/vOdYZ8
         OetndGHKZT11hcnm5zurn4GokCyg8ECERtMnWXua2ZJ6yHDtSpZVc3NzlyZvdj7wKWEx
         S3lAYCxUwId5WCw7l6O9wP0SmhkOxIGpd/8byGIJWOMLNRqouGcIn58NYOng87DzVJ6B
         8C8Fr0sbrjiQoTohhVQSNdgXN69fMcz4L2HNOUK2aBP1QSnbmjcgu8Fp1lbbgeL/B5Pg
         aptQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNUAVzsdo4bHzmsuUuBFn/jEpTBJGLB3SKM0ZKGmOkwrQX7Ik1KGbufXT1xKg3yqxA3WEmp4qIW1Z+93isBx6wwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxzoe30tRSYGbGP+tCZLtzHBCOBWqLFJ075O6DMXxkyGHpCLsX/
	xFzcXqkcba6L9LtDHC6wKzVl9NlE09TmWIVZB7N6Wq45JyIk1Bahy/tCB/I9bpRBg6uft14JoFK
	8Olfn69DzWOGAQxPJXWAE7AEAdng=
X-Gm-Gg: ASbGnctJG7Lej3VFyR0pZEM2b4NLI0ujcgcSufJhZuatrN8FBoxbgvYUIcWDcF216jY
	WUW3pUjVWCs3Yygg4ZuNveVsXd68esXbuaMXzuSVZRbfyW4Rp5E0Itm6YH7U2sD60WJpgEWqhXp
	ErZtTNpW/L4jszidEUpdopniqoEd1UYDU+GuKCf1Uy9QVz7v5uLJFOUoYo/ULM
X-Google-Smtp-Source: AGHT+IHWE3POcMFsMSDNPjRakyqO0a28CLQhHJtXCj+2kyVot1MfZfc46oMsvn5lK7E4Fe0mhKXqD7gqizrj6ld7b1I=
X-Received: by 2002:a05:6214:5018:b0:6e8:89e8:bd25 with SMTP id
 6a1803df08f44-6eb1b961f3cmr43710386d6.43.1742309546138; Tue, 18 Mar 2025
 07:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb_0c9XR8HxMNUWSyenvhYmrO8kOOqQfSrOVCe8B1X5m0g@mail.gmail.com>
In-Reply-To: <CAK5yBb_0c9XR8HxMNUWSyenvhYmrO8kOOqQfSrOVCe8B1X5m0g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 15:52:15 +0100
X-Gm-Features: AQ5f1JoR3mO21KKU5GS-VSfwSS2fOfBbVrU_naxO0E9P5TNWDTeKG2ovlwsxQoM
Message-ID: <CANNYZj96wAqwXi=1WQBMFMCoZ5MPYK2=6bJp9X8aC+GtFUtH0Q@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 18 Mar. 2025 (WW12)
To: sjolley.yp.pm@gmail.com
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 14:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213217

On Tue, 18 Mar 2025 at 15:44, Stephen Jolley via
lists.openembedded.org
<sjolley.yp.pm=gmail.com@lists.openembedded.org> wrote:
> Next Team Meetings:
> Bug Triage meeting Thursday Mar.20th 7:30 am PST (https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
> Weekly Project Engineering Sync Tuesday Mar. 18th 8 am PST (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)

The patch review meetings should be added here?

Alex

