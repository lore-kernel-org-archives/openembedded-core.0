Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D39C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 13:50:31 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.19741.1739886626337045809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 05:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VFOZy1Zs;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e672a21b9dso30158806d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 05:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739886625; x=1740491425; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkacHQFsyl91iH8UddHKB7Ecp86cq7QY708AaU9vfuY=;
        b=VFOZy1ZsqdKcDfAw7KjY8S0krv6RlsvPxPxhOb0IUbew6J2O+Afl1ZRAuAFePzUBtC
         irZOXjo6FEW9quX+sih3PBiJXVRY6Tp+qo1GSXoaaAtRDCF1Zn6RP+eJ2aQWWH6D9Cg2
         WGuduOmkNInnLx3HyaGBxcc6paTOSFJrwGIFLmrIMU2NLprMgoucPE26l15ws0x+0LMP
         71daHisQe+zdZlK+aazbZ9TUxflh6EZE7mqcN37nAua9RkxuggCGtvZHZul1L6KTSpho
         7H6MAwMyIc6fQ04oRwBMzkeYHHr/P4FWvkFKKky/0Y61y3oNLKaRNUIyzyxyhiK62JoD
         NSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886625; x=1740491425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkacHQFsyl91iH8UddHKB7Ecp86cq7QY708AaU9vfuY=;
        b=OwnLPD0p+4r841MjCQQjlLQdmZybk52voD8saBgRONAppR2gcL3lq4wB7Apf0bD2u6
         9BRs+j5Bq0AYFxcvYgydrRyGLZDUtj/aEOxqyX17nIZaVfLyXqvJE4uYRPEjUtKyan3g
         FLREeEmpB3Ob6paxPohLkNN10n6LUmFylsY8wmqaKDJn86FhO4zAG9cPiEPI6xVZCifd
         KxgG2HfhbZZWGBZnTXIbPX8liosgtMs6Nq1JyEjLJq8HUdUeyP+ZuopiZmSJjJc9eWu8
         k9YKVHTluQ3rSnQSq3l9binqYtaNjihBMSbwucAqv8Zj2GTmc2EX9WMhSj2dwXs/xrb/
         OpAw==
X-Gm-Message-State: AOJu0YwmFjZHkjZsc8IjOGSn7UDBoMDS7rhws2vhXrufl67ShZVsfYR2
	cMSzKgpwmB2iFMK6byWbr76Jbm8DxQgS1V+bVEKqZgBN/oTF3F1Y57eNn6QsQXJ79Zrm+5J9Xsx
	H4EpUaJho9bVy0hhhrywST5LEbjY5aQ==
X-Gm-Gg: ASbGnctqdtCbYwXAsjjDSymVYR0cXpaCZHUrF4pLocJEHay5P3YAqayIM/4/8xdufdD
	IOscakyk1/XVKZaKXVrep9hVGpOCOlxLC8FL2JE0QkVDawj8RiYkjEwAOxNwvvD/0sRT812cjPU
	9wZswb9CuzFN4YDhiM1djt9I4EbcR4nic=
X-Google-Smtp-Source: AGHT+IGxnNtkDbGIXgHvNnZOBaD+PDoU25M1o6Of63I8hz9hOD7yXU5fSAARiNk9LU8xhz7UbfoCCUvvH7DnL18JKgY=
X-Received: by 2002:a05:6214:2021:b0:6e6:6c10:76fb with SMTP id
 6a1803df08f44-6e66ccd8245mr214809386d6.25.1739886625466; Tue, 18 Feb 2025
 05:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20250218134336.1976728-1-festevam@gmail.com>
In-Reply-To: <20250218134336.1976728-1-festevam@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2025 14:50:14 +0100
X-Gm-Features: AWEUYZmPmU9_gjQrP6b-WTtyGDuxuaufhGg9dlkEYvRTjP5-6dZVBaZmTrJRDHs
Message-ID: <CANNYZj9QEnkPDekf9Nf5Wo2zJsSfT28C9hJkj5_PqB0oDgs9qA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] libexecinfo: Move it to the core
To: festevam@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211622

On Tue, 18 Feb 2025 at 14:43, Fabio Estevam via lists.openembedded.org
<festevam=gmail.com@lists.openembedded.org> wrote:
>  .../0001-makefile-Fix-build-on-linux.patch    | 61 ++++++++++++++
>  ...piler-errors-found-with-newer-gcc-cl.patch | 81 +++++++++++++++++++

Can you submit these upstream please?

Alex

