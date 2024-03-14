Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73BAC54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 17:47:36 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.2871.1710438454563992590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 10:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UcRehghI;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512b3b04995so1334762e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710438453; x=1711043253; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oDzTowdEWT7ze3DEjtdHMUUHa0KM5Qk7wOHhYGvbCsI=;
        b=UcRehghITrNWMLKM/icUwrXKIcoj/lBjkwIaWoMp04NMyYX0/qwFJ4x3CNIG3kWSee
         40D57dbiCLQ4dzlUJLRj7Wdw5dBpTBouD55JuHA/jSyurZBoBCvTThXYzEFtsgk/NZ7i
         XFym5JCYhhAkZS9VLCeZg+Yusk2mwI+TIxzArBNuHADO4N71vUdj3lkSVC2IAWVMErpb
         SJg/Oe8jVbi1k7B0UEHNa6/GxlFtLAXZFLjc8oYzDJAUJRBX53cQP/MxAt0GdMExONOJ
         zCy8GtTqDL8ZJ8gxAgjKiC28R8pjciCwpJMXBBdkUSudbk5WmnTbOkvTFZn5+OnHq7oN
         c7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710438453; x=1711043253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDzTowdEWT7ze3DEjtdHMUUHa0KM5Qk7wOHhYGvbCsI=;
        b=DN7iAssuM6OKzX2lnEckPUp5y3LuN0YGiiPseezbnTZU9jZhvpYuUNOF8Rh054vKNX
         noDm3hwjz+Ps4fBpJH3oYYXWeoAN3QLc2MDI2seAQdkgnngYwLr2uyasOxr1oyHfhp6h
         leRl1WrkVTUokYtPEaH6KsgHOb5LAShfcYeiHNz+lF1wRilamrCj9B4NLb6GTc8ODgNv
         Tgk6p5aWMGHeK6k58nq5qb1m/kBfJmBT0x7uR+lP3RPMO1wJkBgrdET+nQPzslIFVKDG
         Wv6H/Qz7QEa4Urfjwv5MUY9H2ivIhXqonv4PAENoH/z5FO5BtjdEhLjL5kg9ul0bb5TO
         SD3A==
X-Forwarded-Encrypted: i=1; AJvYcCVAzcNIYOjOqyNHMc8sUOZeDo1b9uqRc8fsMyZFevGzDSI1KQBYtVttTYvAmOB2DuE9L/81H1BwtL3peGFnYxKt/XoYZU+2GqmDGop10CcN6EOKfKK13f9f
X-Gm-Message-State: AOJu0YxClrNUaAlzZ2VK1h2NKXl//XkB0vDjnUd2Yb/7osWnAEF1Kxgd
	jHlrfzC/gJkzEqJrGEUCTNDN/r1bVabPQgWEY2Ih+pA8pi5At7qT0MPFofiJdyMhGep6XDJayWa
	VEYym2DdP5fPiojfagFzGrDCKTiQ=
X-Google-Smtp-Source: AGHT+IHCJbXqUneuQWtnNb0x+GYagDxDms47GUAc1lLzTIxZt7S0u6/OKhnkhnedEUNzRc1lJSZwf5BTO3qVwUKaprU=
X-Received: by 2002:ac2:5e24:0:b0:513:c658:799b with SMTP id
 o4-20020ac25e24000000b00513c658799bmr605084lfg.55.1710438452422; Thu, 14 Mar
 2024 10:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
 <17BC9C80577EA5C2.22340@lists.openembedded.org> <68d71da3a6f49e2ac4594fa8ca633cdc7eb2e0fe.camel@linuxfoundation.org>
 <lyo7bg9801.fsf@ensc-pc.intern.sigma-chemnitz.de>
In-Reply-To: <lyo7bg9801.fsf@ensc-pc.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Mar 2024 18:47:20 +0100
Message-ID: <CANNYZj-qjqNbQeBg_npkdi_i-A1ueyZrTwcK64B80vAfrKWt1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] Replace sshd_config patching by snippets
To: enrico.scholz@sigma-chemnitz.de
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 17:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197116

On Thu, 14 Mar 2024 at 15:57, Enrico Scholz via lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:

> | stdio: WARNING: Nothing RPROVIDES 'nativesdk-openssh-scp' ...
> | stdio: WARNING: Nothing RPROVIDES 'nativesdk-openssh-sshd' ...
> | stdio: WARNING: Nothing RPROVIDES 'nativesdk-openssh-ssh' ...
>
> are these warnings really new?

They are. Warnings are not allowed to creep in and linger around, so
master is always free of them (except for intermittent ptest fails,
which this one isn't).

Alex

