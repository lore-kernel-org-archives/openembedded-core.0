Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.896.1632154122072839455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 09:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ti2fE2Bs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id i132so15882039qke.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIxQSMt6oth3gdb9JvbAvCorGgNcEocfjxXbsuROW6w=;
        b=ti2fE2Bsg5neFLTMDDpHwo+L1Z+5xW+A9KjJNhV74TYMvDjGrV/BB7JflXiKZFJgkX
         6s7V9NUlhFuEKZB6abywgrcFMe+kWNXtXp8SCE18Km3324NWiWX8MBJkTjIhwLMMNqdP
         w57vAjer2TpYEz7ZtDizF+3srcFYiYMX8Ih3tsBbPfn/UE3qUgACvr75IkCymqtuxweV
         iTc/BZXmGNZ+jewKwuuLdoypeCwpp8prg16WkE9dwf6WMU352k+3eFrh8R1bFcrY9TZ4
         1WMxVtikQM4sa82+mSJJpXgGZ/XmKEZeP9JXpK+urPfTKQT8ZCyPsDcQPsG24QM4wwDR
         7kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIxQSMt6oth3gdb9JvbAvCorGgNcEocfjxXbsuROW6w=;
        b=R74s2gMjVtjTD96hy4LSRXi+1HCGu+8Dexjnw1U/t0pwX78BtVDF1V2wH4vNrjGGkJ
         I4Auu7hfcPbomaEVVTe4WXbZSyTiyBUbb3uGlLAide/zlhWJcKsh879Bw112OjTRaso5
         8DfgBC8vYfJPFWkyjBn1QSJjB9cFlbZ49pFxTcUwXGCOQk+J0dFJ58wyc1FqIXP2cwOV
         HZIU5DMlrEQ+91r8pwVdy6ip83wfYBtpJ4IlZIWcMkRpAQ0HQM4GveJP8qxPmQsY6k1/
         8XOmQ1zz6VfzpmGCBSiK4lJPYg0OKwxnZZqyvHLBZeehj9MIKYJ5QgtIoV/6Bll/5ycz
         GL4A==
X-Gm-Message-State: AOAM532SyLSakpmXkF6gLTigCCKCjALFgq0ppUyni9ml3KT/kcKIN1mU
	/LmpZVADmBWQIk/lzfTdY8rnvy1SshR9B4HgbNYUfwNQjRc=
X-Google-Smtp-Source: ABdhPJzea1OrxeWUFFzf1yJX6+coNehzAjzPSCU53Jn0dg+T+ksDZWZNGJespVc840cG1C9tXN5YOnj3srgvkskXodA=
X-Received: by 2002:ae9:ed45:: with SMTP id c66mr1540537qkg.336.1632154120947;
 Mon, 20 Sep 2021 09:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210916222006.18189-1-jdmason@kudzu.us> <CANNYZj8i4y3Wm-r6P=GiW0=3NDZRCMbJcjFfdvQ6tMgG9yw5DQ@mail.gmail.com>
In-Reply-To: <CANNYZj8i4y3Wm-r6P=GiW0=3NDZRCMbJcjFfdvQ6tMgG9yw5DQ@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 20 Sep 2021 12:08:29 -0400
Message-ID: <CAPoiz9wwn52FFrN1K84V0uxzEJXxuv2VesugVCY3h66K2C=CFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] machine/qemuarm*: use virtio graphics
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 17, 2021 at 9:54 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Have you investigated (optionally) enabling virgl as well on ARM hosts? On x86, currently -vga virtio is used
> and will be switched to -device virtio-vga-gl with qemu 6.1, according to
> https://www.kraxel.org/blog/2021/05/virtio-gpu-qemu-graphics-update/

My local Arm system does not have a graphics adapter in it.

Let me know when you make the change and I'll get my setup working and
see if it can't be enabled.

Thanks,
Jon

>
> On ARM... I don't know, as I do not have an ARM host with a GPU.
>
> Alex
>
> On Fri, 17 Sept 2021 at 00:20, Jon Mason <jdmason@kudzu.us> wrote:
>>
>> Switch to using virtio graphics for the Arm QEMU machines.  You will
>> noticed the difference in the dmesg by seeing:
>> [    2.693337] [drm] pci: virtio-gpu-pci detected at 0000:00:10.0
>>
>> Signed-off-by: Jon Mason <jdmason@kudzu.us>
>> ---
>>  meta/conf/machine/qemuarm.conf   | 2 +-
>>  meta/conf/machine/qemuarm64.conf | 2 +-
>>  meta/conf/machine/qemuarmv5.conf | 3 ++-
>>  3 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
>> index 93d855b6e1e2..d71a793edf05 100644
>> --- a/meta/conf/machine/qemuarm.conf
>> +++ b/meta/conf/machine/qemuarm.conf
>> @@ -20,7 +20,7 @@ QB_SMP = "-smp 4"
>>  # Standard Serial console
>>  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
>>  # For graphics to work we need to define the VGA device as well as the necessary USB devices
>> -QB_GRAPHICS = "-device VGA,edid=on"
>> +QB_GRAPHICS = "-device virtio-gpu-pci"
>>  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>>  # Virtio Networking support
>>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
>> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
>> index ea7fae2722a0..3b08dedddc86 100644
>> --- a/meta/conf/machine/qemuarm64.conf
>> +++ b/meta/conf/machine/qemuarm64.conf
>> @@ -19,7 +19,7 @@ QB_CPU = "-cpu cortex-a57"
>>  QB_SMP = "-smp 4"
>>  QB_CPU_KVM = "-cpu host -machine gic-version=3"
>>  # For graphics to work we need to define the VGA device as well as the necessary USB devices
>> -QB_GRAPHICS = "-device VGA,edid=on"
>> +QB_GRAPHICS = "-device virtio-gpu-pci"
>>  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>>  # Virtio Networking support
>>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
>> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
>> index 6c99a5296589..252d6286d8ec 100644
>> --- a/meta/conf/machine/qemuarmv5.conf
>> +++ b/meta/conf/machine/qemuarmv5.conf
>> @@ -13,7 +13,8 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
>>  QB_SYSTEM_NAME = "qemu-system-arm"
>>  QB_MACHINE = "-machine versatilepb"
>>  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
>> -QB_OPT_APPEND = "-usb -device usb-tablet"
>> +QB_GRAPHICS = "-device virtio-gpu-pci"
>> +QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>>  PREFERRED_VERSION_linux-yocto ??= "5.13%"
>>  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>>
>> --
>> 2.20.1
>>
>>
>> 
>>
