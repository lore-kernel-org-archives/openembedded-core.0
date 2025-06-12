Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E84C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 08:47:13 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.7913.1749718030931724210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 01:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CgX4h6J+;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d09a17d2f7so63102785a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749718030; x=1750322830; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YMRx05K1Xe4JHfPAB1pLn7VZqCVDz6C79Jq5K4y0s1k=;
        b=CgX4h6J+OVqa3aENgcwwn0rhUGlE7VGU0DqbDExwCAwSceFO2KqVnZ0UR+vdhUECFm
         vHWxkB5dD9ZMt1ITcvrfYn+qkWodj4b3GxIx8HYzbts8E3C3iv2hgIMmEqo6vsXBJM8b
         LpEWcEt6UVUDq3XfjHEy7/e6J0giLlY1NV3XgbAaR+aXdkrZ8CBVLOKaqZrVKHvR2zDw
         N3/2DoWAQEuCtgpCBPA13b/HhtmV0Ifv7HeTjaK4qIZw8Ryy//juCEWvJqKwDto07oZE
         /Od+F+B6Efvdhl3GC9K3LQNM6X/wag3DDvkxx0JGCjFRNj9+r3upZcMkBt3th2Z4O1+B
         VMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749718030; x=1750322830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMRx05K1Xe4JHfPAB1pLn7VZqCVDz6C79Jq5K4y0s1k=;
        b=V/v2iUwDdVLV4e04YfUqGl+YUPmoXcziUB/NIK3nxqsbBrmf7bDdaQUe/QwVQIIGgL
         n+GGdHOAxzR9z5iKtQ8YcQ8GhwiCfkMwXD25EFI68cSUlqmpMzgJAV44132fuWCbb9Eg
         Y+ilj/KHWbhOOaqzsseN4K5243hKB/3Tgt+ZykMDu+UmGMKA2c/YDoDhBq5odRy5V33a
         vCEeeh51ZqWTtgqOQt6tTiUa7SvdFEs6iJlFfnSuod/Nx8oTEQskyFDpB91ckpQoVciR
         PCEWPQNasCXC3Jm/8cqsHzTbF3fc2ZuvvyAFZU1gH9IqjKnecGLxkOfHUe2vFV53EQYV
         c3ng==
X-Gm-Message-State: AOJu0YwrvwLLYbF/qjUM8lwU0CW0Hpg+4Fj557H//IabtYnvgzmVQpD6
	/6aupmZ/wD92MfK58cr0bNLvR1k2dpIpW0UtNsecK2bfppy9IMEhywX/XcciCxtXy4Ml3opbGyW
	RbRhzBu7LqC85KtLW4LGqp/fDmHyXqC+Y8Q==
X-Gm-Gg: ASbGnct0FuWBRbr1LMJ3zynBuwPzfhHbJBicEx1BUzy4ZOsR5j+gNMHuw4kmfKw8PeC
	LuqkYX0lvh19KV0Nnw0K08ZS6wk158xsRUuCGyFIaBvX02hPm0Zy05pXyfBWwgDFzkaiHv/QtWQ
	eFq6JtBkQw/ZNk99ivp5RMMWaSqu91gZT1x5FmjdWDPGxX83N26LUijlBxNV6jPuRyt0OFbrEGD
	Vo3aA==
X-Google-Smtp-Source: AGHT+IEzISUwfudgxnVqBCFpJKvf0MFFbpeFrkYvpMGsHacfprVCuqkEU6pNO1dPV/sZLLYiz0cK41DReMjrNdWbZUA=
X-Received: by 2002:a05:620a:29c2:b0:7d2:1930:52a4 with SMTP id
 af79cd13be357-7d3b36bf152mr333021685a.46.1749718030007; Thu, 12 Jun 2025
 01:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250610094400.1653931-1-alex.kanavin@gmail.com> <9708ea34-8a8c-4704-951c-d4e8b0973fc7@gmail.com>
In-Reply-To: <9708ea34-8a8c-4704-951c-d4e8b0973fc7@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Jun 2025 10:46:59 +0200
X-Gm-Features: AX0GCFvaa3MefP3nGZYMnTlb-f088vodijrdAlu6rdzA9Cb4mGP-Bh9Tyg34Yqg
Message-ID: <CANNYZj9UHZm3LHph=MO=YyU0YACbTvacBJnJk0NP0iZBRfM+WQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/9] bitbake.conf: set BB_GIT_DEFAULT_DESTSUFFIX
 to match default S value
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218488

On Wed, 11 Jun 2025 at 20:35, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>
> Possibly the recipes would need more modifications than this, especially
> the ones using default ${S} (maybe?).
>
> I tried to apply it on the current master and build some base recipes in
> a clean build dir. I tried to build git recipe (was curious how it
> behaves). First gnu-config-native failed to install, as it couldn't find
> some files due to the move. I fixed that, but right after pkgconfig and
> binutils failed to patch - the src is in .../sources/git folder, but it
> is trying to patch in .../sources/${PN}-${PV}.
>
> Or am I missing something?

Pulling these changes into incremental builds should trigger a re-run
of do_unpack for all affected recipes, and if it isn't happening, the
task hash dependency on where unpacking goes to is missing. I'll see
if I can identify and fix this.

On the autobuilder all builds happen into a clean build directory, and
so issues like these aren't seen.

Alex

