Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E399CC369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 18:12:40 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.33762.1746382359031714882
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 11:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cSR3CGOb;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2aeada833so704642566b.0
        for <Openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746382357; x=1746987157; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwWYR3lmDUriyCh4XKTbsJIgJW6oRLdWajl20SGK3fk=;
        b=cSR3CGObmCUb7qKVh7k55GoBgNAxnKl8GbZ/7I1n5sUkIXD+SwrM5JSIei8grv2ubx
         IctQd2D80DXTLJLFNT16GSFHQmyk/CQc1l3/9/8VxHX8QV+Kbtiouh6U3Y2BUivIxXrs
         UhMViYxVTNdaSRTbWZ1qp3MLcQ/i600qrg09Jg8zUiSjChWXn82KtU5ZyPSbCkNNRtPW
         b/ODZS7gwBNWVh3uG5i2S7TpPtYM/Bx1NuLGMd9xhOEReFpylZBwI7CIkbysqiCIxguM
         kmFWWJIccYWZwan58Zb4gkJKF9cPmmvdIqpHkdqp+S7hwmyWn7tl3sOv5KmQPkcacmfO
         8u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746382357; x=1746987157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwWYR3lmDUriyCh4XKTbsJIgJW6oRLdWajl20SGK3fk=;
        b=tf0cbPUbGw88jlFMEm3QPL2qGcLtxbcizvBLS4eeu3jNkHs1dRkpNNo8uv427/UU+5
         N9jLLreodlp1z27vD6gTRIR9o0E9gNN3tXbGpcVqciQgSXZlbyqJrj00KAcyNYS9nptA
         ZVosT97bPsWIGsFQtH6neHSeLp8dcDDbx2ARUgshdgY0Mhe9v6X1ODypn7+f3zniSNT7
         TDN7jleBMh9gjNvOtZ/nEBGwkvvQdJem7PU6TFwfCc0BSH5sEhvbrT4emu3D8mB0ZVL/
         pizr1jHHCb+7L3xW2iVbtU+5suH05cYmwoOKKEXDSlsopGykDfmEE/7AYfKB7v1R1QSW
         1aCQ==
X-Gm-Message-State: AOJu0YyIMyiPunnmXmBbEfMsuiuanjh/TKU5WPQ1Cj+Y5/mOI5PZM2A6
	TQ5y2hC8oOA61AJaxhgnvMC7x795jHljUZBG3vYORipAyANGD2EhjWLQxFf5
X-Gm-Gg: ASbGncuF+z34XelA0c/XVg2OkJ/FVQdR05T5hCKFC9gKOFpvhlPVzRgCICL0cHIS8Jl
	CtMFKYkrpUodYeDhJfuJ+3N8RpvschUYv9E5Hb5MC8GPAw28ldalriQHiKCr1580eoEKDpOCbSC
	Y5FZjdZbIXfQTjaaD37gzPjq0k5hJG9n6O0qI0dnchVLUHEUKAY2lkRVG7XAUWPYQwLMhh9ea0F
	wBNsv0JiFh2IzQKshIiONCLsiW1MVm5ETTpMKrr8tglKORPHBSr0WZDWYyRlFokeq1auig5dJKM
	Il4k8+EmGThXrtKNksaEAYVI+kRUAP8v3C1WXRmpTxnuW0jclg0=
X-Google-Smtp-Source: AGHT+IGo7MKOQnRAdNJsvncFbevPFKeMXHp2/woeu7pB+z1BYjTRM7N9yN1klMm2RsebY04m1go5Og==
X-Received: by 2002:a17:907:1c0d:b0:abf:174b:8ca6 with SMTP id a640c23a62f3a-aceff056cd2mr1067318666b.27.1746382356462;
        Sun, 04 May 2025 11:12:36 -0700 (PDT)
Received: from [10.54.19.99] ([154.47.27.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914733esm352783266b.33.2025.05.04.11.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 11:12:35 -0700 (PDT)
Message-ID: <7fd0841f-a002-414e-a2cd-76a448afb30e@gmail.com>
Date: Sun, 4 May 2025 20:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd: Password agents shouldn't be optional
To: Openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
References: <183ADB3BB2889EAC.12076@lists.openembedded.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <183ADB3BB2889EAC.12076@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 18:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215971

Do you think this change can be backported to scarthgap?

Slava

On 29.04.2025 19:46, Vyacheslav Yurkov via lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>
> If extra-utils package is not included in the image, you'll always see a
> warning that password agent is missing whenever you start/stop a service:
> Failed to execute /usr/bin/systemd-tty-ask-password-agent: No such file or directory
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>   meta/recipes-core/systemd/systemd_257.5.bb | 10 ----------
>   1 file changed, 10 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
> index 2a18445eba..acf97517a9 100644
> --- a/meta/recipes-core/systemd/systemd_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> @@ -602,26 +602,16 @@ FILES:${PN}-extra-utils = "\
>                           ${bindir}/systemd-cgls \
>                           ${bindir}/systemd-cgtop \
>                           ${bindir}/systemd-stdio-bridge \
> -                        ${base_bindir}/systemd-ask-password \
> -                        ${base_bindir}/systemd-tty-ask-password-agent \
>                           ${base_sbindir}/mount.ddi \
>                           ${systemd_system_unitdir}/initrd.target.wants/systemd-pcrphase-initrd.path \
> -                        ${systemd_system_unitdir}/systemd-ask-password-console.path \
> -                        ${systemd_system_unitdir}/systemd-ask-password-console.service \
> -                        ${systemd_system_unitdir}/systemd-ask-password-wall.path \
> -                        ${systemd_system_unitdir}/systemd-ask-password-wall.service \
> -                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-console.path \
> -                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-wall.path \
>                           ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase.path \
>                           ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase-sysinit.path \
> -                        ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
>                           ${nonarch_libdir}/systemd/systemd-resolve-host \
>                           ${nonarch_libdir}/systemd/systemd-ac-power \
>                           ${nonarch_libdir}/systemd/systemd-activate \
>                           ${nonarch_libdir}/systemd/systemd-measure \
>                           ${nonarch_libdir}/systemd/systemd-pcrphase \
>                           ${nonarch_libdir}/systemd/systemd-socket-proxyd \
> -                        ${nonarch_libdir}/systemd/systemd-reply-password \
>                           ${nonarch_libdir}/systemd/systemd-sleep \
>                           ${nonarch_libdir}/systemd/system-sleep \
>                           ${systemd_system_unitdir}/systemd-hibernate.service \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215684): https://lists.openembedded.org/g/openembedded-core/message/215684
> Mute This Topic: https://lists.openembedded.org/mt/112524855/4455192
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


