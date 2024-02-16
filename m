Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B982C48BC4
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 04:07:27 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.11596.1708056439015737968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 20:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Je0st4eo;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21e26d645d9so841217fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 20:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708056438; x=1708661238; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2YMJbez/xFcx9/lSmnrcbKSpWB/IVJOgrrdz4Pxq7M=;
        b=Je0st4eoyuBdb+U2UhmguPxUEvAg021s7XTlYEJYv6ko4E6F95krd4JfPB8SZlTvjA
         U2/oRxQxbGH3LbNSY2tx778MgvgVlitjTT052bqlJ+e2Y6CN9EHmYiQYRYtSlSCUWdj1
         HRvH+jG5YzB4wt+sFW5LxVuB9kFBDB83cSnbzhiE/J+fVPis8QwhztqgQWwkAZ94MfYa
         9cHB3J2hQmsa7S8DOym0ovUGKOles1n0Jf0CXd5rwcoy1pEgcNaTv+J/88HxyRUHzXBf
         w5jHLaX6QGhzGsXldcsMSWC+WmFtkIb3oJQQZDijJ84NSs8sfq98Qahv49FNQmcj20yQ
         xOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708056438; x=1708661238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2YMJbez/xFcx9/lSmnrcbKSpWB/IVJOgrrdz4Pxq7M=;
        b=Mb7Npde7A+wggmXfTKFeZrS+1g31IWhw7NCF2FVXC5UP6XelRqC6joWtlMcpFotjdw
         A9zleWqLMUDNU9PKScHBiRClD/jkQw5+3DIEvvw9JY//2fXPVvphjhsLLf+f+/JzclBr
         zNDpsm11g3WYkCQ7olfvp4GDhs6Qni6s4pnGQhcmIwdkbFzHjjrUxG3aJcvF5eJyp9Ux
         241VRlFv5B4F+wr2Kk1rbi8nIIuqrHk44YWphXKWawk3OSr8NGmX9OGETAzLVYnOkIug
         KYAdZmBZJxVZ9X/KNIiioe3guULxVQtWKJ38sRhi10ud20uE4Lt2cQ+4mpJDaJCdZIYE
         BsPQ==
X-Gm-Message-State: AOJu0YxzFREsBbuC9T9k5wDcfiWEJ7jgUKYbTxqLG+fW0AFuMz3iZe9r
	Bedk2eLwuoBpZyMqpLVgOkffCaGhlRrktJjamooQ7khSfwAHblJDd251p61ZguEoe8lIuhOgCQA
	99CQ3aAyu4dAlUGkGf0TZS676e0g=
X-Google-Smtp-Source: AGHT+IFqaCP7qze8Jiid0jdJC00M0xII2XOeoq3sxXsMfh6TYnGTp2MMCNjtvCpACHiOpkMNoWvgHHAHqmsjtBasOVE=
X-Received: by 2002:a05:6870:d1c3:b0:219:97e7:a99a with SMTP id
 b3-20020a056870d1c300b0021997e7a99amr3886623oac.12.1708056438090; Thu, 15 Feb
 2024 20:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20240214205135.401454-1-raj.khem@gmail.com> <20240214205135.401454-3-raj.khem@gmail.com>
 <82fa864f324c75f1164afad5d348da0c8e33d2df.camel@linuxfoundation.org>
In-Reply-To: <82fa864f324c75f1164afad5d348da0c8e33d2df.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Feb 2024 20:06:49 -0800
Message-ID: <CAMKF1spHp6Rmv-e=aC3t2xocZFYsnk7oUNdRMowuu15VvN+X_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-samples: Update to tip of trunk
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 04:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195738

lets drop this patch, I think it needs some submodule syncing but I
will let upstream do it.

On Thu, Feb 15, 2024 at 1:23=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2024-02-14 at 12:47 -0800, Khem Raj wrote:
> > This gets the needed fixes for llvm-18 based builds
> > spdlog musl patches has been merged in the updated version module
> > 32bit backport is also available in this version
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Breaks with multilib:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8446/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5699/s=
teps/11/logs/stdio
>
> Breaks with musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/8583/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8606
>
> Cheers,
>
> Richard

