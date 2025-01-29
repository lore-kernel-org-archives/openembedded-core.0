Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191F6C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 05:37:04 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.6852.1738129014025948416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 21:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PnfrhG6a;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd16e1cfa1so50691066d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 21:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738129013; x=1738733813; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aBh80HV8T6kw/I1cN3fg8otPQwvm72IHaFlGDluERQY=;
        b=PnfrhG6aaPzGLvQ7VjiZ0gWojg/HxHmGRkSluEXMWUz2g8k6ANY+lEyxOrY5xAMZUK
         OnS0thL5EYfAiUz1vjNQHmqmx7p8bvMNimSWm3XKaxntrVWJ/Pv2SpzBIQiP/OuXWh83
         GOgTNx6fMmDgIg1tKIDxpkFKglEHW4wJ/erfVd+HRGRg0ryiBT9L/nXHT4PGcSOvviOa
         eOfEA4QEom0Lk/B8ZWG+9YL206iaATN7Rmc5qEw9BnbCbjz+DspAN/IpUMlRuQN0dP+Z
         yqSiTY38HXZZssp2ybFFxFc/YOuT8UTcStUQ721+tEwhMrZJ5vrqv6oZ5EDm1ZhJpRQZ
         R8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738129013; x=1738733813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBh80HV8T6kw/I1cN3fg8otPQwvm72IHaFlGDluERQY=;
        b=BHMTz6xJ525APi3rrGoUhX8cnlPTW2WTbLm+7atUm7dWMSBQm4PL2r7T/ySCSg84Zc
         MmUIk4vkVxRp+D1BYn78d1oHAv9MHkWsYY/oHHMp1eekZr+7toi52MYLOlf1KPkvoyzD
         9VtMMYHVTaqFeDHbKtFDMSE79Mjyin3Mvy4N71PxGarFnGQaYHv00vUFloT8wi7Y2U1v
         +ne8CFWSgqmBaj5R7l/Y67mgR3EYtvuLJiRXGZpcAXL9vzpnF6psdrbxd33WIZTHZy0E
         zr8yR9ZnqtczQBda/KyV53wylrwkX92u0hsJqACwTYYBMSNWsg+DgW7hyeVvu0ogdpOh
         3hNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6jDUreE24BDTdjoHPMtM+6L66e1AMHwESFtHnuNQWfkyclYlL6pbwfmHAO8PvW6mmGJbEUpKqPgwzdc+/jkQ8dA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwtGqiXNO63/Ac1s8B07thtqNST+ZCiE8uam/PUFp5QQq2V6Sy0
	uWhayyzcLqEhMr5WspdId/ow00T/u86r98JXsguv4o6XZHSIAIRYxmOKG00LDomjqAIARbKuaAL
	TfgSzsSteBcyCh8XKArAUnP8fg4k=
X-Gm-Gg: ASbGnctPLE7SuT9582edvAdJN7677Jy1cqPCD74/M2cFGM3cKujtesFp8MgrjCOXUtP
	9uRe2dRI/udlYDRC9kFToZPOq4k1M8jgovyf3soTGcFba3kbvsUDGZp2MdEOg5KfVr8UX6Obxae
	dFc0qc2X9syl3hdV9lgYaiFUugTMIgfDU=
X-Google-Smtp-Source: AGHT+IFpxSUtNYK/yBpsXeKXmSIOwIkt/aKdTojSu5GdL2Lj6eWxyCuPgTA1AO+9QhZCBR7ijWOnIVDyratBsFAysuc=
X-Received: by 2002:a05:6214:21eb:b0:6e1:a36b:3445 with SMTP id
 6a1803df08f44-6e243bf2c20mr28702846d6.19.1738129012995; Tue, 28 Jan 2025
 21:36:52 -0800 (PST)
MIME-Version: 1.0
References: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
 <CANNYZj-CNT8_yXKLB6PApG=Mknx=TKz2TAosgh17LiH1LQ0_fg@mail.gmail.com>
 <f8de4060-bba3-4a5c-93f5-eb4685223a73@gmail.com> <CANNYZj-tW3k01HstKJymLz4A9WOmMY6EhugyrhzZVEoH96pHkg@mail.gmail.com>
 <ef779855-5513-44b6-8b85-f4c07fa69756@gmail.com> <0a4e3939-3361-4656-956f-ae11af7998ac@windriver.com>
In-Reply-To: <0a4e3939-3361-4656-956f-ae11af7998ac@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 06:36:42 +0100
X-Gm-Features: AWEUYZnB6_0rGqZRa1qTcZVY1NMrmxaPbjz1vBDFsN0yiFbQ8LRpGJpjJtG9M2k
Message-ID: <CANNYZj-DWb5SjEOguzTYgteQ5=rV6wpNuQzpm8+mGniS6ZN2uA@mail.gmail.com>
Subject: Re: [OE-core] RPM signing errors in Yocto master
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: zboszor@gmail.com, openembedded-core@lists.openembedded.org, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 05:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210345

On Tue, 28 Jan 2025 at 22:52, Randy MacLeod <randy.macleod@windriver.com> wrote:
> A patch to enable the signing using  a PACKAGECONFIG for rpm would
> likely be accepted. Off by default of course and a test would be ideal.

We already have this in rpm recipe:

# has replaced openpgp support and is written in rust:
https://fedoraproject.org/wiki/Changes/RpmSequoia
PACKAGECONFIG[sequoia] = "-DWITH_SEQUOIA=ON,-DWITH_SEQUOIA=OFF,rpm-sequoia"

I also have a half-baked sequoia recipe:
https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/rpm/rpm-sequoia_1.5.0.bb?h=akanavin/package-version-updates-later

And there's a currently disabled selftest:
https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/signing.py#n62

So someone needs to take all these, add meta-clang, and make it all work.

Alex

