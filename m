Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.11219.1620232749218701130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 09:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TIfGM4Cg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so1501892wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=xlhDauOI+GZcCc9Q3EuIlandZ2ZaeijUQhvWZFumY64=;
        b=TIfGM4Cg7mjILdF+TJsWCoggRr5SLY9aTddAKJw73176R76yEeWCKxRul+DSt0hi7c
         ORU+vVhraSJiQ0//JV7iwztABk/feUexVY1po/Wgg1XYlZbm8gaNzbidSZzpnSyfjCON
         vkE5BW0d4OjAqLBJYlr2uhAfeoXuTY1uPOozE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=xlhDauOI+GZcCc9Q3EuIlandZ2ZaeijUQhvWZFumY64=;
        b=e/niufidl+fuULk4hdCQd7IWm5jXLBR2e75F7SgBIeJjza7GOj6+PZYgqR42FR5hSC
         JUWwvPvUDpmzNAaAsCA0Quc1ZW+BW3jcjzwIl55wmU+KSRqn8IRHlJcRCyoe+q1JAJhl
         bRqg3Li0IZ2ZHMvMA7wgXkGejyoS44u4KrtVXNnvD2S6OQN1fR/NBcwUXBW6W7nYyy7w
         78hC1xtOJi3fs3ngZ9NYtMjNyixkFgerCl+a8BfoLEMQru/Su6IgBJTZOaBsnYRzQh4C
         clv+OHwarCk2g98VSQYZqtL6qCDTdzkwmwy2qTtpSavpgtr9RgV12pjh9ig3KPRyv9L7
         5FLA==
X-Gm-Message-State: AOAM532h/aL5DGFLp9Doh5VHWWMI7YzWSqrI4OUhdYXqanfLe07mtJgr
	N9JPZANsmFpfZDPmui9L7UenPQ==
X-Google-Smtp-Source: ABdhPJy4JfMcElM6mlw8V4pf547LtOe7PoeU3GsVUFCsb/1AgUhuPiodsZqVDoxw0J9OBai0Bj8A+Q==
X-Received: by 2002:a1c:1b43:: with SMTP id b64mr10826960wmb.178.1620232747720;
        Wed, 05 May 2021 09:39:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8041:e424:9226:62e7? ([2001:8b0:aba:5f3c:8041:e424:9226:62e7])
        by smtp.gmail.com with ESMTPSA id z66sm7027662wmc.4.2021.05.05.09.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 09:39:07 -0700 (PDT)
Message-ID: <cf25df93316d68f215c03609788d940eef4bbf9b.camel@linuxfoundation.org>
Subject: qemuppc shutdown issues - disable serial console for it?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 05 May 2021 17:39:06 +0100
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We've been seeing a lot of the qemuppc shutdown issue and I decided to look 
into it. The really worrying thing looking at the logs locally is the serial
ports are showing irq issues and becoming disabled as nobody would handle them.
Errors like:

[    9.194886] irq 36: nobody cared (try booting with the "irqpoll" option)
[    9.198712] CPU: 0 PID: 127 Comm: bootlogd Not tainted 5.10.30-yocto-standard #1
[    9.202283] Call Trace:
[    9.205611] [d1005f00] [c00a0da8] __report_bad_irq+0x50/0x138 (unreliable)
[    9.209347] [d1005f30] [c00a0cc0] note_interrupt+0x324/0x378
[    9.212855] [d1005f70] [c009d138] handle_irq_event+0xe8/0x104
[    9.216353] [d1005fa0] [c00a1d9c] handle_fasteoi_irq+0xc0/0x29c
[    9.219960] [d1005fc0] [c009b798] generic_handle_irq+0x40/0x5c
[    9.223496] [d1005fd0] [c00075d0] __do_irq+0x58/0x188
[    9.226948] [d1005ff0] [c0010040] call_do_irq+0x20/0x38
[    9.230391] [d29eda60] [c0007788] do_IRQ+0x88/0xfc
[    9.233860] [d29eda90] [c0016454] ret_from_except+0x0/0x14
[    9.237288] --- interrupt: 501 at __setup_irq+0x3c4/0x838
[    9.237288]     LR = __setup_irq+0x790/0x838
[    9.244155] [d29edb88] [c009f0a4] request_threaded_irq+0x114/0x1c8
[    9.247672] [d29edbb8] [c07a5a18] pmz_startup+0x17c/0x32c
[    9.251203] [d29edbd8] [c07a1140] uart_port_startup+0x184/0x2f8
[    9.254651] [d29edc08] [c07a1974] uart_port_activate+0x78/0xf4
[    9.258141] [d29edc28] [c07839f8] tty_port_open+0xd4/0x170
[    9.261579] [d29edc58] [c079db74] uart_open+0x2c/0x48
[    9.265116] [d29edc68] [c077a288] tty_open+0x168/0x640
[    9.268574] [d29edcd8] [c0280be8] chrdev_open+0x138/0x2a4
[    9.272123] [d29edd18] [c027421c] do_dentry_open+0x228/0x410
[    9.275643] [d29edd48] [c028e9f4] path_openat+0xb04/0xf28
[    9.279184] [d29eddd8] [c02917e4] do_filp_open+0x120/0x164
[    9.282535] [d29ede98] [c0276238] do_sys_openat2+0xd8/0x19c
[    9.285790] [d29edee8] [c0276574] sys_openat+0x88/0xdc
[    9.289096] [d29edf38] [c00160d8] ret_from_syscall+0x0/0x34
[    9.292620] --- interrupt: c01 at 0xfec3738
[    9.292620]     LR = 0xfec36e0
[    9.299035] handlers:
[    9.302312] [<7f7f7da8>] pmz_interrupt
[    9.305541] Disabling IRQ #36

(and the irqpoll option does not help)

This is problematic as the shutdown test uses the serial interface to shut down
the system. If the serial interface fails to login or run the command, game over
for the test.

Looking at the defconfig, the serial stuff is handled through CONFIG_SERIAL_PMACZILOG
and the pmac_zliog.c driver. There is an interesting section of code in there for
CONFIG_SERIAL_PMACZILOG_CONSOLE which had me asking "really?" about what it does
with interrupts.

Chucking:

# CONFIG_SERIAL_PMACZILOG_CONSOLE is not set

into a .cfg for the kernel meant the above traces went away. Whether than was due to
the console logging changing or it really fixed some kind of race, hard to say.

My instinct says we should disable the above and test for a bit, see if
the shutdown issues don't happen so much.

Bruce: Any thoughts on that?

I suspect there is also some qmp related serial console race as ever since
we added the qmp code, the shutdown timeout issues spread to other arches.

Cheers,

Richard


