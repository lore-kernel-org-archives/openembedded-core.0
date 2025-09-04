Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FA1CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:23:49 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.35800.1756981420062618196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hb7UlQou;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-721504645aaso6489486d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 03:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756981419; x=1757586219; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3F+IO8KafIKpu08x/RQvbNJjaBtPwq4J4PMK6HS2P8Y=;
        b=Hb7UlQouEa+TRLcGuZSXEsZL3DBnVzOYoc98jWIkWZS2D2yv4mZ3SrkDeMNxaT1ZUd
         u/KkqzrDh0KA50zB5bQ2PEPGdCl+/TGviAL2VYOarDiSWKr1hr7p4xleWwyYAUzDX3EX
         qXVc5dcwZ5M40g/YgEOCM/SHrMfUSMLEYA6ivfE2dfn+lL/uOPDbGgWsrRc8AVgECaMM
         adUqYArd6jmZlrs6hl0F+2sBxvi3teZhFQiFwwkBqghJ4np72l64H+Zl3pXDlNln9GHx
         mLrt29UrU42g+liuKtqdH9g7NVhr6zARpIk8JRjINTxnd/yxe6QUDjDJgYRAOosiFrIB
         ql7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981419; x=1757586219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3F+IO8KafIKpu08x/RQvbNJjaBtPwq4J4PMK6HS2P8Y=;
        b=VIDhjjjfCiUl2drU48qoMFkW8pgqUSIFqXEVSJUxIOd1XZnnQQ8ec4r2tyhvY8vmnh
         p8Y1/ei5HkSqUfOBqEl90NQ8D9z0bvE3/KGlUOwL1/c6ImT4R5IRgUcIX1Iw9vz1nbS8
         p4ocuOMfzxLLFAI8TMjAdcfuBaNbxCP07GGlbYA2scVW2ulIBAGQGiTqfC7hAEmRURsK
         ifv9FgmJIbCqSQmYbM8R/0s7FlTEtMy9jn7tQE2/sQA46BuuWEZG4nJ5DWRDNUREfH7j
         53x+7i082frKVF/Q/paCgy08qiwCumzcvIG6cicYISzBQfQ7MKrfsFhi4460fR8FqD3P
         Mw8w==
X-Forwarded-Encrypted: i=1; AJvYcCUKnM2P330UsKXulIx6OXvbc6cytH7VR+V1Xs6nj90/JG1ktzlPfJaIYUHuZW7vmaxjmdO3w9l1jch9OXanAs2c0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyelhpBxcxWYCZ6K0yB6i79fvuloeHRPTzlbON+2HHQSwCuP+Kr
	JZoCgEOjE4xuCUDVA7kRG/EHTx8UFoCDNibwr5EAbY5sHPZXB1HlCALbetw0LAtKgZMwGgJB+El
	hNDB9OEe2ukrj7LEEH7ABzE3mdjbLcaQSwFAr
X-Gm-Gg: ASbGnctqaQUghR+UvVZ7U1FLDgWQf/pRb8rEFgebsZoJ3I19TFvcauu5YG8dbgc5Hu6
	YLJ59F8j8/mfyFlhu5yRFa4FaVZk7QbstbUtHk4zeTDw78ywAfImZnDGQGYxkBYjtNOZXlFGmsW
	y74KlBxSUQjrQxbkQX5IUQqw7NDnqNrI8VoysiPPxwzDxFSEc+wDGLeAmko87TwWUoJqJehLcqZ
	nvCzY383wHFqUOY0xID4hi0CJ5wsAx53+PXuyQsnUYnQ+/VHzJrAcAadeVMUUPigTpEjxmy8mqU
	j6esCjieg0p/xvBAHxyrTHKb1dKDjCAl8zmIbkOZ
X-Google-Smtp-Source: AGHT+IFSDviHr2RLLmbUr4bdKBnbI2uyyNoiWB+GGAjw1O0tj2V2PfIgyPR8XW1Ectx7LFLMBoCVL1+TSrCnRus9j1U=
X-Received: by 2002:a05:6214:4710:b0:726:9bc3:f8b5 with SMTP id
 6a1803df08f44-7269bc3fa6emr43557956d6.32.1756981419015; Thu, 04 Sep 2025
 03:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250712140638.3099109-1-gudni.m.g@gmail.com> <24850.1752329523627965940@lists.openembedded.org>
 <AS1PR10MB5697C5226761702F5C7B4E68FD4AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1860EED7D31477F1.5475@lists.openembedded.org> <1860F3C42441CCDB.24627@lists.openembedded.org>
 <64ec9cce-9ae9-4d0b-8be7-e1d0bec144cd@gmail.com> <186124667AD72DDE.24627@lists.openembedded.org>
 <CANNYZj9EF2g-XXU2231P0pb5Bv+yBWpFwLQqcbeGdNFO9UFcmw@mail.gmail.com> <AS1PR10MB569744B33E963F3885412EC0FD01A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569744B33E963F3885412EC0FD01A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Sep 2025 12:23:27 +0200
X-Gm-Features: Ac12FXy5OJDMpQ0uph4j2WNTaHVhi1SHZoknjdjgGqCSxXBPqJZSkYhvK3ElZGE
Message-ID: <CANNYZj937gxmcbqhDg4y+9OrYy8X_mksPxgDgP30kNzOz0RvZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "skandigraun@gmail.com" <skandigraun@gmail.com>, "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222913

On Thu, 4 Sept 2025 at 00:31, Marko, Peter <Peter.Marko@siemens.com> wrote:
>
> I have sent a new version with soname=legacy which links against .0.
> So the update should hopefully finally work now.
>
> But of course, the setscene behavior is still something which should be
> analyzed. Maybe bugzilla ticket should be raised to not forget about it.

Filed here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15963

Alex

