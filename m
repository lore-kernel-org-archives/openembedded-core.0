Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B6DCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 09:25:06 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.2819.1761729903025960539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 02:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IzvTufwA;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4e8a25d96ecso109361931cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761729902; x=1762334702; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3RUcuE9W8NSoFgXNTk4fi/IoJ7eH6i8hEKePQ8UAD4=;
        b=IzvTufwAIb1aWOKMYQgrIwY/NtpxS4cJJGmORYx4b5WACGM4tkIiaxw6OS7QkgrZMZ
         2tj9IkiOPXz9j1AdeQeowTtie/JQNjfkG7CJg4ehM/FcwgVOMXG6m0zwPxVFCqva+yTp
         isdFLfZNvg08kmEP3h7t8Hv0HmvFNN4bcQ2dLnzih3/+3tbDS15Dlw9V8IviRE9IbQPb
         S3P6QHP65tEyfJoD9bLp3wNxm2tS/uu6K1YQQvlI0NV75I8lyyxtkbAcK8SrCT694lqM
         WM7npmpqtrSAyba7egcXEX+z34DRQM60Ef3VR248dUWr09E5d7ZG2BTQrrK62cRa/iIZ
         VrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761729902; x=1762334702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3RUcuE9W8NSoFgXNTk4fi/IoJ7eH6i8hEKePQ8UAD4=;
        b=eXj4n6Rm0OBGg98rVvdXBeOyk77Lkxcvtz0wR0zfJSCfqlThaEdoNwK0b88G7FBeHx
         J5TPHATx0UGe0FN6sQ5Y8uHSQzjzyUK4B+fCFIOVNIfXUqyf0GlMVZREwUaqLyZ867oU
         5Z52gmmcx+HCqurj4Y3g/9hBPc2jSoYX6xBq50gNl9JgplhekQg3ITsLZU8XZLZimP+J
         JIwpss0XCTgqxtSqkGK435EZj+hXU+nlAXMmgVKJYrWuLD3M4ZvOI7Y5x4h9WWbzCcSC
         kfJKh2wysqVNDo0zYmEXDxaRjYCdAEkzlusV7H+E9tamREZn4GTBmtu/o9d6Y7X/0tdx
         WEbA==
X-Gm-Message-State: AOJu0Yw9zbTzOBbY1aPhp6fH45Ws806SkPDIHY9TpIww2pF3mNkNgLaA
	BfPvBtNnaLvUoRERTvYnJNbhbyidN06uZNB3kp5mHbEtxB0+NV9IgyYYMT0wriCAEa8rWXqJhH+
	Ii9fDGswJg46E87gvunBcJg5068+1thjl/A==
X-Gm-Gg: ASbGnctM4wJe41j48AiA2XPw//MO3TAlG/8tgfPRhv752vCARJjRKkM6wkVEWOc4fTy
	jIPQ3IijGd+8ORW3hf2TxuDHwCDSmN3LeJLJp7MW26HwI+xBgxxDDR+G7Qd5g4JT2phAoAHqXy6
	TyhoFgv+z3OQ19oURxC9K6TLTuZDKeO1tYPZ19Hz/TV1Iq3xRVx4Oezj9/pHFMKVEXDLGWVE2UV
	9ZcFiwk2nXBW+IAOaDdbFUhkCfbC5ArLzSmzQZb34SUAAUZDFpHT22Hlxcfg0YcPVuoVsm+sfqX
	B4jWqkN9Y7SjFvJWINnqhFcc54DKq+C0a8tO2d1j6FoJ98ehkXZ+uUupzoBMEq5mWRGJ/K+F/Qf
	LMpD+D3cPOW0QGvzQyQ==
X-Google-Smtp-Source: AGHT+IH32Dpbrm9BEKm15j5Oekg60et+KBq6a4liaTr9/SLFlPtj3Fv+DuF1T1NshylEF24XD4gxiFZOhaoR4g7y+b4=
X-Received: by 2002:a05:622a:830f:b0:4ec:f49c:af11 with SMTP id
 d75a77b69052e-4ed15cd1a17mr24555071cf.46.1761729901978; Wed, 29 Oct 2025
 02:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <13053c3e-d249-52a2-5186-3dd43fe8a97d@crashcourse.ca>
In-Reply-To: <13053c3e-d249-52a2-5186-3dd43fe8a97d@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Oct 2025 10:24:50 +0100
X-Gm-Features: AWmQ_bkeF47PTRvkeWLq3z8CpCSyY0pU4N3CnAOpOFfOrOfnxVgy-GzjolAGT5Y
Message-ID: <CANNYZj8k7A_BuS=f_mEpSmoS7Hz8vQVujZ4sFGcqkpzKwVmjSg@mail.gmail.com>
Subject: Re: [OE-core] what is the point of setting "do_fetch[number_threads]"
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 09:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225436

On Tue, 28 Oct 2025 at 22:27, Robert P. J. Day via
lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
wrote:
> from here:
>
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#limiting-the-number-of-parallel-connections
>
> if parallel connections are already limited, what is the value in
> setting this? that should be explained in that section.

I guess you mean BB_NUMBER_THREADS, which limits the overall amount of
parrallel tasks bitbake runs. The do_fetch thing is specifically for
limiting fetch tasks. This is useful in situations where the build
machine can handle lots of tasks, but the (broken) network cannot, and
so the network access has to be limited to something smaller.

Alex

