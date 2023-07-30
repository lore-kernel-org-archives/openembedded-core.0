Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94001C001DC
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 12:43:30 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.72685.1690721008476943511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 05:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bonVP4Ed;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe1c285690so4617590e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690721007; x=1691325807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0X91hnDXt0Jsr3ilqYUAsZNbgsIMPEr5Q/OCNznSTA=;
        b=bonVP4EdHo8Xv0Apm6wQN6KeCH0AP105w4DLFl+BGy6UuJWSAp1S0yyPxOZJJzgcmd
         j8K/J66JH7qDxeVpR98RjkSDQ1QKBzghlm5Nn6DFw+IParVC6c0VDbK1wuB1T+YoSkru
         4D+k2nzdnKBIioIO4SumxGAmG8LkDPIVrL/BlZlvducdQbPMxjMtMzPI+EBBbxoDU4zH
         USfBeGmoqkRSyM8deWDd1xyMW36UWe0uD/2bLUk9KGFjw8i2XpEz3yws8QOvuiuOJXWM
         MjP1iH9sNrYqaxRj2K8/SE+sz1T9Ae76FnNBtRXF+oG0qFf3GxnGlRpSZlmOq4k2mYxf
         0YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690721007; x=1691325807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0X91hnDXt0Jsr3ilqYUAsZNbgsIMPEr5Q/OCNznSTA=;
        b=gDzI0U34JdiGEFDpRTICCThDO6FElsLV9+AuPM/e8ZWAXW25cI8yPpCSMqXXgzk82g
         D1j7WkCH5nmjdrXUvffkPToIp4Du75c4A4fI0sLs3ohylu4nBULfZk0hpAk+FZJg/RZv
         FD4qmrIffbBLeFSqF4PRuZTWhT2S70ouZUVre7IEvj+xIytdFqKUGD2Fqtd5dXfpak00
         8YnVZYmu/jtFyICtp4xwzDEouITsJgHMbfJTdZtrJ7BS7rbLYOVhdjYd/XPxRaXnIAzM
         U1oQzsaCEOUxBnC1gIpvkkMbevpF7lEBT7kXiZ3kQPpgcL3vR99D5Gba+1Bn5Wdo4868
         YkSw==
X-Gm-Message-State: ABy/qLaVmo7t3KfG4ot7vBQ8wIqTh65R30jxNcw+ltFMWdJ7PvS+3jLT
	5N9qlxJVOhjv0UdZVjwG6xa67VfiqqHkiqU365Q=
X-Google-Smtp-Source: APBJJlHbAkZMka3A/aoRl3DrOZtFWHrsCUKqLehrDFJar0NQ2RjiVAHAZJeTcmHxQKfc068ZoSboMVxgYcvnYmA/qy8=
X-Received: by 2002:a05:6512:5d2:b0:4fb:99d9:6ba2 with SMTP id
 o18-20020a05651205d200b004fb99d96ba2mr3657499lfo.24.1690721006389; Sun, 30
 Jul 2023 05:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230730080658a80a3cdf@mail.local> <CAMw=ZnT8J66vOCJbVwez=29+=HUG0R1Wy29E9-Vv1oz6O3Dejg@mail.gmail.com>
In-Reply-To: <CAMw=ZnT8J66vOCJbVwez=29+=HUG0R1Wy29E9-Vv1oz6O3Dejg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Jul 2023 14:43:14 +0200
Message-ID: <CANNYZj9nFRDRAwGtQkT9638TB9TkW_VcW5ZdWf4oiFtwuSGpTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: update to v254
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 12:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185068

On Sun, 30 Jul 2023 at 14:37, Luca Bocassi <luca.boccassi@gmail.com> wrote:
> > Jul 30 00:29:43 qemuarm64 systemd-logind[240]: New seat seat0.
> > Jul 30 00:29:43 qemuarm64 systemd-logind[240]: Watching system buttons on /dev/input/event1 (QEMU QEMU USB Keyboard)
> > Jul 30 00:29:47 qemuarm64 login[263]: pam_unix(login:auth): user [root] has blank password; authenticated without it
> > Jul 30 00:29:47 qemuarm64 login[263]: pam_unix(login:session): session opened for user root(uid=0) by LOGIN(uid=0)
> > Jul 30 00:29:51 qemuarm64 systemd-logind[240]: New session c1 of user root.
> > Jul 30 00:29:51 qemuarm64 (systemd): PAM unable to dlopen(/usr/lib/security/pam_umask.so): /usr/lib/security/pam_umask.so: cannot open shared object file: No such file or directory
>
> That's an optional module, it just means it's not installed. Not sure
> which recipe provides it in yocto. It can be ignored, or the module
> can be installed, or a custom pam config that removes it can be used.

The right way to fix this would be to add a RRECOMMENDS on the package
containing the module to the package containing the binary that
attempts to load it. The module comes from libpam recipe.

Alex

