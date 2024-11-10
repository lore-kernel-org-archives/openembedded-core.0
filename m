Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C21D12D49
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 16:34:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.39062.1731256436236443605
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 08:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bgqHcO50;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53a007743e7so4545511e87.1;
        Sun, 10 Nov 2024 08:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731256434; x=1731861234; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0saxyfqE7qBtPPpiq2Boj2K4qsfXFTpzkh8aznBNxg=;
        b=bgqHcO501M3fj8a2VI6Ayve3Eb2T8jOYyqn7JxOXFIKS0uCmnqvnZmc8LSHkOicxbR
         k/SvRlYwUAw7w2CQmivydhLjzpxyNaMovGLmnRobdpDQlfnOV2/bSIhtwokYNSUL52oy
         PGYicw5A+Z9hIwF3ocUGcu6gxKmYJYYeNR7xg76UH3BvR2qKkTxfNhWLar0v93RC8YAu
         yDSoJ9SO9rA0lRiiLxpC0FignH7/avY4TUr55YoF7zbIjzHawpNjQ9MfthLa+/uIFK7Z
         PqRneX2YBtfGQPSfKktEGFtlqsUN3PC/8DQBCr07C0fXjhumOxoF4iDXQJACrrRJ6F8C
         VAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731256434; x=1731861234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0saxyfqE7qBtPPpiq2Boj2K4qsfXFTpzkh8aznBNxg=;
        b=p87AHGge4sqeDQAVBI9Ih9sEEPPEO55Kka5pM4senSIwh0Zghsz9qfppjD5HLm0LsS
         2LPL8iUJ8BBh42jl2ORgnMoVlG2dBbOGQP8/dM7Kro9Uw6fvaPxeq5ND5F/yP9YauaHl
         0HzRrNgXR/525xrb4ZQeQlJj058PDxj0PM6GC+kvgAPOaRXIHD8lxzFVonwzGkfW5gVc
         e9MRmLsWFaD8zBAsv+QNo6XXxHz6+T466ChrAyr6h9O/Pbf7gTH6eF99ttyJm1MObCMQ
         es6fUFvUiOv6M6xigvYNTCxX5F4BXIdBkR3arfdVyrUVdQIoMnu8q3l6JG/eYjXduXRy
         KoKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7672n/QZv3muQhJW3MUvQL+7Nm47ujhMQaf20qqEJ4JFz+mNTrTZqG5lB23XziPVL/5uI8KE4zvVs90KbhWaG1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgfHrzV2PVEyG076zeM06gq2I6YYkxZ+5b1B/qQe4WOUvmAXT1
	mSniG5X9d4vVB0BnQ2AZ9DlAKknbTNaRkfX4hFZDwWBtEnl+rl+oNeU57d3eqCf3RQ1f4ZAm6Yu
	QwIoAQ6XOTJ2ECAiSZRuHqGwkOW8SKA==
X-Google-Smtp-Source: AGHT+IG3ISNeh2uzI0/tnB95AdFNynXs7W1diMRnUQXm2J/jMmbCVhV0HDUAVfvWBsmmrP2qU7FpN9cCqBqvONi6f1A=
X-Received: by 2002:a05:6512:3f17:b0:536:53e3:fe9d with SMTP id
 2adb3069b0e04-53d86231846mr4459833e87.18.1731256433681; Sun, 10 Nov 2024
 08:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20241110132848.2135721-1-f_l_k@t-online.de> <CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
 <1806A2E5B9CEF1AC.19665@lists.openembedded.org> <SQQQMS.OQC2MWOKNELB1@t-online.de>
In-Reply-To: <SQQQMS.OQC2MWOKNELB1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 10 Nov 2024 17:33:42 +0100
Message-ID: <CANNYZj_AK7rWMRkkiincd7TZwWX4+iYziAM=UG5kOmKSC9nvSg@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: Markus Volk <f_l_k@t-online.de>
Cc: "Alexander Kanavin via lists.openembedded.org" <alex.kanavin=gmail.com@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 16:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206926

On Sun, 10 Nov 2024 at 16:21, Markus Volk <f_l_k@t-online.de> wrote:
>
> According to meson documentation:
>
>   --auto-features {enabled,disabled,auto}
>                                         Override value of all 'auto' features
>                                         (default: auto).

Shouldn't this go to meson.bbclass then? It's useful everywhere.

Alex

