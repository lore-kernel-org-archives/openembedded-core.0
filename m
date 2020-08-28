Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.166.1598648264898070436
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2020 13:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LVcRaeyp;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id d11so821023ejt.13
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2020 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R5TK7yeXnbOIbG+b3fJAny2G2DFv03Z27Gxe/EPInPs=;
        b=LVcRaeypmP1i9A4wg8FsC1rUQJAyfSL7H5ebS1h8MImYAPVR6hr2ckkty2PQn4hEKF
         nTmcD8imrToMTlA32lYNiUN+urOodMlQmAqDfUjzEyiH75cT7y3oQuVm495uEu0iIajO
         oFTlar2r9JbzVYGVaxTop7q9ZBTEbUHzNBefPNeY8IpoMuwsSRKPZ2LALKJgTHZZqnta
         fJ8v2KaVzqwgI+TQjonoO1OF23Oryf7tmeAL7k5LTe+a6AwAOYUbXyss1lOzhzxojjSd
         NjEciVi3JwiFmz8ngZIik84smXwB2fRe8G4YbVumnAI9kpVBcFIZSOSlnkPxRfv/7g/n
         Bzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R5TK7yeXnbOIbG+b3fJAny2G2DFv03Z27Gxe/EPInPs=;
        b=hUTeLgSE/4Jt4Cf84C0dqV86BRGVkfaYGrvko7lewIWMWO/CuGDYwS4Y9aFk21x2aC
         F+3MCniof+ednBQPQYNle91Garqpb5NMCDD0JMxL7LIAkdUf3XaC1gg0VjoYke34FuJA
         p5JhpHXiHcgKr4bHMXBMgaTlE+B1VbmguKclsjB1E4G8hKmHuv3wZ9DSe9YS6XQfkoYI
         auBzBzVQbraWd0YP2B195SoKkWkMPC25cMu8gul9wgv3XxZOLZ4jmUtb5a1d/GKf2WqR
         LvEyTe/K+DJn22pMT6W2fbAHIC29bKSYj0rfaAYWEuy5gIES3vpEo2wdHe9KL/Da+H1z
         J4Mw==
X-Gm-Message-State: AOAM532rk9ocdfctZlOx5vYwmlMZLtsCn5TITnWt5V7NE9p0458jvgV0
	CKStw7u43+Un4CsXJNL6v3JUGql5h9sE/ZmIRuY=
X-Google-Smtp-Source: ABdhPJzz2mR8uyUcbFhnRl/ufCAMVawidMj3gsxxWMIyXNQKw5Y6Wn4QqBndbfe+FZcFtrwz8YFRFUxrFLmy0tLD948=
X-Received: by 2002:a17:906:194c:: with SMTP id b12mr556037eje.459.1598648263075;
 Fri, 28 Aug 2020 13:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <6e070a3d-a5f3-46bf-ac33-d7d6daf05b4f@embed.me.uk>
In-Reply-To: <6e070a3d-a5f3-46bf-ac33-d7d6daf05b4f@embed.me.uk>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 28 Aug 2020 16:55:39 -0400
Message-ID: <CADkTA4Ob=JpTsenFdNcKzB_5-8xQ+OGm_eQK_QPOPWeizz89QA@mail.gmail.com>
Subject: Re: Linux v5.8 modules, exec format error
To: Jack Mitchell <ml@embed.me.uk>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 28, 2020 at 4:20 PM Jack Mitchell <ml@embed.me.uk> wrote:
>
> Having just upgraded my mainline kernel recipe to a v5.8/v5.9-rc2 kernel
> from v5.5.8 I've found that modules have somehow broken. I've flicked
> between the two and confirmed that the old kernel build works, and the
> 5.8/5.9 build doesn't. I haven't changed anything bar the git commit
> hash. It's a very simple kernel recipe basically just inheriting the
> kernel bbclass and setting SRCREV. Running on current tip of master.
>
> I assume it's something symver related but wanted to ask if anybody
> knows anything before I dig too deep.

I can say that it is working for me on 5.8 and 5.9-rcX on the reference kernels.

qemux86-64 login: root
root@qemux86-64:~# uname -a
Linux qemux86-64 5.8.4-yocto-standard #1 SMP PREEMPT Wed Aug 26
16:07:56 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
root@qemux86-64:~# lsmod
Module                  Size  Used by
parport_pc             24576
parport                28672  1 parport_pc
ata_piix               36864  0
floppy                 77824  0
sch_fq_codel           20480  1

my 5.9-rc is rebuilding right now, so I can double check it over the weekend.

Not super useful, but there shouldn't be anything fundamentally
broken, since we've been following along with the latest as usual.

Is your g_ether built in-tree, or out of tree ?

Bruce


>
> Cheers,
> Jack.
>
> root@rk3399:~# uname  -a
> Linux rk3399 5.9.0-rc2 #1 SMP PREEMPT Fri Aug 28 18:47:44 UTC 2020
> aarch64 GNU/Linux
>
> root@rk3399:~# modprobe g_ether
> modprobe: ERROR: could not insert 'g_ether': Exec format error
>
> root@rk3399:~# modinfo
> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
> filename:
> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
> license:        GPL
> author:         David Brownell, Benedikt Spanger
> description:    RNDIS/Ethernet Gadget
> depends:        libcomposite,u_ether,usb_f_rndis
> intree:         Y
> name:           g_ether
> vermagic:       5.9.0-rc2 SMP preempt mod_unload aarch64
> parm:           idVendor:USB Vendor ID (ushort)
> parm:           idProduct:USB Product ID (ushort)
> parm:           bcdDevice:USB Device version (BCD) (ushort)
> parm:           iSerialNumber:SerialNumber string (charp)
> parm:           iManufacturer:USB Manufacturer string (charp)
> parm:           iProduct:USB Product string (charp)
> parm:           qmult:queue length multiplier at high/super speed (uint)
> parm:           dev_addr:Device Ethernet Address (charp)
> parm:           host_addr:Host Ethernet Address (charp)
> parm:           use_eem:use CDC EEM mode (bool)
>
> [jack@arch-corsair ~]$ file g_ether.ko
> g_ether.ko: ELF 64-bit LSB relocatable, ARM aarch64, version 1 (SYSV),
> BuildID[sha1]=375c0485cb8c4b013dc0694725457bd111899f8c, not stripped
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
