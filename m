Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DC4C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 19:40:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.16054.1707766816328746361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 11:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QChdF7lZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3392b045e0aso2482156f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 11:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707766815; x=1708371615; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+K5c2FcdP5HOZuMyXS8UzDT/nQGlkuTJnV5D7oQRIA=;
        b=QChdF7lZqyCkNrVAKY2iK56HlaRyelmsanHMfwBdYPH0LOwGoic4F+QCTpUXO5kI4b
         V2VjLJQ5EVD7MEeDJp25H6yUsdhTNOMUWNt14qDLQpb84JX3gubuhG1evDipHuv7Q5v1
         GQvAgVrIngrGgsv2fT6zbbF7y2WXF7J1obzjj8IqrVz8HriCxd6CF+VLExkiSqGjU87A
         qn45hMFQ2vO2PQSehs4EAOzDT5JMz7xSLc+bND+Aa6p4bHCUfvl1If1TOeo5EMPqunXY
         BQUaG+rTTpxZ3vC75s6TiJ+/+Rm7pvUQKHmZECOp7nkMV4jCfqe7IlJ26ALX88hJ0I4N
         kUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707766815; x=1708371615;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+K5c2FcdP5HOZuMyXS8UzDT/nQGlkuTJnV5D7oQRIA=;
        b=IQfrp/61kA/PzOyd8+ratJ8BM3Vl+w5nV8vFqqQz+HRsRUaSz6rRJx4zZeD0odJxvX
         23iRA1UJlrP4oYZymC9jVmfSCcLV4TE3tYOwIZZa4obvlOuGaxRwHgQQ1sTcPfehhA9F
         kK8gHwsPM5mu0X7mQQt3jBO/4Dxt2T4b0zuSN4MEYDTOQVg/GhE/8nedH+T0QwUE5ez5
         J8spkMmv15apswM6yaknqKuzmrH00C2+uYuS/dUJ6jLvx4UTBC9v+aQ+COS/UPp2MPCz
         mwjfsqiM/yKQzFBWJg78ZaLoODCFVbw0UZ6MYl2WGgyBwbU8qieYdDY6g4etwyNggnXU
         4oIw==
X-Forwarded-Encrypted: i=1; AJvYcCXC5JSIlKnoKM0v1g62ZwHLBzzprrTNtyJa/1m+daD9VvvKL+0XBfD3piHNlrMUMUHLRMfFUIR1rh5OwQuCbuanm7h4qVbXhMKmxRqsqfrP4rHmX3KSVYBM
X-Gm-Message-State: AOJu0YygmgrCUGpYwP2LVFJGq2bcnGmX7i4QuNTIJfIyULE1mAORI6GM
	cpAKYXcJg+0UqelJggSJub+CMBI1Hwlba2r2DroEnnPumMOdq8LU
X-Google-Smtp-Source: AGHT+IHE1eOpv+bhheijkmlrCqGiUNAhjsn+xShr/CBzT/FAKVWJj6FTC4q10ImatfaIvyejJwG5mg==
X-Received: by 2002:a5d:6d89:0:b0:33b:153a:de12 with SMTP id l9-20020a5d6d89000000b0033b153ade12mr7647435wrs.13.1707766814408;
        Mon, 12 Feb 2024 11:40:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUG46PTUkk5x/W7zbL9VLB0HeZN7Rw5IjKQ1lvLzXdDB9Y717ZYyYLqO/BI6NXJxW4tjG/HCjZy0yo+qzPLZcvjoYpc1eeCBs2WoJ9pWaX5/w/FzrJ4J/mp
Received: from [10.139.9.134] ([154.47.27.148])
        by smtp.gmail.com with ESMTPSA id g8-20020a05600c310800b00410cfc34260sm4209624wmo.2.2024.02.12.11.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 11:40:13 -0800 (PST)
Message-ID: <8f1c6048-235b-4786-811c-50e79c806da4@gmail.com>
Date: Mon, 12 Feb 2024 20:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] overlayfs-etc: add option to skip creation of mount
 dirs
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>, openembedded-core@lists.openembedded.org
References: <ed5d6a8c842319c81026bb4aab7e2a9de3c13189.1707762606.git.baruch@tkos.co.il>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <ed5d6a8c842319c81026bb4aab7e2a9de3c13189.1707762606.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 19:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195358

On 12.02.2024 19:30, Baruch Siach wrote:
> The 'preinit' script can't create mount directories when rootfs is
> read-only. Add an option to skip this step. The user must make sure that
> all required directories are already in the rootfs directory layout.
>
> Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Add a user selectable option. Don't skip mkdir automatically when
>      read-only-rootfs feature is enabled.
> ---
>   meta/classes-recipe/overlayfs-etc.bbclass |  5 ++++-
>   meta/files/overlayfs-etc-preinit.sh.in    | 16 +++++++++-------
>   2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-recipe/overlayfs-etc.bbclass
> index 0c7834d01f43..d339fbbeee9f 100644
> --- a/meta/classes-recipe/overlayfs-etc.bbclass
> +++ b/meta/classes-recipe/overlayfs-etc.bbclass
> @@ -41,6 +41,7 @@ OVERLAYFS_ETC_USE_ORIG_INIT_NAME ??= "1"
>   OVERLAYFS_ETC_MOUNT_OPTIONS ??= "defaults"
>   OVERLAYFS_ETC_INIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-etc-preinit.sh.in"
>   OVERLAYFS_ETC_EXPOSE_LOWER ??= "0"
> +OVERLAYFS_ETC_CREATE_MOUNT_DIRS ??= "1"
>   
>   python create_overlayfs_etc_preinit() {
>       overlayEtcMountPoint = d.getVar("OVERLAYFS_ETC_MOUNT_POINT")
> @@ -62,6 +63,7 @@ python create_overlayfs_etc_preinit() {
>       initBaseName = oe.path.join(d.getVar("base_sbindir"), "init")
>       origInitNameSuffix = ".orig"
>       exposeLower = oe.types.boolean(d.getVar('OVERLAYFS_ETC_EXPOSE_LOWER'))
> +    createMoundDirs = oe.types.boolean(d.getVar('OVERLAYFS_ETC_CREATE_MOUNT_DIRS'))
>   
>       args = {
>           'OVERLAYFS_ETC_MOUNT_POINT': overlayEtcMountPoint,
> @@ -69,7 +71,8 @@ python create_overlayfs_etc_preinit() {
>           'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
>           'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
>           'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigInit else initBaseName,
> -        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"
> +        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false",
> +        'CREATE_MOUNT_DIRS': "true" if createMoundDirs else "false"
>       }
>   
>       if useOrigInit:
> diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayfs-etc-preinit.sh.in
> index 8db076f4ba65..b05e3957a382 100644
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
> +if {CREATE_MOUNT_DIRS}; then
> +    mount -o remount,rw /
> +
> +    mkdir -p /proc
> +    mkdir -p /sys
> +    mkdir -p /run
> +    mkdir -p /var/run
> +    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
> +fi
>   
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

Hi Baruch,
Thanks for the v2. Looks good now. Could you please also add a test case 
to cover the new option?

You saw from the test that mount output is parsed to confirm whether 
overlay is actually mounted. sda3 is a 3rd partition from 
https://git.openembedded.org/openembedded-core/tree/meta-selftest/wic/overlayfs_etc.wks.in 
. We could change rootfs (2nd partition) in the file to substitute the 
fs type (ext4/squashfs) from the test and then check that everything is 
mounted correctly. Does it make sense?

Thanks,
Slava

