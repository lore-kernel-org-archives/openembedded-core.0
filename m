Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.29142.1620637115529540501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 01:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aopeM42a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o26-20020a1c4d1a0000b0290146e1feccdaso9287536wmh.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rm0J2FFm65kpDc7PUaySV5FRowihsHX3+G4Pv8y0jn8=;
        b=aopeM42aEatdMSUEXaVMkg/8cd12oUEtxtQUlTdlrrSrvcvSXDdThugi0rp3oYKiK+
         cz7PFDsGwZA8i1c9sqRREk/fdVHJEGae6Cn6y0b0+vHyz2ghopfByM5uerHDnJ5lY6Ov
         cgKsOG0D0CFdy3lSBCRtpDy40ANVztialA+tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rm0J2FFm65kpDc7PUaySV5FRowihsHX3+G4Pv8y0jn8=;
        b=nAgiH9eGejGbfaB/qcNMLDtLlHZMnTc+asjU3Ysx7h22hQdmA9PfRDYiZItIPJauLz
         VQh3f6pYxu1gq+ndXz2OAmO4T9whHMZWOgzpjLQ5Kk89XuoaoGJ+Y/zHRPoosasjqAR6
         d7PRyo+8sYrdZYNtglE69pOIQJqBK0cX+THYCcDE3uVaHXr9vmXv+TZOi8UXTSTNniSj
         FB1K7wajk4XXPd+UFhVEfzqTK6koBnaftBhXScjmJkdjgbZxib91CtQ+sLxpL8wzfEUd
         N6zQjLOvmTQz61PZQnpeLhIygE2UgSBMDkJgEezNu9Zb5iHMnn59Q1+5TVJJtWoVIBqZ
         foQQ==
X-Gm-Message-State: AOAM532I9SzxWny6RD08k0ctXeUZPbdDqF8Ma7RjsoEeN8DPplBc51BO
	/a+y+lMFbSB7ueoiWa8P76IWlg==
X-Google-Smtp-Source: ABdhPJwhIaFtcMUojQpPyIEFDje1LcuIiCrmVIYpfracMwBKX/ZA2VvuIqsTa2wSe3bQs/sKcN/DSQ==
X-Received: by 2002:a1c:228a:: with SMTP id i132mr24932931wmi.10.1620637114017;
        Mon, 10 May 2021 01:58:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6? ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id v18sm24902893wro.18.2021.05.10.01.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 01:58:33 -0700 (PDT)
Message-ID: <9cb678fc949468493cb03213033be55d6d1823bb.camel@linuxfoundation.org>
Subject: Re: qemuppc shutdown issues - disable serial console for it?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 10 May 2021 09:58:33 +0100
In-Reply-To: <CADkTA4MEN++n6L9pBaVvZUj9xGeb6WxpUkc5N46NHxSiVxQWbw@mail.gmail.com>
References: 
	  <76b039d2d1fd45b24b1621172a5ebdbeaa753729.camel@linuxfoundation.org>
	 <CADkTA4MEN++n6L9pBaVvZUj9xGeb6WxpUkc5N46NHxSiVxQWbw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-05 at 13:59 -0400, Bruce Ashfield wrote:
