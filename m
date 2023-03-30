Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A853C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:11:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.26380.1680185455269339078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lD+dcDt9;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id x17so24707218lfu.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zvzxal6ThJLJJwzaw8Vk5DMMpeJkDmk2pP7sRhHwKOQ=;
        b=lD+dcDt9leQL/pMeOfxyVA3u+22T8kBoTjsZMr7jUq7lXXKPZIxQYc5+9tmqOAXDg6
         rN2XK2wlZ1cTNbxdmsjh+YQV5HD8Z5fnd/FENvljpLVkOZfGr0T25MNonJFsMZYmLtHf
         yjc0vdaNrEFuezvPc3cU/fjPuF8ZRtJA/4AUTuEFMGQg9jFvNeXHwM55StF2BnShPOvS
         q61mHBCg7GZo+Dkw2iU6FoIA91Fp38uA6TYOGxjh0iothfs2cKIZhShjPYz1DLqf0ZbD
         mNbLKU0loj0+PUBw++2NaVrAEeBmUNf23OUi6g3EDZc779J4+KpqALoXtcxHI3j71XUU
         KeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zvzxal6ThJLJJwzaw8Vk5DMMpeJkDmk2pP7sRhHwKOQ=;
        b=qTo2yH5qKytBtczPiV4uaXBFrbtjPCwcK6c/xvY8umWNHklNmNyriZfJXKlLWP1d3c
         KCiXQH5tjNCgUx/4zSyljRG3rxIGYlhl25yO7362uT7Lt/Pcvml0NEfJbHjVHr9kb2IZ
         uveuPoJlqnBJfYEHVKzIxOCn6oyP8MjRapK/sPS0sRTcm9YTY2L/JgvPgvFiWcj5wXAc
         HNCmxKpjzLerjYke2Ek3mE03vO2Gs/IlAfYq/gSW0jvsJvCnwF18j7rJwRizZ0+xk1nn
         kMVoW7Bv/es1TasTKQQhiYs/QHhCFjB+uM/Sctx2qmO/ysRlULdJtAgyEpANPx78XRtK
         aQPg==
X-Gm-Message-State: AAQBX9dasbhVAWhGwzxKcsqDHUAydpdHRZEZxqt79Pi6VNdCxr6i/xeU
	rUfzQGMLwLj4amfyHy23cl4A/WvQ8lcivjGE+PU=
X-Google-Smtp-Source: AKy350Za9BM190Nkg/u/DiEIhV2niqQAfekSH82xZDLrddi+KRxgrZLhixr0DzCuvwYR0pr9VLzahWg4QzzPIQ2yVLs=
X-Received: by 2002:ac2:5448:0:b0:4e9:bcf5:a0b6 with SMTP id
 d8-20020ac25448000000b004e9bcf5a0b6mr6658533lfn.11.1680185453514; Thu, 30 Mar
 2023 07:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134214.2772913-1-zboszor@gmail.com> <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
In-Reply-To: <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 16:10:42 +0200
Message-ID: <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179329

On Thu, 30 Mar 2023 at 16:08, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
> Please see the MR:
> https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/431
>
> udev (provided by systemd) -> libgudev -> libfprint
> also:
> udev-native -> libgudev-native -> libfprint-native -> libfprint
>
> Also, please read the TODO part of the patch for systemd
> and consider it.

We can simply direct libfprint to run its own target pieces under qemu
usermode, and avoid all this nasty native stuff. Meson has direct
support for it, and even if it doesn't work, libfprint can be patched
to use a custom 'wrapper' for executing the binaries.

Alex

