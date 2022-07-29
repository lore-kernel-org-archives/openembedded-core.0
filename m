Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2963C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 20:12:04 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.1599.1659125520212285502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 13:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pmUGbN9S;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id h12so6327308ljg.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 13:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6aHjbIn/vrDBOsArVVxH0/A4ZNv+rQmnbFXoMINEs+A=;
        b=pmUGbN9Stue5KzgWVlf8Qj3hN1lnqVlj9ipP+S+DN4CMjoucZ1qFPl3TJlrm3XClBF
         L3zm0H1ryBqHSmHGkp5I5sg6akFAH57SZ/ocR588bddEP8HuzqTzPuvcOAsR0zeNqUsp
         TOIIHWL5lNSy7hwuiUBFZewppjWX9iAIMyDplIVnavY48vs+TrjNB1hITE8IKBtGIhZo
         S2lYxo5fmpLvuAlTWjGHQQ9yZ0+K7IpcT/WLKl3B0dJ/CrQsxvYHpFgv2lzpmDmYEmY+
         rRI2wWR+QyChFVP6sHN0VhnQe/QYZKgi4hcaC1WAgWjTJ41pT6f+Sh1RkoLf2EdY9BAd
         5WCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6aHjbIn/vrDBOsArVVxH0/A4ZNv+rQmnbFXoMINEs+A=;
        b=L/KCfIPG1RncwneNi+AVmeMl0bc0OXrr/JL+paTWhaWAYQokB+Nhr/ZsrI3BGfeBU/
         76SNOxy4SHPdyKjA6ZnQaPfQ9jnxymkLs3OKiXo/TCSWpvq7iXgBY4C6zW/G0kl7VRPx
         Jd1Zp2pwcBD9HvPiJTB6gCu5TAhnzZD6A3/ZTHPcai6G2EzIr7P3xo9E1eXBguGAhLSR
         0BTUfdnwDgQwevr8k0jmfh3wggrpZZhctV8XPNdYRhWXDg1ASUKSW50ABK4ozgobQXoT
         ys6b2yZOTKhCj8KAnRvmPHYmofTcQS5SmiLANtCrG+BVoqfv+H0ehvoyOFPtTeCqtu4h
         8V0w==
X-Gm-Message-State: AJIora+fh9dUUWdpNGmfzrG4fla9432sE01ax071U/3pv5Zu9PJqt5a2
	RtyTE++5F6yGZNK0n7dXXog6BT9dBf1FTqo1Y04=
X-Google-Smtp-Source: 
 AGRyM1uXUWMYI5//1ZWcKHfe9XqBZ1c0y+5KJYSPuIJd1EmwIxAkuuzjLYolYAqBHKQg+WHnAjgwdMPAYIZbt1BUoi8=
X-Received: by 2002:a05:651c:2128:b0:25e:2262:5d3d with SMTP id
 a40-20020a05651c212800b0025e22625d3dmr1762801ljq.191.1659125517530; Fri, 29
 Jul 2022 13:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220729141049.835733-1-alex@linutronix.de>
 <57a6142f5c2f444288e16632839dc647@axis.com>
In-Reply-To: <57a6142f5c2f444288e16632839dc647@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Jul 2022 22:11:45 +0200
Message-ID: 
 <CANNYZj9xE8EUR385HAy5BPcsiL8G_LPwaY9Q3GAXBp7sv45t4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] scripts/oe-setup-builddir: make it known
 where configurations come from
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 20:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168676

On Fri, 29 Jul 2022 at 21:55, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Please continue to limit the text to within 80 characters (as it was):
>
> You may wish to edit it to, for example, select a different MACHINE (target
> hardware). See conf/local.conf for more information as common configuration
> options are commented.
>
> or:
>
> You may wish to edit it to, e.g., select a different MACHINE (target hardware).
> See conf/local.conf for more information as common configuration options are
> commented.

I can do that, but I'm curious about this 80 character limit. Who
cares, in 2022, and why?

Alex

