Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D595C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 10:40:10 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.8822.1704969600070346271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 02:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QfnkVDiL;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so61850021fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 02:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969598; x=1705574398; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rmzQjrya9wTM7Y873g5PI238pjRYP8eCwXP5JZu5UzI=;
        b=QfnkVDiL2y/G2emWndSni8Teu2bl11ijDY9kNxGlHnuXCbR3TTUb0WdGwcwLyHGqxr
         IEncH1z5oQMPEGrr0mVeZgnWBDO/aMLYKmM4XqKIfEBVuNypDb53ObT8wk6h4wZKJ9Th
         0OyLukdUXhcQlcx/rVJWa9kiCO6fsM6V33r1oqwW5lHemkou24ZAkd+G8Jx+aXE2DkhL
         ARco+nUjJorcttdY4NTmU/M0jJEdFqK9cnF9OaosjU2FhteUiQBzGDiWavsFW6ZYKGco
         YbKkpxZFFU5fWnUqsVRgOyf+FnxGbktsdYN8vAYyyvdhdT6hJRphQlApOaoi5CIV1zgD
         QKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969598; x=1705574398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmzQjrya9wTM7Y873g5PI238pjRYP8eCwXP5JZu5UzI=;
        b=cSQV9TP39Dm3UR29/hPDi4SCnkBNb3HPv8YX8QBEE3sJoamQuYGCIocwPU/GqWeh3a
         VFY9XBwNrbSFVA8GGhtc/mCRUA+hXYw3fg6fDY/peTHfX3Dwuz50Vv39dtgqsXampe2k
         lFmLxpqMPMaCPf32A3Cr5XJMevpOCKneqvfUmBWCbkZkVvAd87nsk8NST8ahKirz+dn+
         btsZWasqIJhQO41FfNaCAOl56I/XFN8MmqUhXHOrTCXCI/b7GcsLk90t2xWjdhkLq5hu
         73iAi2KbD1GVziDTDLdinQ+U+utJjnp2O5ZlGOeRWYRmyBa1gwSpVQ/KIwn8W/rx1yof
         LySA==
X-Gm-Message-State: AOJu0YzOMGkTPISDeVVU9t0OQ/SHlh93+aiBH/ej9J+3oV3S+08G6+aO
	BOqBmFnfvqcFLeVGDeXgv4tw8fTAj8pulEMSdmM=
X-Google-Smtp-Source: AGHT+IE7/KDdXCcdOFPGAE2cVbxyp9RlDzNINUITWj1wdUEN/Jm0hDanH7MOjmOMK8rov6L7jIG+bdUc19PcBvNptho=
X-Received: by 2002:a2e:7d08:0:b0:2cd:1d5d:323b with SMTP id
 y8-20020a2e7d08000000b002cd1d5d323bmr274040ljc.1.1704969597973; Thu, 11 Jan
 2024 02:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20240110200329.2173442-1-alex@linutronix.de> <20240110200329.2173442-2-alex@linutronix.de>
 <2ef29e5b69f7e46c24be48828a650de28cbfd5ab.camel@linuxfoundation.org>
In-Reply-To: <2ef29e5b69f7e46c24be48828a650de28cbfd5ab.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Jan 2024 11:39:46 +0100
Message-ID: <CANNYZj8LHqO8yFXJ1R-c+xbWK5ge8CMd7bS=cPceW75r=70w2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] shadow: link executables statically for
 -native variant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 10:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193537

On Thu, 11 Jan 2024 at 11:10, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> There is still something not right:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6440
>
> :(

Yes, seems like each host distro's gcc has a different issue with what
we're trying to do :( I'll dig into it.

Alex

