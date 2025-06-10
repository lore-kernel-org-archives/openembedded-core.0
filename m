Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B11C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:32:54 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.81572.1749544373810631476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 01:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cFV9p3UM;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acbb85ce788so855233366b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 01:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749544372; x=1750149172; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COm+eAu4P+yq+dRZ7m1sESD3PwlRj09XnfHoJRLr/JU=;
        b=cFV9p3UMEBmYz05du8Xd+BPc+YGP4oi5A0MT4C9cqOPeu5iWANeLcdkFZgNafmUvog
         i1lX/Y/HN67Z0JuG/2fp5sbnxfUQarJWoc9yUnyzesSGMfpZgo5uQ/gQ6aSajlJGpBR0
         0OqLw/vvURf1R2Ytxajy8n3DrYxgcVda6rU+nd/v0mYYAXxycitJqOlHCoe06LIQ/5tO
         lGBYBl4WntcFF9QayUrARmqGI1lK5CT7p6Te3Jx8cCgXzkHIu0Ky2m+qtsu2TjvBDMiI
         q0jFgL9Utbt62vuhLhAH5OpA82MdGYWqH+My1ZciG/XseX5UQKLVAO/mLkGgKHRbCC1i
         Oy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544372; x=1750149172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COm+eAu4P+yq+dRZ7m1sESD3PwlRj09XnfHoJRLr/JU=;
        b=X8CnqgYlNMxHKQWLjH41uNSQYmBd6W0LqFvdGan7AJ+i5ssxF7uDK1U2H3/m9qbaoo
         usq86eLu17eIlXZrKyEiDVh7J1IpwNHwKFfn7MScvoKLLgxuxmQOIwy7uC3w1SfWaZH5
         MYGXAo6oYwGwOTXBmcOqH8nqTCtKrOwX4P6B2j46r62PDsf1Y8ZZlweobdOQs9JdxVkJ
         +cvPg3rWEXMgosS/TnNieyoj8HNRcX1wkDv+eYDVVBpbZVKUgbM1fk/g7BcUcSXR+xda
         ek3lZYCgc5jn2kUrmVjTID4ZfZ5MUlRM6igT+gHPQHw8YGslGeXQV4d3oQ1mCr3tl/P4
         AhFw==
X-Forwarded-Encrypted: i=1; AJvYcCURUd1GJhmaQf1vocrKGH66MC+sx9+lQBQGxarEuMlnYH1juy9Z0W4k4LiVTIZ3DONW32ME5Z1BapHF1vzW3DN5bA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9+31s+YwRrtlVVrNgy/SuBKmcvPCIYjsc0Q5VoiU9ntEkgKEB
	R6OFYUuSBnkoG3QiCzCj935oVwgPwNIscVIz+BgGfbKv13RBqhpJ5OGu
X-Gm-Gg: ASbGncs5ruL/WeEXCxzju5OcZtreTQn9dEcm0Yzu/JWQyraHrgD4Y/sh4UFuz15raap
	t31fFOcmlcpgQXd1X2cBJg6Ybq8Ydoh+RWBnrG1Em5PBxdee5w6uyv1rBHeiURszqPYv1kROA3b
	O28jVm6hIJUZAlBqof30DyXK2QH6/vVKjbU5SzLzFvonpz4vBvFGy/UoMz78o6t9hx6sIG/IcMc
	IcjhSBj7OmFL34BHdQct7pdKSjuD0uQ9ERNhYYk/aViISDY9Iey6w61Vb38bAF4e5GhlXF/H6eD
	+U9QWakrofOtjfHlTJSv4BinsugjIGxHgOEQHL7nrdFxWkypuekk8G4j2KdiFN9Rg6jDLg==
X-Google-Smtp-Source: AGHT+IF8GBhZO6oRsLBshazSDmoH+Hwi1V8F6zuhWSKUT0rm+0evmucBPz5IpPXPqEa9N3MFkmkjOw==
X-Received: by 2002:a17:907:9488:b0:ade:43e8:8faf with SMTP id a640c23a62f3a-ade7ad57f29mr151585066b.55.1749544371730;
        Tue, 10 Jun 2025 01:32:51 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c3d2sm679144066b.81.2025.06.10.01.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 01:32:51 -0700 (PDT)
Message-ID: <fe3b23ce-81ba-4086-a972-549b98d0f919@gmail.com>
Date: Tue, 10 Jun 2025 10:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH] systemd.bbclass: generate preset for
 templates
To: mns@gomspace.com, openembedded-core@lists.openembedded.org
References: <523f3550-8e8c-4132-875f-debc4b253cb4@gmail.com>
 <27221.1749532968381654658@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <27221.1749532968381654658@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218321

On 6/10/25 07:22, Martin Siegumfeldt via lists.openembedded.org wrote:
>
>     It seems that your patch has been added[1] to the walnascar-nut branch
>     (which is a staging branch for Walnascar). It has however most
>     probably
>     missed the merge window for version 5.2.1 by a couple of days. The
>     next
>     Walnascar release, 5.2.2 is expected to be released mid-July.
>
>     [1]:
>     https://git.openembedded.org/openembedded-core-contrib/commit/meta/classes-recipe/systemd.bbclass?h=stable/walnascar-nut&id=ea207dce1f5f8579d8ddde487ac9852f50bfc792
>     <https://git.openembedded.org/openembedded-core-contrib/commit/meta/classes-recipe/systemd.bbclass?h=stable/walnascar-nut&id=ea207dce1f5f8579d8ddde487ac9852f50bfc792>
>
> Thanks for the update Gyorgy. I was expecting it to appear within
> https://git.yoctoproject.org/poky/log/?h=walnascar-next but was
> obviously wrong. Out of curiosity, is this process described anywhere?
>
The release schedule is part of the Stephen Jolley's weekly status
email[1].
Regarding the branches, there are some docs[2], but tbh it doesn't ring
true for stable branches. And there are also some docs about the
release/QA process[3]. But I learned a lot about the release process by
lurking around.

[1]: e.g. https://lists.yoctoproject.org/g/yocto/message/65459
[2]:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#tracking-the-status-of-patches
[3]: https://docs.yoctoproject.org/test-manual/test-process.html

