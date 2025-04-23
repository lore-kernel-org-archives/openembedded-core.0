Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4CFC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 15:01:17 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.11005.1745420473499547189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 08:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hZp/wUaz;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so5592385a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745420473; x=1746025273; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KBw3YwJBSR6PrJNbPzmn8U5CESIfPAlM0mu2475TOj8=;
        b=hZp/wUazoteVputPg2X9Cywwr98zrG6+SbW68dQQd5v1NUEwGAsFy5+ftSxzBKIBfO
         GV+RZoeimEPH9r7g2AGYgkKcI/rzLv2NG4k9eZgUKY7YKrqzvCgPHcDRbc2XTZ5/sdz1
         1/ezt4gCIiT4m7Ll0nxK/3eqe9f3aRXVrOx67ehoTl92vNdmUIaTrAtIyAj7vy3R4lSC
         eaScQnKFFopknivvujIKAPH8ERe5gs44mOybeeIQKefRuBzxIT+GOj81/IJ4F7K5bMw2
         ct8Fc4U5UWlw7DADCEe1tWuql3YmkrQBJQCEUk01YlW9bVamqwz3bOHS1IS3jBANj0W3
         ExMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420473; x=1746025273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBw3YwJBSR6PrJNbPzmn8U5CESIfPAlM0mu2475TOj8=;
        b=EF+IqPszxKcpjIPPvL/1FPHNOdp/42GuRQ75d1Pu6nLg0XEnxyOpqTiumRK9kddhlw
         faiALg73vgUFFKZ+SW3T9f8lV1dDBsMRehKwr1VV0JALMR4UCyawPRLbjXrQTfNtO6vI
         fk1glZ9MfWfXWvM6kyM5A0G19+vG3r2SlcQSMNmH62MHcAY5gypq5+A8dKGwJfreUJTp
         1t311Jg68HIfmIawv8VKzN+WtSq5HnmsH+kG9wR7TF4dd3gq+Chn65k3VDFzuZwNWEIZ
         Maqv+T8K0mfRGwxysQ8LkWHUo5zcqAXwXq0gRVmjnDLaSRUhdaV5xH2jlmNVauVGwmJ6
         Bbfw==
X-Gm-Message-State: AOJu0YzgXYkEZyXaJnaizCBgqBKiEaYQTGt99+VJa7HdlgdUfI+oRWw8
	pvJFQCGK78MGnjllnP+erFpRzjHsZ/ye/ioG4vpgiL1ovLkS8lPVGaJNbwm4HKZ6yKMhb7wjH0n
	LZjgnxA1HkYjzdYOF29pxF7HPGRZ2LQ==
X-Gm-Gg: ASbGncu8YXkXNqtBrbWyLBuPArBQ0lSiddyeG6y22543EahcI0dArqTMPOFEyeQEKFE
	xglm17F83qJMc6GdVhW+kHqo8CUqnu91OAD6hqajDW7oqh3O4dJObmXhGd1LqbTc33BXpti25mv
	ql44+DeQmnUbOU3j8KrvZdg9zT5Q1rZsw6BSkHlPnIUDoG7xV9iV4KtXb7
X-Google-Smtp-Source: AGHT+IHl8LvxtTAPhYG29ZCtKsaEVQWN/KtImTfgkj5xPyQdHn3HWGZdC2QvKNbaiBFFLAkqb6+d9RmqxM7aSdxjB3g=
X-Received: by 2002:a05:6902:f86:b0:e6b:834d:f0f5 with SMTP id
 3f1490d57ef6-e7297ec51cbmr25722955276.39.1745420454293; Wed, 23 Apr 2025
 08:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250423135226.5535-1-twoerner@gmail.com>
In-Reply-To: <20250423135226.5535-1-twoerner@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Apr 2025 17:00:42 +0200
X-Gm-Features: ATxdqUFC8Hj5-_VGKLHdHS1Hn2AF17H_1EypcJw0u7mWlDNuBvC1iKASEjCt8_Y
Message-ID: <CANNYZj-qO0jngKgSDGoUSsCsFvafJJgq_Q611HCAZcf-oVTH2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-systemctl-native: disable meson's auto-features
To: twoerner@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 15:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215313

This sounds like something that should be in meson.bbclass, rather
than one specific recipe?

Alex

On Wed, 23 Apr 2025 at 15:52, Trevor Woerner via
lists.openembedded.org <twoerner=gmail.com@lists.openembedded.org>
wrote:
>
> Disable meson's ability to analyze the entire host's system to determine which
> features to enable. Which features are enabled should be limited to the
> features that are explicitly enabled, not simply discovered.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
> index 041a040a2654..591a1747d63a 100644
> --- a/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd-systemctl-native_257.5.bb
> @@ -8,7 +8,7 @@ inherit pkgconfig meson native
>
>  MESON_TARGET = "systemctl:executable"
>  MESON_INSTALL_TAGS = "systemctl"
> -EXTRA_OEMESON += "-Dlink-systemctl-shared=false"
> +EXTRA_OEMESON += "-Dlink-systemctl-shared=false --auto-features=disabled"
>
>  # Systemctl is supposed to operate on target, but the target sysroot is not
>  # determined at run-time, but rather set during configure
> --
> 2.44.0.501.g19981daefd7c
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215309): https://lists.openembedded.org/g/openembedded-core/message/215309
> Mute This Topic: https://lists.openembedded.org/mt/112414248/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

