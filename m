Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B96FC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 13:09:06 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web09.10107.1664456940138102892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 06:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lgxArY2F;
 spf=pass (domain: gmail.com, ip: 209.85.166.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id 138so838820iou.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 06:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dXWCJezuTwaLebrvDGucnKrSS9X4c3bXRkAv4uhm1VE=;
        b=lgxArY2FpZcTNKFIBjkxkazhoOhPnwiUNNm8W+qPjWSAPeAO1s7s4aFErrIOuROVR0
         KrIP95dv+1LGBaTeH9tAxufVvkQlEeUoYb4vFOcOzhVD8Jlzb9eVcrqMFk49uGNvCnCG
         HCLTA9eoItjmq6xwFgknzDEgATUqFLviyO0mhUoHW0a+AVarWej1sFsUvALpG8D0z46q
         VVL628ruMKwidKhoXjrDfmr52QMuMBVAGQ63sBDQW52RnI2ClBIlbMvG9HrvQklc8NIT
         yQG31g8ThP+UDhTLxTw2TPBJljJeh9fzqpg4H4R2LqXX9U/FRPOLYehKJSl4BAKjcs6T
         B74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dXWCJezuTwaLebrvDGucnKrSS9X4c3bXRkAv4uhm1VE=;
        b=F4sP7z6QXecNzOQ/IOt0qD/rLO8h8Dy6tIhuGf1ACREl+W6ghajHghQ6wILo4Z7Bxm
         U2H6y0JLWto9FA9i8PwWI22o6CBPfa0GxlI5Sgbe2UXNPwUK6uk/bGAjw+/G2f640vWm
         0titqn/Go4jDcd9IeNr2wq6T/cbahb2a1CToOPhrRIPsYm80CONoi7G5XPi9SX6nHhUx
         do/KzBA+I0y8pF3LIoR3Qh1U6Z5yj6Wo/YJPfL02MaQ29M0m5qlQRPwyNBaxkdPUyo0M
         pjM5LWWCHQQCgugXadGEUiIn3qTon2UM8LVC4Wi0ehb0D7gGBbbmqIwIMjgdRh39k5uQ
         bjaQ==
X-Gm-Message-State: ACrzQf3xObmwXtxTX3RHvA0SUtOwP8k+A9kpJo55pFG4R/B9QTt4NvmS
	rTQf1sn1JmaMX+WjvqtQB6cvzLuC/YLs0nhkiRo=
X-Google-Smtp-Source: 
 AMsMyM67hpz0WrTPutij09aKG0DhhfKAkwUaa+EPukxJCGnco1I9qg6Tom5jMzjPV8+3seoyrE8nM/VMA9hQ7DUNXKc=
X-Received: by 2002:a05:6638:14d6:b0:35a:6425:a027 with SMTP id
 l22-20020a05663814d600b0035a6425a027mr1834796jak.254.1664456939543; Thu, 29
 Sep 2022 06:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220929125750.3338743-1-f_l_k@t-online.de>
In-Reply-To: <20220929125750.3338743-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Sep 2022 15:08:48 +0200
Message-ID: 
 <CANNYZj-=0t5jxJq_JhW0gUz5-P_Ni_P0mCjRb0ikRdso-oiN-w@mail.gmail.com>
Subject: Re: [oe-core][PATCH] wic-imager-direct.py: use fstab update also for
 root device
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 13:09:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171187

Can you describe in more detail what the problem is (e.g. an example
of incorrect output), and what changes with this patch?

Alex

On Thu, 29 Sept 2022 at 14:58, Markus Volk <f_l_k@t-online.de> wrote:
>
> Remove the hardcoded root device entry from fstab when updating to
> avoid duplicate entries.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index da483daed5..fd86a094d9 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
>          updated = False
>          for part in self.parts:
>              if not part.realnum or not part.mountpoint \
> -               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
> +               or not part.mountpoint.startswith('/'):
>                  continue
>
>              if part.use_uuid:
> @@ -145,6 +145,11 @@ class DirectPlugin(ImagerPlugin):
>              fstab_lines.append(line)
>              updated = True
>
> +        for line in fstab_lines:
> +            if '/dev/root' in line:
> +                fstab_lines.remove(line)
> +                updated = True
> +
>          if updated:
>              self.updated_fstab_path = os.path.join(self.workdir, "fstab")
>              with open(self.updated_fstab_path, "w") as f:
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171186): https://lists.openembedded.org/g/openembedded-core/message/171186
> Mute This Topic: https://lists.openembedded.org/mt/93993381/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

