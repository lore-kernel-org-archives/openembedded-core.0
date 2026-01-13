Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796C5D2F32F
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:19:43 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61185.1768317570603795145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 07:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mHMGOi8B;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee1e18fb37so71907641cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 07:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768317570; x=1768922370; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XsVT8k4LRMvdolZPXyAmxkJPK0liYnURljkQEuWNCeU=;
        b=mHMGOi8BGB7yFcKi5XVYYLWzLqG7sv1PI46fTu+MfEMWyEMxZIdIW1v+U6ejBw3CC0
         xwQ3AJuMkdiBiRJqZ7WYkDbYWL8sHTxF9pw9Ut+P179dbscn9LRJFOMzfZGlHsMA3M7z
         OHGdJVrXmFSuoz8Yhbu04Q6uiW/suDIq81ancP7BoTYdw/w9//DtdWByUUCISYWbI/2d
         jpw1uZxZQ1IgyPgNm9FVwXYWIKxMTN+VZ2CTp465noX+zfgR1fr+iIXM/jC8jy99fU4n
         54g48BStzU5NwlgUOg8cRLVBfj87Ih6t1WOy5mUBm8gEgIlt6zK0eALR9ytd2lmNOpam
         ljBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317570; x=1768922370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsVT8k4LRMvdolZPXyAmxkJPK0liYnURljkQEuWNCeU=;
        b=B6Rt/q01MrIUxVqt/+PRzoodsrwleZqz3SEUvCDwKdnVeU+J7YoCtmoAlcu82VmYPc
         1W/s5m73uQe0vYG36L/XlrjkeiPSzTKBy99QZdUWUvBFteDbOu7PuksFFhM3NOzXDpSo
         vsc4jHlCzjuN3wL3f2x6Izi2Y9pw3aHG8k6lNCUJlNomgxztuif9+/jWwvxN9SKNsFaj
         i/2ZSo+uRidVibrM3YYdS5oZNXoEqpdt/tQbjJAH18mcO18gvnJbe44LVNhrNXjfp71C
         UzIErKZzOOs4BsIjcNLlCnPF7RcAdk20Km03aNN0cGucD0C624ky96tgub1vqEcedlYx
         O8/w==
X-Gm-Message-State: AOJu0YxzY/8oRBmwaVPxylRQoSXYW/Yg4tDYKy1HHHiNyc8DpPQ1xlxX
	dSx/D87ddfSmfG1tL+7QtncT6lwB52vuCzP/LwfLctyMd1RJxtYZn/fdssYpLitW5mPzeiZlNej
	fb4/5ysT8E/Y6rDMVG2puzZZbjMJ+Gx0=
X-Gm-Gg: AY/fxX7C28XAABQC0jsyBL99nGhRwuspd3dYn/rFwFO7N/NQNXowQOpunieWvkSjPbs
	5GxcQDK6IvybO+FYRXndKmqR/J+FAWiy4kU+M34pk+Y243WXWC83jkGxvGzobJnGTDLrQ6/gzIV
	iR57OJXUjGBM7RfyvT/DF627uFxQ0lv5Rxm6Z6dBWib/mhwlZojb/Qp4lY0i3ywXYKUKo4bxZPB
	FYe5NclQOJJBxjM0Cg7KxX3EK0gpLlbfMUY5QdHBHDe1vo8nQ/MvpMCTV0NH8gVWdp7n09H
X-Google-Smtp-Source: AGHT+IF15uAz9kY8bHoguSYbiDavubZ8P4wJE7KBBGZ4fZChoiGvwWGbKZx+4dm4vOFNAWoPjQ+1V6BnHxwTLBFt5o0=
X-Received: by 2002:ac8:5789:0:b0:4ed:5f45:42c0 with SMTP id
 d75a77b69052e-4ffb4a2b801mr326025241cf.62.1768317569395; Tue, 13 Jan 2026
 07:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20260113-icu-major-version-fix-v1-1-50e1e75b4254@phytec.de>
 <CANNYZj90X_vSfAhUAVhiik+RNKSydLMD8iv_AoRHUAm1TQSjzQ@mail.gmail.com> <458f839bc4a7f231cf4c1a8ea442bbcd5601a353.camel@phytec.de>
In-Reply-To: <458f839bc4a7f231cf4c1a8ea442bbcd5601a353.camel@phytec.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Jan 2026 16:19:17 +0100
X-Gm-Features: AZwV_QjHlClzq3nhoKv-ulmaTIaYxZZ7srdV7F9VU4qxAaD92BRCuJF7S035b4I
Message-ID: <CANNYZj_OyYm5djfbH6VcsTd-jEYbQ8Shn4rk0Rk-bMHx=XwWqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: split at '.' instead of '-' for major version
To: Yannic Moog <Y.Moog@phytec.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>, "upstream@lists.phytec.de" <upstream@lists.phytec.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 15:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229274

On Tue, 13 Jan 2026 at 13:42, Yannic Moog <Y.Moog@phytec.de> wrote:

> Yep. I was mistaken initially. The task that failed for me is the do_make_icudata.
>
> Within that task, the last command fails:
>
> do_make_icudata:class-target () {
>     ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
>     [...]
>     install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
> }
>
> We do not see it with poky, because PACKAGECONFIG does not contain make-icudata.
> We have the following in a bbappend of our distro layer:
>
> FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> SRC_URI += "file://filter.json"
> PACKAGECONFIG += "make-icudata"
> PACKAGECONFIG:pn-icu-native += " make-icudata"
>
> which triggers the error.

Thanks. Can you add this information to the commit message and resend the patch?

Alex

