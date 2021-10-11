Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538ABC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 04:30:05 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web09.7535.1633926604158588432
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 21:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mC+fuOIW;
 spf=pass (domain: gmail.com, ip: 209.85.217.46,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id w13so17635665vsa.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 21:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=p3Ljg/NB0NpuKTT2RsuP+aB8320bC1IcdgfhNwfzryk=;
        b=mC+fuOIWWZPzZpN7Ff6QFnezxQy7i5dt5fY88gv8V6Fqp3afNIMk2wIK6KREVrVea2
         /zvKZWND2/7JUaLIyRsd9EA1RtDtTHWUbqSXk/I03ZrbFnlbxGGaj4fFKJorvltELndQ
         lLufVbyUSAA9gIShmc5N6HKsFjM3N2FT7s/8t/MEGEPLvIOzbBEf5LpcNCuJVMEdl68I
         oiC7jybAc2fOr55bvWgq9y3oD17JVqtiPF91tXr8D0YwhSfRWirEblR8vK8dLyGUijVE
         MSi1C3foEX+Ok8fW13tUBUNA9DNQokSCvNfwFDj0bP5xQG86N4OFUiBj3tlP6Cs1jq1v
         zJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=p3Ljg/NB0NpuKTT2RsuP+aB8320bC1IcdgfhNwfzryk=;
        b=WlFo1KBfUI3qZUDrmiYsY+gMGjpWF/sEdInXWPpfXtMDYYJYmkc0X/ra+TO8GYneOr
         7CIfM2yQHg7B9i4uocWjtYLkMnUXXmid6vQa2e6QZPgcwkLWX0vgKBsQ2nE6MJYWMqtD
         OMhV5/HqZtS6KZu3wdT5gem9kvhd+cEwWuJTHDEB1mdaua8vTn3cLT+qzfAQDkKdTXJt
         hfb+R/HjCbUpQWqdqgBaA9+L9Vbt9Cib/I3BZGhs83z6xgdiI4rBjiPxnwmGp1v5wyuK
         /4nmUW7gQTqK4Dyi8yi6SQLvz5xZRWuJXLlEXVDuYY9nYorm9QudFqHR2NPvlsUNsYcl
         9M8Q==
X-Gm-Message-State: AOAM530N8TsFgvpZ4kSxwanAV0hibLyy7ya6jJHqEckA9OP5vrAoLpRV
	7nUAB7oTfkPKWOb/8EaGHzchAq3q9MImc3c4jgc=
X-Google-Smtp-Source: 
 ABdhPJw+5clGEmTOH/mgKyjtyFXP93eVrPbF54VlJPFzAc6HZXTsKVxn6e4OQMPFh+BX/hQrH+bWFgnF0mCg0eWjgCc=
X-Received: by 2002:a05:6102:f08:: with SMTP id
 v8mr21314201vss.60.1633926603214;
 Sun, 10 Oct 2021 21:30:03 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Mon, 11 Oct 2021 15:29:27 +1100
Message-ID: 
 <CAA=hcWSfqgxOX8UjwW35tD4VMC8c0SHWVo=_=z38NH7+rq6dAg@mail.gmail.com>
Subject: How to trigger Yocto Linux /etc/profile or shell scripts in
 /etc/profile.d without shell logging in?
To: yocto <yocto@lists.yoctoproject.org>
Cc: OE <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 04:30:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156808

Hi,

The Yocto uses /etc/profile for root login, but there is no root
physical login in an embedded device so the /etc/profile is never
called, I added a shell script to /etc/profile.d, it was not called
either. Both /etc/profile and scripts in /etc/profile.d can only be
invoked when I physically log into the debug console, that is
impractical. Appreciate your advice, how do you resolve that kind of
problem?

Thank you.

Kind regards,

- jupiter

