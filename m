Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB736C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:04:39 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.13995.1709737479258856262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SidVj1xZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5134d7e16a8so1344996e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709737477; x=1710342277; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pSRWYyKCcS32S/t7b3p+GWhvjH7sMmkSsPOaliej4Jc=;
        b=SidVj1xZvl3765DloCB+JlG6PhIguPLlanqTT4V96RaAi1ioIWn6IkBUJ43rjpUdrM
         v6ZzNnXSpFA5ouok1W8II6vE9MZsL3glvUUBEGbUONbqb90f4xETuIUCFuWM0gu8Iztp
         9fD1Iz8/TWU7Wlg+tYWeBqSugJWOYh0zmmOMK7JaYqAlGAFj2hPomBHBxLJ1T5NySkuN
         8suG+GkbSWdsiKuZthU2t7GySTZq81d6sVYrny0zeFDXBTJhBWm+YyBwNJONWWqCwTDq
         uM5nQuc8I5CqNPr8Vncg+gQJpaV8PFIScNV2sAaEuFxTr3ydVs0cAtD59Xid0Z1D+1DJ
         /dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709737477; x=1710342277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSRWYyKCcS32S/t7b3p+GWhvjH7sMmkSsPOaliej4Jc=;
        b=qkJHcGp4B7mA5ov22dgETSoO2U7o1XUAJVCWwQ4cQA2R2P/b/rqnAoI/hzOLcS9iAO
         bGqPQt3RFeKjJrIeQUC9yWFeJmtVIxsoorxpTdTeyc4NoYoxmyOy9RBJttKBUiK4GDtb
         Bv/4ZcVkDdf4V8Li+7/jIHdf1JM2jyirarBHrKLlMFgp9rV6KEn3SJXrWhUi6iB9VC7v
         H0WweThPwK4WU579tMpz1qnUksU8nVdJ5ptge5tfqY5iOiG+LiyasKJ96KBB+anpZ6UR
         IGoECjHFoDljxhsOhRw6p03PMsnwoZR84w8dfvS6dQsL+lAskOX4KCd707v2wglXPY0U
         r83w==
X-Forwarded-Encrypted: i=1; AJvYcCVguzAXxwuQYixSRoV8s7Lgrhx31q7bmCwA5JLklRK1hjG7FZYGOFNhokQPVmDSeuyPkr08QrYRYauKEt4FjJ70saJkOH7sJnJcg2XOO5rgoVQMSNW2K828
X-Gm-Message-State: AOJu0Yy3uuagj8U4BWTzdfeyUDwQWGSoUMC1Flm2t8BH70B+mYFQXQVg
	39LcvcFMxgDutbpKtu3/juOEeAg0QlTnu8kMLjZ9biZhutNX+1L9DrjN8e9XQUPIKGfTk90toXc
	F+uhiGOylLM5A5zYjkIYOEBR/3GQ=
X-Google-Smtp-Source: AGHT+IGfTBZSYm8MwLZjwWy0D6iHGqEcrJ0y3s0apTUYNa34EdpmoTVI7+2czj6Iwn6OEej0nrf/A4T5hXWtRCTPbRo=
X-Received: by 2002:a05:6512:159c:b0:513:588a:262f with SMTP id
 bp28-20020a056512159c00b00513588a262fmr3665202lfb.39.1709737477143; Wed, 06
 Mar 2024 07:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20240305203608.3039688-1-tom.hochstein@nxp.com>
 <3b991e85a5ee7b24c728c3bf59906dc44c756385.camel@linuxfoundation.org>
 <CAP9ODKrUcNXcEQFAzPy77jS7uYPJ0Lx56pQzfVzTMescPnsYvw@mail.gmail.com>
 <0331b56aadffd139fca065008a38e7784a3e06df.camel@linuxfoundation.org>
 <CAP9ODKp1sK65kaejiHMm5TS4=e0bbCC2Da9HrBoN=c88wF6dbQ@mail.gmail.com>
 <ba338ad83d02efbaeac55e4f80d9560cab92a54d.camel@linuxfoundation.org> <CAP9ODKq7ONvW6Axw74zU65TqKT6v9QnqvV_BOB=rY4yRDh3SUg@mail.gmail.com>
In-Reply-To: <CAP9ODKq7ONvW6Axw74zU65TqKT6v9QnqvV_BOB=rY4yRDh3SUg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Mar 2024 16:04:25 +0100
Message-ID: <CANNYZj_5rvDDj8C5Hxy+OuhitveUwsG0gBbMjSYgZkavD_7HHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmaptool: Add bmap-tools alias for compatibility
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tom Hochstein <tom.hochstein@nxp.com>, openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196681

On Wed, 6 Mar 2024 at 14:08, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>> Put another way, if I were to merge the PROVIDES, when would it ever be
>> acceptable to remove it?
>
>
> I'd do it in next release; so it keeps a time for upgrade.

But what would incentivize people to fix the metadata? If you put
PROVIDES in there, they are not going to notice that they have to fix
anything, and when it's removed later, it will break all the same.
What's the point of this additional work then?

It's master branch, it can and does break. No one ever promised that
you can make a layer that works across several releases, and I would
strongly object to making such a promise.

Alex

