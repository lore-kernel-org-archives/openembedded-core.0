Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0BBC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 10:54:54 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.9964.1749725691929199979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 03:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ar4nFxIe;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad1b94382b8so161963766b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749725690; x=1750330490; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFa5UlC9Ev2I+tIwibEGC7RVDZh9UQzCA/VzuiKakVM=;
        b=Ar4nFxIejTOSKdxWf4ZCPfIGWGSINdrTr7nuGDMzbeA/LuvZiH1J+jbniPnPdCV8ls
         umrPlkw+hJFIwoJ2ona4V9qDaBzo75xKwifx/MwkkJtuCPK7OKJugivMGiCk2kxqmEhr
         NNYW30pP73c4Pyzz9zIpOAt/CFP/XxPE45tcyQzW3/GEdhUbTPvbHl97oSnQ1hhEY54o
         QgKs9Xsed+h835F4a6SFTASfgqn7inBa8Eb3c89tkK1wes6jNrhzKc/sSgFopEtVteRq
         BFEdv+mdNJmg95n8fd5tIjmOYY5rGbQXMinQR08oSIMcl/X+630KaxQb0J94mjYqY4kl
         IwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725690; x=1750330490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFa5UlC9Ev2I+tIwibEGC7RVDZh9UQzCA/VzuiKakVM=;
        b=bhlNflYtn5o7/h5VZ19AOQdwydQ5EPqFWiBj4a1iwtMa7BLVree+HTVGvhesv+w7NO
         LvF/2YmNgDyOzA/sK/CtHurrNU/TGHAQ0AGxWk3+CkCQOCrhzlSZaPdwOeJsdPTvU2zN
         BfRdp4J81BJVfNEJM0ZI/O3YHor/hS++RbNV52Gee4mMAVIZQrMSn5YzLSIwfDzjBVw+
         2LLsvMBry/vOPNxOIPk/6l+yqURprHeV3GLlIMMyCbLyo2EaJh9fqfK2UBsg4s6lvA5S
         BArBHR0YE5v1oroua8/z2r0OxVPLindgMxtCkeVJvY2QBR5faTEqzWvwV90VLAD/yRMm
         AAzA==
X-Forwarded-Encrypted: i=1; AJvYcCWWVjfvR3Dkxafj6lLhiKJdN1cXqIFvfGpOjgZwlKPhXQzvPe5KeN0zDbMJJO2p4HEMyy1ltIerKelZcZRyjjoimw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzq3wbq3hfmF8IZlsmSvqyggJ14Rkt5uvNzeL0mqjs48xr6BRaq
	/1UEMM4SoRJWLE1/zZte5CrTzC9emk5U8PFbH7qyQEy9o4PcMZydZpQN
X-Gm-Gg: ASbGncuxXE3rRYS6zOh9FcZVZnEVXqxJlKyehbbsBq8FoDHaiU0L4G5h7oWf3ToZQfC
	xeff79NU+MQNu/Tb9wSdww0zFnKSbEadWTGyJMSpKjWUbFWeX3pqsekuw084vbzu9mUaL8pEmfP
	sTbWtkZ/ndRJotDQYtPcYEiYqN74l4/zkQF9ItXWnjLEKV+T/wlTUJf79IeqjK50qAtMsl3y4bH
	oHQBZN1e3a9bs6gVoJGaKTywWp7F1iKgM4nWfNbnPViQ80FhZyF1U5ra4QEktVbRxYtiYRSq1Vd
	Ls7YuGl9/5B6yhscT3MRCurIHPTTcFVX8ZQIeT5v8OoCROWei4pAjSWJ7SFCJnUx8sV9rQ==
X-Google-Smtp-Source: AGHT+IHEjcVGMOK69CyTCQS7X6pAHzpTqkNNNbb7sTBiBp0Ul6101QiBFZ1MOKRus8y6wbfZPkWXdA==
X-Received: by 2002:a17:907:3d4f:b0:add:fa4e:8a7a with SMTP id a640c23a62f3a-ade8971d93amr580794966b.34.1749725690016;
        Thu, 12 Jun 2025 03:54:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cdd32sm113794166b.30.2025.06.12.03.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 03:54:49 -0700 (PDT)
Message-ID: <764d086a-3664-42aa-a3bc-a3c41a4e2355@gmail.com>
Date: Thu, 12 Jun 2025 12:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH V2 0/8] glibc: Fix lost wakeup in
 pthread_cond_wait (PR25847)
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
References: <0b6715b7-a0c0-4bc2-8773-abf0b677c01c@gmail.com>
 <19279.1749725168682733960@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <19279.1749725168682733960@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 10:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218508

On 6/12/25 12:46, Dora, Sunil Kumar via lists.openembedded.org wrote:
> Thank you for the feedback. To confirm, would you like me to send a V3
> with |glibc:| added to each commit subject line as well? I had
> included it only in the cover letter to avoid modifying the original
> commit titles.
>
Yes, it will be easier to read the commit history. You could also send
all the separate patches in one email, though at this point I think it
would be easier an faster just to keep the series and prefix the
subjects of the individual messages.

