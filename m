Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A69C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:17:38 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.2245.1743578254626801978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6ROv4x5;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e90b8d4686so56200006d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743578254; x=1744183054; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WYaLX8RWjPZlRKd+xnNzuEXZRqqWg79cfTEDWTjLhRc=;
        b=j6ROv4x5oHXoHyPCykn838uceAsYkRTFxQOADUYbOGoCVpEzANiInelg+jt+4L8mU2
         /Th+wHuSqHuPjRkVJH8W5uACTOf7gy92pfS6AomC1HudZXxmaD0XHvIRZdqoJkQ7Jlrf
         ti20TbE4EG+nw4a8G/pOXc2CRWH2sa3I0kdm6Bah5xkPL2d6wkjQ5NAEzs8YZl7mcQC0
         q90lpuoNCvtJK7UdB/Y14OITp0yYyuobKm8szJ41GUaLMpCQ6a1GHd1yrKWj4bBqtuOg
         YtReTjjouD2hyqoRSRBU6lO9hUs5XKfKi0LUQlSi790l+bKI9w3q53221mmvFnbvFglY
         9CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578254; x=1744183054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYaLX8RWjPZlRKd+xnNzuEXZRqqWg79cfTEDWTjLhRc=;
        b=UDaWhe9V4MIHMAVBR08XeNDGBOiUHH0gLN/KnXkUXUqNexLBxaLdRJ0ZphEbFs+Rci
         FJ0ShTLTyvcvR44P0rdoNnQvnyanyN6a679+KbYNWTvv7wtr/1OB6w4oLLHCNX1PURNy
         iqdibTSqGbFssq7FOPO5cReaOubJR/Rz8x7zr+KtnvJRC9VWjrdSqFs/zUwINa9naMwz
         gl15prNVVVdE0JWUdBtbAYMAr64iHJdBnGDjy2ErOxstR642lyzRdbHKBpTOsGR66cYA
         tDM67X/Z3HDwKJjSCNDVBYyW1QYGq7OKBAmhX7VKl6NJvd5wJ1kbuPQBOV0EetM8rsHq
         A/IQ==
X-Gm-Message-State: AOJu0Yzi46dBM9dX7v8L413W4mLeJV5LHpRcn0KmNcxpw7/Y22x2g7ew
	d9JyP/lvZ4JpxLBvf8eig4o9momybgFb9TSZnOg0SknEBBaD8rsWOsY5lOmJnWIyuMJw7D0S5zB
	3hlAlW8RUmbgx+12j1gy8k8s2398=
X-Gm-Gg: ASbGncuG8X7uPxHU7B+vhnYEokxx2AN5aZlkCsONWAX3KNClGahfybKt7mdKT+qIHpB
	Ia5BNOHg1I42JDFtplVU80kWD9+M1PFOfh1jIrpQUlueugp12F1gKD9MVi8RPqjgCp/C/B2kgHT
	obdAd39GVK+IlPbyioVFt4WfQFxqWmzmo9ltwu+ZKSbn6vTgYDbGa2E25F8hZIRPIbhtJz3oU=
X-Google-Smtp-Source: AGHT+IF909a35l1JiwJB9qRGcJ4xUNid5YquSHfInuPpb+lRNuOYIxn+tAQkppLaAiMZF5P/mv7Ii4WWWt+1aaoceAc=
X-Received: by 2002:a05:6214:300b:b0:6e8:f949:38c6 with SMTP id
 6a1803df08f44-6eef5ed4831mr91201946d6.33.1743578253591; Wed, 02 Apr 2025
 00:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org> <20250402071017.2157620-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250402071017.2157620-5-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Apr 2025 09:17:22 +0200
X-Gm-Features: AQ5f1Jo2UKp9lPT7QEeshmNGPs8yi8p0xVFp0lDwkdK1Xphl_shSCk1lnk5kcj4
Message-ID: <CANNYZj-+wZBvKBKWU-Yr4an=eXxhFZ2kceX1VfmLUaZat4x2GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/48] btrfs-tools: upgrade 6.13 -> 6.14
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214222

On Wed, 2 Apr 2025 at 09:10, Richard Purdie via lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> +SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tar=v${PV} \

'tag'. Not 'tar'.

Alex

