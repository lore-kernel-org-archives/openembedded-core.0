Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BAAC05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 19:30:00 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.84305.1674242993622866761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 11:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z9mbYc8B;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id f8so3207309ilj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 11:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/VT6LgdDd8wf83nIlj85eEzHELaAnaUEIlli6ZFdGBk=;
        b=Z9mbYc8B0Yrqs56YP4CVha8PJXhk7u/upcYDeSTgwLhsUNIPmm/i+jivLrW8XEZq/W
         Xm44+zYh4O+QApiDdG+xXCVT7zrn8i94DafDpDofLNhlb0/PnpXi5bptjsjyvFqduHuq
         3CtI3OU0sdqWhdgjgJ1b9i8b35FuSg5Fz+akAFqFHaPFoDOI6/mGUU3gbLY1ZZ837LBd
         uWIsJTw5fKw05MG2a6c2xZyWhYcrA068XSaWTf9svZWpoKjcfMi0PwpRk0dmWxAVnYXB
         ZnAEJV0fXr1w+d/ExrR2eTX3HMFYpFL5FuWNvyWjLln6XZWK+bwOASPL7Iol8+AMPhvV
         DqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VT6LgdDd8wf83nIlj85eEzHELaAnaUEIlli6ZFdGBk=;
        b=x3HeaRpFunbnY/Vnp2B05EF6jOCumGchDwFIpebOjGEEJsZAjX9qIyMpSntT9F8odq
         kmxm7u0xDT1lcGltbPA/02Uysp8WNmqg5kodRMXPY+q9dfWG2Vm8hqCI1wv3DcPkQP0P
         ROfSG20O4NgFHnqVaMAtQN/0HzUDIVfrKhKtN18gKxIm9+A3C63Am/aiBgDSagiKmeRO
         KHzrvyNX7+27VJHIRML0Wum7Iz3Lajaxx5ur7zAOCeUXI7Z7RJJ+AOiKKsTsdnVPZMc3
         maqhHDsGLqZkwF03hY+05K/eTwTS9i4M5RQ/B1QQqr7CN8YMvxRzCzeNDv3+HltPFHwe
         QeNg==
X-Gm-Message-State: AFqh2kqchGCVv7a9LUq15571trn3rL3eaxD+MkONzOvY0EFKp6nYhVXZ
	fLUz2Yyk2btj5ssx4Pex8+TGAWFR5xpWZbTkkao=
X-Google-Smtp-Source: AMrXdXsE38bxTYfu+aXjf2cxQ9q3BMudxHPzSMMB3dt86+oY1OCuuM7DYhXfAv4t3OvmIBmHHBl6rqri2yylLEUohTE=
X-Received: by 2002:a92:d206:0:b0:303:19d2:9def with SMTP id
 y6-20020a92d206000000b0030319d29defmr1663373ily.21.1674242992895; Fri, 20 Jan
 2023 11:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
 <20230119102423.3493565d@booty> <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
 <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com> <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
 <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com>
In-Reply-To: <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Jan 2023 14:29:41 -0500
Message-ID: <CADkTA4Nq=X6d9qz1a+Q0mEpb=ob0_+TsoHdkGn2nycd8+FOz=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error handling
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 19:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176250

On Fri, Jan 20, 2023 at 2:10 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 20 Jan 2023 at 15:26, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > but again, I won't insist that everyone does that
> > on submission, so not having the warning/error disabled is just an
> > extra load placed on me.
>
> I'm not sure I understand this. If the appropriate upstream-status is
> enforced by bitbake, then any contributor has to get it right before
> actually sending for review. Or otherwise it means they never built
> what they're sending.
>
> Where is the extra load happening?
>

Because I'm simply not going to insist on it in all the patches. I
need all the contributions I can get, and I'm not going to
pedantically insist on that.

meta-virt is not oe-core, I do the lifting. Therefore, if bitbake
errors, I have to fix it.

Other layers can nitpick all they want, but I'm not going to adopt that policy.

Bruce

> Alex



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

