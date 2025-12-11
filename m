Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5D6D41C09
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 08:57:21 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5125.1765443431514728334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 00:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mFebJAXu;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2a4b6876fso117209385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 00:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765443430; x=1766048230; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WZjlUK04oAKanXtQjD0Bd//IU9+bKWDTpzv4nd5zAnc=;
        b=mFebJAXuaTA6OeygyiR3o1wnWHs2W4jVqDP/9BhsvgjgJ5lXAE0Gr4RHTH3PJTkVLd
         0bK/ZQ61fMWnD/eJcIgZmpudjKLW93ys9gRAdUKzABZOfc/8LKWe3vwE9MRbJu9Z+Nji
         NhylXfRI4kUqJSKianxYsG+45VvsGIJW0oDKrMXZdroifq1OpLTiIc//BF/dRWeceAhJ
         GWFQc/kqotQ0ygeUhtYDtpBgWLQlg8kYbkr3aDSKD20kWqh6nOkgzwTO9OyMunMFmtIv
         6N53GBJGM/a5rS8mH2JOaZOSU24d9WVJyX2FS5PXy7io47R9C5wcM/KQlvDfhtZyA7Kb
         pAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765443430; x=1766048230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZjlUK04oAKanXtQjD0Bd//IU9+bKWDTpzv4nd5zAnc=;
        b=FH5TLgpsGtG6VJqsFxSainkJzyoOAw0b7HI7xhXwjwSukJ7MpptXEd9rJnLU94FQIM
         69cd207wgz3jfzUNDvYKdgNTtErR0jCCgySu6mHBfLSfiUi8NEWh2bFpvO4GalGuVr0u
         Plfs+OD6kzDfAAA69jvxHQpskBasbjyg/K1k2fNrwAz5cML4Er0GfVLt/VRD6+GHwAOj
         jEeWBtEF4QDvczobO/cA1Opp1+CxciO4IXh+qZOIIM7F8/pabB76W25egRyImR5gPP+D
         f1bTyoANyMyCQdpHk9GUfgtxwfRzIrW9p9R7npVtimorfvvV7SU3PSn9/ufg+eEysm3G
         Pddw==
X-Gm-Message-State: AOJu0YxZ1RWPyeTi/0Cvz9nXCtWHDuy1ALouvaWYpS3eZ02OnRStV3z2
	Qno2V1baHrmsUom0unjVmn2XHXLc9EVg3grQ/H3OsVStAQi1QCE+xRq4FYIwopwyAZOL7LMZ97R
	vYs3bj14JILl+2oy5cAATclWkrpvvOqtfdZ7c
X-Gm-Gg: AY/fxX6c9+VsMkavT8xQTuqpwjTIK71ytL4fOVYhvkH/MMWZL7gQk5I0EHVP/K3IqA+
	/jiaEZ8sTGIT0xKpuKa2dhS7fzBwTOTIaZf4exfYz19ST4AeKpXsmxRhwqRf6QRhV1gJITLfbqO
	PvZvQaaXKgRTQQtZA8Un36RDs2at2tYprEDoMmQhyuRzQZ0kEjUk6Yp3Pm1KvQAXgjaJmKth6jM
	FiadcmwHegU/gyBhaZyiB1AEtBwtmQVwT5wf5BTUs7jEgAO2qUqGwBX7TWwz8j0N+M9uO0CgCVm
	P0185sXEb+Tu1UtX29Hcz32kY5u6Jw==
X-Google-Smtp-Source: AGHT+IFlh37fzsVMa0Zo56hbCw/b2ievXdS91zeNcOrOjHaN4+ekLRjmI6N8tJ6F50czgmbzEEBPJHGqOPONcq1jsdQ=
X-Received: by 2002:a05:6214:e66:b0:87d:cb8d:2a98 with SMTP id
 6a1803df08f44-88863a2608dmr89615986d6.2.1765443430397; Thu, 11 Dec 2025
 00:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20251211024038.4089969-1-Qi.Chen@windriver.com>
In-Reply-To: <20251211024038.4089969-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Dec 2025 09:56:59 +0100
X-Gm-Features: AQt7F2osavijDUbVCPhthKNBK0fTP37WnH-SR23CJH9hK0HKs5Ei6C5ISWMgQyY
Message-ID: <CANNYZj_20AQEa0DPTiS7Mb+Tr7gHw3dd1+SMz6nDRN+nafQbRw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemuboot.bbclass: make nameserver configurable
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 08:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227515

It would be good to add a comment into qemuboot class explaining what
8.8.8.8 is actually:
https://en.wikipedia.org/wiki/Google_Public_DNS

Alex

On Thu, 11 Dec 2025 at 03:41, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Instead of hardcoding '8.8.8.8' for tap interface, we introduce
> QB_TAP_NAMESERVER to allow nameserver to be configured.
>
> This helps improve runqemu user experience because users can easily
> configure their nameservers to access the networks they want. Note
> that this method does not change the contents of the rootfs.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes-recipe/qemuboot.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
> index 69cd12ec54..6778c15c43 100644
> --- a/meta/classes-recipe/qemuboot.bbclass
> +++ b/meta/classes-recipe/qemuboot.bbclass
> @@ -106,7 +106,8 @@ QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
>  #
>  QB_NO_PNI ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', '', 'net.ifnames=0', d)}"
>  QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
> -QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:8.8.8.8 ${QB_NO_PNI}"
> +QB_TAP_NAMESERVER ?= "8.8.8.8"
> +QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0:off:${QB_TAP_NAMESERVER} ${QB_NO_PNI}"
>
>  QB_ROOTFS_EXTRA_OPT ?= ""
>  QB_GRAPHICS ?= ""
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227509): https://lists.openembedded.org/g/openembedded-core/message/227509
> Mute This Topic: https://lists.openembedded.org/mt/116723817/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

