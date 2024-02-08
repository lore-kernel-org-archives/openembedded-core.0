Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0A6C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 20:21:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.160.1707423704556447836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 12:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqEYObuR;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso2102455e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707423703; x=1708028503; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfWiWmqbHFZ3ED9ikBref3vMsB5XU3ZYjtMhr0wVBxg=;
        b=hqEYObuRAA/jtqZrgEoPhlX+LsJgJitf8ZWRPpPXEgjmsWr/lpALkYW/7qSzefF0zB
         9ZgYVp+FeU38mNJXzk1G2GdkAnCF7iLFgykY2+B2zbCz4x/Fub20RohmJzxwWIRbnyyH
         k4U4iUW0oRZipDDPKQvTae1Q7jZ5fsgPtRrrkt20Vbobdf0fpecROzroNULYMMpGtFik
         qJXWdUZZ5DNwWUR0PmOq38nXGxJ9tPoxxo4GHGT4hMy8c0fY4LnhhUFAIzsX7GMNt02B
         wlDEa9fksLR8wdrjMyVlUPomBGOWGU8yfwdPxVVIHQ6JU3WgNguXwzcd0bv7Auf+osCs
         XjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707423703; x=1708028503;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bfWiWmqbHFZ3ED9ikBref3vMsB5XU3ZYjtMhr0wVBxg=;
        b=ZUXdd0pcMFtIxe5AKIH0lWmXDF+Q29IK80RJR7jxGQfSdyXVyMN+P8bmc6TgXGZfz/
         5MksfFu2TChfpQ8F7ZH5LMI0GFq5FbhrkBE+2Fz4cEzHV5puEaFoJ+cCDZ9nQsdzdZ79
         D2bKpJ2ZZHhQ47bz7Ix7jCzVMkHv64wQSb47H+fPrGPT8zAIAmv7mKlX0RJBTII2j8Rf
         DBHNkBA1MZLLB3UJx4Fh7FWbHdMtP1Lrq/ViFunmxAO8xjV3Fcp0/TSFwR8QHpFOd4vV
         mq+AJr39tLiC/NIBsohCnYwo3MUbGpBO2RtUbWmdEvYdv+Mja/xNFoC0D25QBXqnSN/H
         6A6w==
X-Forwarded-Encrypted: i=1; AJvYcCUYHrcOV14bznLwulakfbT/3YPchsYPXOEp5YUAXXpJDqBywJ5EDa96+8AnPT11moPZn+YH88lUdFvGoJoBHg/63YXntyxddMb/qGA4OovcNsuhl2V5dDgM
X-Gm-Message-State: AOJu0Yyc1jpRb2+GvkqznmO1N37C4MrOY8sx+C8JfMBgu0sa2YUdIVoP
	jkHisX/rsOgqzb0+wvszq76gZIcd0NnDoV9GnGGYytzeTlNI2eHM
X-Google-Smtp-Source: AGHT+IHW+JQS+T/XFLO2WwQ0K7h/a80fDv1z4lg8bMWGNcl+WN+dcjsvBFeaFkDt2IpuosMBpRn+UQ==
X-Received: by 2002:a05:600c:518a:b0:40e:60c3:c327 with SMTP id fa10-20020a05600c518a00b0040e60c3c327mr275567wmb.1.1707423702462;
        Thu, 08 Feb 2024 12:21:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMgPQUCE1NIb4qrxYpUGU04V6XQ9Iapm3Mc5LSKhzZDjzkxVPZmfQt814lGTj/ZwB65ZDoBfjGAkASu8gJdaRJDQitDIAJ15rO4I5kQCQvc0ryPSo3uslm
Received: from [10.139.3.233] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id jg2-20020a05600ca00200b0040ef95e1c78sm376748wmb.3.2024.02.08.12.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 12:21:42 -0800 (PST)
Message-ID: <5066577e-7447-4f4f-8212-7729a3ada8ba@gmail.com>
Date: Thu, 8 Feb 2024 21:21:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] overlayfs-etc: take read-only-rootfs into account
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>, openembedded-core@lists.openembedded.org
References: <391a7b90f3cb6a7b276904b69a2251bf0d3849c9.1707376966.git.baruch@tkos.co.il>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <391a7b90f3cb6a7b276904b69a2251bf0d3849c9.1707376966.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 20:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195177

On 08.02.2024 08:22, Baruch Siach wrote:
> Don't remount rootfs read-write when read-only-rootfs feature is
> enabled. Assume that all mount points are in place for the read-only
> case.
>
> Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   meta/classes-recipe/overlayfs-etc.bbclass |  4 +++-
>   meta/files/overlayfs-etc-preinit.sh.in    | 16 +++++++++-------
>   2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-recipe/overlayfs-etc.bbclass
> index 0c7834d01f43..e695ebdcf843 100644
> --- a/meta/classes-recipe/overlayfs-etc.bbclass
> +++ b/meta/classes-recipe/overlayfs-etc.bbclass
> @@ -69,7 +69,9 @@ python create_overlayfs_etc_preinit() {
>           'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
>           'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
>           'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigInit else initBaseName,
> -        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"
> +        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false",
> +        'READ_ONLY_ROOTFS': bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
> +                                              "true", "false", d)
>       }
>   
>       if useOrigInit:
> diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayfs-etc-preinit.sh.in
> index 8db076f4ba65..79cecf8ac97d 100644
> --- a/meta/files/overlayfs-etc-preinit.sh.in
> +++ b/meta/files/overlayfs-etc-preinit.sh.in
> @@ -3,12 +3,15 @@
>   echo "PREINIT: Start"
>   
>   PATH=/sbin:/bin:/usr/sbin:/usr/bin
> -mount -o remount,rw /
> -
> -mkdir -p /proc
> -mkdir -p /sys
> -mkdir -p /run
> -mkdir -p /var/run
> +if ! {READ_ONLY_ROOTFS}; then
> +    mount -o remount,rw /
> +
> +    mkdir -p /proc
> +    mkdir -p /sys
> +    mkdir -p /run
> +    mkdir -p /var/run
> +    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
> +fi

I don't think this would be a correct approach. You probably should only 
remount to ro after all mount points are created.

With this patch 
overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_preinit fails:

2024-02-08 21:12:40,616 - oe-selftest - INFO - Traceback (most recent 
call last):
   File 
"/home/uvv/projects/upstream/poky/meta/lib/oeqa/core/decorator/__init__.py", 
line 35, in wrapped_f
     return func(*args, **kwargs)
   File 
"/home/uvv/projects/upstream/poky/meta/lib/oeqa/selftest/cases/overlayfs.py", 
line 370, in test_sbin_init_preinit
     self.run_sbin_init(False)
   File 
"/home/uvv/projects/upstream/poky/meta/lib/oeqa/selftest/cases/overlayfs.py", 
line 399, in run_sbin_init
     self.assertTrue("/data" in output, msg=output)
AssertionError: False is not true : /dev/sda2 on / type ext4 (ro,relatime)

The test is not really explicit, but it looks like overlay is not 
mounted. We could also add a generic test to search for "PREINIT" 
done/failed.

>   mount -t proc proc /proc
>   mount -t sysfs sysfs /sys
> @@ -20,7 +23,6 @@ UPPER_DIR=$BASE_OVERLAY_ETC_DIR/upper
>   WORK_DIR=$BASE_OVERLAY_ETC_DIR/work
>   LOWER_DIR=$BASE_OVERLAY_ETC_DIR/lower
>   
> -mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
>   if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
>       -o {OVERLAYFS_ETC_MOUNT_OPTIONS} \
>       {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}

Thanks,
Slava

