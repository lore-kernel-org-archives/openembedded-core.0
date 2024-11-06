Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAD0D59F5E
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 18:15:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.52996.1730916941450198735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 10:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A2zPU+DG;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: fbberton@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d47b38336so19855f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 10:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730916939; x=1731521739; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jepAmfXKpU7BHfhBZutnneyCDMg8WeMrIgvwwTuIE0Y=;
        b=A2zPU+DGgCRZs21F4cYBvq9tLEUfN51fsRKxo6yNJuyTpnFdr04/9QB+uM3TLqlFn6
         QjAdUjOsq21LBQn9Tbd887BAnQm6CDU1009lUa7dryOr2fG1tvNfUy4o8N7Ine8UmWxq
         wa3p56nfeVmh+02ATxyrY6jKA6aNJCJIpuzT7tpr0F51aDfC/mJ4xzeq1Cf3MTo8v0Pa
         XvAu7ypACAnMiUMiLASp+pzrUNXpVJu0A9/kN0sl4G8i8rBZRCMzhYvAs8si1eE5PbFY
         tJCSj30jIv2uzB2JUEqWuHzVWSng60xbhChOCnIW7Aij14X+J/DTmq71Ijce4AxVIci7
         rClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730916939; x=1731521739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jepAmfXKpU7BHfhBZutnneyCDMg8WeMrIgvwwTuIE0Y=;
        b=f7zvPsPtQ6Dj+m6SISM3f2mlgpBAnYABXRg5HJ6lqZRyLFg+xoEKB/AZcfjmGOKyjo
         sev8LQC4TQnoF5JPqZ6EltAagcyH3AmvCy1k4w9NBeFDH/GebGBwtuFHlLMbjTWuM5Tg
         sMXh5U0zhYi8COrXTHDTMbiKiN/+rOtZXVrBanPXeu1p+VcbsQ0qMaWLxkqOiyHb0Qum
         JfiIHbzkc0JmbWdORO3Gpl2qxTclev1J8jnf4+0wn+33DTvVrNzJdh5+Mf0rJcWLBSru
         rXUB6+y38UmEgA2uoLmdLqGizc5rHueL40xg7+16xxyxLjUsn+ql9dOKVhEmXrHZ/ZaY
         UEBQ==
X-Gm-Message-State: AOJu0YxC3WaF6Tb2h0bcHt+gpxhuc8w+GpVLihV38XZ6i+nsMj4hWO7L
	MkmE5lSe6QiJQ3mBqQzZVclHBGYknn6dLbjeajvRPn9itNjgdrSiDNhSbA==
X-Google-Smtp-Source: AGHT+IFbqe1lC7U+YuJoU3qdHZsBS+h5eKIDiufFzSAJwhwTO+XgJVYDUVr1tDZdp8urki83UQYVVg==
X-Received: by 2002:adf:b345:0:b0:37d:2d27:cd93 with SMTP id ffacd0b85a97d-380612008dbmr30727986f8f.43.1730916939144;
        Wed, 06 Nov 2024 10:15:39 -0800 (PST)
Received: from [192.168.144.223] ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7becsm19777607f8f.14.2024.11.06.10.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 10:15:38 -0800 (PST)
Message-ID: <ebe72087-40b1-413c-ba39-f5bb75eb19b0@gmail.com>
Date: Wed, 6 Nov 2024 18:15:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone] pseudo: Update to pull in linux-libc-headers
 race fix
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <20241106181242.1250615-1-fabio.berton@criticaltechworks.com>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <20241106181242.1250615-1-fabio.berton@criticaltechworks.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206798

Hi!

We've seen some sporadic issues when compiling the Linux kernel, it's 
failing when running make modules_install with the error:
/
|abort()ing pseudo client by server request.
|path mismatch [2 links]: ino 30968973 db 'NAMELESS FILE' req
|'.../build/tmp/work/MACHINE/LINUX_KERNEL_RECIPE/VERSION/image/lib/modules'.
|Setup complete, sending SIGUSR1 to pid 3205410.
\

The error message looks the same as the one the commit fixes.

Regards,

Fabio

On 11/6/24 18:12, Fabio Berton via lists.openembedded.org wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Update to pull in:
>
>      pseudo.c: Avoid patch mismatch errors for NAMELESS file entries
>
>      In rare cases we see failures, often in linux-libc-headers for things like:
>
>      |   INSTALL /XXX/linux-libc-headers/6.1-r0/image/usr/include
>      | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
>
>      Pseudo log:
>      path mismatch [2 links]: ino 46662476 db 'NAMELESS FILE' req '/XXX/linux-libc-headers/6.1-r0/image/usr'.
>      Setup complete, sending SIGUSR1 to pid 3630890.
>
>      Whilst this doesn't easily reproduce, the issue is that multiple different processes are
>      likely working on the directory and the creation in pseudo might not match accesses
>      made by other processes.
>
>      Ultimately, the "NAMELESS FILE" is harmless and pseudo will reconcile things
>      so rather than error out, we should ignore this case.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 4f30a1a74828e105cbe69677b3fbe5623f371543)
> Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
> ---
>   meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 4dd9156238..6b0cb598e2 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
>       file://older-glibc-symbols.patch"
>   SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
>
> -SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
> +SRCREV = "cc1f6167cb5065daba1462056e2dce8ff72aa855"
>   S = "${WORKDIR}/git"
>   PV = "1.9.0+git${SRCPV}"
>
> --
> 2.25.1
>
> The information in this communication may contain confidential or legally privileged information. It is intended solely for the use of the individual or entity it addresses and others authorized to receive it. If you are not an intended recipient, you are hereby notified that any disclosure, copying, distribution or action in reliance on the contents of this information is strictly prohibited and may be unlawful. If you have received this communication by error, please notify us immediately by responding to this e-mail and then delete it from your system. Critical TechWorks is not liable for the proper and complete transmission of the information in this communication nor for any delay in its receipt
>
> This e-mail is environmentally friendly, just like Critical TechWorks, which lives in a paper-free atmosphere. Therefore, please consider the environment before printing it!
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206796): https://lists.openembedded.org/g/openembedded-core/message/206796
> Mute This Topic: https://lists.openembedded.org/mt/109429860/6083838
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [fbberton@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

