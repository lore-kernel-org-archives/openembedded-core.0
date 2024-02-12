Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A34C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 18:38:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.14395.1707763110200067473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 10:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDC8JyjE;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-410da137230so8328545e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707763108; x=1708367908; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUDRg8DL55Fq2VUC91VSm79nmrh385YVY+mq6YMvPkA=;
        b=lDC8JyjEJs9noT3177T1AY+SnY8Fi1y4O4yu1u/m5L0cNbhN5kdg9Lbe8/iDSYqsJl
         f/9bGi/i/T5kYpFR+lyLS/J3HCPAlDXC6LRK5wqQ/fv7vEpIMfiuQBw+aUCV8e6zWaLR
         jZ4I/H+XogZSbErHtAT1MIRJWJ2LdCLiYSs53m+iKkdYqkJAbNRYCVSCnI0HLx2phZy6
         EMQvY2BZrVR6mhACemnuE+VXNYqydRTk8dAFjzkEbFVicCCPZu4jBabRk4w1z+S/7y8u
         Nl4DhyLLV5owSGP2tYcZZgSX5MetK4X9MHK8e0RK3ciOXj6hh+w7wNigZbWW+oLF1jkX
         gewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707763108; x=1708367908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUDRg8DL55Fq2VUC91VSm79nmrh385YVY+mq6YMvPkA=;
        b=YReVGNX6uYkghyVeXTOfeXIzeqTK3Rt7Jag/APLYo94BAzHrM+TBVGGPR6DDsDRxQ6
         YP4syP6kpqWcJ7AeKEgAObo/uAlW8iv7rKHK1AcoOmMiHee6wIpF5OVZcu+ov8N8YyZo
         0Q8YQ0xW9qfWYVSc4Nq6dRYSI0iZZnd8c9yp3zryMp+wokuG5mB+ekxM23KHPNzqrVik
         A5n4MG8LvCb0CEA5dLIrMp3ZlAmYZCRZwUEAOAtkHbmbFTu3ch6DwkRJ7IYaovB9/hCb
         HpVpp05ELHBXZbZnjrvo6brmsppsD78caRszIs/Z0H4luvVeOUKe5VYFWFMBzoT+JwGG
         /6eg==
X-Gm-Message-State: AOJu0YxyiAg4urnN6WqzAAVjrQv4z5Ds+1LbplLYH5DHaw1wpFaIguEj
	zRj656sk+8yEzfTlOp8p8OmCom0wVHph7q6FG/pyn3c44pf9E22V
X-Google-Smtp-Source: AGHT+IGTW5wolvNDwtbI4jORjRJsya6eMKiZLKn2eaTKbS2mrbqnI1CLJ4WqEUOGTXeqpX8vBYu/Hg==
X-Received: by 2002:a05:600c:4f11:b0:40f:ddbb:73ae with SMTP id l17-20020a05600c4f1100b0040fddbb73aemr6586291wmq.27.1707763108310;
        Mon, 12 Feb 2024 10:38:28 -0800 (PST)
Received: from [10.139.9.134] ([154.47.27.148])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b00410df4bf22esm2988184wmi.38.2024.02.12.10.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 10:38:27 -0800 (PST)
Message-ID: <27fd5d45-08e2-47f6-9038-187dfc9562b8@gmail.com>
Date: Mon, 12 Feb 2024 19:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] overlayfs-etc: take read-only-rootfs into account
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>
Cc: openembedded-core@lists.openembedded.org
References: <391a7b90f3cb6a7b276904b69a2251bf0d3849c9.1707376966.git.baruch@tkos.co.il>
 <5066577e-7447-4f4f-8212-7729a3ada8ba@gmail.com> <87cyt35dcy.fsf@tarshish>
 <33d0888f-281c-4bc1-8a03-3bc3fcd182d6@gmail.com> <87o7cl3gn7.fsf@tarshish>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <87o7cl3gn7.fsf@tarshish>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 18:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195356

On 12.02.2024 15:21, Baruch Siach wrote:
> I reproduced the test failure. The output does not give much of a clue
> as to the cause of failure. How can I run the same qemu command
> interactively? Is qemu test console output saved somewhere? This log
> might be useful.
>
> Thanks,
> baruch
>

It could be that it failed, because qemu needs sudo for a few commands 
(or respective permissions for the user you run test under). These are 
included in my /etc/sudoers:
poky/scripts/runqemu-ifup
poky/scripts/runqemu-ifdown
poky/scripts/runqemu-gen-tapdevs

Could you please verify if it works after that? If yes, I'll extend the 
mentioned wiki page.

As for the interactive run, this command works for me:
runqemu 
../build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.wic

Slava

