Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2AFC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 17:40:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.52059.1643737205766377235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=HJX1bz3K;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso2592531wma.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xRCPFPj/YG36rgjJy6/BLo93DHXEtfJzCSLU3KoD7iM=;
        b=HJX1bz3KXUo5pQV/NZClrKMMH4kscQ9FIkl5NGaD390t4bOUfOvvi9eFDaK27t66/B
         gyuKRIJRLLls6TJgErF1rOgkmGwvs3fStr0RaqkbcBmLxKaDhr+p4IFlEPgbNpn7efay
         xYU++k2kfz5No0ioH/1jZJ/MS4cEtomLM069gxwONwRlM/bRfcFaFMa+4ATBHbpK87ZE
         l8YJ59tec9lVE+y30J7dL9P2/ULm0PjF7MORh/7HYfTpvKT3/Ay8iZDS0CpjbzzVooo2
         OJRK7w22sX0cJd14eu+WYoh7EY44e7+wCa/Ar+riAB0GE04tXx8TF5v01WVRXpYi7owx
         5iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xRCPFPj/YG36rgjJy6/BLo93DHXEtfJzCSLU3KoD7iM=;
        b=XUC1IgdbTibpHld/YAZZLwYeHMwjbWNAeHAtTvjc9o+ugYt2C0f6J5OoMG0Rfql+Ay
         vwzIiTPBPxgX/FNojfBAMSB0H4g/tE1uJKtWZgb9KLbpzpOoQU0hGZR1SkbB9usVpqKM
         Zc8JIVqLClgJdeF1kPfRmDi2hVTzb3+t3IvxLqyQzZSHg9bnpi36+g7CQRfz8HVO8KIW
         +Ua+xpvk7yJFJgGg1fE6Pplkesc9fh3Q1BexTADlyVhYIxQs2E9guRNYRJB2Pw5p1YJ/
         bYy0zyQIajqONmhusg1h+DU0W5eiotbW6s7Oou4+DXqk0G+Uwk3m61wvxc//ELIVjHVm
         k2ZQ==
X-Gm-Message-State: AOAM531YEGJNtKcQeJYW8nmEjbyq9YkgSEkznlTgJCpTNDmHY+qodyD3
	KKZVa4w5QvuZzorGyjB35Gnqqd1d8UVpWkW7ZADT3A==
X-Google-Smtp-Source: 
 ABdhPJz+Yt0T1PmnKdQFRQzYAL/54HXjX5P7LflGhyBrAdXyNqBPSoRti3qVS4mqEAOrybskBisQetA64xPN/RnrWRY=
X-Received: by 2002:a05:600c:2d52:: with SMTP id
 a18mr2720353wmg.69.1643737204223;
 Tue, 01 Feb 2022 09:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20220201133054.3265186-1-alex@linutronix.de>
 <20220201133054.3265186-2-alex@linutronix.de>
In-Reply-To: <20220201133054.3265186-2-alex@linutronix.de>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 1 Feb 2022 17:39:53 +0000
Message-ID: 
 <CAAnfSTujxWZyGsWfCGyJiOOn1U4vaYc1OT9O2LgGH+i2VgfVXw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/2] weston: upgrade 9.0.0 -> 10.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>,
 Marius Vlad <marius.vlad@collabora.com>,
	Daniel Stone <daniel.stone@collabora.com>, Chen Qi <qi.chen@windriver.com>,
	Denys Dmytriyenko <denys@ti.com>, Tom Hochstein <tom.hochstein@nxp.com>,
	Jussi Kukkonen <jussi.kukkonen@intel.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 17:40:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161164

On Tue, 1 Feb 2022 at 13:31, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> weston-launch can be replaced by starting weston directly, with
> a seat management daemon for support. This is provided either
> by systemd, or on systemd-less systems, by seatd. The sysvinit
> startup scripts and tests have been rewritten accordingly. Bonus
> fix: under sysvinit weston now starts under weston user as it should,
> and not under root.

Awesome, thanks!

Ross

