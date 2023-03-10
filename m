Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7771C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 14:08:19 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.19850.1678457296496869626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 06:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fs07cHqQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id f18so6771190lfa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678457294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn6ds5mm+c5JC7TcjKWFnYpZZoOsdE3K1aclP4neZEo=;
        b=Fs07cHqQgp7WiZ1EajRPyP4zA0KQRaoqQYJ70a/mHWCqkIzUnWKQ3Zho+2GItg7zt9
         fUwPYS1JzmVpvf54isdnDm/CVXWMPf4tXluX3Zh+lXnDHuLSnFyC6YVXVINTXN2iRPXi
         KZhRzzYwOst4cak9H9LgTC1dbHTmAxpiroh7cV6FFxJr5XquG3xzoA5Q18nLwvaYYvQX
         X9TfT0Kn3YEYGVzwvkjIx+cbSji7esjSVo+WV0w0uWD8w0i99i2qH8H9Zs9Eg9SAFPXK
         ubu8CwEA3V6JsFCogOu8oTbv/knW2zTIjgyQZP90OkeEpsD/WVdeNjpLkCaPNT+6Tr4t
         jyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678457294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bn6ds5mm+c5JC7TcjKWFnYpZZoOsdE3K1aclP4neZEo=;
        b=Bx0Z5ZoeCwPXohL2VZlpg64EMqxWpFJxJqzKO+VJWOfw0lmPUndRxzAxzbnQq/TxRZ
         p0CRulJfhZNKjUg2rToSC1YfQrqIrAZMw0AJlYZt3iPgmpbPcLRzgl9KPm7x90QY6RKW
         SXNF7HpUMpZ4R3Ly95SQTK2UZJxsjyiijUvwfd72R4k8GYLXoDFGoFMdceTgs9tNvvXi
         57f4A55UySVJZFj7ZDgZHFj/+Wgsy9X6DYMX1QpEqTEekqi37spL3frElJCOzwA6p6uY
         Lza5RqgNP3SoxwwqYOBHBcp/EKDVn12Rfyi0FIX1aevyFhfuMMLD+WMSLbMPTCo+vjSX
         EjBw==
X-Gm-Message-State: AO0yUKVdd9CDt7DO47GpgK3qagI28G+LtjQHuNCQO2Y5xev1YI2OWUoP
	z0hREfHHkeF4ITfw6d1mHljrjXr58ZHAYoB/P9I=
X-Google-Smtp-Source: AK7set9YpnTgwVuQWcvnAX+1JconA/bzYvwON7xHAO88mW1hGCyjJj1KSto0REqPYqjWbb0gBSZTg2ybPCzbouKzxOE=
X-Received: by 2002:ac2:482e:0:b0:4d5:ca32:6ed6 with SMTP id
 14-20020ac2482e000000b004d5ca326ed6mr858562lft.4.1678457294587; Fri, 10 Mar
 2023 06:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20230309151958.3619193-1-alex@linutronix.de> <20230309151958.3619193-13-alex@linutronix.de>
 <6967bdef-9c3f-eb4b-2e14-a29ed4367c18@gmail.com> <174ACADD43A80942.24021@lists.openembedded.org>
 <174ACBD4289C58E6.23432@lists.openembedded.org>
In-Reply-To: <174ACBD4289C58E6.23432@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Mar 2023 15:08:03 +0100
Message-ID: <CANNYZj9n_qJLgrB8jb7FNrTEPtVT1_xQniA4wa4=MRqhxKbK9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/26] ffmpeg: update 5.1.2 -> 6.0
To: alex.kanavin@gmail.com
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 14:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178335

On Thu, 9 Mar 2023 at 17:05, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> meta-oe build is running. Let's see what falls out.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2543

Ok, this build is not representative because it runs without the
needed 'commercial' license flags, and so ffmpeg is not included.

I ran the same thing locally with that enabled, and I can reassure
everyone, there's no fallout. I got two fails, but the same two fails
happen with poky master, and are unrelated.

Alex

