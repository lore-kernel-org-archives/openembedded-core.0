Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16131C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:58:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.13024.1751637511727908429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ahMeNTOS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so5183085e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751637510; x=1752242310; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nHcy3KlokImZbOrvmbfSDCphSzK108XE8pMfjiIj1To=;
        b=ahMeNTOSJqqKEbeluN0LLD7UCJ4SQ2ijxG1kJVYV8K1CVmrsJ5mVWp7mhXKUa31hxm
         znsT/qvw7tJ6jUBAzg7lWvsoPn2RArYLwPuIBXOfiWXi6R1wRFfMc4FuV/UZi23Q5uQA
         LM1EQ2tlD6+7j8ZGRWOXhLSWpf1QUFlx6Y9Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637510; x=1752242310;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHcy3KlokImZbOrvmbfSDCphSzK108XE8pMfjiIj1To=;
        b=cbAY2sQ2psz+hdTBoJ63onav9wcADn4wjBC6Vy/QOxtYjoEa64JfGFssypkudANh/a
         G69mOQu6BFOlE2fKXZFx9o+5wXLiC+CGz6tIyON8YiWTvmb9DgYzXs4ChZ4+hTTfL4qO
         gcuV9WQqHcD30ug9KOsjHLjr/ECUoF5z1lKhuBAuCLtHOEhX96zdOK7KJvP9Z8PZrnoD
         OQn0yNWhusdPHD4qgYFVCCUnRABftrrKjx48edV09JiAAkYdlFIXuoyzDxIeYZ4T1o4M
         df0agJXG4FACYblOzwQYfJw8hwon12bXNv4uPQVmwiGFuyZdWbs1Bmu63AB9/lAY24Ik
         Sczg==
X-Gm-Message-State: AOJu0YxsSvLWzNpgHMXWMBuMLxG5u1DvWDFpsEm0obrtfH09d4rHMkVw
	1bM0lVfdmdxWHDahrUPzZ8IWn21s1Y9XMmrKUKmiN+nMzXSdMPGczA+ZB5Sak0TgZsU=
X-Gm-Gg: ASbGncskPFGLVvGkw5RfgkORz6o5wsGdgWARFYHeQS4QjcurkguvoifTfRztLECdriC
	S4NMJEr4tAc+0PTd0k/QF2PdZIfhPILMXjT62UehpnwMB/DOhXNKjFTrNi85yiJyMAjQY7MxvRd
	1BOdCySrPsqc9RxSEQ+yBysQqAW/Yz1Bqym8dYfkfEfH8Af2stWjOHaNPafIqRwGAYWdfRtC/d8
	R+uW8h9xKwSxyDV8Es6MUer2W0e7GMv/AUnC4y1WW1gPyLo4IQzdo1IwE3LGtbOLl5qNqynnak8
	G1JYuXtbSJPHBWvzuQAsOGOQh2/+vjD8WfTIxw2D1vDgzQ9fRgvok5PyYz8E+LlHh2sxWWOppWL
	IiP45cpWhAcvfnWSMtngThqTvT/RQBp+Ch33Dvsg2o62FmhhXGGw=
X-Google-Smtp-Source: AGHT+IEeibUukcBgCKi1bT5sU9g+Zoa8tvdFMekGl6jLCKN8A7ZzsjV5m+mXy20/MrNQr72HyOb7pA==
X-Received: by 2002:a05:600c:64ca:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-454b3161d7emr28985535e9.16.1751637510130;
        Fri, 04 Jul 2025 06:58:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609? ([2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bde8c8sm57337315e9.31.2025.07.04.06.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:58:29 -0700 (PDT)
Message-ID: <45b47591567b6ae02192f10848de7467c6a8a280.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssh: limit read access to sshd_config
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, louis.rannou@non.se.com
Cc: openembedded-core@lists.openembedded.org, pascal.eberhard@se.com
Date: Fri, 04 Jul 2025 14:58:28 +0100
In-Reply-To: <CANNYZj92XhvGTZFDQsdLxi-5qsgpT0G_2yKG9pn2PcvAN=eeEg@mail.gmail.com>
References: <20250703-sshd_perm-v1-1-f92e5fbb18c7@non.se.com>
	 <CANNYZj92XhvGTZFDQsdLxi-5qsgpT0G_2yKG9pn2PcvAN=eeEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 13:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219924

On Thu, 2025-07-03 at 15:00 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> Wait. This is security by obscurity. If the configuration are
> insecure, then that problem should be fixed, not papered over with
> permissions that deviate from upstream default.

There is a happy medium with issues like this. We do need to be careful
about not hiding things, equally, setting better defaults for file
permissions isn't unreasonable...

Cheers,

Richard

