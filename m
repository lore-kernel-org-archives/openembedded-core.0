Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.5507.1601501496126563243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 14:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KOg/1W5y;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id 16so3110653qkf.4
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 14:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HjvFCyTUYpMi0iQ/5E26pVSLEe3qNWQBpIZg968f4lI=;
        b=KOg/1W5yFwc6kQTmAus+UVzzO7mi5BPzXSBiDGuJ4Ab2A6b1WgvQ1SHiFAe6eR4i1g
         Q1zNt9+RrD/4upwnDTP1V3r7IL+7C8bf5FyQfu0Ab/nr+XQedBA2L5/tbELHweVvrm8E
         d7iH0ka59pp8gQtfHH3O/jZHibW6L0LPVTB9hVAzjhUiEqo4NBIegOu/rz6O/IM7RLvI
         kOAsb4NM6GZL2N5i5BLUMSx9OF3bWCdi9YQBfnFTbnSrdHbf1zlDnA7t8gCrnle7v+tT
         EurC3pwuKiPuEbT08X+tCrhMsZFckwROwtjWVR/hOE/QqNrh0vCmMvRjKKTv4MxNoH/Z
         svXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HjvFCyTUYpMi0iQ/5E26pVSLEe3qNWQBpIZg968f4lI=;
        b=Ot2H1s9pjbvzo3uIY6vC5uwNladb3mEVjzkpXvLWHZTeT4fUAd+fdrvwWNdJfgGItt
         QiPjtidkGaxwThlL5bvEXEXXIf/zYYolehGta3ldcWRYvO+EtBlyk+S6RYM8goPTSUQ3
         vN3wQTENp46rBZFgKLqYcclQdxmMygigFQjPnGE4QHXX5fL/gr/N6OENsRGy8u49KuhC
         WsiWz1/RQGEFkFLO0/N+PExtoqt0RMBxKYNy3T6Ysrhv1OWkKYQcazWNUKQlI5Pryhxu
         0I2FnO7Tc/AgRJxRTOzYFuE5kMYbUk4vA4J9hiPDJyYolcri+9RjJ0mTW8yWOPMNP/wq
         U8qg==
X-Gm-Message-State: AOAM532V7ixIU8UE4OnrBsMxDuqjeW/bjBRVI4R75zeZCii9M7FL0iqo
	cu8IGuh4opTa3auO9VC0yd02fu+h3sfUTrp616g=
X-Google-Smtp-Source: ABdhPJzzpl0+H5auI2OCwXXHHl8jLhGQqeATT3I4v39s89f24+Bo42nf5omyG2VLAwJgsM/USousRMdbS0RmFaHoU4k=
X-Received: by 2002:a05:620a:13f6:: with SMTP id h22mr4880050qkl.9.1601501495166;
 Wed, 30 Sep 2020 14:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211644.119920-1-otavio@ossystems.com.br>
In-Reply-To: <20200930211644.119920-1-otavio@ossystems.com.br>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 30 Sep 2020 14:31:09 -0700
Message-ID: <CAMKF1srtqeTcBsXoR=DLa73_b7Zswf+TbuAw2zZPiRpraoZi-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston-init: Add environment file support for systemd unit file
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Fabio Berton <fabio.berton@ossystems.com.br>, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 30, 2020 at 2:17 PM Otavio Salvador
<otavio.salvador@gmail.com> wrote:
>
> From: Fabio Berton <fabio.berton@ossystems.com.br>
>
> The /etc/default/weston file is already installed and it can be used
> as systemd EnvironmentFile.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/recipes-graphics/wayland/weston-init/weston@.service | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
> index 0a1df15bdf..ce8f4fb71a 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston@.service
> +++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
> @@ -29,6 +29,7 @@ ConditionPathExists=/dev/tty0
>  [Service]
>  # Requires systemd-notify.so Weston plugin.
>  Type=notify
> +EnvironmentFile=/etc/default/weston

Lets make it not fail when not there

EnvironmentFile=-/etc/default/weston

>  ExecStart=/usr/bin/weston --modules=systemd-notify.so
>
>  # Optional watchdog setup
> --
> 2.28.0
>
>
> 
>
