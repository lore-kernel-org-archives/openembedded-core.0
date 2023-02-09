Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8D6C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 10:53:21 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.11611.1675939994077428135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 02:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RSrTm/hS;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id b16so1562190ljr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 02:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+hqRN3BkXj1B3fKy9OxI+wRkhaLSstbI1CZRO93pszg=;
        b=RSrTm/hShY2103sHYG2cLAW2L20TseDtZiiENtsNeWN2x9BHTdg6hrbhDAcHPeG5He
         Isd+u3eJYaCtdaR+cjxU45Fjdx2jGT2cJUWD8iMVIlXxLP/HlhD2hpIbKcjo/3Yqr9M3
         qvVeF6qliWZo8W0fwT9Uj8voAvkkX/pVnvWn2fwqQvIx8J/q6VYaMgyiWVxxVIymvZ+S
         gDc6EBjaHr0OOdFpS92IkMC2lgX+DQpbKFLuuomNHhW9zagSFiVMV0Sjm4aE1zscXhMx
         8/mDTMz1pnwN9oCk4JqNKL/msrGRzNHzVZ9JoLx0WYgIOGGJPxU9zcbMTrB3vjFRrpDw
         Aaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hqRN3BkXj1B3fKy9OxI+wRkhaLSstbI1CZRO93pszg=;
        b=WB/x4XdM5Q+MVidLWq6TZV0Cdn8JxoqyKK5/HeA4rDUna0JAEwSHLpK7qwvMk+tyHt
         p0AekyeR/NlmigTn7xOFU6hYqEhbFU91yBUxVrJQBqK75n9GxW/Ghg9rE3eiL1a426X+
         h1UXCVfIwxQOMCYM1HKwr9E53ssvPtOdCcdSVTaOCQBfPIxI5Afe0/QChPc7l1qcvUCZ
         CsMSNPQSZvy654K3H5VhTjzA2qJaaMHJXjANf/Yw8scopIxI18K4rdmAHcU2GMmDAwzn
         M6tZPhztpghACtHNPGoG4lYzvguBf58K+lO7nBJpwHm2ExSVqH+IR6njJVNt4QH5LHKJ
         TUww==
X-Gm-Message-State: AO0yUKXsD4bJxWWzAIYQtd0vfGZwEb+hBMISIrLs7IjH6u3/yfqV9PoZ
	6+txgtJkVfhodUaNwJk7Ujq4FKHbou9vMeitqb0=
X-Google-Smtp-Source: AK7set8x6uUI/ar3aH39BYkDISYcEQJMHuRba1uFfBXXRJrXHCSZaNT/CJDL9AtFKxzK2qK8nTuSJxEEQHvuiRemc8M=
X-Received: by 2002:a05:651c:1054:b0:293:341d:b765 with SMTP id
 x20-20020a05651c105400b00293341db765mr73209ljm.90.1675939992032; Thu, 09 Feb
 2023 02:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
 <20230209080936.148489-3-mikko.rapeli@linaro.org> <b9dd7731ad6e5e5bbe2a061f87c2d2452ca6524f.camel@linuxfoundation.org>
 <Y+S+g0W4NZ+0zd5g@nuoska>
In-Reply-To: <Y+S+g0W4NZ+0zd5g@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Feb 2023 11:53:00 +0100
Message-ID: <CANNYZj9Hr2AZSuXutfF8kktatFt-AmsYT2bp9oauOLLFonQ5wQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/8] oeqa ssh.py: fix hangs in run()
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176942

On Thu, 9 Feb 2023 at 10:36, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> I think sleep() is ok in this case to reduce busy looping over serial
> console and read() more data than what select() initially saw. Reading
> single character at a time is a bit silly and just wastes CPU time when
> we don't need ms level accuracy.

Something doesn't compute here. The writer should be sending data in
chunks, and there are buffers all the way to the reader, so where does
the splitting into single characters happen?

Alex

