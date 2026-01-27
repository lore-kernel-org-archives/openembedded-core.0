Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0D7D2FECD
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 17:50:11 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17846.1769536201991411814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 09:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lr3vSLs0;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c5384ee23fso657529385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 09:50:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769536201; cv=none;
        d=google.com; s=arc-20240605;
        b=TFwrJjvvuFl0HBJwgNVyP5B3ZSqIbFfk2c90noRtEILMVa3ZKmiMCf3cOfXo5IkvDp
         uvfm8OuKmrO7wkqxydZ0VHDHTHbMhMy6T6N2XfV9uPN2hKA0EdCS3ecvsMR6UH76JLVx
         /LweR0h4b2Joqh3xOi8WI8P7JiczQOxaX9WXhzULlZ+7lbSKFFPR4V6rS8QQVmMwANt8
         M87w8wsHYhGguFw5oYAY8qPhAZxZkkch2ER8kxxy7vMl9v04hAVp/0d+f8OjJzeDn3h6
         s7YDUXhob6s2mmrgFo1kZyyJtaXxB0z3+6LpGvaSI+9omT0Fu7t0aJNb1KxaHSYpdHUG
         ODGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EYKQ6k7YIHkI9PeNgqf5wGzyd3wVeyagM+o6NOcEpjw=;
        fh=Wx+49bi7uC8DvDnCIOOa67feo6Xu9DmIMBe6ILAvdCg=;
        b=k+8+WuOftWnPAKF7aqZVole7SY76HkCbdcNX95zUQ3774AtodeMDNCDWUPDjy5KJ5A
         iZpST75yS4+0C2afyAhlAcKVsMAYRO3rDfSrMboF4dpIpLxdIgzHsjqPg+pysgq9Y5th
         zd/TTL+cujBKtRbhKbe67Hzq/cFxj/0vsAxWuzWhJPBwj7VRoYAV4TTi5bdi4/5n69du
         I8dSdD6H7vC0LSk2ZNe7CgyEBRC1gkJ6qeBCIHL1UBMzSF7vEEtA5taj4fM5Hu+gsKQX
         9pAjXl5p5/SnchrKBzwsjR7SkU4IZnr/iLKP2AiYIQVOd+YL4Nw7POiRgjhHTmsP/fiv
         4Irg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769536201; x=1770141001; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EYKQ6k7YIHkI9PeNgqf5wGzyd3wVeyagM+o6NOcEpjw=;
        b=Lr3vSLs0tOaDN/QKDYiFx78ycewi8z3eiFiusQ7SDi8YvJXYK4Dnpjm3NfpE6lbeHq
         ETKEmhyzPj7fNY2pW3AaTtp+EJ1BPo2zaLo2MJe9oIzDwMow7YhYQroJZHMz1VziGhac
         8xgC+/wbGBFWtBCzj1yT81P6m7OnfdgeBtUKqgJQ6O0Werbk1QgFhrIsG6J5uOzVMCcg
         ctr19iNOOFBBgUqGtcDQkcPCPptMLTRTyhE86cR4OwpykG+79MYZ+WC95uc278CCfH0t
         GgIZVVCsui2oZfV+wvAm8X/yNc0NqVbumgG6ZO0HWNTQLlJS95hpGw43/wg2TGwRFkkD
         U4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769536201; x=1770141001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYKQ6k7YIHkI9PeNgqf5wGzyd3wVeyagM+o6NOcEpjw=;
        b=AP9xOhWF7NFLjbC3Nqc+9Np+mx831F27qkz0poO0DGQ+AuYUDWg0/zHW0E4fmgUssq
         iEUuFYk1SO7Ot5XwMwuO+y6KHWCkzKiiwr9Tu+aqnDPJumCjg7S3/CJD3GfpeDy1nBPO
         h/uau3at6yNmu3NV6ceqbNTfF4oQusEO+4N/c8gnwEZF8fn93OWZl4J0IcWOloCfeOOM
         lxN/UwGQW8MSLgrP2KmNP06b8DCRBHwa+2tN7sE64fnyMo2yvIo5qN/rt37Sc+kOrigi
         zWqgkpWOZxitV3hJ8Ol6qgNJ/brpl/EYBPAlW9bG08p1OC0YjOMBJCK34ITWlag0Qoq1
         7YWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF9x32sHzW4DMd0NTg2XGPGaOOCQlY5Eu/gLN/IhHfztRx2XkCLgiVIIdeH2D1fMwQOZHwYfEO885jlZ72JCKRug==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6Yoo7dW1z5FgTw1FFsKHCIf4t+Cqq+ct2B+PaI/dZG7b08V1H
	TaKjlpOq+8ScfID/4OtjA43SVsme6NIErcsJCH5ta8tV+k171Xdv95La8K1VoHtPiHieB0OWoCN
	SLDI4H1mS+sSnINWZqxGg/bCiWNAD9xE7QQ==
X-Gm-Gg: AZuq6aLfRaq0KpZsJgZAp+J7pRx8JKVFVaRTUOwf1sEQBa7NmyGJ+EcLeJ6nUFOtIiV
	ASxJgSxT4ivl2V8Rgo9FDCx1KBkRt3SmfnagmZX/vzPRhx07klbkrOVL11qqfrq8DK40PUkPmzj
	ioLCSa+YDcR9AxtVbIYZCLOALhyrshnimDwryhgKjB6NBiDaPG8UViMbvDh0yh7TNAPE4xL5/Ag
	jV2IWFEPW3muTGC4RkdD/qAJUkVfC1cI1zEDq2rOo0RDymXVjRaDdneeSvfxFnV18I+l18CBAZX
	SdRrWrXWJ3g/ESDxIeZ9hhmAqpw0sg==
X-Received: by 2002:a05:620a:1a9d:b0:8c6:a734:7d8a with SMTP id
 af79cd13be357-8c70b84537emr309491385a.4.1769536200880; Tue, 27 Jan 2026
 09:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20260123172613.3305069-1-corentin.guillevic@smile.fr> <DFZFC4DZCGPP.23B0TOYETVJI8@bootlin.com>
In-Reply-To: <DFZFC4DZCGPP.23B0TOYETVJI8@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 18:49:50 +0100
X-Gm-Features: AZwV_QiJA7dxYKAAXsjKy6n6DvFq2fCaB1N0-L1AjzGssqt51Nh77vg8XbEs6xE
Message-ID: <CANNYZj8nQ2_7XxGnotCO745jfgPM4eE8VOjjYpt-KV+V7tmrnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/2] oe-setup-layers: support inline URI
To: mathieu.dubois-briand@bootlin.com
Cc: corentin.guillevic@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 17:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230060

On Tue, 27 Jan 2026 at 14:59, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
>   from jsonschema.cli import main
> {'branch': 'master', 'describe': '', 'uri': 'https://github.com/kanavin/meta-alex', 'rev': '05b25605fb8b2399e4706d7323828676bf0da0b5'}: Additional properties are not allowed ('uri' was unexpected)
> {'branch': 'master', 'describe': '15.0-hardknott-3.3-310-g0a96edae', 'uri': 'git://git.yoctoproject.org/meta-intel', 'rev': '0a96edae609a3f48befac36af82cf1eed6786b4a'}: Additional properties are not allowed ('uri' was unexpected)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3102
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2998

The schema needs to be updated with the corresponding bitbake
patchset, so these two patchsets must be tested in lockstep.

Alex

