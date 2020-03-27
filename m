Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.17562.1585329807475144879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fTSrpZDV;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id k9so10668619iov.7
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pydm2MyDBFzCsrrFErR0boif0ev2XAwWXgZpkU5SVkU=;
        b=fTSrpZDV0OROgXHimVUsXRHB+mKQeV9ifnwj6SKAUyanhhz/GAS7jOL/Xltf5YYfyg
         56SX9w5zm+41lBujdWI/Y+IeJcEKAf+/8TQoUhCKDJm1HfcVpSN/CJD9KlNj9vQK+iit
         1lEvPWwugBGo+x+7C3rFbgK15C6ho0ZDoBQDofoWgogSmcFQWnvG8Iph4aM1OcMJkNDE
         fLjzGGVYxJGrJxdSgb8KWxzBFruFD6R+IQaOu4kVMi3Sa5/cOzqBfriWM8LivYIcwYIy
         luVe4R+6SHBl6c141L6fY4hTn+/R780ARmHHNOES2nh/TgT6NGBc+11gxzHP76hq6ozO
         hG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pydm2MyDBFzCsrrFErR0boif0ev2XAwWXgZpkU5SVkU=;
        b=fJfI+Ya0mRWvyETZAh164qA5j/ld/sd4ID1JyIFcElZLq8+hLJmjuEU1RAknYMPA/Q
         IVRMcQ6jjO3OvgGdo57aUfqdRttnC/dGlJe8IEoQ9QH+yD+r9MubbYNB97ZjzCfT7GbL
         4yzXHV3QEWjf7fpR9u94kb40AwhC06XxVyfVL44yiJs04l1xoOK7IOhw0w6uFipKhzlu
         l0yW9q+DAaAOfHNR+2bHs7t/b4GNTBw5x5ZRiujhEq3k81oG2Vsj2+6hCGaWkydbslAV
         6ho+dB74/e847tC+AAgzhPGgBgDsCVQyrt81Wuadei8eq6JhJI2gWH6mrRucHZEc4ZlS
         6vMQ==
X-Gm-Message-State: ANhLgQ0O9+p/Fw5wuXOrLZJqu1ykh47dzitO0mIwpVxzO9c/gVTbFpwq
	LLhrx69r+dsjrQ5i3wIU+tarYU6J9bX7VcdISLs=
X-Google-Smtp-Source: ADFU+vtm+NOPMF2Avjaw3DqCxZ/RQ4yMUCU1KfVhbbNAptuVHIU3V46l+/+diYMSx84yEQF4K/xW7sUeJhareiDo5Bk=
X-Received: by 2002:a05:6602:14e:: with SMTP id v14mr7229073iot.129.1585329806538;
 Fri, 27 Mar 2020 10:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200326214308.1042374-1-nandor.han@vaisala.com> <20200327071550.1200675-1-nandor.han@vaisala.com>
In-Reply-To: <20200327071550.1200675-1-nandor.han@vaisala.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Fri, 27 Mar 2020 17:23:15 +0000
Message-ID: <CAO5Uq5TjhSR+nu7GcLNs5dZYdRBt5e4PSk6m3dqvXq3ddAKqhg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] classes: Add a new bbclass that abstracts the generation of FIT blobs
To: Nandor Han <nandor.han@vaisala.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 27, 2020 at 7:16 AM Nandor Han <nandor.han@vaisala.com> wrote:
>
> FIT format is very versatile allowing various combination of booting
> sequences. In the same time different U-Boot boot stages can use FIT
> blobs to pack various binaries (e.g. SPL supports reading U-Boot from a
> FIT blob). Because of the allowed level of customization, the generation
> of a FIT blob using a fixed image tree source, becomes challenging and
> increase the level of complexity where different configurations and
> combinations are needed.
>
> This bbclass will know how to generate a FIT blob, leaving the mechanics
> of the process (dependencies, task order...) to be handled by the users
> of the bbclass. In the same time will allow to separate the knowledge of
> the FIT format leaving the user code cleaner and more readable.
>
> Signed-off-by: Nandor Han <nandor.han@vaisala.com>
> ---
>
> Notes:
>     Testing
>     -------
>
>     1. linux-yocto_5.4.bbappend was modified to have the following configuration:
>
>     ```
>     inherit fit-image
>
>     KERNEL_IMAGE_NODE[name] = "kernel"
>     KERNEL_IMAGE_NODE[description] = "${PF}"
>     KERNEL_IMAGE_NODE[data] = '/incbin/("./arch/${ARCH}/boot/zImage")'
>     KERNEL_IMAGE_NODE[type] = "kernel"
>     KERNEL_IMAGE_NODE[arch] = "${ARCH}"
>     KERNEL_IMAGE_NODE[os] = "linux"
>     KERNEL_IMAGE_NODE[compression] = "none"
>     KERNEL_IMAGE_NODE[load] = "${UBOOT_LOADADDRESS}"
>     KERNEL_IMAGE_NODE[entry] = "${UBOOT_ENTRYPOINT}"
>     KERNEL_IMAGE_NODE[hash] = "sha256"
>
>     FDT_IMAGE_NODE[name] = "fdt"
>     FDT_IMAGE_NODE[description] = "FDT blob"
>     FDT_IMAGE_NODE[data] = '/incbin/("./arch/${ARCH}/boot/dts/am335x-bone.dtb")'
>     FDT_IMAGE_NODE[type] = "flat_dt"
>     FDT_IMAGE_NODE[arch] = "${ARCH}"
>     FDT_IMAGE_NODE[compression] = "none"
>     FDT_IMAGE_NODE[hash] = "sha256"
>
>     CONF1_CONF_NODE[name] = "conf"
>     CONF1_CONF_NODE[description] = "Linux kernel and FDT blob"
>     CONF1_CONF_NODE[kernel] = "kernel"
>     CONF1_CONF_NODE[fdt] = "fdt"
>
>     FIT_IMAGES_NODE = "KERNEL_IMAGE_NODE FDT_IMAGE_NODE"
>     FIT_CONFIGURATIONS_NODE = "CONF1_CONF_NODE"
>     FIT_CONFIGURATIONS_NODE[default] = "${@d.getVarFlag('CONF1_CONF_NODE', 'name') or ""}"
>     ```
>     2. Build the kernel: `bitbake virtual/kernel`
>     3. Verify that `image-fit.itb` is present in the build directory: PASS
>     4. Disassemble the image using the command: `dtc -I dtb -O dts image-fit.itb`
>     5. Verify that the FIT source contains the expected configuration: PASS
>

Whilst I'm definitely interested in this, building the its file
through dozens of variables is fragile and ugly...

What I had in a class that I'd started, but hadn't got anything like
this far was something like a .its.in file which got passed through
bitbake's expand.

-- 
Alex Kiernan