> On Wed, May 5, 2021 at 12:36 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > We've been seeing a lot of the qemuppc shutdown issue and I decided to look
> > into it. The really worrying thing looking at the logs locally is the serial
> > ports are showing irq issues and becoming disabled as nobody would handle them.
> > Errors like:
> > 
> > [    9.194886] irq 36: nobody cared (try booting with the "irqpoll" option)
> > [    9.198712] CPU: 0 PID: 127 Comm: bootlogd Not tainted 5.10.30-yocto-standard #1
> > [    9.202283] Call Trace:
> > [    9.205611] [d1005f00] [c00a0da8] __report_bad_irq+0x50/0x138 (unreliable)
> > [    9.209347] [d1005f30] [c00a0cc0] note_interrupt+0x324/0x378
> > [    9.212855] [d1005f70] [c009d138] handle_irq_event+0xe8/0x104
> > [    9.216353] [d1005fa0] [c00a1d9c] handle_fasteoi_irq+0xc0/0x29c
> > [    9.219960] [d1005fc0] [c009b798] generic_handle_irq+0x40/0x5c
> > [    9.223496] [d1005fd0] [c00075d0] __do_irq+0x58/0x188
> > [    9.226948] [d1005ff0] [c0010040] call_do_irq+0x20/0x38
> > [    9.230391] [d29eda60] [c0007788] do_IRQ+0x88/0xfc
> > [    9.233860] [d29eda90] [c0016454] ret_from_except+0x0/0x14
> > [    9.237288] --- interrupt: 501 at __setup_irq+0x3c4/0x838
> > [    9.237288]     LR = __setup_irq+0x790/0x838
> > [    9.244155] [d29edb88] [c009f0a4] request_threaded_irq+0x114/0x1c8
> > [    9.247672] [d29edbb8] [c07a5a18] pmz_startup+0x17c/0x32c
> > [    9.251203] [d29edbd8] [c07a1140] uart_port_startup+0x184/0x2f8
> > [    9.254651] [d29edc08] [c07a1974] uart_port_activate+0x78/0xf4
> > [    9.258141] [d29edc28] [c07839f8] tty_port_open+0xd4/0x170
> > [    9.261579] [d29edc58] [c079db74] uart_open+0x2c/0x48
> > [    9.265116] [d29edc68] [c077a288] tty_open+0x168/0x640
> > [    9.268574] [d29edcd8] [c0280be8] chrdev_open+0x138/0x2a4
> > [    9.272123] [d29edd18] [c027421c] do_dentry_open+0x228/0x410
> > [    9.275643] [d29edd48] [c028e9f4] path_openat+0xb04/0xf28
> > [    9.279184] [d29eddd8] [c02917e4] do_filp_open+0x120/0x164
> > [    9.282535] [d29ede98] [c0276238] do_sys_openat2+0xd8/0x19c
> > [    9.285790] [d29edee8] [c0276574] sys_openat+0x88/0xdc
> > [    9.289096] [d29edf38] [c00160d8] ret_from_syscall+0x0/0x34
> > [    9.292620] --- interrupt: c01 at 0xfec3738
> > [    9.292620]     LR = 0xfec36e0
> > [    9.299035] handlers:
> > [    9.302312] [<7f7f7da8>] pmz_interrupt
> > [    9.305541] Disabling IRQ #36
> > 
> > (and the irqpoll option does not help)
> > 
> > This is problematic as the shutdown test uses the serial interface to shut down
> > the system. If the serial interface fails to login or run the command, game over
> > for the test.
> > 
> > Looking at the defconfig, the serial stuff is handled through CONFIG_SERIAL_PMACZILOG
> > and the pmac_zliog.c driver. There is an interesting section of code in there for
> > CONFIG_SERIAL_PMACZILOG_CONSOLE which had me asking "really?" about what it does
> > with interrupts.
> > 
> > Chucking:
> > 
> > # CONFIG_SERIAL_PMACZILOG_CONSOLE is not set
> > 
> > into a .cfg for the kernel meant the above traces went away. Whether than was due to
> > the console logging changing or it really fixed some kind of race, hard to say.
> > 
> > My instinct says we should disable the above and test for a bit, see if
> > the shutdown issues don't happen so much.
> > 
> > Bruce: Any thoughts on that?
> > 
> 
> It all looks reasonable to me. I rolled the change into the BSP and
> just sent the SRCREV bump.

Unfortunately, whilst this does help, presumably by removing a number of writes from
the serial port which helps, we've still a issue here.

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/3392

In this case it "only" threw a warning about being unable to login to the 
serial port. Looking at dmesg from that run, I see:

[    0.000000] Linux version 5.10.34-yocto-standard (oe-user@oe-host) (powerpc-poky-linux-gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1.20210209) #1 PREEMPT Mon May 3 02:17:32 UTC 2021
[...]
[   16.845298] ext4 filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)
[   24.895128] irq 37: nobody cared (try booting with the "irqpoll" option)
[   24.895349] CPU: 0 PID: 495 Comm: getty Not tainted 5.10.34-yocto-standard #1
[   24.895592] Call Trace:
[   24.895718] [e1005f10] [c00a1180] __report_bad_irq+0x50/0x138 (unreliable)
[   24.895899] [e1005f40] [c00a1098] note_interrupt+0x310/0x364
[   24.895979] [e1005f70] [c009d530] handle_irq_event+0xe8/0x104
[   24.896017] [e1005fa0] [c00a2174] handle_fasteoi_irq+0xc0/0x29c
[   24.896051] [e1005fc0] [c009bafc] generic_handle_irq+0x40/0x5c
[   24.896088] [e1005fd0] [c00075cc] __do_irq+0x58/0x188
[   24.896121] [e1005ff0] [c0010178] call_do_irq+0x20/0x38
[   24.896152] [e10d1cb0] [c0007784] do_IRQ+0x88/0xfc
[   24.896186] [e10d1ce0] [c0016454] ret_from_except+0x0/0x14
[   24.896242] --- interrupt: 501 at uart_write+0x124/0x2c0
[   24.896242]     LR = uart_write+0x120/0x2c0
[   24.896278] [e10d1dd8] [c077d5b4] n_tty_write+0x16c/0x57c
[   24.896313] [e10d1e48] [c0779b80] file_tty_write.constprop.0+0x16c/0x2fc
[   24.896352] [e10d1e88] [c02785d0] vfs_write+0x344/0x47c
[   24.896383] [e10d1f08] [c027a790] ksys_write+0x84/0x134
[   24.896413] [e10d1f38] [c00160d8] ret_from_syscall+0x0/0x34
[   24.896700] --- interrupt: c01 at 0xfeb5798
[   24.896700]     LR = 0xfeb576c
[   24.896769] handlers:
[   24.897019] [<b0507389>] pmz_interrupt
[   24.897109] Disabling IRQ #37

which is the serial interrupt having issues. pmz_interrupt is the 
ppc zilog serial driver.

I think either the kernel or qemu's serial support on ppc is broken :(

Cheers,

Richard




