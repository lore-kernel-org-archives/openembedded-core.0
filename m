Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7E5CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:57:11 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.14518.1757501826855454397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eIbY4cVI;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70df92872ceso4591076d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501826; x=1758106626; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kQ9emb3+hQagWHp9OOEfIgEDDCuddWlk/Pj1MghNYhg=;
        b=eIbY4cVI96cmREB4Z7vyHYBlqdnRi/xCJFp/tl6BYHW3A29xIV3QGGMxhpEdd9s0a3
         ylKdTkEljxfIpvVYiO5VyOyF9Zkjy1M7fiOYjJTwRHILHaaHYa+UprFcKVZ+uzWJdXTu
         vnXfPkFPqNgE2taumPaiGpBiEunCo6VjSOtpcY5cJxhZH86Td/u+IV50WrRGxUm4XaYV
         FDXCGuDv9XFc06HKrIlUnhLHY0RTWtYELbRM8ntAuqaLEcFkJf3R9cEm5hx6G/tsLqGV
         x65AL8iM5cdwv6SJmuBgPNjpMEs8bsr3XdI/b9FhlC9aGX3tsCe9Euz+eZqDypImwT+H
         7iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501826; x=1758106626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQ9emb3+hQagWHp9OOEfIgEDDCuddWlk/Pj1MghNYhg=;
        b=EOFfOrKSzzK9XFtHlGLBMsdllC1HUb7lJmTOMKyMzOLXN3Vu+LGkBTZJrH62yewc2W
         PaCqv1N0h7lS+Lh1gB7qkBWrcHFTDJ1Dk5SkURfeeeeqwOfXJnkP3YsrqzmakWguz5Ot
         McEldyhuwlqHMhXhJx0sqyQEP3fu5MMWqL7tXIS5/v+DyWjbuRqCxkfEN9vaSTWaREna
         7QPYCEoQJE+IXFeiDgctGm4bpJhmU+BCjByg6++BU/PlzAs+y9g/OV2xSlcfzejK81GX
         OlM4HEm7UcXKUIJKy0GZ9JLtKnjQhhUJFWqsOAIciiYEIOojLpPCDnzjPgfzpcp+jD/a
         wYjA==
X-Gm-Message-State: AOJu0YwyYUM2S1p6LKrvBvCzL+MhD+uz96YbZi9WW47sbgxcIhuc48kI
	SKXzpMYmQx9Yw0OyWkEH6FxTHqeiHSue4SADDXezCxv03uCVzKyeMGsK7q1EwOVxANk2lTvRRhU
	ricepI6dUexGHZIgd/gcBy5WeFjrKzYI=
X-Gm-Gg: ASbGncu9wJ5tZkNLsKH5nEtpz2rxHGN5wfYUdiaorFLYpo6ALe3YIHvFQQGlufaF386
	FpevIoaUhN4DhEYq3OsqbcALCQJ9ovj5I3CE0V8ohKTS7joS/fZVgG5o9HC9T7TRGRAekca9B61
	XnU+TfjLOGdJ9B0GesTibJhyGlo+bczL1ac5vcIDgtmui1FnGCwQnuQ3hpZyC/hbJwAqcshjdqP
	Pn31WQg8gw1mxVFudDRJZezp+O9+HV6/NctfROkJ3yJFwwqxMFc4NWEiL+46gOV5tjOxGuZwTlh
	IsCBndG5IaBiwq00vrfYBSNPTXm1x+EStIO688Yw
X-Google-Smtp-Source: AGHT+IHHoioi7PcFWKu7l0E/hddfoyWaVDXMsoY2wcFqrjrKS1QlBaJO5P2LtyEcTP+lW0T9ZN8Uqk+WPGVJyKVPB0o=
X-Received: by 2002:a05:6214:529e:b0:721:d362:1264 with SMTP id
 6a1803df08f44-73a1bd6a186mr131490536d6.7.1757501825797; Wed, 10 Sep 2025
 03:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250910105053.315379-1-alex.kanavin@gmail.com> <1863E64626F7A28C.18650@lists.openembedded.org>
In-Reply-To: <1863E64626F7A28C.18650@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Sep 2025 12:56:54 +0200
X-Gm-Features: AS18NWB8Gk9MrEetxJjfVmtOH1qiuIYFxaBVdICxXBxkgWpXcsZHDWHWMmlfs8I
Message-ID: <CANNYZj_x_Q7B-WOtxn2zfS+N0cv9oJqLgZO1BYFPR-O_M6phGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] maintainers.inc: unassign Changhyeok Bae
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223201

Hello Changhyeok,

please see below; if you do not wish to be unassigned as the
maintainer of these recipes in openembedded-core, please speak up. But
it is expected that assigned maintainers update their recipes to
latest versions in a timely manner (which has not been happening).

Thanks,
Alex


On Wed, 10 Sept 2025 at 12:51, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> Same as other unassignments: timely updates are not happening.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index c44d67d4490..f69939413a9 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -104,7 +104,7 @@ RECIPE_MAINTAINER:pn-cmake = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-cmake-native = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-compiler-rt = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-compiler-rt-sanitizers = "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
> +RECIPE_MAINTAINER:pn-connman = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-consolekit = "Chen Qi <Qi.Chen@windriver.com>"
> @@ -175,7 +175,7 @@ RECIPE_MAINTAINER:pn-enchant2 = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-ethtool = "Changhyeok Bae <changhyeok.bae@gmail.com>"
> +RECIPE_MAINTAINER:pn-ethtool = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-eudev = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-expect = "Unassigned <unassigned@yoctoproject.org>"
> @@ -291,12 +291,12 @@ RECIPE_MAINTAINER:pn-initramfs-module-install-efi = "Unassigned <unassigned@yoct
>  RECIPE_MAINTAINER:pn-initramfs-module-setup-live = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-initscripts = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-intltool = "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
> -RECIPE_MAINTAINER:pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
> -RECIPE_MAINTAINER:pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
> +RECIPE_MAINTAINER:pn-iproute2 = "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-iptables = "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-iputils = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.fujitsu.com>"
>  RECIPE_MAINTAINER:pn-itstool = "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
> +RECIPE_MAINTAINER:pn-iw = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libjpeg-turbo = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
> @@ -884,7 +884,7 @@ RECIPE_MAINTAINER:pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-which = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-wic-tools = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-wireless-regdb = "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@gmail.com>"
> +RECIPE_MAINTAINER:pn-wpa-supplicant = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-wpebackend-fdo = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-x11perf = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-x264 = "Unassigned <unassigned@yoctoproject.org>"
> --
> 2.39.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223195): https://lists.openembedded.org/g/openembedded-core/message/223195
> Mute This Topic: https://lists.openembedded.org/mt/115167230/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

